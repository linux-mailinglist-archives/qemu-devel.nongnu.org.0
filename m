Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1606DE36C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 20:04:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmIKp-0006pn-VL; Tue, 11 Apr 2023 14:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pmIKc-0006kY-FU; Tue, 11 Apr 2023 14:03:02 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pmIKa-0001De-G3; Tue, 11 Apr 2023 14:03:02 -0400
Received: by mail-ej1-x634.google.com with SMTP id jg21so22219081ejc.2;
 Tue, 11 Apr 2023 11:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681236178;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XICRZRIGanYsfurzB3Nv0ohm70Zv1XaJD5ddchYVVMg=;
 b=H+5EpAj+u1eSHtXGfXMIBkWbs0oxUVnmIUaIs/e30cSxUi/rItSmbN8QMKPdwg83Bq
 QLiEHP/j9Pi3r4xxo+RHCbZc0igk1BC9NxHmC7DXBtfBHYZnsMKOxrQlZIp5M/W7+SQd
 00R2yq1cUyo5haVv6VA9teMGDR5t1fbXs19uGaD7c8JX92m+iRgQbLGNg+T0p7TniBcp
 rKCvuPQyyTy63gwr2v6T8uLQ4neHFnSpBp7EfrPPWHjSk2CDJOwRECNHtHi3A8lGn6fC
 SVPykJQo/6LT6hNJhBq9o9raaLmC2lwXntbYNqH/hkyjxrj0Jz05isVukVL/6GbY5YY1
 7Dww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681236178;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XICRZRIGanYsfurzB3Nv0ohm70Zv1XaJD5ddchYVVMg=;
 b=nKwrIZNk7FV5hPr1Pypc2hoieZVsN/C+316U7bRbUqpkMhbjAocHPSI5Z5WzPJpjkg
 DpLanzj4lvbWTCR+AMj5kN5r/oX4zOxOu1u0JLi2ncWXglzDgtmiaKpVDauRvMReSy2Z
 MpZxPC0xl15ZyXuzCoSSQy4lipzHFRoMLmWdLjn4+jSrDK/NEb4ExaeXi9de4lWz8JJG
 IHSPmHaUtc561VbHC6mu5cvmihXnSzD2eRj+LjWoG/CXq3/6W98chq8kyozIih9b/fZR
 2P/N2PU1c8399MfaCr3pmMyWIvAO1kJSRygeT4Peva0HUY1eGDPNezp60p4qQB7Fl3H7
 NtXA==
X-Gm-Message-State: AAQBX9f7Xb3fj3D5A1Sqsvwa4bBlh8kkeWqQy/lz6U+7Uo+kLtLrqfz2
 CdwHd0SoLVLno3wSWkxdIgnsb+XOiNza4N05r0E=
X-Google-Smtp-Source: AKy350a3w87F93JygPjvIH9NJNBwC14w2oHTsPa6ZhssXpRg8FGBhV5pe5lWCszQUMkU7vnmLT9xEae4drDiYYuNV9E=
X-Received: by 2002:a17:906:3188:b0:931:f9f8:d4ea with SMTP id
 8-20020a170906318800b00931f9f8d4eamr12249800ejy.53.1681236177701; Tue, 11 Apr
 2023 11:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230328054654.18620-1-qianfanguijin@163.com>
 <20230328054654.18620-5-qianfanguijin@163.com>
