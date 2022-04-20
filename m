Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBAE508D47
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:28:15 +0200 (CEST)
Received: from localhost ([::1]:46346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhDBe-0008Lq-GH
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhCYB-0000M6-Hp
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:47:27 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:36812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhCY9-0003Bg-Mr
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:47:27 -0400
Received: by mail-qt1-x833.google.com with SMTP id bb21so1252419qtb.3
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X/42drexxegBU+WLUAslqbNeGfYFCWJdwEALvQeRFL4=;
 b=R1qQucU2pq15pg9KqLSa8vmg2gMgTF3vuC/Ap9bQgTkOadOaRksUsTNoNAXgSe18e6
 ztnHMze74jMdtvmHdtur5XiaDZZQ2nRU+NxhLGsBs55VL6mufm96QHIJ53sLXCoe+zHw
 VZeKNxVNSjJiZdzoBP/6Evw1o1QamZEN1JG0vaV5b8GEsXDkwuCWgamap7u6oW7Szwbl
 85EJ+nmcCjRIAUCRbWVZ/kr+hB6qp9WSghrVbypVWTnwD6VZsXOeskDsBoPv2sxHzYex
 I9kF6n6I6VyTN8Gjqsn8iWyTUXA98fY01N/nmHHV2cTKj8vaYAVhn9FojE1K1exZCmAG
 FTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X/42drexxegBU+WLUAslqbNeGfYFCWJdwEALvQeRFL4=;
 b=11t96IA9ZpFRL3GyHegccZRuIY2f4hUWkDb7k2ktPt7a0IW+53xEQTlflGNHzk61a5
 s8LrCIW9WpzFi8lksaqt5HNusJjrW7strS1r5jKtPCuNwU4pNIf1rE2mMEqggAPLGvW2
 WiFu+VFLowFlFT32zREmqWEqlXdO7pF7Ep6Pg9Csvc+2++1zdO2Qm0OxZB2ls1XWSH+6
 IC6CPJdIXMQ1Y+dI/VYhpeQN0vEkGmUGzymYMPdCj5cBnJBLwnZo9+S36nTK2AzILXnF
 w9BjcdjL3+z6eOA0VnGNyqDaSP4K+kdSZbc+gLKuLVztywlZ6w1eOM7L/H1Xv8R2bedz
 H7fQ==
X-Gm-Message-State: AOAM531o+slDmB/vTOC1j4bmlIYIzYVEtSUFI9q9bPLSZ1ef4XNdOq67
 vSnbbxr/mZmyu92Zb0pFOT2GsZ0mQ+OFJyooaZ4=
X-Google-Smtp-Source: ABdhPJxtfh/gFI5jshOKLis6gCmA0zdK38WDY9tzr0z4aGAe6ns5SwBMnV0wYv5muAcc9oWx66PqqupDic8XtxchgaE=
X-Received: by 2002:ac8:5a41:0:b0:2f1:f30e:c07f with SMTP id
 o1-20020ac85a41000000b002f1f30ec07fmr13987830qta.112.1650469644502; Wed, 20
 Apr 2022 08:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-4-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-4-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Apr 2022 19:47:12 +0400
Message-ID: <CAJ+F1C+g1Taf4BzKWV2thxF4ge+W=Y1TVUsvavZ_w4gJp1YThQ@mail.gmail.com>
Subject: Re: [PATCH 03/34] qga: wixl: get path to sysroot from pkg-config as
 intended
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000df8c1e05dd17e864"
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000df8c1e05dd17e864
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 7:37 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> The .wxs file uses $(var.Mingw_bin) while configure/meson have always
> used Mingw_dlls.  Fix them to match what was probably intended.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  configure       | 4 ++--
>  qga/meson.build | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/configure b/configure
> index 2fc860ed9a..2bc5a0b84f 100755
> --- a/configure
> +++ b/configure
> @@ -2702,7 +2702,7 @@ if test "$QEMU_GA_VERSION" =3D ""; then
>      QEMU_GA_VERSION=3D$(cat $source_path/VERSION)
>  fi
>
> -QEMU_GA_MSI_MINGW_DLL_PATH=3D"$($pkg_config --variable=3Dprefix glib-2.0=
)/bin"
> +QEMU_GA_MSI_MINGW_BIN_PATH=3D"$($pkg_config --variable=3Dprefix glib-2.0=
)/bin"
>
>  # Mac OS X ships with a broken assembler
>  roms=3D
> @@ -2790,7 +2790,7 @@ if test "$debug_tcg" =3D "yes" ; then
>  fi
>  if test "$mingw32" =3D "yes" ; then
>    echo "CONFIG_WIN32=3Dy" >> $config_host_mak
> -  echo "QEMU_GA_MSI_MINGW_DLL_PATH=3D${QEMU_GA_MSI_MINGW_DLL_PATH}" >>
> $config_host_mak
> +  echo "QEMU_GA_MSI_MINGW_BIN_PATH=3D${QEMU_GA_MSI_MINGW_BIN_PATH}" >>
> $config_host_mak
>    echo "QEMU_GA_MANUFACTURER=3D${QEMU_GA_MANUFACTURER}" >> $config_host_=
mak
>    echo "QEMU_GA_DISTRO=3D${QEMU_GA_DISTRO}" >> $config_host_mak
>    echo "QEMU_GA_VERSION=3D${QEMU_GA_VERSION}" >> $config_host_mak
> diff --git a/qga/meson.build b/qga/meson.build
> index 392d560941..6d9f39bb32 100644
> --- a/qga/meson.build
> +++ b/qga/meson.build
> @@ -129,7 +129,7 @@ if targetos =3D=3D 'windows'
>                                wixl, '-o', '@OUTPUT0@', '@INPUT0@',
>                                qemu_ga_msi_arch[cpu],
>                                qemu_ga_msi_vss,
> -                              '-D', 'Mingw_dlls=3D' +
> config_host['QEMU_GA_MSI_MINGW_DLL_PATH'],
> +                              '-D', 'Mingw_bin=3D' +
> config_host['QEMU_GA_MSI_MINGW_BIN_PATH'],
>                              ])
>      all_qga +=3D [qga_msi]
>      alias_target('msi', qga_msi)
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000df8c1e05dd17e864
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 7:37 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The =
.wxs file uses $(var.Mingw_bin) while configure/meson have always<br>
used Mingw_dlls.=C2=A0 Fix them to match what was probably intended.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000df8c1e05dd17e864--

