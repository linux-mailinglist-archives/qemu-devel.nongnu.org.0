Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAEC6C90E9
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 22:14:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgBC8-0000dI-78; Sat, 25 Mar 2023 17:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pgBC5-0000ck-Ke; Sat, 25 Mar 2023 17:12:57 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pgBC3-0004VG-15; Sat, 25 Mar 2023 17:12:57 -0400
Received: by mail-ed1-x52d.google.com with SMTP id ek18so21195820edb.6;
 Sat, 25 Mar 2023 14:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679778773;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zq13c4PWmWBsUHJxHxDEP0rKN4Dx3MZ2YFzgPK7jV3g=;
 b=Fl4PZd8rbsxe1iqlWUt8ibKUSZGqRc5D+FORk9Rsnmp/bPKRbGg1pvE9O1GmMOY/tY
 Fov74Mcvgh/fYxWYAq+75xF9wwJ8UpswZUanjcj4vRKXo9BV/S6GKSC8i0+lvT56sQrt
 xBHLfJEqZpoDZd27ld2Qe4yFVliD+02RGxd0JYeM6uCjvUA3/hMPYKc2h4v45BHMJdAe
 ypNIuH/8asvMRBSasqiYg6PXmSSVGj/zu9FDrsvR8+FFFLTHsmLFkxgCBdFZwtTKcf7j
 rNqu+KaNySUfwUD+/YwWCmNj9iTj+GX10FtqBjmGQ4TJJ6vKDhp+a77W4K47l1Uey2Iq
 aRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679778773;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zq13c4PWmWBsUHJxHxDEP0rKN4Dx3MZ2YFzgPK7jV3g=;
 b=md1NN3d3HxfMMifbTBd3Yg1k6tCqWaIL16JT+6gBei//+I/kU4SlFZuJON/ZBioPZO
 ZrSQwFlvqLylN6y8N+OPG9jJgav7JAiR5lAL2DrgCn0dEIwO8NT2AenOSnhhoO8hk05b
 5OIrJgB1SNZAo2DTRygDTHUdw4c4Dp//WPsBb8qaZl1SCBRJKaHosbTlcc8xfJej78EV
 Gj0uWCfd1iyRlanNfeou67a8zjqIFCOa0rcTNZLtftlTejOEZnt/mfPTn68sEgqlLF/n
 llLmENVjhdHzPBgNPAzlsrEBTTrqvBhA0Y9HadaQGHoHp0rAq+onS5R8T1Yf1MO/JgvW
 Eoyw==
X-Gm-Message-State: AAQBX9c1MFurQHugGQk5nZHg2RrK3gTyG21H2VDOQ0V8RjIwJIiJyc3o
 ttPDT3nIcqfTpsOjRPLWAWSbBIM49sMHw59vL68=
X-Google-Smtp-Source: AKy350bLilF5GFPxhGAsNQXELnxCDlDNqkGhuuBSyXAY9x7+3lXleGp0S6QXliV2qeBwJWVAOAxarM0eFbQAeY27Q08=
X-Received: by 2002:a17:907:7e95:b0:93e:9362:75fd with SMTP id
 qb21-20020a1709077e9500b0093e936275fdmr2603806ejc.9.1679778773019; Sat, 25
 Mar 2023 14:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230321102510.16754-1-qianfanguijin@163.com>
 <20230321102510.16754-3-qianfanguijin@163.com>
In-Reply-To: <20230321102510.16754-3-qianfanguijin@163.com>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Sat, 25 Mar 2023 22:12:44 +0100
Message-ID: <CABtshVS8+=yF2gb3Fpytzs+eLejnMqCpDJOqaTcGWnFogy0kzQ@mail.gmail.com>
Subject: Re: [PATCH v1 02/11] hw/arm/allwinner-r40: add Clock Control Unit
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ed1-x52d.google.com
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

Hi,

