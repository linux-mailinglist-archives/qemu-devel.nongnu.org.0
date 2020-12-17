Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08602DD27C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 14:57:09 +0100 (CET)
Received: from localhost ([::1]:44086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kptmG-0006An-N3
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 08:57:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kptkI-0005Nf-7E
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:55:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kptkF-0002Dq-8v
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:55:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608213300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DCY4fvd2dydU5hRCyn8Au5Tt0iGGATyzs8rOnsYbl1c=;
 b=OU1hJTDostMcacYOhCNZdtC2f7BaGGKoPF9wWgktqmL0f66EnKmYKib8bzihD/j2QqrNt3
 eeHFC7sa+HTuScAGXLUQY+SZ9YKOA503LDE0v0IoVvq+A5APnXwV5mLLEb+tNEA7KdR2cf
 Hi0VM8T28j0I3lJYhIYhN2f05Af/ouw=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-D69zacIxMtCcEFbK_eMXWg-1; Thu, 17 Dec 2020 08:54:57 -0500
X-MC-Unique: D69zacIxMtCcEFbK_eMXWg-1
Received: by mail-il1-f198.google.com with SMTP id p6so17406397ilb.2
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 05:54:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DCY4fvd2dydU5hRCyn8Au5Tt0iGGATyzs8rOnsYbl1c=;
 b=GQ5zfJfk9Vjq4e6jhe85dH+mV3/fOtvG8L46PMNSBX9uXBsdhuaMZou0vRzKYTKnQu
 o+vY8JKUWh47JcCtyLcF9HY5YfKYU9CefLTH6odPdbd1eg9fuPSmAjJEcaF9uXSEAmm6
 URWd/A2CbJHvpXmIRodS/PnEC2rdcsIibSIylXVPwkX5eDRRPKBZCRm1w2ltdVBUWM7H
 a5tv6piwxRy9Uh+drmki11R2JP04xkagfkRD7jIarUhK/wKu1fHy1TkQ93yvhn081NRC
 gF4pJqPppIOWg5vIxMSwsQksTyjvbbLCp1x3biSc5j42tqUSZRgX/FxIgul4trMomZSn
 zMvg==
X-Gm-Message-State: AOAM531FGmF44OAhHPYk2wLiXONcQjlMVepZElZTetYraYoMCOAnEnW/
 k4JeqI4BKqHMfNxvrVwg/2WzidBeXEfZ9LeplM2VISdZrX4FhCTcje3p+eKtQIE4YERb1OJ16D1
 2kXhDPt7xsSTIsgQywD53KMxvvuzK2r4=
X-Received: by 2002:a92:c6c9:: with SMTP id v9mr50531645ilm.161.1608213297011; 
 Thu, 17 Dec 2020 05:54:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKz6azTUwO/t63UNp8clVomSxaQq26fsU2OPY5CNhK4tVyJDqphXuaThJUvMiD3K2mMNITncdSggEn36st2zE=
X-Received: by 2002:a92:c6c9:: with SMTP id v9mr50531626ilm.161.1608213296709; 
 Thu, 17 Dec 2020 05:54:56 -0800 (PST)
MIME-Version: 1.0
References: <20201217094044.46462-1-pbonzini@redhat.com>
 <20201217094044.46462-17-pbonzini@redhat.com>
In-Reply-To: <20201217094044.46462-17-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 17 Dec 2020 17:54:45 +0400
Message-ID: <CAMxuvay_R0-EioOMRuty6RDrt3RSGUTgiy48aZPz8zgxRhc=vw@mail.gmail.com>
Subject: Re: [PATCH 16/18] cap_ng: convert to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000046201f05b6a9562f"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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

--00000000000046201f05b6a9562f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Dec 17, 2020 at 1:41 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure         | 34 ++++------------------------------
>  meson.build       | 24 ++++++++++++++++++++----
>  meson_options.txt |  2 ++
>  tools/meson.build |  4 ++--
>  4 files changed, 28 insertions(+), 36 deletions(-)
>
> diff --git a/configure b/configure
> index 11d6f40f92..faee71612f 100755
> --- a/configure
> +++ b/configure
> @@ -331,7 +331,7 @@ xen_ctrl_version=3D"$default_feature"
>  xen_pci_passthrough=3D"auto"
>  linux_aio=3D"$default_feature"
>  linux_io_uring=3D"$default_feature"
> -cap_ng=3D"$default_feature"
> +cap_ng=3D"auto"
>  attr=3D"$default_feature"
>  libattr=3D"$default_feature"
>  xfs=3D"$default_feature"
> @@ -1123,9 +1123,9 @@ for opt do
>    ;;
>    --enable-tcg-interpreter) tcg_interpreter=3D"yes"
>    ;;
> -  --disable-cap-ng)  cap_ng=3D"no"
> +  --disable-cap-ng)  cap_ng=3D"disabled"
>    ;;
> -  --enable-cap-ng) cap_ng=3D"yes"
> +  --enable-cap-ng) cap_ng=3D"enabled"
>    ;;
>    --disable-tcg) tcg=3D"disabled"
>    ;;
> @@ -3193,28 +3193,6 @@ EOF
>    fi
>  fi
>
> -##########################################
> -# libcap-ng library probe
> -if test "$cap_ng" !=3D "no" ; then
> -  cap_libs=3D"-lcap-ng"
> -  cat > $TMPC << EOF
> -#include <cap-ng.h>
> -int main(void)
> -{
> -    capng_capability_to_name(CAPNG_EFFECTIVE);
> -    return 0;
> -}
> -EOF
> -  if compile_prog "" "$cap_libs" ; then
> -    cap_ng=3Dyes
> -  else
> -    if test "$cap_ng" =3D "yes" ; then
> -      feature_not_found "cap_ng" "Install libcap-ng devel"
> -    fi
> -    cap_ng=3Dno
> -  fi
> -fi
> -
>  ##########################################
>  # Sound support libraries probe
>
> @@ -5671,10 +5649,6 @@ fi
>  if test "$gprof" =3D "yes" ; then
>    echo "CONFIG_GPROF=3Dy" >> $config_host_mak
>  fi
> -if test "$cap_ng" =3D "yes" ; then
> -  echo "CONFIG_LIBCAP_NG=3Dy" >> $config_host_mak
> -  echo "LIBCAP_NG_LIBS=3D$cap_libs" >> $config_host_mak
> -fi
>  echo "CONFIG_AUDIO_DRIVERS=3D$audio_drv_list" >> $config_host_mak
>  for drv in $audio_drv_list; do
>      def=3DCONFIG_AUDIO_$(echo $drv | LC_ALL=3DC tr '[a-z]' '[A-Z]')
> @@ -6561,7 +6535,7 @@ NINJA=3D$ninja $meson setup \
>          -Dcurl=3D$curl -Dglusterfs=3D$glusterfs -Dbzip2=3D$bzip2
> -Dlibiscsi=3D$libiscsi \
>          -Dlibnfs=3D$libnfs -Diconv=3D$iconv -Dcurses=3D$curses
> -Dlibudev=3D$libudev\
>          -Dlibssh=3D$libssh -Drbd=3D$rbd -Dlzo=3D$lzo -Dsnappy=3D$snappy
> -Dlzfse=3D$lzfse \
> -        -Dzstd=3D$zstd -Dseccomp=3D$seccomp -Dvirtfs=3D$virtfs \
> +        -Dzstd=3D$zstd -Dseccomp=3D$seccomp -Dvirtfs=3D$virtfs -Dcap_ng=
=3D$cap_ng
> \
>          -Ddocs=3D$docs -Dsphinx_build=3D$sphinx_build -Dinstall_blobs=3D=
$blobs \
>          -Dvhost_user_blk_server=3D$vhost_user_blk_server \
>          -Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek \
> diff --git a/meson.build b/meson.build
> index 08d3586df5..56ab291d87 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -334,10 +334,25 @@ if not get_option('libiscsi').auto() or have_system
> or have_tools
>                         required: get_option('seccomp'),
>                         method: 'pkg-config', static: enable_static)
>  endif
> -libcap_ng =3D not_found
> -if 'CONFIG_LIBCAP_NG' in config_host
> -  libcap_ng =3D declare_dependency(link_args:
> config_host['LIBCAP_NG_LIBS'].split())
> +
> +libcap_ng =3D cc.find_library('cap-ng', has_headers: ['cap-ng.h'],
> +                      required: get_option('cap_ng'),
> +                      static: enable_static)
> +if libcap_ng.found() and not cc.links('''
> +   #include <cap-ng.h>
> +   int main(void)
> +   {
> +     capng_capability_to_name(CAPNG_EFFECTIVE);
> +     return 0;
> +   }''', dependencies: libcap_ng)
> +  libcap_ng =3D not_found
> +  if get_option('cap_ng').enabled()
> +    error('could not link libcap-ng')
> +  else
> +    warning('could not link libcap-ng, disabling')
>

