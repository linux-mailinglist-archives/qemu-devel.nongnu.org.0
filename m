Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26565646414
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 23:28:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p32s7-0004nk-E4; Wed, 07 Dec 2022 17:26:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1p32s3-0004ia-1l; Wed, 07 Dec 2022 17:26:33 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1p32rz-0008UX-Mx; Wed, 07 Dec 2022 17:26:30 -0500
Received: by mail-wr1-x429.google.com with SMTP id co23so2762116wrb.4;
 Wed, 07 Dec 2022 14:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cs6qy+EWPLptAcFct4WIN55I7zYh+Zrr83uOxbe/A/w=;
 b=jHCuwucd1Rmt6yZCD0eUvsO+aYYhFCf7qpTcOfiFKrDSMEw+0c1tPCXcf+bynrrxc7
 hbTOC38EY4Jxr0FX6UCM+ZBLL2Gc0Y3Y/OKp4NbRoNzFmjNTpuXVjIguln59SzqCxHF+
 iguC/cTns6DH27HAkILd5W5ZRTtMp2opLNy1XbbnnYNR3Olzvwm4i9QH6uz7/BsA4HWM
 ZEx9Xu5dlHpXEUoklkVPW5cikDyHqr/ArzBcnE84/gVLIvza1gz+CxW0QgwyJZaQ23CW
 Y6c/qEqTsr1Qu7YqXs/73GUKYbKr5UrvN03/PzVebh9G9rbV1U2IqYfCiuvWlHtfiOIJ
 O12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cs6qy+EWPLptAcFct4WIN55I7zYh+Zrr83uOxbe/A/w=;
 b=FiqbSFv91l+R0v401mDEPUiqSty5i5RH4er438YZuwegQR6eCcFGcSHybS/2R4vHxW
 NlgN7fgfQCLPX5Pz3vMgvvS/eMW9MsYr7ZuwXGC/TUSjnkUE2x+pRwJvac96e1QvkfnK
 QxJkX5HTwDG4mAkQ5vDDCbs6QiSt26wgPWbnSnlIYNzNoyi5l4y9Gi0lz7lJ0jLwzQUE
 qO6NQ1bwshA6dD2swFwIKu2BEBGMbxYC/O+KLCAHPEdrSkVWfIa2JqbjI8xU5GDnvAul
 l97dkgj1WeghLK76jgNsOB67CyXfu180KpS6KuADBGM5lALV8BPS4vB0kM3g6RjyAfGK
 6Tqg==
X-Gm-Message-State: ANoB5pmcx9bdNi8koeSYOkXNWlbmnOPHH47/3AL9GUoGl9zw6QibogbQ
 ySX9k9b9vonuA12Nv5lrkeGUU8prlw9OszDyPtE=
X-Google-Smtp-Source: AA0mqf5KxdszEERc7IHQth957Gcwn0m6Zu5PVJxiH0hJmM5WjpKB4R5rHGup3l8sEZgITbzcdCFhafJmVJWDn4qnM4w=
X-Received: by 2002:adf:fbc2:0:b0:241:eca8:4746 with SMTP id
 d2-20020adffbc2000000b00241eca84746mr41839822wrs.256.1670451982141; Wed, 07
 Dec 2022 14:26:22 -0800 (PST)
MIME-Version: 1.0
References: <20221203231904.25155-1-strahinja.p.jankovic@gmail.com>
 <20221203231904.25155-3-strahinja.p.jankovic@gmail.com>
In-Reply-To: <20221203231904.25155-3-strahinja.p.jankovic@gmail.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Wed, 7 Dec 2022 23:26:10 +0100
Message-ID: <CAPan3WrMG2POEcEYb43Ua323Asp_=RiP6KnzBLf7Ze9KzCDKuw@mail.gmail.com>
Subject: Re: [PATCH 2/6] hw/misc: Allwinner A10 DRAM Controller Emulation
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000028ffa05ef446930"
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-wr1-x429.google.com
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

--000000000000028ffa05ef446930
Content-Type: text/plain; charset="UTF-8"

Hi Strahinja,

On Sun, Dec 4, 2022 at 12:19 AM Strahinja Jankovic <
strahinjapjankovic@gmail.com> wrote:

