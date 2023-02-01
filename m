Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C9F685FF0
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 07:50:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN653-0004AY-RW; Wed, 01 Feb 2023 00:54:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pN651-00049r-30; Wed, 01 Feb 2023 00:54:47 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pN64o-0007qI-Jd; Wed, 01 Feb 2023 00:54:46 -0500
Received: by mail-ed1-x52a.google.com with SMTP id v13so16511670eda.11;
 Tue, 31 Jan 2023 21:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AG1HH/UivaEadvI9D68DkhxNojmpaYCePKTEI22r0ZA=;
 b=bpwwZjNM+5S2803KSYiHhbcqQxOxkQeo2sJQPuhc1xiw5L184wE7QURM7KMZTzP+FX
 KJMy5AGBdrlLhsvgg0Z3L9/vLDcFtG3iOFUQpSMzrtjemDHXs4FLuzESddyRhT8k/S+5
 499pYqQnm9J51NvzNUsdaipoDjQ15tkpK63Qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AG1HH/UivaEadvI9D68DkhxNojmpaYCePKTEI22r0ZA=;
 b=yZxYBWYdgPoLBGvWKsADmomZEO/n1iEhnC2DjvKhWaTNzyxNAYbpqOLo7tFQ/0K8ev
 F5PzOqYz3uyvul+H9ohVsMvtomaxA4OukBRpGy19fap24k5SkU06RGNYhZD3s3SsF/Yi
 00QYF+JR1iStX+Uy2RpvEjwyPyyfowYnv2RMhoTOk3EOB/9Qd77m6/x3+C5vtBNtHhDj
 VLUcGcbI4x5QvEg76efoc+nMDiwHMLrtsHr9g/tITMk0Ip98OBkjsc6Hs9cKXHjKJBMB
 0nodlf/qK8NcgbqtvOWownHzp0DltAeh6DEOIvUFTBepeiwrEA+Cl5dJ32gZgI9u+NMu
 /Gvg==
X-Gm-Message-State: AO0yUKXF4FHIKO+VwsHns9L0UVeyc6T83OnqMbQBUD7gHh8TtxY/HzbQ
 KWVQP1rIsmDfxHs7ru3W1MT9Dy8QeboUNiDavj8=
X-Google-Smtp-Source: AK7set9bWxhFsguGgCZK9tF12MIX2qMgM2vnq+H9eHeiBIIma9WI7R6CMd2PIv2b37WTPk+7yNkQsxP7SZJoZ8UqupQ=
X-Received: by 2002:aa7:d886:0:b0:4a2:3637:568 with SMTP id
 u6-20020aa7d886000000b004a236370568mr185442edq.83.1675230870214; Tue, 31 Jan
 2023 21:54:30 -0800 (PST)
MIME-Version: 1.0
References: <20230119123449.531826-1-clg@kaod.org>
 <20230119123449.531826-21-clg@kaod.org>
