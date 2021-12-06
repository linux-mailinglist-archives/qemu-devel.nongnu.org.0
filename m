Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDC74691CD
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 09:52:38 +0100 (CET)
Received: from localhost ([::1]:33858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mu9jg-0000vd-Vr
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 03:52:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>)
 id 1mu9hM-0006iM-Q0; Mon, 06 Dec 2021 03:50:14 -0500
Received: from [2607:f8b0:4864:20::92a] (port=38872
 helo=mail-ua1-x92a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>)
 id 1mu9hK-0002db-Fc; Mon, 06 Dec 2021 03:50:12 -0500
Received: by mail-ua1-x92a.google.com with SMTP id w23so18061563uao.5;
 Mon, 06 Dec 2021 00:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uIBm+33khz4qJcB2S1bLN20qZ2ixev1x0wOal4KORmE=;
 b=QWwVM2F6bnMSG55dUZiEiYLbc1bPqjs8vnon/ZoVrS1Y0OyoBodJzeKHTZSZTSvgpH
 AIegTf3gNVYhWi2rMnLYZqvUMzgoA8LhPaUIzjf3+/bxlvWfp5M2wFmmWzJfyOgVFaI4
 h20Txzcd7hjX2MDvRdRP0p6MXUX5sgoWKWJoUJPAGsIgy8Pbk7KoKcxhx29a/LVfcBzv
 u45ca+zApo2aNZhg1o/kQmpeXhO5jX/vH1PxQAckIq+AnjrWvvqVAmMQ4+c6kBs7N0uB
 MYPZemXDqkvl5R3yNaWQFqOjRWRplnqTnjnNjSG4p2xxAcsD3XKJapm9kzENKcL7nR3f
 rlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uIBm+33khz4qJcB2S1bLN20qZ2ixev1x0wOal4KORmE=;
 b=72kGRL4wusig6MkDeUsKhhPp7fZQHZEYP75M1Iy/eqLA2anFzbeEPMFCJdi2wbV5lW
 GfAxx74Tj32Q5+vbfTcN2bmxcExIfmoZKNuXaQDqbF5MrcdQucenbpFHoAGw8UlWHKVa
 09nzm3JnDdMrIy0yg/i0I+RGqaoPvKANhzt079ITV8Q4WTUZJeh352Zr3c7CVrw5JXzV
 fehNly2Lct1J1TF9CY41K/hHODi4Y04DljGwsDM2aQ2bn4+1eJKd1TMTMjNaktaBGUPW
 ZJBOWtNAnbF7baodC+zcceDBonr0Mg2NX+hUUdXcj8h+wiRr1ZPrlF/FqbMkMo3XDEkK
 aOdQ==
X-Gm-Message-State: AOAM531VY2MGuCAzzXdYVQY2tHWyE2oK/Mcobd63iFDMHp/wOn+jsmK6
 F9Mb5z+MCYc6XDhqJ1R4xW09ZygoMsc5G/CvReDZalmWQzo=
X-Google-Smtp-Source: ABdhPJwlWb5slHKskIt2QQkn34IOR+vLKFpniWfsamNlDY38HQe7LH3BhwM7mpB0f0tEZUeQ4dRM+mMB0SMKksAgpqg=
X-Received: by 2002:a67:7247:: with SMTP id n68mr34449051vsc.6.1638780606703; 
 Mon, 06 Dec 2021 00:50:06 -0800 (PST)
MIME-Version: 1.0
References: <20211205224109.322152-1-f4bug@amsat.org>
In-Reply-To: <20211205224109.322152-1-f4bug@amsat.org>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Mon, 6 Dec 2021 10:49:29 +0200
Message-ID: <CAK4993ioRGczZMKbOvmqyVThz+th8-Jx8Koe1qhDFMfcpt1DRw@mail.gmail.com>
Subject: Re: [PATCH] hw/avr: Realize AVRCPU qdev object using qdev_realize()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000ed6d3105d2765729"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=mrolnik@gmail.com; helo=mail-ua1-x92a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ed6d3105d2765729
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Michael Rolnik <mrolnik@gmail.com>

On Mon, Dec 6, 2021 at 12:41 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> TYPE_AVR_CPU inherits TYPE_CPU, which itself inherits TYPE_DEVICE.
> TYPE_DEVICE instances are realized using qdev_realize(), we don't
> need to access QOM internal values.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/avr/atmega.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
> index 0608e2d475e..a34803e6427 100644
> --- a/hw/avr/atmega.c
> +++ b/hw/avr/atmega.c
> @@ -233,7 +233,7 @@ static void atmega_realize(DeviceState *dev, Error
> **errp)
>
>      /* CPU */
>      object_initialize_child(OBJECT(dev), "cpu", &s->cpu, mc->cpu_type);
> -    object_property_set_bool(OBJECT(&s->cpu), "realized", true,
> &error_abort);
> +    qdev_realize(DEVICE(&s->cpu), NULL, &error_abort);
>      cpudev =3D DEVICE(&s->cpu);
>
>      /* SRAM */
> --
> 2.33.1
>
>

--=20
Best Regards,
Michael Rolnik

--000000000000ed6d3105d2765729
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@=
gmail.com">mrolnik@gmail.com</a>&gt;</div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 6, 2021 at 12:41 AM Philipp=
e Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
TYPE_AVR_CPU inherits TYPE_CPU, which itself inherits TYPE_DEVICE.<br>
TYPE_DEVICE instances are realized using qdev_realize(), we don&#39;t<br>
need to access QOM internal values.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0hw/avr/atmega.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c<br>
index 0608e2d475e..a34803e6427 100644<br>
--- a/hw/avr/atmega.c<br>
+++ b/hw/avr/atmega.c<br>
@@ -233,7 +233,7 @@ static void atmega_realize(DeviceState *dev, Error **er=
rp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* CPU */<br>
=C2=A0 =C2=A0 =C2=A0object_initialize_child(OBJECT(dev), &quot;cpu&quot;, &=
amp;s-&gt;cpu, mc-&gt;cpu_type);<br>
-=C2=A0 =C2=A0 object_property_set_bool(OBJECT(&amp;s-&gt;cpu), &quot;reali=
zed&quot;, true, &amp;error_abort);<br>
+=C2=A0 =C2=A0 qdev_realize(DEVICE(&amp;s-&gt;cpu), NULL, &amp;error_abort)=
;<br>
=C2=A0 =C2=A0 =C2=A0cpudev =3D DEVICE(&amp;s-&gt;cpu);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* SRAM */<br>
-- <br>
2.33.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Best Regards,<br>Michael Rolnik</div>

--000000000000ed6d3105d2765729--

