Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C68FC5E6CD6
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 22:12:22 +0200 (CEST)
Received: from localhost ([::1]:46008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obSYX-0004sx-Tg
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 16:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obSVo-0001yN-KQ
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 16:09:34 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:41735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obSVm-0006YZ-JF
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 16:09:32 -0400
Received: by mail-lf1-x129.google.com with SMTP id u18so16471329lfo.8
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 13:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=BxwSpTo5Y95/aKiAsKabGc7hOCjP62H1G7FLAF0XkJA=;
 b=d/74yVGqGg/Mzkr0BPMDqGv/HPovpZVWMiUVwbxM39Hd3jQob3wvHfW/lf805MtSkX
 Iz8FdTcODGER3wH+8EumcNhAjaBh4hxLCllzx8HDJJwou7NeI40t5CAGtUDktCXffVB4
 VGOK2fQfpsi7VW0dRelPPJuHJHp0UZ25Zku/dWXTBnvmFa6lJ40/Qv6ZARxefDa8g9un
 JELcocqO/co2YDrZ7fEZcNJy5TBRk7J8TJiMNb/NRDLdDEW2h1lmd/uVLAPRD2UktjT1
 itC5lPYihRvHK5oSLyetwLH0AysH+I8m3VwBiHl9U5ITJoZ3K4JNM+QUYMXlkrKsb3ru
 4w9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=BxwSpTo5Y95/aKiAsKabGc7hOCjP62H1G7FLAF0XkJA=;
 b=LcVXJLk7TsyM8V504tkb7NhARVoGiA9JYY1i5nnF3k/a2fhJ527yaQZ57wQIvBd8tR
 j9mb/s9NlqRy+eM23YYB6ywu57X9/xhJuq6z6GLqVOjW5b4Z3SYYZKRe7b4x/0m1dJwv
 sfU2TE7P7Aw9pJrBj83Zn3YPj5SJJRBDhyyXcVVBqsuX3FQbPIO6sKc/Ei2nBJWYX+fY
 JnDPj1zH/mjn/AvpMNZ/ttT63HvrnHfErNVunrG6bT3aESmRqudWPRG7XrblrMEJRFFN
 IZZOVdf50Z4YM0CYrK0/uMRSJovPftUkqsjNNcciWBfpvVlfgWCZiK5MIEq4ZOuyn2QJ
 9JJw==
X-Gm-Message-State: ACrzQf3pUzc8EhFPTx2jXYWWQY3MPtQs1gxcpEuNw2sU1qRZlWJVgdiQ
 xqXh2WrNAUHEdqzuj7LJYInD33OOe6GBsUsPwCs=
X-Google-Smtp-Source: AMsMyM6gg7OHdtfC3i33h7gOQxBul5P5PY5AGPMRpYJ5oJ+RNCmbzl1Q+KSQuMxmevG6Ftcw+pE4Vd9nbh8i/Tp+PS0=
X-Received: by 2002:a05:6512:3e10:b0:498:f317:e57e with SMTP id
 i16-20020a0565123e1000b00498f317e57emr2007523lfv.328.1663877368000; Thu, 22
 Sep 2022 13:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-26-bmeng.cn@gmail.com>
In-Reply-To: <20220920103159.1865256-26-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 22 Sep 2022 22:09:16 +0200
Message-ID: <CAJ+F1C+oUW0Cj4BxH_HecV=b+ZA_LtOZDULWQYd4rHjwE_29eg@mail.gmail.com>
Subject: Re: [PATCH v2 25/39] chardev/char-file: Add FILE_SHARE_WRITE when
 openning the file for win32
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000078365005e949a328"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--00000000000078365005e949a328
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Sep 20, 2022 at 2:33 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>
> The combination of GENERIC_WRITE and FILE_SHARE_READ options does
> not allow the same file to be opened again by CreateFile() from
> another QEMU process with the same options when the previous QEMU
> process still holds the file handle opened.
>
> This was triggered by running the test_multifd_tcp_cancel() case on
> Windows, which cancels the migration, and launches another QEMU
> process to migrate with the same file opened for write. Chances are
> that the previous QEMU process does not quit before the new QEMU
> process runs hence the old one still holds the file handle that does
> not allow shared write permission then the new QEMU process will fail.
>
> As per [1] we should add FILE_SHARE_WRITE to the share mode to allow
> such use case. This change makes the behavior be consistent with the
> POSIX platforms.
>
> [1]
> https://docs.microsoft.com/en-us/windows/win32/fileio/creating-and-openin=
g-files
>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> Changes in v2:
> - Update commit message to include the use case why we should set
>   FILE_SHARE_WRITE when openning the file for win32
>

As discussed in v1, I would rather leave that patch out of this series,
since the visible issue is solved differently elsewhere.

Also, I disagree with the approach to make windows behaviour consistent
with posix here, since I consider the windows behaviour (exclusive write
access) superior. I would rather teach the posix implementation about
exclusive write access.


>  chardev/char-file.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/chardev/char-file.c b/chardev/char-file.c
> index 2fd80707e5..66385211eb 100644
> --- a/chardev/char-file.c
> +++ b/chardev/char-file.c
> @@ -60,8 +60,8 @@ static void qmp_chardev_open_file(Chardev *chr,
>          flags =3D CREATE_ALWAYS;
>      }
>
> -    out =3D CreateFile(file->out, accessmode, FILE_SHARE_READ, NULL, fla=
gs,
> -                     FILE_ATTRIBUTE_NORMAL, NULL);
> +    out =3D CreateFile(file->out, accessmode, FILE_SHARE_READ |
> FILE_SHARE_WRITE,
> +                     NULL, flags, FILE_ATTRIBUTE_NORMAL, NULL);
>      if (out =3D=3D INVALID_HANDLE_VALUE) {
>          error_setg(errp, "open %s failed", file->out);
>          return;
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000078365005e949a328
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 20, 2022 at 2:33 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Xuz=
hou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.com" target=3D"_blan=
k">xuzhou.cheng@windriver.com</a>&gt;<br>
<br>
The combination of GENERIC_WRITE and FILE_SHARE_READ options does<br>
not allow the same file to be opened again by CreateFile() from<br>
another QEMU process with the same options when the previous QEMU<br>
process still holds the file handle opened.<br>
<br>
This was triggered by running the test_multifd_tcp_cancel() case on<br>
Windows, which cancels the migration, and launches another QEMU<br>
process to migrate with the same file opened for write. Chances are<br>
that the previous QEMU process does not quit before the new QEMU<br>
process runs hence the old one still holds the file handle that does<br>
not allow shared write permission then the new QEMU process will fail.<br>
<br>
As per [1] we should add FILE_SHARE_WRITE to the share mode to allow<br>
such use case. This change makes the behavior be consistent with the<br>
POSIX platforms.<br>
<br>
[1] <a href=3D"https://docs.microsoft.com/en-us/windows/win32/fileio/creati=
ng-and-opening-files" rel=3D"noreferrer" target=3D"_blank">https://docs.mic=
rosoft.com/en-us/windows/win32/fileio/creating-and-opening-files</a><br>
<br>
Signed-off-by: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.co=
m" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
Changes in v2:<br>
- Update commit message to include the use case why we should set<br>
=C2=A0 FILE_SHARE_WRITE when openning the file for win32<br></blockquote><d=
iv><br></div><div>As discussed in v1, I would rather leave that patch out o=
f this series, since the visible issue is solved differently elsewhere.</di=
v><div><br></div><div>Also, I disagree with the approach to make windows be=
haviour consistent with posix here, since I consider the windows behaviour =
(exclusive write access) superior. I would rather teach the posix implement=
ation about exclusive write access.<br></div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0chardev/char-file.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/chardev/char-file.c b/chardev/char-file.c<br>
index 2fd80707e5..66385211eb 100644<br>
--- a/chardev/char-file.c<br>
+++ b/chardev/char-file.c<br>
@@ -60,8 +60,8 @@ static void qmp_chardev_open_file(Chardev *chr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags =3D CREATE_ALWAYS;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 out =3D CreateFile(file-&gt;out, accessmode, FILE_SHARE_READ=
, NULL, flags,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0FILE_ATTRIBUTE_NORMAL, NULL);<br>
+=C2=A0 =C2=A0 out =3D CreateFile(file-&gt;out, accessmode, FILE_SHARE_READ=
 | FILE_SHARE_WRITE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0NULL, flags, FILE_ATTRIBUTE_NORMAL, NULL);<br>
=C2=A0 =C2=A0 =C2=A0if (out =3D=3D INVALID_HANDLE_VALUE) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;open %s failed&quo=
t;, file-&gt;out);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000078365005e949a328--

