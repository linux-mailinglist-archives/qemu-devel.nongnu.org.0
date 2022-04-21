Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0E3509F8B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 14:23:32 +0200 (CEST)
Received: from localhost ([::1]:41130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVqN-0003Rv-IG
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 08:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhVIf-0004nj-Lh
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:48:45 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:42734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhVIb-0008Qv-Vw
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:48:41 -0400
Received: by mail-qt1-x829.google.com with SMTP id x12so3002030qtp.9
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WlExs/eOpJPbaNC+DAVVQkmaCprKA+8/dPSyiMV/BIg=;
 b=OXam5f2/K6mN3HSiL3rz3STQRq+yet0O78FFzN0XJ3xBrMSyrMjB8UgMNbnAbyfsQr
 uDwKeU03q6R+8DUCGS6uH4jRGp+AFsPW8QLFHnU5KAyO+yZEIOKSyryYEiY/fVq6VSlA
 cE60oi+Sy0AkZ5dxJ/wf+D8kqL9jojNgmliaB2DkvJv7MIoU5JUr9Fjl2+80Nt6Nl7DN
 pDvdYYx0jzWB1gLTGmI1DphysrkQ94IZOhHDmDKk3SSlNZrjRO2g9be2xI86kwJ/03jX
 86suDgybCfSyNqr4WqBpmAZmvNAJ6Xk3G4sN344shppHOh9J301++AOUstXFfUIwj5QX
 OIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WlExs/eOpJPbaNC+DAVVQkmaCprKA+8/dPSyiMV/BIg=;
 b=abiSOx9iWADbDsQAmFqQ8l5TC9fvQ/j2Ob3lFgdU2Q1nU/YTKzkQ400cn06AB1Bera
 c4GKGBJF9MNqmpMBd4qD4wzQhDSZVaWMZjX3SAbHqxxHLPL8EgSia7FiqgOpjzX8EhCA
 UYaD7dcW8CWEUuNF+gNBWbh45i7VMCokBeqzmAFlyL25xjCtQerqPkP/jy7biqVt+OZ6
 2V3QOPcGiM0fo54HBnDIpILqeGJfJm7oid2ZDjylHUYt7vVSGmks+Vq/AtDB0wXD5AI8
 sgyTlxO5KQbis3m5s88Hl2T5iT43V+r+b8thojmt7K+fvUhanKygS+G+2eVn5EPQjqK7
 bkzQ==
X-Gm-Message-State: AOAM533VAAR/CZwYDdWe8K7XZH/toYrjIWNwVL8rSXmSQU+eeD5m6FBU
 8TDXS2Z1Vlz8chJoSwX3t5bmauFzKCVnB9J9Af4=
X-Google-Smtp-Source: ABdhPJyRhFXssnqiW7J3N2G4HLd0MZbQWHC5g2uJnUnwJQ878PigIYBINNUhBnYySskUH25G3GESgkfsn8GkOk03u3k=
X-Received: by 2002:ac8:4e46:0:b0:2e1:b933:ec06 with SMTP id
 e6-20020ac84e46000000b002e1b933ec06mr17001346qtw.684.1650541716828; Thu, 21
 Apr 2022 04:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-32-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-32-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 21 Apr 2022 15:48:25 +0400
Message-ID: <CAJ+F1C+zzut+kqbp5RJ9DhvRRQD4SWB75Jn6p9D+RFYSy7AvTw@mail.gmail.com>
Subject: Re: [PATCH 31/34] build: move vhost-user-fs configuration to Kconfig
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b7f62705dd28b08b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qt1-x829.google.com
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

--000000000000b7f62705dd28b08b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 8:24 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> vhost-user-fs is a device and it should be possible to enable/disable
> it with --without-default-devices, not --without-default-features.
> Compute its default value in Kconfig to obtain the more intuitive
> behavior.
>
> In this case the configure options were undocumented, too.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  configure         | 12 ------------
>  hw/virtio/Kconfig |  5 +++++
>  meson.build       |  1 -
>  3 files changed, 5 insertions(+), 13 deletions(-)
>
> diff --git a/configure b/configure
> index 65ae2c0c1f..3b38ff3c63 100755
> --- a/configure
> +++ b/configure
> @@ -286,7 +286,6 @@ vhost_kernel=3D"$default_feature"
>  vhost_net=3D"$default_feature"
>  vhost_crypto=3D"$default_feature"
>  vhost_user=3D"no"
> -vhost_user_fs=3D"$default_feature"
>  vhost_vdpa=3D"$default_feature"
>  debug_tcg=3D"no"
>  sanitizers=3D"no"
> @@ -872,10 +871,6 @@ for opt do
>    ;;
>    --enable-vhost-crypto) vhost_crypto=3D"yes"
>    ;;
> -  --disable-vhost-user-fs) vhost_user_fs=3D"no"
> -  ;;
> -  --enable-vhost-user-fs) vhost_user_fs=3D"yes"
> -  ;;
>    --disable-zlib-test)
>    ;;
>    --disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane)
> @@ -1536,10 +1531,6 @@ test "$vhost_crypto" =3D "" &&
> vhost_crypto=3D$vhost_user
>  if test "$vhost_crypto" =3D "yes" && test "$vhost_user" =3D "no"; then
>    error_exit "--enable-vhost-crypto requires --enable-vhost-user"
>  fi
> -test "$vhost_user_fs" =3D "" && vhost_user_fs=3D$vhost_user
> -if test "$vhost_user_fs" =3D "yes" && test "$vhost_user" =3D "no"; then
> -  error_exit "--enable-vhost-user-fs requires --enable-vhost-user"
> -fi
>
>  # OR the vhost-kernel, vhost-vdpa and vhost-user values for simplicity
>  if test "$vhost_net" =3D ""; then
> @@ -2088,9 +2079,6 @@ fi
>  if test "$vhost_vdpa" =3D "yes" ; then
>    echo "CONFIG_VHOST_VDPA=3Dy" >> $config_host_mak
>  fi
> -if test "$vhost_user_fs" =3D "yes" ; then
> -  echo "CONFIG_VHOST_USER_FS=3Dy" >> $config_host_mak
> -fi
>
>  # XXX: suppress that
>  if [ "$bsd" =3D "yes" ] ; then
> diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
> index b642ae1081..f8e235f814 100644
> --- a/hw/virtio/Kconfig
> +++ b/hw/virtio/Kconfig
> @@ -78,3 +78,8 @@ config VHOST_USER_RNG
>      bool
>      default y
>      depends on VIRTIO && VHOST_USER
> +
> +config VHOST_USER_FS
> +    bool
> +    default y
> +    depends on VIRTIO && VHOST_USER
> diff --git a/meson.build b/meson.build
> index b18731ee84..870dd8dee0 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3679,7 +3679,6 @@ summary_info +=3D {'vhost-net support':
> config_host.has_key('CONFIG_VHOST_NET')}
>  summary_info +=3D {'vhost-crypto support':
> config_host.has_key('CONFIG_VHOST_CRYPTO')}
>  summary_info +=3D {'vhost-user support':
> config_host.has_key('CONFIG_VHOST_USER')}
>  summary_info +=3D {'vhost-user-blk server support':
> have_vhost_user_blk_server}
> -summary_info +=3D {'vhost-user-fs support':
> config_host.has_key('CONFIG_VHOST_USER_FS')}
>  summary_info +=3D {'vhost-vdpa support':
> config_host.has_key('CONFIG_VHOST_VDPA')}
>  summary_info +=3D {'build guest agent': have_ga}
>  summary(summary_info, bool_yn: true, section: 'Configurable features')
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000b7f62705dd28b08b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 8:24 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">vhos=
t-user-fs is a device and it should be possible to enable/disable<br>
it with --without-default-devices, not --without-default-features.<br>
Compute its default value in Kconfig to obtain the more intuitive<br>
behavior.<br>
<br>
In this case the configure options were undocumented, too.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;</div>=
<div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 ------------<br>
=C2=A0hw/virtio/Kconfig |=C2=A0 5 +++++<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
=C2=A03 files changed, 5 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 65ae2c0c1f..3b38ff3c63 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -286,7 +286,6 @@ vhost_kernel=3D&quot;$default_feature&quot;<br>
=C2=A0vhost_net=3D&quot;$default_feature&quot;<br>
=C2=A0vhost_crypto=3D&quot;$default_feature&quot;<br>
=C2=A0vhost_user=3D&quot;no&quot;<br>
-vhost_user_fs=3D&quot;$default_feature&quot;<br>
=C2=A0vhost_vdpa=3D&quot;$default_feature&quot;<br>
=C2=A0debug_tcg=3D&quot;no&quot;<br>
=C2=A0sanitizers=3D&quot;no&quot;<br>
@@ -872,10 +871,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-vhost-crypto) vhost_crypto=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-vhost-user-fs) vhost_user_fs=3D&quot;no&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-vhost-user-fs) vhost_user_fs=3D&quot;yes&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--disable-zlib-test)<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane=
)<br>
@@ -1536,10 +1531,6 @@ test &quot;$vhost_crypto&quot; =3D &quot;&quot; &amp=
;&amp; vhost_crypto=3D$vhost_user<br>
=C2=A0if test &quot;$vhost_crypto&quot; =3D &quot;yes&quot; &amp;&amp; test=
 &quot;$vhost_user&quot; =3D &quot;no&quot;; then<br>
