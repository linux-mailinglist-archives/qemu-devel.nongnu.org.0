Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0521509F2A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:59:09 +0200 (CEST)
Received: from localhost ([::1]:53634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVSm-0005GY-Sm
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhVHX-0002Vs-GL
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:47:31 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:35370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhVHV-0008Ln-Bp
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:47:31 -0400
Received: by mail-qv1-xf32.google.com with SMTP id h13so3480457qvr.2
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JQS+0AwhEfrtFVOCAJJArY2mJ4igv65gE2kiBQS24T4=;
 b=RbMhdpFPSO/NAWEwYVGS/P77lop0XDgtgO8l+DQJGuCUHtDaRda7l2mPkmd992Hleu
 vIdGU55U4jgYvSYBEkE5HRK6YNj7pyCtEiCLu54lMyYzJuQIcr6Qmf0i3HD9PQgwpKZC
 sRNZqMo/uK1hviv1yoqPtsSrJZvRHMpNNFot6r7ivz1DjiGVJ65FvO33Pb+nU3fa0y1s
 9Hk1eOPM0+tsQhp4Ok1zQTcpy54qSliFSqINsDVMM9xhBwb0a3lP4wHuvnRDSgGMQQtt
 ypAiySJVG8DR7SvqTXQT009EYsfi1gjDXyVLaHkU/FdgwCC4KeeyP72Bqft11gQX7WKG
 QsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JQS+0AwhEfrtFVOCAJJArY2mJ4igv65gE2kiBQS24T4=;
 b=J90vX01MvTsRv47cvzI2/usCFx+vxOYlAzLGjshgiElQRJ5LPro8Zmt4yacvrRN8Ns
 Yyo3yfLB4hPsRYKKiPdfkIVbovbEhBN+U5cfBxeXuXittr12QYkryQAg5rELZ6urCxlJ
 SC1Cdpy9oE5cvqVjoZO+mQvnSq1xH4GLErUIqgKwpxwrpunoItgvO583FrP79zl7RwKL
 rKf8lniSuqhDIJ61vizx8fryen6V5lGwe0umBIESIz1kBbnTrzGT9b/2GDLfMWcK+e/d
 KD2gURDhBbucpxZHFjvzR/Cpto3PovqABqpRcPtaR/xtWwU3u3jnjrJmz2RArFIt2uRF
 1EKQ==
X-Gm-Message-State: AOAM530K2PtzQX32jyI23G9ufyVK75tH3LWI6p5uI6lZc9c+I0OiCFw5
 UQ4qd4hc1p7w5fq7bbmtaM5Y5TPFzCJBvi/QnqBFS6Xl8MkJxA==
X-Google-Smtp-Source: ABdhPJw1kbvfAwqxhpKtxDg4WE5/xfluRpeooEaAGrOtps98ns01i7z4wsev7SX5t8jqTnmYuC7BNztUFlQRzkV2tPw=
X-Received: by 2002:ad4:5642:0:b0:444:47e1:b244 with SMTP id
 bl2-20020ad45642000000b0044447e1b244mr18807461qvb.4.1650541648408; Thu, 21
 Apr 2022 04:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-31-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-31-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 21 Apr 2022 15:47:17 +0400
Message-ID: <CAJ+F1CLXoRQE13ig=txWHBRN7BpqkKLFto1cwPQOAtLHHgcu0A@mail.gmail.com>
Subject: Re: [PATCH 30/34] build: move vhost-scsi configuration to Kconfig
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a3f2b905dd28ac72"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qv1-xf32.google.com
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

--000000000000a3f2b905dd28ac72
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 8:23 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> vhost-scsi and vhost-user-scsi are two devices of their own; it should
> be possible to enable/disable them with --without-default-devices, not
> --without-default-features.  Compute their default value in Kconfig to
> obtain the more intuitive behavior.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  configure                       | 15 ---------------
>  hw/scsi/Kconfig                 |  5 +++++
>  include/hw/virtio/virtio-scsi.h |  2 --
>  meson.build                     |  1 -
>  4 files changed, 5 insertions(+), 18 deletions(-)
>
> diff --git a/configure b/configure
> index a3b57877e5..65ae2c0c1f 100755
> --- a/configure
> +++ b/configure
> @@ -285,7 +285,6 @@ EXTRA_LDFLAGS=3D""
>  vhost_kernel=3D"$default_feature"
>  vhost_net=3D"$default_feature"
>  vhost_crypto=3D"$default_feature"
> -vhost_scsi=3D"$default_feature"
>  vhost_user=3D"no"
>  vhost_user_fs=3D"$default_feature"
>  vhost_vdpa=3D"$default_feature"
> @@ -873,10 +872,6 @@ for opt do
>    ;;
>    --enable-vhost-crypto) vhost_crypto=3D"yes"
>    ;;
> -  --disable-vhost-scsi) vhost_scsi=3D"no"
> -  ;;
> -  --enable-vhost-scsi) vhost_scsi=3D"yes"
> -  ;;
>    --disable-vhost-user-fs) vhost_user_fs=3D"no"
>    ;;
>    --enable-vhost-user-fs) vhost_user_fs=3D"yes"
> @@ -1103,7 +1098,6 @@ cat << EOF
>    safe-stack      SafeStack Stack Smash Protection. Depends on
>                    clang/llvm >=3D 3.7 and requires coroutine backend
> ucontext.
>    vhost-net       vhost-net kernel acceleration support
> -  vhost-scsi      vhost-scsi kernel target support
>    vhost-crypto    vhost-user-crypto backend support
>    vhost-kernel    vhost kernel backend support
>    vhost-user      vhost-user backend support
> @@ -1537,12 +1531,6 @@ if test "$vhost_kernel" =3D "yes" && test "$linux"=
 !=3D
