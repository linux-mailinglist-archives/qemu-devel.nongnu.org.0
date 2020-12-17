Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A722DD1A7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 13:44:52 +0100 (CET)
Received: from localhost ([::1]:36398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpseJ-00063r-P2
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 07:44:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kpscJ-0005cj-O5
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:42:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kpscG-0003Tt-6t
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:42:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608208963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pmEYCigkdXdKZ+TP7G7nm6H10Elm5uvV7toytyy+Q+s=;
 b=RrZRtDTkJrodHoj+puYhGUYtLkE8hDh//FME6OzPWpj0m7xfKVsMlnbWf55JgeFbIvP1tW
 TSssaNaKqdpXhZjaU3BIzZi1KbLsL/BJ0IoAHx7OMZHPvAWDNhBkGZ2PYYXIqiDYXI+/95
 Fp1CI2wB5BepOFb57Gw4HlBZMm1W6BM=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-y8UNys_aM5mrrDDsVi1Zbw-1; Thu, 17 Dec 2020 07:42:41 -0500
X-MC-Unique: y8UNys_aM5mrrDDsVi1Zbw-1
Received: by mail-il1-f197.google.com with SMTP id c72so31441174ila.1
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 04:42:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pmEYCigkdXdKZ+TP7G7nm6H10Elm5uvV7toytyy+Q+s=;
 b=kOOoXYuwqyXdLRIs7Lviy1ZQEBh5+l8M61PAs+nDMvtNyAACuyBxhu4XOXIpxXqU/h
 hQGnFM40K8T97/2YRVrgJb5BZHCD/1hox8HtYdXnpI9BJyFtF6WSj/gR3EWaMHju/ARZ
 fvTevBdom5KD439iXXff+OrgBpyR1cfkRB3sDEa2fPHoxNFzOtfvcuKKyvLGBARWwPb0
 yJgLeV28IZSMSg4yumaRsjVt/wHsDTfAFetr8CmzWDIID++IQhPnJUuGaOFY5Rr48UnR
 RLQMFINymvM44YbN+Ay+awudEkb+LnOnLPLZSVctfyjHhpcgWlTecA5mQlXET+LtDwnh
 H7Qg==
X-Gm-Message-State: AOAM530eP38OuciM6TxpFYBdma6TQ6fgj0Kqi/IQh4MOVuTnxlJcyiXS
 4KS6zd9J3sWheTZ/Lt2fSxIkcVNzog8N/yNeWiSsSBUuxw7BA3LzD97lHOOeyOmOo+yqbVIpW7c
 2nbSJwYdwoSIjJ652zM/miUkb9j6/IKs=
X-Received: by 2002:a02:ac03:: with SMTP id a3mr46270039jao.71.1608208960302; 
 Thu, 17 Dec 2020 04:42:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy862lGnG/WnHrl1uYPVRUx3ziHW7jvMNY/mQutMb2a2f3TIen2fmx59dELizXDThiFMZtiWommnq9lK25Ocss=
X-Received: by 2002:a02:ac03:: with SMTP id a3mr46270024jao.71.1608208959887; 
 Thu, 17 Dec 2020 04:42:39 -0800 (PST)
MIME-Version: 1.0
References: <20201217094044.46462-1-pbonzini@redhat.com>
 <20201217094044.46462-11-pbonzini@redhat.com>
In-Reply-To: <20201217094044.46462-11-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 17 Dec 2020 16:42:28 +0400
Message-ID: <CAMxuvawgAZWOyB9vK2bq2PtyOMiPRf_OOLV3N_2v5hxeWGODAw@mail.gmail.com>
Subject: Re: [PATCH 10/18] lzo: convert to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000c7663205b6a8539e"
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

--000000000000c7663205b6a8539e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Dec 17, 2020 at 1:41 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  configure         | 32 ++++----------------------------
>  meson.build       | 20 ++++++++++++++++----
>  meson_options.txt |  2 ++
>  3 files changed, 22 insertions(+), 32 deletions(-)
>
> diff --git a/configure b/configure
> index e34885d505..f52f04d0e3 100755
> --- a/configure
> +++ b/configure
> @@ -394,7 +394,7 @@ opengl_dmabuf=3D"no"
>  cpuid_h=3D"no"
>  avx2_opt=3D"$default_feature"
>  capstone=3D"auto"
> -lzo=3D"$default_feature"
> +lzo=3D"auto"
>  snappy=3D"$default_feature"
>  bzip2=3D"auto"
>  lzfse=3D"$default_feature"
> @@ -1312,9 +1312,9 @@ for opt do
>    ;;
>    --disable-zlib-test)
>    ;;
> -  --disable-lzo) lzo=3D"no"
> +  --disable-lzo) lzo=3D"disabled"
>    ;;
> -  --enable-lzo) lzo=3D"yes"
> +  --enable-lzo) lzo=3D"enabled"
>    ;;
>    --disable-snappy) snappy=3D"no"
>    ;;
> @@ -2458,25 +2458,6 @@ EOF
>    fi
>  fi
>
> -##########################################
> -# lzo check
> -
> -if test "$lzo" !=3D "no" ; then
> -    cat > $TMPC << EOF
> -#include <lzo/lzo1x.h>
> -int main(void) { lzo_version(); return 0; }
> -EOF
> -    if compile_prog "" "-llzo2" ; then
> -        lzo_libs=3D"-llzo2"
> -        lzo=3D"yes"
> -    else
> -        if test "$lzo" =3D "yes"; then
> -            feature_not_found "liblzo2" "Install liblzo2 devel"
> -        fi
> -        lzo=3D"no"
> -    fi
> -fi
> -
>  ##########################################
>  # snappy check
>
> @@ -6126,11 +6107,6 @@ if test "$avx512f_opt" =3D "yes" ; then
>    echo "CONFIG_AVX512F_OPT=3Dy" >> $config_host_mak
>  fi
>
> -if test "$lzo" =3D "yes" ; then
> -  echo "CONFIG_LZO=3Dy" >> $config_host_mak
> -  echo "LZO_LIBS=3D$lzo_libs" >> $config_host_mak
> -fi
> -
>  if test "$snappy" =3D "yes" ; then
>    echo "CONFIG_SNAPPY=3Dy" >> $config_host_mak
>    echo "SNAPPY_LIBS=3D$snappy_libs" >> $config_host_mak
> @@ -6699,7 +6675,7 @@ NINJA=3D$ninja $meson setup \
>          -Dcapstone=3D$capstone -Dslirp=3D$slirp -Dfdt=3D$fdt -Dbrlapi=3D=
$brlapi \
>          -Dcurl=3D$curl -Dglusterfs=3D$glusterfs -Dbzip2=3D$bzip2
> -Dlibiscsi=3D$libiscsi \
>          -Dlibnfs=3D$libnfs -Diconv=3D$iconv -Dcurses=3D$curses
> -Dlibudev=3D$libudev\
> -        -Dlibssh=3D$libssh -Drbd=3D$rbd \
> +        -Dlibssh=3D$libssh -Drbd=3D$rbd -Dlzo=3D$lzo \
>          -Ddocs=3D$docs -Dsphinx_build=3D$sphinx_build -Dinstall_blobs=3D=
$blobs \
>          -Dvhost_user_blk_server=3D$vhost_user_blk_server \
>          -Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek \
> diff --git a/meson.build b/meson.build
> index 6fa80e2d7e..0310d6d89a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -753,10 +753,21 @@ snappy =3D not_found
>  if 'CONFIG_SNAPPY' in config_host
>    snappy =3D declare_dependency(link_args:
> config_host['SNAPPY_LIBS'].split())
>  endif
> -lzo =3D not_found
> -if 'CONFIG_LZO' in config_host
> -  lzo =3D declare_dependency(link_args: config_host['LZO_LIBS'].split())
> +
> +lzo =3D cc.find_library('lzo2', has_headers: ['lzo/lzo1x.h'],
> +                      required: get_option('lzo'),
> +                      static: enable_static)
> +if lzo.found() and not cc.links('''
> +   #include <lzo/lzo1x.h>
> +   int main(void) { lzo_version(); return 0; }''', dependencies: lzo)
> +  lzo =3D not_found
> +  if get_option('lzo').enabled()
> +    error('could not link liblzo2')
> +  else
> +    warning('could not link liblzo2, disabling')
> +  endif
>  endif
>

