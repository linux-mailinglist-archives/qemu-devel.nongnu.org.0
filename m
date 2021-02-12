Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7992319B82
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 09:55:02 +0100 (CET)
Received: from localhost ([::1]:52550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAUE9-0004Xm-Na
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 03:55:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lAUCk-0003eB-57
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 03:53:34 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:44772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lAUCe-0000Rk-0W
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 03:53:33 -0500
Received: by mail-ot1-x331.google.com with SMTP id e5so7720289otb.11
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 00:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kt7+GKQ2w5DhTj7ZexV8/p1gheAM+iiZhTR2iSWqPQs=;
 b=kFOmall7lEdhO/M92WTFuufDfEF0h/6gfjXbwCouYtGA/Lm1J8Ljm8O69XKtlrAYAl
 ITiQ3Y0F+6rtJB9pjaBH1OeHjANlK+k8qYQviZj0yfNxCxM7Zp5c0piLBrfOPcvtOe+T
 c3VoSs9bvQpAtg5IOJUnPCJXqhdCHUDk2rl+RS/AGuJaPqtguzUgdQyIpOKogfwa84td
 cGsGbUihogiOBr/jMzyLnGUrEscPDmV/G0asMj+/HCxoR5ER9AJBsU9FDGoKIu2VMPuC
 30gnTtaUDblu90bevIkR1SDBQvikaDIYzFSzG3nv5qrMY2cdcaTBXvEc3xKkVrEuwiaI
 f/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kt7+GKQ2w5DhTj7ZexV8/p1gheAM+iiZhTR2iSWqPQs=;
 b=ZqOo86lejNorrrqCMP/F9qGMBT44pU+qVXs6bn5DdJl9yN+xhqrx0lUoNBjqcfdAwq
 EwUUk8QpEimNqn9FQc/RcsLhrzemQdApIJcRZsFRWAE9srxiuvOAApj0878nvkpnFlmC
 iF/wkFKZLhDZXUEA8glW+ZJ+U4eLqYJ8Vp4iaqdNcF7I2b2iGIK5kb858Y/Cq4DM6vSS
 P7shCydd2j0YbZaE07R4xEaFB9ZtFKQWC3MoTsK0VdhdLs1rA5edkigNbU7oobHVbSAK
 9pfBzvL0R1ixFUlDikW/b9OohtH1ArrrTIjko4iZPcBEfQ4nRKLzgzsDjtCWF/Byr+Wr
 inNg==
X-Gm-Message-State: AOAM532/4UTMQTUkedGIZSMV7vc2OdI2vfybC96nyhDVtzRt01KXiX51
 jywfx2Mcz3Ii9SZW+JibxcHUJ6R89EYXzvRIZMs=
X-Google-Smtp-Source: ABdhPJyM9bNuMbM66V/m2RA4WsPjYwZUp2Dw7Cra0ZeO+GEuZEMRXNZY/kkETPKnziErpHVjLP2m7b2KS4dGxwGRXF4=
X-Received: by 2002:a9d:648e:: with SMTP id g14mr1257871otl.173.1613120006334; 
 Fri, 12 Feb 2021 00:53:26 -0800 (PST)
MIME-Version: 1.0
References: <CABLmASF7YP3qfcuhAQsm8J28e8omZstBf7E5Eir=8MyqnvPLRQ@mail.gmail.com>
 <20210209151221.dxiiydxgxsqu3gmu@sirius.home.kraxel.org>
 <CABLmASEG3FiJ--7bQzZVJ1DtdFJSZ=a41yAf1QgEBf8BoGZk_w@mail.gmail.com>
In-Reply-To: <CABLmASEG3FiJ--7bQzZVJ1DtdFJSZ=a41yAf1QgEBf8BoGZk_w@mail.gmail.com>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Fri, 12 Feb 2021 09:53:14 +0100
Message-ID: <CABLmASGwcpbDe3Gaj5TV5zFmFEaDaeL1-M1AmvfehzD9U=_3iw@mail.gmail.com>
Subject: Re: USB pass through into Mac OS 9.x with qemu-system-ppc
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/mixed; boundary="000000000000f5f12d05bb1fc4e9"
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=hsp.cat7@gmail.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f5f12d05bb1fc4e9
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 9, 2021 at 6:17 PM Howard Spoelstra <hsp.cat7@gmail.com> wrote:
>
>
>
> On Tue, Feb 9, 2021 at 4:12 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>>
>>   Hi,
>>
>> > A noticeable issue when comparing the pcap files seems to be at Fedora pcap
>> > frame 8 and Mac OS 9.2 pcap frame 28 (configuration descriptor). It seems
>> > the Mac OS side is missing 5 bytes and hence the packet is malformed.
>> > (A run with Mac OS 9.0 as guest showed that this guest only missed 1 byte
>> > in the response.)
>>
>> That is normal.  Note that the configuration descriptor is requested
>> twice:  Once with a buffer large enough to see the wTotalLength field.
>> and then again with a buffer large enough for the whole descriptor.
>>
>> > Also visible in the Mac OS pcap file at frame 53 is that it seems a setup
>> > package is contained in an URB that is not suited for it.
>>
>> Looks more like a bug in the qemu pcap code, probably have to set some
>> flag to indicate the setup section doesn't contain valid data instead
>> of just leaving it all blank.
>>
>> Frame 55 is probably the problematic one.  Look at the timestamps.  The
>> device seems to not answer, then after a while macos seems to try reset
>> the device.
>>
>> Also the fedora trace has the bulk transfer data so wireshark can decode
>> usb-storage commands and the scsi command wrapped inside.  That is not
>> the case in the macos trace.  Not sure whenever that is another bug in
>> the pcap code.  It could also indicate the bug in the ohci emulation
>> which in turn causes macos fail ...
>>
>> > Qemu-system-ppc is started like this for the Mac OS guest:
>> > ./qemu-system-ppc \
>> > -M mac99,via=pmu \
>> > -m 512 \
>> > -boot c \
>> > -serial stdio \
>> > -L pc-bios \
>> > -drive file=/home/hsp/Mac-disks/9.2.img,format=raw,media=disk \
>> > -device usb-host,vendorid=0x058f,productid=0x6387,pcap=macos92.pcap
>>
>> Does an emulated usb stick work with macos?
>>
> Hi Gerd,
>
> Thanks for getting back to me.
> Yes, usb-storage works just fine with
>
> -drive if=none,id=stick,file=/home/hsp/Mac-disks/9.0.img,format=raw \
> -device usb-storage,drive=stick
>
> Best,
> Howard

Hi Gerd,

Please find another pcap file attached. This one stems from an attempt
to pass through a midi device when running qemu-system-ppc with Mac OS
9.2 in macOS host.
In case you'd like to run a MacOS 9.2 guest yourself, I've prepared a
zipped disk image to do just that:
https://surfdrive.surf.nl/files/index.php/s/jalNAWL3Fkehts4/download

Best,
Howard

--000000000000f5f12d05bb1fc4e9
Content-Type: application/octet-stream; name="usblog.pcap"
Content-Disposition: attachment; filename="usblog.pcap"
Content-Transfer-Encoding: base64
Content-ID: <f_kl21wxwv0>
X-Attachment-Id: f_kl21wxwv0

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
--000000000000f5f12d05bb1fc4e9--

