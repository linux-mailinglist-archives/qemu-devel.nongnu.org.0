Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C15913154E4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 18:21:00 +0100 (CET)
Received: from localhost ([::1]:56042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Wh9-00029B-Hy
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 12:20:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1l9Wdd-0008C5-96
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:17:21 -0500
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30]:35375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1l9WdZ-0001vF-Qc
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:17:21 -0500
Received: by mail-oo1-xc30.google.com with SMTP id t196so2277373oot.2
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 09:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gyc4TLkLZIHExdldqqsNNKIHGz/Vbrb9dsLXff8qojk=;
 b=SS1oEzZXW9W4oj4vluhcvUx9L3t32+0pIaIjCl8lUTiRKvXaQ6S82X9F4ifCqCqUBN
 6ZH/BJ30ioY7x/0l6HnrfzeJrG1uQy/+tcHRGTW5IGt+wO45GPSFc37RaO68FrR9WXxV
 4esdNNs/LlqgdxGBjB7Y7ZZ26f0exCDrLOef75QWzxTQrknh16Q3axhDKgG2kEsSD4fO
 6pcSqvEyWctHAYUAuMGQmRtlAVL3aSaUujBOMxiqwGueXrB0MiN21UfT7Rv7Tx3lzU+k
 TzyTSAxkCXDbyDrTfSZ6W5lq7G7anEOg1ZgAB+TZyBoAzm4hIf+YwPJ4OWx/FW3Ou4Zw
 D4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gyc4TLkLZIHExdldqqsNNKIHGz/Vbrb9dsLXff8qojk=;
 b=bHQO1cqCsbArHBnt23q9FT5htcsNL22A5Zfit/AYxYoWUEhrS4cCa2S4RWSwPzmjkp
 BHgSMZWJfSTSAKrCl51ipbZruXIrknKxCIl3BeX7kCaFl2QaMFuaSYGo44/WsguTvEeA
 FGL6dCeIAJb5XULbG0shbucKEPgVHRry7jstCe8YFTfZPw3e4BUOZU1W/9di5QSS4y/9
 nzfGugIoFF0zgHuWQody2O6Lte/JzQVTm+mW0iYaoPT3s1DfRul+dCIl808/FmUGR4uO
 Oj8DXdzhQPVl0tNPEDTijxssQilyv8vRGeGHONBw0vVeX/Kr7ZRDA3EHQ8l7cvTj+VmX
 coxw==
X-Gm-Message-State: AOAM530XgClILzjlDWQKD7CFr02ToV0fu2k0GQ7R+pDfkccRnPDWptNL
 zeY7b8qM1BGmLmrZ6piSaQ6aSQSdAzTlOq1Kfuc=
X-Google-Smtp-Source: ABdhPJxwvGdXud1Tx3sTEuJRKQJUlgwpqxodBKqWxRCHkikqP5x9Z5P2+9nQgCOfQh4MkDQvuO+GT17E5gODy2RAGM0=
X-Received: by 2002:a05:6820:165:: with SMTP id
 k5mr16499560ood.73.1612891036014; 
 Tue, 09 Feb 2021 09:17:16 -0800 (PST)
MIME-Version: 1.0
References: <CABLmASF7YP3qfcuhAQsm8J28e8omZstBf7E5Eir=8MyqnvPLRQ@mail.gmail.com>
 <20210209151221.dxiiydxgxsqu3gmu@sirius.home.kraxel.org>
In-Reply-To: <20210209151221.dxiiydxgxsqu3gmu@sirius.home.kraxel.org>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Tue, 9 Feb 2021 18:17:04 +0100
Message-ID: <CABLmASEG3FiJ--7bQzZVJ1DtdFJSZ=a41yAf1QgEBf8BoGZk_w@mail.gmail.com>
Subject: Re: USB pass through into Mac OS 9.x with qemu-system-ppc
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000435dd505baea758d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=hsp.cat7@gmail.com; helo=mail-oo1-xc30.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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

