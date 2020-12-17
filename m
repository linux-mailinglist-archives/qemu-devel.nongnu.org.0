Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A1C2DD241
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 14:38:13 +0100 (CET)
Received: from localhost ([::1]:56942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kptTx-0007Ec-0h
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 08:38:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kptSE-0006Bp-FH
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:36:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kptSC-0004gd-0q
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:36:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608212183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aJdD4r5y+HabrCF4jTV/mK0Yjg7NjSJrQODZPnn2GOM=;
 b=QoEO+d5w8EMzYYJpQlO3YwEZn8mtPpfOS2YJ/Svebga3+wsYvmFlBdR55GqcbtM/dp90kn
 0euBsv1NZbzYwt7Vjxu1Iza0WdfG6ma6CZuvhrxwZxcG3nd2JHE26sKA+aPMg94EMjT0fe
 h1jLtlcQBfGRvz5d2WwC8uRGjn5P3rE=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-8wQDLdmrMne6cT1e_JXH3w-1; Thu, 17 Dec 2020 08:36:21 -0500
X-MC-Unique: 8wQDLdmrMne6cT1e_JXH3w-1
Received: by mail-io1-f69.google.com with SMTP id t23so27276893ioh.0
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 05:36:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aJdD4r5y+HabrCF4jTV/mK0Yjg7NjSJrQODZPnn2GOM=;
 b=i0DM9zQwpdm3WDKMjIbtmoHvaJ0vJXQBZaOrekOJo6H9szlMlZkG5mKjSPI5p9Ht4/
 4DmTXRFOXJX1wnO63rPMn+nalfC2DFRWcI89VsdW8CBTuaU/G341CH8ecPHWfQoPzKuN
 J5/UPfVFe7dltdNSKybK4/zcWCYHHLQfoQfvNBU+9D06EvbAicXu9DaF5DXPtX/5b1KA
 dXPBcWn5wCEXcRpTTNIdDB5Ph50pLkz86zOH390h/ZCl6FxkuB7GAWA3NCGy5/PONr/T
 i4U+BnQt/Dg4O79ORMrciUuxRgLxcNiXxsD1H+rIL8m455p3op4x0Q82QP4PYG4E9nf0
 xQNA==
X-Gm-Message-State: AOAM532GIWs3+arRLuF5sD6aPb5LRGVbFe3FpQms/Xrou2Y8RnvfpkWq
 Ujn3IWTQi18KFkxAHlgmX+z3ZxoshhuolDu563sxS2BXkPFqBVTs1/2zpuUx8/gFA4dWdaEOLwz
 EAl/a2G+LYUcpjESuwBUE4Tp5G9E1rUQ=
X-Received: by 2002:a05:6638:216e:: with SMTP id
 p14mr47144249jak.70.1608212179441; 
 Thu, 17 Dec 2020 05:36:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAO/g+4Wi8XAy2FhYAFNb0UFUhODFvKWxUsN6XuI7JAjnk5M18DBs7fvGCvrjkMIoAWYk38mcWU+zUnmcI/lY=
X-Received: by 2002:a05:6638:216e:: with SMTP id
 p14mr47144235jak.70.1608212179234; 
 Thu, 17 Dec 2020 05:36:19 -0800 (PST)
MIME-Version: 1.0
References: <20201217094044.46462-1-pbonzini@redhat.com>
 <20201217094044.46462-15-pbonzini@redhat.com>
In-Reply-To: <20201217094044.46462-15-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 17 Dec 2020 17:36:08 +0400
Message-ID: <CAMxuvawP0jHW6-CQ=YzVHf5ZwJVQx-x_kLedP8NSWXrGK5Vi-Q@mail.gmail.com>
Subject: Re: [PATCH 14/18] seccomp: convert to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000aacf0f05b6a91399"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000aacf0f05b6a91399
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 1:41 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>

and improve CONFIG_SECCOMP usage.

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

 configure              | 32 ++++----------------------------
>  meson.build            | 10 ++++++----
>  meson_options.txt      |  2 ++
>  softmmu/meson.build    |  2 +-
>  softmmu/qemu-seccomp.c |  2 --
>  tools/meson.build      |  4 ++--
>  6 files changed, 15 insertions(+), 37 deletions(-)
>
> diff --git a/configure b/configure
> index 649da881a2..00c2d61a96 100755
> --- a/configure
> +++ b/configure
> @@ -414,7 +414,7 @@ debug_stack_usage=3D"no"
>  crypto_afalg=3D"no"
>  cfi=3D"false"
>  cfi_debug=3D"false"
> -seccomp=3D"$default_feature"
> +seccomp=3D"auto"
>  glusterfs=3D"auto"
>  gtk=3D"$default_feature"
>  gtk_gl=3D"no"
> @@ -1356,9 +1356,9 @@ for opt do
>    ;;
>    --disable-tools) want_tools=3D"no"
>    ;;
> -  --enable-seccomp) seccomp=3D"yes"
> +  --enable-seccomp) seccomp=3D"enabled"
>    ;;
> -  --disable-seccomp) seccomp=3D"no"
> +  --disable-seccomp) seccomp=3D"disabled"
>    ;;
>    --disable-glusterfs) glusterfs=3D"disabled"
>    ;;
> @@ -2458,24 +2458,6 @@ EOF
>    fi
>  fi
>
> -##########################################
> -# libseccomp check
> -
> -if test "$seccomp" !=3D "no" ; then
> -    libseccomp_minver=3D"2.3.0"
> -    if $pkg_config --atleast-version=3D$libseccomp_minver libseccomp ; t=
hen
> -        seccomp_cflags=3D"$($pkg_config --cflags libseccomp)"
> -        seccomp_libs=3D"$($pkg_config --libs libseccomp)"
> -        seccomp=3D"yes"
> -    else
> -        if test "$seccomp" =3D "yes" ; then
> -            feature_not_found "libseccomp" \
> -                 "Install libseccomp devel >=3D $libseccomp_minver"
> -        fi
> -        seccomp=3D"no"
> -    fi
> -fi
> -
>  ##########################################
>  # xen probe
>
> @@ -6053,12 +6035,6 @@ if test "$avx512f_opt" =3D "yes" ; then
>    echo "CONFIG_AVX512F_OPT=3Dy" >> $config_host_mak
>  fi
>
> -if test "$seccomp" =3D "yes"; then
> -  echo "CONFIG_SECCOMP=3Dy" >> $config_host_mak
> -  echo "SECCOMP_CFLAGS=3D$seccomp_cflags" >> $config_host_mak
> -  echo "SECCOMP_LIBS=3D$seccomp_libs" >> $config_host_mak
> -fi
> -
>  # XXX: suppress that
>  if [ "$bsd" =3D "yes" ] ; then
>    echo "CONFIG_BSD=3Dy" >> $config_host_mak
> @@ -6606,7 +6582,7 @@ NINJA=3D$ninja $meson setup \
>          -Dcurl=3D$curl -Dglusterfs=3D$glusterfs -Dbzip2=3D$bzip2
> -Dlibiscsi=3D$libiscsi \
>          -Dlibnfs=3D$libnfs -Diconv=3D$iconv -Dcurses=3D$curses
> -Dlibudev=3D$libudev\
>          -Dlibssh=3D$libssh -Drbd=3D$rbd -Dlzo=3D$lzo -Dsnappy=3D$snappy
> -Dlzfse=3D$lzfse \
> -        -Dzstd=3D$zstd \
> +        -Dzstd=3D$zstd -Dseccomp=3D$seccomp \
>          -Ddocs=3D$docs -Dsphinx_build=3D$sphinx_build -Dinstall_blobs=3D=
$blobs \
>          -Dvhost_user_blk_server=3D$vhost_user_blk_server \
>          -Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek \
> diff --git a/meson.build b/meson.build
> index 93a95d7a7f..a0132730d7 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -329,9 +329,10 @@ if 'CONFIG_ATTR' in config_host
>    libattr =3D declare_dependency(link_args:
> config_host['LIBATTR_LIBS'].split())
>  endif
>  seccomp =3D not_found
> -if 'CONFIG_SECCOMP' in config_host
> -  seccomp =3D declare_dependency(compile_args:
> config_host['SECCOMP_CFLAGS'].split(),
> -                               link_args:
> config_host['SECCOMP_LIBS'].split())
> +if not get_option('libiscsi').auto() or have_system or have_tools
> +  seccomp =3D dependency('libseccomp', version: '>=3D2.3.0',
> +                       required: get_option('seccomp'),
> +                       method: 'pkg-config', static: enable_static)
>  endif
>  libcap_ng =3D not_found
>  if 'CONFIG_LIBCAP_NG' in config_host
> @@ -993,6 +994,7 @@ config_host_data.set('HAVE_LIBSSH_0_8',
> have_libssh_0_8)
>  config_host_data.set('CONFIG_RBD', rbd.found())
>  config_host_data.set('CONFIG_SDL', sdl.found())
>  config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
> +config_host_data.set('CONFIG_SECCOMP', seccomp.found())
>  config_host_data.set('CONFIG_SNAPPY', snappy.found())
>  config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER',
> have_vhost_user_blk_server)
>  config_host_data.set('CONFIG_VNC', vnc.found())
> @@ -2361,7 +2363,7 @@ if targetos =3D=3D 'windows'
>    summary_info +=3D {'QGA w32 disk info':
> config_host.has_key('CONFIG_QGA_NTDDSCSI')}
>    summary_info +=3D {'QGA MSI support':
>  config_host.has_key('CONFIG_QGA_MSI')}
>  endif
> -summary_info +=3D {'seccomp support':
>  config_host.has_key('CONFIG_SECCOMP')}
> +summary_info +=3D {'seccomp support':   seccomp.found()}
>  summary_info +=3D {'CFI support':       get_option('cfi')}
>  summary_info +=3D {'CFI debug support': get_option('cfi_debug')}
>  summary_info +=3D {'coroutine backend':
> config_host['CONFIG_COROUTINE_BACKEND']}
> diff --git a/meson_options.txt b/meson_options.txt
> index 5a1de9b1fe..1854a9639f 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -74,6 +74,8 @@ option('sdl', type : 'feature', value : 'auto',
>         description: 'SDL user interface')
>  option('sdl_image', type : 'feature', value : 'auto',
>         description: 'SDL Image support for icons')
> +option('seccomp', type : 'feature', value : 'auto',
> +       description: 'seccomp support')
>  option('snappy', type : 'feature', value : 'auto',
>         description: 'snappy compression support')
>  option('u2f', type : 'feature', value : 'auto',
> diff --git a/softmmu/meson.build b/softmmu/meson.build
> index 2dab6c7eb6..d8e03018ab 100644
> --- a/softmmu/meson.build
> +++ b/softmmu/meson.build
> @@ -28,5 +28,5 @@ softmmu_ss.add(files(
>  ), sdl, libpmem, libdaxctl)
>
>  softmmu_ss.add(when: 'CONFIG_TPM', if_true: files('tpm.c'))
> -softmmu_ss.add(when: 'CONFIG_SECCOMP', if_true: [files('qemu-seccomp.c')=
,
> seccomp])
> +softmmu_ss.add(when: seccomp, if_true: files('qemu-seccomp.c'))
>  softmmu_ss.add(when: fdt, if_true: files('device_tree.c'))
> diff --git a/softmmu/qemu-seccomp.c b/softmmu/qemu-seccomp.c
> index 8325ecb766..377ef6937c 100644
> --- a/softmmu/qemu-seccomp.c
> +++ b/softmmu/qemu-seccomp.c
> @@ -202,7 +202,6 @@ static int seccomp_start(uint32_t seccomp_opts, Error
> **errp)
>      return rc < 0 ? -1 : 0;
>  }
>
> -#ifdef CONFIG_SECCOMP
>  int parse_sandbox(void *opaque, QemuOpts *opts, Error **errp)
>  {
>      if (qemu_opt_get_bool(opts, "enable", false)) {
> @@ -328,4 +327,3 @@ static void seccomp_register(void)
>      }
>  }
>  opts_init(seccomp_register);
> -#endif
> diff --git a/tools/meson.build b/tools/meson.build
> index 76bf84df52..5c52d79fe4 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -1,6 +1,6 @@
>  have_virtiofsd =3D (targetos =3D=3D 'linux' and
>      have_tools and
> -    'CONFIG_SECCOMP' in config_host and
> +    seccomp.found() and
>      'CONFIG_LIBCAP_NG' in config_host and
>      'CONFIG_VHOST_USER' in config_host)
>
> @@ -8,7 +8,7 @@ if get_option('virtiofsd').enabled()
>    if not have_virtiofsd
>      if targetos !=3D 'linux'
>        error('virtiofsd requires Linux')
> -    elif 'CONFIG_SECCOMP' not in config_host or 'CONFIG_LIBCAP_NG' not i=
n
> config_host
> +    elif not seccomp.found() or 'CONFIG_LIBCAP_NG' not in config_host
>        error('virtiofsd requires libcap-ng-devel and seccomp-devel')
>      elif not have_tools or 'CONFIG_VHOST_USER' not in config_host
>        error('virtiofsd needs tools and vhost-user support')
> --
> 2.29.2
>
>
>

