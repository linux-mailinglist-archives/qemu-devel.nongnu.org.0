Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C5A48888B
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 10:42:42 +0100 (CET)
Received: from localhost ([::1]:48480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6Uin-0005Or-KW
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 04:42:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTs-0005Va-0s
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:27:16 -0500
Received: from mail.xen0n.name ([115.28.160.31]:55762
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTn-0006Lg-Hg
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:27:15 -0500
Received: from [192.168.9.172] (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 33DA162E7E;
 Sun,  9 Jan 2022 17:26:48 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1641720408; bh=pQ1jlibXmSczBiRFifKPJFpfBWmLJKr8ZSMOU8O/Dfo=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=HMRwAt+nJVKW2w8f3tMdjLHjqBAqHqajgIgQEcjFPwQRDyKnpobSLe/6Kl3EHMIdW
 17Pu+qEnlIv75InMTkIBcY7G+kmWl7NEMRS0d0w+BXk9qG1NdOaElBIcRy/gWh/lGs
 rLtgA+UwbnFLNUUk09ExOu5roA+ndvmh10IUJ5pQ=
Message-ID: <ba4a89e5-cd60-45a3-cf4a-61dd85f26ed9@xen0n.name>
Date: Sun, 9 Jan 2022 17:25:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0a1
From: WANG Xuerui <i.qemu@xen0n.name>
Subject: Re: [RFC PATCH v4 06/30] target/loongarch: Add MMU support for
 LoongArch CPU.
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
 <20220108091419.2027710-7-yangxiaojuan@loongson.cn>
Content-Language: en-US
In-Reply-To: <20220108091419.2027710-7-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 philmd@redhat.com, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/8/22 17:13, Xiaojuan Yang wrote:
> This patch introduces basic TLB interfaces.
Same comment regarding commit messages adding little information.
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/cpu-param.h  |   2 +-
>   target/loongarch/cpu.c        |  32 ++++
>   target/loongarch/cpu.h        |  45 ++++-
>   target/loongarch/internals.h  |  10 ++
>   target/loongarch/machine.c    |  17 ++
>   target/loongarch/meson.build  |   1 +
>   target/loongarch/op_helper.c  |   8 +
>   target/loongarch/tlb_helper.c | 326 ++++++++++++++++++++++++++++++++++
>   8 files changed, 439 insertions(+), 2 deletions(-)
>   create mode 100644 target/loongarch/tlb_helper.c
>
> diff --git a/target/loongarch/cpu-param.h b/target/loongarch/cpu-param.h
> index 9a769b67e0..414d8fff46 100644
> --- a/target/loongarch/cpu-param.h
> +++ b/target/loongarch/cpu-param.h
> @@ -13,6 +13,6 @@
>   #define TARGET_VIRT_ADDR_SPACE_BITS 48
>   
>   #define TARGET_PAGE_BITS 14
> -#define NB_MMU_MODES 4
> +#define NB_MMU_MODES 5
>   
>   #endif
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 823951dddd..780eb96a3c 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -237,6 +237,7 @@ static void loongarch_cpu_realizefn(DeviceState *dev, Error **errp)
>   
>   #ifndef CONFIG_USER_ONLY
>       LoongArchCPU *cpu = LOONGARCH_CPU(dev);
> +    CPULoongArchState *env = &cpu->env;
>   #endif
>   
>       cpu_exec_realizefn(cs, &local_err);
> @@ -248,6 +249,7 @@ static void loongarch_cpu_realizefn(DeviceState *dev, Error **errp)
>   #ifndef CONFIG_USER_ONLY
>       timer_init_ns(&cpu->timer, QEMU_CLOCK_VIRTUAL,
>                     &loongarch_constant_timer_cb, cpu);
> +    loongarch_mmu_init(env);
>   #endif
>   
>       cpu_reset(cs);
> @@ -295,6 +297,23 @@ void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>           }
>       }
>   
> +#ifndef CONFIG_USER_ONLY
> +    qemu_fprintf(f, "EUEN=%016" PRIx64 "\n", env->CSR_EUEN);
Why EUEN first and generally not in the structure definition/manual order?
> +    qemu_fprintf(f, "ESTAT=%016" PRIx64 "\n", env->CSR_ESTAT);
> +    qemu_fprintf(f, "ERA=%016" PRIx64 "\n", env->CSR_ERA);
> +    qemu_fprintf(f, "CRMD=%016" PRIx64 "\n", env->CSR_CRMD);
> +    qemu_fprintf(f, "PRMD=%016" PRIx64 "\n", env->CSR_PRMD);
> +    qemu_fprintf(f, "BadVAddr=%016" PRIx64 "\n", env->CSR_BADV);
The register is named just "BADV" in the manuals, "BadVAddr" seems like 
MIPS leftover...
> +    qemu_fprintf(f, "EENTRY=%016" PRIx64 "\n", env->CSR_EENTRY);
> +    qemu_fprintf(f, "TLBRERA=%016" PRIx64 "\n", env->CSR_TLBRERA);
> +    qemu_fprintf(f, "TLBRBADV=%016" PRIx64 "\n", env->CSR_TLBRBADV);
> +    qemu_fprintf(f, "TLBRENTRY=%016" PRIx64 "\n", env->CSR_TLBRENTRY);
> +    qemu_fprintf(f, "BadInstr=%016" PRIx64 "\n", env->CSR_BADI);
Also this; "BadInstr" also comes from MIPS IIRC.
> +    qemu_fprintf(f, "PRCFG1=%016" PRIx64 ", PRCFG2=%016" PRIx64 ","
> +                 " PRCFG3=%016" PRIx64 "\n",
> +                 env->CSR_PRCFG1, env->CSR_PRCFG3, env->CSR_PRCFG3);
> +#endif
> +
>       /* fpr */
>       if (flags & CPU_DUMP_FPU) {
>           for (i = 0; i < 32; i++) {
> @@ -312,9 +331,21 @@ void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>   static struct TCGCPUOps loongarch_tcg_ops = {
>       .initialize = loongarch_translate_init,
>       .synchronize_from_tb = loongarch_cpu_synchronize_from_tb,
> +
> +#if !defined(CONFIG_USER_ONLY)
> +    .tlb_fill = loongarch_cpu_tlb_fill,
> +#endif /* !CONFIG_USER_ONLY */
>   };
>   #endif /* CONFIG_TCG */
>   
> +#ifndef CONFIG_USER_ONLY
> +#include "hw/core/sysemu-cpu-ops.h"
> +
> +static const struct SysemuCPUOps loongarch_sysemu_ops = {
> +    .get_phys_page_debug = loongarch_cpu_get_phys_page_debug,
> +};
> +#endif
> +
>   static void loongarch_cpu_class_init(ObjectClass *c, void *data)
>   {
>       LoongArchCPUClass *lacc = LOONGARCH_CPU_CLASS(c);
> @@ -331,6 +362,7 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
>       cc->set_pc = loongarch_cpu_set_pc;
>   #ifndef CONFIG_USER_ONLY
>       dc->vmsd = &vmstate_loongarch_cpu;
> +    cc->sysemu_ops = &loongarch_sysemu_ops;
>   #endif
>       cc->disas_set_info = loongarch_cpu_disas_set_info;
>   #ifdef CONFIG_TCG
> diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
> index ef84584678..232d51e788 100644
> --- a/target/loongarch/cpu.h
> +++ b/target/loongarch/cpu.h
> @@ -152,6 +152,29 @@ extern const char * const fregnames[32];
>   #define N_IRQS      14
>   #define IRQ_TIMER   11
>   
> +#define LOONGARCH_TLB_MAX      (2048 + 64) /* 2048 STLB + 64 MTLB */
> +#define LOONGARCH_STLB         2048 /* 2048 STLB */
> +#define LOONGARCH_MTLB         64   /* 64 MTLB */
Why not define LOONGARCH_TLB_MAX after the two individual definitions, 
and just say "#define LOONGARCH_TLB_MAX (LOONGARCH_STLB + 
LOONGARCH_MTLB)" to really eliminate the duplication?
> +
> +/*
> + * define the ASID PS E VPPN field of TLB
> + *
> + * PS of stlb come from stlbps.ps
> + * PS of mtlb come from tlbidx.ps
> + */
I can't understand this comment, which seems like just describing what 
the following code literally meant. Might remove as well...
> +FIELD(TLB_MISC, E, 0, 1)
> +FIELD(TLB_MISC, ASID, 1, 10)
> +FIELD(TLB_MISC, VPPN, 13, 35)
> +FIELD(TLB_MISC, PS, 48, 6)
> +
> +struct LoongArchTLB {
> +    uint64_t tlb_misc;
> +    /* Fields corresponding to CSR_TLBELO0/1 */
> +    uint64_t tlb_entry0;
> +    uint64_t tlb_entry1;
> +};
> +typedef struct LoongArchTLB LoongArchTLB;
> +
>   typedef struct CPULoongArchState CPULoongArchState;
>   struct CPULoongArchState {
>       uint64_t gpr[32];
> @@ -231,6 +254,10 @@ struct CPULoongArchState {
>       uint64_t CSR_DBG;
>       uint64_t CSR_DERA;
>       uint64_t CSR_DSAVE;
> +
> +#ifndef CONFIG_USER_ONLY
> +    LoongArchTLB  tlb[LOONGARCH_TLB_MAX];
> +#endif
>   };
>   
>   /**
> @@ -270,11 +297,27 @@ struct LoongArchCPUClass {
>       DeviceReset parent_reset;
>   };
>   
> -#define MMU_USER_IDX 3
> +/*
> + * LoongArch cpu has 4 priv level.
"LoongArch CPUs have 4 privilege levels"
> + * 0 for kernel mode, 3 for user mode.
> + * Define a extra index for Direct mode.
"an extra mode for DA (direct addressing) mode"
> + */
> +#define MMU_KERNEL_IDX 0 /* kernel mode idx */
> +#define MMU_USER_IDX   3 /* user mode idx */
> +#define MMU_DA_IDX     4 /* DA mode idx */

Remove the comments; they add no information.

>   
>   static inline int cpu_mmu_index(CPULoongArchState *env, bool ifetch)
>   {
> +#ifdef CONFIG_USER_ONLY
>       return MMU_USER_IDX;
> +#else
> +    uint8_t pg = FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PG);
> +
> +    if (!pg) {
> +        return MMU_DA_IDX;
> +    }
> +    return FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PLV);
> +#endif
>   }
>   
>   static inline void cpu_get_tb_cpu_state(CPULoongArchState *env,
> diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
> index c8e6f7012c..a5b81bdca3 100644
> --- a/target/loongarch/internals.h
> +++ b/target/loongarch/internals.h
> @@ -13,6 +13,9 @@
>   #define FCMP_UN   0b0100  /* unordered */
>   #define FCMP_GT   0b1000  /* fp0 > fp1 */
>   
> +#define TARGET_PHYS_MASK MAKE_64BIT_MASK(0, TARGET_PHYS_ADDR_SPACE_BITS)
> +#define TARGET_VIRT_MASK MAKE_64BIT_MASK(0, TARGET_VIRT_ADDR_SPACE_BITS)
> +
>   void loongarch_translate_init(void);
>   
>   void loongarch_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
> @@ -27,6 +30,13 @@ void restore_fp_status(CPULoongArchState *env);
>   
>   #ifndef CONFIG_USER_ONLY
>   extern const VMStateDescription vmstate_loongarch_cpu;
> +
> +bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> +                            MMUAccessType access_type, int mmu_idx,
> +                            bool probe, uintptr_t retaddr);
> +
> +void loongarch_mmu_init(CPULoongArchState *env);
> +hwaddr loongarch_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>   #endif
>   
>   #endif
> diff --git a/target/loongarch/machine.c b/target/loongarch/machine.c
> index b9effe6db2..bc10492708 100644
> --- a/target/loongarch/machine.c
> +++ b/target/loongarch/machine.c
> @@ -8,6 +8,20 @@
>   #include "qemu/osdep.h"
>   #include "cpu.h"
>   #include "migration/cpu.h"
> +#include "internals.h"
> +
> +/* TLB state */
> +const VMStateDescription vmstate_tlb = {
> +    .name = "cpu/tlb",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT64(tlb_misc, LoongArchTLB),
> +        VMSTATE_UINT64(tlb_entry0, LoongArchTLB),
> +        VMSTATE_UINT64(tlb_entry1, LoongArchTLB),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
>   
>   /* LoongArch CPU state */
>   
> @@ -78,6 +92,9 @@ const VMStateDescription vmstate_loongarch_cpu = {
>           VMSTATE_UINT64(env.CSR_DBG, LoongArchCPU),
>           VMSTATE_UINT64(env.CSR_DERA, LoongArchCPU),
>           VMSTATE_UINT64(env.CSR_DSAVE, LoongArchCPU),
> +        /* TLB */
> +        VMSTATE_STRUCT_ARRAY(env.tlb, LoongArchCPU, LOONGARCH_TLB_MAX,
> +                             0, vmstate_tlb, LoongArchTLB),
>   
>           VMSTATE_END_OF_LIST()
>       },
> diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
> index 6168e910a0..6bf2d88104 100644
> --- a/target/loongarch/meson.build
> +++ b/target/loongarch/meson.build
> @@ -18,6 +18,7 @@ loongarch_softmmu_ss = ss.source_set()
>   loongarch_softmmu_ss.add(files(
>     'machine.c',
>     'constant_timer.c',
> +  'tlb_helper.c',
>   ))
>   
>   loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
> diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
> index 1083e39b7f..48c25e5a9b 100644
> --- a/target/loongarch/op_helper.c
> +++ b/target/loongarch/op_helper.c
> @@ -47,16 +47,24 @@ target_ulong helper_bitswap(target_ulong v)
>   void helper_asrtle_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
>   {
>       if (rj > rk) {
> +#ifdef CONFIG_USER_ONLY
>           cpu_loop_exit_sigsegv(env_cpu(env), GETPC(),
>                                 MMU_DATA_LOAD, true, GETPC());
> +#else
> +        do_raise_exception(env, EXCCODE_ADEM, GETPC());
> +#endif
>       }
>   }
>   
>   void helper_asrtgt_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
>   {
>       if (rj <= rk) {
> +#ifdef CONFIG_USER_ONLY
>           cpu_loop_exit_sigsegv(env_cpu(env), GETPC(),
>                                 MMU_DATA_LOAD, true, GETPC());
> +#else
> +        do_raise_exception(env, EXCCODE_ADEM, GETPC());
> +#endif
>       }
>   }
>   
> diff --git a/target/loongarch/tlb_helper.c b/target/loongarch/tlb_helper.c
> new file mode 100644
> index 0000000000..ff72ac4eaf
> --- /dev/null
> +++ b/target/loongarch/tlb_helper.c
> @@ -0,0 +1,326 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * QEMU LoongArch TLB helpers for qemu
Remove the "for qemu" part...
> + *
> + * Copyright (c) 2021 Loongson Technology Corporation Limited
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "cpu.h"
> +#include "internals.h"
> +#include "exec/exec-all.h"
> +#include "exec/cpu_ldst.h"
> +#include "exec/log.h"
> +#include "cpu-csr.h"
> +
> +enum {
> +    TLBRET_MATCH = 0,
> +    TLBRET_BADADDR = 1,
> +    TLBRET_NOMATCH = 2,
> +    TLBRET_INVALID = 3,
> +    TLBRET_DIRTY = 4,
> +    TLBRET_RI = 5,
> +    TLBRET_XI = 6,
> +    TLBRET_PE = 7,
> +};
> +
> +/* TLB address map */
Remove this comment, it says even less than the function name below...
> +static int loongarch_map_tlb_entry(CPULoongArchState *env, hwaddr *physical,
> +                                   int *prot, target_ulong address,
> +                                   int access_type, int index, int mmu_idx)
> +{
> +    LoongArchTLB *tlb = &env->tlb[index];
> +    uint64_t plv = mmu_idx;
> +    uint64_t tlb_entry, tlb_ppn;
> +    uint8_t tlb_ps, n, tlb_v, tlb_d, tlb_plv, tlb_nx, tlb_nr, tlb_rplv;
> +
> +    if (index >= LOONGARCH_STLB) {
> +        tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
> +    } else {
> +        tlb_ps = FIELD_EX64(env->CSR_STLBPS, CSR_STLBPS, PS);
> +    }
> +    n = (address >> tlb_ps) & 0x1;/* Odd or even */
> +
> +    tlb_entry = n ? tlb->tlb_entry1 : tlb->tlb_entry0;
> +    tlb_v = FIELD_EX64(tlb_entry, TLBENTRY, V);
> +    tlb_d = FIELD_EX64(tlb_entry, TLBENTRY, D);
> +    tlb_plv = FIELD_EX64(tlb_entry, TLBENTRY, PLV);
> +    tlb_ppn = FIELD_EX64(tlb_entry, TLBENTRY, PPN);
> +    tlb_nx = FIELD_EX64(tlb_entry, TLBENTRY, NX);
> +    tlb_nr = FIELD_EX64(tlb_entry, TLBENTRY, NR);
> +    tlb_rplv = FIELD_EX64(tlb_entry, TLBENTRY, RPLV);
> +
> +    /* Check access rights */
> +    if (!tlb_v) {
> +        return TLBRET_INVALID;
> +    }
> +
> +    if (access_type == MMU_INST_FETCH && tlb_nx) {
> +        return TLBRET_XI;
> +    }
> +
> +    if (access_type == MMU_DATA_LOAD && tlb_nr) {
> +        return TLBRET_RI;
> +    }
> +
> +    if (((tlb_rplv == 0) && (plv > tlb_plv)) ||
> +        ((tlb_rplv == 1) && (plv != tlb_plv))) {
> +        return TLBRET_PE;
> +    }
> +
> +    if ((access_type == MMU_DATA_STORE) && !tlb_d) {
> +        return TLBRET_DIRTY;
> +    }
> +
> +    /*
> +     * tlb_entry contains ppn[47:12] while 16KB ppn is [47:15]
> +     * need adjust.
"16KiB" to be exact; and please clarify what to "adjust"?
> +     */
> +    *physical = (tlb_ppn << R_TLBENTRY_PPN_SHIFT) |
> +                (address & MAKE_64BIT_MASK(0, tlb_ps));
> +    *prot = PAGE_READ;
> +    if (tlb_d) {
> +        *prot |= PAGE_WRITE;
> +    }
> +    if (!tlb_nx) {
> +        *prot |= PAGE_EXEC;
> +    }
> +    return TLBRET_MATCH;
> +}
> +
> +/*
> + * One tlb entry holds a adjacent odd/even pair, the vpn is the
"an adjacent"
> + * content of the virtual page number divided by 2.So the
Space after the period.
> + * compare vpn is bit[47:15] for 16KB page. while the vppn
> + * field in tlb entry contains bit[47:13], so need adjust.
Chinglish for the whole sentence; I'm not too familiar with the TLB 
details so you may have to write that sentence yourself.
> + * virt_vpn = vaddr[47:13]
> + */
> +static bool loongarch_tlb_search(CPULoongArchState *env, target_ulong vaddr,
> +                                 int *index)
> +{
> +    LoongArchTLB *tlb;
> +    uint16_t csr_asid, tlb_asid, stlb_idx;
> +    uint8_t tlb_e, tlb_ps, tlb_g, stlb_ps;
> +    int i, compare_shift;
> +    uint64_t vpn, tlb_vppn;   /* Address to map */
> +
> +    csr_asid = FIELD_EX64(env->CSR_ASID, CSR_ASID, ASID);
> +    stlb_ps = FIELD_EX64(env->CSR_STLBPS, CSR_STLBPS, PS);
> +    vpn = (vaddr & TARGET_VIRT_MASK) >> (stlb_ps + 1);
> +    stlb_idx = vpn & 0xff; /* VA[25:15] <==> TLBIDX.index for 16KB Page */
"16KiB pages"
> +    compare_shift = stlb_ps + 1 - R_TLB_MISC_VPPN_SHIFT;
> +
> +    /* Search STLB */
> +    for (i = 0; i < 8; ++i) {
> +        tlb = &env->tlb[i * 256 + stlb_idx];
> +        tlb_e = FIELD_EX64(tlb->tlb_misc, TLB_MISC, E);
> +        if (tlb_e) {
> +            tlb_vppn = FIELD_EX64(tlb->tlb_misc, TLB_MISC, VPPN);
> +            tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
> +            tlb_g = FIELD_EX64(tlb->tlb_entry0, TLBENTRY, G);
> +
> +            if ((tlb_g == 1 || tlb_asid == csr_asid) &&
> +                (vpn == (tlb_vppn >> compare_shift))) {
> +                *index = i * 256 + stlb_idx;
> +                return true;
> +            }
> +        }
> +    }
> +
> +    /* Search MTLB */
> +    for (i = LOONGARCH_STLB; i < LOONGARCH_TLB_MAX; ++i) {
> +        tlb = &env->tlb[i];
> +        tlb_e = FIELD_EX64(tlb->tlb_misc, TLB_MISC, E);
> +        if (tlb_e) {
> +            tlb_vppn = FIELD_EX64(tlb->tlb_misc, TLB_MISC, VPPN);
> +            tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
> +            tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
> +            tlb_g = FIELD_EX64(tlb->tlb_entry0, TLBENTRY, G);
> +            compare_shift = tlb_ps + 1 - R_TLB_MISC_VPPN_SHIFT;
> +
> +            if ((tlb_g == 1 || tlb_asid == csr_asid) &&
> +                (vpn == (tlb_vppn >> compare_shift))) {
> +                *index = i;
> +                return true;
> +            }
> +        }
> +    }
> +    return false;
> +}
> +
> +static int loongarch_map_address(CPULoongArchState *env, hwaddr *physical,
> +                                 int *prot, target_ulong address,
> +                                 MMUAccessType access_type, int mmu_idx)
> +{
> +    int index, match;
> +
> +    match = loongarch_tlb_search(env, address, &index);
> +    if (match) {
> +        return loongarch_map_tlb_entry(env, physical, prot,
> +                                       address, access_type, index, mmu_idx);
> +    }
> +
> +    return TLBRET_NOMATCH;
> +}
> +
> +static int get_physical_address(CPULoongArchState *env, hwaddr *physical,
> +                                int *prot, target_ulong address,
> +                                MMUAccessType access_type, int mmu_idx)
> +{
> +    int user_mode = mmu_idx == MMU_USER_IDX;
> +    int kernel_mode = mmu_idx == MMU_KERNEL_IDX;
> +    uint32_t plv, base_c, base_v;
> +    int64_t addr_high;
> +    uint8_t da = FIELD_EX64(env->CSR_CRMD, CSR_CRMD, DA);
> +    uint8_t pg = FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PG);
> +
> +    /* Check PG and DA*/
> +    if (da & !pg) {
> +        /* DA mode */
> +        *physical = address & TARGET_PHYS_MASK;
> +        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> +        return TLBRET_MATCH;
> +    }
> +
> +    plv = kernel_mode | (user_mode << R_CSR_DMW_PLV3_SHIFT);
> +    base_v = address >> TARGET_VIRT_ADDR_SPACE_BITS;
> +    /* Check direct map window */
> +    for (int i = 0; i < 4; i++) {
> +        base_c = env->CSR_DMW[i] >> TARGET_VIRT_ADDR_SPACE_BITS;
> +        if ((plv & env->CSR_DMW[i]) && (base_c == base_v)) {
> +            *physical = dmw_va2pa(address);
> +            *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> +            return TLBRET_MATCH;
> +        }
> +    }
> +
> +    /* Check valid extension */
What does "extension" mean here? Do you mean to "check for non-canonical 
addresses", considering what follows looks like checking the high bits 
to be sign-extension of the lower part?
> +    addr_high = sextract64(address, TARGET_VIRT_ADDR_SPACE_BITS, 16);
> +    if (!(addr_high == 0 || addr_high == -1)) {
> +        return TLBRET_BADADDR;
> +    }
Newline after this line.
> +    /* Mapped address */
> +    return loongarch_map_address(env, physical, prot, address,
> +                                 access_type, mmu_idx);
> +}
> +
> +hwaddr loongarch_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
> +{
> +    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
> +    CPULoongArchState *env = &cpu->env;
> +    hwaddr phys_addr;
> +    int prot;
> +
> +    if (get_physical_address(env, &phys_addr, &prot, addr, MMU_DATA_LOAD,
> +                             cpu_mmu_index(env, false)) != 0) {
> +        return -1;
> +    }
> +    return phys_addr;
> +}
> +
> +static void raise_mmu_exception(CPULoongArchState *env, target_ulong address,
> +                                MMUAccessType access_type, int tlb_error)
> +{
> +    CPUState *cs = env_cpu(env);
> +
> +    switch (tlb_error) {
> +    default:
> +    case TLBRET_BADADDR:
> +        cs->exception_index = EXCCODE_ADEM;
> +        break;
> +    case TLBRET_NOMATCH:
> +        /* No TLB match for a mapped address */
> +        if (access_type == MMU_DATA_LOAD) {
> +            cs->exception_index = EXCCODE_PIL;
> +        } else if (access_type == MMU_DATA_STORE) {
> +            cs->exception_index = EXCCODE_PIS;
> +        } else if (access_type == MMU_INST_FETCH) {
> +            cs->exception_index = EXCCODE_PIF;
> +        }
> +        env->CSR_TLBRERA = FIELD_DP64(env->CSR_TLBRERA, CSR_TLBRERA, ISTLBR, 1);
> +        break;
> +    case TLBRET_INVALID:
> +        /* TLB match with no valid bit */
> +        if (access_type == MMU_DATA_LOAD) {
> +            cs->exception_index = EXCCODE_PIL;
> +        } else if (access_type == MMU_DATA_STORE) {
> +            cs->exception_index = EXCCODE_PIS;
> +        } else if (access_type == MMU_INST_FETCH) {
> +            cs->exception_index = EXCCODE_PIF;
> +        }
> +        break;
> +    case TLBRET_DIRTY:
> +        /* TLB match but 'D' bit is cleared */
> +        cs->exception_index = EXCCODE_PME;
> +        break;
> +    case TLBRET_XI:
> +        /* Execute-Inhibit Exception */
> +        cs->exception_index = EXCCODE_PNX;
> +        break;
> +    case TLBRET_RI:
> +        /* Read-Inhibit Exception */
> +        cs->exception_index = EXCCODE_PNR;
> +        break;
> +    case TLBRET_PE:
> +        /* Privileged Exception */
> +        cs->exception_index = EXCCODE_PPI;
> +        break;
> +    }
> +
> +    if (tlb_error == TLBRET_NOMATCH) {
> +        env->CSR_TLBRBADV = address;
> +        env->CSR_TLBREHI = FIELD_DP64(env->CSR_TLBREHI, CSR_TLBREHI, VPPN,
> +                                      extract64(address, 13, 35));
> +    } else {
> +        if (!FIELD_EX64(env->CSR_DBG, CSR_DBG, DST)) {
> +            env->CSR_BADV = address;
> +        }
> +        env->CSR_TLBEHI = address & (TARGET_PAGE_MASK << 1);
> +   }
> +}
> +
> +void loongarch_mmu_init(CPULoongArchState *env)
> +{
> +    /* For 16KB, ps = 14, compare the bit [47:15] */
"KiB"; "compare the bits"
> +    for (int i = 0; i < LOONGARCH_TLB_MAX; i++) {
> +        env->tlb[i].tlb_misc = FIELD_DP64(env->tlb[i].tlb_misc, TLB_MISC, E, 0);
> +    }
> +}
> +
> +bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> +                            MMUAccessType access_type, int mmu_idx,
> +                            bool probe, uintptr_t retaddr)
> +{
> +    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
> +    CPULoongArchState *env = &cpu->env;
> +    hwaddr physical;
> +    int prot;
> +    int ret = TLBRET_BADADDR;
> +
> +    /* Data access */
> +    /* XXX: put correct access by using cpu_restore_state() correctly */
Do you plan to fix this in a subsequent revision?
> +    ret = get_physical_address(env, &physical, &prot, address,
> +                               access_type, mmu_idx);
> +
> +    if (ret == TLBRET_MATCH) {
> +        tlb_set_page(cs, address & TARGET_PAGE_MASK,
> +                     physical & TARGET_PAGE_MASK, prot,
> +                     mmu_idx, TARGET_PAGE_SIZE);
> +        qemu_log_mask(CPU_LOG_MMU,
> +                      "%s address=%" VADDR_PRIx " physical " TARGET_FMT_plx
> +                      " prot %d\n", __func__, address, physical, prot);
> +        return true;
> +    } else {
> +        qemu_log_mask(CPU_LOG_MMU,
> +                      "%s address=%" VADDR_PRIx " ret %d\n", __func__, address,
> +                      ret);
> +    }
> +    if (probe) {
> +        return false;
> +    } else {
> +        raise_mmu_exception(env, address, access_type, ret);
> +        do_raise_exception(env, cs->exception_index, retaddr);
> +    }
> +}