.pc file is provided since 0.6.5
curl -s 'https://repology.org/api/v1/project/libcap-ng' |  \
   jq -r 'group_by(.repo) | .[] | "\(.[0].repo): \(map(.version))"' | \
   egrep -i 'ubuntu_18|debian_old|rhel|centos|bsd|suse_leap_15_2|sles'

centos_6: ["0.6.4"]
centos_7: ["0.7.5"]
centos_8: ["0.7.9"]
debian_oldstable: ["0.7.7"]
opensuse_leap_15_2: ["0.7.9"]
ubuntu_18_04: ["0.7.7"]

RHEL6 is EOL, we no longer support it, right?

Then we should be good to switch to pkg-config method.

It can be done later. For this patch:
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


+  endif
>  endif
> +
>  if get_option('xkbcommon').auto() and not have_system and not have_tools
>    xkbcommon =3D not_found
>  else
> @@ -1006,6 +1021,7 @@ config_host_data.set('CONFIG_GLUSTERFS_FALLOCATE',
> glusterfs.version().version_c
>  config_host_data.set('CONFIG_GLUSTERFS_ZEROFILL',
> glusterfs.version().version_compare('>=3D6'))
>  config_host_data.set('CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT',
> glusterfs_ftruncate_has_stat)
>  config_host_data.set('CONFIG_GLUSTERFS_IOCB_HAS_STAT',
> glusterfs_iocb_has_stat)
> +config_host_data.set('CONFIG_LIBCAP_NG', libcap_ng.found())
>  config_host_data.set('CONFIG_LIBISCSI', libiscsi.found())
>  config_host_data.set('CONFIG_LIBNFS', libnfs.found())
>  config_host_data.set('CONFIG_LIBSSH', libssh.found())
> @@ -2348,7 +2364,7 @@ summary_info +=3D {'fdatasync':
>  config_host.has_key('CONFIG_FDATASYNC')}
>  summary_info +=3D {'madvise':
>  config_host.has_key('CONFIG_MADVISE')}
>  summary_info +=3D {'posix_madvise':
>  config_host.has_key('CONFIG_POSIX_MADVISE')}
>  summary_info +=3D {'posix_memalign':
> config_host.has_key('CONFIG_POSIX_MEMALIGN')}
> -summary_info +=3D {'libcap-ng support':
> config_host.has_key('CONFIG_LIBCAP_NG')}
> +summary_info +=3D {'libcap-ng support': libcap_ng.found()}
>  summary_info +=3D {'vhost-kernel support':
> config_host.has_key('CONFIG_VHOST_KERNEL')}
>  summary_info +=3D {'vhost-net support':
> config_host.has_key('CONFIG_VHOST_NET')}
>  summary_info +=3D {'vhost-crypto support':
> config_host.has_key('CONFIG_VHOST_CRYPTO')}
> diff --git a/meson_options.txt b/meson_options.txt
> index 59a8a50e5b..12a1872f20 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -44,6 +44,8 @@ option('brlapi', type : 'feature', value : 'auto',
>         description: 'brlapi character device driver')
>  option('bzip2', type : 'feature', value : 'auto',
>         description: 'bzip2 support for DMG images')
> +option('cap_ng', type : 'feature', value : 'auto',
> +       description: 'cap_ng support')
>  option('cocoa', type : 'feature', value : 'auto',
>         description: 'Cocoa user interface (macOS only)')
>  option('curl', type : 'feature', value : 'auto',
> diff --git a/tools/meson.build b/tools/meson.build
> index 5c52d79fe4..fdce66857d 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -1,14 +1,14 @@
>  have_virtiofsd =3D (targetos =3D=3D 'linux' and
>      have_tools and
>      seccomp.found() and
> -    'CONFIG_LIBCAP_NG' in config_host and
> +    libcap_ng.found() and
>      'CONFIG_VHOST_USER' in config_host)
>
>  if get_option('virtiofsd').enabled()
>    if not have_virtiofsd
>      if targetos !=3D 'linux'
>        error('virtiofsd requires Linux')
> -    elif not seccomp.found() or 'CONFIG_LIBCAP_NG' not in config_host
> +    elif not seccomp.found() or not libcap_ng.found()
>        error('virtiofsd requires libcap-ng-devel and seccomp-devel')
>      elif not have_tools or 'CONFIG_VHOST_USER' not in config_host
>        error('virtiofsd needs tools and vhost-user support')
> --
> 2.29.2
>
>
>

--00000000000046201f05b6a9562f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 1:41 PM Pao=
lo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Si=
gned-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" targe=
t=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 34 ++++-----------------=
-------------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 24 ++++++++++++++++++++----<b=
r>
=C2=A0meson_options.txt |=C2=A0 2 ++<br>
=C2=A0tools/meson.build |=C2=A0 4 ++--<br>
=C2=A04 files changed, 28 insertions(+), 36 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 11d6f40f92..faee71612f 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -331,7 +331,7 @@ xen_ctrl_version=3D&quot;$default_feature&quot;<br>
=C2=A0xen_pci_passthrough=3D&quot;auto&quot;<br>
=C2=A0linux_aio=3D&quot;$default_feature&quot;<br>
=C2=A0linux_io_uring=3D&quot;$default_feature&quot;<br>
-cap_ng=3D&quot;$default_feature&quot;<br>
+cap_ng=3D&quot;auto&quot;<br>
=C2=A0attr=3D&quot;$default_feature&quot;<br>
=C2=A0libattr=3D&quot;$default_feature&quot;<br>
=C2=A0xfs=3D&quot;$default_feature&quot;<br>
@@ -1123,9 +1123,9 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-tcg-interpreter) tcg_interpreter=3D&quot;yes&quot;<br=
>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-cap-ng)=C2=A0 cap_ng=3D&quot;no&quot;<br>
+=C2=A0 --disable-cap-ng)=C2=A0 cap_ng=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-cap-ng) cap_ng=3D&quot;yes&quot;<br>
+=C2=A0 --enable-cap-ng) cap_ng=3D&quot;enabled&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-tcg) tcg=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
@@ -3193,28 +3193,6 @@ EOF<br>
=C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-##########################################<br>
-# libcap-ng library probe<br>
-if test &quot;$cap_ng&quot; !=3D &quot;no&quot; ; then<br>
-=C2=A0 cap_libs=3D&quot;-lcap-ng&quot;<br>
-=C2=A0 cat &gt; $TMPC &lt;&lt; EOF<br>
-#include &lt;cap-ng.h&gt;<br>
-int main(void)<br>
-{<br>
-=C2=A0 =C2=A0 capng_capability_to_name(CAPNG_EFFECTIVE);<br>
-=C2=A0 =C2=A0 return 0;<br>
-}<br>
-EOF<br>
-=C2=A0 if compile_prog &quot;&quot; &quot;$cap_libs&quot; ; then<br>
-=C2=A0 =C2=A0 cap_ng=3Dyes<br>
-=C2=A0 else<br>
-=C2=A0 =C2=A0 if test &quot;$cap_ng&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 feature_not_found &quot;cap_ng&quot; &quot;Install li=
bcap-ng devel&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 cap_ng=3Dno<br>
-=C2=A0 fi<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# Sound support libraries probe<br>
<br>
@@ -5671,10 +5649,6 @@ fi<br>
=C2=A0if test &quot;$gprof&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_GPROF=3Dy&quot; &gt;&gt; $config_host_mak<br=
>
=C2=A0fi<br>
-if test &quot;$cap_ng&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_LIBCAP_NG=3Dy&quot; &gt;&gt; $config_host_mak<br>
-=C2=A0 echo &quot;LIBCAP_NG_LIBS=3D$cap_libs&quot; &gt;&gt; $config_host_m=
ak<br>
-fi<br>
=C2=A0echo &quot;CONFIG_AUDIO_DRIVERS=3D$audio_drv_list&quot; &gt;&gt; $con=
fig_host_mak<br>
=C2=A0for drv in $audio_drv_list; do<br>
=C2=A0 =C2=A0 =C2=A0def=3DCONFIG_AUDIO_$(echo $drv | LC_ALL=3DC tr &#39;[a-=
z]&#39; &#39;[A-Z]&#39;)<br>
@@ -6561,7 +6535,7 @@ NINJA=3D$ninja $meson setup \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcurl=3D$curl -Dglusterfs=3D$glusterfs -=
Dbzip2=3D$bzip2 -Dlibiscsi=3D$libiscsi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dlibnfs=3D$libnfs -Diconv=3D$iconv -Dcur=
ses=3D$curses -Dlibudev=3D$libudev\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dlibssh=3D$libssh -Drbd=3D$rbd -Dlzo=3D$=
lzo -Dsnappy=3D$snappy -Dlzfse=3D$lzfse \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dzstd=3D$zstd -Dseccomp=3D$seccomp -Dvirtfs=
=3D$virtfs \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dzstd=3D$zstd -Dseccomp=3D$seccomp -Dvirtfs=
=3D$virtfs -Dcap_ng=3D$cap_ng \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddocs=3D$docs -Dsphinx_build=3D$sphinx_b=
uild -Dinstall_blobs=3D$blobs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvhost_user_blk_server=3D$vhost_user_blk=
_server \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek=
 \<br>
