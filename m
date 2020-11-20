Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 230DB2BA3C8
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 08:46:26 +0100 (CET)
Received: from localhost ([::1]:51386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg17g-0002WI-Mf
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 02:46:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kg14g-0001nY-S5
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 02:43:18 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:44633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kg14d-0000kG-6C
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 02:43:18 -0500
Received: by mail-ed1-x52c.google.com with SMTP id l5so8494575edq.11
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 23:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ip6Lp4XPS9PguukzzffUepyGoQK/hknXTFoyLdEH3qY=;
 b=b6xH5UAyMhx2n/APD+5Jq6bcKBmuXEzR4TtAl7rDegZ7Wl3RZqsqcLg+gXt1F8XnnI
 xd/ok7dwlGKYJS1twC5cO3by7n2McZazVaT3PEKM9trg3NqLlQeYrtHWpqVzZ24cob0j
 74f6kH+DYAR0JpdMoCbr7vX4hqTw2MYhE1UsutuGHoYJJLq4/f6g5mkksPdOVY/OE6iL
 v8g7AYTtDgQNsArvp0PMIactFHjLGWPXJq82Hx0rjdVtST+y7ZGDs6yA8VoZdIge1A6f
 HvZn9Srp4ZYJoWAvQWrEEk2cA6yEt5sQQOLpAbHikuTmcec7N/6BDG/ZINyfqi9qKJ1W
 y6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ip6Lp4XPS9PguukzzffUepyGoQK/hknXTFoyLdEH3qY=;
 b=p7k6Wq4N7bkuZjdhi1iKaWFqdJvMfGZvB1RpEPK9WeQsOjlYWz2TAWx46vyBIqe6aV
 u5YZr8IEhpoyiUZwQWtP19TKe1ETT18pYK1RWX+24W23CTlrsjslhkPhMW834ORTAUzX
 ez+RvACbnyo58jYtaiE7ZvV45IOFFV8TiLhzjE1GNXdWz9GrsOQ2Hi0ag/u6qmQGFRBy
 BlX19nf5UEJberx+/oWrYnyjo5i1DZN1PIrxLO491R8mXcrDtYawvsh1ke40VGxU/HRV
 /W9hvAf0Ybz8raT7ZkEMlKDGol+fQthnZQoMY8Xf/cQStf9Dk0VH77h9pOHiA5aObm+K
 /Wrw==
X-Gm-Message-State: AOAM5316arHNp8OsqofZBTCuLn63nh0dKPkRHRVcDQeF4Zb9pkc73dBj
 4WJUOkW1oTeH3f3ylV6WaKXmIZbs/zjVOPzLMOU=
X-Google-Smtp-Source: ABdhPJxdWLBg7PwqpxhInwl4R7xiJAUVigKxFNzqy20nXolmzgkoXB3yX3LoPZqTe52PgY58mozQSncaL54/tkSUQEE=
X-Received: by 2002:a05:6402:1155:: with SMTP id
 g21mr34109517edw.53.1605858189902; 
 Thu, 19 Nov 2020 23:43:09 -0800 (PST)
MIME-Version: 1.0
References: <20201120073830.99939-1-pbonzini@redhat.com>
In-Reply-To: <20201120073830.99939-1-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 20 Nov 2020 11:42:58 +0400
Message-ID: <CAJ+F1CJvHkWKpmndNC+-EVOsjAbipZ1J+27eQ8kAzGe129JgKA@mail.gmail.com>
Subject: Re: [PATCH] meson.build: convert --with-default-devices to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f808f105b484fe8f"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52c.google.com
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

--000000000000f808f105b484fe8f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 11:39 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Pass the boolean option directly instead of writing
> CONFIG_MINIKCONF_MODE to config-host.mak.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure         | 12 ++++--------
>  meson.build       |  5 +++--
>  meson_options.txt |  2 ++
>  3 files changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/configure b/configure
> index a3d13538c0..5e51279986 100755
> --- a/configure
> +++ b/configure
> @@ -432,7 +432,7 @@ sheepdog=3D"no"
>  libxml2=3D""
>  debug_mutex=3D"no"
>  libpmem=3D""
> -default_devices=3D"yes"
> +default_devices=3D"true"
>  plugins=3D"no"
>  fuzzing=3D"no"
>  rng_none=3D"no"
> @@ -929,9 +929,9 @@ for opt do
>    ;;
>    --with-trace-file=3D*) trace_file=3D"$optarg"
>    ;;
> -  --with-default-devices) default_devices=3D"yes"
> +  --with-default-devices) default_devices=3D"true"
>    ;;
> -  --without-default-devices) default_devices=3D"no"
> +  --without-default-devices) default_devices=3D"false"
>    ;;
>    --enable-gprof) gprof=3D"yes"
>    ;;
> @@ -5544,11 +5544,6 @@ echo "GIT_UPDATE=3D$git_update" >> $config_host_ma=
k
>
>  echo "ARCH=3D$ARCH" >> $config_host_mak
>
> -if test "$default_devices" =3D "yes" ; then
> -  echo "CONFIG_MINIKCONF_MODE=3D--defconfig" >> $config_host_mak
> -else
> -  echo "CONFIG_MINIKCONF_MODE=3D--allnoconfig" >> $config_host_mak
> -fi
>  if test "$debug_tcg" =3D "yes" ; then
>    echo "CONFIG_DEBUG_TCG=3Dy" >> $config_host_mak
>  fi
> @@ -6527,6 +6522,7 @@ NINJA=3D$ninja $meson setup \
>          -Dattr=3D$attr \
>          -Ddocs=3D$docs -Dsphinx_build=3D$sphinx_build -Dinstall_blobs=3D=
$blobs \
>          -Dvhost_user_blk_server=3D$vhost_user_blk_server \
> +        -Ddefault_devices=3D$default_devices \
>          $cross_arg \
>          "$PWD" "$source_path"
>
> diff --git a/meson.build b/meson.build
> index e968bb5ada..f273eb28ba 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1206,7 +1206,8 @@ foreach target : target_dirs
>        output: config_devices_mak,
>        depfile: config_devices_mak + '.d',
>        capture: true,
> -      command: [minikconf, config_host['CONFIG_MINIKCONF_MODE'],
> +      command: [minikconf,
> +                get_option('default_devices') ? '--defconfig' :
> '--allnoconfig',
>                  config_devices_mak, '@DEPFILE@', '@INPUT@',
>                  host_kconfig, accel_kconfig])
>
> @@ -2390,7 +2391,7 @@ summary_info +=3D {'capstone':          capstone_op=
t
> =3D=3D 'disabled' ? false : capst
>  summary_info +=3D {'libpmem support':
>  config_host.has_key('CONFIG_LIBPMEM')}
>  summary_info +=3D {'libdaxctl support':
> config_host.has_key('CONFIG_LIBDAXCTL')}
>  summary_info +=3D {'libudev':           libudev.found()}
> -summary_info +=3D {'default devices':
>  config_host['CONFIG_MINIKCONF_MODE'] =3D=3D '--defconfig'}
> +summary_info +=3D {'default devices':   get_option('default_devices')}
>  summary_info +=3D {'plugin support':
> config_host.has_key('CONFIG_PLUGIN')}
>  summary_info +=3D {'fuzzing support':   config_host.has_key('CONFIG_FUZZ=
')}
>  if config_host.has_key('HAVE_GDB_BIN')
> diff --git a/meson_options.txt b/meson_options.txt
> index 2f0ca97329..7d57b744ac 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -7,6 +7,8 @@ option('qemu_firmwarepath', type : 'string', value : '',
>  option('sphinx_build', type : 'string', value : '',
>         description: 'Use specified sphinx-build [$sphinx_build] for
> building document (default to be empty)')
>
> +option('default_devices', type : 'boolean', value : true,
> +       description: 'Include a default selection of devices in emulators=
')
>  option('docs', type : 'feature', value : 'auto',
>         description: 'Documentations build support')
>  option('gettext', type : 'boolean', value : true,
> --
> 2.28.0
>
>
>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f808f105b484fe8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 20, 2020 at 11:39 AM Paol=
o Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Pas=
s the boolean option directly instead of writing<br>
CONFIG_MINIKCONF_MODE to config-host.mak.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 ++++--------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 +++--<br>
=C2=A0meson_options.txt |=C2=A0 2 ++<br>
=C2=A03 files changed, 9 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index a3d13538c0..5e51279986 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -432,7 +432,7 @@ sheepdog=3D&quot;no&quot;<br>
=C2=A0libxml2=3D&quot;&quot;<br>
=C2=A0debug_mutex=3D&quot;no&quot;<br>
=C2=A0libpmem=3D&quot;&quot;<br>
-default_devices=3D&quot;yes&quot;<br>
+default_devices=3D&quot;true&quot;<br>
=C2=A0plugins=3D&quot;no&quot;<br>
=C2=A0fuzzing=3D&quot;no&quot;<br>
=C2=A0rng_none=3D&quot;no&quot;<br>
@@ -929,9 +929,9 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--with-trace-file=3D*) trace_file=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --with-default-devices) default_devices=3D&quot;yes&quot;<br>
+=C2=A0 --with-default-devices) default_devices=3D&quot;true&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --without-default-devices) default_devices=3D&quot;no&quot;<br>
+=C2=A0 --without-default-devices) default_devices=3D&quot;false&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-gprof) gprof=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
@@ -5544,11 +5544,6 @@ echo &quot;GIT_UPDATE=3D$git_update&quot; &gt;&gt; $=
config_host_mak<br>
<br>
=C2=A0echo &quot;ARCH=3D$ARCH&quot; &gt;&gt; $config_host_mak<br>
<br>
-if test &quot;$default_devices&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_MINIKCONF_MODE=3D--defconfig&quot; &gt;&gt; $conf=
ig_host_mak<br>
-else<br>
-=C2=A0 echo &quot;CONFIG_MINIKCONF_MODE=3D--allnoconfig&quot; &gt;&gt; $co=
nfig_host_mak<br>
-fi<br>
=C2=A0if test &quot;$debug_tcg&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_DEBUG_TCG=3Dy&quot; &gt;&gt; $config_host_ma=
k<br>
=C2=A0fi<br>
@@ -6527,6 +6522,7 @@ NINJA=3D$ninja $meson setup \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dattr=3D$attr \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddocs=3D$docs -Dsphinx_build=3D$sphinx_b=
uild -Dinstall_blobs=3D$blobs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvhost_user_blk_server=3D$vhost_user_blk=
_server \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Ddefault_devices=3D$default_devices \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$cross_arg \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$PWD&quot; &quot;$source_path&quot;=
<br>
<br>
diff --git a/meson.build b/meson.build<br>
index e968bb5ada..f273eb28ba 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1206,7 +1206,8 @@ foreach target : target_dirs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0output: config_devices_mak,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0depfile: config_devices_mak + &#39;.d&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0capture: true,<br>
-=C2=A0 =C2=A0 =C2=A0 command: [minikconf, config_host[&#39;CONFIG_MINIKCON=
F_MODE&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 command: [minikconf,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_option(&#39;de=
fault_devices&#39;) ? &#39;--defconfig&#39; : &#39;--allnoconfig&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config_device=
s_mak, &#39;@DEPFILE@&#39;, &#39;@INPUT@&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host_kconfig,=
 accel_kconfig])<br>
<br>
@@ -2390,7 +2391,7 @@ summary_info +=3D {&#39;capstone&#39;:=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 capstone_opt =3D=3D &#39;disabled&#39; ? false : capst=
<br>
=C2=A0summary_info +=3D {&#39;libpmem support&#39;:=C2=A0 =C2=A0config_host=
.has_key(&#39;CONFIG_LIBPMEM&#39;)}<br>
=C2=A0summary_info +=3D {&#39;libdaxctl support&#39;: config_host.has_key(&=
#39;CONFIG_LIBDAXCTL&#39;)}<br>
=C2=A0summary_info +=3D {&#39;libudev&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0libudev.found()}<br>
-summary_info +=3D {&#39;default devices&#39;:=C2=A0 =C2=A0config_host[&#39=
;CONFIG_MINIKCONF_MODE&#39;] =3D=3D &#39;--defconfig&#39;}<br>
+summary_info +=3D {&#39;default devices&#39;:=C2=A0 =C2=A0get_option(&#39;=
default_devices&#39;)}<br>
=C2=A0summary_info +=3D {&#39;plugin support&#39;:=C2=A0 =C2=A0 config_host=
.has_key(&#39;CONFIG_PLUGIN&#39;)}<br>
=C2=A0summary_info +=3D {&#39;fuzzing support&#39;:=C2=A0 =C2=A0config_host=
.has_key(&#39;CONFIG_FUZZ&#39;)}<br>
=C2=A0if config_host.has_key(&#39;HAVE_GDB_BIN&#39;)<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index 2f0ca97329..7d57b744ac 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -7,6 +7,8 @@ option(&#39;qemu_firmwarepath&#39;, type : &#39;string&#39;=
, value : &#39;&#39;,<br>
=C2=A0option(&#39;sphinx_build&#39;, type : &#39;string&#39;, value : &#39;=
&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Use specified sphinx-build [$=
sphinx_build] for building document (default to be empty)&#39;)<br>
<br>
+option(&#39;default_devices&#39;, type : &#39;boolean&#39;, value : true,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;Include a default selection o=
f devices in emulators&#39;)<br>
=C2=A0option(&#39;docs&#39;, type : &#39;feature&#39;, value : &#39;auto&#3=
9;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Documentations build support&=
#39;)<br>
=C2=A0option(&#39;gettext&#39;, type : &#39;boolean&#39;, value : true,<br>
-- <br>
2.28.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div>Reviewed-by: Marc-Andr=C3=A9 Lure=
au &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redh=
at.com</a>&gt; <br></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gm=
ail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000f808f105b484fe8f--

