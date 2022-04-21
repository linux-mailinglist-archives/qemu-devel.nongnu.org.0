Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672CF509D29
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 12:09:32 +0200 (CEST)
Received: from localhost ([::1]:51006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhTkh-0001fX-E3
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 06:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhTfo-0007Uo-6X
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:04:28 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:44871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhTfm-0006NF-5n
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:04:27 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id e17so3298202qvj.11
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 03:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G7Pz3JMyUedhHIBDQgx0jWvHM9qL02gi0WnNctrE4JI=;
 b=Fk1gsXNn+JkUE7NFdWObecVCbwRaq0/nR5O6dOfJS6GC9x6lIlJkNK9WOQbDr/KOiA
 vJ6QhZXx2O0Me1kpfq+05db4IvxwWCirAiDx319l+x+R9kQUkJp77AAHO8ygJ/+F3NWw
 0CToaQ+7BV/IJSrXsDGEKfyLs88KpbthkryJ/sKNhXc9fKJePu90Mibn1bKVe/yz4Hv7
 ueVJi5VZHhS2nyqlaCr3i5rHsLoN9mFBFKr/vKtrl88x8uSVfDkz6gZ8RUrqxkaUFxZN
 fLamhhEE8pp2UqxyXPBAk1AUAGwcpupZFcwH1Z3D2P1+J5wd12OPL7cKd3wamrPSTSMz
 V7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G7Pz3JMyUedhHIBDQgx0jWvHM9qL02gi0WnNctrE4JI=;
 b=b2CPlAzxIFdqWb5ok/T423mogNOiA5spQyZmehGWqDFlB9DDAKZ++m8ZuxRjP5EI9A
 BUKiaAOqG46ca93YyQxo73KNxMtg9/HvBVLnKv9bMCR68mWAQMi02WJq8DbWzrmrPqCt
 LxK+Xl0F1zQtThiA2CqIjTdJ5E0NhfNzEwSQWlwpB0wrnpDmkUQEpmV2Eni+kla1I0m7
 +jo/AjC/hI59CBzJBC0T3kjzvlxmA4K5WPnFsf2zEfA4dUtsJEFPR0K0/u2K5aXUtjMC
 L/Y6RzMihvVo5f14rwOcM0vNrnRjH5plz+XsX0GjOVVwqP9xBZivCtWvo8ncW11Kxh9+
 eYhQ==
X-Gm-Message-State: AOAM532/gw6QwuZKdaocbJluhp9Tb2uj7cFlqwOHF9BZGyMEOeBKGSBq
 yJo1T//N/3BChjmSv5nP+XwiS6l6XdP2Hh4G5uA=
X-Google-Smtp-Source: ABdhPJwnX2HEM+alzCq/VSb0KxwvFq0XQEecwIcwjqAi+O6bW/W1RBIkoPnrw9U3Ae4HrYrVp0CNBkRJCucAZV+f2dY=
X-Received: by 2002:a05:6214:258e:b0:44b:76d7:b10c with SMTP id
 fq14-20020a056214258e00b0044b76d7b10cmr4316916qvb.8.1650535465078; Thu, 21
 Apr 2022 03:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-27-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-27-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 21 Apr 2022 14:04:13 +0400
Message-ID: <CAJ+F1CJbu9FTmM753OGsFgaUzyKQt+r7HwEr=54qbdg=ZorJCw@mail.gmail.com>
Subject: Re: [PATCH 26/34] configure: omit options with default values from
 meson command line
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000015d13505dd273c74"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qv1-xf2f.google.com
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

--00000000000015d13505dd273c74
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 8:13 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> This has no functional change, it only makes the command line shorter
> and nicer.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

 Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  configure         | 29 +++++++++++++++++------------
>  meson.build       |  2 +-
>  meson_options.txt |  2 +-
>  3 files changed, 19 insertions(+), 14 deletions(-)
>
> diff --git a/configure b/configure
> index 4997983b5d..61b5acae10 100755
> --- a/configure
> +++ b/configure
> @@ -2349,19 +2349,24 @@ if test "$skip_meson" =3D no; then
>    mv $cross config-meson.cross
>
>    rm -rf meson-private meson-info meson-logs
> +
> +  # Built-in options
> +  test "$bindir" !=3D "bin" && meson_option_add "-Dbindir=3D$bindir"
> +  test "$default_feature" =3D no && meson_option_add
> -Dauto_features=3Ddisabled
> +  test "$pie" =3D no && meson_option_add -Db_pie=3Dfalse
> +  test "$werror" =3D yes && meson_option_add -Dwerror=3Dtrue
> +
> +  # QEMU options
> +  test "$capstone" !=3D auto && meson_option_add "-Dcapstone=3D$capstone=
"
> +  test "$cfi" !=3D false && meson_option_add "-Dcfi=3D$cfi"
> +  test "$fdt" !=3D auto && meson_option_add "-Dfdt=3D$fdt"
> +  test -n "${LIB_FUZZING_ENGINE+xxx}" && meson_option_add
> "-Dfuzzing_engine=3D$LIB_FUZZING_ENGINE"
> +  test "$qemu_suffix" !=3D qemu && meson_option_add
> "-Dqemu_suffix=3D$qemu_suffix"
> +  test "$slirp" !=3D auto && meson_option_add "-Dslirp=3D$slirp"
> +  test "$smbd" !=3D '' && meson_option_add "-Dsmbd=3D$smbd"
> +  test "$tcg" !=3D enabled && meson_option_add "-Dtcg=3D$tcg"
>    run_meson() {
> -    NINJA=3D$ninja $meson setup \
> -        --prefix "$prefix" \
> -        --bindir "$bindir" \
> -        -Dqemu_suffix=3D"$qemu_suffix" \
> -        -Dsmbd=3D"$smbd" \
> -        -Dwerror=3D$(if test "$werror" =3D yes; then echo true; else ech=
o
> false; fi) \
> -        -Db_pie=3D$(if test "$pie" =3D yes; then echo true; else echo fa=
lse;
> fi) \
> -        -Dcfi=3D$cfi -Dtcg=3D$tcg \
> -        -Dcapstone=3D$capstone -Dfdt=3D$fdt -Dslirp=3D$slirp \
> -        $(test -n "${LIB_FUZZING_ENGINE+xxx}" && echo
> "-Dfuzzing_engine=3D$LIB_FUZZING_ENGINE") \
> -        $(if test "$default_feature" =3D no; then echo
> "-Dauto_features=3Ddisabled"; fi) \
> -        "$@" $cross_arg "$PWD" "$source_path"
> +    NINJA=3D$ninja $meson setup --prefix "$prefix" "$@" $cross_arg "$PWD=
"
> "$source_path"
>    }
>    eval run_meson $meson_options
>    if test "$?" -ne 0 ; then
> diff --git a/meson.build b/meson.build
> index 60e8c302e6..ff5c076805 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1,6 +1,6 @@
>  project('qemu', ['c'], meson_version: '>=3D0.59.3',
>          default_options: ['warning_level=3D1', 'c_std=3Dgnu11',
> 'cpp_std=3Dgnu++11', 'b_colorout=3Dauto',
> -                          'b_staticpic=3Dfalse', 'stdsplit=3Dfalse',
> 'optimization=3D2'],
> +                          'b_staticpic=3Dfalse', 'stdsplit=3Dfalse',
> 'optimization=3D2', 'b_pie=3Dtrue'],
>          version: files('VERSION'))
>
>  add_test_setup('quick', exclude_suites: ['slow', 'thorough'], is_default=
:
> true)
> diff --git a/meson_options.txt b/meson_options.txt
> index a76fadbd7d..8efd5f520c 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -78,7 +78,7 @@ option('xen', type: 'feature', value: 'auto',
>         description: 'Xen backend support')
>  option('xen_pci_passthrough', type: 'feature', value: 'auto',
>         description: 'Xen PCI passthrough support')
> -option('tcg', type: 'feature', value: 'auto',
> +option('tcg', type: 'feature', value: 'enabled',
>         description: 'TCG support')
>  option('tcg_interpreter', type: 'boolean', value: false,
>         description: 'TCG with bytecode interpreter (slow)')
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000015d13505dd273c74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 8:13 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This=
 has no functional change, it only makes the command line shorter<br>
and nicer.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div><div>=C2=A0Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:ma=
rcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div><b=
r></div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 29 +++++++++++++++++----=
--------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meson_options.txt |=C2=A0 2 +-<br>
=C2=A03 files changed, 19 insertions(+), 14 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 4997983b5d..61b5acae10 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -2349,19 +2349,24 @@ if test &quot;$skip_meson&quot; =3D no; then<br>
=C2=A0 =C2=A0mv $cross config-meson.cross<br>
<br>
=C2=A0 =C2=A0rm -rf meson-private meson-info meson-logs<br>
+<br>
+=C2=A0 # Built-in options<br>
+=C2=A0 test &quot;$bindir&quot; !=3D &quot;bin&quot; &amp;&amp; meson_opti=
on_add &quot;-Dbindir=3D$bindir&quot;<br>
+=C2=A0 test &quot;$default_feature&quot; =3D no &amp;&amp; meson_option_ad=
d -Dauto_features=3Ddisabled<br>
+=C2=A0 test &quot;$pie&quot; =3D no &amp;&amp; meson_option_add -Db_pie=3D=
false<br>
+=C2=A0 test &quot;$werror&quot; =3D yes &amp;&amp; meson_option_add -Dwerr=
or=3Dtrue<br>
+<br>
+=C2=A0 # QEMU options<br>
+=C2=A0 test &quot;$capstone&quot; !=3D auto &amp;&amp; meson_option_add &q=
uot;-Dcapstone=3D$capstone&quot;<br>
+=C2=A0 test &quot;$cfi&quot; !=3D false &amp;&amp; meson_option_add &quot;=
-Dcfi=3D$cfi&quot;<br>
+=C2=A0 test &quot;$fdt&quot; !=3D auto &amp;&amp; meson_option_add &quot;-=
Dfdt=3D$fdt&quot;<br>
+=C2=A0 test -n &quot;${LIB_FUZZING_ENGINE+xxx}&quot; &amp;&amp; meson_opti=
on_add &quot;-Dfuzzing_engine=3D$LIB_FUZZING_ENGINE&quot;<br>
+=C2=A0 test &quot;$qemu_suffix&quot; !=3D qemu &amp;&amp; meson_option_add=
 &quot;-Dqemu_suffix=3D$qemu_suffix&quot;<br>
+=C2=A0 test &quot;$slirp&quot; !=3D auto &amp;&amp; meson_option_add &quot=
;-Dslirp=3D$slirp&quot;<br>
+=C2=A0 test &quot;$smbd&quot; !=3D &#39;&#39; &amp;&amp; meson_option_add =
&quot;-Dsmbd=3D$smbd&quot;<br>
+=C2=A0 test &quot;$tcg&quot; !=3D enabled &amp;&amp; meson_option_add &quo=
t;-Dtcg=3D$tcg&quot;<br>
=C2=A0 =C2=A0run_meson() {<br>
-=C2=A0 =C2=A0 NINJA=3D$ninja $meson setup \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 --prefix &quot;$prefix&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 --bindir &quot;$bindir&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dqemu_suffix=3D&quot;$qemu_suffix&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dsmbd=3D&quot;$smbd&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dwerror=3D$(if test &quot;$werror&quot; =3D y=
es; then echo true; else echo false; fi) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Db_pie=3D$(if test &quot;$pie&quot; =3D yes; =
then echo true; else echo false; fi) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dcfi=3D$cfi -Dtcg=3D$tcg \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dcapstone=3D$capstone -Dfdt=3D$fdt -Dslirp=3D=
$slirp \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(test -n &quot;${LIB_FUZZING_ENGINE+xxx}&quot=
; &amp;&amp; echo &quot;-Dfuzzing_engine=3D$LIB_FUZZING_ENGINE&quot;) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(if test &quot;$default_feature&quot; =3D no;=
 then echo &quot;-Dauto_features=3Ddisabled&quot;; fi) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;$@&quot; $cross_arg &quot;$PWD&quot; &qu=
ot;$source_path&quot;<br>
+=C2=A0 =C2=A0 NINJA=3D$ninja $meson setup --prefix &quot;$prefix&quot; &qu=
ot;$@&quot; $cross_arg &quot;$PWD&quot; &quot;$source_path&quot;<br>
=C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0eval run_meson $meson_options<br>
=C2=A0 =C2=A0if test &quot;$?&quot; -ne 0 ; then<br>
diff --git a/meson.build b/meson.build<br>
index 60e8c302e6..ff5c076805 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1,6 +1,6 @@<br>
=C2=A0project(&#39;qemu&#39;, [&#39;c&#39;], meson_version: &#39;&gt;=3D0.5=
9.3&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default_options: [&#39;warning_level=3D1&=
#39;, &#39;c_std=3Dgnu11&#39;, &#39;cpp_std=3Dgnu++11&#39;, &#39;b_colorout=
=3Dauto&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;b_staticpic=3Dfalse&#39;, &#39;stdsplit=3Dfalse&#39;=
, &#39;optimization=3D2&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;b_staticpic=3Dfalse&#39;, &#39;stdsplit=3Dfalse&#39;=
, &#39;optimization=3D2&#39;, &#39;b_pie=3Dtrue&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version: files(&#39;VERSION&#39;))<br>
<br>
=C2=A0add_test_setup(&#39;quick&#39;, exclude_suites: [&#39;slow&#39;, &#39=
;thorough&#39;], is_default: true)<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index a76fadbd7d..8efd5f520c 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -78,7 +78,7 @@ option(&#39;xen&#39;, type: &#39;feature&#39;, value: &#3=
9;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Xen backend support&#39;)<br>
=C2=A0option(&#39;xen_pci_passthrough&#39;, type: &#39;feature&#39;, value:=
 &#39;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Xen PCI passthrough support&#=
39;)<br>
-option(&#39;tcg&#39;, type: &#39;feature&#39;, value: &#39;auto&#39;,<br>
+option(&#39;tcg&#39;, type: &#39;feature&#39;, value: &#39;enabled&#39;,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;TCG support&#39;)<br>
=C2=A0option(&#39;tcg_interpreter&#39;, type: &#39;boolean&#39;, value: fal=
se,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;TCG with bytecode interpreter=
 (slow)&#39;)<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000015d13505dd273c74--

