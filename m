Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4543CB40D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 10:22:55 +0200 (CEST)
Received: from localhost ([::1]:45418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4J7W-0004sH-Rd
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 04:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m4J6C-0003pO-GR
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:21:32 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:45784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m4J6A-0000HA-TT
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:21:32 -0400
Received: by mail-ed1-x535.google.com with SMTP id x17so11814906edd.12
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 01:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xgA5EHclXuOzjUXtAGq7RLggparS5ZovwqO3ShcneQQ=;
 b=o/5PO9ihHo1y0zFPmGwvbt8o9lnfp2+Nkc6YVUPxHa19o5SeDJr+cBdagRgEZB2cZE
 GC3+8TmuxNHbyxD3tntHyBhsK1HLzL9HtCRJjrBwBlTnpj3gmscEheJlBeUJwaSUP8f3
 jriTUr/7xWOmL4zVP3w6zZPxSe0batXlAcorzqnzxcyCQHW+meuWu4PL6YMeVIgWRrtj
 Xl165b/rfk8S18p2kZGuCVVC4BHY1Qbm5x3YvzkyJLpijkGwbRyUbnmoKcrZ6EDcwyUU
 aFBq7d5TEGMin7Re0+2yWtJWOolZpMji/tkTxkJSnQbsbv8Rz1Gv1mI8HOxgefoKyh2A
 9n9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xgA5EHclXuOzjUXtAGq7RLggparS5ZovwqO3ShcneQQ=;
 b=PsG4wgb8i+Pnc7GY+D97v28Z/nOnCuYsqQE5OFtGVqSc+eQzGxN+dh6rZHSZEqHdCe
 4a9UBsUKadUOMihVAvCGPP2zrYrIx7s+ySTqM/00CoxXUpvVz+GVN6+f20AIxLctcAuo
 dEa7o4wucHuSt4WnEmg5AcK4pdqJQRd0TqadSjQTiH+SLEpBBEB68Q547c5wuFuNnNfk
 T0wwbH9Jvj5kQiSHTGOmWuxcbc+Ni4P/vtm4e8KwzMgWap6n5Xvce3YDhfZgDpMoUdKs
 /I410Ea5ce2SgAPd49+gDaiL/DBc5gB7vYpgfQ0Q9fq+GuQApzxaZGG/mUSAxS1Og+rL
 royw==
X-Gm-Message-State: AOAM530JtL0sEBa3rKfhdB+U/WvbTKv7VsY1Y844wKqnWRUpo8ZnydgV
 nDqLPsIvQtg4qnA/DVduTSwHLsST3JmRFDyatV8=
X-Google-Smtp-Source: ABdhPJziR+4AKz0nI1+AiWe4LFdZ531MmJ7c/dNKcHdg0kvYS4wRBoM4sveTNkgm3hbMo6nZLC3m4QrS7zMVTDhBKwI=
X-Received: by 2002:aa7:c458:: with SMTP id n24mr13363913edr.30.1626423689546; 
 Fri, 16 Jul 2021 01:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210714055735.86050-1-akihiko.odaki@gmail.com>
In-Reply-To: <20210714055735.86050-1-akihiko.odaki@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 16 Jul 2021 12:21:17 +0400
Message-ID: <CAJ+F1CKo0D0wKKfKQZHTRfF2GvFk5cfCHtmC1HSXAQh23_Us0A@mail.gmail.com>
Subject: Re: [PATCH] ui/spice: Use HAVE_SPICE_GL for OpenGL checks
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000045102605c73946af"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x535.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000045102605c73946af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 14, 2021 at 9:58 AM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> Some code in ui/spice used CONFIG_OPENGL for OpenGL conditionals, but
> SPICE also depends on CONFIG_GBM and SPICE server whose version is
> 0.13.1 or later for OpenGL. Always use HAVE_SPICE_GL, which defines the
> precise condition.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  ui/spice-app.c  | 3 ++-
>  ui/spice-core.c | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/ui/spice-app.c b/ui/spice-app.c
> index 641f4a9d53e..7e71e18da9a 100644
> --- a/ui/spice-app.c
> +++ b/ui/spice-app.c
> @@ -27,6 +27,7 @@
>  #include <gio/gio.h>
>
>  #include "ui/console.h"
> +#include "ui/spice-display.h"
>  #include "qemu/config-file.h"
>  #include "qemu/option.h"
>  #include "qemu/cutils.h"
> @@ -175,7 +176,7 @@ static void
> spice_app_display_early_init(DisplayOptions *opts)
>      qemu_opt_set(qopts, "addr", sock_path, &error_abort);
>      qemu_opt_set(qopts, "image-compression", "off", &error_abort);
>      qemu_opt_set(qopts, "streaming-video", "off", &error_abort);
> -#ifdef CONFIG_OPENGL
> +#ifdef HAVE_SPICE_GL
>      qemu_opt_set(qopts, "gl", opts->has_gl ? "on" : "off", &error_abort)=
;
>      display_opengl =3D opts->has_gl;
>  #endif
> diff --git a/ui/spice-core.c b/ui/spice-core.c
> index 86d43783aca..0371055e6c1 100644
> --- a/ui/spice-core.c
> +++ b/ui/spice-core.c
> @@ -1039,6 +1039,6 @@ static void spice_register_config(void)
>  opts_init(spice_register_config);
>  module_opts("spice");
>
> -#ifdef CONFIG_OPENGL
> +#ifdef HAVE_SPICE_GL
>  module_dep("ui-opengl");
>  #endif
> --
> 2.30.1 (Apple Git-130)
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000045102605c73946af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 14, 2021 at 9:58 AM Akihi=
ko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">akihiko.odaki@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Some code in ui/spice used CONFIG_OPENGL for OpenGL conditionals, but<b=
r>
SPICE also depends on CONFIG_GBM and SPICE server whose version is<br>
0.13.1 or later for OpenGL. Always use HAVE_SPICE_GL, which defines the<br>
precise condition.<br>
<br>
Signed-off-by: Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com"=
 target=3D"_blank">akihiko.odaki@gmail.com</a>&gt;<br></blockquote><div><br=
></div><div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:=
marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=
 <br></div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0ui/spice-app.c=C2=A0 | 3 ++-<br>
=C2=A0ui/spice-core.c | 2 +-<br>
=C2=A02 files changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/ui/spice-app.c b/ui/spice-app.c<br>
index 641f4a9d53e..7e71e18da9a 100644<br>
--- a/ui/spice-app.c<br>
+++ b/ui/spice-app.c<br>
@@ -27,6 +27,7 @@<br>
=C2=A0#include &lt;gio/gio.h&gt;<br>
<br>
=C2=A0#include &quot;ui/console.h&quot;<br>
+#include &quot;ui/spice-display.h&quot;<br>
=C2=A0#include &quot;qemu/config-file.h&quot;<br>
=C2=A0#include &quot;qemu/option.h&quot;<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
@@ -175,7 +176,7 @@ static void spice_app_display_early_init(DisplayOptions=
 *opts)<br>
=C2=A0 =C2=A0 =C2=A0qemu_opt_set(qopts, &quot;addr&quot;, sock_path, &amp;e=
rror_abort);<br>
=C2=A0 =C2=A0 =C2=A0qemu_opt_set(qopts, &quot;image-compression&quot;, &quo=
t;off&quot;, &amp;error_abort);<br>
=C2=A0 =C2=A0 =C2=A0qemu_opt_set(qopts, &quot;streaming-video&quot;, &quot;=
off&quot;, &amp;error_abort);<br>
-#ifdef CONFIG_OPENGL<br>
+#ifdef HAVE_SPICE_GL<br>
=C2=A0 =C2=A0 =C2=A0qemu_opt_set(qopts, &quot;gl&quot;, opts-&gt;has_gl ? &=
quot;on&quot; : &quot;off&quot;, &amp;error_abort);<br>
=C2=A0 =C2=A0 =C2=A0display_opengl =3D opts-&gt;has_gl;<br>
=C2=A0#endif<br>
diff --git a/ui/spice-core.c b/ui/spice-core.c<br>
index 86d43783aca..0371055e6c1 100644<br>
--- a/ui/spice-core.c<br>
+++ b/ui/spice-core.c<br>
@@ -1039,6 +1039,6 @@ static void spice_register_config(void)<br>
=C2=A0opts_init(spice_register_config);<br>
=C2=A0module_opts(&quot;spice&quot;);<br>
<br>
-#ifdef CONFIG_OPENGL<br>
+#ifdef HAVE_SPICE_GL<br>
=C2=A0module_dep(&quot;ui-opengl&quot;);<br>
=C2=A0#endif<br>
-- <br>
2.30.1 (Apple Git-130)<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000045102605c73946af--

