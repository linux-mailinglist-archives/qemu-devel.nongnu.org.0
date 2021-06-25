Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1153B3ABF
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 04:10:22 +0200 (CEST)
Received: from localhost ([::1]:55930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwbIS-0006gF-Tx
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 22:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1lwbHS-00060O-A4
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 22:09:18 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b]:41494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1lwbHN-0004rx-NW
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 22:09:17 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id c26so4617747vso.8
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 19:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=NCv1mwZXFUWzQpri131srCo+MLXsCQmjvmdgY9cvBNY=;
 b=nnSSJRq3PVFzvJRM56BnmEBsUlTLQp2JlAaJDif11IoPsA3FN+ppX3bJYuOBa0TUhg
 DpZTXf0M55yt21sxdeXCaVH+0o5o8eUJGhq3SAtzLWCW4735z7w/kBYhEvwSlfdE5qZ0
 3zn8Vr2vWCiC+6wvP3kZ5bsjxuQoY1WKO7+ORlOV6YcC2ppXM6mtej4ryVrVcOziYD9W
 NwmaQJea5kvlwiQvX7aaxoeSXn5AzAIltv8+pOfuL5XpjQFWNmg/Mx1bKEZ8Iovd58U+
 TvkwN1PQJnFpZWzE2HMx99vbsmx0mljm12qOHYUBijjV9tQ8e4G2b4q4JKxmvv9Gm9yN
 hnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=NCv1mwZXFUWzQpri131srCo+MLXsCQmjvmdgY9cvBNY=;
 b=nTwRbD/TtxDjpbR9a+xUVWmnKfqP2rnDufY5ekWAtoZ4hOv9kc+sTU1MRdSb9oYJu4
 Ii+dlq1EOIAlpn5CFCWnjINRUil+U2ZePJ/WvGP4mcRRbigPuuL4HMiXvw+nG0vvFdfH
 JghSUzmdwMqtlCIdX/cLK0JGUfnP+/E31UCy46M2RW/EL276shFWpBfMBBeB44+3KIAv
 of4TKAaPjPO94wOa5Me/bB1verpw1jD2YSZrlXYTmvOKBstlcROiQvd8KcPnXZOU8e6T
 LWSxsow310AZlQdslkHZl8fxRszXa+Tj6GCp7ltyFsFZ8JFosJUcrloepDVISW9sf/ex
 1DXg==
X-Gm-Message-State: AOAM532Ef0BbvPr/ASAETdYU8rKtvNqok8zSXWm0to05x8QZI+nU3ZhS
 rq8PkYI6hbwoOBncXUgkqXdUKYZc/xya/pfgtBM=
X-Google-Smtp-Source: ABdhPJyEtOTPiuUnZvYDUR90m/0ZvtW7G3h8V29Bdx6sRCXPAJEGOieBmGZt05zvBB2MDSTBkOQJYtfUcdzDwMM3X7c=
X-Received: by 2002:a05:6102:32c9:: with SMTP id
 o9mr6594539vss.11.1624586952187; 
 Thu, 24 Jun 2021 19:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210623121424.1259496-1-pbonzini@redhat.com>
 <20210623121424.1259496-10-pbonzini@redhat.com>
