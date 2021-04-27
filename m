Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 538D336C0E6
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 10:31:28 +0200 (CEST)
Received: from localhost ([::1]:34872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbJ7v-0007RU-DO
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 04:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lbJ6Q-0006kL-27
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:29:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lbJ6M-0002sg-DQ
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:29:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619512188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N+qDEmPCS9epdeQHYxCwlRYiz4Xn8MSk8WY8UP7Fqqg=;
 b=Hgd1PcBcXqRFKmv/hlHfZ9JtwGwWMVeVVA3Fe3594wnNsL6/lUihrRzn4gArFRlMvEW+VH
 HMxp/9avHdIHeRStZfyXKqRCK2pENk5eVpGrz8/LNKPbPExYuWpN7dhTzWYhND7TOMLS3x
 upzn/5p8T1boqNrwqY9KfxxNDIUmcn0=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-cWax7pbRMnetuxgI2_XHrw-1; Tue, 27 Apr 2021 04:29:44 -0400
X-MC-Unique: cWax7pbRMnetuxgI2_XHrw-1
Received: by mail-pj1-f69.google.com with SMTP id
 p14-20020a17090a428eb02900fc9e178ef3so29777381pjg.5
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 01:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N+qDEmPCS9epdeQHYxCwlRYiz4Xn8MSk8WY8UP7Fqqg=;
 b=o4hl4YV3b+DjX1U/jSihiyhS8uyOl7n68M3NWZ5pkLZkt6KJGiK53mp7tjraWPw5F7
 HCFvgWYAgiRi0gKA8L6NfiaMlv5lSWvyoJh0t2LOEBItqWvKRz6OxAtTUVqm29qvlN+w
 7g9YHgIQ0STb/0ww6xj8lSGDrEABadeLi6hHQ/D1dj116NfY8e8RDHipGK5+a0JySakk
 wGuoHw5pjGZ4zdEdtqKBC7Y+LDweANWxwhR/NuJbEmn+crq1qbXyZZLVqfjOJjpFOit2
 n5LvNtUbDJjiaSEWWPYudf5JgpeDU622gy9/zTHseH49v0SWprsHl0cqWDTN4WrP/mfE
 7tGg==
X-Gm-Message-State: AOAM53072KmaknxNVolj1ZUlZrmr0JuU2MGvuYN0NVWRhDi/RPFhAbR/
 XC8X1lFDkFce0LdDkVo3SY82ceX9+77matXbnQfcIX9Xwfi1KUAm0W0Co4jCx9YJvBlc3IFmQJl
 YhG1Ywyd/9J3JgM7EJlAPVGIR2kkHVgQ=
X-Received: by 2002:a17:90a:510d:: with SMTP id
 t13mr24927431pjh.97.1619512183466; 
 Tue, 27 Apr 2021 01:29:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPVx0llvQQTEwTZrQ8TmhdG5+FfgQq8QFvbdBjunVJi4uzBmD/VQ4+r2K1FZmz92mmCF4PEDuNgAr2TpDRcDc=
X-Received: by 2002:a17:90a:510d:: with SMTP id
 t13mr24927413pjh.97.1619512183213; 
 Tue, 27 Apr 2021 01:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210423083351.2096734-1-kraxel@redhat.com>
 <20210423083351.2096734-2-kraxel@redhat.com>
In-Reply-To: <20210423083351.2096734-2-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 27 Apr 2021 12:29:31 +0400
Message-ID: <CAMxuvazUabU8BKPSsVzxJxek+88eHfsmWym+GK0QQnWCe8XnvA@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] build: add separate spice-protocol config option
To: Gerd Hoffmann <kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000063e51705c0f01018"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000063e51705c0f01018
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 12:34 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> When implementing spice vdagent protocol in qemu we only need the
> spice-protocol package for that, spice-server is not needed.  So
> go split those two build dependencies.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  configure   | 36 ++++++++++++++++++++++++++++++++----
>  meson.build |  4 ++++
>  2 files changed, 36 insertions(+), 4 deletions(-)
>
> diff --git a/configure b/configure
> index 4f374b48890e..e6f959da2347 100755
> --- a/configure
> +++ b/configure
> @@ -388,6 +388,7 @@ qom_cast_debug=3D"yes"
>  trace_backends=3D"log"
>  trace_file=3D"trace"
>  spice=3D"$default_feature"
> +spice_protocol=3D"auto"
>  rbd=3D"auto"
>  smartcard=3D"$default_feature"
>  u2f=3D"auto"
> @@ -1129,7 +1130,15 @@ for opt do
>    ;;
>    --disable-spice) spice=3D"no"
>    ;;
> -  --enable-spice) spice=3D"yes"
> +  --enable-spice)
> +      spice_protocol=3D"yes"
> +      spice=3D"yes"
> +  ;;
> +  --disable-spice-protocol)
> +      spice_protocol=3D"no"
> +      spice=3D"no"
> +  ;;
> +  --enable-spice-protocol) spice_protocol=3D"yes"
>    ;;
>    --disable-libiscsi) libiscsi=3D"disabled"
>    ;;
> @@ -1866,6 +1875,7 @@ disabled with --disable-FEATURE, default is enabled
> if available
>    vhost-user-blk-server    vhost-user-blk server support
>    vhost-vdpa      vhost-vdpa kernel backend support
>    spice           spice
> +  spice-protocol  spice-protocol
>    rbd             rados block device (rbd)
>    libiscsi        iscsi support
>    libnfs          nfs support
> @@ -4149,6 +4159,19 @@ fi
>
>  ##########################################
>  # spice probe
> +if test "$spice_protocol" !=3D "no" ; then
> +  spice_protocol_cflags=3D$($pkg_config --cflags spice-protocol 2>/dev/n=
ull)
> +  if $pkg_config --atleast-version=3D0.12.3 spice-protocol; then
> +    spice_protocol=3D"yes"
> +  else
> +    if test "$spice_protocol" =3D "yes" ; then
> +      feature_not_found "spice_protocol" \
> +          "Install spice-protocol(>=3D0.12.3) devel"
> +    fi
> +    spice_protocol=3D"no"
> +  fi
> +fi
> +
>  if test "$spice" !=3D "no" ; then
>    cat > $TMPC << EOF
>  #include <spice.h>
> @@ -4157,13 +4180,13 @@ EOF
>    spice_cflags=3D$($pkg_config --cflags spice-protocol spice-server
> 2>/dev/null)
>    spice_libs=3D$($pkg_config --libs spice-protocol spice-server 2>/dev/n=
ull)
>    if $pkg_config --atleast-version=3D0.12.5 spice-server && \
> -     $pkg_config --atleast-version=3D0.12.3 spice-protocol && \
> +     test "$spice_protocol" =3D "yes" && \
>       compile_prog "$spice_cflags" "$spice_libs" ; then
>      spice=3D"yes"
>    else
>      if test "$spice" =3D "yes" ; then
>        feature_not_found "spice" \
> -          "Install spice-server(>=3D0.12.5) and spice-protocol(>=3D0.12.=
3)
> devel"
> +          "Install spice-server(>=3D0.12.5) devel"
>      fi
>      spice=3D"no"
>    fi
> @@ -5807,9 +5830,14 @@ fi
>  if test "$posix_memalign" =3D "yes" ; then
>    echo "CONFIG_POSIX_MEMALIGN=3Dy" >> $config_host_mak
>  fi
> +
> +if test "$spice_protocol" =3D "yes" ; then
> +  echo "CONFIG_SPICE_PROTOCOL=3Dy" >> $config_host_mak
> +  echo "SPICE_PROTOCOL_CFLAGS=3D$spice_protocol_cflags" >> $config_host_=
mak
> +fi
>  if test "$spice" =3D "yes" ; then
>    echo "CONFIG_SPICE=3Dy" >> $config_host_mak
> -  echo "SPICE_CFLAGS=3D$spice_cflags" >> $config_host_mak
> +  echo "SPICE_CFLAGS=3D$spice_cflags $spice_protocol_cflags" >>
> $config_host_mak
>    echo "SPICE_LIBS=3D$spice_libs" >> $config_host_mak
>  fi
>
> diff --git a/meson.build b/meson.build
> index c6f4b0cf5e8a..749259e7f29c 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -446,11 +446,15 @@ if 'CONFIG_LIBJACK' in config_host
>  endif
>  spice =3D not_found
>  spice_headers =3D not_found
> +spice_protocol =3D not_found
>  if 'CONFIG_SPICE' in config_host
>    spice =3D declare_dependency(compile_args:
> config_host['SPICE_CFLAGS'].split(),
>                               link_args: config_host['SPICE_LIBS'].split(=
))
>    spice_headers =3D declare_dependency(compile_args:
> config_host['SPICE_CFLAGS'].split())
>  endif
> +if 'CONFIG_SPICE_PROTOCOL' in config_host
> +  spice_protocol =3D declare_dependency(compile_args:
> config_host['SPICE_PROTOCOL_CFLAGS'].split())
> +endif
>  rt =3D cc.find_library('rt', required: false)
>  libdl =3D not_found
>  if 'CONFIG_PLUGIN' in config_host
> --
> 2.30.2
>
>
We should be able to move more configure logic to meson.build, but for now:

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--00000000000063e51705c0f01018
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 23, 2021 at 12:34 PM Gerd=
 Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">When im=
