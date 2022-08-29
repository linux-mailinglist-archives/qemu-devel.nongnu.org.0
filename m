Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B285A4AC0
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 13:53:24 +0200 (CEST)
Received: from localhost ([::1]:35394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSdKV-0005PX-I7
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 07:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oSdID-00034G-Km
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 07:51:01 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:34426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oSdIB-0006Hg-U9
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 07:51:01 -0400
Received: by mail-lf1-x133.google.com with SMTP id bt10so10795688lfb.1
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 04:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=obAJ0l0R6VLYo/uybs/RMZ5KFR79VAfO2+nPkUiHF+M=;
 b=XtHaoUsebYoIIysDxvCRyCHpC5O0d7nL+5sB2PHlD9isYcOiBJUGW8r9DP4NvByXOo
 FHFrZjNd6Pa2hOTlMLtRo3CQ/KCpjAKhlN+V/764SM4xk1U+d+PNZ16Gc5EkVfuVymb0
 I2rYobC/vmsFUWnPA5A0TMTlb/7M95ihOzVOCqWRbs996eQvZU7AGsOtFPTJ2TWXM8Wa
 wlEnxKZ0g1ZRtCwXjGJpVQnYKOn1pCvBr1xncoDMPS75EKBFuUHuWyPgkDi0YiL5IUdx
 YPMJB03NHOtspD42dfwvW6kGaFjJiWLs+j7vroF5BmErolyN72DtoBtVsW06NgtzD53E
 m7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=obAJ0l0R6VLYo/uybs/RMZ5KFR79VAfO2+nPkUiHF+M=;
 b=4PFDYxU3vbJGaNRw/NtgI2E0QRbcZFWMvAPH5VLL+EgiNfEarh9qeriswDyJfXRcea
 2p3Xlh3EWH1b7TEmGsBdeMmaaBWmCiyAgSQXM1aDNRGbSQUxbiQ2H0JLyYQME6QzvbaS
 8UO6bH9GERh0hxZiypJ4NOADKtieLpN9EHLwoO0U3/1ueQ2cQ9jw2tDNz/CJ0RYnciIy
 QCv3bGTTyj+6nOGHgZxZBqfX0nDwWEoXxKRbFjU4YuQ43veW3FsECXbdmWAeRBwTwxqs
 Eob2A+/BbhmT4SJRG5QkHX3ozFOO1iVdyV12jdTK+pDkPxd586bVgmiwQL5SlgsUCu+j
 bGYQ==
X-Gm-Message-State: ACgBeo3TKHraLKDvsRKNAGz8z6+pv0nAtzVaAct1TcV8o+A0mwASOtUO
 3NsJD2QNUciL0J3o6W11ZyTL/c/o+Sf90ulSems=
X-Google-Smtp-Source: AA6agR5VhSVxV5VhP+DOLSscMO8Qh3VmkOjHephVvXgJAptZfmYkR5/GKqk4y95SJ8lG/3NGaaMWT3wNia4vuNcZG9A=
X-Received: by 2002:a05:6512:2306:b0:48b:2905:21a8 with SMTP id
 o6-20020a056512230600b0048b290521a8mr6833793lfu.167.1661773857985; Mon, 29
 Aug 2022 04:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220829083301.143527-1-akihiko.odaki@daynix.com>
In-Reply-To: <20220829083301.143527-1-akihiko.odaki@daynix.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 29 Aug 2022 15:50:46 +0400
Message-ID: <CAJ+F1CKs84f2XFyVZOZDsUVJeJKf+UReLsPLXJMsqXcmowKhMw@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest/ac97-test: Correct reference to driver
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
Content-Type: multipart/alternative; boundary="00000000000080989405e75fe09d"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x133.google.com
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

--00000000000080989405e75fe09d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 29, 2022 at 12:38 PM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>


Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  tests/qtest/ac97-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/qtest/ac97-test.c b/tests/qtest/ac97-test.c
> index b084e31bff..74103efdfa 100644
> --- a/tests/qtest/ac97-test.c
> +++ b/tests/qtest/ac97-test.c
> @@ -28,7 +28,7 @@ static void *ac97_get_driver(void *obj, const char
> *interface)
>          return &ac97->dev;
>      }
>
> -    fprintf(stderr, "%s not present in e1000e\n", interface);
> +    fprintf(stderr, "%s not present in ac97\n", interface);
>      g_assert_not_reached();
>  }
>
> --
> 2.37.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000080989405e75fe09d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 29, 2022 at 12:38 PM Akih=
iko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">akihiko.odaki@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Signed-off-by: Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@dayni=
x.com" target=3D"_blank">akihiko.odaki@daynix.com</a>&gt;</blockquote><div>=
<br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:ma=
rcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0tests/qtest/ac97-test.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/tests/qtest/ac97-test.c b/tests/qtest/ac97-test.c<br>
index b084e31bff..74103efdfa 100644<br>
--- a/tests/qtest/ac97-test.c<br>
+++ b/tests/qtest/ac97-test.c<br>
@@ -28,7 +28,7 @@ static void *ac97_get_driver(void *obj, const char *inter=
face)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &amp;ac97-&gt;dev;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 fprintf(stderr, &quot;%s not present in e1000e\n&quot;, inte=
rface);<br>
+=C2=A0 =C2=A0 fprintf(stderr, &quot;%s not present in ac97\n&quot;, interf=
ace);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_not_reached();<br>
=C2=A0}<br>
<br>
-- <br>
2.37.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000080989405e75fe09d--

