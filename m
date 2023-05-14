Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDD7701F05
	for <lists+qemu-devel@lfdr.de>; Sun, 14 May 2023 20:41:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyGeg-0006tW-Sw; Sun, 14 May 2023 14:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pyGeY-0006rE-I9; Sun, 14 May 2023 14:41:06 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pyGeN-0008O4-JR; Sun, 14 May 2023 14:41:04 -0400
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-b9a7e639656so18129439276.0; 
 Sun, 14 May 2023 11:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684089654; x=1686681654;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6k/3qPAPUowBvsiCrJ4y0Aoo5W1/G2ph3a1Ea8lytpo=;
 b=WpyuAZibQAQGhcJklurVpY7padiHrFHa7i5rh4AuXljuZAfJglzer0p5Dg7osN1Wyg
 AKEVdHd3BovlXrbJWqy3rFkva1veVQ3ZAq7S6nSXX04wujsgGavoqbgK/UdLvwVyuqoH
 GwB6sZcbfbNh7v1Qc+R+C9uadFzUQT5VIsgMfEmbnLaeJp2frwp+uI2ukZ5eipyj5iaX
 yIv3LCBsJ46tZMnLgcQTAofqNVotSZj52O/DARYHb6vyH9/uvVGBmAbAWxprtztemoJS
 PAkPWZE06kyhF3oGvd4m1KI62N/C3q0yWwORs3WwV6+rgHJjQ85pVy6NGuFwmiQkRP5S
 jwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684089654; x=1686681654;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6k/3qPAPUowBvsiCrJ4y0Aoo5W1/G2ph3a1Ea8lytpo=;
 b=koMyaSjSHMIkmeM/YrK3yd4vD/GQ1ImLkL6nALRmjHiRzmCv34X94XmIXQMG0DBdJN
 O8ZB5yqGFlnD1nBzcAMunej5s71F1fD4q9/HwyR4tl4WAuB2aew77kj1LP8prJqOBQrJ
 dU1QEErr8Jefl0tJVknTZZhbXF+wgh81MB9bwzsrfjTX5NKJ90LTT2R6sEiJogUc6XLL
 6CE8iFcpcdbEIA+ffgxeqcqN9OlxPP2/N4dmx9qbRmk0yOq2X0ORgxl+FT4AsAMpljV2
 ISCe52jtsYV3qpM4nKBtXjFU2SozNophUaWJ19qyXVO1n5EckpZGLngce+Ufd7DZJotO
 WG7A==
X-Gm-Message-State: AC+VfDwSyILph0UlhjdB68WnZGQ+bZWuCmJPpaPQP75+KTqyC5ciJokH
 6Qrh9KBJprXNOvXplP1A7uW8g1gkzTyA7h4LLic=
X-Google-Smtp-Source: ACHHUZ5kX9GgeSaHoedYlkLmbPm+hnkbxbNznfRHkt+dM36BMGAdXSvXRVh/jdYdxgsPLP5xKqwTh42PaavGH0++fig=
X-Received: by 2002:a25:db0d:0:b0:ba7:7c14:590e with SMTP id
 g13-20020a25db0d000000b00ba77c14590emr3202563ybf.0.1684089654200; Sun, 14 May
 2023 11:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230510103004.30015-1-qianfanguijin@163.com>
 <20230510103004.30015-3-qianfanguijin@163.com>
In-Reply-To: <20230510103004.30015-3-qianfanguijin@163.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Sun, 14 May 2023 20:40:43 +0200
Message-ID: <CAPan3WqzJg6SfFShF+NECWxcsQdiC_Uc+91Gskpitj3QuW0YZw@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] hw/arm/allwinner-r40: add Clock Control Unit
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000009bcc9d05fbabad82"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-yb1-xb35.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000009bcc9d05fbabad82
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 10, 2023 at 12:30=E2=80=AFPM <qianfanguijin@163.com> wrote:

> From: qianfan Zhao <qianfanguijin@163.com>
>
> The CCU provides the registers to program the PLLs and the controls
> most of the clock generation, division, distribution, synchronization
> and gating.
>
> This commit adds support for the Clock Control Unit which emulates
> a simple read/write register interface.
>
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>


