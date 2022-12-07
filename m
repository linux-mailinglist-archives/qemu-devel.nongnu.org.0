Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A650B646420
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 23:32:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p32wv-0006Qz-OR; Wed, 07 Dec 2022 17:31:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1p32wq-0006Px-Dy; Wed, 07 Dec 2022 17:31:28 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1p32wm-0005BE-PV; Wed, 07 Dec 2022 17:31:28 -0500
Received: by mail-wr1-x42e.google.com with SMTP id bx10so30298281wrb.0;
 Wed, 07 Dec 2022 14:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XZUigi7b5KkucfM6AenEAOiCiBxSTxn2WiD9JRb74co=;
 b=FOwRMq3Qvl9vrCUVeHqARtXn4NdBwmxpUQj/cjk0RZyGjVQDswGbcQT1nAGY5txTYo
 xW5dtn315uGfBwJmVVIwJDbRJP/V6QnMsowvHI0AtOch5uVFABnQJQcGGWJ+iLUy1+ZR
 90aA5W140GPEPgPIfBJfy6NKaT+0OKehQx3VoHtaJZIJGoGOveSWJ64akN0N/z8Hs95q
 aOsTKngt5+IKWweVLp4cojRC2Aj5zIpsuI+xO/ZpsQzesKz86aLlRwHibOWTHGIqMZKJ
 UZcqlyaZR3kKxgYYXItNcq3AWqBk2bksBYNNrj+RjfYSiGotLrUD11NygkkL2pR9Qode
 y3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XZUigi7b5KkucfM6AenEAOiCiBxSTxn2WiD9JRb74co=;
 b=csi1tdUaOmL/dbWcKJP34NZm2hOrX09FccpjUrd10o8G5frokAFtmRWPgF4A16cWLO
 hKn27g4LMbPlEly1PQ1dAzGS7CcPc2R91BbyoXMq7crcph9REcOmDfIAh2CrsAZoKH4i
 LwEwoQIGD12Dkm7/hTVEoUlCESxsXa6/gV21/Dwcq855eFt0rTXvbf3VW1OejHrqrJmH
 KchWEVO3jtne6ZHzZx/9a5RI5k/qF8dsOgbVym/9s17HinQ84fCZcq9UrBHfqDklsW8o
 sFYIvZRohr/X+NvnmWPGibLXtBAVnSJlDvVyS0LoJkluSNXRCHMoKfOB+fjQopSb87pt
 ISrQ==
X-Gm-Message-State: ANoB5plaLKm9L+oEFpwDo7kIwCki+npgjOPy3svXMqZoqfIvB3Zkol0E
 tQSOlyc9AASfPlJ++r0OCJCUh3rUbBePUro3kWwPngVuH2A=
X-Google-Smtp-Source: AA0mqf7SMd7sC0eWMpSdAzzkiakC3svgkgvgCkV6tHuif3kA7++C6jvTBt8dLArdg3+ukqtl+jpKKN1gxRnhsTUkNLs=
X-Received: by 2002:adf:ea4e:0:b0:242:1d48:e043 with SMTP id
 j14-20020adfea4e000000b002421d48e043mr26550559wrn.498.1670452281537; Wed, 07
 Dec 2022 14:31:21 -0800 (PST)
MIME-Version: 1.0
References: <20221203231904.25155-1-strahinja.p.jankovic@gmail.com>
 <20221203231904.25155-2-strahinja.p.jankovic@gmail.com>
In-Reply-To: <20221203231904.25155-2-strahinja.p.jankovic@gmail.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Wed, 7 Dec 2022 23:31:10 +0100
Message-ID: <CAPan3WpHOeRbDikZAwHH7XsUKMbqyMbwjLM-K6b5Wog7g2diQw@mail.gmail.com>
Subject: Re: [PATCH 1/6] hw/misc: Allwinner-A10 Clock Controller Module
 Emulation
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000dafa1305ef447a70"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000dafa1305ef447a70
Content-Type: text/plain; charset="UTF-8"

Hi Strahinja,

On Sun, Dec 4, 2022 at 12:19 AM Strahinja Jankovic <
strahinjapjankovic@gmail.com> wrote:

> During SPL boot several Clock Controller Module (CCM) registers are
> read, most important are PLL and Tuning, as well as divisor registers.
>
> This patch adds these registers and initializes reset values from user's
> guide.
>
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
>

Looks fine to me:

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>

Regards,
Niek

