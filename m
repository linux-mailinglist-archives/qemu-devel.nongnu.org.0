Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 714C1425E2F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:52:37 +0200 (CEST)
Received: from localhost ([::1]:52446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYaNX-0004XE-9U
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaDE-000543-6z
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:41:56 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaDB-0005rU-O0
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:41:55 -0400
Received: by mail-wr1-x42b.google.com with SMTP id e12so22864336wra.4
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 13:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OFTUOJFY74RhUXBhvgY54cHFAh3XWIczjMll8wMkAXM=;
 b=UMIjuSmhiigZfT0g1pv1aT3D8pcw3zIPAQkVRPkobpWBnL231Je7wlV98iEMOmyLj/
 lxEqFUefLVGRAYKxpCJW0KKuuMnW/Bz6yGCqNPjaZhFyjM+dTMC1+wcc+N+ndbdCAejv
 GlpaZXhMc66dxUGtIUaZTwOzV7X3QFP4n2m73aB6Ex/mkqljzM1oo8IVB2zuJGBurI+G
 3B83tUbM7HYFgqO/JWJyv8hJo+RvjrQUyF5w45VtzlbGDDtfejEtFmei8dO4Kad2MW0L
 lbM6sV+HslZ3nrHzfpeg/Nh79c6VQ/SJQ4RSGWf98gSCkA5yxGs1sscWJYpbcnEPmj/V
 XpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OFTUOJFY74RhUXBhvgY54cHFAh3XWIczjMll8wMkAXM=;
 b=VcEhu1On9zYR2vLaArmcQRA0fjeIEtCSHeeCEZ3RzbfrrZnnb+FxEvrdi6drBK2cJB
 JCMBISs2myhB0WCy5Ytw1EFyiI6DE/DJQowzWDyBIxlLrAywP53Q4BKsDvHsxa9S8GBk
 ZED3Etrb/wOU7jzgR/tN3fk4NiV8n+Zlc40NQAeh9E7Ico/HJ+d0AzwvGV15dQxFs9ws
 sMbo3kx5zlEGDUj84EUGQOuNt0NUHX9pZaEud5CYRFw92IxYpEkmLG1IXg61nJg3a6hQ
 u5kplhq6lJzon0lyNGYTrGkxzu685kkf/7B7IbfBE2LeBVakUJ91tFmMK1l36ewmjLzm
 mQmA==
X-Gm-Message-State: AOAM532SH2tjcWZgvMPD80iZwkvwGKcygQLSNX2cHqkze/Cr2XlNRWAm
 /FrcVoXw0v7S+7NkDdGo6IAXzlkETDC36RRop8Q=
X-Google-Smtp-Source: ABdhPJyS3roS07GY8afu2rKRS8QrssNvdZLTP+vA0dLL1YMJoLP5aYLfxt+A1/VoGEEWlpkDPzk4JIbXT4Vv0BLJwHs=
X-Received: by 2002:a5d:4f8d:: with SMTP id d13mr5948425wru.239.1633639311337; 
 Thu, 07 Oct 2021 13:41:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130829.632254-11-pbonzini@redhat.com>
In-Reply-To: <20211007130829.632254-11-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 8 Oct 2021 00:41:37 +0400
Message-ID: <CAJ+F1CKWXo1LF9zmLMY+LTThWJnNUaTQLf3t3e5idchhf7NjVQ@mail.gmail.com>
Subject: Re: [PATCH 16/24] configure, meson: move vde detection to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d7eabf05cdc94abf"
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

--000000000000d7eabf05cdc94abf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 7, 2021 at 5:26 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  configure         | 35 ++++-------------------------------
>  meson.build       | 26 +++++++++++++++++++++++---
>  meson_options.txt |  2 ++
>  net/meson.build   |  2 +-
>  4 files changed, 30 insertions(+), 35 deletions(-)
>
> diff --git a/configure b/configure
> index 86bc4b52d7..a2b1d54be8 100755
> --- a/configure
> +++ b/configure
> @@ -301,7 +301,7 @@ libudev=3D"auto"
>  mpath=3D"auto"
>  vnc=3D"auto"
>  sparse=3D"auto"
> -vde=3D"$default_feature"
> +vde=3D"auto"
>  vnc_sasl=3D"auto"
>  vnc_jpeg=3D"auto"
>  vnc_png=3D"auto"
> @@ -1022,9 +1022,9 @@ for opt do
>    ;;
>    --enable-slirp=3Dsystem) slirp=3D"system"
>    ;;
> -  --disable-vde) vde=3D"no"
> +  --disable-vde) vde=3D"disabled"
>    ;;
> -  --enable-vde) vde=3D"yes"
> +  --enable-vde) vde=3D"enabled"
>    ;;
>    --disable-netmap) netmap=3D"no"
>    ;;
> @@ -2901,30 +2901,6 @@ EOF
>    fi
>  fi
>
> -##########################################
> -# vde libraries probe
> -if test "$vde" !=3D "no" ; then
> -  vde_libs=3D"-lvdeplug"
> -  cat > $TMPC << EOF
> -#include <libvdeplug.h>
> -int main(void)
> -{
> -    struct vde_open_args a =3D {0, 0, 0};
> -    char s[] =3D "";
> -    vde_open(s, s, &a);
> -    return 0;
> -}
> -EOF
> -  if compile_prog "" "$vde_libs" ; then
> -    vde=3Dyes
> -  else
> -    if test "$vde" =3D "yes" ; then
> -      feature_not_found "vde" "Install vde (Virtual Distributed Ethernet=
)
> devel"
> -    fi
> -    vde=3Dno
> -  fi
> -fi
> -
>  ##########################################
>  # netmap support probe
>  # Apart from looking for netmap headers, we make sure that the host API
> version
> @@ -4197,10 +4173,6 @@ if test "$slirp_smbd" =3D "yes" ; then
>    echo "CONFIG_SLIRP_SMBD=3Dy" >> $config_host_mak
>    echo "CONFIG_SMBD_COMMAND=3D\"$smbd\"" >> $config_host_mak
>  fi
> -if test "$vde" =3D "yes" ; then
> -  echo "CONFIG_VDE=3Dy" >> $config_host_mak
> -  echo "VDE_LIBS=3D$vde_libs" >> $config_host_mak
> -fi
>  if test "$netmap" =3D "yes" ; then
>    echo "CONFIG_NETMAP=3Dy" >> $config_host_mak
>  fi
> @@ -4750,6 +4722,7 @@ if test "$skip_meson" =3D no; then
>          -Dalsa=3D$alsa -Dcoreaudio=3D$coreaudio -Ddsound=3D$dsound -Djac=
k=3D$jack
> -Doss=3D$oss \
>          -Dpa=3D$pa -Daudio_drv_list=3D$audio_drv_list
> -Dtcg_interpreter=3D$tcg_interpreter \
>          -Dtrace_backends=3D$trace_backends -Dtrace_file=3D$trace_file
> -Dlinux_aio=3D$linux_aio \
> +        -Dvde=3D$vde \
>          $cross_arg \
>          "$PWD" "$source_path"
>
> diff --git a/meson.build b/meson.build
> index 0be11e5e08..46d8798a19 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -502,9 +502,28 @@ else
>    xkbcommon =3D dependency('xkbcommon', required: get_option('xkbcommon'=
),
>                           method: 'pkg-config', kwargs: static_kwargs)
>  endif
> +
>  vde =3D not_found
> -if config_host.has_key('CONFIG_VDE')
> -  vde =3D declare_dependency(link_args: config_host['VDE_LIBS'].split())
> +if not get_option('vde').auto() or have_system or have_tools
> +  vde =3D cc.find_library('vdeplug', has_headers: ['libvdeplug.h'],
> +                           required: get_option('vde'),
> +                           kwargs: static_kwargs)
> +endif
> +if vde.found() and not cc.links('''
> +   #include <libvdeplug.h>
> +   int main(void)
> +   {
> +     struct vde_open_args a =3D {0, 0, 0};
> +     char s[] =3D "";
> +     vde_open(s, s, &a);
> +     return 0;
> +   }''', dependencies: vde)
> +  vde =3D not_found
> +  if get_option('cap_ng').enabled()
> +    error('could not link libvdeplug')
> +  else
> +    warning('could not link libvdeplug, disabling')
> +  endif
>  endif
>
>  pulse =3D not_found
> @@ -1443,6 +1462,7 @@ config_host_data.set('CONFIG_SDL_IMAGE',
> sdl_image.found())
>  config_host_data.set('CONFIG_SECCOMP', seccomp.found())
>  config_host_data.set('CONFIG_SNAPPY', snappy.found())
>  config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
> +config_host_data.set('CONFIG_VDE', vde.found())
>  config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER',
> have_vhost_user_blk_server)
>  config_host_data.set('CONFIG_VNC', vnc.found())
>  config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
> @@ -3295,7 +3315,7 @@ if targetos =3D=3D 'linux'
>  endif
>  summary_info +=3D {'JACK support':      jack}
>  summary_info +=3D {'brlapi support':    brlapi}
> -summary_info +=3D {'vde support':       config_host.has_key('CONFIG_VDE'=
)}
> +summary_info +=3D {'vde support':       vde}
>  summary_info +=3D {'netmap support':
> config_host.has_key('CONFIG_NETMAP')}
>  summary_info +=3D {'Linux AIO support': libaio}
>  summary_info +=3D {'Linux io_uring support': linux_io_uring}
> diff --git a/meson_options.txt b/meson_options.txt
> index 904e15d54c..7d0fa1c7f4 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -129,6 +129,8 @@ option('u2f', type : 'feature', value : 'auto',
>         description: 'U2F emulation support')
>  option('usb_redir', type : 'feature', value : 'auto',
>         description: 'libusbredir support')
> +option('vde', type : 'feature', value : 'auto',
> +       description: 'vde network backend support')
>  option('virglrenderer', type : 'feature', value : 'auto',
>         description: 'virgl rendering support')
>  option('vnc', type : 'feature', value : 'auto',
> diff --git a/net/meson.build b/net/meson.build
> index 1076b0a7ab..491144a697 100644
> --- a/net/meson.build
> +++ b/net/meson.build
> @@ -20,7 +20,7 @@ softmmu_ss.add(when: 'CONFIG_TCG', if_true:
> files('filter-replay.c'))
>
>  softmmu_ss.add(when: 'CONFIG_L2TPV3', if_true: files('l2tpv3.c'))
>  softmmu_ss.add(when: slirp, if_true: files('slirp.c'))
> -softmmu_ss.add(when: ['CONFIG_VDE', vde], if_true: files('vde.c'))
> +softmmu_ss.add(when: vde, if_true: files('vde.c'))
>  softmmu_ss.add(when: 'CONFIG_NETMAP', if_true: files('netmap.c'))
>  vhost_user_ss =3D ss.source_set()
>  vhost_user_ss.add(when: 'CONFIG_VIRTIO_NET', if_true:
> files('vhost-user.c'), if_false: files('vhost-user-stub.c'))
> --
> 2.31.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000d7eabf05cdc94abf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 7, 2021 at 5:26 PM Paolo =
Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank">pbonzi=
ni@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@re=
dhat.com" target=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><di=
v><br></div><div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"ma=
ilto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat=
.com</a>&gt;</div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 35 ++++-----------------=
--------------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 26 +++++++++++++++++++++++---=
<br>
=C2=A0meson_options.txt |=C2=A0 2 ++<br>
=C2=A0net/meson.build=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A04 files changed, 30 insertions(+), 35 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 86bc4b52d7..a2b1d54be8 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -301,7 +301,7 @@ libudev=3D&quot;auto&quot;<br>
=C2=A0mpath=3D&quot;auto&quot;<br>
=C2=A0vnc=3D&quot;auto&quot;<br>
=C2=A0sparse=3D&quot;auto&quot;<br>
-vde=3D&quot;$default_feature&quot;<br>
+vde=3D&quot;auto&quot;<br>
=C2=A0vnc_sasl=3D&quot;auto&quot;<br>
=C2=A0vnc_jpeg=3D&quot;auto&quot;<br>
=C2=A0vnc_png=3D&quot;auto&quot;<br>
@@ -1022,9 +1022,9 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-slirp=3Dsystem) slirp=3D&quot;system&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-vde) vde=3D&quot;no&quot;<br>
+=C2=A0 --disable-vde) vde=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-vde) vde=3D&quot;yes&quot;<br>
+=C2=A0 --enable-vde) vde=3D&quot;enabled&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-netmap) netmap=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
@@ -2901,30 +2901,6 @@ EOF<br>
=C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-##########################################<br>
-# vde libraries probe<br>
-if test &quot;$vde&quot; !=3D &quot;no&quot; ; then<br>
-=C2=A0 vde_libs=3D&quot;-lvdeplug&quot;<br>
-=C2=A0 cat &gt; $TMPC &lt;&lt; EOF<br>
-#include &lt;libvdeplug.h&gt;<br>
-int main(void)<br>
-{<br>
-=C2=A0 =C2=A0 struct vde_open_args a =3D {0, 0, 0};<br>
-=C2=A0 =C2=A0 char s[] =3D &quot;&quot;;<br>
-=C2=A0 =C2=A0 vde_open(s, s, &amp;a);<br>
-=C2=A0 =C2=A0 return 0;<br>
-}<br>
-EOF<br>
-=C2=A0 if compile_prog &quot;&quot; &quot;$vde_libs&quot; ; then<br>
-=C2=A0 =C2=A0 vde=3Dyes<br>
-=C2=A0 else<br>
-=C2=A0 =C2=A0 if test &quot;$vde&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 feature_not_found &quot;vde&quot; &quot;Install vde (=
Virtual Distributed Ethernet) devel&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 vde=3Dno<br>
-=C2=A0 fi<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# netmap support probe<br>
=C2=A0# Apart from looking for netmap headers, we make sure that the host A=
PI version<br>
@@ -4197,10 +4173,6 @@ if test &quot;$slirp_smbd&quot; =3D &quot;yes&quot; =
; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_SLIRP_SMBD=3Dy&quot; &gt;&gt; $config_host_m=
ak<br>
=C2=A0 =C2=A0echo &quot;CONFIG_SMBD_COMMAND=3D\&quot;$smbd\&quot;&quot; &gt=
;&gt; $config_host_mak<br>
=C2=A0fi<br>
-if test &quot;$vde&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_VDE=3Dy&quot; &gt;&gt; $config_host_mak<br>
-=C2=A0 echo &quot;VDE_LIBS=3D$vde_libs&quot; &gt;&gt; $config_host_mak<br>
-fi<br>
=C2=A0if test &quot;$netmap&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_NETMAP=3Dy&quot; &gt;&gt; $config_host_mak<b=
r>
=C2=A0fi<br>
@@ -4750,6 +4722,7 @@ if test &quot;$skip_meson&quot; =3D no; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dalsa=3D$alsa -Dcoreaudio=3D$coreaudio -=
Ddsound=3D$dsound -Djack=3D$jack -Doss=3D$oss \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dpa=3D$pa -Daudio_drv_list=3D$audio_drv_=
list -Dtcg_interpreter=3D$tcg_interpreter \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dtrace_backends=3D$trace_backends -Dtrac=
e_file=3D$trace_file -Dlinux_aio=3D$linux_aio \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dvde=3D$vde \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$cross_arg \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$PWD&quot; &quot;$source_path&quot;=
<br>
<br>
diff --git a/meson.build b/meson.build<br>
index 0be11e5e08..46d8798a19 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -502,9 +502,28 @@ else<br>
=C2=A0 =C2=A0xkbcommon =3D dependency(&#39;xkbcommon&#39;, required: get_op=
tion(&#39;xkbcommon&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 method: &#39;pkg-config&#39;, kwargs: static_kwargs)<br>
=C2=A0endif<br>
+<br>
=C2=A0vde =3D not_found<br>
-if config_host.has_key(&#39;CONFIG_VDE&#39;)<br>
-=C2=A0 vde =3D declare_dependency(link_args: config_host[&#39;VDE_LIBS&#39=
;].split())<br>
+if not get_option(&#39;vde&#39;).auto() or have_system or have_tools<br>
+=C2=A0 vde =3D cc.find_library(&#39;vdeplug&#39;, has_headers: [&#39;libvd=
eplug.h&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0required: get_option(&#39;vde&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0kwargs: static_kwargs)<br>
+endif<br>
+if vde.found() and not cc.links(&#39;&#39;&#39;<br>
+=C2=A0 =C2=A0#include &lt;libvdeplug.h&gt;<br>
+=C2=A0 =C2=A0int main(void)<br>
+=C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0struct vde_open_args a =3D {0, 0, 0};<br>
+=C2=A0 =C2=A0 =C2=A0char s[] =3D &quot;&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0vde_open(s, s, &amp;a);<br>
+=C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0}&#39;&#39;&#39;, dependencies: vde)<br>
+=C2=A0 vde =3D not_found<br>
+=C2=A0 if get_option(&#39;cap_ng&#39;).enabled()<br>
+=C2=A0 =C2=A0 error(&#39;could not link libvdeplug&#39;)<br>
+=C2=A0 else<br>
+=C2=A0 =C2=A0 warning(&#39;could not link libvdeplug, disabling&#39;)<br>
+=C2=A0 endif<br>
=C2=A0endif<br>
<br>
=C2=A0pulse =3D not_found<br>
@@ -1443,6 +1462,7 @@ config_host_data.set(&#39;CONFIG_SDL_IMAGE&#39;, sdl_=
image.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_SECCOMP&#39;, seccomp.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_SNAPPY&#39;, snappy.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_USB_LIBUSB&#39;, libusb.found())<br>
+config_host_data.set(&#39;CONFIG_VDE&#39;, vde.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_VHOST_USER_BLK_SERVER&#39;, have_vho=
st_user_blk_server)<br>
=C2=A0config_host_data.set(&#39;CONFIG_VNC&#39;, vnc.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_VNC_JPEG&#39;, jpeg.found())<br>
@@ -3295,7 +3315,7 @@ if targetos =3D=3D &#39;linux&#39;<br>
=C2=A0endif<br>
=C2=A0summary_info +=3D {&#39;JACK support&#39;:=C2=A0 =C2=A0 =C2=A0 jack}<=
br>
=C2=A0summary_info +=3D {&#39;brlapi support&#39;:=C2=A0 =C2=A0 brlapi}<br>
-summary_info +=3D {&#39;vde support&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0config=
_host.has_key(&#39;CONFIG_VDE&#39;)}<br>
+summary_info +=3D {&#39;vde support&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0vde}<b=
r>
=C2=A0summary_info +=3D {&#39;netmap support&#39;:=C2=A0 =C2=A0 config_host=
.has_key(&#39;CONFIG_NETMAP&#39;)}<br>
=C2=A0summary_info +=3D {&#39;Linux AIO support&#39;: libaio}<br>
=C2=A0summary_info +=3D {&#39;Linux io_uring support&#39;: linux_io_uring}<=
br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index 904e15d54c..7d0fa1c7f4 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -129,6 +129,8 @@ option(&#39;u2f&#39;, type : &#39;feature&#39;, value :=
 &#39;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;U2F emulation support&#39;)<b=
r>
=C2=A0option(&#39;usb_redir&#39;, type : &#39;feature&#39;, value : &#39;au=
to&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;libusbredir support&#39;)<br>
+option(&#39;vde&#39;, type : &#39;feature&#39;, value : &#39;auto&#39;,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;vde network backend support&#=
39;)<br>
=C2=A0option(&#39;virglrenderer&#39;, type : &#39;feature&#39;, value : &#3=
9;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;virgl rendering support&#39;)=
<br>
=C2=A0option(&#39;vnc&#39;, type : &#39;feature&#39;, value : &#39;auto&#39=
;,<br>
diff --git a/net/meson.build b/net/meson.build<br>
index 1076b0a7ab..491144a697 100644<br>
--- a/net/meson.build<br>
+++ b/net/meson.build<br>
@@ -20,7 +20,7 @@ softmmu_ss.add(when: &#39;CONFIG_TCG&#39;, if_true: files=
(&#39;filter-replay.c&#39;))<br>
<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_L2TPV3&#39;, if_true: files(&#39;l2t=
pv3.c&#39;))<br>
=C2=A0softmmu_ss.add(when: slirp, if_true: files(&#39;slirp.c&#39;))<br>
-softmmu_ss.add(when: [&#39;CONFIG_VDE&#39;, vde], if_true: files(&#39;vde.=
c&#39;))<br>
+softmmu_ss.add(when: vde, if_true: files(&#39;vde.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_NETMAP&#39;, if_true: files(&#39;net=
map.c&#39;))<br>
=C2=A0vhost_user_ss =3D ss.source_set()<br>
=C2=A0vhost_user_ss.add(when: &#39;CONFIG_VIRTIO_NET&#39;, if_true: files(&=
#39;vhost-user.c&#39;), if_false: files(&#39;vhost-user-stub.c&#39;))<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000d7eabf05cdc94abf--

