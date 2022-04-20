Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF22508F08
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:08:03 +0200 (CEST)
Received: from localhost ([::1]:53878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhEkD-0005pZ-Sc
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhEhw-0004RI-5l
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:05:40 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:38606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhEht-000108-PX
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:05:39 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id y19so1914396qvk.5
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uGLALYAiMj0fdxnsG7Z7JurgZDIeR01iSUplW1JB3WA=;
 b=ZrJxnd7OwDic9DYEuHYAly+RRFedhHyJySmPUKDqRX3I9ZYDjxw3jC/YgeHBOYnk9M
 PFntRkUZ4uptxnY7B0SVeUet6olmQfRwA8zXGZr0LfTWmhcJ1RIOrHQxGuYXkqC2OANs
 2PpEXvDv2LILAcKMCJ/fmLDIbBG8s3/sWK3WljR1AwtBLKNT2p+wxUTROas9zh1RfUIk
 xnMo2AbSi4QumPtmgSlsVadigBNv4GxhP6KGxLn9deA7D5KOXLws/ZgQjoZysYTA9cl7
 AWDR0YkOjkpnevUGNCOsgVqQ3LAqMjtDcMLw2hrCHWUNaLlUhHb25u3i6elSBclv9uM1
 mDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uGLALYAiMj0fdxnsG7Z7JurgZDIeR01iSUplW1JB3WA=;
 b=NxBeeNAHWJCHiFfcjA4B1SdXqz1U4mAHa1tnfxT7lSv1BH0YVbLiDEzri6vwcw/RwM
 frtoTH1oSS6hRr1EkOZEx5b5kB2hdPnRwyINBHVzNc3NybL3ziNtTJvw3dymNPpcZcUK
 L8tjGzT0ZC/RqjZHbR2Me9u4iXBQYMLyc5al29Kyp3DpiNngb+QsInKTUwrgrs45xBWA
 p+6bEqoWux4+YNuQUuSnEVJClrXdK45qZNHZAzcUd2p1HjntLH21oqMeloNFdv0ky2/7
 bFjlo7LD42RdsJ/pe/lAWVkQ0FiD2FXB1Sxj1zOtV1nUS4CS7ISB/r87csQK8jICDCwo
 Q9Bg==
X-Gm-Message-State: AOAM5309DJsZHsvMAVVMyc0zXdBKsSnoO9CkzhYixxjFkU2AlOLsCem1
 siOmtPV34/dtmuiYHCcbZ9ezV7RcJQTBr1aNO14=
X-Google-Smtp-Source: ABdhPJyOnHkz3t9JcsIj+cL+QmibAzDUFEBrIu416Tk9TYTjqTbr0QCR0GzmYIzo25VHkAOumULE2eYjm19rix1yQSQ=
X-Received: by 2002:a05:6214:258e:b0:44b:76d7:b10c with SMTP id
 fq14-20020a056214258e00b0044b76d7b10cmr2218743qvb.8.1650477936716; Wed, 20
 Apr 2022 11:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-14-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-14-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Apr 2022 22:05:24 +0400
Message-ID: <CAJ+F1CKgWJhCDYjUma5x=o6ZXHtYcbjdbpceXgHDpddxf_2LSw@mail.gmail.com>
Subject: Re: [PATCH 13/34] meson,
 configure: move --enable-module-upgrades to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000020afee05dd19d7e7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qv1-xf2a.google.com
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

--00000000000020afee05dd19d7e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 7:54 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  configure                     | 14 --------------
>  meson.build                   |  7 ++++++-
>  meson_options.txt             |  2 ++
>  scripts/meson-buildoptions.sh |  4 ++++
>  4 files changed, 12 insertions(+), 15 deletions(-)
>
> diff --git a/configure b/configure
> index 75e8b1e7aa..d4d51eff06 100755
> --- a/configure
> +++ b/configure
> @@ -310,7 +310,6 @@ fortify_source=3D"$default_feature"
>  gcov=3D"no"
>  EXESUF=3D""
>  modules=3D"no"
> -module_upgrades=3D"no"
>  prefix=3D"/usr/local"
>  qemu_suffix=3D"qemu"
>  softmmu=3D"yes"
> @@ -762,10 +761,6 @@ for opt do
>    --disable-modules)
>        modules=3D"no"
>    ;;
> -  --disable-module-upgrades) module_upgrades=3D"no"
> -  ;;
> -  --enable-module-upgrades) module_upgrades=3D"yes"
> -  ;;
>    --cpu=3D*)
>    ;;
>    --target-list=3D*) target_list=3D"$optarg"
> @@ -1218,7 +1213,6 @@ cat << EOF
>    bsd-user        all BSD usermode emulation targets
>    pie             Position Independent Executables
>    modules         modules support (non-Windows)
> -  module-upgrades try to load modules from alternate paths for upgrades
>    debug-tcg       TCG debugging (default is disabled)
>    debug-info      debugging information
>    lto             Enable Link-Time Optimization.
> @@ -1487,11 +1481,6 @@ if test "$modules" =3D "yes" && test "$mingw32" =
=3D
> "yes" ; then
>    error_exit "Modules are not available for Windows"
>  fi
>
> -# module_upgrades is only reasonable if modules are enabled
> -if test "$modules" =3D "no" && test "$module_upgrades" =3D "yes" ; then
> -  error_exit "Can't enable module-upgrades as Modules are not enabled"
> -fi
> -
>  # Static linking is not possible with plugins, modules or PIE
>  if test "$static" =3D "yes" ; then
>    if test "$modules" =3D "yes" ; then
> @@ -2563,9 +2552,6 @@ if test "$modules" =3D "yes"; then
>    echo "CONFIG_STAMP=3D_$( (echo $qemu_version; echo $pkgversion; cat $0=
) |
> $shacmd - | cut -f1 -d\ )" >> $config_host_mak
>    echo "CONFIG_MODULES=3Dy" >> $config_host_mak
>  fi
> -if test "$module_upgrades" =3D "yes"; then
> -  echo "CONFIG_MODULE_UPGRADES=3Dy" >> $config_host_mak
> -fi
>  echo "CONFIG_TLS_PRIORITY=3D\"$tls_priority\"" >> $config_host_mak
>
>  if test "$xen" =3D "enabled" ; then
> diff --git a/meson.build b/meson.build
> index 84156df809..3c47d82180 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1548,6 +1548,11 @@ endif
>
>  config_host_data.set('HOST_' + host_arch.to_upper(), 1)
>
> +if get_option('module_upgrades') and not enable_modules
> +  error('Cannot enable module-upgrades as modules are not enabled')
> +endif
> +config_host_data.set('CONFIG_MODULE_UPGRADES',
> get_option('module_upgrades'))
> +
>  config_host_data.set('CONFIG_ATTR', libattr.found())
>  config_host_data.set('CONFIG_BDRV_WHITELIST_TOOLS',
> get_option('block_drv_whitelist_in_tools'))
>  config_host_data.set('CONFIG_BRLAPI', brlapi.found())
> @@ -3563,7 +3568,7 @@ summary_info +=3D {'block layer':       have_block}
>  summary_info +=3D {'Install blobs':     get_option('install_blobs')}
>  summary_info +=3D {'module support':
> config_host.has_key('CONFIG_MODULES')}
>  if config_host.has_key('CONFIG_MODULES')
> -  summary_info +=3D {'alternative module path':
> config_host.has_key('CONFIG_MODULE_UPGRADES')}
> +  summary_info +=3D {'alternative module path':
> get_option('module_upgrades')}
>  endif
>  summary_info +=3D {'fuzzing support':   get_option('fuzzing')}
>  if have_system
> diff --git a/meson_options.txt b/meson_options.txt
> index d140c0ef89..cf18663833 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -34,6 +34,8 @@ option('fuzzing', type : 'boolean', value: false,
>         description: 'build fuzzing targets')
>  option('gettext', type : 'feature', value : 'auto',
>         description: 'Localization of the GTK+ user interface')
> +option('module_upgrades', type : 'boolean', value : false,
> +       description: 'try to load modules from alternate paths for
> upgrades')
>  option('install_blobs', type : 'boolean', value : true,
>         description: 'install provided firmware blobs')
>  option('sparse', type : 'feature', value : 'auto',
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.s=
h
> index 92be3e6187..a269534394 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -19,6 +19,8 @@ meson_options_help() {
>    printf "%s\n" '  --disable-install-blobs  install provided firmware
> blobs'
>    printf "%s\n" '  --enable-malloc=3DCHOICE   choose memory allocator to
> use [system] (choices:'
>    printf "%s\n" '                           jemalloc/system/tcmalloc)'
> +  printf "%s\n" '  --enable-module-upgrades try to load modules from
> alternate paths for'
> +  printf "%s\n" '                           upgrades'
>    printf "%s\n" '  --enable-profiler        profiler support'
>    printf "%s\n" '  --enable-qom-cast-debug  cast debugging support'
>    printf "%s\n" '  --enable-rng-none        dummy RNG, avoid using
> /dev/(u)random and'
> @@ -268,6 +270,8 @@ _meson_option_parse() {
>      --disable-malloc-trim) printf "%s" -Dmalloc_trim=3Ddisabled ;;
>      --enable-membarrier) printf "%s" -Dmembarrier=3Denabled ;;
>      --disable-membarrier) printf "%s" -Dmembarrier=3Ddisabled ;;
> +    --enable-module-upgrades) printf "%s" -Dmodule_upgrades=3Dtrue ;;
> +    --disable-module-upgrades) printf "%s" -Dmodule_upgrades=3Dfalse ;;
>      --enable-mpath) printf "%s" -Dmpath=3Denabled ;;
>      --disable-mpath) printf "%s" -Dmpath=3Ddisabled ;;
>      --enable-multiprocess) printf "%s" -Dmultiprocess=3Denabled ;;
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000020afee05dd19d7e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022=
 at 7:54 PM Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzi=
