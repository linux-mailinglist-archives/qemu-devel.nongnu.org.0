Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA012A50B6
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 21:07:15 +0100 (CET)
Received: from localhost ([::1]:51990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ka2aI-0002CE-26
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 15:07:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ka2Xm-00088y-4u; Tue, 03 Nov 2020 15:04:38 -0500
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:35353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ka2Xj-000338-JT; Tue, 03 Nov 2020 15:04:37 -0500
Received: by mail-il1-x141.google.com with SMTP id t13so9327891ilp.2;
 Tue, 03 Nov 2020 12:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eNKba/9YVmmU6NbvraBZD+aRgwrIGZONVMI4LU9Xft4=;
 b=uF4QiDNzCFKSZTy2TyT7H5rapQgs30ZWlLa7JmeIJB+fZJ4nwucoc+RmQdWmoM7ZQ7
 7nlBJatvEJ5ZbK7hH2vM6h8bUbLqqakrTv6ts03TVQYSJZS47fmPFGCwEy9p7tcTWtxo
 mJ1HJRfigkNXVHWhe+XaHrFbI02M7f2oIU6UuZr1OoUar8xhNGrt5LhC8/OFAsKBfUAv
 KYw6zilCzlUuFvyzlsUNpVXcqFAmih4wCXAYDrJi5I8C8aEiL6Vt989poBRzsxivhq7R
 swWLfh6w21lkiy7j7BDqcLvHaHP0RfoTlbEgIaRLH7GctqySZcmkcAGYVd0dsWFZl3VX
 m84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eNKba/9YVmmU6NbvraBZD+aRgwrIGZONVMI4LU9Xft4=;
 b=ohcE65DGn4i1EBNaB8FH4TcyH7VP6cDSNrhVGKR9HOFCWA9KSSt567CX6K9Rj0BCfZ
 EndVKwoj9/ReS64KYd4SmhBEXoD6hp2OlAjfHreJJoVcf2JOGlyjxqMilYcyXOeagJsu
 W9VRiJZ+O+jcNnjoSOHLJpxnPcqjjGq7LuUBf1InoCN2rL4FF77Uo95bxYDJblroAvob
 XKZEYrxwl8ACG1T4PcCJj/tNiTulVlorMq+VXdXhOKkqFr5VhHdaoV9MOGFGaKV7EwE9
 iD/b2XqO3FU32Jw/tO+HvVQWU9+2/69a01m0snAueKPaYLwff7cA7GfOeytgwBpBLPUf
 43OQ==
X-Gm-Message-State: AOAM532NSy61DOrSwB7665TytIyj3EyK5jqIJcqIk2K+yz+vkYrmmL10
 sOisiYZfpBNJjI2g34/nLzoCog/eTQ5wnM+Xqjk=
X-Google-Smtp-Source: ABdhPJwUA0IUWkNZBzPSmMIf77wTLA/Wj83xtGFEKqRPuVrB26KBtA53zGx4/ei1pNi1pn7uJQuzfwAiHnV7/NR8BW8=
X-Received: by 2002:a05:6e02:c:: with SMTP id
 h12mr16937857ilr.177.1604433873983; 
 Tue, 03 Nov 2020 12:04:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1604432950.git.alistair.francis@wdc.com>
 <df31a53b141fb540eeaf1ca4da1f9e7d3c2e6238.1604432950.git.alistair.francis@wdc.com>
In-Reply-To: <df31a53b141fb540eeaf1ca4da1f9e7d3c2e6238.1604432950.git.alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 3 Nov 2020 11:52:37 -0800
Message-ID: <CAKmqyKN2o7zZV0nkoPUkOq1cKMymZOz7F_iNS-dU5iXEN77McQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] target/riscv: Merge m/vsstatus and m/vsstatush
 into one uint64_t unit
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 3, 2020 at 12:02 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> From: Yifei Jiang <jiangyifei@huawei.com>
>
> mstatus/mstatush and vsstatus/vsstatush are two halved for RISCV32.
> This patch expands mstatus and vsstatus to uint64_t instead of
> target_ulong so that it can be saved as one unit and reduce some
> ifdefs in the code.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Message-id: 20201026115530.304-2-jiangyifei@huawei.com