--000000000000435dd505baea758d
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 9, 2021 at 4:12 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>
> > A noticeable issue when comparing the pcap files seems to be at Fedora
> pcap
> > frame 8 and Mac OS 9.2 pcap frame 28 (configuration descriptor). It seems
> > the Mac OS side is missing 5 bytes and hence the packet is malformed.
> > (A run with Mac OS 9.0 as guest showed that this guest only missed 1 byte
> > in the response.)
>
> That is normal.  Note that the configuration descriptor is requested
> twice:  Once with a buffer large enough to see the wTotalLength field.
> and then again with a buffer large enough for the whole descriptor.
>
> > Also visible in the Mac OS pcap file at frame 53 is that it seems a setup
> > package is contained in an URB that is not suited for it.
>
> Looks more like a bug in the qemu pcap code, probably have to set some
> flag to indicate the setup section doesn't contain valid data instead
> of just leaving it all blank.
>
> Frame 55 is probably the problematic one.  Look at the timestamps.  The
> device seems to not answer, then after a while macos seems to try reset
> the device.
>
> Also the fedora trace has the bulk transfer data so wireshark can decode
> usb-storage commands and the scsi command wrapped inside.  That is not
> the case in the macos trace.  Not sure whenever that is another bug in
> the pcap code.  It could also indicate the bug in the ohci emulation
> which in turn causes macos fail ...
>
> > Qemu-system-ppc is started like this for the Mac OS guest:
> > ./qemu-system-ppc \
> > -M mac99,via=pmu \
> > -m 512 \
> > -boot c \
> > -serial stdio \
> > -L pc-bios \
> > -drive file=/home/hsp/Mac-disks/9.2.img,format=raw,media=disk \
> > -device usb-host,vendorid=0x058f,productid=0x6387,pcap=macos92.pcap
>
> Does an emulated usb stick work with macos?
>
> Hi Gerd,

Thanks for getting back to me.
Yes, usb-storage works just fine with

-drive if=none,id=stick,file=/home/hsp/Mac-disks/9.0.img,format=raw \
-device usb-storage,drive=stick

Best,
Howard

--000000000000435dd505baea758d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 9, 2021 at 4:12 PM Gerd H=
offmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 Hi=
,<br>
<br>
&gt; A noticeable issue when comparing the pcap files seems to be at Fedora=
 pcap<br>
&gt; frame 8 and Mac OS 9.2 pcap frame 28 (configuration descriptor). It se=
ems<br>
&gt; the Mac OS side is missing 5 bytes and hence the packet is malformed.<=
br>
&gt; (A run with Mac OS 9.0 as guest showed that this guest only missed 1 b=
yte<br>
&gt; in the response.)<br>
<br>
That is normal.=C2=A0 Note that the configuration descriptor is requested<b=
r>
twice:=C2=A0 Once with a buffer large enough to see the wTotalLength field.=
<br>
and then again with a buffer large enough for the whole descriptor.<br>
<br>
&gt; Also visible in the Mac OS pcap file at frame 53 is that it seems a se=
tup<br>
&gt; package is contained in an URB that is not suited for it.<br>
<br>
Looks more like a bug in the qemu pcap code, probably have to set some<br>
flag to indicate the setup section doesn&#39;t contain valid data instead<b=
r>
of just leaving it all blank.<br>
<br>
Frame 55 is probably the problematic one.=C2=A0 Look at the timestamps.=C2=
=A0 The<br>
device seems to not answer, then after a while macos seems to try reset<br>
the device.<br>
<br>
Also the fedora trace has the bulk transfer data so wireshark can decode<br=
>
usb-storage commands and the scsi command wrapped inside.=C2=A0 That is not=
<br>
the case in the macos trace.=C2=A0 Not sure whenever that is another bug in=
<br>
the pcap code.=C2=A0 It could also indicate the bug in the ohci emulation<b=
r>
which in turn causes macos fail ...<br>
<br>
&gt; Qemu-system-ppc is started like this for the Mac OS guest:<br>
&gt; ./qemu-system-ppc \<br>
&gt; -M mac99,via=3Dpmu \<br>
&gt; -m 512 \<br>
&gt; -boot c \<br>
&gt; -serial stdio \<br>
&gt; -L pc-bios \<br>
&gt; -drive file=3D/home/hsp/Mac-disks/9.2.img,format=3Draw,media=3Ddisk \<=
br>
&gt; -device usb-host,vendorid=3D0x058f,productid=3D0x6387,pcap=3Dmacos92.p=
cap<br>
<br>
Does an emulated usb stick work with macos?<br>
<br></blockquote><div>Hi Gerd,</div><div><br></div><div>Thanks for getting =
back to me.</div><div>Yes, usb-storage works just fine with</div><div><br><=
/div><div>-drive if=3Dnone,id=3Dstick,file=3D/home/hsp/Mac-disks/9.0.img,fo=
rmat=3Draw \<br>-device usb-storage,drive=3Dstick</div><div><br></div><div>=
Best,</div><div>Howard<br></div></div></div>

--000000000000435dd505baea758d--