diff --git a/meson.build b/meson.build<br>
index 08d3586df5..56ab291d87 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -334,10 +334,25 @@ if not get_option(&#39;libiscsi&#39;).auto() or have_=
system or have_tools<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 required: get_option(&#39;seccomp&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 method: &#39;pkg-config&#39;, static: enable_static)<br>
=C2=A0endif<br>
-libcap_ng =3D not_found<br>
-if &#39;CONFIG_LIBCAP_NG&#39; in config_host<br>
-=C2=A0 libcap_ng =3D declare_dependency(link_args: config_host[&#39;LIBCAP=
_NG_LIBS&#39;].split())<br>
+<br>
+libcap_ng =3D cc.find_library(&#39;cap-ng&#39;, has_headers: [&#39;cap-ng.=
h&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 required: get_option(&#39;cap_ng&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 static: enable_static)<br>
+if libcap_ng.found() and not cc.links(&#39;&#39;&#39;<br>
+=C2=A0 =C2=A0#include &lt;cap-ng.h&gt;<br>
+=C2=A0 =C2=A0int main(void)<br>
+=C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0capng_capability_to_name(CAPNG_EFFECTIVE);<br>
+=C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0}&#39;&#39;&#39;, dependencies: libcap_ng)<br>
+=C2=A0 libcap_ng =3D not_found<br>
+=C2=A0 if get_option(&#39;cap_ng&#39;).enabled()<br>
+=C2=A0 =C2=A0 error(&#39;could not link libcap-ng&#39;)<br>
+=C2=A0 else<br>
+=C2=A0 =C2=A0 warning(&#39;could not link libcap-ng, disabling&#39;)<br></=
blockquote><div><br></div><div>.pc file is provided since 0.6.5</div><div> =
curl -s &#39;<a href=3D"https://repology.org/api/v1/project/libcap-ng">http=
s://repology.org/api/v1/project/libcap-ng</a>&#39; | =C2=A0\<br>=C2=A0 =C2=
=A0jq -r &#39;group_by(.repo) | .[] | &quot;\(.[0].repo): \(map(.version))&=
quot;&#39; | \<br>=C2=A0 =C2=A0egrep -i &#39;ubuntu_18|debian_old|rhel|cent=
os|bsd|suse_leap_15_2|sles&#39;<br><br>centos_6: [&quot;0.6.4&quot;]<br>cen=
tos_7: [&quot;0.7.5&quot;]<br>centos_8: [&quot;0.7.9&quot;]<br>debian_oldst=
able: [&quot;0.7.7&quot;]<br>opensuse_leap_15_2: [&quot;0.7.9&quot;]<br>ubu=
ntu_18_04: [&quot;0.7.7&quot;]</div><div><br></div><div>RHEL6 is EOL, we no=
 longer support it, right?</div><div><br></div><div>Then we should be good =
to switch to pkg-config method.</div><div><br></div><div>It can be done lat=
er. For this patch:</div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a hr=
ef=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&g=
t; </div><div><br></div><div><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
+=C2=A0 endif<br>
=C2=A0endif<br>
+<br>
=C2=A0if get_option(&#39;xkbcommon&#39;).auto() and not have_system and not=
 have_tools<br>
=C2=A0 =C2=A0xkbcommon =3D not_found<br>
=C2=A0else<br>
@@ -1006,6 +1021,7 @@ config_host_data.set(&#39;CONFIG_GLUSTERFS_FALLOCATE&=
#39;, glusterfs.version().version_c<br>
=C2=A0config_host_data.set(&#39;CONFIG_GLUSTERFS_ZEROFILL&#39;, glusterfs.v=
ersion().version_compare(&#39;&gt;=3D6&#39;))<br>
=C2=A0config_host_data.set(&#39;CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT&#39;, g=
lusterfs_ftruncate_has_stat)<br>
=C2=A0config_host_data.set(&#39;CONFIG_GLUSTERFS_IOCB_HAS_STAT&#39;, gluste=
rfs_iocb_has_stat)<br>
+config_host_data.set(&#39;CONFIG_LIBCAP_NG&#39;, libcap_ng.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_LIBISCSI&#39;, libiscsi.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_LIBNFS&#39;, libnfs.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_LIBSSH&#39;, libssh.found())<br>
@@ -2348,7 +2364,7 @@ summary_info +=3D {&#39;fdatasync&#39;:=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0config_host.has_key(&#39;CONFIG_FDATASYNC&#39;)}<br>
=C2=A0summary_info +=3D {&#39;madvise&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0config_host.has_key(&#39;CONFIG_MADVISE&#39;)}<br>
=C2=A0summary_info +=3D {&#39;posix_madvise&#39;:=C2=A0 =C2=A0 =C2=A0config=
_host.has_key(&#39;CONFIG_POSIX_MADVISE&#39;)}<br>
=C2=A0summary_info +=3D {&#39;posix_memalign&#39;:=C2=A0 =C2=A0 config_host=
.has_key(&#39;CONFIG_POSIX_MEMALIGN&#39;)}<br>
-summary_info +=3D {&#39;libcap-ng support&#39;: config_host.has_key(&#39;C=
ONFIG_LIBCAP_NG&#39;)}<br>
+summary_info +=3D {&#39;libcap-ng support&#39;: libcap_ng.found()}<br>
=C2=A0summary_info +=3D {&#39;vhost-kernel support&#39;: config_host.has_ke=
y(&#39;CONFIG_VHOST_KERNEL&#39;)}<br>
=C2=A0summary_info +=3D {&#39;vhost-net support&#39;: config_host.has_key(&=
#39;CONFIG_VHOST_NET&#39;)}<br>
=C2=A0summary_info +=3D {&#39;vhost-crypto support&#39;: config_host.has_ke=
y(&#39;CONFIG_VHOST_CRYPTO&#39;)}<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index 59a8a50e5b..12a1872f20 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -44,6 +44,8 @@ option(&#39;brlapi&#39;, type : &#39;feature&#39;, value =
: &#39;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;brlapi character device drive=
r&#39;)<br>
=C2=A0option(&#39;bzip2&#39;, type : &#39;feature&#39;, value : &#39;auto&#=
39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;bzip2 support for DMG images&=
#39;)<br>
+option(&#39;cap_ng&#39;, type : &#39;feature&#39;, value : &#39;auto&#39;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;cap_ng support&#39;)<br>
=C2=A0option(&#39;cocoa&#39;, type : &#39;feature&#39;, value : &#39;auto&#=
39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Cocoa user interface (macOS o=
nly)&#39;)<br>
=C2=A0option(&#39;curl&#39;, type : &#39;feature&#39;, value : &#39;auto&#3=
9;,<br>
diff --git a/tools/meson.build b/tools/meson.build<br>
index 5c52d79fe4..fdce66857d 100644<br>
--- a/tools/meson.build<br>
+++ b/tools/meson.build<br>
@@ -1,14 +1,14 @@<br>
=C2=A0have_virtiofsd =3D (targetos =3D=3D &#39;linux&#39; and<br>
=C2=A0 =C2=A0 =C2=A0have_tools and<br>
=C2=A0 =C2=A0 =C2=A0seccomp.found() and<br>
-=C2=A0 =C2=A0 &#39;CONFIG_LIBCAP_NG&#39; in config_host and<br>
+=C2=A0 =C2=A0 libcap_ng.found() and<br>
=C2=A0 =C2=A0 =C2=A0&#39;CONFIG_VHOST_USER&#39; in config_host)<br>
<br>
=C2=A0if get_option(&#39;virtiofsd&#39;).enabled()<br>
=C2=A0 =C2=A0if not have_virtiofsd<br>
=C2=A0 =C2=A0 =C2=A0if targetos !=3D &#39;linux&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0error(&#39;virtiofsd requires Linux&#39;)<br>
-=C2=A0 =C2=A0 elif not seccomp.found() or &#39;CONFIG_LIBCAP_NG&#39; not i=
n config_host<br>
+=C2=A0 =C2=A0 elif not seccomp.found() or not libcap_ng.found()<br>
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

--00000000000046201f05b6a9562f--


