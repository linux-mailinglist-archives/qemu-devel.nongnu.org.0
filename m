Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D3E24EA01
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Aug 2020 23:23:52 +0200 (CEST)
Received: from localhost ([::1]:35472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9azP-00015F-Jy
	for lists+qemu-devel@lfdr.de; Sat, 22 Aug 2020 17:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9axx-0007n3-0q; Sat, 22 Aug 2020 17:22:21 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:46976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9axu-0002vN-IM; Sat, 22 Aug 2020 17:22:20 -0400
Received: by mail-wr1-x441.google.com with SMTP id r15so5030488wrp.13;
 Sat, 22 Aug 2020 14:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ur4kEdLENyNVsVl2FfyvPvoLjFRyubV/iHk8dJkHCgU=;
 b=L1zrPGithky/Rkb76dLjBJwjAfF8JbPuab+gLTthxCEQW02Rds7wrwqbSATND1v6Bi
 ZeEOJfzr3/37EphVgOKtPIT+0Q7HxgHsDs+t+GqAqdpzUfHVYzzpA745rAQIio2IKdBJ
 2gRro43dbVX3+7Tb5bRX6uVUJvazlOTkP9cZk/EFWazzThKvtACmxz4noMmEmfzeidXv
 hoV5se6O3Wy78Ejjs1C2P2sdtVNcCtj7tazhXpiVIvPt6RrYBEYb8HfaAW1sO7R/jeK8
 lVIusH9Ra9aPqGKZBYajP4/0clFdR5w/eVwiSYZ1XXMjB6SON179GRAlyTMjqjd5IY5j
 P7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ur4kEdLENyNVsVl2FfyvPvoLjFRyubV/iHk8dJkHCgU=;
 b=lArYjWFDG4IOdoOMdAd7N58lA9QgiNMzIHaGnMJrdq05357MSlcKgyU4w/rLdqZ7wB
 vlzKZR/+KQBWxAyLrfUidkD/g5vyrtbMj/lYruGmzGf3nz87PmUZQLPDIrwrOjbDYnBm
 suRYeoLU14xYVUjsdXhj3TNYCrlx1QZ3fYsJNIyyC44dUwdIi0Kn6dPeuxX08nHYhUhH
 FfmNMxgABREJt8rVEV6+LG8IUDhkJk5ElNE3/JkJD1Puo8botqMXELCE7y+k63rPRTVP
 wWpYs/9/ObOsnZjmn7wtW3rrwpN7rD8kP0I1+JmePdZjL64SE37csUxajHAH2He2Ff15
 u8kQ==
X-Gm-Message-State: AOAM533lad6IEDITVsf1Kp3hYDpEN7h1tfbEquFsy6ljdOOIfpgqE6uZ
 EvS7nmX8Yef+Kr7V6pEskZMh1SCG/zU=
X-Google-Smtp-Source: ABdhPJxvGBwM5uWJzRE0AQgmo3WQHBbgTfdiScEQ3tYrJXKngWRTzvH9dohsdjPHrD/+TasRiykU1g==
X-Received: by 2002:adf:9ed1:: with SMTP id b17mr8026745wrf.227.1598131336269; 
 Sat, 22 Aug 2020 14:22:16 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id r206sm15095844wma.6.2020.08.22.14.22.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2020 14:22:15 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] hw/sd: Add Cadence SDHCI emulation
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <1597658722-12922-1-git-send-email-bin.meng@windriver.com>
 <1597658722-12922-4-git-send-email-bin.meng@windriver.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <dc1a2f26-be0d-3662-abb4-343e09037e20@amsat.org>