> "yes"; then
>    error_exit "vhost-kernel is only available on Linux"
>  fi
>
> -# vhost-kernel devices
> -test "$vhost_scsi" =3D "" && vhost_scsi=3D$vhost_kernel
> -if test "$vhost_scsi" =3D "yes" && test "$vhost_kernel" !=3D "yes"; then
> -  error_exit "--enable-vhost-scsi requires --enable-vhost-kernel"
> -fi
> -
>  # vhost-user backends
>  test "$vhost_crypto" =3D "" && vhost_crypto=3D$vhost_user
>  if test "$vhost_crypto" =3D "yes" && test "$vhost_user" =3D "no"; then
> @@ -2079,9 +2067,6 @@ if test "$modules" =3D "yes"; then
>    echo "CONFIG_MODULES=3Dy" >> $config_host_mak
>  fi
>
> -if test "$vhost_scsi" =3D "yes" ; then
> -  echo "CONFIG_VHOST_SCSI=3Dy" >> $config_host_mak
> -fi
>  if test "$vhost_net" =3D "yes" ; then
>    echo "CONFIG_VHOST_NET=3Dy" >> $config_host_mak
>  fi
> diff --git a/hw/scsi/Kconfig b/hw/scsi/Kconfig
> index 77d397c949..e7b34dc8e2 100644
> --- a/hw/scsi/Kconfig
> +++ b/hw/scsi/Kconfig
> @@ -48,6 +48,11 @@ config VIRTIO_SCSI
>      depends on VIRTIO
>      select SCSI
>
> +config VHOST_SCSI
> +    bool
> +    default y
> +    depends on VIRTIO && VHOST_KERNEL
> +
>  config VHOST_USER_SCSI
>      bool
>      # Only PCI devices are provided for now
> diff --git a/include/hw/virtio/virtio-scsi.h
> b/include/hw/virtio/virtio-scsi.h
> index 543681bc18..0997313f0a 100644
> --- a/include/hw/virtio/virtio-scsi.h
> +++ b/include/hw/virtio/virtio-scsi.h
> @@ -55,10 +55,8 @@ struct VirtIOSCSIConf {
>      bool seg_max_adjust;
>      uint32_t max_sectors;
>      uint32_t cmd_per_lun;
> -#ifdef CONFIG_VHOST_SCSI
>      char *vhostfd;
>      char *wwpn;
> -#endif
>      CharBackend chardev;
>      uint32_t boot_tpgt;
>      IOThread *iothread;
> diff --git a/meson.build b/meson.build
> index 033d0c9aa1..b18731ee84 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3677,7 +3677,6 @@ summary_info +=3D {'QOM debugging':
>  get_option('qom_cast_debug')}
>  summary_info +=3D {'vhost-kernel support':
> config_host.has_key('CONFIG_VHOST_KERNEL')}
>  summary_info +=3D {'vhost-net support':
> config_host.has_key('CONFIG_VHOST_NET')}
>  summary_info +=3D {'vhost-crypto support':
> config_host.has_key('CONFIG_VHOST_CRYPTO')}
> -summary_info +=3D {'vhost-scsi support':
> config_host.has_key('CONFIG_VHOST_SCSI')}
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

--000000000000a3f2b905dd28ac72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 8:23 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">vhos=
t-scsi and vhost-user-scsi are two devices of their own; it should<br>
be possible to enable/disable them with --without-default-devices, not<br>
--without-default-features.=C2=A0 Compute their default value in Kconfig to=
<br>
obtain the more intuitive behavior.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com">marcandre.lureau@redhat.com</a>&gt;<div><br></div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 15 ---------------<br>
=C2=A0hw/scsi/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 5 +++++<br>
=C2=A0include/hw/virtio/virtio-scsi.h |=C2=A0 2 --<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
=C2=A04 files changed, 5 insertions(+), 18 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index a3b57877e5..65ae2c0c1f 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -285,7 +285,6 @@ EXTRA_LDFLAGS=3D&quot;&quot;<br>
=C2=A0vhost_kernel=3D&quot;$default_feature&quot;<br>
=C2=A0vhost_net=3D&quot;$default_feature&quot;<br>
=C2=A0vhost_crypto=3D&quot;$default_feature&quot;<br>
-vhost_scsi=3D&quot;$default_feature&quot;<br>
=C2=A0vhost_user=3D&quot;no&quot;<br>
=C2=A0vhost_user_fs=3D&quot;$default_feature&quot;<br>
=C2=A0vhost_vdpa=3D&quot;$default_feature&quot;<br>
@@ -873,10 +872,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-vhost-crypto) vhost_crypto=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-vhost-scsi) vhost_scsi=3D&quot;no&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-vhost-scsi) vhost_scsi=3D&quot;yes&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--disable-vhost-user-fs) vhost_user_fs=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-vhost-user-fs) vhost_user_fs=3D&quot;yes&quot;<br>
@@ -1103,7 +1098,6 @@ cat &lt;&lt; EOF<br>
=C2=A0 =C2=A0safe-stack=C2=A0 =C2=A0 =C2=A0 SafeStack Stack Smash Protectio=
n. Depends on<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clang/=
llvm &gt;=3D 3.7 and requires coroutine backend ucontext.<br>
=C2=A0 =C2=A0vhost-net=C2=A0 =C2=A0 =C2=A0 =C2=A0vhost-net kernel accelerat=
ion support<br>
-=C2=A0 vhost-scsi=C2=A0 =C2=A0 =C2=A0 vhost-scsi kernel target support<br>
=C2=A0 =C2=A0vhost-crypto=C2=A0 =C2=A0 vhost-user-crypto backend support<br=
>
=C2=A0 =C2=A0vhost-kernel=C2=A0 =C2=A0 vhost kernel backend support<br>
=C2=A0 =C2=A0vhost-user=C2=A0 =C2=A0 =C2=A0 vhost-user backend support<br>
@@ -1537,12 +1531,6 @@ if test &quot;$vhost_kernel&quot; =3D &quot;yes&quot=
; &amp;&amp; test &quot;$linux&quot; !=3D &quot;yes&quot;; then<br>
=C2=A0 =C2=A0error_exit &quot;vhost-kernel is only available on Linux&quot;=
<br>
=C2=A0fi<br>
<br>
-# vhost-kernel devices<br>
-test &quot;$vhost_scsi&quot; =3D &quot;&quot; &amp;&amp; vhost_scsi=3D$vho=
st_kernel<br>
-if test &quot;$vhost_scsi&quot; =3D &quot;yes&quot; &amp;&amp; test &quot;=
$vhost_kernel&quot; !=3D &quot;yes&quot;; then<br>
-=C2=A0 error_exit &quot;--enable-vhost-scsi requires --enable-vhost-kernel=
&quot;<br>
-fi<br>
-<br>
=C2=A0# vhost-user backends<br>
=C2=A0test &quot;$vhost_crypto&quot; =3D &quot;&quot; &amp;&amp; vhost_cryp=
to=3D$vhost_user<br>
=C2=A0if test &quot;$vhost_crypto&quot; =3D &quot;yes&quot; &amp;&amp; test=
 &quot;$vhost_user&quot; =3D &quot;no&quot;; then<br>