On Tue, Mar 21, 2023 at 11:25=E2=80=AFAM <qianfanguijin@163.com> wrote:
>
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
> ---
>  hw/arm/allwinner-r40.c              |   7 +-
>  hw/misc/allwinner-r40-ccu.c         | 207 ++++++++++++++++++++++++++++
>  hw/misc/meson.build                 |   1 +
>  include/hw/arm/allwinner-r40.h      |   2 +
>  include/hw/misc/allwinner-r40-ccu.h |  65 +++++++++
>  5 files changed, 281 insertions(+), 1 deletion(-)
>  create mode 100644 hw/misc/allwinner-r40-ccu.c
>  create mode 100644 include/hw/misc/allwinner-r40-ccu.h
>
> diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c
> index d0516f4e96..3517682aed 100644
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
> @@ -246,6 +246,7 @@ static void allwinner_r40_init(Object *obj)
>      object_property_add_alias(obj, "clk1-freq", OBJECT(&s->timer),
>                                "clk1-freq");
>
> +    object_initialize_child(obj, "ccu", &s->ccu, TYPE_AW_R40_CCU);
>      object_initialize_child(obj, "mmc0", &s->mmc0, TYPE_AW_SDHOST_SUN5I)=
;
>      object_initialize_child(obj, "mmc1", &s->mmc1, TYPE_AW_SDHOST_SUN5I)=
;
>      object_initialize_child(obj, "mmc2", &s->mmc2, TYPE_AW_SDHOST_SUN5I)=
;
> @@ -358,6 +359,10 @@ static void allwinner_r40_realize(DeviceState *dev, =
Error **errp)
>      memory_region_add_subregion(get_system_memory(), s->memmap[AW_R40_DE=
V_SRAM_A4],
>                                  &s->sram_a4);
>
> +    /* Clock Control Unit */
> +    sysbus_realize(SYS_BUS_DEVICE(&s->ccu), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->ccu), 0, s->memmap[AW_R40_DEV_CCU=
]);
> +
>      /* SD/MMC */
>      object_property_set_link(OBJECT(&s->mmc0), "dma-memory",
>                               OBJECT(get_system_memory()), &error_fatal);
> diff --git a/hw/misc/allwinner-r40-ccu.c b/hw/misc/allwinner-r40-ccu.c
> new file mode 100644
> index 0000000000..0abe006874
> --- /dev/null
> +++ b/hw/misc/allwinner-r40-ccu.c
> @@ -0,0 +1,207 @@
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

Perhaps, for completeness, it would be good to have all defined macros
here under cases, as well as the special case where register read is
unimplemented, like you have in write function.

> +    case 0x324 ... AW_R40_CCU_IOSIZE:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\=
n",
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

Please create a macro for this bitmask instead of comment.

> +        break;
> +    case REG_PLL_DDR1_CTRL: /* DDR1 Control register */
> +        /* bit30: SDRPLL_UPD */
> +        val &=3D ~(1 << 30);

Same here.

> +        if (val & REG_PLL_ENABLE)

Braces again (you will see all suggestions when you run the checkpatch.pl).

> +            val |=3D REG_PLL_LOCK;
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
> +        if (val & REG_PLL_ENABLE)
> +            val |=3D REG_PLL_LOCK;
> +        break;
> +    case 0x324 ... AW_R40_CCU_IOSIZE:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\=
n",
> +                      __func__, (uint32_t)offset);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%s: unimplemented write offset 0x%04x\=
n",
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
> +        VMSTATE_UINT32_ARRAY(regs, AwR40ClockCtlState, AW_R40_CCU_REGS_N=
UM),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void allwinner_r40_ccu_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    dc->reset =3D allwinner_r40_ccu_reset;

I would guess that all new implementations should use the 'three-phase rese=
t'?

Best regards,
Strahinja


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
> @@ -44,6 +44,7 @@ specific_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: f=
iles('allwinner-cpucfg.c'
>  softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3=
-dramc.c'))
>  softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3=
-sysctrl.c'))
>  softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-si=
d.c'))
> +softmmu_ss.add(when: 'CONFIG_ALLWINNER_R40', if_true: files('allwinner-r=
40-ccu.c'))
>  softmmu_ss.add(when: 'CONFIG_AXP209_PMU', if_true: files('axp209.c'))
>  softmmu_ss.add(when: 'CONFIG_REALVIEW', if_true: files('arm_sysctl.c'))
>  softmmu_ss.add(when: 'CONFIG_NSERIES', if_true: files('cbus.c'))
> diff --git a/include/hw/arm/allwinner-r40.h b/include/hw/arm/allwinner-r4=
0.h
> index 46bda2c54e..b355af2c4f 100644
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
> @@ -80,6 +81,7 @@ struct AwR40State {
>      AwSdHostState mmc1;
>      AwSdHostState mmc2;
>      AwSdHostState mmc3;
> +    AwR40ClockCtlState ccu;
>      GICState gic;
>      MemoryRegion sram_a1;
>      MemoryRegion sram_a2;
> diff --git a/include/hw/misc/allwinner-r40-ccu.h b/include/hw/misc/allwin=
ner-r40-ccu.h
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

