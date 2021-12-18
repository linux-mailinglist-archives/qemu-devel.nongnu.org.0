Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFFB4797DE
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 01:43:13 +0100 (CET)
Received: from localhost ([::1]:39622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myNod-0003Ud-2G
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 19:43:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1myNik-0000ph-H7
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 19:37:06 -0500
Received: from [2001:41c9:1:41f::167] (port=49046
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1myNii-0004hW-JD
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 19:37:06 -0500
Received: from [2a00:23c4:8b9f:c400:72e2:646b:9043:c91d]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1myNiD-0007ZE-KA; Sat, 18 Dec 2021 00:36:37 +0000
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
 <1638619645-11283-20-git-send-email-yangxiaojuan@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <ff414511-02ce-f884-917e-f5ab138543c7@ilande.co.uk>
Date: Sat, 18 Dec 2021 00:36:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1638619645-11283-20-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9f:c400:72e2:646b:9043:c91d
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v3 19/27] hw/intc: Add LoongArch ls7a msi interrupt
 controller support(PCH-MSI)
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.716,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, peterx@redhat.com,
 f4bug@amsat.org, alex.bennee@linaro.org, alistair.francis@wdc.com,
 maobibo@loongson.cn, gaosong@loongson.cn, pbonzini@redhat.com,
 i.qemu@xen0n.name, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/12/2021 12:07, Xiaojuan Yang wrote:

> This patch realize PCH-MSI interrupt controller.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/intc/Kconfig                     |  5 +++
>   hw/intc/loongarch_pch_msi.c         | 67 +++++++++++++++++++++++++++++
>   hw/intc/meson.build                 |  1 +
>   hw/intc/trace-events                |  3 ++
>   hw/loongarch/Kconfig                |  1 +
>   include/hw/intc/loongarch_pch_msi.h | 21 +++++++++
>   6 files changed, 98 insertions(+)
>   create mode 100644 hw/intc/loongarch_pch_msi.c
>   create mode 100644 include/hw/intc/loongarch_pch_msi.h
> 
> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> index 96da13ad1d..dc5f41f5f5 100644
> --- a/hw/intc/Kconfig
> +++ b/hw/intc/Kconfig
> @@ -80,3 +80,8 @@ config LOONGARCH_IPI
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
> index 0000000000..c7777f763b
> --- /dev/null
> +++ b/hw/intc/loongarch_pch_msi.c
> @@ -0,0 +1,67 @@
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
> +    loongarch_pch_msi *s = LOONGARCH_PCH_MSI(opaque);
> +    int irq_num = val & 0xff;
> +
> +    trace_loongarch_msi_set_irq(irq_num);
> +    qemu_set_irq(s->pch_msi_irq[irq_num - PCH_PIC_IRQ_NUM], 1);
> +}
> +
> +static const MemoryRegionOps loongarch_pch_msi_ops = {
> +    .read  = loongarch_msi_mem_read,
> +    .write = loongarch_msi_mem_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
> +static void loongarch_pch_msi_init(Object *obj)
> +{
> +    loongarch_pch_msi *s = LOONGARCH_PCH_MSI(obj);
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
> +}
> +
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
> index 33ba63266e..acefe0c5aa 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -59,3 +59,4 @@ specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
>   specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
>   specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true: files('loongarch_ipi.c'))
>   specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_PIC', if_true: files('loongarch_pch_pic.c'))
> +specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_MSI', if_true: files('loongarch_pch_msi.c'))
> diff --git a/hw/intc/trace-events b/hw/intc/trace-events
> index 52fedf82be..20da343cfe 100644
> --- a/hw/intc/trace-events
> +++ b/hw/intc/trace-events
> @@ -255,3 +255,6 @@ loongarch_ipi_write(unsigned size, uint32_t addr, unsigned long val) "size: %u a
>   pch_pic_irq_handler(uint32_t edge, int irq, int level) "edge 0x%02x irq %d level %d"
>   loongarch_pch_pic_read(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
>   loongarch_pch_pic_write(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
> +
> +# loongarch_pch_msi.c
> +loongarch_msi_set_irq(int irq_num) "set msi irq %d"
> diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
> index c2b8046b94..cd38d03a19 100644
> --- a/hw/loongarch/Kconfig
> +++ b/hw/loongarch/Kconfig
> @@ -3,3 +3,4 @@ config LOONGSON3_LS7A
>       select PCI_EXPRESS_7A
>       select LOONGARCH_IPI
>       select LOONGARCH_PCH_PIC
> +    select LOONGARCH_PCH_MSI
> diff --git a/include/hw/intc/loongarch_pch_msi.h b/include/hw/intc/loongarch_pch_msi.h
> new file mode 100644
> index 0000000000..35297d51d8
> --- /dev/null
> +++ b/include/hw/intc/loongarch_pch_msi.h
> @@ -0,0 +1,21 @@
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
> +/* Msi irq start start from 64 to 255 */
> +#define PCH_MSI_IRQ_START   64
> +#define PCH_MSI_IRQ_END     255
> +#define PCH_MSI_IRQ_NUM     192
> +
> +typedef struct loongarch_pch_msi {
> +    SysBusDevice parent_obj;
> +    qemu_irq pch_msi_irq[PCH_MSI_IRQ_NUM];
> +    MemoryRegion msi_mmio;
> +} loongarch_pch_msi;

LoongArchPCHMSI in camel-case?


ATB,

Mark.