@@ -2079,9 +2067,6 @@ if test &quot;$modules&quot; =3D &quot;yes&quot;; the=
n<br>
=C2=A0 =C2=A0echo &quot;CONFIG_MODULES=3Dy&quot; &gt;&gt; $config_host_mak<=
br>
=C2=A0fi<br>
<br>
-if test &quot;$vhost_scsi&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_VHOST_SCSI=3Dy&quot; &gt;&gt; $config_host_mak<br=
>
-fi<br>
=C2=A0if test &quot;$vhost_net&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_VHOST_NET=3Dy&quot; &gt;&gt; $config_host_ma=
k<br>
=C2=A0fi<br>
diff --git a/hw/scsi/Kconfig b/hw/scsi/Kconfig<br>
index 77d397c949..e7b34dc8e2 100644<br>
--- a/hw/scsi/Kconfig<br>
+++ b/hw/scsi/Kconfig<br>
@@ -48,6 +48,11 @@ config VIRTIO_SCSI<br>
=C2=A0 =C2=A0 =C2=A0depends on VIRTIO<br>
=C2=A0 =C2=A0 =C2=A0select SCSI<br>
<br>
+config VHOST_SCSI<br>
+=C2=A0 =C2=A0 bool<br>
+=C2=A0 =C2=A0 default y<br>
+=C2=A0 =C2=A0 depends on VIRTIO &amp;&amp; VHOST_KERNEL<br>
+<br>
=C2=A0config VHOST_USER_SCSI<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0# Only PCI devices are provided for now<br>
diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scs=
i.h<br>
index 543681bc18..0997313f0a 100644<br>
--- a/include/hw/virtio/virtio-scsi.h<br>
+++ b/include/hw/virtio/virtio-scsi.h<br>
@@ -55,10 +55,8 @@ struct VirtIOSCSIConf {<br>
=C2=A0 =C2=A0 =C2=A0bool seg_max_adjust;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t max_sectors;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t cmd_per_lun;<br>
-#ifdef CONFIG_VHOST_SCSI<br>
=C2=A0 =C2=A0 =C2=A0char *vhostfd;<br>
=C2=A0 =C2=A0 =C2=A0char *wwpn;<br>
-#endif<br>
=C2=A0 =C2=A0 =C2=A0CharBackend chardev;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t boot_tpgt;<br>
=C2=A0 =C2=A0 =C2=A0IOThread *iothread;<br>
diff --git a/meson.build b/meson.build<br>
index 033d0c9aa1..b18731ee84 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -3677,7 +3677,6 @@ summary_info +=3D {&#39;QOM debugging&#39;:=C2=A0 =C2=
=A0 =C2=A0get_option(&#39;qom_cast_debug&#39;)}<br>
=C2=A0summary_info +=3D {&#39;vhost-kernel support&#39;: config_host.has_ke=
y(&#39;CONFIG_VHOST_KERNEL&#39;)}<br>
=C2=A0summary_info +=3D {&#39;vhost-net support&#39;: config_host.has_key(&=
#39;CONFIG_VHOST_NET&#39;)}<br>
=C2=A0summary_info +=3D {&#39;vhost-crypto support&#39;: config_host.has_ke=
y(&#39;CONFIG_VHOST_CRYPTO&#39;)}<br>
-summary_info +=3D {&#39;vhost-scsi support&#39;: config_host.has_key(&#39;=
CONFIG_VHOST_SCSI&#39;)}<br>
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
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000a3f2b905dd28ac72--

