Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D31782F0AAE
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 02:02:50 +0100 (CET)
Received: from localhost ([::1]:52266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kylbd-0000cq-6J
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 20:02:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <natechancellor@gmail.com>)
 id 1kylZV-00006g-L6; Sun, 10 Jan 2021 20:00:40 -0500
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:33068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <natechancellor@gmail.com>)
 id 1kylZR-0003jK-9q; Sun, 10 Jan 2021 20:00:37 -0500
Received: by mail-io1-xd36.google.com with SMTP id w18so16178827iot.0;
 Sun, 10 Jan 2021 17:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Fngs4CANQaHkEhXHLDYc8EfmCWnGRKCQY3z2Pts0ksE=;
 b=qL64kDc3bX9m5Tzi7yMvZcAJ3UqqBHG5uRjoIxl8wEFOpVxSyu1/AHkxUnTKK+u6bR
 P5gzj8SVbkzYlClYxXyEO2T5YkhJNOOFn5iS46MzVODfDQVqEtklbs6OtkDMasi+pC/a
 UPelisGxtB8AfN4C7ssDKl3Ctt11oKBzuglC/Fqa/4yKeRv9gwkl10ZijsAkdSsHJMtM
 oAObsGuLJFw2e67J5KC9Q9QincsU2Ne7pSK+9C50tH6OwRg7nCVfOwnITBrKYYXssGGd
 DjxpJMz3V6mDelx/TQMxQRxpF4vWGEVNogkrUSUI0hn4TqJ6SDDQA+JUYYqR06wTjs5p
 1Oqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Fngs4CANQaHkEhXHLDYc8EfmCWnGRKCQY3z2Pts0ksE=;
 b=K8y0yTnQlQ5ffhDxUEAfCOu/11u6xu2jjIdVxTmoMneH2f8hoKtJUe3FHc1bdyj6Ai
 uWTuSkxm5fC5Q8ZEXarhlbcgXAMLpzYUtoue+CPFCJre0LZ/c5w7Lmhdsv/6QVe3lgPo
 KVPj4qRfaKQiVfyQJnSphTDvp0MoOWJKztTM8ngZDfoquVqUayFHGqIcmJHixI4AEWDK
 Bjm+0I9S4oAfP6nF9LTdRdhKdwfTqHu5derjY2qb0cFQtOjdv+ADHCybRO+9YzqWAY/J
 HOSvopeiu+1ii0LmwAj0+2rcPvOtL+G6wMIErh+cBfrPJcdX7/TepY3iVLg5Ca17JZBF
 DqHg==
X-Gm-Message-State: AOAM5338hDDteLBuXVDakHS+Kp5V/qE07ZG8pE+6J+JP0FqNpSt5iVTu
 MTY/4dnAAXKqR6zqMH221D4=
X-Google-Smtp-Source: ABdhPJzsS5ugDscSMZOXbmnPwN8B5mNXSddXGtYid0uk7Ng/nJf4GzheOf/xleAGC5t6FKQfLR0qgg==
X-Received: by 2002:a05:6638:604:: with SMTP id
 g4mr12547488jar.22.1610326830938; 
 Sun, 10 Jan 2021 17:00:30 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id v6sm13081748ilo.61.2021.01.10.17.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 17:00:29 -0800 (PST)
Date: Sun, 10 Jan 2021 18:00:28 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 4/8] hw/ppc/ppc440_bamboo: Drop use of ppcuic_init()
Message-ID: <20210111010028.GA3499905@ubuntu-m3-large-x86>
References: <20201212001537.24520-1-peter.maydell@linaro.org>
 <20201212001537.24520-5-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201212001537.24520-5-peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=natechancellor@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Dec 12, 2020 at 12:15:33AM +0000, Peter Maydell wrote:
> Switch the bamboo board to directly creating and configuring the UIC,
> rather than doing it via the old ppcuic_init() helper function.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/ppc/ppc440_bamboo.c | 38 +++++++++++++++++++++++++++-----------
>  1 file changed, 27 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index 665bc1784e1..b156bcb9990 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -33,6 +33,9 @@
>  #include "sysemu/qtest.h"
>  #include "sysemu/reset.h"
>  #include "hw/sysbus.h"
> +#include "hw/intc/ppc-uic.h"
> +#include "hw/qdev-properties.h"
> +#include "qapi/error.h"
>  
>  #define BINARY_DEVICE_TREE_FILE "bamboo.dtb"
>  
> @@ -168,13 +171,13 @@ static void bamboo_init(MachineState *machine)
>      MemoryRegion *ram_memories = g_new(MemoryRegion, PPC440EP_SDRAM_NR_BANKS);
>      hwaddr ram_bases[PPC440EP_SDRAM_NR_BANKS];
>      hwaddr ram_sizes[PPC440EP_SDRAM_NR_BANKS];
> -    qemu_irq *pic;
> -    qemu_irq *irqs;
>      PCIBus *pcibus;
>      PowerPCCPU *cpu;
>      CPUPPCState *env;
>      target_long initrd_size = 0;
>      DeviceState *dev;
> +    DeviceState *uicdev;
> +    SysBusDevice *uicsbd;
>      int success;
>      int i;
>  
> @@ -192,10 +195,17 @@ static void bamboo_init(MachineState *machine)
>      ppc_dcr_init(env, NULL, NULL);
>  
>      /* interrupt controller */
> -    irqs = g_new0(qemu_irq, PPCUIC_OUTPUT_NB);
> -    irqs[PPCUIC_OUTPUT_INT] = ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT];
> -    irqs[PPCUIC_OUTPUT_CINT] = ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT];
> -    pic = ppcuic_init(env, irqs, 0x0C0, 0, 1);
> +    uicdev = qdev_new(TYPE_PPC_UIC);
> +    uicsbd = SYS_BUS_DEVICE(uicdev);
> +
> +    object_property_set_link(OBJECT(uicdev), "cpu", OBJECT(cpu),
> +                             &error_fatal);
> +    sysbus_realize_and_unref(uicsbd, &error_fatal);
> +
> +    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
> +                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
> +    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT,
> +                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
>  
>      /* SDRAM controller */
>      memset(ram_bases, 0, sizeof(ram_bases));
> @@ -203,14 +213,18 @@ static void bamboo_init(MachineState *machine)
>      ppc4xx_sdram_banks(machine->ram, PPC440EP_SDRAM_NR_BANKS, ram_memories,
>                         ram_bases, ram_sizes, ppc440ep_sdram_bank_sizes);
>      /* XXX 440EP's ECC interrupts are on UIC1, but we've only created UIC0. */
> -    ppc4xx_sdram_init(env, pic[14], PPC440EP_SDRAM_NR_BANKS, ram_memories,
> +    ppc4xx_sdram_init(env,
> +                      qdev_get_gpio_in(uicdev, 14),
> +                      PPC440EP_SDRAM_NR_BANKS, ram_memories,
>                        ram_bases, ram_sizes, 1);
>  
>      /* PCI */
>      dev = sysbus_create_varargs(TYPE_PPC4xx_PCI_HOST_BRIDGE,
>                                  PPC440EP_PCI_CONFIG,
> -                                pic[pci_irq_nrs[0]], pic[pci_irq_nrs[1]],
> -                                pic[pci_irq_nrs[2]], pic[pci_irq_nrs[3]],
> +                                qdev_get_gpio_in(uicdev, pci_irq_nrs[0]),
> +                                qdev_get_gpio_in(uicdev, pci_irq_nrs[1]),
> +                                qdev_get_gpio_in(uicdev, pci_irq_nrs[2]),
> +                                qdev_get_gpio_in(uicdev, pci_irq_nrs[3]),
>                                  NULL);
>      pcibus = (PCIBus *)qdev_get_child_bus(dev, "pci.0");
>      if (!pcibus) {
> @@ -223,12 +237,14 @@ static void bamboo_init(MachineState *machine)
>      memory_region_add_subregion(get_system_memory(), PPC440EP_PCI_IO, isa);
>  
>      if (serial_hd(0) != NULL) {
> -        serial_mm_init(address_space_mem, 0xef600300, 0, pic[0],
> +        serial_mm_init(address_space_mem, 0xef600300, 0,
> +                       qdev_get_gpio_in(uicdev, 0),
>                         PPC_SERIAL_MM_BAUDBASE, serial_hd(0),
>                         DEVICE_BIG_ENDIAN);
>      }
>      if (serial_hd(1) != NULL) {
> -        serial_mm_init(address_space_mem, 0xef600400, 0, pic[1],
> +        serial_mm_init(address_space_mem, 0xef600400, 0,
> +                       qdev_get_gpio_in(uicdev, 1),
>                         PPC_SERIAL_MM_BAUDBASE, serial_hd(1),
>                         DEVICE_BIG_ENDIAN);
>      }
> -- 
> 2.20.1
> 
> 

Hopefully reporting this here is okay, I find Launchpad hard to use but
I can file it there if need be.

This patch causes a panic while trying to boot a ppc44x_defconfig Linux
kernel:

$ qemu-system-ppc \
    -machine bamboo \
    -no-reboot \
    -append console=ttyS0 \
    -display none \
    -kernel uImage \
    -m 128m \
    -nodefaults \
    -serial mon:stdio
Linux version 5.11.0-rc3 (nathan@ubuntu-m3-large-x86) (powerpc-linux-gcc (GCC) 10.2.0, GNU ld (GNU Binutils) 2.35) #1 Sun Jan 10 15:52:24 MST 2021
Using PowerPC 44x Platform machine description
ioremap() called early from find_legacy_serial_ports+0x64c/0x794. Use early_ioremap() instead
printk: bootconsole [udbg0] enabled
-----------------------------------------------------
phys_mem_size     = 0x8000000
dcache_bsize      = 0x20
icache_bsize      = 0x20
cpu_features      = 0x0000000000000100
  possible        = 0x0000000040000100
  always          = 0x0000000000000100
cpu_user_features = 0x8c008000 0x00000000
mmu_features      = 0x00000008
-----------------------------------------------------
Zone ranges:
  Normal   [mem 0x0000000000000000-0x0000000007ffffff]
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000000000000-0x0000000007ffffff]
Initmem setup node 0 [mem 0x0000000000000000-0x0000000007ffffff]
MMU: Allocated 1088 bytes of context maps for 255 contexts
Built 1 zonelists, mobility grouping on.  Total pages: 32448
Kernel command line: console=ttyS0
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes, linear)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes, linear)
mem auto-init: stack:off, heap alloc:off, heap free:off
Memory: 122712K/131072K available (5040K kernel code, 236K rwdata, 1260K rodata, 200K init, 134K bss, 8360K reserved, 0K cma-reserved)
Kernel virtual memory layout:
  * 0xffbdf000..0xfffff000  : fixmap
  * 0xffbdd000..0xffbdf000  : early ioremap
  * 0xd1000000..0xffbdd000  : vmalloc & ioremap
SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
Oops: Exception in kernel mode, sig: 4 [#1]
BE PAGE_SIZE=4K PowerPC 44x Platform
Modules linked in:
CPU: 0 PID: 0 Comm: swapper Not tainted 5.11.0-rc3 #1
NIP:  c0019e58 LR: c062e3a0 CTR: c0019e58
REGS: c067fe90 TRAP: 0700   Not tainted  (5.11.0-rc3)
MSR:  000a1000 <CE,ME>  CR: 84000224  XER: 20000000

GPR00: c062e370 c067ff50 c065c300 c0019e58 00000000 c0019238 c067fde0 c065c300
GPR08: 00000000 00000000 c066fca4 00000066 84000222 00000000 00000000 00000000
GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 c0000010 00000000
GPR24: c0651594 c0651594 c0690000 c7ffe080 c0690000 c05c6f64 c0680000 c0802100
NIP [c0019e58] __mtdcr_table+0xc20/0x3ff8
LR [c062e3a0] uic_init_one+0x13c/0x214
Call Trace:
[c067ff50] [c062e370] uic_init_one+0x10c/0x214 (unreliable)
[c067ff80] [c062e4f8] uic_init_tree+0x80/0x174
[c067ffb0] [c0627af8] start_kernel+0x33c/0x508
[c067fff0] [c0000044] _start+0x44/0x88
Instruction dump:
7c9f2b86 4e800020 7c603286 4e800020 7c803386 4e800020 7c613286 4e800020
7c813386 4e800020 7c623286 4e800020 <7c823386> 4e800020 7c633286 4e800020
random: get_random_bytes called from oops_exit+0x44/0x84 with crng_init=0
---[ end trace 0000000000000000 ]---

Kernel panic - not syncing: Attempted to kill the idle task!
Rebooting in 180 seconds..

I have uploaded the kernel image here:

https://github.com/nathanchance/bug-files/blob/8edf230441bd8eda067973fdf0eb063c94f04379/qemu-0270d74ef886235051c13c39b0de88500c628a02/uImage

Do note that this is not the only commit that causes an issue on this
machine, there is also a few assertion failures which I am about to
report as well.

Cheers,
Nathan

