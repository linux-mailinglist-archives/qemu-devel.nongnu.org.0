Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 230324BA80C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 19:21:15 +0100 (CET)
Received: from localhost ([::1]:53722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKlOz-0004AW-QN
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 13:21:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKlN4-0003M0-6s
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 13:19:14 -0500
Received: from [2607:f8b0:4864:20::b2f] (port=36711
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKlN1-0003qV-Si
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 13:19:13 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id c6so14813168ybk.3
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 10:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=goeNvUL+k9I9FZHZC/3GOUSVDjMTu60yr179amKYREg=;
 b=E5QjjV3FS3xkI/Vz/uiik77zsIG6fIaUNWdBQJaXXHJ1IPhrUjk0tk+0M0KF3pW2Jy
 5Bbq/OSbaWTjAiYAJjRrVDl1QgdSsAjCtac5I6yrDfMtRYwq1ebDTat70N9+0nMtJWRC
 B1j8/mcnHx4sHy33nHEOotUu8rbTD/daqX9Vxw2IJycL9JvdP2ZV+iGSz+vVa135fT7S
 IpShLz5TXPHkU65fXqE9cQckvhI5F/5edxX8dRtUs6jdKLcqcdRt60NNpCceKTmQHNdi
 G5rLm7rncaoZxGPF+DSyQ3rjef1jiVZVuzbdfZM4rd+8JRnzupOuTV3lJaSQ8EuH8fzn
 e6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=goeNvUL+k9I9FZHZC/3GOUSVDjMTu60yr179amKYREg=;
 b=62pTao4GQ27jDUskXZI4grgZeQXmO5Pkex04L8yumCOqF20U60ElFW8odXgtUVamW/
 uNQtR8CTKWGWR9Stmv56XOmTvdzLDLdLSNCHpBxoSRtChXBcLXAUs/fqtZkvvXy/q6Qy
 jz0ZGJlQM7BTu7Gdg7M4PVQk61NHmNz9zpmqIKbD39Ddn8YSkOBreCC/Kwfyhnd3Mglq
 mBFytaLyrOHT6Ez3acaPyybZU1KIaUVw/SunIYlqNUXs34gfpQy1X/k9tmDRYfuG/0JD
 71NH581AT5VTMCvaXtD+7ReALfmhVxqkzKv7tfNVgY38bhyEeo9VPRwhCrnUGu5FKDQz
 CYIQ==
X-Gm-Message-State: AOAM5313tcfBHQ01X/at41VtAZ0OFe0AsvAjFpwiF7fM9VDBh/Qb37s1
 3PsjDRB6QgVukMj4g1JfyrjpZvsX77xRtFULsInXxQ==
X-Google-Smtp-Source: ABdhPJzTDG3fd5w/+Zrpb/Vf5LxzUR+/72pm2YQVchsAmJGMEYkaevHcmcOaGH9z2uoVnvsP8wU+uUB2hpIX2KdLzJs=
X-Received: by 2002:a25:dc87:0:b0:624:4104:a331 with SMTP id
 y129-20020a25dc87000000b006244104a331mr430890ybe.67.1645121950222; Thu, 17
 Feb 2022 10:19:10 -0800 (PST)
MIME-Version: 1.0
References: <20220210063009.1048751-1-shorne@gmail.com>
 <20220210063009.1048751-4-shorne@gmail.com>
In-Reply-To: <20220210063009.1048751-4-shorne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Feb 2022 18:18:58 +0000
Message-ID: <CAFEAcA_kMsoO26G-KhuNkUH=fJpdWPP_aKCwWva8RnV6ZDKkvg@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/openrisc/openrisc_sim; Add support for loading a
 decice tree
To: Stafford Horne <shorne@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 10 Feb 2022 at 06:46, Stafford Horne <shorne@gmail.com> wrote:
>
> Using the device tree means that qemu can now directly tell
> the kernel what hardware is configured rather than use having
> to maintain and update a separate device tree file.
>
> This patch adds device tree support for the OpenRISC simulator.
> A device tree is built up based on the state of the configure
> openrisc simulator.

This sounds like it's support for creating a device
tree? Support for loading a device tree would be "the
user passes us a filename of a dtb file". (This is mostly a
quibble about commit message wording.)

> -static void openrisc_load_kernel(ram_addr_t ram_size,
> +static hwaddr openrisc_load_kernel(ram_addr_t ram_size,
>                                   const char *kernel_filename)

Indentation looks off now ?

>  {
>      long kernel_size;
>      uint64_t elf_entry;
> +    uint64_t high_addr;
>      hwaddr entry;
>
>      if (kernel_filename && !qtest_enabled()) {
>          kernel_size = load_elf(kernel_filename, NULL, NULL, NULL,
> -                               &elf_entry, NULL, NULL, NULL, 1, EM_OPENRISC,
> -                               1, 0);
> +                               &elf_entry, NULL, &high_addr, NULL, 1,
> +                               EM_OPENRISC, 1, 0);
>          entry = elf_entry;
>          if (kernel_size < 0) {
>              kernel_size = load_uimage(kernel_filename,
>                                        &entry, NULL, NULL, NULL, NULL);
> +            high_addr = entry + kernel_size;
>          }
>          if (kernel_size < 0) {
>              kernel_size = load_image_targphys(kernel_filename,
>                                                KERNEL_LOAD_ADDR,
>                                                ram_size - KERNEL_LOAD_ADDR);
> +            high_addr = KERNEL_LOAD_ADDR + kernel_size;
>          }
>
>          if (entry <= 0) {
> @@ -168,7 +181,139 @@ static void openrisc_load_kernel(ram_addr_t ram_size,
>              exit(1);
>          }
>          boot_info.bootstrap_pc = entry;
> +
> +        return high_addr;
> +    }
> +    return 0;
> +}
> +
> +static uint32_t openrisc_load_fdt(Or1ksimState *s, hwaddr load_start,
> +    uint64_t mem_size)

Indentation again.

> +{
> +    uint32_t fdt_addr;
> +    int fdtsize = fdt_totalsize(s->fdt);
> +
> +    if (fdtsize <= 0) {
> +        error_report("invalid device-tree");
> +        exit(1);
> +    }
> +
> +    /* We should put fdt right after the kernel */

You change this comment in patch 4 -- I think you might as well
just use that text in this patch to start with.

> +    fdt_addr = ROUND_UP(load_start, 4);
> +
> +    fdt_pack(s->fdt);

fdt_pack() returns an error code -- you should check it.

> +    /* copy in the device tree */
> +    qemu_fdt_dumpdtb(s->fdt, fdtsize);
> +
> +    rom_add_blob_fixed_as("fdt", s->fdt, fdtsize, fdt_addr,
> +                          &address_space_memory);
> +
> +    return fdt_addr;
> +}
> +
> +static void openrisc_create_fdt(Or1ksimState *s,
> +    const struct MemmapEntry *memmap, int num_cpus, uint64_t mem_size,
> +    const char *cmdline)

Indentation.

> +{
> +    void *fdt;
> +    int cpu;
> +    char *nodename;
> +    int pic_ph;
> +
> +    fdt = s->fdt = create_device_tree(&s->fdt_size);
> +    if (!fdt) {
> +        error_report("create_device_tree() failed");
> +        exit(1);
> +    }
> +
> +    qemu_fdt_setprop_string(fdt, "/", "compatible", "opencores,or1ksim");
> +    qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x1);
> +    qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x1);
> +
> +    nodename = g_strdup_printf("/memory@%lx",
> +                               (long)memmap[OR1KSIM_DRAM].base);

Use the appropriate format string macro for the type, rather than
casting to long (here and below).

> +    qemu_fdt_add_subnode(fdt, nodename);
> +    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> +                           memmap[OR1KSIM_DRAM].base, mem_size);
> +    qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
> +    g_free(nodename);
> +
> +    qemu_fdt_add_subnode(fdt, "/cpus");
> +    qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
> +    qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
> +
> +    for (cpu = 0; cpu < num_cpus; cpu++) {
> +        nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
> +        qemu_fdt_add_subnode(fdt, nodename);
> +        qemu_fdt_setprop_string(fdt, nodename, "compatible",
> +                                "opencores,or1200-rtlsvn481");
> +        qemu_fdt_setprop_cell(fdt, nodename, "reg", cpu);
> +        qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
> +                              OR1KSIM_CLK_MHZ);
> +        g_free(nodename);
> +    }
> +
> +    if (num_cpus > 0) {
> +        nodename = g_strdup_printf("/ompic@%lx",
> +                                   (long)memmap[OR1KSIM_OMPIC].base);
> +        qemu_fdt_add_subnode(fdt, nodename);
> +        qemu_fdt_setprop_string(fdt, nodename, "compatible", "openrisc,ompic");
> +        qemu_fdt_setprop_cells(fdt, nodename, "reg",
> +                               memmap[OR1KSIM_OMPIC].base,
> +                               memmap[OR1KSIM_OMPIC].size);
> +        qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
> +        qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells", 0);
> +        qemu_fdt_setprop_cell(fdt, nodename, "interrupts", OR1KSIM_OMPIC_IRQ);
> +        g_free(nodename);
>      }
> +
> +    nodename = (char *)"/pic";
> +    qemu_fdt_add_subnode(fdt, nodename);
> +    pic_ph = qemu_fdt_alloc_phandle(fdt);
> +    qemu_fdt_setprop_string(fdt, nodename, "compatible",
> +                            "opencores,or1k-pic-level");
> +    qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells", 1);
> +    qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
> +    qemu_fdt_setprop_cell(fdt, nodename, "phandle", pic_ph);
> +
> +    qemu_fdt_setprop_cell(fdt, "/", "interrupt-parent", pic_ph);
> +
> +    if (nd_table[0].used) {
> +        nodename = g_strdup_printf("/ethoc@%lx",
> +                                   (long)memmap[OR1KSIM_ETHOC].base);
> +        qemu_fdt_add_subnode(fdt, nodename);
> +        qemu_fdt_setprop_string(fdt, nodename, "compatible", "opencores,ethoc");
> +        qemu_fdt_setprop_cells(fdt, nodename, "reg",
> +                               memmap[OR1KSIM_ETHOC].base,
> +                               memmap[OR1KSIM_ETHOC].size);
> +        qemu_fdt_setprop_cell(fdt, nodename, "interrupts", OR1KSIM_ETHOC_IRQ);
> +        qemu_fdt_setprop(fdt, nodename, "big-endian", NULL, 0);
> +
> +        qemu_fdt_add_subnode(fdt, "/aliases");
> +        qemu_fdt_setprop_string(fdt, "/aliases", "enet0", nodename);
> +        g_free(nodename);
> +    }
> +
> +    nodename = g_strdup_printf("/serial@%lx",
> +                               (long)memmap[OR1KSIM_UART].base);
> +    qemu_fdt_add_subnode(fdt, nodename);
> +    qemu_fdt_setprop_string(fdt, nodename, "compatible", "ns16550a");
> +    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> +                           memmap[OR1KSIM_UART].base,
> +                           memmap[OR1KSIM_UART].size);
> +    qemu_fdt_setprop_cell(fdt, nodename, "interrupts", OR1KSIM_UART_IRQ);
> +    qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency", OR1KSIM_CLK_MHZ);
> +    qemu_fdt_setprop(fdt, nodename, "big-endian", NULL, 0);
> +
> +    qemu_fdt_add_subnode(fdt, "/chosen");
> +    qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", nodename);
> +    if (cmdline) {
> +        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
> +    }
> +
> +    qemu_fdt_setprop_string(fdt, "/aliases", "uart0", nodename);

