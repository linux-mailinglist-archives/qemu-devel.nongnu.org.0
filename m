Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A87B8C0DA2
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 23:50:45 +0200 (CEST)
Received: from localhost ([::1]:57828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDy8S-0006Js-CZ
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 17:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34989)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iDy2u-0004Br-VM
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 17:45:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iDy2t-0007ay-0N
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 17:45:00 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:34919)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iDy2s-0007Wz-Nu; Fri, 27 Sep 2019 17:44:58 -0400
Received: by mail-lf1-x142.google.com with SMTP id w6so2974437lfl.2;
 Fri, 27 Sep 2019 14:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X9vRfr3sa05sqYQHXQ5rZyvFSdcuVm6csdVWX1df67w=;
 b=bNynoKhY90ge2CuEDaFvyTFZHEpd0NEr+dzcuBbNiV9CjLAs7FRYeLvVHnWAVe1On+
 Eb6V9aIlrmM8d9w43LNit2grZsvt0zT2yuHW0ehVC07JpTvDnx2Y5SntS/ljVWDIvaAF
 eGo4++PLRgNOs5PB/t8t6trq9WmReyLeDcDAspS+7sjs1/5C6ET5rYE4xqWZY7QlrMd5
 b0mgbcdHWV4lDQ4rB1urNtbz9OFohNu+6Jdx3PIDwCFI7e953ByHOupLPBC6sxNHdTxF
 A6O/CCdX7h1pcrZlzddpWE7wnEsdSmyNajVw4j3u4ASxcplxrlOLNgdoWD7HwPboWqDi
 VfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X9vRfr3sa05sqYQHXQ5rZyvFSdcuVm6csdVWX1df67w=;
 b=ZRFc8XNXE1LxBEqM56R6eprP5IxoQT9yAHrSL8L6TevsWG+bcWTkmMyWAfQy1sMd2r
 tQvRaRrqMADWmlDYp69ui55o37U+ORL9nko8g5vsdK0gK/D3ey3SAUr6kb9yugxiLhdq
 0yitcffzETyeaNKAo9c9nH6znhOPhD2z382GOZ1oow6iyVX0h/FRoH2YWH2VHQa+X0wn
 DW+GXSqWTrQLFWFs7mLE0GNGqe+CYEBLL1ZM+7z3INxQuV9I4dHJD05DuXGot9gibcnZ
 rvtPMpsg34DJLtcIjhNf3+HtpyHn6Tw3EMNkDXoiab9N5hDDcWACN2WP8gtjTU7R2Dne
 x2+g==
X-Gm-Message-State: APjAAAVHhvGUasnBZPeEUK2qE12q6UXskJ3HZFRCuulEEDbxHhp+v1WR
 X2lkYtj9HiiKNRSDIQlqel91g/gyxGQzfUiDKUo=
X-Google-Smtp-Source: APXvYqzmxXVKCcbttFX4W4Czko839MW6zjCBy/efejTsg1wQNWfO+exSSA9fdG8n0u6AkuoieSLxVtqR8UAbXHcCW2s=
X-Received: by 2002:a19:98e:: with SMTP id 136mr4321181lfj.156.1569620696730; 
 Fri, 27 Sep 2019 14:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-5-f4bug@amsat.org>
