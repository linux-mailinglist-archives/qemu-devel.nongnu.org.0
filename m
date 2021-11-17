Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E88D7454BED
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 18:25:14 +0100 (CET)
Received: from localhost ([::1]:44658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnOgM-000833-1t
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 12:25:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnOeK-0005yw-Td
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:23:08 -0500
Received: from [2607:f8b0:4864:20::92a] (port=43824
 helo=mail-ua1-x92a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnOeI-0007MG-G6
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:23:08 -0500
Received: by mail-ua1-x92a.google.com with SMTP id v3so7479910uam.10
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 09:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cDh/9Ps5xmCX0SztBCecwni7ZK3boq9655ER6pE3aqw=;
 b=i9AHYsZFiMfngbGznnpKaLbebGzY+LxI0b3mALar8Iu72O1K+Y7wQrg/V0uscm+2wi
 62LH/H3hSYBRbTOOj14JnJ44ZytcLBjseYzjNUsX3vwRdAQSSQjxTtM9EDorFvByrv42
 WUbf5cpMA/fxv//0On9B5kUZI9j/jl5aYExjIZxHwi7zQOJdtjVaj04QaqNXwiO56+7B
 RjDKfKGuvPvlrqjiRA046UQlJjMeklZrEKbNukoz/JSJuFXMGwS6AnqI/eZWyQVL7X0A
 768GcIjMOEyHFMDZdNSzcgGuz1JEbsZctUx47JU1pRCVUD2LUreKBWte61OKDZiuq38I
 c2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cDh/9Ps5xmCX0SztBCecwni7ZK3boq9655ER6pE3aqw=;
 b=BSv0+jRKY2JfI0SgWBwNdH7glr0ZXPPCKnkwbX1rZ6xLieW1o2Yf8e/y7gmpp5KIf0
 aPjKoJNXZKQJ1qhB9lkseGdB5/aGUoxsPjJ6+sy3bUk0qmnusl+52xg0+eCNZ/9waesJ
 rsARA/5kjH31b+C573fgKvJNGyuL7a2z/kzoKNuXAoJfCBUtVPaw7D7LZ2pGlQsLOsL/
 +dA0zmvSAaL6KoXpRAkac+76KAnXZUR0yQAmBcRtfKTQLxCMSOQ0T5JOKym/Dcmx5zju
 1VKdfHPUQoEsOUaQ4lJR3cuQqc5GbvdR907gt9wQ4HZT+cLeYzQPo+CRUi23+f+v0oJ2
 caVg==
X-Gm-Message-State: AOAM530lD9Jh2hwUETuCSD6z+IfMlsCnos8GQgoyFXnwXjvToZy+56YM
 oUFodCcRF2rLGuZJwG6dj5gGerOzFQwVGUu9E/uTwQ==
X-Google-Smtp-Source: ABdhPJx1TmBRKLZrtdvo2Y7WMe8fEZGiSCX4kBWqqK8Npc8ofFi6r7V5pTYM5qNJXQiM5V7RZQz24FhT+WQudbLa9mU=
X-Received: by 2002:a05:6102:5f2:: with SMTP id
 w18mr73331271vsf.6.1637169784488; 
 Wed, 17 Nov 2021 09:23:04 -0800 (PST)
MIME-Version: 1.0
References: <20211117160412.71563-1-richard.henderson@linaro.org>
 <20211117160412.71563-14-richard.henderson@linaro.org>
In-Reply-To: <20211117160412.71563-14-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 17 Nov 2021 10:22:54 -0700
Message-ID: <CANCZdfrKhaD3mROd+G_q-HM_nJFm8fQmnRDy43gsM1Ec8Rzz9w@mail.gmail.com>
Subject: Re: [PATCH v5 13/17] meson: Add build infrastructure for common-user
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000007114d705d0ff4b0d"
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

--0000000000007114d705d0ff4b0d
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 9:04 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> The first objects to be added will be target-independent,
> and so built once for the host.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson.build             | 16 +++++++++++++++-
>  bsd-user/meson.build    |  2 ++
>  common-user/meson.build |  1 +
>  linux-user/meson.build  |  3 +++
>  4 files changed, 21 insertions(+), 1 deletion(-)
>  create mode 100644 common-user/meson.build
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/meson.build b/meson.build
> index c58abf0d0d..387f7fe1c9 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2359,6 +2359,7 @@ block_ss = ss.source_set()
>  bsd_user_ss = ss.source_set()
>  chardev_ss = ss.source_set()
>  common_ss = ss.source_set()
> +common_user_ss = ss.source_set()
>  crypto_ss = ss.source_set()
>  hwcore_ss = ss.source_set()
>  io_ss = ss.source_set()
> @@ -2603,15 +2604,28 @@ subdir('tcg')
>  subdir('fpu')
>  subdir('accel')
>  subdir('plugins')
> +subdir('ebpf')
> +
> +common_user_inc = []
> +
> +subdir('common-user')
>  subdir('bsd-user')
>  subdir('linux-user')
> -subdir('ebpf')
>
>  specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
>
>  linux_user_ss.add(files('thunk.c'))
>  specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
>
> +common_user_ss = common_user_ss.apply(config_all, strict: false)
> +common_user = static_library('common-user',
> +                             sources: common_user_ss.sources(),
> +                             dependencies: common_user_ss.dependencies(),
> +                             include_directories: common_user_inc)
> +common_user = declare_dependency(link_with: common_user)
> +
> +user_ss.add(common_user)
> +
>  # needed for fuzzing binaries
>  subdir('tests/qtest/libqos')
>  subdir('tests/qtest/fuzz')
> diff --git a/bsd-user/meson.build b/bsd-user/meson.build
> index 87885d91ed..25c3976ead 100644
> --- a/bsd-user/meson.build
> +++ b/bsd-user/meson.build
> @@ -2,6 +2,8 @@ if not have_bsd_user
>     subdir_done()
>  endif
>
> +common_user_inc += include_directories('.')
> +
>  bsd_user_ss.add(files(
>    'bsdload.c',
>    'elfload.c',
> diff --git a/common-user/meson.build b/common-user/meson.build
> new file mode 100644
> index 0000000000..4f5c0f2f88
> --- /dev/null
> +++ b/common-user/meson.build
> @@ -0,0 +1 @@
> +common_user_inc += include_directories('host/' / config_host['ARCH'])
> diff --git a/linux-user/meson.build b/linux-user/meson.build
> index bf62c13e37..d6fa4f4d74 100644
> --- a/linux-user/meson.build
> +++ b/linux-user/meson.build
> @@ -2,6 +2,9 @@ if not have_linux_user
>     subdir_done()
>  endif
>
> +common_user_inc += include_directories('host/' / config_host['ARCH'])
> +common_user_inc += include_directories('.')
> +
>  linux_user_ss.add(files(
>    'elfload.c',
>    'exit.c',
> --
> 2.25.1
>
>

--0000000000007114d705d0ff4b0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 9:04 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">The first objects to be added will be target-independent,=
<br>
and so built once for the host.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 16 +++++=
++++++++++-<br>
=C2=A0bsd-user/meson.build=C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0common-user/meson.build |=C2=A0 1 +<br>
=C2=A0linux-user/meson.build=C2=A0 |=C2=A0 3 +++<br>
=C2=A04 files changed, 21 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 common-user/meson.build<br></blockquote><div><br><=
/div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">im=
p@bsdimp.com</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
diff --git a/meson.build b/meson.build<br>
index c58abf0d0d..387f7fe1c9 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -2359,6 +2359,7 @@ block_ss =3D ss.source_set()<br>
=C2=A0bsd_user_ss =3D ss.source_set()<br>
=C2=A0chardev_ss =3D ss.source_set()<br>
=C2=A0common_ss =3D ss.source_set()<br>
+common_user_ss =3D ss.source_set()<br>
=C2=A0crypto_ss =3D ss.source_set()<br>
=C2=A0hwcore_ss =3D ss.source_set()<br>
=C2=A0io_ss =3D ss.source_set()<br>
@@ -2603,15 +2604,28 @@ subdir(&#39;tcg&#39;)<br>
=C2=A0subdir(&#39;fpu&#39;)<br>
=C2=A0subdir(&#39;accel&#39;)<br>
=C2=A0subdir(&#39;plugins&#39;)<br>
+subdir(&#39;ebpf&#39;)<br>
+<br>
+common_user_inc =3D []<br>
+<br>
+subdir(&#39;common-user&#39;)<br>
=C2=A0subdir(&#39;bsd-user&#39;)<br>
=C2=A0subdir(&#39;linux-user&#39;)<br>
-subdir(&#39;ebpf&#39;)<br>
<br>
=C2=A0specific_ss.add_all(when: &#39;CONFIG_BSD_USER&#39;, if_true: bsd_use=
r_ss)<br>
<br>
=C2=A0linux_user_ss.add(files(&#39;thunk.c&#39;))<br>
=C2=A0specific_ss.add_all(when: &#39;CONFIG_LINUX_USER&#39;, if_true: linux=
_user_ss)<br>
<br>
+common_user_ss =3D common_user_ss.apply(config_all, strict: false)<br>
+common_user =3D static_library(&#39;common-user&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sources: common_user_ss.sources(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dependencies: common_user_ss.dependencies(),=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include_directories: common_user_inc)<br>
+common_user =3D declare_dependency(link_with: common_user)<br>
+<br>
+user_ss.add(common_user)<br>
+<br>
=C2=A0# needed for fuzzing binaries<br>
=C2=A0subdir(&#39;tests/qtest/libqos&#39;)<br>
=C2=A0subdir(&#39;tests/qtest/fuzz&#39;)<br>
diff --git a/bsd-user/meson.build b/bsd-user/meson.build<br>
index 87885d91ed..25c3976ead 100644<br>
--- a/bsd-user/meson.build<br>
+++ b/bsd-user/meson.build<br>
@@ -2,6 +2,8 @@ if not have_bsd_user<br>
=C2=A0 =C2=A0 subdir_done()<br>
=C2=A0endif<br>
<br>
+common_user_inc +=3D include_directories(&#39;.&#39;)<br>
+<br>
=C2=A0bsd_user_ss.add(files(<br>
=C2=A0 =C2=A0&#39;bsdload.c&#39;,<br>
=C2=A0 =C2=A0&#39;elfload.c&#39;,<br>
diff --git a/common-user/meson.build b/common-user/meson.build<br>
new file mode 100644<br>
index 0000000000..4f5c0f2f88<br>
--- /dev/null<br>
+++ b/common-user/meson.build<br>
@@ -0,0 +1 @@<br>
+common_user_inc +=3D include_directories(&#39;host/&#39; / config_host[&#3=
9;ARCH&#39;])<br>
diff --git a/linux-user/meson.build b/linux-user/meson.build<br>
index bf62c13e37..d6fa4f4d74 100644<br>
--- a/linux-user/meson.build<br>
+++ b/linux-user/meson.build<br>
@@ -2,6 +2,9 @@ if not have_linux_user<br>
=C2=A0 =C2=A0 subdir_done()<br>
=C2=A0endif<br>
<br>
+common_user_inc +=3D include_directories(&#39;host/&#39; / config_host[&#3=
9;ARCH&#39;])<br>
+common_user_inc +=3D include_directories(&#39;.&#39;)<br>
+<br>
=C2=A0linux_user_ss.add(files(<br>
=C2=A0 =C2=A0&#39;elfload.c&#39;,<br>
=C2=A0 =C2=A0&#39;exit.c&#39;,<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000007114d705d0ff4b0d--

