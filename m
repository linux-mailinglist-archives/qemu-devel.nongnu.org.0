Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5682F0AB0
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 02:13:00 +0100 (CET)
Received: from localhost ([::1]:54760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyllS-0002Rr-UA
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 20:12:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <natechancellor@gmail.com>)
 id 1kyljw-0001yi-F3; Sun, 10 Jan 2021 20:11:24 -0500
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:45093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <natechancellor@gmail.com>)
 id 1kylju-0007T4-F8; Sun, 10 Jan 2021 20:11:24 -0500
Received: by mail-io1-xd34.google.com with SMTP id n4so16159671iow.12;
 Sun, 10 Jan 2021 17:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=40xBpLb9i5JA4ltONMM4DzrFU4VYMiEYWHZMM/Qqmkk=;
 b=Mz47lXaKQWi00yo77UwbZK85P1iMJ2oCt5Wzq+qFQnYI8+kFTNZqE2yttwE6ggfJ4B
 8nSeeSOB+92QEFbhZ78NSX4r2ntLwWso1xWns3QoMKoN638m8rXR6fKKxq05HfJTQhhb
 PtQoF/jHCaILpRRJNH9tBRD9o/w2fuH1umnT/EzaIn+5CnwIMfl6AELkQENdAE+mAfKM
 J74EK7H8dkdUEvEbYv5tDCGYpY8HY8mRfQA6fNU/9W/jOFYgsSg95+olvifWqQfC294v
 H70JZXKXIPHkRX/WsAsA4T4VCrBb6oOb2DOjmsqNUZKuQxv106zeXsU+gZRM94w5fVxb
 GxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=40xBpLb9i5JA4ltONMM4DzrFU4VYMiEYWHZMM/Qqmkk=;
 b=GOkutqKoYCab9X6zerrLmYzqtNwAqu/koJXpozU062fEFcEmM0zfhUIC9ukjfwWJad
 LF07TfAxuN+yGm0xnQ9x8OZzmvX0O6jEYzGbD393cECQ9Z9KFbN8cF9tFM2UPZDWvIGf
 vQ6i9fc3JpslcU3sQ0FE3XrqoaTneg2+uP17AvXf+baVuy96ya0K4X+OCQ+1T4m0oS+Z
 CzGnyXw3KxUgRLENCjh/V9+d1PqOehIrdY0N54Wv2uyLbNC/auB+ooCM5uGJlnlnwHRP
 sqtLHa7tpGc3MPrI6yu8yySIlOrsRctXNfE67xxjkBl/CT9PTBF8C9h4clF4Fh88V2A0
 kQbQ==
X-Gm-Message-State: AOAM532W/TaamU1jvRmuaBTAIoZtasrL/67jyXthKclFr0aCN1aKmBwt
 usIIG7J+rCVNGHtpEroQ0Os=
X-Google-Smtp-Source: ABdhPJwtbFyaFg0BHygcsRMzEUS7s4kD2yXpMBrhSAKmvQQm3/sNY0LE3+VQS1BqqfVM0lAtJgTJ/g==
X-Received: by 2002:a02:91c2:: with SMTP id s2mr12672310jag.48.1610327479943; 
 Sun, 10 Jan 2021 17:11:19 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id m19sm13943066ila.81.2021.01.10.17.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 17:11:19 -0800 (PST)
Date: Sun, 10 Jan 2021 18:11:17 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 4/5] hw/ppc/ppc4xx_pci: Replace pointless warning by
 assert()
Message-ID: <20210111011117.GA215408@ubuntu-m3-large-x86>
References: <20200901104043.91383-1-f4bug@amsat.org>
 <20200901104043.91383-5-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200901104043.91383-5-f4bug@amsat.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=natechancellor@gmail.com; helo=mail-io1-xd34.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-trivial@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Huacai Chen <chenhc@lemote.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 01, 2020 at 12:40:42PM +0200, Philippe Mathieu-Daudé wrote:
> We call pci_register_root_bus() to register 4 IRQs with the
> ppc4xx_pci_set_irq() handler. As it can only be called with
> values in the [0-4[ range, replace the pointless warning by
> an assert().
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/ppc/ppc4xx_pci.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
> index cd3f192a138..503ef46b39a 100644
> --- a/hw/ppc/ppc4xx_pci.c
> +++ b/hw/ppc/ppc4xx_pci.c
> @@ -256,10 +256,7 @@ static void ppc4xx_pci_set_irq(void *opaque, int irq_num, int level)
>      qemu_irq *pci_irqs = opaque;
>  
>      trace_ppc4xx_pci_set_irq(irq_num);
> -    if (irq_num < 0) {
> -        fprintf(stderr, "%s: PCI irq %d\n", __func__, irq_num);
> -        return;
> -    }
> +    assert(irq_num >= 0);
>      qemu_set_irq(pci_irqs[irq_num], level);
>  }
>  
> -- 
> 2.26.2
> 
> 

Hopefully reporting this here is okay, I find Launchpad hard to use but
I can file it there if need be.

The assertion added by this patch triggers while trying to boot a
ppc44x_defconfig Linux kernel:

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
UIC0 (32 IRQ sources) at DCR 0xc0
random: get_random_u32 called from start_kernel+0x370/0x508 with crng_init=0
clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x5c4093a7d1, max_idle_ns: 440795210635 ns
clocksource: timebase mult[2800000] shift[24] registered
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
futex hash table entries: 256 (order: -1, 3072 bytes, linear)
NET: Registered protocol family 16
DMA: preallocated 128 KiB GFP_KERNEL pool for atomic allocations

PCI host bridge /plb/pci@ec000000 (primary) ranges:
 MEM 0x00000000a0000000..0x00000000bfffffff -> 0x00000000a0000000
  IO 0x00000000e8000000..0x00000000e800ffff -> 0x0000000000000000
4xx PCI DMA offset set to 0x00000000
4xx PCI DMA window base to 0x0000000000000000
DMA window size 0x0000000080000000
PCI: Probing PCI hardware
PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
pci_bus 0000:00: root bus resource [mem 0xa0000000-0xbfffffff]
pci_bus 0000:00: root bus resource [bus 00-ff]
pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to ff
pci 0000:00:00.0: [1014:027f] type 00 class 0x068000
qemu-system-ppc: ../hw/ppc/ppc4xx_pci.c:259: ppc4xx_pci_set_irq: Assertion `irq_num >= 0' failed.

On v5.2.0, it looks like a higher assertion triggers, added by
commit 459ca8bfa4 ("pci: Assert irqnum is between 0 and bus->nirqs in
pci_bus_change_irq_level").

qemu-system-ppc: ../hw/pci/pci.c:253: pci_bus_change_irq_level: Assertion `irq_num >= 0' failed.

I have uploaded the kernel image here:

https://github.com/nathanchance/bug-files/blob/8edf230441bd8eda067973fdf0eb063c94f04379/qemu-0270d74ef886235051c13c39b0de88500c628a02/uImage

Cheers,
Nathan

