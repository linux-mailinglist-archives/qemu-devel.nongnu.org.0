Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A95820B13B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 14:19:07 +0200 (CEST)
Received: from localhost ([::1]:59880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jonJy-00016h-EO
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 08:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jonIY-0000Hh-1s; Fri, 26 Jun 2020 08:17:38 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:45506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jonIV-0006xK-OI; Fri, 26 Jun 2020 08:17:37 -0400
Received: by mail-yb1-xb42.google.com with SMTP id y17so2268960ybm.12;
 Fri, 26 Jun 2020 05:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=67Ez5DY/fUov57YVpFUPh8MrsqoaSwT07AfouMX6II4=;
 b=W+gAoS5qrOgDGAj+eMCH+oGveAQqDBuAIwdAGldXN2a6fdJ0XfENOBk/NbweuY0a+1
 vmxF3fi3pO3sbwumEwXFf9ZZGqPq99Z4JLVVqfi2OnThTfXzNhOPPvr3H0w+ukMkmE8M
 q9oCoh7Dhy3AzjJNJdI+Q+GmvmgnloC/zXQltcdJM54DyrukjYvBgylvvlYSExdsSMJm
 VIuX5+Vbpqjy0UHOX8sZsJOniVekvm+RWCP1R9ZtX6z5NaReqOLeGzvAQ2ZDR0bPCYDM
 UsKA5ixISJqkLwvQER5EBOKfsIA3JW2eY9iRPnAlxpK2YtCk+9vOEpn5CzHEmDhEBUtZ
 VOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=67Ez5DY/fUov57YVpFUPh8MrsqoaSwT07AfouMX6II4=;
 b=cRmdm2JAZQnt4ZrUhHWBetFEZKQYxwEtnbFmQtSxCDSEhiSyK9jDClZ1fdDW4f4UEc
 /4/cEPERjjf43Lq/CazIWtvZK8YAhgjGECE83pCGGBfbywo6PQ1pvhs3F0Zvu3bKYmPr
 ZbsafoeS7bAao3nG/f2JtzpkmGzN/2+Jy3NobrZy37DdncHlE+IivX73gLOhuJ0fkCzO
 xjzmZsivdeLpSF41Pw+6QJC3dgFzAiqFeNG9CqT6EtKzOfivSuemmz+LJmFcgUM/yDtF
 OiCmEQ3TgJQZrPU06ejqfnS7QeuE5KCSSqJ8duRUYXoZk/A/0JPgA1dUc9hZosM0E3Sc
 i95g==
X-Gm-Message-State: AOAM533bH5OSM98nsa8YcSnWBsWlJwHAxSfOYpD3BqusbQgi4yUKPIV9
 P17mURKSwZ4ywvd6N3jwteFExnlSY/kX/LCOzhA=
X-Google-Smtp-Source: ABdhPJy7IgSX/qQNKMlWthNglc0rX+xs6uLCzjw9US9nm5saPYnmjDDftYWQNfEZWPWMikcdLrYHjuEAgHaW2HVoRJ0=
X-Received: by 2002:a25:800c:: with SMTP id m12mr4794134ybk.239.1593173854111; 
 Fri, 26 Jun 2020 05:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200626003313.715355-1-atish.patra@wdc.com>
 <20200626003313.715355-4-atish.patra@wdc.com>
In-Reply-To: <20200626003313.715355-4-atish.patra@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 26 Jun 2020 20:17:22 +0800
Message-ID: <CAEUhbmW3yQymuDnbdcKPz80B5ktm=3YUbMFbMnjgKpYthzm02A@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] riscv: Add opensbi firmware dynamic support
To: Atish Patra <atish.patra@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b42;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alexander Richardson <Alexander.Richardson@cl.cam.ac.uk>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Atish,

On Fri, Jun 26, 2020 at 8:33 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> OpenSBI is the default firmware in Qemu and has various firmware loading
> options. Currently, qemu loader uses fw_jump which has a compile time
> pre-defined address where fdt & kernel image must reside. This puts a
> constraint on image size of the Linux kernel depending on the fdt location
> and available memory. However, fw_dynamic allows the loader to specify
> the next stage location (i.e. Linux kernel/U-boot) in memory and other

nits: U-Boot

