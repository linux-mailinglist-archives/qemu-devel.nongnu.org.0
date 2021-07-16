Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E9F3CB40C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 10:21:45 +0200 (CEST)
Received: from localhost ([::1]:43270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4J6O-0003MV-4u
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 04:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m4J5C-0002gd-K7
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:20:30 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:40846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m4J5B-00086v-42
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:20:30 -0400
Received: by mail-ed1-x533.google.com with SMTP id t3so11846252edc.7
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 01:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=erUuM6C9kFNdW8UywqTw7mGxsK4rDk+Y6uSbHLHwuR0=;
 b=ICgXKyPOMILyjIPqCdetxB/S1g4sHxH3g5S+CKjKtPNhkZV0anc0MqCj6Q/uDntV27
 xbpCVLeKRPw2YofxHUIKv3nJocgzGwqhKHx5E7rFEkwS6ajw2thkubTQAeo84UL0vJ2T
 hp904TB0RntIvrWMHpJ7DowP6NACYDrSaiSRJtHgh7NXT0yh3/80DgQ/NR0r50/qs6rq
 dpy2Vr9kMBvCatFyAAuRrNLw14RwI9spe9ycHBGo+i8plPnsSkDoK4YIhMiELgReNqX8
 dy32BpXy422Q5PpVu6H49v4K5rQApDfuHwBZUiCMBsO2Sf00RbyTr+4W4JkhkNijwJt9
 lUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=erUuM6C9kFNdW8UywqTw7mGxsK4rDk+Y6uSbHLHwuR0=;
 b=HLAnm+CUZG9RRXWTFrp6yKajRc/fwMASl/KhaE8vqDPsLJSyiuKj0nWVp0DxBh0tJ4
 0IUOrwwhb7m1SLE2zoyXh4+MkWYl9go7wcQ86LusfbmNm6IQRmICGFkgg/rcvfX4URVp
 MC5zmrIEGgRfuvg+nO7mhoqFcHb24WtKhE9y0S42et4fA9Og59xMf9HBcI9BTt5TpYsF
 CKIVve0Bl7tKjFoiWVDrtCfyoq8nPRxV9wNO3x32SB7wcxKcoE8lzUYhxPXWwBRmXQGM
 MaCYDDlPCoGVjek8log821duZg5y3k9WOLpbZyDnqfYxLOczH9RPEKqSOLm+Vck0dB1q
 fAGg==
X-Gm-Message-State: AOAM5327nuWFKvpJK2K/l50anzlOwV6lO9/T5KH6MFSPM1GHsOevQaNL
 p5lAsZ8yGH5xFeC4VrKM+D4SRXJAPC2X02T7F+A=
X-Google-Smtp-Source: ABdhPJwhlWGUYDObPGuEJHXBVS/FUoBt63a9ycgEwwmst3OWxS51e55I/UpSsJ/kCaWLgNFVmNPaHLPvkp8+6rIBgwI=
X-Received: by 2002:a50:cc91:: with SMTP id q17mr13143757edi.237.1626423626741; 
 Fri, 16 Jul 2021 01:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210714055646.85952-1-akihiko.odaki@gmail.com>
In-Reply-To: <20210714055646.85952-1-akihiko.odaki@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 16 Jul 2021 12:20:14 +0400
Message-ID: <CAJ+F1CKxGyrVNwWyNWVDDASswSeBUJh9V84C=3eCCABaXYepOw@mail.gmail.com>
Subject: Re: [PATCH] ui/egl-headless: Remove a check for CONFIG_OPENGL
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000086bb2e05c739427e"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: QEMU <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000086bb2e05c739427e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 14, 2021 at 9:57 AM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> ui/egl-headless is only built when CONFIG_OPENGL is defined because it
> depends on CONFIG_OPENGL without condition. Remove a redundant
> conditonal in ui/egl-headless.c
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  ui/egl-headless.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/ui/egl-headless.c b/ui/egl-headless.c
> index 75404e0e870..a26a2520c49 100644
> --- a/ui/egl-headless.c
> +++ b/ui/egl-headless.c
> @@ -214,6 +214,4 @@ static void register_egl(void)
>
>  type_init(register_egl);
>
> -#ifdef CONFIG_OPENGL
>  module_dep("ui-opengl");
> -#endif
> --
> 2.30.1 (Apple Git-130)
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000086bb2e05c739427e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 14, 2021 at 9:57 AM Akihi=
ko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">akihiko.odaki@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">ui/egl-headless is only built when CONFIG_OPENGL is defined because it<=
br>
depends on CONFIG_OPENGL without condition. Remove a redundant<br>
conditonal in ui/egl-headless.c<br>
<br>
Signed-off-by: Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com"=
 target=3D"_blank">akihiko.odaki@gmail.com</a>&gt;<br></blockquote><div><br=
></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marca=
ndre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div> <br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0ui/egl-headless.c | 2 --<br>
=C2=A01 file changed, 2 deletions(-)<br>
<br>
diff --git a/ui/egl-headless.c b/ui/egl-headless.c<br>
index 75404e0e870..a26a2520c49 100644<br>
--- a/ui/egl-headless.c<br>
+++ b/ui/egl-headless.c<br>
@@ -214,6 +214,4 @@ static void register_egl(void)<br>
<br>
=C2=A0type_init(register_egl);<br>
<br>
-#ifdef CONFIG_OPENGL<br>
=C2=A0module_dep(&quot;ui-opengl&quot;);<br>
-#endif<br>
-- <br>
2.30.1 (Apple Git-130)<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000086bb2e05c739427e--