(fwiw, the .pc file was added in 2.10)

+
>  rdma =3D not_found
>  if 'CONFIG_RDMA' in config_host
>    rdma =3D declare_dependency(link_args: config_host['RDMA_LIBS'].split(=
))
> @@ -941,6 +952,7 @@ config_host_data.set_quoted('CONFIG_SYSCONFDIR',
> get_option('prefix') / get_opti
>  config_host_data.set('CONFIG_BRLAPI', brlapi.found())
>  config_host_data.set('CONFIG_COCOA', cocoa.found())
>  config_host_data.set('CONFIG_LIBUDEV', libudev.found())
> +config_host_data.set('CONFIG_LZO', lzo.found())
>  config_host_data.set('CONFIG_MPATH', mpathpersist.found())
>  config_host_data.set('CONFIG_MPATH_NEW_API', mpathpersist_new_api)
>  config_host_data.set('CONFIG_CURL', curl.found())
> @@ -2339,7 +2351,7 @@ summary_info +=3D {'TPM support':
>  config_host.has_key('CONFIG_TPM')}
>  summary_info +=3D {'libssh support':    libssh.found()}
>  summary_info +=3D {'QOM debugging':
>  config_host.has_key('CONFIG_QOM_CAST_DEBUG')}
>  summary_info +=3D {'Live block migration':
> config_host.has_key('CONFIG_LIVE_BLOCK_MIGRATION')}
> -summary_info +=3D {'lzo support':       config_host.has_key('CONFIG_LZO'=
)}
> +summary_info +=3D {'lzo support':       lzo.found()}
>  summary_info +=3D {'snappy support':
> config_host.has_key('CONFIG_SNAPPY')}
>  summary_info +=3D {'bzip2 support':     libbzip2.found()}
>  summary_info +=3D {'lzfse support':     config_host.has_key('CONFIG_LZFS=
E')}
> diff --git a/meson_options.txt b/meson_options.txt
> index 630c9dceb7..00a5ec55bd 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -64,6 +64,8 @@ option('curses', type : 'feature', value : 'auto',
>         description: 'curses UI')
>  option('libudev', type : 'feature', value : 'auto',
>         description: 'Use libudev to enumerate host devices')
> +option('lzo', type : 'feature', value : 'auto',
> +       description: 'lzo compression support')
>  option('rbd', type : 'feature', value : 'auto',
>         description: 'Ceph block device driver')
>  option('sdl', type : 'feature', value : 'auto',
> --
> 2.29.2
>
>
>

--000000000000c7663205b6a8539e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 1:41 PM Paolo Bonzini=
 &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-b=
y: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blan=
k">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><div>Reviewed=
-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.c=
om">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 32 ++++-----------------=
-----------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 20 ++++++++++++++++----<br>
=C2=A0meson_options.txt |=C2=A0 2 ++<br>
=C2=A03 files changed, 22 insertions(+), 32 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index e34885d505..f52f04d0e3 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -394,7 +394,7 @@ opengl_dmabuf=3D&quot;no&quot;<br>
=C2=A0cpuid_h=3D&quot;no&quot;<br>
=C2=A0avx2_opt=3D&quot;$default_feature&quot;<br>
=C2=A0capstone=3D&quot;auto&quot;<br>
-lzo=3D&quot;$default_feature&quot;<br>
+lzo=3D&quot;auto&quot;<br>
=C2=A0snappy=3D&quot;$default_feature&quot;<br>
=C2=A0bzip2=3D&quot;auto&quot;<br>
=C2=A0lzfse=3D&quot;$default_feature&quot;<br>
@@ -1312,9 +1312,9 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-zlib-test)<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-lzo) lzo=3D&quot;no&quot;<br>
+=C2=A0 --disable-lzo) lzo=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-lzo) lzo=3D&quot;yes&quot;<br>
+=C2=A0 --enable-lzo) lzo=3D&quot;enabled&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-snappy) snappy=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
@@ -2458,25 +2458,6 @@ EOF<br>
=C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-##########################################<br>
-# lzo check<br>
-<br>
-if test &quot;$lzo&quot; !=3D &quot;no&quot; ; then<br>
-=C2=A0 =C2=A0 cat &gt; $TMPC &lt;&lt; EOF<br>
-#include &lt;lzo/lzo1x.h&gt;<br>
-int main(void) { lzo_version(); return 0; }<br>
-EOF<br>
-=C2=A0 =C2=A0 if compile_prog &quot;&quot; &quot;-llzo2&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 lzo_libs=3D&quot;-llzo2&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 lzo=3D&quot;yes&quot;<br>
-=C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$lzo&quot; =3D &quot;yes&quot;; =
then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 feature_not_found &quot;liblzo2&=
quot; &quot;Install liblzo2 devel&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 lzo=3D&quot;no&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# snappy check<br>
<br>
@@ -6126,11 +6107,6 @@ if test &quot;$avx512f_opt&quot; =3D &quot;yes&quot;=
 ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_AVX512F_OPT=3Dy&quot; &gt;&gt; $config_host_=
