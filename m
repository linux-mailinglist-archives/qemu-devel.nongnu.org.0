Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BC745E938
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 09:20:50 +0100 (CET)
Received: from localhost ([::1]:35952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqWTR-00065f-2F
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 03:20:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mqWSL-00049x-Ix
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 03:19:41 -0500
Received: from [2001:41c9:1:41f::167] (port=53514
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mqWSI-00048D-Db
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 03:19:41 -0500
Received: from [2a00:23c4:8b9e:9b00:2535:46c:7466:70fe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mqWS0-000311-Qq; Fri, 26 Nov 2021 08:19:24 +0000
To: yangxiaojuan <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
 <1636594528-8175-22-git-send-email-yangxiaojuan@loongson.cn>
 <afeb4ef4-0ed4-bd12-0d45-7cc4782cdaf0@ilande.co.uk>
 <fac6802c-1a85-fd35-c54f-92b7dabe9e2e@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <7bcb0201-0179-e514-c141-8aad802e41fa@ilande.co.uk>
Date: Fri, 26 Nov 2021 08:19:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <fac6802c-1a85-fd35-c54f-92b7dabe9e2e@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9e:9b00:2535:46c:7466:70fe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v2 21/30] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.993,
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

On 25/11/2021 08:20, yangxiaojuan wrote:

> Hi Mark,
> 
> On 11/11/2021 10:49 PM, Mark Cave-Ayland wrote:
>> On 11/11/2021 01:35, Xiaojuan Yang wrote:
>>
>>> This patch realize the EIOINTC interrupt controller.
>>>
>>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>>> ---
>>>    hw/intc/Kconfig                    |   3 +
>>>    hw/intc/loongarch_extioi.c         | 570 +++++++++++++++++++++++++++++
>>>    hw/intc/meson.build                |   1 +
>>>    hw/loongarch/Kconfig               |   1 +
>>>    include/hw/intc/loongarch_extioi.h |  99 +++++
>>>    include/hw/loongarch/loongarch.h   |   1 +
>>>    6 files changed, 675 insertions(+)
>>>    create mode 100644 hw/intc/loongarch_extioi.c
>>>    create mode 100644 include/hw/intc/loongarch_extioi.h
>>>
>>> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
>>> index c0dc12dfa0..a2d9efd5aa 100644
>>> --- a/hw/intc/Kconfig
>>> +++ b/hw/intc/Kconfig
>>> @@ -82,3 +82,6 @@ config LOONGARCH_PCH_MSI
>>>        select MSI_NONBROKEN
>>>        bool
>>>        select UNIMP
>>> +
>>> +config LOONGARCH_EXTIOI
>>> +    bool
>>> diff --git a/hw/intc/loongarch_extioi.c b/hw/intc/loongarch_extioi.c
>>> new file mode 100644
>>> index 0000000000..592cd8d1e2
>>> --- /dev/null
>>> +++ b/hw/intc/loongarch_extioi.c
>>> @@ -0,0 +1,570 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +/*
>>> + * Loongson 3A5000 ext interrupt controller emulation
>>> + *
>>> + * Copyright (C) 2021 Loongson Technology Corporation Limited
>>> + */
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "qemu/module.h"
>>> +#include "qemu/log.h"
>>> +#include "hw/irq.h"
>>> +#include "hw/sysbus.h"
>>> +#include "hw/loongarch/loongarch.h"
>>> +#include "hw/qdev-properties.h"
>>> +#include "exec/address-spaces.h"
>>> +#include "hw/intc/loongarch_extioi.h"
>>> +#include "migration/vmstate.h"
>>> +
>>> +#define DEBUG_APIC 0
>>> +
>>> +#define DPRINTF(fmt, ...) \
>>> +do { \
>>> +    if (DEBUG_APIC) { \
>>> +        fprintf(stderr, "APIC: " fmt , ## __VA_ARGS__); \
>>> +    } \
>>> +} while (0)
>>
>> Again please use trace-events insead of DPRINTF().
>>
>>> +static void extioi_update_irq(void *opaque, int irq_num, int level)
>>> +{
>>> +    loongarch_extioi *s = opaque;
>>> +    uint8_t  ipnum, cpu;
>>> +    unsigned long found1, found2;
>>> +
>>> +    ipnum = s->sw_ipmap[irq_num];
>>> +    cpu   = s->sw_coremap[irq_num];
>>> +    if (level == 1) {
>>> +        if (test_bit(irq_num, (void *)s->en_reg8) == false) {
>>> +            return;
>>> +        }
>>> +        bitmap_set((void *)s->coreisr_reg8[cpu], irq_num, 1);
>>> +        found1 = find_next_bit((void *)&(s->sw_ipisr[cpu][ipnum]),
>>> +                               EXTIOI_IRQS, 0);
>>> +        bitmap_set((void *)&(s->sw_ipisr[cpu][ipnum]), irq_num, 1);
>>> +
>>> +        if (found1 >= EXTIOI_IRQS) {
>>> +            qemu_set_irq(s->parent_irq[cpu][ipnum], level);
>>> +        }
>>> +    } else {
>>> +        bitmap_clear((void *)s->coreisr_reg8[cpu], irq_num, 1);
>>> +        found1 = find_next_bit((void *)&(s->sw_ipisr[cpu][ipnum]),
>>> +                               EXTIOI_IRQS, 0);
>>> +        bitmap_clear((void *)&(s->sw_ipisr[cpu][ipnum]), irq_num, 1);
>>> +        found2 = find_next_bit((void *)&(s->sw_ipisr[cpu][ipnum]),
>>> +                               EXTIOI_IRQS, 0);
>>> +
>>> +        if ((found1 < EXTIOI_IRQS) && (found2 >= EXTIOI_IRQS)) {
>>> +            qemu_set_irq(s->parent_irq[cpu][ipnum], level);
>>> +        }
>>> +    }
>>> +}
>>> +
>>> +static void extioi_setirq(void *opaque, int irq, int level)
>>> +{
>>> +    loongarch_extioi *s = opaque;
>>> +    extioi_update_irq(s, irq, level);
>>> +}
>>> +
>>> +static void extioi_handler(void *opaque, int irq, int level)
>>> +{
>>> +    loongarch_extioi *extioi = (loongarch_extioi *)opaque;
>>> +
>>> +    qemu_set_irq(extioi->irq[irq], level);
>>> +}
>>> +
>>> +static uint32_t extioi_readb(void *opaque, hwaddr addr)
>>> +{
>>> +    loongarch_extioi *state = opaque;
>>
>> Add a QOM cast here.
>>
>>> +    unsigned long offset, reg_count;
>>> +    uint8_t ret;
>>> +    int cpu;
>>> +
>>> +    offset = addr & 0xffff;
>>> +
>>> +    if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
>>> +        reg_count = (offset - EXTIOI_ENABLE_START);
>>> +        ret = state->en_reg8[reg_count];
>>> +    } else if ((offset >= EXTIOI_BOUNCE_START) &&
>>> +               (offset < EXTIOI_BOUNCE_END)) {
>>> +        reg_count = (offset - EXTIOI_BOUNCE_START);
>>> +        ret = state->bounce_reg8[reg_count];
>>> +    } else if ((offset >= EXTIOI_COREISR_START) &&
>>> +               (offset < EXTIOI_COREISR_END)) {
>>> +        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f);
>>> +        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
>>> +        ret = state->coreisr_reg8[cpu][reg_count];
>>> +    } else if ((offset >= EXTIOI_IPMAP_START) &&
>>> +               (offset < EXTIOI_IPMAP_END)) {
>>> +        reg_count = (offset - EXTIOI_IPMAP_START);
>>> +        ret = state->ipmap_reg8[reg_count];
>>> +    } else if ((offset >= EXTIOI_COREMAP_START) &&
>>> +               (offset < EXTIOI_COREMAP_END)) {
>>> +        reg_count = (offset - EXTIOI_COREMAP_START);
>>> +        ret = state->coremap_reg8[reg_count];
>>> +    } else if ((offset >= EXTIOI_NODETYPE_START) &&
>>> +               (offset < EXTIOI_NODETYPE_END)) {
>>> +        reg_count = (offset - EXTIOI_NODETYPE_START);
>>> +        ret = state->nodetype_reg8[reg_count];
>>> +    }
>>> +
>>> +    DPRINTF("readb reg 0x" TARGET_FMT_plx " = %x\n", addr, ret);
>>> +    return ret;
>>> +}
>>> +
>>> +static uint32_t extioi_readw(void *opaque, hwaddr addr)
>>> +{
>>> +    loongarch_extioi *state = opaque;
>>
>> And also a QOM cast here.
>>
>>> +    unsigned long offset, reg_count;
>>> +    uint32_t ret;
>>> +    int cpu;
>>> +
>>> +    offset = addr & 0xffff;
>>> +
>>> +    if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
>>> +        reg_count = (offset - EXTIOI_ENABLE_START) / 4;
>>> +        ret = state->en_reg32[reg_count];
>>> +    } else if ((offset >= EXTIOI_BOUNCE_START) &&
>>> +               (offset < EXTIOI_BOUNCE_END)) {
>>> +        reg_count = (offset - EXTIOI_BOUNCE_START) / 4;
>>> +        ret = state->bounce_reg32[reg_count];
>>> +    } else if ((offset >= EXTIOI_COREISR_START) &&
>>> +               (offset < EXTIOI_COREISR_END)) {
>>> +        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f) / 4;
>>> +        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
>>> +        ret = state->coreisr_reg32[cpu][reg_count];
>>> +    } else if ((offset >= EXTIOI_IPMAP_START) &&
>>> +               (offset < EXTIOI_IPMAP_END)) {
>>> +        reg_count = (offset - EXTIOI_IPMAP_START) / 4;
>>> +        ret = state->ipmap_reg32[reg_count];
>>> +    } else if ((offset >= EXTIOI_COREMAP_START) &&
>>> +               (offset < EXTIOI_COREMAP_END)) {
>>> +        reg_count = (offset - EXTIOI_COREMAP_START) / 4;
>>> +        ret = state->coremap_reg32[reg_count];
>>> +    } else if ((offset >= EXTIOI_NODETYPE_START) &&
>>> +               (offset < EXTIOI_NODETYPE_END)) {
>>> +        reg_count = (offset - EXTIOI_NODETYPE_START) / 4;
>>> +        ret = state->nodetype_reg32[reg_count];
>>> +    }
>>> +
>>> +    DPRINTF("readw reg 0x" TARGET_FMT_plx " = %x\n", addr, ret);
>>> +    return ret;
>>> +}
>>> +
>>> +static uint64_t extioi_readl(void *opaque, hwaddr addr)
>>> +{
>>> +    loongarch_extioi *state = opaque;
>>
>> A QOM cast here too.
>>
>>> +    unsigned long offset, reg_count;
>>> +    uint64_t ret;
>>> +    int cpu;
>>> +
>>> +    offset = addr & 0xffff;
>>> +
>>> +    if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
>>> +        reg_count = (offset - EXTIOI_ENABLE_START) / 8;
>>> +        ret = state->en_reg64[reg_count];
>>> +    } else if ((offset >= EXTIOI_BOUNCE_START) &&
>>> +               (offset < EXTIOI_BOUNCE_END)) {
>>> +        reg_count = (offset - EXTIOI_BOUNCE_START) / 8;
>>> +        ret = state->bounce_reg64[reg_count];
>>> +    } else if ((offset >= EXTIOI_COREISR_START) &&
>>> +               (offset < EXTIOI_COREISR_END)) {
>>> +        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f) / 8;
>>> +        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
>>> +        ret = state->coreisr_reg64[cpu][reg_count];
>>> +    } else if ((offset >= EXTIOI_IPMAP_START) &&
>>> +               (offset < EXTIOI_IPMAP_END)) {
>>> +        ret = state->ipmap_reg64;
>>> +    } else if ((offset >= EXTIOI_COREMAP_START) &&
>>> +               (offset < EXTIOI_COREMAP_END)) {
>>> +        reg_count = (offset - EXTIOI_COREMAP_START) / 8;
>>> +        ret = state->coremap_reg64[reg_count];
>>> +    } else if ((offset >= EXTIOI_NODETYPE_START) &&
>>> +               (offset < EXTIOI_NODETYPE_END)) {
>>> +        reg_count = (offset - EXTIOI_NODETYPE_START) / 8;
>>> +        ret = state->nodetype_reg64[reg_count];
>>> +    }
>>> +
>>> +    DPRINTF("readl reg 0x" TARGET_FMT_plx " = %lx\n", addr, ret);
>>> +    return ret;
>>> +}
>>> +
>>> +static void extioi_writeb(void *opaque, hwaddr addr, uint32_t val)
>>> +{
>>> +    loongarch_extioi *state = opaque;
>>
>> And another cast.
>>
>>> +    unsigned long offset, reg_count;
>>> +    uint8_t old_data_u8;
>>> +    int cpu, i, ipnum, level, mask, irqnum;
>>> +
>>> +    offset = addr & 0xffff;
>>> +    val = val & 0xffUL;
>>> +
>>> +    if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
>>> +        reg_count = (offset - EXTIOI_ENABLE_START);
>>> +        old_data_u8 = state->en_reg8[reg_count];
>>> +        if (old_data_u8 != val) {
>>> +            state->en_reg8[reg_count] = val;
>>> +            old_data_u8 = old_data_u8 ^ val;
>>> +            mask = 0x1;
>>> +
>>> +            for (i = 0; i < 8; i++) {
>>> +                if (old_data_u8 & mask) {
>>> +                    level = !!(val & (0x1 << i));
>>> +                    extioi_update_irq(state, i + reg_count * 8, level);
>>> +                }
>>> +                mask = mask << 1;
>>> +            }
>>> +        }
>>> +    } else if ((offset >= EXTIOI_BOUNCE_START) &&
>>> +               (offset < EXTIOI_BOUNCE_END)) {
>>> +        reg_count = (offset - EXTIOI_BOUNCE_START);
>>> +        state->bounce_reg8[reg_count] = val;
>>> +    } else if ((offset >= EXTIOI_ISR_START) && (offset < EXTIOI_ISR_END)) {
>>> +        /* Can not be writen */
>>> +        reg_count = (offset - EXTIOI_ISR_START) & 0x1f;
>>> +        old_data_u8 = state->isr_reg8[reg_count];
>>> +        state->isr_reg8[reg_count] = old_data_u8 & (~val);
>>> +
>>> +        mask = 0x1;
>>> +        for (i = 0; i < 8; i++) {
>>> +            if ((old_data_u8 & mask) && (val & mask)) {
>>> +                extioi_update_irq(state, i + reg_count * 8, 0);
>>> +            }
>>> +            mask = mask << 1;
>>> +        }
>>> +    } else if ((offset >= EXTIOI_COREISR_START) &&
>>> +               (offset < EXTIOI_COREISR_END)) {
>>> +        reg_count = (offset - EXTIOI_COREISR_START) & 0x1f;
>>> +        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
>>> +
>>> +        /* ext_isr */
>>> +        old_data_u8 = state->isr_reg8[reg_count];
>>> +        state->isr_reg8[reg_count] = old_data_u8 & (~val);
>>> +
>>> +        old_data_u8 = state->coreisr_reg8[cpu][reg_count];
>>> +        state->coreisr_reg8[cpu][reg_count] = old_data_u8 & (~val);
>>> +
>>> +        if (old_data_u8 != state->coreisr_reg8[cpu][reg_count]) {
>>> +            mask = 0x1;
>>> +            for (i = 0; i < 8; i++) {
>>> +                if ((old_data_u8 & mask) && (val & mask)) {
>>> +                    extioi_update_irq(state, i + reg_count * 8, 0);
>>> +                }
>>> +                mask = mask << 1;
>>> +            }
>>> +        }
>>> +    } else if ((offset >= EXTIOI_IPMAP_START) && (offset < EXTIOI_IPMAP_END)) {
>>> +        /* Drop arch.core_ip_mask use state->ipmap */
>>> +        reg_count = (offset - EXTIOI_IPMAP_START);
>>> +        state->ipmap_reg8[reg_count] = val;
>>> +
>>> +        ipnum = 0;
>>> +        for (i = 0; i < 4; i++) {
>>> +            if (val & (0x1 << i)) {
>>> +                ipnum = i;
>>> +                break;
>>> +            }
>>> +        }
>>> +
>>> +        if (val) {
>>> +            for (i = 0; i < 32; i++) {
>>> +                irqnum = reg_count * 32 + i;
>>> +                state->sw_ipmap[irqnum] = ipnum;
>>> +            }
>>> +        } else {
>>> +            for (i = 0; i < 32; i++) {
>>> +                irqnum = reg_count * 32 + i;
>>> +                state->sw_ipmap[irqnum] = 0;
>>> +            }
>>> +        }
>>> +    } else if ((offset >= EXTIOI_COREMAP_START) &&
>>> +               (offset < EXTIOI_COREMAP_END)) {
>>> +        reg_count = (offset - EXTIOI_COREMAP_START);
>>> +        cpu = val & 0xf;
>>> +
>>> +        /* Node map different from kernel */
>>> +        if (cpu) {
>>> +            cpu = ctz32(cpu);
>>> +            state->coremap_reg8[reg_count] = val;
>>> +            state->sw_coremap[reg_count] = cpu;
>>> +        }
>>> +    } else if ((offset >= EXTIOI_NODETYPE_START) &&
>>> +               (offset < EXTIOI_NODETYPE_END)) {
>>> +        reg_count = (offset - EXTIOI_NODETYPE_START);
>>> +        state->nodetype_reg8[reg_count] = val;
>>> +    }
>>> +
>>> +    DPRINTF("writeb reg 0x" TARGET_FMT_plx " = %x\n", addr, val);
>>> +}
>>> +
>>> +static void extioi_writew(void *opaque, hwaddr addr, uint32_t val)
>>> +{
>>> +    loongarch_extioi *state = opaque;
>>
>> And a QOM cast here.
>>
>>> +    int cpu, level;
>>> +    uint32_t offset, old_data_u32, reg_count, mask, i;
>>> +
>>> +    offset = addr & 0xffff;
>>> +
>>> +    if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
>>> +        reg_count = (offset - EXTIOI_ENABLE_START) / 4;
>>> +        old_data_u32 = state->en_reg32[reg_count];
>>> +        if (old_data_u32 != val) {
>>> +            state->en_reg32[reg_count] = val;
>>> +            old_data_u32 = old_data_u32 ^ val;
>>> +
>>> +            mask = 0x1;
>>> +            for (i = 0; i < 8 * sizeof(old_data_u32); i++) {
>>> +                if (old_data_u32 & mask) {
>>> +                    level = !!(val & (0x1 << i));
>>> +                    extioi_update_irq(state, i + reg_count * 32, level);
>>> +                }
>>> +                mask = mask << 1;
>>> +            }
>>> +        }
>>> +    } else if ((offset >= EXTIOI_BOUNCE_START) &&
>>> +               (offset < EXTIOI_BOUNCE_END)) {
>>> +        reg_count = (offset - EXTIOI_BOUNCE_START) / 4;
>>> +        state->bounce_reg32[reg_count] = val;
>>> +    } else if ((offset >= EXTIOI_COREISR_START) &&
>>> +               (offset < EXTIOI_COREISR_END)) {
>>> +        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f) / 4;
>>> +        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
>>> +
>>> +        /* Ext_isr */
>>> +        old_data_u32 = state->isr_reg32[reg_count];
>>> +        state->isr_reg32[reg_count] = old_data_u32 & (~val);
>>> +
>>> +        /* Ext_core_ioisr */
>>> +        old_data_u32 = state->coreisr_reg32[cpu][reg_count];
>>> +        state->coreisr_reg32[cpu][reg_count] = old_data_u32 & (~val);
>>> +
>>> +        if (old_data_u32 != state->coreisr_reg32[cpu][reg_count]) {
>>> +            mask = 0x1;
>>> +            for (i = 0; i < 8 * sizeof(old_data_u32); i++) {
>>> +                if ((old_data_u32 & mask) && (val & mask)) {
>>> +                    extioi_update_irq(state, i + reg_count * 8, 0);
>>> +                }
>>> +                mask = mask << 1;
>>> +            }
>>> +        }
>>> +    } else if ((offset >= EXTIOI_IPMAP_START) &&
>>> +               (offset < EXTIOI_IPMAP_END)) {
>>> +        extioi_writeb(opaque, addr, (val) & 0xff);
>>> +        extioi_writeb(opaque, addr + 1, (val >> 8) & 0xff);
>>> +        extioi_writeb(opaque, addr + 2, (val >> 16) & 0xff);
>>> +        extioi_writeb(opaque, addr + 3, (val >> 24) & 0xff);
>>> +    } else if ((offset >= EXTIOI_COREMAP_START) &&
>>> +               (offset < EXTIOI_COREMAP_END)) {
>>> +        extioi_writeb(opaque, addr, (val) & 0xff);
>>> +        extioi_writeb(opaque, addr + 1, (val >> 8) & 0xff);
>>> +        extioi_writeb(opaque, addr + 2, (val >> 16) & 0xff);
>>> +        extioi_writeb(opaque, addr + 3, (val >> 24) & 0xff);
>>> +    } else if ((offset >= EXTIOI_NODETYPE_START) &&
>>> +               (offset < EXTIOI_NODETYPE_END)) {
>>> +        reg_count = (offset - EXTIOI_NODETYPE_START) / 4;
>>> +        state->nodetype_reg32[reg_count] = val;
>>> +    }
>>> +
>>> +    DPRINTF("writew reg 0x" TARGET_FMT_plx " = %x\n", addr, val);
>>> +}
>>> +
>>> +static void extioi_writel(void *opaque, hwaddr addr, uint64_t val)
>>> +{
>>> +    loongarch_extioi *state = (loongarch_extioi *)opaque;
>>
>> And a QOM cast here.
>>
>>> +    int cpu, level;
>>> +    uint64_t offset, old_data_u64, reg_count, mask, i;
>>> +
>>> +    offset = addr & 0xffff;
>>> +
>>> +    if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
>>> +        reg_count = (offset - EXTIOI_ENABLE_START) / 8;
>>> +        old_data_u64 = state->en_reg64[reg_count];
>>> +        if (old_data_u64 != val) {
>>> +            state->en_reg64[reg_count] = val;
>>> +            old_data_u64 = old_data_u64 ^ val;
>>> +            mask = 0x1;
>>> +            for (i = 0; i < 8 * sizeof(old_data_u64); i++) {
>>> +                if (old_data_u64 & mask) {
>>> +                    level = !!(val & (0x1 << i));
>>> +                    extioi_update_irq(state, i + reg_count * 64, level);
>>> +                }
>>> +                mask = mask << 1;
>>> +            }
>>> +        }
>>> +    } else if ((offset >= EXTIOI_BOUNCE_START) &&
>>> +               (offset < EXTIOI_BOUNCE_END)) {
>>> +        reg_count = (offset - EXTIOI_BOUNCE_START) / 8;
>>> +        state->bounce_reg64[reg_count] = val;
>>> +    } else if ((offset >= EXTIOI_COREISR_START) &&
>>> +               (offset < EXTIOI_COREISR_END)) {
>>> +        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f) / 8;
>>> +        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
>>> +
>>> +        /* core_ext_ioisr */
>>> +        old_data_u64 = state->coreisr_reg64[cpu][reg_count];
>>> +        state->coreisr_reg64[cpu][reg_count] = old_data_u64 & (~val);
>>> +
>>> +        if (old_data_u64 != state->coreisr_reg64[cpu][reg_count]) {
>>> +            mask = 0x1;
>>> +            for (i = 0; i < 8 * sizeof(old_data_u64); i++) {
>>> +                if ((old_data_u64 & mask) && (val & mask)) {
>>> +                    extioi_update_irq(state, i + reg_count * 64, 0);
>>> +                }
>>> +                mask = mask << 1;
>>> +            }
>>> +        }
>>> +    } else if ((offset >= EXTIOI_IPMAP_START) &&
>>> +               (offset < EXTIOI_IPMAP_END)) {
>>> +        extioi_writeb(opaque, addr, (val) & 0xff);
>>> +        extioi_writeb(opaque, addr + 1, (val >> 8) & 0xff);
>>> +        extioi_writeb(opaque, addr + 2, (val >> 16) & 0xff);
>>> +        extioi_writeb(opaque, addr + 3, (val >> 24) & 0xff);
>>> +        extioi_writeb(opaque, addr + 4, (val >> 32) & 0xff);
>>> +        extioi_writeb(opaque, addr + 5, (val >> 40) & 0xff);
>>> +        extioi_writeb(opaque, addr + 6, (val >> 48) & 0xff);
>>> +        extioi_writeb(opaque, addr + 7, (val >> 56) & 0xff);
>>> +    } else if ((offset >= EXTIOI_COREMAP_START) &&
>>> +               (offset < EXTIOI_COREMAP_END)) {
>>> +        extioi_writeb(opaque, addr, (val) & 0xff);
>>> +        extioi_writeb(opaque, addr + 1, (val >> 8) & 0xff);
>>> +        extioi_writeb(opaque, addr + 2, (val >> 16) & 0xff);
>>> +        extioi_writeb(opaque, addr + 3, (val >> 24) & 0xff);
>>> +        extioi_writeb(opaque, addr + 4, (val >> 32) & 0xff);
>>> +        extioi_writeb(opaque, addr + 5, (val >> 40) & 0xff);
>>> +        extioi_writeb(opaque, addr + 6, (val >> 48) & 0xff);
>>> +        extioi_writeb(opaque, addr + 7, (val >> 56) & 0xff);
>>> +    } else if ((offset >= EXTIOI_NODETYPE_START) &&
>>> +               (offset < EXTIOI_NODETYPE_END)) {
>>> +        reg_count = (offset - EXTIOI_NODETYPE_START) / 8;
>>> +        state->nodetype_reg64[reg_count] = val;
>>> +    }
>>> +
>>> +    DPRINTF("writel reg 0x" TARGET_FMT_plx " = %lx\n", addr, val);
>>> +}
>>> +
>>> +static uint64_t extioi_readfn(void *opaque, hwaddr addr, unsigned size)
>>> +{
>>> +    switch (size) {
>>> +    case 1:
>>> +        return extioi_readb(opaque, addr);
>>> +    case 4:
>>> +        return extioi_readw(opaque, addr);
>>> +    case 8:
>>> +        return extioi_readl(opaque, addr);
>>> +    default:
>>> +        g_assert_not_reached();
>>> +    }
>>> +}
>>> +
>>> +static void extioi_writefn(void *opaque, hwaddr addr,
>>> +                           uint64_t value, unsigned size)
>>> +{
>>> +    switch (size) {
>>> +    case 1:
>>> +        extioi_writeb(opaque, addr, value);
>>> +        break;
>>> +    case 4:
>>> +        extioi_writew(opaque, addr, value);
>>> +        break;
>>> +    case 8:
>>> +        extioi_writel(opaque, addr, value);
>>> +        break;
>>> +    default:
>>> +        g_assert_not_reached();
>>> +    }
>>> +}
>>
>> Ooof. This pattern of using separate functions for different size accesses generally hasn't been needed since the memory API was introduced about 10 years ago. I suspect using a single function each for read and write would help simplify things enormously.
>>
> 
>   Thank you for your advice, Most of them have been modified. But for different size access I haven't thought of a good way yet.
>   Can we just define the readb/writeb and use Multiple readb/writeb or use if (size == 1/4/8) to handle separately in a big read/write func?