Date: Sat, 22 Aug 2020 23:22:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1597658722-12922-4-git-send-email-bin.meng@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/20 12:05 PM, Bin Meng wrote:
> Cadence SD/SDIO/eMMC Host Controller (SD4HC) is an SDHCI compatible
> controller. The SDHCI compatible registers start from offset 0x200,
> which are called Slot Register Set (SRS) in its datasheet.
> 
> This creates a Cadence SDHCI model built on top of the existing
> generic SDHCI model. Cadence specific Host Register Set (HRS) is
> implemented to make guest software happy.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v2:
> - use 's' for the model state
> - call device_cold_reset() in cadence_sdhci_reset()
> - add .impl in cadence_sdhci_ops
> - move Cadence specific register defines to cadence_sdhci.c
> - use 'sdhci' instead of 'slot' to represent SDHCIState
> - use sysbus_mmio_get_region() to access SDHCI model's memory region
> - initialize TYPE_SYSBUS_SDHCI in the instance_init() so that users
>   of Cadence SDHCI do not have to do that themselves
> - propergate irq and 'sd-bus' from generic-sdhci
> 
>  hw/sd/Kconfig                 |   4 +
>  hw/sd/Makefile.objs           |   1 +
>  hw/sd/cadence_sdhci.c         | 200 ++++++++++++++++++++++++++++++++++++++++++
>  include/hw/sd/cadence_sdhci.h |  46 ++++++++++
>  4 files changed, 251 insertions(+)
>  create mode 100644 hw/sd/cadence_sdhci.c
>  create mode 100644 include/hw/sd/cadence_sdhci.h