--000000000000aacf0f05b6a91399
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 1:41 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sign=
ed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=
=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
---<br></blockquote><div><br></div><div>and improve CONFIG_SECCOMP usage.</=
div><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"=
mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt; </d=
iv><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 32 ++++--=
--------------------------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 ++++++----<=
br>
=C2=A0meson_options.txt=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0softmmu/meson.build=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0softmmu/qemu-seccomp.c |=C2=A0 2 --<br>
=C2=A0tools/meson.build=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A06 files changed, 15 insertions(+), 37 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 649da881a2..00c2d61a96 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -414,7 +414,7 @@ debug_stack_usage=3D&quot;no&quot;<br>
=C2=A0crypto_afalg=3D&quot;no&quot;<br>
=C2=A0cfi=3D&quot;false&quot;<br>
=C2=A0cfi_debug=3D&quot;false&quot;<br>
-seccomp=3D&quot;$default_feature&quot;<br>
+seccomp=3D&quot;auto&quot;<br>
=C2=A0glusterfs=3D&quot;auto&quot;<br>
=C2=A0gtk=3D&quot;$default_feature&quot;<br>
=C2=A0gtk_gl=3D&quot;no&quot;<br>
@@ -1356,9 +1356,9 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-tools) want_tools=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-seccomp) seccomp=3D&quot;yes&quot;<br>
+=C2=A0 --enable-seccomp) seccomp=3D&quot;enabled&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-seccomp) seccomp=3D&quot;no&quot;<br>
+=C2=A0 --disable-seccomp) seccomp=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-glusterfs) glusterfs=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
@@ -2458,24 +2458,6 @@ EOF<br>
=C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-##########################################<br>
-# libseccomp check<br>
-<br>
-if test &quot;$seccomp&quot; !=3D &quot;no&quot; ; then<br>
-=C2=A0 =C2=A0 libseccomp_minver=3D&quot;2.3.0&quot;<br>
-=C2=A0 =C2=A0 if $pkg_config --atleast-version=3D$libseccomp_minver libsec=
comp ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 seccomp_cflags=3D&quot;$($pkg_config --cflags =
libseccomp)&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 seccomp_libs=3D&quot;$($pkg_config --libs libs=
eccomp)&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 seccomp=3D&quot;yes&quot;<br>
-=C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$seccomp&quot; =3D &quot;yes&quo=
t; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 feature_not_found &quot;libsecco=
mp&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Instal=
l libseccomp devel &gt;=3D $libseccomp_minver&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 seccomp=3D&quot;no&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# xen probe<br>
<br>
@@ -6053,12 +6035,6 @@ if test &quot;$avx512f_opt&quot; =3D &quot;yes&quot;=
 ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_AVX512F_OPT=3Dy&quot; &gt;&gt; $config_host_=
