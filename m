Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 563AF551552
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 12:07:56 +0200 (CEST)
Received: from localhost ([::1]:33200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3EK3-0006hC-EE
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 06:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1o3EGW-0004aA-GU
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:04:17 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:38803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1o3EGU-0004yN-GH
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:04:16 -0400
Received: by mail-lj1-x22f.google.com with SMTP id a11so2534072ljb.5
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 03:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hp+1LnjMgf5PJiurHEQZA/YtvvUeAljK12a0JyytHFU=;
 b=l5wOk5LZ9Hn9i7ClQhpoWjAwIjvOi4Jv52PjcvjZm9WL6v1vMjUrU5T/HLrhFtWptK
 aIott2GsgA+299K45Yjt6yz1MSP9y2iHRmVQtGV4rY4Yo0t6gWgnpPqA6jETpR+nz9RM
 KOMIlqm4n3QMsmV53k4aQEzYR1DPy3XXQCwJquE5ToMlGwk43Wx0p+SyblzSsSGXSl3m
 f6qt+6AicIobl/AtCvuS0Qnsu9xYocMQBlm1KORRs00CXR8g21oz85LAecg1fbs2VRiP
 to4IoX5bKZ4xC3M/K1ImCjzOc60Z6S4QL/yq5J+7mBHcTFKR6KHhoB55yWn5Po62NnGG
 xhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hp+1LnjMgf5PJiurHEQZA/YtvvUeAljK12a0JyytHFU=;
 b=7XuGgK7yHPb+iDBktlWExXra+6qcKRC4A8Kt0SI2XU2Oyf6GK1jDgnZWPOM5zBQdt/
 XxE7PkP2eFd+jrEn1wO1SqhmcFF8sYFuWC8zmoTfvtkaQoe9oP+9SdVT/QHYaTSo/QQY
 ZmDbc7TbgJecRbvxxv8GsKTmnMVrPVBeWGHahVW/r1nLAQMRBPUgbE1AxDGLi1dsdcbm
 hboxmKW93o69iHzqhEfY8omKPMnBoxw540GZwxTwJ5FEReaIY/zTKHfnRsxV+zgOegRR
 FRsyIyPgj/i3AQqKeT8GhY6zLCh3ZFFDCIZ8CG4v81XrGuG0r4ii2qOoXSrKbkQBT8/x
 jGTQ==
X-Gm-Message-State: AJIora/4sb0UFPGWp93/XZgXq2dStsphDWIKjb6fJAwgNuqk7eY+uCWQ
 //xLPmFXzgk4935PfZN8MTrBiQgguxpVoUfdTRc=
X-Google-Smtp-Source: AGRyM1t3lNvq0otxVw+kV5B0UUXbKEKWhuNDrGvvdK61v0agvoSjtrW/i2z4ZYd7CGsdvL9fa+BzDPx5A9y30zw7epM=
X-Received: by 2002:a2e:b88e:0:b0:255:953a:8d33 with SMTP id
 r14-20020a2eb88e000000b00255953a8d33mr10898085ljp.38.1655719452717; Mon, 20
 Jun 2022 03:04:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220620080451.3711049-1-yangxiaojuan@loongson.cn>
 <20220620080451.3711049-2-yangxiaojuan@loongson.cn>
In-Reply-To: <20220620080451.3711049-2-yangxiaojuan@loongson.cn>
From: chen huacai <zltjiangshi@gmail.com>
Date: Mon, 20 Jun 2022 18:04:00 +0800
Message-ID: <CABDp7Vp_Z=Ed+S_h0CGhTkEMCUGf1-hKd_v8z7Y7+1qEy-pr_w@mail.gmail.com>
Subject: Re: [PATCH 1/8] hw/loongarch: Add default bios startup support
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Cc: qemu-level <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Song Gao <gaosong@loongson.cn>, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, 
 "Michael S. Tsirkin" <mst@redhat.com>, imammedo@redhat.com, ani@anisinha.ca, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Peter Maydell <peter.maydell@linaro.org>, chenhuacai@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=zltjiangshi@gmail.com; helo=mail-lj1-x22f.google.com
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

On Mon, Jun 20, 2022 at 4:21 PM Xiaojuan Yang <yangxiaojuan@loongson.cn> wrote:
>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>  hw/loongarch/fw_cfg.c       | 33 +++++++++++++++
>  hw/loongarch/fw_cfg.h       | 15 +++++++
>  hw/loongarch/loongson3.c    | 81 ++++++++++++++++++++++++++++++++++++-
>  include/hw/loongarch/virt.h |  7 ++++
>  4 files changed, 135 insertions(+), 1 deletion(-)
>  create mode 100644 hw/loongarch/fw_cfg.c
>  create mode 100644 hw/loongarch/fw_cfg.h
>
> diff --git a/hw/loongarch/fw_cfg.c b/hw/loongarch/fw_cfg.c
> new file mode 100644
> index 0000000000..a641f603b6
> --- /dev/null
> +++ b/hw/loongarch/fw_cfg.c
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * QEMU fw_cfg helpers (LoongArch specific)
> + *
> + * Copyright (C) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/loongarch/fw_cfg.h"
> +#include "hw/loongarch/virt.h"
> +#include "hw/nvram/fw_cfg.h"
> +#include "sysemu/sysemu.h"
> +
> +static void fw_cfg_boot_set(void *opaque, const char *boot_device,
> +                            Error **errp)
> +{
> +    fw_cfg_modify_i16(opaque, FW_CFG_BOOT_DEVICE, boot_device[0]);
> +}
> +
> +FWCfgState *loongarch_fw_cfg_init(ram_addr_t ram_size, MachineState *ms)
> +{
> +    FWCfgState *fw_cfg;
> +    int max_cpus = ms->smp.max_cpus;
> +    int smp_cpus = ms->smp.cpus;
> +
> +    fw_cfg = fw_cfg_init_mem_wide(FW_CFG_ADDR + 8, FW_CFG_ADDR, 8, 0, NULL);
> +    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)max_cpus);
> +    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
> +    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)smp_cpus);
> +
> +    qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
> +    return fw_cfg;
> +}
> diff --git a/hw/loongarch/fw_cfg.h b/hw/loongarch/fw_cfg.h
> new file mode 100644
> index 0000000000..7c0de4db4a
> --- /dev/null
> +++ b/hw/loongarch/fw_cfg.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * QEMU fw_cfg helpers (LoongArch specific)
> + *
> + * Copyright (C) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#ifndef HW_LOONGARCH_FW_CFG_H
> +#define HW_LOONGARCH_FW_CFG_H
> +
> +#include "hw/boards.h"
> +#include "hw/nvram/fw_cfg.h"
> +
> +FWCfgState *loongarch_fw_cfg_init(ram_addr_t ram_size, MachineState *ms);
> +#endif
> diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
> index bd20ebbb78..1e2c69dd8e 100644
> --- a/hw/loongarch/loongson3.c
> +++ b/hw/loongarch/loongson3.c
> @@ -28,13 +28,46 @@
>  #include "hw/pci-host/ls7a.h"
>  #include "hw/pci-host/gpex.h"
>  #include "hw/misc/unimp.h"
> -
> +#include "hw/loongarch/fw_cfg.h"
>  #include "target/loongarch/cpu.h"
>
>  #define PM_BASE 0x10080000
>  #define PM_SIZE 0x100
>  #define PM_CTRL 0x10
>
> +struct la_memmap_entry {
> +    uint64_t address;
> +    uint64_t length;
> +    uint32_t type;
> +    uint32_t reserved;
> +};
> +
> +static struct la_memmap_entry *la_memmap_table;
> +static unsigned la_memmap_entries;
Since they are static, we can drop the la_ prefix here. And if a
prefix is really needed, I prefer loongarch_ or larch rather than la_.