> During SPL boot several DRAM Controller registers are used. Most
> important registers are those related to DRAM initialization and
> calibration, where SPL initiates process and waits until certain bit is
> set/cleared.
>
> This patch adds these registers, initializes reset values from user's
> guide and updates state of registers as SPL expects it.
>
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> ---
>  hw/arm/Kconfig                        |   1 +
>  hw/arm/allwinner-a10.c                |   7 +
>  hw/misc/Kconfig                       |   3 +
>  hw/misc/allwinner-a10-dramc.c         | 179 ++++++++++++++++++++++++++
>  hw/misc/meson.build                   |   1 +
>  include/hw/arm/allwinner-a10.h        |   2 +
>  include/hw/misc/allwinner-a10-dramc.h |  68 ++++++++++
>  7 files changed, 261 insertions(+)
>  create mode 100644 hw/misc/allwinner-a10-dramc.c
>  create mode 100644 include/hw/misc/allwinner-a10-dramc.h
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 14f52b41af..140f142ae5 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -320,6 +320,7 @@ config ALLWINNER_A10
>      select ALLWINNER_A10_PIT
>      select ALLWINNER_A10_PIC
>      select ALLWINNER_A10_CCM
> +    select ALLWINNER_A10_DRAMC
>      select ALLWINNER_EMAC
>      select SERIAL
>      select UNIMP
> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
> index 86baeeeca2..a5f7a36ac9 100644
> --- a/hw/arm/allwinner-a10.c
> +++ b/hw/arm/allwinner-a10.c
> @@ -25,6 +25,7 @@
>  #include "hw/boards.h"
>  #include "hw/usb/hcd-ohci.h"
>
> +#define AW_A10_DRAMC_BASE       0x01c01000
>  #define AW_A10_MMC0_BASE        0x01c0f000
>  #define AW_A10_CCM_BASE         0x01c20000
>  #define AW_A10_PIC_REG_BASE     0x01c20400
> @@ -49,6 +50,8 @@ static void aw_a10_init(Object *obj)
>
>      object_initialize_child(obj, "ccm", &s->ccm, TYPE_AW_A10_CCM);
>
> +    object_initialize_child(obj, "dramc", &s->dramc, TYPE_AW_A10_DRAMC);
> +
>      object_initialize_child(obj, "emac", &s->emac, TYPE_AW_EMAC);
>
>      object_initialize_child(obj, "sata", &s->sata, TYPE_ALLWINNER_AHCI);
> @@ -110,6 +113,10 @@ static void aw_a10_realize(DeviceState *dev, Error
> **errp)
>      sysbus_realize(SYS_BUS_DEVICE(&s->ccm), &error_fatal);
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->ccm), 0, AW_A10_CCM_BASE);
>
> +    /* DRAM Control Module */
> +    sysbus_realize(SYS_BUS_DEVICE(&s->dramc), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->dramc), 0, AW_A10_DRAMC_BASE);
> +
>      /* FIXME use qdev NIC properties instead of nd_table[] */
>      if (nd_table[0].used) {
>          qemu_check_nic_model(&nd_table[0], TYPE_AW_EMAC);
> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index ed07bf4133..052fb54310 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -177,4 +177,7 @@ config LASI
>  config ALLWINNER_A10_CCM
>      bool
>
> +config ALLWINNER_A10_DRAMC
> +    bool
> +
>  source macio/Kconfig
> diff --git a/hw/misc/allwinner-a10-dramc.c b/hw/misc/allwinner-a10-dramc.c
> new file mode 100644
> index 0000000000..e118b0c2fd
> --- /dev/null
> +++ b/hw/misc/allwinner-a10-dramc.c
> @@ -0,0 +1,179 @@
> +/*
> + * Allwinner A10 DRAM Controller emulation
> + *
> + * Copyright (C) 2022 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> + *
> + *  This file is derived from Allwinner H3 DRAMC,
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
> +#include "hw/misc/allwinner-a10-dramc.h"
> +
> +/* DRAMC register offsets */
> +enum {
> +    REG_SDR_CCR = 0x0000,
> +    REG_SDR_ZQCR0 = 0x00a8,
> +    REG_SDR_ZQSR = 0x00b0
> +};
>

This matches indeed with what is currently implemented in u-boot in the
file arch/arm/include/asm/arch-sunxi/dram_sun4i.h.
And since the datasheets don't document the DRAM controllers, probably the
best we can do is match with u-boot.

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>

Regards,
Niek


> +
> +#define REG_INDEX(offset)    (offset / sizeof(uint32_t))
> +
> +/* DRAMC register flags */
> +enum {
> +    REG_SDR_CCR_DATA_TRAINING = (1 << 30),
> +    REG_SDR_CCR_DRAM_INIT     = (1 << 31),
> +};
> +enum {
> +    REG_SDR_ZQSR_ZCAL         = (1 << 31),
> +};
> +
> +/* DRAMC register reset values */
> +enum {
> +    REG_SDR_CCR_RESET   = 0x80020000,
> +    REG_SDR_ZQCR0_RESET = 0x07b00000,
> +    REG_SDR_ZQSR_RESET  = 0x80000000
> +};
> +
> +static uint64_t allwinner_a10_dramc_read(void *opaque, hwaddr offset,
> +                                       unsigned size)
> +{
> +    const AwA10DramControllerState *s = AW_A10_DRAMC(opaque);
> +    const uint32_t idx = REG_INDEX(offset);
> +
> +    switch (offset) {
> +    case REG_SDR_CCR:
> +    case REG_SDR_ZQCR0:
> +    case REG_SDR_ZQSR:
> +        break;
> +    case 0x2e4 ... AW_A10_DRAMC_IOSIZE:
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
> +static void allwinner_a10_dramc_write(void *opaque, hwaddr offset,
> +                                   uint64_t val, unsigned size)
> +{
> +    AwA10DramControllerState *s = AW_A10_DRAMC(opaque);
> +    const uint32_t idx = REG_INDEX(offset);
> +
> +    switch (offset) {
> +    case REG_SDR_CCR:
> +        if (val & REG_SDR_CCR_DRAM_INIT) {
> +            /* Clear DRAM_INIT to indicate process is done. */
> +            val &= ~REG_SDR_CCR_DRAM_INIT;
> +        }
> +        if (val & REG_SDR_CCR_DATA_TRAINING) {
> +            /* Clear DATA_TRAINING to indicate process is done. */
> +            val &= ~REG_SDR_CCR_DATA_TRAINING;
> +        }
> +        break;
> +    case REG_SDR_ZQCR0:
> +        /* Set ZCAL in ZQSR to indicate calibration is done. */
> +        s->regs[REG_INDEX(REG_SDR_ZQSR)] |= REG_SDR_ZQSR_ZCAL;
> +        break;
> +    case 0x2e4 ... AW_A10_DRAMC_IOSIZE:
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
> +static const MemoryRegionOps allwinner_a10_dramc_ops = {
> +    .read = allwinner_a10_dramc_read,
> +    .write = allwinner_a10_dramc_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +    },
> +    .impl.min_access_size = 4,
> +};
> +
> +static void allwinner_a10_dramc_reset_enter(Object *obj, ResetType type)
> +{
> +    AwA10DramControllerState *s = AW_A10_DRAMC(obj);
> +
> +    /* Set default values for registers */
> +    s->regs[REG_INDEX(REG_SDR_CCR)] = REG_SDR_CCR_RESET;
> +    s->regs[REG_INDEX(REG_SDR_ZQCR0)] = REG_SDR_ZQCR0_RESET;
> +    s->regs[REG_INDEX(REG_SDR_ZQSR)] = REG_SDR_ZQSR_RESET;
> +}
> +
> +static void allwinner_a10_dramc_init(Object *obj)
> +{
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +    AwA10DramControllerState *s = AW_A10_DRAMC(obj);
> +
> +    /* Memory mapping */
> +    memory_region_init_io(&s->iomem, OBJECT(s), &allwinner_a10_dramc_ops,
> s,
> +                          TYPE_AW_A10_DRAMC, AW_A10_DRAMC_IOSIZE);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +}
> +
> +static const VMStateDescription allwinner_a10_dramc_vmstate = {
> +    .name = "allwinner-a10-dramc",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(regs, AwA10DramControllerState,
> +                             AW_A10_DRAMC_REGS_NUM),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void allwinner_a10_dramc_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +
> +    rc->phases.enter = allwinner_a10_dramc_reset_enter;
> +    dc->vmsd = &allwinner_a10_dramc_vmstate;
> +}
> +
> +static const TypeInfo allwinner_a10_dramc_info = {
> +    .name          = TYPE_AW_A10_DRAMC,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_init = allwinner_a10_dramc_init,
> +    .instance_size = sizeof(AwA10DramControllerState),
> +    .class_init    = allwinner_a10_dramc_class_init,
> +};
> +
> +static void allwinner_a10_dramc_register(void)
> +{
> +    type_register_static(&allwinner_a10_dramc_info);
> +}
> +
> +type_init(allwinner_a10_dramc_register)
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index ebf216edbc..d7f49f0f81 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -39,6 +39,7 @@ subdir('macio')
>  softmmu_ss.add(when: 'CONFIG_IVSHMEM_DEVICE', if_true: files('ivshmem.c'))
>
>  softmmu_ss.add(when: 'CONFIG_ALLWINNER_A10_CCM', if_true:
> files('allwinner-a10-ccm.c'))
> +softmmu_ss.add(when: 'CONFIG_ALLWINNER_A10_DRAMC', if_true:
> files('allwinner-a10-dramc.c'))
>  softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true:
> files('allwinner-h3-ccu.c'))
>  specific_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true:
> files('allwinner-cpucfg.c'))
>  softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true:
> files('allwinner-h3-dramc.c'))
> diff --git a/include/hw/arm/allwinner-a10.h
> b/include/hw/arm/allwinner-a10.h
> index 45d0fc2f7e..abe4ff7066 100644
> --- a/include/hw/arm/allwinner-a10.h
> +++ b/include/hw/arm/allwinner-a10.h
> @@ -13,6 +13,7 @@
>  #include "hw/usb/hcd-ehci.h"
>  #include "hw/rtc/allwinner-rtc.h"
>  #include "hw/misc/allwinner-a10-ccm.h"
> +#include "hw/misc/allwinner-a10-dramc.h"
>
>  #include "target/arm/cpu.h"
>  #include "qom/object.h"
> @@ -32,6 +33,7 @@ struct AwA10State {
>
>      ARMCPU cpu;
>      AwA10ClockCtlState ccm;
> +    AwA10DramControllerState dramc;
>      AwA10PITState timer;
>      AwA10PICState intc;
>      AwEmacState emac;
> diff --git a/include/hw/misc/allwinner-a10-dramc.h
> b/include/hw/misc/allwinner-a10-dramc.h
> new file mode 100644
> index 0000000000..b61fbecbe7
> --- /dev/null
> +++ b/include/hw/misc/allwinner-a10-dramc.h
> @@ -0,0 +1,68 @@
> +/*
> + * Allwinner A10 DRAM Controller emulation
> + *
> + * Copyright (C) 2022 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> + *
> + *  This file is derived from Allwinner H3 DRAMC,
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
> +#ifndef HW_MISC_ALLWINNER_A10_DRAMC_H
> +#define HW_MISC_ALLWINNER_A10_DRAMC_H
> +
> +#include "qom/object.h"
> +#include "hw/sysbus.h"
> +#include "hw/register.h"
> +
> +/**
> + * @name Constants
> + * @{
> + */
> +
> +/** Size of register I/O address space used by DRAMC device */
> +#define AW_A10_DRAMC_IOSIZE        (0x1000)
> +
> +/** Total number of known registers */
> +#define AW_A10_DRAMC_REGS_NUM      (AW_A10_DRAMC_IOSIZE /
> sizeof(uint32_t))
> +
> +/** @} */
> +
> +/**
> + * @name Object model
> + * @{
> + */
> +
> +#define TYPE_AW_A10_DRAMC    "allwinner-a10-dramc"
> +OBJECT_DECLARE_SIMPLE_TYPE(AwA10DramControllerState, AW_A10_DRAMC)
> +
> +/** @} */
> +
> +/**
> + * Allwinner A10 DRAMC object instance state.
> + */
> +struct AwA10DramControllerState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +    /*< public >*/
> +
> +    /** Maps I/O registers in physical memory */
> +    MemoryRegion iomem;
> +
> +    /** Array of hardware registers */
> +    uint32_t regs[AW_A10_DRAMC_REGS_NUM];
> +};
> +
> +#endif /* HW_MISC_ALLWINNER_A10_DRAMC_H */
> --
> 2.30.2
>
>