mak<br>
=C2=A0fi<br>
<br>
-if test &quot;$seccomp&quot; =3D &quot;yes&quot;; then<br>
-=C2=A0 echo &quot;CONFIG_SECCOMP=3Dy&quot; &gt;&gt; $config_host_mak<br>
-=C2=A0 echo &quot;SECCOMP_CFLAGS=3D$seccomp_cflags&quot; &gt;&gt; $config_=
host_mak<br>
-=C2=A0 echo &quot;SECCOMP_LIBS=3D$seccomp_libs&quot; &gt;&gt; $config_host=
_mak<br>
-fi<br>
-<br>
=C2=A0# XXX: suppress that<br>
=C2=A0if [ &quot;$bsd&quot; =3D &quot;yes&quot; ] ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_BSD=3Dy&quot; &gt;&gt; $config_host_mak<br>
@@ -6606,7 +6582,7 @@ NINJA=3D$ninja $meson setup \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcurl=3D$curl -Dglusterfs=3D$glusterfs -=
Dbzip2=3D$bzip2 -Dlibiscsi=3D$libiscsi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dlibnfs=3D$libnfs -Diconv=3D$iconv -Dcur=
ses=3D$curses -Dlibudev=3D$libudev\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dlibssh=3D$libssh -Drbd=3D$rbd -Dlzo=3D$=
lzo -Dsnappy=3D$snappy -Dlzfse=3D$lzfse \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dzstd=3D$zstd \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dzstd=3D$zstd -Dseccomp=3D$seccomp \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddocs=3D$docs -Dsphinx_build=3D$sphinx_b=
uild -Dinstall_blobs=3D$blobs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvhost_user_blk_server=3D$vhost_user_blk=
_server \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek=
 \<br>
