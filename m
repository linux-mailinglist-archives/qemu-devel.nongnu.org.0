Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EA85B1FA7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 15:52:43 +0200 (CEST)
Received: from localhost ([::1]:34066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWHxS-0002TU-Cg
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 09:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oWHs0-0005Sq-K0
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 09:47:04 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:34651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oWHrv-00069x-96
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 09:47:04 -0400
Received: by mail-lj1-x230.google.com with SMTP id z23so19995703ljk.1
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 06:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=hPSSLwBgi64m1iQT7wmsDomTy2G7dXuexB/R9cVwK18=;
 b=SJk4eq0ryWle4Pg5pBjMiNS/Ga3JW5olE9NPECtx057QpsW5Q+19LEdVvxI13ICea1
 jfXMBz3onYZUXN2/nikOmNjSNokKq33LFLFlZr3wxoAIcU2fKoVmYGWdlJtrEKvBBKXO
 cnvWfXBaQaKRssIsPe2W6TxNBWqwX21Y0YwCAAjArTxiUGEUj4aNWc4XHcmyaYACvXyx
 5v5PGZ79cM8FVSJeS8J8VlxBTT7SY8DLFuiBf7HDa0g3lwJfjTGaI0fT8oEC3VobRBiK
 jKHd5AE3OnvCwePdywG3DJkdJSaWLgztG+ZthWuCLE406N2C2Z8d0PLszlLRgAScQ+jg
 PtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=hPSSLwBgi64m1iQT7wmsDomTy2G7dXuexB/R9cVwK18=;
 b=5L7C6rTWX4XW7xORhNpWYAariKVoOvnhUcG1LLvogbl5EMe9aSQMMIWCUUVF0iNFz0
 vEUL5jxCUj662jKL1h0xmL8zkKDJdHVH/sLCTIHDmk+DkoiAHf80fXuMjVcPTRYgboav
 PtfLPHE1YUz3MzoVJ4mwp4UAWPt/ToVxb3Hmh7GXomoUfF9xuKq/gFIF31Cq5BsqWG3X
 t/rINtK0v9Qzy1eIAVGyBbf2B24phcFcGsrXM6lBRhKmMtBkVDNkyood2vCbkZn/ATx0
 b+DgfxgtbNGafDqS7y1F9MekWv5Qgr1lvJfcw4xsf+gsKlKTV6CIENKe9YS8vBaSocck
 WjdQ==
X-Gm-Message-State: ACgBeo0LnSTtWd1bffCkB5V3XzyYvKeEAm7dwfL46suQVSyuHOehsOdp
 z1WbZPpDmIexLW/Vqu3GBDfkPsub4Fhk+RROA88=
X-Google-Smtp-Source: AA6agR49ISc8NxbPpZBe8sBiNO0qYy39e9B8WTVMzRM9E/wTE/7SdVyxNYT4TjimK7JWWVRHKORfJV95nT3Qt25tfng=
X-Received: by 2002:a05:651c:451:b0:263:7cfc:1c0b with SMTP id
 g17-20020a05651c045100b002637cfc1c0bmr2436928ljg.94.1662644817356; Thu, 08
 Sep 2022 06:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-3-bmeng.cn@gmail.com>
In-Reply-To: <20220908132817.1831008-3-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 8 Sep 2022 17:46:45 +0400
Message-ID: <CAJ+F1C+K3d97Dt_KE=p+e1jBfoeXoqohsLsVVA-bHv8U1BG_jg@mail.gmail.com>
Subject: Re: [PATCH 2/7] scripts/nsis.py: Fix destination directory name when
 invoked on Windows
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b9ec5305e82aa9cd"
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

--000000000000b9ec5305e82aa9cd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 8, 2022 at 5:30 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> "make installer" on Windows fails with the following message:
>
>   Traceback (most recent call last):
>     File "G:\msys64\home\foo\git\qemu\scripts\nsis.py", line 89, in
> <module>
>       main()
>     File "G:\msys64\home\foo\git\qemu\scripts\nsis.py", line 34, in main
>       with open(
>   OSError: [Errno 22] Invalid argument:
>   'R:/Temp/tmpw83xhjquG:/msys64/qemu/system-emulations.nsh'
>   ninja: build stopped: subcommand failed.
>
> Use os.path.splitdrive() to form a canonical path without the drive
> letter on Windows. This works with cross-build on Linux too.
>
> Fixes: 8adfeba953e0 ("meson: add NSIS building")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
>  scripts/nsis.py | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/nsis.py b/scripts/nsis.py
> index bbb41d9386..baa6ef9594 100644
> --- a/scripts/nsis.py
> +++ b/scripts/nsis.py
> @@ -28,16 +28,18 @@ def main():
>      parser.add_argument("nsisargs", nargs=3D"*")
>      args =3D parser.parse_args()
>
> +    # canonicalize the Windows native prefix path
> +    prefix =3D os.path.splitdrive(args.prefix)[1]
>      destdir =3D tempfile.mkdtemp()
>      try:
>          subprocess.run(["make", "install", "DESTDIR=3D" + destdir])
>          with open(
> -            os.path.join(destdir + args.prefix, "system-emulations.nsh")=
,
> "w"
> +            os.path.join(destdir + prefix, "system-emulations.nsh"), "w"
>          ) as nsh, open(
> -            os.path.join(destdir + args.prefix, "system-mui-text.nsh"),
> "w"
> +            os.path.join(destdir + prefix, "system-mui-text.nsh"), "w"
>          ) as muinsh:
>              for exe in sorted(glob.glob(
> -                os.path.join(destdir + args.prefix, "qemu-system-*.exe")
> +                os.path.join(destdir + prefix, "qemu-system-*.exe")
>              )):
>                  exe =3D os.path.basename(exe)
>                  arch =3D exe[12:-4]
> @@ -61,7 +63,7 @@ def main():
>                  !insertmacro MUI_DESCRIPTION_TEXT ${{Section_{0}}} "{1}"
>                  """.format(arch, desc))
>
> -        for exe in glob.glob(os.path.join(destdir + args.prefix,
> "*.exe")):
> +        for exe in glob.glob(os.path.join(destdir + prefix, "*.exe")):
>              signcode(exe)
>
>          makensis =3D [
> @@ -69,7 +71,7 @@ def main():
>              "-V2",
>              "-NOCD",
>              "-DSRCDIR=3D" + args.srcdir,
> -            "-DBINDIR=3D" + destdir + args.prefix,
> +            "-DBINDIR=3D" + destdir + prefix,
>          ]
>          dlldir =3D "w32"
>          if args.cpu =3D=3D "x86_64":
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000b9ec5305e82aa9cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 8, 2022 at 5:30 PM Bin Me=
ng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin Me=
ng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.meng=
@windriver.com</a>&gt;<br>
<br>
&quot;make installer&quot; on Windows fails with the following message:<br>
<br>
=C2=A0 Traceback (most recent call last):<br>
=C2=A0 =C2=A0 File &quot;G:\msys64\home\foo\git\qemu\scripts\nsis.py&quot;,=
 line 89, in &lt;module&gt;<br>
=C2=A0 =C2=A0 =C2=A0 main()<br>
=C2=A0 =C2=A0 File &quot;G:\msys64\home\foo\git\qemu\scripts\nsis.py&quot;,=
 line 34, in main<br>
=C2=A0 =C2=A0 =C2=A0 with open(<br>
=C2=A0 OSError: [Errno 22] Invalid argument:<br>
=C2=A0 &#39;R:/Temp/tmpw83xhjquG:/msys64/qemu/system-emulations.nsh&#39;<br=
>
=C2=A0 ninja: build stopped: subcommand failed.<br>
<br>
Use os.path.splitdrive() to form a canonical path without the drive<br>
letter on Windows. This works with cross-build on Linux too.<br>
<br>
Fixes: 8adfeba953e0 (&quot;meson: add NSIS building&quot;)<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
=C2=A0scripts/nsis.py | 12 +++++++-----<br>
=C2=A01 file changed, 7 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/scripts/nsis.py b/scripts/nsis.py<br>
index bbb41d9386..baa6ef9594 100644<br>
--- a/scripts/nsis.py<br>
+++ b/scripts/nsis.py<br>
@@ -28,16 +28,18 @@ def main():<br>
=C2=A0 =C2=A0 =C2=A0parser.add_argument(&quot;nsisargs&quot;, nargs=3D&quot=
;*&quot;)<br>
=C2=A0 =C2=A0 =C2=A0args =3D parser.parse_args()<br>
<br>
+=C2=A0 =C2=A0 # canonicalize the Windows native prefix path<br>
+=C2=A0 =C2=A0 prefix =3D os.path.splitdrive(args.prefix)[1]<br>
=C2=A0 =C2=A0 =C2=A0destdir =3D tempfile.mkdtemp()<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subprocess.run([&quot;make&quot;, &quot;i=
nstall&quot;, &quot;DESTDIR=3D&quot; + destdir])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.path.join(destdir + args.pref=
ix, &quot;system-emulations.nsh&quot;), &quot;w&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.path.join(destdir + prefix, &=
quot;system-emulations.nsh&quot;), &quot;w&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0) as nsh, open(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.path.join(destdir + args.pref=
ix, &quot;system-mui-text.nsh&quot;), &quot;w&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.path.join(destdir + prefix, &=
quot;system-mui-text.nsh&quot;), &quot;w&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0) as muinsh:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for exe in sorted(glob.glob=
(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.path.join(destd=
ir + args.prefix, &quot;qemu-system-*.exe&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.path.join(destd=
ir + prefix, &quot;qemu-system-*.exe&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exe =3D os.pa=
th.basename(exe)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arch =3D exe[=
12:-4]<br>
@@ -61,7 +63,7 @@ def main():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!insertmacro =
MUI_DESCRIPTION_TEXT ${{Section_{0}}} &quot;{1}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&=
quot;.format(arch, desc))<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for exe in glob.glob(os.path.join(destdir + ar=
gs.prefix, &quot;*.exe&quot;)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for exe in glob.glob(os.path.join(destdir + pr=
efix, &quot;*.exe&quot;)):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0signcode(exe)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0makensis =3D [<br>
@@ -69,7 +71,7 @@ def main():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-V2&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-NOCD&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-DSRCDIR=3D&quot; + a=
rgs.srcdir,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-DBINDIR=3D&quot; + destdi=
r + args.prefix,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-DBINDIR=3D&quot; + destdi=
r + prefix,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlldir =3D &quot;w32&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if args.cpu =3D=3D &quot;x86_64&quot;:<br=
>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000b9ec5305e82aa9cd--