In-Reply-To: <20210623121424.1259496-10-pbonzini@redhat.com>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Fri, 25 Jun 2021 10:09:01 +0800
Message-ID: <CAE2XoE9XWqyt3VM-miUdUy-+=nwNEPnUMgk62ea7Fv6eF16cOw@mail.gmail.com>
Subject: Re: [PULL 09/12] configure, meson: convert libusb detection to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000031255605c58da059"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=luoyonggang@gmail.com; helo=mail-vs1-xe2b.google.com
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
Reply-To: luoyonggang@gmail.com
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000031255605c58da059
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 23, 2021 at 8:27 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure          | 27 ++++-----------------------
>  hw/usb/meson.build |  2 +-
>  meson.build        | 11 +++++++----
>  meson_options.txt  |  2 ++
>  4 files changed, 14 insertions(+), 28 deletions(-)
>
> diff --git a/configure b/configure
> index 237e99c3d0..e54d06b99e 100755
> --- a/configure
> +++ b/configure
> @@ -374,7 +374,7 @@ spice_protocol=3D"auto"
>  rbd=3D"auto"
>  smartcard=3D"$default_feature"
>  u2f=3D"auto"
> -libusb=3D"$default_feature"
> +libusb=3D"auto"
>  usb_redir=3D"$default_feature"
>  opengl=3D"$default_feature"
>  cpuid_h=3D"no"
> @@ -1285,9 +1285,9 @@ for opt do
>    ;;
>    --enable-u2f) u2f=3D"enabled"
>    ;;
> -  --disable-libusb) libusb=3D"no"
> +  --disable-libusb) libusb=3D"disabled"
>    ;;
> -  --enable-libusb) libusb=3D"yes"
> +  --enable-libusb) libusb=3D"enabled"
>    ;;
>    --disable-usb-redir) usb_redir=3D"no"
>    ;;
> @@ -3994,20 +3994,6 @@ if test "$smartcard" !=3D "no"; then
>      fi
>  fi
>
> -# check for libusb
> -if test "$libusb" !=3D "no" ; then
> -    if $pkg_config --atleast-version=3D1.0.13 libusb-1.0; then
> -        libusb=3D"yes"
> -        libusb_cflags=3D$($pkg_config --cflags libusb-1.0)
> -        libusb_libs=3D$($pkg_config --libs libusb-1.0)
> -    else
> -        if test "$libusb" =3D "yes"; then
> -            feature_not_found "libusb" "Install libusb devel >=3D 1.0.13=
"
> -        fi
> -        libusb=3D"no"
> -    fi
> -fi
> -
>  # check for usbredirparser for usb network redirection support
>  if test "$usb_redir" !=3D "no" ; then
>      if $pkg_config --atleast-version=3D0.6 libusbredirparser-0.5; then
> @@ -5631,12 +5617,6 @@ if test "$smartcard" =3D "yes" ; then
>    echo "SMARTCARD_LIBS=3D$libcacard_libs" >> $config_host_mak
>  fi
>
> -if test "$libusb" =3D "yes" ; then
> -  echo "CONFIG_USB_LIBUSB=3Dy" >> $config_host_mak
> -  echo "LIBUSB_CFLAGS=3D$libusb_cflags" >> $config_host_mak
> -  echo "LIBUSB_LIBS=3D$libusb_libs" >> $config_host_mak
> -fi
> -
>  if test "$usb_redir" =3D "yes" ; then
>    echo "CONFIG_USB_REDIR=3Dy" >> $config_host_mak
>    echo "USB_REDIR_CFLAGS=3D$usb_redir_cflags" >> $config_host_mak
> @@ -6215,6 +6195,7 @@ if test "$skip_meson" =3D no; then
>          -Dkvm=3D$kvm -Dhax=3D$hax -Dwhpx=3D$whpx -Dhvf=3D$hvf -Dnvmm=3D$=
nvmm \
>          -Dxen=3D$xen -Dxen_pci_passthrough=3D$xen_pci_passthrough -Dtcg=
=3D$tcg
\
>          -Dcocoa=3D$cocoa -Dgtk=3D$gtk -Dmpath=3D$mpath -Dsdl=3D$sdl
-Dsdl_image=3D$sdl_image \
> +        -Dlibusb=3D$libusb \
>          -Dvnc=3D$vnc -Dvnc_sasl=3D$vnc_sasl -Dvnc_jpeg=3D$vnc_jpeg
-Dvnc_png=3D$vnc_png \
>          -Dgettext=3D$gettext -Dxkbcommon=3D$xkbcommon -Du2f=3D$u2f
-Dvirtiofsd=3D$virtiofsd \
>          -Dcapstone=3D$capstone -Dslirp=3D$slirp -Dfdt=3D$fdt -Dbrlapi=3D=
$brlapi \
> diff --git a/hw/usb/meson.build b/hw/usb/meson.build
> index f357270d0b..bd3f8735b9 100644
> --- a/hw/usb/meson.build
> +++ b/hw/usb/meson.build
> @@ -72,7 +72,7 @@ if config_host.has_key('CONFIG_USB_REDIR')
>  endif
>
>  # usb pass-through
> -softmmu_ss.add(when: ['CONFIG_USB', 'CONFIG_USB_LIBUSB', libusb],
> +softmmu_ss.add(when: ['CONFIG_USB', libusb],
>                 if_true: files('host-libusb.c'),
>                 if_false: files('host-stub.c'))
>  softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('host-stub.c'))
> diff --git a/meson.build b/meson.build
> index c9266bd3cc..58d3a3bdc9 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -991,10 +991,12 @@ if 'CONFIG_USB_REDIR' in config_host
>                                  link_args:
config_host['USB_REDIR_LIBS'].split())
>  endif
>  libusb =3D not_found
> -if 'CONFIG_USB_LIBUSB' in config_host
> -  libusb =3D declare_dependency(compile_args:
config_host['LIBUSB_CFLAGS'].split(),
> -                              link_args:
config_host['LIBUSB_LIBS'].split())
> +if not get_option('libusb').auto() or have_system
> +  libusb =3D dependency('libusb-1.0', required: get_option('libusb'),
> +                      version: '>=3D1.0.13', method: 'pkg-config',
> +                      kwargs: static_kwargs)
>  endif

