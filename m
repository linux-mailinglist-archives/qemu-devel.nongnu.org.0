Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA068AE784
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 12:03:24 +0200 (CEST)
Received: from localhost ([::1]:37194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7czc-0005XO-0R
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 06:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51660)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1i7cwf-0003v2-N7
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 06:00:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1i7cwa-0004Hr-BM
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 06:00:21 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:43558)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1i7cwa-0004Ha-64
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 06:00:16 -0400
Received: by mail-ot1-x341.google.com with SMTP id b2so17572533otq.10
 for <qemu-devel@nongnu.org>; Tue, 10 Sep 2019 03:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=B2vUgFL+PBKxcYfupd3lUlGVVA6OPP2KnpD66Q48rsI=;
 b=t+k7q5oegnRmjlnVOPWtgfflGnHTHqV20m803eZve8myN4Y5SSAMbDurpBu3YXYw1p
 ser7yOBFVfMXArO0MdOzuLrPkPp64ls70ejJL6My+/c9uhC9CyCHXvabFcOKlm7b3glF
 cPamdHG7Ye9JVrNkG9dpXp250W4U2QtknGIx0IMF4Y2CAi+vrGOjv3aDhesmalh5NeGQ
 +wq7LT5iBinCNI9ytrn13F6SK2t7InXg5cUo2TtYiThDjJ7GQsbstf7IJVkQOB/h++0f
 6QVRBWrWXwL7krRZuIi5HEpxSbVRDmDv8cEN9AEm8XwQ22+CZHYmWK4r5QVjjARSB1i8
 yHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=B2vUgFL+PBKxcYfupd3lUlGVVA6OPP2KnpD66Q48rsI=;
 b=oaUDVBPVgXhyZXm+wUeoDMEEJmJK/ZtaMqLX6QTsmn/OD2tQl+Cs1PU8/SZBDaHnhc
 jOwlYyJ1LV8d1xpURCNxS/revQ4wNPGnLL70eutJj8enY5IZGb661lZ0Ewb/b4l5m0PT
 cjT7wvvaycegQF+0SyyQ2uEBDXjvaBf2rHxCXbU10+Sn0BaQRqUU3KpB8jH6ttJ3Vxq0
 aW9S55lHs/O9g+cBX+cVOGMWQNaN0/miHFCAfVMG7vUcr6gLBxyJo1wi1UWVfVEEGSF8
 YS/uBDLmmdEWP60ks74AlnwDDvBNcisZf9CvamowpPtza7E8VXNUMPsI8OGcBQ4LJCI4
 BzNw==
X-Gm-Message-State: APjAAAWRMptkmwfKLpkRdxpbFWSpxtS/9FK0wMbMgoS6hh0aWP5SYY3S
 XCWgLshzn4jzWNNiNRL81wPUWEiT1XS4sk4DWtQ=
X-Google-Smtp-Source: APXvYqwIotWTfgK4P0VB4WZ8hz8mvKcgOEzZiezFjBC1ICZW+ljzkzFSyDe1vIE7oRlkbFuiWLDMSybV9jrTy6iYO3A=
X-Received: by 2002:a9d:5f09:: with SMTP id f9mr12041633oti.341.1568109615281; 
 Tue, 10 Sep 2019 03:00:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Tue, 10 Sep 2019 03:00:14
 -0700 (PDT)
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Tue, 10 Sep 2019 03:00:14
 -0700 (PDT)
In-Reply-To: <08c834fe-2b04-9ca3-56b0-4774d5bca739@vivier.eu>
References: <1567601968-26946-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1567601968-26946-4-git-send-email-aleksandar.markovic@rt-rk.com>
 <08c834fe-2b04-9ca3-56b0-4774d5bca739@vivier.eu>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Tue, 10 Sep 2019 12:00:14 +0200
Message-ID: <CAL1e-=ikDhqP_qPggeCtXBw8WXkrh8MphyDVJd4TvD5LHSbE7g@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH v6 3/8] linux-user: Add support for
 FIOGETOWN and FIOSETOWN ioctls
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
Cc: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, riku.voipio@iki.fi,
 qemu-devel@nongnu.org, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

10.09.2019. 10.35, "Laurent Vivier" <laurent@vivier.eu> =D1=98=D0=B5 =D0=BD=
=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> Le 04/09/2019 =C3=A0 14:59, Aleksandar Markovic a =C3=A9crit :
> > From: Aleksandar Markovic <amarkovic@wavecomp.com>
> >
> > FIOGETOWN and FIOSETOWN ioctls have platform-specific definitions,
> > hence non-standard definition in QEMU too.
> >
> > Other than that, they both have a single integer argument, and their
> > functionality is emulated in a straightforward way.
> >
> > Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> > ---
> >  linux-user/ioctls.h       | 2 ++
> >  linux-user/syscall_defs.h | 4 ++++
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
> > index cd9b6f9..1830de9 100644
> > --- a/linux-user/ioctls.h
> > +++ b/linux-user/ioctls.h
> > @@ -177,6 +177,8 @@
> >  #endif
> >  #endif /* CONFIG_USBFS */
> >
> > +  IOCTL(FIOGETOWN, IOC_R, MK_PTR(TYPE_INT))
> > +  IOCTL(FIOSETOWN, IOC_W, MK_PTR(TYPE_INT))
> >    IOCTL(SIOCATMARK, IOC_R, MK_PTR(TYPE_INT))
> >    IOCTL(SIOCGIFNAME, IOC_RW, MK_PTR(MK_STRUCT(STRUCT_int_ifreq)))
> >    IOCTL(SIOCGIFFLAGS, IOC_W | IOC_R,
MK_PTR(MK_STRUCT(STRUCT_short_ifreq)))
> > diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> > index 19a1d39..498223b 100644
> > --- a/linux-user/syscall_defs.h
> > +++ b/linux-user/syscall_defs.h
> > @@ -758,10 +758,14 @@ struct target_pollfd {
> >
> >  #if defined(TARGET_ALPHA) || defined(TARGET_MIPS) ||
defined(TARGET_SH4) ||    \
> >         defined(TARGET_XTENSA)
> > +#define TARGET_FIOGETOWN       TARGET_IOR('f', 123, int)
> > +#define TARGET_FIOSETOWN       TARGET_IOW('f', 124, int)
> >  #define TARGET_SIOCATMARK      TARGET_IOR('s', 7, int)
> >  #define TARGET_SIOCSPGRP       TARGET_IOW('s', 8, pid_t)
> >  #define TARGET_SIOCGPGRP       TARGET_IOR('s', 9, pid_t)
> >  #else
> > +#define TARGET_FIOGETOWN       0x8903
> > +#define TARGET_FIOSETOWN       0x8901
> >  #define TARGET_SIOCATMARK      0x8905
> >  #define TARGET_SIOCSPGRP       0x8902
> >  #define TARGET_SIOCGPGRP       0x8904
> >
>
> Applied to my linux-user branch.
>

Thank you!

This (and other instances of your applying individual patches to your
branch) will clean up my pending linux user series significantly, and make
further work clearer and easier.

Aleksandar

> Thanks,
> Laurent
>