mak<br>
=C2=A0fi<br>
<br>
-if test &quot;$lzo&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_LZO=3Dy&quot; &gt;&gt; $config_host_mak<br>
-=C2=A0 echo &quot;LZO_LIBS=3D$lzo_libs&quot; &gt;&gt; $config_host_mak<br>
-fi<br>
-<br>
=C2=A0if test &quot;$snappy&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_SNAPPY=3Dy&quot; &gt;&gt; $config_host_mak<b=
r>
=C2=A0 =C2=A0echo &quot;SNAPPY_LIBS=3D$snappy_libs&quot; &gt;&gt; $config_h=
ost_mak<br>
@@ -6699,7 +6675,7 @@ NINJA=3D$ninja $meson setup \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcapstone=3D$capstone -Dslirp=3D$slirp -=
Dfdt=3D$fdt -Dbrlapi=3D$brlapi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcurl=3D$curl -Dglusterfs=3D$glusterfs -=
Dbzip2=3D$bzip2 -Dlibiscsi=3D$libiscsi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dlibnfs=3D$libnfs -Diconv=3D$iconv -Dcur=
ses=3D$curses -Dlibudev=3D$libudev\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dlibssh=3D$libssh -Drbd=3D$rbd \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dlibssh=3D$libssh -Drbd=3D$rbd -Dlzo=3D$lzo \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddocs=3D$docs -Dsphinx_build=3D$sphinx_b=
uild -Dinstall_blobs=3D$blobs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvhost_user_blk_server=3D$vhost_user_blk=
_server \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek=
 \<br>