diff --git a/meson.build b/meson.build<br>
index 93a95d7a7f..a0132730d7 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -329,9 +329,10 @@ if &#39;CONFIG_ATTR&#39; in config_host<br>
=C2=A0 =C2=A0libattr =3D declare_dependency(link_args: config_host[&#39;LIB=
ATTR_LIBS&#39;].split())<br>
=C2=A0endif<br>
=C2=A0seccomp =3D not_found<br>
-if &#39;CONFIG_SECCOMP&#39; in config_host<br>
-=C2=A0 seccomp =3D declare_dependency(compile_args: config_host[&#39;SECCO=
MP_CFLAGS&#39;].split(),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0link_args: config_host[&#39;SECCOMP_L=
IBS&#39;].split())<br>
+if not get_option(&#39;libiscsi&#39;).auto() or have_system or have_tools<=
br>
+=C2=A0 seccomp =3D dependency(&#39;libseccomp&#39;, version: &#39;&gt;=3D2=
.3.0&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0required: get_option(&#39;seccomp&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0method: &#39;pkg-config&#39;, static: enable_static)<br>
=C2=A0endif<br>
=C2=A0libcap_ng =3D not_found<br>
=C2=A0if &#39;CONFIG_LIBCAP_NG&#39; in config_host<br>
@@ -993,6 +994,7 @@ config_host_data.set(&#39;HAVE_LIBSSH_0_8&#39;, have_li=
bssh_0_8)<br>
=C2=A0config_host_data.set(&#39;CONFIG_RBD&#39;, rbd.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_SDL&#39;, sdl.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_SDL_IMAGE&#39;, sdl_image.found())<b=
r>
+config_host_data.set(&#39;CONFIG_SECCOMP&#39;, seccomp.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_SNAPPY&#39;, snappy.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_VHOST_USER_BLK_SERVER&#39;, have_vho=
st_user_blk_server)<br>
=C2=A0config_host_data.set(&#39;CONFIG_VNC&#39;, vnc.found())<br>
@@ -2361,7 +2363,7 @@ if targetos =3D=3D &#39;windows&#39;<br>
=C2=A0 =C2=A0summary_info +=3D {&#39;QGA w32 disk info&#39;: config_host.ha=
s_key(&#39;CONFIG_QGA_NTDDSCSI&#39;)}<br>
=C2=A0 =C2=A0summary_info +=3D {&#39;QGA MSI support&#39;:=C2=A0 =C2=A0conf=
ig_host.has_key(&#39;CONFIG_QGA_MSI&#39;)}<br>
=C2=A0endif<br>
-summary_info +=3D {&#39;seccomp support&#39;:=C2=A0 =C2=A0config_host.has_=
key(&#39;CONFIG_SECCOMP&#39;)}<br>
+summary_info +=3D {&#39;seccomp support&#39;:=C2=A0 =C2=A0seccomp.found()}=
<br>
=C2=A0summary_info +=3D {&#39;CFI support&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0g=
et_option(&#39;cfi&#39;)}<br>
=C2=A0summary_info +=3D {&#39;CFI debug support&#39;: get_option(&#39;cfi_d=
ebug&#39;)}<br>
=C2=A0summary_info +=3D {&#39;coroutine backend&#39;: config_host[&#39;CONF=
IG_COROUTINE_BACKEND&#39;]}<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index 5a1de9b1fe..1854a9639f 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -74,6 +74,8 @@ option(&#39;sdl&#39;, type : &#39;feature&#39;, value : &=
#39;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;SDL user interface&#39;)<br>
=C2=A0option(&#39;sdl_image&#39;, type : &#39;feature&#39;, value : &#39;au=
to&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;SDL Image support for icons&#=
39;)<br>
+option(&#39;seccomp&#39;, type : &#39;feature&#39;, value : &#39;auto&#39;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;seccomp support&#39;)<br>
=C2=A0option(&#39;snappy&#39;, type : &#39;feature&#39;, value : &#39;auto&=
#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;snappy compression support&#3=
9;)<br>
=C2=A0option(&#39;u2f&#39;, type : &#39;feature&#39;, value : &#39;auto&#39=
;,<br>
diff --git a/softmmu/meson.build b/softmmu/meson.build<br>
index 2dab6c7eb6..d8e03018ab 100644<br>
--- a/softmmu/meson.build<br>
+++ b/softmmu/meson.build<br>
@@ -28,5 +28,5 @@ softmmu_ss.add(files(<br>
=C2=A0), sdl, libpmem, libdaxctl)<br>
<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_TPM&#39;, if_true: files(&#39;tpm.c&=
#39;))<br>
-softmmu_ss.add(when: &#39;CONFIG_SECCOMP&#39;, if_true: [files(&#39;qemu-s=
eccomp.c&#39;), seccomp])<br>
+softmmu_ss.add(when: seccomp, if_true: files(&#39;qemu-seccomp.c&#39;))<br=
>
=C2=A0softmmu_ss.add(when: fdt, if_true: files(&#39;device_tree.c&#39;))<br=
>
diff --git a/softmmu/qemu-seccomp.c b/softmmu/qemu-seccomp.c<br>
index 8325ecb766..377ef6937c 100644<br>
--- a/softmmu/qemu-seccomp.c<br>
+++ b/softmmu/qemu-seccomp.c<br>
@@ -202,7 +202,6 @@ static int seccomp_start(uint32_t seccomp_opts, Error *=
*errp)<br>
=C2=A0 =C2=A0 =C2=A0return rc &lt; 0 ? -1 : 0;<br>
=C2=A0}<br>
<br>
-#ifdef CONFIG_SECCOMP<br>
=C2=A0int parse_sandbox(void *opaque, QemuOpts *opts, Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (qemu_opt_get_bool(opts, &quot;enable&quot;, false))=
 {<br>
@@ -328,4 +327,3 @@ static void seccomp_register(void)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
=C2=A0opts_init(seccomp_register);<br>
-#endif<br>
diff --git a/tools/meson.build b/tools/meson.build<br>
index 76bf84df52..5c52d79fe4 100644<br>
--- a/tools/meson.build<br>
+++ b/tools/meson.build<br>
@@ -1,6 +1,6 @@<br>
=C2=A0have_virtiofsd =3D (targetos =3D=3D &#39;linux&#39; and<br>
=C2=A0 =C2=A0 =C2=A0have_tools and<br>
-=C2=A0 =C2=A0 &#39;CONFIG_SECCOMP&#39; in config_host and<br>
+=C2=A0 =C2=A0 seccomp.found() and<br>
=C2=A0 =C2=A0 =C2=A0&#39;CONFIG_LIBCAP_NG&#39; in config_host and<br>
=C2=A0 =C2=A0 =C2=A0&#39;CONFIG_VHOST_USER&#39; in config_host)<br>
<br>
@@ -8,7 +8,7 @@ if get_option(&#39;virtiofsd&#39;).enabled()<br>
=C2=A0 =C2=A0if not have_virtiofsd<br>
=C2=A0 =C2=A0 =C2=A0if targetos !=3D &#39;linux&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0error(&#39;virtiofsd requires Linux&#39;)<br>
-=C2=A0 =C2=A0 elif &#39;CONFIG_SECCOMP&#39; not in config_host or &#39;CON=
FIG_LIBCAP_NG&#39; not in config_host<br>
+=C2=A0 =C2=A0 elif not seccomp.found() or &#39;CONFIG_LIBCAP_NG&#39; not i=
n config_host<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0error(&#39;virtiofsd requires libcap-ng-devel an=
d seccomp-devel&#39;)<br>
=C2=A0 =C2=A0 =C2=A0elif not have_tools or &#39;CONFIG_VHOST_USER&#39; not =
in config_host<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0error(&#39;virtiofsd needs tools and vhost-user =
support&#39;)<br>
-- <br>
2.29.2<br>
<br>
<br>
</blockquote></div></div>

--000000000000aacf0f05b6a91399--