Hi, I am not sure if it's right, but I think the dection may need convert
to this:

```
if not get_option('libusb').disabled()
  libusb =3D dependency('libusb-1.0', required: get_option('libusb').auto()=
,
                      version: '>=3D1.0.13', method: 'pkg-config',
                      kwargs: static_kwargs)
endif
```

> +
>  libpmem =3D not_found
>  if 'CONFIG_LIBPMEM' in config_host
>    libpmem =3D declare_dependency(compile_args:
config_host['LIBPMEM_CFLAGS'].split(),
> @@ -1210,6 +1212,7 @@ config_host_data.set('CONFIG_SDL', sdl.found())
>  config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
>  config_host_data.set('CONFIG_SECCOMP', seccomp.found())
>  config_host_data.set('CONFIG_SNAPPY', snappy.found())
> +config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
>  config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER',
have_vhost_user_blk_server)
>  config_host_data.set('CONFIG_VNC', vnc.found())
>  config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
> @@ -2779,7 +2782,7 @@ summary_info +=3D {'rbd support':       rbd.found()=
}
>  summary_info +=3D {'xfsctl support':    config_host.has_key('CONFIG_XFS'=
)}
>  summary_info +=3D {'smartcard support':
config_host.has_key('CONFIG_SMARTCARD')}
>  summary_info +=3D {'U2F support':       u2f.found()}
> -summary_info +=3D {'libusb':
 config_host.has_key('CONFIG_USB_LIBUSB')}
> +summary_info +=3D {'libusb':            libusb.found()}
>  summary_info +=3D {'usb net redir':
config_host.has_key('CONFIG_USB_REDIR')}
>  summary_info +=3D {'OpenGL support':
 config_host.has_key('CONFIG_OPENGL')}
