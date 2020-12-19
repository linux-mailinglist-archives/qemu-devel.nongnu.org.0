Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFB02DF215
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Dec 2020 00:23:10 +0100 (CET)
Received: from localhost ([::1]:50344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqlZ6-0003By-Gb
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 18:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1kqlXt-0002lK-3C
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 18:21:53 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:37489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1kqlXn-0004BZ-R4
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 18:21:52 -0500
Received: by mail-lf1-x12f.google.com with SMTP id o17so14942586lfg.4
 for <qemu-devel@nongnu.org>; Sat, 19 Dec 2020 15:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
 bh=Ih/hJ+1Cp6C9cSQ8lIpegm9/RFT3ILRM+NyYPSBbDx8=;
 b=QjEIrBrYTrvg+z9nHYX2XAJPiE2gWqxrYrwuc86scold/SqldZpUhoa209MsEPlmxq
 ly5me7l26toPbQ9h31XautjyaoZ84GhKH8/RNBWnKwwQMEtpmbcq0gsa8GuoimqhERd5
 LDPWUZVaCszD+WSXDjgN8pY90VBI/0uEJ3Dbs3vi3ygpovIQajXxFQcV2yV25ySb7wiU
 m4HAJF61n2CYSO2HZZ3X2TWmCLnyzxUBVVHSFQ27biCudYVCIbL/G83GXKBN5SyJVI/u
 8/Rw2f+rqXyXGO0+/oR8J367HvTdYEwP6j3hJAQbt9WnZl+FyjOZWaTcYpQCxgccHMNC
 BAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc;
 bh=Ih/hJ+1Cp6C9cSQ8lIpegm9/RFT3ILRM+NyYPSBbDx8=;
 b=lqhs97gKP96gH89hRl/t7DTLMl2wOpcO9HxNWKJ2nYGsfXXLKabbD1T711UROtbQ6F
 qL2eEtVWmIHRiD2kAuwuYSxpaEsSalWHAg7CWNN/jX+VtQmd2h00RFZMFQu/y8HRtMxh
 5rWP+MwiWfAMs8PVso+RSW1ydl2sg4JGwdV6sQJHm4Gx4l1UyxakaPkSmaaef3kXOVk7
 pKaO0R50HPSa6IP4zIBW8JqbG++fKuxYQNl9373axfeXsk+kY6lFm+pkso26NPeY9EHA
 dZ/QWqpK1EDI6ONi2nyFTgckzd8q22Ki3Ev1OA0Bkkp+JmaRg2qXPqJy6e+1gdQgpULs
 09aA==
X-Gm-Message-State: AOAM532x4RT/yvHMaqAVyUBKMWcFjethDtr2Vh1gZ+fsSsYldDpGxbFV
 HqS+FkmGs49HEO7xfBlVLwiOkqF8QNqtMkbCIqHluDHFjMYN3g==
X-Google-Smtp-Source: ABdhPJwQqgE12SoR0YCjbkHfvbSC+PRSdooIyEbwWEX9Nd0k1Ofss7WEEqBrJ0DifYvhbEzRB5I94sGguO4Hnwf7a2s=
X-Received: by 2002:a2e:8416:: with SMTP id z22mr4566807ljg.347.1608420104677; 
 Sat, 19 Dec 2020 15:21:44 -0800 (PST)
MIME-Version: 1.0
References: <20201218205250.86382-1-imp@freebsd.org>
In-Reply-To: <20201218205250.86382-1-imp@freebsd.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sat, 19 Dec 2020 16:21:37 -0700
Message-ID: <CANCZdfo0eSBpStobZS7cYyBaitzWR8cUZ0BMkEcyxVQo=y88TA@mail.gmail.com>
Subject: Re: [PATCH 0/4] A few preliminary bsd-user patches
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000fd3c4205b6d97c85"
Received-SPF: none client-ip=2a00:1450:4864:20::12f;
 envelope-from=wlosh@bsdimp.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, HTML_MESSAGE=0.001, MISSING_HEADERS=1.021,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000fd3c4205b6d97c85
Content-Type: text/plain; charset="UTF-8"

I'm not at all sure why this was sent twice.  I thought I'd cleared out all
the 'failed' attempts on the first system I tried to git email-send from
after realizing sendmail hadn't been configured...

Sorry about that.

Warner

On Sat, Dec 19, 2020 at 1:54 PM <imp@freebsd.org> wrote:

> From: Warner Losh <imp@freebsd.org>
>
> Here's the first round of bsd-user patches. There's on the order of 280
> that
> we've done, but that's too much to review all at once. In addition, 3.1
> release
> was the last rebase point that we've been successful with for a number of
> reasons
> unrelated to qemu. Now that those have been resolved, we have a new push
> under way
> to push things forward, but wanted to upstream as many of the patches as
> we can
> directly to qemu's head to lighten the load of carrying all these.
>
> This first small series updates the system call lists, moves things around
> to
> make it easier to support divergence in the BSD world, and adjusts to the
> new
> meson build. It's also designed to help me learn how to land such a large
> set
> upstream.
>
> These patches have passed through several hands, with different tweaks
> over the
> years so have an unusually large number of signed-off-by lines that are the
> result of this refinement process where several hands have touched the
> patches
> in the last 7 years.
>
> Sean Bruno (1):
>   tcg: Additional Trap type for FreeBSD
>
> Stacey Son (1):
>   bsd-user: move strace OS/arch dependent code to host/arch dirs
>
> Warner Losh (2):
>   bsd-user: regenerate FreeBSD's system call numbers
>   bsd-user: Update strace.list for FreeBSD's latest syscalls
>
>  accel/tcg/user-exec.c                  |   8 +-
>  bsd-user/arm/target_arch_sysarch.h     |  78 +++
>  bsd-user/arm/target_syscall.h          |  36 ++
>  bsd-user/freebsd/os-strace.h           |  29 ++
>  bsd-user/freebsd/strace.list           |  65 ++-
>  bsd-user/freebsd/syscall_nr.h          | 695 ++++++++++++++-----------
>  bsd-user/i386/target_arch_sysarch.h    |  77 +++
>  bsd-user/i386/target_syscall.h         |  19 +
>  bsd-user/mips/target_arch_sysarch.h    |  69 +++
>  bsd-user/mips/target_syscall.h         |  52 ++
>  bsd-user/mips64/target_arch_sysarch.h  |  69 +++
>  bsd-user/mips64/target_syscall.h       |  53 ++
>  bsd-user/netbsd/os-strace.h            |   1 +
>  bsd-user/openbsd/os-strace.h           |   1 +
>  bsd-user/sparc/target_arch_sysarch.h   |  52 ++
>  bsd-user/sparc/target_syscall.h        |  24 +-
>  bsd-user/sparc64/target_arch_sysarch.h |  52 ++
>  bsd-user/sparc64/target_syscall.h      |  24 +-
>  bsd-user/strace.c                      |  11 +
>  bsd-user/x86_64/target_arch_sysarch.h  |  76 +++
>  bsd-user/x86_64/target_syscall.h       |  21 +-
>  meson.build                            |   1 +
>  22 files changed, 1186 insertions(+), 327 deletions(-)
>  create mode 100644 bsd-user/arm/target_arch_sysarch.h
>  create mode 100644 bsd-user/arm/target_syscall.h
>  create mode 100644 bsd-user/freebsd/os-strace.h
>  create mode 100644 bsd-user/i386/target_arch_sysarch.h
>  create mode 100644 bsd-user/mips/target_arch_sysarch.h
>  create mode 100644 bsd-user/mips/target_syscall.h
>  create mode 100644 bsd-user/mips64/target_arch_sysarch.h
>  create mode 100644 bsd-user/mips64/target_syscall.h
>  create mode 100644 bsd-user/netbsd/os-strace.h
>  create mode 100644 bsd-user/openbsd/os-strace.h
>  create mode 100644 bsd-user/sparc/target_arch_sysarch.h
>  create mode 100644 bsd-user/sparc64/target_arch_sysarch.h
>  create mode 100644 bsd-user/x86_64/target_arch_sysarch.h
>
> --
> 2.22.1
>
>
>

--000000000000fd3c4205b6d97c85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m not at all sure why this was sent twice.=C2=A0 I t=
hought I&#39;d cleared out all the &#39;failed&#39; attempts on the first s=
ystem I tried to git email-send from after realizing sendmail hadn&#39;t be=
en configured...<div><br></div><div>Sorry about that.<br><div><br></div><di=
v>Warner</div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Sat, Dec 19, 2020 at 1:54 PM &lt;<a href=3D"mailto:i=
mp@freebsd.org">imp@freebsd.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">From: Warner Losh &lt;<a href=3D"mailto:im=
p@freebsd.org" target=3D"_blank">imp@freebsd.org</a>&gt;<br>
<br>
Here&#39;s the first round of bsd-user patches. There&#39;s on the order of=
 280 that<br>
we&#39;ve done, but that&#39;s too much to review all at once. In addition,=
 3.1 release<br>
was the last rebase point that we&#39;ve been successful with for a number =
of reasons<br>
unrelated to qemu. Now that those have been resolved, we have a new push un=
der way<br>
to push things forward, but wanted to upstream as many of the patches as we=
 can<br>
directly to qemu&#39;s head to lighten the load of carrying all these.<br>
<br>
This first small series updates the system call lists, moves things around =
to<br>
make it easier to support divergence in the BSD world, and adjusts to the n=
ew<br>
meson build. It&#39;s also designed to help me learn how to land such a lar=
ge set<br>
upstream.<br>
<br>
These patches have passed through several hands, with different tweaks over=
 the<br>
years so have an unusually large number of signed-off-by lines that are the=
<br>
result of this refinement process where several hands have touched the patc=
hes<br>
in the last 7 years.<br>
<br>
Sean Bruno (1):<br>
=C2=A0 tcg: Additional Trap type for FreeBSD<br>
<br>
Stacey Son (1):<br>
=C2=A0 bsd-user: move strace OS/arch dependent code to host/arch dirs<br>
<br>
Warner Losh (2):<br>
=C2=A0 bsd-user: regenerate FreeBSD&#39;s system call numbers<br>
=C2=A0 bsd-user: Update strace.list for FreeBSD&#39;s latest syscalls<br>
<br>
=C2=A0accel/tcg/user-exec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
=C2=A0bsd-user/arm/target_arch_sysarch.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 78 +++<=
br>
=C2=A0bsd-user/arm/target_syscall.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 36 ++<br>
=C2=A0bsd-user/freebsd/os-strace.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 29 ++<br>
=C2=A0bsd-user/freebsd/strace.list=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 65 ++-<br>
=C2=A0bsd-user/freebsd/syscall_nr.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 695=
 ++++++++++++++-----------<br>
=C2=A0bsd-user/i386/target_arch_sysarch.h=C2=A0 =C2=A0 |=C2=A0 77 +++<br>
=C2=A0bsd-user/i386/target_syscall.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 19 +<br>
=C2=A0bsd-user/mips/target_arch_sysarch.h=C2=A0 =C2=A0 |=C2=A0 69 +++<br>
=C2=A0bsd-user/mips/target_syscall.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 52 ++<br>
=C2=A0bsd-user/mips64/target_arch_sysarch.h=C2=A0 |=C2=A0 69 +++<br>
=C2=A0bsd-user/mips64/target_syscall.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 53=
 ++<br>
=C2=A0bsd-user/netbsd/os-strace.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A01 +<br>
=C2=A0bsd-user/openbsd/os-strace.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 =C2=A01 +<br>
=C2=A0bsd-user/sparc/target_arch_sysarch.h=C2=A0 =C2=A0|=C2=A0 52 ++<br>
=C2=A0bsd-user/sparc/target_syscall.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 24=
 +-<br>
=C2=A0bsd-user/sparc64/target_arch_sysarch.h |=C2=A0 52 ++<br>
=C2=A0bsd-user/sparc64/target_syscall.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 24 +-<b=
r>
=C2=A0bsd-user/strace.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 11 +<br>
=C2=A0bsd-user/x86_64/target_arch_sysarch.h=C2=A0 |=C2=A0 76 +++<br>
=C2=A0bsd-user/x86_64/target_syscall.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 21=
 +-<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A022 files changed, 1186 insertions(+), 327 deletions(-)<br>
=C2=A0create mode 100644 bsd-user/arm/target_arch_sysarch.h<br>
=C2=A0create mode 100644 bsd-user/arm/target_syscall.h<br>
=C2=A0create mode 100644 bsd-user/freebsd/os-strace.h<br>
=C2=A0create mode 100644 bsd-user/i386/target_arch_sysarch.h<br>
=C2=A0create mode 100644 bsd-user/mips/target_arch_sysarch.h<br>
=C2=A0create mode 100644 bsd-user/mips/target_syscall.h<br>
=C2=A0create mode 100644 bsd-user/mips64/target_arch_sysarch.h<br>
=C2=A0create mode 100644 bsd-user/mips64/target_syscall.h<br>
=C2=A0create mode 100644 bsd-user/netbsd/os-strace.h<br>
=C2=A0create mode 100644 bsd-user/openbsd/os-strace.h<br>
=C2=A0create mode 100644 bsd-user/sparc/target_arch_sysarch.h<br>
=C2=A0create mode 100644 bsd-user/sparc64/target_arch_sysarch.h<br>
=C2=A0create mode 100644 bsd-user/x86_64/target_arch_sysarch.h<br>
<br>
-- <br>
2.22.1<br>
<br>
<br>
</blockquote></div>

--000000000000fd3c4205b6d97c85--

