Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22FE508C29
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:32:17 +0200 (CEST)
Received: from localhost ([::1]:37122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCJU-0002tC-Rn
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nhBof-0002gV-A7
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:00:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nhBod-0003QU-Gj
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:00:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650466822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R+EilyAYEuF+H0b6zikPQjHj/cbMMbjjsY3d8TyVIQQ=;
 b=UtVfX8LtO8zi81nu5AqWQ8ceW8RBYf6Ui+x2PMrGskonvP6GG+YRYU1dK0ZVfHjusvdhFs
 FrJWKleRvGvNVF3W0PQYRH5mW6aUjbcUdzVTrIqBykuOcLNRnGFfw2ywrmA5selCi75kn0
 rf0WRS93Dcwvp6BtC6idYmFiCaNMP4Q=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-j0ogy6v9OgG_fnpZw-irgg-1; Wed, 20 Apr 2022 11:00:21 -0400
X-MC-Unique: j0ogy6v9OgG_fnpZw-irgg-1
Received: by mail-yb1-f197.google.com with SMTP id
 z15-20020a25bb0f000000b00613388c7d99so1700782ybg.8
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R+EilyAYEuF+H0b6zikPQjHj/cbMMbjjsY3d8TyVIQQ=;
 b=Tf2HnCvAzLT4jrO1MC/bS9QWN1Z1cB1wAc61Q1tRk06jKjeBVeRPQIo9GQ0gwEPeJy
 G48c+WHda1eb8xtOc7Dwz1q/op769cIlKLChwTuep/XZyHqYaixBFgxT2JrmSz7ljHe8
 rAYT+exY9ykeYdJ6/eRMR7htsGbsLZa5i4zMv/sFavcHKFcWxIa5F2yAxxed/RFZhi89
 bhJdr7kXHldCRSVOVsz5dEOjJD4HVjKIUCRLZJahpZzZS9R02lv2SD55PJHIQn6Cbh41
 JJuxIRaTlWOv7XXAqM8sFmWU5zxHdvbOayxQVzXcZXI91JNv1yUTPg67Uqb666ypM+og
 BLmQ==
X-Gm-Message-State: AOAM532IHiWcMbvAoCmssgc14SiHPUqMJMnjDEZsivkVgbj5egCWbGUD
 q9oFu2JyMPdtlq4t7XtTXXEbgi5gVbxAlBGG3uppphTgd7GaesP+Vuxasc331Mgw8Zjg3gGEf75
 P6GdC3knFCUqvW7xp7jPC5/8a4X3vceg=
X-Received: by 2002:a05:6902:286:b0:63d:d035:73f4 with SMTP id
 v6-20020a056902028600b0063dd03573f4mr19618689ybh.205.1650466820774; 
 Wed, 20 Apr 2022 08:00:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4S6UZHkrNWktQGVEHCGx8TJRCWc2Gw27296/+NfVVJjh/T6oElZ4Ktzp4VbbKwFOeOC3wcDEarHpwYU8wH2c=
X-Received: by 2002:a05:6902:286:b0:63d:d035:73f4 with SMTP id
 v6-20020a056902028600b0063dd03573f4mr19618618ybh.205.1650466820150; Wed, 20
 Apr 2022 08:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-8-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-8-marcandre.lureau@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Wed, 20 Apr 2022 18:00:08 +0300
Message-ID: <CAPMcbCrvAmgXFSFpA9-y8bMMZr1oxuxpwfvhnyPf4ymPUQWtkw@mail.gmail.com>
Subject: Re: [PATCH 07/41] build-sys: remove MSI's QEMU_GA_MSI_MINGW_DLL_PATH
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000876b1805dd17404f"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000876b1805dd17404f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Wed, Apr 20, 2022 at 5:08 PM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Since the introduction of the variable in commit 9dacf32d2cb ("qemu-ga:
> Building Windows MSI installation with configure/Makefile"), nothing
> makes use of the Mingw_dlls variable in the .wxs file.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  configure       | 3 ---
>  qga/meson.build | 1 -
>  2 files changed, 4 deletions(-)
>
> diff --git a/configure b/configure
> index 7c08c18358be..8cbe55ac82e8 100755
> --- a/configure
> +++ b/configure
> @@ -2704,8 +2704,6 @@ if test "$QEMU_GA_VERSION" =3D ""; then
>      QEMU_GA_VERSION=3D$(cat $source_path/VERSION)
>  fi
>
> -QEMU_GA_MSI_MINGW_DLL_PATH=3D"$($pkg_config --variable=3Dprefix glib-2.0=
)/bin"
> -
>  # Mac OS X ships with a broken assembler
>  roms=3D
>  if { test "$cpu" =3D "i386" || test "$cpu" =3D "x86_64"; } && \
> @@ -2792,7 +2790,6 @@ if test "$debug_tcg" =3D "yes" ; then
>  fi
>  if test "$mingw32" =3D "yes" ; then
>    echo "CONFIG_WIN32=3Dy" >> $config_host_mak
> -  echo "QEMU_GA_MSI_MINGW_DLL_PATH=3D${QEMU_GA_MSI_MINGW_DLL_PATH}" >>
> $config_host_mak
>    echo "QEMU_GA_MANUFACTURER=3D${QEMU_GA_MANUFACTURER}" >> $config_host_=
mak
>    echo "QEMU_GA_DISTRO=3D${QEMU_GA_DISTRO}" >> $config_host_mak
>    echo "QEMU_GA_VERSION=3D${QEMU_GA_VERSION}" >> $config_host_mak
> diff --git a/qga/meson.build b/qga/meson.build
> index 392d56094198..da5e5efb19e8 100644
> --- a/qga/meson.build
> +++ b/qga/meson.build
> @@ -129,7 +129,6 @@ if targetos =3D=3D 'windows'
>                                wixl, '-o', '@OUTPUT0@', '@INPUT0@',
>                                qemu_ga_msi_arch[cpu],
>                                qemu_ga_msi_vss,
> -                              '-D', 'Mingw_dlls=3D' +
> config_host['QEMU_GA_MSI_MINGW_DLL_PATH'],
>                              ])
>      all_qga +=3D [qga_msi]
>      alias_target('msi', qga_msi)
> --
> 2.35.1.693.g805e0a68082a
>
>
>

