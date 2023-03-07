Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D74F6ADBE7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:29:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUYc-0002oq-SL; Tue, 07 Mar 2023 05:28:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pZUYa-0002oN-Kk; Tue, 07 Mar 2023 05:28:32 -0500
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pZUYZ-0004DS-8i; Tue, 07 Mar 2023 05:28:32 -0500
Received: by mail-vs1-xe2c.google.com with SMTP id s1so11868573vsk.5;
 Tue, 07 Mar 2023 02:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678184910;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BDtwTbKQCvAJHeAv7N8Oj29+ygLoHMzq/qoha7f/j6E=;
 b=XmWB5l6dNYhcNltf+Kti3IFNexdJfJbPaEHsKecPkkuPrTyZ8gXJJzSeri/qHnA1Ij
 x1dXGoZMxyZ7v6HE3pQ9mPoSIZxEeCPkzb1xc4fzvceszC1DmYmcXsTwHofAWTuLRxLo
 f5CZcrWVtXiqnbfOj+HnMiSDb9vbfjldcwOwKv/qcBVTfTcmNbbHApRJca2zEx5+coz7
 5kUUcfWevabN7aaZnWsj9pj4AMHQ1Oot57ykO858DVflsOh0wUqJLa0GsxEvgrvMESy4
 /OPZP+NO5vOvEp8YT4DU19MFUSfmwoE3/l3ahvT2GB7FJK0w2iaoceey9W38Sz+r0pb9
 /7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678184910;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BDtwTbKQCvAJHeAv7N8Oj29+ygLoHMzq/qoha7f/j6E=;
 b=QgEUBFR5OIrxSZglZmoIR4hlM+y3PaJ28nVWkNqV0ej5Nl+Rf0NPi/IZYHI6mPQJt3
 Wln+hStM2B9S2GOg0Tydo3BCI+ZlKpODVwm3nXaV+4NebmpYhsoRo7NQBh6YGLo+q1hU
 SLM+/ijJoXaAbqICX5KnQhuLhEDGIfDrikVXWqHkI89jpyTjhFMIOkTSf2wXCB7zFYI7
 lQezIrZJWO+4kbaFkEWw7MVGLQIGMj7dlRIJMUj8xHD1kDlpnl0aUlH11r0NAgFHoZOu
 l0dU+nAjFGxUP6JOgTmA+cZAxr8FWWLssaaEmYSgS+uW20EY/K6Ned5XHP+dPtwTLUXG
 gDew==
X-Gm-Message-State: AO0yUKVcK0MjGdAAYos6jLdITzbtN68y3vrm6REPBKdNxdWCLk15LFX+
 FZuI90YMJCYluNd2kozJl6rkSQviUpIOglOk3MM=
X-Google-Smtp-Source: AK7set8Freu/JSFb+e4bBQmkJHm4O/paYXArbiEh3aYotq09XWrhnoyc7EATKsPAr6oiF9V/Y7Kx3wPZuaKv/Y7jKgU=
X-Received: by 2002:a67:fe14:0:b0:412:ba5:8002 with SMTP id
 l20-20020a67fe14000000b004120ba58002mr14542614vsr.1.1678184909830; Tue, 07
 Mar 2023 02:28:29 -0800 (PST)
MIME-Version: 1.0
References: <20230307101913.3585785-1-pkarthikeyan1509@gmail.com>
In-Reply-To: <20230307101913.3585785-1-pkarthikeyan1509@gmail.com>
From: karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
Date: Tue, 7 Mar 2023 15:58:18 +0530
Message-ID: <CA+ezb7hoG0802E=UUxPv0rrdS9N6-y3KToUO9buy3xOOZk+w8A@mail.gmail.com>
Subject: Re: [PATCH v1] Added TMP421 type sensor's support in tiogapass
To: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000006afdae05f64cdf70"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=pkarthikeyan1509@gmail.com; helo=mail-vs1-xe2c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000006afdae05f64cdf70
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Goater,
               please ignore this patch, I have missed something here and
I'll send
one more patch, sorry for the inconvenience.

Regards,
Karthikeyan P


On Tue, Mar 7, 2023 at 3:51=E2=80=AFPM Karthikeyan Pasupathi <
pkarthikeyan1509@gmail.com> wrote:

> Added TMP421 type sensor support in tiogapass platform.
>
> Tested: Tested and verified in tiogapass platform.
>
> Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
> ---
>  hw/arm/aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index e985ce85e5..c1843693fa 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -545,7 +545,7 @@ static void tiogapass_bmc_i2c_init(AspeedMachineState
> *bmc)
>      /* TMP421 */
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "tmp421",
> 0x1f);
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp421",
> 0x4f);
> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp421",
> 0x4e);
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp421",
> 0x4e);
>  }
>
>  static void create_pca9552(AspeedSoCState *soc, int bus_id, int addr)
> --
> 2.34.1
>
>

--0000000000006afdae05f64cdf70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Goater,</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 please ignore this p=
atch, I have missed something here and I&#39;ll send <br></div><div>one mor=
e patch, sorry for the inconvenience.</div><div><br></div><div>Regards,</di=
v><div>Karthikeyan P<br></div><div><br></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 7, 2023 at 3:51=E2=
=80=AFPM Karthikeyan Pasupathi &lt;<a href=3D"mailto:pkarthikeyan1509@gmail=
.com">pkarthikeyan1509@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Added TMP421 type sensor support in tiogap=
ass platform.<br>
<br>
Tested: Tested and verified in tiogapass platform.<br>
<br>
Signed-off-by: Karthikeyan Pasupathi &lt;<a href=3D"mailto:pkarthikeyan1509=
@gmail.com" target=3D"_blank">pkarthikeyan1509@gmail.com</a>&gt;<br>
---<br>
=C2=A0hw/arm/aspeed.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c<br>
index e985ce85e5..c1843693fa 100644<br>
--- a/hw/arm/aspeed.c<br>
+++ b/hw/arm/aspeed.c<br>
@@ -545,7 +545,7 @@ static void tiogapass_bmc_i2c_init(AspeedMachineState *=
bmc)<br>
=C2=A0 =C2=A0 =C2=A0/* TMP421 */<br>
=C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(aspeed_i2c_get_bus(&amp;soc-&gt=
;i2c, 8), &quot;tmp421&quot;, 0x1f);<br>
=C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(aspeed_i2c_get_bus(&amp;soc-&gt=
;i2c, 6), &quot;tmp421&quot;, 0x4f);<br>
-=C2=A0 =C2=A0 i2c_slave_create_simple(aspeed_i2c_get_bus(&amp;soc-&gt;i2c,=
 6), &quot;tmp421&quot;, 0x4e); <br>
+=C2=A0 =C2=A0 i2c_slave_create_simple(aspeed_i2c_get_bus(&amp;soc-&gt;i2c,=
 6), &quot;tmp421&quot;, 0x4e);<br>
=C2=A0}<br>
<br>
=C2=A0static void create_pca9552(AspeedSoCState *soc, int bus_id, int addr)=
<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--0000000000006afdae05f64cdf70--

