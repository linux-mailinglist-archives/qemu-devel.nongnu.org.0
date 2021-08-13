Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E50703EAE09
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 03:02:09 +0200 (CEST)
Received: from localhost ([::1]:48136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mELaK-0006tQ-UN
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 21:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mELYN-00063h-7B; Thu, 12 Aug 2021 21:00:07 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:45038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mELYJ-0001QC-UK; Thu, 12 Aug 2021 21:00:07 -0400
Received: by mail-io1-xd34.google.com with SMTP id d22so11005025ioy.11;
 Thu, 12 Aug 2021 18:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wk0FGQtWr03dL2h2pJ8Cwi1UdBv6qmuo7vNsSAR8f2I=;
 b=GvLAioYln19jmDcb92CSu8BVQW1xAK5fsmve0wDKDFJz8Mm3MPJEdbYXjRjetV9qXi
 7WyD5pk3bThRVySwQT9hhXi8xoaMVig3syybiigYIw+nvyedCKKg32AqRxuHk3MVqB5l
 1CGilIxUJ88dDcP35hmSERq+YYCXtrEt/pDLjNj7okb9s5yJu7GIat2u9ch93Gv6YLSe
 PtoxWUoEBGro9oGf4To17YBUR9fB26vrtLLS0ReXrdKw0O964R0Ed6O4O46QO8wXYIcR
 y6WrJAauh6Kt3Dexmx22D39UI4jG+ensnwnuarS5YgnLj2dCLBiVc10RjWVwZfWJLh1Q
 7gwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wk0FGQtWr03dL2h2pJ8Cwi1UdBv6qmuo7vNsSAR8f2I=;
 b=DzJKpztZbTKeyGU6SdBdm/UfaXT5S5BKWLI22aIovlLXb0PoBx6ocYk57ABr2GX87M
 zKSJTW2gQ0Wjzl984a1+rx2ZJLJlTzQRp1copbK0cH94+OfQ/kePGsRvMaLV9Tae1MMo
 kO3lluDfgk9aIus7bfIXnNW4U5ZktvZAfJyQW1VaIWOz5vIENC0YCzyCeWPjxGPJN7TP
 tdNmdMDJXuwgHITS14zRWhsOkl/H3BR8dCPMsVSM1GPJ8W8hyeqxiyzdBWPLrNzb3QZS
 YUuDPHKgXKiJW6KHEk9hfds7gtiEra/QM2tBhLNGiGE+ODvwE0q5BZbsxcKAJooWG4xA
 ZrGQ==
X-Gm-Message-State: AOAM532bqiaw3H4I4k6CvEsyM+A7rfrtGg6dFX5hI4xwluWXzuj3+q9S
 guxGVrGkQfBb/iUDqYZYZFUx3ZpLsmWx5LMZAhs=
X-Google-Smtp-Source: ABdhPJyn68ohbrllwevZc09TPegmbXIVyXHXYS+FPXyPK9rDnPVpLdJRri8ddXePIDCnTA+kfIMQg2X1pxi2JQ6OZZs=
X-Received: by 2002:a02:c502:: with SMTP id s2mr6183856jam.135.1628816402344; 
 Thu, 12 Aug 2021 18:00:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-2-peter.maydell@linaro.org>
In-Reply-To: <20210812093356.1946-2-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Aug 2021 10:59:36 +1000
Message-ID: <CAKmqyKMDrNpX_xkarpgT56TKQvA1exPX6KNj0ke4MD0JQAL2nQ@mail.gmail.com>
Subject: Re: [PATCH for-6.2 01/25] arm: Move M-profile RAS register block into
 its own device
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 12, 2021 at 7:34 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Currently we implement the RAS register block within the NVIC device.
> It isn't really very tightly coupled with the NVIC proper, so instead
> move it out into a sysbus device of its own and have the top level
> ARMv7M container create it and map it into memory at the right
> address.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/arm/armv7m.h       |  2 +
>  include/hw/intc/armv7m_nvic.h |  1 -
>  include/hw/misc/armv7m_ras.h  | 37 ++++++++++++++
>  hw/arm/armv7m.c               | 12 +++++
>  hw/intc/armv7m_nvic.c         | 56 ---------------------
>  hw/misc/armv7m_ras.c          | 93 +++++++++++++++++++++++++++++++++++
>  MAINTAINERS                   |  2 +
>  hw/misc/meson.build           |  2 +
>  8 files changed, 148 insertions(+), 57 deletions(-)
>  create mode 100644 include/hw/misc/armv7m_ras.h
>  create mode 100644 hw/misc/armv7m_ras.c
>
> diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
> index bc6733c5184..4cae0d7eeaa 100644
> --- a/include/hw/arm/armv7m.h
> +++ b/include/hw/arm/armv7m.h
> @@ -12,6 +12,7 @@
>
>  #include "hw/sysbus.h"
>  #include "hw/intc/armv7m_nvic.h"
> +#include "hw/misc/armv7m_ras.h"
>  #include "target/arm/idau.h"
>  #include "qom/object.h"
>
> @@ -58,6 +59,7 @@ struct ARMv7MState {
>      NVICState nvic;
>      BitBandState bitband[ARMV7M_NUM_BITBANDS];
>      ARMCPU *cpu;
> +    ARMv7MRAS ras;
>
>      /* MemoryRegion we pass to the CPU, with our devices layered on
>       * top of the ones the board provides in board_memory.
> diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
> index 39c71e15936..33b6d8810c7 100644
> --- a/include/hw/intc/armv7m_nvic.h
> +++ b/include/hw/intc/armv7m_nvic.h
> @@ -83,7 +83,6 @@ struct NVICState {
>      MemoryRegion sysreg_ns_mem;
>      MemoryRegion systickmem;
>      MemoryRegion systick_ns_mem;
> -    MemoryRegion ras_mem;
>      MemoryRegion container;
>      MemoryRegion defaultmem;
>
> diff --git a/include/hw/misc/armv7m_ras.h b/include/hw/misc/armv7m_ras.h
> new file mode 100644
> index 00000000000..f8773e65b14
> --- /dev/null
> +++ b/include/hw/misc/armv7m_ras.h
> @@ -0,0 +1,37 @@
> +/*
> + * Arm M-profile RAS block
> + *
> + * Copyright (c) 2021 Linaro Limited
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2 or
> + *  (at your option) any later version.
> + */
> +
> +/*
> + * This is a model of the RAS register block of an M-profile CPU
> + * (the registers starting at 0xE0005000 with ERRFRn).
> + *
> + * QEMU interface:
> + *  + sysbus MMIO region 0: the register bank
> + *
> + * The QEMU implementation currently provides "minimal RAS" only.
> + */
> +
> +#ifndef HW_MISC_ARMV7M_RAS_H
> +#define HW_MISC_ARMV7M_RAS_H
> +
> +#include "hw/sysbus.h"
> +
> +#define TYPE_ARMV7M_RAS "armv7m-ras"
> +OBJECT_DECLARE_SIMPLE_TYPE(ARMv7MRAS, ARMV7M_RAS)
> +
> +struct ARMv7MRAS {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    MemoryRegion iomem;
> +};
> +
> +#endif
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 9ce5c30cd5c..8964730d153 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -231,6 +231,18 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>      memory_region_add_subregion(&s->container, 0xe0000000,
>                                  sysbus_mmio_get_region(sbd, 0));
>
> +    /* If the CPU has RAS support, create the RAS register block */
> +    if (cpu_isar_feature(aa32_ras, s->cpu)) {
> +        object_initialize_child(OBJECT(dev), "armv7m-ras",
> +                                &s->ras, TYPE_ARMV7M_RAS);
> +        sbd = SYS_BUS_DEVICE(&s->ras);
> +        if (!sysbus_realize(sbd, errp)) {
> +            return;
> +        }
> +        memory_region_add_subregion_overlap(&s->container, 0xe0005000,
> +                                            sysbus_mmio_get_region(sbd, 0), 1);
> +    }
> +
>      for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
>          if (s->enable_bitband) {
>              Object *obj = OBJECT(&s->bitband[i]);
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 1e7ddcb94cb..a5975592dfa 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -2549,56 +2549,6 @@ static const MemoryRegionOps nvic_systick_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>
> -
> -static MemTxResult ras_read(void *opaque, hwaddr addr,
> -                            uint64_t *data, unsigned size,
> -                            MemTxAttrs attrs)
> -{
> -    if (attrs.user) {
> -        return MEMTX_ERROR;
> -    }
> -
> -    switch (addr) {
> -    case 0xe10: /* ERRIIDR */
> -        /* architect field = Arm; product/variant/revision 0 */
> -        *data = 0x43b;
> -        break;
> -    case 0xfc8: /* ERRDEVID */
> -        /* Minimal RAS: we implement 0 error record indexes */
> -        *data = 0;
> -        break;
> -    default:
> -        qemu_log_mask(LOG_UNIMP, "Read RAS register offset 0x%x\n",
> -                      (uint32_t)addr);
> -        *data = 0;
> -        break;
> -    }
> -    return MEMTX_OK;
> -}
> -
> -static MemTxResult ras_write(void *opaque, hwaddr addr,
> -                             uint64_t value, unsigned size,
> -                             MemTxAttrs attrs)
> -{
> -    if (attrs.user) {
> -        return MEMTX_ERROR;
> -    }
> -
> -    switch (addr) {
> -    default:
> -        qemu_log_mask(LOG_UNIMP, "Write to RAS register offset 0x%x\n",
> -                      (uint32_t)addr);
> -        break;
> -    }
> -    return MEMTX_OK;
> -}
> -
> -static const MemoryRegionOps ras_ops = {
> -    .read_with_attrs = ras_read,
> -    .write_with_attrs = ras_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> -};
> -
>  /*
>   * Unassigned portions of the PPB space are RAZ/WI for privileged
>   * accesses, and fault for non-privileged accesses.
> @@ -2946,12 +2896,6 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
>                                              &s->systick_ns_mem, 1);
>      }
>
> -    if (cpu_isar_feature(aa32_ras, s->cpu)) {
> -        memory_region_init_io(&s->ras_mem, OBJECT(s),
> -                              &ras_ops, s, "nvic_ras", 0x1000);
> -        memory_region_add_subregion(&s->container, 0x5000, &s->ras_mem);
> -    }
> -
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container);
>  }
>
> diff --git a/hw/misc/armv7m_ras.c b/hw/misc/armv7m_ras.c
> new file mode 100644
> index 00000000000..a2b4f4b8dc8
> --- /dev/null
> +++ b/hw/misc/armv7m_ras.c
> @@ -0,0 +1,93 @@
> +/*
> + * Arm M-profile RAS block
> + *
> + * Copyright (c) 2021 Linaro Limited
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2 or
> + *  (at your option) any later version.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/misc/armv7m_ras.h"
> +#include "qemu/log.h"
> +
> +static MemTxResult ras_read(void *opaque, hwaddr addr,
> +                            uint64_t *data, unsigned size,
> +                            MemTxAttrs attrs)
> +{
> +    if (attrs.user) {
> +        return MEMTX_ERROR;
> +    }
> +
> +    switch (addr) {
> +    case 0xe10: /* ERRIIDR */
> +        /* architect field = Arm; product/variant/revision 0 */
> +        *data = 0x43b;
> +        break;
> +    case 0xfc8: /* ERRDEVID */
> +        /* Minimal RAS: we implement 0 error record indexes */
> +        *data = 0;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "Read RAS register offset 0x%x\n",
> +                      (uint32_t)addr);
> +        *data = 0;
> +        break;
> +    }
> +    return MEMTX_OK;
> +}
> +
> +static MemTxResult ras_write(void *opaque, hwaddr addr,
> +                             uint64_t value, unsigned size,
> +                             MemTxAttrs attrs)
> +{
> +    if (attrs.user) {
> +        return MEMTX_ERROR;
> +    }
> +
> +    switch (addr) {
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "Write to RAS register offset 0x%x\n",
> +                      (uint32_t)addr);
> +        break;
> +    }
> +    return MEMTX_OK;
> +}
> +
> +static const MemoryRegionOps ras_ops = {
> +    .read_with_attrs = ras_read,
> +    .write_with_attrs = ras_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
> +
> +static void armv7m_ras_init(Object *obj)
> +{
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +    ARMv7MRAS *s = ARMV7M_RAS(obj);
> +
> +    memory_region_init_io(&s->iomem, obj, &ras_ops,
> +                          s, "armv7m-ras", 0x1000);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +}
> +
> +static void armv7m_ras_class_init(ObjectClass *klass, void *data)
> +{
> +    /* This device has no state: no need for vmstate or reset */
> +}
> +
> +static const TypeInfo armv7m_ras_info = {
> +    .name = TYPE_ARMV7M_RAS,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(ARMv7MRAS),
> +    .instance_init = armv7m_ras_init,
> +    .class_init = armv7m_ras_class_init,
> +};
> +
> +static void armv7m_ras_register_types(void)
> +{
> +    type_register_static(&armv7m_ras_info);
> +}
> +
> +type_init(armv7m_ras_register_types);
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 37b1a8e4428..3cac393bb48 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -617,6 +617,7 @@ F: hw/intc/gic_internal.h
>  F: hw/misc/a9scu.c
>  F: hw/misc/arm11scu.c
>  F: hw/misc/arm_l2x0.c
> +F: hw/misc/armv7m_ras.c
>  F: hw/timer/a9gtimer*
>  F: hw/timer/arm*
>  F: include/hw/arm/arm*.h
> @@ -626,6 +627,7 @@ F: include/hw/misc/arm11scu.h
>  F: include/hw/timer/a9gtimer.h
>  F: include/hw/timer/arm_mptimer.h
>  F: include/hw/timer/armv7m_systick.h
> +F: include/hw/misc/armv7m_ras.h
>  F: tests/qtest/test-arm-mptimer.c
>
>  Exynos
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index a53b849a5a0..3f41a3a5b27 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -17,6 +17,8 @@ softmmu_ss.add(when: 'CONFIG_INTEGRATOR_DEBUG', if_true: files('arm_integrator_d
>  softmmu_ss.add(when: 'CONFIG_A9SCU', if_true: files('a9scu.c'))
>  softmmu_ss.add(when: 'CONFIG_ARM11SCU', if_true: files('arm11scu.c'))
>
> +softmmu_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_ras.c'))
> +
>  # Mac devices
>  softmmu_ss.add(when: 'CONFIG_MOS6522', if_true: files('mos6522.c'))
>
> --
> 2.20.1
>
>

