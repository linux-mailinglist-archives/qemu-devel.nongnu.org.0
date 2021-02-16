Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1670431CD18
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:43:53 +0100 (CET)
Received: from localhost ([::1]:41128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC2Vz-0002pK-Kk
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:43:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lC2V2-0002Ou-EA
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:42:52 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:39158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lC2Ut-0002sV-9X
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:42:50 -0500
Received: by mail-oi1-x233.google.com with SMTP id l19so11617169oih.6
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 07:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mr48Gnr1hgIza/VFVC2ikJHEuCPz0+4dGhuMeZd1ecY=;
 b=GEVR01pCHTWYH6OP+UzJj7Zxlv39uUD+pxG8h0nDHWwbnT4rtHS85XOYCwieQtvCBm
 hi3BkCFduYFBwiqJXL7talo4aEVcJ8pOldFEDpKAzt0rgM+dJXhyqautMpuvsOP9FGCV
 S8iMDGaLhNh3eCrcG3pA+BoxTlE2CS9rv35GzpjergRAERj1tQo/G0B7QjNnyKnVDg8V
 ynqWWOnkmGHc6zicn7olqw76fTO9MXNNvBwt0Yrm/VVaDrUvwWJr8oWPyptUIy1atFyT
 jg65GcNgPnyA88LL92fQg6M5oMEr6pbJfmROw61/C8GvyyPpU/BX5NsdEfixW7Gd2Emz
 l2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mr48Gnr1hgIza/VFVC2ikJHEuCPz0+4dGhuMeZd1ecY=;
 b=PBY7McXi1/eJHPsJhiF4jMoxxhc8Bj6st/pqekiKSwJV3iuOGEdexrdre4S8Ax8hd9
 C73HO4bTui5hUuFUbsyl0xzhX+N4T3bajyhX4uwLZKnN5i3cOgL17MbBY+ukEaGB5Ctc
 yX1V2HwALwvjMqlo+n+DfWWWpBcgL0yz7KzZuUn8jw/TILSankSF9lt0e+OaX8dPUVeh
 tCJ9F3OyGSFeV953s20VH6Y0bWFFMFAeS7sy/U/8La00sHASAkkaf2guehctH3iiIEA2
 Y0b3zo3yJlZiGLJtbKJBeY0Ju3/3kmbTrDO4zG0CmyTw0l3mpgg4+6d7Ke3hIL+vhvlr
 FFOQ==
X-Gm-Message-State: AOAM533McKT5QN2JFpCqo+DP8wKMa769G7yHs/Z54opyxMUoSDNqmZ0r
 dLLICIiqPflUc36Xyz1nY7QFKHadizB5nMd1maE=
X-Google-Smtp-Source: ABdhPJwjZLA49DJrXdUZJF0o8Jog0UB+9HFvx1Bg4cC4TqlYP2Do+ih22TRjeTAvvmjAVS4R9+WRRVGQVH/Ah4FOF3k=
X-Received: by 2002:a05:6808:186:: with SMTP id
 w6mr2926162oic.131.1613490155946; 
 Tue, 16 Feb 2021 07:42:35 -0800 (PST)
MIME-Version: 1.0
References: <CABLmASF7YP3qfcuhAQsm8J28e8omZstBf7E5Eir=8MyqnvPLRQ@mail.gmail.com>
 <20210209151221.dxiiydxgxsqu3gmu@sirius.home.kraxel.org>
 <CABLmASEG3FiJ--7bQzZVJ1DtdFJSZ=a41yAf1QgEBf8BoGZk_w@mail.gmail.com>
 <CABLmASGwcpbDe3Gaj5TV5zFmFEaDaeL1-M1AmvfehzD9U=_3iw@mail.gmail.com>
 <20210216144831.cqefndfuvlju2yli@sirius.home.kraxel.org>
In-Reply-To: <20210216144831.cqefndfuvlju2yli@sirius.home.kraxel.org>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Tue, 16 Feb 2021 16:42:24 +0100
Message-ID: <CABLmASF_r4E85yLQgEYSZWraBO4Uo70o28f6YZQ3-w0+wPW1XA@mail.gmail.com>
Subject: Re: USB pass through into Mac OS 9.x with qemu-system-ppc
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=hsp.cat7@gmail.com; helo=mail-oi1-x233.google.com
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

On Tue, Feb 16, 2021 at 3:48 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > Please find another pcap file attached. This one stems from an attempt
> > to pass through a midi device when running qemu-system-ppc with Mac OS
> > 9.2 in macOS host.
>
> Ah, yes, I remember now.  Problem is that the usb stick is plugged into
> a high-speed port (usb2) on the host but passed as full-speed device
> (usb1) to the guest.  That works in some cases, but is not guaranteed
> to work.  usb_host_speed_compat() tries to catch some of the
> incompatible cases.  The usb-storage incompatibility slips through
> because the incompatibility is specific to the mass storage protocol.
> Specifically the wMaxPacketSize is 64 for usb1 and 512 for usb2.
>
> Seems fedora deals better with the situation ...
>
> take care,
>   Gerd
>

Hi Gerd,

Thanks for looking into this. It looks to me that the usb storage
device nicely reports endpoints 1 and 2 when asked, but that the host
only ever communicates with endpoint 1.
Is that the issue you refer to, or might that be libusb related?

Can this also explain that other (non-mass-storage) devices cannot be
passed through successfully ?

Best,
Howard

