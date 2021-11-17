Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3320454C55
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 18:44:23 +0100 (CET)
Received: from localhost ([::1]:42406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnOys-0001By-5V
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 12:44:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnOxI-0000MS-Mn
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:42:44 -0500
Received: from [2607:f8b0:4864:20::929] (port=35584
 helo=mail-ua1-x929.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnOxD-0001Sd-Hu
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:42:43 -0500
Received: by mail-ua1-x929.google.com with SMTP id l24so7708325uak.2
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 09:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bp0BuKjxFMLAQKjt0SSQlKP68UW05lVUjk/8QFRl20k=;
 b=hxpHZlxNFQQK1FY8ZgeFw9EqKg4y7D8EMHnuVcwVahaHU/vAv/HvPlKFlai9IsxbQ8
 fZYgU+sacTGittsByGyQ3JiacdVlvfr5j+x+lFly4PyhKXOAGRb+4ahkVGGgTzKMq5vj
 Zv943LdmLZuwOB4E8dhh/MGJJ01b9+qQk+3+m60WDdIqAp5KG5fubIrxN1G+hZlUyHTe
 cPFMRTJiHWXYIzLUM9//t/7brhDi/C0wh2AZiDuS7Rc/Qc0smcNUND+QUI1PKHNwuITf
 fClNhiaeKEAq1xzdA1eydHRKu2HwtPlJxkw3vL3hOWm8aRhB2UN8WxA3ti+WLsx5xmHw
 22jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bp0BuKjxFMLAQKjt0SSQlKP68UW05lVUjk/8QFRl20k=;
 b=05PMqvY/9SzVrz0/4S9ggMZCPFTvf0hzF7wxiy6c/iJ8MKzzfbD9z0cTfTY2z6lGga
 fvUWhJPWQxOqZ6TVskTmOawTG+Na2Q47HdLCilN4LcwJt8eTIve4K2CpPd8kG6LB2bLS
 sc4LLNm3TDFu3yEk8huRsk4UoRzSBH3R66c975o3JGC1jEBZ3GMBFEPK76zx/VmbyQ7y
 MQo7vy8ldflx/1K+YZA/yVOtwux6k2kPhumDa1FUhDNEU7+GCBmJWEwRdBn6tAT4f30d
 kBwAWGQCAvWAbCSiwSLSqEJzMUWhuP4DohJqVYUi8517jXaAJuIcVhYYgCwsqoheOlKT
 TqFQ==
X-Gm-Message-State: AOAM5309rVY259/YIRdh3fbLB6hrfDspAjUNYxEynN406JtIhY6Ul2JO
 +iEYq0yoBDICxqvvYMSs1mX8+it1mAa1UMTnmcphfQ==
X-Google-Smtp-Source: ABdhPJz6qBS9egwxcwsTC1zxS3ay0zK+W2NkhVlP63FB9+lhdXibOAQWjqIu/rv71CNkdigDdhI+d1X14QliG4kyNwg=
X-Received: by 2002:a67:ab48:: with SMTP id k8mr71200762vsh.30.1637170958293; 
 Wed, 17 Nov 2021 09:42:38 -0800 (PST)
MIME-Version: 1.0
References: <20211117160412.71563-1-richard.henderson@linaro.org>
In-Reply-To: <20211117160412.71563-1-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 17 Nov 2021 10:42:28 -0700
Message-ID: <CANCZdfoOX+G441b+hy4UBN6iDnBzmG051bmygvG49pZMs_VNJQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/17] linux-user: simplify safe signal handling
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000067ee8505d0ff91c2"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::929
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::929;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000067ee8505d0ff91c2
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 9:04 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Warner's v3:
> https://patchew.org/QEMU/20211113045603.60391-1-imp@bsdimp.com/
>
> Changes for v5:
>   * Fix safe-syscall.S FreeBSD typos.
>   * Rename special TARGET_EFOO to QEMU_EFOO.
>   * Create *-user/special-errno.h.
>   * Build safe-syscall.o only once.
>   * meson.build cleanups.
>   * bsd-user builds without modification on master.
>
> Changes for v4:
>   * Move errno handling into the assembly.  While returning the
>     raw -errno is handy for x86 linux (and a few others), it is
>     in fact more complex for other hosts that return a separate
>     error indicator.  At which point we wind up jumping through
>     hoops to return -errno, only to have the caller put it right
>     back into +errno with -1 result, just like syscall(3).
>
>     Pass in &errno, because the method of calculating this
>     varies wildly between glibc, musl, etc.  This means that
>     the assembly need only store to a provided pointer.
>
>   * Add mips and sparc safe-syscall implementations.
>     Both of which, btw, have separate error indicators.  ;-)
>
>   * All hosts now have it, so remove HAVE_SAFE_SYSCALL.
>
>   * Add meson.build rules for common-user/safe-syscall.S, so
>     that we don't have to have weird includes from *-user.
>
>
> r~
>
>
> Richard Henderson (13):
>   common-user: Move syscall error detection into safe_syscall_base
>   common-user/host/mips: Add safe-syscall.inc.S
>   common-user/host/sparc64: Add safe-syscall.inc.S
>   linux-user: Remove HAVE_SAFE_SYSCALL and hostdep.h
>   *-user: Rename TARGET_ERESTARTSYS to QEMU_ERESTARTSYS
>   linux-user: Rename TARGET_QEMU_ESIGRETURN to QEMU_ESIGRETURN
>   bsd-user: Create special-errno.h
>   linux-user: Create special-errno.h
>   meson: Add build infrastructure for common-user
>   common-user: Move safe-syscall.* from linux-user
>   linux-user: Move thunk.c from top-level
>   meson: Move linux_user_ss to linux-user/
>   meson: Move bsd_user_ss to bsd-user/
>