>  summary_info +=3D {'GBM':               config_host.has_key('CONFIG_GBM'=
)}
> diff --git a/meson_options.txt b/meson_options.txt
> index ac6e90da07..02c14d4751 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -86,6 +86,8 @@ option('gcrypt', type : 'feature', value : 'auto',
>         description: 'libgcrypt cryptography support')
>  option('libudev', type : 'feature', value : 'auto',
>         description: 'Use libudev to enumerate host devices')
> +option('libusb', type : 'feature', value : 'auto',
> +       description: 'libusb support for USB passthrough')
>  option('lzfse', type : 'feature', value : 'auto',
>         description: 'lzfse support for DMG images')
>  option('lzo', type : 'feature', value : 'auto',
> --
> 2.31.1
>
>
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--00000000000031255605c58da059
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Wed, Jun 23, 2021 at 8:27 PM Paolo Bonzini &lt;=
<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<b=
r>&gt;<br>&gt; Reviewed-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:b=
errange@redhat.com">berrange@redhat.com</a>&gt;<br>&gt; Signed-off-by: Paol=
o Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a=
>&gt;<br>&gt; ---<br>&gt; =C2=A0configure =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 27 ++++-----------------------<br>&gt; =C2=A0hw/usb/meson.build | =C2=
=A02 +-<br>&gt; =C2=A0meson.build =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +++++++--=
--<br>&gt; =C2=A0meson_options.txt =C2=A0| =C2=A02 ++<br>&gt; =C2=A04 files=
 changed, 14 insertions(+), 28 deletions(-)<br>&gt;<br>&gt; diff --git a/co=
nfigure b/configure<br>&gt; index 237e99c3d0..e54d06b99e 100755<br>&gt; ---=
 a/configure<br>&gt; +++ b/configure<br>&gt; @@ -374,7 +374,7 @@ spice_prot=
ocol=3D&quot;auto&quot;<br>&gt; =C2=A0rbd=3D&quot;auto&quot;<br>&gt; =C2=A0=
smartcard=3D&quot;$default_feature&quot;<br>&gt; =C2=A0u2f=3D&quot;auto&quo=
t;<br>&gt; -libusb=3D&quot;$default_feature&quot;<br>&gt; +libusb=3D&quot;a=
uto&quot;<br>&gt; =C2=A0usb_redir=3D&quot;$default_feature&quot;<br>&gt; =
=C2=A0opengl=3D&quot;$default_feature&quot;<br>&gt; =C2=A0cpuid_h=3D&quot;n=
o&quot;<br>&gt; @@ -1285,9 +1285,9 @@ for opt do<br>&gt; =C2=A0 =C2=A0;;<br=
>&gt; =C2=A0 =C2=A0--enable-u2f) u2f=3D&quot;enabled&quot;<br>&gt; =C2=A0 =
=C2=A0;;<br>&gt; - =C2=A0--disable-libusb) libusb=3D&quot;no&quot;<br>&gt; =
+ =C2=A0--disable-libusb) libusb=3D&quot;disabled&quot;<br>&gt; =C2=A0 =C2=
=A0;;<br>&gt; - =C2=A0--enable-libusb) libusb=3D&quot;yes&quot;<br>&gt; + =
=C2=A0--enable-libusb) libusb=3D&quot;enabled&quot;<br>&gt; =C2=A0 =C2=A0;;=
<br>&gt; =C2=A0 =C2=A0--disable-usb-redir) usb_redir=3D&quot;no&quot;<br>&g=
t; =C2=A0 =C2=A0;;<br>&gt; @@ -3994,20 +3994,6 @@ if test &quot;$smartcard&=
quot; !=3D &quot;no&quot;; then<br>&gt; =C2=A0 =C2=A0 =C2=A0fi<br>&gt; =C2=
=A0fi<br>&gt;<br>&gt; -# check for libusb<br>&gt; -if test &quot;$libusb&qu=
ot; !=3D &quot;no&quot; ; then<br>&gt; - =C2=A0 =C2=A0if $pkg_config --atle=
ast-version=3D1.0.13 libusb-1.0; then<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0=
libusb=3D&quot;yes&quot;<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0libusb_cflags=
=3D$($pkg_config --cflags libusb-1.0)<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0=
libusb_libs=3D$($pkg_config --libs libusb-1.0)<br>&gt; - =C2=A0 =C2=A0else<=
br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;$libusb&quot; =3D &quot;=
yes&quot;; then<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0feature_=
not_found &quot;libusb&quot; &quot;Install libusb devel &gt;=3D 1.0.13&quot=
;<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =
=C2=A0libusb=3D&quot;no&quot;<br>&gt; - =C2=A0 =C2=A0fi<br>&gt; -fi<br>&gt;=
 -<br>&gt; =C2=A0# check for usbredirparser for usb network redirection sup=
port<br>&gt; =C2=A0if test &quot;$usb_redir&quot; !=3D &quot;no&quot; ; the=
n<br>&gt; =C2=A0 =C2=A0 =C2=A0if $pkg_config --atleast-version=3D0.6 libusb=
redirparser-0.5; then<br>&gt; @@ -5631,12 +5617,6 @@ if test &quot;$smartca=
rd&quot; =3D &quot;yes&quot; ; then<br>&gt; =C2=A0 =C2=A0echo &quot;SMARTCA=
RD_LIBS=3D$libcacard_libs&quot; &gt;&gt; $config_host_mak<br>&gt; =C2=A0fi<=
br>&gt;<br>&gt; -if test &quot;$libusb&quot; =3D &quot;yes&quot; ; then<br>=
&gt; - =C2=A0echo &quot;CONFIG_USB_LIBUSB=3Dy&quot; &gt;&gt; $config_host_m=
ak<br>&gt; - =C2=A0echo &quot;LIBUSB_CFLAGS=3D$libusb_cflags&quot; &gt;&gt;=
 $config_host_mak<br>&gt; - =C2=A0echo &quot;LIBUSB_LIBS=3D$libusb_libs&quo=
