Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E56F46E25C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 07:19:04 +0100 (CET)
Received: from localhost ([::1]:46118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvClh-0003da-Mf
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 01:19:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mvCi2-0002bN-2g
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 01:15:14 -0500
Received: from [2a00:1450:4864:20::32a] (port=44990
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mvChx-0003I5-Nc
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 01:15:13 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 p27-20020a05600c1d9b00b0033bf8532855so3277746wms.3
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 22:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LgJGzUf2Gs7UblxasKc0SI5VRXNyeX55JAVlRcbi7m4=;
 b=r1VAgkbuiLflO1nH0CuU+bsqv5nMdWYU7wJpN2R9tiQ6na33liPm/eF4LoPpqMH388
 PWw1QS0cYrXhuV5kRplX5+eAUX/ejSD2pXWNcHwLMPONuRbemdlSvkhCxNnyaIRFcMzC
 qUehy4jhe1QNRC+oS2Nm6/mhVrUCHYHqIoeEMzeV+nJfCNFOIfnieUNLiuOfpO6t7p6j
 ZWTtwsvOqxgxP5XMJTT1Mh25YhN+++n951OCrTm30Mbc5mzWgbOONOu9L+Ri3c/6D7hX
 uoZnCZ+0l36gAmr3p/NQCO0DN2IRkKSDCPIlHbhpdDWegUtc0XnRrAue8+/WidCOuF6G
 /GaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LgJGzUf2Gs7UblxasKc0SI5VRXNyeX55JAVlRcbi7m4=;
 b=qfxUseVkiOuEFCUFFx2E/5UtVCyahqFRBtmsPj3BtCgEn6EItgVwOMN9T6tNB9I3wJ
 chr5PDie8wucLmmRbqs4bh01L+VyZecZlCBFtFww4h9JKbhIYlmVJWGC50d+yyN+CYon
 9JwZxnCXcrk/g6jsFKZ7IYZOpUBWrHsbpLh4h0BIkx7vUfoh0PFnIDhFlUCvnPbxE/1p
 Mpi5b2S3q8Ls1JBDjMZ4x7w947aq65As4QWM6nAnxK0lRGKgwo3EA8+hzhysuu4ricPe
 XmGWaq1A2ivRVf7cW1Bke4Yq2/9BNECVgAOWhBwFSUCYJD9cpOLs7/8nwnnmrXmI7e/w
 YGDQ==
X-Gm-Message-State: AOAM5338JS0ov1v0n+s5AnE3Pn+ZGgTPi4MSuJCUBg8np7aiwKTBm3hN
 1RjnhoXa9FRQhbQOjtUfz05J9914URo7Jp+A7eA1Lw==
X-Google-Smtp-Source: ABdhPJzgJA0Hrw2BPKGc3R5XajN0fN6hdMwgaH2pF1akO+fyN3khZOQ4dyhdhAVGNQKb7H3t3VSTH9EhiGyZY9+qnUQ=
X-Received: by 2002:a7b:c7cd:: with SMTP id z13mr4642399wmk.59.1639030507178; 
 Wed, 08 Dec 2021 22:15:07 -0800 (PST)
MIME-Version: 1.0
References: <20211026064227.2014502-1-anup.patel@wdc.com>
 <20211026064227.2014502-11-anup.patel@wdc.com>
 <CAKmqyKOzBa8Bu13=K=0v_MLjY2Pm6BAtEuJ5SDBuRAwEqbRstA@mail.gmail.com>
In-Reply-To: <CAKmqyKOzBa8Bu13=K=0v_MLjY2Pm6BAtEuJ5SDBuRAwEqbRstA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 9 Dec 2021 11:44:55 +0530
Message-ID: <CAAhSdy0D3xtd1FV=61STDyvfjKx3gK4xm7ax7Zcn-Fgh7caYNA@mail.gmail.com>
Subject: Re: [PATCH v4 10/22] target/riscv: Implement AIA CSRs for 64 local
 interrupts on RV32
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::32a;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 4, 2021 at 10:13 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Oct 26, 2021 at 5:10 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The AIA specification adds new CSRs for RV32 so that RISC-V hart can
> > support 64 local interrupts on both RV32 and RV64.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  target/riscv/cpu.h        |  14 +-
> >  target/riscv/cpu_helper.c |  10 +-
> >  target/riscv/csr.c        | 560 +++++++++++++++++++++++++++++++-------
> >  target/riscv/machine.c    |  10 +-
> >  4 files changed, 474 insertions(+), 120 deletions(-)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index c47e57efc8..718a95e864 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -159,12 +159,12 @@ struct CPURISCVState {
> >       */
> >      uint64_t mstatus;
> >
> > -    target_ulong mip;
> > +    uint64_t mip;
> >
> > -    uint32_t miclaim;
> > +    uint64_t miclaim;
> >
> > -    target_ulong mie;
> > -    target_ulong mideleg;
> > +    uint64_t mie;
> > +    uint64_t mideleg;
> >
> >      target_ulong satp;   /* since: priv-1.10.0 */
> >      target_ulong stval;
> > @@ -186,7 +186,7 @@ struct CPURISCVState {
> >      /* Hypervisor CSRs */
> >      target_ulong hstatus;
> >      target_ulong hedeleg;
> > -    target_ulong hideleg;
> > +    uint64_t hideleg;
> >      target_ulong hcounteren;
> >      target_ulong htval;
> >      target_ulong htinst;
> > @@ -399,8 +399,8 @@ void riscv_cpu_list(void);
> >  #ifndef CONFIG_USER_ONLY
> >  bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
> >  void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
> > -int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts);
> > -uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
> > +int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);
> > +uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value);
> >  #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
> >  void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
> >                               uint32_t arg);
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 73ebce1efd..416b11f85c 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -506,7 +506,7 @@ bool riscv_cpu_two_stage_lookup(int mmu_idx)
> >      return mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK;
> >  }
> >
> > -int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
> > +int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
> >  {
> >      CPURISCVState *env = &cpu->env;
> >      if (env->miclaim & interrupts) {
> > @@ -517,11 +517,11 @@ int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
> >      }
> >  }
> >
> > -uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value)
> > +uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
> >  {
> >      CPURISCVState *env = &cpu->env;
> >      CPUState *cs = CPU(cpu);
> > -    uint32_t gein, vsgein = 0, old = env->mip;
> > +    uint64_t gein, vsgein = 0, old = env->mip;
> >      bool locked = false;
> >
> >      if (riscv_cpu_virt_enabled(env)) {
> > @@ -1244,7 +1244,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >       */
> >      bool async = !!(cs->exception_index & RISCV_EXCP_INT_FLAG);
> >      target_ulong cause = cs->exception_index & RISCV_EXCP_INT_MASK;
> > -    target_ulong deleg = async ? env->mideleg : env->medeleg;
> > +    uint64_t deleg = async ? env->mideleg : env->medeleg;
> >      bool write_tval = false;
> >      target_ulong tval = 0;
> >      target_ulong htval = 0;
> > @@ -1311,7 +1311,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >              cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
> >          /* handle the trap in S-mode */
> >          if (riscv_has_ext(env, RVH)) {
> > -            target_ulong hdeleg = async ? env->hideleg : env->hedeleg;
> > +            uint64_t hdeleg = async ? env->hideleg : env->hedeleg;
> >
> >              if (env->two_stage_lookup && write_tval) {
> >                  /*
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 7ff285282b..3a7d89ac34 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -153,6 +153,15 @@ static RISCVException any32(CPURISCVState *env, int csrno)
> >
> >  }
> >
> > +static int aia_any32(CPURISCVState *env, int csrno)
> > +{
> > +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    return any32(env, csrno);
> > +}
> > +
> >  static RISCVException smode(CPURISCVState *env, int csrno)
> >  {
> >      if (riscv_has_ext(env, RVS)) {
> > @@ -162,6 +171,24 @@ static RISCVException smode(CPURISCVState *env, int csrno)
> >      return RISCV_EXCP_ILLEGAL_INST;
> >  }
> >
> > +static int smode32(CPURISCVState *env, int csrno)
> > +{
> > +    if (riscv_cpu_mxl(env) != MXL_RV32) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    return smode(env, csrno);
> > +}
> > +
> > +static int aia_smode32(CPURISCVState *env, int csrno)
> > +{
> > +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    return smode32(env, csrno);
> > +}
> > +
> >  static RISCVException hmode(CPURISCVState *env, int csrno)
> >  {
> >      if (riscv_has_ext(env, RVS) &&
> > @@ -192,6 +219,15 @@ static RISCVException hmode32(CPURISCVState *env, int csrno)
> >
> >  }
> >
> > +static int aia_hmode32(CPURISCVState *env, int csrno)
> > +{
> > +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    return hmode32(env, csrno);
> > +}
> > +
> >  static RISCVException pmp(CPURISCVState *env, int csrno)
> >  {
> >      if (riscv_feature(env, RISCV_FEATURE_PMP)) {
> > @@ -405,15 +441,15 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
> >
> >  /* Machine constants */
> >
> > -#define M_MODE_INTERRUPTS  (MIP_MSIP | MIP_MTIP | MIP_MEIP)
> > -#define S_MODE_INTERRUPTS  (MIP_SSIP | MIP_STIP | MIP_SEIP)
> > -#define VS_MODE_INTERRUPTS (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)
> > -#define HS_MODE_INTERRUPTS (MIP_SGEIP | VS_MODE_INTERRUPTS)
> > +#define M_MODE_INTERRUPTS  ((uint64_t)(MIP_MSIP | MIP_MTIP | MIP_MEIP))
> > +#define S_MODE_INTERRUPTS  ((uint64_t)(MIP_SSIP | MIP_STIP | MIP_SEIP))
> > +#define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP))
> > +#define HS_MODE_INTERRUPTS ((uint64_t)(MIP_SGEIP | VS_MODE_INTERRUPTS))
> >
> > -static const target_ulong delegable_ints = S_MODE_INTERRUPTS |
> > +static const uint64_t delegable_ints = S_MODE_INTERRUPTS |
> >                                             VS_MODE_INTERRUPTS;
> > -static const target_ulong vs_delegable_ints = VS_MODE_INTERRUPTS;
> > -static const target_ulong all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
> > +static const uint64_t vs_delegable_ints = VS_MODE_INTERRUPTS;
> > +static const uint64_t all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
> >                                       HS_MODE_INTERRUPTS;
> >  #define DELEGABLE_EXCPS ((1ULL << (RISCV_EXCP_INST_ADDR_MIS)) | \
> >                           (1ULL << (RISCV_EXCP_INST_ACCESS_FAULT)) | \
> > @@ -662,40 +698,107 @@ static RISCVException write_medeleg(CPURISCVState *env, int csrno,
> >      return RISCV_EXCP_NONE;
> >  }
> >
> > -static RISCVException read_mideleg(CPURISCVState *env, int csrno,
> > -                                   target_ulong *val)
> > +static RISCVException rmw_mideleg64(CPURISCVState *env, int csrno,
> > +                                    uint64_t *ret_val,
> > +                                    uint64_t new_val, uint64_t wr_mask)
> >  {
> > -    *val = env->mideleg;
> > -    return RISCV_EXCP_NONE;
> > -}
> > +    uint64_t mask = wr_mask & delegable_ints;
> > +
> > +    if (ret_val) {
> > +        *ret_val = env->mideleg;
> > +    }
> > +
> > +    env->mideleg = (env->mideleg & ~mask) | (new_val & mask);
> >
> > -static RISCVException write_mideleg(CPURISCVState *env, int csrno,
> > -                                    target_ulong val)
> > -{
> > -    env->mideleg = (env->mideleg & ~delegable_ints) | (val & delegable_ints);
> >      if (riscv_has_ext(env, RVH)) {
> >          env->mideleg |= HS_MODE_INTERRUPTS;
> >      }
> > +
> >      return RISCV_EXCP_NONE;
> >  }
> >
> > -static RISCVException read_mie(CPURISCVState *env, int csrno,
> > -                               target_ulong *val)
> > +static RISCVException rmw_mideleg(CPURISCVState *env, int csrno,
> > +                                  target_ulong *ret_val,
> > +                                  target_ulong new_val, target_ulong wr_mask)
> >  {
> > -    *val = env->mie;
> > -    return RISCV_EXCP_NONE;
> > +    uint64_t rval;
> > +    RISCVException ret;
> > +
> > +    ret = rmw_mideleg64(env, csrno, &rval, new_val, wr_mask);
> > +    if (ret_val) {
> > +        *ret_val = rval;
> > +    }
> > +
> > +    return ret;
> >  }
> >
> > -static RISCVException write_mie(CPURISCVState *env, int csrno,
> > -                                target_ulong val)
> > +static RISCVException rmw_midelegh(CPURISCVState *env, int csrno,
> > +                                   target_ulong *ret_val,
> > +                                   target_ulong new_val,
> > +                                   target_ulong wr_mask)
> >  {
> > -    env->mie = (env->mie & ~all_ints) | (val & all_ints);
> > +    uint64_t rval;
> > +    RISCVException ret;
> > +
> > +    ret = rmw_mideleg64(env, csrno, &rval,
> > +        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
> > +    if (ret_val) {
> > +        *ret_val = rval >> 32;
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +static RISCVException rmw_mie64(CPURISCVState *env, int csrno,
> > +                                uint64_t *ret_val,
> > +                                uint64_t new_val, uint64_t wr_mask)
> > +{
> > +    uint64_t mask = wr_mask & all_ints;
> > +
> > +    if (ret_val) {
> > +        *ret_val = env->mie;
> > +    }
> > +
> > +    env->mie = (env->mie & ~mask) | (new_val & mask);
> > +
> >      if (!riscv_has_ext(env, RVH)) {
> > -        env->mie &= ~MIP_SGEIP;
> > +        env->mie &= ~((uint64_t)MIP_SGEIP);
> >      }
> > +
> >      return RISCV_EXCP_NONE;
> >  }
> >
> > +static RISCVException rmw_mie(CPURISCVState *env, int csrno,
> > +                              target_ulong *ret_val,
> > +                              target_ulong new_val, target_ulong wr_mask)
> > +{
> > +    uint64_t rval;
> > +    RISCVException ret;
> > +
> > +    ret = rmw_mie64(env, csrno, &rval, new_val, wr_mask);
> > +    if (ret_val) {
> > +        *ret_val = rval;
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +static RISCVException rmw_mieh(CPURISCVState *env, int csrno,
> > +                               target_ulong *ret_val,
> > +                               target_ulong new_val, target_ulong wr_mask)
> > +{
> > +    uint64_t rval;
> > +    RISCVException ret;
> > +
> > +    ret = rmw_mie64(env, csrno, &rval,
> > +        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
> > +    if (ret_val) {
> > +        *ret_val = rval >> 32;
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> >  static RISCVException read_mtvec(CPURISCVState *env, int csrno,
> >                                   target_ulong *val)
> >  {
> > @@ -786,17 +889,17 @@ static RISCVException write_mtval(CPURISCVState *env, int csrno,
> >      return RISCV_EXCP_NONE;
> >  }
> >
> > -static RISCVException rmw_mip(CPURISCVState *env, int csrno,
> > -                              target_ulong *ret_value,
> > -                              target_ulong new_value, target_ulong write_mask)
> > +static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
> > +                                uint64_t *ret_val,
> > +                                uint64_t new_val, uint64_t wr_mask)
> >  {
> >      RISCVCPU *cpu = env_archcpu(env);
> >      /* Allow software control of delegable interrupts not claimed by hardware */
> > -    target_ulong mask = write_mask & delegable_ints & ~env->miclaim;
> > -    uint32_t gin, old_mip;
> > +    uint64_t old_mip, mask = wr_mask & delegable_ints & ~env->miclaim;
> > +    uint32_t gin;
> >
> >      if (mask) {
> > -        old_mip = riscv_cpu_update_mip(cpu, mask, (new_value & mask));
> > +        old_mip = riscv_cpu_update_mip(cpu, mask, (new_val & mask));
> >      } else {
> >          old_mip = env->mip;
> >      }
> > @@ -806,13 +909,44 @@ static RISCVException rmw_mip(CPURISCVState *env, int csrno,
> >          old_mip |= (env->hgeip & ((target_ulong)1 << gin)) ? MIP_VSEIP : 0;
> >      }
> >
> > -    if (ret_value) {
> > -        *ret_value = old_mip;
> > +    if (ret_val) {
> > +        *ret_val = old_mip;
> >      }
> >
> >      return RISCV_EXCP_NONE;
> >  }
> >
> > +static RISCVException rmw_mip(CPURISCVState *env, int csrno,
> > +                              target_ulong *ret_val,
> > +                              target_ulong new_val, target_ulong wr_mask)
> > +{
> > +    uint64_t rval;
> > +    RISCVException ret;
> > +
> > +    ret = rmw_mip64(env, csrno, &rval, new_val, wr_mask);
> > +    if (ret_val) {
> > +        *ret_val = rval;
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +static RISCVException rmw_miph(CPURISCVState *env, int csrno,
> > +                               target_ulong *ret_val,
> > +                               target_ulong new_val, target_ulong wr_mask)
> > +{
> > +    uint64_t rval;
> > +    RISCVException ret;
> > +
> > +    ret = rmw_mip64(env, csrno, &rval,
> > +        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
> > +    if (ret_val) {
> > +        *ret_val = rval >> 32;
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> >  /* Supervisor Trap Setup */
> >  static RISCVException read_sstatus(CPURISCVState *env, int csrno,
> >                                     target_ulong *val)
> > @@ -832,45 +966,112 @@ static RISCVException write_sstatus(CPURISCVState *env, int csrno,
> >      return write_mstatus(env, CSR_MSTATUS, newval);
> >  }
> >
> > -static RISCVException read_vsie(CPURISCVState *env, int csrno,
> > -                                target_ulong *val)
> > +static RISCVException rmw_vsie64(CPURISCVState *env, int csrno,
> > +                                 uint64_t *ret_val,
> > +                                 uint64_t new_val, uint64_t wr_mask)
> >  {
> > -    /* Shift the VS bits to their S bit location in vsie */
> > -    *val = (env->mie & env->hideleg & VS_MODE_INTERRUPTS) >> 1;
> > -    return RISCV_EXCP_NONE;
> > +    RISCVException ret;
> > +    uint64_t rval, vsbits, mask = env->hideleg & VS_MODE_INTERRUPTS;
> > +
> > +    /* Bring VS-level bits to correct position */
> > +    vsbits = new_val & (VS_MODE_INTERRUPTS >> 1);
> > +    new_val &= ~(VS_MODE_INTERRUPTS >> 1);
> > +    new_val |= vsbits << 1;
> > +    vsbits = wr_mask & (VS_MODE_INTERRUPTS >> 1);
> > +    wr_mask &= ~(VS_MODE_INTERRUPTS >> 1);
> > +    wr_mask |= vsbits << 1;
> > +
> > +    ret = rmw_mie64(env, csrno, &rval, new_val, wr_mask & mask);
> > +    if (ret_val) {
> > +        rval &= mask;
> > +        vsbits = rval & VS_MODE_INTERRUPTS;
> > +        rval &= ~VS_MODE_INTERRUPTS;
> > +        *ret_val = rval | (vsbits >> 1);
> > +    }
> > +
> > +    return ret;
> >  }
> >
> > -static RISCVException read_sie(CPURISCVState *env, int csrno,
> > -                               target_ulong *val)
> > +static RISCVException rmw_vsie(CPURISCVState *env, int csrno,
> > +                               target_ulong *ret_val,
> > +                               target_ulong new_val, target_ulong wr_mask)
> >  {
> > -    if (riscv_cpu_virt_enabled(env)) {
> > -        read_vsie(env, CSR_VSIE, val);
> > -    } else {
> > -        *val = env->mie & env->mideleg;
> > +    uint64_t rval;
> > +    RISCVException ret;
> > +
> > +    ret = rmw_vsie64(env, csrno, &rval, new_val, wr_mask);
> > +    if (ret_val) {
> > +        *ret_val = rval;
> >      }
> > -    return RISCV_EXCP_NONE;
> > +
> > +    return ret;
> >  }
> >
> > -static RISCVException write_vsie(CPURISCVState *env, int csrno,
> > -                                 target_ulong val)
> > +static RISCVException rmw_vsieh(CPURISCVState *env, int csrno,
> > +                                target_ulong *ret_val,
> > +                                target_ulong new_val, target_ulong wr_mask)
> >  {
> > -    /* Shift the S bits to their VS bit location in mie */
> > -    target_ulong newval = (env->mie & ~VS_MODE_INTERRUPTS) |
> > -                          ((val << 1) & env->hideleg & VS_MODE_INTERRUPTS);
> > -    return write_mie(env, CSR_MIE, newval);
> > +    uint64_t rval;
> > +    RISCVException ret;
> > +
> > +    ret = rmw_vsie64(env, csrno, &rval,
> > +        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
> > +    if (ret_val) {
> > +        *ret_val = rval >> 32;
> > +    }
> > +
> > +    return ret;
> >  }
> >
> > -static int write_sie(CPURISCVState *env, int csrno, target_ulong val)
> > +static RISCVException rmw_sie64(CPURISCVState *env, int csrno,
> > +                                uint64_t *ret_val,
> > +                                uint64_t new_val, uint64_t wr_mask)
> >  {
> > +    RISCVException ret;
> > +    uint64_t mask = env->mideleg & S_MODE_INTERRUPTS;
> > +
> >      if (riscv_cpu_virt_enabled(env)) {
> > -        write_vsie(env, CSR_VSIE, val);
> > +        ret = rmw_vsie64(env, CSR_VSIE, ret_val, new_val, wr_mask);
> >      } else {
> > -        target_ulong newval = (env->mie & ~S_MODE_INTERRUPTS) |
> > -                              (val & S_MODE_INTERRUPTS);
> > -        write_mie(env, CSR_MIE, newval);
> > +        ret = rmw_mie64(env, csrno, ret_val, new_val, wr_mask & mask);
> >      }
> >
> > -    return RISCV_EXCP_NONE;
> > +    if (ret_val) {
> > +        *ret_val &= mask;
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +static RISCVException rmw_sie(CPURISCVState *env, int csrno,
> > +                              target_ulong *ret_val,
> > +                              target_ulong new_val, target_ulong wr_mask)
> > +{
> > +    uint64_t rval;
> > +    RISCVException ret;
> > +
> > +    ret = rmw_sie64(env, csrno, &rval, new_val, wr_mask);
> > +    if (ret_val) {
> > +        *ret_val = rval;
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +static RISCVException rmw_sieh(CPURISCVState *env, int csrno,
> > +                               target_ulong *ret_val,
> > +                               target_ulong new_val, target_ulong wr_mask)
> > +{
> > +    uint64_t rval;
> > +    RISCVException ret;
> > +
> > +    ret = rmw_sie64(env, csrno, &rval,
> > +        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
> > +    if (ret_val) {
> > +        *ret_val = rval >> 32;
> > +    }
> > +
> > +    return ret;
> >  }
> >
> >  static RISCVException read_stvec(CPURISCVState *env, int csrno,
> > @@ -963,38 +1164,111 @@ static RISCVException write_stval(CPURISCVState *env, int csrno,
> >      return RISCV_EXCP_NONE;
> >  }
> >
> > +static RISCVException rmw_vsip64(CPURISCVState *env, int csrno,
> > +                                 uint64_t *ret_val,
> > +                                 uint64_t new_val, uint64_t wr_mask)
> > +{
> > +    RISCVException ret;
> > +    uint64_t rval, vsbits, mask = env->hideleg & vsip_writable_mask;
> > +
> > +    /* Bring VS-level bits to correct position */
> > +    vsbits = new_val & (VS_MODE_INTERRUPTS >> 1);
> > +    new_val &= ~(VS_MODE_INTERRUPTS >> 1);
> > +    new_val |= vsbits << 1;
> > +    vsbits = wr_mask & (VS_MODE_INTERRUPTS >> 1);
> > +    wr_mask &= ~(VS_MODE_INTERRUPTS >> 1);
> > +    wr_mask |= vsbits << 1;
> > +
> > +    ret = rmw_mip64(env, csrno, &rval, new_val, wr_mask & mask);
> > +    if (ret_val) {
> > +        rval &= mask;
> > +        vsbits = rval & VS_MODE_INTERRUPTS;
> > +        rval &= ~VS_MODE_INTERRUPTS;
> > +        *ret_val = rval | (vsbits >> 1);
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> >  static RISCVException rmw_vsip(CPURISCVState *env, int csrno,
> > -                               target_ulong *ret_value,
> > -                               target_ulong new_value, target_ulong write_mask)
> > +                               target_ulong *ret_val,
> > +                               target_ulong new_val, target_ulong wr_mask)
> >  {
> > -    /* Shift the S bits to their VS bit location in mip */
> > -    int ret = rmw_mip(env, csrno, ret_value, new_value << 1,
> > -                      (write_mask << 1) & vsip_writable_mask & env->hideleg);
> > +    uint64_t rval;
> > +    RISCVException ret;
> >
> > -    if (ret_value) {
> > -        *ret_value &= VS_MODE_INTERRUPTS;
> > -        /* Shift the VS bits to their S bit location in vsip */
> > -        *ret_value >>= 1;
> > +    ret = rmw_vsip64(env, csrno, &rval, new_val, wr_mask);
> > +    if (ret_val) {
> > +        *ret_val = rval;
> >      }
> > +
> >      return ret;
> >  }
> >
> > -static RISCVException rmw_sip(CPURISCVState *env, int csrno,
> > -                              target_ulong *ret_value,
> > -                              target_ulong new_value, target_ulong write_mask)
> > +static RISCVException rmw_vsiph(CPURISCVState *env, int csrno,
> > +                                target_ulong *ret_val,
> > +                                target_ulong new_val, target_ulong wr_mask)
> >  {
> > -    int ret;
> > +    uint64_t rval;
> > +    RISCVException ret;
> > +
> > +    ret = rmw_vsip64(env, csrno, &rval,
> > +        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
> > +    if (ret_val) {
> > +        *ret_val = rval >> 32;
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +static RISCVException rmw_sip64(CPURISCVState *env, int csrno,
> > +                                uint64_t *ret_val,
> > +                                uint64_t new_val, uint64_t wr_mask)
> > +{
> > +    RISCVException ret;
> > +    uint64_t mask = env->mideleg & sip_writable_mask;
> >
> >      if (riscv_cpu_virt_enabled(env)) {
> > -        ret = rmw_vsip(env, CSR_VSIP, ret_value, new_value, write_mask);
> > +        ret = rmw_vsip64(env, CSR_VSIE, ret_val, new_val, wr_mask);
>
> Why change the csrno to CSR_VSIE?

Thanks for catching, this is a typo. I will fix it in next revision.

Regards,
Anup

>
> Alistair
>
> >      } else {
> > -        ret = rmw_mip(env, csrno, ret_value, new_value,
> > -                      write_mask & env->mideleg & sip_writable_mask);
> > +        ret = rmw_mip64(env, csrno, ret_val, new_val, wr_mask & mask);
> >      }
> >
> > -    if (ret_value) {
> > -        *ret_value &= env->mideleg & S_MODE_INTERRUPTS;
> > +    if (ret_val) {
> > +        *ret_val &= env->mideleg & S_MODE_INTERRUPTS;
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +static RISCVException rmw_sip(CPURISCVState *env, int csrno,
> > +                              target_ulong *ret_val,
> > +                              target_ulong new_val, target_ulong wr_mask)
> > +{
> > +    uint64_t rval;
> > +    RISCVException ret;
> > +
> > +    ret = rmw_sip64(env, csrno, &rval, new_val, wr_mask);
> > +    if (ret_val) {
> > +        *ret_val = rval;
> >      }
> > +
> > +    return ret;
> > +}
> > +
> > +static RISCVException rmw_siph(CPURISCVState *env, int csrno,
> > +                               target_ulong *ret_val,
> > +                               target_ulong new_val, target_ulong wr_mask)
> > +{
> > +    uint64_t rval;
> > +    RISCVException ret;
> > +
> > +    ret = rmw_sip64(env, csrno, &rval,
> > +        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
> > +    if (ret_val) {
> > +        *ret_val = rval >> 32;
> > +    }
> > +
> >      return ret;
> >  }
> >
> > @@ -1089,30 +1363,94 @@ static RISCVException write_hedeleg(CPURISCVState *env, int csrno,
> >      return RISCV_EXCP_NONE;
> >  }
> >
> > -static RISCVException read_hideleg(CPURISCVState *env, int csrno,
> > -                                   target_ulong *val)
> > +static RISCVException rmw_hideleg64(CPURISCVState *env, int csrno,
> > +                                    uint64_t *ret_val,
> > +                                    uint64_t new_val, uint64_t wr_mask)
> >  {
> > -    *val = env->hideleg;
> > +    uint64_t mask = wr_mask & vs_delegable_ints;
> > +
> > +    if (ret_val) {
> > +        *ret_val = env->hideleg & vs_delegable_ints;
> > +    }
> > +
> > +    env->hideleg = (env->hideleg & ~mask) | (new_val & mask);
> >      return RISCV_EXCP_NONE;
> >  }
> >
> > -static RISCVException write_hideleg(CPURISCVState *env, int csrno,
> > -                                    target_ulong val)
> > +static RISCVException rmw_hideleg(CPURISCVState *env, int csrno,
> > +                                  target_ulong *ret_val,
> > +                                  target_ulong new_val, target_ulong wr_mask)
> >  {
> > -    env->hideleg = val & vs_delegable_ints;
> > -    return RISCV_EXCP_NONE;
> > +    uint64_t rval;
> > +    RISCVException ret;
> > +
> > +    ret = rmw_hideleg64(env, csrno, &rval, new_val, wr_mask);
> > +    if (ret_val) {
> > +        *ret_val = rval;
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +static RISCVException rmw_hidelegh(CPURISCVState *env, int csrno,
> > +                                   target_ulong *ret_val,
> > +                                   target_ulong new_val, target_ulong wr_mask)
> > +{
> > +    uint64_t rval;
> > +    RISCVException ret;
> > +
> > +    ret = rmw_hideleg64(env, csrno, &rval,
> > +        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
> > +    if (ret_val) {
> > +        *ret_val = rval >> 32;
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +static RISCVException rmw_hvip64(CPURISCVState *env, int csrno,
> > +                                 uint64_t *ret_val,
> > +                                 uint64_t new_val, uint64_t wr_mask)
> > +{
> > +    RISCVException ret;
> > +
> > +    ret = rmw_mip64(env, csrno, ret_val, new_val,
> > +                    wr_mask & hvip_writable_mask);
> > +    if (ret_val) {
> > +        *ret_val &= VS_MODE_INTERRUPTS;
> > +    }
> > +
> > +    return ret;
> >  }
> >
> >  static RISCVException rmw_hvip(CPURISCVState *env, int csrno,
> > -                               target_ulong *ret_value,
> > -                               target_ulong new_value, target_ulong write_mask)
> > +                               target_ulong *ret_val,
> > +                               target_ulong new_val, target_ulong wr_mask)
> >  {
> > -    int ret = rmw_mip(env, csrno, ret_value, new_value,
> > -                      write_mask & hvip_writable_mask);
> > +    uint64_t rval;
> > +    RISCVException ret;
> >
> > -    if (ret_value) {
> > -        *ret_value &= VS_MODE_INTERRUPTS;
> > +    ret = rmw_hvip64(env, csrno, &rval, new_val, wr_mask);
> > +    if (ret_val) {
> > +        *ret_val = rval;
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +static RISCVException rmw_hviph(CPURISCVState *env, int csrno,
> > +                                target_ulong *ret_val,
> > +                                target_ulong new_val, target_ulong wr_mask)
> > +{
> > +    uint64_t rval;
> > +    RISCVException ret;
> > +
> > +    ret = rmw_hvip64(env, csrno, &rval,
> > +        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
> > +    if (ret_val) {
> > +        *ret_val = rval >> 32;
> >      }
> > +
> >      return ret;
> >  }
> >
> > @@ -1129,18 +1467,19 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
> >      return ret;
> >  }
> >
> > -static RISCVException read_hie(CPURISCVState *env, int csrno,
> > -                               target_ulong *val)
> > +static RISCVException rmw_hie(CPURISCVState *env, int csrno,
> > +                              target_ulong *ret_val,
> > +                              target_ulong new_val, target_ulong wr_mask)
> >  {
> > -    *val = env->mie & HS_MODE_INTERRUPTS;
> > -    return RISCV_EXCP_NONE;
> > -}
> > +    uint64_t rval;
> > +    RISCVException ret;
> >
> > -static RISCVException write_hie(CPURISCVState *env, int csrno,
> > -                                target_ulong val)
> > -{
> > -    target_ulong newval = (env->mie & ~HS_MODE_INTERRUPTS) | (val & HS_MODE_INTERRUPTS);
> > -    return write_mie(env, CSR_MIE, newval);
> > +    ret = rmw_mie64(env, csrno, &rval, new_val, wr_mask & HS_MODE_INTERRUPTS);
> > +    if (ret_val) {
> > +        *ret_val = rval & HS_MODE_INTERRUPTS;
> > +    }
> > +
> > +    return ret;
> >  }
> >
> >  static RISCVException read_hcounteren(CPURISCVState *env, int csrno,
> > @@ -1598,9 +1937,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
> >      /* Machine Trap Setup */
> >      [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,     write_mstatus     },
> >      [CSR_MISA]        = { "misa",       any,   read_misa,        write_misa        },
> > -    [CSR_MIDELEG]     = { "mideleg",    any,   read_mideleg,     write_mideleg     },
> > +    [CSR_MIDELEG]     = { "mideleg",    any,   NULL,    NULL,    rmw_mideleg       },
> >      [CSR_MEDELEG]     = { "medeleg",    any,   read_medeleg,     write_medeleg     },
> > -    [CSR_MIE]         = { "mie",        any,   read_mie,         write_mie         },
> > +    [CSR_MIE]         = { "mie",        any,   NULL,    NULL,    rmw_mie           },
> >      [CSR_MTVEC]       = { "mtvec",      any,   read_mtvec,       write_mtvec       },
> >      [CSR_MCOUNTEREN]  = { "mcounteren", any,   read_mcounteren,  write_mcounteren  },
> >
> > @@ -1613,9 +1952,14 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
> >      [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
> >      [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
> >
> > +    /* Machine-Level High-Half CSRs (AIA) */
> > +    [CSR_MIDELEGH] = { "midelegh", aia_any32, NULL, NULL, rmw_midelegh },
> > +    [CSR_MIEH]     = { "mieh",     aia_any32, NULL, NULL, rmw_mieh     },
> > +    [CSR_MIPH]     = { "miph",     aia_any32, NULL, NULL, rmw_miph     },
> > +
> >      /* Supervisor Trap Setup */
> >      [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,    write_sstatus    },
> > -    [CSR_SIE]        = { "sie",        smode, read_sie,        write_sie        },
> > +    [CSR_SIE]        = { "sie",        smode, NULL,   NULL,    rmw_sie          },
> >      [CSR_STVEC]      = { "stvec",      smode, read_stvec,      write_stvec      },
> >      [CSR_SCOUNTEREN] = { "scounteren", smode, read_scounteren, write_scounteren },
> >
> > @@ -1629,12 +1973,16 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
> >      /* Supervisor Protection and Translation */
> >      [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
> >
> > +    /* Supervisor-Level High-Half CSRs (AIA) */
> > +    [CSR_SIEH]       = { "sieh",   aia_smode32, NULL, NULL, rmw_sieh },
> > +    [CSR_SIPH]       = { "siph",   aia_smode32, NULL, NULL, rmw_siph },
> > +
> >      [CSR_HSTATUS]     = { "hstatus",     hmode,   read_hstatus,     write_hstatus     },
> >      [CSR_HEDELEG]     = { "hedeleg",     hmode,   read_hedeleg,     write_hedeleg     },
> > -    [CSR_HIDELEG]     = { "hideleg",     hmode,   read_hideleg,     write_hideleg     },
> > +    [CSR_HIDELEG]     = { "hideleg",     hmode,   NULL,   NULL,     rmw_hideleg       },
> >      [CSR_HVIP]        = { "hvip",        hmode,   NULL,   NULL,     rmw_hvip          },
> >      [CSR_HIP]         = { "hip",         hmode,   NULL,   NULL,     rmw_hip           },
> > -    [CSR_HIE]         = { "hie",         hmode,   read_hie,         write_hie         },
> > +    [CSR_HIE]         = { "hie",         hmode,   NULL,   NULL,     rmw_hie           },
> >      [CSR_HCOUNTEREN]  = { "hcounteren",  hmode,   read_hcounteren,  write_hcounteren  },
> >      [CSR_HGEIE]       = { "hgeie",       hmode,   read_hgeie,       write_hgeie       },
> >      [CSR_HTVAL]       = { "htval",       hmode,   read_htval,       write_htval       },
> > @@ -1646,7 +1994,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
> >
> >      [CSR_VSSTATUS]    = { "vsstatus",    hmode,   read_vsstatus,    write_vsstatus    },
> >      [CSR_VSIP]        = { "vsip",        hmode,   NULL,    NULL,    rmw_vsip          },
> > -    [CSR_VSIE]        = { "vsie",        hmode,   read_vsie,        write_vsie        },
> > +    [CSR_VSIE]        = { "vsie",        hmode,   NULL,    NULL,    rmw_vsie          },
> >      [CSR_VSTVEC]      = { "vstvec",      hmode,   read_vstvec,      write_vstvec      },
> >      [CSR_VSSCRATCH]   = { "vsscratch",   hmode,   read_vsscratch,   write_vsscratch   },
> >      [CSR_VSEPC]       = { "vsepc",       hmode,   read_vsepc,       write_vsepc       },
> > @@ -1657,6 +2005,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
> >      [CSR_MTVAL2]      = { "mtval2",      hmode,   read_mtval2,      write_mtval2      },
> >      [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,      write_mtinst      },
> >
> > +    /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
> > +    [CSR_HIDELEGH]    = { "hidelegh",    aia_hmode32, NULL, NULL, rmw_hidelegh },
> > +    [CSR_HVIPH]       = { "hviph",       aia_hmode32, NULL, NULL, rmw_hviph },
> > +    [CSR_VSIEH]       = { "vsieh",       aia_hmode32, NULL, NULL, rmw_vsieh },
> > +    [CSR_VSIPH]       = { "vsiph",       aia_hmode32, NULL, NULL, rmw_vsiph },
> > +
> >      /* Physical Memory Protection */
> >      [CSR_MSECCFG]    = { "mseccfg",  epmp, read_mseccfg, write_mseccfg },
> >      [CSR_PMPCFG0]    = { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg  },
> > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > index a7102220b6..7356d70be6 100644
> > --- a/target/riscv/machine.c
> > +++ b/target/riscv/machine.c
> > @@ -108,7 +108,7 @@ static const VMStateDescription vmstate_hyper = {
> >      .fields = (VMStateField[]) {
> >          VMSTATE_UINTTL(env.hstatus, RISCVCPU),
> >          VMSTATE_UINTTL(env.hedeleg, RISCVCPU),
> > -        VMSTATE_UINTTL(env.hideleg, RISCVCPU),
> > +        VMSTATE_UINT64(env.hideleg, RISCVCPU),
> >          VMSTATE_UINTTL(env.hcounteren, RISCVCPU),
> >          VMSTATE_UINTTL(env.htval, RISCVCPU),
> >          VMSTATE_UINTTL(env.htinst, RISCVCPU),
> > @@ -168,10 +168,10 @@ const VMStateDescription vmstate_riscv_cpu = {
> >          VMSTATE_UINTTL(env.resetvec, RISCVCPU),
> >          VMSTATE_UINTTL(env.mhartid, RISCVCPU),
> >          VMSTATE_UINT64(env.mstatus, RISCVCPU),
> > -        VMSTATE_UINTTL(env.mip, RISCVCPU),
> > -        VMSTATE_UINT32(env.miclaim, RISCVCPU),
> > -        VMSTATE_UINTTL(env.mie, RISCVCPU),
> > -        VMSTATE_UINTTL(env.mideleg, RISCVCPU),
> > +        VMSTATE_UINT64(env.mip, RISCVCPU),
> > +        VMSTATE_UINT64(env.miclaim, RISCVCPU),
> > +        VMSTATE_UINT64(env.mie, RISCVCPU),
> > +        VMSTATE_UINT64(env.mideleg, RISCVCPU),
> >          VMSTATE_UINTTL(env.satp, RISCVCPU),
> >          VMSTATE_UINTTL(env.stval, RISCVCPU),
> >          VMSTATE_UINTTL(env.medeleg, RISCVCPU),
> > --
> > 2.25.1
> >
> >