diff --git a/meson.build b/meson.build<br>
index 6fa80e2d7e..0310d6d89a 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -753,10 +753,21 @@ snappy =3D not_found<br>
=C2=A0if &#39;CONFIG_SNAPPY&#39; in config_host<br>
=C2=A0 =C2=A0snappy =3D declare_dependency(link_args: config_host[&#39;SNAP=
PY_LIBS&#39;].split())<br>
=C2=A0endif<br>
-lzo =3D not_found<br>
-if &#39;CONFIG_LZO&#39; in config_host<br>
-=C2=A0 lzo =3D declare_dependency(link_args: config_host[&#39;LZO_LIBS&#39=
;].split())<br>
+<br>
+lzo =3D cc.find_library(&#39;lzo2&#39;, has_headers: [&#39;lzo/lzo1x.h&#39=
;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 required: get_option(&#39;lzo&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 static: enable_static)<br>
+if lzo.found() and not cc.links(&#39;&#39;&#39;<br>
+=C2=A0 =C2=A0#include &lt;lzo/lzo1x.h&gt;<br>
+=C2=A0 =C2=A0int main(void) { lzo_version(); return 0; }&#39;&#39;&#39;, d=
ependencies: lzo)<br>
+=C2=A0 lzo =3D not_found<br>
+=C2=A0 if get_option(&#39;lzo&#39;).enabled()<br>
+=C2=A0 =C2=A0 error(&#39;could not link liblzo2&#39;)<br>
+=C2=A0 else<br>
+=C2=A0 =C2=A0 warning(&#39;could not link liblzo2, disabling&#39;)<br>
+=C2=A0 endif<br>
=C2=A0endif<br></blockquote><div><br></div><div>(fwiw, the .pc file was add=
ed in 2.10) <br></div><div><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
+<br>
=C2=A0rdma =3D not_found<br>
=C2=A0if &#39;CONFIG_RDMA&#39; in config_host<br>
=C2=A0 =C2=A0rdma =3D declare_dependency(link_args: config_host[&#39;RDMA_L=
IBS&#39;].split())<br>
@@ -941,6 +952,7 @@ config_host_data.set_quoted(&#39;CONFIG_SYSCONFDIR&#39;=
, get_option(&#39;prefix&#39;) / get_opti<br>
=C2=A0config_host_data.set(&#39;CONFIG_BRLAPI&#39;, brlapi.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_COCOA&#39;, cocoa.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_LIBUDEV&#39;, libudev.found())<br>
+config_host_data.set(&#39;CONFIG_LZO&#39;, lzo.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_MPATH&#39;, mpathpersist.found())<br=
>
=C2=A0config_host_data.set(&#39;CONFIG_MPATH_NEW_API&#39;, mpathpersist_new=
_api)<br>
=C2=A0config_host_data.set(&#39;CONFIG_CURL&#39;, curl.found())<br>
@@ -2339,7 +2351,7 @@ summary_info +=3D {&#39;TPM support&#39;:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0config_host.has_key(&#39;CONFIG_TPM&#39;)}<br>
=C2=A0summary_info +=3D {&#39;libssh support&#39;:=C2=A0 =C2=A0 libssh.foun=
d()}<br>
=C2=A0summary_info +=3D {&#39;QOM debugging&#39;:=C2=A0 =C2=A0 =C2=A0config=
_host.has_key(&#39;CONFIG_QOM_CAST_DEBUG&#39;)}<br>
=C2=A0summary_info +=3D {&#39;Live block migration&#39;: config_host.has_ke=
y(&#39;CONFIG_LIVE_BLOCK_MIGRATION&#39;)}<br>
-summary_info +=3D {&#39;lzo support&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0config=
_host.has_key(&#39;CONFIG_LZO&#39;)}<br>
+summary_info +=3D {&#39;lzo support&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0lzo.fo=
und()}<br>
=C2=A0summary_info +=3D {&#39;snappy support&#39;:=C2=A0 =C2=A0 config_host=
.has_key(&#39;CONFIG_SNAPPY&#39;)}<br>
=C2=A0summary_info +=3D {&#39;bzip2 support&#39;:=C2=A0 =C2=A0 =C2=A0libbzi=
p2.found()}<br>
=C2=A0summary_info +=3D {&#39;lzfse support&#39;:=C2=A0 =C2=A0 =C2=A0config=
_host.has_key(&#39;CONFIG_LZFSE&#39;)}<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index 630c9dceb7..00a5ec55bd 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -64,6 +64,8 @@ option(&#39;curses&#39;, type : &#39;feature&#39;, value =
: &#39;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;curses UI&#39;)<br>
=C2=A0option(&#39;libudev&#39;, type : &#39;feature&#39;, value : &#39;auto=
&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Use libudev to enumerate host=
 devices&#39;)<br>
+option(&#39;lzo&#39;, type : &#39;feature&#39;, value : &#39;auto&#39;,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;lzo compression support&#39;)=
<br>
=C2=A0option(&#39;rbd&#39;, type : &#39;feature&#39;, value : &#39;auto&#39=
;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Ceph block device driver&#39;=
)<br>
=C2=A0option(&#39;sdl&#39;, type : &#39;feature&#39;, value : &#39;auto&#39=
;,<br>
-- <br>
2.29.2<br>
<br>
<br>
</blockquote></div></div>

--000000000000c7663205b6a8539e--