ni@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@re=
dhat.com" target=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><di=
v><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:=
marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 14 --------------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 7 ++++++-<br>
=C2=A0meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 ++<br>
=C2=A0scripts/meson-buildoptions.sh |=C2=A0 4 ++++<br>
=C2=A04 files changed, 12 insertions(+), 15 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 75e8b1e7aa..d4d51eff06 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -310,7 +310,6 @@ fortify_source=3D&quot;$default_feature&quot;<br>
=C2=A0gcov=3D&quot;no&quot;<br>
=C2=A0EXESUF=3D&quot;&quot;<br>
=C2=A0modules=3D&quot;no&quot;<br>
-module_upgrades=3D&quot;no&quot;<br>
=C2=A0prefix=3D&quot;/usr/local&quot;<br>
=C2=A0qemu_suffix=3D&quot;qemu&quot;<br>
=C2=A0softmmu=3D&quot;yes&quot;<br>
@@ -762,10 +761,6 @@ for opt do<br>
=C2=A0 =C2=A0--disable-modules)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0modules=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-module-upgrades) module_upgrades=3D&quot;no&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-module-upgrades) module_upgrades=3D&quot;yes&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--cpu=3D*)<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--target-list=3D*) target_list=3D&quot;$optarg&quot;<br>
@@ -1218,7 +1213,6 @@ cat &lt;&lt; EOF<br>
=C2=A0 =C2=A0bsd-user=C2=A0 =C2=A0 =C2=A0 =C2=A0 all BSD usermode emulation=
 targets<br>
