Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D92F8454BF8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 18:31:10 +0100 (CET)
Received: from localhost ([::1]:57786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnOm5-0000F1-W6
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 12:31:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnOkf-0007bw-DK
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:29:41 -0500
Received: from [2607:f8b0:4864:20::935] (port=42837
 helo=mail-ua1-x935.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnOkd-0008AF-Go
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:29:41 -0500
Received: by mail-ua1-x935.google.com with SMTP id t13so7539988uad.9
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 09:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S4ZTrZXEeslWDpvZ/qotCf3BJrlUYZDVVjbfXxZ0hyU=;
 b=sd9pdB5TEt+3iGRqj0lJBsGZQYOCrFUYDu2qolCibIIBRjecejQFCmC2eBBFXrqNP7
 rPdVHnYYPbPFQK7EquPQPCLVnMWutsvsdfopFe/gvQrMXU0i5fec6MR4oQJm0JILPMVw
 Cc5jr9kC8PgC07rYQZPTuMmU2/flnXgCjZHZplvui71pUcuaHRb7u3LCQ0ZwYzfRySVA
 vcldzO8jWdXeWteMbZq083doA0Hnrcxu0s6Dnp1DUo9LPqFUbaDfxzGau5fF5GpA2WjI
 TDbu+7K5FsDpkezrCiM2zH7xkUfptrySvNi+q1dQM2GyCXpAMQ2eFAW3WuNPabBFEbCe
 w1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S4ZTrZXEeslWDpvZ/qotCf3BJrlUYZDVVjbfXxZ0hyU=;
 b=dqsWVXiGUxDz3KBy6eWvzX2TR79NH1UiB512AYfZe3ZAoyfaQYLn1CgIjw/XUztDgO
 Is9lSnYhEeFYw4bz3jD1btKUHNcmWP3wGXL33VErupth5ZOrCyo6KVvhmNogod6jRMzn
 ALsymnrp5OhNkWL1uOkv26w4OoPMAJuEjXociNqgYozY8stfLZY/YLXFfCFNZrwg5FD5
 o79bN0OR9wxXiBwCQT0JME0AIXofhaTLPZoAJQMfT2oOlNoSlMmAoWjYNGYqH1bmBdkq
 x7TgmPk+pzfYKXLUw+Edaj1muELBOayjz2g5qoIreLY7o/+/Ui4abKD9F4nrO/WZkQPn
 JrTw==
X-Gm-Message-State: AOAM5335qFSnV25Xh6NbllJPCNgZjfO4LzpWRbg/JBvntv3aAMYmTUB6
 vPxCVlr4EREpJlAN0ofY0IMZfseenlgL8PNJKqg+mQ==
X-Google-Smtp-Source: ABdhPJzvxltSYUMv3Ng9VxSsdOe93kp7c5LVGmw48XY/JaCQpq6Lz0d/WMudjFOdO6Lct09vhFfTx93IHMDh2gemc7I=
X-Received: by 2002:ab0:6f47:: with SMTP id r7mr26064465uat.85.1637170178484; 
 Wed, 17 Nov 2021 09:29:38 -0800 (PST)
MIME-Version: 1.0
References: <20211117160412.71563-1-richard.henderson@linaro.org>
 <20211117160412.71563-18-richard.henderson@linaro.org>
In-Reply-To: <20211117160412.71563-18-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 17 Nov 2021 10:29:28 -0700
Message-ID: <CANCZdfp-mMAAhCmSCP2cnUODEgAAsSPZXoCEcDdwgfotwzkbmA@mail.gmail.com>
Subject: Re: [PATCH v5 17/17] meson: Move bsd_user_ss to bsd-user/
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ecff6e05d0ff62ef"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::935
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::935;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x935.google.com
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

--000000000000ecff6e05d0ff62ef
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 9:04 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> We have no need to reference bsd_user_ss outside of bsd-user.
> Go ahead and merge it directly into specific_ss.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson.build          | 3 ---
>  bsd-user/meson.build | 4 ++++
>  2 files changed, 4 insertions(+), 3 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/meson.build b/meson.build
> index ecc181ea13..9f7756a805 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2356,7 +2356,6 @@ genh += hxdep
>  authz_ss = ss.source_set()
>  blockdev_ss = ss.source_set()
>  block_ss = ss.source_set()
> -bsd_user_ss = ss.source_set()
>  chardev_ss = ss.source_set()
>  common_ss = ss.source_set()
>  common_user_ss = ss.source_set()
> @@ -2611,8 +2610,6 @@ subdir('common-user')
>  subdir('bsd-user')
>  subdir('linux-user')
>
> -specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
> -
>  common_user_ss = common_user_ss.apply(config_all, strict: false)
>  common_user = static_library('common-user',
>                               sources: common_user_ss.sources(),
> diff --git a/bsd-user/meson.build b/bsd-user/meson.build
> index 25c3976ead..9fcb80c3fa 100644
> --- a/bsd-user/meson.build
> +++ b/bsd-user/meson.build
> @@ -2,6 +2,8 @@ if not have_bsd_user
>     subdir_done()
>  endif
>
> +bsd_user_ss = ss.source_set()
> +
>  common_user_inc += include_directories('.')
>
>  bsd_user_ss.add(files(
> @@ -17,3 +19,5 @@ bsd_user_ss.add(files(
>
>  # Pull in the OS-specific build glue, if any
>  subdir(targetos)
> +
> +specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
> --
> 2.25.1
>
>

--000000000000ecff6e05d0ff62ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 9:04 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">We have no need to reference bsd_user_ss outside of bsd-u=
ser.<br>
Go ahead and merge it directly into specific_ss.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 ---<br>
=C2=A0bsd-user/meson.build | 4 ++++<br>
=C2=A02 files changed, 4 insertions(+), 3 deletions(-)<br></blockquote><div=
><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.c=
om">imp@bsdimp.com</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
diff --git a/meson.build b/meson.build<br>
index ecc181ea13..9f7756a805 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -2356,7 +2356,6 @@ genh +=3D hxdep<br>
=C2=A0authz_ss =3D ss.source_set()<br>
=C2=A0blockdev_ss =3D ss.source_set()<br>
=C2=A0block_ss =3D ss.source_set()<br>
-bsd_user_ss =3D ss.source_set()<br>
=C2=A0chardev_ss =3D ss.source_set()<br>
=C2=A0common_ss =3D ss.source_set()<br>
=C2=A0common_user_ss =3D ss.source_set()<br>
@@ -2611,8 +2610,6 @@ subdir(&#39;common-user&#39;)<br>
=C2=A0subdir(&#39;bsd-user&#39;)<br>
=C2=A0subdir(&#39;linux-user&#39;)<br>
<br>
-specific_ss.add_all(when: &#39;CONFIG_BSD_USER&#39;, if_true: bsd_user_ss)=
<br>
-<br>
=C2=A0common_user_ss =3D common_user_ss.apply(config_all, strict: false)<br=
>
=C2=A0common_user =3D static_library(&#39;common-user&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sources: common_user_ss.sources(),<br>
diff --git a/bsd-user/meson.build b/bsd-user/meson.build<br>
index 25c3976ead..9fcb80c3fa 100644<br>
--- a/bsd-user/meson.build<br>
+++ b/bsd-user/meson.build<br>
@@ -2,6 +2,8 @@ if not have_bsd_user<br>
=C2=A0 =C2=A0 subdir_done()<br>
=C2=A0endif<br>
<br>
+bsd_user_ss =3D ss.source_set()<br>
+<br>
=C2=A0common_user_inc +=3D include_directories(&#39;.&#39;)<br>
<br>
=C2=A0bsd_user_ss.add(files(<br>
@@ -17,3 +19,5 @@ bsd_user_ss.add(files(<br>
<br>
=C2=A0# Pull in the OS-specific build glue, if any<br>
=C2=A0subdir(targetos)<br>
+<br>
+specific_ss.add_all(when: &#39;CONFIG_BSD_USER&#39;, if_true: bsd_user_ss)=
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000ecff6e05d0ff62ef--

