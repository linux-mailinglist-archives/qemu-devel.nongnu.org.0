Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BFB2D9125
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 00:25:56 +0100 (CET)
Received: from localhost ([::1]:42194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koakU-0001eZ-IK
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 18:25:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koajK-00019m-Lv
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 18:24:42 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:40576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koajI-00053Y-RM
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 18:24:42 -0500
Received: by mail-wm1-x343.google.com with SMTP id a3so13661046wmb.5
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 15:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=twc0cLImvaE0C70jLCAxbAh0MwqfROPCAt2pCldtbis=;
 b=HPKIpGdv1qd74e/BSsajLxTYEUZ976nZd8CvPuiFbm5zeISJbEKX15VO5bftLXPgoL
 Cq/QZHjaX8RsFFAw/bfLmfm31ygN9QO9RJaWHk47E9EjBPR+V8PZDNJWAASnHm5OXYPy
 3b4pjJjwgxbS18vkphbjntutE+0EZK17OmwNoBT5WsCg/nZrvjU3IIWU8wNhR0zIgAjW
 xdOvZAkw9mmX761uCPuXhi0NfsJwCqxtWL5d9tsEjOMyot2lfnDz9Pgei57ADvmnFa+m
 URtDoQEb5Jsu562GXPDC/R7MFE5JYqVWJNi5AdDUBs9WRVu7RU/O6Wq8zDCbE72faowx
 Fsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=twc0cLImvaE0C70jLCAxbAh0MwqfROPCAt2pCldtbis=;
 b=ktBg0RdS/9RTp0zhILZCNPv805LV5qRvZuO78eDJ5U/6Tcbdzuqum6I/TtYuBOICWz
 ykEV2Kf4TDzF7SCT0DMhMhUhXSfYz/ZhI0emqQdbN78Uz3ba6r5jT3WqDySYQ+lo2UID
 0xDpagvBUMXObovuubAVWZgRQXGBa+tq8qmsV4YFI1xBQYOfsswhdM2oEOTmQF/nShXG
 lTf/YjgiLS1Oy8WsvoTc1vhYotFI1IzSzmMND5ui2oHih5Wi6x/GOCWyhVmRz4oDlHpI
 FBB7gN5nlm410d7l/I0TaZpbTcE1ge5k0tQrTXrj120jpCOyCMPad3HkySrIEDfiqF4f
 0AQQ==
X-Gm-Message-State: AOAM533s3dpkKr/Bjc6bdKmjTuZsqzUAZK16eW1gw48yGO09GOcMMyxx
 /fOzYHjwu6T3HNfP7eLSr0U=
X-Google-Smtp-Source: ABdhPJyHYOwPk9b4c6Qn+5GtMEzyAf/J32xd6R8zcxCnMarFMjmDdLA9wpta4A9XVuahnQn0RKuFQQ==
X-Received: by 2002:a05:600c:21c7:: with SMTP id
 x7mr24306918wmj.75.1607901879182; 
 Sun, 13 Dec 2020 15:24:39 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id i9sm32261534wrs.70.2020.12.13.15.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Dec 2020 15:24:38 -0800 (PST)
Subject: Re: [PATCH V17 4/6] hw/mips: Add Loongson-3 boot parameter helpers
To: Huacai Chen <zltjiangshi@gmail.com>
References: <1604636510-8347-1-git-send-email-chenhc@lemote.com>
 <1604636510-8347-5-git-send-email-chenhc@lemote.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <19b20384-7713-ab61-4264-3e7e020ffe5e@amsat.org>
Date: Mon, 14 Dec 2020 00:24:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1604636510-8347-5-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@gmail.com>, qemu-devel@nongnu.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/6/20 5:21 AM, Huacai Chen wrote:
> Preparing to add Loongson-3 machine support, add Loongson-3's LEFI (a
> UEFI-like interface for BIOS-Kernel boot parameters) helpers first.
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  hw/mips/loongson3_bootp.c | 165 +++++++++++++++++++++++++++++++
>  hw/mips/loongson3_bootp.h | 241 ++++++++++++++++++++++++++++++++++++++++++++++
>  hw/mips/meson.build       |   1 +
>  3 files changed, 407 insertions(+)
>  create mode 100644 hw/mips/loongson3_bootp.c
>  create mode 100644 hw/mips/loongson3_bootp.h
> 
> diff --git a/hw/mips/loongson3_bootp.c b/hw/mips/loongson3_bootp.c
> new file mode 100644
> index 0000000..3a16081
> --- /dev/null
> +++ b/hw/mips/loongson3_bootp.c
> @@ -0,0 +1,165 @@
> +/*
> + * LEFI (a UEFI-like interface for BIOS-Kernel boot parameters) helpers
> + *
> + * Copyright (c) 2018-2020 Huacai Chen (chenhc@lemote.com)
> + * Copyright (c) 2018-2020 Jiaxun Yang <jiaxun.yang@flygoat.com>
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation, either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program. If not, see <https://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/units.h"
> +#include "qemu/cutils.h"
> +#include "cpu.h"
> +#include "hw/boards.h"
> +#include "hw/mips/loongson3_bootp.h"
> +
> +#define LOONGSON3_CORE_PER_NODE 4
> +
> +static struct efi_cpuinfo_loongson *init_cpu_info(void *g_cpuinfo, uint64_t cpu_freq)
> +{
> +    struct efi_cpuinfo_loongson *c = g_cpuinfo;
> +
> +    stl_le_p(&c->cputype, Loongson_3A);
> +    stl_le_p(&c->processor_id, MIPS_CPU(first_cpu)->env.CP0_PRid);
> +    if (cpu_freq > UINT_MAX) {
> +        stl_le_p(&c->cpu_clock_freq, UINT_MAX);
> +    } else {
> +        stl_le_p(&c->cpu_clock_freq, cpu_freq);
> +    }
> +
> +    stw_le_p(&c->cpu_startup_core_id, 0);
> +    stl_le_p(&c->nr_cpus, current_machine->smp.cpus);
> +    stl_le_p(&c->total_node, DIV_ROUND_UP(current_machine->smp.cpus,
> +                                          LOONGSON3_CORE_PER_NODE));
> +
> +    return c;
> +}
> +
> +static struct efi_memory_map_loongson *init_memory_map(void *g_map, uint64_t ram_size)
> +{
> +    struct efi_memory_map_loongson *emap = g_map;
> +
> +    stl_le_p(&emap->nr_map, 2);
> +    stl_le_p(&emap->mem_freq, 300000000);
> +
> +    stl_le_p(&emap->map[0].node_id, 0);
> +    stl_le_p(&emap->map[0].mem_type, 1);
> +    stq_le_p(&emap->map[0].mem_start, 0x0);
> +    stl_le_p(&emap->map[0].mem_size, 240);
> +
> +    stl_le_p(&emap->map[1].node_id, 0);
> +    stl_le_p(&emap->map[1].mem_type, 2);
> +    stq_le_p(&emap->map[1].mem_start, 0x90000000);
> +    stl_le_p(&emap->map[1].mem_size, (ram_size / MiB) - 256);
> +
> +    return emap;
> +}
> +
> +static struct system_loongson *init_system_loongson(void *g_system)
> +{
> +    struct system_loongson *s = g_system;
> +
> +    stl_le_p(&s->ccnuma_smp, 0);
> +    stl_le_p(&s->sing_double_channel, 1);
> +    stl_le_p(&s->nr_uarts, 1);
> +    stl_le_p(&s->uarts[0].iotype, 2);
> +    stl_le_p(&s->uarts[0].int_offset, 2);
> +    stl_le_p(&s->uarts[0].uartclk, 25000000); /* Random value */
> +    stq_le_p(&s->uarts[0].uart_base, virt_memmap[VIRT_UART].base);
> +
> +    return s;
> +}
> +
> +static struct irq_source_routing_table *init_irq_source(void *g_irq_source)
> +{
> +    struct irq_source_routing_table *irq_info = g_irq_source;
> +
> +    stl_le_p(&irq_info->node_id, 0);
> +    stl_le_p(&irq_info->PIC_type, 0);
> +    stw_le_p(&irq_info->dma_mask_bits, 64);
> +    stq_le_p(&irq_info->pci_mem_start_addr, virt_memmap[VIRT_PCIE_MMIO].base);
> +    stq_le_p(&irq_info->pci_mem_end_addr, virt_memmap[VIRT_PCIE_MMIO].base +
> +                                          virt_memmap[VIRT_PCIE_MMIO].size - 1);
> +    stq_le_p(&irq_info->pci_io_start_addr, virt_memmap[VIRT_PCIE_PIO].base);
> +
> +    return irq_info;
> +}
> +
> +static struct interface_info *init_interface_info(void *g_interface)
> +{
> +    struct interface_info *interface = g_interface;
> +
> +    stw_le_p(&interface->vers, 0x01);
> +    strpadcpy(interface->description, 64, "UEFI_Version_v1.0", '\0');
> +
> +    return interface;
> +}
> +
> +static struct board_devices *board_devices_info(void *g_board)
> +{
> +    struct board_devices *bd = g_board;
> +
> +    strpadcpy(bd->name, 64, "Loongson-3A-VIRT-1w-V1.00-demo", '\0');
> +
> +    return bd;
> +}
> +
> +static struct loongson_special_attribute *init_special_info(void *g_special)
> +{
> +    struct loongson_special_attribute *special = g_special;
> +
> +    strpadcpy(special->special_name, 64, "2018-04-01", '\0');
> +
> +    return special;
> +}
> +
> +void init_loongson_params(struct loongson_params *lp, void *p,
> +                          uint64_t cpu_freq, uint64_t ram_size)
> +{
> +    stq_le_p(&lp->cpu_offset,
> +              (uintptr_t)init_cpu_info(p, cpu_freq) - (uintptr_t)lp);

Since I've been trying to debug your patch, I stumbled around this
code. Why init_cpu_info() returns 'p'? To make code shorter here?
This makes it very hard to review. Don't we have this:

  cpu_offset = base_offset + sizeof(struct efi_cpuinfo_loongson);

> +    p += ROUND_UP(sizeof(struct efi_cpuinfo_loongson), 64);

What about this simpler (IMHO) code (untested):

  void init_loongson_params(void *p, size_t base_ofs,
                            uint64_t cpu_freq, uint64_t ram_size)
  {
      struct loongson_params *lp = (struct loongson_params *lp)
                                   ((char *)p + base_ofs);
      size_t sz;

      init_cpu_info(p, cpu_freq); // init_cpu_info() returns 'void'.
      sz = sizeof(struct efi_cpuinfo_loongson);
      lp->cpu_offset = cpu_to_le64(base_ofs + sz);
      p += ROUND_UP(sz, 64);

> +
> +    stq_le_p(&lp->memory_offset,
> +              (uintptr_t)init_memory_map(p, ram_size) - (uintptr_t)lp);
> +    p += ROUND_UP(sizeof(struct efi_memory_map_loongson), 64);

      init_memory_map(p, ram_size);
      sz = sizeof(struct efi_memory_map_loongson);
      lp->memory_offset = cpu_to_le64(base_ofs + sz);
      p += ROUND_UP(sz, 64);

> +
> +    stq_le_p(&lp->system_offset,
> +              (uintptr_t)init_system_loongson(p) - (uintptr_t)lp);
> +    p += ROUND_UP(sizeof(struct system_loongson), 64);

      etc...

> +
> +    stq_le_p(&lp->irq_offset,
> +              (uintptr_t)init_irq_source(p) - (uintptr_t)lp);
> +    p += ROUND_UP(sizeof(struct irq_source_routing_table), 64);
> +
> +    stq_le_p(&lp->interface_offset,
> +              (uintptr_t)init_interface_info(p) - (uintptr_t)lp);
> +    p += ROUND_UP(sizeof(struct interface_info), 64);
> +
> +    stq_le_p(&lp->boarddev_table_offset,
> +              (uintptr_t)board_devices_info(p) - (uintptr_t)lp);
> +    p += ROUND_UP(sizeof(struct board_devices), 64);
> +
> +    stq_le_p(&lp->special_offset,
> +              (uintptr_t)init_special_info(p) - (uintptr_t)lp);
> +    p += ROUND_UP(sizeof(struct loongson_special_attribute), 64);
> +}
> +
> +void init_reset_system(struct efi_reset_system_t *reset)
> +{
> +    stq_le_p(&reset->Shutdown, 0xffffffffbfc000a8);
> +    stq_le_p(&reset->ResetCold, 0xffffffffbfc00080);
> +    stq_le_p(&reset->ResetWarm, 0xffffffffbfc00080);
> +}

