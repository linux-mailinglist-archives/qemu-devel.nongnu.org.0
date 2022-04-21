Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9314F50A2B7
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:37:42 +0200 (CEST)
Received: from localhost ([::1]:50826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXwD-0003W8-MF
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nhXde-00018P-4k
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:18:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nhXdc-00026u-6Z
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:18:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650550706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9x4gJ6eUQmvGKgphFyLwAHu41B4rUDXWFw2EgDEF7IU=;
 b=C+dWgibDMD46QsdejEDitd7OaI9ped1uIqQC2s+ymlVeUsu7PBxHXgTMbN/jZ3Cwx/ofmm
 0CPXAVvxYXRBky8Nhs3+KeWJjd2fR5XpMgqoKbmVeTUVhVvALfqq6YZF1Q/ENqHGM8wwVT
 dMkq1u7X+wa8npd6P2DQ5wc3P77wxvI=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-tIgnq_buOeaqxRntVa5cyA-1; Thu, 21 Apr 2022 10:18:25 -0400
X-MC-Unique: tIgnq_buOeaqxRntVa5cyA-1
Received: by mail-yb1-f199.google.com with SMTP id
 n10-20020a25da0a000000b0064149e56ecaso4497808ybf.2
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 07:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9x4gJ6eUQmvGKgphFyLwAHu41B4rUDXWFw2EgDEF7IU=;
 b=rgHtz4Fuj2dfuwHp4kc5N7bqHtXLBq0303hEEY3PQSruCL4crUW5TYGADqZBUSgulE
 rgTBY+jxdZfAaf0ltNxog9jNqHhZesKnF0vvI0AGdIzSa/368nYbFEehORoB+WMz2+Pf
 vG/CbHHBvjoV4rY39e6H+ud8/pbroBzHq8gBJcj6fG8RAGtmUTpxjt0wiHpnxq6V1R30
 Zo/y4B54KbGzvkfJRNQ1AtFssHXr4Z5KTpOgoAfCEK6YaeUSBWmEa2wEJQbdQm2JxaTx
 J/76V28fqcHU9kEcann5h2YDnfTsA3XBFHFUqUEZb9a4yl2ozDCnXu1Q2dHAH25xTluG
 MXLw==
X-Gm-Message-State: AOAM531yIv/efdTZ9kOW8DOWW2Zn3nQmz6Y6+tv21LdNrJjOGwKLGgMq
 P8ouBbbnHPeROiCWdOXH1Y/a31KFxoW0JsjjGeux9vLSGbwbIwcSA5g22zZUWBGrogZ4IEBHXfU
 0zbu77fanBLhahAa0GWbOfXk4dDy/IZE=
X-Received: by 2002:a25:d40e:0:b0:641:1842:ed4b with SMTP id
 m14-20020a25d40e000000b006411842ed4bmr24625801ybf.257.1650550704210; 
 Thu, 21 Apr 2022 07:18:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuTRejBG02khOmR+oQ+FNioqkhOCtjWMEX5VhthcEeo9op9uJG4uM+bcrsFEFsCAABpMOrwjOr4iXIo61EeS0=
X-Received: by 2002:a25:d40e:0:b0:641:1842:ed4b with SMTP id
 m14-20020a25d40e000000b006411842ed4bmr24625785ybf.257.1650550704019; Thu, 21
 Apr 2022 07:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-4-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-4-pbonzini@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Thu, 21 Apr 2022 17:18:12 +0300
Message-ID: <CAPMcbCpLTNOh0jbRf9+C90_h6PmEER9MOsGesD2AxEVoUG2Spw@mail.gmail.com>
Subject: Re: [PATCH 03/34] qga: wixl: get path to sysroot from pkg-config as
 intended
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000065a92005dd2ac84f"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000065a92005dd2ac84f
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Wed, Apr 20, 2022 at 6:37 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> The .wxs file uses $(var.Mingw_bin) while configure/meson have always
> used Mingw_dlls.  Fix them to match what was probably intended.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure       | 4 ++--
>  qga/meson.build | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/configure b/configure
> index 2fc860ed9a..2bc5a0b84f 100755
> --- a/configure
> +++ b/configure
> @@ -2702,7 +2702,7 @@ if test "$QEMU_GA_VERSION" = ""; then
>      QEMU_GA_VERSION=$(cat $source_path/VERSION)
>  fi
>
> -QEMU_GA_MSI_MINGW_DLL_PATH="$($pkg_config --variable=prefix glib-2.0)/bin"
> +QEMU_GA_MSI_MINGW_BIN_PATH="$($pkg_config --variable=prefix glib-2.0)/bin"
>
>  # Mac OS X ships with a broken assembler
>  roms=
> @@ -2790,7 +2790,7 @@ if test "$debug_tcg" = "yes" ; then
>  fi
>  if test "$mingw32" = "yes" ; then
>    echo "CONFIG_WIN32=y" >> $config_host_mak
> -  echo "QEMU_GA_MSI_MINGW_DLL_PATH=${QEMU_GA_MSI_MINGW_DLL_PATH}" >>
> $config_host_mak
> +  echo "QEMU_GA_MSI_MINGW_BIN_PATH=${QEMU_GA_MSI_MINGW_BIN_PATH}" >>
> $config_host_mak
>    echo "QEMU_GA_MANUFACTURER=${QEMU_GA_MANUFACTURER}" >> $config_host_mak
>    echo "QEMU_GA_DISTRO=${QEMU_GA_DISTRO}" >> $config_host_mak
>    echo "QEMU_GA_VERSION=${QEMU_GA_VERSION}" >> $config_host_mak
> diff --git a/qga/meson.build b/qga/meson.build
> index 392d560941..6d9f39bb32 100644
> --- a/qga/meson.build
> +++ b/qga/meson.build
> @@ -129,7 +129,7 @@ if targetos == 'windows'
>                                wixl, '-o', '@OUTPUT0@', '@INPUT0@',
>                                qemu_ga_msi_arch[cpu],
>                                qemu_ga_msi_vss,
> -                              '-D', 'Mingw_dlls=' +
> config_host['QEMU_GA_MSI_MINGW_DLL_PATH'],
> +                              '-D', 'Mingw_bin=' +
> config_host['QEMU_GA_MSI_MINGW_BIN_PATH'],
>                              ])
>      all_qga += [qga_msi]
>      alias_target('msi', qga_msi)
> --
> 2.35.1
>
>
>
>

