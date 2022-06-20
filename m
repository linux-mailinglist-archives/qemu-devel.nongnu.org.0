Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE776551541
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 12:05:52 +0200 (CEST)
Received: from localhost ([::1]:58890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3EI3-0004z9-Me
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 06:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1o3EED-0003Lf-5L
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:01:59 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:35557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1o3EE9-0004hm-0B
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:01:51 -0400
Received: by mail-lf1-x12d.google.com with SMTP id a29so16428124lfk.2
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 03:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lRpipmCaJsy5hRD6gpSLN+6ObO+68CVYuezbMKvyqS8=;
 b=WiPFd4CqDIYAvhbpCaMf4y8JPPbwiP+CS4zaLECE6PulCkutXuGBjojOfSUNlxJNFU
 GTXazmrfWOtTt2XoPeSqunRaiaqBXpqgg1cEMs03H4Rt6dJ67TPqfPpKamaIxIaOyBzb
 Z77U+YgUKnF6i88kaByXYgAzQUh+UBwMUOXqZbuCLflWZRyQg1FrBVJLW7UJdvtlqhIu
 BvKqO4I8vgXxNLfVrzEQPZW8ECHa2vCCGciQFxXZb6ZrN0etUyH/kyGwGjSK+7WJ9jaS
 oQuJWUeJiwy5IUo6j4KkVDJudLKGtKsC7gERLaxEgPOlvniGP1EcL+7bUC+N7mkqjt1h
 RE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lRpipmCaJsy5hRD6gpSLN+6ObO+68CVYuezbMKvyqS8=;
 b=NhTd7+q0w57IVWRXTPAs6fen5OORbMd91WlY0xRfO28+4hRCzmMwlX/MRM7HLGuyYX
 t1DF8x0Zx6U3cMpOaBHP4/dVUamNRM/WEcgR9/K++ZjmNIzKtEwBB3Sheovy425HCOpC
 MNYvMGv8vuCIoV91vjs+/xSWeKUqzV2qhDsAdxhnapsjnoSUUPu9oYdVKo887ONSHOeJ
 9dOOc4PX4rfXHrUKJaURnSjMF7bwyb8N52xcaLtvToXxR+ZWpLtr6JHuYWsS0NUlVogF
 MZFW2G7kS4QsA5JotEaH/5pFQp3js7PicChv05RFW5nUBAPbUx+RZojbDYEc4TW024T+
 980g==
X-Gm-Message-State: AJIora+cxa6YrDcvvQkmtfBMc/pOXta3S7nq2cT8PHQ0GLoRd0QyWmv0
 bgkjdCx/6pykFShIV782g2V3dZsVHFeYxuXhT9A=
X-Google-Smtp-Source: AGRyM1s/OatxFz0/zBQzVVC2CEoF37cZpmDpK94AuSzDi8a//HoI5wFn5BwbSuL7Ma4+tEmxtHi07a/E8S/RIcd7sbs=
X-Received: by 2002:a19:e007:0:b0:479:6860:2972 with SMTP id
 x7-20020a19e007000000b0047968602972mr12805271lfg.341.1655719305607; Mon, 20
 Jun 2022 03:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220620080451.3711049-1-yangxiaojuan@loongson.cn>
 <20220620080451.3711049-6-yangxiaojuan@loongson.cn>
In-Reply-To: <20220620080451.3711049-6-yangxiaojuan@loongson.cn>
From: chen huacai <zltjiangshi@gmail.com>
Date: Mon, 20 Jun 2022 18:01:33 +0800
Message-ID: <CABDp7VoN4FpKDrKgYoFP60k4J--WeQQ2=Fqyj2NVi614qROCJw@mail.gmail.com>
Subject: Re: [PATCH 5/8] hw/loongarch: Add fdt support
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Cc: qemu-level <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Song Gao <gaosong@loongson.cn>, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, 
 "Michael S. Tsirkin" <mst@redhat.com>, imammedo@redhat.com, ani@anisinha.ca, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Peter Maydell <peter.maydell@linaro.org>, chenhuacai@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=zltjiangshi@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Xiaojuan,

On Mon, Jun 20, 2022 at 4:11 PM Xiaojuan Yang <yangxiaojuan@loongson.cn> wrote:
>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>  hw/loongarch/loongson3.c    | 136 +++++++++++++++++++++++++++++++++++-
>  include/hw/loongarch/virt.h |   4 ++
>  target/loongarch/cpu.c      |   1 +
>  target/loongarch/cpu.h      |   3 +
>  4 files changed, 141 insertions(+), 3 deletions(-)
>
> diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
> index cc449a12ae..146f582dbe 100644
> --- a/hw/loongarch/loongson3.c
> +++ b/hw/loongarch/loongson3.c
> @@ -37,6 +37,129 @@
>  #include "qapi/qapi-visit-common.h"
>  #include "hw/acpi/generic_event_device.h"
>  #include "hw/mem/nvdimm.h"
> +#include "sysemu/device_tree.h"
> +#include <libfdt.h>
> +
> +static void create_fdt(LoongArchMachineState *lams)
> +{
> +    MachineState *ms = MACHINE(lams);
> +
> +    ms->fdt = create_device_tree(&lams->fdt_size);
> +    if (!ms->fdt) {
> +        error_report("create_device_tree() failed");
> +        exit(1);
> +    }
> +
> +    /* Header */
> +    qemu_fdt_setprop_string(ms->fdt, "/", "compatible",
> +                            "linux,dummy-loongson3");
> +    qemu_fdt_setprop_cell(ms->fdt, "/", "#address-cells", 0x2);
> +    qemu_fdt_setprop_cell(ms->fdt, "/", "#size-cells", 0x2);
> +}
> +
> +static void fdt_add_cpu_nodes(const LoongArchMachineState *lams)
> +{
> +    int num;
> +    const MachineState *ms = MACHINE(lams);
> +    int smp_cpus = ms->smp.cpus;
> +
> +    qemu_fdt_add_subnode(ms->fdt, "/cpus");
> +    qemu_fdt_setprop_cell(ms->fdt, "/cpus", "#address-cells", 0x1);
> +    qemu_fdt_setprop_cell(ms->fdt, "/cpus", "#size-cells", 0x0);
> +
> +    /* cpu nodes */
> +    for (num = smp_cpus - 1; num >= 0; num--) {
> +        char *nodename = g_strdup_printf("/cpus/cpu@%d", num);
> +        LoongArchCPU *cpu = LOONGARCH_CPU(qemu_get_cpu(num));
> +
> +        qemu_fdt_add_subnode(ms->fdt, nodename);
> +        qemu_fdt_setprop_string(ms->fdt, nodename, "device_type", "cpu");
> +        qemu_fdt_setprop_string(ms->fdt, nodename, "compatible",
> +                                cpu->dtb_compatible);
> +        qemu_fdt_setprop_cell(ms->fdt, nodename, "reg", num);
> +        qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle",
> +                              qemu_fdt_alloc_phandle(ms->fdt));
> +        g_free(nodename);
> +    }
> +
> +    /*cpu map */
> +    qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
> +
> +    for (num = smp_cpus - 1; num >= 0; num--) {
> +        char *cpu_path = g_strdup_printf("/cpus/cpu@%d", num);
> +        char *map_path;
> +
> +        if (ms->smp.threads > 1) {
> +            map_path = g_strdup_printf(
> +                "/cpus/cpu-map/socket%d/core%d/thread%d",
> +                num / (ms->smp.cores * ms->smp.threads),
> +                (num / ms->smp.threads) % ms->smp.cores,
> +                num % ms->smp.threads);
> +        } else {
> +            map_path = g_strdup_printf(
> +                "/cpus/cpu-map/socket%d/core%d",
> +                num / ms->smp.cores,
> +                num % ms->smp.cores);
> +        }
> +        qemu_fdt_add_path(ms->fdt, map_path);
> +        qemu_fdt_setprop_phandle(ms->fdt, map_path, "cpu", cpu_path);
> +
> +        g_free(map_path);
> +        g_free(cpu_path);
> +    }
> +}
> +
> +static void fdt_add_fw_cfg_node(const LoongArchMachineState *lams)
> +{
> +    char *nodename;
> +    hwaddr base = FW_CFG_ADDR;
> +    const MachineState *ms = MACHINE(lams);
> +
> +    nodename = g_strdup_printf("/fw_cfg@%" PRIx64, base);
> +    qemu_fdt_add_subnode(ms->fdt, nodename);
> +    qemu_fdt_setprop_string(ms->fdt, nodename,
> +                            "compatible", "qemu,fw-cfg-mmio");
> +    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
> +                                 2, base, 2, 0x8);
> +    qemu_fdt_setprop(ms->fdt, nodename, "dma-coherent", NULL, 0);
> +    g_free(nodename);
> +}
> +
> +static void fdt_add_pcie_node(const LoongArchMachineState *lams)
> +{
> +    char *nodename;
> +    hwaddr base_mmio = LS7A_PCI_MEM_BASE;
> +    hwaddr size_mmio = LS7A_PCI_MEM_SIZE;
> +    hwaddr base_pio = LS7A_PCI_IO_BASE;
> +    hwaddr size_pio = LS7A_PCI_IO_SIZE;
> +    hwaddr base_pcie = LS_PCIECFG_BASE;
> +    hwaddr size_pcie = LS_PCIECFG_SIZE;
Why not use LS7A_PCIECFG_BASE or even LS7A_PCI_CFG_BASE to keep consistency?

Huacai

> +    hwaddr base = base_pcie;
> +
> +    const MachineState *ms = MACHINE(lams);
> +
> +    nodename = g_strdup_printf("/pcie@%" PRIx64, base);
> +    qemu_fdt_add_subnode(ms->fdt, nodename);
> +    qemu_fdt_setprop_string(ms->fdt, nodename,
> +                            "compatible", "pci-host-ecam-generic");
> +    qemu_fdt_setprop_string(ms->fdt, nodename, "device_type", "pci");
> +    qemu_fdt_setprop_cell(ms->fdt, nodename, "#address-cells", 3);
> +    qemu_fdt_setprop_cell(ms->fdt, nodename, "#size-cells", 2);
> +    qemu_fdt_setprop_cell(ms->fdt, nodename, "linux,pci-domain", 0);
> +    qemu_fdt_setprop_cells(ms->fdt, nodename, "bus-range", 0,
> +                           PCIE_MMCFG_BUS(LS_PCIECFG_SIZE - 1));
> +    qemu_fdt_setprop(ms->fdt, nodename, "dma-coherent", NULL, 0);
> +    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
> +                                 2, base_pcie, 2, size_pcie);
> +    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "ranges",
> +                                 1, FDT_PCI_RANGE_IOPORT, 2, LS7A_PCI_IO_OFFSET,
> +                                 2, base_pio, 2, size_pio,
> +                                 1, FDT_PCI_RANGE_MMIO, 2, base_mmio,
> +                                 2, base_mmio, 2, size_mmio);
> +    g_free(nodename);
> +    qemu_fdt_dumpdtb(ms->fdt, lams->fdt_size);
> +}
> +
>
>  #define PM_BASE 0x10080000
>  #define PM_SIZE 0x100
> @@ -546,12 +669,12 @@ static void loongarch_init(MachineState *machine)
>          error_report("ram_size must be greater than 1G.");
>          exit(1);
>      }
> -
> +    create_fdt(lams);
>      /* Init CPUs */
>      for (i = 0; i < machine->smp.cpus; i++) {
>          cpu_create(machine->cpu_type);
>      }
> -
> +    fdt_add_cpu_nodes(lams);
>      /* Add memory region */
>      memory_region_init_alias(&lams->lowmem, NULL, "loongarch.lowram",
>                               machine->ram, 0, 256 * MiB);
> @@ -572,12 +695,12 @@ static void loongarch_init(MachineState *machine)
>      firmware_loaded = loongarch_firmware_init(lams);
>      lams->fw_cfg = loongarch_fw_cfg_init(ram_size, machine);
>      rom_set_fw(lams->fw_cfg);
> -
>      if (lams->fw_cfg != NULL) {
>          fw_cfg_add_file(lams->fw_cfg, "etc/memmap",
>                          la_memmap_table,
>                          sizeof(struct la_memmap_entry) * (la_memmap_entries));
>      }
> +    fdt_add_fw_cfg_node(lams);
>      loaderparams.ram_size = ram_size;
>      loaderparams.kernel_filename = machine->kernel_filename;
>      loaderparams.kernel_cmdline = machine->kernel_cmdline;
> @@ -594,6 +717,13 @@ static void loongarch_init(MachineState *machine)
>      loongarch_irq_init(lams);
>      lams->machine_done.notify = virt_machine_done;
>      qemu_add_machine_init_done_notifier(&lams->machine_done);
> +    fdt_add_pcie_node(lams);
> +
> +    /* load fdt */
> +    MemoryRegion *fdt_rom = g_new(MemoryRegion, 1);
> +    memory_region_init_rom(fdt_rom, NULL, "fdt", LA_FDT_SIZE, &error_fatal);
> +    memory_region_add_subregion(get_system_memory(), LA_FDT_BASE, fdt_rom);
> +    rom_add_blob_fixed("fdt", machine->fdt, lams->fdt_size, LA_FDT_BASE);
>  }
>
>  bool loongarch_is_acpi_enabled(LoongArchMachineState *lams)
> diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
> index 63b6917c15..e31ddde045 100644
> --- a/include/hw/loongarch/virt.h
> +++ b/include/hw/loongarch/virt.h
> @@ -28,6 +28,9 @@
>  #define GED_MEM_ADDR (GED_EVT_ADDR + ACPI_GED_EVT_SEL_LEN)
>  #define GED_REG_ADDR (GED_MEM_ADDR + MEMORY_HOTPLUG_IO_LEN)
>
> +#define LA_FDT_BASE             0x1c400000
> +#define LA_FDT_SIZE             0x100000
> +
>  struct LoongArchMachineState {
>      /*< private >*/
>      MachineState parent_obj;
> @@ -45,6 +48,7 @@ struct LoongArchMachineState {
>      char        *oem_id;
>      char        *oem_table_id;
>      DeviceState *acpi_ged;
> +    int fdt_size;
>  };
>
>  #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("virt")
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 4c8f96bc3a..401d3fd30a 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -328,6 +328,7 @@ static void loongarch_la464_initfn(Object *obj)
>          env->cpucfg[i] = 0x0;
>      }
>
> +    cpu->dtb_compatible = "loongarch,Loongson-3A5000";
>      env->cpucfg[0] = 0x14c010;  /* PRID */
>
>      uint32_t data = 0;
> diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
> index 71a5036c3c..ce394c3287 100644
> --- a/target/loongarch/cpu.h
> +++ b/target/loongarch/cpu.h
> @@ -326,6 +326,9 @@ struct ArchCPU {
>      CPUNegativeOffsetState neg;
>      CPULoongArchState env;
>      QEMUTimer timer;
> +
> +    /* 'compatible' string for this CPU for Linux device trees */
> +    const char *dtb_compatible;
>  };
>
>  #define TYPE_LOONGARCH_CPU "loongarch-cpu"
> --
> 2.31.1
>
>


-- 
Huacai Chen