Huacai

> +
> +static int la_memmap_add_entry(uint64_t address, uint64_t length, uint32_t type)
> +{
> +    int i;
> +
> +    for (i = 0; i < la_memmap_entries; i++) {
> +        if (la_memmap_table[i].address == address) {
> +            fprintf(stderr, "%s address:0x%lx length:0x%lx already exists\n",
> +                     __func__, address, length);
> +            return 0;
> +        }
> +    }
> +
> +    la_memmap_table = g_renew(struct la_memmap_entry, la_memmap_table,
> +                                                      la_memmap_entries + 1);
> +    la_memmap_table[la_memmap_entries].address = cpu_to_le64(address);
> +    la_memmap_table[la_memmap_entries].length = cpu_to_le64(length);
> +    la_memmap_table[la_memmap_entries].type = cpu_to_le32(type);
> +    la_memmap_entries++;
> +
> +    return la_memmap_entries;
> +}
> +
> +
>  /*
>   * This is a placeholder for missing ACPI,
>   * and will eventually be replaced.
> @@ -279,6 +312,38 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
>      loongarch_devices_init(pch_pic);
>  }
>
> +static bool loongarch_firmware_init(LoongArchMachineState *lams)
> +{
> +    char *filename = MACHINE(lams)->firmware;
> +    char *bios_name = NULL;
> +    bool loaded = false;
> +    int bios_size;
> +
> +    if (filename) {
> +        bios_name = qemu_find_file(QEMU_FILE_TYPE_BIOS, filename);
> +        if (!bios_name) {
> +            error_report("Could not find ROM image '%s'", filename);
> +            exit(1);
> +        }
> +
> +        bios_size = load_image_targphys(bios_name, LA_BIOS_BASE, LA_BIOS_SIZE);
> +        if (bios_size < 0) {
> +            error_report("Could not load ROM image '%s'", bios_name);
> +            exit(1);
> +        }
> +
> +        g_free(bios_name);
> +
> +        memory_region_init_ram(&lams->bios, NULL, "loongarch.bios",
> +                               LA_BIOS_SIZE, &error_fatal);
> +        memory_region_set_readonly(&lams->bios, true);
> +        memory_region_add_subregion(get_system_memory(), LA_BIOS_BASE, &lams->bios);
> +        loaded = true;
> +    }
> +
> +    return loaded;
> +}
> +
>  static void reset_load_elf(void *opaque)
>  {
>      LoongArchCPU *cpu = opaque;
> @@ -301,6 +366,7 @@ static void loongarch_init(MachineState *machine)
>      LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
>      LoongArchCPU *lacpu;
>      int i;
> +    bool firmware_loaded;
>      int64_t kernel_addr = 0;
>
>      if (!cpu_model) {
> @@ -327,15 +393,28 @@ static void loongarch_init(MachineState *machine)
>                               machine->ram, 0, 256 * MiB);
>      memory_region_add_subregion(address_space_mem, offset, &lams->lowmem);
>      offset += 256 * MiB;
> +    la_memmap_add_entry(0, 256 * MiB, 1);
>      highram_size = ram_size - 256 * MiB;
>      memory_region_init_alias(&lams->highmem, NULL, "loongarch.highmem",
>                               machine->ram, offset, highram_size);
>      memory_region_add_subregion(address_space_mem, 0x90000000, &lams->highmem);
> +    la_memmap_add_entry(0x90000000, highram_size, 1);
>      /* Add isa io region */
>      memory_region_init_alias(&lams->isa_io, NULL, "isa-io",
>                               get_system_io(), 0, LOONGARCH_ISA_IO_SIZE);
>      memory_region_add_subregion(address_space_mem, LOONGARCH_ISA_IO_BASE,
>                                  &lams->isa_io);
> +    /* load the BIOS image. */
> +    firmware_loaded = loongarch_firmware_init(lams);
> +    lams->fw_cfg = loongarch_fw_cfg_init(ram_size, machine);
> +    rom_set_fw(lams->fw_cfg);
> +
> +    if (lams->fw_cfg != NULL) {
> +        fw_cfg_add_file(lams->fw_cfg, "etc/memmap",
> +                        la_memmap_table,
> +                        sizeof(struct la_memmap_entry) * (la_memmap_entries));
> +    }
> +
>      if (kernel_filename) {
>          loaderparams.ram_size = ram_size;
>          loaderparams.kernel_filename = kernel_filename;
> diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
> index 09a816191c..448f46fc6b 100644
> --- a/include/hw/loongarch/virt.h
> +++ b/include/hw/loongarch/virt.h
> @@ -17,6 +17,9 @@
>
>  #define LOONGARCH_ISA_IO_BASE   0x18000000UL
>  #define LOONGARCH_ISA_IO_SIZE   0x0004000
> +#define FW_CFG_ADDR             0x1e020000
> +#define LA_BIOS_BASE            0x1c000000
> +#define LA_BIOS_SIZE            (4 * MiB)
>
>  struct LoongArchMachineState {
>      /*< private >*/
> @@ -26,6 +29,10 @@ struct LoongArchMachineState {
>      MemoryRegion lowmem;
>      MemoryRegion highmem;
>      MemoryRegion isa_io;
> +    MemoryRegion bios;
> +
> +    /* State for other subsystems/APIs: */
> +    FWCfgState  *fw_cfg;
>  };
>
>  #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("virt")
> --
> 2.31.1
>
>


-- 
Huacai Chen