t; &gt;&gt; $config_host_mak<br>&gt; -fi<br>&gt; -<br>&gt; =C2=A0if test &q=
uot;$usb_redir&quot; =3D &quot;yes&quot; ; then<br>&gt; =C2=A0 =C2=A0echo &=
quot;CONFIG_USB_REDIR=3Dy&quot; &gt;&gt; $config_host_mak<br>&gt; =C2=A0 =
=C2=A0echo &quot;USB_REDIR_CFLAGS=3D$usb_redir_cflags&quot; &gt;&gt; $confi=
g_host_mak<br>&gt; @@ -6215,6 +6195,7 @@ if test &quot;$skip_meson&quot; =
=3D no; then<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dkvm=3D$kvm -Dhax=
=3D$hax -Dwhpx=3D$whpx -Dhvf=3D$hvf -Dnvmm=3D$nvmm \<br>&gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0-Dxen=3D$xen -Dxen_pci_passthrough=3D$xen_pci_passthrou=
gh -Dtcg=3D$tcg \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcocoa=3D$coco=
a -Dgtk=3D$gtk -Dmpath=3D$mpath -Dsdl=3D$sdl -Dsdl_image=3D$sdl_image \<br>=
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dlibusb=3D$libusb \<br>&gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0-Dvnc=3D$vnc -Dvnc_sasl=3D$vnc_sasl -Dvnc_jpeg=3D$v=
nc_jpeg -Dvnc_png=3D$vnc_png \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-D=
gettext=3D$gettext -Dxkbcommon=3D$xkbcommon -Du2f=3D$u2f -Dvirtiofsd=3D$vir=
tiofsd \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcapstone=3D$capstone -=
Dslirp=3D$slirp -Dfdt=3D$fdt -Dbrlapi=3D$brlapi \<br>&gt; diff --git a/hw/u=
sb/meson.build b/hw/usb/meson.build<br>&gt; index f357270d0b..bd3f8735b9 10=
0644<br>&gt; --- a/hw/usb/meson.build<br>&gt; +++ b/hw/usb/meson.build<br>&=
gt; @@ -72,7 +72,7 @@ if config_host.has_key(&#39;CONFIG_USB_REDIR&#39;)<br=
>&gt; =C2=A0endif<br>&gt;<br>&gt; =C2=A0# usb pass-through<br>&gt; -softmmu=
_ss.add(when: [&#39;CONFIG_USB&#39;, &#39;CONFIG_USB_LIBUSB&#39;, libusb],<=
br>&gt; +softmmu_ss.add(when: [&#39;CONFIG_USB&#39;, libusb],<br>&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if_true: files(&#39;ho=
st-libusb.c&#39;),<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if_false: files(&#39;host-stub.c&#39;))<br>&gt; =C2=A0softmmu_ss.ad=
d(when: &#39;CONFIG_ALL&#39;, if_true: files(&#39;host-stub.c&#39;))<br>&gt=
; diff --git a/meson.build b/meson.build<br>&gt; index c9266bd3cc..58d3a3bd=
c9 100644<br>&gt; --- a/meson.build<br>&gt; +++ b/meson.build<br>&gt; @@ -9=
91,10 +991,12 @@ if &#39;CONFIG_USB_REDIR&#39; in config_host<br>&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0link_args: config_host[&#39;USB_RE=
DIR_LIBS&#39;].split())<br>&gt; =C2=A0endif<br>&gt; =C2=A0libusb =3D not_fo=
und<br>&gt; -if &#39;CONFIG_USB_LIBUSB&#39; in config_host<br>&gt; - =C2=A0=
libusb =3D declare_dependency(compile_args: config_host[&#39;LIBUSB_CFLAGS&=
#39;].split(),<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0link_args: config_ho=
st[&#39;LIBUSB_LIBS&#39;].split())<br>&gt; +if not get_option(&#39;libusb&#=
39;).auto() or have_system<br>&gt; + =C2=A0libusb =3D dependency(&#39;libus=
b-1.0&#39;, required: get_option(&#39;libusb&#39;),<br>&gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version: &#3=
9;&gt;=3D1.0.13&#39;, method: &#39;pkg-config&#39;,<br>&gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kwargs: stat=
ic_kwargs)<br>&gt; =C2=A0endif<br><br>Hi, I am not sure if it&#39;s right, =
but I think the dection may need convert to this:<br><br><div>```<br>if not=
 get_option(&#39;libusb&#39;).disabled()<br>=C2=A0 libusb =3D dependency(&#=
39;libusb-1.0&#39;, required: get_option(&#39;libusb&#39;).auto(),<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v=
ersion: &#39;&gt;=3D1.0.13&#39;, method: &#39;pkg-config&#39;,<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kwarg=
s: static_kwargs)<br>endif<br>```<br><br>&gt; +<br>&gt; =C2=A0libpmem =3D n=
ot_found<br>&gt; =C2=A0if &#39;CONFIG_LIBPMEM&#39; in config_host<br>&gt; =
=C2=A0 =C2=A0libpmem =3D declare_dependency(compile_args: config_host[&#39;=
LIBPMEM_CFLAGS&#39;].split(),<br>&gt; @@ -1210,6 +1212,7 @@ config_host_dat=
a.set(&#39;CONFIG_SDL&#39;, sdl.found())<br>&gt; =C2=A0config_host_data.set=
(&#39;CONFIG_SDL_IMAGE&#39;, sdl_image.found())<br>&gt; =C2=A0config_host_d=
ata.set(&#39;CONFIG_SECCOMP&#39;, seccomp.found())<br>&gt; =C2=A0config_hos=
t_data.set(&#39;CONFIG_SNAPPY&#39;, snappy.found())<br>&gt; +config_host_da=
ta.set(&#39;CONFIG_USB_LIBUSB&#39;, libusb.found())<br>&gt; =C2=A0config_ho=
st_data.set(&#39;CONFIG_VHOST_USER_BLK_SERVER&#39;, have_vhost_user_blk_ser=
ver)<br>&gt; =C2=A0config_host_data.set(&#39;CONFIG_VNC&#39;, vnc.found())<=
br>&gt; =C2=A0config_host_data.set(&#39;CONFIG_VNC_JPEG&#39;, jpeg.found())=
<br>&gt; @@ -2779,7 +2782,7 @@ summary_info +=3D {&#39;rbd support&#39;: =
=C2=A0 =C2=A0 =C2=A0 rbd.found()}<br>&gt; =C2=A0summary_info +=3D {&#39;xfs=
ctl support&#39;: =C2=A0 =C2=A0config_host.has_key(&#39;CONFIG_XFS&#39;)}<b=
r>&gt; =C2=A0summary_info +=3D {&#39;smartcard support&#39;: config_host.ha=
s_key(&#39;CONFIG_SMARTCARD&#39;)}<br>&gt; =C2=A0summary_info +=3D {&#39;U2=
F support&#39;: =C2=A0 =C2=A0 =C2=A0 u2f.found()}<br>&gt; -summary_info +=
=3D {&#39;libusb&#39;: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config_host=
.has_key(&#39;CONFIG_USB_LIBUSB&#39;)}<br>&gt; +summary_info +=3D {&#39;lib=
usb&#39;: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libusb.found()}<br>&gt; =
=C2=A0summary_info +=3D {&#39;usb net redir&#39;: =C2=A0 =C2=A0 config_host=
.has_key(&#39;CONFIG_USB_REDIR&#39;)}<br>&gt; =C2=A0summary_info +=3D {&#39=
;OpenGL support&#39;: =C2=A0 =C2=A0config_host.has_key(&#39;CONFIG_OPENGL&#=
39;)}<br>&gt; =C2=A0summary_info +=3D {&#39;GBM&#39;: =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 config_host.has_key(&#39;CONFIG_GBM&#39;)}<br>&=
gt; diff --git a/meson_options.txt b/meson_options.txt<br>&gt; index ac6e90=
da07..02c14d4751 100644<br>&gt; --- a/meson_options.txt<br>&gt; +++ b/meson=
_options.txt<br>&gt; @@ -86,6 +86,8 @@ option(&#39;gcrypt&#39;, type : &#39=
;feature&#39;, value : &#39;auto&#39;,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
description: &#39;libgcrypt cryptography support&#39;)<br>&gt; =C2=A0option=
(&#39;libudev&#39;, type : &#39;feature&#39;, value : &#39;auto&#39;,<br>&g=
t; =C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Use libudev to enumerate h=
ost devices&#39;)<br>&gt; +option(&#39;libusb&#39;, type : &#39;feature&#39=
;, value : &#39;auto&#39;,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 description: &#39=
;libusb support for USB passthrough&#39;)<br>&gt; =C2=A0option(&#39;lzfse&#=
39;, type : &#39;feature&#39;, value : &#39;auto&#39;,<br>&gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 description: &#39;lzfse support for DMG images&#39;)<br>&=
gt; =C2=A0option(&#39;lzo&#39;, type : &#39;feature&#39;, value : &#39;auto=
&#39;,<br>&gt; --<br>&gt; 2.31.1<br>&gt;<br>&gt;<br>&gt;<br><br><br>--<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=
=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo<=
br></div></div>

--00000000000031255605c58da059--

