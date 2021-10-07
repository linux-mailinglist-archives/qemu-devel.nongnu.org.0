Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B55F0425E28
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:50:51 +0200 (CEST)
Received: from localhost ([::1]:47460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYaLq-0001A5-0n
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaDK-0005Mp-Da
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:42:02 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaDI-00060z-9H
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:42:02 -0400
Received: by mail-wr1-x435.google.com with SMTP id v17so22853567wrv.9
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 13:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3dMhmHHVf8ciOiXK8t5V+9/8kRBw/WsMdtLT3Yc85Ds=;
 b=Ahfrwgh61Imeg4FN+04nhyTs6r7Dd0815q6VxySEQzGt3r/fh01DP/kFZHmwwon3jN
 lDweluYF8TTlozHBPzeJzCAQXF4ev9JMjrLimKRtCvKryxKCdoEwElu3vHmxP/zak0ux
 CucxvFJ01IF8SmBnc65HF0TkPmz9bwNZbUbxVAUQup0LusLkEv5xXo1DO+0HTOji6/Y2
 1lEW3hixJWhYEUtzCTtiU1RE2v0z3EqS6y6JkIzyHgpN5lFk2u9xz/ULfip2qgNXjLpX
 sUWER5YS82p1bfCpgYdzq6oJrMCDCPQqNXnIz2TbAEV8d6IEj5EPbjd2MZmhY7UX+3Ff
 ehWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3dMhmHHVf8ciOiXK8t5V+9/8kRBw/WsMdtLT3Yc85Ds=;
 b=isnCJqiiVj1Oh274ASCyqPR/lxz1a+GwZ6YXDxydnIrXS2/93zd+lyv1ZqrU5e2o/N
 nOG1Kc68Y6wxfa68SQ+Mju1BJWjZOFe8w7vas67JXdBGC6EvXhxI2ZokLEe2I/boL8w6
 DSp8c3xqsPTXNjsDDpATf1f0rddu/Nw2b6XRUmOdT6n0TdAuFRNJdrBgzNF0cOgv+CW0
 8qv+V3170q/F6K1L5wwyl7D9UGXMr2R9h5bvYipJqN7lFX4LIuk+M4P/Yv6Oad1XmNom
 wfgi2zpGqiyAakYwiafPRZ22L3MNvIWFxQZmR4VWmwelYtoSuMPaQMbsfoEMqEYtXn02
 BWgQ==
X-Gm-Message-State: AOAM532eS21DHqNRvtK6q+5jvvf4Ywnm7A/aXx+w9hyxHFocZ2hR9Bw6
 u2QhBJMIWCDoi6pk0Hjap5A4Oh3dZHtKKI5Po/+e1PS5
X-Google-Smtp-Source: ABdhPJzu8R4rzhb9eSJ9wIZeEmRwO5K7P8r0YTbxMhLMmWIpZ4Q4YBa3Sm6H+rRpCxPtmu2FJs1yC4UjQMS/pFi6Vlo=
X-Received: by 2002:adf:a78a:: with SMTP id j10mr8253379wrc.231.1633639318783; 
 Thu, 07 Oct 2021 13:41:58 -0700 (PDT)
MIME-Version: 1.0
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130829.632254-8-pbonzini@redhat.com>
In-Reply-To: <20211007130829.632254-8-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 8 Oct 2021 00:41:44 +0400
Message-ID: <CAJ+F1CJakCBvzGFdToGFU+LYx2uCJzy5kR4zoOGnE0HWrOPUWw@mail.gmail.com>
Subject: Re: [PATCH 13/24] configure, meson: move remaining HAVE_* compiler
 tests to Meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000498b9905cdc94b53"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x435.google.com
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

--000000000000498b9905cdc94b53
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 7, 2021 at 5:23 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Remove some special cases by moving them to Meson.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  configure   | 37 -------------------------------------
>  meson.build | 22 ++++++++++++++++++++--
>  2 files changed, 20 insertions(+), 39 deletions(-)
>
> diff --git a/configure b/configure
> index 499c84859d..52f89b05d6 100755
> --- a/configure
> +++ b/configure
> @@ -2401,18 +2401,6 @@ else
>    l2tpv3=3Dno
>  fi
>
> -cat > $TMPC <<EOF
> -#include <sys/mman.h>
> -int main(int argc, char *argv[]) {
> -    return mlockall(MCL_FUTURE);
> -}
> -EOF
> -if compile_prog "" "" ; then
> -  have_mlockall=3Dyes
> -else
> -  have_mlockall=3Dno
> -fi
> -
>  #########################################
>  # vhost interdependencies and host support
>
> @@ -3840,21 +3828,6 @@ if test "$fortify_source" !=3D "no"; then
>    fi
>  fi
>
> -##########################################
> -# check if struct fsxattr is available via linux/fs.h
> -
> -have_fsxattr=3Dno
> -cat > $TMPC << EOF
> -#include <linux/fs.h>
> -struct fsxattr foo;
> -int main(void) {
> -  return 0;
> -}
> -EOF
> -if compile_prog "" "" ; then
> -    have_fsxattr=3Dyes
> -fi
> -
>  ##########################################
>  # check for usable membarrier system call
>  if test "$membarrier" =3D "yes"; then
> @@ -4356,13 +4329,6 @@ if test "$gdbus_codegen" !=3D "" ; then
>  fi
>  echo "CONFIG_TLS_PRIORITY=3D\"$tls_priority\"" >> $config_host_mak
>
> -# Work around a system header bug with some kernel/XFS header
> -# versions where they both try to define 'struct fsxattr':
> -# xfs headers will not try to redefine structs from linux headers
> -# if this macro is set.
> -if test "$have_fsxattr" =3D "yes" ; then
> -    echo "HAVE_FSXATTR=3Dy" >> $config_host_mak
> -fi
>  if test "$xen" =3D "enabled" ; then
>    echo "CONFIG_XEN_BACKEND=3Dy" >> $config_host_mak
>    echo "CONFIG_XEN_CTRL_INTERFACE_VERSION=3D$xen_ctrl_version" >>
> $config_host_mak
> @@ -4567,9 +4533,6 @@ fi
>  if test "$parallels" =3D "yes" ; then
>    echo "CONFIG_PARALLELS=3Dy" >> $config_host_mak
>  fi
> -if test "$have_mlockall" =3D "yes" ; then
> -  echo "HAVE_MLOCKALL=3Dy" >> $config_host_mak
> -fi
>
>  if test "$plugins" =3D "yes" ; then
>      echo "CONFIG_PLUGIN=3Dy" >> $config_host_mak
> diff --git a/meson.build b/meson.build
> index 2962c24eb5..935a20c198 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1604,6 +1604,23 @@ config_host_data.set('CONFIG_SPLICE',
> cc.links(gnu_source_prefix + '''
>      return 0;
>    }'''))
>
> +config_host_data.set('HAVE_MLOCKALL', cc.links(gnu_source_prefix + '''
> +  #include <sys/mman.h>
> +  int main(int argc, char *argv[]) {
> +    return mlockall(MCL_FUTURE);
> +  }'''))
> +
> +# Work around a system header bug with some kernel/XFS header
> +# versions where they both try to define 'struct fsxattr':
> +# xfs headers will not try to redefine structs from linux headers
> +# if this macro is set.
> +config_host_data.set('HAVE_FSXATTR', cc.links('''
> +  #include <linux/fs.h>'
> +  struct fsxattr foo;
> +  int main(void) {
> +    return 0;
> +  }'''))
> +
>  # Some versions of Mac OS X incorrectly define SIZE_MAX
>  config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
>      #include <stdint.h>
> @@ -1612,7 +1629,8 @@ config_host_data.set('HAVE_BROKEN_SIZE_MAX', not
> cc.compiles('''
>          return printf("%zu", SIZE_MAX);
>      }''', args: ['-Werror']))
>
> -ignored =3D ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
> +ignored =3D ['CONFIG_QEMU_INTERP_PREFIX', # actually per-target
> +    'HAVE_GDB_BIN']
>  arrays =3D ['CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
>  strings =3D ['CONFIG_IASL']
>  foreach k, v: config_host
> @@ -1627,7 +1645,7 @@ foreach k, v: config_host
>      config_host_data.set('HOST_' + v.to_upper(), 1)
>    elif strings.contains(k)
>      config_host_data.set_quoted(k, v)
> -  elif k.startswith('CONFIG_') or k.startswith('HAVE_')
> +  elif k.startswith('CONFIG_')
>      config_host_data.set(k, v =3D=3D 'y' ? 1 : v)
>    endif
>  endforeach
> --
> 2.31.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000498b9905cdc94b53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 7, 2021 at 5:23 PM Paolo =
Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank">pbonzi=
ni@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Remove some special cases by moving them to Meson.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandr=
e.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<=
/div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0| 37 -------------------------------------<br>
=C2=A0meson.build | 22 ++++++++++++++++++++--<br>
=C2=A02 files changed, 20 insertions(+), 39 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 499c84859d..52f89b05d6 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -2401,18 +2401,6 @@ else<br>
=C2=A0 =C2=A0l2tpv3=3Dno<br>
=C2=A0fi<br>
<br>
-cat &gt; $TMPC &lt;&lt;EOF<br>
-#include &lt;sys/mman.h&gt;<br>
-int main(int argc, char *argv[]) {<br>
-=C2=A0 =C2=A0 return mlockall(MCL_FUTURE);<br>
-}<br>
-EOF<br>
-if compile_prog &quot;&quot; &quot;&quot; ; then<br>
-=C2=A0 have_mlockall=3Dyes<br>
-else<br>
-=C2=A0 have_mlockall=3Dno<br>
-fi<br>
-<br>
=C2=A0#########################################<br>
=C2=A0# vhost interdependencies and host support<br>
<br>
@@ -3840,21 +3828,6 @@ if test &quot;$fortify_source&quot; !=3D &quot;no&qu=
ot;; then<br>
=C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-##########################################<br>
-# check if struct fsxattr is available via linux/fs.h<br>
-<br>
-have_fsxattr=3Dno<br>
-cat &gt; $TMPC &lt;&lt; EOF<br>
-#include &lt;linux/fs.h&gt;<br>
-struct fsxattr foo;<br>
-int main(void) {<br>
-=C2=A0 return 0;<br>
-}<br>
-EOF<br>
-if compile_prog &quot;&quot; &quot;&quot; ; then<br>
-=C2=A0 =C2=A0 have_fsxattr=3Dyes<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# check for usable membarrier system call<br>
=C2=A0if test &quot;$membarrier&quot; =3D &quot;yes&quot;; then<br>
@@ -4356,13 +4329,6 @@ if test &quot;$gdbus_codegen&quot; !=3D &quot;&quot;=
 ; then<br>
=C2=A0fi<br>
=C2=A0echo &quot;CONFIG_TLS_PRIORITY=3D\&quot;$tls_priority\&quot;&quot; &g=
t;&gt; $config_host_mak<br>
<br>
-# Work around a system header bug with some kernel/XFS header<br>
-# versions where they both try to define &#39;struct fsxattr&#39;:<br>
-# xfs headers will not try to redefine structs from linux headers<br>
-# if this macro is set.<br>
-if test &quot;$have_fsxattr&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 echo &quot;HAVE_FSXATTR=3Dy&quot; &gt;&gt; $config_host_mak<=
br>
-fi<br>
=C2=A0if test &quot;$xen&quot; =3D &quot;enabled&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_XEN_BACKEND=3Dy&quot; &gt;&gt; $config_host_=
mak<br>
=C2=A0 =C2=A0echo &quot;CONFIG_XEN_CTRL_INTERFACE_VERSION=3D$xen_ctrl_versi=
on&quot; &gt;&gt; $config_host_mak<br>
@@ -4567,9 +4533,6 @@ fi<br>
=C2=A0if test &quot;$parallels&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_PARALLELS=3Dy&quot; &gt;&gt; $config_host_ma=
k<br>
=C2=A0fi<br>
-if test &quot;$have_mlockall&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;HAVE_MLOCKALL=3Dy&quot; &gt;&gt; $config_host_mak<br>
-fi<br>
<br>
=C2=A0if test &quot;$plugins&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;CONFIG_PLUGIN=3Dy&quot; &gt;&gt; $config_hos=
t_mak<br>
diff --git a/meson.build b/meson.build<br>
index 2962c24eb5..935a20c198 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1604,6 +1604,23 @@ config_host_data.set(&#39;CONFIG_SPLICE&#39;, cc.lin=
ks(gnu_source_prefix + &#39;&#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0 =C2=A0}&#39;&#39;&#39;))<br>
<br>
+config_host_data.set(&#39;HAVE_MLOCKALL&#39;, cc.links(gnu_source_prefix +=
 &#39;&#39;&#39;<br>
+=C2=A0 #include &lt;sys/mman.h&gt;<br>
+=C2=A0 int main(int argc, char *argv[]) {<br>
+=C2=A0 =C2=A0 return mlockall(MCL_FUTURE);<br>
+=C2=A0 }&#39;&#39;&#39;))<br>
+<br>
+# Work around a system header bug with some kernel/XFS header<br>
+# versions where they both try to define &#39;struct fsxattr&#39;:<br>
+# xfs headers will not try to redefine structs from linux headers<br>
+# if this macro is set.<br>
+config_host_data.set(&#39;HAVE_FSXATTR&#39;, cc.links(&#39;&#39;&#39;<br>
+=C2=A0 #include &lt;linux/fs.h&gt;&#39;<br>
+=C2=A0 struct fsxattr foo;<br>
+=C2=A0 int main(void) {<br>
+=C2=A0 =C2=A0 return 0;<br>
+=C2=A0 }&#39;&#39;&#39;))<br>
+<br>
=C2=A0# Some versions of Mac OS X incorrectly define SIZE_MAX<br>
=C2=A0config_host_data.set(&#39;HAVE_BROKEN_SIZE_MAX&#39;, not cc.compiles(=
&#39;&#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0#include &lt;stdint.h&gt;<br>
@@ -1612,7 +1629,8 @@ config_host_data.set(&#39;HAVE_BROKEN_SIZE_MAX&#39;, =
not cc.compiles(&#39;&#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return printf(&quot;%zu&quot;, SIZE_MAX);=
<br>
=C2=A0 =C2=A0 =C2=A0}&#39;&#39;&#39;, args: [&#39;-Werror&#39;]))<br>
<br>
-ignored =3D [&#39;CONFIG_QEMU_INTERP_PREFIX&#39;] # actually per-target<br=
>
+ignored =3D [&#39;CONFIG_QEMU_INTERP_PREFIX&#39;, # actually per-target<br=
>
+=C2=A0 =C2=A0 &#39;HAVE_GDB_BIN&#39;]<br>
=C2=A0arrays =3D [&#39;CONFIG_BDRV_RW_WHITELIST&#39;, &#39;CONFIG_BDRV_RO_W=
HITELIST&#39;]<br>
=C2=A0strings =3D [&#39;CONFIG_IASL&#39;]<br>
=C2=A0foreach k, v: config_host<br>
@@ -1627,7 +1645,7 @@ foreach k, v: config_host<br>
=C2=A0 =C2=A0 =C2=A0config_host_data.set(&#39;HOST_&#39; + v.to_upper(), 1)=
<br>
=C2=A0 =C2=A0elif strings.contains(k)<br>
=C2=A0 =C2=A0 =C2=A0config_host_data.set_quoted(k, v)<br>
-=C2=A0 elif k.startswith(&#39;CONFIG_&#39;) or k.startswith(&#39;HAVE_&#39=
;)<br>
+=C2=A0 elif k.startswith(&#39;CONFIG_&#39;)<br>
=C2=A0 =C2=A0 =C2=A0config_host_data.set(k, v =3D=3D &#39;y&#39; ? 1 : v)<b=
r>
=C2=A0 =C2=A0endif<br>
=C2=A0endforeach<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000498b9905cdc94b53--

