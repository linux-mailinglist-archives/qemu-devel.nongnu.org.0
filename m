Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6DB471FF7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 05:23:01 +0100 (CET)
Received: from localhost ([::1]:57408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwcrc-0003ti-OP
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 23:23:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mwcqF-0003EP-Fl
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 23:21:35 -0500
Received: from [2a00:1450:4864:20::42a] (port=35674
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mwcqA-0005aV-Lr
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 23:21:35 -0500
Received: by mail-wr1-x42a.google.com with SMTP id k9so7082755wrd.2
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 20:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aqYQpxvnS7R1jyEp1Z9ssUsAhykgf8HIHUPNaTyeFYg=;
 b=jHlIXCgWQJmMzUKzLCdAWDrKpgpKzMcAAENz3hPR/odNiUDe7+k/Az4ZISGIBu9gdb
 +K6ZTy5ZpQhWUwjVgt7jTckLdMA0HoyUcdoo2wJFOiBXuN+5CBbKKVTK/ov49ST2VRVW
 YZx5qVzM4UUBWeqULlSg8ZqMp1IpFVXojP+MrI3zgDdOBVeMf8a0aH6kx85Z6+1BsbAr
 g9NwIMC6uTSKPyazPnoWsLfn2sNWZCn5znK64PZdpkQY/uGvty2S0RDsPc/6CAakbEE0
 emX5wYFVPoWD1YJRa/7ClbBP2hCojlkVE2HElbd30V9ruzTrIaPJCp0yjIX32ZffNp7+
 qH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aqYQpxvnS7R1jyEp1Z9ssUsAhykgf8HIHUPNaTyeFYg=;
 b=Jk1HX7P8WStpxdtTS7qw/DhtFOXigUKKq/OuxSAfUof3pXkaBD4LJJIyTnaB7+83TL
 5qNRLOL6TNGE2koMcHGFaeKCCz7vlcKmZ6T7z+uhESlEHrLmDcfG0mwKlh7lxEEjZf/o
 mUlaQLPL0asr069ieqp8V9BCdLyIh5Ie7zYSGylg6pafQkGSo2guCtvR+eyQsOwjKcYw
 19h3EMD1+Rm5cWm8pEtcsknHY2b3nnrAQmatF9fsy3QAglMS4bl8Spqo5i99YMg9GVRa
 Rcd3l4Ou/7ygE/3+s7JeGU5GTQtSV9vwteoXa1TDBCmLulRbPm9TXkOJ685PM84h9x5/
 FA9A==
X-Gm-Message-State: AOAM530vs075AjLoMtpCkTcRA2DK4Kop561PoXwSgRooZztJrNb/n0tJ
 46WI9V7suftMdy5/siGP+27Um8Y8LUenXzS4g1NY2Q==
X-Google-Smtp-Source: ABdhPJzAyQO+3sOIJDmjy8TPCR24zYsCHF5dV9TY0og3zM3uIeC1NjNjjAIOrJAyZ7uyKC5FRK99JdHkaZIWCrDwJdE=
X-Received: by 2002:adf:eb0f:: with SMTP id s15mr13075232wrn.690.1639369288781; 
 Sun, 12 Dec 2021 20:21:28 -0800 (PST)
MIME-Version: 1.0
References: <20211210100732.1080-1-jiangyifei@huawei.com>
 <20211210100732.1080-7-jiangyifei@huawei.com>
In-Reply-To: <20211210100732.1080-7-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Dec 2021 09:51:17 +0530
Message-ID: <CAAhSdy01+Zaxk-7R20PexB5Vekr4jKAf=OTa5t+6FnoBUFLuCQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] target/riscv: Support start kernel directly by
 KVM
To: Yifei Jiang <jiangyifei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::42a;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Mingwang Li <limingwang@huawei.com>, KVM General <kvm@vger.kernel.org>,
 libvir-list@redhat.com, Anup Patel <anup.patel@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, wanbo13@huawei.com,
 Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org,
 wanghaibin.wang@huawei.com, Alistair Francis <Alistair.Francis@wdc.com>,
 fanliang@huawei.com, "Wubin \(H\)" <wu.wubin@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 10, 2021 at 3:37 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Get kernel and fdt start address in virt.c, and pass them to KVM
> when cpu reset. In addition, add kvm_riscv.h to place riscv specific
> interface.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/boot.c          | 11 ++++++++
>  hw/riscv/virt.c          | 54 ++++++++++++++++++++++++++++------------
>  include/hw/riscv/boot.h  |  1 +
>  target/riscv/cpu.c       |  8 ++++++
>  target/riscv/cpu.h       |  3 +++
>  target/riscv/kvm-stub.c  | 25 +++++++++++++++++++
>  target/riscv/kvm.c       | 14 +++++++++++
>  target/riscv/kvm_riscv.h | 24 ++++++++++++++++++
>  target/riscv/meson.build |  2 +-
>  9 files changed, 125 insertions(+), 17 deletions(-)
>  create mode 100644 target/riscv/kvm-stub.c
>  create mode 100644 target/riscv/kvm_riscv.h
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 519fa455a1..00df6d7810 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -317,3 +317,14 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
>
>      return;
>  }
> +
> +void riscv_setup_direct_kernel(hwaddr kernel_addr, hwaddr fdt_addr)
> +{
> +    CPUState *cs;
> +
> +    for (cs = first_cpu; cs; cs = CPU_NEXT(cs)) {
> +        RISCVCPU *riscv_cpu = RISCV_CPU(cs);
> +        riscv_cpu->env.kernel_addr = kernel_addr;
> +        riscv_cpu->env.fdt_addr = fdt_addr;
> +    }
> +}
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 3af074148e..c8bcd9d9e5 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -38,6 +38,7 @@
>  #include "chardev/char.h"
>  #include "sysemu/device_tree.h"
>  #include "sysemu/sysemu.h"
> +#include "sysemu/kvm.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci-host/gpex.h"
>  #include "hw/display/ramfb.h"
> @@ -801,23 +802,25 @@ static void virt_machine_init(MachineState *machine)
>                                  hart_count, &error_abort);
>          sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_abort);
>
> -        /* Per-socket CLINT */
> -        riscv_aclint_swi_create(
> -            memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size,
> -            base_hartid, hart_count, false);
> -        riscv_aclint_mtimer_create(
> -            memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size +
> -                RISCV_ACLINT_SWI_SIZE,
> -            RISCV_ACLINT_DEFAULT_MTIMER_SIZE, base_hartid, hart_count,
> -            RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
> -            RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
> -
> -        /* Per-socket ACLINT SSWI */
> -        if (s->have_aclint) {
> +        if (!kvm_enabled()) {
> +            /* Per-socket CLINT */
>              riscv_aclint_swi_create(
> -                memmap[VIRT_ACLINT_SSWI].base +
> -                    i * memmap[VIRT_ACLINT_SSWI].size,
> -                base_hartid, hart_count, true);
> +                memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size,
> +                base_hartid, hart_count, false);
> +            riscv_aclint_mtimer_create(
> +                memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size +
> +                    RISCV_ACLINT_SWI_SIZE,
> +                RISCV_ACLINT_DEFAULT_MTIMER_SIZE, base_hartid, hart_count,
> +                RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
> +                RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
> +
> +            /* Per-socket ACLINT SSWI */
> +            if (s->have_aclint) {
> +                riscv_aclint_swi_create(
> +                    memmap[VIRT_ACLINT_SSWI].base +
> +                        i * memmap[VIRT_ACLINT_SSWI].size,
> +                    base_hartid, hart_count, true);
> +            }

Along with this, we should not generate FDT nodes of ACLINT (or SiFive CLINT)
when KVM is enabled.

>          }
>
>          /* Per-socket PLIC hart topology configuration string */
> @@ -884,6 +887,16 @@ static void virt_machine_init(MachineState *machine)
>      memory_region_add_subregion(system_memory, memmap[VIRT_MROM].base,
>                                  mask_rom);
>
> +    /*
> +     * Only direct boot kernel is currently supported for KVM VM,
> +     * so the "-bios" parameter is ignored and treated like "-bios none"
> +     * when KVM is enabled.
> +     */
> +    if (kvm_enabled()) {
> +        g_free(machine->firmware);
> +        machine->firmware = g_strdup("none");
> +    }
> +
>      if (riscv_is_32bit(&s->soc[0])) {
>          firmware_end_addr = riscv_find_and_load_firmware(machine,
>                                      RISCV32_BIOS_BIN, start_addr, NULL);
> @@ -941,6 +954,15 @@ static void virt_machine_init(MachineState *machine)
>                                virt_memmap[VIRT_MROM].size, kernel_entry,
>                                fdt_load_addr, machine->fdt);
>
> +    /*
> +     * Only direct boot kernel is currently supported for KVM VM,
> +     * So here setup kernel start address and fdt address.
> +     * TODO:Support firmware loading and integrate to TCG start
> +     */
> +    if (kvm_enabled()) {
> +        riscv_setup_direct_kernel(kernel_entry, fdt_load_addr);
> +    }
> +
>      /* SiFive Test MMIO device */
>      sifive_test_create(memmap[VIRT_TEST].base);
>
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index baff11dd8a..5834c234aa 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -58,5 +58,6 @@ void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
>                                    hwaddr rom_size,
>                                    uint32_t reset_vec_size,
>                                    uint64_t kernel_entry);
> +void riscv_setup_direct_kernel(hwaddr kernel_addr, hwaddr fdt_addr);
>
>  #endif /* RISCV_BOOT_H */
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f812998123..1c944872a3 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -29,6 +29,8 @@
>  #include "hw/qdev-properties.h"
>  #include "migration/vmstate.h"
>  #include "fpu/softfloat-helpers.h"
> +#include "sysemu/kvm.h"
> +#include "kvm_riscv.h"
>
>  /* RISC-V CPU definitions */
>
> @@ -380,6 +382,12 @@ static void riscv_cpu_reset(DeviceState *dev)
>      cs->exception_index = RISCV_EXCP_NONE;
>      env->load_res = -1;
>      set_default_nan_mode(1, &env->fp_status);
> +
> +#ifndef CONFIG_USER_ONLY
> +    if (kvm_enabled()) {
> +        kvm_riscv_reset_vcpu(cpu);
> +    }
> +#endif
>  }
>
>  static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0760c0af93..2807eb1bcb 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -255,6 +255,9 @@ struct CPURISCVState {
>
>      /* Fields from here on are preserved across CPU reset. */
>      QEMUTimer *timer; /* Internal timer */
> +
> +    hwaddr kernel_addr;
> +    hwaddr fdt_addr;
>  };
>
>  OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
> diff --git a/target/riscv/kvm-stub.c b/target/riscv/kvm-stub.c
> new file mode 100644
> index 0000000000..39b96fe3f4
> --- /dev/null
> +++ b/target/riscv/kvm-stub.c
> @@ -0,0 +1,25 @@
> +/*
> + * QEMU KVM RISC-V specific function stubs
> + *
> + * Copyright (c) 2020 Huawei Technologies Co., Ltd
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "kvm_riscv.h"
> +
> +void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
> +{
> +    abort();
> +}
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index e695b91dc7..db6d8a5b6e 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -37,6 +37,7 @@
>  #include "hw/irq.h"
>  #include "qemu/log.h"
>  #include "hw/loader.h"
> +#include "kvm_riscv.h"
>
>  static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx)
>  {
> @@ -369,6 +370,19 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>      return 0;
>  }
>
> +void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
> +{
> +    CPURISCVState *env = &cpu->env;
> +
> +    if (!kvm_enabled()) {
> +        return;
> +    }
> +    env->pc = cpu->env.kernel_addr;
> +    env->gpr[10] = kvm_arch_vcpu_id(CPU(cpu)); /* a0 */
> +    env->gpr[11] = cpu->env.fdt_addr;          /* a1 */
> +    env->satp = 0;
> +}
> +
>  bool kvm_arch_cpu_check_are_resettable(void)
>  {
>      return true;
> diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
> new file mode 100644
> index 0000000000..f38c82bf59
> --- /dev/null
> +++ b/target/riscv/kvm_riscv.h
> @@ -0,0 +1,24 @@
> +/*
> + * QEMU KVM support -- RISC-V specific functions.
> + *
> + * Copyright (c) 2020 Huawei Technologies Co., Ltd
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef QEMU_KVM_RISCV_H
> +#define QEMU_KVM_RISCV_H
> +
> +void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
> +
> +#endif
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index 2faf08a941..fe41cc5805 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -19,7 +19,7 @@ riscv_ss.add(files(
>    'bitmanip_helper.c',
>    'translate.c',
>  ))
> -riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
> +riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
>
>  riscv_softmmu_ss = ss.source_set()
>  riscv_softmmu_ss.add(files(
> --
> 2.19.1
>

Regards,
Anup