Argh, sorry I messed up my base branch in my script. Ignore this patch

Alistair

> ---
>  target/riscv/cpu.h        | 24 +++++++++++-------------
>  target/riscv/cpu_bits.h   | 19 ++++---------------
>  target/riscv/cpu.c        |  8 +++++---
>  target/riscv/cpu_helper.c | 35 +++++++----------------------------
>  target/riscv/csr.c        | 18 ++++++++++--------
>  target/riscv/op_helper.c  | 11 ++++-------
>  6 files changed, 41 insertions(+), 74 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index de4705bb57..87b68affa8 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -144,14 +144,14 @@ struct CPURISCVState {
>      target_ulong resetvec;
>
>      target_ulong mhartid;
> -    target_ulong mstatus;
> +    /*
> +     * For RV32 this is 32-bit mstatus and 32-bit mstatush.
> +     * For RV64 this is a 64-bit mstatus.
> +     */
> +    uint64_t mstatus;
>
>      target_ulong mip;
>
> -#ifdef TARGET_RISCV32
> -    target_ulong mstatush;
> -#endif
> -
>      uint32_t miclaim;
>
>      target_ulong mie;
> @@ -183,16 +183,17 @@ struct CPURISCVState {
>      uint64_t htimedelta;
>
>      /* Virtual CSRs */
> -    target_ulong vsstatus;
> +    /*
> +     * For RV32 this is 32-bit vsstatus and 32-bit vsstatush.
> +     * For RV64 this is a 64-bit vsstatus.
> +     */
> +    uint64_t vsstatus;
>      target_ulong vstvec;
>      target_ulong vsscratch;
>      target_ulong vsepc;
>      target_ulong vscause;
>      target_ulong vstval;
>      target_ulong vsatp;
> -#ifdef TARGET_RISCV32
> -    target_ulong vsstatush;
> -#endif
>
>      target_ulong mtval2;
>      target_ulong mtinst;
> @@ -204,10 +205,7 @@ struct CPURISCVState {
>      target_ulong scause_hs;
>      target_ulong stval_hs;
>      target_ulong satp_hs;
> -    target_ulong mstatus_hs;
> -#ifdef TARGET_RISCV32
> -    target_ulong mstatush_hs;
> -#endif
> +    uint64_t mstatus_hs;
>
>      target_ulong scounteren;
>      target_ulong mcounteren;
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index bd36062877..daedad8691 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -4,10 +4,10 @@
>  #define TARGET_RISCV_CPU_BITS_H
>
>  #define get_field(reg, mask) (((reg) & \
> -                 (target_ulong)(mask)) / ((mask) & ~((mask) << 1)))
> -#define set_field(reg, mask, val) (((reg) & ~(target_ulong)(mask)) | \
> -                 (((target_ulong)(val) * ((mask) & ~((mask) << 1))) & \
> -                 (target_ulong)(mask)))
> +                 (uint64_t)(mask)) / ((mask) & ~((mask) << 1)))
> +#define set_field(reg, mask, val) (((reg) & ~(uint64_t)(mask)) | \
> +                 (((uint64_t)(val) * ((mask) & ~((mask) << 1))) & \
> +                 (uint64_t)(mask)))
>
>  /* Floating point round mode */
>  #define FSR_RD_SHIFT        5
> @@ -381,19 +381,8 @@
>  #define MSTATUS_TVM         0x00100000 /* since: priv-1.10 */
>  #define MSTATUS_TW          0x20000000 /* since: priv-1.10 */
>  #define MSTATUS_TSR         0x40000000 /* since: priv-1.10 */
> -#if defined(TARGET_RISCV64)
>  #define MSTATUS_GVA         0x4000000000ULL
>  #define MSTATUS_MPV         0x8000000000ULL
> -#elif defined(TARGET_RISCV32)
> -#define MSTATUS_GVA         0x00000040
> -#define MSTATUS_MPV         0x00000080
> -#endif
> -
> -#ifdef TARGET_RISCV32
> -# define MSTATUS_MPV_ISSET(env)  get_field(env->mstatush, MSTATUS_MPV)
> -#else
> -# define MSTATUS_MPV_ISSET(env)  get_field(env->mstatus, MSTATUS_MPV)
> -#endif
>
>  #define MSTATUS64_UXL       0x0000000300000000ULL
>  #define MSTATUS64_SXL       0x0000000C00000000ULL
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0bbfd7f457..dd05a220c7 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -216,13 +216,15 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "pc      ", env->pc);
>  #ifndef CONFIG_USER_ONLY
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ", env->mhartid);
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", env->mstatus);
> +    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", (target_ulong)env->mstatus);
>  #ifdef TARGET_RISCV32
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatush ", env->mstatush);
> +    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatush ",
> +                 (target_ulong)(env->mstatus >> 32));
>  #endif
>      if (riscv_has_ext(env, RVH)) {
>          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hstatus ", env->hstatus);
> -        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsstatus ", env->vsstatus);
> +        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsstatus ",
> +                     (target_ulong)env->vsstatus);
>      }
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mip     ", env->mip);
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mie     ", env->mie);
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 4652082df1..3eb3a034db 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -110,27 +110,19 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env)
>
>  void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
>  {
> -    target_ulong mstatus_mask = MSTATUS_MXR | MSTATUS_SUM | MSTATUS_FS |
> -                                MSTATUS_SPP | MSTATUS_SPIE | MSTATUS_SIE;
> +    uint64_t mstatus_mask = MSTATUS_MXR | MSTATUS_SUM | MSTATUS_FS |
> +                            MSTATUS_SPP | MSTATUS_SPIE | MSTATUS_SIE |
> +                            MSTATUS64_UXL;
>      bool current_virt = riscv_cpu_virt_enabled(env);
>
>      g_assert(riscv_has_ext(env, RVH));
>
> -#if defined(TARGET_RISCV64)
> -    mstatus_mask |= MSTATUS64_UXL;
> -#endif
> -
>      if (current_virt) {
>          /* Current V=1 and we are about to change to V=0 */
>          env->vsstatus = env->mstatus & mstatus_mask;
>          env->mstatus &= ~mstatus_mask;
>          env->mstatus |= env->mstatus_hs;
>
> -#if defined(TARGET_RISCV32)
> -        env->vsstatush = env->mstatush;
> -        env->mstatush |= env->mstatush_hs;
> -#endif
> -
>          env->vstvec = env->stvec;
>          env->stvec = env->stvec_hs;
>
> @@ -154,11 +146,6 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
>          env->mstatus &= ~mstatus_mask;
>          env->mstatus |= env->vsstatus;
>
> -#if defined(TARGET_RISCV32)
> -        env->mstatush_hs = env->mstatush;
> -        env->mstatush |= env->vsstatush;
> -#endif
> -
>          env->stvec_hs = env->stvec;
>          env->stvec = env->vstvec;
>
> @@ -727,7 +714,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>      if (riscv_has_ext(env, RVH) && env->priv == PRV_M &&
>          access_type != MMU_INST_FETCH &&
>          get_field(env->mstatus, MSTATUS_MPRV) &&
> -        MSTATUS_MPV_ISSET(env)) {
> +        get_field(env->mstatus, MSTATUS_MPV)) {
>          riscv_cpu_set_two_stage_lookup(env, true);
>      }
>
> @@ -799,7 +786,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>      if (riscv_has_ext(env, RVH) && env->priv == PRV_M &&
>          access_type != MMU_INST_FETCH &&
>          get_field(env->mstatus, MSTATUS_MPRV) &&
> -        MSTATUS_MPV_ISSET(env)) {
> +        get_field(env->mstatus, MSTATUS_MPV)) {
>          riscv_cpu_set_two_stage_lookup(env, false);
>      }
>
> @@ -862,7 +849,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>      RISCVCPU *cpu = RISCV_CPU(cs);
>      CPURISCVState *env = &cpu->env;
>      bool force_hs_execp = riscv_cpu_force_hs_excep_enabled(env);
> -    target_ulong s;
> +    uint64_t s;
>
>      /* cs->exception is 32-bits wide unlike mcause which is XLEN-bits wide
>       * so we mask off the MSB and separate into trap type and cause.
> @@ -995,19 +982,11 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>              if (riscv_cpu_virt_enabled(env)) {
>                  riscv_cpu_swap_hypervisor_regs(env);
>              }
> -#ifdef TARGET_RISCV32
> -            env->mstatush = set_field(env->mstatush, MSTATUS_MPV,
> -                                       riscv_cpu_virt_enabled(env));
> -            if (riscv_cpu_virt_enabled(env) && tval) {
> -                env->mstatush = set_field(env->mstatush, MSTATUS_GVA, 1);
> -            }
> -#else
>              env->mstatus = set_field(env->mstatus, MSTATUS_MPV,
> -                                      riscv_cpu_virt_enabled(env));
> +                                     riscv_cpu_virt_enabled(env));
>              if (riscv_cpu_virt_enabled(env) && tval) {
>                  env->mstatus = set_field(env->mstatus, MSTATUS_GVA, 1);
>              }
> -#endif
>
>              mtval2 = env->guest_phys_fault_addr;
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index aaef6c6f20..e33f6cdc11 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -446,8 +446,8 @@ static int validate_vm(CPURISCVState *env, target_ulong vm)
>
>  static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
>  {
> -    target_ulong mstatus = env->mstatus;
> -    target_ulong mask = 0;
> +    uint64_t mstatus = env->mstatus;
> +    uint64_t mask = 0;
>      int dirty;
>
>      /* flush tlb on mstatus fields that affect VM */
> @@ -480,19 +480,20 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
>  #ifdef TARGET_RISCV32
>  static int read_mstatush(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> -    *val = env->mstatush;
> +    *val = env->mstatus >> 32;
>      return 0;
>  }
>
>  static int write_mstatush(CPURISCVState *env, int csrno, target_ulong val)
>  {
> -    if ((val ^ env->mstatush) & (MSTATUS_MPV)) {
> +    uint64_t valh = (uint64_t)val << 32;
> +    uint64_t mask = MSTATUS_MPV | MSTATUS_GVA;
> +
> +    if ((valh ^ env->mstatus) & (MSTATUS_MPV)) {
>          tlb_flush(env_cpu(env));
>      }
>
> -    val &= MSTATUS_MPV | MSTATUS_GVA;
> -
> -    env->mstatush = val;
> +    env->mstatus = (env->mstatus & ~mask) | (valh & mask);
>
>      return 0;
>  }
> @@ -1105,7 +1106,8 @@ static int read_vsstatus(CPURISCVState *env, int csrno, target_ulong *val)
>
>  static int write_vsstatus(CPURISCVState *env, int csrno, target_ulong val)
>  {
> -    env->vsstatus = val;
> +    uint64_t mask = (target_ulong)-1;
> +    env->vsstatus = (env->vsstatus & ~mask) | (uint64_t)val;
>      return 0;
>  }
>
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 4ce73575a7..e20d56dcb8 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -78,7 +78,8 @@ target_ulong helper_csrrc(CPURISCVState *env, target_ulong src,
>
>  target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
>  {
> -    target_ulong prev_priv, prev_virt, mstatus;
> +    uint64_t mstatus;
> +    target_ulong prev_priv, prev_virt;
>
>      if (!(env->priv >= PRV_S)) {
>          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> @@ -147,18 +148,14 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
>          riscv_raise_exception(env, RISCV_EXCP_INST_ADDR_MIS, GETPC());
>      }
>
> -    target_ulong mstatus = env->mstatus;
> +    uint64_t mstatus = env->mstatus;
>      target_ulong prev_priv = get_field(mstatus, MSTATUS_MPP);
> -    target_ulong prev_virt = MSTATUS_MPV_ISSET(env);
> +    target_ulong prev_virt = get_field(env->mstatus, MSTATUS_MPV);
>      mstatus = set_field(mstatus, MSTATUS_MIE,
>                          get_field(mstatus, MSTATUS_MPIE));
>      mstatus = set_field(mstatus, MSTATUS_MPIE, 1);
>      mstatus = set_field(mstatus, MSTATUS_MPP, PRV_U);
> -#ifdef TARGET_RISCV32
> -    env->mstatush = set_field(env->mstatush, MSTATUS_MPV, 0);
> -#else
>      mstatus = set_field(mstatus, MSTATUS_MPV, 0);
> -#endif
>      env->mstatus = mstatus;
>      riscv_cpu_set_mode(env, prev_priv);
>
> --
> 2.28.0
>

