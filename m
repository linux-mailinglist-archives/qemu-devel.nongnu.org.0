Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF1144D897
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:51:09 +0100 (CET)
Received: from localhost ([::1]:45122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlBPw-0002Zc-C6
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:51:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mlBOe-0000eJ-Q2
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:49:48 -0500
Received: from [2001:41c9:1:41f::167] (port=36218
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mlBOa-00036A-M7
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:49:48 -0500
Received: from [2a00:23c4:8b9e:9b00:2535:46c:7466:70fe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mlBOQ-00041d-Mt; Thu, 11 Nov 2021 14:49:38 +0000
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
 <1636594528-8175-22-git-send-email-yangxiaojuan@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <afeb4ef4-0ed4-bd12-0d45-7cc4782cdaf0@ilande.co.uk>
Date: Thu, 11 Nov 2021 14:49:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1636594528-8175-22-git-send-email-yangxiaojuan@loongson.cn>
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

> This patch realize the EIOINTC interrupt controller.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/intc/Kconfig                    |   3 +
>   hw/intc/loongarch_extioi.c         | 570 +++++++++++++++++++++++++++++
>   hw/intc/meson.build                |   1 +
>   hw/loongarch/Kconfig               |   1 +
>   include/hw/intc/loongarch_extioi.h |  99 +++++
>   include/hw/loongarch/loongarch.h   |   1 +
>   6 files changed, 675 insertions(+)
>   create mode 100644 hw/intc/loongarch_extioi.c
>   create mode 100644 include/hw/intc/loongarch_extioi.h
> 
> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> index c0dc12dfa0..a2d9efd5aa 100644
> --- a/hw/intc/Kconfig
> +++ b/hw/intc/Kconfig
> @@ -82,3 +82,6 @@ config LOONGARCH_PCH_MSI
>       select MSI_NONBROKEN
>       bool
>       select UNIMP
> +
> +config LOONGARCH_EXTIOI
> +    bool
> diff --git a/hw/intc/loongarch_extioi.c b/hw/intc/loongarch_extioi.c
> new file mode 100644
> index 0000000000..592cd8d1e2
> --- /dev/null
> +++ b/hw/intc/loongarch_extioi.c
> @@ -0,0 +1,570 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Loongson 3A5000 ext interrupt controller emulation
> + *
> + * Copyright (C) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/module.h"
> +#include "qemu/log.h"
> +#include "hw/irq.h"
> +#include "hw/sysbus.h"
> +#include "hw/loongarch/loongarch.h"
> +#include "hw/qdev-properties.h"
> +#include "exec/address-spaces.h"
> +#include "hw/intc/loongarch_extioi.h"
> +#include "migration/vmstate.h"
> +
> +#define DEBUG_APIC 0
> +
> +#define DPRINTF(fmt, ...) \
> +do { \
> +    if (DEBUG_APIC) { \
> +        fprintf(stderr, "APIC: " fmt , ## __VA_ARGS__); \
> +    } \
> +} while (0)

Again please use trace-events insead of DPRINTF().

> +static void extioi_update_irq(void *opaque, int irq_num, int level)
> +{
> +    loongarch_extioi *s = opaque;
> +    uint8_t  ipnum, cpu;
> +    unsigned long found1, found2;
> +
> +    ipnum = s->sw_ipmap[irq_num];
> +    cpu   = s->sw_coremap[irq_num];
> +    if (level == 1) {
> +        if (test_bit(irq_num, (void *)s->en_reg8) == false) {
> +            return;
> +        }
> +        bitmap_set((void *)s->coreisr_reg8[cpu], irq_num, 1);
> +        found1 = find_next_bit((void *)&(s->sw_ipisr[cpu][ipnum]),
> +                               EXTIOI_IRQS, 0);
> +        bitmap_set((void *)&(s->sw_ipisr[cpu][ipnum]), irq_num, 1);
> +
> +        if (found1 >= EXTIOI_IRQS) {
> +            qemu_set_irq(s->parent_irq[cpu][ipnum], level);
> +        }
> +    } else {
> +        bitmap_clear((void *)s->coreisr_reg8[cpu], irq_num, 1);
> +        found1 = find_next_bit((void *)&(s->sw_ipisr[cpu][ipnum]),
> +                               EXTIOI_IRQS, 0);
> +        bitmap_clear((void *)&(s->sw_ipisr[cpu][ipnum]), irq_num, 1);
> +        found2 = find_next_bit((void *)&(s->sw_ipisr[cpu][ipnum]),
> +                               EXTIOI_IRQS, 0);
> +
> +        if ((found1 < EXTIOI_IRQS) && (found2 >= EXTIOI_IRQS)) {
> +            qemu_set_irq(s->parent_irq[cpu][ipnum], level);
> +        }
> +    }
> +}
> +
> +static void extioi_setirq(void *opaque, int irq, int level)
> +{
> +    loongarch_extioi *s = opaque;
> +    extioi_update_irq(s, irq, level);
> +}
> +
> +static void extioi_handler(void *opaque, int irq, int level)
> +{
> +    loongarch_extioi *extioi = (loongarch_extioi *)opaque;
> +
> +    qemu_set_irq(extioi->irq[irq], level);
> +}
> +
> +static uint32_t extioi_readb(void *opaque, hwaddr addr)
> +{
> +    loongarch_extioi *state = opaque;

Add a QOM cast here.

> +    unsigned long offset, reg_count;
> +    uint8_t ret;
> +    int cpu;
> +
> +    offset = addr & 0xffff;
> +
> +    if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
> +        reg_count = (offset - EXTIOI_ENABLE_START);
> +        ret = state->en_reg8[reg_count];
> +    } else if ((offset >= EXTIOI_BOUNCE_START) &&
> +               (offset < EXTIOI_BOUNCE_END)) {
> +        reg_count = (offset - EXTIOI_BOUNCE_START);
> +        ret = state->bounce_reg8[reg_count];
> +    } else if ((offset >= EXTIOI_COREISR_START) &&
> +               (offset < EXTIOI_COREISR_END)) {
> +        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f);
> +        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
> +        ret = state->coreisr_reg8[cpu][reg_count];
> +    } else if ((offset >= EXTIOI_IPMAP_START) &&
> +               (offset < EXTIOI_IPMAP_END)) {
> +        reg_count = (offset - EXTIOI_IPMAP_START);
> +        ret = state->ipmap_reg8[reg_count];
> +    } else if ((offset >= EXTIOI_COREMAP_START) &&
> +               (offset < EXTIOI_COREMAP_END)) {
> +        reg_count = (offset - EXTIOI_COREMAP_START);
> +        ret = state->coremap_reg8[reg_count];
> +    } else if ((offset >= EXTIOI_NODETYPE_START) &&
> +               (offset < EXTIOI_NODETYPE_END)) {
> +        reg_count = (offset - EXTIOI_NODETYPE_START);
> +        ret = state->nodetype_reg8[reg_count];
> +    }
> +
> +    DPRINTF("readb reg 0x" TARGET_FMT_plx " = %x\n", addr, ret);
> +    return ret;
> +}
> +
> +static uint32_t extioi_readw(void *opaque, hwaddr addr)
> +{
> +    loongarch_extioi *state = opaque;

And also a QOM cast here.

> +    unsigned long offset, reg_count;
> +    uint32_t ret;
> +    int cpu;
> +
> +    offset = addr & 0xffff;
> +
> +    if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
> +        reg_count = (offset - EXTIOI_ENABLE_START) / 4;
> +        ret = state->en_reg32[reg_count];
> +    } else if ((offset >= EXTIOI_BOUNCE_START) &&
> +               (offset < EXTIOI_BOUNCE_END)) {
> +        reg_count = (offset - EXTIOI_BOUNCE_START) / 4;
> +        ret = state->bounce_reg32[reg_count];
> +    } else if ((offset >= EXTIOI_COREISR_START) &&
> +               (offset < EXTIOI_COREISR_END)) {
> +        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f) / 4;
> +        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
> +        ret = state->coreisr_reg32[cpu][reg_count];
> +    } else if ((offset >= EXTIOI_IPMAP_START) &&
> +               (offset < EXTIOI_IPMAP_END)) {
> +        reg_count = (offset - EXTIOI_IPMAP_START) / 4;
> +        ret = state->ipmap_reg32[reg_count];
> +    } else if ((offset >= EXTIOI_COREMAP_START) &&
> +               (offset < EXTIOI_COREMAP_END)) {
> +        reg_count = (offset - EXTIOI_COREMAP_START) / 4;
> +        ret = state->coremap_reg32[reg_count];
> +    } else if ((offset >= EXTIOI_NODETYPE_START) &&
> +               (offset < EXTIOI_NODETYPE_END)) {
> +        reg_count = (offset - EXTIOI_NODETYPE_START) / 4;
> +        ret = state->nodetype_reg32[reg_count];
> +    }
> +
> +    DPRINTF("readw reg 0x" TARGET_FMT_plx " = %x\n", addr, ret);
> +    return ret;
> +}
> +
> +static uint64_t extioi_readl(void *opaque, hwaddr addr)
> +{
> +    loongarch_extioi *state = opaque;

A QOM cast here too.

> +    unsigned long offset, reg_count;
> +    uint64_t ret;
> +    int cpu;
> +
> +    offset = addr & 0xffff;
> +
> +    if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
> +        reg_count = (offset - EXTIOI_ENABLE_START) / 8;
> +        ret = state->en_reg64[reg_count];
> +    } else if ((offset >= EXTIOI_BOUNCE_START) &&
> +               (offset < EXTIOI_BOUNCE_END)) {
> +        reg_count = (offset - EXTIOI_BOUNCE_START) / 8;
> +        ret = state->bounce_reg64[reg_count];
> +    } else if ((offset >= EXTIOI_COREISR_START) &&
> +               (offset < EXTIOI_COREISR_END)) {
> +        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f) / 8;
> +        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
> +        ret = state->coreisr_reg64[cpu][reg_count];
> +    } else if ((offset >= EXTIOI_IPMAP_START) &&
> +               (offset < EXTIOI_IPMAP_END)) {
> +        ret = state->ipmap_reg64;
> +    } else if ((offset >= EXTIOI_COREMAP_START) &&
> +               (offset < EXTIOI_COREMAP_END)) {
> +        reg_count = (offset - EXTIOI_COREMAP_START) / 8;
> +        ret = state->coremap_reg64[reg_count];
> +    } else if ((offset >= EXTIOI_NODETYPE_START) &&
> +               (offset < EXTIOI_NODETYPE_END)) {
> +        reg_count = (offset - EXTIOI_NODETYPE_START) / 8;
> +        ret = state->nodetype_reg64[reg_count];
> +    }
> +
> +    DPRINTF("readl reg 0x" TARGET_FMT_plx " = %lx\n", addr, ret);
> +    return ret;
> +}
> +
> +static void extioi_writeb(void *opaque, hwaddr addr, uint32_t val)
> +{
> +    loongarch_extioi *state = opaque;

And another cast.

> +    unsigned long offset, reg_count;
> +    uint8_t old_data_u8;
> +    int cpu, i, ipnum, level, mask, irqnum;
> +
> +    offset = addr & 0xffff;
> +    val = val & 0xffUL;
> +
> +    if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
> +        reg_count = (offset - EXTIOI_ENABLE_START);
> +        old_data_u8 = state->en_reg8[reg_count];
> +        if (old_data_u8 != val) {
> +            state->en_reg8[reg_count] = val;
> +            old_data_u8 = old_data_u8 ^ val;
> +            mask = 0x1;
> +
> +            for (i = 0; i < 8; i++) {
> +                if (old_data_u8 & mask) {
> +                    level = !!(val & (0x1 << i));
> +                    extioi_update_irq(state, i + reg_count * 8, level);
> +                }
> +                mask = mask << 1;
> +            }
> +        }
> +    } else if ((offset >= EXTIOI_BOUNCE_START) &&
> +               (offset < EXTIOI_BOUNCE_END)) {
> +        reg_count = (offset - EXTIOI_BOUNCE_START);
> +        state->bounce_reg8[reg_count] = val;
> +    } else if ((offset >= EXTIOI_ISR_START) && (offset < EXTIOI_ISR_END)) {
> +        /* Can not be writen */
> +        reg_count = (offset - EXTIOI_ISR_START) & 0x1f;
> +        old_data_u8 = state->isr_reg8[reg_count];
> +        state->isr_reg8[reg_count] = old_data_u8 & (~val);
> +
> +        mask = 0x1;
> +        for (i = 0; i < 8; i++) {
> +            if ((old_data_u8 & mask) && (val & mask)) {
> +                extioi_update_irq(state, i + reg_count * 8, 0);
> +            }
> +            mask = mask << 1;
> +        }
> +    } else if ((offset >= EXTIOI_COREISR_START) &&
> +               (offset < EXTIOI_COREISR_END)) {
> +        reg_count = (offset - EXTIOI_COREISR_START) & 0x1f;
> +        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
> +
> +        /* ext_isr */
> +        old_data_u8 = state->isr_reg8[reg_count];
> +        state->isr_reg8[reg_count] = old_data_u8 & (~val);
> +
> +        old_data_u8 = state->coreisr_reg8[cpu][reg_count];
> +        state->coreisr_reg8[cpu][reg_count] = old_data_u8 & (~val);
> +
> +        if (old_data_u8 != state->coreisr_reg8[cpu][reg_count]) {
> +            mask = 0x1;
> +            for (i = 0; i < 8; i++) {
> +                if ((old_data_u8 & mask) && (val & mask)) {
> +                    extioi_update_irq(state, i + reg_count * 8, 0);
> +                }
> +                mask = mask << 1;
> +            }
> +        }
> +    } else if ((offset >= EXTIOI_IPMAP_START) && (offset < EXTIOI_IPMAP_END)) {
> +        /* Drop arch.core_ip_mask use state->ipmap */
> +        reg_count = (offset - EXTIOI_IPMAP_START);
> +        state->ipmap_reg8[reg_count] = val;
> +
> +        ipnum = 0;
> +        for (i = 0; i < 4; i++) {
> +            if (val & (0x1 << i)) {
> +                ipnum = i;
> +                break;
> +            }
> +        }
> +
> +        if (val) {
> +            for (i = 0; i < 32; i++) {
> +                irqnum = reg_count * 32 + i;
> +                state->sw_ipmap[irqnum] = ipnum;
> +            }
> +        } else {
> +            for (i = 0; i < 32; i++) {
> +                irqnum = reg_count * 32 + i;
> +                state->sw_ipmap[irqnum] = 0;
> +            }
> +        }
> +    } else if ((offset >= EXTIOI_COREMAP_START) &&
> +               (offset < EXTIOI_COREMAP_END)) {
> +        reg_count = (offset - EXTIOI_COREMAP_START);
> +        cpu = val & 0xf;
> +
> +        /* Node map different from kernel */
> +        if (cpu) {
> +            cpu = ctz32(cpu);
> +            state->coremap_reg8[reg_count] = val;
> +            state->sw_coremap[reg_count] = cpu;
> +        }
> +    } else if ((offset >= EXTIOI_NODETYPE_START) &&
> +               (offset < EXTIOI_NODETYPE_END)) {
> +        reg_count = (offset - EXTIOI_NODETYPE_START);
> +        state->nodetype_reg8[reg_count] = val;
> +    }
> +
> +    DPRINTF("writeb reg 0x" TARGET_FMT_plx " = %x\n", addr, val);
> +}
> +
> +static void extioi_writew(void *opaque, hwaddr addr, uint32_t val)
> +{
> +    loongarch_extioi *state = opaque;

And a QOM cast here.

> +    int cpu, level;
> +    uint32_t offset, old_data_u32, reg_count, mask, i;
> +
> +    offset = addr & 0xffff;
> +
> +    if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
> +        reg_count = (offset - EXTIOI_ENABLE_START) / 4;
> +        old_data_u32 = state->en_reg32[reg_count];
> +        if (old_data_u32 != val) {
> +            state->en_reg32[reg_count] = val;
> +            old_data_u32 = old_data_u32 ^ val;
> +
> +            mask = 0x1;
> +            for (i = 0; i < 8 * sizeof(old_data_u32); i++) {
> +                if (old_data_u32 & mask) {
> +                    level = !!(val & (0x1 << i));
> +                    extioi_update_irq(state, i + reg_count * 32, level);
> +                }
> +                mask = mask << 1;
> +            }
> +        }
> +    } else if ((offset >= EXTIOI_BOUNCE_START) &&
> +               (offset < EXTIOI_BOUNCE_END)) {
> +        reg_count = (offset - EXTIOI_BOUNCE_START) / 4;
> +        state->bounce_reg32[reg_count] = val;
> +    } else if ((offset >= EXTIOI_COREISR_START) &&
> +               (offset < EXTIOI_COREISR_END)) {
> +        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f) / 4;
> +        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
> +
> +        /* Ext_isr */
> +        old_data_u32 = state->isr_reg32[reg_count];
> +        state->isr_reg32[reg_count] = old_data_u32 & (~val);
> +
> +        /* Ext_core_ioisr */
> +        old_data_u32 = state->coreisr_reg32[cpu][reg_count];
> +        state->coreisr_reg32[cpu][reg_count] = old_data_u32 & (~val);
> +
> +        if (old_data_u32 != state->coreisr_reg32[cpu][reg_count]) {
> +            mask = 0x1;
> +            for (i = 0; i < 8 * sizeof(old_data_u32); i++) {
> +                if ((old_data_u32 & mask) && (val & mask)) {
> +                    extioi_update_irq(state, i + reg_count * 8, 0);
> +                }
> +                mask = mask << 1;
> +            }
> +        }
> +    } else if ((offset >= EXTIOI_IPMAP_START) &&
> +               (offset < EXTIOI_IPMAP_END)) {
> +        extioi_writeb(opaque, addr, (val) & 0xff);
> +        extioi_writeb(opaque, addr + 1, (val >> 8) & 0xff);
> +        extioi_writeb(opaque, addr + 2, (val >> 16) & 0xff);
> +        extioi_writeb(opaque, addr + 3, (val >> 24) & 0xff);
> +    } else if ((offset >= EXTIOI_COREMAP_START) &&
> +               (offset < EXTIOI_COREMAP_END)) {
> +        extioi_writeb(opaque, addr, (val) & 0xff);
> +        extioi_writeb(opaque, addr + 1, (val >> 8) & 0xff);
> +        extioi_writeb(opaque, addr + 2, (val >> 16) & 0xff);
> +        extioi_writeb(opaque, addr + 3, (val >> 24) & 0xff);
> +    } else if ((offset >= EXTIOI_NODETYPE_START) &&
> +               (offset < EXTIOI_NODETYPE_END)) {
> +        reg_count = (offset - EXTIOI_NODETYPE_START) / 4;
> +        state->nodetype_reg32[reg_count] = val;
> +    }
> +
> +    DPRINTF("writew reg 0x" TARGET_FMT_plx " = %x\n", addr, val);
> +}
> +
> +static void extioi_writel(void *opaque, hwaddr addr, uint64_t val)
> +{
> +    loongarch_extioi *state = (loongarch_extioi *)opaque;

And a QOM cast here.

> +    int cpu, level;
> +    uint64_t offset, old_data_u64, reg_count, mask, i;
> +
> +    offset = addr & 0xffff;
> +
> +    if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
> +        reg_count = (offset - EXTIOI_ENABLE_START) / 8;
> +        old_data_u64 = state->en_reg64[reg_count];
> +        if (old_data_u64 != val) {
> +            state->en_reg64[reg_count] = val;
> +            old_data_u64 = old_data_u64 ^ val;
> +            mask = 0x1;
> +            for (i = 0; i < 8 * sizeof(old_data_u64); i++) {
> +                if (old_data_u64 & mask) {
> +                    level = !!(val & (0x1 << i));
> +                    extioi_update_irq(state, i + reg_count * 64, level);
> +                }
> +                mask = mask << 1;
> +            }
> +        }
> +    } else if ((offset >= EXTIOI_BOUNCE_START) &&
> +               (offset < EXTIOI_BOUNCE_END)) {
> +        reg_count = (offset - EXTIOI_BOUNCE_START) / 8;
> +        state->bounce_reg64[reg_count] = val;
> +    } else if ((offset >= EXTIOI_COREISR_START) &&
> +               (offset < EXTIOI_COREISR_END)) {
> +        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f) / 8;
> +        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
> +
> +        /* core_ext_ioisr */
> +        old_data_u64 = state->coreisr_reg64[cpu][reg_count];
> +        state->coreisr_reg64[cpu][reg_count] = old_data_u64 & (~val);
> +
> +        if (old_data_u64 != state->coreisr_reg64[cpu][reg_count]) {
> +            mask = 0x1;
> +            for (i = 0; i < 8 * sizeof(old_data_u64); i++) {
> +                if ((old_data_u64 & mask) && (val & mask)) {
> +                    extioi_update_irq(state, i + reg_count * 64, 0);
> +                }
> +                mask = mask << 1;
> +            }
> +        }
> +    } else if ((offset >= EXTIOI_IPMAP_START) &&
> +               (offset < EXTIOI_IPMAP_END)) {
> +        extioi_writeb(opaque, addr, (val) & 0xff);
> +        extioi_writeb(opaque, addr + 1, (val >> 8) & 0xff);
> +        extioi_writeb(opaque, addr + 2, (val >> 16) & 0xff);
> +        extioi_writeb(opaque, addr + 3, (val >> 24) & 0xff);
> +        extioi_writeb(opaque, addr + 4, (val >> 32) & 0xff);
> +        extioi_writeb(opaque, addr + 5, (val >> 40) & 0xff);
> +        extioi_writeb(opaque, addr + 6, (val >> 48) & 0xff);
> +        extioi_writeb(opaque, addr + 7, (val >> 56) & 0xff);
> +    } else if ((offset >= EXTIOI_COREMAP_START) &&
> +               (offset < EXTIOI_COREMAP_END)) {
> +        extioi_writeb(opaque, addr, (val) & 0xff);
> +        extioi_writeb(opaque, addr + 1, (val >> 8) & 0xff);
> +        extioi_writeb(opaque, addr + 2, (val >> 16) & 0xff);
> +        extioi_writeb(opaque, addr + 3, (val >> 24) & 0xff);
> +        extioi_writeb(opaque, addr + 4, (val >> 32) & 0xff);
> +        extioi_writeb(opaque, addr + 5, (val >> 40) & 0xff);
> +        extioi_writeb(opaque, addr + 6, (val >> 48) & 0xff);
> +        extioi_writeb(opaque, addr + 7, (val >> 56) & 0xff);
> +    } else if ((offset >= EXTIOI_NODETYPE_START) &&
> +               (offset < EXTIOI_NODETYPE_END)) {
> +        reg_count = (offset - EXTIOI_NODETYPE_START) / 8;
> +        state->nodetype_reg64[reg_count] = val;
> +    }
> +
> +    DPRINTF("writel reg 0x" TARGET_FMT_plx " = %lx\n", addr, val);
> +}
> +
> +static uint64_t extioi_readfn(void *opaque, hwaddr addr, unsigned size)
> +{
> +    switch (size) {
> +    case 1:
> +        return extioi_readb(opaque, addr);
> +    case 4:
> +        return extioi_readw(opaque, addr);
> +    case 8:
> +        return extioi_readl(opaque, addr);
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +static void extioi_writefn(void *opaque, hwaddr addr,
> +                           uint64_t value, unsigned size)
> +{
> +    switch (size) {
> +    case 1:
> +        extioi_writeb(opaque, addr, value);
> +        break;
> +    case 4:
> +        extioi_writew(opaque, addr, value);
> +        break;
> +    case 8:
> +        extioi_writel(opaque, addr, value);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}

Ooof. This pattern of using separate functions for different size accesses generally 
hasn't been needed since the memory API was introduced about 10 years ago. I suspect 
using a single function each for read and write would help simplify things enormously.

> +static const MemoryRegionOps extioi_ops = {
> +    .read = extioi_readfn,
> +    .write = extioi_writefn,
> +    .impl.min_access_size = 1,
> +    .impl.max_access_size = 8,
> +    .valid.min_access_size = 1,
> +    .valid.max_access_size = 8,
> +    .endianness = DEVICE_NATIVE_ENDIAN,

Again please choose an endianness.

> +};
> +
> +static void loongarch_extioi_realize(DeviceState *dev, Error **errp)
> +{
> +    LoongArchMachineState *lams = LOONGARCH_MACHINE(qdev_get_machine());
> +    MachineState *ms = MACHINE(lams);
> +    loongarch_extioi *p = LOONGARCH_EXTIOI(dev);
> +    int cpu, pin;
> +
> +    qdev_init_gpio_in(dev, extioi_setirq, EXTIOI_IRQS);
> +
> +    for (int i = 0; i < EXTIOI_IRQS; i++) {
> +        sysbus_init_irq(SYS_BUS_DEVICE(dev), &p->irq[i]);
> +    }

If EXTIOI_IRQS is constant you can do this in a .instance_init function.

> +    memory_region_init_io(&p->mmio, OBJECT(p), &extioi_ops, p,
> +                          TYPE_LOONGARCH_EXTIOI, 0x900);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &p->mmio);
> +
> +    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
> +        for (pin = 0; pin < LS3A_INTC_IP; pin++) {
> +            sysbus_init_irq(SYS_BUS_DEVICE(dev), &p->parent_irq[cpu][pin]);
> +        }
> +    }

Similar comment about LS3A_INTC_IP.

> +    /* 0-31 is for non msi device.32-256 for msi/msix device */
> +    lams->pch_irq = qemu_allocate_irqs(extioi_handler, p, 256);

This doesn't look right: should these not be defined as qdev gpios belonging to a device?

> +}
> +
> +static const VMStateDescription vmstate_ext_sw_ipisr = {
> +    .name = "ext_sw_ipisr",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT8_ARRAY(irq, ext_sw_ipisr, EXTIOI_IRQS_BITMAP_SIZE),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static const VMStateDescription vmstate_loongarch_extioi = {
> +    .name = TYPE_LOONGARCH_EXTIOI,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT8_ARRAY(en_reg8, loongarch_extioi, EXTIOI_IRQS_BITMAP_SIZE),
> +        VMSTATE_UINT8_ARRAY(bounce_reg8, loongarch_extioi,
> +                            EXTIOI_IRQS_BITMAP_SIZE),
> +        VMSTATE_UINT8_ARRAY(isr_reg8, loongarch_extioi,
> +                            EXTIOI_IRQS_BITMAP_SIZE),
> +        VMSTATE_UINT8_2DARRAY(coreisr_reg8, loongarch_extioi, MAX_CORES,
> +                              EXTIOI_IRQS_BITMAP_SIZE),
> +        VMSTATE_UINT8_ARRAY(ipmap_reg8, loongarch_extioi,
> +                            EXTIOI_IRQS_IPMAP_SIZE),
> +        VMSTATE_UINT8_ARRAY(coremap_reg8, loongarch_extioi,
> +                            EXTIOI_IRQS_COREMAP_SIZE),
> +        VMSTATE_UINT16_ARRAY(nodetype_reg16, loongarch_extioi,
> +                             EXTIOI_IRQS_NODETYPE_SIZE),
> +        VMSTATE_UINT8_ARRAY(sw_ipmap, loongarch_extioi, EXTIOI_IRQS),
> +        VMSTATE_UINT8_ARRAY(sw_coremap, loongarch_extioi, EXTIOI_IRQS),
> +        VMSTATE_STRUCT_2DARRAY(sw_ipisr, loongarch_extioi, MAX_CORES,
> +                               LS3A_INTC_IP, 1, vmstate_ext_sw_ipisr,
> +                               ext_sw_ipisr),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void loongarch_extioi_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->vmsd = &vmstate_loongarch_extioi;
> +    dc->realize = loongarch_extioi_realize;
> +}
> +
> +static const TypeInfo loongarch_extioi_info = {
> +    .name          = TYPE_LOONGARCH_EXTIOI,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(struct loongarch_extioi),
> +    .class_init    = loongarch_extioi_class_init,
> +};
> +
> +static void loongarch_extioi_register_types(void)
> +{
> +    type_register_static(&loongarch_extioi_info);
> +}
> +
> +type_init(loongarch_extioi_register_types)
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index e04abe2d56..e8d3d46e3e 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -59,3 +59,4 @@ specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
>   specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
>   specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_PIC', if_true: files('loongarch_pch_pic.c'))
>   specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_MSI', if_true: files('loongarch_pch_msi.c'))
> +specific_ss.add(when: 'CONFIG_LOONGARCH_EXTIOI', if_true: files('loongarch_extioi.c'))
> diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
> index 4500fd3a57..9212127701 100644
> --- a/hw/loongarch/Kconfig
> +++ b/hw/loongarch/Kconfig
> @@ -3,3 +3,4 @@ config LOONGSON_3A5000
>       select PCI_EXPRESS_7A
>       select LOONGARCH_PCH_PIC
>       select LOONGARCH_PCH_MSI
> +    select LOONGARCH_EXTIOI
> diff --git a/include/hw/intc/loongarch_extioi.h b/include/hw/intc/loongarch_extioi.h
> new file mode 100644
> index 0000000000..f6381b6236
> --- /dev/null
> +++ b/include/hw/intc/loongarch_extioi.h
> @@ -0,0 +1,99 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * LoongArch 3A5000 ext interrupt controller definitions
> + *
> + * Copyright (C) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#include "hw/sysbus.h"
> +#include "hw/loongarch/loongarch.h"
> +
> +#ifndef LOONGARCH_EXTIOI_H
> +#define LOONGARCH_EXTIOI_H
> +
> +#define LS3A_INTC_IP               8
> +#define MAX_CORES                  LOONGARCH_MAX_VCPUS
> +#define EXTIOI_IRQS                (256)
> +#define EXTIOI_IRQS_BITMAP_SIZE    (256 / 8)
> +/* map to ipnum per 32 irqs */
> +#define EXTIOI_IRQS_IPMAP_SIZE     (256 / 32)
> +#define EXTIOI_IRQS_COREMAP_SIZE   256
> +#define EXTIOI_IRQS_NODETYPE_SIZE  16
> +
> +#define APIC_OFFSET                  0x400
> +#define APIC_BASE                    (0x1000ULL + APIC_OFFSET)
> +
> +#define EXTIOI_NODETYPE_START        (0x4a0 - APIC_OFFSET)
> +#define EXTIOI_NODETYPE_END          (0x4c0 - APIC_OFFSET)
> +#define EXTIOI_IPMAP_START           (0x4c0 - APIC_OFFSET)
> +#define EXTIOI_IPMAP_END             (0x4c8 - APIC_OFFSET)
> +#define EXTIOI_ENABLE_START          (0x600 - APIC_OFFSET)
> +#define EXTIOI_ENABLE_END            (0x620 - APIC_OFFSET)
> +#define EXTIOI_BOUNCE_START          (0x680 - APIC_OFFSET)
> +#define EXTIOI_BOUNCE_END            (0x6a0 - APIC_OFFSET)
> +#define EXTIOI_ISR_START             (0x700 - APIC_OFFSET)
> +#define EXTIOI_ISR_END               (0x720 - APIC_OFFSET)
> +#define EXTIOI_COREISR_START         (0x800 - APIC_OFFSET)
> +#define EXTIOI_COREISR_END           (0xB20 - APIC_OFFSET)
> +#define EXTIOI_COREMAP_START         (0xC00 - APIC_OFFSET)
> +#define EXTIOI_COREMAP_END           (0xD00 - APIC_OFFSET)
> +
> +#define TYPE_LOONGARCH_EXTIOI "loongarch.extioi"
> +DECLARE_INSTANCE_CHECKER(struct loongarch_extioi, LOONGARCH_EXTIOI,
> +                         TYPE_LOONGARCH_EXTIOI)
> +
> +typedef struct ext_sw_ipisr {
> +    uint8_t irq[EXTIOI_IRQS_BITMAP_SIZE];
> +} ext_sw_ipisr;
> +
> +typedef struct loongarch_extioi {
> +    SysBusDevice parent_obj;
> +    /* hardware state */
> +    union {
> +        uint64_t en_reg64[EXTIOI_IRQS_BITMAP_SIZE / 8];
> +        uint32_t en_reg32[EXTIOI_IRQS_BITMAP_SIZE / 4];
> +        uint8_t en_reg8[EXTIOI_IRQS_BITMAP_SIZE];
> +    };
> +    union {
> +        uint64_t bounce_reg64[EXTIOI_IRQS_BITMAP_SIZE / 8];
> +        uint32_t bounce_reg32[EXTIOI_IRQS_BITMAP_SIZE / 4];
> +        uint8_t bounce_reg8[EXTIOI_IRQS_BITMAP_SIZE];
> +    };
> +    union {
> +        uint64_t isr_reg64[EXTIOI_IRQS_BITMAP_SIZE / 8];
> +        uint32_t isr_reg32[EXTIOI_IRQS_BITMAP_SIZE / 4];
> +        uint8_t isr_reg8[EXTIOI_IRQS_BITMAP_SIZE];
> +    };
> +    union {
> +        uint64_t coreisr_reg64[MAX_CORES][EXTIOI_IRQS_BITMAP_SIZE / 8];
> +        uint32_t coreisr_reg32[MAX_CORES][EXTIOI_IRQS_BITMAP_SIZE / 4];
> +        uint8_t coreisr_reg8[MAX_CORES][EXTIOI_IRQS_BITMAP_SIZE];
> +    };
> +    union {
> +        uint64_t ipmap_reg64;
> +        uint32_t ipmap_reg32[EXTIOI_IRQS_IPMAP_SIZE / 4];
> +        uint8_t ipmap_reg8[EXTIOI_IRQS_IPMAP_SIZE];
> +    };
> +    union {
> +        uint64_t coremap_reg64[EXTIOI_IRQS_COREMAP_SIZE / 8];
> +        uint32_t coremap_reg32[EXTIOI_IRQS_COREMAP_SIZE / 4];
> +        uint8_t coremap_reg8[EXTIOI_IRQS_COREMAP_SIZE];
> +    };
> +    union {
> +        uint64_t nodetype_reg64[EXTIOI_IRQS_NODETYPE_SIZE / 4];
> +        uint32_t nodetype_reg32[EXTIOI_IRQS_NODETYPE_SIZE / 2];
> +        uint16_t nodetype_reg16[EXTIOI_IRQS_NODETYPE_SIZE];
> +        uint8_t nodetype_reg8[EXTIOI_IRQS_NODETYPE_SIZE * 2];
> +    };

Hmmm. I guess this is the fallout from having separate read/write functions for each 
different access size.

> +    /*software state */
> +    uint8_t sw_ipmap[EXTIOI_IRQS];
> +    uint8_t sw_coremap[EXTIOI_IRQS];
> +    ext_sw_ipisr sw_ipisr[MAX_CORES][LS3A_INTC_IP];
> +
> +    qemu_irq parent_irq[MAX_CORES][LS3A_INTC_IP];
> +    qemu_irq irq[EXTIOI_IRQS];
> +    MemoryRegion mmio;
> +} loongarch_extioi;
> +
> +#endif /* LOONGARCH_EXTIOI_H */
> diff --git a/include/hw/loongarch/loongarch.h b/include/hw/loongarch/loongarch.h
> index 54cc875e6d..a9690f63c1 100644
> --- a/include/hw/loongarch/loongarch.h
> +++ b/include/hw/loongarch/loongarch.h
> @@ -41,6 +41,7 @@ typedef struct LoongArchMachineState {
>       MemoryRegion *system_iocsr;
>   
>       gipiState   *gipi;
> +    qemu_irq    *pch_irq;
>   } LoongArchMachineState;
>   
>   #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("loongson7a")

ATB,

Mark.

