Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D3011F65C
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Dec 2019 06:44:14 +0100 (CET)
Received: from localhost ([::1]:36324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igMhR-0002D4-M4
	for lists+qemu-devel@lfdr.de; Sun, 15 Dec 2019 00:44:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39349)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1igMgC-0001Si-Ev
 for qemu-devel@nongnu.org; Sun, 15 Dec 2019 00:42:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1igMgB-00022W-4f
 for qemu-devel@nongnu.org; Sun, 15 Dec 2019 00:42:56 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33084
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1igMgB-000226-0I
 for qemu-devel@nongnu.org; Sun, 15 Dec 2019 00:42:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576388574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w0iguMPjCokhk/BvXOjAERKF2ncfLyt4ZTfeIaCQ0W4=;
 b=Z6WHux6fWX8u+/Fw0s3vAxqKEeKqk+6lbmMFt2m/aivuNo4cOGuBWbUbHZQYfKcUrGZynw
 HLhJQELiSkuF6OvX5oV/8KjwkMbIUPBTGCt8VPmAjYC5F312dAYz4/cbulfs0RShRout2R
 UoD998ap9TSSC7p5ZH8QLkCwBYcONSU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-X093CnSLP0ufra1vztVVIg-1; Sun, 15 Dec 2019 00:42:53 -0500
Received: by mail-wr1-f72.google.com with SMTP id f10so1824717wro.14
 for <qemu-devel@nongnu.org>; Sat, 14 Dec 2019 21:42:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BBVF+N2UHHpH8XDGBlGPZ8YLFBLf9UkQTyU2RhxBcDk=;
 b=Fpk19NLBrb3LZfddkbz/1a3dvDfrSNBkzsRTB5c1XtdnWXYYhhiKM6RZYFlmWUQB0A
 vXvwHLo/eLX0pdSJ9EIVn7vJINeoJeqvB13gjb2My/P6j2fffWqYfMp2/lq3Y9VQzcMU
 gsdarxdx9Oorhk4gbkzfWGXz22MRtJlCj+dF3QPk06VgjTRxyzAJmNw6VwHhFuRUVDPA
 tZH1VYQN6om/rWYH7qfekbSm/Cr0bg0qaeUlgB+VHAY0K+QxaLHJAMKbyPVjzN1nMRFf
 H9kqukCk8WNfqKNYg7wdFUzZrgHBahte7FgPsgDKqUa75Rob8/PI9Onb9OxSPmDxED7B
 Uvpg==
X-Gm-Message-State: APjAAAUTA63K1awLwFfokQK6EiTY/r4Vz+CdaAgjFE3XESXkDuk15Zlp
 8p6mvbqrQiSN4MWPMjQKE5gSubJ0WBuqpdlyaC7P4h91sUzNyhYSjKsFgzuUaPff6oUlmSF81gX
 3FI2g54p58mYHyDw=
X-Received: by 2002:adf:ea4f:: with SMTP id j15mr23480569wrn.356.1576388571767; 
 Sat, 14 Dec 2019 21:42:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqz0IMRQ/u1b3O9B0hxf1VlOP54/dnam0OVKI8Turp8WJ6bhlGi9R5D1a8lS7LBP05lJzWuB5g==
X-Received: by 2002:adf:ea4f:: with SMTP id j15mr23480552wrn.356.1576388571564; 
 Sat, 14 Dec 2019 21:42:51 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id g23sm16521121wmk.14.2019.12.14.21.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Dec 2019 21:42:51 -0800 (PST)
Subject: Re: [PATCH v4 32/37] omap-intc: remove PROP_PTR
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
References: <20191120152442.26657-1-marcandre.lureau@redhat.com>
 <20191120152442.26657-33-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a676efcf-75ee-d791-d7fd-709ee661d928@redhat.com>