In addition to the reviews, I've pulled these changes, and
as a whole they build and work on FreeBSD with my small
test binaries for x86.

It also works with my in-flight arm addition.

I've not tried to integrate it into the bsd-user fork's 'blitz'
branch though I don't think there will be issues.

Thanks!

Warner


> Warner Losh (4):
>   linux-user: Add host_signal_set_pc to set pc in mcontext
>   linux-user/signal.c: Create a common rewind_if_in_safe_syscall
>   linux-user/safe-syscall.inc.S: Move to common-user
>   common-user: Adjust system call return on FreeBSD
>
>  meson.build                                   |  23 ++-
>  bsd-user/errno_defs.h                         |   6 +-
>  bsd-user/special-errno.h                      |  24 ++++
>  {linux-user => include/user}/safe-syscall.h   |  39 ++---
>  linux-user/cpu_loop-common.h                  |   1 +
>  linux-user/generic/target_errno_defs.h        |  17 ---
>  linux-user/host/aarch64/host-signal.h         |   5 +
>  linux-user/host/aarch64/hostdep.h             |  38 -----
>  linux-user/host/alpha/host-signal.h           |   5 +
>  linux-user/host/arm/host-signal.h             |   5 +
>  linux-user/host/arm/hostdep.h                 |  38 -----
>  linux-user/host/i386/host-signal.h            |   5 +
>  linux-user/host/i386/hostdep.h                |  38 -----
>  linux-user/host/ia64/hostdep.h                |  15 --
>  linux-user/host/mips/host-signal.h            |   5 +
>  linux-user/host/mips/hostdep.h                |  15 --
>  linux-user/host/ppc/host-signal.h             |   5 +
>  linux-user/host/ppc/hostdep.h                 |  15 --
>  linux-user/host/ppc64/hostdep.h               |  38 -----
>  linux-user/host/riscv/host-signal.h           |   5 +
>  linux-user/host/riscv/hostdep.h               |  34 -----
>  linux-user/host/s390/host-signal.h            |   5 +
>  linux-user/host/s390/hostdep.h                |  15 --
>  linux-user/host/s390x/hostdep.h               |  38 -----
>  linux-user/host/sparc/host-signal.h           |   9 ++
>  linux-user/host/sparc/hostdep.h               |  15 --
>  linux-user/host/sparc64/hostdep.h             |  15 --
>  linux-user/host/x32/hostdep.h                 |  15 --
>  linux-user/host/x86_64/host-signal.h          |   5 +
>  linux-user/host/x86_64/hostdep.h              |  38 -----
>  linux-user/signal-common.h                    |   4 +-
>  linux-user/special-errno.h                    |  32 +++++
>  linux-user/user-internals.h                   |   1 -
>  linux-user/aarch64/cpu_loop.c                 |   4 +-
>  linux-user/aarch64/signal.c                   |   4 +-
>  linux-user/alpha/cpu_loop.c                   |   4 +-
>  linux-user/alpha/signal.c                     |   8 +-
>  linux-user/arm/cpu_loop.c                     |   4 +-
>  linux-user/arm/signal.c                       |   8 +-
>  linux-user/cris/cpu_loop.c                    |   4 +-
>  linux-user/cris/signal.c                      |   4 +-
>  linux-user/hexagon/cpu_loop.c                 |   4 +-
>  linux-user/hexagon/signal.c                   |   2 +-
>  linux-user/hppa/cpu_loop.c                    |   4 +-
>  linux-user/hppa/signal.c                      |   4 +-
>  linux-user/i386/cpu_loop.c                    |  12 +-
>  linux-user/i386/signal.c                      |   8 +-
>  linux-user/m68k/cpu_loop.c                    |   4 +-
>  linux-user/m68k/signal.c                      |   8 +-
>  linux-user/microblaze/cpu_loop.c              |   4 +-
>  linux-user/microblaze/signal.c                |   4 +-
>  linux-user/mips/cpu_loop.c                    |   4 +-
>  linux-user/mips/signal.c                      |   8 +-
>  linux-user/openrisc/cpu_loop.c                |   4 +-
>  linux-user/ppc/cpu_loop.c                     |   4 +-
>  linux-user/ppc/signal.c                       |  10 +-
>  linux-user/riscv/cpu_loop.c                   |   4 +-
>  linux-user/riscv/signal.c                     |   2 +-
>  linux-user/s390x/cpu_loop.c                   |   4 +-
>  linux-user/s390x/signal.c                     |   8 +-
>  linux-user/sh4/cpu_loop.c                     |   4 +-
>  linux-user/sh4/signal.c                       |   8 +-
>  linux-user/signal.c                           |  19 ++-
>  linux-user/sparc/cpu_loop.c                   |   2 +-
>  linux-user/sparc/signal.c                     |   8 +-
>  linux-user/syscall.c                          |  21 +--
>  thunk.c => linux-user/thunk.c                 |   0
>  linux-user/xtensa/cpu_loop.c                  |   4 +-
>  linux-user/xtensa/signal.c                    |   4 +-
>  bsd-user/meson.build                          |   6 +
>  .../host/aarch64/safe-syscall.inc.S           |  65 ++++++---
>  .../host/arm/safe-syscall.inc.S               |  69 ++++++---
>  .../host/i386/safe-syscall.inc.S              |  61 +++++---
>  common-user/host/mips/safe-syscall.inc.S      | 135 ++++++++++++++++++
>  .../host/ppc64/safe-syscall.inc.S             |  63 ++++----
>  .../host/riscv/safe-syscall.inc.S             |  50 ++++---
>  .../host/s390x/safe-syscall.inc.S             |  50 ++++---
>  common-user/host/sparc64/safe-syscall.inc.S   |  91 ++++++++++++
>  .../host/x86_64/safe-syscall.inc.S            |  80 +++++++----
>  common-user/meson.build                       |   3 +
>  {linux-user => common-user}/safe-syscall.S    |   5 +-
>  linux-user/meson.build                        |   9 +-
>  82 files changed, 778 insertions(+), 689 deletions(-)
>  create mode 100644 bsd-user/special-errno.h
>  rename {linux-user => include/user}/safe-syscall.h (81%)
>  delete mode 100644 linux-user/host/aarch64/hostdep.h
>  delete mode 100644 linux-user/host/arm/hostdep.h
>  delete mode 100644 linux-user/host/i386/hostdep.h
>  delete mode 100644 linux-user/host/ia64/hostdep.h
>  delete mode 100644 linux-user/host/mips/hostdep.h
>  delete mode 100644 linux-user/host/ppc/hostdep.h
>  delete mode 100644 linux-user/host/ppc64/hostdep.h
>  delete mode 100644 linux-user/host/riscv/hostdep.h
>  delete mode 100644 linux-user/host/s390/hostdep.h
>  delete mode 100644 linux-user/host/s390x/hostdep.h
>  delete mode 100644 linux-user/host/sparc/hostdep.h
>  delete mode 100644 linux-user/host/sparc64/hostdep.h
>  delete mode 100644 linux-user/host/x32/hostdep.h
>  delete mode 100644 linux-user/host/x86_64/hostdep.h
>  create mode 100644 linux-user/special-errno.h
>  rename thunk.c => linux-user/thunk.c (100%)
>  rename {linux-user => common-user}/host/aarch64/safe-syscall.inc.S (64%)
>  rename {linux-user => common-user}/host/arm/safe-syscall.inc.S (64%)
>  rename {linux-user => common-user}/host/i386/safe-syscall.inc.S (71%)
>  create mode 100644 common-user/host/mips/safe-syscall.inc.S
>  rename {linux-user => common-user}/host/ppc64/safe-syscall.inc.S (68%)
>  rename {linux-user => common-user}/host/riscv/safe-syscall.inc.S (77%)
>  rename {linux-user => common-user}/host/s390x/safe-syscall.inc.S (71%)
>  create mode 100644 common-user/host/sparc64/safe-syscall.inc.S
>  rename {linux-user => common-user}/host/x86_64/safe-syscall.inc.S (64%)
>  create mode 100644 common-user/meson.build
>  rename {linux-user => common-user}/safe-syscall.S (91%)
>
> --
> 2.25.1
>
>