=C2=A0 =C2=A0error_exit &quot;--enable-vhost-crypto requires --enable-vhost=
-user&quot;<br>
=C2=A0fi<br>
-test &quot;$vhost_user_fs&quot; =3D &quot;&quot; &amp;&amp; vhost_user_fs=
=3D$vhost_user<br>
-if test &quot;$vhost_user_fs&quot; =3D &quot;yes&quot; &amp;&amp; test &qu=
ot;$vhost_user&quot; =3D &quot;no&quot;; then<br>
-=C2=A0 error_exit &quot;--enable-vhost-user-fs requires --enable-vhost-use=
r&quot;<br>
-fi<br>
<br>
=C2=A0# OR the vhost-kernel, vhost-vdpa and vhost-user values for simplicit=
y<br>
=C2=A0if test &quot;$vhost_net&quot; =3D &quot;&quot;; then<br>
@@ -2088,9 +2079,6 @@ fi<br>
=C2=A0if test &quot;$vhost_vdpa&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_VHOST_VDPA=3Dy&quot; &gt;&gt; $config_host_m=
ak<br>
=C2=A0fi<br>
-if test &quot;$vhost_user_fs&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_VHOST_USER_FS=3Dy&quot; &gt;&gt; $config_host_mak=
<br>
-fi<br>
<br>
=C2=A0# XXX: suppress that<br>
=C2=A0if [ &quot;$bsd&quot; =3D &quot;yes&quot; ] ; then<br>
diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig<br>
index b642ae1081..f8e235f814 100644<br>
--- a/hw/virtio/Kconfig<br>
+++ b/hw/virtio/Kconfig<br>
@@ -78,3 +78,8 @@ config VHOST_USER_RNG<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0default y<br>
=C2=A0 =C2=A0 =C2=A0depends on VIRTIO &amp;&amp; VHOST_USER<br>
+<br>
+config VHOST_USER_FS<br>
+=C2=A0 =C2=A0 bool<br>
+=C2=A0 =C2=A0 default y<br>
+=C2=A0 =C2=A0 depends on VIRTIO &amp;&amp; VHOST_USER<br>
diff --git a/meson.build b/meson.build<br>
index b18731ee84..870dd8dee0 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -3679,7 +3679,6 @@ summary_info +=3D {&#39;vhost-net support&#39;: confi=
g_host.has_key(&#39;CONFIG_VHOST_NET&#39;)}<br>
=C2=A0summary_info +=3D {&#39;vhost-crypto support&#39;: config_host.has_ke=
y(&#39;CONFIG_VHOST_CRYPTO&#39;)}<br>
=C2=A0summary_info +=3D {&#39;vhost-user support&#39;: config_host.has_key(=
&#39;CONFIG_VHOST_USER&#39;)}<br>
=C2=A0summary_info +=3D {&#39;vhost-user-blk server support&#39;: have_vhos=
t_user_blk_server}<br>
-summary_info +=3D {&#39;vhost-user-fs support&#39;: config_host.has_key(&#=
39;CONFIG_VHOST_USER_FS&#39;)}<br>
=C2=A0summary_info +=3D {&#39;vhost-vdpa support&#39;: config_host.has_key(=
&#39;CONFIG_VHOST_VDPA&#39;)}<br>
=C2=A0summary_info +=3D {&#39;build guest agent&#39;: have_ga}<br>
=C2=A0summary(summary_info, bool_yn: true, section: &#39;Configurable featu=
res&#39;)<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000b7f62705dd28b08b--