I think the pattern the hw/arm/virt.c code uses, where the board
code functions that create the UART, interrupt controller, etc
devices on the board also have the code to add FDT nodes for them.
Especially as the board gets new devices added over time, it's easier
to check that the FDT nodes and the devices match up, and you don't
have to awkwardly duplicate control-flow logic like "we only have
an ethernet device if nd_table[0].used". But I won't insist that
you rewrite this.

> +    g_free(nodename);
>  }
>
>  static void openrisc_sim_init(MachineState *machine)
> @@ -178,6 +323,7 @@ static void openrisc_sim_init(MachineState *machine)
>      OpenRISCCPU *cpus[2] = {};
>      Or1ksimState *s = OR1KSIM_MACHINE(machine);
>      MemoryRegion *ram;
> +    hwaddr load_addr;
>      qemu_irq serial_irq;
>      int n;
>      unsigned int smp_cpus = machine->smp.cpus;
> @@ -219,7 +365,11 @@ static void openrisc_sim_init(MachineState *machine)
>      serial_mm_init(get_system_memory(), or1ksim_memmap[OR1KSIM_UART].base, 0,
>                     serial_irq, 115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
>
> -    openrisc_load_kernel(ram_size, kernel_filename);
> +    openrisc_create_fdt(s, or1ksim_memmap, smp_cpus, machine->ram_size,
> +                        machine->kernel_cmdline);
> +
> +    load_addr = openrisc_load_kernel(ram_size, kernel_filename);
> +    boot_info.fdt_addr = openrisc_load_fdt(s, load_addr, machine->ram_size);
>  }

If the user doesn't specify a kernel file, we'll still load the FDT,
at address zero. Is that sensible/intended behaviour ?

thanks
-- PMM

