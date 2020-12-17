Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2C32DD205
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 14:19:54 +0100 (CET)
Received: from localhost ([::1]:35444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kptCD-0005gz-Ld
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 08:19:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kpt4O-0008Sy-8w
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:11:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kpt48-0004de-5d
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:11:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608210690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hLatkZQKTcOuRGYhtQ4mDaDVL0qc3swgMUD7uZ0IZ4s=;
 b=LwtTVZIuFJDt/2P15i5OMPxijqlgXsq23Z2549I1eHVNZSKsJXTXKv/dmKVIvtNB2876AP
 qCP0AHd8EbuY0CGdy9p9qEw/Y8Eokc4ccYNQkujthtQyEmiJYIqL72gNACwZXnfP081FSS
 FXU7bpQCfWiVTUzqIatE8sZwfSUyBcA=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-xVDYbpCZPby-nnsqIwblyw-1; Thu, 17 Dec 2020 08:11:28 -0500
X-MC-Unique: xVDYbpCZPby-nnsqIwblyw-1
Received: by mail-il1-f198.google.com with SMTP id g1so25945273ilq.7
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 05:11:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hLatkZQKTcOuRGYhtQ4mDaDVL0qc3swgMUD7uZ0IZ4s=;
 b=uPI2fwxQGrrwgfM0305P8Wef5G0ZZl2cwQtxVAXGrERfHWsGIZiPAF9iJIYXIp1t9p
 cOdRSyv6Seroo5XP05toZ9AyuCkf+VZJxWKGdmr91GVQ1jWAsRhG+p5auT1nm9Xxzx3F
 GchlpJhlp16Q/tqgpHfwHP7e12Wu7TQoej6SMQcZv/01uUF6VRLx1YoI5/wnIO6mojvM
 105bPUFkTeQzKxB08ERSghhANl3sYmfVvowvCRjI+n1PlkkvEEJRrULLfmYPczQc4I3A
 iVjxynpLJDxEvWH9bv509YJP1/NVZfc73x1rLRYaX8Kuriyq29MJuJEYjVtPxtn8kzKH
 HRmQ==
X-Gm-Message-State: AOAM532XFNoKHfib5bz3NxMoOGmnk4vnQ8VIMriVoV4/Y208RMQZejlO
 KoZrpW+NuinjPWfJ1U7UR0AJMQB5CUo/e9loh9dT7V7nUDIUq5p8R4XR+IMTlQictWi5miw+ZKU
 9mtBqvWuz2FnbnJwz3tXqe7P2qap0ePQ=
X-Received: by 2002:a92:4101:: with SMTP id o1mr50760624ila.82.1608210687501; 
 Thu, 17 Dec 2020 05:11:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztPnJJaOkoyfPwzigRx65Jl0nEoxShQOZ/0jJbokiQa0kUQL4FLozd7aVttGpy8B3QrAR97bx8iyzPq/OKc9M=
X-Received: by 2002:a92:4101:: with SMTP id o1mr50760603ila.82.1608210687209; 
 Thu, 17 Dec 2020 05:11:27 -0800 (PST)
MIME-Version: 1.0
References: <20201217094044.46462-1-pbonzini@redhat.com>
 <20201217094044.46462-13-pbonzini@redhat.com>
In-Reply-To: <20201217094044.46462-13-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 17 Dec 2020 17:11:16 +0400
Message-ID: <CAMxuvay-=9DjjLvUbe4-NSNExmkVsebwHfofycr8a_LDk8ZU+w@mail.gmail.com>
Subject: Re: [PATCH 12/18] lzfse: convert to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000bc55d905b6a8bad1"
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

--000000000000bc55d905b6a8bad1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 1:41 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  configure         | 31 ++++---------------------------
>  meson.build       | 19 +++++++++++++++----
>  meson_options.txt |  2 ++
>  3 files changed, 21 insertions(+), 31 deletions(-)
>
> diff --git a/configure b/configure
> index aee27d9cdd..ea5650acca 100755
> --- a/configure
> +++ b/configure
> @@ -397,7 +397,7 @@ capstone=3D"auto"
>  lzo=3D"auto"
>  snappy=3D"auto"
>  bzip2=3D"auto"
> -lzfse=3D"$default_feature"
> +lzfse=3D"auto"
>  zstd=3D"$default_feature"
>  guest_agent=3D"$default_feature"
>  guest_agent_with_vss=3D"no"
> @@ -1324,9 +1324,9 @@ for opt do
>    ;;
>    --enable-bzip2) bzip2=3D"enabled"
>    ;;
> -  --enable-lzfse) lzfse=3D"yes"
> +  --enable-lzfse) lzfse=3D"enabled"
>    ;;
> -  --disable-lzfse) lzfse=3D"no"
> +  --disable-lzfse) lzfse=3D"disabled"
>    ;;
>    --disable-zstd) zstd=3D"no"
>    ;;
> @@ -2458,24 +2458,6 @@ EOF
>    fi
>  fi
>
> -##########################################
> -# lzfse check
> -
> -if test "$lzfse" !=3D "no" ; then
> -    cat > $TMPC << EOF
> -#include <lzfse.h>
> -int main(void) { lzfse_decode_scratch_size(); return 0; }
> -EOF
> -    if compile_prog "" "-llzfse" ; then
> -        lzfse=3D"yes"
> -    else
> -        if test "$lzfse" =3D "yes"; then
> -            feature_not_found "lzfse" "Install lzfse devel"
> -        fi
> -        lzfse=3D"no"
> -    fi
> -fi
> -
>  ##########################################
>  # zstd check
>
> @@ -6088,11 +6070,6 @@ if test "$avx512f_opt" =3D "yes" ; then
>    echo "CONFIG_AVX512F_OPT=3Dy" >> $config_host_mak
>  fi
>
> -if test "$lzfse" =3D "yes" ; then
> -  echo "CONFIG_LZFSE=3Dy" >> $config_host_mak
> -  echo "LZFSE_LIBS=3D-llzfse" >> $config_host_mak
> -fi
> -
>  if test "$zstd" =3D "yes" ; then
>    echo "CONFIG_ZSTD=3Dy" >> $config_host_mak
>    echo "ZSTD_CFLAGS=3D$zstd_cflags" >> $config_host_mak
> @@ -6651,7 +6628,7 @@ NINJA=3D$ninja $meson setup \
>          -Dcapstone=3D$capstone -Dslirp=3D$slirp -Dfdt=3D$fdt -Dbrlapi=3D=
$brlapi \
>          -Dcurl=3D$curl -Dglusterfs=3D$glusterfs -Dbzip2=3D$bzip2
> -Dlibiscsi=3D$libiscsi \
>          -Dlibnfs=3D$libnfs -Diconv=3D$iconv -Dcurses=3D$curses
> -Dlibudev=3D$libudev\
> -        -Dlibssh=3D$libssh -Drbd=3D$rbd -Dlzo=3D$lzo -Dsnappy=3D$snappy =
\
> +        -Dlibssh=3D$libssh -Drbd=3D$rbd -Dlzo=3D$lzo -Dsnappy=3D$snappy
> -Dlzfse=3D$lzfse \
>          -Ddocs=3D$docs -Dsphinx_build=3D$sphinx_build -Dinstall_blobs=3D=
$blobs \
>          -Dvhost_user_blk_server=3D$vhost_user_blk_server \
>          -Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek \
> diff --git a/meson.build b/meson.build
> index 9f6ea65626..c02d9c3e1a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -695,10 +695,21 @@ if not get_option('bzip2').auto() or have_block
>      endif
>    endif
>  endif
> -liblzfse =3D not_found
> -if 'CONFIG_LZFSE' in config_host
> -  liblzfse =3D declare_dependency(link_args:
> config_host['LZFSE_LIBS'].split())
> +
> +liblzfse =3D cc.find_library('lzfse', has_headers: ['lzfse.h'],
> +                      required: get_option('lzfse'),
> +                      static: enable_static)
> +if liblzfse.found() and not cc.links('''
> +   #include <lzfse.h>
> +   int main(void) { lzfse_decode_scratch_size(); return 0; }''',
> dependencies: liblzfse)
> +  liblzfse =3D not_found
> +  if get_option('lzfse').enabled()
> +    error('could not link liblzfse')
> +  else
> +    warning('could not link liblzfse, disabling')
> +  endif
>  endif
> +
>  oss =3D not_found
>  if 'CONFIG_AUDIO_OSS' in config_host
>    oss =3D declare_dependency(link_args: config_host['OSS_LIBS'].split())
> @@ -2365,7 +2376,7 @@ summary_info +=3D {'Live block migration':
> config_host.has_key('CONFIG_LIVE_BLOCK_
>  summary_info +=3D {'lzo support':       lzo.found()}
>  summary_info +=3D {'snappy support':    snappy.found()}
>  summary_info +=3D {'bzip2 support':     libbzip2.found()}
> -summary_info +=3D {'lzfse support':     config_host.has_key('CONFIG_LZFS=
E')}
> +summary_info +=3D {'lzfse support':     liblzfse.found()}
>  summary_info +=3D {'zstd support':      config_host.has_key('CONFIG_ZSTD=
')}
>  summary_info +=3D {'NUMA host support': config_host.has_key('CONFIG_NUMA=
')}
>  summary_info +=3D {'libxml2':
>  config_host.has_key('CONFIG_LIBXML2')}
> diff --git a/meson_options.txt b/meson_options.txt
> index e2b7e23887..f74a3d78c4 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -64,6 +64,8 @@ option('curses', type : 'feature', value : 'auto',
>         description: 'curses UI')
>  option('libudev', type : 'feature', value : 'auto',
>         description: 'Use libudev to enumerate host devices')
> +option('lzfse', type : 'feature', value : 'auto',
> +       description: 'lzfse support for DMG images')
>  option('lzo', type : 'feature', value : 'auto',
>         description: 'lzo compression support')
>  option('rbd', type : 'feature', value : 'auto',
> --
> 2.29.2
>
>
>

--000000000000bc55d905b6a8bad1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 1:41 PM Paolo=
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
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 31 ++++-----------------=
----------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 19 +++++++++++++++----<br>
=C2=A0meson_options.txt |=C2=A0 2 ++<br>
=C2=A03 files changed, 21 insertions(+), 31 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index aee27d9cdd..ea5650acca 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -397,7 +397,7 @@ capstone=3D&quot;auto&quot;<br>
=C2=A0lzo=3D&quot;auto&quot;<br>
=C2=A0snappy=3D&quot;auto&quot;<br>
=C2=A0bzip2=3D&quot;auto&quot;<br>
-lzfse=3D&quot;$default_feature&quot;<br>
+lzfse=3D&quot;auto&quot;<br>
=C2=A0zstd=3D&quot;$default_feature&quot;<br>
=C2=A0guest_agent=3D&quot;$default_feature&quot;<br>
=C2=A0guest_agent_with_vss=3D&quot;no&quot;<br>
@@ -1324,9 +1324,9 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-bzip2) bzip2=3D&quot;enabled&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-lzfse) lzfse=3D&quot;yes&quot;<br>
+=C2=A0 --enable-lzfse) lzfse=3D&quot;enabled&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-lzfse) lzfse=3D&quot;no&quot;<br>
+=C2=A0 --disable-lzfse) lzfse=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-zstd) zstd=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
@@ -2458,24 +2458,6 @@ EOF<br>
=C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-##########################################<br>
-# lzfse check<br>
-<br>
-if test &quot;$lzfse&quot; !=3D &quot;no&quot; ; then<br>
-=C2=A0 =C2=A0 cat &gt; $TMPC &lt;&lt; EOF<br>
-#include &lt;lzfse.h&gt;<br>
-int main(void) { lzfse_decode_scratch_size(); return 0; }<br>
-EOF<br>
-=C2=A0 =C2=A0 if compile_prog &quot;&quot; &quot;-llzfse&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 lzfse=3D&quot;yes&quot;<br>
-=C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$lzfse&quot; =3D &quot;yes&quot;=
; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 feature_not_found &quot;lzfse&qu=
ot; &quot;Install lzfse devel&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 lzfse=3D&quot;no&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# zstd check<br>
<br>
@@ -6088,11 +6070,6 @@ if test &quot;$avx512f_opt&quot; =3D &quot;yes&quot;=
 ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_AVX512F_OPT=3Dy&quot; &gt;&gt; $config_host_=
mak<br>
=C2=A0fi<br>
<br>
-if test &quot;$lzfse&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_LZFSE=3Dy&quot; &gt;&gt; $config_host_mak<br>
-=C2=A0 echo &quot;LZFSE_LIBS=3D-llzfse&quot; &gt;&gt; $config_host_mak<br>
-fi<br>
-<br>
=C2=A0if test &quot;$zstd&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_ZSTD=3Dy&quot; &gt;&gt; $config_host_mak<br>
=C2=A0 =C2=A0echo &quot;ZSTD_CFLAGS=3D$zstd_cflags&quot; &gt;&gt; $config_h=
ost_mak<br>
@@ -6651,7 +6628,7 @@ NINJA=3D$ninja $meson setup \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcapstone=3D$capstone -Dslirp=3D$slirp -=
Dfdt=3D$fdt -Dbrlapi=3D$brlapi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcurl=3D$curl -Dglusterfs=3D$glusterfs -=
Dbzip2=3D$bzip2 -Dlibiscsi=3D$libiscsi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dlibnfs=3D$libnfs -Diconv=3D$iconv -Dcur=
ses=3D$curses -Dlibudev=3D$libudev\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dlibssh=3D$libssh -Drbd=3D$rbd -Dlzo=3D$lzo -=
Dsnappy=3D$snappy \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dlibssh=3D$libssh -Drbd=3D$rbd -Dlzo=3D$lzo -=
Dsnappy=3D$snappy -Dlzfse=3D$lzfse \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddocs=3D$docs -Dsphinx_build=3D$sphinx_b=
uild -Dinstall_blobs=3D$blobs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvhost_user_blk_server=3D$vhost_user_blk=
_server \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek=
 \<br>
diff --git a/meson.build b/meson.build<br>
index 9f6ea65626..c02d9c3e1a 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -695,10 +695,21 @@ if not get_option(&#39;bzip2&#39;).auto() or have_blo=
ck<br>
=C2=A0 =C2=A0 =C2=A0endif<br>
=C2=A0 =C2=A0endif<br>
=C2=A0endif<br>
-liblzfse =3D not_found<br>
-if &#39;CONFIG_LZFSE&#39; in config_host<br>
-=C2=A0 liblzfse =3D declare_dependency(link_args: config_host[&#39;LZFSE_L=
IBS&#39;].split())<br>
+<br>
+liblzfse =3D cc.find_library(&#39;lzfse&#39;, has_headers: [&#39;lzfse.h&#=
39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 required: get_option(&#39;lzfse&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 static: enable_static)<br>
+if liblzfse.found() and not cc.links(&#39;&#39;&#39;<br>
+=C2=A0 =C2=A0#include &lt;lzfse.h&gt;<br>
+=C2=A0 =C2=A0int main(void) { lzfse_decode_scratch_size(); return 0; }&#39=
;&#39;&#39;, dependencies: liblzfse)<br>
+=C2=A0 liblzfse =3D not_found<br>
+=C2=A0 if get_option(&#39;lzfse&#39;).enabled()<br>
+=C2=A0 =C2=A0 error(&#39;could not link liblzfse&#39;)<br>
+=C2=A0 else<br>
+=C2=A0 =C2=A0 warning(&#39;could not link liblzfse, disabling&#39;)<br>
+=C2=A0 endif<br>
=C2=A0endif<br>
+<br>
=C2=A0oss =3D not_found<br>
=C2=A0if &#39;CONFIG_AUDIO_OSS&#39; in config_host<br>
=C2=A0 =C2=A0oss =3D declare_dependency(link_args: config_host[&#39;OSS_LIB=
S&#39;].split())<br>
@@ -2365,7 +2376,7 @@ summary_info +=3D {&#39;Live block migration&#39;: co=
nfig_host.has_key(&#39;CONFIG_LIVE_BLOCK_<br>
=C2=A0summary_info +=3D {&#39;lzo support&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0l=
zo.found()}<br>
=C2=A0summary_info +=3D {&#39;snappy support&#39;:=C2=A0 =C2=A0 snappy.foun=
d()}<br>
=C2=A0summary_info +=3D {&#39;bzip2 support&#39;:=C2=A0 =C2=A0 =C2=A0libbzi=
p2.found()}<br>
-summary_info +=3D {&#39;lzfse support&#39;:=C2=A0 =C2=A0 =C2=A0config_host=
.has_key(&#39;CONFIG_LZFSE&#39;)}<br>
+summary_info +=3D {&#39;lzfse support&#39;:=C2=A0 =C2=A0 =C2=A0liblzfse.fo=
und()}<br>
=C2=A0summary_info +=3D {&#39;zstd support&#39;:=C2=A0 =C2=A0 =C2=A0 config=
_host.has_key(&#39;CONFIG_ZSTD&#39;)}<br>
=C2=A0summary_info +=3D {&#39;NUMA host support&#39;: config_host.has_key(&=
#39;CONFIG_NUMA&#39;)}<br>
=C2=A0summary_info +=3D {&#39;libxml2&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0config_host.has_key(&#39;CONFIG_LIBXML2&#39;)}<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index e2b7e23887..f74a3d78c4 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -64,6 +64,8 @@ option(&#39;curses&#39;, type : &#39;feature&#39;, value =
: &#39;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;curses UI&#39;)<br>
=C2=A0option(&#39;libudev&#39;, type : &#39;feature&#39;, value : &#39;auto=
&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Use libudev to enumerate host=
 devices&#39;)<br>
+option(&#39;lzfse&#39;, type : &#39;feature&#39;, value : &#39;auto&#39;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;lzfse support for DMG images&=
#39;)<br>
=C2=A0option(&#39;lzo&#39;, type : &#39;feature&#39;, value : &#39;auto&#39=
;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;lzo compression support&#39;)=
<br>
=C2=A0option(&#39;rbd&#39;, type : &#39;feature&#39;, value : &#39;auto&#39=
;,<br>
-- <br>
2.29.2<br>
<br>
<br>
</blockquote></div></div>

--000000000000bc55d905b6a8bad1--


