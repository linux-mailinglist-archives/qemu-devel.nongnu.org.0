Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFE04BABF0
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 22:41:28 +0100 (CET)
Received: from localhost ([::1]:46218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKoWl-0001bF-KL
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 16:41:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nKoUb-0007lc-E5
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 16:39:13 -0500
Received: from [2607:f8b0:4864:20::430] (port=38412
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nKoUX-0008UA-FG
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 16:39:13 -0500
Received: by mail-pf1-x430.google.com with SMTP id x18so768959pfh.5
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 13:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uvBLXkQsdwGTdg8gECAZ77Fzy9HB3zUwcpqwtmG9KPw=;
 b=UEvDpNkdb8/60TSyBeZKkWhBwgcAjh1efOmAJG1zNEJVo65K2Ka2qn5an9vWrwyDoD
 4mE819R6rFwt/HVFsRwvq0M/aIZmXjBmVVAIKzQif95lsgvrwnRn+AiwheAyiQ2EWj0z
 TWBJwFf3CJ/5EkRGj6tJkMxyifZST88NBbxTK9VmnSsKFmwcnQsgM6f/cBKfXKt/cdOM
 pF7/FI8RDAtb8keWbari9n/PtUdvV6+3F4h/JaLNn/yYzWEZeA8lmzz8vDORyfqIddZZ
 gY/XMtzeIqM6feJukT19OQ5uPuEvHWvPjHViFmSXPRGrUUXV4ZR/jzxhfRn5XB7gqJp/
 shzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uvBLXkQsdwGTdg8gECAZ77Fzy9HB3zUwcpqwtmG9KPw=;
 b=c8JnPok1d4wUQ4HSRbZ5ItZfUrv6L7FvOrJjM9X9glXxL26M0IBoxFPHvNDC/X0hS2
 yASDnvA/qWqsJLz9c92FRtPknV0Tw1pTCXXC4sCuXoFfBWzkL3BhZAzQwrHPhJZ2PLgn
 KMEJ83BaDNzV/nLnLrWyhCszLJFV8AR7zUCsIwLme1WsaV+sY9fDpmDqhHEe+yA04UtJ
 Sf5RrNYGDHb0bTObfKwc9Zu0atr+e/Xk5h1gQOxZYtvFhp3V6V+HJrA326e4TYcxhRLd
 SxMmx4kl89IJCN4u9K3rH+7+21DCB6iQ0wUD0pn2o8zv390d7a/MIuHr4C5MAorsbEsv
 X0YA==
X-Gm-Message-State: AOAM532NCfb0g6g/MChkigGVXh5Y33lfDaSSKJWjYFePo34DR0Ep+Awh
 Hjyu1dZBoSvPC5zQF2lRcfI=
X-Google-Smtp-Source: ABdhPJyRZsy91R5TMvF8KqUu2E/OZUL5LSbliDzh7YJRfMHfSMihGcPTzVL8CBfKZxTDwrgrPLv1zw==
X-Received: by 2002:a63:7709:0:b0:36c:8c3c:1199 with SMTP id
 s9-20020a637709000000b0036c8c3c1199mr3882490pgc.580.1645133947760; 
 Thu, 17 Feb 2022 13:39:07 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id s6sm9072929pgk.44.2022.02.17.13.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 13:39:07 -0800 (PST)
Date: Fri, 18 Feb 2022 06:39:05 +0900
From: Stafford Horne <shorne@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 3/4] hw/openrisc/openrisc_sim; Add support for loading a
 decice tree
Message-ID: <Yg7AeSuZOEW3nT26@antec>
References: <20220210063009.1048751-1-shorne@gmail.com>
 <20220210063009.1048751-4-shorne@gmail.com>
 <CAFEAcA_kMsoO26G-KhuNkUH=fJpdWPP_aKCwWva8RnV6ZDKkvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_kMsoO26G-KhuNkUH=fJpdWPP_aKCwWva8RnV6ZDKkvg@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=shorne@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: QEMU Development <qemu-devel@nongnu.org>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022 at 06:18:58PM +0000, Peter Maydell wrote:
> On Thu, 10 Feb 2022 at 06:46, Stafford Horne <shorne@gmail.com> wrote:
> >
> > Using the device tree means that qemu can now directly tell
> > the kernel what hardware is configured rather than use having
> > to maintain and update a separate device tree file.
> >
> > This patch adds device tree support for the OpenRISC simulator.
> > A device tree is built up based on the state of the configure
> > openrisc simulator.
> 
> This sounds like it's support for creating a device
> tree? Support for loading a device tree would be "the
> user passes us a filename of a dtb file". (This is mostly a
> quibble about commit message wording.)

Ah, yes I will fix this to say, "adds automatic device tree generation support"
....

