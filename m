Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C21663E8F68
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 13:24:26 +0200 (CEST)
Received: from localhost ([::1]:48142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDmLR-0003ih-S2
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 07:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mDmK2-0002xw-Qc
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 07:22:58 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:45699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mDmK0-0004rR-Kw
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 07:22:58 -0400
Received: by mail-ej1-x635.google.com with SMTP id qk33so3519238ejc.12
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 04:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OAv1ihbtsPNnQmg4Zdj6cmSJf+87s2MJwB7RsNniYxw=;
 b=ER5fvY5/ZV6ik4ue3hK8oWAvuRL1mRz+2hRB9QQreF3W2p5bmZL9X7lvKHabkpz948
 Y1JjBgxjamRItFgJ6WjssCeELGswLVLfbaKsJDG1g7tFajpm8neiXIT3u7oPb7zpP7b3
 DDspN2zNQqBe8oqy3+DXQuGx58MVif4urcQTtUvh39PK7Dpcg+MaYUB4/zKx/NzUFtPM
 4uX2j0T1Dtjvr0AL5SsEmFtgfBlYE/JEBrbf6fstb+AM/o2ohMudc+kBUg88uC80wiUK
 alr/brmmP+C1BcsO9K/evLL3d+OWdN5ojQslzc5X5DLPCDWvGqf5wlEk8JmsQtTl6suf
 wiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OAv1ihbtsPNnQmg4Zdj6cmSJf+87s2MJwB7RsNniYxw=;
 b=tZddswz6C9+3fF2mXa3K9D4a/AN+K6wT/7M1x1JedrD7znkwTr2lDK/fsHLuS7MsXF
 lkdKEvVJWhYRQRh9cwRHFxhRBO40nyXchMTC/rJTYhhkePdh4hMeSwEG0o4tZDXlt+XC
 W9S+hvJyt40oVjV71Pv1TlkRB/b+0mH+dQdBAxw/3M4p4d3Yg8s8xUKA4Lh8zleYXPci
 gPQS6iDPV4HecjMJE4QRlmGrvoJlcBK1Kb282asA/9BRFGdb5fSLFvSfFsa4+EpWTdKy
 wuDaZYTour8F+ceiIoiu7vYZ4EMFbMWcVpHL/Y0STSxTWTfDTYn6QrH6ZM93t+W+k6bz
 2lbg==
X-Gm-Message-State: AOAM531IGc0Fj3n69SgfnHuWv8nxFjgomri5sAW2PrsBHKa0siY3ecnx
 YOTWM/uGBAandqqoAqiyf0/H8xT/Qh85pkb8soI=
X-Google-Smtp-Source: ABdhPJyuDzgDHnwhjN93RRKW3fYByUJ0dpQ4BQz87tFIlzFwzMKxfd4g46jdhzjtX3NiuGqEh6JsmLrNnH1fV7wx5ao=
X-Received: by 2002:a17:906:4fd6:: with SMTP id
 i22mr3234497ejw.92.1628680974957; 
 Wed, 11 Aug 2021 04:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210810113201.3957815-1-berrange@redhat.com>
In-Reply-To: <20210810113201.3957815-1-berrange@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 11 Aug 2021 15:22:43 +0400
Message-ID: <CAJ+F1CJf=e5DcGji98krxgaqdsKkc=FCHF1JveuBfegovdcbJw@mail.gmail.com>
Subject: Re: [PATCH v2] docs: make sphinx-build be quiet by default
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f7026905c946d6fa"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

--000000000000f7026905c946d6fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Aug 10, 2021 at 3:32 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> The sphinx-build is fairly verbose spitting out pages of output to the
> console, which causes errors from other build commands to be scrolled
> off the top of the terminal. This can leave the mistaken impression that
> the build passed, when in fact there was a failure.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>

Without this patch, I miss the warnings 99% of the time!!

You are missing one -q though:

diff --git a/docs/meson.build b/docs/meson.build
index 42d7555bc4..51fa902cd9 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -78,7 +78,7 @@ if build_docs
                 input: files('conf.py'),
                 depfile: 'docs.d',
                 depend_files: [ sphinx_extn_depends, sphinx_template_files
],
-                command: [SPHINX_ARGS, '-Ddepfile=3D@DEPFILE@',
+                command: [SPHINX_ARGS, '-q', '-Ddepfile=3D@DEPFILE@',
                           '-Ddepfile_stamp=3D@OUTPUT0@',
                           '-b', 'html', '-d', private_dir,
                           input_dir, output_dir])

Why not update SPHINX_ARGS instead?

---

>
> In v2:
>
>  - This time with the extra trailing ',' actually committed
>
>  docs/meson.build | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/docs/meson.build b/docs/meson.build
> index 300b134329..42d7555bc4 100644
> --- a/docs/meson.build
> +++ b/docs/meson.build
> @@ -21,7 +21,7 @@ if sphinx_build.found()
>    run_command('mkdir', ['-p', tmpdir / 'sphinx'])
>    run_command('touch', [tmpdir / 'sphinx/index.rst'])
>    sphinx_build_test_out =3D run_command(SPHINX_ARGS + [
> -    '-c', meson.current_source_dir(),
> +    '-q', '-c', meson.current_source_dir(),
>      '-b', 'html', tmpdir / 'sphinx',
>      tmpdir / 'sphinx/out'])
>    build_docs =3D (sphinx_build_test_out.returncode() =3D=3D 0)
> @@ -98,8 +98,9 @@ if build_docs
>                                input: this_manual,
>                                install: build_docs,
>                                install_dir: install_dirs,
> -                              command: [SPHINX_ARGS, '-b', 'man', '-d',
> private_dir,
> -                                        input_dir,
> meson.current_build_dir()])
> +                              command: [SPHINX_ARGS, '-q', '-b', 'man',
> +                                        '-d', private_dir, input_dir,
> +                                        meson.current_build_dir()])
>
>    alias_target('sphinxdocs', sphinxdocs)
>    alias_target('html', sphinxdocs)
> --
> 2.31.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f7026905c946d6fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 10, 2021 at 3:32 PM Dan=
iel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@re=
dhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">The sphinx-build is fairly verbose spitting out pages of output to =
the<br>
console, which causes errors from other build commands to be scrolled<br>
off the top of the terminal. This can leave the mistaken impression that<br=
>
the build passed, when in fact there was a failure.<br>
<br>
Signed-off-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redha=
t.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br></blockquote><div><=
br></div><div>Without this patch, I miss the warnings 99% of the time!!</di=
v><div><br></div><div>You are missing one -q though:</div><div><br></div><d=
iv>diff --git a/docs/meson.build b/docs/meson.build<br>index 42d7555bc4..51=
fa902cd9 100644<br>--- a/docs/meson.build<br>+++ b/docs/meson.build<br>@@ -=
78,7 +78,7 @@ if build_docs<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0input: files(&#39;conf.py&#39;),<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depfile: &#39;docs.d&#39;,<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depend_files:=
 [ sphinx_extn_depends, sphinx_template_files ],<br>- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command: [SPHINX_ARGS, &#39;-Ddepfile=3D@=
DEPFILE@&#39;,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
command: [SPHINX_ARGS, &#39;-q&#39;, &#39;-Ddepfile=3D@DEPFILE@&#39;,<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&#39;-Ddepfile_stamp=3D@OUTPUT0@&#39;,<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-b&#39;, &#39;html&#39;, &#39;-d&#39;, private_dir,<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0input_dir, output_dir])</div><div><br></div><div>Wh=
y not update SPHINX_ARGS instead?</div><div><br></div></div><div class=3D"g=
mail_quote">---<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
In v2:<br>
<br>
=C2=A0- This time with the extra trailing &#39;,&#39; actually committed<br=
>
<br>
=C2=A0docs/meson.build | 7 ++++---<br>
=C2=A01 file changed, 4 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/docs/meson.build b/docs/meson.build<br>
index 300b134329..42d7555bc4 100644<br>
--- a/docs/meson.build<br>
+++ b/docs/meson.build<br>
@@ -21,7 +21,7 @@ if sphinx_build.found()<br>
=C2=A0 =C2=A0run_command(&#39;mkdir&#39;, [&#39;-p&#39;, tmpdir / &#39;sphi=
nx&#39;])<br>
=C2=A0 =C2=A0run_command(&#39;touch&#39;, [tmpdir / &#39;sphinx/index.rst&#=
39;])<br>
=C2=A0 =C2=A0sphinx_build_test_out =3D run_command(SPHINX_ARGS + [<br>
-=C2=A0 =C2=A0 &#39;-c&#39;, meson.current_source_dir(),<br>
+=C2=A0 =C2=A0 &#39;-q&#39;, &#39;-c&#39;, meson.current_source_dir(),<br>
=C2=A0 =C2=A0 =C2=A0&#39;-b&#39;, &#39;html&#39;, tmpdir / &#39;sphinx&#39;=
,<br>
=C2=A0 =C2=A0 =C2=A0tmpdir / &#39;sphinx/out&#39;])<br>
=C2=A0 =C2=A0build_docs =3D (sphinx_build_test_out.returncode() =3D=3D 0)<b=
r>
@@ -98,8 +98,9 @@ if build_docs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input: this_manual,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install: build_docs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install_dir: install_dirs,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 command: [SPHINX_ARGS, &#39;-b&#39;, &#39;m=
an&#39;, &#39;-d&#39;, private_dir,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input_di=
r, meson.current_build_dir()])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 command: [SPHINX_ARGS, &#39;-q&#39;, &#39;-=
b&#39;, &#39;man&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-d&=
#39;, private_dir, input_dir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meson.cu=
rrent_build_dir()])<br>
<br>
=C2=A0 =C2=A0alias_target(&#39;sphinxdocs&#39;, sphinxdocs)<br>
=C2=A0 =C2=A0alias_target(&#39;html&#39;, sphinxdocs)<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000f7026905c946d6fa--

