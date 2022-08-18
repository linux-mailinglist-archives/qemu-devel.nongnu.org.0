Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF82A59812E
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 11:59:53 +0200 (CEST)
Received: from localhost ([::1]:39722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOcJb-000644-Ux
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 05:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oOc0U-0001UX-PS
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 05:40:06 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:44709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oOc0S-0004r0-Rm
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 05:40:06 -0400
Received: by mail-lj1-x236.google.com with SMTP id by6so1158998ljb.11
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 02:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=YyNAmbk6BScLb0n7Qfq5FK+Uel9G30CPB0dt1HzyKco=;
 b=kloj1NI4yXwAmxjWRVB8FauzEeKXpXQ7oAU2CkUhMLp8ST1WjHhGM5+RwTq2PUtfOB
 ECbGl3+iNxvKkt2rHXUhDFekGiohgzj5qF+Zhd0WhexdIkvzhyvicEvHMeUaqGVYPc/m
 hFq3QjIexzL9177YyKn6dbDXOXAMd82HWl/iw65PQNxlr/D+V12wVzoyF7G6+D3fnZ84
 3qw6Cc0IBeIuxVsw2jy2xZoDFxCR/zGkJlHRYECOaWAF7vyLplYXnAVlkEPsmLNNfnrO
 MrHIF10PjTWutwi9hWhggMe2YT0BJPtF+3XwzFXhMDjgNwTfF1k6HRnTMnihCEdksYc3
 BNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=YyNAmbk6BScLb0n7Qfq5FK+Uel9G30CPB0dt1HzyKco=;
 b=aDvbvTpH1Z7fgLz8MeHCbxqUsqyYiDVdi3Zte0VA+57x/+krxoI0WUERhOq/mYHxdh
 4LeVycbfXBInAxuelER50Y7CjhKcpSQTWoiBWtLw6J3KH+egGYpTMu4YmMVs2IS+zXkI
 nz5mGLac7nVFNydYb+nzz6kJgMRcr/Lq5AAtMxMhoGFKfJ9f6bdFgb8mwwLsSCs0c5Vk
 ZKCGGSmQlED/ZuAgmot9UwNXBjCD7exZobNr5imVTghByD1tdjqc6Zl+3iUbCpfn01sM
 Um4bV6W6Etk6rZSFN65aFGXRAOQEIUfun2b0nTjIQEanT4j0F5UrlvnKF8LIfmY1uudr
 eYqQ==
X-Gm-Message-State: ACgBeo1cw2YjGAgfnCGRk6fKmi+TMHW1bjarvusFlfNkbCGEI1gP79V2
 elYVipaTvjMxnkky+mVpjYME2g9ZOvjptVFm7dY=
X-Google-Smtp-Source: AA6agR4fK4fUCEQ+buiitYTe6mljcxIrG5qCQ8et0JQgvu15bGMq9mIkogI2cNT3wg0HztX9Ny8oe2vYorJ8QHJQsZw=
X-Received: by 2002:a05:651c:a04:b0:25e:753b:db42 with SMTP id
 k4-20020a05651c0a0400b0025e753bdb42mr631338ljq.529.1660815601995; Thu, 18 Aug
 2022 02:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220818092943.106451-1-pbonzini@redhat.com>
In-Reply-To: <20220818092943.106451-1-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 18 Aug 2022 13:39:50 +0400
Message-ID: <CAJ+F1CL9TmUacdmYaeu_nE3tO_Wrg3KaO66HJGtDF_Dwr2pStQ@mail.gmail.com>
Subject: Re: [PATCH] meson: remove dead code
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000fe94df05e680c3fb"
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x236.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000fe94df05e680c3fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2022 at 1:31 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Found with "muon analyze".
>

nice
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  meson.build                 |  2 --
>  pc-bios/keymaps/meson.build |  1 -
>  qapi/meson.build            | 15 ---------------
>  target/riscv/meson.build    |  2 --
>  4 files changed, 20 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 30a380752c..8e927fc457 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3405,7 +3405,6 @@ foreach target : target_dirs
>      target_inc +=3D include_directories('linux-headers', is_system: true=
)
>    endif
>    if target.endswith('-softmmu')
> -    qemu_target_name =3D 'qemu-system-' + target_name
>      target_type=3D'system'
>      t =3D target_softmmu_arch[target_base_arch].apply(config_target,
> strict: false)
>      arch_srcs +=3D t.sources()
> @@ -3422,7 +3421,6 @@ foreach target : target_dirs
>      abi =3D config_target['TARGET_ABI_DIR']
>      target_type=3D'user'
>      target_inc +=3D common_user_inc
> -    qemu_target_name =3D 'qemu-' + target_name
>      if target_base_arch in target_user_arch
>        t =3D target_user_arch[target_base_arch].apply(config_target, stri=
ct:
> false)
>        arch_srcs +=3D t.sources()
> diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
> index 2837eb34f4..06c75e646b 100644
> --- a/pc-bios/keymaps/meson.build
> +++ b/pc-bios/keymaps/meson.build
> @@ -38,7 +38,6 @@ if meson.is_cross_build() or 'CONFIG_XKBCOMMON' not in
> config_host
>  else
>    native_qemu_keymap =3D qemu_keymap
>  endif
> -cp =3D find_program('cp')
>
>  if native_qemu_keymap.found()
>    t =3D []
> diff --git a/qapi/meson.build b/qapi/meson.build
> index fd5c93d643..840f1b0e19 100644
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -68,21 +68,6 @@ if have_system or have_tools
>    ]
>  endif
>
> -qapi_storage_daemon_modules =3D [
> -  'block-core',
> -  'block-export',
> -  'char',
> -  'common',
> -  'control',
> -  'crypto',
> -  'introspect',
> -  'job',
> -  'qom',
> -  'sockets',
> -  'pragma',
> -  'transaction',
> -]
> -
>  qapi_nonmodule_outputs =3D [
>    'qapi-introspect.c', 'qapi-introspect.h',
>    'qapi-types.c', 'qapi-types.h',
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index 2c1975e72c..6b9435d69a 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -1,6 +1,4 @@
>  # FIXME extra_args should accept files()
> -dir =3D meson.current_source_dir()
> -
>  gen =3D [
>    decodetree.process('insn16.decode', extra_args:
> ['--static-decode=3Ddecode_insn16', '--insnwidth=3D16']),
>    decodetree.process('insn32.decode', extra_args:
> '--static-decode=3Ddecode_insn32'),
> --
> 2.37.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000fe94df05e680c3fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 18, 2022 at 1:31 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Foun=
d with &quot;muon analyze&quot;.<br></blockquote><div><br></div><div>nice</=
div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandr=
e.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt; <br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
---<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 --<br>
=C2=A0pc-bios/keymaps/meson.build |=C2=A0 1 -<br>
=C2=A0qapi/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 15 ------=
---------<br>
=C2=A0target/riscv/meson.build=C2=A0 =C2=A0 |=C2=A0 2 --<br>
=C2=A04 files changed, 20 deletions(-)<br>
<br>
diff --git a/meson.build b/meson.build<br>
index 30a380752c..8e927fc457 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -3405,7 +3405,6 @@ foreach target : target_dirs<br>
=C2=A0 =C2=A0 =C2=A0target_inc +=3D include_directories(&#39;linux-headers&=
#39;, is_system: true)<br>
=C2=A0 =C2=A0endif<br>
=C2=A0 =C2=A0if target.endswith(&#39;-softmmu&#39;)<br>
-=C2=A0 =C2=A0 qemu_target_name =3D &#39;qemu-system-&#39; + target_name<br=
>
=C2=A0 =C2=A0 =C2=A0target_type=3D&#39;system&#39;<br>
=C2=A0 =C2=A0 =C2=A0t =3D target_softmmu_arch[target_base_arch].apply(confi=
g_target, strict: false)<br>
=C2=A0 =C2=A0 =C2=A0arch_srcs +=3D t.sources()<br>
@@ -3422,7 +3421,6 @@ foreach target : target_dirs<br>
=C2=A0 =C2=A0 =C2=A0abi =3D config_target[&#39;TARGET_ABI_DIR&#39;]<br>
=C2=A0 =C2=A0 =C2=A0target_type=3D&#39;user&#39;<br>
=C2=A0 =C2=A0 =C2=A0target_inc +=3D common_user_inc<br>
-=C2=A0 =C2=A0 qemu_target_name =3D &#39;qemu-&#39; + target_name<br>
=C2=A0 =C2=A0 =C2=A0if target_base_arch in target_user_arch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0t =3D target_user_arch[target_base_arch].apply(c=
onfig_target, strict: false)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0arch_srcs +=3D t.sources()<br>
diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build<br>
index 2837eb34f4..06c75e646b 100644<br>
--- a/pc-bios/keymaps/meson.build<br>
+++ b/pc-bios/keymaps/meson.build<br>
@@ -38,7 +38,6 @@ if meson.is_cross_build() or &#39;CONFIG_XKBCOMMON&#39; n=
ot in config_host<br>
=C2=A0else<br>
=C2=A0 =C2=A0native_qemu_keymap =3D qemu_keymap<br>
=C2=A0endif<br>
-cp =3D find_program(&#39;cp&#39;)<br>
<br>
=C2=A0if native_qemu_keymap.found()<br>
=C2=A0 =C2=A0t =3D []<br>
diff --git a/qapi/meson.build b/qapi/meson.build<br>
index fd5c93d643..840f1b0e19 100644<br>
--- a/qapi/meson.build<br>
+++ b/qapi/meson.build<br>
@@ -68,21 +68,6 @@ if have_system or have_tools<br>
=C2=A0 =C2=A0]<br>
=C2=A0endif<br>
<br>
-qapi_storage_daemon_modules =3D [<br>
-=C2=A0 &#39;block-core&#39;,<br>
-=C2=A0 &#39;block-export&#39;,<br>
-=C2=A0 &#39;char&#39;,<br>
-=C2=A0 &#39;common&#39;,<br>
-=C2=A0 &#39;control&#39;,<br>
-=C2=A0 &#39;crypto&#39;,<br>
-=C2=A0 &#39;introspect&#39;,<br>
-=C2=A0 &#39;job&#39;,<br>
-=C2=A0 &#39;qom&#39;,<br>
-=C2=A0 &#39;sockets&#39;,<br>
-=C2=A0 &#39;pragma&#39;,<br>
-=C2=A0 &#39;transaction&#39;,<br>
-]<br>
-<br>
=C2=A0qapi_nonmodule_outputs =3D [<br>
=C2=A0 =C2=A0&#39;qapi-introspect.c&#39;, &#39;qapi-introspect.h&#39;,<br>
=C2=A0 =C2=A0&#39;qapi-types.c&#39;, &#39;qapi-types.h&#39;,<br>
diff --git a/target/riscv/meson.build b/target/riscv/meson.build<br>
index 2c1975e72c..6b9435d69a 100644<br>
--- a/target/riscv/meson.build<br>
+++ b/target/riscv/meson.build<br>
@@ -1,6 +1,4 @@<br>
=C2=A0# FIXME extra_args should accept files()<br>
-dir =3D meson.current_source_dir()<br>
-<br>
=C2=A0gen =3D [<br>
=C2=A0 =C2=A0decodetree.process(&#39;insn16.decode&#39;, extra_args: [&#39;=
--static-decode=3Ddecode_insn16&#39;, &#39;--insnwidth=3D16&#39;]),<br>
=C2=A0 =C2=A0decodetree.process(&#39;insn32.decode&#39;, extra_args: &#39;-=
-static-decode=3Ddecode_insn32&#39;),<br>
-- <br>
2.37.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000fe94df05e680c3fb--