--000000000000876b1805dd17404f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div id=3D"gmail-:18q" class=3D"gmail-a3s gmail-aiL"><div =
dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@=
redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed=
, Apr 20, 2022 at 5:08 PM &lt;<a href=3D"mailto:marcandre.lureau@redhat.com=
">marcandre.lureau@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"ma=
ilto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat=
.com</a>&gt;<br>
<br>
Since the introduction of the variable in commit 9dacf32d2cb (&quot;qemu-ga=
:<br>
Building Windows MSI installation with configure/Makefile&quot;), nothing<b=
r>
makes use of the Mingw_dlls variable in the .wxs file.<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 ---<br>
=C2=A0qga/meson.build | 1 -<br>
=C2=A02 files changed, 4 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 7c08c18358be..8cbe55ac82e8 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -2704,8 +2704,6 @@ if test &quot;$QEMU_GA_VERSION&quot; =3D &quot;&quot;=
; then<br>
=C2=A0 =C2=A0 =C2=A0QEMU_GA_VERSION=3D$(cat $source_path/VERSION)<br>
=C2=A0fi<br>
<br>
-QEMU_GA_MSI_MINGW_DLL_PATH=3D&quot;$($pkg_config --variable=3Dprefix glib-=
2.0)/bin&quot;<br>
-<br>
=C2=A0# Mac OS X ships with a broken assembler<br>
=C2=A0roms=3D<br>
=C2=A0if { test &quot;$cpu&quot; =3D &quot;i386&quot; || test &quot;$cpu&qu=
ot; =3D &quot;x86_64&quot;; } &amp;&amp; \<br>
@@ -2792,7 +2790,6 @@ if test &quot;$debug_tcg&quot; =3D &quot;yes&quot; ; =
then<br>
=C2=A0fi<br>
=C2=A0if test &quot;$mingw32&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_WIN32=3Dy&quot; &gt;&gt; $config_host_mak<br=
>
-=C2=A0 echo &quot;QEMU_GA_MSI_MINGW_DLL_PATH=3D${QEMU_GA_MSI_MINGW_DLL_PAT=
H}&quot; &gt;&gt; $config_host_mak<br>
=C2=A0 =C2=A0echo &quot;QEMU_GA_MANUFACTURER=3D${QEMU_GA_MANUFACTURER}&quot=
; &gt;&gt; $config_host_mak<br>
=C2=A0 =C2=A0echo &quot;QEMU_GA_DISTRO=3D${QEMU_GA_DISTRO}&quot; &gt;&gt; $=
config_host_mak<br>
=C2=A0 =C2=A0echo &quot;QEMU_GA_VERSION=3D${QEMU_GA_VERSION}&quot; &gt;&gt;=
 $config_host_mak<br>
diff --git a/qga/meson.build b/qga/meson.build<br>
index 392d56094198..da5e5efb19e8 100644<br>
--- a/qga/meson.build<br>
+++ b/qga/meson.build<br>
@@ -129,7 +129,6 @@ if targetos =3D=3D &#39;windows&#39;<br>
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
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0])<br>
=C2=A0 =C2=A0 =C2=A0all_qga +=3D [qga_msi]<br>
=C2=A0 =C2=A0 =C2=A0alias_target(&#39;msi&#39;, qga_msi)<br>
-- <br>
2.35.1.693.g805e0a68082a<br>
<br>
<br>
</blockquote></div>

--000000000000876b1805dd17404f--