Date: Sun, 15 Dec 2019 06:42:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191120152442.26657-33-marcandre.lureau@redhat.com>
Content-Language: en-US
X-MC-Unique: X093CnSLP0ufra1vztVVIg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/19 4:24 PM, Marc-Andr=C3=A9 Lureau wrote:
> Since clocks are not QOM objects, replace PROP_PTR of clocks with
> setters methods.
>=20
> (in theory there should probably be different methods for omap1 &
> omap2 intc, but this is left as a future improvement)
>=20
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/arm/omap1.c        |  4 ++--
>   hw/arm/omap2.c        |  4 ++--
>   hw/intc/omap_intc.c   | 17 ++++++++++-------
>   include/hw/arm/omap.h | 14 ++++++++++++++
>   4 files changed, 28 insertions(+), 11 deletions(-)
>=20
> diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
> index 6ce038a453..1afd1d3d7f 100644
> --- a/hw/arm/omap1.c
> +++ b/hw/arm/omap1.c
> @@ -3889,7 +3889,7 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryReg=
ion *dram,
>  =20
>       s->ih[0] =3D qdev_create(NULL, "omap-intc");
>       qdev_prop_set_uint32(s->ih[0], "size", 0x100);
> -    qdev_prop_set_ptr(s->ih[0], "clk", omap_findclk(s, "arminth_ck"));
> +    omap_intc_set_iclk(OMAP_INTC(s->ih[0]), omap_findclk(s, "arminth_ck"=
));
>       qdev_init_nofail(s->ih[0]);
>       busdev =3D SYS_BUS_DEVICE(s->ih[0]);
>       sysbus_connect_irq(busdev, 0,
> @@ -3899,7 +3899,7 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryReg=
ion *dram,
>       sysbus_mmio_map(busdev, 0, 0xfffecb00);
>       s->ih[1] =3D qdev_create(NULL, "omap-intc");
>       qdev_prop_set_uint32(s->ih[1], "size", 0x800);
> -    qdev_prop_set_ptr(s->ih[1], "clk", omap_findclk(s, "arminth_ck"));
> +    omap_intc_set_iclk(OMAP_INTC(s->ih[1]), omap_findclk(s, "arminth_ck"=
));
>       qdev_init_nofail(s->ih[1]);
>       busdev =3D SYS_BUS_DEVICE(s->ih[1]);
>       sysbus_connect_irq(busdev, 0,
> diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
> index 457f152bac..1d7cc435ef 100644
> --- a/hw/arm/omap2.c
> +++ b/hw/arm/omap2.c
> @@ -2308,8 +2308,8 @@ struct omap_mpu_state_s *omap2420_mpu_init(MemoryRe=
gion *sdram,
>       /* Actually mapped at any 2K boundary in the ARM11 private-peripher=
al if */
>       s->ih[0] =3D qdev_create(NULL, "omap2-intc");
>       qdev_prop_set_uint8(s->ih[0], "revision", 0x21);
> -    qdev_prop_set_ptr(s->ih[0], "fclk", omap_findclk(s, "mpu_intc_fclk")=
);
> -    qdev_prop_set_ptr(s->ih[0], "iclk", omap_findclk(s, "mpu_intc_iclk")=
);
> +    omap_intc_set_fclk(OMAP_INTC(s->ih[0]), omap_findclk(s, "mpu_intc_fc=
lk"));
> +    omap_intc_set_iclk(OMAP_INTC(s->ih[0]), omap_findclk(s, "mpu_intc_ic=
lk"));
>       qdev_init_nofail(s->ih[0]);
>       busdev =3D SYS_BUS_DEVICE(s->ih[0]);
>       sysbus_connect_irq(busdev, 0,
> diff --git a/hw/intc/omap_intc.c b/hw/intc/omap_intc.c
> index 854b709ca0..73bb1c2af4 100644
> --- a/hw/intc/omap_intc.c
> +++ b/hw/intc/omap_intc.c
> @@ -38,10 +38,6 @@ struct omap_intr_handler_bank_s {
>       unsigned char priority[32];
>   };
>  =20
> -#define TYPE_OMAP_INTC "common-omap-intc"
> -#define OMAP_INTC(obj) \
> -    OBJECT_CHECK(struct omap_intr_handler_s, (obj), TYPE_OMAP_INTC)
> -
>   struct omap_intr_handler_s {
>       SysBusDevice parent_obj;
>  =20
> @@ -391,9 +387,18 @@ static void omap_intc_realize(DeviceState *dev, Erro=
r **errp)
>       }
>   }
>  =20
> +void omap_intc_set_iclk(omap_intr_handler *intc, omap_clk clk)
> +{
> +    intc->iclk =3D clk;
> +}
> +
> +void omap_intc_set_fclk(omap_intr_handler *intc, omap_clk clk)
> +{
> +    intc->fclk =3D clk;
> +}
> +
>   static Property omap_intc_properties[] =3D {
>       DEFINE_PROP_UINT32("size", struct omap_intr_handler_s, size, 0x100)=
,
> -    DEFINE_PROP_PTR("clk", struct omap_intr_handler_s, iclk),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>  =20
> @@ -647,8 +652,6 @@ static void omap2_intc_realize(DeviceState *dev, Erro=
r **errp)
>   static Property omap2_intc_properties[] =3D {
>       DEFINE_PROP_UINT8("revision", struct omap_intr_handler_s,
>       revision, 0x21),
> -    DEFINE_PROP_PTR("iclk", struct omap_intr_handler_s, iclk),
> -    DEFINE_PROP_PTR("fclk", struct omap_intr_handler_s, fclk),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>  =20
> diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
> index f3aa670036..bcecf19f89 100644
> --- a/include/hw/arm/omap.h
> +++ b/include/hw/arm/omap.h
> @@ -67,6 +67,20 @@ void omap_clk_setrate(omap_clk clk, int divide, int mu=
ltiply);
>   int64_t omap_clk_getrate(omap_clk clk);
>   void omap_clk_reparent(omap_clk clk, omap_clk parent);
>  =20
> +/* omap_intc.c */
> +#define TYPE_OMAP_INTC "common-omap-intc"
> +#define OMAP_INTC(obj)                                              \
> +    OBJECT_CHECK(omap_intr_handler, (obj), TYPE_OMAP_INTC)
> +
> +typedef struct omap_intr_handler_s omap_intr_handler;
> +
> +/*
> + * TODO: Ideally we should have a clock framework that
> + * let us wire these clocks up with QOM properties or links.
> + */
> +void omap_intc_set_iclk(omap_intr_handler *intc, omap_clk clk);
> +void omap_intc_set_fclk(omap_intr_handler *intc, omap_clk clk);
> +
>   /* OMAP2 l4 Interconnect */
>   struct omap_l4_s;
>   struct omap_l4_region_s {
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