-- 
Niek Linnenbank

--000000000000028ffa05ef446930
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Strahinja,<br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Dec 4, 2022 at 1=
2:19 AM Strahinja Jankovic &lt;<a href=3D"mailto:strahinjapjankovic@gmail.c=
om">strahinjapjankovic@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">During SPL boot several DRAM Controller re=
gisters are used. Most<br>
important registers are those related to DRAM initialization and<br>
calibration, where SPL initiates process and waits until certain bit is<br>
set/cleared.<br>
<br>
This patch adds these registers, initializes reset values from user&#39;s<b=
r>
guide and updates state of registers as SPL expects it.<br>
<br>
Signed-off-by: Strahinja Jankovic &lt;<a href=3D"mailto:strahinja.p.jankovi=
c@gmail.com" target=3D"_blank">strahinja.p.jankovic@gmail.com</a>&gt;<br>
---<br>
=C2=A0hw/arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0hw/arm/allwinner-a10.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A07 +<br>
=C2=A0hw/misc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0hw/misc/allwinner-a10-dramc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 179 =
++++++++++++++++++++++++++<br>
=C2=A0hw/misc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0include/hw/arm/allwinner-a10.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +<br>
=C2=A0include/hw/misc/allwinner-a10-dramc.h |=C2=A0 68 ++++++++++<br>
=C2=A07 files changed, 261 insertions(+)<br>
=C2=A0create mode 100644 hw/misc/allwinner-a10-dramc.c<br>
=C2=A0create mode 100644 include/hw/misc/allwinner-a10-dramc.h<br>
<br>
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig<br>
index 14f52b41af..140f142ae5 100644<br>
--- a/hw/arm/Kconfig<br>
+++ b/hw/arm/Kconfig<br>
@@ -320,6 +320,7 @@ config ALLWINNER_A10<br>
=C2=A0 =C2=A0 =C2=A0select ALLWINNER_A10_PIT<br>
=C2=A0 =C2=A0 =C2=A0select ALLWINNER_A10_PIC<br>
=C2=A0 =C2=A0 =C2=A0select ALLWINNER_A10_CCM<br>
+=C2=A0 =C2=A0 select ALLWINNER_A10_DRAMC<br>
=C2=A0 =C2=A0 =C2=A0select ALLWINNER_EMAC<br>
=C2=A0 =C2=A0 =C2=A0select SERIAL<br>
=C2=A0 =C2=A0 =C2=A0select UNIMP<br>
diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c<br>
index 86baeeeca2..a5f7a36ac9 100644<br>
--- a/hw/arm/allwinner-a10.c<br>
+++ b/hw/arm/allwinner-a10.c<br>
@@ -25,6 +25,7 @@<br>
=C2=A0#include &quot;hw/boards.h&quot;<br>
=C2=A0#include &quot;hw/usb/hcd-ohci.h&quot;<br>
<br>
+#define AW_A10_DRAMC_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c01000<br>
=C2=A0#define AW_A10_MMC0_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c0f000<br>
=C2=A0#define AW_A10_CCM_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x01c20000<b=
r>
=C2=A0#define AW_A10_PIC_REG_BASE=C2=A0 =C2=A0 =C2=A00x01c20400<br>
@@ -49,6 +50,8 @@ static void aw_a10_init(Object *obj)<br>
<br>
=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;ccm&quot;, &amp;s-&g=
t;ccm, TYPE_AW_A10_CCM);<br>
<br>
+=C2=A0 =C2=A0 object_initialize_child(obj, &quot;dramc&quot;, &amp;s-&gt;d=
ramc, TYPE_AW_A10_DRAMC);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;emac&quot;, &amp;s-&=
gt;emac, TYPE_AW_EMAC);<br>
<br>
=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;sata&quot;, &amp;s-&=
gt;sata, TYPE_ALLWINNER_AHCI);<br>
@@ -110,6 +113,10 @@ static void aw_a10_realize(DeviceState *dev, Error **e=
rrp)<br>
=C2=A0 =C2=A0 =C2=A0sysbus_realize(SYS_BUS_DEVICE(&amp;s-&gt;ccm), &amp;err=
or_fatal);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&amp;s-&gt;ccm), 0, AW_A=
10_CCM_BASE);<br>
<br>
+=C2=A0 =C2=A0 /* DRAM Control Module */<br>
+=C2=A0 =C2=A0 sysbus_realize(SYS_BUS_DEVICE(&amp;s-&gt;dramc), &amp;error_=
fatal);<br>
+=C2=A0 =C2=A0 sysbus_mmio_map(SYS_BUS_DEVICE(&amp;s-&gt;dramc), 0, AW_A10_=
DRAMC_BASE);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* FIXME use qdev NIC properties instead of nd_table[] =
*/<br>
=C2=A0 =C2=A0 =C2=A0if (nd_table[0].used) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_check_nic_model(&amp;nd_table[0], TY=
PE_AW_EMAC);<br>
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig<br>
index ed07bf4133..052fb54310 100644<br>
--- a/hw/misc/Kconfig<br>
+++ b/hw/misc/Kconfig<br>
@@ -177,4 +177,7 @@ config LASI<br>
=C2=A0config ALLWINNER_A10_CCM<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
<br>
+config ALLWINNER_A10_DRAMC<br>
+=C2=A0 =C2=A0 bool<br>
+<br>
=C2=A0source macio/Kconfig<br>
diff --git a/hw/misc/allwinner-a10-dramc.c b/hw/misc/allwinner-a10-dramc.c<=
br>
new file mode 100644<br>
index 0000000000..e118b0c2fd<br>
--- /dev/null<br>
+++ b/hw/misc/allwinner-a10-dramc.c<br>
@@ -0,0 +1,179 @@<br>
+/*<br>
+ * Allwinner A10 DRAM Controller emulation<br>
+ *<br>
+ * Copyright (C) 2022 Strahinja Jankovic &lt;<a href=3D"mailto:strahinja.p=
.jankovic@gmail.com" target=3D"_blank">strahinja.p.jankovic@gmail.com</a>&g=
t;<br>
+ *<br>
+ *=C2=A0 This file is derived from Allwinner H3 DRAMC,<br>
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
+#include &quot;hw/misc/allwinner-a10-dramc.h&quot;<br>
+<br>
+/* DRAMC register offsets */<br>
+enum {<br>
+=C2=A0 =C2=A0 REG_SDR_CCR =3D 0x0000,<br>
+=C2=A0 =C2=A0 REG_SDR_ZQCR0 =3D 0x00a8,<br>
+=C2=A0 =C2=A0 REG_SDR_ZQSR =3D 0x00b0<br>
+};<br></blockquote><div><br></div><div>This matches indeed with what is cu=
rrently implemented in u-boot in the file arch/arm/include/asm/arch-sunxi/d=
ram_sun4i.h.</div><div>And since the datasheets don&#39;t document the DRAM=
 controllers, probably the best we can do is match with u-boot.<br></div><d=
