Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDA51E3690
	for <lists+qemu-devel@lfdr.de>; Wed, 27 May 2020 05:31:52 +0200 (CEST)
Received: from localhost ([::1]:52582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdmnG-0001Zw-TG
	for lists+qemu-devel@lfdr.de; Tue, 26 May 2020 23:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jdmm6-0000yq-Ci; Tue, 26 May 2020 23:30:38 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:34330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jdmm4-0005rH-G3; Tue, 26 May 2020 23:30:37 -0400
Received: by mail-io1-xd41.google.com with SMTP id f3so24459792ioj.1;
 Tue, 26 May 2020 20:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H9c5vosrg7OpNc8DDMnnTJE83mZOR+Gqkdk8wvjM/qA=;
 b=qfOnk3P9YLoFMUoOQfrdh7eg1WKl7p8RfJZVGipqoadynuXzi/Ydw9P7HoWnBy0yt9
 hZPF/3P2U0aP77Egft1qsoHal6rl3NettBkil+76nYsYBGRnkqHYC9f8L9f7iWOSCd6/
 IB3+KxJH4HEf7oRTH5aT989jIeWwfJD2GWbLtqvWQQv2JLSLJNZWi+L2Vm+DD+jb2T6L
 gDV0OxaD5qoMuZMdWcxtuEpmfms5cIEv8m97w2Bf0lzz/tumOxDcq3AF4h/pN4/Ov4Px
 XZ3Qrp9obCRRMSuk3RXmhlqnuAeUWX4cepcdftCVQYQKqDlT7GyqHbxc4ONK6aA9HZSo
 jVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H9c5vosrg7OpNc8DDMnnTJE83mZOR+Gqkdk8wvjM/qA=;
 b=P84333t6oQesbqJ5DIJ8WJUd2fCe2j016N5TMZBEsJ4zrpkHKp83x7PJugBWLaKir7
 7547deRuFhNM5Sv/l0m8ZDJzpr2VfPinm1MGVPSWn4QRuQ5uGNhOo2qyBnXeal+NLbfT
 3IHQn8MmndjSk8j+NFQzISJhivu7QwxI0p/DPvfD49OrbTugn+8PqcOkUTQ3agqJgXSs
 LZ+LDH7pekKNSDTlvmoRyHxP5Hvc5t56pv6X9abwJD8kMhob+SRFBCBQqOPuRFtaIUBw
 E78/hF54ZXHhT9PwolHpr+lo6zpVF7Cran0jBxJyjYdL2WbJI6aHCEJp3h/ocmvyH/dg
 5OgA==
X-Gm-Message-State: AOAM530XCd1REN/x9Go8gRo+xogbjbYYcgiL0+YbB1A3H/EkYELPlRoZ
 ibG4tbxTC+6ILu71jjUrLvZ0xOOuudEENy2Ur4A=
X-Google-Smtp-Source: ABdhPJwkcSqHam8c+GiYsifasOaQ8M5o/sIHIrtPHkVgcSpT3cNGnrrsMkMoRR98Ucxx+eL1Y1KZi7vYZ23eEEEAcHA=
X-Received: by 2002:a5d:9d03:: with SMTP id j3mr6330943ioj.176.1590550234841; 
 Tue, 26 May 2020 20:30:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200516063746.18296-3-anup.patel@wdc.com>
 <mhng-a9ec47e8-e98a-4c33-83db-ed838eb62404@palmerdabbelt-glaptop1>
 <DM6PR04MB6201841F5FB7E714AD77384F8DB40@DM6PR04MB6201.namprd04.prod.outlook.com>
 <CAKmqyKMBCGiWVVgXkWwmeeEZ5TDRZhHPedXeDN177GgavnWCsA@mail.gmail.com>
 <DM6PR04MB620119ACAC68FBBC62CA04BF8DB10@DM6PR04MB6201.namprd04.prod.outlook.com>
In-Reply-To: <DM6PR04MB620119ACAC68FBBC62CA04BF8DB10@DM6PR04MB6201.namprd04.prod.outlook.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 May 2020 20:30:05 -0700
Message-ID: <CAKmqyKNto9qgCn8RroVzEYJKXTCEnnbHs4e_SRg+JSiW4nDaqg@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/riscv: spike: Allow creating multiple sockets
To: Anup Patel <Anup.Patel@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "sagark@eecs.berkeley.edu" <sagark@eecs.berkeley.edu>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Atish Patra <Atish.Patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 at all?

AlistairOn Tue, May 26, 2020 at 7:55 PM Anup Patel <Anup.Patel@wdc.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Alistair Francis <alistair23@gmail.com>
> > Sent: 27 May 2020 06:08
> > To: Anup Patel <Anup.Patel@wdc.com>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>; Peter Maydell
> > <peter.maydell@linaro.org>; qemu-riscv@nongnu.org;
> > sagark@eecs.berkeley.edu; anup@brainfault.org; qemu-devel@nongnu.org;
> > Atish Patra <Atish.Patra@wdc.com>; Alistair Francis
> > <Alistair.Francis@wdc.com>
> > Subject: Re: [PATCH 2/4] hw/riscv: spike: Allow creating multiple sockets
> >
> > On Fri, May 22, 2020 at 3:10 AM Anup Patel <Anup.Patel@wdc.com> wrote:
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Palmer Dabbelt <palmer@dabbelt.com>
> > > > Sent: 22 May 2020 01:46
> > > > To: Anup Patel <Anup.Patel@wdc.com>
> > > > Cc: Peter Maydell <peter.maydell@linaro.org>; Alistair Francis
> > > > <Alistair.Francis@wdc.com>; sagark@eecs.berkeley.edu; Atish Patra
> > > > <Atish.Patra@wdc.com>; anup@brainfault.org; qemu-riscv@nongnu.org;
> > > > qemu-devel@nongnu.org; Anup Patel <Anup.Patel@wdc.com>
> > > > Subject: Re: [PATCH 2/4] hw/riscv: spike: Allow creating multiple
> > > > sockets
> > > >
> > > > On Fri, 15 May 2020 23:37:44 PDT (-0700), Anup Patel wrote:
> > > > > We extend RISC-V spike machine to allow creating a multi-socket
> > machine.
> > > > > Each RISC-V spike machine socket is a set of HARTs and a CLINT instance.
> > > > > Other peripherals are shared between all RISC-V spike machine sockets.
> > > > > We also update RISC-V spike machine device tree to treat each
> > > > > socket as a NUMA node.
> > > > >
> > > > > The number of sockets in RISC-V spike machine can be specified
> > > > > using the "sockets=" sub-option of QEMU "-smp" command-line
> > > > > option. By default, only one socket RISC-V spike machine will be created.
> > > > >
> > > > > Currently, we only allow creating upto maximum 4 sockets with
> > > > > minimum
> > > > > 2 HARTs per socket. In future, this limits can be changed.
> > > > >
> > > > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > > > ---
> > > > >  hw/riscv/spike.c         | 206 ++++++++++++++++++++++++---------------
> > > > >  include/hw/riscv/spike.h |   8 +-
> > > > >  2 files changed, 133 insertions(+), 81 deletions(-)
> > > > >
> > > > > diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c index
> > > > > d5e0103d89..f63c57a87c 100644
> > > > > --- a/hw/riscv/spike.c
> > > > > +++ b/hw/riscv/spike.c
> > > > > @@ -64,9 +64,11 @@ static void create_fdt(SpikeState *s, const
> > > > > struct
> > > > MemmapEntry *memmap,
> > > > >      uint64_t mem_size, const char *cmdline)  {
> > > > >      void *fdt;
> > > > > -    int cpu;
> > > > > -    uint32_t *cells;
> > > > > -    char *nodename;
> > > > > +    int cpu, socket;
> > > > > +    uint32_t *clint_cells;
> > > > > +    unsigned long clint_addr;
> > > > > +    uint32_t cpu_phandle, intc_phandle, phandle = 1;
> > > > > +    char *name, *clint_name, *clust_name, *core_name, *cpu_name,
> > > > > + *intc_name;
> > > > >
> > > > >      fdt = s->fdt = create_device_tree(&s->fdt_size);
> > > > >      if (!fdt) {
> > > > > @@ -88,68 +90,85 @@ static void create_fdt(SpikeState *s, const
> > > > > struct
> > > > MemmapEntry *memmap,
> > > > >      qemu_fdt_setprop_cell(fdt, "/soc", "#size-cells", 0x2);
> > > > >      qemu_fdt_setprop_cell(fdt, "/soc", "#address-cells", 0x2);
> > > > >
> > > > > -    nodename = g_strdup_printf("/memory@%lx",
> > > > > -        (long)memmap[SPIKE_DRAM].base);
> > > > > -    qemu_fdt_add_subnode(fdt, nodename);
> > > > > -    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> > > > > +    name = g_strdup_printf("/memory@%lx",
> > > > (long)memmap[SPIKE_DRAM].base);
> > > > > +    qemu_fdt_add_subnode(fdt, name);
> > > > > +    qemu_fdt_setprop_cells(fdt, name, "reg",
> > > > >          memmap[SPIKE_DRAM].base >> 32, memmap[SPIKE_DRAM].base,
> > > > >          mem_size >> 32, mem_size);
> > > > > -    qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
> > > > > -    g_free(nodename);
> > > > > +    qemu_fdt_setprop_string(fdt, name, "device_type", "memory");
> > > > > +    g_free(name);
> > > > >
> > > > >      qemu_fdt_add_subnode(fdt, "/cpus");
> > > > >      qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
> > > > >          SIFIVE_CLINT_TIMEBASE_FREQ);
> > > > >      qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
> > > > >      qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
> > > > > +    qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
> > > > >
> > > > > -    for (cpu = s->soc.num_harts - 1; cpu >= 0; cpu--) {
> > > > > -        nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
> > > > > -        char *intc = g_strdup_printf("/cpus/cpu@%d/interrupt-controller",
> > cpu);
> > > > > -        char *isa = riscv_isa_string(&s->soc.harts[cpu]);
> > > > > -        qemu_fdt_add_subnode(fdt, nodename);
> > > > > +    for (socket = (s->num_socs - 1); socket >= 0; socket--) {
> > > > > +        clust_name = g_strdup_printf("/cpus/cpu-map/cluster0%d", socket);
> > > > > +        qemu_fdt_add_subnode(fdt, clust_name);
> > > > > +
> > > > > +        clint_cells =  g_new0(uint32_t, s->soc[socket].num_harts
> > > > > + * 4);
> > > > > +
> > > > > +        for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
> > > > > +            cpu_phandle = phandle++;
> > > > > +
> > > > > +            cpu_name = g_strdup_printf("/cpus/cpu@%d",
> > > > > +                s->soc[socket].hartid_base + cpu);
> > > > > +            qemu_fdt_add_subnode(fdt, cpu_name);
> > > > >  #if defined(TARGET_RISCV32)
> > > > > -        qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv32");
> > > > > +            qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type",
> > > > > + "riscv,sv32");
> > > > >  #else
> > > > > -        qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
> > > > > +            qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type",
> > > > > + "riscv,sv48");
> > > > >  #endif
> > > > > -        qemu_fdt_setprop_string(fdt, nodename, "riscv,isa", isa);
> > > > > -        qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv");
> > > > > -        qemu_fdt_setprop_string(fdt, nodename, "status", "okay");
> > > > > -        qemu_fdt_setprop_cell(fdt, nodename, "reg", cpu);
> > > > > -        qemu_fdt_setprop_string(fdt, nodename, "device_type", "cpu");
> > > > > -        qemu_fdt_add_subnode(fdt, intc);
> > > > > -        qemu_fdt_setprop_cell(fdt, intc, "phandle", 1);
> > > > > -        qemu_fdt_setprop_string(fdt, intc, "compatible", "riscv,cpu-intc");
> > > > > -        qemu_fdt_setprop(fdt, intc, "interrupt-controller", NULL, 0);
> > > > > -        qemu_fdt_setprop_cell(fdt, intc, "#interrupt-cells", 1);
> > > > > -        g_free(isa);
> > > > > -        g_free(intc);
> > > > > -        g_free(nodename);
> > > > > -    }
> > > > > +            name = riscv_isa_string(&s->soc[socket].harts[cpu]);
> > > > > +            qemu_fdt_setprop_string(fdt, cpu_name, "riscv,isa", name);
> > > > > +            g_free(name);
> > > > > +            qemu_fdt_setprop_string(fdt, cpu_name, "compatible", "riscv");
> > > > > +            qemu_fdt_setprop_string(fdt, cpu_name, "status", "okay");
> > > > > +            qemu_fdt_setprop_cell(fdt, cpu_name, "reg",
> > > > > +                s->soc[socket].hartid_base + cpu);
> > > > > +            qemu_fdt_setprop_string(fdt, cpu_name, "device_type", "cpu");
> > > > > +            qemu_fdt_setprop_cell(fdt, cpu_name, "phandle",
> > > > > + cpu_phandle);
> > > > > +
> > > > > +            intc_name = g_strdup_printf("%s/interrupt-controller",
> > cpu_name);
> > > > > +            qemu_fdt_add_subnode(fdt, intc_name);
> > > > > +            intc_phandle = phandle++;
> > > > > +            qemu_fdt_setprop_cell(fdt, intc_name, "phandle", intc_phandle);
> > > > > +            qemu_fdt_setprop_string(fdt, intc_name, "compatible",
> > > > > +                "riscv,cpu-intc");
> > > > > +            qemu_fdt_setprop(fdt, intc_name, "interrupt-controller", NULL,
> > 0);
> > > > > +            qemu_fdt_setprop_cell(fdt, intc_name,
> > > > > + "#interrupt-cells", 1);
> > > > > +
> > > > > +            clint_cells[cpu * 4 + 0] = cpu_to_be32(intc_phandle);
> > > > > +            clint_cells[cpu * 4 + 1] = cpu_to_be32(IRQ_M_SOFT);
> > > > > +            clint_cells[cpu * 4 + 2] = cpu_to_be32(intc_phandle);
> > > > > +            clint_cells[cpu * 4 + 3] = cpu_to_be32(IRQ_M_TIMER);
> > > > > +
> > > > > +            core_name = g_strdup_printf("%s/core%d", clust_name, cpu);
> > > > > +            qemu_fdt_add_subnode(fdt, core_name);
> > > > > +            qemu_fdt_setprop_cell(fdt, core_name, "cpu",
> > > > > + cpu_phandle);
> > > > > +
> > > > > +            g_free(core_name);
> > > > > +            g_free(intc_name);
> > > > > +            g_free(cpu_name);
> > > > > +        }
> > > > >
> > > > > -    cells =  g_new0(uint32_t, s->soc.num_harts * 4);
> > > > > -    for (cpu = 0; cpu < s->soc.num_harts; cpu++) {
> > > > > -        nodename =
> > > > > -            g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
> > > > > -        uint32_t intc_phandle = qemu_fdt_get_phandle(fdt, nodename);
> > > > > -        cells[cpu * 4 + 0] = cpu_to_be32(intc_phandle);
> > > > > -        cells[cpu * 4 + 1] = cpu_to_be32(IRQ_M_SOFT);
> > > > > -        cells[cpu * 4 + 2] = cpu_to_be32(intc_phandle);
> > > > > -        cells[cpu * 4 + 3] = cpu_to_be32(IRQ_M_TIMER);
> > > > > -        g_free(nodename);
> > > > > +        clint_addr = memmap[SPIKE_CLINT].base +
> > > > > +            (memmap[SPIKE_CLINT].size * socket);
> > > > > +        clint_name = g_strdup_printf("/soc/clint@%lx", clint_addr);
> > > > > +        qemu_fdt_add_subnode(fdt, clint_name);
> > > > > +        qemu_fdt_setprop_string(fdt, clint_name, "compatible",
> > "riscv,clint0");
> > > > > +        qemu_fdt_setprop_cells(fdt, clint_name, "reg",
> > > > > +            0x0, clint_addr, 0x0, memmap[SPIKE_CLINT].size);
> > > > > +        qemu_fdt_setprop(fdt, clint_name, "interrupts-extended",
> > > > > +            clint_cells, s->soc[socket].num_harts *
> > > > > + sizeof(uint32_t)
> > > > > + * 4);
> > > > > +
> > > > > +        g_free(clint_name);
> > > > > +        g_free(clint_cells);
> > > > > +        g_free(clust_name);
> > > > >      }
> > > > > -    nodename = g_strdup_printf("/soc/clint@%lx",
> > > > > -        (long)memmap[SPIKE_CLINT].base);
> > > > > -    qemu_fdt_add_subnode(fdt, nodename);
> > > > > -    qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv,clint0");
> > > > > -    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> > > > > -        0x0, memmap[SPIKE_CLINT].base,
> > > > > -        0x0, memmap[SPIKE_CLINT].size);
> > > > > -    qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
> > > > > -        cells, s->soc.num_harts * sizeof(uint32_t) * 4);
> > > > > -    g_free(cells);
> > > > > -    g_free(nodename);
> > > > >
> > > > >      if (cmdline) {
> > > > >          qemu_fdt_add_subnode(fdt, "/chosen"); @@ -160,23 +179,51
> > > > > @@ static void create_fdt(SpikeState *s, const struct MemmapEntry
> > > > > *memmap,  static void spike_board_init(MachineState *machine)  {
> > > > >      const struct MemmapEntry *memmap = spike_memmap;
> > > > > -
> > > > >      SpikeState *s = g_new0(SpikeState, 1);
> > > > >      MemoryRegion *system_memory = get_system_memory();
> > > > >      MemoryRegion *main_mem = g_new(MemoryRegion, 1);
> > > > >      MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
> > > > >      int i;
> > > > > +    char *soc_name;
> > > > >      unsigned int smp_cpus = machine->smp.cpus;
> > > > > -
> > > > > -    /* Initialize SOC */
> > > > > -    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
> > > > > -                            TYPE_RISCV_HART_ARRAY, &error_abort, NULL);
> > > > > -    object_property_set_str(OBJECT(&s->soc), machine->cpu_type, "cpu-
> > > > type",
> > > > > -                            &error_abort);
> > > > > -    object_property_set_int(OBJECT(&s->soc), smp_cpus, "num-harts",
> > > > > -                            &error_abort);
> > > > > -    object_property_set_bool(OBJECT(&s->soc), true, "realized",
> > > > > -                            &error_abort);
> > > > > +    unsigned int base_hartid, cpus_per_socket;
> > > > > +
> > > > > +    s->num_socs = machine->smp.sockets;
> > > > > +
> > > > > +    /* Ensure minumum required CPUs per socket */
> > > > > +    if ((smp_cpus / s->num_socs) < SPIKE_CPUS_PER_SOCKET_MIN)
> > > > > +        s->num_socs = 1;
> > > >
> > > > Why?  It seems like creating single-hart sockets would be a good
> > > > test case, and I'm pretty sure it's a configuration that we had in embedded
> > systems.
> > >
> > > Yes, single-hart sockets are sensible for testing software.
> > >
> > > When "sockets=" sub-option is not provided in "-smp " command line
> > > options, the machine->smp.sockets is set same as machine->smp.cpus by
> > > smp_parse() function in hw/core/machine.c. This means by default we
> > > will always get single-hart per socket. In other words, "-smp 4" will
> > > be 4 cpus and 4 sockets. This is counter intuitive for users because
> > > when "sockets=" is not provided we should default to single socket
> > > irrespective to number of cpus.
> > >
> > > I had added SPIKE_CPUS_PER_SOCKET_MIN to handle the default case when
> > > no "sockets=" sub-option is provided.
> > >
> > > Alternate approach will be:
> > > 1. Add more members in struct CpuTopology of include/hw/boards.h
> > >     to help us know whether "sockets=" option was passed or not 2.
> > > Update smp_parse() for new members in struct CpuTopology 3. Assume
> > > single-socket machine in QEMU RISC-V virt and QEMU
> > >     RISC-V spike machines when "sockets=" option was not passed
> > >
> > > Suggestions ??
> > >
> >
> > I think it makes sense to just stick to what smp_parse() does. That's what QEMU
> > users are used to so we should follow that.
> >
> > I agree it is strange that is specifying `-smp x' you will get max_cpus number of
> > sockets and split the CPUs via them, but that's what every other board (besides
> > x86) does.
>
> So we are fine with SPIKE_CPUS_PER_SOCKET_MIN=2 for now, right ??

Why do we need SPIKE_CPUS_PER_SOCKET_MIN at all?

Alistair

>
> Regards,
> Anup

