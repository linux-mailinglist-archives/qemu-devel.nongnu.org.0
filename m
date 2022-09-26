Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0558E5EA78F
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 15:44:25 +0200 (CEST)
Received: from localhost ([::1]:33562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocoPH-0002Kz-RE
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 09:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oco9D-0007VE-6R
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:27:49 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:44703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oco9B-0003pj-29
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:27:46 -0400
Received: by mail-lf1-x130.google.com with SMTP id i26so10809708lfp.11
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=QpFzefgv/COwSFfDyYn/zTOVi+L0qqhIPWcFW+tblF8=;
 b=cxRp1g2Ofgr539lGgWJvYrwpCnhFFPJvtgkUvA1y/j4Q4Do5gG1HqPyDt6vrlme/IX
 DXSEK1GLCZLkuryfRLQi7clZx9s5jccyYq5v7QCb+TH+I+1azcwdxQfvzr758BVR1H4J
 VVvrpEiChHQg6wibUuyC0QhlOzji72LwdL8jJtxyT0EnbYxU4h7k8eRr9dJl07L5adGR
 358BAgBzjHd4e0C+ZG3WIZYDyk8wzyiR2KlcvqUJoplo8MoUxr//XOV6kUPatGfnn/YH
 /flMJG3J7UlUdaFtEH/7fJeRRyQfr7i6vStS4dS78RzthSl5ngFqc5B47svvzEvxzTDN
 CJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=QpFzefgv/COwSFfDyYn/zTOVi+L0qqhIPWcFW+tblF8=;
 b=MnvLi1gdCSImNMe2sfg1rpf5qEr60aaY/m0QegnBp1fodVFWlTKwZU7ystWIm0t8+8
 eGH2SxMouw8g0LuRC0C2gm4oQmP1EYFrJiAdY3Ex55Y7x4mIityUMlbj0G/+1uYszbiD
 z45DVaMrye/1rQxkn6MMAoBEhBk6uvlyD9OytTUwvPVCo0ShabIIrXUmPcm5svpgz4eN
 D9gpljyToqDZmpCwYEBkf03AOSAWlI8s6bTbE4H5c4Sam3rHaoZ2xmaabrle+DvwDfrG
 2UTOerls01wcOLv+krakrPfQTDJOLlLREUg6BruVRismnPs0spOuM0fphbFp2dkSY7eb
 mvWw==
X-Gm-Message-State: ACrzQf1Vo/TYtXfXgT4RAAKqWRpPbHsjO1eEqcOJiQP5IjwWpg90LQAE
 0IU+vA1dDqTL5qy0h8/LWdv1lSs996TMajfkS3s=
X-Google-Smtp-Source: AMsMyM7RrEH2rrgY1IJBspdMSfx4Vr2lgF/fGcLCAnuuD6T6iMKceLHEnuvKD1wgxtsL1WZm7Ck/uuLq5nvn/L0jJGI=
X-Received: by 2002:a05:6512:3d18:b0:498:fafb:229f with SMTP id
 d24-20020a0565123d1800b00498fafb229fmr9760854lfv.356.1664198862146; Mon, 26
 Sep 2022 06:27:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-43-bmeng.cn@gmail.com>
In-Reply-To: <20220925113032.1949844-43-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 26 Sep 2022 17:27:30 +0400
Message-ID: <CAJ+F1CLh=GzJ4gxQ+dEriC2nMzn5nUM-JBdhRpzai-z-RcPmxA@mail.gmail.com>
Subject: Re: [PATCH v3 42/54] chardev/char-file: Add FILE_SHARE_WRITE when
 opening the file for win32
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000003925905e9947e8c"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x130.google.com
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

--00000000000003925905e9947e8c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Sun, Sep 25, 2022 at 4:35 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>
> The combination of GENERIC_WRITE and FILE_SHARE_READ options does not
> allow the same file to be opened again by CreateFile() from another
> QEMU process with the same options when the previous QEMU process
> still holds the file handle opened.
>
> This was triggered by running the test_multifd_tcp_cancel() case on
> Windows, which cancels the migration, and launches another QEMU
> process to migrate with the same file opened for write. Chances are
> that the previous QEMU process does not quit before the new QEMU
> process runs hence the old one still holds the file handle that does
> not allow shared write permission then the new QEMU process will fail.
>
> There is another test case boot-serial-test that triggers the same
> issue. The qtest executable created a serial chardev file to be
> passed to the QEMU executable. The serial file was created by
> g_file_open_tmp(), which internally opens the file with
> FILE_SHARE_WRITE security attribute, and based on [1], there is
> only one case that allows the first call to CreateFile() with
> GENERIC_READ & FILE_SHARE_WRITE, and second call to CreateFile()
> with GENERIC_WRITE & FILE_SHARE_READ. All other combinations
> require FILE_SHARE_WRITE in the second call. But there is no way
> for the second call (in this case the QEMU executable) to know
> what combination was passed to the first call, so we will have to
> add FILE_SHARE_WRITE to the second call.
>
> For both scenarios we should add FILE_SHARE_WRITE in the chardev
> file backend driver. This change also makes the behavior to be
> consistent with the POSIX platforms.
>

It seems to me the tests should be fixed instead. I thought you fixed the
first case. For the second case, why not close the file before starting
qemu? If you have issues, I will take a deeper look.


>
> [1]
> https://docs.microsoft.com/en-us/windows/win32/fileio/creating-and-openin=
g-files
>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> Changes in v3:
> - Add another case "boot-serial-test" to justify the change
>
> Changes in v2:
> - Update commit message to include the use case why we should set
>   FILE_SHARE_WRITE when opening the file for win32
>
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

--00000000000003925905e9947e8c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 25, 2022 at 4:35 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Xuz=
hou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.com" target=3D"_blan=
k">xuzhou.cheng@windriver.com</a>&gt;<br>
<br>
The combination of GENERIC_WRITE and FILE_SHARE_READ options does not<br>
allow the same file to be opened again by CreateFile() from another<br>
QEMU process with the same options when the previous QEMU process<br>
still holds the file handle opened.<br>
<br>
This was triggered by running the test_multifd_tcp_cancel() case on<br>
Windows, which cancels the migration, and launches another QEMU<br>
process to migrate with the same file opened for write. Chances are<br>
that the previous QEMU process does not quit before the new QEMU<br>
process runs hence the old one still holds the file handle that does<br>
not allow shared write permission then the new QEMU process will fail.<br>
<br>
There is another test case boot-serial-test that triggers the same<br>
issue. The qtest executable created a serial chardev file to be<br>
passed to the QEMU executable. The serial file was created by<br>
g_file_open_tmp(), which internally opens the file with<br>
FILE_SHARE_WRITE security attribute, and based on [1], there is<br>
only one case that allows the first call to CreateFile() with<br>
GENERIC_READ &amp; FILE_SHARE_WRITE, and second call to CreateFile()<br>
with GENERIC_WRITE &amp; FILE_SHARE_READ. All other combinations<br>
require FILE_SHARE_WRITE in the second call. But there is no way<br>
for the second call (in this case the QEMU executable) to know<br>
what combination was passed to the first call, so we will have to<br>
add FILE_SHARE_WRITE to the second call.<br>
<br>
For both scenarios we should add FILE_SHARE_WRITE in the chardev<br>
file backend driver. This change also makes the behavior to be<br>
consistent with the POSIX platforms.<br></blockquote><div><br></div><div>It=
 seems to me the tests should be fixed instead. I thought you fixed the fir=
st case. For the second case, why not close the file before starting qemu? =
If you have issues, I will take a deeper look.<br></div><div>=C2=A0<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
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
Changes in v3:<br>
- Add another case &quot;boot-serial-test&quot; to justify the change<br>
<br>
Changes in v2:<br>
- Update commit message to include the use case why we should set<br>
=C2=A0 FILE_SHARE_WRITE when opening the file for win32<br>
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

--00000000000003925905e9947e8c--

