Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97808512E16
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 10:18:59 +0200 (CEST)
Received: from localhost ([::1]:49550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njzMY-0004Sc-Ff
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 04:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1njzKA-0002yC-FT
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 04:16:30 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1njzK8-0001Mm-Hq
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 04:16:30 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1njzJB-0002hm-Ta; Thu, 28 Apr 2022 09:15:33 +0100
Message-ID: <491632d9-f60e-7a0d-daf6-4df4b6784b69@ilande.co.uk>
Date: Thu, 28 Apr 2022 09:16:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
 <20220425091027.2877892-34-yangxiaojuan@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220425091027.2877892-34-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 33/43] hw/intc: Add LoongArch ls7a msi interrupt
 controller support(PCH-MSI)
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/04/2022 10:10, Xiaojuan Yang wrote:

> This patch realize PCH-MSI interrupt controller.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/intc/Kconfig                     |  5 ++
>   hw/intc/loongarch_pch_msi.c         | 75 +++++++++++++++++++++++++++++
>   hw/intc/meson.build                 |  1 +
>   hw/intc/trace-events                |  3 ++
>   hw/loongarch/Kconfig                |  1 +
>   include/hw/intc/loongarch_pch_msi.h | 20 ++++++++
>   6 files changed, 105 insertions(+)
>   create mode 100644 hw/intc/loongarch_pch_msi.c
>   create mode 100644 include/hw/intc/loongarch_pch_msi.h
> 
> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> index 1fbba2e728..71c04c328e 100644
> --- a/hw/intc/Kconfig
> +++ b/hw/intc/Kconfig
> @@ -91,3 +91,8 @@ config LOONGARCH_IPI
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
> index 0000000000..57a894f3e5
> --- /dev/null
> +++ b/hw/intc/loongarch_pch_msi.c
> @@ -0,0 +1,75 @@
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
> +#include "hw/intc/loongarch_pch_pic.h"
> +#include "hw/pci/msi.h"
> +#include "hw/misc/unimp.h"
> +#include "migration/vmstate.h"
> +#include "trace.h"
> +
> +static uint64_t loongarch_msi_mem_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    return 0;
> +}
> +
> +static void loongarch_msi_mem_write(void *opaque, hwaddr addr,
> +                                    uint64_t val, unsigned size)
> +{
> +    LoongArchPCHMSI *s = LOONGARCH_PCH_MSI(opaque);
> +    int irq_num = val & 0xff;
> +
> +    trace_loongarch_msi_set_irq(irq_num);
> +    qemu_set_irq(s->pch_msi_irq[irq_num - PCH_PIC_IRQ_NUM], 1);
> +}

This really looks wrong to me: the PCI-MSI device has PCH_PIC_IRQ_NUM IRQs which are 
wired up to EIOINTC with an offset of PCH_MSI_IRQ_START already. What you're saying 
here is that you're manually setting the PCI-MSI IRQs using their EIOINTC IRQ number 
instead of their input IRQ number?

I think what you would want here is just:

    assert(irq_num < PCH_MSI_IRQ_NUM);
    trace_loongarch_msi_set_irq(irq_num);
    qemu_set_irq(s->pch_msi_irq[irq_num], 1);

Otherwise the PCH-MSI device has awareness of IRQ hierarchy outside of itself. 
Presumably this is some kind of testing interface?

> +static const MemoryRegionOps loongarch_pch_msi_ops = {
> +    .read  = loongarch_msi_mem_read,
> +    .write = loongarch_msi_mem_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
> +static void pch_msi_irq_handler(void *opaque, int irq, int level)
> +{
> +    LoongArchPCHMSI *s = LOONGARCH_PCH_MSI(opaque);
> +
> +    qemu_set_irq(s->pch_msi_irq[irq], level);
> +}
> +
> +static void loongarch_pch_msi_init(Object *obj)
> +{
> +    LoongArchPCHMSI *s = LOONGARCH_PCH_MSI(obj);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +    int i;
> +
> +    memory_region_init_io(&s->msi_mmio, obj, &loongarch_pch_msi_ops,
> +                          s, TYPE_LOONGARCH_PCH_MSI, 0x8);
> +    sysbus_init_mmio(sbd, &s->msi_mmio);
> +    msi_nonbroken = true;
> +
> +    for (i = 0; i < PCH_MSI_IRQ_NUM; i++) {
> +        sysbus_init_irq(sbd, &s->pch_msi_irq[i]);
> +    }
> +    qdev_init_gpio_in(DEVICE(obj), pch_msi_irq_handler, PCH_MSI_IRQ_NUM);
> +}

Again I'd simply use GPIOs instead of sysbus_init_irq() here, similar to the example 
given in my reply to the PCH-PIC patch.

> +static const TypeInfo loongarch_pch_msi_info = {
> +    .name          = TYPE_LOONGARCH_PCH_MSI,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(LoongArchPCHMSI),
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
> index 960ce81a92..77a30cec33 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -64,3 +64,4 @@ specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
>   specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
>   specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true: files('loongarch_ipi.c'))
>   specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_PIC', if_true: files('loongarch_pch_pic.c'))
> +specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_MSI', if_true: files('loongarch_pch_msi.c'))
> diff --git a/hw/intc/trace-events b/hw/intc/trace-events
> index 1f343676ee..8bcc1b6992 100644
> --- a/hw/intc/trace-events
> +++ b/hw/intc/trace-events
> @@ -300,3 +300,6 @@ loongarch_pch_pic_high_readw(unsigned size, uint32_t addr, unsigned long val) "s
>   loongarch_pch_pic_high_writew(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
>   loongarch_pch_pic_readb(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
>   loongarch_pch_pic_writeb(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
> +
> +# loongarch_pch_msi.c
> +loongarch_msi_set_irq(int irq_num) "set msi irq %d"
> diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
> index 2df45f7e8f..d814fc6103 100644
> --- a/hw/loongarch/Kconfig
> +++ b/hw/loongarch/Kconfig
> @@ -4,3 +4,4 @@ config LOONGARCH_VIRT
>       select PCI_EXPRESS_GENERIC_BRIDGE
>       select LOONGARCH_IPI
>       select LOONGARCH_PCH_PIC
> +    select LOONGARCH_PCH_MSI
> diff --git a/include/hw/intc/loongarch_pch_msi.h b/include/hw/intc/loongarch_pch_msi.h
> new file mode 100644
> index 0000000000..f668bfca7a
> --- /dev/null
> +++ b/include/hw/intc/loongarch_pch_msi.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * LoongArch 7A1000 I/O interrupt controller definitions
> + *
> + * Copyright (C) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#define TYPE_LOONGARCH_PCH_MSI "loongarch_pch_msi"
> +OBJECT_DECLARE_SIMPLE_TYPE(LoongArchPCHMSI, LOONGARCH_PCH_MSI)
> +
> +/* Msi irq start start from 64 to 255 */
> +#define PCH_MSI_IRQ_START   64
> +#define PCH_MSI_IRQ_END     255
> +#define PCH_MSI_IRQ_NUM     192
> +
> +struct LoongArchPCHMSI {
> +    SysBusDevice parent_obj;
> +    qemu_irq pch_msi_irq[PCH_MSI_IRQ_NUM];
> +    MemoryRegion msi_mmio;
> +};


ATB,

Mark.

