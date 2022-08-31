Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3873D5A7E3F
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 15:06:29 +0200 (CEST)
Received: from localhost ([::1]:43898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTNQJ-0002zM-Ro
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 09:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTNJm-0006dj-Cc
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 08:59:42 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:41756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTNJk-0002Oo-KM
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 08:59:42 -0400
Received: by mail-lj1-x232.google.com with SMTP id q16so14523649ljp.8
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 05:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Cp1XCoEBxEJRrN4PCoSGI6Su2JhEBmOl1VILQYRJdCI=;
 b=eDRBP9yS3s7K2W+BBvbNBH+XpKOBLZIF5R8UzAckmc8yrdTZEFLlKpkkDz/yU+JPw8
 OzKb/cgI+/0alhorwhWX6PqTrWAgsmyq5NPGSpuyhlxSYM1f/aUc8GQWd96gDbsYi+ez
 3Srrtwua6hYXpGo0D/sOg/yF69QSPwGB6v24YWHyGGCrd6WzHqHEkCkK6W1j+3lFvbyU
 6h88w/ShccplrCQbeuqU02LlH4JfSgG9SIUVVhPzP1luSPp5rZZqvSZh+bqVmf+MJIt8
 S0Hkvkjk242Pg5dmcA3vP/s5w3P7PFJ5NcOAUW4cq2BBuprYzfaF/dvcULF30bU/6L5y
 tNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Cp1XCoEBxEJRrN4PCoSGI6Su2JhEBmOl1VILQYRJdCI=;
 b=wRaqA0gF/EA05EZBQAsUlZGrqajmlfQwYsA7Vo4t+5MmNeN5qgh/Sukn+YSAg3mXDH
 QeEvLmTQgloXHFBoBJwd01068DIDYtUT9y1lMBLueMuNb358pNJC4j1JbvGqjSrf71rq
 hH4M5nstjZUbQfRqjc6cz+6q1w2VAhFX6Lzl8U0/aH7+MNhRYlwiYmRgrmEJLYcQVMJX
 CZvp1GmHk1gkFgBBxmBvrwXllmth4TC3ZRxHK8gN6X43yDyfQK7nIQ9Q0WVl4xZCqj+l
 bms75aibr8YPzD9qHIlfmq198MKXshJkzlsfguHYDc4E7ouvDnfU6YKwoPaauHuVajcz
 AdJQ==
X-Gm-Message-State: ACgBeo3kVUdSD3MkNhBc78Eq2DAXexU/N+Gw5B8qSKRvoUnpB0XAomSF
 TFZfj7t0y0YmigjIC1p/U4hmt+bSpdyrLLEk7Cv6zPt5
X-Google-Smtp-Source: AA6agR73gn4wIHGPaEVYzr6qzDACuL6i4g5u/kg3GO7xFfHwPALQTJ8ZJcooQVEchg1WNglUfkkJc1ohZxabKv6oKzY=
X-Received: by 2002:a2e:596:0:b0:264:1a1e:469b with SMTP id
 144-20020a2e0596000000b002641a1e469bmr4695456ljf.463.1661950778841; Wed, 31
 Aug 2022 05:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-5-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-5-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 31 Aug 2022 16:59:27 +0400
Message-ID: <CAJ+F1CKj1uoa7pW1m7iRGUUcsqpDYnN2vmkfAn5xi6ogysMrQA@mail.gmail.com>
Subject: Re: [PATCH 04/51] semihosting/arm-compat-semi: Avoid using hardcoded
 /tmp
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000cea58505e7891131"
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x232.google.com
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

--000000000000cea58505e7891131
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Aug 24, 2022 at 1:54 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> Use g_get_tmp_dir() to get the directory to use for temporary files.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  semihosting/arm-compat-semi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.=
c
> index e741674238..d5e66cc298 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -503,7 +503,8 @@ void do_common_semihosting(CPUState *cs)
>          GET_ARG(0);
>          GET_ARG(1);
>          GET_ARG(2);
> -        len =3D asprintf(&s, "/tmp/qemu-%x%02x", getpid(), (int)arg1 &
> 0xff);
> +        len =3D asprintf(&s, "%s/qemu-%x%02x", g_get_tmp_dir(),
> +                       getpid(), (int)arg1 & 0xff);
>

This is most likely wrong. I am not familiar with semihosting, but I
believe we are implementing tmpnam(), it should return a POSIX filename.


>          if (len < 0) {
>              common_semi_set_ret(cs, -1);
>              break;
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000cea58505e7891131
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 1:54 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin=
 Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.m=
eng@windriver.com</a>&gt;<br>
<br>
Use g_get_tmp_dir() to get the directory to use for temporary files.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
=C2=A0semihosting/arm-compat-semi.c | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c<=
br>
index e741674238..d5e66cc298 100644<br>
--- a/semihosting/arm-compat-semi.c<br>
+++ b/semihosting/arm-compat-semi.c<br>
@@ -503,7 +503,8 @@ void do_common_semihosting(CPUState *cs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GET_ARG(0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GET_ARG(1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GET_ARG(2);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D asprintf(&amp;s, &quot;/tmp/qemu-%x%02=
x&quot;, getpid(), (int)arg1 &amp; 0xff);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D asprintf(&amp;s, &quot;%s/qemu-%x%02x&=
quot;, g_get_tmp_dir(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0getpid(), (int)arg1 &amp; 0xff);<br></blockquote><div><br></div><=
div>This is most likely wrong. I am not familiar with semihosting, but I be=
lieve we are implementing tmpnam(), it should return a POSIX filename.<br><=
/div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (len &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0common_semi_set_ret(cs, -1)=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000cea58505e7891131--

