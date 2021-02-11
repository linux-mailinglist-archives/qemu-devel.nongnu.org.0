Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8DE319094
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 18:07:59 +0100 (CET)
Received: from localhost ([::1]:41594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAFRe-0003T2-7g
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 12:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAFMG-0006E8-20
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:02:24 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:36198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAFMB-0006Ah-6g
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:02:21 -0500
Received: by mail-pg1-x52b.google.com with SMTP id t26so4326372pgv.3
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 09:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YRhdgFDqcGaBCr4VlfT3ZSsN0x0YcW9CH8Oyvr3X304=;
 b=k+UbZQ/XVIkpa5DRxI5BYTNOT+nR25RwCV9HnTq8Hi5xFOUl/fgqm8eToI/XonUixd
 d2enK3+E752RVACOMLE+MYj1+v4XBP04GmKnJp4JVZwwU/ehMUMKJXmwVU4C7uLWb3rK
 KYHFWepeIIHDtLFc7SJA3uwK4jZsNayimIthixrGdB+eo7DTo+qgqVmVhxnys8XpStIY
 TcQuSR4iwtlIas50FyEg+y1obbneHe+YAqrG1Eym/jLiQyoYUCOeM4RSoU7JuBiDXtU/
 RY1ZjoIAmjcfvh6IZTE2SXDJwqs2JAoG+ZRMT6beaU3FQ/VGQwauAewDslSamPi1it1G
 ZH7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YRhdgFDqcGaBCr4VlfT3ZSsN0x0YcW9CH8Oyvr3X304=;
 b=tHHuMTaDAr9hJIYolLRyCX42LkacgfocPKOsHEwi6pK/Mbv47GUzcQ5sOUIx5YmMpC
 +Cj4DkkzbahrR5VDcgmPA6oRmFB1UIbwSNgkGFxmw8sImoxPxkpef0FcCCGaZApQUIpW
 Fa6Ra2Pv7NsAd2qJ4QDFGFarg6lN+60wP9xuzmAXL1zWqlTp7EjuV50aqce9QjzDS+jN
 BJuhehg/jGZOOmSU1oph0xgLKa7awLlhBQ1SNjYbgE4mMXnMrk0M81JSVmj00jrnZfRj
 s8oxSjSR7Sas6VNbSrY8ZeNYkZYnR0XCCHgFWtpvikle9/bPt8jFpsupvKABdDhYJobK
 dbbw==
X-Gm-Message-State: AOAM533RYa/YXoasu2MsNl+L9ucr9AIYDKOq4Ba8iCgh58SydC5EZJ72
 cQ6CYPXxYWcICDnkJXVT5D5ZQqaBJSrhwAID792q79BiRlY=
X-Google-Smtp-Source: ABdhPJwfUb8i/xXBZ7DF1+t+gb4zUNK0fcwp7OK+S3j0VD01MeHjJ+tm/5yl/Gj/jYe3yjsaHlO39zZ2gNmUQBgoNIA=
X-Received: by 2002:a63:c4a:: with SMTP id 10mr9066964pgm.397.1613062937167;
 Thu, 11 Feb 2021 09:02:17 -0800 (PST)
MIME-Version: 1.0
References: <20201122000131.18487-1-peter.maydell@linaro.org>
 <CAFEAcA8ZWZUwqstAcg3tw8fAr+SDVXr-puPby_VU9eh4zgBq2w@mail.gmail.com>
In-Reply-To: <CAFEAcA8ZWZUwqstAcg3tw8fAr+SDVXr-puPby_VU9eh4zgBq2w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Feb 2021 17:02:05 +0000
Message-ID: <CAFEAcA8TaDhkmm7uA_XCfs-LG2feRXP5uehH4JKFNSeqOcm4MQ@mail.gmail.com>
Subject: Re: [PATCH] docs/user: Remove outdated 'Quick Start' section
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent: Ping^2 ? Somebody on IRC just now was getting confused by this
ancient documentation and its references to nonexistent tarballs...

-- PMM

On Tue, 19 Jan 2021 at 13:58, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Ping? Laurent, what's your take on this docs patch?
>
> thanks
> -- PMM
>
> On Sun, 22 Nov 2020 at 00:01, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > The 'Quick Start' section of the userspace emulator documentation is
> > very old and outdated. In particular:
> >  - it suggests running x86-on-x86 emulation, which is the least
> >    interesting possible use case
> >  - it recommends that users download tarballs of guest binaries
> >    from the QEMU web page which we no longer provide there
> >
> > There's nothing salvageable here; delete it all.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > I'm open to suggestions that this is being too drastic;
> > the main aim here is to remove references to tar.gz files
> > that we haven't provided for years, as noted by
> >  https://bugs.launchpad.net/qemu/+bug/1884982
> > Ideally the whole of docs/user could use a lot of love...
> >
> >  docs/user/main.rst | 61 ----------------------------------------------
> >  1 file changed, 61 deletions(-)
> >
> > diff --git a/docs/user/main.rst b/docs/user/main.rst
> > index bd99b0fdbe9..49ccae3ecab 100644
> > --- a/docs/user/main.rst
> > +++ b/docs/user/main.rst
> > @@ -45,67 +45,6 @@ emulator.
> >  Linux User space emulator
> >  -------------------------
> >
> > -Quick Start
> > -~~~~~~~~~~~
> > -
> > -In order to launch a Linux process, QEMU needs the process executable
> > -itself and all the target (x86) dynamic libraries used by it.
> > -
> > --  On x86, you can just try to launch any process by using the native
> > -   libraries::
> > -
> > -      qemu-i386 -L / /bin/ls
> > -
> > -   ``-L /`` tells that the x86 dynamic linker must be searched with a
> > -   ``/`` prefix.
> > -
> > --  Since QEMU is also a linux process, you can launch QEMU with QEMU
> > -   (NOTE: you can only do that if you compiled QEMU from the sources)::
> > -
> > -      qemu-i386 -L / qemu-i386 -L / /bin/ls
> > -
> > --  On non x86 CPUs, you need first to download at least an x86 glibc
> > -   (``qemu-runtime-i386-XXX-.tar.gz`` on the QEMU web page). Ensure that
> > -   ``LD_LIBRARY_PATH`` is not set::
> > -
> > -      unset LD_LIBRARY_PATH
> > -
> > -   Then you can launch the precompiled ``ls`` x86 executable::
> > -
> > -      qemu-i386 tests/i386/ls
> > -
> > -   You can look at ``scripts/qemu-binfmt-conf.sh`` so that QEMU is
> > -   automatically launched by the Linux kernel when you try to launch x86
> > -   executables. It requires the ``binfmt_misc`` module in the Linux
> > -   kernel.
> > -
> > --  The x86 version of QEMU is also included. You can try weird things
> > -   such as::
> > -
> > -      qemu-i386 /usr/local/qemu-i386/bin/qemu-i386 \
> > -                /usr/local/qemu-i386/bin/ls-i386
> > -
> > -Wine launch
> > -~~~~~~~~~~~
> > -
> > --  Ensure that you have a working QEMU with the x86 glibc distribution
> > -   (see previous section). In order to verify it, you must be able to
> > -   do::
> > -
> > -      qemu-i386 /usr/local/qemu-i386/bin/ls-i386
> > -
> > --  Download the binary x86 Wine install (``qemu-XXX-i386-wine.tar.gz``
> > -   on the QEMU web page).
> > -
> > --  Configure Wine on your account. Look at the provided script
> > -   ``/usr/local/qemu-i386/bin/wine-conf.sh``. Your previous
> > -   ``${HOME}/.wine`` directory is saved to ``${HOME}/.wine.org``.
> > -
> > --  Then you can try the example ``putty.exe``::
> > -
> > -      qemu-i386 /usr/local/qemu-i386/wine/bin/wine \
> > -                /usr/local/qemu-i386/wine/c/Program\ Files/putty.exe
> > -
> >  Command line options
> >  ~~~~~~~~~~~~~~~~~~~~
> >
> > --
> > 2.20.1