Consider using scripts/git.orderfile ;)
> 
> diff --git a/hw/sd/Kconfig b/hw/sd/Kconfig
> index c5e1e55..633b9af 100644
> --- a/hw/sd/Kconfig
> +++ b/hw/sd/Kconfig
> @@ -19,3 +19,7 @@ config SDHCI_PCI
>      default y if PCI_DEVICES
>      depends on PCI
>      select SDHCI
> +
> +config CADENCE_SDHCI
> +    bool
> +    select SDHCI
> diff --git a/hw/sd/Makefile.objs b/hw/sd/Makefile.objs
> index 0d1df17..4d500a6 100644
> --- a/hw/sd/Makefile.objs
> +++ b/hw/sd/Makefile.objs
> @@ -10,3 +10,4 @@ common-obj-$(CONFIG_OMAP) += omap_mmc.o
>  common-obj-$(CONFIG_PXA2XX) += pxa2xx_mmci.o
>  common-obj-$(CONFIG_RASPI) += bcm2835_sdhost.o
>  common-obj-$(CONFIG_ASPEED_SOC) += aspeed_sdhci.o
> +common-obj-$(CONFIG_CADENCE_SDHCI) += cadence_sdhci.o
> diff --git a/hw/sd/cadence_sdhci.c b/hw/sd/cadence_sdhci.c
> new file mode 100644
> index 0000000..4f01d63
> --- /dev/null
> +++ b/hw/sd/cadence_sdhci.c
> @@ -0,0 +1,200 @@
> +/*
> + * Cadence SDHCI emulation
> + *
> + * Copyright (c) 2020 Wind River Systems, Inc.
> + *
> + * Author:
> + *   Bin Meng <bin.meng@windriver.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 or
> + * (at your option) version 3 of the License.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/bitops.h"
> +#include "qemu/error-report.h"
> +#include "qemu/log.h"
> +#include "qapi/error.h"
> +#include "migration/vmstate.h"
> +#include "hw/irq.h"
> +#include "hw/sd/cadence_sdhci.h"
> +#include "sdhci-internal.h"
> +
> +/* HRS - Host Register Set (specific to Cadence) */
> +
> +#define CADENCE_SDHCI_HRS00             0x00    /* general information */
> +#define CADENCE_SDHCI_HRS00_SWR             BIT(0)
> +#define CADENCE_SDHCI_HRS00_POR_VAL         0x00010000
> +
> +#define CADENCE_SDHCI_HRS04             0x10    /* PHY access port */
> +#define CADENCE_SDHCI_HRS04_WR              BIT(24)
> +#define CADENCE_SDHCI_HRS04_RD              BIT(25)
> +#define CADENCE_SDHCI_HRS04_ACK             BIT(26)
> +
> +#define CADENCE_SDHCI_HRS06             0x18    /* eMMC control */
> +#define CADENCE_SDHCI_HRS06_TUNE_UP         BIT(15)
> +
> +/* SRS - Slot Register Set (SDHCI-compatible) */
> +
> +#define CADENCE_SDHCI_SRS_BASE          0x200
> +
> +#define TO_REG(addr)    ((addr) / sizeof(uint32_t))
> +
> +static void cadence_sdhci_instance_init(Object *obj)
> +{
> +    CadenceSDHCIState *s = CADENCE_SDHCI(obj);
> +
> +    object_initialize_child(OBJECT(s), "cadence-sdhci.sdhci",

"generic-sdhci"?

> +                            &s->sdhci, TYPE_SYSBUS_SDHCI);
> +}
> +
> +static void cadence_sdhci_reset(DeviceState *dev)
> +{
> +    CadenceSDHCIState *s = CADENCE_SDHCI(dev);
> +
> +    memset(s->regs, 0, CADENCE_SDHCI_REG_SIZE);
> +    s->regs[TO_REG(CADENCE_SDHCI_HRS00)] = CADENCE_SDHCI_HRS00_POR_VAL;
> +
> +    device_cold_reset(DEVICE(&s->sdhci));
> +}
> +
> +static uint64_t cadence_sdhci_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    uint32_t val = 0;
> +    CadenceSDHCIState *s = opaque;
> +
> +    if (addr < CADENCE_SDHCI_REG_SIZE) {
> +        val = s->regs[TO_REG(addr)];
> +    } else {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out-of-bounds read at 0x%" HWADDR_PRIx "\n",
> +                      __func__, addr);
> +    }
> +
> +    return (uint64_t)val;
> +}
> +
> +static void cadence_sdhci_write(void *opaque, hwaddr addr, uint64_t val,
> +                                unsigned int size)
> +{
> +    CadenceSDHCIState *s = opaque;
> +    uint32_t val32 = (uint32_t)val;
> +
> +    switch (addr) {
> +    case CADENCE_SDHCI_HRS00:
> +        /*
> +         * The only writable bit is SWR (software reset) and it automatically
> +         * clears to zero, so essentially this register remains unchanged.
> +         */
> +        if (val32 & CADENCE_SDHCI_HRS00_SWR) {
> +            cadence_sdhci_reset(DEVICE(s));
> +        }
> +
> +        break;
> +    case CADENCE_SDHCI_HRS04:
> +        /*
> +         * Only emulate the ACK bit behavior when read or write transaction
> +         * are requested.
> +         */
> +        if (val32 & (CADENCE_SDHCI_HRS04_WR | CADENCE_SDHCI_HRS04_RD)) {
> +            val32 |= CADENCE_SDHCI_HRS04_ACK;
> +        } else {
> +            val32 &= ~CADENCE_SDHCI_HRS04_ACK;
> +        }
> +
> +        s->regs[TO_REG(addr)] = val32;
> +        break;
> +    case CADENCE_SDHCI_HRS06:
> +        if (val32 & CADENCE_SDHCI_HRS06_TUNE_UP) {
> +            val32 &= ~CADENCE_SDHCI_HRS06_TUNE_UP;
> +        }
> +
> +        s->regs[TO_REG(addr)] = val32;
> +        break;
> +    default:
> +        if (addr < CADENCE_SDHCI_REG_SIZE) {
> +            s->regs[TO_REG(addr)] = val32;
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: Out-of-bounds write at 0x%" HWADDR_PRIx "\n",
> +                          __func__, addr);
> +        }
> +    }
> +}
> +
> +static const MemoryRegionOps cadence_sdhci_ops = {
> +    .read = cadence_sdhci_read,
> +    .write = cadence_sdhci_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .impl = {
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +    },
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +    }
> +};
> +
> +static void cadence_sdhci_realize(DeviceState *dev, Error **errp)
> +{
> +    CadenceSDHCIState *s = CADENCE_SDHCI(dev);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +    SysBusDevice *sbd_sdhci = SYS_BUS_DEVICE(&s->sdhci);
> +
> +    memory_region_init_io(&s->iomem, OBJECT(s), &cadence_sdhci_ops,
> +                          s, TYPE_CADENCE_SDHCI, 0x1000);

I/O Region of 0x1000 but you only uses 0x100 for the Cadence part
and 0x100 for the generic part.

Consider creating a container of 0x1000, and map 2 subregions?

  memory_region_init(&s->container, OBJECT(s), 0x1000);
  memory_region_init_io(&s->iomem, OBJECT(s), &cadence_sdhci_ops,
                         s, TYPE_CADENCE_SDHCI, CADENCE_SDHCI_REG_SIZE);
  memory_region_add_subregion(&s->container, 0x000, &s->iomem);

You can then simplify your out-of-bounds access checks for
cadence_sdhci_ops's read/write.

> +    sysbus_init_mmio(sbd, &s->iomem);

Replace by:

  sysbus_init_mmio(sbd, &s->container);

Using a container seems cleaner, but your patch is fine:
Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +
> +    sysbus_realize(sbd_sdhci, errp);
> +    memory_region_add_subregion(&s->iomem, CADENCE_SDHCI_SRS_BASE,
> +                                sysbus_mmio_get_region(sbd_sdhci, 0));
> +
> +    /* propagate irq and "sd-bus" from generic-sdhci */
> +    sysbus_pass_irq(sbd, sbd_sdhci);
> +    s->bus = qdev_get_child_bus(DEVICE(sbd_sdhci), "sd-bus");
> +}
> +
> +static const VMStateDescription vmstate_cadence_sdhci = {
> +    .name = TYPE_CADENCE_SDHCI,
> +    .version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(regs, CadenceSDHCIState, CADENCE_SDHCI_NUM_REGS),
> +        VMSTATE_END_OF_LIST(),
> +    },
> +};
> +
> +static void cadence_sdhci_class_init(ObjectClass *classp, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(classp);
> +
> +    dc->desc = "Cadence SD/SDIO/eMMC Host Controller (SD4HC)";
> +    dc->realize = cadence_sdhci_realize;
> +    dc->reset = cadence_sdhci_reset;
> +    dc->vmsd = &vmstate_cadence_sdhci;
> +}
> +
> +static TypeInfo cadence_sdhci_info = {
> +    .name          = TYPE_CADENCE_SDHCI,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(CadenceSDHCIState),
> +    .instance_init = cadence_sdhci_instance_init,
> +    .class_init    = cadence_sdhci_class_init,
> +};
> +
> +static void cadence_sdhci_register_types(void)
> +{
> +    type_register_static(&cadence_sdhci_info);
> +}
> +
> +type_init(cadence_sdhci_register_types)
> diff --git a/include/hw/sd/cadence_sdhci.h b/include/hw/sd/cadence_sdhci.h
> new file mode 100644
> index 0000000..9b52115
> --- /dev/null
> +++ b/include/hw/sd/cadence_sdhci.h
> @@ -0,0 +1,46 @@
> +/*
> + * Cadence SDHCI emulation
> + *
> + * Copyright (c) 2020 Wind River Systems, Inc.
> + *
> + * Author:
> + *   Bin Meng <bin.meng@windriver.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 or
> + * (at your option) version 3 of the License.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef CADENCE_SDHCI_H
> +#define CADENCE_SDHCI_H
> +
> +#include "hw/sd/sdhci.h"
> +
> +#define CADENCE_SDHCI_REG_SIZE  0x100
> +#define CADENCE_SDHCI_NUM_REGS  (CADENCE_SDHCI_REG_SIZE / sizeof(uint32_t))
> +
> +typedef struct CadenceSDHCIState {
> +    SysBusDevice parent;
> +
> +    MemoryRegion iomem;
> +    BusState *bus;
> +
> +    uint32_t regs[CADENCE_SDHCI_NUM_REGS];
> +
> +    SDHCIState sdhci;
> +} CadenceSDHCIState;
> +
> +#define TYPE_CADENCE_SDHCI  "cadence.sdhci"
> +#define CADENCE_SDHCI(obj)  OBJECT_CHECK(CadenceSDHCIState, (obj), \
> +                                         TYPE_CADENCE_SDHCI)
> +
> +#endif /* CADENCE_SDHCI_H */
> 

