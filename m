Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD01E453B83
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 22:12:28 +0100 (CET)
Received: from localhost ([::1]:47640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn5kh-0001u2-W4
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 16:12:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mn5im-0000bz-CS
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 16:10:28 -0500
Received: from [2607:f8b0:4864:20::930] (port=42557
 helo=mail-ua1-x930.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mn5ii-0000DS-VF
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 16:10:28 -0500
Received: by mail-ua1-x930.google.com with SMTP id t13so1070168uad.9
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 13:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yoZEDEZDiC9uYwlALq2o8bWPI/+sJYpD5MKNw++b3rM=;
 b=rlEKoFAGM69P9ADOg0m19dKD4tPbRu7EXEUm1ll2IMfOr7SQQGas47cbCNFqrO8eTt
 uYzWbR/ndbL/GY/nu3hsl8UiH+wzdJFN3rtzNNarktFP9HOrXTlh+ZJUHXd5npsZyHJL
 EC3wh6EjtrEBPXSG4zglouwJoVlrd7+VJd/ujoU+sWP8DM8j5GgeQhS2mbtjUSYoL1eW
 CsEizBQov3gRSVW/XL2G9Jqef4jLH/7szG2RKbKqWz6OAeP5qki0O0CP211fiV5lIZV+
 ArYyjGisI/bKktBWfTHZCgn/+dL1C0P6J0YcQ/6SrZCa4DiCpT4XHYE9h4zCEE7nh/Sr
 gRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yoZEDEZDiC9uYwlALq2o8bWPI/+sJYpD5MKNw++b3rM=;
 b=AminedsTJf/q5hsBV3ot3cOkYT5G50ynj4xukA/F/6ZjU9QitWie209qRPXzTuDxNz
 TuZq254NGdRWDo6SWvqixqIPYNjKf644PhIIAB21dny7QPCxZ0x5R+Gt10ph0rMxarOM
 zfjiZge5CT4UKftfVMwpiX+z8pvJ3gvKz0yRkl8Zdun0Doj5qCW3L4YKqTQ8K9E1pgJO
 JxPJ6t6kjNeAkkqQLdulXtK0EB4HwTWnI4Dfyl+f0QF8k3+jLIXiTYgMuZ8mecu1D5Jt
 RUZZu7bVF1kTmluhS4KiFW2jXNx6cWtqf9d6Ec/ApyBy8r4YwHUJrLAjBhim5YmJmVi5
 N2Fw==
X-Gm-Message-State: AOAM531Qx9YuKWP5zvjkPCOJZro3QfZue3XWB3BGVTQ61iVT33cBPpiV
 dZZC5ZqBHvGbJavJf+S1htx60hidwhTCe1btK5zUJo5AzFc=
X-Google-Smtp-Source: ABdhPJzB0CxxgMuwf0zC6jAy+Z0ZM+y/9mabghDKW8xfQqU3aMYB8mK42vKNVe8youBMwyvwz5YYKhgIXHaRkgczEvg=
X-Received: by 2002:ab0:6f47:: with SMTP id r7mr15494018uat.85.1637097022426; 
 Tue, 16 Nov 2021 13:10:22 -0800 (PST)
MIME-Version: 1.0
References: <20211116110256.365484-1-richard.henderson@linaro.org>
In-Reply-To: <20211116110256.365484-1-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 16 Nov 2021 14:10:11 -0700
Message-ID: <CANCZdfrtHjSGK3gXi6-kLesmQHOZrj-NyKcz9zgL89xTrkaQrw@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] linux-user: simplify safe signal handling
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000007c22d505d0ee5ace"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::930
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::930;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x930.google.com
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

--0000000000007c22d505d0ee5ace
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 16, 2021 at 4:02 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Warner's v3:
> https://patchew.org/QEMU/20211113045603.60391-1-imp@bsdimp.com/
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
>     I'll note that this last patch will at present break bsd-user,
>     because TARGET_ERESTARTSYS and the header from whence it comes
>     is currently missing there.
>
>     In addition, I think that this should be reorganized further
>     so that TARGET_ERESTARTSYS is (1) renamed because in *this*
>     context it is pretending to be a host errno, and (2) placed
>     in a file of its own under include/user/.  At which point,
>     meson.build could be simplified further so that safe-syscall.S
>     is compiled once, not per target.
>
>     Anyway, the final patch needs some bsd-user changes sorted first.
>

I've got bsd-user to compile with these changes by creating
bsd-user/target_errno_defs.h that was just #include "errno_defs.h", which
suggests a simple rename and #include adjustment in bsd-user/syscall_defs.h
would also work. On *BSD, the errno namespace is the same for all
architectures since they never followed the rather divergent System V ABIs
that Linux follows (or at least did for the early ports).

I've noted a couple of other tweaks I needed as well, but there seemed to
be no good place to share this.

I'd  be happy to change these vague descriptions into actual code I can
push to gitlab that you can pull into the patch series as well (or I can
send them to the list, I'm not sure about this finer point of qemu and want
to fit in).

Thanks for expanding my start at this.

Warner


>
> r~
>
>
> Richard Henderson (4):
>   common-user: Move syscall error detection into safe_syscall_base
>   common-user/host/mips: Add safe-syscall.inc.S
>   common-user/host/sparc64: Add safe-syscall.inc.S
>   linux-user: Remove HAVE_SAFE_SYSCALL and hostdep.h
>
> Warner Losh (5):
>   linux-user: Add host_signal_set_pc to set pc in mcontext
>   linux-user/signal.c: Create a common rewind_if_in_safe_syscall
>   linux-user/safe-syscall.inc.S: Move to common-user
>   common-user: Adjust system call return on FreeBSD
>   common-user: Move safe-syscall.* from *-user
>
>  meson.build                                   |   9 +-
>  {linux-user => include/user}/safe-syscall.h   |  31 ++--
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
>  linux-user/user-internals.h                   |   1 -
>  linux-user/signal.c                           |  13 +-
>  linux-user/syscall.c                          |   2 +-
>  .../host/aarch64/safe-syscall.inc.S           |  65 ++++++---
>  .../host/arm/safe-syscall.inc.S               |  69 ++++++---
>  .../host/i386/safe-syscall.inc.S              |  61 +++++---
>  common-user/host/mips/safe-syscall.inc.S      | 135 ++++++++++++++++++
>  .../host/ppc64/safe-syscall.inc.S             |  63 ++++----
>  .../host/riscv/safe-syscall.inc.S             |  50 ++++---
>  .../host/s390x/safe-syscall.inc.S             |  50 ++++---
>  common-user/host/sparc64/safe-syscall.inc.S   |  91 ++++++++++++
>  .../host/x86_64/safe-syscall.inc.S            |  80 +++++++----
>  common-user/meson.build                       |   2 +
>  {linux-user => common-user}/safe-syscall.S    |   3 -
>  linux-user/meson.build                        |   1 -
>  41 files changed, 585 insertions(+), 562 deletions(-)
>  rename {linux-user => include/user}/safe-syscall.h (85%)
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
>  rename {linux-user => common-user}/safe-syscall.S (94%)
>
> --
> 2.25.1
>
>

--0000000000007c22d505d0ee5ace
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 16, 2021 at 4:02 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Warner&#39;s v3:<br>
<a href=3D"https://patchew.org/QEMU/20211113045603.60391-1-imp@bsdimp.com/"=
 rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QEMU/202111130456=
03.60391-1-imp@bsdimp.com/</a><br>
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
=C2=A0 =C2=A0 I&#39;ll note that this last patch will at present break bsd-=
user,<br>
=C2=A0 =C2=A0 because TARGET_ERESTARTSYS and the header from whence it come=
s<br>
=C2=A0 =C2=A0 is currently missing there.<br>
<br>
=C2=A0 =C2=A0 In addition, I think that this should be reorganized further<=
br>
=C2=A0 =C2=A0 so that TARGET_ERESTARTSYS is (1) renamed because in *this*<b=
r>
=C2=A0 =C2=A0 context it is pretending to be a host errno, and (2) placed<b=
r>
=C2=A0 =C2=A0 in a file of its own under include/user/.=C2=A0 At which poin=
t,<br>
=C2=A0 =C2=A0 meson.build could be simplified further so that safe-syscall.=
S<br>
=C2=A0 =C2=A0 is compiled once, not per target.<br>
<br>
=C2=A0 =C2=A0 Anyway, the final patch needs some bsd-user changes sorted fi=
rst.<br></blockquote><div><br></div><div>I&#39;ve got bsd-user to compile w=
ith these changes by creating bsd-user/target_errno_defs.h that was just #i=
nclude &quot;errno_defs.h&quot;, which suggests a simple rename and #includ=
e adjustment in bsd-user/syscall_defs.h would also work. On *BSD, the errno=
 namespace is the same for all architectures since they never followed the =
rather divergent System V ABIs that Linux follows (or at least did for the =
early ports).</div><div><br></div><div>I&#39;ve noted a couple of other twe=
aks I needed as well, but there seemed to be no good place to share this.</=
div><div><br></div><div>I&#39;d=C2=A0 be happy to change these vague descri=
ptions into actual code I can push to gitlab that you can pull into the pat=
ch series as well (or I can send them to the list, I&#39;m not sure about t=
his finer point of qemu and want to fit in).</div><div><br></div><div>Thank=
s for expanding my start at this.</div><div><br></div><div>Warner</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
r~<br>
<br>
<br>
Richard Henderson (4):<br>
=C2=A0 common-user: Move syscall error detection into safe_syscall_base<br>
=C2=A0 common-user/host/mips: Add safe-syscall.inc.S<br>
=C2=A0 common-user/host/sparc64: Add safe-syscall.inc.S<br>
=C2=A0 linux-user: Remove HAVE_SAFE_SYSCALL and hostdep.h<br>
<br>
Warner Losh (5):<br>
=C2=A0 linux-user: Add host_signal_set_pc to set pc in mcontext<br>
=C2=A0 linux-user/signal.c: Create a common rewind_if_in_safe_syscall<br>
=C2=A0 linux-user/safe-syscall.inc.S: Move to common-user<br>
=C2=A0 common-user: Adjust system call return on FreeBSD<br>
=C2=A0 common-user: Move safe-syscall.* from *-user<br>
<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A09 +-<br>
=C2=A0{linux-user =3D&gt; include/user}/safe-syscall.h=C2=A0 =C2=A0|=C2=A0 =
31 ++--<br>
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
=C2=A0linux-user/user-internals.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 -<br>
=C2=A0linux-user/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 13 +-<br>
=C2=A0linux-user/syscall.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
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
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0{linux-user =3D&gt; common-user}/safe-syscall.S=C2=A0 =C2=A0 |=C2=A0 =
=C2=A03 -<br>
=C2=A0linux-user/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 -<br>
=C2=A041 files changed, 585 insertions(+), 562 deletions(-)<br>
=C2=A0rename {linux-user =3D&gt; include/user}/safe-syscall.h (85%)<br>
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
=C2=A0rename {linux-user =3D&gt; common-user}/safe-syscall.S (94%)<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000007c22d505d0ee5ace--

