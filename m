Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7ECE9B5AA
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 19:43:02 +0200 (CEST)
Received: from localhost ([::1]:60400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1DaX-0007Yk-Ov
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 13:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60220)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1i1DYb-0006qg-LN
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:41:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1i1DYZ-0000Zc-Ub
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:41:01 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:37449)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1i1DYZ-0000Wo-Iy; Fri, 23 Aug 2019 13:40:59 -0400
Received: by mail-lj1-x241.google.com with SMTP id t14so9629008lji.4;
 Fri, 23 Aug 2019 10:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LMENF7FWgo75beYxa0vgWibr2dxagpjucaBDwhg/kfs=;
 b=dckFEMbwvwCqSaU3Jf2F5Aqj79kWBbZPsQWy6IZ2ZRxecHD6Vdn9Z50JirwS/rar87
 Q3JUZ4kDwQOiKvMB6tZppmktHzxW90xD2sYfNCu9JktxVaItrvWpDZj046a9JmWSXq8B
 P46BX3hUNzrbC2V9aL6AY8tPAmGH8Etgu9nXqukCCyHkvh60Z/H9iQmHANuUbqJEfkwK
 8MpaTBSkj5KRwmh+vsZjpL1UME/Pq4AO8iQVhK8h6DUHfWi3M7segf9bQ32vPNX9cL9M
 vBCVEXqChic0078Tj4MNEsDh2o8WDH/JiFGkmdZf0ZrFyumbx1wfeUTMfCKj7PNbR+z2
 8+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LMENF7FWgo75beYxa0vgWibr2dxagpjucaBDwhg/kfs=;
 b=Vij52ZKnWtXmj3rqd5/MzG1wTNqkKP3bHArD/qkSOhPA2Mb7hrdnhlw+YJRLx44VFp
 ArbncAvx6AsHiPxprR/NzptdzRAr+sGUFJApLgTCscLLdGu9X6FWCMy65e7e0Vm6JPyE
 Ix6dMeoEIAD/jfrtEIUxs2KZA17HjkBoaGY8t6Ll9AJ3JJ85nVeG0vF0JuzqfaM6W68L
 V75VDeKP/YskCXhp9ob8Vk+3WrXZPIhAN5cCJzgJCFtWT217pIrkW8de368w3ppno15f
 vhBAgLfk0eyRR2dLXZSlx7ZWuA8oECSqjSqchq/rqoaU9q0K3menLT6pcjDOYVEFzp/w
 Yqmg==
X-Gm-Message-State: APjAAAW/rq+hpjq01ETsLylLMeWtickC6ktLlI4F3trUK+RAESCFW/fG
 cbsZ5LIoO3pum4tlYhh8qTwY37429PaHegXl2r0=
X-Google-Smtp-Source: APXvYqw8vOceAH2Ef/DUDseEX9LJ1EkMhvcE5GHB4hlEiHcSePzMiZ+FC7Drsf/DVfXkBgcxlpwqCx8wcmQ4KvC0Z3s=
X-Received: by 2002:a2e:8102:: with SMTP id d2mr3702709ljg.58.1566582057803;
 Fri, 23 Aug 2019 10:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <1566537069-22741-1-git-send-email-bmeng.cn@gmail.com>
 <1566537069-22741-17-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1566537069-22741-17-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Aug 2019 10:36:51 -0700
