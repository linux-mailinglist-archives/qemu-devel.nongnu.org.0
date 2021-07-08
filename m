Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7733C15B7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:12:03 +0200 (CEST)
Received: from localhost ([::1]:37300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Vh4-0006sv-P2
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m1VgC-0006EI-UR
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:11:08 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:35691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m1Vg3-0005jV-7M
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:11:07 -0400
Received: by mail-ej1-x62d.google.com with SMTP id gn32so10256210ejc.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5Y7KfHfolMjG0cBIzC1fVrNRzar84op7CtrF8nIEW38=;
 b=dodtBLagIouKICbJOx3ERv05pU54FVBfONFTeDr6/ft82f7MIhQyTxyUqgQXWTMvXL
 9wBkKC0xKCpr9Q7rNQ4iop5Et/RayVTX/mT1NQCE3U9tADbFOu8zObATEOl5mY/4+fRp
 qKsaSxbuF5WyAy5QVsbN482B08EwPp21AiGA44FqcSRmBSqA5bMwrXdnBDKMB4ixWrLd
 XuosNwN2t2jFnruIwhGrBSL/uYeR/7On00g6wsoIsgzckvCkDDlbSLCXcCko9ooDxqmN
 wpntEOgsJyb+h3cpLuxphZVUl/BsxIS3NtR/juYXAbO2eg++nLilw78rO4bZXj1lkJtb
 4HPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Y7KfHfolMjG0cBIzC1fVrNRzar84op7CtrF8nIEW38=;
 b=MwtGGkw1unTs7On1RDQw9fgTcRFoPMcjOuV0zG05hCslZP7+7DAsg27KbzC2E4Uo56
 CzTEw7GZBQYBLysOnzameX7rjE2Wqr1KkNubNCil+c4d8MHnCmtPHeVBn9hX71g9FviG
 KBOO6QG4yaKKMl68DOQD65s8EcGUkJXwfneBWdZaF290kA+hdWNR0ZTEn3QL8gEWQbe2
 AgY5rbTeQhK0N9ewLx28sae5zrP6eBTlPPf+a8rd3YUZ6Bfby4AKCoSaiShGxTPZv+TD
 5i0WwNdCiyR3FPsevN2SqlMsHHa62nLZQHhChIwvgfURyLPU8+pCZH5Tmh4pNy41Vjc5
 lOhQ==
X-Gm-Message-State: AOAM531VknOyABRiQp6lSt+gI23acba3FDMQ/iYtysfMdeGdjuOjKhfB
 QdkHKQknADHAtbwpJNc9Vf7o8zJHJ7ysdjKpXL8=
X-Google-Smtp-Source: ABdhPJxt0+JIuzGyNGMb0cXcAA2hlzRBqZVcmiAxr2v8md548hMvg5pnXOxY5Cks6bjPbj7JGmAYfS6XFUwn2dGstNI=
X-Received: by 2002:a17:906:dc91:: with SMTP id
 cs17mr31561763ejc.389.1625757057797; 
 Thu, 08 Jul 2021 08:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-11-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1625678434-240960-11-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 8 Jul 2021 19:10:45 +0400
Message-ID: <CAJ+F1CKEPHdJLNc7gHzsRm8xz7=qXES2v-mjPrp_6WS+73hp6Q@mail.gmail.com>
Subject: Re: [PATCH V5 10/25] util: env var helpers
To: Steve Sistare <steven.sistare@oracle.com>
Content-Type: multipart/alternative; boundary="000000000000ebd69a05c69e0f64"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ebd69a05c69e0f64
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jul 7, 2021 at 9:30 PM Steve Sistare <steven.sistare@oracle.com>
wrote:

> Add functions for saving fd's and other values in the environment via
> setenv, and for reading them back via getenv.
>
>
I understand that the rest of the series will rely on environment variables
to associate and recover the child-passed FDs, but I am not really
convinced that it is a good idea.

Environment variables have a number of issues that we may encounter down
the road: namespace, limits, concurrency, observability etc.. I wonder if
the VMState couldn't have a section about the FD to recover. Or maybe just
another shared memory region?

Some comments below. These new utils could also have some unit tests.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  MAINTAINERS        |  2 ++
>  include/qemu/env.h | 23 +++++++++++++
>  util/env.c         | 95
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  util/meson.build   |  1 +
>  4 files changed, 121 insertions(+)
>  create mode 100644 include/qemu/env.h
>  create mode 100644 util/env.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c48dd37..8647a97 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2865,6 +2865,8 @@ S: Maintained
>  F: include/migration/cpr.h
>  F: migration/cpr.c
>  F: qapi/cpr.json
> +F: include/qemu/env.h
> +F: util/env.c
>
>  Record/replay
>  M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
> diff --git a/include/qemu/env.h b/include/qemu/env.h
> new file mode 100644
> index 0000000..3dad503
> --- /dev/null
> +++ b/include/qemu/env.h
> @@ -0,0 +1,23 @@
> +/*
> + * Copyright (c) 2021 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef QEMU_ENV_H
> +#define QEMU_ENV_H
> +
> +#define FD_PREFIX "QEMU_FD_"
> +
> +typedef int (*walkenv_cb)(const char *name, const char *val, void
> *handle);
> +
> +int getenv_fd(const char *name);
> +void setenv_fd(const char *name, int fd);
> +void unsetenv_fd(const char *name);
> +void unsetenv_fdv(const char *fmt, ...);
> +int walkenv(const char *prefix, walkenv_cb cb, void *handle);
> +void printenv(void);
>

Please use qemu prefix, that avoids potential confusion with system
libraries.

+
> +#endif
> diff --git a/util/env.c b/util/env.c
> new file mode 100644
> index 0000000..863678d
> --- /dev/null
> +++ b/util/env.c
> @@ -0,0 +1,95 @@
> +/*
> + * Copyright (c) 2021 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/cutils.h"
> +#include "qemu/env.h"
> +
> +static uint64_t getenv_ulong(const char *prefix, const char *name, int
> *err)
> +{
> +    char var[80], *val;
> +    uint64_t res =3D 0;
> +
> +    snprintf(var, sizeof(var), "%s%s", prefix, name);
>

No check for success / truncation...

Please use g_autofree char *var =3D g_strdup_printf()..

+    val =3D getenv(var);
>

For consistency, I'd use g_getenv()

+    if (val) {
> +        *err =3D qemu_strtoul(val, NULL, 10, &res);
> +    } else {
> +        *err =3D -ENOENT;
> +    }
> +    return res;
> +}
> +
> +static void setenv_ulong(const char *prefix, const char *name, uint64_t
> val)
> +{
> +    char var[80], val_str[80];
> +    snprintf(var, sizeof(var), "%s%s", prefix, name);
> +    snprintf(val_str, sizeof(val_str), "%"PRIu64, val);
>

g_strdup_printf

+    setenv(var, val_str, 1);
>

g_setenv(), and return error value (or assert() if that makes more sense)

+}
> +
> +static void unsetenv_ulong(const char *prefix, const char *name)
> +{
> +    char var[80];
> +    snprintf(var, sizeof(var), "%s%s", prefix, name);
>

g_strdup_printf


> +    unsetenv(var);
>

g_unsetenv

+}
> +
> +int getenv_fd(const char *name)
> +{
> +    int err;
> +    int fd =3D getenv_ulong(FD_PREFIX, name, &err);
>

I'd try to use qemu_parse_fd() instead.

+    return err ? -1 : fd;
> +}
> +
> +void setenv_fd(const char *name, int fd)
> +{
>

Maybe check fd >=3D 0 ?

+    setenv_ulong(FD_PREFIX, name, fd);
> +}
> +
> +void unsetenv_fd(const char *name)
> +{
> +    unsetenv_ulong(FD_PREFIX, name);
> +}
> +
> +void unsetenv_fdv(const char *fmt, ...)
> +{
> +    va_list args;
> +    char buf[80];
> +    va_start(args, fmt);
> +    vsnprintf(buf, sizeof(buf), fmt, args);
> +    va_end(args);
>

That seems to be a leftover.

+}
> +
> +int walkenv(const char *prefix, walkenv_cb cb, void *handle)
>
+{
> +    char *str, name[128];
> +    char **envp =3D environ;
> +    size_t prefix_len =3D strlen(prefix);
> +
> +    while (*envp) {
> +        str =3D *envp++;
> +        if (!strncmp(str, prefix, prefix_len)) {
>
+            char *val =3D strchr(str, '=3D');
> +            str +=3D prefix_len;
> +            strncpy(name, str, val - str);
>

g_strndup() to avoid potential buffer overflow.

+            name[val - str] =3D 0;
> +            if (cb(name, val + 1, handle)) {
> +                return 1;
> +            }
> +        }
> +    }
> +    return 0;
> +}
> +
> +void printenv(void)
> +{
> +    char **ptr =3D environ;
> +    while (*ptr) {
> +        puts(*ptr++);
> +    }
> +}
>

Is this really useful? I doubt it.



> diff --git a/util/meson.build b/util/meson.build
> index 0ffd7f4..5e8097a 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -23,6 +23,7 @@ util_ss.add(files('host-utils.c'))
>  util_ss.add(files('bitmap.c', 'bitops.c'))
>  util_ss.add(files('fifo8.c'))
>  util_ss.add(files('cacheinfo.c', 'cacheflush.c'))
> +util_ss.add(files('env.c'))
>  util_ss.add(files('error.c', 'qemu-error.c'))
>  util_ss.add(files('qemu-print.c'))
>  util_ss.add(files('id.c'))
> --
> 1.8.3.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000ebd69a05c69e0f64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 7, 2021 at 9:30 PM Stev=
e Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistare@o=
racle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Add functions for saving fd&#39;s and other values in the enviro=
nment via<br>
setenv, and for reading them back via getenv.<br>
<br></blockquote><div><br></div><div>I understand that the rest of the seri=
es will rely on environment variables to associate and recover the child-pa=
ssed FDs, but I am not really convinced that it is a good idea.</div><div><=
br></div><div>Environment variables have a number of issues that we may enc=
ounter down the road: namespace, limits, concurrency, observability etc.. I=
 wonder if the VMState couldn&#39;t have a section about the FD to recover.=
 Or maybe just another shared memory region?</div><div><br></div><div>Some =
comments below. These new utils could also have some unit tests.<br></div><=
div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.co=
m" target=3D"_blank">steven.sistare@oracle.com</a>&gt;<br>
---<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0include/qemu/env.h | 23 +++++++++++++<br>
=C2=A0util/env.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 95 ++++++++++++++++++++=
++++++++++++++++++++++++++++++++++<br>
=C2=A0util/meson.build=C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A04 files changed, 121 insertions(+)<br>
=C2=A0create mode 100644 include/qemu/env.h<br>
=C2=A0create mode 100644 util/env.c<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index c48dd37..8647a97 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -2865,6 +2865,8 @@ S: Maintained<br>
=C2=A0F: include/migration/cpr.h<br>
=C2=A0F: migration/cpr.c<br>
=C2=A0F: qapi/cpr.json<br>
+F: include/qemu/env.h<br>
+F: util/env.c<br>
<br>
=C2=A0Record/replay<br>
=C2=A0M: Pavel Dovgalyuk &lt;<a href=3D"mailto:pavel.dovgaluk@ispras.ru" ta=
rget=3D"_blank">pavel.dovgaluk@ispras.ru</a>&gt;<br>
diff --git a/include/qemu/env.h b/include/qemu/env.h<br>
new file mode 100644<br>
index 0000000..3dad503<br>
--- /dev/null<br>
+++ b/include/qemu/env.h<br>
@@ -0,0 +1,23 @@<br>
+/*<br>
+ * Copyright (c) 2021 Oracle and/or its affiliates.<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2.<br>
+ * See the COPYING file in the top-level directory.<br>
+ *<br>
+ */<br>
+<br>
+#ifndef QEMU_ENV_H<br>
+#define QEMU_ENV_H<br>
+<br>
+#define FD_PREFIX &quot;QEMU_FD_&quot;<br>
+<br>
+typedef int (*walkenv_cb)(const char *name, const char *val, void *handle)=
;<br>
+<br>
+int getenv_fd(const char *name);<br>
+void setenv_fd(const char *name, int fd);<br>
+void unsetenv_fd(const char *name);<br>
+void unsetenv_fdv(const char *fmt, ...);<br>
+int walkenv(const char *prefix, walkenv_cb cb, void *handle);<br>
+void printenv(void);<br></blockquote><div><br></div><div>Please use qemu p=
refix, that avoids potential  confusion with system libraries.<br></div><di=
v> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+#endif<br>
diff --git a/util/env.c b/util/env.c<br>
new file mode 100644<br>
index 0000000..863678d<br>
--- /dev/null<br>
+++ b/util/env.c<br>
@@ -0,0 +1,95 @@<br>
+/*<br>
+ * Copyright (c) 2021 Oracle and/or its affiliates.<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2.<br>
+ * See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu/cutils.h&quot;<br>
+#include &quot;qemu/env.h&quot;<br>
+<br>
+static uint64_t getenv_ulong(const char *prefix, const char *name, int *er=
r)<br>
+{<br>
+=C2=A0 =C2=A0 char var[80], *val;<br>
+=C2=A0 =C2=A0 uint64_t res =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 snprintf(var, sizeof(var), &quot;%s%s&quot;, prefix, name);<=
br></blockquote><div><br></div><div>No check for success / truncation...</d=
iv><div><br></div><div>Please use g_autofree char *var =3D g_strdup_printf(=
)..<br></div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
+=C2=A0 =C2=A0 val =3D getenv(var);<br></blockquote><div><br></div><div>For=
 consistency, I&#39;d use g_getenv()</div><div> <br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 if (val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *err =3D qemu_strtoul(val, NULL, 10, &amp;res)=
;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *err =3D -ENOENT;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return res;<br>
+}<br>
+<br>
+static void setenv_ulong(const char *prefix, const char *name, uint64_t va=
l)<br>
+{<br>
+=C2=A0 =C2=A0 char var[80], val_str[80];<br>
+=C2=A0 =C2=A0 snprintf(var, sizeof(var), &quot;%s%s&quot;, prefix, name);<=
br>
+=C2=A0 =C2=A0 snprintf(val_str, sizeof(val_str), &quot;%&quot;PRIu64, val)=
;<br></blockquote><div><br></div><div>g_strdup_printf</div><div> <br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 setenv(var, val_str, 1);<br></blockquote><div><br></div><div=
>g_setenv(), and return error value (or assert() if that makes more sense)<=
br></div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+}<br>
+<br>
+static void unsetenv_ulong(const char *prefix, const char *name)<br>
+{<br>
+=C2=A0 =C2=A0 char var[80];<br>
+=C2=A0 =C2=A0 snprintf(var, sizeof(var), &quot;%s%s&quot;, prefix, name);<=
br>
</blockquote><div><div><br></div><div>g_strdup_printf</div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0 unsetenv(var);=
<br></blockquote><div><br></div><div>g_unsetenv</div><div> <br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
+}<br>
+<br>
+int getenv_fd(const char *name)<br>
+{<br>
+=C2=A0 =C2=A0 int err;<br>
+=C2=A0 =C2=A0 int fd =3D getenv_ulong(FD_PREFIX, name, &amp;err);<br></blo=
ckquote><div><br></div><div>I&#39;d try to use qemu_parse_fd() instead.</di=
v><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 return err ? -1 : fd;<br>
+}<br>
+<br>
+void setenv_fd(const char *name, int fd)<br>
+{<br></blockquote><div><br></div><div>Maybe check fd &gt;=3D 0 ?</div><div=
> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 setenv_ulong(FD_PREFIX, name, fd);<br>
+}<br>
+<br>
+void unsetenv_fd(const char *name)<br>
+{<br>
+=C2=A0 =C2=A0 unsetenv_ulong(FD_PREFIX, name);<br>
+}<br>
+<br>
+void unsetenv_fdv(const char *fmt, ...)<br>
+{<br>
+=C2=A0 =C2=A0 va_list args;<br>
+=C2=A0 =C2=A0 char buf[80];<br>
+=C2=A0 =C2=A0 va_start(args, fmt);<br>
+=C2=A0 =C2=A0 vsnprintf(buf, sizeof(buf), fmt, args);<br>
+=C2=A0 =C2=A0 va_end(args);<br></blockquote><div><br></div><div>That seems=
 to be a leftover.</div><div> <br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
+}<br>
+<br>
+int walkenv(const char *prefix, walkenv_cb cb, void *handle)<br></blockquo=
te><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
+{<br>
+=C2=A0 =C2=A0 char *str, name[128];<br>
+=C2=A0 =C2=A0 char **envp =3D environ;<br>
+=C2=A0 =C2=A0 size_t prefix_len =3D strlen(prefix);<br>
+<br>
+=C2=A0 =C2=A0 while (*envp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 str =3D *envp++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strncmp(str, prefix, prefix_len)) {<br></=
blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *val =3D strchr(str, &#39;=
=3D&#39;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 str +=3D prefix_len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strncpy(name, str, val - str);<b=
r></blockquote><div><br></div><div>g_strndup() to avoid potential buffer ov=
erflow.</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name[val - str] =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cb(name, val + 1, handle)) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+void printenv(void)<br>
+{<br>
+=C2=A0 =C2=A0 char **ptr =3D environ;<br>
+=C2=A0 =C2=A0 while (*ptr) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 puts(*ptr++);<br>
+=C2=A0 =C2=A0 }<br>
+}<br></blockquote><div><br></div><div>Is this really useful? I doubt it.</=
div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
diff --git a/util/meson.build b/util/meson.build<br>
index 0ffd7f4..5e8097a 100644<br>
--- a/util/meson.build<br>
+++ b/util/meson.build<br>
@@ -23,6 +23,7 @@ util_ss.add(files(&#39;host-utils.c&#39;))<br>
=C2=A0util_ss.add(files(&#39;bitmap.c&#39;, &#39;bitops.c&#39;))<br>
=C2=A0util_ss.add(files(&#39;fifo8.c&#39;))<br>
=C2=A0util_ss.add(files(&#39;cacheinfo.c&#39;, &#39;cacheflush.c&#39;))<br>
+util_ss.add(files(&#39;env.c&#39;))<br>
=C2=A0util_ss.add(files(&#39;error.c&#39;, &#39;qemu-error.c&#39;))<br>
=C2=A0util_ss.add(files(&#39;qemu-print.c&#39;))<br>
=C2=A0util_ss.add(files(&#39;id.c&#39;))<br>
-- <br>
1.8.3.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000ebd69a05c69e0f64--