> configurable boot options available in OpenSBI.
>
> Add support for OpenSBI dynamic firmware loading support. This doesn't
> break existing setup and fw_jump will continue to work as it is. Any
> other firmware will continue to work without any issues as long as it
> doesn't expect anything specific from loader in "a2" register.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/boot.c                 | 39 ++++++++++++++++++++--
>  hw/riscv/sifive_u.c             | 15 +++++++--
>  hw/riscv/spike.c                | 11 +++++--
>  hw/riscv/virt.c                 | 11 +++++--
>  include/hw/riscv/boot.h         |  5 ++-
>  include/hw/riscv/boot_opensbi.h | 58 +++++++++++++++++++++++++++++++++
>  6 files changed, 130 insertions(+), 9 deletions(-)
>  create mode 100644 include/hw/riscv/boot_opensbi.h
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 02c4018a8105..c96249c73c9f 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -25,6 +25,7 @@
>  #include "hw/boards.h"
>  #include "hw/loader.h"
>  #include "hw/riscv/boot.h"
> +#include "hw/riscv/boot_opensbi.h"
>  #include "elf.h"
>  #include "sysemu/device_tree.h"
>  #include "sysemu/qtest.h"
> @@ -33,8 +34,10 @@
>
>  #if defined(TARGET_RISCV32)
>  # define KERNEL_BOOT_ADDRESS 0x80400000
> +#define fw_dynamic_info_data(__val)     cpu_to_le32(__val)
>  #else
>  # define KERNEL_BOOT_ADDRESS 0x80200000
> +#define fw_dynamic_info_data(__val)     cpu_to_le64(__val)
>  #endif
>
>  void riscv_find_and_load_firmware(MachineState *machine,
> @@ -189,14 +192,45 @@ hwaddr riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
>      return fdt_addr;
>  }
>
> +void riscv_rom_copy_firmware_info(hwaddr rom_base, hwaddr rom_size,
> +                              uint32_t reset_vec_size, uint64_t kernel_entry)
> +{
> +    struct fw_dynamic_info dinfo;
> +    uint64_t dinfo_len;

size_t?

> +
> +    dinfo.magic = fw_dynamic_info_data(FW_DYNAMIC_INFO_MAGIC_VALUE);
> +    dinfo.version =  fw_dynamic_info_data(FW_DYNAMIC_INFO_VERSION);

nits: two spaces after =

> +    dinfo.next_mode = fw_dynamic_info_data(FW_DYNAMIC_INFO_NEXT_MODE_S);
> +    dinfo.next_addr = fw_dynamic_info_data(kernel_entry);
> +    dinfo.options = 0;
> +    dinfo.boot_hart = 0;
> +    dinfo_len = sizeof(dinfo);
> +
> +    /**
> +     * copy the dynamic firmware info. This information is specific to
> +     * OpenSBI but doesn't break any other firmware as long as they don't
> +     * expect any certain value in "a2" register.
> +     */
> +    if (dinfo_len > (rom_size - reset_vec_size)) {
> +        error_report("not enough space to store dynamic firmware info");
> +        exit(1);
> +    }
> +
> +    rom_add_blob_fixed_as("mrom.finfo", &dinfo, dinfo_len,
> +                           rom_base + reset_vec_size,
> +                           &address_space_memory);
> +}
> +
>  void riscv_setup_rom_reset_vec(hwaddr start_addr, hwaddr rom_base,
> -                               hwaddr rom_size,
> +                               hwaddr rom_size, uint64_t kernel_entry,
>                                 hwaddr fdt_load_addr, void *fdt)
>  {
>      int i;
> +

This change should be in the 1st patch

>      /* reset vector */
>      uint32_t reset_vec[10] = {
>          0x00000297,                  /* 1:  auipc  t0, %pcrel_hi(fw_dyn) */
> +        0x02828613,                  /*     addi   a2, t0, %pcrel_lo(1b) */
>          0xf1402573,                  /*     csrr   a0, mhartid  */
>  #if defined(TARGET_RISCV32)
>          0x0202a583,                  /*     lw     a1, 32(t0) */
> @@ -206,7 +240,6 @@ void riscv_setup_rom_reset_vec(hwaddr start_addr, hwaddr rom_base,
>          0x0182b283,                  /*     ld     t0, 24(t0) */
>  #endif
>          0x00028067,                  /*     jr     t0 */
> -        0x00000000,
>          start_addr,                  /* start: .dword */
>          0x00000000,
>          fdt_load_addr,               /* fdt_laddr: .dword */
> @@ -220,6 +253,8 @@ void riscv_setup_rom_reset_vec(hwaddr start_addr, hwaddr rom_base,
>      }
>      rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
>                            rom_base, &address_space_memory);
> +    riscv_rom_copy_firmware_info(rom_base, rom_size, sizeof(reset_vec),
> +                                 kernel_entry);
>
>      return;
>  }
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 7d39a4e4ec6d..de25e9ceb0e7 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -380,6 +380,7 @@ static void sifive_u_machine_init(MachineState *machine)
>      target_ulong start_addr = memmap[SIFIVE_U_DRAM].base;
>      int i;
>      hwaddr fdt_load_addr;
> +    uint64_t kernel_entry;
>
>      /* Initialize SoC */
>      object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_RISCV_U_SOC);
> @@ -436,7 +437,7 @@ static void sifive_u_machine_init(MachineState *machine)
>      riscv_find_and_load_firmware(machine, BIOS_FILENAME, start_addr, NULL);
>
>      if (machine->kernel_filename) {
> -        uint64_t kernel_entry = riscv_load_kernel(machine->kernel_filename,
> +        kernel_entry = riscv_load_kernel(machine->kernel_filename,
>                                                    NULL);

nits: NULL not indented correctly. Can be moved to the same line above

>
>          if (machine->initrd_filename) {
> @@ -449,6 +450,12 @@ static void sifive_u_machine_init(MachineState *machine)
>              qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
>                                    end);
>          }
> +    } else {
> +       /*
> +        * If dynamic firmware is used, it doesn't know where is the next mode
> +        * if kernel argument is not set.
> +        */
> +        kernel_entry = 0;
>      }
>
>      /* Compute the fdt load address in dram */
> @@ -459,6 +466,7 @@ static void sifive_u_machine_init(MachineState *machine)
>      uint32_t reset_vec[11] = {
>          s->msel,                       /* MSEL pin state */
>          0x00000297,                    /* 1:  auipc  t0, %pcrel_hi(fw_dyn) */
> +        0x02828613,                  /*     addi   a2, t0, %pcrel_lo(1b) */

nits: /* is not indented correctly

>          0xf1402573,                    /*     csrr   a0, mhartid  */
>  #if defined(TARGET_RISCV32)
>          0x0202a583,                    /*     lw     a1, 32(t0) */
> @@ -468,7 +476,6 @@ static void sifive_u_machine_init(MachineState *machine)
>          0x0182b283,                    /*     ld     t0, 24(t0) */
>  #endif
>          0x00028067,                    /*     jr     t0 */
> -        0x00000000,
>          start_addr,                    /* start: .dword */
>          0x00000000,
>          fdt_load_addr,                 /* fdt_laddr: .dword */
> @@ -482,6 +489,10 @@ static void sifive_u_machine_init(MachineState *machine)
>      }
>      rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
>                            memmap[SIFIVE_U_MROM].base, &address_space_memory);
> +
> +    riscv_rom_copy_firmware_info(memmap[SIFIVE_U_MROM].base,
> +                                 memmap[SIFIVE_U_MROM].size,
> +                                 sizeof(reset_vec), kernel_entry);
>  }
>
>  static bool sifive_u_machine_get_start_in_flash(Object *obj, Error **errp)
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 69f050c07e5a..1ede1a28e6d4 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -164,6 +164,7 @@ static void spike_board_init(MachineState *machine)
>      MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
>      unsigned int smp_cpus = machine->smp.cpus;
>      hwaddr fdt_load_addr;
> +    uint64_t kernel_entry;
>
>      /* Initialize SOC */
>      object_initialize_child(OBJECT(machine), "soc", &s->soc,
> @@ -194,7 +195,7 @@ static void spike_board_init(MachineState *machine)
>                                   htif_symbol_callback);
>
>      if (machine->kernel_filename) {
> -        uint64_t kernel_entry = riscv_load_kernel(machine->kernel_filename,
> +        kernel_entry = riscv_load_kernel(machine->kernel_filename,
>                                                    htif_symbol_callback);

nits: not indented to (

>
>          if (machine->initrd_filename) {
> @@ -207,6 +208,12 @@ static void spike_board_init(MachineState *machine)
>              qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
>                                    end);
>          }
> +    } else {
> +       /*
> +        * If dynamic firmware is used, it doesn't know where is the next mode
> +        * if kernel argument is not set.
> +        */
> +        kernel_entry = 0;
>      }
>
>      /* Compute the fdt load address in dram */
> @@ -214,7 +221,7 @@ static void spike_board_init(MachineState *machine)
>                                     machine->ram_size, s->fdt);
>      /* load the reset vector */
>      riscv_setup_rom_reset_vec(memmap[SPIKE_DRAM].base, memmap[SPIKE_MROM].base,
> -                              memmap[SPIKE_MROM].size,
> +                              memmap[SPIKE_MROM].size, kernel_entry,
>                                fdt_load_addr, s->fdt);
>
>      /* initialize HTIF using symbols found in load_kernel */
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 639e284fc2e3..25ac984e99f0 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -479,6 +479,7 @@ static void virt_machine_init(MachineState *machine)
>      size_t plic_hart_config_len;
>      target_ulong start_addr = memmap[VIRT_DRAM].base;
>      hwaddr fdt_load_addr;
> +    uint64_t kernel_entry;
>      int i;
>      unsigned int smp_cpus = machine->smp.cpus;
>
> @@ -510,7 +511,7 @@ static void virt_machine_init(MachineState *machine)
>                                   memmap[VIRT_DRAM].base, NULL);
>
>      if (machine->kernel_filename) {
> -        uint64_t kernel_entry = riscv_load_kernel(machine->kernel_filename,
> +        kernel_entry = riscv_load_kernel(machine->kernel_filename,
>                                                    NULL);

nits: not indented correctly. Can be moved to above line

>
>          if (machine->initrd_filename) {
> @@ -523,6 +524,12 @@ static void virt_machine_init(MachineState *machine)
>              qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
>                                    end);
>          }
> +    } else {
> +       /*
> +        * If dynamic firmware is used, it doesn't know where is the next mode
> +        * if kernel argument is not set.
> +        */
> +        kernel_entry = 0;
>      }
>
>      if (drive_get(IF_PFLASH, 0, 0)) {
> @@ -538,7 +545,7 @@ static void virt_machine_init(MachineState *machine)
>                                     machine->ram_size, s->fdt);
>      /* load the reset vector */
>      riscv_setup_rom_reset_vec(start_addr, virt_memmap[VIRT_MROM].base,
> -                              virt_memmap[VIRT_MROM].size,
> +                              virt_memmap[VIRT_MROM].size, kernel_entry,
>                                fdt_load_addr, s->fdt);
>
>      /* create PLIC hart topology configuration string */
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index f64fcadd2390..0ccfd2285888 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -37,8 +37,11 @@ hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
>                           uint64_t kernel_entry, hwaddr *start);
>  hwaddr riscv_load_fdt(hwaddr dram_start, uint64_t dram_size,
>                                  void *fdt);
> +void riscv_rom_copy_firmware_info(hwaddr rom_base, hwaddr rom_size,
> +                                  uint32_t reset_vec_size,
> +                                  uint64_t kernel_entry);
>  void riscv_setup_rom_reset_vec(hwaddr saddr, hwaddr rom_base,
> -                               hwaddr rom_size,
> +                               hwaddr rom_size, uint64_t kernel_entry,
>                                 hwaddr fdt_load_addr, void *fdt);
>
>  #endif /* RISCV_BOOT_H */
> diff --git a/include/hw/riscv/boot_opensbi.h b/include/hw/riscv/boot_opensbi.h
> new file mode 100644
> index 000000000000..0d5ddd6c3daf
> --- /dev/null
> +++ b/include/hw/riscv/boot_opensbi.h
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: BSD-2-Clause */
> +/*
> + * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> + *
> + * Based on include/sbi/{fw_dynamic.h,sbi_scratch.h} from the OpenSBI project.
> + */
> +#ifndef OPENSBI_H
> +#define OPENSBI_H
> +
> +/** Expected value of info magic ('OSBI' ascii string in hex) */
> +#define FW_DYNAMIC_INFO_MAGIC_VALUE     0x4942534f
> +
> +/** Maximum supported info version */
> +#define FW_DYNAMIC_INFO_VERSION         0x2
> +
> +/** Possible next mode values */
> +#define FW_DYNAMIC_INFO_NEXT_MODE_U     0x0
> +#define FW_DYNAMIC_INFO_NEXT_MODE_S     0x1
> +#define FW_DYNAMIC_INFO_NEXT_MODE_M     0x3
> +
> +enum sbi_scratch_options {
> +    /** Disable prints during boot */
> +    SBI_SCRATCH_NO_BOOT_PRINTS = (1 << 0),
> +    /** Enable runtime debug prints */
> +    SBI_SCRATCH_DEBUG_PRINTS = (1 << 1),
> +};
> +
> +/** Representation dynamic info passed by previous booting stage */
> +struct fw_dynamic_info {
> +    /** Info magic */
> +    target_long magic;
> +    /** Info version */
> +    target_long version;
> +    /** Next booting stage address */
> +    target_long next_addr;
> +    /** Next booting stage mode */
> +    target_long next_mode;
> +    /** Options for OpenSBI library */
> +    target_long options;
> +    /**
> +     * Preferred boot HART id
> +     *
> +     * It is possible that the previous booting stage uses same link
> +     * address as the FW_DYNAMIC firmware. In this case, the relocation
> +     * lottery mechanism can potentially overwrite the previous booting
> +     * stage while other HARTs are still running in the previous booting
> +     * stage leading to boot-time crash. To avoid this boot-time crash,
> +     * the previous booting stage can specify last HART that will jump
> +     * to the FW_DYNAMIC firmware as the preferred boot HART.
> +     *
> +     * To avoid specifying a preferred boot HART, the previous booting
> +     * stage can set it to -1UL which will force the FW_DYNAMIC firmware
> +     * to use the relocation lottery mechanism.
> +     */
> +    target_long boot_hart;
> +};
> +
> +#endif
> --

Regards,
Bin