> ---
>  hw/arm/allwinner-r40.c              |   8 +-
>  hw/misc/allwinner-r40-ccu.c         | 209 ++++++++++++++++++++++++++++
>  hw/misc/meson.build                 |   1 +
>  include/hw/arm/allwinner-r40.h      |   2 +
>  include/hw/misc/allwinner-r40-ccu.h |  65 +++++++++
>  5 files changed, 284 insertions(+), 1 deletion(-)
>  create mode 100644 hw/misc/allwinner-r40-ccu.c
>  create mode 100644 include/hw/misc/allwinner-r40-ccu.h
>
> diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c
> index b743d64253..128c0ca470 100644
> --- a/hw/arm/allwinner-r40.c
> +++ b/hw/arm/allwinner-r40.c
> @@ -42,6 +42,7 @@ const hwaddr allwinner_r40_memmap[] =3D {
>      [AW_R40_DEV_MMC1]       =3D 0x01c10000,
>      [AW_R40_DEV_MMC2]       =3D 0x01c11000,
>      [AW_R40_DEV_MMC3]       =3D 0x01c12000,
> +    [AW_R40_DEV_CCU]        =3D 0x01c20000,
>      [AW_R40_DEV_PIT]        =3D 0x01c20c00,
>      [AW_R40_DEV_UART0]      =3D 0x01c28000,
>      [AW_R40_DEV_GIC_DIST]   =3D 0x01c81000,
> @@ -80,7 +81,6 @@ static struct AwR40Unimplemented r40_unimplemented[] =
=3D {
>      { "usb2-host",  0x01c1c000, 4 * KiB },
>      { "cs1",        0x01c1d000, 4 * KiB },
>      { "spi3",       0x01c1f000, 4 * KiB },
> -    { "ccu",        0x01c20000, 1 * KiB },
>      { "rtc",        0x01c20400, 1 * KiB },
>      { "pio",        0x01c20800, 1 * KiB },
>      { "owa",        0x01c21000, 1 * KiB },
> @@ -253,6 +253,8 @@ static void allwinner_r40_init(Object *obj)
>      object_property_add_alias(obj, "clk1-freq", OBJECT(&s->timer),
>                                "clk1-freq");
>
> +    object_initialize_child(obj, "ccu", &s->ccu, TYPE_AW_R40_CCU);
> +
>      for (int i =3D 0; i < AW_R40_NUM_MMCS; i++) {
>          object_initialize_child(obj, mmc_names[i], &s->mmc[i],
>                                  TYPE_AW_SDHOST_SUN5I);
> @@ -367,6 +369,10 @@ static void allwinner_r40_realize(DeviceState *dev,
> Error **errp)
>      memory_region_add_subregion(get_system_memory(),
>                                  s->memmap[AW_R40_DEV_SRAM_A4],
> &s->sram_a4);
>
> +    /* Clock Control Unit */
> +    sysbus_realize(SYS_BUS_DEVICE(&s->ccu), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->ccu), 0,
> s->memmap[AW_R40_DEV_CCU]);
> +
>      /* SD/MMC */
>      for (int i =3D 0; i < AW_R40_NUM_MMCS; i++) {
>          qemu_irq irq =3D qdev_get_gpio_in(DEVICE(&s->gic),
> diff --git a/hw/misc/allwinner-r40-ccu.c b/hw/misc/allwinner-r40-ccu.c
> new file mode 100644
> index 0000000000..d82fee12db
> --- /dev/null
> +++ b/hw/misc/allwinner-r40-ccu.c
> @@ -0,0 +1,209 @@
> +/*
> + * Allwinner R40 Clock Control Unit emulation
> + *
> + * Copyright (C) 2023 qianfan Zhao <qianfanguijin@163.com>
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation, either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/units.h"
> +#include "hw/sysbus.h"
> +#include "migration/vmstate.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "hw/misc/allwinner-r40-ccu.h"
> +
> +/* CCU register offsets */
> +enum {
> +    REG_PLL_CPUX_CTRL           =3D 0x0000,
> +    REG_PLL_AUDIO_CTRL          =3D 0x0008,
> +    REG_PLL_VIDEO0_CTRL         =3D 0x0010,
> +    REG_PLL_VE_CTRL             =3D 0x0018,
> +    REG_PLL_DDR0_CTRL           =3D 0x0020,
> +    REG_PLL_PERIPH0_CTRL        =3D 0x0028,
> +    REG_PLL_PERIPH1_CTRL        =3D 0x002c,
> +    REG_PLL_VIDEO1_CTRL         =3D 0x0030,
> +    REG_PLL_SATA_CTRL           =3D 0x0034,
> +    REG_PLL_GPU_CTRL            =3D 0x0038,
> +    REG_PLL_MIPI_CTRL           =3D 0x0040,
> +    REG_PLL_DE_CTRL             =3D 0x0048,
> +    REG_PLL_DDR1_CTRL           =3D 0x004c,
> +    REG_AHB1_APB1_CFG           =3D 0x0054,
> +    REG_APB2_CFG                =3D 0x0058,
> +    REG_MMC0_CLK                =3D 0x0088,
> +    REG_MMC1_CLK                =3D 0x008c,
> +    REG_MMC2_CLK                =3D 0x0090,
> +    REG_MMC3_CLK                =3D 0x0094,
> +    REG_USBPHY_CFG              =3D 0x00cc,
> +    REG_PLL_DDR_AUX             =3D 0x00f0,
> +    REG_DRAM_CFG                =3D 0x00f4,
> +    REG_PLL_DDR1_CFG            =3D 0x00f8,
> +    REG_DRAM_CLK_GATING         =3D 0x0100,
> +    REG_GMAC_CLK                =3D 0x0164,
> +    REG_SYS_32K_CLK             =3D 0x0310,
> +    REG_PLL_LOCK_CTRL           =3D 0x0320,
> +};
> +
> +#define REG_INDEX(offset)    (offset / sizeof(uint32_t))
> +
> +/* CCU register flags */
> +enum {
> +    REG_PLL_ENABLE           =3D (1 << 31),
> +    REG_PLL_LOCK             =3D (1 << 28),
> +};
> +
> +static uint64_t allwinner_r40_ccu_read(void *opaque, hwaddr offset,
> +                                       unsigned size)
> +{
> +    const AwR40ClockCtlState *s =3D AW_R40_CCU(opaque);
> +    const uint32_t idx =3D REG_INDEX(offset);
> +
> +    switch (offset) {
> +    case 0x324 ... AW_R40_CCU_IOSIZE:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset
> 0x%04x\n",
> +                      __func__, (uint32_t)offset);
> +        return 0;
> +    }
> +
> +    return s->regs[idx];
> +}
> +
> +static void allwinner_r40_ccu_write(void *opaque, hwaddr offset,
> +                                    uint64_t val, unsigned size)
> +{
> +    AwR40ClockCtlState *s =3D AW_R40_CCU(opaque);
> +
> +    switch (offset) {
> +    case REG_DRAM_CFG:    /* DRAM Configuration(for DDR0) */
> +        /* bit16: SDRCLK_UPD (SDRCLK configuration 0 update) */
> +        val &=3D ~(1 << 16);
> +        break;
> +    case REG_PLL_DDR1_CTRL: /* DDR1 Control register */
> +        /* bit30: SDRPLL_UPD */
> +        val &=3D ~(1 << 30);
> +        if (val & REG_PLL_ENABLE) {
> +            val |=3D REG_PLL_LOCK;
> +        }
> +        break;
> +    case REG_PLL_CPUX_CTRL:
> +    case REG_PLL_AUDIO_CTRL:
> +    case REG_PLL_VE_CTRL:
> +    case REG_PLL_VIDEO0_CTRL:
> +    case REG_PLL_DDR0_CTRL:
> +    case REG_PLL_PERIPH0_CTRL:
> +    case REG_PLL_PERIPH1_CTRL:
> +    case REG_PLL_VIDEO1_CTRL:
> +    case REG_PLL_SATA_CTRL:
> +    case REG_PLL_GPU_CTRL:
> +    case REG_PLL_MIPI_CTRL:
> +    case REG_PLL_DE_CTRL:
> +        if (val & REG_PLL_ENABLE) {
> +            val |=3D REG_PLL_LOCK;
> +        }
> +        break;
> +    case 0x324 ... AW_R40_CCU_IOSIZE:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset
> 0x%04x\n",
> +                      __func__, (uint32_t)offset);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%s: unimplemented write offset
> 0x%04x\n",
> +                      __func__, (uint32_t)offset);
> +        break;
> +    }
> +
> +    s->regs[REG_INDEX(offset)] =3D (uint32_t) val;
> +}
> +
> +static const MemoryRegionOps allwinner_r40_ccu_ops =3D {
> +    .read =3D allwinner_r40_ccu_read,
> +    .write =3D allwinner_r40_ccu_write,
> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .valid =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 4,
> +    },
> +    .impl.min_access_size =3D 4,
> +};
> +
> +static void allwinner_r40_ccu_reset(DeviceState *dev)
> +{
> +    AwR40ClockCtlState *s =3D AW_R40_CCU(dev);
> +
> +    memset(s->regs, 0, sizeof(s->regs));
> +
> +    /* Set default values for registers */
> +    s->regs[REG_INDEX(REG_PLL_CPUX_CTRL)]       =3D 0x00001000;
> +    s->regs[REG_INDEX(REG_PLL_AUDIO_CTRL)]      =3D 0x00035514;
> +    s->regs[REG_INDEX(REG_PLL_VIDEO0_CTRL)]     =3D 0x03006207;
> +    s->regs[REG_INDEX(REG_PLL_VE_CTRL)]         =3D 0x03006207;
> +    s->regs[REG_INDEX(REG_PLL_DDR0_CTRL)]       =3D 0x00001000,
> +    s->regs[REG_INDEX(REG_PLL_PERIPH0_CTRL)]    =3D 0x00041811;
> +    s->regs[REG_INDEX(REG_PLL_PERIPH1_CTRL)]    =3D 0x00041811;
> +    s->regs[REG_INDEX(REG_PLL_VIDEO1_CTRL)]     =3D 0x03006207;
> +    s->regs[REG_INDEX(REG_PLL_SATA_CTRL)]       =3D 0x00001811;
> +    s->regs[REG_INDEX(REG_PLL_GPU_CTRL)]        =3D 0x03006207;
> +    s->regs[REG_INDEX(REG_PLL_MIPI_CTRL)]       =3D 0x00000515;
> +    s->regs[REG_INDEX(REG_PLL_DE_CTRL)]         =3D 0x03006207;
> +    s->regs[REG_INDEX(REG_PLL_DDR1_CTRL)]       =3D 0x00001800;
> +    s->regs[REG_INDEX(REG_AHB1_APB1_CFG)]       =3D 0x00001010;
> +    s->regs[REG_INDEX(REG_APB2_CFG)]            =3D 0x01000000;
> +    s->regs[REG_INDEX(REG_PLL_DDR_AUX)]         =3D 0x00000001;
> +    s->regs[REG_INDEX(REG_PLL_DDR1_CFG)]        =3D 0x0ccca000;
> +    s->regs[REG_INDEX(REG_SYS_32K_CLK)]         =3D 0x0000000f;
> +}
> +
> +static void allwinner_r40_ccu_init(Object *obj)
> +{
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
> +    AwR40ClockCtlState *s =3D AW_R40_CCU(obj);
> +
> +    /* Memory mapping */
> +    memory_region_init_io(&s->iomem, OBJECT(s), &allwinner_r40_ccu_ops, =
s,
> +                          TYPE_AW_R40_CCU, AW_R40_CCU_IOSIZE);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +}
> +
> +static const VMStateDescription allwinner_r40_ccu_vmstate =3D {
> +    .name =3D "allwinner-r40-ccu",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(regs, AwR40ClockCtlState,
> AW_R40_CCU_REGS_NUM),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void allwinner_r40_ccu_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    dc->reset =3D allwinner_r40_ccu_reset;
> +    dc->vmsd =3D &allwinner_r40_ccu_vmstate;
> +}
> +
> +static const TypeInfo allwinner_r40_ccu_info =3D {
> +    .name          =3D TYPE_AW_R40_CCU,
> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_init =3D allwinner_r40_ccu_init,
> +    .instance_size =3D sizeof(AwR40ClockCtlState),
> +    .class_init    =3D allwinner_r40_ccu_class_init,
> +};
> +
> +static void allwinner_r40_ccu_register(void)
> +{
> +    type_register_static(&allwinner_r40_ccu_info);
> +}
> +
> +type_init(allwinner_r40_ccu_register)
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index a40245ad44..96e35f1cdb 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -44,6 +44,7 @@ specific_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true:
> files('allwinner-cpucfg.c'
>  softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true:
> files('allwinner-h3-dramc.c'))
>  softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true:
> files('allwinner-h3-sysctrl.c'))
>  softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true:
> files('allwinner-sid.c'))
> +softmmu_ss.add(when: 'CONFIG_ALLWINNER_R40', if_true:
> files('allwinner-r40-ccu.c'))
>  softmmu_ss.add(when: 'CONFIG_AXP209_PMU', if_true: files('axp209.c'))
>  softmmu_ss.add(when: 'CONFIG_REALVIEW', if_true: files('arm_sysctl.c'))
>  softmmu_ss.add(when: 'CONFIG_NSERIES', if_true: files('cbus.c'))
> diff --git a/include/hw/arm/allwinner-r40.h
> b/include/hw/arm/allwinner-r40.h
> index 348bf25d6b..3be9dc962b 100644
> --- a/include/hw/arm/allwinner-r40.h
> +++ b/include/hw/arm/allwinner-r40.h
> @@ -25,6 +25,7 @@
>  #include "hw/timer/allwinner-a10-pit.h"
>  #include "hw/intc/arm_gic.h"
>  #include "hw/sd/allwinner-sdhost.h"
> +#include "hw/misc/allwinner-r40-ccu.h"
>  #include "target/arm/cpu.h"
>  #include "sysemu/block-backend.h"
>
> @@ -79,6 +80,7 @@ struct AwR40State {
>      const hwaddr *memmap;
>      AwA10PITState timer;
>      AwSdHostState mmc[AW_R40_NUM_MMCS];
> +    AwR40ClockCtlState ccu;
>      GICState gic;
>      MemoryRegion sram_a1;
>      MemoryRegion sram_a2;
> diff --git a/include/hw/misc/allwinner-r40-ccu.h
> b/include/hw/misc/allwinner-r40-ccu.h
> new file mode 100644
> index 0000000000..ceb74eff92
> --- /dev/null
> +++ b/include/hw/misc/allwinner-r40-ccu.h
> @@ -0,0 +1,65 @@
> +/*
> + * Allwinner R40 Clock Control Unit emulation
> + *
> + * Copyright (C) 2023 qianfan Zhao <qianfanguijin@163.com>
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation, either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef HW_MISC_ALLWINNER_R40_CCU_H
> +#define HW_MISC_ALLWINNER_R40_CCU_H
> +
> +#include "qom/object.h"
> +#include "hw/sysbus.h"
> +
> +/**
> + * @name Constants
> + * @{
> + */
> +
> +/** Size of register I/O address space used by CCU device */
> +#define AW_R40_CCU_IOSIZE        (0x400)
> +
> +/** Total number of known registers */
> +#define AW_R40_CCU_REGS_NUM      (AW_R40_CCU_IOSIZE / sizeof(uint32_t))
> +
> +/** @} */
> +
> +/**
> + * @name Object model
> + * @{
> + */
> +
> +#define TYPE_AW_R40_CCU    "allwinner-r40-ccu"
> +OBJECT_DECLARE_SIMPLE_TYPE(AwR40ClockCtlState, AW_R40_CCU)
> +
> +/** @} */
> +
> +/**
> + * Allwinner R40 CCU object instance state.
> + */
> +struct AwR40ClockCtlState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +    /*< public >*/
> +
> +    /** Maps I/O registers in physical memory */
> +    MemoryRegion iomem;
> +
> +    /** Array of hardware registers */
> +    uint32_t regs[AW_R40_CCU_REGS_NUM];
> +
> +};
> +
> +#endif /* HW_MISC_ALLWINNER_R40_CCU_H */
> --
> 2.25.1
>
>

