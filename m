Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADCF5EA70A
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 15:24:13 +0200 (CEST)
Received: from localhost ([::1]:52840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oco5k-0003uK-GM
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 09:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oco0K-0006Z2-FR
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:18:37 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:45827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oco0I-0002Sg-H3
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:18:36 -0400
Received: by mail-lj1-x235.google.com with SMTP id c7so7370190ljm.12
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=rKCLYPN1VzqT/ukBe6ibPaK0oYYHEOYr010fTo+bWZk=;
 b=U4/VY/dWV8FMFGJPWFRjXBMY6enZhj09UMhqBcvCLo05R5WhwI6WiL9imfarNwz+5I
 1EDvg8AHdGtTqxAyj+ieHQwlLPnrRenIDdjbTzvdKK1SyKkrQ8Y45rUWytgvGEmFMX8Y
 wFwa4Gf3F2rcl1rTtZ4gRidVQDnMEn+onaz61wyv6gp2+s8V0nZLLvtfNHxgF5/o0VRX
 Tma6NSrsa5Rak9yfgktR72gRxwzbfYregbtsv1WFEFWCUsjvHJwDQuQXAknq72eZu/bA
 4E+qJtdFhgAc5biTEA9/I9n7PZpl/mbmD1++2k/xDTUcua+7kQtwEiWe8tGPUlZqiinD
 xMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=rKCLYPN1VzqT/ukBe6ibPaK0oYYHEOYr010fTo+bWZk=;
 b=qIvAKCC/DaMaDr91BJ4a1OabfFFRGNOHC55ZPiw5d6u0k/ywPa5XyZw/PNy5f8evMF
 v0lqJ7x6hjVYr9UpWoDP3Wccupk6+IyrJjnn9jmq4y3e/zuJADObAgF3o9SnFby699th
 htR5CYsOmHQpAlkpGz9A11OV/6v3+fr0olu2Uh4DQL3PNEjLDHwJDhPuBx5eHonSP+1P
 XaODHuHw4yM3+kth7KuND8xE7fJQEjLT5I+FsjCiOeXgOp66eOpwq9QRnOnn/vCrlhZv
 tXNwBHdzoN8EGO8KTtd4CsxKuz2awJ+YLEHI2bWeOWEB18f1hlTr5LKKXSvNcI8hYARW
 zbEw==
X-Gm-Message-State: ACrzQf281sdMkba59q3PCQn25n68rvk5E+xFXPeMmPQG++EaA3Fl5zjf
 h4zSe94H3M96jDOy68iVx1nuHxHaHpodlJGW7LE=
X-Google-Smtp-Source: AMsMyM7pKbnjZDGdbZcat3THwhWvvKEOTAujNVQgjQJKcM/Kan6bx5XxiG5peTQLvaTQnnSRjJdbtbJTljVibeIrbmY=
X-Received: by 2002:a2e:95cd:0:b0:26c:3bb0:289f with SMTP id
 y13-20020a2e95cd000000b0026c3bb0289fmr7550624ljh.449.1664198312812; Mon, 26
 Sep 2022 06:18:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-16-bmeng.cn@gmail.com>
In-Reply-To: <20220925113032.1949844-16-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 26 Sep 2022 17:18:21 +0400
Message-ID: <CAJ+F1CKHvCZQFgUC=VRisfLPdif3r4h6BxpXQWq4GeZmAorsmA@mail.gmail.com>
Subject: Re: [PATCH v3 15/54] tests/qtest: pflash-cfi02-test: Avoid using
 hardcoded /tmp
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000045648305e9945d69"
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x235.google.com
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

--00000000000045648305e9945d69
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 25, 2022 at 4:04 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> This case was written to use hardcoded /tmp directory for temporary
> files. Update to use g_file_open_tmp() for a portable implementation.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>




> ---
>
> Changes in v3:
> - Split to a separate patch
>
>  tests/qtest/pflash-cfi02-test.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/tests/qtest/pflash-cfi02-test.c
> b/tests/qtest/pflash-cfi02-test.c
> index 7fce614b64..55890b7d95 100644
> --- a/tests/qtest/pflash-cfi02-test.c
> +++ b/tests/qtest/pflash-cfi02-test.c
> @@ -56,7 +56,7 @@ typedef struct {
>      QTestState *qtest;
>  } FlashConfig;
>
> -static char image_path[] =3D "/tmp/qtest.XXXXXX";
> +static char *image_path;
>
>  /*
>   * The pflash implementation allows some parameters to be unspecified. W=
e
> want
> @@ -608,6 +608,7 @@ static void test_cfi_in_autoselect(const void *opaque=
)
>  static void cleanup(void *opaque)
>  {
>      unlink(image_path);
> +    g_free(image_path);
>  }
>
>  /*
> @@ -635,16 +636,17 @@ static const FlashConfig configuration[] =3D {
>
>  int main(int argc, char **argv)
>  {
> -    int fd =3D mkstemp(image_path);
> +    int fd =3D g_file_open_tmp("qtest.XXXXXX", &image_path, NULL);
>      if (fd =3D=3D -1) {
>          g_printerr("Failed to create temporary file %s: %s\n", image_pat=
h,
>                     strerror(errno));
>

You need to update error reporting using GError error argument.

> +        g_free(image_path);
>

No, image_path is likely still uninitialized here.

The easiest is probably to replace the whole block with a
g_assert_no_error(err).

         exit(EXIT_FAILURE);
>      }
>      if (ftruncate(fd, UNIFORM_FLASH_SIZE) < 0) {
>          int error_code =3D errno;
>          close(fd);
> -        unlink(image_path);
> +        cleanup(NULL);
>          g_printerr("Failed to truncate file %s to %u MB: %s\n",
> image_path,
>                     UNIFORM_FLASH_SIZE, strerror(error_code));
>          exit(EXIT_FAILURE);
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000045648305e9945d69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 25, 2022 at 4:04 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin M=
eng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.men=
g@windriver.com</a>&gt;<br>
<br>
This case was written to use hardcoded /tmp directory for temporary<br>
files. Update to use g_file_open_tmp() for a portable implementation.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div><br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
---<br>
<br>
Changes in v3:<br>
- Split to a separate patch<br>
<br>
=C2=A0tests/qtest/pflash-cfi02-test.c | 8 +++++---<br>
=C2=A01 file changed, 5 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/tests/qtest/pflash-cfi02-test.c b/tests/qtest/pflash-cfi02-tes=
t.c<br>
index 7fce614b64..55890b7d95 100644<br>
--- a/tests/qtest/pflash-cfi02-test.c<br>
+++ b/tests/qtest/pflash-cfi02-test.c<br>
@@ -56,7 +56,7 @@ typedef struct {<br>
=C2=A0 =C2=A0 =C2=A0QTestState *qtest;<br>
=C2=A0} FlashConfig;<br>
<br>
-static char image_path[] =3D &quot;/tmp/qtest.XXXXXX&quot;;<br>
+static char *image_path;<br>
<br>
=C2=A0/*<br>
=C2=A0 * The pflash implementation allows some parameters to be unspecified=
. We want<br>
@@ -608,6 +608,7 @@ static void test_cfi_in_autoselect(const void *opaque)<=
br>
=C2=A0static void cleanup(void *opaque)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0unlink(image_path);<br>
+=C2=A0 =C2=A0 g_free(image_path);<br>
=C2=A0}<br>
<br>
=C2=A0/*<br>
@@ -635,16 +636,17 @@ static const FlashConfig configuration[] =3D {<br>
<br>
=C2=A0int main(int argc, char **argv)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 int fd =3D mkstemp(image_path);<br>
+=C2=A0 =C2=A0 int fd =3D g_file_open_tmp(&quot;qtest.XXXXXX&quot;, &amp;im=
age_path, NULL);<br>
=C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_printerr(&quot;Failed to create tempora=
ry file %s: %s\n&quot;, image_path,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strer=
ror(errno));<br></blockquote><div><br></div><div>You need to update error r=
eporting using GError error argument. <br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(image_path);<br></blockquote><div><br><=
/div><div>No, image_path is likely still uninitialized here.</div><div><br>=
</div><div>The easiest is probably to replace the whole block with a g_asse=
rt_no_error(err).<br></div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(EXIT_FAILURE);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (ftruncate(fd, UNIFORM_FLASH_SIZE) &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int error_code =3D errno;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(fd);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 unlink(image_path);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cleanup(NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_printerr(&quot;Failed to truncate file =
%s to %u MB: %s\n&quot;, image_path,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UNIFO=
RM_FLASH_SIZE, strerror(error_code));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(EXIT_FAILURE);<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000045648305e9945d69--

