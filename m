Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2E7454B0E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:33:37 +0100 (CET)
Received: from localhost ([::1]:51950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNsO-0008VD-HI
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:33:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnNqh-0006Ll-6p
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:31:51 -0500
Received: from [2607:f8b0:4864:20::92b] (port=45899
 helo=mail-ua1-x92b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnNqe-0007pi-Gd
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:31:50 -0500
Received: by mail-ua1-x92b.google.com with SMTP id ay21so7118305uab.12
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TxCOmE/RTGA0y+r6BnttNOJVyNHkVvLsbgWJeSXpvpA=;
 b=Kfwg7k+4Yf1QgKVuS0ZVa1MjjPmt9SetGDsMG+AHpVqaUQnXJEXBU02SehYwNtIAKX
 YrHB1AnL61O1xolVeqh9N2F0tzNMk6+6H6RQy4ZL8nMYBo6zlIGSmKh3uFrlNvuhJZYU
 BfEhaWwOdkPmUAr4V3rkQDMqF37XR3PcxJKgVgWSVLlt3LVC1OKqlP2cU18wJASolYnr
 dd/PIj/si1W+nja+ITipbWAjU5eOE1u3ixlsVpRdGhcVpMGigkfdOFitn7z/ROG5DbWX
 e0EIOkFXnGC+DNZ7qQl5jBlC3BwGUuW5GtXtAYxwxJhAEjDZNMO/9Q0sKMVa7IrHCZ1P
 8ahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TxCOmE/RTGA0y+r6BnttNOJVyNHkVvLsbgWJeSXpvpA=;
 b=YkQTxq48XGCwRGV6bjmbuMDWSQM89E4sysZgXczn0mb2B+ZOs+22fbB5qanIxinP/A
 2ix77xk4bh4Rf3R/mFMVW3e/cVYZQ3Ks5OGKd8jpUvj+3jLeCnbarlV1drjW2WXI70Eu
 BSlIDD3PgB1j/k/AvqmuHDOCvw7ihBx183o9gV0aPCV+qkmymgnx5OkKIU8PBN/FKhZs
 FUkBvBcuTqGtaw+f4i8eBpw7lPW+uB1xm7ZYymDJda9QLVDpvxuuOEgWhwQWNGLRg0t6
 S6kx0EoC6vu+OSRrh/+73ogTVDpaNpBluyjna0O5jX/jdFYXW9N2Ja0eH+zRNo1QApUZ
 FDAw==
X-Gm-Message-State: AOAM5336LRXaoZnmkHNSCM8RvBx0Wc0dKLROJXdNw248oPJvgxCx76Sx
 29ybdX15/mvcDkx2qLm9zs3QNmd2WO35D4PwENrklQ==
X-Google-Smtp-Source: ABdhPJzxNLFay518icTgsiEz1cCjIXbgqnKW1wUKLoVad0kq5J4+gx8LHl08+fhXT3NdsmpldnsDCmSyscQRH/hxipg=
X-Received: by 2002:a05:6102:d94:: with SMTP id
 d20mr72202845vst.12.1637166707016; 
 Wed, 17 Nov 2021 08:31:47 -0800 (PST)
MIME-Version: 1.0
References: <20211117160412.71563-1-richard.henderson@linaro.org>
 <20211117160412.71563-6-richard.henderson@linaro.org>
In-Reply-To: <20211117160412.71563-6-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 17 Nov 2021 09:31:37 -0700
Message-ID: <CANCZdfpbfc8-4aCsSO-fp9AeQDeg3T17iHzfXXxuQHn3RrKHyA@mail.gmail.com>
Subject: Re: [PATCH v5 05/17] common-user/host/mips: Add safe-syscall.inc.S
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000029bce05d0fe94d5"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::92b;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92b.google.com
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

--000000000000029bce05d0fe94d5
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 9:04 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  common-user/host/mips/hostdep.h          |   2 +
>  common-user/host/mips/safe-syscall.inc.S | 135 +++++++++++++++++++++++
>  2 files changed, 137 insertions(+)
>  create mode 100644 common-user/host/mips/hostdep.h
>  create mode 100644 common-user/host/mips/safe-syscall.inc.S
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/common-user/host/mips/hostdep.h
> b/common-user/host/mips/hostdep.h
> new file mode 100644
> index 0000000000..b18aca1deb
> --- /dev/null
> +++ b/common-user/host/mips/hostdep.h
> @@ -0,0 +1,2 @@
> +/* We have a safe-syscall.inc.S */
> +#define HAVE_SAFE_SYSCALL
> diff --git a/common-user/host/mips/safe-syscall.inc.S
> b/common-user/host/mips/safe-syscall.inc.S
> new file mode 100644
> index 0000000000..1e2f5a079c
> --- /dev/null
> +++ b/common-user/host/mips/safe-syscall.inc.S
> @@ -0,0 +1,135 @@
> +/*
> + * safe-syscall.inc.S : host-specific assembly fragment
> + * to handle signals occurring at the same time as system calls.
> + * This is intended to be included by linux-user/safe-syscall.S
> + *
> + * Written by Richard Henderson <rth@twiddle.net>
> + * Copyright (C) 2021 Linaro, Inc.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "sys/regdef.h"
> +#include "sys/asm.h"
> +
> +       .text
> +       .set    nomips16
> +       .set    noreorder
> +
> +       .global safe_syscall_start
> +       .global safe_syscall_end
> +       .type   safe_syscall_start, @function
> +       .type   safe_syscall_end, @function
> +
> +       /*
> +        * This is the entry point for making a system call. The calling
> +        * convention here is that of a C varargs function with the
> +        * first argument an 'int *' to the signal_pending flag, the
> +        * second one the system call number (as a 'long'), and all further
> +        * arguments being syscall arguments (also 'long').
> +        */
> +
> +#if _MIPS_SIM == _ABIO32
> +/* Do not allocate a stack frame and store into the parameter space. */
> +#define FRAME   0
> +#define ERRNOP  4
> +#else
> +/* Allocate a stack frame and store into the first allocated slot. */
> +#define FRAME   16
> +#define ERRNOP  0
> +#endif
> +
> +NESTED(safe_syscall_base, FRAME, ra)
> +       .cfi_startproc
> +#if _MIPS_SIM == _ABIO32
> +       /*
> +        * The syscall calling convention is nearly the same as C:
> +        * we enter with a0 == &signal_pending
> +        *               a1 == &errno
> +        *               a2 == syscall number
> +        *               a3, stack == syscall arguments
> +        *               and return the result in a0
> +        * and the syscall instruction needs
> +        *               v0 == syscall number
> +        *               a0 ... a3, stack == syscall arguments
> +        *               and returns the result in v0
> +        * Shuffle everything around appropriately.
> +        */
> +       move    t0, a0          /* signal_pending pointer */
> +       sw      a1, ERRNOP(sp)  /* errno pointer */
> +       move    v0, a2          /* syscall number */
> +       move    a0, a3          /* syscall arguments */
> +       lw      a1, 16(sp)
> +       lw      a2, 20(sp)
> +       lw      a3, 24(sp)
> +       lw      t4, 28(sp)
> +       lw      t5, 32(sp)
> +       lw      t6, 40(sp)
> +       lw      t7, 44(sp)
> +       sw      t4, 16(sp)
> +       sw      t5, 20(sp)
> +       sw      t6, 24(sp)
> +       sw      t7, 28(sp)
> +#else
> +       PTR_ADDIU sp, sp, -FRAME
> +       .cfi_adjust_cfa_offset FRAME
> +
> +       /*
> +        * The syscall calling convention is nearly the same as C:
> +        * we enter with a0 == &signal_pending
> +        *               a1 == &errno
> +        *               a2 == syscall number
> +        *               a3 ... a7, stack == syscall arguments
> +        *               and return the result in a0
> +        * and the syscall instruction needs
> +        *               v0 == syscall number
> +        *               a0 ... a5 == syscall arguments
> +        *               and returns the result in v0
> +        * Shuffle everything around appropriately.
> +        */
> +       move    t0, a0          /* signal_pending pointer */
> +       PTR_S   a1, ERRNOP(sp)  /* save errno pointer */
> +       move    v0, a2          /* syscall number */
> +       move    a0, a3          /* syscall arguments */
> +       move    a1, a4
> +       move    a2, a5
> +       move    a3, a6
> +       move    a4, a7
> +       ld      a5, 16(sp)
> +#endif
> +
> +       /*
> +        * This next sequence of code works in conjunction with the
> +        * rewind_if_safe_syscall_function(). If a signal is taken
> +        * and the interrupted PC is anywhere between 'safe_syscall_start'
> +        * and 'safe_syscall_end' then we rewind it to
> 'safe_syscall_start'.
> +        * The code sequence must therefore be able to cope with this, and
> +        * the syscall instruction must be the final one in the sequence.
> +        */
> +safe_syscall_start:
> +       /* If signal_pending is non-zero, don't do the call */
> +       lw      t1, 0(t0)
> +       bnez    t1, 0f
> +        nop
> +       syscall
> +safe_syscall_end:
> +
> +       /* code path for having successfully executed the syscall */
> +       bnez    a3, 1f
> +        nop
> +       jr      ra
> +        PTR_ADDIU sp, sp, FRAME
> +
> +       /* code path when we didn't execute the syscall */
> +0:     li      v0, TARGET_ERESTARTSYS
> +
> +       /* code path setting errno */
> +1:     PTR_L   t0, ERRNOP(sp)
> +       sw      v0, 0(t0)               /* store errno */
> +       li      v0, -1
> +       jr      ra
> +        PTR_ADDIU sp, sp, FRAME
> +
> +       .cfi_endproc
> +END(safe_syscall_base)
> --
> 2.25.1
>
>

--000000000000029bce05d0fe94d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 9:04 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:ri=
chard.henderson@linaro.org" target=3D"_blank">richard.henderson@linaro.org<=
/a>&gt;<br>
---<br>
=C2=A0common-user/host/mips/hostdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +<br>
=C2=A0common-user/host/mips/safe-syscall.inc.S | 135 ++++++++++++++++++++++=
+<br>
=C2=A02 files changed, 137 insertions(+)<br>
=C2=A0create mode 100644 common-user/host/mips/hostdep.h<br>
=C2=A0create mode 100644 common-user/host/mips/safe-syscall.inc.S<br></bloc=
kquote><div><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:i=
mp@bsdimp.com">imp@bsdimp.com</a>&gt;</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
diff --git a/common-user/host/mips/hostdep.h b/common-user/host/mips/hostde=
p.h<br>
new file mode 100644<br>
index 0000000000..b18aca1deb<br>
--- /dev/null<br>
+++ b/common-user/host/mips/hostdep.h<br>
@@ -0,0 +1,2 @@<br>
+/* We have a safe-syscall.inc.S */<br>
+#define HAVE_SAFE_SYSCALL<br>
diff --git a/common-user/host/mips/safe-syscall.inc.S b/common-user/host/mi=
ps/safe-syscall.inc.S<br>
new file mode 100644<br>
index 0000000000..1e2f5a079c<br>
--- /dev/null<br>
+++ b/common-user/host/mips/safe-syscall.inc.S<br>
@@ -0,0 +1,135 @@<br>
+/*<br>
+ * safe-syscall.inc.S : host-specific assembly fragment<br>
+ * to handle signals occurring at the same time as system calls.<br>
+ * This is intended to be included by linux-user/safe-syscall.S<br>
+ *<br>
+ * Written by Richard Henderson &lt;<a href=3D"mailto:rth@twiddle.net" tar=
get=3D"_blank">rth@twiddle.net</a>&gt;<br>
+ * Copyright (C) 2021 Linaro, Inc.<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#include &quot;sys/regdef.h&quot;<br>
+#include &quot;sys/asm.h&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.text<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.set=C2=A0 =C2=A0 nomips16<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.set=C2=A0 =C2=A0 noreorder<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.global safe_syscall_start<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.global safe_syscall_end<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.type=C2=A0 =C2=A0safe_syscall_start, @function=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.type=C2=A0 =C2=A0safe_syscall_end, @function<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * This is the entry point for making a system =
call. The calling<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * convention here is that of a C varargs funct=
ion with the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * first argument an &#39;int *&#39; to the sig=
nal_pending flag, the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * second one the system call number (as a &#39=
;long&#39;), and all further<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * arguments being syscall arguments (also &#39=
;long&#39;).<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+<br>
+#if _MIPS_SIM =3D=3D _ABIO32<br>
+/* Do not allocate a stack frame and store into the parameter space. */<br=
>
+#define FRAME=C2=A0 =C2=A00<br>
+#define ERRNOP=C2=A0 4<br>
+#else<br>
+/* Allocate a stack frame and store into the first allocated slot. */<br>
+#define FRAME=C2=A0 =C2=A016<br>
+#define ERRNOP=C2=A0 0<br>
+#endif<br>
+<br>
+NESTED(safe_syscall_base, FRAME, ra)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_startproc<br>
+#if _MIPS_SIM =3D=3D _ABIO32<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The syscall calling convention is nearly the=
 same as C:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * we enter with a0 =3D=3D &amp;signal_pending<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0a1 =3D=3D &amp;errno<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0a2 =3D=3D syscall number<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0a3, stack =3D=3D syscall arguments<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0and return the result in a0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * and the syscall instruction needs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0v0 =3D=3D syscall number<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0a0 ... a3, stack =3D=3D syscall arguments<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0and returns the result in v0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Shuffle everything around appropriately.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0move=C2=A0 =C2=A0 t0, a0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* signal_pending pointer */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sw=C2=A0 =C2=A0 =C2=A0 a1, ERRNOP(sp)=C2=A0 /* =
errno pointer */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0move=C2=A0 =C2=A0 v0, a2=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* syscall number */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0move=C2=A0 =C2=A0 a0, a3=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* syscall arguments */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lw=C2=A0 =C2=A0 =C2=A0 a1, 16(sp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lw=C2=A0 =C2=A0 =C2=A0 a2, 20(sp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lw=C2=A0 =C2=A0 =C2=A0 a3, 24(sp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lw=C2=A0 =C2=A0 =C2=A0 t4, 28(sp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lw=C2=A0 =C2=A0 =C2=A0 t5, 32(sp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lw=C2=A0 =C2=A0 =C2=A0 t6, 40(sp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lw=C2=A0 =C2=A0 =C2=A0 t7, 44(sp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sw=C2=A0 =C2=A0 =C2=A0 t4, 16(sp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sw=C2=A0 =C2=A0 =C2=A0 t5, 20(sp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sw=C2=A0 =C2=A0 =C2=A0 t6, 24(sp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sw=C2=A0 =C2=A0 =C2=A0 t7, 28(sp)<br>
+#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PTR_ADDIU sp, sp, -FRAME<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_adjust_cfa_offset FRAME<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The syscall calling convention is nearly the=
 same as C:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * we enter with a0 =3D=3D &amp;signal_pending<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0a1 =3D=3D &amp;errno<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0a2 =3D=3D syscall number<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0a3 ... a7, stack =3D=3D syscall arguments<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0and return the result in a0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * and the syscall instruction needs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0v0 =3D=3D syscall number<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0a0 ... a5 =3D=3D syscall arguments<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0and returns the result in v0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Shuffle everything around appropriately.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0move=C2=A0 =C2=A0 t0, a0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* signal_pending pointer */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PTR_S=C2=A0 =C2=A0a1, ERRNOP(sp)=C2=A0 /* save =
errno pointer */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0move=C2=A0 =C2=A0 v0, a2=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* syscall number */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0move=C2=A0 =C2=A0 a0, a3=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* syscall arguments */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0move=C2=A0 =C2=A0 a1, a4<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0move=C2=A0 =C2=A0 a2, a5<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0move=C2=A0 =C2=A0 a3, a6<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0move=C2=A0 =C2=A0 a4, a7<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ld=C2=A0 =C2=A0 =C2=A0 a5, 16(sp)<br>
+#endif<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * This next sequence of code works in conjunct=
ion with the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * rewind_if_safe_syscall_function(). If a sign=
al is taken<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * and the interrupted PC is anywhere between &=
#39;safe_syscall_start&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * and &#39;safe_syscall_end&#39; then we rewin=
d it to &#39;safe_syscall_start&#39;.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The code sequence must therefore be able to =
cope with this, and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * the syscall instruction must be the final on=
e in the sequence.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+safe_syscall_start:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* If signal_pending is non-zero, don&#39;t do =
the call */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lw=C2=A0 =C2=A0 =C2=A0 t1, 0(t0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bnez=C2=A0 =C2=A0 t1, 0f<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 nop<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0syscall<br>
+safe_syscall_end:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* code path for having successfully executed t=
he syscall */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bnez=C2=A0 =C2=A0 a3, 1f<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 nop<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jr=C2=A0 =C2=A0 =C2=A0 ra<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 PTR_ADDIU sp, sp, FRAME<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* code path when we didn&#39;t execute the sys=
call */<br>
+0:=C2=A0 =C2=A0 =C2=A0li=C2=A0 =C2=A0 =C2=A0 v0, TARGET_ERESTARTSYS<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* code path setting errno */<br>
+1:=C2=A0 =C2=A0 =C2=A0PTR_L=C2=A0 =C2=A0t0, ERRNOP(sp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sw=C2=A0 =C2=A0 =C2=A0 v0, 0(t0)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* store errno */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0li=C2=A0 =C2=A0 =C2=A0 v0, -1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jr=C2=A0 =C2=A0 =C2=A0 ra<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 PTR_ADDIU sp, sp, FRAME<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_endproc<br>
+END(safe_syscall_base)<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000029bce05d0fe94d5--

