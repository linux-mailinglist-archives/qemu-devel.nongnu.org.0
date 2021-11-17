Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4956454BEC
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 18:25:05 +0100 (CET)
Received: from localhost ([::1]:44216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnOgC-0007kc-HI
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 12:25:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnOcf-00034y-AC
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:21:26 -0500
Received: from [2607:f8b0:4864:20::92e] (port=33523
 helo=mail-ua1-x92e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnOcc-00072d-HT
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:21:25 -0500
Received: by mail-ua1-x92e.google.com with SMTP id b17so7659223uas.0
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 09:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NfK8JGMgCQotusN9QdWXEAcrpBd9tC7umzRKw1uIE5U=;
 b=nrzm8xg18mXUKWOxue9bpC6lOM9Q1n6M6GJXgEwZEpV4rOTX7l298PR7sGXhyX4SQP
 oMgyfl9qSl+7vwvyO+kh1B53PtLoedTdvrMxRz3sLbFFYwzS4jnfb2dZEmXIZCv2cqPs
 pnLOJfMmEBFuNNaSucg7J8RpT60V6CATCsXv7JF85HcXNmHxZ2GN0cYjXoFO3nxim8Vk
 TEy1yloikBCzxQlXluOBFYKGjBwX3pldA3ldr6v7RJSFDi+I2saKhIWkg1gLrQdRNHIw
 fNhk+/Sb92xMlhnQ1JxmzI4Pr5ftazsnAdN0b8XybiJWAS0nUUGpr5A5dJlDdtkIdRHD
 CbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NfK8JGMgCQotusN9QdWXEAcrpBd9tC7umzRKw1uIE5U=;
 b=AzKVIiWSHzioHGCpaVohw3kcjc97ceCjm5xFSY2mZYVpzJGirwVZk25MpSov7isEb0
 i+vC/jWYxiM0WJHp0wViY8LkzB8I7eFhmMuGk/NozKyCNi0Ptq9eK+6lnECQyEcAK3FL
 l7XL+zf/OfpPVCk8qaqzWbv4pje78ePOvSiqyVPD8AwELQEzORsaqLgkY6RKQ4cLsuMd
 80SUUpMSOAZe1jGJH4oPS2bBD9FMsJXl4kLlXLmREA7LWSR7rEEoDN9cMx13zhRvf6Rr
 YYw4UpbVV+VJqFhdeIokkqRSluvG9J7mIJz9Q6FbtBMwsl4RSTi24GMhMlTq8PyJYbMl
 LPSA==
X-Gm-Message-State: AOAM530IiMBKN/b9a3QQZV7C2NGHAW326qum+fksoTDtWJZHz+F3JGoh
 NNRBnAKOs8TiSME7MADOH1EZWxQ74IT9L8R/Oz5AgQ==
X-Google-Smtp-Source: ABdhPJwMQ3+AEOEyIE4blYL7BfMiZSXBU+RXQ7Atm7bKmONtnrMnfUaIFhZywRD92oS2mfS6XTqRc6r4kxPWE27+3xI=
X-Received: by 2002:a67:ab48:: with SMTP id k8mr70968423vsh.30.1637169681216; 
 Wed, 17 Nov 2021 09:21:21 -0800 (PST)
MIME-Version: 1.0
References: <20211117160412.71563-1-richard.henderson@linaro.org>
 <20211117160412.71563-12-richard.henderson@linaro.org>
In-Reply-To: <20211117160412.71563-12-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 17 Nov 2021 10:21:05 -0700
Message-ID: <CANCZdfoiR8ATeYv1xEtBqcJS=rLTpJ-JqEEqi39Bd5i6=WrvhQ@mail.gmail.com>
Subject: Re: [PATCH v5 11/17] bsd-user: Create special-errno.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000494df405d0ff4562"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::92e;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92e.google.com
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

--000000000000494df405d0ff4562
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 9:04 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Pull the internal errno used by qemu internally its own
> header file, for use by safe-syscall.S.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/errno_defs.h    |  6 +++++-
>  bsd-user/special-errno.h | 24 ++++++++++++++++++++++++
>  2 files changed, 29 insertions(+), 1 deletion(-)
>  create mode 100644 bsd-user/special-errno.h
>

Reviewed by: Warner Losh <imp@bsdimp.com>



> diff --git a/bsd-user/errno_defs.h b/bsd-user/errno_defs.h
> index 583ebe8cee..73cfa24b7f 100644
> --- a/bsd-user/errno_defs.h
> +++ b/bsd-user/errno_defs.h
> @@ -151,6 +151,10 @@
>  /* Internal errors: */
>  #define TARGET_EJUSTRETURN      254             /* Just return without
> modifing regs */
>  #define TARGET_ERESTART         255             /* Restart syscall */
> -#define QEMU_ERESTARTSYS        TARGET_ERESTART /* compat */
> +
> +#include "special-errno.h"
> +
> +_Static_assert(TARGET_ERESTART == QEMU_ERESTARTSYS,
> +               "TARGET_ERESTART and QEMU_ERESTARTSYS expected to match");
>
>  #endif /* !  _ERRNO_DEFS_H_ */
> diff --git a/bsd-user/special-errno.h b/bsd-user/special-errno.h
> new file mode 100644
> index 0000000000..03599d9b5a
> --- /dev/null
> +++ b/bsd-user/special-errno.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: BSD-3-Clause */
> +/*
> + * QEMU internal errno values for implementing user-only POSIX.
> + *
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
> +#define QEMU_ERESTARTSYS  255
> +
> +#endif /* SPECIAL_ERRNO_H */
> --
> 2.25.1
>
>

--000000000000494df405d0ff4562
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 9:04 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Pull the internal errno used by qemu internally its own<b=
r>
header file, for use by safe-syscall.S.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0bsd-user/errno_defs.h=C2=A0 =C2=A0 |=C2=A0 6 +++++-<br>
=C2=A0bsd-user/special-errno.h | 24 ++++++++++++++++++++++++<br>
=C2=A02 files changed, 29 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 bsd-user/special-errno.h<br></blockquote><div><br>=
</div><div>Reviewed by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">i=
mp@bsdimp.com</a>&gt;</div><div><br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
diff --git a/bsd-user/errno_defs.h b/bsd-user/errno_defs.h<br>
index 583ebe8cee..73cfa24b7f 100644<br>
--- a/bsd-user/errno_defs.h<br>
+++ b/bsd-user/errno_defs.h<br>
@@ -151,6 +151,10 @@<br>
=C2=A0/* Internal errors: */<br>
=C2=A0#define TARGET_EJUSTRETURN=C2=A0 =C2=A0 =C2=A0 254=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Just return without modifing regs */<br>
=C2=A0#define TARGET_ERESTART=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0255=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Restart syscall */<br>
-#define QEMU_ERESTARTSYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 TARGET_ERESTART /* com=
pat */<br>
+<br>
+#include &quot;special-errno.h&quot;<br>
+<br>
+_Static_assert(TARGET_ERESTART =3D=3D QEMU_ERESTARTSYS,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;TARGET_ERESTA=
RT and QEMU_ERESTARTSYS expected to match&quot;);<br>
<br>
=C2=A0#endif /* !=C2=A0 _ERRNO_DEFS_H_ */<br>
diff --git a/bsd-user/special-errno.h b/bsd-user/special-errno.h<br>
new file mode 100644<br>
index 0000000000..03599d9b5a<br>
--- /dev/null<br>
+++ b/bsd-user/special-errno.h<br>
@@ -0,0 +1,24 @@<br>
+/* SPDX-License-Identifier: BSD-3-Clause */<br>
+/*<br>
+ * QEMU internal errno values for implementing user-only POSIX.<br>
+ *<br>
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
+#define QEMU_ERESTARTSYS=C2=A0 255<br>
+<br>
+#endif /* SPECIAL_ERRNO_H */<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000494df405d0ff4562--