iv><br></div><div>Reviewed-by: Niek Linnenbank &lt;<a href=3D"mailto:niekli=
nnenbank@gmail.com">nieklinnenbank@gmail.com</a>&gt;</div><div><br></div><d=
iv>Regards,</div><div>Niek<br></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
+<br>
+#define REG_INDEX(offset)=C2=A0 =C2=A0 (offset / sizeof(uint32_t))<br>
+<br>
+/* DRAMC register flags */<br>
+enum {<br>
+=C2=A0 =C2=A0 REG_SDR_CCR_DATA_TRAINING =3D (1 &lt;&lt; 30),<br>
+=C2=A0 =C2=A0 REG_SDR_CCR_DRAM_INIT=C2=A0 =C2=A0 =C2=A0=3D (1 &lt;&lt; 31)=
,<br>
+};<br>
+enum {<br>
+=C2=A0 =C2=A0 REG_SDR_ZQSR_ZCAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D (1 &l=
t;&lt; 31),<br>
+};<br>
+<br>
+/* DRAMC register reset values */<br>
+enum {<br>
+=C2=A0 =C2=A0 REG_SDR_CCR_RESET=C2=A0 =C2=A0=3D 0x80020000,<br>
+=C2=A0 =C2=A0 REG_SDR_ZQCR0_RESET =3D 0x07b00000,<br>
+=C2=A0 =C2=A0 REG_SDR_ZQSR_RESET=C2=A0 =3D 0x80000000<br>
+};<br>
+<br>
+static uint64_t allwinner_a10_dramc_read(void *opaque, hwaddr offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned =
size)<br>
+{<br>
+=C2=A0 =C2=A0 const AwA10DramControllerState *s =3D AW_A10_DRAMC(opaque);<=
br>
+=C2=A0 =C2=A0 const uint32_t idx =3D REG_INDEX(offset);<br>
+<br>
+=C2=A0 =C2=A0 switch (offset) {<br>
+=C2=A0 =C2=A0 case REG_SDR_CCR:<br>
+=C2=A0 =C2=A0 case REG_SDR_ZQCR0:<br>
+=C2=A0 =C2=A0 case REG_SDR_ZQSR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 0x2e4 ... AW_A10_DRAMC_IOSIZE:<br>
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
+static void allwinner_a10_dramc_write(void *opaque, hwaddr offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t val, unsigned =
size)<br>
+{<br>
+=C2=A0 =C2=A0 AwA10DramControllerState *s =3D AW_A10_DRAMC(opaque);<br>
+=C2=A0 =C2=A0 const uint32_t idx =3D REG_INDEX(offset);<br>
+<br>
+=C2=A0 =C2=A0 switch (offset) {<br>
+=C2=A0 =C2=A0 case REG_SDR_CCR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (val &amp; REG_SDR_CCR_DRAM_INIT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Clear DRAM_INIT to indicate p=
rocess is done. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val &amp;=3D ~REG_SDR_CCR_DRAM_I=
NIT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (val &amp; REG_SDR_CCR_DATA_TRAINING) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Clear DATA_TRAINING to indica=
te process is done. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val &amp;=3D ~REG_SDR_CCR_DATA_T=
RAINING;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case REG_SDR_ZQCR0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Set ZCAL in ZQSR to indicate calibration is=
 done. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_SDR_ZQSR)] |=3D REG_S=
DR_ZQSR_ZCAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 0x2e4 ... AW_A10_DRAMC_IOSIZE:<br>
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
+static const MemoryRegionOps allwinner_a10_dramc_ops =3D {<br>
+=C2=A0 =C2=A0 .read =3D allwinner_a10_dramc_read,<br>
+=C2=A0 =C2=A0 .write =3D allwinner_a10_dramc_write,<br>
+=C2=A0 =C2=A0 .endianness =3D DEVICE_NATIVE_ENDIAN,<br>
+=C2=A0 =C2=A0 .valid =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 4,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 .impl.min_access_size =3D 4,<br>
+};<br>
+<br>
+static void allwinner_a10_dramc_reset_enter(Object *obj, ResetType type)<b=
r>
+{<br>
+=C2=A0 =C2=A0 AwA10DramControllerState *s =3D AW_A10_DRAMC(obj);<br>
+<br>
+=C2=A0 =C2=A0 /* Set default values for registers */<br>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_SDR_CCR)] =3D REG_SDR_CCR_RESET;<br=
>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_SDR_ZQCR0)] =3D REG_SDR_ZQCR0_RESET=
;<br>
+=C2=A0 =C2=A0 s-&gt;regs[REG_INDEX(REG_SDR_ZQSR)] =3D REG_SDR_ZQSR_RESET;<=
br>
+}<br>
+<br>
+static void allwinner_a10_dramc_init(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);<br>
+=C2=A0 =C2=A0 AwA10DramControllerState *s =3D AW_A10_DRAMC(obj);<br>
+<br>
+=C2=A0 =C2=A0 /* Memory mapping */<br>
+=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;iomem, OBJECT(s), &amp;allw=
inner_a10_dramc_ops, s,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 TYPE_AW_A10_DRAMC, AW_A10_DRAMC_IOSIZE);<br>
+=C2=A0 =C2=A0 sysbus_init_mmio(sbd, &amp;s-&gt;iomem);<br>
+}<br>
+<br>
+static const VMStateDescription allwinner_a10_dramc_vmstate =3D {<br>
+=C2=A0 =C2=A0 .name =3D &quot;allwinner-a10-dramc&quot;,<br>
+=C2=A0 =C2=A0 .version_id =3D 1,<br>
+=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
+=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32_ARRAY(regs, AwA10DramController=
State,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AW_A10_DRAMC_REGS_NUM),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
+=C2=A0 =C2=A0 }<br>
+};<br>
+<br>
+static void allwinner_a10_dramc_class_init(ObjectClass *klass, void *data)=
<br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+=C2=A0 =C2=A0 ResettableClass *rc =3D RESETTABLE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 rc-&gt;phases.enter =3D allwinner_a10_dramc_reset_enter;<br>
+=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;allwinner_a10_dramc_vmstate;<br>
+}<br>
+<br>
+static const TypeInfo allwinner_a10_dramc_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_AW_A10_DRAM=
C,<br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEVICE,<=
br>
+=C2=A0 =C2=A0 .instance_init =3D allwinner_a10_dramc_init,<br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(AwA10DramControllerState),<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D allwinner_a10_dramc_class_init,=
<br>
+};<br>
+<br>
+static void allwinner_a10_dramc_register(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;allwinner_a10_dramc_info);<br>
+}<br>
+<br>
+type_init(allwinner_a10_dramc_register)<br>
diff --git a/hw/misc/meson.build b/hw/misc/meson.build<br>
index ebf216edbc..d7f49f0f81 100644<br>
--- a/hw/misc/meson.build<br>
+++ b/hw/misc/meson.build<br>
@@ -39,6 +39,7 @@ subdir(&#39;macio&#39;)<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_IVSHMEM_DEVICE&#39;, if_true: files(=
&#39;ivshmem.c&#39;))<br>
<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_ALLWINNER_A10_CCM&#39;, if_true: fil=
es(&#39;allwinner-a10-ccm.c&#39;))<br>
+softmmu_ss.add(when: &#39;CONFIG_ALLWINNER_A10_DRAMC&#39;, if_true: files(=
&#39;allwinner-a10-dramc.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_ALLWINNER_H3&#39;, if_true: files(&#=
39;allwinner-h3-ccu.c&#39;))<br>
=C2=A0specific_ss.add(when: &#39;CONFIG_ALLWINNER_H3&#39;, if_true: files(&=
#39;allwinner-cpucfg.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_ALLWINNER_H3&#39;, if_true: files(&#=
39;allwinner-h3-dramc.c&#39;))<br>
diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.=
h<br>
index 45d0fc2f7e..abe4ff7066 100644<br>
--- a/include/hw/arm/allwinner-a10.h<br>
+++ b/include/hw/arm/allwinner-a10.h<br>
@@ -13,6 +13,7 @@<br>
=C2=A0#include &quot;hw/usb/hcd-ehci.h&quot;<br>
=C2=A0#include &quot;hw/rtc/allwinner-rtc.h&quot;<br>
=C2=A0#include &quot;hw/misc/allwinner-a10-ccm.h&quot;<br>
+#include &quot;hw/misc/allwinner-a10-dramc.h&quot;<br>
<br>
=C2=A0#include &quot;target/arm/cpu.h&quot;<br>
=C2=A0#include &quot;qom/object.h&quot;<br>
@@ -32,6 +33,7 @@ struct AwA10State {<br>
<br>
=C2=A0 =C2=A0 =C2=A0ARMCPU cpu;<br>
=C2=A0 =C2=A0 =C2=A0AwA10ClockCtlState ccm;<br>
+=C2=A0 =C2=A0 AwA10DramControllerState dramc;<br>
=C2=A0 =C2=A0 =C2=A0AwA10PITState timer;<br>
=C2=A0 =C2=A0 =C2=A0AwA10PICState intc;<br>
=C2=A0 =C2=A0 =C2=A0AwEmacState emac;<br>
diff --git a/include/hw/misc/allwinner-a10-dramc.h b/include/hw/misc/allwin=
ner-a10-dramc.h<br>
new file mode 100644<br>
index 0000000000..b61fbecbe7<br>
--- /dev/null<br>
+++ b/include/hw/misc/allwinner-a10-dramc.h<br>
@@ -0,0 +1,68 @@<br>
+/*<br>
+ * Allwinner A10 DRAM Controller emulation<br>
+ *<br>
+ * Copyright (C) 2022 Strahinja Jankovic &lt;<a href=3D"mailto:strahinja.p=
.jankovic@gmail.com" target=3D"_blank">strahinja.p.jankovic@gmail.com</a>&g=
t;<br>
+ *<br>
+ *=C2=A0 This file is derived from Allwinner H3 DRAMC,<br>
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
+#ifndef HW_MISC_ALLWINNER_A10_DRAMC_H<br>
+#define HW_MISC_ALLWINNER_A10_DRAMC_H<br>
+<br>
+#include &quot;qom/object.h&quot;<br>
+#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;hw/register.h&quot;<br>
+<br>
+/**<br>
+ * @name Constants<br>
+ * @{<br>
+ */<br>
+<br>
+/** Size of register I/O address space used by DRAMC device */<br>
+#define AW_A10_DRAMC_IOSIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1000)<br>
+<br>
+/** Total number of known registers */<br>
+#define AW_A10_DRAMC_REGS_NUM=C2=A0 =C2=A0 =C2=A0 (AW_A10_DRAMC_IOSIZE / s=
izeof(uint32_t))<br>
+<br>
+/** @} */<br>
+<br>
+/**<br>
+ * @name Object model<br>
+ * @{<br>
+ */<br>
+<br>
+#define TYPE_AW_A10_DRAMC=C2=A0 =C2=A0 &quot;allwinner-a10-dramc&quot;<br>
+OBJECT_DECLARE_SIMPLE_TYPE(AwA10DramControllerState, AW_A10_DRAMC)<br>
+<br>
+/** @} */<br>
+<br>
+/**<br>
+ * Allwinner A10 DRAMC object instance state.<br>
+ */<br>
+struct AwA10DramControllerState {<br>
+=C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
+=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
+=C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
+<br>
+=C2=A0 =C2=A0 /** Maps I/O registers in physical memory */<br>
+=C2=A0 =C2=A0 MemoryRegion iomem;<br>
+<br>
+=C2=A0 =C2=A0 /** Array of hardware registers */<br>
+=C2=A0 =C2=A0 uint32_t regs[AW_A10_DRAMC_REGS_NUM];<br>
+};<br>
+<br>
+#endif /* HW_MISC_ALLWINNER_A10_DRAMC_H */<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--000000000000028ffa05ef446930--