--00000000000065a92005dd2ac84f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 2=
0, 2022 at 6:37 PM Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com"=
 target=3D"_blank">pbonzini@redhat.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">The .wxs file uses $(var.Mingw_bin) w=
hile configure/meson have always<br>
used Mingw_dlls.=C2=A0 Fix them to match what was probably intended.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A0qga/meson.build | 2 +-<br>
=C2=A02 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 2fc860ed9a..2bc5a0b84f 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -2702,7 +2702,7 @@ if test &quot;$QEMU_GA_VERSION&quot; =3D &quot;&quot;=
; then<br>
=C2=A0 =C2=A0 =C2=A0QEMU_GA_VERSION=3D$(cat $source_path/VERSION)<br>
=C2=A0fi<br>
<br>
-QEMU_GA_MSI_MINGW_DLL_PATH=3D&quot;$($pkg_config --variable=3Dprefix glib-=
2.0)/bin&quot;<br>
+QEMU_GA_MSI_MINGW_BIN_PATH=3D&quot;$($pkg_config --variable=3Dprefix glib-=
2.0)/bin&quot;<br>
<br>
=C2=A0# Mac OS X ships with a broken assembler<br>
=C2=A0roms=3D<br>
@@ -2790,7 +2790,7 @@ if test &quot;$debug_tcg&quot; =3D &quot;yes&quot; ; =
then<br>
=C2=A0fi<br>
=C2=A0if test &quot;$mingw32&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_WIN32=3Dy&quot; &gt;&gt; $config_host_mak<br=
>
-=C2=A0 echo &quot;QEMU_GA_MSI_MINGW_DLL_PATH=3D${QEMU_GA_MSI_MINGW_DLL_PAT=
H}&quot; &gt;&gt; $config_host_mak<br>
+=C2=A0 echo &quot;QEMU_GA_MSI_MINGW_BIN_PATH=3D${QEMU_GA_MSI_MINGW_BIN_PAT=
H}&quot; &gt;&gt; $config_host_mak<br>
=C2=A0 =C2=A0echo &quot;QEMU_GA_MANUFACTURER=3D${QEMU_GA_MANUFACTURER}&quot=
; &gt;&gt; $config_host_mak<br>
=C2=A0 =C2=A0echo &quot;QEMU_GA_DISTRO=3D${QEMU_GA_DISTRO}&quot; &gt;&gt; $=
config_host_mak<br>
=C2=A0 =C2=A0echo &quot;QEMU_GA_VERSION=3D${QEMU_GA_VERSION}&quot; &gt;&gt;=
 $config_host_mak<br>
diff --git a/qga/meson.build b/qga/meson.build<br>
index 392d560941..6d9f39bb32 100644<br>
--- a/qga/meson.build<br>
+++ b/qga/meson.build<br>
@@ -129,7 +129,7 @@ if targetos =3D=3D &#39;windows&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wixl, &#39;-o&#39;, &#39;@OUTPUT0@&#3=
9;, &#39;@INPUT0@&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_ga_msi_arch[cpu],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_ga_msi_vss,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-D&#39;, &#39;Mingw_dlls=3D&#39; + con=
fig_host[&#39;QEMU_GA_MSI_MINGW_DLL_PATH&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-D&#39;, &#39;Mingw_bin=3D&#39; + conf=
ig_host[&#39;QEMU_GA_MSI_MINGW_BIN_PATH&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0])<br>
=C2=A0 =C2=A0 =C2=A0all_qga +=3D [qga_msi]<br>
=C2=A0 =C2=A0 =C2=A0alias_target(&#39;msi&#39;, qga_msi)<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000065a92005dd2ac84f--


