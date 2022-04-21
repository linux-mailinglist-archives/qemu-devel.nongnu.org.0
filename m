Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B380D509F10
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:55:02 +0200 (CEST)
Received: from localhost ([::1]:44346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVOn-00040F-OU
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhV9K-0001ae-5W
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:39:02 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:44794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhV9G-000772-BK
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:39:01 -0400
Received: by mail-qt1-x82e.google.com with SMTP id x24so2989901qtq.11
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2fvZq8x0fVzuls7jdZet2MG00zf4E1VsjdtnmodZlfw=;
 b=MKNZQeu94liIxt3+Yh7W2D+HGC+0I23gOSK7HrSEZVcsk0Ze1gw8bUma59j6SSky4R
 IDa7gJ5xI1tSqh7Jbqkwl13Ohm0NTyDmet4VMPN/HibMGG6vfygWe9v95dIfs3n3wiS5
 XoxXtQTetIIUgoIMv3nDuvaBQho+ZP5dJumJRjHZ2dV49MhzwL4nNt3/5BOOdGH+kxlA
 85pTbRR4UAMLsh8UCBC3GgdTTo0TsPj+Dcq5Oz4OaVUn7KPUBbpbGyWcQyFTJRiGQGA2
 Vq6Jite+ZLH3hC0olDUXwzRlyMScRNTQ32c2+ZeJwdAHsKQA0KMazF3m3LfrXE6BoYVy
 C4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2fvZq8x0fVzuls7jdZet2MG00zf4E1VsjdtnmodZlfw=;
 b=2I1SWnqffuHLo9dF9SfRaW5kTgUcp7WB7udbjq36FhuM5MdVeIBtTz3rvqanneQnB2
 3xkSqIt9t/HeoZb2qJnfr2KXBes4T7NUVsqLlaEf62vFal9VMiLuoHX5kClGwQO7O6pI
 Ej4CfKdbOtx+4id7Fm0s2Y5sos1f2E0MHWMt39OAy5Or9vrs3wJ8KDXalYm59NszVgzs
 lkH6n32bAo6yTvv5MNTB5scK+cAUc8qTiYnUBqXy86NqD8+tyU0oRKbbjTXC/GxZWBGr
 Jodz85dI3nBr1S8y3EJTkvzjSFPb4dtmX5oj2LN9NCeVYPRJr9K08Ta1n+ckrfLhIrPB
 MlVQ==
X-Gm-Message-State: AOAM531eKrrEcBdcgyi67WumtPYGCvN7f4QFAWt1XnQEtYrQ2vZehkfL
 EMTZWM73qUDs6JSU3HcB6X5FZ8ezdbcGzS9sRU4=
X-Google-Smtp-Source: ABdhPJz7WMXGeKs9Su3Tu+DsyiJaz05w/palXizpCXcgjV4tOERjGq2j4aldYSVYwPcAcGBD4dBy3Jj4O60HENP0P3c=
X-Received: by 2002:a05:622a:cc:b0:2f1:fc74:c7a6 with SMTP id
 p12-20020a05622a00cc00b002f1fc74c7a6mr13228326qtw.387.1650541137408; Thu, 21
 Apr 2022 04:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-30-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-30-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 21 Apr 2022 15:38:46 +0400
Message-ID: <CAJ+F1CLfYjD0mZs3zx1C38dGsJ77oCB4m1G1ei8cU9qU8tFtfQ@mail.gmail.com>
Subject: Re: [PATCH 29/34] build: move vhost-vsock configuration to Kconfig
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000002eb5c305dd288ed6"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qt1-x82e.google.com
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

--0000000000002eb5c305dd288ed6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 8:19 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> vhost-vsock and vhost-user-vsock are two devices of their own; it should
> be possible to enable/disable them with --without-default-devices, not
> --without-default-features.  Compute their default value in Kconfig to
> obtain the more intuitive behavior.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

We also lose the configure options, but it is overdue

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  configure         | 16 ----------------
>  hw/virtio/Kconfig | 10 ++++++++++
>  meson.build       |  1 -
>  3 files changed, 10 insertions(+), 17 deletions(-)
>
> diff --git a/configure b/configure
> index 2aa4dc3ce1..a3b57877e5 100755
> --- a/configure
> +++ b/configure
> @@ -286,7 +286,6 @@ vhost_kernel=3D"$default_feature"
>  vhost_net=3D"$default_feature"
>  vhost_crypto=3D"$default_feature"
>  vhost_scsi=3D"$default_feature"
> -vhost_vsock=3D"$default_feature"
>  vhost_user=3D"no"
>  vhost_user_fs=3D"$default_feature"
>  vhost_vdpa=3D"$default_feature"
> @@ -878,10 +877,6 @@ for opt do
>    ;;
>    --enable-vhost-scsi) vhost_scsi=3D"yes"
>    ;;
> -  --disable-vhost-vsock) vhost_vsock=3D"no"
> -  ;;
> -  --enable-vhost-vsock) vhost_vsock=3D"yes"
> -  ;;
>    --disable-vhost-user-fs) vhost_user_fs=3D"no"
>    ;;
>    --enable-vhost-user-fs) vhost_user_fs=3D"yes"
> @@ -1108,7 +1103,6 @@ cat << EOF
>    safe-stack      SafeStack Stack Smash Protection. Depends on
>                    clang/llvm >=3D 3.7 and requires coroutine backend
> ucontext.
>    vhost-net       vhost-net kernel acceleration support
> -  vhost-vsock     virtio sockets device support
>    vhost-scsi      vhost-scsi kernel target support
>    vhost-crypto    vhost-user-crypto backend support
>    vhost-kernel    vhost kernel backend support
> @@ -1548,10 +1542,6 @@ test "$vhost_scsi" =3D "" && vhost_scsi=3D$vhost_k=
ernel
>  if test "$vhost_scsi" =3D "yes" && test "$vhost_kernel" !=3D "yes"; then
>    error_exit "--enable-vhost-scsi requires --enable-vhost-kernel"
>  fi
> -test "$vhost_vsock" =3D "" && vhost_vsock=3D$vhost_kernel
> -if test "$vhost_vsock" =3D "yes" && test "$vhost_kernel" !=3D "yes"; the=
n
> -  error_exit "--enable-vhost-vsock requires --enable-vhost-kernel"
> -fi
>
>  # vhost-user backends
>  test "$vhost_crypto" =3D "" && vhost_crypto=3D$vhost_user
> @@ -2104,12 +2094,6 @@ fi
>  if test "$vhost_crypto" =3D "yes" ; then
>    echo "CONFIG_VHOST_CRYPTO=3Dy" >> $config_host_mak
>  fi
> -if test "$vhost_vsock" =3D "yes" ; then
> -  echo "CONFIG_VHOST_VSOCK=3Dy" >> $config_host_mak
> -  if test "$vhost_user" =3D "yes" ; then
> -    echo "CONFIG_VHOST_USER_VSOCK=3Dy" >> $config_host_mak
> -  fi
> -fi
>  if test "$vhost_kernel" =3D "yes" ; then
>    echo "CONFIG_VHOST_KERNEL=3Dy" >> $config_host_mak
>  fi
> diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
> index c144d42f9b..b642ae1081 100644
> --- a/hw/virtio/Kconfig
> +++ b/hw/virtio/Kconfig
> @@ -59,6 +59,16 @@ config VIRTIO_MEM
>      depends on VIRTIO_MEM_SUPPORTED
>      select MEM_DEVICE
>
> +config VHOST_VSOCK
> +    bool
> +    default y
> +    depends on VIRTIO && VHOST_KERNEL
> +
> +config VHOST_USER_VSOCK
> +    bool
> +    default y
> +    depends on VIRTIO && VHOST_USER
> +
>  config VHOST_USER_I2C
>      bool
>      default y
> diff --git a/meson.build b/meson.build
> index ff5c076805..033d0c9aa1 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3678,7 +3678,6 @@ summary_info +=3D {'vhost-kernel support':
> config_host.has_key('CONFIG_VHOST_KERNE
>  summary_info +=3D {'vhost-net support':
> config_host.has_key('CONFIG_VHOST_NET')}
>  summary_info +=3D {'vhost-crypto support':
> config_host.has_key('CONFIG_VHOST_CRYPTO')}
>  summary_info +=3D {'vhost-scsi support':
> config_host.has_key('CONFIG_VHOST_SCSI')}
> -summary_info +=3D {'vhost-vsock support':
> config_host.has_key('CONFIG_VHOST_VSOCK')}
>  summary_info +=3D {'vhost-user support':
> config_host.has_key('CONFIG_VHOST_USER')}
>  summary_info +=3D {'vhost-user-blk server support':
> have_vhost_user_blk_server}
>  summary_info +=3D {'vhost-user-fs support':
> config_host.has_key('CONFIG_VHOST_USER_FS')}
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000002eb5c305dd288ed6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Wed, Apr 20, 2022 at 8:19 PM Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@r=
edhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">vhost-vsock and vhost-user-vsock are two devi=
ces of their own; it should<br>
be possible to enable/disable them with --without-default-devices, not<br>
--without-default-features.=C2=A0 Compute their default value in Kconfig to=
<br>
obtain the more intuitive behavior.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div>W=
e also lose the configure options, but it is overdue<br></div><div class=3D=
"gmail_quote"><br></div><div class=3D"gmail_quote">Reviewed-by: Marc-Andr=
=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.=
lureau@redhat.com</a>&gt;<div>=C2=A0<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 16 ----------------<br>
=C2=A0hw/virtio/Kconfig | 10 ++++++++++<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
=C2=A03 files changed, 10 insertions(+), 17 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 2aa4dc3ce1..a3b57877e5 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -286,7 +286,6 @@ vhost_kernel=3D&quot;$default_feature&quot;<br>
=C2=A0vhost_net=3D&quot;$default_feature&quot;<br>
=C2=A0vhost_crypto=3D&quot;$default_feature&quot;<br>
=C2=A0vhost_scsi=3D&quot;$default_feature&quot;<br>
-vhost_vsock=3D&quot;$default_feature&quot;<br>
=C2=A0vhost_user=3D&quot;no&quot;<br>
=C2=A0vhost_user_fs=3D&quot;$default_feature&quot;<br>
=C2=A0vhost_vdpa=3D&quot;$default_feature&quot;<br>
@@ -878,10 +877,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-vhost-scsi) vhost_scsi=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-vhost-vsock) vhost_vsock=3D&quot;no&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-vhost-vsock) vhost_vsock=3D&quot;yes&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--disable-vhost-user-fs) vhost_user_fs=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-vhost-user-fs) vhost_user_fs=3D&quot;yes&quot;<br>
@@ -1108,7 +1103,6 @@ cat &lt;&lt; EOF<br>
=C2=A0 =C2=A0safe-stack=C2=A0 =C2=A0 =C2=A0 SafeStack Stack Smash Protectio=
n. Depends on<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clang/=
llvm &gt;=3D 3.7 and requires coroutine backend ucontext.<br>
=C2=A0 =C2=A0vhost-net=C2=A0 =C2=A0 =C2=A0 =C2=A0vhost-net kernel accelerat=
ion support<br>
-=C2=A0 vhost-vsock=C2=A0 =C2=A0 =C2=A0virtio sockets device support<br>
=C2=A0 =C2=A0vhost-scsi=C2=A0 =C2=A0 =C2=A0 vhost-scsi kernel target suppor=
t<br>
=C2=A0 =C2=A0vhost-crypto=C2=A0 =C2=A0 vhost-user-crypto backend support<br=
>
=C2=A0 =C2=A0vhost-kernel=C2=A0 =C2=A0 vhost kernel backend support<br>
@@ -1548,10 +1542,6 @@ test &quot;$vhost_scsi&quot; =3D &quot;&quot; &amp;&=
amp; vhost_scsi=3D$vhost_kernel<br>
=C2=A0if test &quot;$vhost_scsi&quot; =3D &quot;yes&quot; &amp;&amp; test &=
quot;$vhost_kernel&quot; !=3D &quot;yes&quot;; then<br>
=C2=A0 =C2=A0error_exit &quot;--enable-vhost-scsi requires --enable-vhost-k=
ernel&quot;<br>
=C2=A0fi<br>
-test &quot;$vhost_vsock&quot; =3D &quot;&quot; &amp;&amp; vhost_vsock=3D$v=
host_kernel<br>
-if test &quot;$vhost_vsock&quot; =3D &quot;yes&quot; &amp;&amp; test &quot=
;$vhost_kernel&quot; !=3D &quot;yes&quot;; then<br>
-=C2=A0 error_exit &quot;--enable-vhost-vsock requires --enable-vhost-kerne=
l&quot;<br>
-fi<br>
<br>
=C2=A0# vhost-user backends<br>
=C2=A0test &quot;$vhost_crypto&quot; =3D &quot;&quot; &amp;&amp; vhost_cryp=
to=3D$vhost_user<br>
@@ -2104,12 +2094,6 @@ fi<br>
=C2=A0if test &quot;$vhost_crypto&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_VHOST_CRYPTO=3Dy&quot; &gt;&gt; $config_host=
_mak<br>
=C2=A0fi<br>
-if test &quot;$vhost_vsock&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_VHOST_VSOCK=3Dy&quot; &gt;&gt; $config_host_mak<b=
r>
-=C2=A0 if test &quot;$vhost_user&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 echo &quot;CONFIG_VHOST_USER_VSOCK=3Dy&quot; &gt;&gt; $confi=
g_host_mak<br>
-=C2=A0 fi<br>
-fi<br>
=C2=A0if test &quot;$vhost_kernel&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_VHOST_KERNEL=3Dy&quot; &gt;&gt; $config_host=
_mak<br>
=C2=A0fi<br>
diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig<br>
index c144d42f9b..b642ae1081 100644<br>
--- a/hw/virtio/Kconfig<br>
+++ b/hw/virtio/Kconfig<br>
@@ -59,6 +59,16 @@ config VIRTIO_MEM<br>
=C2=A0 =C2=A0 =C2=A0depends on VIRTIO_MEM_SUPPORTED<br>
=C2=A0 =C2=A0 =C2=A0select MEM_DEVICE<br>
<br>
+config VHOST_VSOCK<br>
+=C2=A0 =C2=A0 bool<br>
+=C2=A0 =C2=A0 default y<br>
+=C2=A0 =C2=A0 depends on VIRTIO &amp;&amp; VHOST_KERNEL<br>
+<br>
+config VHOST_USER_VSOCK<br>
+=C2=A0 =C2=A0 bool<br>
+=C2=A0 =C2=A0 default y<br>
+=C2=A0 =C2=A0 depends on VIRTIO &amp;&amp; VHOST_USER<br>
+<br>
=C2=A0config VHOST_USER_I2C<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0default y<br>
diff --git a/meson.build b/meson.build<br>
index ff5c076805..033d0c9aa1 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -3678,7 +3678,6 @@ summary_info +=3D {&#39;vhost-kernel support&#39;: co=
nfig_host.has_key(&#39;CONFIG_VHOST_KERNE<br>
=C2=A0summary_info +=3D {&#39;vhost-net support&#39;: config_host.has_key(&=
#39;CONFIG_VHOST_NET&#39;)}<br>
=C2=A0summary_info +=3D {&#39;vhost-crypto support&#39;: config_host.has_ke=
y(&#39;CONFIG_VHOST_CRYPTO&#39;)}<br>
=C2=A0summary_info +=3D {&#39;vhost-scsi support&#39;: config_host.has_key(=
&#39;CONFIG_VHOST_SCSI&#39;)}<br>
-summary_info +=3D {&#39;vhost-vsock support&#39;: config_host.has_key(&#39=
;CONFIG_VHOST_VSOCK&#39;)}<br>
=C2=A0summary_info +=3D {&#39;vhost-user support&#39;: config_host.has_key(=
&#39;CONFIG_VHOST_USER&#39;)}<br>
=C2=A0summary_info +=3D {&#39;vhost-user-blk server support&#39;: have_vhos=
t_user_blk_server}<br>
=C2=A0summary_info +=3D {&#39;vhost-user-fs support&#39;: config_host.has_k=
ey(&#39;CONFIG_VHOST_USER_FS&#39;)}<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div></div></div>

--0000000000002eb5c305dd288ed6--