In-Reply-To: <20230119123449.531826-21-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Feb 2023 05:54:17 +0000
Message-ID: <CACPK8XeW8+x8rya6-sWmu9t9=sJSFnzMH1kH69GLx5UyJnijLQ@mail.gmail.com>
Subject: Re: [PATCH 20/25] hw/arm/aspeed_ast10x0: Add various unimplemented
 peripherals
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Peter Delevoryas <peter@pjd.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=joel.stan@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 19 Jan 2023 at 12:36, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> Based on booting Zephyr demo from [1] running QEMU with
> '-d unimp' and checking missing devices in [2].
>
> [1] https://github.com/AspeedTech-BMC/zephyr/releases/tag/v00.01.07
> [2] https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/dts/arm/aspee=
d/ast10x0.dtsi
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Peter Delevoryas <peter@pjd.dev>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  include/hw/arm/aspeed_soc.h | 11 +++++++++++
>  hw/arm/aspeed_ast10x0.c     | 35 +++++++++++++++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
>
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 8389200b2d..9a5e3c0bac 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -44,6 +44,7 @@
>  #define ASPEED_CPUS_NUM  2
>  #define ASPEED_MACS_NUM  4
>  #define ASPEED_UARTS_NUM 13
> +#define ASPEED_JTAG_NUM  2
>
>  struct AspeedSoCState {
>      /*< private >*/
> @@ -87,6 +88,11 @@ struct AspeedSoCState {
>      UnimplementedDeviceState video;
>      UnimplementedDeviceState emmc_boot_controller;
>      UnimplementedDeviceState dpmcu;
> +    UnimplementedDeviceState pwm;
> +    UnimplementedDeviceState espi;
> +    UnimplementedDeviceState udc;
> +    UnimplementedDeviceState sgpiom;
> +    UnimplementedDeviceState jtag[ASPEED_JTAG_NUM];
>  };
>
>  #define TYPE_ASPEED_SOC "aspeed-soc"
> @@ -174,6 +180,11 @@ enum {
>      ASPEED_DEV_DPMCU,
>      ASPEED_DEV_DP,
>      ASPEED_DEV_I3C,
> +    ASPEED_DEV_ESPI,
> +    ASPEED_DEV_UDC,
> +    ASPEED_DEV_SGPIOM,
> +    ASPEED_DEV_JTAG0,
> +    ASPEED_DEV_JTAG1,
>  };
>
>  qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index b483735dc2..b970a5ea58 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -27,10 +27,15 @@ static const hwaddr aspeed_soc_ast1030_memmap[] =3D {
>      [ASPEED_DEV_FMC]       =3D 0x7E620000,
>      [ASPEED_DEV_SPI1]      =3D 0x7E630000,
>      [ASPEED_DEV_SPI2]      =3D 0x7E640000,
> +    [ASPEED_DEV_UDC]       =3D 0x7E6A2000,
>      [ASPEED_DEV_SCU]       =3D 0x7E6E2000,
> +    [ASPEED_DEV_JTAG0]     =3D 0x7E6E4000,
> +    [ASPEED_DEV_JTAG1]     =3D 0x7E6E4100,
>      [ASPEED_DEV_ADC]       =3D 0x7E6E9000,
> +    [ASPEED_DEV_ESPI]      =3D 0x7E6EE000,
>      [ASPEED_DEV_SBC]       =3D 0x7E6F2000,
>      [ASPEED_DEV_GPIO]      =3D 0x7E780000,
> +    [ASPEED_DEV_SGPIOM]    =3D 0x7E780500,
>      [ASPEED_DEV_TIMER1]    =3D 0x7E782000,
>      [ASPEED_DEV_UART1]     =3D 0x7E783000,
>      [ASPEED_DEV_UART2]     =3D 0x7E78D000,
> @@ -78,12 +83,17 @@ static const int aspeed_soc_ast1030_irqmap[] =3D {
>      [ASPEED_DEV_LPC]       =3D 35,
>      [ASPEED_DEV_PECI]      =3D 38,
>      [ASPEED_DEV_FMC]       =3D 39,
> +    [ASPEED_DEV_ESPI]      =3D 42,
>      [ASPEED_DEV_PWM]       =3D 44,
>      [ASPEED_DEV_ADC]       =3D 46,
>      [ASPEED_DEV_SPI1]      =3D 65,
>      [ASPEED_DEV_SPI2]      =3D 66,
>      [ASPEED_DEV_I2C]       =3D 110, /* 110 ~ 123 */
>      [ASPEED_DEV_KCS]       =3D 138, /* 138 -> 142 */
> +    [ASPEED_DEV_UDC]       =3D 9,
> +    [ASPEED_DEV_SGPIOM]    =3D 51,
> +    [ASPEED_DEV_JTAG0]     =3D 27,
> +    [ASPEED_DEV_JTAG1]     =3D 53,

nit: The array is kind of sorted by irq number, these could probably go abo=
ve?

>  };
>
>  static qemu_irq aspeed_soc_ast1030_get_irq(AspeedSoCState *s, int dev)
> @@ -154,6 +164,15 @@ static void aspeed_soc_ast1030_init(Object *obj)
>      object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_=
DEVICE);
>      object_initialize_child(obj, "sbc-unimplemented", &s->sbc_unimplemen=
ted,
>                              TYPE_UNIMPLEMENTED_DEVICE);
> +    object_initialize_child(obj, "pwm", &s->pwm, TYPE_UNIMPLEMENTED_DEVI=
CE);
> +    object_initialize_child(obj, "espi", &s->espi, TYPE_UNIMPLEMENTED_DE=
VICE);
> +    object_initialize_child(obj, "udc", &s->udc, TYPE_UNIMPLEMENTED_DEVI=
CE);
> +    object_initialize_child(obj, "sgpiom", &s->sgpiom,
> +                            TYPE_UNIMPLEMENTED_DEVICE);
> +    object_initialize_child(obj, "jtag[0]", &s->jtag[0],
> +                            TYPE_UNIMPLEMENTED_DEVICE);
> +    object_initialize_child(obj, "jtag[1]", &s->jtag[1],
> +                            TYPE_UNIMPLEMENTED_DEVICE);
>  }
>
>  static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **err=
p)
> @@ -336,6 +355,22 @@ static void aspeed_soc_ast1030_realize(DeviceState *=
dev_soc, Error **errp)
>                      sc->memmap[ASPEED_DEV_GPIO]);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
>                         aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
> +
> +    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->pwm), "aspeed.pw=
m",
> +                                  sc->memmap[ASPEED_DEV_PWM], 0x100);
> +
> +    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->espi), "aspeed.e=
spi",
> +                                  sc->memmap[ASPEED_DEV_ESPI], 0x800);
> +
> +    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->udc), "aspeed.ud=
c",
> +                                  sc->memmap[ASPEED_DEV_UDC], 0x1000);
> +    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->sgpiom), "aspeed=
.sgpiom",
> +                                  sc->memmap[ASPEED_DEV_SGPIOM], 0x100);
> +
> +    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->jtag[0]), "aspee=
d.jtag",
> +                                  sc->memmap[ASPEED_DEV_JTAG0], 0x20);
> +    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->jtag[1]), "aspee=
d.jtag",
> +                                  sc->memmap[ASPEED_DEV_JTAG1], 0x20);
>  }
>
>  static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data=
)
> --
> 2.39.0
>
>

