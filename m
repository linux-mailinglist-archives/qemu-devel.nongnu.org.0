Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 072E12EA35A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 03:28:42 +0100 (CET)
Received: from localhost ([::1]:47922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwc5R-00008r-3I
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 21:28:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1kwc4Q-00088x-5G
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 21:27:38 -0500
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:42631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1kwc4O-00048h-4i
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 21:27:37 -0500
Received: by mail-qt1-x82f.google.com with SMTP id z3so19953085qtw.9
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 18:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DLKSISxkYyn6r9lurs3p80973n5DBASAi50uEZGUgCw=;
 b=Qr+gD26En2vA+YnqkfAvqK++4a2igY2kphDsSueH8pNry8wUXWFgd2TXVJAyfE45nw
 HQLk3B30kEko886pZ7CCbIwOKpWvzTEV3pkKLnMpCsF9X2XnOZQjHrzetNB+ngbrGUg4
 Jjmln2y7HkPa/DJrFggHwqemodSODC/iD0PsusM0At0kk309w3Rs0YU+zdrhNu0qzI31
 Vc3K/jHLKJ7M0zijLC3qnezs+1V8dbXyNZickXdT+Of2CpebhmHBeGRhrFkPfWxuri+c
 J6F312ZRd1i0qgb9AY7L5p84hYuiu7iuLDwrP78EAj+EbjkTtEpfmZu/Xh3VFfHH4cMs
 Omig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DLKSISxkYyn6r9lurs3p80973n5DBASAi50uEZGUgCw=;
 b=rldtsUTYbiIoWwEG3ThEPZz+N8A96nQ2pn2pNN8netv6c2GdMzHnQkKia2Bv/jp/Iy
 ppo4nUQEtwKWLq+nQzXzB3tb3G6L3Ygos/ETrAZPYeBpP4yFC5O7XiVdhLS9HxY2fNjL
 UnYqMY1dPVFTKkCrCSOaVkqEssMT3yrJ43qrbaeihAkiZfk2DRYPC7nZpCkT61FHsran
 Rd0xgE1TnBMVFP6s88Hbi276l72haYIxtlYWgCBy3i1+l8u90nvqrD0UHdtfLf0r0myO
 Co3Wc6QKpyPQ+AJp1teWrsLh2Va1wOu/FK0/5SXSYo2RYF5ZblNtk3L7/HOe3SO1raz5
 h8XA==
X-Gm-Message-State: AOAM5328vTBR+Ux7Ro/J0lhLTzYzkcZWkXm97BJoo69UhhwpfBkzqUn9
 hMpDWE0HBlEksqvAvWwBT3dDvaqdOEPgButo8XEhqg==
X-Google-Smtp-Source: ABdhPJyMpkG94KzkLQgqdzi6suUh4OhhpAOSayFU9H8X8wQ2vAOk9lMoJGOivp1bQPqUdEAeLvdCfuovlJdDvnQj+GI=
X-Received: by 2002:ac8:58d2:: with SMTP id u18mr72344875qta.235.1609813654700; 
 Mon, 04 Jan 2021 18:27:34 -0800 (PST)
MIME-Version: 1.0
References: <20201218205451.10559-1-imp@freebsd.org>
In-Reply-To: <20201218205451.10559-1-imp@freebsd.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 4 Jan 2021 19:27:23 -0700
Message-ID: <CANCZdfpVGk5yhqBtDoW9mXS3cSaSsMy-kLGEjB0Sb6HoNcW-7g@mail.gmail.com>
Subject: Re: [PATCH 0/4] A few preliminary bsd-user patches
To: Warner Losh <imp@freebsd.org>
Content-Type: multipart/alternative; boundary="0000000000000b17a505b81df318"
Received-SPF: none client-ip=2607:f8b0:4864:20::82f;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000b17a505b81df318
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 18, 2020 at 1:55 PM <imp@freebsd.org> wrote:

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

ping?

--0000000000000b17a505b81df318
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 18, 2020 at 1:55 PM &lt;<=
a href=3D"mailto:imp@freebsd.org">imp@freebsd.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">From: Warner Losh &lt;<a h=
ref=3D"mailto:imp@freebsd.org" target=3D"_blank">imp@freebsd.org</a>&gt;<br=
>
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
=C2=A0create mode 100644 bsd-user/x86_64/target_arch_sysarch.h<br></blockqu=
ote><div><br></div><div>ping?=C2=A0</div></div></div>

--0000000000000b17a505b81df318--