> ---
>  hw/arm/Kconfig                      |   1 +
>  hw/arm/allwinner-a10.c              |   7 +
>  hw/misc/Kconfig                     |   3 +
>  hw/misc/allwinner-a10-ccm.c         | 224 ++++++++++++++++++++++++++++
>  hw/misc/meson.build                 |   1 +
>  include/hw/arm/allwinner-a10.h      |   2 +
>  include/hw/misc/allwinner-a10-ccm.h |  67 +++++++++
>  7 files changed, 305 insertions(+)
>  create mode 100644 hw/misc/allwinner-a10-ccm.c
>  create mode 100644 include/hw/misc/allwinner-a10-ccm.h
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 17fcde8e1c..14f52b41af 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -319,6 +319,7 @@ config ALLWINNER_A10
>      select AHCI
>      select ALLWINNER_A10_PIT
>      select ALLWINNER_A10_PIC
> +    select ALLWINNER_A10_CCM
>      select ALLWINNER_EMAC
>      select SERIAL
>      select UNIMP
> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
> index 79082289ea..86baeeeca2 100644
> --- a/hw/arm/allwinner-a10.c
> +++ b/hw/arm/allwinner-a10.c
> @@ -26,6 +26,7 @@
>  #include "hw/usb/hcd-ohci.h"
>
>  #define AW_A10_MMC0_BASE        0x01c0f000
> +#define AW_A10_CCM_BASE         0x01c20000
>  #define AW_A10_PIC_REG_BASE     0x01c20400
>  #define AW_A10_PIT_REG_BASE     0x01c20c00
>  #define AW_A10_UART0_REG_BASE   0x01c28000
> @@ -46,6 +47,8 @@ static void aw_a10_init(Object *obj)
>
>      object_initialize_child(obj, "timer", &s->timer, TYPE_AW_A10_PIT);
>
> +    object_initialize_child(obj, "ccm", &s->ccm, TYPE_AW_A10_CCM);
> +
>      object_initialize_child(obj, "emac", &s->emac, TYPE_AW_EMAC);
>
>      object_initialize_child(obj, "sata", &s->sata, TYPE_ALLWINNER_AHCI);
> @@ -103,6 +106,10 @@ static void aw_a10_realize(DeviceState *dev, Error
> **errp)
>      memory_region_add_subregion(get_system_memory(), 0x00000000,
> &s->sram_a);
>      create_unimplemented_device("a10-sram-ctrl", 0x01c00000, 4 * KiB);
>
> +    /* Clock Control Module */
> +    sysbus_realize(SYS_BUS_DEVICE(&s->ccm), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->ccm), 0, AW_A10_CCM_BASE);
> +
>      /* FIXME use qdev NIC properties instead of nd_table[] */
>      if (nd_table[0].used) {
>          qemu_check_nic_model(&nd_table[0], TYPE_AW_EMAC);
> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index cbabe9f78c..ed07bf4133 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -174,4 +174,7 @@ config VIRT_CTRL
>  config LASI
>      bool
>
> +config ALLWINNER_A10_CCM
> +    bool
> +
>  source macio/Kconfig
> diff --git a/hw/misc/allwinner-a10-ccm.c b/hw/misc/allwinner-a10-ccm.c
> new file mode 100644
> index 0000000000..68146ee340
> --- /dev/null
> +++ b/hw/misc/allwinner-a10-ccm.c
> @@ -0,0 +1,224 @@
> +/*
> + * Allwinner A10 Clock Control Module emulation
> + *
> + * Copyright (C) 2022 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> + *
> + *  This file is derived from Allwinner H3 CCU,
> + *  by Niek Linnenbank.
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
> +#include "hw/misc/allwinner-a10-ccm.h"
> +
> +/* CCM register offsets */
> +enum {
> +    REG_PLL1_CFG             = 0x0000, /* PLL1 Control */
> +    REG_PLL1_TUN             = 0x0004, /* PLL1 Tuning */
> +    REG_PLL2_CFG             = 0x0008, /* PLL2 Control */
> +    REG_PLL2_TUN             = 0x000C, /* PLL2 Tuning */
> +    REG_PLL3_CFG             = 0x0010, /* PLL3 Control */
> +    REG_PLL4_CFG             = 0x0018, /* PLL4 Control */
> +    REG_PLL5_CFG             = 0x0020, /* PLL5 Control */
> +    REG_PLL5_TUN             = 0x0024, /* PLL5 Tuning */
> +    REG_PLL6_CFG             = 0x0028, /* PLL6 Control */
> +    REG_PLL6_TUN             = 0x002C, /* PLL6 Tuning */
> +    REG_PLL7_CFG             = 0x0030, /* PLL7 Control */
> +    REG_PLL1_TUN2            = 0x0038, /* PLL1 Tuning2 */
> +    REG_PLL5_TUN2            = 0x003C, /* PLL5 Tuning2 */
> +    REG_PLL8_CFG             = 0x0040, /* PLL8 Control */
> +    REG_OSC24M_CFG           = 0x0050, /* OSC24M Control */
> +    REG_CPU_AHB_APB0_CFG     = 0x0054, /* CPU, AHB and APB0 Divide Ratio
> */
> +};
> +
> +#define REG_INDEX(offset)    (offset / sizeof(uint32_t))
> +
> +/* CCM register reset values */
> +enum {
> +    REG_PLL1_CFG_RST         = 0x21005000,
> +    REG_PLL1_TUN_RST         = 0x0A101000,
> +    REG_PLL2_CFG_RST         = 0x08100010,
> +    REG_PLL2_TUN_RST         = 0x00000000,
> +    REG_PLL3_CFG_RST         = 0x0010D063,
> +    REG_PLL4_CFG_RST         = 0x21009911,
> +    REG_PLL5_CFG_RST         = 0x11049280,
> +    REG_PLL5_TUN_RST         = 0x14888000,
> +    REG_PLL6_CFG_RST         = 0x21009911,
> +    REG_PLL6_TUN_RST         = 0x00000000,
> +    REG_PLL7_CFG_RST         = 0x0010D063,
> +    REG_PLL1_TUN2_RST        = 0x00000000,
> +    REG_PLL5_TUN2_RST        = 0x00000000,
> +    REG_PLL8_CFG_RST         = 0x21009911,
> +    REG_OSC24M_CFG_RST       = 0x00138013,
> +    REG_CPU_AHB_APB0_CFG_RST = 0x00010010,
> +};
> +
> +static uint64_t allwinner_a10_ccm_read(void *opaque, hwaddr offset,
> +                                       unsigned size)
> +{
> +    const AwA10ClockCtlState *s = AW_A10_CCM(opaque);
> +    const uint32_t idx = REG_INDEX(offset);
> +
> +    switch (offset) {
> +    case REG_PLL1_CFG:
> +    case REG_PLL1_TUN:
> +    case REG_PLL2_CFG:
> +    case REG_PLL2_TUN:
> +    case REG_PLL3_CFG:
> +    case REG_PLL4_CFG:
> +    case REG_PLL5_CFG:
> +    case REG_PLL5_TUN:
> +    case REG_PLL6_CFG:
> +    case REG_PLL6_TUN:
> +    case REG_PLL7_CFG:
> +    case REG_PLL1_TUN2:
> +    case REG_PLL5_TUN2:
> +    case REG_PLL8_CFG:
> +    case REG_OSC24M_CFG:
> +    case REG_CPU_AHB_APB0_CFG:
> +        break;
> +    case 0x158 ... AW_A10_CCM_IOSIZE:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset
> 0x%04x\n",
> +                      __func__, (uint32_t)offset);
> +        return 0;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%s: unimplemented read offset 0x%04x\n",
> +                      __func__, (uint32_t)offset);
> +        return 0;
> +    }
> +
> +    return s->regs[idx];
> +}
> +
> +static void allwinner_a10_ccm_write(void *opaque, hwaddr offset,
> +                                   uint64_t val, unsigned size)
> +{
> +    AwA10ClockCtlState *s = AW_A10_CCM(opaque);
> +    const uint32_t idx = REG_INDEX(offset);
> +
> +    switch (offset) {
> +    case REG_PLL1_CFG:
> +    case REG_PLL1_TUN:
> +    case REG_PLL2_CFG:
> +    case REG_PLL2_TUN:
> +    case REG_PLL3_CFG:
> +    case REG_PLL4_CFG:
> +    case REG_PLL5_CFG:
> +    case REG_PLL5_TUN:
> +    case REG_PLL6_CFG:
> +    case REG_PLL6_TUN:
> +    case REG_PLL7_CFG:
> +    case REG_PLL1_TUN2:
> +    case REG_PLL5_TUN2:
> +    case REG_PLL8_CFG:
> +    case REG_OSC24M_CFG:
> +    case REG_CPU_AHB_APB0_CFG:
> +        break;
> +    case 0x158 ... AW_A10_CCM_IOSIZE:
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
> +    s->regs[idx] = (uint32_t) val;
> +}
> +
> +static const MemoryRegionOps allwinner_a10_ccm_ops = {
> +    .read = allwinner_a10_ccm_read,
> +    .write = allwinner_a10_ccm_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +    },
> +    .impl.min_access_size = 4,
> +};
> +
> +static void allwinner_a10_ccm_reset_enter(Object *obj, ResetType type)
> +{
> +    AwA10ClockCtlState *s = AW_A10_CCM(obj);
> +
> +    /* Set default values for registers */
> +    s->regs[REG_INDEX(REG_PLL1_CFG)] = REG_PLL1_CFG_RST;
> +    s->regs[REG_INDEX(REG_PLL1_TUN)] = REG_PLL1_TUN_RST;
> +    s->regs[REG_INDEX(REG_PLL2_CFG)] = REG_PLL2_CFG_RST;
> +    s->regs[REG_INDEX(REG_PLL2_TUN)] = REG_PLL2_TUN_RST;
> +    s->regs[REG_INDEX(REG_PLL3_CFG)] = REG_PLL3_CFG_RST;
> +    s->regs[REG_INDEX(REG_PLL4_CFG)] = REG_PLL4_CFG_RST;
> +    s->regs[REG_INDEX(REG_PLL5_CFG)] = REG_PLL5_CFG_RST;
> +    s->regs[REG_INDEX(REG_PLL5_TUN)] = REG_PLL5_TUN_RST;
> +    s->regs[REG_INDEX(REG_PLL6_CFG)] = REG_PLL6_CFG_RST;
> +    s->regs[REG_INDEX(REG_PLL6_TUN)] = REG_PLL6_TUN_RST;
> +    s->regs[REG_INDEX(REG_PLL7_CFG)] = REG_PLL7_CFG_RST;
> +    s->regs[REG_INDEX(REG_PLL1_TUN2)] = REG_PLL1_TUN2_RST;
> +    s->regs[REG_INDEX(REG_PLL5_TUN2)] = REG_PLL5_TUN2_RST;
> +    s->regs[REG_INDEX(REG_PLL8_CFG)] = REG_PLL8_CFG_RST;
> +    s->regs[REG_INDEX(REG_OSC24M_CFG)] = REG_OSC24M_CFG_RST;
> +    s->regs[REG_INDEX(REG_CPU_AHB_APB0_CFG)] = REG_CPU_AHB_APB0_CFG_RST;
> +}
> +
> +static void allwinner_a10_ccm_init(Object *obj)
> +{
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +    AwA10ClockCtlState *s = AW_A10_CCM(obj);
> +
> +    /* Memory mapping */
> +    memory_region_init_io(&s->iomem, OBJECT(s), &allwinner_a10_ccm_ops, s,
> +                          TYPE_AW_A10_CCM, AW_A10_CCM_IOSIZE);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +}
> +
> +static const VMStateDescription allwinner_a10_ccm_vmstate = {
> +    .name = "allwinner-a10-ccm",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(regs, AwA10ClockCtlState,
> AW_A10_CCM_REGS_NUM),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void allwinner_a10_ccm_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +
> +    rc->phases.enter = allwinner_a10_ccm_reset_enter;
> +    dc->vmsd = &allwinner_a10_ccm_vmstate;
> +}
> +
> +static const TypeInfo allwinner_a10_ccm_info = {
> +    .name          = TYPE_AW_A10_CCM,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_init = allwinner_a10_ccm_init,
> +    .instance_size = sizeof(AwA10ClockCtlState),
> +    .class_init    = allwinner_a10_ccm_class_init,
> +};
> +
> +static void allwinner_a10_ccm_register(void)
> +{
> +    type_register_static(&allwinner_a10_ccm_info);
> +}
> +
> +type_init(allwinner_a10_ccm_register)
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 95268eddc0..ebf216edbc 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -38,6 +38,7 @@ subdir('macio')
>
>  softmmu_ss.add(when: 'CONFIG_IVSHMEM_DEVICE', if_true: files('ivshmem.c'))
>
> +softmmu_ss.add(when: 'CONFIG_ALLWINNER_A10_CCM', if_true:
> files('allwinner-a10-ccm.c'))
>  softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true:
> files('allwinner-h3-ccu.c'))
>  specific_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true:
> files('allwinner-cpucfg.c'))
>  softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true:
> files('allwinner-h3-dramc.c'))
> diff --git a/include/hw/arm/allwinner-a10.h
> b/include/hw/arm/allwinner-a10.h
> index a76dc7b84d..45d0fc2f7e 100644
> --- a/include/hw/arm/allwinner-a10.h
> +++ b/include/hw/arm/allwinner-a10.h
> @@ -12,6 +12,7 @@
>  #include "hw/usb/hcd-ohci.h"
>  #include "hw/usb/hcd-ehci.h"
>  #include "hw/rtc/allwinner-rtc.h"
> +#include "hw/misc/allwinner-a10-ccm.h"
>
>  #include "target/arm/cpu.h"
>  #include "qom/object.h"
> @@ -30,6 +31,7 @@ struct AwA10State {
>      /*< public >*/
>
>      ARMCPU cpu;
> +    AwA10ClockCtlState ccm;
>      AwA10PITState timer;
>      AwA10PICState intc;
>      AwEmacState emac;
> diff --git a/include/hw/misc/allwinner-a10-ccm.h
> b/include/hw/misc/allwinner-a10-ccm.h
> new file mode 100644
> index 0000000000..7f22532efa
> --- /dev/null
> +++ b/include/hw/misc/allwinner-a10-ccm.h
> @@ -0,0 +1,67 @@
> +/*
> + * Allwinner A10 Clock Control Module emulation
> + *
> + * Copyright (C) 2022 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> + *
> + *  This file is derived from Allwinner H3 CCU,
> + *  by Niek Linnenbank.
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
> +#ifndef HW_MISC_ALLWINNER_A10_CCM_H
> +#define HW_MISC_ALLWINNER_A10_CCM_H
> +
> +#include "qom/object.h"
> +#include "hw/sysbus.h"
> +
> +/**
> + * @name Constants
> + * @{
> + */
> +
> +/** Size of register I/O address space used by CCM device */
> +#define AW_A10_CCM_IOSIZE        (0x400)
> +
> +/** Total number of known registers */
> +#define AW_A10_CCM_REGS_NUM      (AW_A10_CCM_IOSIZE / sizeof(uint32_t))
> +
> +/** @} */
> +
> +/**
> + * @name Object model
> + * @{
> + */
> +
> +#define TYPE_AW_A10_CCM    "allwinner-a10-ccm"
> +OBJECT_DECLARE_SIMPLE_TYPE(AwA10ClockCtlState, AW_A10_CCM)
> +
> +/** @} */
> +
> +/**
> + * Allwinner A10 CCM object instance state.
> + */
> +struct AwA10ClockCtlState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +    /*< public >*/
> +
> +    /** Maps I/O registers in physical memory */
> +    MemoryRegion iomem;
> +
> +    /** Array of hardware registers */
> +    uint32_t regs[AW_A10_CCM_REGS_NUM];
> +};
> +
> +#endif /* HW_MISC_ALLWINNER_H3_CCU_H */
> --
> 2.30.2
>
>