plementing spice vdagent protocol in qemu we only need the<br>
spice-protocol package for that, spice-server is not needed.=C2=A0 So<br>
go split those two build dependencies.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br>
---<br>
=C2=A0configure=C2=A0 =C2=A0| 36 ++++++++++++++++++++++++++++++++----<br>
=C2=A0meson.build |=C2=A0 4 ++++<br>
=C2=A02 files changed, 36 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 4f374b48890e..e6f959da2347 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -388,6 +388,7 @@ qom_cast_debug=3D&quot;yes&quot;<br>
=C2=A0trace_backends=3D&quot;log&quot;<br>
=C2=A0trace_file=3D&quot;trace&quot;<br>
=C2=A0spice=3D&quot;$default_feature&quot;<br>
+spice_protocol=3D&quot;auto&quot;<br>
=C2=A0rbd=3D&quot;auto&quot;<br>
=C2=A0smartcard=3D&quot;$default_feature&quot;<br>
=C2=A0u2f=3D&quot;auto&quot;<br>
@@ -1129,7 +1130,15 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-spice) spice=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-spice) spice=3D&quot;yes&quot;<br>
+=C2=A0 --enable-spice)<br>
+=C2=A0 =C2=A0 =C2=A0 spice_protocol=3D&quot;yes&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 spice=3D&quot;yes&quot;<br>
+=C2=A0 ;;<br>
+=C2=A0 --disable-spice-protocol)<br>
+=C2=A0 =C2=A0 =C2=A0 spice_protocol=3D&quot;no&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 spice=3D&quot;no&quot;<br>
+=C2=A0 ;;<br>
+=C2=A0 --enable-spice-protocol) spice_protocol=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-libiscsi) libiscsi=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
@@ -1866,6 +1875,7 @@ disabled with --disable-FEATURE, default is enabled i=
f available<br>
=C2=A0 =C2=A0vhost-user-blk-server=C2=A0 =C2=A0 vhost-user-blk server suppo=
rt<br>
=C2=A0 =C2=A0vhost-vdpa=C2=A0 =C2=A0 =C2=A0 vhost-vdpa kernel backend suppo=
rt<br>
=C2=A0 =C2=A0spice=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spice<br>
+=C2=A0 spice-protocol=C2=A0 spice-protocol<br>
=C2=A0 =C2=A0rbd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rados block=
 device (rbd)<br>
