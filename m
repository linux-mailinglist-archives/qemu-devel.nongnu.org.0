Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F4E454C03
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 18:32:54 +0100 (CET)
Received: from localhost ([::1]:32772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnOnm-0002WP-0z
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 12:32:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnOmY-0001pA-5m
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:31:38 -0500
Received: from [2607:f8b0:4864:20::936] (port=44714
 helo=mail-ua1-x936.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnOmV-000053-VL
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:31:37 -0500
Received: by mail-ua1-x936.google.com with SMTP id p2so7515099uad.11
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 09:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GyXVyur1a00feaEjplWIbOCfHvI3BRFHi0gZNaBqeiI=;
 b=1c6vxExzwf9tQVrAzzLNlBDUwn7KXdgplG+SaxibxNngdldSZPLN64hRtOo3N7LgvV
 7FZf8QDxbuNyNCV8wlS9ZzPvMMbZPmjlnSFZc5PVpWZawmz3psQ4hp+7GbmRkRHC7WIr
 1WVOfuYWTxMkGRF3AlH+i/Fd+4XgDYrIaFrtcAocg7FqyaxHd0JwXHSXSe7VrWxJjmrC
 G/5fh9rVemUD/DE+m44sz1hBVmO/8bjzY4rnZ03bc1v+NoU72M0NK/56ELJtFsw5S0Nr
 rtPAyiLuXn9AWGJsHnim8p2VEfwIR2CRRx4JMUPBPfoAkwE9KR7SK9ztxaUQXS10+KW1
 1FYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GyXVyur1a00feaEjplWIbOCfHvI3BRFHi0gZNaBqeiI=;
 b=5F9NjKTSt1/QjFNfPneSATkCv8vTnT+nborbz3m6+wuF8xWJWtaUwaffkfnOFaa9cT
 IpMYxJN+9gja0uNv+Ov4lj+qhH2bi762RfRayrNMRX4LOvkU+d2KGifNe6UUgz85gebA
 7Jfe/hzc5n7tRc18XGMyF95ZwhExvrcT8Uckq3lqZ2AH0EWkkcY+B2K1cYAIdfY1R7br
 oOEqu/V046PK4uxL1RtrFfia2cf/sbiyTjFJUAwwifBUbzYA8DU6SdCpnO8AmJ0W150D
 B6Sw+s3/LlexJgL5hLGyxD89fFrNwyqnYwFKCN0mDvbskeWM17XGq4L30QrWEeuXCLN6
 lA5w==
X-Gm-Message-State: AOAM53040VyWvIHRA6PKLVz917vwwe5r1gJ+BpC7O5vV/9onUyFYrrLg
 bI6jpNHCKjSSUu/NkKsOb4eyO3SBTuH3egAqiGy6bQ==
X-Google-Smtp-Source: ABdhPJzanW8ULaNEXeepSXScJM+CiF9kGhPuJIk4lzo1C+hvPxpdINTp6Szjdt5VNP8TIDZ35oHc6YZPYa5hDaEy3f4=
X-Received: by 2002:a05:6102:d94:: with SMTP id
 d20mr72798091vst.12.1637170294915; 
 Wed, 17 Nov 2021 09:31:34 -0800 (PST)
MIME-Version: 1.0
References: <20211117160412.71563-1-richard.henderson@linaro.org>
 <20211117160412.71563-17-richard.henderson@linaro.org>
In-Reply-To: <20211117160412.71563-17-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 17 Nov 2021 10:31:24 -0700
Message-ID: <CANCZdfo7FU1h8bhZd38NZzxshQudLCQJJjw3OJ-Mv9XJE3MVww@mail.gmail.com>
Subject: Re: [PATCH v5 16/17] meson: Move linux_user_ss to linux-user/
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000dd938905d0ff6910"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::936
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::936;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x936.google.com
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

--000000000000dd938905d0ff6910
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 9:04 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> We have no need to reference linux_user_ss outside of linux-user.
> Go ahead and merge it directly into specific_ss.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson.build            | 3 ---
>  linux-user/meson.build | 4 ++++
>  2 files changed, 4 insertions(+), 3 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

BTW, I don't think I have anything meaningful to add to the discussions to
date on this bug, and I'm
agnostic as to the final decision...


> diff --git a/meson.build b/meson.build
> index 9f59c57909..ecc181ea13 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2363,7 +2363,6 @@ common_user_ss = ss.source_set()
>  crypto_ss = ss.source_set()
>  hwcore_ss = ss.source_set()
>  io_ss = ss.source_set()
> -linux_user_ss = ss.source_set()
>  qmp_ss = ss.source_set()
>  qom_ss = ss.source_set()
>  softmmu_ss = ss.source_set()
> @@ -2614,8 +2613,6 @@ subdir('linux-user')
>
>  specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
>
> -specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
> -
>  common_user_ss = common_user_ss.apply(config_all, strict: false)
>  common_user = static_library('common-user',
>                               sources: common_user_ss.sources(),
> diff --git a/linux-user/meson.build b/linux-user/meson.build
> index fcf7d40f23..b89534c49c 100644
> --- a/linux-user/meson.build
> +++ b/linux-user/meson.build
> @@ -2,6 +2,8 @@ if not have_linux_user
>     subdir_done()
>  endif
>
> +linux_user_ss = ss.source_set()
> +
>  common_user_inc += include_directories('host/' / config_host['ARCH'])
>  common_user_inc += include_directories('.')
>
> @@ -42,3 +44,5 @@ subdir('sh4')
>  subdir('sparc')
>  subdir('x86_64')
>  subdir('xtensa')
> +
> +specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
> --
> 2.25.1
>
>

--000000000000dd938905d0ff6910
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 9:04 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">We have no need to reference linux_user_ss outside of lin=
ux-user.<br>
Go ahead and merge it directly into specific_ss.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 ---<br>
=C2=A0linux-user/meson.build | 4 ++++<br>
=C2=A02 files changed, 4 insertions(+), 3 deletions(-)<br></blockquote><div=
><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.c=
om">imp@bsdimp.com</a>&gt;</div><div><br></div><div>BTW, I don&#39;t think =
I have anything meaningful to add to the discussions to date on this bug, a=
nd I&#39;m</div><div>agnostic as to the final decision...</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/meson.build b/meson.build<br>
index 9f59c57909..ecc181ea13 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -2363,7 +2363,6 @@ common_user_ss =3D ss.source_set()<br>
=C2=A0crypto_ss =3D ss.source_set()<br>
=C2=A0hwcore_ss =3D ss.source_set()<br>
=C2=A0io_ss =3D ss.source_set()<br>
-linux_user_ss =3D ss.source_set()<br>
=C2=A0qmp_ss =3D ss.source_set()<br>
=C2=A0qom_ss =3D ss.source_set()<br>
=C2=A0softmmu_ss =3D ss.source_set()<br>
@@ -2614,8 +2613,6 @@ subdir(&#39;linux-user&#39;)<br>
<br>
=C2=A0specific_ss.add_all(when: &#39;CONFIG_BSD_USER&#39;, if_true: bsd_use=
r_ss)<br>
<br>
-specific_ss.add_all(when: &#39;CONFIG_LINUX_USER&#39;, if_true: linux_user=
_ss)<br>
-<br>
=C2=A0common_user_ss =3D common_user_ss.apply(config_all, strict: false)<br=
>
=C2=A0common_user =3D static_library(&#39;common-user&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sources: common_user_ss.sources(),<br>
diff --git a/linux-user/meson.build b/linux-user/meson.build<br>
index fcf7d40f23..b89534c49c 100644<br>
--- a/linux-user/meson.build<br>
+++ b/linux-user/meson.build<br>
@@ -2,6 +2,8 @@ if not have_linux_user<br>
=C2=A0 =C2=A0 subdir_done()<br>
=C2=A0endif<br>
<br>
+linux_user_ss =3D ss.source_set()<br>
+<br>
=C2=A0common_user_inc +=3D include_directories(&#39;host/&#39; / config_hos=
t[&#39;ARCH&#39;])<br>
=C2=A0common_user_inc +=3D include_directories(&#39;.&#39;)<br>
<br>
@@ -42,3 +44,5 @@ subdir(&#39;sh4&#39;)<br>
=C2=A0subdir(&#39;sparc&#39;)<br>
=C2=A0subdir(&#39;x86_64&#39;)<br>
=C2=A0subdir(&#39;xtensa&#39;)<br>
+<br>
+specific_ss.add_all(when: &#39;CONFIG_LINUX_USER&#39;, if_true: linux_user=
_ss)<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000dd938905d0ff6910--

