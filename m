Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F1F5114A3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 12:07:08 +0200 (CEST)
Received: from localhost ([::1]:41854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njeZf-0005uy-8Z
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 06:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1njeW2-0002xf-Pa
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 06:03:22 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38482 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1njeVt-0003Pa-4J
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 06:03:22 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxkNrSFGli1wQAAA--.172S3;
 Wed, 27 Apr 2022 18:02:59 +0800 (CST)
Subject: Re: [PATCH v2 34/43] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
 <20220425091027.2877892-35-yangxiaojuan@loongson.cn>
 <6ca20e3d-9e1a-03e0-482d-2b989eb6dd73@ilande.co.uk>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <60b64e8d-08bf-0ee8-086f-871a18bd9b56@loongson.cn>
Date: Wed, 27 Apr 2022 18:02:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6ca20e3d-9e1a-03e0-482d-2b989eb6dd73@ilande.co.uk>
Content-Type: multipart/alternative;
 boundary="------------0E51757257234DDCB3ECA80B"
Content-Language: en-US
X-CM-TRANSID: AQAAf9BxkNrSFGli1wQAAA--.172S3
X-Coremail-Antispam: 1UD129KBjvAXoWfWrWkCFyfuFW8CF47GFW3Jrb_yoW5AF13to
 WUGr10qr15Jr10kr4UJr1DJry3Jr1UAryDJr17Gry7Jr1UAr1UX3yDt34Ut3yUJr4kGr1U
 Jr9rWryUJFyjyr18n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUY47AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
 x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWx
 JVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2
 z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67
 IIx4CEVc8vx2IErcIFxwCjr7xvwVCIw2I0I7xG6c02F41lc7I2V7IY0VAS07AlzVAYIcxG
 8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
 Aqx4xG67AKxVWUGVWUWwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r12
 6r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
 kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE
 14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa
 7VUb_gA7UUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

This is a multi-part message in MIME format.
--------------0E51757257234DDCB3ECA80B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Mark,

On 2022/4/26 上午12:27, Mark Cave-Ayland wrote:
> On 25/04/2022 10:10, Xiaojuan Yang wrote:
>
>> This patch realize the EIOINTC interrupt controller.
>>
>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>   hw/intc/Kconfig                    |   3 +
>>   hw/intc/loongarch_extioi.c         | 483 +++++++++++++++++++++++++++++
>>   hw/intc/meson.build                |   1 +
>>   hw/intc/trace-events               |   9 +
>>   hw/loongarch/Kconfig               |   1 +
>>   include/hw/intc/loongarch_extioi.h |  60 ++++
>>   6 files changed, 557 insertions(+)
>>   create mode 100644 hw/intc/loongarch_extioi.c
>>   create mode 100644 include/hw/intc/loongarch_extioi.h
>>
>> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
>> index 71c04c328e..28bd1f185d 100644
>> --- a/hw/intc/Kconfig
>> +++ b/hw/intc/Kconfig
>> @@ -96,3 +96,6 @@ config LOONGARCH_PCH_MSI
>>       select MSI_NONBROKEN
>>       bool
>>       select UNIMP
>> +
>> +config LOONGARCH_EXTIOI
>> +    bool
>> diff --git a/hw/intc/loongarch_extioi.c b/hw/intc/loongarch_extioi.c
>> new file mode 100644
>> index 0000000000..1d9317c5bd
>> --- /dev/null
>> +++ b/hw/intc/loongarch_extioi.c
>> @@ -0,0 +1,483 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Loongson 3A5000 ext interrupt controller emulation
>> + *
>> + * Copyright (C) 2021 Loongson Technology Corporation Limited
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qemu/module.h"
>> +#include "qemu/log.h"
>> +#include "hw/irq.h"
>> +#include "hw/sysbus.h"
>> +#include "hw/loongarch/virt.h"
>> +#include "hw/qdev-properties.h"
>> +#include "exec/address-spaces.h"
>> +#include "hw/intc/loongarch_extioi.h"
>> +#include "migration/vmstate.h"
>> +#include "trace.h"
>> +
>> +static void extioi_update_irq(LoongArchExtIOI *s, int irq_num, int 
>> level)
>> +{
>> +    uint64_t ipnum, cpu;
>> +
>> +    /*
>> +     * Routing in group of 32 interrupts.
>> +     * The default value of csr[0x420][49]
>> +     * is 0 and nobody will change it,
>> +     * so 'ipmap' use bitmap function.
>> +     */
>> +    ipnum = ldub_p((void *)&s->ipmap + (irq_num / 32)) & 0xf;
>> +    ipnum = find_first_bit(&ipnum, 4);
>> +    ipnum = (ipnum == 4) ? 0 : ipnum;
>> +
>> +    cpu = ldub_p((void *)s->coremap + irq_num) & 0xf;
>> +    cpu = find_first_bit(&cpu, 4);
>> +    cpu = (cpu == 4) ? 0 : cpu;
>> +
>> +    if (level) {
>> +        if (test_bit(irq_num, (unsigned long *)s->enable) == false) {
>> +            return;
>> +        }
>> +        bitmap_set((unsigned long *)s->coreisr[cpu], irq_num, 1);
>> +        qemu_set_irq(s->parent_irq[cpu][ipnum], level);
>> +    } else {
>> +        bitmap_clear((unsigned long *)s->coreisr[cpu], irq_num, 1);
>> +        qemu_set_irq(s->parent_irq[cpu][ipnum], level);
>> +    }
>> +}
>> +
>> +static void extioi_setirq(void *opaque, int irq, int level)
>> +{
>> +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
>> +    trace_loongarch_extioi_setirq(irq, level);
>> +    extioi_update_irq(s, irq, level);
>> +}
>> +
>> +static uint32_t extioi_readb(void *opaque, hwaddr addr)
>> +{
>> +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
>> +    unsigned long offset, reg_count;
>> +    uint8_t ret = 0;
>> +    int cpu;
>> +
>> +    offset = addr & 0xffff;
>> +    switch (offset) {
>> +    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
>> +        ret = ldub_p((void *)s->enable + (offset - 
>> EXTIOI_ENABLE_START));
>> +        break;
>> +    case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
>> +        ret = ldub_p((void *)s->bounce + (offset - 
>> EXTIOI_BOUNCE_START));
>> +        break;
>> +    case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
>> +        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f);
>> +        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
>> +        ret = ldub_p((void *)s->coreisr[cpu] + reg_count);
>> +        break;
>> +    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
>> +        ret = ldub_p((void *)&s->ipmap + (offset - 
>> EXTIOI_IPMAP_START));
>> +        break;
>> +    case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
>> +        ret = ldub_p((void *)s->coremap + (offset - 
>> EXTIOI_COREMAP_START));
>> +        break;
>> +    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
>> +        ret = ldub_p((void *)s->nodetype + (offset - 
>> EXTIOI_NODETYPE_START));
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +    trace_loongarch_extioi_readb((uint32_t)addr, ret);
>> +    return ret;
>> +}
>> +
>> +static uint32_t extioi_readw(void *opaque, hwaddr addr)
>> +{
>> +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
>> +    unsigned long offset, reg_count;
>> +    uint32_t ret = 0;
>> +    int cpu;
>> +
>> +    offset = addr & 0xffff;
>> +    switch (offset) {
>> +    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
>> +        ret = ldl_p((void *)s->enable + (offset - 
>> EXTIOI_ENABLE_START));
>> +        break;
>> +    case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
>> +        ret = ldl_p((void *)s->bounce + (offset - 
>> EXTIOI_BOUNCE_START));
>> +        break;
>> +    case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
>> +        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f);
>> +        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
>> +        ret = ldl_p((void *)s->coreisr[cpu] + reg_count);
>> +        break;
>> +    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
>> +        ret = ldl_p((void *)&s->ipmap + (offset - EXTIOI_IPMAP_START));
>> +        break;
>> +    case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
>> +        ret = ldl_p((void *)s->coremap + (offset - 
>> EXTIOI_COREMAP_START));
>> +        break;
>> +    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
>> +        ret = ldl_p((void *)s->nodetype + (offset - 
>> EXTIOI_NODETYPE_START));
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +    trace_loongarch_extioi_readw((uint32_t)addr, ret);
>> +    return ret;
>> +}
>> +
>> +static uint64_t extioi_readl(void *opaque, hwaddr addr)
>> +{
>> +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
>> +    unsigned long offset, reg_count;
>> +    uint64_t ret = 0;
>> +    int cpu;
>> +
>> +    offset = addr & 0xffff;
>> +
>> +    switch (offset) {
>> +    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
>> +        ret = ldq_p((void *)s->enable + (offset - 
>> EXTIOI_ENABLE_START));
>> +        break;
>> +    case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
>> +        ret = ldq_p((void *)s->bounce + (offset - 
>> EXTIOI_BOUNCE_START));
>> +        break;
>> +    case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
>> +        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f);
>> +        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
>> +        ret = ldq_p((void *)s->coreisr[cpu] + reg_count);
>> +        break;
>> +    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
>> +        ret = ldq_p((void *)&s->ipmap + (offset - EXTIOI_IPMAP_START));
>> +        break;
>> +    case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
>> +        ret = ldq_p((void *)s->coremap + (offset - 
>> EXTIOI_COREMAP_START));
>> +        break;
>> +    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
>> +        ret = ldq_p((void *)s->nodetype + (offset - 
>> EXTIOI_NODETYPE_START));
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +    trace_loongarch_extioi_readl((uint32_t)addr, ret);
>> +    return ret;
>> +}
>> +
>> +static void extioi_writeb(void *opaque, hwaddr addr, uint32_t value,
>> +                          unsigned size)
>> +{
>> +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
>> +    unsigned long offset, reg_count;
>> +    int cpu, i, j, level, bits;
>> +    uint64_t old_data, val = value & 0xff;
>> +
>> +    offset = addr & 0xffff;
>> +
>> +    trace_loongarch_extioi_writeb(size, (uint32_t)addr, (uint8_t)val);
>> +    switch (offset) {
>> +    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
>> +        reg_count = (offset - EXTIOI_ENABLE_START);
>> +        old_data = ldub_p((void *)s->enable + reg_count);
>> +        if (old_data != val) {
>> +            stb_p((void *)s->enable + reg_count, (uint8_t)val);
>> +            old_data = old_data ^ val;
>> +            bits = size * 8;
>> +            while ((i = find_first_bit(&old_data, bits)) != bits) {
>> +                level = test_bit(i, &val);
>> +                extioi_update_irq(s, i + reg_count * 8, level);
>> +                clear_bit(i, &old_data);
>> +            }
>> +        }
>> +        break;
>> +    case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
>> +        stb_p((void *)s->bounce + (offset - EXTIOI_BOUNCE_START), 
>> (uint8_t)val);
>> +        break;
>> +    case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
>> +        reg_count = (offset - EXTIOI_COREISR_START) & 0x1f;
>> +        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
>> +
>> +        old_data = ldub_p((void *)s->coreisr[cpu] + reg_count);
>> +        stb_p((void *)s->coreisr[cpu] + reg_count, 
>> (uint8_t)(old_data & ~val));
>> +
>> +        if (old_data != (old_data & ~val)) {
>> +            bits = size * 8;
>> +
>> +            while ((i = find_first_bit(&val, bits)) != bits) {
>> +                j = test_bit(i, &old_data);
>> +                if (j) {
>> +                    extioi_update_irq(s, i + reg_count * 8, 0);
>> +                }
>> +                clear_bit(i, &val);
>> +            }
>> +        }
>> +        break;
>> +    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
>> +        /* Drop arch.core_ip_mask use s->ipmap */
>> +        reg_count = (offset - EXTIOI_IPMAP_START);
>> +        stb_p((void *)&s->ipmap + reg_count, (uint8_t)val);
>> +        break;
>> +    case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
>> +        reg_count = (offset - EXTIOI_COREMAP_START);
>> +
>> +        /* Only map the core */
>> +        while (val) {
>> +            stb_p((void *)s->coremap + reg_count, (uint8_t)val);
>> +            val = val >> 8;
>> +        }
>> +        break;
>> +    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
>> +        stb_p((void *)s->nodetype + (offset - EXTIOI_NODETYPE_START),
>> +                                     (uint8_t)val);
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +}
>> +
>> +static void extioi_writew(void *opaque, hwaddr addr, uint32_t val,
>> +                          unsigned size)
>> +{
>> +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
>> +    int cpu, level;
>> +    uint32_t offset, reg_count, i, j, bits;
>> +    uint64_t old_data, value = val;
>> +    offset = addr & 0xffff;
>> +    trace_loongarch_extioi_writew(size, (uint32_t)addr, val);
>> +
>> +    switch (offset) {
>> +    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
>> +        reg_count = (offset - EXTIOI_ENABLE_START);
>> +        old_data = ldl_p((void *)s->enable + reg_count);
>> +        if (old_data != val) {
>> +            stl_p((void *)s->enable + reg_count, val);
>> +            old_data = old_data ^ val;
>> +
>> +            bits = size * 8;
>> +            while ((i = find_first_bit(&old_data, bits)) != bits) {
>> +                level = test_bit(i, &value);
>> +                extioi_update_irq(s, i + reg_count * 8, level);
>> +                clear_bit(i, &old_data);
>> +            }
>> +        }
>> +        break;
>> +    case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
>> +        stl_p((void *)s->bounce + (offset - EXTIOI_BOUNCE_START), val);
>> +        break;
>> +    case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
>> +        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f);
>> +        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
>> +        /* Ext_core_ioisr */
>> +        old_data = ldl_p((void *)s->coreisr[cpu] + reg_count);
>> +        stl_p((void *)s->coreisr[cpu] + reg_count, (old_data & ~val));
>> +
>> +        if (old_data != (old_data & ~val)) {
>> +            bits = size * 8;
>> +            while ((i = find_first_bit(&value, bits)) != bits) {
>> +                j = test_bit(i, &old_data);
>> +                if (j) {
>> +                    extioi_update_irq(s, i + reg_count * 8, 0);
>> +                }
>> +                clear_bit(i, &value);
>> +            }
>> +        }
>> +        break;
>> +    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
>> +        /* Drop arch.core_ip_mask use s->ipmap */
>> +        reg_count = (offset - EXTIOI_IPMAP_START);
>> +        stl_p((void *)&s->ipmap + reg_count, val);
>> +        break;
>> +    case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
>> +        reg_count = (offset - EXTIOI_COREMAP_START);
>> +        /* Only map the core */
>> +        while (val) {
>> +            stl_p((void *)s->coremap + reg_count, val);
>> +            val = val >> 8;
>> +        }
>> +        break;
>> +    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
>> +        stl_p((void *)s->nodetype + (offset - 
>> EXTIOI_NODETYPE_START), val);
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +}
>> +
>> +static void extioi_writel(void *opaque, hwaddr addr, uint64_t val,
>> +                          unsigned size)
>> +{
>> +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
>> +    int cpu, level, i, j, bits;
>> +    uint64_t offset, old_data, reg_count;
>> +
>> +    offset = addr & 0xffff;
>> +    trace_loongarch_extioi_writel(size, (uint32_t)addr, val);
>> +    switch (offset) {
>> +    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
>> +        reg_count = (offset - EXTIOI_ENABLE_START);
>> +        old_data = s->enable[reg_count];
>> +        if (old_data != val) {
>> +            s->enable[reg_count] = val;
>> +            old_data = old_data ^ val;
>> +
>> +            bits = size * 8;
>> +            while ((i = find_first_bit(&old_data, bits)) != bits) {
>> +                level = test_bit(i, &val);
>> +                extioi_update_irq(s, i + reg_count * 8, level);
>> +                clear_bit(i, &old_data);
>> +            }
>> +        }
>> +        break;
>> +    case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
>> +        stq_p((void *)s->bounce + (offset - EXTIOI_BOUNCE_START), val);
>> +        break;
>> +    case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
>> +        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f);
>> +        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
>> +
>> +        /* core_ext_ioisr */
>> +        old_data = ldq_p((void *)s->coreisr[cpu] + reg_count);
>> +        stq_p((void *)s->coreisr[cpu] + reg_count, (old_data & ~val));
>> +
>> +        if (old_data != (old_data & ~val)) {
>> +            bits = size * 8;
>> +            while ((i = find_first_bit(&val, bits)) != bits) {
>> +                j = test_bit(i, &old_data);
>> +                if (j) {
>> +                    extioi_update_irq(s, i + reg_count * 8, 0);
>> +                }
>> +                clear_bit(i, &val);
>> +            }
>> +        }
>> +        break;
>> +    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
>> +        /* Drop arch.core_ip_mask use s->ipmap */
>> +        reg_count = (offset - EXTIOI_IPMAP_START);
>> +        stq_p((void *)&s->ipmap + reg_count, val);
>> +        break;
>> +    case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
>> +        reg_count = (offset - EXTIOI_COREMAP_START);
>> +        /* Only map the core */
>> +        while (val) {
>> +            stq_p((void *)s->coremap + reg_count, val);
>> +            val = val >> 8;
>> +        }
>> +        break;
>> +    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
>> +        stq_p((void *)s->nodetype + (offset - 
>> EXTIOI_NODETYPE_START), val);
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +}
>> +
>> +static uint64_t extioi_readfn(void *opaque, hwaddr addr, unsigned size)
>> +{
>> +    switch (size) {
>> +    case 1:
>> +        return extioi_readb(opaque, addr);
>> +    case 4:
>> +        return extioi_readw(opaque, addr);
>> +    case 8:
>> +        return extioi_readl(opaque, addr);
>> +    default:
>> +        g_assert_not_reached();
>> +    }
>> +}
>> +
>> +static void extioi_writefn(void *opaque, hwaddr addr,
>> +                           uint64_t value, unsigned size)
>> +{
>> +    switch (size) {
>> +    case 1:
>> +        extioi_writeb(opaque, addr, value, size);
>> +        break;
>> +    case 4:
>> +        extioi_writew(opaque, addr, value, size);
>> +        break;
>> +    case 8:
>> +        extioi_writel(opaque, addr, value, size);
>> +        break;
>> +    default:
>> +        g_assert_not_reached();
>> +    }
>> +}
>> +
>> +static const MemoryRegionOps extioi_ops = {
>> +    .read = extioi_readfn,
>> +    .write = extioi_writefn,
>> +    .impl.min_access_size = 1,
>> +    .impl.max_access_size = 8,
>> +    .valid.min_access_size = 1,
>> +    .valid.max_access_size = 8,
>> +    .endianness = DEVICE_LITTLE_ENDIAN,
>> +};
>
> I think you may have misunderstood what Richard was saying about using 
> a single memory region - it seems to me you have gone back to using 
> the original approach with multiple access functions for different 
> sizes, which almost certainly isn't correct for modern hardware.
>
> Going back to the previous revision of this patch, the question to ask 
> is: do you really need byte-level access using extioi_ipmap_enable_ops 
> and extioi_coremap_ops? Given that all the other register accesses 
> appear to be 32-bit it seems odd that just these 2 sets of registers 
> require 8-bit accesses. The register access size should be clearly 
> stated in the EIOINTC documentaion.
>
> My suspicion would be that is possible to update 
> extioi_ipmap_enable_ops and extioi_coremap_ops from the previous 
> version of this patch to use the same access sizes as all the other 
> registers i.e.
>
>     .impl.min_access_size = 4,
>     .impl.max_access_size = 4,
>     .valid.min_access_size = 4,
>     .valid.max_access_size = 8,
>
> Once you have got this working then recalculating the address offsets 
> and collapsing everything into a single memory region as suggested by 
> Richard becomes trivial. I should also add that if for whatever reason 
> this isn't possible, the previous version of the patch is the correct 
> way to handle this, and this should be clearly documented as a reply 
> in this thread along with a suitable reference to relevant part of the 
> EIOINTC documentation.
>
Thank you for your explanation,
In the 11.2.1 chapter of the document, ipmap and coremap registers are 
accessed with 1 byte. We intend to change it to 8-byte access. In this 
way, the simulation becomes very simple and standardized.

Thanks.
Xiaojuan
>> +static void loongarch_extioi_realize(DeviceState *dev, Error **errp)
>> +{
>> +    LoongArchMachineState *lams = 
>> LOONGARCH_MACHINE(qdev_get_machine());
>> +    MachineState *ms = MACHINE(lams);
>> +    LoongArchExtIOI *p = LOONGARCH_EXTIOI(dev);
>> +    int i, cpu, pin;
>> +
>> +    qdev_init_gpio_in(dev, extioi_setirq, EXTIOI_IRQS);
>> +
>> +    for (i = 0; i < EXTIOI_IRQS; i++) {
>> +        sysbus_init_irq(SYS_BUS_DEVICE(dev), &p->irq[i]);
>> +    }
>> +    /* two ways to access extioi: iocsr memory and system memory */
>> +    memory_region_init_io(&p->extioi_iocsr_mem, OBJECT(p), 
>> &extioi_ops, p,
>> +                          "loongarch_extioi_iocsr", 0x900);
>> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &p->extioi_iocsr_mem);
>> +
>> +    memory_region_init_io(&p->extioi_system_mem, OBJECT(p), 
>> &extioi_ops, p,
>> +                          "loongarch_extioi", 0x900);
>> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &p->extioi_system_mem);
>> +
>> +    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
>> +        for (pin = 0; pin < LS3A_INTC_IP; pin++) {
>> +            qdev_init_gpio_out(dev, &p->parent_irq[cpu][pin], 1);
>> +        }
>> +    }
>> +}
>> +
>> +static const VMStateDescription vmstate_loongarch_extioi = {
>> +    .name = TYPE_LOONGARCH_EXTIOI,
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_UINT64_ARRAY(enable, LoongArchExtIOI,
>> +                             EXTIOI_IRQS_BITMAP_SIZE / 8),
>> +        VMSTATE_UINT64_ARRAY(bounce, LoongArchExtIOI,
>> +                             EXTIOI_IRQS_BITMAP_SIZE / 8),
>> +        VMSTATE_UINT64_2DARRAY(coreisr, LoongArchExtIOI,
>> +                               MAX_CORES, EXTIOI_IRQS_BITMAP_SIZE / 8),
>> +        VMSTATE_UINT64(ipmap, LoongArchExtIOI),
>> +        VMSTATE_UINT64_ARRAY(coremap, LoongArchExtIOI,
>> +                             EXTIOI_IRQS_COREMAP_SIZE / 8),
>> +        VMSTATE_UINT64_ARRAY(nodetype, LoongArchExtIOI,
>> +                             EXTIOI_IRQS_NODETYPE_SIZE / 4),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +static void loongarch_extioi_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +
>> +    dc->vmsd = &vmstate_loongarch_extioi;
>> +    dc->realize = loongarch_extioi_realize;
>> +}
>> +
>> +static const TypeInfo loongarch_extioi_info = {
>> +    .name          = TYPE_LOONGARCH_EXTIOI,
>> +    .parent        = TYPE_SYS_BUS_DEVICE,
>> +    .instance_size = sizeof(struct LoongArchExtIOI),
>> +    .class_init    = loongarch_extioi_class_init,
>> +};
>> +
>> +static void loongarch_extioi_register_types(void)
>> +{
>> +    type_register_static(&loongarch_extioi_info);
>> +}
>> +
>> +type_init(loongarch_extioi_register_types)
>> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
>> index 77a30cec33..405e18f4bb 100644
>> --- a/hw/intc/meson.build
>> +++ b/hw/intc/meson.build
>> @@ -65,3 +65,4 @@ specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: 
>> files('m68k_irqc.c'))
>>   specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true: 
>> files('loongarch_ipi.c'))
>>   specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_PIC', if_true: 
>> files('loongarch_pch_pic.c'))
>>   specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_MSI', if_true: 
>> files('loongarch_pch_msi.c'))
>> +specific_ss.add(when: 'CONFIG_LOONGARCH_EXTIOI', if_true: 
>> files('loongarch_extioi.c'))
>> diff --git a/hw/intc/trace-events b/hw/intc/trace-events
>> index 8bcc1b6992..285d64ab83 100644
>> --- a/hw/intc/trace-events
>> +++ b/hw/intc/trace-events
>> @@ -303,3 +303,12 @@ loongarch_pch_pic_writeb(unsigned size, uint32_t 
>> addr, unsigned long val) "size:
>>     # loongarch_pch_msi.c
>>   loongarch_msi_set_irq(int irq_num) "set msi irq %d"
>> +
>> +# loongarch_extioi.c
>> +loongarch_extioi_setirq(int irq, int level) "set extirq irq %d level 
>> %d"
>> +loongarch_extioi_readb(uint32_t addr, uint8_t val) "addr: 0x%"PRIx32 
>> "val: 0x%" PRIu8
>> +loongarch_extioi_readw(uint32_t addr, uint32_t val) "addr: 
>> 0x%"PRIx32 "val: 0x%" PRIx32
>> +loongarch_extioi_readl(uint32_t addr, uint64_t val) "addr: 
>> 0x%"PRIx32 "val: 0x%" PRIx64
>> +loongarch_extioi_writeb(unsigned size, uint32_t addr, uint8_t val) 
>> "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIu8
>> +loongarch_extioi_writew(unsigned size, uint32_t addr, uint32_t val) 
>> "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx32
>> +loongarch_extioi_writel(unsigned size, uint32_t addr, uint64_t val) 
>> "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
>> diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
>> index d814fc6103..f779087416 100644
>> --- a/hw/loongarch/Kconfig
>> +++ b/hw/loongarch/Kconfig
>> @@ -5,3 +5,4 @@ config LOONGARCH_VIRT
>>       select LOONGARCH_IPI
>>       select LOONGARCH_PCH_PIC
>>       select LOONGARCH_PCH_MSI
>> +    select LOONGARCH_EXTIOI
>> diff --git a/include/hw/intc/loongarch_extioi.h 
>> b/include/hw/intc/loongarch_extioi.h
>> new file mode 100644
>> index 0000000000..5482483a5f
>> --- /dev/null
>> +++ b/include/hw/intc/loongarch_extioi.h
>> @@ -0,0 +1,60 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * LoongArch 3A5000 ext interrupt controller definitions
>> + *
>> + * Copyright (C) 2021 Loongson Technology Corporation Limited
>> + */
>> +
>> +#include "hw/sysbus.h"
>> +#include "hw/loongarch/virt.h"
>> +
>> +#ifndef LOONGARCH_EXTIOI_H
>> +#define LOONGARCH_EXTIOI_H
>> +
>> +#define LS3A_INTC_IP               8
>> +#define MAX_CORES                  LOONGARCH_MAX_VCPUS
>> +#define EXTIOI_IRQS                (256)
>> +#define EXTIOI_IRQS_BITMAP_SIZE    (256 / 8)
>> +/* map to ipnum per 32 irqs */
>> +#define EXTIOI_IRQS_IPMAP_SIZE     (256 / 32)
>> +#define EXTIOI_IRQS_COREMAP_SIZE   256
>> +#define EXTIOI_IRQS_NODETYPE_SIZE  16
>> +
>> +#define APIC_OFFSET                  0x400
>> +#define APIC_BASE                    (0x1000ULL + APIC_OFFSET)
>> +
>> +#define EXTIOI_NODETYPE_START        (0x4a0 - APIC_OFFSET)
>> +#define EXTIOI_NODETYPE_END          (0x4c0 - APIC_OFFSET)
>> +#define EXTIOI_IPMAP_START           (0x4c0 - APIC_OFFSET)
>> +#define EXTIOI_IPMAP_END             (0x4c8 - APIC_OFFSET)
>> +#define EXTIOI_ENABLE_START          (0x600 - APIC_OFFSET)
>> +#define EXTIOI_ENABLE_END            (0x620 - APIC_OFFSET)
>> +#define EXTIOI_BOUNCE_START          (0x680 - APIC_OFFSET)
>> +#define EXTIOI_BOUNCE_END            (0x6a0 - APIC_OFFSET)
>> +#define EXTIOI_ISR_START             (0x700 - APIC_OFFSET)
>> +#define EXTIOI_ISR_END               (0x720 - APIC_OFFSET)
>> +#define EXTIOI_COREISR_START         (0x800 - APIC_OFFSET)
>> +#define EXTIOI_COREISR_END           (0xB20 - APIC_OFFSET)
>> +#define EXTIOI_COREMAP_START         (0xC00 - APIC_OFFSET)
>> +#define EXTIOI_COREMAP_END           (0xD00 - APIC_OFFSET)
>> +
>> +#define EXTIOI_SYSTEM_MEM            0x1fe01400
>> +#define TYPE_LOONGARCH_EXTIOI "loongarch.extioi"
>> +OBJECT_DECLARE_SIMPLE_TYPE(LoongArchExtIOI, LOONGARCH_EXTIOI)
>> +struct LoongArchExtIOI {
>> +    SysBusDevice parent_obj;
>> +    /* hardware state */
>> +    uint64_t enable[EXTIOI_IRQS_BITMAP_SIZE / 8];
>> +    uint64_t bounce[EXTIOI_IRQS_BITMAP_SIZE / 8];
>> +    uint64_t coreisr[MAX_CORES][EXTIOI_IRQS_BITMAP_SIZE / 8];
>> +    uint64_t ipmap;
>> +    uint64_t coremap[EXTIOI_IRQS_COREMAP_SIZE / 8];
>> +    uint64_t nodetype[EXTIOI_IRQS_NODETYPE_SIZE / 4];
>> +
>> +    qemu_irq parent_irq[MAX_CORES][LS3A_INTC_IP];
>> +    qemu_irq irq[EXTIOI_IRQS];
>> +    MemoryRegion extioi_iocsr_mem;
>> +    MemoryRegion extioi_system_mem;
>> +};
>> +
>> +#endif /* LOONGARCH_EXTIOI_H */
>
>
> ATB,
>
> Mark.