In my experience you would generally only need this for old hardware which tends to 
have different behaviour for different access sizes: I'm not familiar with this 
particular device but modern hardware tends to behave more sensibly here.

The parts of your code that makes me think this isn't the correct approach are the 
sections like this in extioi_writel():

     } else if ((offset >= EXTIOI_IPMAP_START) &&
                (offset < EXTIOI_IPMAP_END)) {
         extioi_writeb(opaque, addr, (val) & 0xff);
         extioi_writeb(opaque, addr + 1, (val >> 8) & 0xff);
         extioi_writeb(opaque, addr + 2, (val >> 16) & 0xff);
         extioi_writeb(opaque, addr + 3, (val >> 24) & 0xff);
         extioi_writeb(opaque, addr + 4, (val >> 32) & 0xff);
         extioi_writeb(opaque, addr + 5, (val >> 40) & 0xff);
         extioi_writeb(opaque, addr + 6, (val >> 48) & 0xff);
         extioi_writeb(opaque, addr + 7, (val >> 56) & 0xff);
     }

On more modern hardware you can generally get away with tweaking extioi_ops:

     static const MemoryRegionOps extioi_ops = {
         .read = extioi_readfn,
         .write = extioi_writefn,
         .impl.min_access_size = 1,
         .impl.max_access_size = 8,
         .valid.min_access_size = 1,
         .valid.max_access_size = 8,
         .endianness = DEVICE_NATIVE_ENDIAN,
     };

If you set .impl.max_access_size to 1 then the QEMU memory subsystem will split 2/4/8 
byte access into multiple 1 byte accesses automatically for you. It feels like 
accesses between EXTIOI_IPMAP_START/EXTIOI_IPMAP_END and 
EXTIOI_COREMAP_START/EXTIOI_COREMAP_END could be better handled this way using 2 
separate MemoryRegionOps mapped at the relevant offset within the same device.


ATB,

Mark.