> > -static void openrisc_load_kernel(ram_addr_t ram_size,
> > +static hwaddr openrisc_load_kernel(ram_addr_t ram_size,
> >                                   const char *kernel_filename)
> 
> Indentation looks off now ?

Fixed now.

> >  {
> >      long kernel_size;
> >      uint64_t elf_entry;
> > +    uint64_t high_addr;
> >      hwaddr entry;
> >
> >      if (kernel_filename && !qtest_enabled()) {
> >          kernel_size = load_elf(kernel_filename, NULL, NULL, NULL,
> > -                               &elf_entry, NULL, NULL, NULL, 1, EM_OPENRISC,
> > -                               1, 0);
> > +                               &elf_entry, NULL, &high_addr, NULL, 1,
> > +                               EM_OPENRISC, 1, 0);
> >          entry = elf_entry;
> >          if (kernel_size < 0) {
> >              kernel_size = load_uimage(kernel_filename,
> >                                        &entry, NULL, NULL, NULL, NULL);
> > +            high_addr = entry + kernel_size;
> >          }
> >          if (kernel_size < 0) {
> >              kernel_size = load_image_targphys(kernel_filename,
> >                                                KERNEL_LOAD_ADDR,
> >                                                ram_size - KERNEL_LOAD_ADDR);
> > +            high_addr = KERNEL_LOAD_ADDR + kernel_size;
> >          }
> >
> >          if (entry <= 0) {
> > @@ -168,7 +181,139 @@ static void openrisc_load_kernel(ram_addr_t ram_size,
> >              exit(1);
> >          }
> >          boot_info.bootstrap_pc = entry;
> > +
> > +        return high_addr;
> > +    }
> > +    return 0;
> > +}
> > +
> > +static uint32_t openrisc_load_fdt(Or1ksimState *s, hwaddr load_start,
> > +    uint64_t mem_size)
> 
> Indentation again.

Fixed.

> > +{
> > +    uint32_t fdt_addr;
> > +    int fdtsize = fdt_totalsize(s->fdt);
> > +
> > +    if (fdtsize <= 0) {
> > +        error_report("invalid device-tree");
> > +        exit(1);
> > +    }
> > +
> > +    /* We should put fdt right after the kernel */
> 
> You change this comment in patch 4 -- I think you might as well
> just use that text in this patch to start with.

OK, I had that at first but I did this to be more techincally correct.  I will
simplify as you suggest.

> > +    fdt_addr = ROUND_UP(load_start, 4);
> > +
> > +    fdt_pack(s->fdt);
> 
> fdt_pack() returns an error code -- you should check it.

OK.

> > +    /* copy in the device tree */
> > +    qemu_fdt_dumpdtb(s->fdt, fdtsize);
> > +
> > +    rom_add_blob_fixed_as("fdt", s->fdt, fdtsize, fdt_addr,
> > +                          &address_space_memory);
> > +
> > +    return fdt_addr;
> > +}
> > +
> > +static void openrisc_create_fdt(Or1ksimState *s,
> > +    const struct MemmapEntry *memmap, int num_cpus, uint64_t mem_size,
> > +    const char *cmdline)
> 
> Indentation.

Right, fixed.

> > +{
> > +    void *fdt;
> > +    int cpu;
> > +    char *nodename;
> > +    int pic_ph;
> > +
> > +    fdt = s->fdt = create_device_tree(&s->fdt_size);
> > +    if (!fdt) {
> > +        error_report("create_device_tree() failed");
> > +        exit(1);
> > +    }
> > +
> > +    qemu_fdt_setprop_string(fdt, "/", "compatible", "opencores,or1ksim");
> > +    qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x1);
> > +    qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x1);
> > +
> > +    nodename = g_strdup_printf("/memory@%lx",
> > +                               (long)memmap[OR1KSIM_DRAM].base);
> 
> Use the appropriate format string macro for the type, rather than
> casting to long (here and below).

Right good point.

