Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3D1524491
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 06:50:03 +0200 (CEST)
Received: from localhost ([::1]:33182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np0m2-0000YD-Eq
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 00:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1np0kt-0007oN-HM
 for qemu-devel@nongnu.org; Thu, 12 May 2022 00:48:51 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1np0kr-0007RF-F8
 for qemu-devel@nongnu.org; Thu, 12 May 2022 00:48:51 -0400
Received: by mail-wr1-x434.google.com with SMTP id b19so5503187wrh.11
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 21:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+WariQeLAe8ryqxfdDHpAyLWc3kpeRx4D2CiDsnJ9nY=;
 b=7EklJAiaKwbJGSfg8OSykxvQ51km1+8EwV6iLxk5BT6YdiJ2fhCBCJEKWNBjJX+Wt6
 tedBQlV/IIVa9op4mS//5ITbh0BNmUhrRo3LZPyQTrWqp0eiWExdisqbLBKKkOrUV+27
 i+0CVoycoDhRgA0SVhCKn/oIroVtOprzxMHYArFCHekCl8e32ZIxH8XCGmTi+U4mJ/ji
 0ff7jSYCrBwzY9nraZkqt8ng4rUYO3ofekw87Rr+8fQc630K2+/m06O1XVavzUpnQ4F1
 JYsZ9IXqimBqVNt+7a+Rj61X0qBDuf8YBSFRRZ+cUUSkS7l86vl/xQwLdPtTZ6Fsskb4
 uN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+WariQeLAe8ryqxfdDHpAyLWc3kpeRx4D2CiDsnJ9nY=;
 b=FSfW7S3bdmw6XABlZzH8sqSOslZhgNHWGYko5tzjJaGrfy3bna45DCy9c3wZgAYkPx
 MOL52NQtsp5dgn9hsbe7jtbVqR7or3oxn7BWQNRf+kZq0mNYigA2aNgkST5YN9+9c9Jp
 SIA6XUuTetPapCQ34d4hL9RQBSgxEb/FGiq9bWG6nB0gaSGyRfqRZ44LavZAP8kQl7dd
 z3QrtVFETqLamAiC/WLVVDeBhwzLAaKaN3GFuqNaKnMVy/yAU8XqGyomi+6i7z8G1Oi8
 HUVgkeALcmzPVm3QxRqkGcjbAFV/fQIxoV6G5Mx66kQ50AomVOWDTV1YHcURn5COxVFe
 10pA==
X-Gm-Message-State: AOAM533n0GlbI7efVmqbxmX//fjjpeZbEdaSznC7JysPUpeXmnuEkxRI
 vCyejLBFmA7TaKWMCQ8IgW+IFJBsRSDuR3K2c+5hHA==
X-Google-Smtp-Source: ABdhPJwNG467esme+X2L7BDecakSjACWO8dq6ttJjy+hQFWnAiXdvcj/lVIxLMiI64Iyjn1S/c1sD5oEbfbFJfd6RPU=
X-Received: by 2002:a5d:6d0d:0:b0:20c:530c:1681 with SMTP id
 e13-20020a5d6d0d000000b0020c530c1681mr25402763wrq.214.1652330927482; Wed, 11
 May 2022 21:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220509212827.2057822-1-atishp@rivosinc.com>
 <20220509212827.2057822-4-atishp@rivosinc.com>
In-Reply-To: <20220509212827.2057822-4-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 12 May 2022 10:18:35 +0530
Message-ID: <CAAhSdy2mcjiMFQBhmPMf4Vc5Jfmr2W_+jk0h+bswfR3ATn=DjA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] target/riscv: Add vstimecmp support
To: Atish Patra <atishp@rivosinc.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::434;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, May 10, 2022 at 3:03 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> vstimecmp CSR allows the guest OS or to program the next guest timer
> interrupt directly. Thus, hypervisor no longer need to inject the
> timer interrupt to the guest if vstimecmp is used. This was ratified
> as a part of the Sstc extension.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  target/riscv/cpu.h         |   5 ++
>  target/riscv/cpu_bits.h    |   4 ++
>  target/riscv/cpu_helper.c  |  11 +++-
>  target/riscv/csr.c         | 112 ++++++++++++++++++++++++++++++++++++-
>  target/riscv/machine.c     |   1 +
>  target/riscv/time_helper.c |  16 ++++++
>  6 files changed, 144 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 9a01e6d0f587..798874d6189d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -280,6 +280,9 @@ struct CPUArchState {
>      uint64_t stimecmp;
>      /* For RV32 only */
>      uint8_t stimecmp_wr_done;

Add new line here.

> +    uint64_t vstimecmp;
> +    /* For RV32 only */
> +    uint8_t vstimecmp_wr_done;
>
>      /* physical memory protection */
>      pmp_table_t pmp_state;
> @@ -335,6 +338,8 @@ struct CPUArchState {
>
>      /* Fields from here on are preserved across CPU reset. */
>      QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
> +    QEMUTimer *vstimer; /* Internal timer for VS-mode interrupt */
> +    bool vstime_irq;
>
>      hwaddr kernel_addr;
>      hwaddr fdt_addr;
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 29d0e4a1be01..5c9f512872e1 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -272,6 +272,10 @@
>  #define CSR_VSIP            0x244
>  #define CSR_VSATP           0x280
>
> +/* Sstc virtual CSRs */
> +#define CSR_VSTIMECMP       0x24D
> +#define CSR_VSTIMECMPH      0x25D
> +
>  #define CSR_MTINST          0x34a
>  #define CSR_MTVAL2          0x34b
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index e1aa4f2097c1..2715021c022e 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -344,8 +344,9 @@ static uint64_t riscv_cpu_all_pending(CPURISCVState *env)
>  {
>      uint32_t gein = get_field(env->hstatus, HSTATUS_VGEIN);
>      uint64_t vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
> +    uint64_t vstip = (env->vstime_irq) ? MIP_VSTIP : 0;
>
> -    return (env->mip | vsgein) & env->mie;
> +    return (env->mip | vsgein | vstip) & env->mie;
>  }
>
>  int riscv_cpu_mirq_pending(CPURISCVState *env)
> @@ -604,7 +605,7 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
>  {
>      CPURISCVState *env = &cpu->env;
>      CPUState *cs = CPU(cpu);
> -    uint64_t gein, vsgein = 0, old = env->mip;
> +    uint64_t gein, vsgein = 0, vstip = 0, old = env->mip;
>      bool locked = false;
>
>      if (riscv_cpu_virt_enabled(env)) {
> @@ -612,6 +613,10 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
>          vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
>      }
>
> +    /* No need to update mip for VSTIP */
> +    mask = ((mask == MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
> +    vstip = env->vstime_irq ? MIP_VSTIP : 0;
> +
>      if (!qemu_mutex_iothread_locked()) {
>          locked = true;
>          qemu_mutex_lock_iothread();
> @@ -619,7 +624,7 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
>
>      env->mip = (env->mip & ~mask) | (value & mask);
>
> -    if (env->mip | vsgein) {
> +    if (env->mip | vsgein | vstip) {
>          cpu_interrupt(cs, CPU_INTERRUPT_HARD);
>      } else {
>          cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 8952d1308008..35eb2c4d84eb 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -567,17 +567,110 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
>      return RISCV_EXCP_NONE;
>  }
>
> +static RISCVException sstc_hmode(CPURISCVState *env, int csrno)
> +{
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    if (env->priv == PRV_M) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    if (!(get_field(env->mcounteren, COUNTEREN_TM) &
> +          get_field(env->menvcfg, MENVCFG_STCE))) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    if (!(get_field(env->hcounteren, COUNTEREN_TM) &
> +          get_field(env->henvcfg, HENVCFG_STCE))) {
> +        return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_vstimecmp(CPURISCVState *env, int csrno,
> +                                    target_ulong *val)
> +{
> +    *val = env->vstimecmp;
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_vstimecmph(CPURISCVState *env, int csrno,
> +                                    target_ulong *val)
> +{
> +    *val = env->vstimecmp >> 32;
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_vstimecmp(CPURISCVState *env, int csrno,
> +                                    target_ulong val)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);
> +
> +    if (riscv_cpu_mxl(env) == MXL_RV32) {
> +        env->vstimecmp = deposit64(env->vstimecmp, 0, 32, (uint64_t)val);
> +        env->vstimecmp_wr_done |= 0x01;
> +        if (env->vstimecmp_wr_done != 0x03) {
> +            return RISCV_EXCP_NONE;
> +        } else {
> +            env->vstimecmp_wr_done = 0;
> +        }
> +    } else {
> +        env->vstimecmp = val;
> +    }
> +
> +    riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
> +                              env->htimedelta, MIP_VSTIP);
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_vstimecmph(CPURISCVState *env, int csrno,
> +                                    target_ulong val)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);
> +
> +    env->vstimecmp = deposit64(env->vstimecmp, 32, 32, (uint64_t)val);
> +    env->vstimecmp_wr_done |= 0x02;
> +    if (env->vstimecmp_wr_done != 0x03) {
> +            return RISCV_EXCP_NONE;
> +    }
> +
> +    env->vstimecmp_wr_done = 0;
> +    riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
> +                              env->htimedelta, MIP_VSTIP);
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
>  static RISCVException read_stimecmp(CPURISCVState *env, int csrno,
>                                      target_ulong *val)
>  {
> -    *val = env->stimecmp;
> +    if (riscv_cpu_virt_enabled(env)) {
> +        *val = env->vstimecmp;
> +    } else {
> +        *val = env->stimecmp;
> +    }
> +
>      return RISCV_EXCP_NONE;
>  }
>
>  static RISCVException read_stimecmph(CPURISCVState *env, int csrno,
>                                      target_ulong *val)
>  {
> -    *val = env->stimecmp >> 32;
> +    if (riscv_cpu_virt_enabled(env)) {
> +        *val = env->vstimecmp >> 32;
> +    } else {
> +        *val = env->stimecmp >> 32;
> +    }
> +
>      return RISCV_EXCP_NONE;
>  }
>
> @@ -586,6 +679,10 @@ static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
>  {
>      RISCVCPU *cpu = env_archcpu(env);
>
> +    if (riscv_cpu_virt_enabled(env)) {
> +        return write_vstimecmp(env, csrno, val);
> +    }
> +
>      if (riscv_cpu_mxl(env) == MXL_RV32) {
>          env->stimecmp = deposit64(env->stimecmp, 0, 32, (uint64_t)val);
>          env->stimecmp_wr_done |= 0x01;
> @@ -608,6 +705,10 @@ static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
>  {
>      RISCVCPU *cpu = env_archcpu(env);
>
> +    if (riscv_cpu_virt_enabled(env)) {
> +        return write_vstimecmph(env, csrno, val);
> +    }
> +
>      env->stimecmp = deposit64(env->stimecmp, 32, 32, (uint64_t)val);
>      env->stimecmp_wr_done |= 0x02;
>      if (env->stimecmp_wr_done != 0x03) {
> @@ -1612,6 +1713,7 @@ static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
>      if (csrno != CSR_HVIP) {
>          gin = get_field(env->hstatus, HSTATUS_VGEIN);
>          old_mip |= (env->hgeip & ((target_ulong)1 << gin)) ? MIP_VSEIP : 0;
> +        old_mip |= env->vstime_irq ? MIP_VSTIP : 0;
>      }
>
>      if (ret_val) {
> @@ -3433,6 +3535,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>                                            .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_STIMECMPH] = { "stimecmph", sstc, read_stimecmph, write_stimecmph,
>                                            .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VSTIMECMP] = { "vstimecmp", sstc_hmode, read_vstimecmp,
> +                                          write_vstimecmp,
> +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VSTIMECMPH] = { "vstimecmph", sstc_hmode, read_vstimecmph,
> +                                          write_vstimecmph,
> +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
>
>      /* Supervisor Protection and Translation */
>      [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index ee02bfc18916..d453b401bdfd 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -92,6 +92,7 @@ static const VMStateDescription vmstate_hyper = {
>          VMSTATE_UINTTL(env.hgeie, RISCVCPU),
>          VMSTATE_UINTTL(env.hgeip, RISCVCPU),
>          VMSTATE_UINT64(env.htimedelta, RISCVCPU),
> +        VMSTATE_UINT64(env.vstimecmp, RISCVCPU),

Add vstimecmp_wr_done to vmstate_hyper.

>
>          VMSTATE_UINTTL(env.hvictl, RISCVCPU),
>          VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
> diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
> index f3fb5eac7b7b..8cce667dfd47 100644
> --- a/target/riscv/time_helper.c
> +++ b/target/riscv/time_helper.c
> @@ -22,6 +22,14 @@
>  #include "time_helper.h"
>  #include "hw/intc/riscv_aclint.h"
>
> +static void riscv_vstimer_cb(void *opaque)
> +{
> +    RISCVCPU *cpu = opaque;
> +    CPURISCVState *env = &cpu->env;
> +    env->vstime_irq = 1;
> +    riscv_cpu_update_mip(cpu, MIP_VSTIP, BOOL_TO_MASK(1));
> +}
> +
>  static void riscv_stimer_cb(void *opaque)
>  {
>      RISCVCPU *cpu = opaque;
> @@ -47,10 +55,16 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
>           * If we're setting an stimecmp value in the "past",
>           * immediately raise the timer interrupt
>           */
> +        if (timer_irq == MIP_VSTIP) {
> +            env->vstime_irq = 1;
> +        }
>          riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(1));
>          return;
>      }
>
> +    if (timer_irq == MIP_VSTIP) {
> +        env->vstime_irq = 0;
> +    }
>      /* Clear the [V]STIP bit in mip */
>      riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
>
> @@ -95,4 +109,6 @@ void riscv_timer_init(RISCVCPU *cpu)
>      env->stimer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &riscv_stimer_cb, cpu);
>      env->stimecmp = 0;
>
> +    env->vstimer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &riscv_vstimer_cb, cpu);
> +    env->vstimecmp = 0;
>  }
> --
> 2.25.1
>
>

Regards,
Anup