Message-ID: <CAKmqyKOiQ1Tjn5s=fM3nbavSRGLq-Ljv8mrR-C12E2iwctNkzw@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-devel] [PATCH v5 16/30] riscv: sifive_u: Update hart
 configuration to reflect the real FU540 SoC
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 22, 2019 at 10:29 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> The FU540-C000 includes a 64-bit E51 RISC-V core and four 64-bit U54
> RISC-V cores. Currently the sifive_u machine only populates 4 U54
> cores. Update the max cpu number to 5 to reflect the real hardware,
> by creating 2 CPU clusters as containers for RISC-V hart arrays to
> populate heterogeneous harts.
>
> The cpu nodes in the generated DTS have been updated as well.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> ---
>
> Changes in v5: None
> Changes in v4:
> - changed to create clusters for each cpu type
>
> Changes in v3:
> - changed to use macros for management and compute cpu count
>
> Changes in v2:
> - fixed the "interrupts-extended" property size
>
>  hw/riscv/sifive_u.c         | 102 +++++++++++++++++++++++++++++++++-----------
>  include/hw/riscv/sifive_u.h |   8 +++-
>  2 files changed, 84 insertions(+), 26 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 3f58f61..0e5bbe7 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -10,7 +10,8 @@
>   * 1) CLINT (Core Level Interruptor)
>   * 2) PLIC (Platform Level Interrupt Controller)
>   *
> - * This board currently uses a hardcoded devicetree that indicates one hart.
> + * This board currently generates devicetree dynamically that indicates at most
> + * five harts.
>   *
>   * This program is free software; you can redistribute it and/or modify it
>   * under the terms and conditions of the GNU General Public License,
> @@ -26,6 +27,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/cutils.h"
>  #include "qemu/log.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
> @@ -34,6 +36,7 @@
>  #include "hw/loader.h"
>  #include "hw/sysbus.h"
>  #include "hw/char/serial.h"
> +#include "hw/cpu/cluster.h"
>  #include "target/riscv/cpu.h"
>  #include "hw/riscv/riscv_hart.h"
>  #include "hw/riscv/sifive_plic.h"
> @@ -69,6 +72,7 @@ static const struct MemmapEntry {
>  static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>      uint64_t mem_size, const char *cmdline)
>  {
> +    MachineState *ms = MACHINE(qdev_get_machine());
>      void *fdt;
>      int cpu;
>      uint32_t *cells;
> @@ -109,15 +113,21 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
>
> -    for (cpu = s->soc.cpus.num_harts - 1; cpu >= 0; cpu--) {
> +    for (cpu = ms->smp.cpus - 1; cpu >= 0; cpu--) {
>          int cpu_phandle = phandle++;
>          nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
>          char *intc = g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
> -        char *isa = riscv_isa_string(&s->soc.cpus.harts[cpu]);
> +        char *isa;
>          qemu_fdt_add_subnode(fdt, nodename);
>          qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
>                                SIFIVE_U_CLOCK_FREQ);
> -        qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
> +        /* cpu 0 is the management hart that does not have mmu */
> +        if (cpu != 0) {
> +            qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
> +            isa = riscv_isa_string(&s->soc.u_cpus.harts[cpu - 1]);
> +        } else {
> +            isa = riscv_isa_string(&s->soc.e_cpus.harts[0]);
> +        }
>          qemu_fdt_setprop_string(fdt, nodename, "riscv,isa", isa);
>          qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv");
>          qemu_fdt_setprop_string(fdt, nodename, "status", "okay");
> @@ -133,8 +143,8 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>          g_free(nodename);
>      }
>
> -    cells =  g_new0(uint32_t, s->soc.cpus.num_harts * 4);
> -    for (cpu = 0; cpu < s->soc.cpus.num_harts; cpu++) {
> +    cells =  g_new0(uint32_t, ms->smp.cpus * 4);
> +    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
>          nodename =
>              g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
>          uint32_t intc_phandle = qemu_fdt_get_phandle(fdt, nodename);
> @@ -152,20 +162,26 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>          0x0, memmap[SIFIVE_U_CLINT].base,
>          0x0, memmap[SIFIVE_U_CLINT].size);
>      qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
> -        cells, s->soc.cpus.num_harts * sizeof(uint32_t) * 4);
> +        cells, ms->smp.cpus * sizeof(uint32_t) * 4);
>      g_free(cells);
>      g_free(nodename);
>
>      plic_phandle = phandle++;
> -    cells =  g_new0(uint32_t, s->soc.cpus.num_harts * 4);
> -    for (cpu = 0; cpu < s->soc.cpus.num_harts; cpu++) {
> +    cells =  g_new0(uint32_t, ms->smp.cpus * 4 - 2);
> +    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
>          nodename =
>              g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
>          uint32_t intc_phandle = qemu_fdt_get_phandle(fdt, nodename);
> -        cells[cpu * 4 + 0] = cpu_to_be32(intc_phandle);
> -        cells[cpu * 4 + 1] = cpu_to_be32(IRQ_M_EXT);
> -        cells[cpu * 4 + 2] = cpu_to_be32(intc_phandle);
> -        cells[cpu * 4 + 3] = cpu_to_be32(IRQ_S_EXT);
> +        /* cpu 0 is the management hart that does not have S-mode */
> +        if (cpu == 0) {
> +            cells[0] = cpu_to_be32(intc_phandle);
> +            cells[1] = cpu_to_be32(IRQ_M_EXT);
> +        } else {
> +            cells[cpu * 4 - 2] = cpu_to_be32(intc_phandle);
> +            cells[cpu * 4 - 1] = cpu_to_be32(IRQ_M_EXT);
> +            cells[cpu * 4 + 0] = cpu_to_be32(intc_phandle);
> +            cells[cpu * 4 + 1] = cpu_to_be32(IRQ_S_EXT);
> +        }
>          g_free(nodename);
>      }
>      nodename = g_strdup_printf("/soc/interrupt-controller@%lx",
> @@ -175,7 +191,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>      qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv,plic0");
>      qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
>      qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
> -        cells, s->soc.cpus.num_harts * sizeof(uint32_t) * 4);
> +        cells, (ms->smp.cpus * 4 - 2) * sizeof(uint32_t));
>      qemu_fdt_setprop_cells(fdt, nodename, "reg",
>          0x0, memmap[SIFIVE_U_PLIC].base,
>          0x0, memmap[SIFIVE_U_PLIC].size);
> @@ -338,12 +354,39 @@ static void riscv_sifive_u_soc_init(Object *obj)
>      MachineState *ms = MACHINE(qdev_get_machine());
>      SiFiveUSoCState *s = RISCV_U_SOC(obj);
>
> -    object_initialize_child(obj, "cpus", &s->cpus, sizeof(s->cpus),
> -                            TYPE_RISCV_HART_ARRAY, &error_abort, NULL);
> -    object_property_set_str(OBJECT(&s->cpus), SIFIVE_U_CPU, "cpu-type",
> -                            &error_abort);
> -    object_property_set_int(OBJECT(&s->cpus), ms->smp.cpus, "num-harts",
> -                            &error_abort);
> +    object_initialize_child(obj, "e-cluster", &s->e_cluster,
> +                            sizeof(s->e_cluster), TYPE_CPU_CLUSTER,
> +                            &error_abort, NULL);
> +    qdev_prop_set_uint32(DEVICE(&s->e_cluster), "cluster-id", 0);
> +
> +    object_initialize_child(OBJECT(&s->e_cluster), "e-cpus",
> +                            &s->e_cpus, sizeof(s->e_cpus),
> +                            TYPE_RISCV_HART_ARRAY, &error_abort,
> +                            NULL);
> +    object_property_set_uint(OBJECT(&s->e_cpus), 1,
> +                             "num-harts", &error_abort);
> +    object_property_set_uint(OBJECT(&s->e_cpus), 0,
> +                             "hartid-base", &error_abort);
> +    object_property_set_str(OBJECT(&s->e_cpus), SIFIVE_E_CPU,
> +                            "cpu-type", &error_abort);
> +
> +    if (ms->smp.cpus > 1) {

I don't think this is right.

If a user specifies -smp 1 for the SiFive U machine, it seems unlikey
they just want the power management CPU and don't care about the U
cores.

The fix to this is to add a minimum CPU count of 2 which we can do.
From memory you had this originally and I said to remove it.

The problem with that though is then we force everyone to use at least
2 CPUs, which I don't like. It can be very useful to run -smp 1
sometimes.

So, I see two options:
 1. Just set the minimum and default CPUs to 2 and just live with 2
CPUs all the time
 2. Have some setup where -smp < x means no E CPU and -smp > x means
with the E cpu. From memory this is what the Xilinx ZynqMP boards do.
x would probably be 4 in this case, but it could also be 2

I'm ok with both options, I'm leaning towards option 2 though unless
it ends up being too confusing for users. In saying that I think
either is acceptable so it's up to you Bin.

Alistair

> +        object_initialize_child(obj, "u-cluster", &s->u_cluster,
> +                                sizeof(s->u_cluster), TYPE_CPU_CLUSTER,
> +                                &error_abort, NULL);
> +        qdev_prop_set_uint32(DEVICE(&s->u_cluster), "cluster-id", 1);
> +
> +        object_initialize_child(OBJECT(&s->u_cluster), "u-cpus",
> +                                &s->u_cpus, sizeof(s->u_cpus),
> +                                TYPE_RISCV_HART_ARRAY, &error_abort,
> +                                NULL);
> +        object_property_set_uint(OBJECT(&s->u_cpus), ms->smp.cpus - 1,
> +                                 "num-harts", &error_abort);
> +        object_property_set_uint(OBJECT(&s->u_cpus), 1,
> +                                 "hartid-base", &error_abort);
> +        object_property_set_str(OBJECT(&s->u_cpus), SIFIVE_U_CPU,
> +                                "cpu-type", &error_abort);
> +    }
>
>      sysbus_init_child_obj(obj, "gem", &s->gem, sizeof(s->gem),
>                            TYPE_CADENCE_GEM);
> @@ -363,7 +406,19 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
>      Error *err = NULL;
>      NICInfo *nd = &nd_table[0];
>
> -    object_property_set_bool(OBJECT(&s->cpus), true, "realized",
> +    object_property_set_bool(OBJECT(&s->e_cpus), true, "realized",
> +                             &error_abort);
> +    object_property_set_bool(OBJECT(&s->u_cpus), true, "realized",
> +                             &error_abort);
> +    /*
> +     * The cluster must be realized after the RISC-V hart array container,
> +     * as the container's CPU object is only created on realize, and the
> +     * CPU must exist and have been parented into the cluster before the
> +     * cluster is realized.
> +     */
> +    object_property_set_bool(OBJECT(&s->e_cluster), true, "realized",
> +                             &error_abort);
> +    object_property_set_bool(OBJECT(&s->u_cluster), true, "realized",
>                               &error_abort);
>
>      /* boot rom */
> @@ -429,10 +484,7 @@ static void riscv_sifive_u_machine_init(MachineClass *mc)
>  {
>      mc->desc = "RISC-V Board compatible with SiFive U SDK";
>      mc->init = riscv_sifive_u_init;
> -    /* The real hardware has 5 CPUs, but one of them is a small embedded power
> -     * management CPU.
> -     */
> -    mc->max_cpus = 4;
> +    mc->max_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + SIFIVE_U_COMPUTE_CPU_COUNT;
>  }
>
>  DEFINE_MACHINE("sifive_u", riscv_sifive_u_machine_init)
> diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> index 4abc621..7a1a4f3 100644
> --- a/include/hw/riscv/sifive_u.h
> +++ b/include/hw/riscv/sifive_u.h
> @@ -31,7 +31,10 @@ typedef struct SiFiveUSoCState {
>      SysBusDevice parent_obj;
>
>      /*< public >*/
> -    RISCVHartArrayState cpus;
> +    CPUClusterState e_cluster;
> +    CPUClusterState u_cluster;
> +    RISCVHartArrayState e_cpus;
> +    RISCVHartArrayState u_cpus;
>      DeviceState *plic;
>      CadenceGEMState gem;
>  } SiFiveUSoCState;
> @@ -68,6 +71,9 @@ enum {
>      SIFIVE_U_GEM_CLOCK_FREQ = 125000000
>  };
>
> +#define SIFIVE_U_MANAGEMENT_CPU_COUNT   1
> +#define SIFIVE_U_COMPUTE_CPU_COUNT      4
> +
>  #define SIFIVE_U_PLIC_HART_CONFIG "MS"
>  #define SIFIVE_U_PLIC_NUM_SOURCES 54
>  #define SIFIVE_U_PLIC_NUM_PRIORITIES 7
> --
> 2.7.4
>
>

