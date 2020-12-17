Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 509E42DD17C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 13:29:34 +0100 (CET)
Received: from localhost ([::1]:46928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpsPV-00069r-Ch
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 07:29:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kpsNK-0005Do-E6
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:27:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kpsNC-0006bP-QH
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:27:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608208030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i5DZBEfup9Ew0NslanS7LS7Jxwoo8qIb71vlUpPPhPY=;
 b=QsEhDI3gtlUNB++vAtSth9xj9ceIUwSPoZ320NbvN8lVp0niw1FsQ7a40/PqaS8gMXMqCK
 cd6eGF0f9DWLyMRZyLSzB5tS4ctMACtKk0QHDDC0qQhtklAVYQbGFCfsESj/z1dj7FBrYW
 5Now4QrgfSoxTRAVrRE8W5pttH716qY=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-QtDmYdcNOWGiP7CnwsiHeQ-1; Thu, 17 Dec 2020 07:27:07 -0500
X-MC-Unique: QtDmYdcNOWGiP7CnwsiHeQ-1
Received: by mail-il1-f200.google.com with SMTP id p10so19888615ilo.9
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 04:27:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i5DZBEfup9Ew0NslanS7LS7Jxwoo8qIb71vlUpPPhPY=;
 b=oKDz5JSY2kJikoxkKQbTbqb16xHfsM96YzZ2VIWV2Hl1QSP6Ksb1QottBIVtEAZBYn
 3EiwJ/ykeh2Blr33v8i3VEUjqgQs78gwQO5840UpzVi2/8XMVSpW5At4ikSVyB79pwVW
 X8WoyRHapSBopoOAn4tuD/iNztwlSW37QCe43upmAKXL7ysUqhC0wzm+gGKwiRWdhy6s
 mTzxS6bNeiDgRoR6X1Jo0QM4PXliL8kBwS2nDvJitguYnWazcdSmKd80HEdoZWcaow9I
 vHByQ6J1SEFBcoVYlaqXqGseC/k1iPnUmkB5pb64yLUipuNqqP8IHxFbVSWDE6DkdSYq
 izFQ==
X-Gm-Message-State: AOAM533QCT1XkZSi1ntMHIcgxoF68gX8F7JxfP3CTJ6x+IUbYbi07s0k
 BSOJko+83E9lts9z4cSljCDxIcfMKY9X1nsk2ijOquhrcXXZVQ/Ein0kibbDotDluidrVnk6wjf
 av9m934e8T7FM8X6s/XniITESTffQayA=
X-Received: by 2002:a92:4101:: with SMTP id o1mr50596409ila.82.1608208026681; 
 Thu, 17 Dec 2020 04:27:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzv9f58mVaL9lS7wtmIK6b3TeeFw51xRIw77UfL+j8MfO/3Ktkh5Mc3mc1a6tEy9ieVl9S1N8UTGDDXuLPZPx8=
X-Received: by 2002:a92:4101:: with SMTP id o1mr50596397ila.82.1608208026463; 
 Thu, 17 Dec 2020 04:27:06 -0800 (PST)
MIME-Version: 1.0
References: <20201217094044.46462-1-pbonzini@redhat.com>
 <20201217094044.46462-8-pbonzini@redhat.com>
In-Reply-To: <20201217094044.46462-8-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 17 Dec 2020 16:26:55 +0400
Message-ID: <CAMxuvaxyToGs3xDezK8SZsk8uK7GF7-wNeEbP2e1h8NHCvDsTQ@mail.gmail.com>
Subject: Re: [PATCH 07/18] libnfs: convert to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000024be7f05b6a81c20"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

--00000000000024be7f05b6a81c20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 1:40 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  configure         | 27 ++++-----------------------
>  meson.build       |  9 ++++++---
>  meson_options.txt |  2 ++
>  3 files changed, 12 insertions(+), 26 deletions(-)
>
> diff --git a/configure b/configure
> index e22c56e8f6..c404252b17 100755
> --- a/configure
> +++ b/configure
> @@ -407,7 +407,7 @@ vss_win32_sdk=3D"$default_feature"
>  win_sdk=3D"no"
>  want_tools=3D"$default_feature"
>  libiscsi=3D"auto"
> -libnfs=3D"$default_feature"
> +libnfs=3D"auto"
>  coroutine=3D""
>  coroutine_pool=3D"$default_feature"
>  debug_stack_usage=3D"no"
> @@ -1143,9 +1143,9 @@ for opt do
>    ;;
>    --enable-libiscsi) libiscsi=3D"enabled"
>    ;;
> -  --disable-libnfs) libnfs=3D"no"
> +  --disable-libnfs) libnfs=3D"disabled"
>    ;;
> -  --enable-libnfs) libnfs=3D"yes"
> +  --enable-libnfs) libnfs=3D"enabled"
>    ;;
>    --enable-profiler) profiler=3D"yes"
>    ;;
> @@ -5561,20 +5561,6 @@ if test "$have_ubsan" =3D "yes"; then
>    QEMU_LDFLAGS=3D"-fsanitize=3Dundefined $QEMU_LDFLAGS"
>  fi
>
> -##########################################
> -# Do we have libnfs
> -if test "$libnfs" !=3D "no" ; then
> -  if $pkg_config --atleast-version=3D1.9.3 libnfs; then
> -    libnfs=3D"yes"
> -    libnfs_libs=3D$($pkg_config --libs libnfs)
> -  else
> -    if test "$libnfs" =3D "yes" ; then
> -      feature_not_found "libnfs" "Install libnfs devel >=3D 1.9.3"
> -    fi
> -    libnfs=3D"no"
> -  fi
> -fi
> -
>  ##########################################
>
>  # Exclude --warn-common with TSan to suppress warnings from the TSan
> libraries.
> @@ -6216,11 +6202,6 @@ if test "$zstd" =3D "yes" ; then
>    echo "ZSTD_LIBS=3D$zstd_libs" >> $config_host_mak
>  fi
>
> -if test "$libnfs" =3D "yes" ; then
> -  echo "CONFIG_LIBNFS=3Dy" >> $config_host_mak
> -  echo "LIBNFS_LIBS=3D$libnfs_libs" >> $config_host_mak
> -fi
> -
>  if test "$seccomp" =3D "yes"; then
>    echo "CONFIG_SECCOMP=3Dy" >> $config_host_mak
>    echo "SECCOMP_CFLAGS=3D$seccomp_cflags" >> $config_host_mak
> @@ -6782,7 +6763,7 @@ NINJA=3D$ninja $meson setup \
>          -Dgettext=3D$gettext -Dxkbcommon=3D$xkbcommon -Du2f=3D$u2f
> -Dvirtiofsd=3D$virtiofsd \
>          -Dcapstone=3D$capstone -Dslirp=3D$slirp -Dfdt=3D$fdt -Dbrlapi=3D=
$brlapi \
>          -Dcurl=3D$curl -Dglusterfs=3D$glusterfs -Dbzip2=3D$bzip2
> -Dlibiscsi=3D$libiscsi \
> -        -Diconv=3D$iconv -Dcurses=3D$curses -Dlibudev=3D$libudev\
> +        -Dlibnfs=3D$libnfs -Diconv=3D$iconv -Dcurses=3D$curses
> -Dlibudev=3D$libudev\
>          -Ddocs=3D$docs -Dsphinx_build=3D$sphinx_build -Dinstall_blobs=3D=
$blobs \
>          -Dvhost_user_blk_server=3D$vhost_user_blk_server \
>          -Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek \
> diff --git a/meson.build b/meson.build
> index 3f53a7f1b2..0b8c9c5917 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -319,8 +319,10 @@ if 'CONFIG_LIBXML2' in config_host
>                                 link_args:
> config_host['LIBXML2_LIBS'].split())
>  endif
>  libnfs =3D not_found
> -if 'CONFIG_LIBNFS' in config_host
> -  libnfs =3D declare_dependency(link_args:
> config_host['LIBNFS_LIBS'].split())
> +if not get_option('libnfs').auto() or have_block
> +  libnfs =3D dependency('libnfs', version: '>=3D1.9.3',
> +                      required: get_option('libnfs'),
> +                      method: 'pkg-config', static: enable_static)
>  endif
>  libattr =3D not_found
>  if 'CONFIG_ATTR' in config_host
> @@ -928,6 +930,7 @@ config_host_data.set('CONFIG_GLUSTERFS_ZEROFILL',
> glusterfs.version().version_co
>  config_host_data.set('CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT',
> glusterfs_ftruncate_has_stat)
>  config_host_data.set('CONFIG_GLUSTERFS_IOCB_HAS_STAT',
> glusterfs_iocb_has_stat)
>  config_host_data.set('CONFIG_LIBISCSI', libiscsi.found())
> +config_host_data.set('CONFIG_LIBNFS', libnfs.found())
>  config_host_data.set('CONFIG_SDL', sdl.found())
>  config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
>  config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER',
> have_vhost_user_blk_server)
> @@ -2286,7 +2289,7 @@ summary_info +=3D {'usb net redir':
>  config_host.has_key('CONFIG_USB_REDIR')}
>  summary_info +=3D {'OpenGL support':
> config_host.has_key('CONFIG_OPENGL')}
>  summary_info +=3D {'OpenGL dmabufs':
> config_host.has_key('CONFIG_OPENGL_DMABUF')}
>  summary_info +=3D {'libiscsi support':  libiscsi.found()}
> -summary_info +=3D {'libnfs support':
> config_host.has_key('CONFIG_LIBNFS')}
> +summary_info +=3D {'libnfs support':    libnfs.found()}
>  summary_info +=3D {'build guest agent':
> config_host.has_key('CONFIG_GUEST_AGENT')}
>  if targetos =3D=3D 'windows'
>    if 'WIN_SDK' in config_host
> diff --git a/meson_options.txt b/meson_options.txt
> index b562d4f1a6..4535bc4dc2 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -52,6 +52,8 @@ option('glusterfs', type : 'feature', value : 'auto',
>         description: 'Glusterfs block device driver')
>  option('libiscsi', type : 'feature', value : 'auto',
>         description: 'libiscsi userspace initiator')
> +option('libnfs', type : 'feature', value : 'auto',
> +       description: 'libnfs block device driver')
>  option('mpath', type : 'feature', value : 'auto',
>         description: 'Multipath persistent reservation passthrough')
>  option('iconv', type : 'feature', value : 'auto',
> --
> 2.29.2
>
>
>

--00000000000024be7f05b6a81c20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 1:40 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sign=
ed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=
=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><div=
>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau=
@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 27 ++++-----------------=
------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9 ++++++---<br>
=C2=A0meson_options.txt |=C2=A0 2 ++<br>
=C2=A03 files changed, 12 insertions(+), 26 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index e22c56e8f6..c404252b17 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -407,7 +407,7 @@ vss_win32_sdk=3D&quot;$default_feature&quot;<br>
=C2=A0win_sdk=3D&quot;no&quot;<br>
=C2=A0want_tools=3D&quot;$default_feature&quot;<br>
=C2=A0libiscsi=3D&quot;auto&quot;<br>
-libnfs=3D&quot;$default_feature&quot;<br>
+libnfs=3D&quot;auto&quot;<br>
=C2=A0coroutine=3D&quot;&quot;<br>
=C2=A0coroutine_pool=3D&quot;$default_feature&quot;<br>
=C2=A0debug_stack_usage=3D&quot;no&quot;<br>
@@ -1143,9 +1143,9 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-libiscsi) libiscsi=3D&quot;enabled&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-libnfs) libnfs=3D&quot;no&quot;<br>
+=C2=A0 --disable-libnfs) libnfs=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-libnfs) libnfs=3D&quot;yes&quot;<br>
+=C2=A0 --enable-libnfs) libnfs=3D&quot;enabled&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-profiler) profiler=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
@@ -5561,20 +5561,6 @@ if test &quot;$have_ubsan&quot; =3D &quot;yes&quot;;=
 then<br>
