Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EF53BDE35
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 21:54:12 +0200 (CEST)
Received: from localhost ([::1]:43216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0r90-0007LR-Qj
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 15:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>)
 id 1m0r7d-0006Ql-U1; Tue, 06 Jul 2021 15:52:45 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:34550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>)
 id 1m0r7c-0006mq-5K; Tue, 06 Jul 2021 15:52:45 -0400
Received: by mail-qk1-x732.google.com with SMTP id g4so21440132qkl.1;
 Tue, 06 Jul 2021 12:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yx6qXRndyM6IhQcG11KPBRzCyVmq3uxLQ9K3a+CywqU=;
 b=H6S0pxdUSVpxoO6e4raZZ3T3U01u0s9kQip3caII2LUuWEjH/6sVeA+ExP7xjGjhUB
 gOrS5xqFiRQCvH/CY2YvJlXmgS9shXKoku4QipdCpP2jlhs5UCSOgJLlj0XycppB+f31
 mlh9AoQJpOsfRu3uspi5A2mmEHcP8mhP3sxny3dIE181NicsA5FSR7mGWU6nRfNQxUyk
 WwVQk9ptqCp+Vn770tP2Ee9mVStW0wQ3ndMMwhHah6sekJ2vtSHEaf6z0jzUgYlQTUvz
 qnswYDMody8/vTiSE2wRHfgaDCeY7dRmSovG0iSrogTnknh2ZM9PunU8X1ZLe6Uk42jQ
 ABsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yx6qXRndyM6IhQcG11KPBRzCyVmq3uxLQ9K3a+CywqU=;
 b=AMCUrs9vgZhTCxLJR38ts4OAAERXDDsjTEjRp21SsLmKnmUd4FWAc6D8OPLADP+mo+
 p5/gLA8VT2juu3oqcbsxiHcwkN4mJxstuhOVGDAx6iaJzKD7MCvWZGfvI138gru5piyE
 6YpduuU2TXLViMl3rSlemhmrlbPBku47sdn7Qsy/I1Hou46jgyhlek2sL7ZLCb9nK19w
 B/hJcFGaZ+Fh6e4yh1nEzqT+A79/GEuQZH7Vzh3LvZjJNnp/+kDtzrYHfxtNIun7pIWP
 zBL2e5jfhyCBqjbe+1KhZEF1bamRp6Eg8fSi+sWdHEWBF6mT6NjHz8AlKP8OV0dym0Fi
 DfRw==
X-Gm-Message-State: AOAM530+KPtyTHEVyeqyPTflIBZ8yK7e+C+IXZWqsbWw0wYau8q/UYL1
 sRjcKWDgUuz9lHOV5LNjI5imolpOexK39nDLBRo=
X-Google-Smtp-Source: ABdhPJwTqC0YIwxLWzUzXu3wWaCOiMujU/sPQJ5muQQu1WZt+dxlupvkLIgeU6P0IC4vEN40iPsaeIh8dinremdZ+2w=
X-Received: by 2002:a37:c51:: with SMTP id 78mr4256059qkm.489.1625601162462;
 Tue, 06 Jul 2021 12:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210706180936.249912-1-sw@weilnetz.de>
In-Reply-To: <20210706180936.249912-1-sw@weilnetz.de>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Tue, 6 Jul 2021 22:52:06 +0300
Message-ID: <CAK4993j2cbgkFrGdVx1wiHhjam45NrGwos=e2w-DhhcEVsDnZA@mail.gmail.com>
Subject: Re: [PATCH] target/avr: Fix compiler errors (-Werror=enum-conversion)
To: Stefan Weil <sw@weilnetz.de>
Content-Type: multipart/alternative; boundary="000000000000d5c9f105c679c3d6"
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=mrolnik@gmail.com; helo=mail-qk1-x732.google.com
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d5c9f105c679c3d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Michael Rolnik <mrolnik@gmail.com>

On Tue, Jul 6, 2021 at 9:09 PM Stefan Weil <sw@weilnetz.de> wrote:

> ../target/avr/translate.c: In function =E2=80=98gen_jmp_ez=E2=80=99:
> ../target/avr/translate.c:1012:22: error: implicit conversion from =E2=80=
=98enum
> <anonymous>=E2=80=99 to =E2=80=98DisasJumpType=E2=80=99 [-Werror=3Denum-c=
onversion]
>  1012 |     ctx->base.is_jmp =3D DISAS_LOOKUP;
>       |                      ^
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> -Werror=3Denum-conversion is not enabled by -Wall, but by -Weverything
> with clang for example.
>
> As other targets use similar define statements, I think that's a simple
> fix.
>
> Regards,
> Stefan
>
>
>  target/avr/translate.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/target/avr/translate.c b/target/avr/translate.c
> index c06ce45bc7..fcc839ac36 100644
> --- a/target/avr/translate.c
> +++ b/target/avr/translate.c
> @@ -70,11 +70,9 @@ static const char reg_names[NUMBER_OF_CPU_REGISTERS][8=
]
> =3D {
>  };
>  #define REG(x) (cpu_r[x])
>
> -enum {
> -    DISAS_EXIT   =3D DISAS_TARGET_0,  /* We want return to the cpu main
> loop.  */
> -    DISAS_LOOKUP =3D DISAS_TARGET_1,  /* We have a variable condition
> exit.  */
> -    DISAS_CHAIN  =3D DISAS_TARGET_2,  /* We have a single condition exit=
.
> */
> -};
> +#define DISAS_EXIT   DISAS_TARGET_0  /* We want return to the cpu main
> loop.  */
> +#define DISAS_LOOKUP DISAS_TARGET_1  /* We have a variable condition
> exit.  */
> +#define DISAS_CHAIN  DISAS_TARGET_2  /* We have a single condition exit.
> */
>
>  typedef struct DisasContext DisasContext;
>
> --
> 2.30.2
>
>

--=20
Best Regards,
Michael Rolnik

--000000000000d5c9f105c679c3d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@=
gmail.com">mrolnik@gmail.com</a>&gt;</div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 6, 2021 at 9:09 PM Stefan W=
eil &lt;<a href=3D"mailto:sw@weilnetz.de">sw@weilnetz.de</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">../target/avr/trans=
late.c: In function =E2=80=98gen_jmp_ez=E2=80=99:<br>
../target/avr/translate.c:1012:22: error: implicit conversion from =E2=80=
=98enum &lt;anonymous&gt;=E2=80=99 to =E2=80=98DisasJumpType=E2=80=99 [-Wer=
ror=3Denum-conversion]<br>
=C2=A01012 |=C2=A0 =C2=A0 =C2=A0ctx-&gt;base.is_jmp =3D DISAS_LOOKUP;<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
<br>
Signed-off-by: Stefan Weil &lt;<a href=3D"mailto:sw@weilnetz.de" target=3D"=
_blank">sw@weilnetz.de</a>&gt;<br>
---<br>
<br>
-Werror=3Denum-conversion is not enabled by -Wall, but by -Weverything<br>
with clang for example.<br>
<br>
As other targets use similar define statements, I think that&#39;s a simple=
 fix.<br>
<br>
Regards,<br>
Stefan<br>
<br>
<br>
=C2=A0target/avr/translate.c | 8 +++-----<br>
=C2=A01 file changed, 3 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/target/avr/translate.c b/target/avr/translate.c<br>
index c06ce45bc7..fcc839ac36 100644<br>
--- a/target/avr/translate.c<br>
+++ b/target/avr/translate.c<br>
@@ -70,11 +70,9 @@ static const char reg_names[NUMBER_OF_CPU_REGISTERS][8] =
=3D {<br>
=C2=A0};<br>
=C2=A0#define REG(x) (cpu_r[x])<br>
<br>
-enum {<br>
-=C2=A0 =C2=A0 DISAS_EXIT=C2=A0 =C2=A0=3D DISAS_TARGET_0,=C2=A0 /* We want =
return to the cpu main loop.=C2=A0 */<br>
-=C2=A0 =C2=A0 DISAS_LOOKUP =3D DISAS_TARGET_1,=C2=A0 /* We have a variable=
 condition exit.=C2=A0 */<br>
-=C2=A0 =C2=A0 DISAS_CHAIN=C2=A0 =3D DISAS_TARGET_2,=C2=A0 /* We have a sin=
gle condition exit.=C2=A0 */<br>
-};<br>
+#define DISAS_EXIT=C2=A0 =C2=A0DISAS_TARGET_0=C2=A0 /* We want return to t=
he cpu main loop.=C2=A0 */<br>
+#define DISAS_LOOKUP DISAS_TARGET_1=C2=A0 /* We have a variable condition =
exit.=C2=A0 */<br>
+#define DISAS_CHAIN=C2=A0 DISAS_TARGET_2=C2=A0 /* We have a single conditi=
on exit.=C2=A0 */<br>
<br>
=C2=A0typedef struct DisasContext DisasContext;<br>
<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Best Regards,<br>Michael Rolnik</div>

--000000000000d5c9f105c679c3d6--