--------------0E51757257234DDCB3ECA80B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Mark,<br>
    </p>
    <div class="moz-cite-prefix">On 2022/4/26 上午12:27, Mark Cave-Ayland
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6ca20e3d-9e1a-03e0-482d-2b989eb6dd73@ilande.co.uk">On
      25/04/2022 10:10, Xiaojuan Yang wrote:
      <br>
      <br>
      <blockquote type="cite">This patch realize the EIOINTC interrupt
        controller.
        <br>
        <br>
        Signed-off-by: Xiaojuan Yang <a class="moz-txt-link-rfc2396E" href="mailto:yangxiaojuan@loongson.cn">&lt;yangxiaojuan@loongson.cn&gt;</a>
        <br>
        Signed-off-by: Song Gao <a class="moz-txt-link-rfc2396E" href="mailto:gaosong@loongson.cn">&lt;gaosong@loongson.cn&gt;</a>
        <br>
        ---
        <br>
          hw/intc/Kconfig                    |   3 +
        <br>
          hw/intc/loongarch_extioi.c         | 483
        +++++++++++++++++++++++++++++
        <br>
          hw/intc/meson.build                |   1 +
        <br>
          hw/intc/trace-events               |   9 +
        <br>
          hw/loongarch/Kconfig               |   1 +
        <br>
          include/hw/intc/loongarch_extioi.h |  60 ++++
        <br>
          6 files changed, 557 insertions(+)
        <br>
          create mode 100644 hw/intc/loongarch_extioi.c
        <br>
          create mode 100644 include/hw/intc/loongarch_extioi.h
        <br>
        <br>
        diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
        <br>
        index 71c04c328e..28bd1f185d 100644
        <br>
        --- a/hw/intc/Kconfig
        <br>
        +++ b/hw/intc/Kconfig
        <br>
        @@ -96,3 +96,6 @@ config LOONGARCH_PCH_MSI
        <br>
              select MSI_NONBROKEN
        <br>
              bool
        <br>
              select UNIMP
        <br>
        +
        <br>
        +config LOONGARCH_EXTIOI
        <br>
        +    bool
        <br>
        diff --git a/hw/intc/loongarch_extioi.c
        b/hw/intc/loongarch_extioi.c
        <br>
        new file mode 100644
        <br>
        index 0000000000..1d9317c5bd
        <br>
        --- /dev/null
        <br>
        +++ b/hw/intc/loongarch_extioi.c
        <br>
        @@ -0,0 +1,483 @@
        <br>
        +/* SPDX-License-Identifier: GPL-2.0-or-later */
        <br>
        +/*
        <br>
        + * Loongson 3A5000 ext interrupt controller emulation
        <br>
        + *
        <br>
        + * Copyright (C) 2021 Loongson Technology Corporation Limited
        <br>
        + */
        <br>
        +
        <br>
        +#include "qemu/osdep.h"
        <br>
        +#include "qemu/module.h"
        <br>
        +#include "qemu/log.h"
        <br>
        +#include "hw/irq.h"
        <br>
        +#include "hw/sysbus.h"
        <br>
        +#include "hw/loongarch/virt.h"
        <br>
        +#include "hw/qdev-properties.h"
        <br>
        +#include "exec/address-spaces.h"
        <br>
        +#include "hw/intc/loongarch_extioi.h"
        <br>
        +#include "migration/vmstate.h"
        <br>
        +#include "trace.h"
        <br>
        +
        <br>
        +static void extioi_update_irq(LoongArchExtIOI *s, int irq_num,
        int level)
        <br>
        +{
        <br>
        +    uint64_t ipnum, cpu;
        <br>
        +
        <br>
        +    /*
        <br>
        +     * Routing in group of 32 interrupts.
        <br>
        +     * The default value of csr[0x420][49]
        <br>
        +     * is 0 and nobody will change it,
        <br>
        +     * so 'ipmap' use bitmap function.
        <br>
        +     */
        <br>
        +    ipnum = ldub_p((void *)&amp;s-&gt;ipmap + (irq_num / 32))
        &amp; 0xf;
        <br>
        +    ipnum = find_first_bit(&amp;ipnum, 4);
        <br>
        +    ipnum = (ipnum == 4) ? 0 : ipnum;
        <br>
        +
        <br>
        +    cpu = ldub_p((void *)s-&gt;coremap + irq_num) &amp; 0xf;
        <br>
        +    cpu = find_first_bit(&amp;cpu, 4);
        <br>
        +    cpu = (cpu == 4) ? 0 : cpu;
        <br>
        +
        <br>
        +    if (level) {
        <br>
        +        if (test_bit(irq_num, (unsigned long *)s-&gt;enable) ==
        false) {
        <br>
        +            return;
        <br>
        +        }
        <br>
        +        bitmap_set((unsigned long *)s-&gt;coreisr[cpu],
        irq_num, 1);
        <br>
        +        qemu_set_irq(s-&gt;parent_irq[cpu][ipnum], level);
        <br>
        +    } else {
        <br>
        +        bitmap_clear((unsigned long *)s-&gt;coreisr[cpu],
        irq_num, 1);
        <br>
        +        qemu_set_irq(s-&gt;parent_irq[cpu][ipnum], level);
        <br>
        +    }
        <br>
        +}
        <br>
        +
        <br>
        +static void extioi_setirq(void *opaque, int irq, int level)
        <br>
        +{
        <br>
        +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
        <br>
        +    trace_loongarch_extioi_setirq(irq, level);
        <br>
        +    extioi_update_irq(s, irq, level);
        <br>
        +}
        <br>
        +
        <br>
        +static uint32_t extioi_readb(void *opaque, hwaddr addr)
        <br>
        +{
        <br>
        +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
        <br>
        +    unsigned long offset, reg_count;
        <br>
        +    uint8_t ret = 0;
        <br>
        +    int cpu;
        <br>
        +
        <br>
        +    offset = addr &amp; 0xffff;
        <br>
        +    switch (offset) {
        <br>
        +    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
        <br>
        +        ret = ldub_p((void *)s-&gt;enable + (offset -
        EXTIOI_ENABLE_START));
        <br>
        +        break;
        <br>
        +    case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
        <br>
        +        ret = ldub_p((void *)s-&gt;bounce + (offset -
        EXTIOI_BOUNCE_START));
        <br>
        +        break;
        <br>
        +    case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
        <br>
        +        reg_count = ((offset - EXTIOI_COREISR_START) &amp;
        0x1f);
        <br>
        +        cpu = ((offset - EXTIOI_COREISR_START) &gt;&gt; 8)
        &amp; 0x3;
        <br>
        +        ret = ldub_p((void *)s-&gt;coreisr[cpu] + reg_count);
        <br>
        +        break;
        <br>
        +    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
        <br>
        +        ret = ldub_p((void *)&amp;s-&gt;ipmap + (offset -
        EXTIOI_IPMAP_START));
        <br>
        +        break;
        <br>
        +    case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
        <br>
        +        ret = ldub_p((void *)s-&gt;coremap + (offset -
        EXTIOI_COREMAP_START));
        <br>
        +        break;
        <br>
        +    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
        <br>
        +        ret = ldub_p((void *)s-&gt;nodetype + (offset -
        EXTIOI_NODETYPE_START));
        <br>
        +        break;
        <br>
        +    default:
        <br>
        +        break;
        <br>
        +    }
        <br>
        +    trace_loongarch_extioi_readb((uint32_t)addr, ret);
        <br>
        +    return ret;
        <br>
        +}
        <br>
        +
        <br>
        +static uint32_t extioi_readw(void *opaque, hwaddr addr)
        <br>
        +{
        <br>
        +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
        <br>
        +    unsigned long offset, reg_count;
        <br>
        +    uint32_t ret = 0;
        <br>
        +    int cpu;
        <br>
        +
        <br>
        +    offset = addr &amp; 0xffff;
        <br>
        +    switch (offset) {
        <br>
        +    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
        <br>
        +        ret = ldl_p((void *)s-&gt;enable + (offset -
        EXTIOI_ENABLE_START));
        <br>
        +        break;
        <br>
        +    case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
        <br>
        +        ret = ldl_p((void *)s-&gt;bounce + (offset -
        EXTIOI_BOUNCE_START));
        <br>
        +        break;
        <br>
        +    case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
        <br>
        +        reg_count = ((offset - EXTIOI_COREISR_START) &amp;
        0x1f);
        <br>
        +        cpu = ((offset - EXTIOI_COREISR_START) &gt;&gt; 8)
        &amp; 0x3;
        <br>
        +        ret = ldl_p((void *)s-&gt;coreisr[cpu] + reg_count);
        <br>
        +        break;
        <br>
        +    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
        <br>
        +        ret = ldl_p((void *)&amp;s-&gt;ipmap + (offset -
        EXTIOI_IPMAP_START));
        <br>
        +        break;
        <br>
        +    case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
        <br>
        +        ret = ldl_p((void *)s-&gt;coremap + (offset -
        EXTIOI_COREMAP_START));
        <br>
        +        break;
        <br>
        +    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
        <br>
        +        ret = ldl_p((void *)s-&gt;nodetype + (offset -
        EXTIOI_NODETYPE_START));
        <br>
        +        break;
        <br>
        +    default:
        <br>
        +        break;
        <br>
        +    }
        <br>
        +    trace_loongarch_extioi_readw((uint32_t)addr, ret);
        <br>
        +    return ret;
        <br>
        +}
        <br>
        +
        <br>
        +static uint64_t extioi_readl(void *opaque, hwaddr addr)
        <br>
        +{
        <br>
        +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
        <br>
        +    unsigned long offset, reg_count;
        <br>
        +    uint64_t ret = 0;
        <br>
        +    int cpu;
        <br>
        +
        <br>
        +    offset = addr &amp; 0xffff;
        <br>
        +
        <br>
        +    switch (offset) {
        <br>
        +    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
        <br>
        +        ret = ldq_p((void *)s-&gt;enable + (offset -
        EXTIOI_ENABLE_START));
        <br>
        +        break;
        <br>
        +    case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
        <br>
        +        ret = ldq_p((void *)s-&gt;bounce + (offset -
        EXTIOI_BOUNCE_START));
        <br>
        +        break;
        <br>
        +    case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
        <br>
        +        reg_count = ((offset - EXTIOI_COREISR_START) &amp;
        0x1f);
        <br>
        +        cpu = ((offset - EXTIOI_COREISR_START) &gt;&gt; 8)
        &amp; 0x3;
        <br>
        +        ret = ldq_p((void *)s-&gt;coreisr[cpu] + reg_count);
        <br>
        +        break;
        <br>
        +    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
        <br>
        +        ret = ldq_p((void *)&amp;s-&gt;ipmap + (offset -
        EXTIOI_IPMAP_START));
        <br>
        +        break;
        <br>
        +    case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
        <br>
        +        ret = ldq_p((void *)s-&gt;coremap + (offset -
        EXTIOI_COREMAP_START));
        <br>
        +        break;
        <br>
        +    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
        <br>
        +        ret = ldq_p((void *)s-&gt;nodetype + (offset -
        EXTIOI_NODETYPE_START));
        <br>
        +        break;
        <br>
        +    default:
        <br>
        +        break;
        <br>
        +    }
        <br>
        +    trace_loongarch_extioi_readl((uint32_t)addr, ret);
        <br>
        +    return ret;
        <br>
        +}
        <br>
        +
        <br>
        +static void extioi_writeb(void *opaque, hwaddr addr, uint32_t
        value,
        <br>
        +                          unsigned size)
        <br>
        +{
        <br>
        +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
        <br>
        +    unsigned long offset, reg_count;
        <br>
        +    int cpu, i, j, level, bits;
        <br>
        +    uint64_t old_data, val = value &amp; 0xff;
        <br>
        +
        <br>
        +    offset = addr &amp; 0xffff;
        <br>
        +
        <br>
        +    trace_loongarch_extioi_writeb(size, (uint32_t)addr,
        (uint8_t)val);
        <br>
        +    switch (offset) {
        <br>
        +    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
        <br>
        +        reg_count = (offset - EXTIOI_ENABLE_START);
        <br>
        +        old_data = ldub_p((void *)s-&gt;enable + reg_count);
        <br>
        +        if (old_data != val) {
        <br>
        +            stb_p((void *)s-&gt;enable + reg_count,
        (uint8_t)val);
        <br>
        +            old_data = old_data ^ val;
        <br>
        +            bits = size * 8;
        <br>
        +            while ((i = find_first_bit(&amp;old_data, bits)) !=
        bits) {
        <br>
        +                level = test_bit(i, &amp;val);
        <br>
        +                extioi_update_irq(s, i + reg_count * 8, level);
        <br>
        +                clear_bit(i, &amp;old_data);
        <br>
        +            }
        <br>
        +        }
        <br>
        +        break;
        <br>
        +    case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
        <br>
        +        stb_p((void *)s-&gt;bounce + (offset -
        EXTIOI_BOUNCE_START), (uint8_t)val);
        <br>
        +        break;
        <br>
        +    case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
        <br>
        +        reg_count = (offset - EXTIOI_COREISR_START) &amp; 0x1f;
        <br>
        +        cpu = ((offset - EXTIOI_COREISR_START) &gt;&gt; 8)
        &amp; 0x3;
        <br>
        +
        <br>
        +        old_data = ldub_p((void *)s-&gt;coreisr[cpu] +
        reg_count);
        <br>
        +        stb_p((void *)s-&gt;coreisr[cpu] + reg_count,
        (uint8_t)(old_data &amp; ~val));
        <br>
        +
        <br>
        +        if (old_data != (old_data &amp; ~val)) {
        <br>
        +            bits = size * 8;
        <br>
        +
        <br>
        +            while ((i = find_first_bit(&amp;val, bits)) !=
        bits) {
        <br>
        +                j = test_bit(i, &amp;old_data);
        <br>
        +                if (j) {
        <br>
        +                    extioi_update_irq(s, i + reg_count * 8, 0);
        <br>
        +                }
        <br>
        +                clear_bit(i, &amp;val);
        <br>
        +            }
        <br>
        +        }
        <br>
        +        break;
        <br>
        +    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
        <br>
        +        /* Drop arch.core_ip_mask use s-&gt;ipmap */
        <br>
        +        reg_count = (offset - EXTIOI_IPMAP_START);
        <br>
        +        stb_p((void *)&amp;s-&gt;ipmap + reg_count,
        (uint8_t)val);
        <br>
        +        break;
        <br>
        +    case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
        <br>
        +        reg_count = (offset - EXTIOI_COREMAP_START);
        <br>
        +
        <br>
        +        /* Only map the core */
        <br>
        +        while (val) {
        <br>
        +            stb_p((void *)s-&gt;coremap + reg_count,
        (uint8_t)val);
        <br>
        +            val = val &gt;&gt; 8;
        <br>
        +        }
        <br>
        +        break;
        <br>
        +    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
        <br>
        +        stb_p((void *)s-&gt;nodetype + (offset -
        EXTIOI_NODETYPE_START),
        <br>
        +                                     (uint8_t)val);
        <br>
        +        break;
        <br>
        +    default:
        <br>
        +        break;
        <br>
        +    }
        <br>
        +}
        <br>
        +
        <br>
        +static void extioi_writew(void *opaque, hwaddr addr, uint32_t
        val,
        <br>
        +                          unsigned size)
        <br>
        +{
        <br>
        +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
        <br>
        +    int cpu, level;
        <br>
        +    uint32_t offset, reg_count, i, j, bits;
        <br>
        +    uint64_t old_data, value = val;
        <br>
        +    offset = addr &amp; 0xffff;
        <br>
        +    trace_loongarch_extioi_writew(size, (uint32_t)addr, val);
        <br>
        +
        <br>
        +    switch (offset) {
        <br>
        +    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
        <br>
        +        reg_count = (offset - EXTIOI_ENABLE_START);
        <br>
        +        old_data = ldl_p((void *)s-&gt;enable + reg_count);
        <br>
        +        if (old_data != val) {
        <br>
        +            stl_p((void *)s-&gt;enable + reg_count, val);
        <br>
        +            old_data = old_data ^ val;
        <br>
        +
        <br>
        +            bits = size * 8;
        <br>
        +            while ((i = find_first_bit(&amp;old_data, bits)) !=
        bits) {
        <br>
        +                level = test_bit(i, &amp;value);
        <br>
        +                extioi_update_irq(s, i + reg_count * 8, level);
        <br>
        +                clear_bit(i, &amp;old_data);
        <br>
        +            }
        <br>
        +        }
        <br>
        +        break;
        <br>
        +    case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
        <br>
        +        stl_p((void *)s-&gt;bounce + (offset -
        EXTIOI_BOUNCE_START), val);
        <br>
        +        break;
        <br>
        +    case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
        <br>
        +        reg_count = ((offset - EXTIOI_COREISR_START) &amp;
        0x1f);
        <br>
        +        cpu = ((offset - EXTIOI_COREISR_START) &gt;&gt; 8)
        &amp; 0x3;
        <br>
        +        /* Ext_core_ioisr */
        <br>
        +        old_data = ldl_p((void *)s-&gt;coreisr[cpu] +
        reg_count);
        <br>
        +        stl_p((void *)s-&gt;coreisr[cpu] + reg_count, (old_data
        &amp; ~val));
        <br>
        +
        <br>
        +        if (old_data != (old_data &amp; ~val)) {
        <br>
        +            bits = size * 8;
        <br>
        +            while ((i = find_first_bit(&amp;value, bits)) !=
        bits) {
        <br>
        +                j = test_bit(i, &amp;old_data);
        <br>
        +                if (j) {
        <br>
        +                    extioi_update_irq(s, i + reg_count * 8, 0);
        <br>
        +                }
        <br>
        +                clear_bit(i, &amp;value);
        <br>
        +            }
        <br>
        +        }
        <br>
        +        break;
        <br>
        +    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
        <br>
        +        /* Drop arch.core_ip_mask use s-&gt;ipmap */
        <br>
        +        reg_count = (offset - EXTIOI_IPMAP_START);
        <br>
        +        stl_p((void *)&amp;s-&gt;ipmap + reg_count, val);
        <br>
        +        break;
        <br>
        +    case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
        <br>
        +        reg_count = (offset - EXTIOI_COREMAP_START);
        <br>
        +        /* Only map the core */
        <br>
        +        while (val) {
        <br>
        +            stl_p((void *)s-&gt;coremap + reg_count, val);
        <br>
        +            val = val &gt;&gt; 8;
        <br>
        +        }
        <br>
        +        break;
        <br>
        +    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
        <br>
        +        stl_p((void *)s-&gt;nodetype + (offset -
        EXTIOI_NODETYPE_START), val);
        <br>
        +        break;
        <br>
        +    default:
        <br>
        +        break;
        <br>
        +    }
        <br>
        +}
        <br>
        +
        <br>
        +static void extioi_writel(void *opaque, hwaddr addr, uint64_t
        val,
        <br>
        +                          unsigned size)
        <br>
        +{
        <br>
        +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
        <br>
        +    int cpu, level, i, j, bits;
        <br>
        +    uint64_t offset, old_data, reg_count;
        <br>
        +
        <br>
        +    offset = addr &amp; 0xffff;
        <br>
        +    trace_loongarch_extioi_writel(size, (uint32_t)addr, val);
        <br>
        +    switch (offset) {
        <br>
        +    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
        <br>
        +        reg_count = (offset - EXTIOI_ENABLE_START);
        <br>
        +        old_data = s-&gt;enable[reg_count];
        <br>
        +        if (old_data != val) {
        <br>
        +            s-&gt;enable[reg_count] = val;
        <br>
        +            old_data = old_data ^ val;
        <br>
        +
        <br>
        +            bits = size * 8;
        <br>
        +            while ((i = find_first_bit(&amp;old_data, bits)) !=
        bits) {
        <br>
        +                level = test_bit(i, &amp;val);
        <br>
        +                extioi_update_irq(s, i + reg_count * 8, level);
        <br>
        +                clear_bit(i, &amp;old_data);
        <br>
        +            }
        <br>
        +        }
        <br>
        +        break;
        <br>
        +    case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
        <br>
        +        stq_p((void *)s-&gt;bounce + (offset -
        EXTIOI_BOUNCE_START), val);
        <br>
        +        break;
        <br>
        +    case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
        <br>
        +        reg_count = ((offset - EXTIOI_COREISR_START) &amp;
        0x1f);
        <br>
        +        cpu = ((offset - EXTIOI_COREISR_START) &gt;&gt; 8)
        &amp; 0x3;
        <br>
        +
        <br>
        +        /* core_ext_ioisr */
        <br>
        +        old_data = ldq_p((void *)s-&gt;coreisr[cpu] +
        reg_count);
        <br>
        +        stq_p((void *)s-&gt;coreisr[cpu] + reg_count, (old_data
        &amp; ~val));
        <br>
        +
        <br>
        +        if (old_data != (old_data &amp; ~val)) {
        <br>
        +            bits = size * 8;
        <br>
        +            while ((i = find_first_bit(&amp;val, bits)) !=
        bits) {
        <br>
        +                j = test_bit(i, &amp;old_data);
        <br>
        +                if (j) {
        <br>
        +                    extioi_update_irq(s, i + reg_count * 8, 0);
        <br>
        +                }
        <br>
        +                clear_bit(i, &amp;val);
        <br>
        +            }
        <br>
        +        }
        <br>
        +        break;
        <br>
        +    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
        <br>
        +        /* Drop arch.core_ip_mask use s-&gt;ipmap */
        <br>
        +        reg_count = (offset - EXTIOI_IPMAP_START);
        <br>
        +        stq_p((void *)&amp;s-&gt;ipmap + reg_count, val);
        <br>
        +        break;
        <br>
        +    case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
        <br>
        +        reg_count = (offset - EXTIOI_COREMAP_START);
        <br>
        +        /* Only map the core */
        <br>
        +        while (val) {
        <br>
        +            stq_p((void *)s-&gt;coremap + reg_count, val);
        <br>
        +            val = val &gt;&gt; 8;
        <br>
        +        }
        <br>
        +        break;
        <br>
        +    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
        <br>
        +        stq_p((void *)s-&gt;nodetype + (offset -
        EXTIOI_NODETYPE_START), val);
        <br>
        +        break;
        <br>
        +    default:
        <br>
        +        break;
        <br>
        +    }
        <br>
        +}
        <br>
        +
        <br>
        +static uint64_t extioi_readfn(void *opaque, hwaddr addr,
        unsigned size)
        <br>
        +{
        <br>
        +    switch (size) {
        <br>
        +    case 1:
        <br>
        +        return extioi_readb(opaque, addr);
        <br>
        +    case 4:
        <br>
        +        return extioi_readw(opaque, addr);
        <br>
        +    case 8:
        <br>
        +        return extioi_readl(opaque, addr);
        <br>
        +    default:
        <br>
        +        g_assert_not_reached();
        <br>
        +    }
        <br>
        +}
        <br>
        +
        <br>
        +static void extioi_writefn(void *opaque, hwaddr addr,
        <br>
        +                           uint64_t value, unsigned size)
        <br>
        +{
        <br>
        +    switch (size) {
        <br>
        +    case 1:
        <br>
        +        extioi_writeb(opaque, addr, value, size);
        <br>
        +        break;
        <br>
        +    case 4:
        <br>
        +        extioi_writew(opaque, addr, value, size);
        <br>
        +        break;
        <br>
        +    case 8:
        <br>
        +        extioi_writel(opaque, addr, value, size);
        <br>
        +        break;
        <br>
        +    default:
        <br>
        +        g_assert_not_reached();
        <br>
        +    }
        <br>
        +}
        <br>
        +
        <br>
        +static const MemoryRegionOps extioi_ops = {
        <br>
        +    .read = extioi_readfn,
        <br>
        +    .write = extioi_writefn,
        <br>
        +    .impl.min_access_size = 1,
        <br>
        +    .impl.max_access_size = 8,
        <br>
        +    .valid.min_access_size = 1,
        <br>
        +    .valid.max_access_size = 8,
        <br>
        +    .endianness = DEVICE_LITTLE_ENDIAN,
        <br>
        +};
        <br>
      </blockquote>
      <br>
      I think you may have misunderstood what Richard was saying about
      using a single memory region - it seems to me you have gone back
      to using the original approach with multiple access functions for
      different sizes, which almost certainly isn't correct for modern
      hardware.
      <br>
      <br>
      Going back to the previous revision of this patch, the question to
      ask is: do you really need byte-level access using
      extioi_ipmap_enable_ops and extioi_coremap_ops? Given that all the
      other register accesses appear to be 32-bit it seems odd that just
      these 2 sets of registers require 8-bit accesses. The register
      access size should be clearly stated in the EIOINTC documentaion.
      <br>
      <br>
      My suspicion would be that is possible to update
      extioi_ipmap_enable_ops and extioi_coremap_ops from the previous
      version of this patch to use the same access sizes as all the
      other registers i.e.
      <br>
      <br>
          .impl.min_access_size = 4,
      <br>
          .impl.max_access_size = 4,
      <br>
          .valid.min_access_size = 4,
      <br>
          .valid.max_access_size = 8,
      <br>
      <br>
      Once you have got this working then recalculating the address
      offsets and collapsing everything into a single memory region as
      suggested by Richard becomes trivial. I should also add that if
      for whatever reason this isn't possible, the previous version of
      the patch is the correct way to handle this, and this should be
      clearly documented as a reply in this thread along with a suitable
      reference to relevant part of the EIOINTC documentation.
      <br>
      <br>
    </blockquote>
    Thank you for your explanation,<br>
    <span style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">In the 11.2.1 chapter of the document,
      ipmap and coremap registers are accessed with 1 byte. We intend to
      change it to 8-byte access. In this way, the simulation becomes
      very simple and standardized.</span><br>
    <br>
    Thanks.<br>
    Xiaojuan<br>
    <blockquote type="cite"
      cite="mid:6ca20e3d-9e1a-03e0-482d-2b989eb6dd73@ilande.co.uk">
      <blockquote type="cite">+static void
        loongarch_extioi_realize(DeviceState *dev, Error **errp)
        <br>
        +{
        <br>
        +    LoongArchMachineState *lams =
        LOONGARCH_MACHINE(qdev_get_machine());
        <br>
        +    MachineState *ms = MACHINE(lams);
        <br>
        +    LoongArchExtIOI *p = LOONGARCH_EXTIOI(dev);
        <br>
        +    int i, cpu, pin;
        <br>
        +
        <br>
        +    qdev_init_gpio_in(dev, extioi_setirq, EXTIOI_IRQS);
        <br>
        +
        <br>
        +    for (i = 0; i &lt; EXTIOI_IRQS; i++) {
        <br>
        +        sysbus_init_irq(SYS_BUS_DEVICE(dev),
        &amp;p-&gt;irq[i]);
        <br>
        +    }
        <br>
        +    /* two ways to access extioi: iocsr memory and system
        memory */
        <br>
        +    memory_region_init_io(&amp;p-&gt;extioi_iocsr_mem,
        OBJECT(p), &amp;extioi_ops, p,
        <br>
        +                          "loongarch_extioi_iocsr", 0x900);
        <br>
        +    sysbus_init_mmio(SYS_BUS_DEVICE(dev),
        &amp;p-&gt;extioi_iocsr_mem);
        <br>
        +
        <br>
        +    memory_region_init_io(&amp;p-&gt;extioi_system_mem,
        OBJECT(p), &amp;extioi_ops, p,
        <br>
        +                          "loongarch_extioi", 0x900);
        <br>
        +    sysbus_init_mmio(SYS_BUS_DEVICE(dev),
        &amp;p-&gt;extioi_system_mem);
        <br>
        +
        <br>
        +    for (cpu = 0; cpu &lt; ms-&gt;smp.cpus; cpu++) {
        <br>
        +        for (pin = 0; pin &lt; LS3A_INTC_IP; pin++) {
        <br>
        +            qdev_init_gpio_out(dev,
        &amp;p-&gt;parent_irq[cpu][pin], 1);
        <br>
        +        }
        <br>
        +    }
        <br>
        +}
        <br>
        +
        <br>
        +static const VMStateDescription vmstate_loongarch_extioi = {
        <br>
        +    .name = TYPE_LOONGARCH_EXTIOI,
        <br>
        +    .version_id = 1,
        <br>
        +    .minimum_version_id = 1,
        <br>
        +    .fields = (VMStateField[]) {
        <br>
        +        VMSTATE_UINT64_ARRAY(enable, LoongArchExtIOI,
        <br>
        +                             EXTIOI_IRQS_BITMAP_SIZE / 8),
        <br>
        +        VMSTATE_UINT64_ARRAY(bounce, LoongArchExtIOI,
        <br>
        +                             EXTIOI_IRQS_BITMAP_SIZE / 8),
        <br>
        +        VMSTATE_UINT64_2DARRAY(coreisr, LoongArchExtIOI,
        <br>
        +                               MAX_CORES,
        EXTIOI_IRQS_BITMAP_SIZE / 8),
        <br>
        +        VMSTATE_UINT64(ipmap, LoongArchExtIOI),
        <br>
        +        VMSTATE_UINT64_ARRAY(coremap, LoongArchExtIOI,
        <br>
        +                             EXTIOI_IRQS_COREMAP_SIZE / 8),
        <br>
        +        VMSTATE_UINT64_ARRAY(nodetype, LoongArchExtIOI,
        <br>
        +                             EXTIOI_IRQS_NODETYPE_SIZE / 4),
        <br>
        +        VMSTATE_END_OF_LIST()
        <br>
        +    }
        <br>
        +};
        <br>
        +
        <br>
        +static void loongarch_extioi_class_init(ObjectClass *klass,
        void *data)
        <br>
        +{
        <br>
        +    DeviceClass *dc = DEVICE_CLASS(klass);
        <br>
        +
        <br>
        +    dc-&gt;vmsd = &amp;vmstate_loongarch_extioi;
        <br>
        +    dc-&gt;realize = loongarch_extioi_realize;
        <br>
        +}
        <br>
        +
        <br>
        +static const TypeInfo loongarch_extioi_info = {
        <br>
        +    .name          = TYPE_LOONGARCH_EXTIOI,
        <br>
        +    .parent        = TYPE_SYS_BUS_DEVICE,
        <br>
        +    .instance_size = sizeof(struct LoongArchExtIOI),
        <br>
        +    .class_init    = loongarch_extioi_class_init,
        <br>
        +};
        <br>
        +
        <br>
        +static void loongarch_extioi_register_types(void)
        <br>
        +{
        <br>
        +    type_register_static(&amp;loongarch_extioi_info);
        <br>
        +}
        <br>
        +
        <br>
        +type_init(loongarch_extioi_register_types)
        <br>
        diff --git a/hw/intc/meson.build b/hw/intc/meson.build
        <br>
        index 77a30cec33..405e18f4bb 100644
        <br>
        --- a/hw/intc/meson.build
        <br>
        +++ b/hw/intc/meson.build
        <br>
        @@ -65,3 +65,4 @@ specific_ss.add(when: 'CONFIG_M68K_IRQC',
        if_true: files('m68k_irqc.c'))
        <br>
          specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true:
        files('loongarch_ipi.c'))
        <br>
          specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_PIC', if_true:
        files('loongarch_pch_pic.c'))
        <br>
          specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_MSI', if_true:
        files('loongarch_pch_msi.c'))
        <br>
        +specific_ss.add(when: 'CONFIG_LOONGARCH_EXTIOI', if_true:
        files('loongarch_extioi.c'))
        <br>
        diff --git a/hw/intc/trace-events b/hw/intc/trace-events
        <br>
        index 8bcc1b6992..285d64ab83 100644
        <br>
        --- a/hw/intc/trace-events
        <br>
        +++ b/hw/intc/trace-events
        <br>
        @@ -303,3 +303,12 @@ loongarch_pch_pic_writeb(unsigned size,
        uint32_t addr, unsigned long val) "size:
        <br>
            # loongarch_pch_msi.c
        <br>
          loongarch_msi_set_irq(int irq_num) "set msi irq %d"
        <br>
        +
        <br>
        +# loongarch_extioi.c
        <br>
        +loongarch_extioi_setirq(int irq, int level) "set extirq irq %d
        level %d"
        <br>
        +loongarch_extioi_readb(uint32_t addr, uint8_t val) "addr:
        0x%"PRIx32 "val: 0x%" PRIu8
        <br>
        +loongarch_extioi_readw(uint32_t addr, uint32_t val) "addr:
        0x%"PRIx32 "val: 0x%" PRIx32
        <br>
        +loongarch_extioi_readl(uint32_t addr, uint64_t val) "addr:
        0x%"PRIx32 "val: 0x%" PRIx64
        <br>
        +loongarch_extioi_writeb(unsigned size, uint32_t addr, uint8_t
        val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIu8
        <br>
        +loongarch_extioi_writew(unsigned size, uint32_t addr, uint32_t
        val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx32
        <br>
        +loongarch_extioi_writel(unsigned size, uint32_t addr, uint64_t
        val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
        <br>
        diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
        <br>
        index d814fc6103..f779087416 100644
        <br>
        --- a/hw/loongarch/Kconfig
        <br>
        +++ b/hw/loongarch/Kconfig
        <br>
        @@ -5,3 +5,4 @@ config LOONGARCH_VIRT
        <br>
              select LOONGARCH_IPI
        <br>
              select LOONGARCH_PCH_PIC
        <br>
              select LOONGARCH_PCH_MSI
        <br>
        +    select LOONGARCH_EXTIOI
        <br>
        diff --git a/include/hw/intc/loongarch_extioi.h
        b/include/hw/intc/loongarch_extioi.h
        <br>
        new file mode 100644
        <br>
        index 0000000000..5482483a5f
        <br>
        --- /dev/null
        <br>
        +++ b/include/hw/intc/loongarch_extioi.h
        <br>
        @@ -0,0 +1,60 @@
        <br>
        +/* SPDX-License-Identifier: GPL-2.0-or-later */
        <br>
        +/*
        <br>
        + * LoongArch 3A5000 ext interrupt controller definitions
        <br>
        + *
        <br>
        + * Copyright (C) 2021 Loongson Technology Corporation Limited
        <br>
        + */
        <br>
        +
        <br>
        +#include "hw/sysbus.h"
        <br>
        +#include "hw/loongarch/virt.h"
        <br>
        +
        <br>
        +#ifndef LOONGARCH_EXTIOI_H
        <br>
        +#define LOONGARCH_EXTIOI_H
        <br>
        +
        <br>
        +#define LS3A_INTC_IP               8
        <br>
        +#define MAX_CORES                  LOONGARCH_MAX_VCPUS
        <br>
        +#define EXTIOI_IRQS                (256)
        <br>
        +#define EXTIOI_IRQS_BITMAP_SIZE    (256 / 8)
        <br>
        +/* map to ipnum per 32 irqs */
        <br>
        +#define EXTIOI_IRQS_IPMAP_SIZE     (256 / 32)
        <br>
        +#define EXTIOI_IRQS_COREMAP_SIZE   256
        <br>
        +#define EXTIOI_IRQS_NODETYPE_SIZE  16
        <br>
        +
        <br>
        +#define APIC_OFFSET                  0x400
        <br>
        +#define APIC_BASE                    (0x1000ULL + APIC_OFFSET)
        <br>
        +
        <br>
        +#define EXTIOI_NODETYPE_START        (0x4a0 - APIC_OFFSET)
        <br>
        +#define EXTIOI_NODETYPE_END          (0x4c0 - APIC_OFFSET)
        <br>
        +#define EXTIOI_IPMAP_START           (0x4c0 - APIC_OFFSET)
        <br>
        +#define EXTIOI_IPMAP_END             (0x4c8 - APIC_OFFSET)
        <br>
        +#define EXTIOI_ENABLE_START          (0x600 - APIC_OFFSET)
        <br>
        +#define EXTIOI_ENABLE_END            (0x620 - APIC_OFFSET)
        <br>
        +#define EXTIOI_BOUNCE_START          (0x680 - APIC_OFFSET)
        <br>
        +#define EXTIOI_BOUNCE_END            (0x6a0 - APIC_OFFSET)
        <br>
        +#define EXTIOI_ISR_START             (0x700 - APIC_OFFSET)
        <br>
        +#define EXTIOI_ISR_END               (0x720 - APIC_OFFSET)
        <br>
        +#define EXTIOI_COREISR_START         (0x800 - APIC_OFFSET)
        <br>
        +#define EXTIOI_COREISR_END           (0xB20 - APIC_OFFSET)
        <br>
        +#define EXTIOI_COREMAP_START         (0xC00 - APIC_OFFSET)
        <br>
        +#define EXTIOI_COREMAP_END           (0xD00 - APIC_OFFSET)
        <br>
        +
        <br>
        +#define EXTIOI_SYSTEM_MEM            0x1fe01400
        <br>
        +#define TYPE_LOONGARCH_EXTIOI "loongarch.extioi"
        <br>
        +OBJECT_DECLARE_SIMPLE_TYPE(LoongArchExtIOI, LOONGARCH_EXTIOI)
        <br>
        +struct LoongArchExtIOI {
        <br>
        +    SysBusDevice parent_obj;
        <br>
        +    /* hardware state */
        <br>
        +    uint64_t enable[EXTIOI_IRQS_BITMAP_SIZE / 8];
        <br>
        +    uint64_t bounce[EXTIOI_IRQS_BITMAP_SIZE / 8];
        <br>
        +    uint64_t coreisr[MAX_CORES][EXTIOI_IRQS_BITMAP_SIZE / 8];
        <br>
        +    uint64_t ipmap;
        <br>
        +    uint64_t coremap[EXTIOI_IRQS_COREMAP_SIZE / 8];
        <br>
        +    uint64_t nodetype[EXTIOI_IRQS_NODETYPE_SIZE / 4];
        <br>
        +
        <br>
        +    qemu_irq parent_irq[MAX_CORES][LS3A_INTC_IP];
        <br>
        +    qemu_irq irq[EXTIOI_IRQS];
        <br>
        +    MemoryRegion extioi_iocsr_mem;
        <br>
        +    MemoryRegion extioi_system_mem;
        <br>
        +};
        <br>
        +
        <br>
        +#endif /* LOONGARCH_EXTIOI_H */
        <br>
      </blockquote>
      <br>
      <br>
      ATB,
      <br>
      <br>
      Mark.
      <br>
    </blockquote>
  </body>
</html>

--------------0E51757257234DDCB3ECA80B--