=C2=A0 =C2=A0QEMU_LDFLAGS=3D&quot;-fsanitize=3Dundefined $QEMU_LDFLAGS&quot=
;<br>
=C2=A0fi<br>
<br>
-##########################################<br>
-# Do we have libnfs<br>
-if test &quot;$libnfs&quot; !=3D &quot;no&quot; ; then<br>
-=C2=A0 if $pkg_config --atleast-version=3D1.9.3 libnfs; then<br>
-=C2=A0 =C2=A0 libnfs=3D&quot;yes&quot;<br>
-=C2=A0 =C2=A0 libnfs_libs=3D$($pkg_config --libs libnfs)<br>
-=C2=A0 else<br>
-=C2=A0 =C2=A0 if test &quot;$libnfs&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 feature_not_found &quot;libnfs&quot; &quot;Install li=
bnfs devel &gt;=3D 1.9.3&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 libnfs=3D&quot;no&quot;<br>
-=C2=A0 fi<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
<br>
=C2=A0# Exclude --warn-common with TSan to suppress warnings from the TSan =
libraries.<br>
@@ -6216,11 +6202,6 @@ if test &quot;$zstd&quot; =3D &quot;yes&quot; ; then=
<br>
=C2=A0 =C2=A0echo &quot;ZSTD_LIBS=3D$zstd_libs&quot; &gt;&gt; $config_host_=
mak<br>
=C2=A0fi<br>
<br>
-if test &quot;$libnfs&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_LIBNFS=3Dy&quot; &gt;&gt; $config_host_mak<br>
-=C2=A0 echo &quot;LIBNFS_LIBS=3D$libnfs_libs&quot; &gt;&gt; $config_host_m=
ak<br>
-fi<br>
-<br>
=C2=A0if test &quot;$seccomp&quot; =3D &quot;yes&quot;; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_SECCOMP=3Dy&quot; &gt;&gt; $config_host_mak<=
br>
=C2=A0 =C2=A0echo &quot;SECCOMP_CFLAGS=3D$seccomp_cflags&quot; &gt;&gt; $co=
nfig_host_mak<br>
@@ -6782,7 +6763,7 @@ NINJA=3D$ninja $meson setup \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dgettext=3D$gettext -Dxkbcommon=3D$xkbco=
mmon -Du2f=3D$u2f -Dvirtiofsd=3D$virtiofsd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcapstone=3D$capstone -Dslirp=3D$slirp -=
Dfdt=3D$fdt -Dbrlapi=3D$brlapi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcurl=3D$curl -Dglusterfs=3D$glusterfs -=
Dbzip2=3D$bzip2 -Dlibiscsi=3D$libiscsi \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Diconv=3D$iconv -Dcurses=3D$curses -Dlibudev=
=3D$libudev\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dlibnfs=3D$libnfs -Diconv=3D$iconv -Dcurses=
=3D$curses -Dlibudev=3D$libudev\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddocs=3D$docs -Dsphinx_build=3D$sphinx_b=
uild -Dinstall_blobs=3D$blobs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvhost_user_blk_server=3D$vhost_user_blk=
_server \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek=
 \<br>
