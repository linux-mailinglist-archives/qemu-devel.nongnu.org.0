Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E809F505FE6
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 00:47:45 +0200 (CEST)
Received: from localhost ([::1]:47644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nga9o-0000gr-Mv
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 18:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nga8J-0007b1-HQ; Mon, 18 Apr 2022 18:46:12 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:44566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nga8H-0001Ac-5B; Mon, 18 Apr 2022 18:46:11 -0400
Received: by mail-io1-xd32.google.com with SMTP id e194so11361189iof.11;
 Mon, 18 Apr 2022 15:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gOj+3XG1iO6QudcCY1Vq4DdlMszmKZ2F7GOCsAAe1hs=;
 b=MO2azu2S5fDhNwP40Uk1miaPf9Oqd8eHPQhXOC1Z+UMdS6a/WxJ0c5ihjI13kPjypC
 t8dLrdOx/Hm6YKPJ6ni4DBMTh42H50HGp6p5G9iakdBOUOdGBm3guSJZNzYpLBoDSxC9
 bM9ZL5GWilcBcHCK5K1t0K11dAl2VROd/mna/MRC/CzZ8qkJ87fBacUpAn2vI1EKb8vj
 3LqtdHXQVUSN2NWCTjvuxVtJafgH0laU2W6lNQEHtvtSzaCgXUe98ooCCoiMKR/szUJ0
 2gji0WurS2guKjlvsbqbNAfOyh3QS4hA8diDykjfiVzJYMX2wKViu13ihvQxm1NpeJX7
 N+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gOj+3XG1iO6QudcCY1Vq4DdlMszmKZ2F7GOCsAAe1hs=;
 b=eUyrpvQxnLhXC39VsbLPMAJhLA09cM3yAbIP9qPNUxx7s/1vbUQq3147icEZKorAH+
 DT+IJpboq6+uWe2ktAcyQnMBff3nttEdAkze1J0vRsCjhgnfSIkG2jPtvDvFAllBm9vw
 tJ2TC7C6wnx6944lG7lAe1ULCfHP+foohTIEleP0LGfPszUYFHT96Kn8ix8EVSkapGmK
 Em3yc4C//gmUCIuIFqcvmATSYjtR3aS0F+2D6vtH+xUtKPVSbhJt8l8jZ3XH+VyJubi3
 qA4DSfieUOJauUZ/Fj9bMEi386jtHIdxBjYF3I0OVq8JlQw1AlGyG8dVJJojmq3mN+6Q
 Z3Mw==
X-Gm-Message-State: AOAM530lqJNR3PHb29wpeXN9MWht11CaXnpcFlCu0F7YDslR4hLg0OEa
 hbdWWxISbG92HLpoLLsHj3EBHrLWeSCvPeZRtP8=
X-Google-Smtp-Source: ABdhPJxCUcjh3gVMmshrUkro3aM6D8VOfFBQE7H+ABRXMVtAfRCHOHli/5no+HxFnx1rHP9GpVvmqB+cFpNhF5A3TXA=
X-Received: by 2002:a05:6638:d06:b0:326:ba0:347 with SMTP id
 q6-20020a0566380d0600b003260ba00347mr5911988jaj.68.1650321960080; Mon, 18 Apr
 2022 15:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220331000127.2107823-1-atishp@rivosinc.com>
 <20220331000127.2107823-9-atishp@rivosinc.com>
 <CAKmqyKMmY_nfFpO7r2F+VHjFgLTO3BtB7kgCJ=H9OYJfZ7L2+Q@mail.gmail.com>
 <CAHBxVyEa5Hc7NC57c02VRL9OkjgZ6kOwsPczpts7i6+JpQcsJQ@mail.gmail.com>
In-Reply-To: <CAHBxVyEa5Hc7NC57c02VRL9OkjgZ6kOwsPczpts7i6+JpQcsJQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Apr 2022 08:45:34 +1000
Message-ID: <CAKmqyKO8cpdfW3Y=62PYJJCS7e6yN96FYiyGYESeC8Tyq5EwyA@mail.gmail.com>
Subject: Re: [PATCH v7 08/12] target/riscv: Add sscofpmf extension support
To: Atish Kumar Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Apr 16, 2022 at 9:54 AM Atish Kumar Patra <atishp@rivosinc.com> wrote:
>
> On Wed, Apr 13, 2022 at 12:08 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Thu, Mar 31, 2022 at 10:19 AM Atish Patra <atishp@rivosinc.com> wrote:
> > >
> > > The Sscofpmf ('Ss' for Privileged arch and Supervisor-level extensions,
> > > and 'cofpmf' for Count OverFlow and Privilege Mode Filtering)
> > > extension allows the perf to handle overflow interrupts and filtering
> > > support. This patch provides a framework for programmable
> > > counters to leverage the extension. As the extension doesn't have any
> > > provision for the overflow bit for fixed counters, the fixed events
> > > can also be monitoring using programmable counters. The underlying
> > > counters for cycle and instruction counters are always running. Thus,
> > > a separate timer device is programmed to handle the overflow.
> > >
> > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > ---
> > >  target/riscv/cpu.c      |  11 ++
> > >  target/riscv/cpu.h      |  25 +++
> > >  target/riscv/cpu_bits.h |  55 +++++++
> > >  target/riscv/csr.c      | 156 ++++++++++++++++--
> > >  target/riscv/pmu.c      | 347 +++++++++++++++++++++++++++++++++++++++-
> > >  target/riscv/pmu.h      |   7 +
> > >  6 files changed, 590 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > index f63602828680..9715eed2fc4e 100644
> > > --- a/target/riscv/cpu.c
> > > +++ b/target/riscv/cpu.c
> > > @@ -22,6 +22,7 @@
> > >  #include "qemu/ctype.h"
> > >  #include "qemu/log.h"
> > >  #include "cpu.h"
> > > +#include "pmu.h"
> > >  #include "internals.h"
> > >  #include "exec/exec-all.h"
> > >  #include "qapi/error.h"
> > > @@ -696,6 +697,15 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> > >          set_misa(env, env->misa_mxl, ext);
> > >      }
> > >
> > > +#ifndef CONFIG_USER_ONLY
> > > +    if (cpu->cfg.pmu_num) {
> > > +        if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscofpmf) {
> > > +            cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> > > +                                          riscv_pmu_timer_cb, cpu);
> > > +        }
> > > +     }
> > > +#endif
> > > +
> > >      riscv_cpu_register_gdb_regs_for_features(cs);
> > >
> > >      qemu_init_vcpu(cs);
> > > @@ -795,6 +805,7 @@ static Property riscv_cpu_properties[] = {
> > >      DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
> > >      DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
> > >      DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
> > > +    DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
> > >      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> > >      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> > >      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> > > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > > index 0fa15595fb37..a0e2279ea5e6 100644
> > > --- a/target/riscv/cpu.h
> > > +++ b/target/riscv/cpu.h
> > > @@ -131,6 +131,8 @@ typedef struct PMUCTRState {
> > >      /* Snapshort value of a counter in RV32 */
> > >      target_ulong mhpmcounterh_prev;
> > >      bool started;
> > > +    /* Value beyond UINT32_MAX/UINT64_MAX before overflow interrupt trigger */
> > > +    target_ulong irq_overflow_left;
> > >  } PMUCTRState;
> > >
> > >  struct CPUArchState {
> > > @@ -291,6 +293,9 @@ struct CPUArchState {
> > >      /* PMU event selector configured values. First three are unused*/
> > >      target_ulong mhpmevent_val[RV_MAX_MHPMEVENTS];
> > >
> > > +    /* PMU event selector configured values for RV32*/
> > > +    target_ulong mhpmeventh_val[RV_MAX_MHPMEVENTS];
> > > +
> > >      target_ulong sscratch;
> > >      target_ulong mscratch;
> > >
> > > @@ -413,6 +418,7 @@ struct RISCVCPUConfig {
> > >      bool ext_zhinxmin;
> > >      bool ext_zve32f;
> > >      bool ext_zve64f;
> > > +    bool ext_sscofpmf;
> > >
> > >      /* Vendor-specific custom extensions */
> > >      bool ext_XVentanaCondOps;
> > > @@ -452,6 +458,12 @@ struct ArchCPU {
> > >
> > >      /* Configuration Settings */
> > >      RISCVCPUConfig cfg;
> > > +
> > > +    QEMUTimer *pmu_timer;
> > > +    /* A bitmask of Available programmable counters */
> > > +    uint32_t pmu_avail_ctrs;
> > > +    /* Mapping of events to counters */
> > > +    GHashTable *pmu_event_ctr_map;
> > >  };
> > >
> > >  static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
> > > @@ -709,6 +721,19 @@ enum {
> > >      CSR_TABLE_SIZE = 0x1000
> > >  };
> > >
> > > +/**
> > > + * The event id are encoded based on the encoding specified in the
> > > + * SBI specification v0.3
> > > + */
> > > +
> > > +enum riscv_pmu_event_idx {
> > > +    RISCV_PMU_EVENT_HW_CPU_CYCLES = 0x01,
> > > +    RISCV_PMU_EVENT_HW_INSTRUCTIONS = 0x02,
> > > +    RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS = 0x10019,
> > > +    RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS = 0x1001B,
> > > +    RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS = 0x10021,
> > > +};
> > > +
> > >  /* CSR function table */
> > >  extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
> > >
> > > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > > index 48b39e6d52a7..d0b53e5ea072 100644
> > > --- a/target/riscv/cpu_bits.h
> > > +++ b/target/riscv/cpu_bits.h
> > > @@ -400,6 +400,37 @@
> > >  #define CSR_MHPMEVENT29     0x33d
> > >  #define CSR_MHPMEVENT30     0x33e
> > >  #define CSR_MHPMEVENT31     0x33f
> > > +
> > > +#define CSR_MHPMEVENT3H     0x723
> > > +#define CSR_MHPMEVENT4H     0x724
> > > +#define CSR_MHPMEVENT5H     0x725
> > > +#define CSR_MHPMEVENT6H     0x726
> > > +#define CSR_MHPMEVENT7H     0x727
> > > +#define CSR_MHPMEVENT8H     0x728
> > > +#define CSR_MHPMEVENT9H     0x729
> > > +#define CSR_MHPMEVENT10H    0x72a
> > > +#define CSR_MHPMEVENT11H    0x72b
> > > +#define CSR_MHPMEVENT12H    0x72c
> > > +#define CSR_MHPMEVENT13H    0x72d
> > > +#define CSR_MHPMEVENT14H    0x72e
> > > +#define CSR_MHPMEVENT15H    0x72f
> > > +#define CSR_MHPMEVENT16H    0x730
> > > +#define CSR_MHPMEVENT17H    0x731
> > > +#define CSR_MHPMEVENT18H    0x732
> > > +#define CSR_MHPMEVENT19H    0x733
> > > +#define CSR_MHPMEVENT20H    0x734
> > > +#define CSR_MHPMEVENT21H    0x735
> > > +#define CSR_MHPMEVENT22H    0x736
> > > +#define CSR_MHPMEVENT23H    0x737
> > > +#define CSR_MHPMEVENT24H    0x738
> > > +#define CSR_MHPMEVENT25H    0x739
> > > +#define CSR_MHPMEVENT26H    0x73a
> > > +#define CSR_MHPMEVENT27H    0x73b
> > > +#define CSR_MHPMEVENT28H    0x73c
> > > +#define CSR_MHPMEVENT29H    0x73d
> > > +#define CSR_MHPMEVENT30H    0x73e
> > > +#define CSR_MHPMEVENT31H    0x73f
> > > +
> > >  #define CSR_MHPMCOUNTER3H   0xb83
> > >  #define CSR_MHPMCOUNTER4H   0xb84
> > >  #define CSR_MHPMCOUNTER5H   0xb85
> > > @@ -461,6 +492,7 @@
> > >  #define CSR_VSMTE           0x2c0
> > >  #define CSR_VSPMMASK        0x2c1
> > >  #define CSR_VSPMBASE        0x2c2
> > > +#define CSR_SCOUNTOVF       0xda0
> > >
> > >  /* mstatus CSR bits */
> > >  #define MSTATUS_UIE         0x00000001
> > > @@ -635,6 +667,7 @@ typedef enum RISCVException {
> > >  #define IRQ_VS_EXT                         10
> > >  #define IRQ_M_EXT                          11
> > >  #define IRQ_S_GEXT                         12
> > > +#define IRQ_PMU_OVF                        13
> > >  #define IRQ_LOCAL_MAX                      16
> > >  #define IRQ_LOCAL_GUEST_MAX                (TARGET_LONG_BITS - 1)
> > >
> > > @@ -652,11 +685,13 @@ typedef enum RISCVException {
> > >  #define MIP_VSEIP                          (1 << IRQ_VS_EXT)
> > >  #define MIP_MEIP                           (1 << IRQ_M_EXT)
> > >  #define MIP_SGEIP                          (1 << IRQ_S_GEXT)
> > > +#define MIP_LCOFIP                         (1 << IRQ_PMU_OVF)
> > >
> > >  /* sip masks */
> > >  #define SIP_SSIP                           MIP_SSIP
> > >  #define SIP_STIP                           MIP_STIP
> > >  #define SIP_SEIP                           MIP_SEIP
> > > +#define SIP_LCOFIP                         MIP_LCOFIP
> > >
> > >  /* MIE masks */
> > >  #define MIE_SEIE                           (1 << IRQ_S_EXT)
> > > @@ -804,4 +839,24 @@ typedef enum RISCVException {
> > >  #define HVICTL_VALID_MASK                  \
> > >      (HVICTL_VTI | HVICTL_IID | HVICTL_IPRIOM | HVICTL_IPRIO)
> > >
> > > +/* PMU related bits */
> > > +#define MIE_LCOFIE                         (1 << IRQ_PMU_OVF)
> > > +
> > > +#define MHPMEVENT_BIT_OF                   BIT_ULL(63)
> > > +#define MHPMEVENTH_BIT_OF                  BIT(31)
> > > +#define MHPMEVENT_BIT_MINH                 BIT_ULL(62)
> > > +#define MHPMEVENTH_BIT_MINH                BIT(30)
> > > +#define MHPMEVENT_BIT_SINH                 BIT_ULL(61)
> > > +#define MHPMEVENTH_BIT_SINH                BIT(29)
> > > +#define MHPMEVENT_BIT_UINH                 BIT_ULL(60)
> > > +#define MHPMEVENTH_BIT_UINH                BIT(28)
> > > +#define MHPMEVENT_BIT_VSINH                BIT_ULL(59)
> > > +#define MHPMEVENTH_BIT_VSINH               BIT(27)
> > > +#define MHPMEVENT_BIT_VUINH                BIT_ULL(58)
> > > +#define MHPMEVENTH_BIT_VUINH               BIT(26)
> > > +
> > > +#define MHPMEVENT_SSCOF_MASK               _ULL(0xFFFF000000000000)
> > > +#define MHPMEVENT_IDX_MASK                 0xFFFFF
> > > +#define MHPMEVENT_SSCOF_RESVD              16
> > > +
> > >  #endif
> > > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > > index 04796b99d0fe..519d6377fd9f 100644
> > > --- a/target/riscv/csr.c
> > > +++ b/target/riscv/csr.c
> > > @@ -72,7 +72,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
> > >      CPUState *cs = env_cpu(env);
> > >      RISCVCPU *cpu = RISCV_CPU(cs);
> > >      int ctr_index;
> > > -    int base_csrno = CSR_HPMCOUNTER3;
> > > +    int base_csrno = CSR_CYCLE;
> > >      bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
> > >
> > >      if (rv32 && csrno >= CSR_CYCLEH) {
> > > @@ -81,11 +81,18 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
> > >      }
> > >      ctr_index = csrno - base_csrno;
> > >
> > > -    if (!cpu->cfg.pmu_num || ctr_index >= (cpu->cfg.pmu_num)) {
> > > +    if ((csrno >= CSR_CYCLE && csrno <= CSR_INSTRET) ||
> > > +        (csrno >= CSR_CYCLEH && csrno <= CSR_INSTRETH)) {
> > > +        goto skip_ext_pmu_check;
> > > +    }
> > > +
> > > +    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & BIT(ctr_index)))) {
> > >          /* No counter is enabled in PMU or the counter is out of range */
> > >          return RISCV_EXCP_ILLEGAL_INST;
> > >      }
> > >
> > > +skip_ext_pmu_check:
> > > +
> > >      if (env->priv == PRV_S) {
> > >          switch (csrno) {
> > >          case CSR_CYCLE:
> > > @@ -104,7 +111,6 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
> > >              }
> > >              break;
> > >          case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> > > -            ctr_index = csrno - CSR_CYCLE;
> > >              if (!get_field(env->mcounteren, 1 << ctr_index)) {
> > >                  return RISCV_EXCP_ILLEGAL_INST;
> > >              }
> > > @@ -128,7 +134,6 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
> > >                  }
> > >                  break;
> > >              case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> > > -                ctr_index = csrno - CSR_CYCLEH;
> > >                  if (!get_field(env->mcounteren, 1 << ctr_index)) {
> > >                      return RISCV_EXCP_ILLEGAL_INST;
> > >                  }
> > > @@ -158,7 +163,6 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
> > >              }
> > >              break;
> > >          case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> > > -            ctr_index = csrno - CSR_CYCLE;
> > >              if (!get_field(env->hcounteren, 1 << ctr_index) &&
> > >                   get_field(env->mcounteren, 1 << ctr_index)) {
> > >                  return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > > @@ -186,7 +190,6 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
> > >                  }
> > >                  break;
> > >              case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> > > -                ctr_index = csrno - CSR_CYCLEH;
> > >                  if (!get_field(env->hcounteren, 1 << ctr_index) &&
> > >                       get_field(env->mcounteren, 1 << ctr_index)) {
> > >                      return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > > @@ -238,6 +241,18 @@ static RISCVException mctr32(CPURISCVState *env, int csrno)
> > >      return mctr(env, csrno);
> > >  }
> > >
> > > +static RISCVException sscofpmf(CPURISCVState *env, int csrno)
> > > +{
> > > +    CPUState *cs = env_cpu(env);
> > > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > > +
> > > +    if (!cpu->cfg.ext_sscofpmf) {
> > > +        return RISCV_EXCP_ILLEGAL_INST;
> > > +    }
> > > +
> > > +    return RISCV_EXCP_NONE;
> > > +}
> > > +
> > >  static RISCVException any(CPURISCVState *env, int csrno)
> > >  {
> > >      return RISCV_EXCP_NONE;
> > > @@ -622,11 +637,36 @@ static int write_mhpmevent(CPURISCVState *env, int csrno, target_ulong val)
> > >  {
> > >      int evt_index = csrno - CSR_MCOUNTINHIBIT;
> > >
> > > +    if (riscv_cpu_mxl(env) != MXL_RV32) {
> >
> > Is this right? What if the guest writes the high bytes first?
> >
>
> Most of the current software is implemented with lower bytes first.
> But I understand your concern
> that it doesn't provide any guarantee. We probably can have another
> field that can track the order of the updates.
> riscv_pmu_update_event_map will be only called when both lower/upper
> half is complete.

Why can't you just update it on every write? Guest software should be
setting the high bits to 0xFFFF_FFFF first to avoid any issues

Alistair

>
>
> > Alistair

