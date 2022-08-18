Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C495598147
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 12:08:38 +0200 (CEST)
Received: from localhost ([::1]:43838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOcS4-0002C9-PQ
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 06:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oOc5z-0006v8-EN
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 05:45:47 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:43711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oOc5x-0007eI-Fp
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 05:45:47 -0400
Received: by mail-lf1-x130.google.com with SMTP id i19so1416159lfr.10
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 02:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=SNCLZ9Z5MNhy1rJR8ljqO+Gja1srIZZrfbql4EdHJW4=;
 b=LuZ66C7SWUPVMkDHZanr5qN8pw/wG9GIXbYT5l5oRhZAp6oCTqdPuWyq1iHy3zwEsl
 z0JFWjizsbpjrT2fHIpw/uCQE2rECJEkrQHWNNwcHGv9vOAwXGPAc3V2d/VTTuIfOVle
 0CsoYk+YmRpMfywOU4d8NVwBUXkoLWOdYzx3rnizRUG2ww5pOwFZoZBxRSl0XxaVpTYY
 oNxzExdHvIgyILYZM5E8vh1vYUbq7uZbdZNz/ganJHEfdIa1J4U6K5DggjsBLWtiV55B
 /EWqW7xwasuIeMf45AL9g3LqVWvcyslXC6faGdxZTYGEW17qdF1mzmM06ujGmu3KifSF
 2N+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=SNCLZ9Z5MNhy1rJR8ljqO+Gja1srIZZrfbql4EdHJW4=;
 b=7GVD+ixBbtqvBE9V+gJOh6LMIpUndtiQEED98AqEYxuLHIhl3NzKEGcEr3HFml03hv
 45Od0pbtqoctw1GzeAqKBoW9L4KLo4h2/u3LpSjlFZpvd1IUG/7z9qpmXyrmBCcU/PwD
 i2B4MsE/9SS4axSo5Gzmq2HqXUK038deOeJg+2Bla43hIrE0yGtupfC0Zz3zJOYy1byh
 M4+rSryUDNC3S3npI9PxusTLIa/ljYakGp4C7TRzEvcNNnIV/SmBs0O/HetdqqaZ7Izh
 I6fFYcYPaJ+/4oV1Kk0oWId9Aa7BNJW9oB+mjJHJwFm+SHO8vjJkdFEX5k6fvbTGsyLD
 ah4A==
X-Gm-Message-State: ACgBeo1h7qcI6nN8yZV36v+1q5Nr3VeSPSqaj9fxgmTUYwVwIocQlho0
 REOrNBL0VvjeHNoZJfZNVL17Oi0lkTPmS9TzkQQ=
X-Google-Smtp-Source: AA6agR7wSm8Grj1JfkfPE7x89lnGA5pQDp7Lj+SyZx7Ica7V242Lf1p0vY5od5EICGRxmldSqEO4gV3+WHVZRN+oYVc=
X-Received: by 2002:ac2:4f03:0:b0:48b:2179:5249 with SMTP id
 k3-20020ac24f03000000b0048b21795249mr820801lfr.356.1660815943296; Thu, 18 Aug
 2022 02:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220818092943.106451-2-pbonzini@redhat.com>
In-Reply-To: <20220818092943.106451-2-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 18 Aug 2022 13:45:31 +0400
Message-ID: <CAJ+F1CL9YaVVLV_n0CHfQOipoJD1d=4WLQxTKjUwACu7uedvrg@mail.gmail.com>
Subject: Re: [PATCH] meson: remove dead assignments
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000566a2f05e680d805"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x130.google.com
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

--000000000000566a2f05e680d805
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2022 at 1:44 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Found with "muon analyze".
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  plugins/meson.build           |  2 +-
>  tests/fp/meson.build          |  2 +-
>  tests/qapi-schema/meson.build | 24 ++++++++++++------------
>  3 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/plugins/meson.build b/plugins/meson.build
> index fa12047327..752377c66d 100644
> --- a/plugins/meson.build
> +++ b/plugins/meson.build
> @@ -2,7 +2,7 @@ plugin_ldflags =3D []
>  # Modules need more symbols than just those in
> plugins/qemu-plugins.symbols
>  if not enable_modules
>    if targetos =3D=3D 'darwin'
> -    qemu_plugins_symbols_list =3D configure_file(
> +    configure_file(
>        input: files('qemu-plugins.symbols'),
>        output: 'qemu-plugins-ld64.symbols',
>        capture: true,
> diff --git a/tests/fp/meson.build b/tests/fp/meson.build
> index 2b4f00b916..6258e2bd7d 100644
> --- a/tests/fp/meson.build
> +++ b/tests/fp/meson.build
> @@ -632,7 +632,7 @@ test('fp-test-mulAdd', fptest,
>             ['f16_mulAdd', 'f32_mulAdd', 'f64_mulAdd', 'f128_mulAdd'],
>       suite: ['softfloat-slow', 'softfloat-ops-slow', 'slow'], timeout: 9=
0)
>
> -fpbench =3D executable(
> +executable(
>    'fp-bench',
>    ['fp-bench.c', '../../fpu/softfloat.c'],
>    link_with: [libtestfloat, libsoftfloat],
> diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.buil=
d
> index c18dd7d02f..406bc7255d 100644
> --- a/tests/qapi-schema/meson.build
> +++ b/tests/qapi-schema/meson.build
> @@ -215,18 +215,18 @@ test('QAPI schema regression tests', python,
>
>  diff =3D find_program('diff')
>
> -qapi_doc =3D custom_target('QAPI doc',
> -                         output: ['doc-good-qapi-commands.c',
> 'doc-good-qapi-commands.h',
> -                                  'doc-good-qapi-emit-events.c',
> 'doc-good-qapi-emit-events.h',
> -                                  'doc-good-qapi-events.c',
> 'doc-good-qapi-events.h',
> -                                  'doc-good-qapi-init-commands.c',
> 'doc-good-qapi-init-commands.h',
> -                                  'doc-good-qapi-introspect.c',
> 'doc-good-qapi-introspect.h',
> -                                  'doc-good-qapi-types.c',
> 'doc-good-qapi-types.h',
> -                                  'doc-good-qapi-visit.c',
> 'doc-good-qapi-visit.h' ],
> -                         input: files('doc-good.json'),
> -                         command: [ qapi_gen, '-o',
> meson.current_build_dir(),
> -                                    '-p', 'doc-good-', '@INPUT0@' ],
> -                         depend_files: qapi_gen_depends)
> +custom_target('QAPI doc',
> +              output: ['doc-good-qapi-commands.c',
> 'doc-good-qapi-commands.h',
> +                       'doc-good-qapi-emit-events.c',
> 'doc-good-qapi-emit-events.h',
> +                       'doc-good-qapi-events.c', 'doc-good-qapi-events.h=
',
> +                       'doc-good-qapi-init-commands.c',
> 'doc-good-qapi-init-commands.h',
> +                       'doc-good-qapi-introspect.c',
> 'doc-good-qapi-introspect.h',
> +                       'doc-good-qapi-types.c', 'doc-good-qapi-types.h',
> +                       'doc-good-qapi-visit.c', 'doc-good-qapi-visit.h' =
],
> +              input: files('doc-good.json'),
> +              command: [ qapi_gen, '-o', meson.current_build_dir(),
> +                         '-p', 'doc-good-', '@INPUT0@' ],
> +              depend_files: qapi_gen_depends)
>
>  if build_docs
>    # Test the document-comment document generation code by running a test
> schema
> --
> 2.37.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000566a2f05e680d805
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 18, 2022 at 1:44 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Foun=
d with &quot;muon analyze&quot;.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0plugins/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2=
 +-<br>
=C2=A0tests/fp/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<b=
r>
=C2=A0tests/qapi-schema/meson.build | 24 ++++++++++++------------<br>
=C2=A03 files changed, 14 insertions(+), 14 deletions(-)<br>
<br>
diff --git a/plugins/meson.build b/plugins/meson.build<br>
index fa12047327..752377c66d 100644<br>
--- a/plugins/meson.build<br>
+++ b/plugins/meson.build<br>
@@ -2,7 +2,7 @@ plugin_ldflags =3D []<br>
=C2=A0# Modules need more symbols than just those in plugins/qemu-plugins.s=
ymbols<br>
=C2=A0if not enable_modules<br>
=C2=A0 =C2=A0if targetos =3D=3D &#39;darwin&#39;<br>
-=C2=A0 =C2=A0 qemu_plugins_symbols_list =3D configure_file(<br>
+=C2=A0 =C2=A0 configure_file(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0input: files(&#39;qemu-plugins.symbols&#39;),<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0output: &#39;qemu-plugins-ld64.symbols&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0capture: true,<br>
diff --git a/tests/fp/meson.build b/tests/fp/meson.build<br>
index 2b4f00b916..6258e2bd7d 100644<br>
--- a/tests/fp/meson.build<br>
+++ b/tests/fp/meson.build<br>
@@ -632,7 +632,7 @@ test(&#39;fp-test-mulAdd&#39;, fptest,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [&#39;f16_mulAdd&#39;, &#39;f32_m=
ulAdd&#39;, &#39;f64_mulAdd&#39;, &#39;f128_mulAdd&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 suite: [&#39;softfloat-slow&#39;, &#39;softfloat-ops-s=
low&#39;, &#39;slow&#39;], timeout: 90)<br>
<br>
-fpbench =3D executable(<br>
+executable(<br>
=C2=A0 =C2=A0&#39;fp-bench&#39;,<br>
=C2=A0 =C2=A0[&#39;fp-bench.c&#39;, &#39;../../fpu/softfloat.c&#39;],<br>
=C2=A0 =C2=A0link_with: [libtestfloat, libsoftfloat],<br>
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build<=
br>
index c18dd7d02f..406bc7255d 100644<br>
--- a/tests/qapi-schema/meson.build<br>
+++ b/tests/qapi-schema/meson.build<br>
@@ -215,18 +215,18 @@ test(&#39;QAPI schema regression tests&#39;, python,<=
br>
<br>
=C2=A0diff =3D find_program(&#39;diff&#39;)<br>
<br>
-qapi_doc =3D custom_target(&#39;QAPI doc&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0output: [&#39;doc-good-qapi-commands.c&#39;, &#39;doc-good=
-qapi-commands.h&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;doc-good-qapi-emit-event=
s.c&#39;, &#39;doc-good-qapi-emit-events.h&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;doc-good-qapi-events.c&#=
39;, &#39;doc-good-qapi-events.h&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;doc-good-qapi-init-comma=
nds.c&#39;, &#39;doc-good-qapi-init-commands.h&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;doc-good-qapi-introspect=
.c&#39;, &#39;doc-good-qapi-introspect.h&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;doc-good-qapi-types.c&#3=
9;, &#39;doc-good-qapi-types.h&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;doc-good-qapi-visit.c&#3=
9;, &#39;doc-good-qapi-visit.h&#39; ],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0input: files(&#39;doc-good.json&#39;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0command: [ qapi_gen, &#39;-o&#39;, meson.current_build_dir=
(),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-p&#39;, &#39;doc=
-good-&#39;, &#39;@INPUT0@&#39; ],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0depend_files: qapi_gen_depends)<br>
+custom_target(&#39;QAPI doc&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output: [&#39;doc-good-qa=
pi-commands.c&#39;, &#39;doc-good-qapi-commands.h&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;doc-good-qapi-emit-events.c&#39;, &#39;doc-good-qapi-emit-ev=
ents.h&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;doc-good-qapi-events.c&#39;, &#39;doc-good-qapi-events.h&#39=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;doc-good-qapi-init-commands.c&#39;, &#39;doc-good-qapi-init-=
commands.h&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;doc-good-qapi-introspect.c&#39;, &#39;doc-good-qapi-introspe=
ct.h&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;doc-good-qapi-types.c&#39;, &#39;doc-good-qapi-types.h&#39;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;doc-good-qapi-visit.c&#39;, &#39;doc-good-qapi-visit.h&#39; =
],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input: files(&#39;doc-goo=
d.json&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 command: [ qapi_gen, &#39=
;-o&#39;, meson.current_build_dir(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-p&#39;, &#39;doc-good-&#39;, &#39;@INPUT0@&#39; ],<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depend_files: qapi_gen_de=
pends)<br>
<br>
=C2=A0if build_docs<br>
=C2=A0 =C2=A0# Test the document-comment document generation code by runnin=
g a test schema<br>
-- <br>
2.37.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000566a2f05e680d805--

