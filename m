Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E41454BE2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 18:24:08 +0100 (CET)
Received: from localhost ([::1]:41302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnOfG-0005n2-B4
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 12:24:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnOdF-0003oq-Re
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:22:03 -0500
Received: from [2607:f8b0:4864:20::92a] (port=41542
 helo=mail-ua1-x92a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnOdC-0007BK-GY
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:22:00 -0500
Received: by mail-ua1-x92a.google.com with SMTP id p37so7502413uae.8
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 09:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k1ZFxCEQB2AcA/tIvHdh+M4Bo+shzCF6XY4aE+mD34Y=;
 b=h/A/VrJydCv4fxdncRRSU8EwGFQVU5KQknm8eiO39bpGaAN8rMAP/gm4sp9boKRcSd
 MDp/pFzJKTbgrKxzlxcfimL8yDHo9I+bni+mk6/uYOga7kFJvgxpNurluUvwh/pgT58X
 tM34fsTl9x14+VNGBSfaeTwd9xSPb2a96A1KvE7jjniX3cR7li7F+TRTEtfhTKqVg4mB
 Sm2ROqli+ZoWXXbZfdEepHaqSmpRecBcLb0usQiacjSmOAlP20D5mdXJLcVF8K1644Wi
 v7Tq3t5YFBW9OB7oAcLn0tf0x3VxT446zPAzzF+QPUGfdIcfaOO2XLnDh1lWhvSHrHXR
 123Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k1ZFxCEQB2AcA/tIvHdh+M4Bo+shzCF6XY4aE+mD34Y=;
 b=6NQh9UAm8+sTBJsOXaQi5PkfUIOwdC+aDgHD5qvi/ObqSQAvsI+N4kg/FBYJo1F0Sp
 sZ/ZHEQymHtSpcAQyVBDDyxS/rvt4eXFLc3AjyuSTG9UmD+uQSXp2L8pkpEDbuq0Mq4U
 F6J7OrvblJH9ctAyVTziQINwOta7nTx0FFHl1h66x+d481Wdc+ovKxZj2M5Xilq7fHwF
 9ueoPCI958LS6dsyipN/ygitQj+qxeNTck313nquqn7tmcO8HEKFtEb0BQLsVOdoGisG
 yEYoUqmKqh+KxbkeZ1WosXJYVcAQQDEIOEN48sqUCBX5+A8PxEUIk2fzwZotHeVqsNs5
 UFFQ==
X-Gm-Message-State: AOAM5305LFpAXBK1XJjSQIZNAcwT+8tSWKZKBzl+HJP0PJzPI7ene770
 hUCWU+PS7FtU7jG/BULUIQNsykiKV4oy5TAde16bAw==
X-Google-Smtp-Source: ABdhPJxihlPWToXRTw1d3lonvztDe+3gAb0f1LhFTDYxd2BSprrWEHd6JRh0+oPfrYfLMIGRxuLLNX/z2nlH1mbaQBA=
X-Received: by 2002:a67:e050:: with SMTP id n16mr70380758vsl.44.1637169717524; 
 Wed, 17 Nov 2021 09:21:57 -0800 (PST)
MIME-Version: 1.0
References: <20211117160412.71563-1-richard.henderson@linaro.org>
 <20211117160412.71563-13-richard.henderson@linaro.org>
In-Reply-To: <20211117160412.71563-13-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 17 Nov 2021 10:21:47 -0700
Message-ID: <CANCZdfrt0Nr-7M_SwTRO3m7zZ3WqxQdOPAEfyMemyTJYG-COCQ@mail.gmail.com>
Subject: Re: [PATCH v5 12/17] linux-user: Create special-errno.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000007350d305d0ff4745"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::92a;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92a.google.com
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

--0000000000007350d305d0ff4745
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 9:04 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Pull the two internal errno used by qemu internally into their own
> header file.  This includes the one define required by safe-syscall.S.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/cpu_loop-common.h           |  1 +
>  linux-user/generic/target_errno_defs.h | 17 --------------
>  linux-user/signal-common.h             |  2 ++
>  linux-user/special-errno.h             | 32 ++++++++++++++++++++++++++
>  linux-user/syscall.c                   |  1 +
>  linux-user/safe-syscall.S              |  2 +-
>  6 files changed, 37 insertions(+), 18 deletions(-)
>  create mode 100644 linux-user/special-errno.h
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/linux-user/cpu_loop-common.h b/linux-user/cpu_loop-common.h
> index 8828af28a4..dc0042e4de 100644
> --- a/linux-user/cpu_loop-common.h
> +++ b/linux-user/cpu_loop-common.h
> @@ -21,6 +21,7 @@
>  #define CPU_LOOP_COMMON_H
>
>  #include "exec/log.h"
> +#include "special-errno.h"
>
>  #define EXCP_DUMP(env, fmt, ...)                                        \
>  do {                                                                    \
> diff --git a/linux-user/generic/target_errno_defs.h
> b/linux-user/generic/target_errno_defs.h
> index bb37d88be9..c2f9d403e7 100644
> --- a/linux-user/generic/target_errno_defs.h
> +++ b/linux-user/generic/target_errno_defs.h
> @@ -147,21 +147,4 @@
>  #define TARGET_ERFKILL         132     /* Operation not possible due to
> RF-kill */
>  #define TARGET_EHWPOISON       133     /* Memory page has hardware error
> */
>
> -/* QEMU internal, not visible to the guest. This is returned when a
> - * system call should be restarted, to tell the main loop that it
> - * should wind the guest PC backwards so it will re-execute the syscall
> - * after handling any pending signals. They match with the ones the guest
> - * kernel uses for the same purpose.
> - */
> -#define QEMU_ERESTARTSYS     512     /* Restart system call (if
> SA_RESTART) */
> -
> -/* QEMU internal, not visible to the guest. This is returned by the
> - * do_sigreturn() code after a successful sigreturn syscall, to indicate
> - * that it has correctly set the guest registers and so the main loop
> - * should not touch them. We use the value the guest would use for
> - * ERESTART_NOINTR (which is kernel internal) to guarantee that we won't
> - * clash with a valid guest errno now or in the future.
> - */
> -#define QEMU_ESIGRETURN 513     /* Return from signal */
> -
>  #endif
> diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
> index b9f33bb44f..42aa479080 100644
> --- a/linux-user/signal-common.h
> +++ b/linux-user/signal-common.h
> @@ -20,6 +20,8 @@
>  #ifndef SIGNAL_COMMON_H
>  #define SIGNAL_COMMON_H
>
> +#include "special-errno.h"
> +
>  /* Fallback addresses into sigtramp page. */
>  extern abi_ulong default_sigreturn;
>  extern abi_ulong default_rt_sigreturn;
> diff --git a/linux-user/special-errno.h b/linux-user/special-errno.h
> new file mode 100644
> index 0000000000..4120455baa
> --- /dev/null
> +++ b/linux-user/special-errno.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * QEMU internal errno values for implementing user-only POSIX.
> + *
> + *  Copyright (c) 2003 Fabrice Bellard
> + *  Copyright (c) 2021 Linaro, Ltd.
> + */
> +
> +#ifndef SPECIAL_ERRNO_H
> +#define SPECIAL_ERRNO_H
> +
> +/*
> + * All of these are QEMU internal, not visible to the guest.
> + * They should be chosen so as to not overlap with any host
> + * or guest errno.
> + */
> +
> +/*
> + * This is returned when a system call should be restarted, to tell the
> + * main loop that it should wind the guest PC backwards so it will
> + * re-execute the syscall after handling any pending signals.
> + */
> +#define QEMU_ERESTARTSYS  512
> +
> +/*
> + * This is returned after a successful sigreturn syscall, to indicate
> + * that it has correctly set the guest registers and so the main loop
> + * should not touch them.
> + */
> +#define QEMU_ESIGRETURN   513
> +
> +#endif /* SPECIAL_ERRNO_H */
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 1ef6abb776..33d342157d 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -136,6 +136,7 @@
>  #include "qemu/guest-random.h"
>  #include "qemu/selfmap.h"
>  #include "user/syscall-trace.h"
> +#include "special-errno.h"
>  #include "qapi/error.h"
>  #include "fd-trans.h"
>  #include "tcg/tcg.h"
> diff --git a/linux-user/safe-syscall.S b/linux-user/safe-syscall.S
> index 7ddc997801..74f7e35694 100644
> --- a/linux-user/safe-syscall.S
> +++ b/linux-user/safe-syscall.S
> @@ -10,7 +10,7 @@
>   * See the COPYING file in the top-level directory.
>   */
>
> -#include "target_errno_defs.h"
> +#include "special-errno.h"
>
>  /* We have the correct host directory on our include path
>   * so that this will pull in the right fragment for the architecture.
> --
> 2.25.1
>
>

--0000000000007350d305d0ff4745
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 9:04 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Pull the two internal errno used by qemu internally into =
their own<br>
header file.=C2=A0 This includes the one define required by safe-syscall.S.=
<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0linux-user/cpu_loop-common.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 1 +<br>
=C2=A0linux-user/generic/target_errno_defs.h | 17 --------------<br>
=C2=A0linux-user/signal-common.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 ++<br>
=C2=A0linux-user/special-errno.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 32 ++++++++++++++++++++++++++<br>
=C2=A0linux-user/syscall.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0linux-user/safe-syscall.S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
=C2=A06 files changed, 37 insertions(+), 18 deletions(-)<br>
=C2=A0create mode 100644 linux-user/special-errno.h<br></blockquote><div><b=
r></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com"=
>imp@bsdimp.com</a>&gt;</div><div>=C2=A0<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
diff --git a/linux-user/cpu_loop-common.h b/linux-user/cpu_loop-common.h<br=
>
index 8828af28a4..dc0042e4de 100644<br>
--- a/linux-user/cpu_loop-common.h<br>
+++ b/linux-user/cpu_loop-common.h<br>
@@ -21,6 +21,7 @@<br>
=C2=A0#define CPU_LOOP_COMMON_H<br>
<br>
=C2=A0#include &quot;exec/log.h&quot;<br>
+#include &quot;special-errno.h&quot;<br>
<br>
=C2=A0#define EXCP_DUMP(env, fmt, ...)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
diff --git a/linux-user/generic/target_errno_defs.h b/linux-user/generic/ta=
rget_errno_defs.h<br>
index bb37d88be9..c2f9d403e7 100644<br>
--- a/linux-user/generic/target_errno_defs.h<br>
+++ b/linux-user/generic/target_errno_defs.h<br>
@@ -147,21 +147,4 @@<br>
=C2=A0#define TARGET_ERFKILL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0132=C2=A0 =C2=
=A0 =C2=A0/* Operation not possible due to RF-kill */<br>
=C2=A0#define TARGET_EHWPOISON=C2=A0 =C2=A0 =C2=A0 =C2=A0133=C2=A0 =C2=A0 =
=C2=A0/* Memory page has hardware error */<br>
<br>
-/* QEMU internal, not visible to the guest. This is returned when a<br>
- * system call should be restarted, to tell the main loop that it<br>
- * should wind the guest PC backwards so it will re-execute the syscall<br=
>
- * after handling any pending signals. They match with the ones the guest<=
br>
- * kernel uses for the same purpose.<br>
- */<br>
-#define QEMU_ERESTARTSYS=C2=A0 =C2=A0 =C2=A0512=C2=A0 =C2=A0 =C2=A0/* Rest=
art system call (if SA_RESTART) */<br>
-<br>
-/* QEMU internal, not visible to the guest. This is returned by the<br>
- * do_sigreturn() code after a successful sigreturn syscall, to indicate<b=
r>
- * that it has correctly set the guest registers and so the main loop<br>
- * should not touch them. We use the value the guest would use for<br>
- * ERESTART_NOINTR (which is kernel internal) to guarantee that we won&#39=
;t<br>
- * clash with a valid guest errno now or in the future.<br>
- */<br>
-#define QEMU_ESIGRETURN 513=C2=A0 =C2=A0 =C2=A0/* Return from signal */<br=
>
-<br>
=C2=A0#endif<br>
diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h<br>
index b9f33bb44f..42aa479080 100644<br>
--- a/linux-user/signal-common.h<br>
+++ b/linux-user/signal-common.h<br>
@@ -20,6 +20,8 @@<br>
=C2=A0#ifndef SIGNAL_COMMON_H<br>
=C2=A0#define SIGNAL_COMMON_H<br>
<br>
+#include &quot;special-errno.h&quot;<br>
+<br>
=C2=A0/* Fallback addresses into sigtramp page. */<br>
=C2=A0extern abi_ulong default_sigreturn;<br>
=C2=A0extern abi_ulong default_rt_sigreturn;<br>
diff --git a/linux-user/special-errno.h b/linux-user/special-errno.h<br>
new file mode 100644<br>
index 0000000000..4120455baa<br>
--- /dev/null<br>
+++ b/linux-user/special-errno.h<br>
@@ -0,0 +1,32 @@<br>
+/* SPDX-License-Identifier: GPL-2.0-or-later */<br>
+/*<br>
+ * QEMU internal errno values for implementing user-only POSIX.<br>
+ *<br>
+ *=C2=A0 Copyright (c) 2003 Fabrice Bellard<br>
+ *=C2=A0 Copyright (c) 2021 Linaro, Ltd.<br>
+ */<br>
+<br>
+#ifndef SPECIAL_ERRNO_H<br>
+#define SPECIAL_ERRNO_H<br>
+<br>
+/*<br>
+ * All of these are QEMU internal, not visible to the guest.<br>
+ * They should be chosen so as to not overlap with any host<br>
+ * or guest errno.<br>
+ */<br>
+<br>
+/*<br>
+ * This is returned when a system call should be restarted, to tell the<br=
>
+ * main loop that it should wind the guest PC backwards so it will<br>
+ * re-execute the syscall after handling any pending signals.<br>
+ */<br>
+#define QEMU_ERESTARTSYS=C2=A0 512<br>
+<br>
+/*<br>
+ * This is returned after a successful sigreturn syscall, to indicate<br>
+ * that it has correctly set the guest registers and so the main loop<br>
+ * should not touch them.<br>
+ */<br>
+#define QEMU_ESIGRETURN=C2=A0 =C2=A0513<br>
+<br>
+#endif /* SPECIAL_ERRNO_H */<br>
diff --git a/linux-user/syscall.c b/linux-user/syscall.c<br>
index 1ef6abb776..33d342157d 100644<br>
--- a/linux-user/syscall.c<br>
+++ b/linux-user/syscall.c<br>
@@ -136,6 +136,7 @@<br>
=C2=A0#include &quot;qemu/guest-random.h&quot;<br>
=C2=A0#include &quot;qemu/selfmap.h&quot;<br>
=C2=A0#include &quot;user/syscall-trace.h&quot;<br>
+#include &quot;special-errno.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;fd-trans.h&quot;<br>
=C2=A0#include &quot;tcg/tcg.h&quot;<br>
diff --git a/linux-user/safe-syscall.S b/linux-user/safe-syscall.S<br>
index 7ddc997801..74f7e35694 100644<br>
--- a/linux-user/safe-syscall.S<br>
+++ b/linux-user/safe-syscall.S<br>
@@ -10,7 +10,7 @@<br>
=C2=A0 * See the COPYING file in the top-level directory.<br>
=C2=A0 */<br>
<br>
-#include &quot;target_errno_defs.h&quot;<br>
+#include &quot;special-errno.h&quot;<br>
<br>
=C2=A0/* We have the correct host directory on our include path<br>
=C2=A0 * so that this will pull in the right fragment for the architecture.=
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000007350d305d0ff4745--