> > +    qemu_fdt_add_subnode(fdt, nodename);
> > +    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> > +                           memmap[OR1KSIM_DRAM].base, mem_size);
> > +    qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
> > +    g_free(nodename);
> > +
> > +    qemu_fdt_add_subnode(fdt, "/cpus");
> > +    qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
> > +    qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
> > +
> > +    for (cpu = 0; cpu < num_cpus; cpu++) {
> > +        nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
> > +        qemu_fdt_add_subnode(fdt, nodename);
> > +        qemu_fdt_setprop_string(fdt, nodename, "compatible",
> > +                                "opencores,or1200-rtlsvn481");
> > +        qemu_fdt_setprop_cell(fdt, nodename, "reg", cpu);
> > +        qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
> > +                              OR1KSIM_CLK_MHZ);
> > +        g_free(nodename);
> > +    }
> > +
> > +    if (num_cpus > 0) {
> > +        nodename = g_strdup_printf("/ompic@%lx",
> > +                                   (long)memmap[OR1KSIM_OMPIC].base);
> > +        qemu_fdt_add_subnode(fdt, nodename);
> > +        qemu_fdt_setprop_string(fdt, nodename, "compatible", "openrisc,ompic");
> > +        qemu_fdt_setprop_cells(fdt, nodename, "reg",
> > +                               memmap[OR1KSIM_OMPIC].base,
> > +                               memmap[OR1KSIM_OMPIC].size);
> > +        qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
> > +        qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells", 0);
> > +        qemu_fdt_setprop_cell(fdt, nodename, "interrupts", OR1KSIM_OMPIC_IRQ);
> > +        g_free(nodename);
> >      }
> > +
> > +    nodename = (char *)"/pic";
> > +    qemu_fdt_add_subnode(fdt, nodename);
> > +    pic_ph = qemu_fdt_alloc_phandle(fdt);
> > +    qemu_fdt_setprop_string(fdt, nodename, "compatible",
> > +                            "opencores,or1k-pic-level");
> > +    qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells", 1);
> > +    qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
> > +    qemu_fdt_setprop_cell(fdt, nodename, "phandle", pic_ph);
> > +
> > +    qemu_fdt_setprop_cell(fdt, "/", "interrupt-parent", pic_ph);
> > +
> > +    if (nd_table[0].used) {
> > +        nodename = g_strdup_printf("/ethoc@%lx",
> > +                                   (long)memmap[OR1KSIM_ETHOC].base);
> > +        qemu_fdt_add_subnode(fdt, nodename);
> > +        qemu_fdt_setprop_string(fdt, nodename, "compatible", "opencores,ethoc");
> > +        qemu_fdt_setprop_cells(fdt, nodename, "reg",
> > +                               memmap[OR1KSIM_ETHOC].base,
> > +                               memmap[OR1KSIM_ETHOC].size);
> > +        qemu_fdt_setprop_cell(fdt, nodename, "interrupts", OR1KSIM_ETHOC_IRQ);
> > +        qemu_fdt_setprop(fdt, nodename, "big-endian", NULL, 0);
> > +
> > +        qemu_fdt_add_subnode(fdt, "/aliases");
> > +        qemu_fdt_setprop_string(fdt, "/aliases", "enet0", nodename);
> > +        g_free(nodename);
> > +    }
> > +
> > +    nodename = g_strdup_printf("/serial@%lx",
> > +                               (long)memmap[OR1KSIM_UART].base);
> > +    qemu_fdt_add_subnode(fdt, nodename);
> > +    qemu_fdt_setprop_string(fdt, nodename, "compatible", "ns16550a");
> > +    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> > +                           memmap[OR1KSIM_UART].base,
> > +                           memmap[OR1KSIM_UART].size);
> > +    qemu_fdt_setprop_cell(fdt, nodename, "interrupts", OR1KSIM_UART_IRQ);
> > +    qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency", OR1KSIM_CLK_MHZ);
> > +    qemu_fdt_setprop(fdt, nodename, "big-endian", NULL, 0);
> > +
> > +    qemu_fdt_add_subnode(fdt, "/chosen");
> > +    qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", nodename);
> > +    if (cmdline) {
> > +        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
> > +    }
> > +
> > +    qemu_fdt_setprop_string(fdt, "/aliases", "uart0", nodename);
> 
> I think the pattern the hw/arm/virt.c code uses, where the board
> code functions that create the UART, interrupt controller, etc
> devices on the board also have the code to add FDT nodes for them.
> Especially as the board gets new devices added over time, it's easier
> to check that the FDT nodes and the devices match up, and you don't
> have to awkwardly duplicate control-flow logic like "we only have
> an ethernet device if nd_table[0].used". But I won't insist that
> you rewrite this.

Right, this makes sense.  I might as well split it out.  I did it that way for
initrd.  I it may make sense to do for UART, OMPIC and Ethernet here.

> > +    g_free(nodename);
> >  }
> >
> >  static void openrisc_sim_init(MachineState *machine)
> > @@ -178,6 +323,7 @@ static void openrisc_sim_init(MachineState *machine)
> >      OpenRISCCPU *cpus[2] = {};
> >      Or1ksimState *s = OR1KSIM_MACHINE(machine);
> >      MemoryRegion *ram;
> > +    hwaddr load_addr;
> >      qemu_irq serial_irq;
> >      int n;
> >      unsigned int smp_cpus = machine->smp.cpus;
> > @@ -219,7 +365,11 @@ static void openrisc_sim_init(MachineState *machine)
> >      serial_mm_init(get_system_memory(), or1ksim_memmap[OR1KSIM_UART].base, 0,
> >                     serial_irq, 115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
> >
> > -    openrisc_load_kernel(ram_size, kernel_filename);
> > +    openrisc_create_fdt(s, or1ksim_memmap, smp_cpus, machine->ram_size,
> > +                        machine->kernel_cmdline);
> > +
> > +    load_addr = openrisc_load_kernel(ram_size, kernel_filename);
> > +    boot_info.fdt_addr = openrisc_load_fdt(s, load_addr, machine->ram_size);
> >  }
> 
> If the user doesn't specify a kernel file, we'll still load the FDT,
> at address zero. Is that sensible/intended behaviour ?

Good point,  I guess we can add some space to not override the interrupt
vectors.  The system booting with no kernel will probably not very useful
anyway.  But I imaging one could connect a debugger and load some binary into
memory and having the FDT in memory would be helpful.

So moving the fdt offset to 0 + 1-page would give enough space.  Does this sound
OK?

-Stafford