In-Reply-To: <20230328054654.18620-5-qianfanguijin@163.com>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Tue, 11 Apr 2023 20:02:46 +0200
Message-ID: <CABtshVSWvOWJP4SqYiDy0OQ+XRGEuX+=8nM-R_RcTO6x+QEzkQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] hw: arm: allwinner-r40: Add i2c0 device
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Tue, Mar 28, 2023 at 7:47=E2=80=AFAM <qianfanguijin@163.com> wrote:
>
> From: qianfan Zhao <qianfanguijin@163.com>
>
> TWI(i2c) is designed to be used as an interface between CPU host and the
> serial 2-Wire bus. It can support all standard 2-Wire transfer, can be
> operated in standard mode(100kbit/s) or fast-mode, supporting data rate
> up to 400kbit/s.
>
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> ---
>  hw/arm/allwinner-r40.c         | 11 ++++++++++-
>  include/hw/arm/allwinner-r40.h |  3 +++
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c
> index 537a90b23d..4bc582630c 100644
> --- a/hw/arm/allwinner-r40.c
> +++ b/hw/arm/allwinner-r40.c
> @@ -52,6 +52,7 @@ const hwaddr allwinner_r40_memmap[] =3D {
>      [AW_R40_DEV_UART5]      =3D 0x01c29400,
>      [AW_R40_DEV_UART6]      =3D 0x01c29800,
>      [AW_R40_DEV_UART7]      =3D 0x01c29c00,
> +    [AW_R40_DEV_TWI0]       =3D 0x01c2ac00,
>      [AW_R40_DEV_GIC_DIST]   =3D 0x01c81000,
>      [AW_R40_DEV_GIC_CPU]    =3D 0x01c82000,
>      [AW_R40_DEV_GIC_HYP]    =3D 0x01c84000,
> @@ -115,7 +116,6 @@ static struct AwR40Unimplemented r40_unimplemented[] =
=3D {
>      { "uart7",      0x01c29c00, 1 * KiB },
>      { "ps20",       0x01c2a000, 1 * KiB },
>      { "ps21",       0x01c2a400, 1 * KiB },
> -    { "twi0",       0x01c2ac00, 1 * KiB },
>      { "twi1",       0x01c2b000, 1 * KiB },
>      { "twi2",       0x01c2b400, 1 * KiB },
>      { "twi3",       0x01c2b800, 1 * KiB },
> @@ -167,6 +167,7 @@ enum {
>      AW_R40_GIC_SPI_UART1     =3D  2,
>      AW_R40_GIC_SPI_UART2     =3D  3,
>      AW_R40_GIC_SPI_UART3     =3D  4,
> +    AW_R40_GIC_SPI_TWI0      =3D  7,
>      AW_R40_GIC_SPI_UART4     =3D 17,
>      AW_R40_GIC_SPI_UART5     =3D 18,
>      AW_R40_GIC_SPI_UART6     =3D 19,
> @@ -270,6 +271,8 @@ static void allwinner_r40_init(Object *obj)
>          object_initialize_child(obj, mmc_names[i], &s->mmc[i],
>                                  TYPE_AW_SDHOST_SUN5I);
>      }
> +
> +    object_initialize_child(obj, "twi0", &s->i2c0, TYPE_AW_I2C_SUN6I);
>  }
>
>  static void allwinner_r40_realize(DeviceState *dev, Error **errp)
> @@ -416,6 +419,12 @@ static void allwinner_r40_realize(DeviceState *dev, =
Error **errp)
>                         115200, serial_hd(i), DEVICE_NATIVE_ENDIAN);
>      }
>
> +    /* I2C */
> +    sysbus_realize(SYS_BUS_DEVICE(&s->i2c0), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c0), 0, s->memmap[AW_R40_DEV_TW=
I0]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c0), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_=
TWI0));
> +
>      /* Unimplemented devices */
>      for (i =3D 0; i < ARRAY_SIZE(r40_unimplemented); i++) {
>          create_unimplemented_device(r40_unimplemented[i].device_name,
> diff --git a/include/hw/arm/allwinner-r40.h b/include/hw/arm/allwinner-r4=
0.h
> index 959b5dc4e0..95366f4eee 100644
> --- a/include/hw/arm/allwinner-r40.h
> +++ b/include/hw/arm/allwinner-r40.h
> @@ -26,6 +26,7 @@
>  #include "hw/intc/arm_gic.h"
>  #include "hw/sd/allwinner-sdhost.h"
>  #include "hw/misc/allwinner-r40-ccu.h"
> +#include "hw/i2c/allwinner-i2c.h"
>  #include "target/arm/cpu.h"
>  #include "sysemu/block-backend.h"
>
> @@ -48,6 +49,7 @@ enum {
>      AW_R40_DEV_UART5,
>      AW_R40_DEV_UART6,
>      AW_R40_DEV_UART7,
> +    AW_R40_DEV_TWI0,
>      AW_R40_DEV_GIC_DIST,
>      AW_R40_DEV_GIC_CPU,
>      AW_R40_DEV_GIC_HYP,
> @@ -89,6 +91,7 @@ struct AwR40State {
>      AwA10PITState timer;
>      AwSdHostState mmc[AW_R40_NUM_MMCS];
>      AwR40ClockCtlState ccu;
> +    AWI2CState i2c0;
>      GICState gic;
>      MemoryRegion sram_a1;
>      MemoryRegion sram_a2;
> --
> 2.25.1
>

Reviewed-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>

Best regards,
Strahinja

