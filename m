Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FA22E022D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 22:46:10 +0100 (CET)
Received: from localhost ([::1]:57630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krT0L-0000e8-G0
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 16:46:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1krSyv-0000Bs-Gj
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 16:44:41 -0500
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:40743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1krSyt-0001zY-Rz
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 16:44:41 -0500
Received: by mail-il1-x130.google.com with SMTP id g1so10225584ilk.7
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 13:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UkNvTpXSMb+uo7g0ecTVlt6ue5aHzCHPeUdW9ppa/HY=;
 b=WInGGA54zE6A31L42ypJZvQ0ZdzqEAhwpbYInsAqaoNqHiPhC1vykO+oNfxHkO79nW
 DbcOvK7DyiXEEuRatBKCgCk7a+inFy/6mOFdO4W/NJxo23QM+O7dzUe8M/9kQf7NR10B
 69pFR/QsWV6s71sasiAefYKSdyHoFd+FGZ2bT1UmmZqUGXrU4ur+BwtscECR9L7QOjXg
 wXhxo6Ey6mxSEMDPXnJIPnvLKyYtWJIDMleZv7ubZtnOj09cCRXq99Yymkd/qYPT/Ujk
 AiOiOS8lzXIyiLSWCQwaSjGHKKRY6lAt+ukOz+DbBC8SYorbKdnyOjXwmDhJklTMGG/d
 Mglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UkNvTpXSMb+uo7g0ecTVlt6ue5aHzCHPeUdW9ppa/HY=;
 b=pzEmULgeM4yyxb8K3i7tcyYX5VFEbsQeLJDHhOn/K//+Dma/MlGaTzRA9nJwxv5ZIL
 2RUOjipOpHHn90cqcRSGwFQK4Bb+yX3M3m8pPOvVyXaeTaiQyCIu76le/2ARB8BRAFUx
 t1VGwk9JgT1Sq0XVyTXazeMb1jQ+9lP3OR+WB7xkVFxtjKcU40gJLYGG36E2vqRIQ0+H
 7RavzIxKpPp4KVTL8HfAvxG8tCmLTanG4VQda7xVpVEZfbnsRV3mhIXgFwFuPsYnoyuA
 CmhTi5/U8Cw+ADkNrSIx6DDC7OYBP6hceKLIVkSDxTQjftwdVh6aksV6vPmqMQzSmScd
 8f6Q==
X-Gm-Message-State: AOAM533UEneyZ19lXK8Pgd1zBJz8j9rnG0MeuKHWUxDOMLt1YGv9SMkV
 cLJwUzvZsXZoP7ui6skQiPBbCfNHug7k2+5avQXgE3OfPt0=
X-Google-Smtp-Source: ABdhPJyK/56J+ajY7wE0C990LVojcdCHFfAop4tUf9B1kqLBMjEVYq5+50LtaZRGl+oL4s6BnEoWrEogyBS0SkJbr08=
X-Received: by 2002:a92:dc0f:: with SMTP id t15mr18158593iln.267.1608587078269; 
 Mon, 21 Dec 2020 13:44:38 -0800 (PST)
MIME-Version: 1.0
References: <160669515259.21126.12178770886175022752.malonedeb@gac.canonical.com>
 <160855733170.28187.8715477213337798297.malone@gac.canonical.com>
In-Reply-To: <160855733170.28187.8715477213337798297.malone@gac.canonical.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Dec 2020 13:44:11 -0800
Message-ID: <CAKmqyKM4UX85=Lq9PVfjLviUE6FC+V+d+dbjAXLz5M17-Ck2oA@mail.gmail.com>
Subject: Re: [Bug 1906193] Re: riscv32 user mode emulation: fork return values
 broken
To: Bug 1906193 <1906193@bugs.launchpad.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x130.google.com
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Great! Thanks for testing that.

Do you mind supplying a Tested-by tag that I can apply to the patch?

Alistair

On Mon, Dec 21, 2020 at 5:36 AM Andreas K. H=C3=BCttel
<1906193@bugs.launchpad.net> wrote:
>
> After applying this patch on top of qemu-5.2.0, I can confirm that it
> fixes the problem.
>
> Thank you!!
>
> --
> You received this bug notification because you are a member of qemu-
> devel-ml, which is subscribed to QEMU.
> https://bugs.launchpad.net/bugs/1906193
>
> Title:
>   riscv32 user mode emulation: fork return values broken
>
> Status in QEMU:
>   New
>
> Bug description:
>   When running in a chroot with riscv32 (on x86_64; qemu git master as
>   of today):
>
>   The following short program forks; the child immediately returns with
>   exit(42). The parent checks for the return value - and obtains 40!
>
>   gcc-10.2
>
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   #include <stdlib.h>
>   #include <unistd.h>
>   #include <stdio.h>
>   #include <sys/wait.h>
>
>   main(c, v)
>        int c;
>        char **v;
>   {
>     pid_t pid, p;
>     int s, i, n;
>
>     s =3D 0;
>     pid =3D fork();
>     if (pid =3D=3D 0)
>       exit(42);
>
>     /* wait for the process */
>     p =3D wait(&s);
>     if (p !=3D pid)
>       exit (255);
>
>     if (WIFEXITED(s))
>     {
>        int r=3DWEXITSTATUS(s);
>        if (r!=3D42) {
>         printf("child wants to return %i (0x%X), parent received %i (0x%X=
), difference %i\n",42,42,r,r,r-42);
>        }
>     }
>   }
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>   (riscv-ilp32 chroot) farino /tmp # ./wait-test-short
>   child wants to return 42 (0x2A), parent received 40 (0x28), difference =
-2
>
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   (riscv-ilp32 chroot) farino /tmp # gcc --version
>   gcc (Gentoo 10.2.0-r1 p2) 10.2.0
>   Copyright (C) 2020 Free Software Foundation, Inc.
>   Dies ist freie Software; die Kopierbedingungen stehen in den Quellen. E=
s
>   gibt KEINE Garantie; auch nicht f=C3=BCr MARKTG=C3=84NGIGKEIT oder F=C3=
=9CR SPEZIELLE ZWECKE.
>
>   (riscv-ilp32 chroot) farino /tmp # ld --version
>   GNU ld (Gentoo 2.34 p6) 2.34.0
>   Copyright (C) 2020 Free Software Foundation, Inc.
>   This program is free software; you may redistribute it under the terms =
of
>   the GNU General Public License version 3 or (at your option) a later ve=
rsion.
>   This program has absolutely no warranty.
>
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1906193/+subscriptions
>