=C2=A0 =C2=A0pie=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Position In=
dependent Executables<br>
=C2=A0 =C2=A0modules=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0modules support (non-=
Windows)<br>
-=C2=A0 module-upgrades try to load modules from alternate paths for upgrad=
es<br>
=C2=A0 =C2=A0debug-tcg=C2=A0 =C2=A0 =C2=A0 =C2=A0TCG debugging (default is =
disabled)<br>
=C2=A0 =C2=A0debug-info=C2=A0 =C2=A0 =C2=A0 debugging information<br>
=C2=A0 =C2=A0lto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Enable Link=
-Time Optimization.<br>
@@ -1487,11 +1481,6 @@ if test &quot;$modules&quot; =3D &quot;yes&quot; &am=
p;&amp; test &quot;$mingw32&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0error_exit &quot;Modules are not available for Windows&quot;<b=
r>
=C2=A0fi<br>
<br>
-# module_upgrades is only reasonable if modules are enabled<br>
-if test &quot;$modules&quot; =3D &quot;no&quot; &amp;&amp; test &quot;$mod=
ule_upgrades&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 error_exit &quot;Can&#39;t enable module-upgrades as Modules are no=
t enabled&quot;<br>
-fi<br>
-<br>
=C2=A0# Static linking is not possible with plugins, modules or PIE<br>
=C2=A0if test &quot;$static&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0if test &quot;$modules&quot; =3D &quot;yes&quot; ; then<br>
@@ -2563,9 +2552,6 @@ if test &quot;$modules&quot; =3D &quot;yes&quot;; the=
n<br>
=C2=A0 =C2=A0echo &quot;CONFIG_STAMP=3D_$( (echo $qemu_version; echo $pkgve=
rsion; cat $0) | $shacmd - | cut -f1 -d\ )&quot; &gt;&gt; $config_host_mak<=
br>
=C2=A0 =C2=A0echo &quot;CONFIG_MODULES=3Dy&quot; &gt;&gt; $config_host_mak<=
br>
=C2=A0fi<br>
-if test &quot;$module_upgrades&quot; =3D &quot;yes&quot;; then<br>
-=C2=A0 echo &quot;CONFIG_MODULE_UPGRADES=3Dy&quot; &gt;&gt; $config_host_m=
ak<br>
-fi<br>
=C2=A0echo &quot;CONFIG_TLS_PRIORITY=3D\&quot;$tls_priority\&quot;&quot; &g=
t;&gt; $config_host_mak<br>
<br>
=C2=A0if test &quot;$xen&quot; =3D &quot;enabled&quot; ; then<br>
diff --git a/meson.build b/meson.build<br>
index 84156df809..3c47d82180 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1548,6 +1548,11 @@ endif<br>
<br>
=C2=A0config_host_data.set(&#39;HOST_&#39; + host_arch.to_upper(), 1)<br>
<br>
+if get_option(&#39;module_upgrades&#39;) and not enable_modules<br>
+=C2=A0 error(&#39;Cannot enable module-upgrades as modules are not enabled=
&#39;)<br>
+endif<br>
+config_host_data.set(&#39;CONFIG_MODULE_UPGRADES&#39;, get_option(&#39;mod=
ule_upgrades&#39;))<br>
+<br>
=C2=A0config_host_data.set(&#39;CONFIG_ATTR&#39;, libattr.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_BDRV_WHITELIST_TOOLS&#39;, get_optio=
n(&#39;block_drv_whitelist_in_tools&#39;))<br>
=C2=A0config_host_data.set(&#39;CONFIG_BRLAPI&#39;, brlapi.found())<br>
@@ -3563,7 +3568,7 @@ summary_info +=3D {&#39;block layer&#39;:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0have_block}<br>
=C2=A0summary_info +=3D {&#39;Install blobs&#39;:=C2=A0 =C2=A0 =C2=A0get_op=
tion(&#39;install_blobs&#39;)}<br>
=C2=A0summary_info +=3D {&#39;module support&#39;:=C2=A0 =C2=A0 config_host=
.has_key(&#39;CONFIG_MODULES&#39;)}<br>
=C2=A0if config_host.has_key(&#39;CONFIG_MODULES&#39;)<br>
-=C2=A0 summary_info +=3D {&#39;alternative module path&#39;: config_host.h=
as_key(&#39;CONFIG_MODULE_UPGRADES&#39;)}<br>
+=C2=A0 summary_info +=3D {&#39;alternative module path&#39;: get_option(&#=
39;module_upgrades&#39;)}<br>
=C2=A0endif<br>
=C2=A0summary_info +=3D {&#39;fuzzing support&#39;:=C2=A0 =C2=A0get_option(=
&#39;fuzzing&#39;)}<br>
=C2=A0if have_system<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index d140c0ef89..cf18663833 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -34,6 +34,8 @@ option(&#39;fuzzing&#39;, type : &#39;boolean&#39;, value=
: false,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;build fuzzing targets&#39;)<b=
r>
=C2=A0option(&#39;gettext&#39;, type : &#39;feature&#39;, value : &#39;auto=
&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Localization of the GTK+ user=
 interface&#39;)<br>
+option(&#39;module_upgrades&#39;, type : &#39;boolean&#39;, value : false,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;try to load modules from alte=
rnate paths for upgrades&#39;)<br>
=C2=A0option(&#39;install_blobs&#39;, type : &#39;boolean&#39;, value : tru=
e,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;install provided firmware blo=
bs&#39;)<br>
=C2=A0option(&#39;sparse&#39;, type : &#39;feature&#39;, value : &#39;auto&=
#39;,<br>
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh<=
br>
index 92be3e6187..a269534394 100644<br>
--- a/scripts/meson-buildoptions.sh<br>
+++ b/scripts/meson-buildoptions.sh<br>
@@ -19,6 +19,8 @@ meson_options_help() {<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --disable-install-blobs=C2=
=A0 install provided firmware blobs&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-malloc=3DCHOICE=
=C2=A0 =C2=A0choose memory allocator to use [system] (choices:&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jemalloc/=
system/tcmalloc)&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --enable-module-upgrades try to=
 load modules from alternate paths for&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0upgrades&#39;<br=
>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-profiler=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 profiler support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-qom-cast-debug=C2=
=A0 cast debugging support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-rng-none=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 dummy RNG, avoid using /dev/(u)random and&#39;<br>
@@ -268,6 +270,8 @@ _meson_option_parse() {<br>
=C2=A0 =C2=A0 =C2=A0--disable-malloc-trim) printf &quot;%s&quot; -Dmalloc_t=
rim=3Ddisabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-membarrier) printf &quot;%s&quot; -Dmembarrier=
=3Denabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-membarrier) printf &quot;%s&quot; -Dmembarrie=
r=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-module-upgrades) printf &quot;%s&quot; -Dmodule_upg=
rades=3Dtrue ;;<br>
+=C2=A0 =C2=A0 --disable-module-upgrades) printf &quot;%s&quot; -Dmodule_up=
grades=3Dfalse ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-mpath) printf &quot;%s&quot; -Dmpath=3Denabled=
 ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-mpath) printf &quot;%s&quot; -Dmpath=3Ddisabl=
ed ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-multiprocess) printf &quot;%s&quot; -Dmultipro=
cess=3Denabled ;;<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div></div>

--00000000000020afee05dd19d7e7--