-- 
Niek Linnenbank

--000000000000dafa1305ef447a70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Strahinja,<br><div dir=3D"ltr"><br></div><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Dec 4, 2022 at 1=
2:19 AM Strahinja Jankovic &lt;<a href=3D"mailto:strahinjapjankovic@gmail.c=
om">strahinjapjankovic@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">During SPL boot several Clock Controller M=
odule (CCM) registers are<br>
read, most important are PLL and Tuning, as well as divisor registers.<br>
<br>
This patch adds these registers and initializes reset values from user&#39;=
s<br>
guide.<br>
<br>
Signed-off-by: Strahinja Jankovic &lt;<a href=3D"mailto:strahinja.p.jankovi=
c@gmail.com" target=3D"_blank">strahinja.p.jankovic@gmail.com</a>&gt;<br></=
blockquote><div><br></div><div>Looks fine to me:</div><div><br></div><div>R=
eviewed-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com"=
>nieklinnenbank@gmail.com</a>&gt;<br></div><div><br></div><div>Regards,</di=
v><div>Niek <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0hw/arm/allwinner-a10.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A07 +<br>
=C2=A0hw/misc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0hw/misc/allwinner-a10-ccm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 224 ++=
++++++++++++++++++++++++++<br>
=C2=A0hw/misc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0include/hw/arm/allwinner-a10.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<=
br>
=C2=A0include/hw/misc/allwinner-a10-ccm.h |=C2=A0 67 +++++++++<br>
=C2=A07 files changed, 305 insertions(+)<br>
=C2=A0create mode 100644 hw/misc/allwinner-a10-ccm.c<br>
=C2=A0create mode 100644 include/hw/misc/allwinner-a10-ccm.h<br>
<br>
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig<br>
index 17fcde8e1c..14f52b41af 100644<br>
--- a/hw/arm/Kconfig<br>
+++ b/hw/arm/Kconfig<br>
@@ -319,6 +319,7 @@ config ALLWINNER_A10<br>
=C2=A0 =C2=A0 =C2=A0select AHCI<br>
=C2=A0 =C2=A0 =C2=A0select ALLWINNER_A10_PIT<br>
=C2=A0 =C2=A0 =C2=A0select ALLWINNER_A10_PIC<br>
+=C2=A0 =C2=A0 select ALLWINNER_A10_CCM<br>
=C2=A0 =C2=A0 =C2=A0select ALLWINNER_EMAC<br>
=C2=A0 =C2=A0 =C2=A0select SERIAL<br>
=C2=A0 =C2=A0 =C2=A0select UNIMP<br>
diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c<br>
index 79082289ea..86baeeeca2 100644<br>
--- a/hw/arm/allwinner-a10.c<br>
+++ b/hw/arm/allwinner-a10.c<br>
@@ -26,6 +26,7 @@<br>
=C2=A0#include &quot;hw/usb/hcd-ohci.h&quot;<br>
<br>
=C2=A0#define AW_A10_MMC0_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c0f000<br>
+#define AW_A10_CCM_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x01c20000<br>
=C2=A0#define AW_A10_PIC_REG_BASE=C2=A0 =C2=A0 =C2=A00x01c20400<br>
=C2=A0#define AW_A10_PIT_REG_BASE=C2=A0 =C2=A0 =C2=A00x01c20c00<br>
=C2=A0#define AW_A10_UART0_REG_BASE=C2=A0 =C2=A00x01c28000<br>
@@ -46,6 +47,8 @@ static void aw_a10_init(Object *obj)<br>
<br>
=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;timer&quot;, &amp;s-=
&gt;timer, TYPE_AW_A10_PIT);<br>
<br>
+=C2=A0 =C2=A0 object_initialize_child(obj, &quot;ccm&quot;, &amp;s-&gt;ccm=
, TYPE_AW_A10_CCM);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;emac&quot;, &amp;s-&=
gt;emac, TYPE_AW_EMAC);<br>
<br>
=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;sata&quot;, &amp;s-&=
gt;sata, TYPE_ALLWINNER_AHCI);<br>
@@ -103,6 +106,10 @@ static void aw_a10_realize(DeviceState *dev, Error **e=
rrp)<br>
=C2=A0 =C2=A0 =C2=A0memory_region_add_subregion(get_system_memory(), 0x0000=
0000, &amp;s-&gt;sram_a);<br>
=C2=A0 =C2=A0 =C2=A0create_unimplemented_device(&quot;a10-sram-ctrl&quot;, =
0x01c00000, 4 * KiB);<br>
<br>
+=C2=A0 =C2=A0 /* Clock Control Module */<br>
+=C2=A0 =C2=A0 sysbus_realize(SYS_BUS_DEVICE(&amp;s-&gt;ccm), &amp;error_fa=
tal);<br>
+=C2=A0 =C2=A0 sysbus_mmio_map(SYS_BUS_DEVICE(&amp;s-&gt;ccm), 0, AW_A10_CC=
M_BASE);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* FIXME use qdev NIC properties instead of nd_table[] =
*/<br>
=C2=A0 =C2=A0 =C2=A0if (nd_table[0].used) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_check_nic_model(&amp;nd_table[0], TY=
PE_AW_EMAC);<br>
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig<br>
index cbabe9f78c..ed07bf4133 100644<br>
--- a/hw/misc/Kconfig<br>
+++ b/hw/misc/Kconfig<br>
@@ -174,4 +174,7 @@ config VIRT_CTRL<br>
=C2=A0config LASI<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
<br>
+config ALLWINNER_A10_CCM<br>
+=C2=A0 =C2=A0 bool<br>
+<br>
=C2=A0source macio/Kconfig<br>
diff --git a/hw/misc/allwinner-a10-ccm.c b/hw/misc/allwinner-a10-ccm.c<br>
new file mode 100644<br>
index 0000000000..68146ee340<br>
--- /dev/null<br>
+++ b/hw/misc/allwinner-a10-ccm.c<br>
@@ -0,0 +1,224 @@<br>
+/*<br>
+ * Allwinner A10 Clock Control Module emulation<br>
+ *<br>
+ * Copyright (C) 2022 Strahinja Jankovic &lt;<a href=3D"mailto:strahinja.p=
.jankovic@gmail.com" target=3D"_blank">strahinja.p.jankovic@gmail.com</a>&g=
t;<br>
+ *<br>
+ *=C2=A0 This file is derived from Allwinner H3 CCU,<br>
+ *=C2=A0 by Niek Linnenbank.<br>
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
+#include &quot;hw/misc/allwinner-a10-ccm.h&quot;<br>
+<br>
+/* CCM register offsets */<br>
+enum {<br>
+=C2=A0 =C2=A0 REG_PLL1_CFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0x0000, /* PLL1 Control */<br>
+=C2=A0 =C2=A0 REG_PLL1_TUN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0x0004, /* PLL1 Tuning */<br>
+=C2=A0 =C2=A0 REG_PLL2_CFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0x0008, /* PLL2 Control */<br>
+=C2=A0 =C2=A0 REG_PLL2_TUN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0x000C, /* PLL2 Tuning */<br>
+=C2=A0 =C2=A0 REG_PLL3_CFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0x0010, /* PLL3 Control */<br>
+=C2=A0 =C2=A0 REG_PLL4_CFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0x0018, /* PLL4 Control */<br>
+=C2=A0 =C2=A0 REG_PLL5_CFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0x0020, /* PLL5 Control */<br>
+=C2=A0 =C2=A0 REG_PLL5_TUN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0x0024, /* PLL5 Tuning */<br>
+=C2=A0 =C2=A0 REG_PLL6_CFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0x0028, /* PLL6 Control */<br>
+=C2=A0 =C2=A0 REG_PLL6_TUN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0x002C, /* PLL6 Tuning */<br>
+=C2=A0 =C2=A0 REG_PLL7_CFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0x0030, /* PLL7 Control */<br>
+=C2=A0 =C2=A0 REG_PLL1_TUN2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0=
x0038, /* PLL1 Tuning2 */<br>
+=C2=A0 =C2=A0 REG_PLL5_TUN2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0=
x003C, /* PLL5 Tuning2 */<br>
+=C2=A0 =C2=A0 REG_PLL8_CFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0x0040, /* PLL8 Control */<br>
+=C2=A0 =C2=A0 REG_OSC24M_CFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0=
x0050, /* OSC24M Control */<br>
+=C2=A0 =C2=A0 REG_CPU_AHB_APB0_CFG=C2=A0 =C2=A0 =C2=A0=3D 0x0054, /* CPU, =
AHB and APB0 Divide Ratio */<br>
+};<br>
+<br>
+#define REG_INDEX(offset)=C2=A0 =C2=A0 (offset / sizeof(uint32_t))<br>
+<br>
+/* CCM register reset values */<br>
+enum {<br>
+=C2=A0 =C2=A0 REG_PLL1_CFG_RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x2100=
5000,<br>
+=C2=A0 =C2=A0 REG_PLL1_TUN_RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x0A10=
1000,<br>
+=C2=A0 =C2=A0 REG_PLL2_CFG_RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x0810=
0010,<br>
+=C2=A0 =C2=A0 REG_PLL2_TUN_RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x0000=
0000,<br>
+=C2=A0 =C2=A0 REG_PLL3_CFG_RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x0010=
D063,<br>
+=C2=A0 =C2=A0 REG_PLL4_CFG_RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x2100=
9911,<br>
+=C2=A0 =C2=A0 REG_PLL5_CFG_RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x1104=
9280,<br>
+=C2=A0 =C2=A0 REG_PLL5_TUN_RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x1488=
8000,<br>
+=C2=A0 =C2=A0 REG_PLL6_CFG_RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x2100=
9911,<br>
+=C2=A0 =C2=A0 REG_PLL6_TUN_RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x0000=
0000,<br>
+=C2=A0 =C2=A0 REG_PLL7_CFG_RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x0010=
D063,<br>
+=C2=A0 =C2=A0 REG_PLL1_TUN2_RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x00000000,=
<br>
+=C2=A0 =C2=A0 REG_PLL5_TUN2_RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x00000000,=
<br>
+=C2=A0 =C2=A0 REG_PLL8_CFG_RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x2100=
9911,<br>
+=C2=A0 =C2=A0 REG_OSC24M_CFG_RST=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x00138013,=
<br>
+=C2=A0 =C2=A0 REG_CPU_AHB_APB0_CFG_RST =3D 0x00010010,<br>
+};<br>
+<br>
+static uint64_t allwinner_a10_ccm_read(void *opaque, hwaddr offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned =
size)<br>
+{<br>
+=C2=A0 =C2=A0 const AwA10ClockCtlState *s =3D AW_A10_CCM(opaque);<br>
+=C2=A0 =C2=A0 const uint32_t idx =3D REG_INDEX(offset);<br>
+<br>
+=C2=A0 =C2=A0 switch (offset) {<br>
+=C2=A0 =C2=A0 case REG_PLL1_CFG:<br>
+=C2=A0 =C2=A0 case REG_PLL1_TUN:<br>
+=C2=A0 =C2=A0 case REG_PLL2_CFG:<br>
+=C2=A0 =C2=A0 case REG_PLL2_TUN:<br>
+=C2=A0 =C2=A0 case REG_PLL3_CFG:<br>
+=C2=A0 =C2=A0 case REG_PLL4_CFG:<br>
+=C2=A0 =C2=A0 case REG_PLL5_CFG:<br>
+=C2=A0 =C2=A0 case REG_PLL5_TUN:<br>
+=C2=A0 =C2=A0 case REG_PLL6_CFG:<br>
+=C2=A0 =C2=A0 case REG_PLL6_TUN:<br>
+=C2=A0 =C2=A0 case REG_PLL7_CFG:<br>
+=C2=A0 =C2=A0 case REG_PLL1_TUN2:<br>
+=C2=A0 =C2=A0 case REG_PLL5_TUN2:<br>
+=C2=A0 =C2=A0 case REG_PLL8_CFG:<br>
+=C2=A0 =C2=A0 case REG_OSC24M_CFG:<br>
+=C2=A0 =C2=A0 case REG_CPU_AHB_APB0_CFG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 0x158 ... AW_A10_CCM_IOSIZE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: out-o=
f-bounds offset 0x%04x\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, (uint32_t)offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;%s: unimplement=
ed read offset 0x%04x\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, (uint32_t)offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return s-&gt;regs[idx];<br>
+}<br>
+<br>
+static void allwinner_a10_ccm_write(void *opaque, hwaddr offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t val, unsigned =
size)<br>
+{<br>
+=C2=A0 =C2=A0 AwA10ClockCtlState *s =3D AW_A10_CCM(opaque);<br>
+=C2=A0 =C2=A0 const uint32_t idx =3D REG_INDEX(offset);<br>
+<br>
+=C2=A0 =C2=A0 switch (offset) {<br>
+=C2=A0 =C2=A0 case REG_PLL1_CFG:<br>
+=C2=A0 =C2=A0 case REG_PLL1_TUN:<br>
+=C2=A0 =C2=A0 case REG_PLL2_CFG:<br>
+=C2=A0 =C2=A0 case REG_PLL2_TUN:<br>
+=C2=A0 =C2=A0 case REG_PLL3_CFG:<br>
+=C2=A0 =C2=A0 case REG_PLL4_CFG:<br>
+=C2=A0 =C2=A0 case REG_PLL5_CFG:<br>
+=C2=A0 =C2=A0 case REG_PLL5_TUN:<br>
+=C2=A0 =C2=A0 case REG_PLL6_CFG:<br>
+=C2=A0 =C2=A0 case REG_PLL6_TUN:<br>
+=C2=A0 =C2=A0 case REG_PLL7_CFG:<br>
+=C2=A0 =C2=A0 case REG_PLL1_TUN2:<br>
+=C2=A0 =C2=A0 case REG_PLL5_TUN2:<br>
+=C2=A0 =C2=A0 case REG_PLL8_CFG:<br>
+=C2=A0 =C2=A0 case REG_OSC24M_CFG:<br>
+=C2=A0 =C2=A0 case REG_CPU_AHB_APB0_CFG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 0x158 ... AW_A10_CCM_IOSIZE:<br>
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
+=C2=A0 =C2=A0 s-&gt;regs[idx] =3D (uint32_t) val;<br>
+}<br>
+<br>
+static const MemoryRegionOps allwinner_a10_ccm_ops =3D {<br>
+=C2=A0 =C2=A0 .read =3D allwinner_a10_ccm_read,<br>
+=C2=A0 =C2=A0 .write =3D allwinner_a10_ccm_write,<br>
+=C2=A0 =C2=A0 .endianness =3D DEVICE_NATIVE_ENDIAN,<br>
+=C2=A0 =C2=A0 .valid =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 4,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 .impl.min_access_size =3D 4,<br>
+};<br>
+<br>
+static void allwinner_a10_ccm_reset_enter(Object *obj, ResetType type)<br>
+{<br>
+=C2=A0 =C2=A0 AwA10ClockCtlState *s =3D AW_A10_CCM(obj);<br>
+<br>
+=C2=A0 =C2=A0 /* Set default values for registers */<br>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL1_CFG)] =3D REG_PLL1_CFG_RST;<br=
>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL1_TUN)] =3D REG_PLL1_TUN_RST;<br=
>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL2_CFG)] =3D REG_PLL2_CFG_RST;<br=
>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL2_TUN)] =3D REG_PLL2_TUN_RST;<br=
>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL3_CFG)] =3D REG_PLL3_CFG_RST;<br=
>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL4_CFG)] =3D REG_PLL4_CFG_RST;<br=
>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL5_CFG)] =3D REG_PLL5_CFG_RST;<br=
>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL5_TUN)] =3D REG_PLL5_TUN_RST;<br=
>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL6_CFG)] =3D REG_PLL6_CFG_RST;<br=
>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL6_TUN)] =3D REG_PLL6_TUN_RST;<br=
>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL7_CFG)] =3D REG_PLL7_CFG_RST;<br=
>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL1_TUN2)] =3D REG_PLL1_TUN2_RST;<=
br>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL5_TUN2)] =3D REG_PLL5_TUN2_RST;<=
br>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_PLL8_CFG)] =3D REG_PLL8_CFG_RST;<br=
>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_OSC24M_CFG)] =3D REG_OSC24M_CFG_RST=
;<br>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_CPU_AHB_APB0_CFG)] =3D REG_CPU_AHB_=
APB0_CFG_RST;<br>
+}<br>
+<br>
+static void allwinner_a10_ccm_init(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);<br>
+=C2=A0 =C2=A0 AwA10ClockCtlState *s =3D AW_A10_CCM(obj);<br>
+<br>
+=C2=A0 =C2=A0 /* Memory mapping */<br>
+=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;iomem, OBJECT(s), &amp;allw=
inner_a10_ccm_ops, s,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 TYPE_AW_A10_CCM, AW_A10_CCM_IOSIZE);<br>
+=C2=A0 =C2=A0 sysbus_init_mmio(sbd, &amp;s-&gt;iomem);<br>
+}<br>
+<br>
+static const VMStateDescription allwinner_a10_ccm_vmstate =3D {<br>
+=C2=A0 =C2=A0 .name =3D &quot;allwinner-a10-ccm&quot;,<br>
+=C2=A0 =C2=A0 .version_id =3D 1,<br>
+=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
+=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32_ARRAY(regs, AwA10ClockCtlState,=
 AW_A10_CCM_REGS_NUM),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
+=C2=A0 =C2=A0 }<br>
+};<br>
+<br>
+static void allwinner_a10_ccm_class_init(ObjectClass *klass, void *data)<b=
r>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+=C2=A0 =C2=A0 ResettableClass *rc =3D RESETTABLE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 rc-&gt;phases.enter =3D allwinner_a10_ccm_reset_enter;<br>
+=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;allwinner_a10_ccm_vmstate;<br>
+}<br>
+<br>
+static const TypeInfo allwinner_a10_ccm_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_AW_A10_CCM,=
<br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEVICE,<=
br>
+=C2=A0 =C2=A0 .instance_init =3D allwinner_a10_ccm_init,<br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(AwA10ClockCtlState),<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D allwinner_a10_ccm_class_init,<b=
r>
+};<br>
+<br>
+static void allwinner_a10_ccm_register(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;allwinner_a10_ccm_info);<br>
+}<br>
+<br>
+type_init(allwinner_a10_ccm_register)<br>
diff --git a/hw/misc/meson.build b/hw/misc/meson.build<br>
index 95268eddc0..ebf216edbc 100644<br>
--- a/hw/misc/meson.build<br>
+++ b/hw/misc/meson.build<br>
@@ -38,6 +38,7 @@ subdir(&#39;macio&#39;)<br>
<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_IVSHMEM_DEVICE&#39;, if_true: files(=
&#39;ivshmem.c&#39;))<br>
<br>
+softmmu_ss.add(when: &#39;CONFIG_ALLWINNER_A10_CCM&#39;, if_true: files(&#=
39;allwinner-a10-ccm.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_ALLWINNER_H3&#39;, if_true: files(&#=
39;allwinner-h3-ccu.c&#39;))<br>
=C2=A0specific_ss.add(when: &#39;CONFIG_ALLWINNER_H3&#39;, if_true: files(&=
#39;allwinner-cpucfg.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_ALLWINNER_H3&#39;, if_true: files(&#=
39;allwinner-h3-dramc.c&#39;))<br>
diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.=
h<br>
index a76dc7b84d..45d0fc2f7e 100644<br>
--- a/include/hw/arm/allwinner-a10.h<br>
+++ b/include/hw/arm/allwinner-a10.h<br>
@@ -12,6 +12,7 @@<br>
=C2=A0#include &quot;hw/usb/hcd-ohci.h&quot;<br>
=C2=A0#include &quot;hw/usb/hcd-ehci.h&quot;<br>
=C2=A0#include &quot;hw/rtc/allwinner-rtc.h&quot;<br>
+#include &quot;hw/misc/allwinner-a10-ccm.h&quot;<br>
<br>
=C2=A0#include &quot;target/arm/cpu.h&quot;<br>
=C2=A0#include &quot;qom/object.h&quot;<br>
@@ -30,6 +31,7 @@ struct AwA10State {<br>
=C2=A0 =C2=A0 =C2=A0/*&lt; public &gt;*/<br>
<br>
=C2=A0 =C2=A0 =C2=A0ARMCPU cpu;<br>
+=C2=A0 =C2=A0 AwA10ClockCtlState ccm;<br>
=C2=A0 =C2=A0 =C2=A0AwA10PITState timer;<br>
=C2=A0 =C2=A0 =C2=A0AwA10PICState intc;<br>
=C2=A0 =C2=A0 =C2=A0AwEmacState emac;<br>
diff --git a/include/hw/misc/allwinner-a10-ccm.h b/include/hw/misc/allwinne=
r-a10-ccm.h<br>
new file mode 100644<br>
index 0000000000..7f22532efa<br>
--- /dev/null<br>
+++ b/include/hw/misc/allwinner-a10-ccm.h<br>
@@ -0,0 +1,67 @@<br>
+/*<br>
+ * Allwinner A10 Clock Control Module emulation<br>
+ *<br>
+ * Copyright (C) 2022 Strahinja Jankovic &lt;<a href=3D"mailto:strahinja.p=
.jankovic@gmail.com" target=3D"_blank">strahinja.p.jankovic@gmail.com</a>&g=
t;<br>
+ *<br>
+ *=C2=A0 This file is derived from Allwinner H3 CCU,<br>
+ *=C2=A0 by Niek Linnenbank.<br>
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
+#ifndef HW_MISC_ALLWINNER_A10_CCM_H<br>
+#define HW_MISC_ALLWINNER_A10_CCM_H<br>
+<br>
+#include &quot;qom/object.h&quot;<br>
+#include &quot;hw/sysbus.h&quot;<br>
+<br>
+/**<br>
+ * @name Constants<br>
+ * @{<br>
+ */<br>
+<br>
+/** Size of register I/O address space used by CCM device */<br>
+#define AW_A10_CCM_IOSIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x400)<br>
+<br>
+/** Total number of known registers */<br>
+#define AW_A10_CCM_REGS_NUM=C2=A0 =C2=A0 =C2=A0 (AW_A10_CCM_IOSIZE / sizeo=
f(uint32_t))<br>
+<br>
+/** @} */<br>
+<br>
+/**<br>
+ * @name Object model<br>
+ * @{<br>
+ */<br>
+<br>
+#define TYPE_AW_A10_CCM=C2=A0 =C2=A0 &quot;allwinner-a10-ccm&quot;<br>
+OBJECT_DECLARE_SIMPLE_TYPE(AwA10ClockCtlState, AW_A10_CCM)<br>
+<br>
+/** @} */<br>
+<br>
+/**<br>
+ * Allwinner A10 CCM object instance state.<br>
+ */<br>
+struct AwA10ClockCtlState {<br>
+=C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
+=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
+=C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
+<br>
+=C2=A0 =C2=A0 /** Maps I/O registers in physical memory */<br>
+=C2=A0 =C2=A0 MemoryRegion iomem;<br>
+<br>
+=C2=A0 =C2=A0 /** Array of hardware registers */<br>
+=C2=A0 =C2=A0 uint32_t regs[AW_A10_CCM_REGS_NUM];<br>
+};<br>
+<br>
+#endif /* HW_MISC_ALLWINNER_H3_CCU_H */<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--000000000000dafa1305ef447a70--

