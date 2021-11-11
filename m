Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DA444D889
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:47:14 +0100 (CET)
Received: from localhost ([::1]:36746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlBM9-0004wN-7h
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:47:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mlBFY-0004S7-Sa
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:40:25 -0500
Received: from [2001:41c9:1:41f::167] (port=36184
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mlBFW-0001vi-SG
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:40:24 -0500
Received: from [2a00:23c4:8b9e:9b00:2535:46c:7466:70fe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mlBFN-0003zL-Sq; Thu, 11 Nov 2021 14:40:17 +0000
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
 <1636594528-8175-21-git-send-email-yangxiaojuan@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <e2e0cd1b-0699-1618-b911-5f8499255423@ilande.co.uk>
Date: Thu, 11 Nov 2021 14:40:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1636594528-8175-21-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9e:9b00:2535:46c:7466:70fe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v2 20/30] hw/intc: Add LoongArch ls7a msi interrupt
 controller support(PCH-MSI)
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.999,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/2021 01:35, Xiaojuan Yang wrote:

> This patch realize PCH-MSI interrupt controller.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/intc/Kconfig                     |  5 ++
>   hw/intc/loongarch_pch_msi.c         | 73 +++++++++++++++++++++++++++++
>   hw/intc/meson.build                 |  1 +
>   hw/loongarch/Kconfig                |  1 +
>   include/hw/intc/loongarch_pch_msi.h | 16 +++++++
>   5 files changed, 96 insertions(+)
>   create mode 100644 hw/intc/loongarch_pch_msi.c
>   create mode 100644 include/hw/intc/loongarch_pch_msi.h
> 
> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> index 3b7eca7b03..c0dc12dfa0 100644
> --- a/hw/intc/Kconfig
> +++ b/hw/intc/Kconfig
> @@ -77,3 +77,8 @@ config M68K_IRQC
>   config LOONGARCH_PCH_PIC
>       bool
>       select UNIMP
> +
> +config LOONGARCH_PCH_MSI
> +    select MSI_NONBROKEN
> +    bool
> +    select UNIMP
> diff --git a/hw/intc/loongarch_pch_msi.c b/hw/intc/loongarch_pch_msi.c
> new file mode 100644
> index 0000000000..1d8a3c1b21
> --- /dev/null
> +++ b/hw/intc/loongarch_pch_msi.c
> @@ -0,0 +1,73 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * QEMU Loongson 7A1000 msi interrupt controller.
> + *
> + * Copyright (C) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/sysbus.h"
> +#include "hw/irq.h"
> +#include "hw/intc/loongarch_pch_msi.h"
> +#include "hw/pci/msi.h"
> +#include "hw/misc/unimp.h"
> +#include "migration/vmstate.h"
> +
> +#define DEBUG_LOONGARCH_PCH_MSI 0
> +
> +#define DPRINTF(fmt, ...) \
> +do { \
> +    if (DEBUG_LOONGARCH_PCH_MSI) { \
> +        fprintf(stderr, "LOONGARCH_PCH_MSI: " fmt , ## __VA_ARGS__); \
> +    } \
> +} while (0)

Again DPRINTF() shouldn't be used any more, please use trace-events.

> +static uint64_t loongarch_msi_mem_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    return 0;
> +}
> +
> +static void loongarch_msi_mem_write(void *opaque, hwaddr addr,
> +                                    uint64_t val, unsigned size)
> +{
> +    loongarch_pch_msi *s = opaque;

I think a QOM cast would be useful here.

> +    int irq_num = val & 0xff;
> +
> +    qemu_set_irq(s->pch_msi_irq[irq_num - 32], 1);
> +}
> +
> +static const MemoryRegionOps loongarch_pch_msi_ops = {
> +    .read  = loongarch_msi_mem_read,
> +    .write = loongarch_msi_mem_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,

Same comment about endianness.

> +};
> +
> +static void loongarch_pch_msi_init(Object *obj)
> +{
> +    loongarch_pch_msi *s = LOONGARCH_PCH_MSI(obj);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +    int tmp;

Can we use i as a loop counter?

> +    memory_region_init_io(&s->msi_mmio, obj, &loongarch_pch_msi_ops,
> +                          s, TYPE_LOONGARCH_PCH_MSI, 0x8);
> +    sysbus_init_mmio(sbd, &s->msi_mmio);
> +    msi_nonbroken = true;
> +
> +    for (tmp = 0; tmp < 224; tmp++) {
> +        sysbus_init_irq(sbd, &s->pch_msi_irq[tmp]);
> +    }
> +}

224 seems like a magic number: how about using a #define for this value and using it 
where needed?

> +static const TypeInfo loongarch_pch_msi_info = {
> +    .name          = TYPE_LOONGARCH_PCH_MSI,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(loongarch_pch_msi),
> +    .instance_init = loongarch_pch_msi_init,
> +};
> +
> +static void loongarch_pch_msi_register_types(void)
> +{
> +    type_register_static(&loongarch_pch_msi_info);
> +}
> +
> +type_init(loongarch_pch_msi_register_types)
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index 07b0627468..e04abe2d56 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -58,3 +58,4 @@ specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
>   specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
>   specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
>   specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_PIC', if_true: files('loongarch_pch_pic.c'))
> +specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_MSI', if_true: files('loongarch_pch_msi.c'))
> diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
> index c6d7ebcd5b..4500fd3a57 100644
> --- a/hw/loongarch/Kconfig
> +++ b/hw/loongarch/Kconfig
> @@ -2,3 +2,4 @@ config LOONGSON_3A5000
>       bool
>       select PCI_EXPRESS_7A
>       select LOONGARCH_PCH_PIC
> +    select LOONGARCH_PCH_MSI
> diff --git a/include/hw/intc/loongarch_pch_msi.h b/include/hw/intc/loongarch_pch_msi.h
> new file mode 100644
> index 0000000000..40f0575bb5
> --- /dev/null
> +++ b/include/hw/intc/loongarch_pch_msi.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * LoongArch 7A1000 I/O interrupt controller definitions
> + *
> + * Copyright (C) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#define TYPE_LOONGARCH_PCH_MSI "loongarch_pch_msi"
> +DECLARE_INSTANCE_CHECKER(struct loongarch_pch_msi, LOONGARCH_PCH_MSI,
> +                         TYPE_LOONGARCH_PCH_MSI)
> +
> +typedef struct loongarch_pch_msi {
> +    SysBusDevice parent_obj;
> +    qemu_irq pch_msi_irq[224];
> +    MemoryRegion msi_mmio;
> +} loongarch_pch_msi;
> 


ATB,

Mark.