=C2=A0 =C2=A0libiscsi=C2=A0 =C2=A0 =C2=A0 =C2=A0 iscsi support<br>
=C2=A0 =C2=A0libnfs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nfs support<br>
@@ -4149,6 +4159,19 @@ fi<br>
<br>
=C2=A0##########################################<br>
=C2=A0# spice probe<br>
+if test &quot;$spice_protocol&quot; !=3D &quot;no&quot; ; then<br>
+=C2=A0 spice_protocol_cflags=3D$($pkg_config --cflags spice-protocol 2&gt;=
/dev/null)<br>
+=C2=A0 if $pkg_config --atleast-version=3D0.12.3 spice-protocol; then<br>
+=C2=A0 =C2=A0 spice_protocol=3D&quot;yes&quot;<br>
+=C2=A0 else<br>
+=C2=A0 =C2=A0 if test &quot;$spice_protocol&quot; =3D &quot;yes&quot; ; th=
en<br>
+=C2=A0 =C2=A0 =C2=A0 feature_not_found &quot;spice_protocol&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Install spice-protocol(&gt;=3D0.1=
2.3) devel&quot;<br>
+=C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 spice_protocol=3D&quot;no&quot;<br>
+=C2=A0 fi<br>
+fi<br>
+<br>
=C2=A0if test &quot;$spice&quot; !=3D &quot;no&quot; ; then<br>
=C2=A0 =C2=A0cat &gt; $TMPC &lt;&lt; EOF<br>
=C2=A0#include &lt;spice.h&gt;<br>
@@ -4157,13 +4180,13 @@ EOF<br>
=C2=A0 =C2=A0spice_cflags=3D$($pkg_config --cflags spice-protocol spice-ser=
ver 2&gt;/dev/null)<br>
=C2=A0 =C2=A0spice_libs=3D$($pkg_config --libs spice-protocol spice-server =
2&gt;/dev/null)<br>
=C2=A0 =C2=A0if $pkg_config --atleast-version=3D0.12.5 spice-server &amp;&a=
mp; \<br>
-=C2=A0 =C2=A0 =C2=A0$pkg_config --atleast-version=3D0.12.3 spice-protocol =
&amp;&amp; \<br>
+=C2=A0 =C2=A0 =C2=A0test &quot;$spice_protocol&quot; =3D &quot;yes&quot; &=
amp;&amp; \<br>
=C2=A0 =C2=A0 =C2=A0 compile_prog &quot;$spice_cflags&quot; &quot;$spice_li=
bs&quot; ; then<br>
=C2=A0 =C2=A0 =C2=A0spice=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0else<br>
=C2=A0 =C2=A0 =C2=A0if test &quot;$spice&quot; =3D &quot;yes&quot; ; then<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0feature_not_found &quot;spice&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Install spice-server(&gt;=3D0.12.=
5) and spice-protocol(&gt;=3D0.12.3) devel&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Install spice-server(&gt;=3D0.12.=
5) devel&quot;<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0spice=3D&quot;no&quot;<br>
=C2=A0 =C2=A0fi<br>
@@ -5807,9 +5830,14 @@ fi<br>
=C2=A0if test &quot;$posix_memalign&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_POSIX_MEMALIGN=3Dy&quot; &gt;&gt; $config_ho=
st_mak<br>
=C2=A0fi<br>
+<br>
+if test &quot;$spice_protocol&quot; =3D &quot;yes&quot; ; then<br>
+=C2=A0 echo &quot;CONFIG_SPICE_PROTOCOL=3Dy&quot; &gt;&gt; $config_host_ma=
k<br>
+=C2=A0 echo &quot;SPICE_PROTOCOL_CFLAGS=3D$spice_protocol_cflags&quot; &gt=
;&gt; $config_host_mak<br>
+fi<br>
=C2=A0if test &quot;$spice&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_SPICE=3Dy&quot; &gt;&gt; $config_host_mak<br=
>
-=C2=A0 echo &quot;SPICE_CFLAGS=3D$spice_cflags&quot; &gt;&gt; $config_host=
_mak<br>
+=C2=A0 echo &quot;SPICE_CFLAGS=3D$spice_cflags $spice_protocol_cflags&quot=
; &gt;&gt; $config_host_mak<br>
=C2=A0 =C2=A0echo &quot;SPICE_LIBS=3D$spice_libs&quot; &gt;&gt; $config_hos=
t_mak<br>
=C2=A0fi<br>
<br>
diff --git a/meson.build b/meson.build<br>
index c6f4b0cf5e8a..749259e7f29c 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -446,11 +446,15 @@ if &#39;CONFIG_LIBJACK&#39; in config_host<br>
=C2=A0endif<br>
=C2=A0spice =3D not_found<br>
=C2=A0spice_headers =3D not_found<br>
+spice_protocol =3D not_found<br>
=C2=A0if &#39;CONFIG_SPICE&#39; in config_host<br>
=C2=A0 =C2=A0spice =3D declare_dependency(compile_args: config_host[&#39;SP=
ICE_CFLAGS&#39;].split(),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 link_args: config_host[&#39;SPICE_LIBS&#39;=
].split())<br>
=C2=A0 =C2=A0spice_headers =3D declare_dependency(compile_args: config_host=
[&#39;SPICE_CFLAGS&#39;].split())<br>
=C2=A0endif<br>
+if &#39;CONFIG_SPICE_PROTOCOL&#39; in config_host<br>
+=C2=A0 spice_protocol =3D declare_dependency(compile_args: config_host[&#3=
9;SPICE_PROTOCOL_CFLAGS&#39;].split())<br>
+endif<br>
=C2=A0rt =3D cc.find_library(&#39;rt&#39;, required: false)<br>
=C2=A0libdl =3D not_found<br>
=C2=A0if &#39;CONFIG_PLUGIN&#39; in config_host<br>
-- <br>
2.30.2<br>
<br></blockquote><div><br></div><div>We should be able to move more configu=
re logic to meson.build, but for now:</div><div><br></div><div>Reviewed-by:=
 Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">=
marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div></div></div>

--00000000000063e51705c0f01018--