--=20
Niek Linnenbank

--0000000000009bcc9d05fbabad82
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 10, 2023 at 12:30=E2=80=
=AFPM &lt;<a href=3D"mailto:qianfanguijin@163.com">qianfanguijin@163.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fro=
m: qianfan Zhao &lt;<a href=3D"mailto:qianfanguijin@163.com" target=3D"_bla=
nk">qianfanguijin@163.com</a>&gt;<br>
<br>
The CCU provides the registers to program the PLLs and the controls<br>
most of the clock generation, division, distribution, synchronization<br>
and gating.<br>
<br>
This commit adds support for the Clock Control Unit which emulates<br>
a simple read/write register interface.<br>
<br>
Signed-off-by: qianfan Zhao &lt;<a href=3D"mailto:qianfanguijin@163.com" ta=
rget=3D"_blank">qianfanguijin@163.com</a>&gt;<br></blockquote><div>Reviewed=
-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com">niekli=
nnenbank@gmail.com</a>&gt;<br></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
---<br>
=C2=A0hw/arm/allwinner-r40.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A08 +-<br>
=C2=A0hw/misc/allwinner-r40-ccu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 209 ++=
++++++++++++++++++++++++++<br>
=C2=A0hw/misc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0include/hw/arm/allwinner-r40.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<=
br>
=C2=A0include/hw/misc/allwinner-r40-ccu.h |=C2=A0 65 +++++++++<br>
=C2=A05 files changed, 284 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 hw/misc/allwinner-r40-ccu.c<br>
=C2=A0create mode 100644 include/hw/misc/allwinner-r40-ccu.h<br>
<br>
diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c<br>
index b743d64253..128c0ca470 100644<br>
--- a/hw/arm/allwinner-r40.c<br>
+++ b/hw/arm/allwinner-r40.c<br>
@@ -42,6 +42,7 @@ const hwaddr allwinner_r40_memmap[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0[AW_R40_DEV_MMC1]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x01c10=
000,<br>
=C2=A0 =C2=A0 =C2=A0[AW_R40_DEV_MMC2]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x01c11=
000,<br>
=C2=A0 =C2=A0 =C2=A0[AW_R40_DEV_MMC3]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x01c12=
000,<br>
+=C2=A0 =C2=A0 [AW_R40_DEV_CCU]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x01c20000,<=
br>
=C2=A0 =C2=A0 =C2=A0[AW_R40_DEV_PIT]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x01c20=
c00,<br>
=C2=A0 =C2=A0 =C2=A0[AW_R40_DEV_UART0]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c28000,<=
br>
=C2=A0 =C2=A0 =C2=A0[AW_R40_DEV_GIC_DIST]=C2=A0 =C2=A0=3D 0x01c81000,<br>
@@ -80,7 +81,6 @@ static struct AwR40Unimplemented r40_unimplemented[] =3D =
{<br>
=C2=A0 =C2=A0 =C2=A0{ &quot;usb2-host&quot;,=C2=A0 0x01c1c000, 4 * KiB },<b=
r>
=C2=A0 =C2=A0 =C2=A0{ &quot;cs1&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c1d00=
0, 4 * KiB },<br>
=C2=A0 =C2=A0 =C2=A0{ &quot;spi3&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c1f00=
0, 4 * KiB },<br>
-=C2=A0 =C2=A0 { &quot;ccu&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c20000, 1 =
* KiB },<br>
=C2=A0 =C2=A0 =C2=A0{ &quot;rtc&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c2040=
0, 1 * KiB },<br>
=C2=A0 =C2=A0 =C2=A0{ &quot;pio&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c2080=
0, 1 * KiB },<br>
=C2=A0 =C2=A0 =C2=A0{ &quot;owa&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c2100=
0, 1 * KiB },<br>
@@ -253,6 +253,8 @@ static void allwinner_r40_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0object_property_add_alias(obj, &quot;clk1-freq&quot;, O=
BJECT(&amp;s-&gt;timer),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;clk1-freq&quot;);<br>
<br>
+=C2=A0 =C2=A0 object_initialize_child(obj, &quot;ccu&quot;, &amp;s-&gt;ccu=
, TYPE_AW_R40_CCU);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0for (int i =3D 0; i &lt; AW_R40_NUM_MMCS; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, mmc_names[i]=
, &amp;s-&gt;mmc[i],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_AW_SDHOST_SUN5I);<br>
@@ -367,6 +369,10 @@ static void allwinner_r40_realize(DeviceState *dev, Er=
ror **errp)<br>
=C2=A0 =C2=A0 =C2=A0memory_region_add_subregion(get_system_memory(),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;memmap[AW_R40_DEV_SRAM_A=
4], &amp;s-&gt;sram_a4);<br>
<br>
+=C2=A0 =C2=A0 /* Clock Control Unit */<br>
+=C2=A0 =C2=A0 sysbus_realize(SYS_BUS_DEVICE(&amp;s-&gt;ccu), &amp;error_fa=
tal);<br>
+=C2=A0 =C2=A0 sysbus_mmio_map(SYS_BUS_DEVICE(&amp;s-&gt;ccu), 0, s-&gt;mem=
map[AW_R40_DEV_CCU]);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* SD/MMC */<br>
=C2=A0 =C2=A0 =C2=A0for (int i =3D 0; i &lt; AW_R40_NUM_MMCS; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_irq irq =3D qdev_get_gpio_in(DEVICE(=
&amp;s-&gt;gic),<br>
diff --git a/hw/misc/allwinner-r40-ccu.c b/hw/misc/allwinner-r40-ccu.c<br>
new file mode 100644<br>
index 0000000000..d82fee12db<br>
--- /dev/null<br>
+++ b/hw/misc/allwinner-r40-ccu.c<br>
@@ -0,0 +1,209 @@<br>
+/*<br>
+ * Allwinner R40 Clock Control Unit emulation<br>
+ *<br>
+ * Copyright (C) 2023 qianfan Zhao &lt;<a href=3D"mailto:qianfanguijin@163=
.com" target=3D"_blank">qianfanguijin@163.com</a>&gt;<br>
+ *<br>
+ * This program is free software: you can redistribute it and/or modify<br=
>
+ * it under the terms of the GNU General Public License as published by<br=
>
+ * the Free Software Foundation, either version 2 of the License, or<br>
+ * (at your option) any later version.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful,<br>
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<br>
+ * GNU General Public License for more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License<br>
+ * along with this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gn=
u.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/li=
censes/</a>&gt;.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu/units.h&quot;<br>
+#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;migration/vmstate.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
+#include &quot;qemu/module.h&quot;<br>
+#include &quot;hw/misc/allwinner-r40-ccu.h&quot;<br>
+<br>
+/* CCU register offsets */<br>
+enum {<br>
+=C2=A0 =C2=A0 REG_PLL_CPUX_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0x0000,<br>
+=C2=A0 =C2=A0 REG_PLL_AUDIO_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x0=
008,<br>
+=C2=A0 =C2=A0 REG_PLL_VIDEO0_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x0=
010,<br>
+=C2=A0 =C2=A0 REG_PLL_VE_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D 0x0018,<br>
+=C2=A0 =C2=A0 REG_PLL_DDR0_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0x0020,<br>
+=C2=A0 =C2=A0 REG_PLL_PERIPH0_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x0028,<=
br>
+=C2=A0 =C2=A0 REG_PLL_PERIPH1_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x002c,<=
br>
+=C2=A0 =C2=A0 REG_PLL_VIDEO1_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x0=
030,<br>
+=C2=A0 =C2=A0 REG_PLL_SATA_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0x0034,<br>
+=C2=A0 =C2=A0 REG_PLL_GPU_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D 0x0038,<br>
+=C2=A0 =C2=A0 REG_PLL_MIPI_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0x0040,<br>
+=C2=A0 =C2=A0 REG_PLL_DE_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D 0x0048,<br>
+=C2=A0 =C2=A0 REG_PLL_DDR1_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0x004c,<br>
+=C2=A0 =C2=A0 REG_AHB1_APB1_CFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0x0054,<br>
+=C2=A0 =C2=A0 REG_APB2_CFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =3D 0x0058,<br>
+=C2=A0 =C2=A0 REG_MMC0_CLK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =3D 0x0088,<br>
+=C2=A0 =C2=A0 REG_MMC1_CLK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =3D 0x008c,<br>
+=C2=A0 =C2=A0 REG_MMC2_CLK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =3D 0x0090,<br>
+=C2=A0 =C2=A0 REG_MMC3_CLK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =3D 0x0094,<br>
+=C2=A0 =C2=A0 REG_USBPHY_CFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D 0x00cc,<br>
+=C2=A0 =C2=A0 REG_PLL_DDR_AUX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D 0x00f0,<br>
+=C2=A0 =C2=A0 REG_DRAM_CFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =3D 0x00f4,<br>
+=C2=A0 =C2=A0 REG_PLL_DDR1_CFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D 0x00f8,<br>
+=C2=A0 =C2=A0 REG_DRAM_CLK_GATING=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x0=
100,<br>
+=C2=A0 =C2=A0 REG_GMAC_CLK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =3D 0x0164,<br>
+=C2=A0 =C2=A0 REG_SYS_32K_CLK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D 0x0310,<br>
+=C2=A0 =C2=A0 REG_PLL_LOCK_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0x0320,<br>
+};<br>
+<br>
+#define REG_INDEX(offset)=C2=A0 =C2=A0 (offset / sizeof(uint32_t))<br>
+<br>
+/* CCU register flags */<br>
+enum {<br>
+=C2=A0 =C2=A0 REG_PLL_ENABLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D (=
1 &lt;&lt; 31),<br>
+=C2=A0 =C2=A0 REG_PLL_LOCK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D (1 &lt;&lt; 28),<br>
+};<br>
+<br>
+static uint64_t allwinner_r40_ccu_read(void *opaque, hwaddr offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned =
size)<br>
+{<br>
+=C2=A0 =C2=A0 const AwR40ClockCtlState *s =3D AW_R40_CCU(opaque);<br>
+=C2=A0 =C2=A0 const uint32_t idx =3D REG_INDEX(offset);<br>
+<br>
+=C2=A0 =C2=A0 switch (offset) {<br>
+=C2=A0 =C2=A0 case 0x324 ... AW_R40_CCU_IOSIZE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: out-o=
f-bounds offset 0x%04x\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, (uint32_t)offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return s-&gt;regs[idx];<br>
+}<br>
+<br>
+static void allwinner_r40_ccu_write(void *opaque, hwaddr offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t val, unsigned=
 size)<br>
+{<br>
+=C2=A0 =C2=A0 AwR40ClockCtlState *s =3D AW_R40_CCU(opaque);<br>
+<br>
+=C2=A0 =C2=A0 switch (offset) {<br>
+=C2=A0 =C2=A0 case REG_DRAM_CFG:=C2=A0 =C2=A0 /* DRAM Configuration(for DD=
R0) */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* bit16: SDRCLK_UPD (SDRCLK configuration 0 u=
pdate) */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 val &amp;=3D ~(1 &lt;&lt; 16);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case REG_PLL_DDR1_CTRL: /* DDR1 Control register */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* bit30: SDRPLL_UPD */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 val &amp;=3D ~(1 &lt;&lt; 30);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (val &amp; REG_PLL_ENABLE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val |=3D REG_PLL_LOCK;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case REG_PLL_CPUX_CTRL:<br>
+=C2=A0 =C2=A0 case REG_PLL_AUDIO_CTRL:<br>
+=C2=A0 =C2=A0 case REG_PLL_VE_CTRL:<br>
+=C2=A0 =C2=A0 case REG_PLL_VIDEO0_CTRL:<br>
+=C2=A0 =C2=A0 case REG_PLL_DDR0_CTRL:<br>
+=C2=A0 =C2=A0 case REG_PLL_PERIPH0_CTRL:<br>
+=C2=A0 =C2=A0 case REG_PLL_PERIPH1_CTRL:<br>
+=C2=A0 =C2=A0 case REG_PLL_VIDEO1_CTRL:<br>
+=C2=A0 =C2=A0 case REG_PLL_SATA_CTRL:<br>
+=C2=A0 =C2=A0 case REG_PLL_GPU_CTRL:<br>
+=C2=A0 =C2=A0 case REG_PLL_MIPI_CTRL:<br>
+=C2=A0 =C2=A0 case REG_PLL_DE_CTRL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (val &amp; REG_PLL_ENABLE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val |=3D REG_PLL_LOCK;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 0x324 ... AW_R40_CCU_IOSIZE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: out-o=
f-bounds offset 0x%04x\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, (uint32_t)offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;%s: unimplement=
ed write offset 0x%04x\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, (uint32_t)offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(offset)] =3D (uint32_t) val;<br>
+}<br>
+<br>
+static const MemoryRegionOps allwinner_r40_ccu_ops =3D {<br>
+=C2=A0 =C2=A0 .read =3D allwinner_r40_ccu_read,<br>
+=C2=A0 =C2=A0 .write =3D allwinner_r40_ccu_write,<br>
+=C2=A0 =C2=A0 .endianness =3D DEVICE_NATIVE_ENDIAN,<br>
+=C2=A0 =C2=A0 .valid =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 4,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 .impl.min_access_size =3D 4,<br>
+};<br>
+<br>
+static void allwinner_r40_ccu_reset(DeviceState *dev)<br>
+{<br>
+=C2=A0 =C2=A0 AwR40ClockCtlState *s =3D AW_R40_CCU(dev);<br>
+<br>
+=C2=A0 =C2=A0 memset(s-&gt;regs, 0, sizeof(s-&gt;regs));<br>
+<br>
+=C2=A0 =C2=A0 /* Set default values for registers */<br>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL_CPUX_CTRL)]=C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D 0x00001000;<br>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL_AUDIO_CTRL)]=C2=A0 =C2=A0 =C2=
=A0 =3D 0x00035514;<br>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL_VIDEO0_CTRL)]=C2=A0 =C2=A0 =C2=
=A0=3D 0x03006207;<br>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL_VE_CTRL)]=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D 0x03006207;<br>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL_DDR0_CTRL)]=C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D 0x00001000,<br>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL_PERIPH0_CTRL)]=C2=A0 =C2=A0 =3D=
 0x00041811;<br>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL_PERIPH1_CTRL)]=C2=A0 =C2=A0 =3D=
 0x00041811;<br>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL_VIDEO1_CTRL)]=C2=A0 =C2=A0 =C2=