In-Reply-To: <20190926173428.10713-5-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 27 Sep 2019 14:40:10 -0700
Message-ID: <CAKmqyKN0O5+27eQhnQZLbBOq0tU64C-gsEEnUtxHJ3tS6zU9cA@mail.gmail.com>
Subject: Re: [PATCH 04/19] hw/arm/bcm2835: Rename some definitions
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::142
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Zolt=C3=A1n_Baldaszti?= <bztemail@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Guenter Roeck <linux@roeck-us.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 26, 2019 at 10:40 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> The UART1 is part of the AUX peripheral,
> the PCM_CLOCK (yet unimplemented) is part of the CPRMAN.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> I dunno if this is OK to do that since the header has:
>
>  * These definitions are derived from those in Raspbian Linux at
>  * arch/arm/mach-{bcm2708,bcm2709}/include/mach/platform.h
>  * where they carry the following notice:
>  *
>  * Copyright (C) 2010 Broadcom
> ---
>  hw/arm/bcm2835_peripherals.c    |  7 ++++---
>  hw/arm/bcm2836.c                |  2 +-
>  include/hw/arm/raspi_platform.h | 16 +++++++---------
>  3 files changed, 12 insertions(+), 13 deletions(-)
>
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index 8984e2e91f..1bd2ff41d5 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -165,7 +165,8 @@ static void bcm2835_peripherals_realize(DeviceState *=
dev, Error **errp)
>                  sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->uart0), 0));
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart0), 0,
>          qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
> -                               INTERRUPT_UART));
> +                               INTERRUPT_UART0));
> +
>      /* AUX / UART1 */
>      qdev_prop_set_chr(DEVICE(&s->aux), "chardev", serial_hd(1));
>
> @@ -175,7 +176,7 @@ static void bcm2835_peripherals_realize(DeviceState *=
dev, Error **errp)
>          return;
>      }
>
> -    memory_region_add_subregion(&s->peri_mr, UART1_OFFSET,
> +    memory_region_add_subregion(&s->peri_mr, AUX_OFFSET,
>                  sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->aux), 0));
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->aux), 0,
>          qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
> @@ -268,7 +269,7 @@ static void bcm2835_peripherals_realize(DeviceState *=
dev, Error **errp)
>          return;
>      }
>
> -    memory_region_add_subregion(&s->peri_mr, EMMC_OFFSET,
> +    memory_region_add_subregion(&s->peri_mr, EMMC1_OFFSET,
>                  sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->sdhci), 0));
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
>          qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index 493a913f89..723aef6bf5 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -126,7 +126,7 @@ static void bcm2836_realize(DeviceState *dev, Error *=
*errp)
>
>          /* set periphbase/CBAR value for CPU-local registers */
>          object_property_set_int(OBJECT(&s->cpus[n]),
> -                                BCM2836_PERI_BASE + MCORE_OFFSET,
> +                                BCM2836_PERI_BASE + MSYNC_OFFSET,
>                                  "reset-cbar", &err);
>          if (err) {
>              error_propagate(errp, err);
> diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platf=
orm.h
> index 10083d33df..66969fac5d 100644
> --- a/include/hw/arm/raspi_platform.h
> +++ b/include/hw/arm/raspi_platform.h
> @@ -25,8 +25,7 @@
>  #ifndef HW_ARM_RASPI_PLATFORM_H
>  #define HW_ARM_RASPI_PLATFORM_H
>
> -#define MCORE_OFFSET            0x0000   /* Fake frame buffer device
> -                                          * (the multicore sync block) *=
/
> +#define MSYNC_OFFSET            0x0000   /* Multicore Sync Block */
>  #define IC0_OFFSET              0x2000
>  #define ST_OFFSET               0x3000   /* System Timer */
>  #define MPHI_OFFSET             0x6000   /* Message-based Parallel Host =
Intf. */
> @@ -37,9 +36,8 @@
>  #define ARMCTRL_TIMER0_1_OFFSET (ARM_OFFSET + 0x400) /* Timer 0 and 1 */
>  #define ARMCTRL_0_SBM_OFFSET    (ARM_OFFSET + 0x800) /* User 0 (ARM) Sem=
aphores
>                                                        * Doorbells & Mail=
boxes */
> -#define PM_OFFSET               0x100000 /* Power Management, Reset cont=
roller
> -                                          * and Watchdog registers */
> -#define PCM_CLOCK_OFFSET        0x101098
> +#define CPRMAN_OFFSET           0x100000 /* Power Management, Watchdog *=
/
> +#define CM_OFFSET               0x101000 /* Clock Management */
>  #define RNG_OFFSET              0x104000
>  #define GPIO_OFFSET             0x200000
>  #define UART0_OFFSET            0x201000
> @@ -47,11 +45,11 @@
>  #define I2S_OFFSET              0x203000
>  #define SPI0_OFFSET             0x204000
>  #define BSC0_OFFSET             0x205000 /* BSC0 I2C/TWI */
> -#define UART1_OFFSET            0x215000
> -#define EMMC_OFFSET             0x300000
> +#define AUX_OFFSET              0x215000 /* AUX: UART1/SPI1/SPI2 */
> +#define EMMC1_OFFSET            0x300000
>  #define SMI_OFFSET              0x600000
>  #define BSC1_OFFSET             0x804000 /* BSC1 I2C/TWI */
> -#define USB_OFFSET              0x980000 /* DTC_OTG USB controller */
> +#define USB_OTG_OFFSET          0x980000 /* DTC_OTG USB controller */
>  #define DMA15_OFFSET            0xE05000 /* DMA controller, channel 15 *=
/
>
>  /* GPU interrupts */
> @@ -112,7 +110,7 @@
>  #define INTERRUPT_SPI                  54
>  #define INTERRUPT_I2SPCM               55
>  #define INTERRUPT_SDIO                 56
> -#define INTERRUPT_UART                 57
> +#define INTERRUPT_UART0                57
>  #define INTERRUPT_SLIMBUS              58
>  #define INTERRUPT_VEC                  59
>  #define INTERRUPT_CPG                  60
> --
> 2.20.1
>
>