--00000000000067ee8505d0ff91c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 9:04 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Warner&#39;s v3:<br>
<a href=3D"https://patchew.org/QEMU/20211113045603.60391-1-imp@bsdimp.com/"=
 rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QEMU/202111130456=
03.60391-1-imp@bsdimp.com/</a><br>
<br>
Changes for v5:<br>
=C2=A0 * Fix safe-syscall.S FreeBSD typos.<br>
=C2=A0 * Rename special TARGET_EFOO to QEMU_EFOO.<br>
=C2=A0 * Create *-user/special-errno.h.<br>
=C2=A0 * Build safe-syscall.o only once.<br>
=C2=A0 * meson.build cleanups.<br>
=C2=A0 * bsd-user builds without modification on master.<br>
<br>
Changes for v4:<br>
=C2=A0 * Move errno handling into the assembly.=C2=A0 While returning the<b=
r>
=C2=A0 =C2=A0 raw -errno is handy for x86 linux (and a few others), it is<b=
r>
=C2=A0 =C2=A0 in fact more complex for other hosts that return a separate<b=
r>
=C2=A0 =C2=A0 error indicator.=C2=A0 At which point we wind up jumping thro=
ugh<br>
=C2=A0 =C2=A0 hoops to return -errno, only to have the caller put it right<=
br>
=C2=A0 =C2=A0 back into +errno with -1 result, just like syscall(3).<br>
<br>
=C2=A0 =C2=A0 Pass in &amp;errno, because the method of calculating this<br=
>
=C2=A0 =C2=A0 varies wildly between glibc, musl, etc.=C2=A0 This means that=
<br>
=C2=A0 =C2=A0 the assembly need only store to a provided pointer.<br>
<br>
=C2=A0 * Add mips and sparc safe-syscall implementations.<br>
=C2=A0 =C2=A0 Both of which, btw, have separate error indicators.=C2=A0 ;-)=
<br>
<br>
=C2=A0 * All hosts now have it, so remove HAVE_SAFE_SYSCALL.<br>
<br>
=C2=A0 * Add meson.build rules for common-user/safe-syscall.S, so<br>
=C2=A0 =C2=A0 that we don&#39;t have to have weird includes from *-user.<br=
>
<br>
<br>
r~<br>
<br>
<br>
Richard Henderson (13):<br>
=C2=A0 common-user: Move syscall error detection into safe_syscall_base<br>
=C2=A0 common-user/host/mips: Add safe-syscall.inc.S<br>
=C2=A0 common-user/host/sparc64: Add safe-syscall.inc.S<br>
=C2=A0 linux-user: Remove HAVE_SAFE_SYSCALL and hostdep.h<br>
=C2=A0 *-user: Rename TARGET_ERESTARTSYS to QEMU_ERESTARTSYS<br>
=C2=A0 linux-user: Rename TARGET_QEMU_ESIGRETURN to QEMU_ESIGRETURN<br>
=C2=A0 bsd-user: Create special-errno.h<br>
=C2=A0 linux-user: Create special-errno.h<br>
=C2=A0 meson: Add build infrastructure for common-user<br>
=C2=A0 common-user: Move safe-syscall.* from linux-user<br>
=C2=A0 linux-user: Move thunk.c from top-level<br>
=C2=A0 meson: Move linux_user_ss to linux-user/<br>
=C2=A0 meson: Move bsd_user_ss to bsd-user/<br></blockquote><div><br></div>=
<div>In addition to the reviews, I&#39;ve pulled these changes, and</div><d=
iv>as a whole they build and work on FreeBSD with my small</div><div>test b=
inaries for x86.</div><div><br></div><div>It also works with my in-flight a=
rm addition.</div><div><br></div><div>I&#39;ve not tried to integrate it in=
to the bsd-user fork&#39;s &#39;blitz&#39;</div><div>branch though I don&#3=
9;t think there will be issues.</div><div><br></div><div>Thanks!</div><div>=
<br></div><div>Warner</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
Warner Losh (4):<br>
=C2=A0 linux-user: Add host_signal_set_pc to set pc in mcontext<br>
=C2=A0 linux-user/signal.c: Create a common rewind_if_in_safe_syscall<br>
=C2=A0 linux-user/safe-syscall.inc.S: Move to common-user<br>
=C2=A0 common-user: Adjust system call return on FreeBSD<br>
<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 23 ++-<br>
=C2=A0bsd-user/errno_defs.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0bsd-user/special-errno.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 24 ++++<br>
=C2=A0{linux-user =3D&gt; include/user}/safe-syscall.h=C2=A0 =C2=A0|=C2=A0 =
39 ++---<br>
=C2=A0linux-user/cpu_loop-common.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0linux-user/generic/target_errno_defs.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 17 ---<br>
=C2=A0linux-user/host/aarch64/host-signal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A05 +<br>
=C2=A0linux-user/host/aarch64/hostdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 38 -----<br>
=C2=A0linux-user/host/alpha/host-signal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A05 +<br>
=C2=A0linux-user/host/arm/host-signal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
=C2=A0linux-user/host/arm/hostdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 38 -----<br>
=C2=A0linux-user/host/i386/host-signal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A05 +<br>
=C2=A0linux-user/host/i386/hostdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 38 -----<br>
=C2=A0linux-user/host/ia64/hostdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 15 --<br>
=C2=A0linux-user/host/mips/host-signal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A05 +<br>
=C2=A0linux-user/host/mips/hostdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 15 --<br>
=C2=A0linux-user/host/ppc/host-signal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
=C2=A0linux-user/host/ppc/hostdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 15 --<br>
=C2=A0linux-user/host/ppc64/hostdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 38 -----<br>
=C2=A0linux-user/host/riscv/host-signal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A05 +<br>
=C2=A0linux-user/host/riscv/hostdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 34 -----<br>
=C2=A0linux-user/host/s390/host-signal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A05 +<br>
=C2=A0linux-user/host/s390/hostdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 15 --<br>
=C2=A0linux-user/host/s390x/hostdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 38 -----<br>
=C2=A0linux-user/host/sparc/host-signal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A09 ++<br>
=C2=A0linux-user/host/sparc/hostdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 15 --<br>
=C2=A0linux-user/host/sparc64/hostdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 15 --<br>
=C2=A0linux-user/host/x32/hostdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 15 --<br>
=C2=A0linux-user/host/x86_64/host-signal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A05 +<br>
=C2=A0linux-user/host/x86_64/hostdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 38 -----<br>
=C2=A0linux-user/signal-common.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0linux-user/special-errno.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 32 +++++<br>
=C2=A0linux-user/user-internals.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 -<br>
=C2=A0linux-user/aarch64/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0linux-user/aarch64/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0linux-user/alpha/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0linux-user/alpha/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0linux-user/arm/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0linux-user/arm/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0linux-user/cris/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0linux-user/cris/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0linux-user/hexagon/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0linux-user/hexagon/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0linux-user/hppa/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0linux-user/hppa/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0linux-user/i386/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 +-<br>
=C2=A0linux-user/i386/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
=C2=A0linux-user/m68k/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0linux-user/m68k/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
=C2=A0linux-user/microblaze/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0linux-user/microblaze/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0linux-user/mips/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0linux-user/mips/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
=C2=A0linux-user/openrisc/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0linux-user/ppc/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0linux-user/ppc/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +-<br>
=C2=A0linux-user/riscv/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0linux-user/riscv/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0linux-user/s390x/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0linux-user/s390x/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0linux-user/sh4/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0linux-user/sh4/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0linux-user/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 19 ++-<br>
=C2=A0linux-user/sparc/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0linux-user/sparc/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0linux-user/syscall.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 21 +--<br>
=C2=A0thunk.c =3D&gt; linux-user/thunk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0linux-user/xtensa/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0linux-user/xtensa/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0bsd-user/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +<br>
=C2=A0.../host/aarch64/safe-syscall.inc.S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 65 ++++++---<br>
=C2=A0.../host/arm/safe-syscall.inc.S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 69 ++++++---<br>
=C2=A0.../host/i386/safe-syscall.inc.S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 61 +++++---<br>
=C2=A0common-user/host/mips/safe-syscall.inc.S=C2=A0 =C2=A0 =C2=A0 | 135 ++=
++++++++++++++++<br>
=C2=A0.../host/ppc64/safe-syscall.inc.S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 63 ++++----<br>
=C2=A0.../host/riscv/safe-syscall.inc.S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 50 ++++---<br>
=C2=A0.../host/s390x/safe-syscall.inc.S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 50 ++++---<br>
=C2=A0common-user/host/sparc64/safe-syscall.inc.S=C2=A0 =C2=A0|=C2=A0 91 ++=
++++++++++<br>
=C2=A0.../host/x86_64/safe-syscall.inc.S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 80 +++++++----<br>
=C2=A0common-user/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0{linux-user =3D&gt; common-user}/safe-syscall.S=C2=A0 =C2=A0 |=C2=A0 =
=C2=A05 +-<br>
=C2=A0linux-user/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 +-<br>
=C2=A082 files changed, 778 insertions(+), 689 deletions(-)<br>
=C2=A0create mode 100644 bsd-user/special-errno.h<br>
=C2=A0rename {linux-user =3D&gt; include/user}/safe-syscall.h (81%)<br>
=C2=A0delete mode 100644 linux-user/host/aarch64/hostdep.h<br>
=C2=A0delete mode 100644 linux-user/host/arm/hostdep.h<br>
=C2=A0delete mode 100644 linux-user/host/i386/hostdep.h<br>
=C2=A0delete mode 100644 linux-user/host/ia64/hostdep.h<br>
=C2=A0delete mode 100644 linux-user/host/mips/hostdep.h<br>
=C2=A0delete mode 100644 linux-user/host/ppc/hostdep.h<br>
=C2=A0delete mode 100644 linux-user/host/ppc64/hostdep.h<br>
=C2=A0delete mode 100644 linux-user/host/riscv/hostdep.h<br>
=C2=A0delete mode 100644 linux-user/host/s390/hostdep.h<br>
=C2=A0delete mode 100644 linux-user/host/s390x/hostdep.h<br>
=C2=A0delete mode 100644 linux-user/host/sparc/hostdep.h<br>
=C2=A0delete mode 100644 linux-user/host/sparc64/hostdep.h<br>
=C2=A0delete mode 100644 linux-user/host/x32/hostdep.h<br>
=C2=A0delete mode 100644 linux-user/host/x86_64/hostdep.h<br>
=C2=A0create mode 100644 linux-user/special-errno.h<br>
=C2=A0rename thunk.c =3D&gt; linux-user/thunk.c (100%)<br>
=C2=A0rename {linux-user =3D&gt; common-user}/host/aarch64/safe-syscall.inc=
.S (64%)<br>
=C2=A0rename {linux-user =3D&gt; common-user}/host/arm/safe-syscall.inc.S (=
64%)<br>
=C2=A0rename {linux-user =3D&gt; common-user}/host/i386/safe-syscall.inc.S =
(71%)<br>
=C2=A0create mode 100644 common-user/host/mips/safe-syscall.inc.S<br>
=C2=A0rename {linux-user =3D&gt; common-user}/host/ppc64/safe-syscall.inc.S=
 (68%)<br>
=C2=A0rename {linux-user =3D&gt; common-user}/host/riscv/safe-syscall.inc.S=
 (77%)<br>
=C2=A0rename {linux-user =3D&gt; common-user}/host/s390x/safe-syscall.inc.S=
 (71%)<br>
=C2=A0create mode 100644 common-user/host/sparc64/safe-syscall.inc.S<br>
=C2=A0rename {linux-user =3D&gt; common-user}/host/x86_64/safe-syscall.inc.=
S (64%)<br>
=C2=A0create mode 100644 common-user/meson.build<br>
=C2=A0rename {linux-user =3D&gt; common-user}/safe-syscall.S (91%)<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--00000000000067ee8505d0ff91c2--

