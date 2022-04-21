Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 725B8509D5D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 12:17:21 +0200 (CEST)
Received: from localhost ([::1]:34696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhTsG-0001N9-1E
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 06:17:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhTkL-0002nV-JC
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:09:09 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:34657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhTkI-00077z-Et
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:09:09 -0400
Received: by mail-qk1-x731.google.com with SMTP id j9so3200093qkg.1
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 03:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=txvC+8kolDJLInqxJpo1Fxtgvo/MUe4iCHnqdrQbolI=;
 b=IaWlPt6mPBn4IV1GqKzbBPSVogtCqvGDfhoO3sZoNQKTfpEiyHvD2gV8MFx+0oOpk6
 oNd0KcQsRnPuFXP+yVuLOSqxLH74qO2NsQM3YMIjZJuZxLh7cbDXoJpSuNsKjhB5HqR1
 uM9GXp8rc5J1ai4Ihgr5ww1w/hjXlk3Otjs8SKNKUpFpVbvVjwCuno9752BzoKaxljk+
 zxjLrt6M1xvPHt44/WVAJn2QmFHyYrSSkRzk6mnadmHvlUI0l2SQox/RehVyYGI61pX8
 QH8pNsXXGDL6XKxEXw73GvavHoea7marHadIBP1MNUGmTIC9pRSPZljhgBQtswEcGF+J
 qIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=txvC+8kolDJLInqxJpo1Fxtgvo/MUe4iCHnqdrQbolI=;
 b=4PsgMFCz4ofx7Y6xpMesDkCi5Q6eh9EnLy7gTVzdC4aHXelKZ+BYmCwyQKi02N0qc6
 v6IJUcSqvwPfw1Wb4cZwGq06GbPBexEaV4ylSSQVQxb5uQdgGd98EFqWbkBuPExwGSSq
 VKR/HDjocdu8m+GuWmNmwOiJUTfsb45Iqr47kiUP1V/IVGW7R8/NYkczF/abPDzE5erm
 dYny8dCmtt6rgNwsbfIQoGI7ZDLnoN2ZVbPT5T3d8FT0Yr8t32JIJUFoQG9faFjiwslU
 vDutxd0qDkNZ72ats4NTv2Sehy61ko7FxttnMvvcWcHbeUlTleFiSF/EQGZNv3h4FAE+
 SFQw==
X-Gm-Message-State: AOAM530E927NhcYSWx8Ik3JiCbOiG5NP7n7JclXakx4cN2W4PAKWyZwV
 RA47ZTN/gqeeBpkcMh/jvM+YWeqO0Za59kBEh2QFppup5Jz+fg==
X-Google-Smtp-Source: ABdhPJz19RXgo+S3MIqfvb7FQwXMSBExS/awppNGJMhX7yhCEIeMrFK8cgFe4EGIGjmtuYJnA+H9QKewgzJhjRBDKk4=
X-Received: by 2002:a05:620a:4093:b0:69c:fda:3cf2 with SMTP id
 f19-20020a05620a409300b0069c0fda3cf2mr14963538qko.245.1650535745514; Thu, 21
 Apr 2022 03:09:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-29-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-29-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 21 Apr 2022 14:08:54 +0400
Message-ID: <CAJ+F1CJ+bEQM_ZzXaa_1cSWnJRd+oLZWjVnftUT_L43Ri7PQGw@mail.gmail.com>
Subject: Re: [PATCH 28/34] configure: simplify vhost-net-{user,
 vdpa} configuration
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ccf20505dd274c8f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qk1-x731.google.com
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

--000000000000ccf20505dd274c8f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 8:16 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Cleanup to ease review of the conversion to meson.  vhost_net_user and
> vhost_net_vdpa are never assigned anything in the command line parsing
> loop, so they are always equal to $vhost_user and $vhost_vdpa.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

 Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  configure | 17 ++++-------------
>  1 file changed, 4 insertions(+), 13 deletions(-)
>
> diff --git a/configure b/configure
> index 61b5acae10..2aa4dc3ce1 100755
> --- a/configure
> +++ b/configure
> @@ -1554,10 +1554,6 @@ if test "$vhost_vsock" =3D "yes" && test
> "$vhost_kernel" !=3D "yes"; then
>  fi
>
>  # vhost-user backends
> -test "$vhost_net_user" =3D "" && vhost_net_user=3D$vhost_user
> -if test "$vhost_net_user" =3D "yes" && test "$vhost_user" =3D "no"; then
> -  error_exit "--enable-vhost-net-user requires --enable-vhost-user"
> -fi
>  test "$vhost_crypto" =3D "" && vhost_crypto=3D$vhost_user
>  if test "$vhost_crypto" =3D "yes" && test "$vhost_user" =3D "no"; then
>    error_exit "--enable-vhost-crypto requires --enable-vhost-user"
> @@ -1566,16 +1562,11 @@ test "$vhost_user_fs" =3D "" &&
> vhost_user_fs=3D$vhost_user
>  if test "$vhost_user_fs" =3D "yes" && test "$vhost_user" =3D "no"; then
>    error_exit "--enable-vhost-user-fs requires --enable-vhost-user"
>  fi
> -#vhost-vdpa backends
> -test "$vhost_net_vdpa" =3D "" && vhost_net_vdpa=3D$vhost_vdpa
> -if test "$vhost_net_vdpa" =3D "yes" && test "$vhost_vdpa" =3D "no"; then
> -  error_exit "--enable-vhost-net-vdpa requires --enable-vhost-vdpa"
> -fi
>
>  # OR the vhost-kernel, vhost-vdpa and vhost-user values for simplicity
>  if test "$vhost_net" =3D ""; then
> -  test "$vhost_net_user" =3D "yes" && vhost_net=3Dyes
> -  test "$vhost_net_vdpa" =3D "yes" && vhost_net=3Dyes
> +  test "$vhost_user" =3D "yes" && vhost_net=3Dyes
> +  test "$vhost_vdpa" =3D "yes" && vhost_net=3Dyes
>    test "$vhost_kernel" =3D "yes" && vhost_net=3Dyes
>  fi
>
> @@ -2104,10 +2095,10 @@ fi
>  if test "$vhost_net" =3D "yes" ; then
>    echo "CONFIG_VHOST_NET=3Dy" >> $config_host_mak
>  fi
> -if test "$vhost_net_user" =3D "yes" ; then
> +if test "$vhost_user" =3D "yes" ; then
>    echo "CONFIG_VHOST_NET_USER=3Dy" >> $config_host_mak
>  fi
> -if test "$vhost_net_vdpa" =3D "yes" ; then
> +if test "$vhost_vdpa" =3D "yes" ; then
>    echo "CONFIG_VHOST_NET_VDPA=3Dy" >> $config_host_mak
>  fi
>  if test "$vhost_crypto" =3D "yes" ; then
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000ccf20505dd274c8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 8:16 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Clea=
nup to ease review of the conversion to meson.=C2=A0 vhost_net_user and<br>
vhost_net_vdpa are never assigned anything in the command line parsing<br>
loop, so they are always equal to $vhost_user and $vhost_vdpa.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div><div>=C2=A0Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:ma=
rcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div><b=
r></div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure | 17 ++++-------------<br>
=C2=A01 file changed, 4 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 61b5acae10..2aa4dc3ce1 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -1554,10 +1554,6 @@ if test &quot;$vhost_vsock&quot; =3D &quot;yes&quot;=
 &amp;&amp; test &quot;$vhost_kernel&quot; !=3D &quot;yes&quot;; then<br>
=C2=A0fi<br>
<br>
=C2=A0# vhost-user backends<br>
-test &quot;$vhost_net_user&quot; =3D &quot;&quot; &amp;&amp; vhost_net_use=
r=3D$vhost_user<br>
-if test &quot;$vhost_net_user&quot; =3D &quot;yes&quot; &amp;&amp; test &q=
uot;$vhost_user&quot; =3D &quot;no&quot;; then<br>
-=C2=A0 error_exit &quot;--enable-vhost-net-user requires --enable-vhost-us=
er&quot;<br>
-fi<br>
=C2=A0test &quot;$vhost_crypto&quot; =3D &quot;&quot; &amp;&amp; vhost_cryp=
to=3D$vhost_user<br>
=C2=A0if test &quot;$vhost_crypto&quot; =3D &quot;yes&quot; &amp;&amp; test=
 &quot;$vhost_user&quot; =3D &quot;no&quot;; then<br>
=C2=A0 =C2=A0error_exit &quot;--enable-vhost-crypto requires --enable-vhost=
-user&quot;<br>
@@ -1566,16 +1562,11 @@ test &quot;$vhost_user_fs&quot; =3D &quot;&quot; &a=
mp;&amp; vhost_user_fs=3D$vhost_user<br>
=C2=A0if test &quot;$vhost_user_fs&quot; =3D &quot;yes&quot; &amp;&amp; tes=
t &quot;$vhost_user&quot; =3D &quot;no&quot;; then<br>
=C2=A0 =C2=A0error_exit &quot;--enable-vhost-user-fs requires --enable-vhos=
t-user&quot;<br>
=C2=A0fi<br>
-#vhost-vdpa backends<br>
-test &quot;$vhost_net_vdpa&quot; =3D &quot;&quot; &amp;&amp; vhost_net_vdp=
a=3D$vhost_vdpa<br>
-if test &quot;$vhost_net_vdpa&quot; =3D &quot;yes&quot; &amp;&amp; test &q=
uot;$vhost_vdpa&quot; =3D &quot;no&quot;; then<br>
-=C2=A0 error_exit &quot;--enable-vhost-net-vdpa requires --enable-vhost-vd=
pa&quot;<br>
-fi<br>
<br>
=C2=A0# OR the vhost-kernel, vhost-vdpa and vhost-user values for simplicit=
y<br>
=C2=A0if test &quot;$vhost_net&quot; =3D &quot;&quot;; then<br>
-=C2=A0 test &quot;$vhost_net_user&quot; =3D &quot;yes&quot; &amp;&amp; vho=
st_net=3Dyes<br>
-=C2=A0 test &quot;$vhost_net_vdpa&quot; =3D &quot;yes&quot; &amp;&amp; vho=
st_net=3Dyes<br>
+=C2=A0 test &quot;$vhost_user&quot; =3D &quot;yes&quot; &amp;&amp; vhost_n=
et=3Dyes<br>
+=C2=A0 test &quot;$vhost_vdpa&quot; =3D &quot;yes&quot; &amp;&amp; vhost_n=
et=3Dyes<br>
=C2=A0 =C2=A0test &quot;$vhost_kernel&quot; =3D &quot;yes&quot; &amp;&amp; =
vhost_net=3Dyes<br>
=C2=A0fi<br>
<br>
@@ -2104,10 +2095,10 @@ fi<br>
=C2=A0if test &quot;$vhost_net&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_VHOST_NET=3Dy&quot; &gt;&gt; $config_host_ma=
k<br>
=C2=A0fi<br>
-if test &quot;$vhost_net_user&quot; =3D &quot;yes&quot; ; then<br>
+if test &quot;$vhost_user&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_VHOST_NET_USER=3Dy&quot; &gt;&gt; $config_ho=
st_mak<br>
=C2=A0fi<br>
-if test &quot;$vhost_net_vdpa&quot; =3D &quot;yes&quot; ; then<br>
+if test &quot;$vhost_vdpa&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_VHOST_NET_VDPA=3Dy&quot; &gt;&gt; $config_ho=
st_mak<br>
=C2=A0fi<br>
=C2=A0if test &quot;$vhost_crypto&quot; =3D &quot;yes&quot; ; then<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000ccf20505dd274c8f--