=A0=3D 0x03006207;<br>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL_SATA_CTRL)]=C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D 0x00001811;<br>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL_GPU_CTRL)]=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D 0x03006207;<br>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL_MIPI_CTRL)]=C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D 0x00000515;<br>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL_DE_CTRL)]=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D 0x03006207;<br>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL_DDR1_CTRL)]=C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D 0x00001800;<br>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_AHB1_APB1_CFG)]=C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D 0x00001010;<br>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_APB2_CFG)]=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D 0x01000000;<br>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL_DDR_AUX)]=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D 0x00000001;<br>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL_DDR1_CFG)]=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D 0x0ccca000;<br>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_SYS_32K_CLK)]=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D 0x0000000f;<br>
+}<br>
+<br>
+static void allwinner_r40_ccu_init(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);<br>
+=C2=A0 =C2=A0 AwR40ClockCtlState *s =3D AW_R40_CCU(obj);<br>
+<br>
+=C2=A0 =C2=A0 /* Memory mapping */<br>
+=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;iomem, OBJECT(s), &amp;allw=
inner_r40_ccu_ops, s,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 TYPE_AW_R40_CCU, AW_R40_CCU_IOSIZE);<br>
+=C2=A0 =C2=A0 sysbus_init_mmio(sbd, &amp;s-&gt;iomem);<br>
+}<br>
+<br>
+static const VMStateDescription allwinner_r40_ccu_vmstate =3D {<br>
+=C2=A0 =C2=A0 .name =3D &quot;allwinner-r40-ccu&quot;,<br>
+=C2=A0 =C2=A0 .version_id =3D 1,<br>
+=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
+=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32_ARRAY(regs, AwR40ClockCtlState,=
 AW_R40_CCU_REGS_NUM),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
+=C2=A0 =C2=A0 }<br>
+};<br>
+<br>
+static void allwinner_r40_ccu_class_init(ObjectClass *klass, void *data)<b=
r>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 dc-&gt;reset =3D allwinner_r40_ccu_reset;<br>
+=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;allwinner_r40_ccu_vmstate;<br>
+}<br>
+<br>
+static const TypeInfo allwinner_r40_ccu_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_AW_R40_CCU,=
<br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEVICE,<=
br>
+=C2=A0 =C2=A0 .instance_init =3D allwinner_r40_ccu_init,<br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(AwR40ClockCtlState),<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D allwinner_r40_ccu_class_init,<b=
r>
+};<br>
+<br>
+static void allwinner_r40_ccu_register(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;allwinner_r40_ccu_info);<br>
+}<br>
+<br>
+type_init(allwinner_r40_ccu_register)<br>
diff --git a/hw/misc/meson.build b/hw/misc/meson.build<br>
index a40245ad44..96e35f1cdb 100644<br>
--- a/hw/misc/meson.build<br>
+++ b/hw/misc/meson.build<br>
@@ -44,6 +44,7 @@ specific_ss.add(when: &#39;CONFIG_ALLWINNER_H3&#39;, if_t=
rue: files(&#39;allwinner-cpucfg.c&#39;<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_ALLWINNER_H3&#39;, if_true: files(&#=
39;allwinner-h3-dramc.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_ALLWINNER_H3&#39;, if_true: files(&#=
39;allwinner-h3-sysctrl.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_ALLWINNER_H3&#39;, if_true: files(&#=
39;allwinner-sid.c&#39;))<br>
+softmmu_ss.add(when: &#39;CONFIG_ALLWINNER_R40&#39;, if_true: files(&#39;a=
llwinner-r40-ccu.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_AXP209_PMU&#39;, if_true: files(&#39=
;axp209.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_REALVIEW&#39;, if_true: files(&#39;a=
rm_sysctl.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_NSERIES&#39;, if_true: files(&#39;cb=
us.c&#39;))<br>
diff --git a/include/hw/arm/allwinner-r40.h b/include/hw/arm/allwinner-r40.=
h<br>
index 348bf25d6b..3be9dc962b 100644<br>
--- a/include/hw/arm/allwinner-r40.h<br>
+++ b/include/hw/arm/allwinner-r40.h<br>
@@ -25,6 +25,7 @@<br>
=C2=A0#include &quot;hw/timer/allwinner-a10-pit.h&quot;<br>
=C2=A0#include &quot;hw/intc/arm_gic.h&quot;<br>
=C2=A0#include &quot;hw/sd/allwinner-sdhost.h&quot;<br>
+#include &quot;hw/misc/allwinner-r40-ccu.h&quot;<br>
=C2=A0#include &quot;target/arm/cpu.h&quot;<br>
=C2=A0#include &quot;sysemu/block-backend.h&quot;<br>
<br>
@@ -79,6 +80,7 @@ struct AwR40State {<br>
=C2=A0 =C2=A0 =C2=A0const hwaddr *memmap;<br>
=C2=A0 =C2=A0 =C2=A0AwA10PITState timer;<br>
=C2=A0 =C2=A0 =C2=A0AwSdHostState mmc[AW_R40_NUM_MMCS];<br>
+=C2=A0 =C2=A0 AwR40ClockCtlState ccu;<br>
=C2=A0 =C2=A0 =C2=A0GICState gic;<br>
=C2=A0 =C2=A0 =C2=A0MemoryRegion sram_a1;<br>
=C2=A0 =C2=A0 =C2=A0MemoryRegion sram_a2;<br>
diff --git a/include/hw/misc/allwinner-r40-ccu.h b/include/hw/misc/allwinne=
r-r40-ccu.h<br>
new file mode 100644<br>
index 0000000000..ceb74eff92<br>
--- /dev/null<br>
+++ b/include/hw/misc/allwinner-r40-ccu.h<br>
@@ -0,0 +1,65 @@<br>
+/*<br>
+ * Allwinner R40 Clock Control Unit emulation<br>
+ *<br>
+ * Copyright (C) 2023 qianfan Zhao &lt;<a href=3D"mailto:qianfanguijin@163=
.com" target=3D"_blank">qianfanguijin@163.com</a>&gt;<br>
+ *<br>
+ * This program is free software: you can redistribute it and/or modify<br=
>
+ * it under the terms of the GNU General Public License as published by<br=
>
+ * the Free Software Foundation, either version 2 of the License, or<br>
+ * (at your option) any later version.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful,<br>
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<br>
+ * GNU General Public License for more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License<br>
+ * along with this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gn=
u.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/li=
censes/</a>&gt;.<br>
+ */<br>
+<br>
+#ifndef HW_MISC_ALLWINNER_R40_CCU_H<br>
+#define HW_MISC_ALLWINNER_R40_CCU_H<br>
+<br>
+#include &quot;qom/object.h&quot;<br>
+#include &quot;hw/sysbus.h&quot;<br>
+<br>
+/**<br>
+ * @name Constants<br>
+ * @{<br>
+ */<br>
+<br>
+/** Size of register I/O address space used by CCU device */<br>
+#define AW_R40_CCU_IOSIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x400)<br>
+<br>
+/** Total number of known registers */<br>
+#define AW_R40_CCU_REGS_NUM=C2=A0 =C2=A0 =C2=A0 (AW_R40_CCU_IOSIZE / sizeo=
f(uint32_t))<br>
+<br>
+/** @} */<br>
+<br>
+/**<br>
+ * @name Object model<br>
+ * @{<br>
+ */<br>
+<br>
+#define TYPE_AW_R40_CCU=C2=A0 =C2=A0 &quot;allwinner-r40-ccu&quot;<br>
+OBJECT_DECLARE_SIMPLE_TYPE(AwR40ClockCtlState, AW_R40_CCU)<br>
+<br>
+/** @} */<br>
+<br>
+/**<br>
+ * Allwinner R40 CCU object instance state.<br>
+ */<br>
+struct AwR40ClockCtlState {<br>
+=C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
+=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
+=C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
+<br>
+=C2=A0 =C2=A0 /** Maps I/O registers in physical memory */<br>
+=C2=A0 =C2=A0 MemoryRegion iomem;<br>
+<br>
+=C2=A0 =C2=A0 /** Array of hardware registers */<br>
+=C2=A0 =C2=A0 uint32_t regs[AW_R40_CCU_REGS_NUM];<br>
+<br>
+};<br>
+<br>
+#endif /* HW_MISC_ALLWINNER_R40_CCU_H */<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div>Niek Linnenbank<br><br></div></div></div></div>

--0000000000009bcc9d05fbabad82--