diff --git a/meson.build b/meson.build<br>
index 3f53a7f1b2..0b8c9c5917 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -319,8 +319,10 @@ if &#39;CONFIG_LIBXML2&#39; in config_host<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 link_args: config_host[&#39;LIBXML2_=
LIBS&#39;].split())<br>
=C2=A0endif<br>
=C2=A0libnfs =3D not_found<br>
-if &#39;CONFIG_LIBNFS&#39; in config_host<br>
-=C2=A0 libnfs =3D declare_dependency(link_args: config_host[&#39;LIBNFS_LI=
BS&#39;].split())<br>
+if not get_option(&#39;libnfs&#39;).auto() or have_block<br>
+=C2=A0 libnfs =3D dependency(&#39;libnfs&#39;, version: &#39;&gt;=3D1.9.3&=
#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 required: get_option(&#39;libnfs&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 method: &#39;pkg-config&#39;, static: enable_static)<br>
=C2=A0endif<br>
=C2=A0libattr =3D not_found<br>
=C2=A0if &#39;CONFIG_ATTR&#39; in config_host<br>
@@ -928,6 +930,7 @@ config_host_data.set(&#39;CONFIG_GLUSTERFS_ZEROFILL&#39=
;, glusterfs.version().version_co<br>
=C2=A0config_host_data.set(&#39;CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT&#39;, g=
lusterfs_ftruncate_has_stat)<br>
=C2=A0config_host_data.set(&#39;CONFIG_GLUSTERFS_IOCB_HAS_STAT&#39;, gluste=
rfs_iocb_has_stat)<br>
=C2=A0config_host_data.set(&#39;CONFIG_LIBISCSI&#39;, libiscsi.found())<br>
+config_host_data.set(&#39;CONFIG_LIBNFS&#39;, libnfs.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_SDL&#39;, sdl.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_SDL_IMAGE&#39;, sdl_image.found())<b=
r>
=C2=A0config_host_data.set(&#39;CONFIG_VHOST_USER_BLK_SERVER&#39;, have_vho=
st_user_blk_server)<br>
@@ -2286,7 +2289,7 @@ summary_info +=3D {&#39;usb net redir&#39;:=C2=A0 =C2=
=A0 =C2=A0config_host.has_key(&#39;CONFIG_USB_REDIR&#39;)}<br>
=C2=A0summary_info +=3D {&#39;OpenGL support&#39;:=C2=A0 =C2=A0 config_host=
.has_key(&#39;CONFIG_OPENGL&#39;)}<br>
=C2=A0summary_info +=3D {&#39;OpenGL dmabufs&#39;:=C2=A0 =C2=A0 config_host=
.has_key(&#39;CONFIG_OPENGL_DMABUF&#39;)}<br>
=C2=A0summary_info +=3D {&#39;libiscsi support&#39;:=C2=A0 libiscsi.found()=
}<br>
-summary_info +=3D {&#39;libnfs support&#39;:=C2=A0 =C2=A0 config_host.has_=
key(&#39;CONFIG_LIBNFS&#39;)}<br>
+summary_info +=3D {&#39;libnfs support&#39;:=C2=A0 =C2=A0 libnfs.found()}<=
br>
=C2=A0summary_info +=3D {&#39;build guest agent&#39;: config_host.has_key(&=
#39;CONFIG_GUEST_AGENT&#39;)}<br>
=C2=A0if targetos =3D=3D &#39;windows&#39;<br>
=C2=A0 =C2=A0if &#39;WIN_SDK&#39; in config_host<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index b562d4f1a6..4535bc4dc2 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -52,6 +52,8 @@ option(&#39;glusterfs&#39;, type : &#39;feature&#39;, val=
ue : &#39;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Glusterfs block device driver=
&#39;)<br>
=C2=A0option(&#39;libiscsi&#39;, type : &#39;feature&#39;, value : &#39;aut=
o&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;libiscsi userspace initiator&=
#39;)<br>
+option(&#39;libnfs&#39;, type : &#39;feature&#39;, value : &#39;auto&#39;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;libnfs block device driver&#3=
9;)<br>
=C2=A0option(&#39;mpath&#39;, type : &#39;feature&#39;, value : &#39;auto&#=
39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Multipath persistent reservat=
ion passthrough&#39;)<br>
=C2=A0option(&#39;iconv&#39;, type : &#39;feature&#39;, value : &#39;auto&#=
39;,<br>
-- <br>
2.29.2<br>
<br>
<br>
</blockquote></div></div>

--00000000000024be7f05b6a81c20--


