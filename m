Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD764DB05E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:07:27 +0100 (CET)
Received: from localhost ([::1]:33452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUTN8-0001KQ-8f
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:07:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nUTCk-0004Md-DU
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:56:42 -0400
Received: from [2a00:1450:4864:20::436] (port=34727
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nUTCi-00076F-ML
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:56:42 -0400
Received: by mail-wr1-x436.google.com with SMTP id j26so2882670wrb.1
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 05:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R6f36cpAmfLfp2EAQ5HSd1V1EaeedSJi/DEW1kodvE8=;
 b=Pj/Hda8yYQ1yx79d+OXaxHmSHZsWQMfy4kFAItc12tsMSc7I8DGXfZt/dH1XKrzYzs
 AFVesiHSwHFBGxgn0ptPfCOJZ58IMJ6s3Xqs0wpjvn6ffM69KIIF6aFI8etgqhB8ey0j
 LBSLjELNPKBvqWr/7pj4BiFgvALfi/mJvVFAoYcjQyrFDbkgKJTfPsx8bzXYe4mUwZGe
 JRaBq3XK2B1ZjhQxEt0b6khckB53yTTmW51MdJ2wjcR/ja0Tjh0HTNXTZK4Pzz4GLLxj
 VlpfuwGO+YixprbgnEFR54NwXSvk7aSTeb4I7/rmHzO/v/4Lu6cyChDSgxiDgYhVxrmW
 NP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R6f36cpAmfLfp2EAQ5HSd1V1EaeedSJi/DEW1kodvE8=;
 b=cb9vMb+byQ0/lATC8JQo5FtaP3qzBw51CmBhDyHAWhLCotqmlP/OvYOY5SiJ8TDZXj
 2Q+QAdXdC5Z4i/YlvMBkYv1hXYTIq8ZdaGbsA7ArvfQFH5k/E9bQ5pno96CciLc0dFW8
 5xiJOnSDvFddAc2vv+5h6qNECZiZKBr4v1oDjuGK2JOIbvgTitYnWvELQ0OlpEXb/M9Q
 L5yS1SkcZ463gMCht8pGEuNicuLeCxnPuJKrVO+IrAOS3mSvUsd2U4aqJIWD76uZdtyZ
 RIpmS7Tk0EObj8DyYfoAo17a9z9QWDJ3KHholAvHktRH8JUxzRxYQmChDamGTTH4M1Ng
 j7NA==
X-Gm-Message-State: AOAM531v0JfxKyB7H5D7HirqS2g7tiB9huq0FcOJjYp3AabwM5weGzCy
 KxEiURwHLccq16yqNIK5Ew/5XDGkmMqTxMCXyNM=
X-Google-Smtp-Source: ABdhPJznJ0b+ECS2sgH/EAxQM+5QaNpux6pGs87vEk8Sv1gNgPjzD5vpXE2JRtBVo/PfogpT/sjFXUjhDHuVB8Op5Lg=
X-Received: by 2002:a05:6000:1d9b:b0:203:def0:29aa with SMTP id
 bk27-20020a0560001d9b00b00203def029aamr2296189wrb.187.1647435396463; Wed, 16
 Mar 2022 05:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <240b4ac6-7f74-e959-ae81-73dbe3fa904e@zapateado.de>
In-Reply-To: <240b4ac6-7f74-e959-ae81-73dbe3fa904e@zapateado.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 16 Mar 2022 16:56:24 +0400
Message-ID: <CAJ+F1CJtBcs8H2nicsu1YUiGceTnbt-E+sHQC4neZvTC2AJLUQ@mail.gmail.com>
Subject: Re: [PATCH-for-7.0] qga/vss-win32: fix compilation with clang++
To: Helge Konetzka <hk@zapateado.de>
Content-Type: multipart/alternative; boundary="00000000000098c04105da55712f"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000098c04105da55712f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 16, 2022 at 4:41 PM Helge Konetzka <hk@zapateado.de> wrote:

> Compiling with clang++ of msys2 toolchain clang64 leads to an error
> on initializing 'char*' variable nul with a 'const char*' value
>
> Signed-off-by: Helge Konetzka <hk@zapateado.de>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
> Compiling with clang++ of msys2 toolchain clang64 leads to
>
> [1445/1747] Compiling C++ object
> qga/vss-win32/qga-vss.dll.p/install.cpp.obj
> FAILED: qga/vss-win32/qga-vss.dll.p/install.cpp.obj
> ...
> qga/vss-win32/install.cpp:49:24: error: cannot initialize a variable of
> type 'char *' with an rvalue of type 'const char *'
>      char *msg =3D NULL, *nul =3D strchr(text, '(');
>                         ^     ~~~~~~~~~~~~~~~~~
> 1 error generated.
> ninja: build stopped: subcommand failed.
> make: *** [Makefile:163: run-ninja] Error 1
> =3D=3D> ERROR: A failure occurred in build().
>      Aborting...
> ---
>   qga/vss-win32/install.cpp | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp
> index 8076efe3cb..b57508fbe0 100644
> --- a/qga/vss-win32/install.cpp
> +++ b/qga/vss-win32/install.cpp
> @@ -46,7 +46,8 @@ void errmsg(DWORD err, const char *text)
>        * If text doesn't contains '(', negative precision is given, which
> is
>        * treated as though it were missing.
>        */
> -    char *msg =3D NULL, *nul =3D strchr(text, '(');
> +    char *msg =3D NULL;
> +    const char *nul =3D strchr(text, '(');
>       int len =3D nul ? nul - text : -1;
>
>       FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER |
> --
> 2.30.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000098c04105da55712f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 16, 2022 at 4:41 PM Helge=
 Konetzka &lt;<a href=3D"mailto:hk@zapateado.de">hk@zapateado.de</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Compiling w=
ith clang++ of msys2 toolchain clang64 leads to an error<br>
on initializing &#39;char*&#39; variable nul with a &#39;const char*&#39; v=
alue<br>
<br>
Signed-off-by: Helge Konetzka &lt;<a href=3D"mailto:hk@zapateado.de" target=
=3D"_blank">hk@zapateado.de</a>&gt;<br></blockquote><div><br></div><div>Rev=
iewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@red=
hat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
Compiling with clang++ of msys2 toolchain clang64 leads to<br>
<br>
[1445/1747] Compiling C++ object qga/vss-win32/qga-vss.dll.p/install.cpp.ob=
j<br>
FAILED: qga/vss-win32/qga-vss.dll.p/install.cpp.obj<br>
...<br>
qga/vss-win32/install.cpp:49:24: error: cannot initialize a variable of <br=
>
type &#39;char *&#39; with an rvalue of type &#39;const char *&#39;<br>
=C2=A0 =C2=A0 =C2=A0char *msg =3D NULL, *nul =3D strchr(text, &#39;(&#39;);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^=C2=A0 =C2=A0 =C2=A0~~~~~~~~~~~~~~~~~<br>
1 error generated.<br>
ninja: build stopped: subcommand failed.<br>
make: *** [Makefile:163: run-ninja] Error 1<br>
=3D=3D&gt; ERROR: A failure occurred in build().<br>
=C2=A0 =C2=A0 =C2=A0Aborting...<br>
---<br>
=C2=A0 qga/vss-win32/install.cpp | 3 ++-<br>
=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp<br>
index 8076efe3cb..b57508fbe0 100644<br>
--- a/qga/vss-win32/install.cpp<br>
+++ b/qga/vss-win32/install.cpp<br>
@@ -46,7 +46,8 @@ void errmsg(DWORD err, const char *text)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0* If text doesn&#39;t contains &#39;(&#39;, nega=
tive precision is given, which is<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0* treated as though it were missing.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 char *msg =3D NULL, *nul =3D strchr(text, &#39;(&#39;);<br>
+=C2=A0 =C2=A0 char *msg =3D NULL;<br>
+=C2=A0 =C2=A0 const char *nul =3D strchr(text, &#39;(&#39;);<br>
=C2=A0 =C2=A0 =C2=A0 int len =3D nul ? nul - text : -1;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER |<br>
-- <br>
2.30.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000098c04105da55712f--

