Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD7A442BA1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 11:27:47 +0100 (CET)
Received: from localhost ([::1]:48342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhr18-0006vX-SW
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 06:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mhqyI-0005Fy-9t
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:24:50 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mhqyF-0000Ko-Te
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:24:49 -0400
Received: by mail-wr1-x432.google.com with SMTP id o14so32355343wra.12
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 03:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7j1tGPVYT6tJtgjoZw3jdUAKYG5cNdbPNvyiJb4g3gU=;
 b=KkXTWwm7XqPHB254ajzTNhBL3cWLad5WbDz+51cbEhC4gD/w2RRg3P7DQC1nBWMs4M
 EH3ZNVsadhukuojTlNLI6GrEuwmCzTqQHq2J/eBOcb8doxYcA4H03VC2r7LrZLNff2T9
 0GmswhkEw2Rae96fboAhCThYHgBQYWhLh5PdbYzvUo9q4NU85NBub8LVTdoGylksFliU
 yrBucZLqLsOsj2ONLZSZ7hLAW3llU0uwrjQVD+52aqI4HmyvyyBg96VTar2Y2E2upL/f
 DPCk0NSwpZSlPqMLKVk51jz6hp2c/EPAxETQIx6Yfj/Z8V6SXNv/eXl9M/ZWAzwuFcFE
 Lb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7j1tGPVYT6tJtgjoZw3jdUAKYG5cNdbPNvyiJb4g3gU=;
 b=miCc/FU9bJY7pehhQDzuI4FWP5DjRHQUDBsPgLmkkG2cAd+XgjQbvYh3G9oUnug3ba
 gSXu7M5nzFpNjTXOe+mUVdqTSWYKY/Bwe2rW8humJwDSDsDV4a+i3JHBI9K0jdYwRDFJ
 bvzg/OqxM7qt6abIGoUCxlpeo+OopFl74Wx3rbvB1BodGnw8A+REvLoM1wm0zWAX01oR
 jtOvilf82IJyLDlnKp/fFjanNhD8Fqx+rwQBPtYpQ3E+gkLPT8vUqOzsUefpFw0fUAyX
 RW2aBwwP0SsQE0O4NmhMATpHdXkffRSoouhd2d/qbRYcZHEFof+Hw6GVg1dQquCjBYMN
 LtgQ==
X-Gm-Message-State: AOAM532BoPV/egs5EUMqXbVqPz+jTYN/bm3TAcYjuAJpw87qHUA8GlZ0
 0J59K/StkbJS2XUk3VeD94Fh8A/Su11GqyI44i5gmw==
X-Google-Smtp-Source: ABdhPJxLNqnzOL3745lOdP9bZ5lSqOyOrY+NnNj0QrHYvEy/yFDhzQSW33+pLH4NP4TSuagwyFV9TxSXVwTs9MaayUc=
X-Received: by 2002:a5d:4846:: with SMTP id n6mr48656wrs.249.1635848685327;
 Tue, 02 Nov 2021 03:24:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211026064227.2014502-1-anup.patel@wdc.com>
 <20211026064227.2014502-3-anup.patel@wdc.com>
 <CAEUhbmX_XFTTGZBnRACrdOh27Hddj2Ho-RUL8xmf=2YG=Fw0OA@mail.gmail.com>
In-Reply-To: <CAEUhbmX_XFTTGZBnRACrdOh27Hddj2Ho-RUL8xmf=2YG=Fw0OA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 2 Nov 2021 15:54:33 +0530
Message-ID: <CAAhSdy0_Zg0ALHyOvP32fA=kbVjwhwxip1vRU-OsT1F2U4Fr0g@mail.gmail.com>
Subject: Re: [PATCH v4 02/22] target/riscv: Implement SGEIP bit in hip and hie
 CSRs
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::432;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 2, 2021 at 12:22 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Tue, Oct 26, 2021 at 2:43 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > A hypervsior can optionally take guest external interrupts using
>
> typo: hypervisor

Okay, I will update.

>
> > SGEIP bit of hip and hie CSRs.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  target/riscv/cpu.c      |  3 ++-
> >  target/riscv/cpu_bits.h |  3 +++
> >  target/riscv/csr.c      | 18 +++++++++++-------
> >  3 files changed, 16 insertions(+), 8 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 788fa0b11c..0460a3972b 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -365,6 +365,7 @@ static void riscv_cpu_reset(DeviceState *dev)
> >          env->mstatus = set_field(env->mstatus, MSTATUS64_UXL, env->misa_mxl);
> >      }
> >      env->mcause = 0;
> > +    env->miclaim = MIP_SGEIP;
> >      env->pc = env->resetvec;
> >      env->two_stage_lookup = false;
> >  #endif
> > @@ -598,7 +599,7 @@ static void riscv_cpu_init(Object *obj)
> >      cpu_set_cpustate_pointers(cpu);
> >
> >  #ifndef CONFIG_USER_ONLY
> > -    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, 12);
> > +    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, IRQ_LOCAL_MAX);
> >  #endif /* CONFIG_USER_ONLY */
> >  }
> >
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index cffcd3a5df..8a5a4cde95 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -498,6 +498,8 @@ typedef enum RISCVException {
> >  #define IRQ_S_EXT                          9
> >  #define IRQ_VS_EXT                         10
> >  #define IRQ_M_EXT                          11
> > +#define IRQ_S_GEXT                         12
> > +#define IRQ_LOCAL_MAX                      13
>
> The IRQ_LOCAL_MAX should be XLEN long, not 13.

The IRQ_LOCAL_MAX here represents local interrupts
standardized by the RISC-V privilege spec. This value
will change only when more local interrupts are
standardized by the RISC-V privilege spec.

>
> >
> >  /* mip masks */
> >  #define MIP_USIP                           (1 << IRQ_U_SOFT)
> > @@ -512,6 +514,7 @@ typedef enum RISCVException {
> >  #define MIP_SEIP                           (1 << IRQ_S_EXT)
> >  #define MIP_VSEIP                          (1 << IRQ_VS_EXT)
> >  #define MIP_MEIP                           (1 << IRQ_M_EXT)
> > +#define MIP_SGEIP                          (1 << IRQ_S_GEXT)
> >
> >  /* sip masks */
> >  #define SIP_SSIP                           MIP_SSIP
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 9dfc9b5eba..9a0a0c0679 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -408,12 +408,13 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
> >  #define M_MODE_INTERRUPTS  (MIP_MSIP | MIP_MTIP | MIP_MEIP)
> >  #define S_MODE_INTERRUPTS  (MIP_SSIP | MIP_STIP | MIP_SEIP)
> >  #define VS_MODE_INTERRUPTS (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)
> > +#define HS_MODE_INTERRUPTS (MIP_SGEIP | VS_MODE_INTERRUPTS)
> >
> >  static const target_ulong delegable_ints = S_MODE_INTERRUPTS |
> >                                             VS_MODE_INTERRUPTS;
> >  static const target_ulong vs_delegable_ints = VS_MODE_INTERRUPTS;
> >  static const target_ulong all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
> > -                                     VS_MODE_INTERRUPTS;
> > +                                     HS_MODE_INTERRUPTS;
> >  #define DELEGABLE_EXCPS ((1ULL << (RISCV_EXCP_INST_ADDR_MIS)) | \
> >                           (1ULL << (RISCV_EXCP_INST_ACCESS_FAULT)) | \
> >                           (1ULL << (RISCV_EXCP_ILLEGAL_INST)) | \
> > @@ -673,7 +674,7 @@ static RISCVException write_mideleg(CPURISCVState *env, int csrno,
> >  {
> >      env->mideleg = (env->mideleg & ~delegable_ints) | (val & delegable_ints);
> >      if (riscv_has_ext(env, RVH)) {
> > -        env->mideleg |= VS_MODE_INTERRUPTS;
> > +        env->mideleg |= HS_MODE_INTERRUPTS;
> >      }
> >      return RISCV_EXCP_NONE;
> >  }
> > @@ -689,6 +690,9 @@ static RISCVException write_mie(CPURISCVState *env, int csrno,
> >                                  target_ulong val)
> >  {
> >      env->mie = (env->mie & ~all_ints) | (val & all_ints);
> > +    if (!riscv_has_ext(env, RVH)) {
> > +        env->mie &= ~MIP_SGEIP;
> > +    }
> >      return RISCV_EXCP_NONE;
> >  }
> >
> > @@ -984,7 +988,7 @@ static RISCVException rmw_sip(CPURISCVState *env, int csrno,
> >      }
> >
> >      if (ret_value) {
> > -        *ret_value &= env->mideleg;
> > +        *ret_value &= env->mideleg & S_MODE_INTERRUPTS;
> >      }
> >      return ret;
> >  }
> > @@ -1102,7 +1106,7 @@ static RISCVException rmw_hvip(CPURISCVState *env, int csrno,
> >                        write_mask & hvip_writable_mask);
> >
> >      if (ret_value) {
> > -        *ret_value &= hvip_writable_mask;
> > +        *ret_value &= VS_MODE_INTERRUPTS;
> >      }
> >      return ret;
> >  }
> > @@ -1115,7 +1119,7 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
> >                        write_mask & hip_writable_mask);
> >
> >      if (ret_value) {
> > -        *ret_value &= hip_writable_mask;
> > +        *ret_value &= HS_MODE_INTERRUPTS;
> >      }
> >      return ret;
> >  }
> > @@ -1123,14 +1127,14 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
> >  static RISCVException read_hie(CPURISCVState *env, int csrno,
> >                                 target_ulong *val)
> >  {
> > -    *val = env->mie & VS_MODE_INTERRUPTS;
> > +    *val = env->mie & HS_MODE_INTERRUPTS;
> >      return RISCV_EXCP_NONE;
> >  }
> >
> >  static RISCVException write_hie(CPURISCVState *env, int csrno,
> >                                  target_ulong val)
> >  {
> > -    target_ulong newval = (env->mie & ~VS_MODE_INTERRUPTS) | (val & VS_MODE_INTERRUPTS);
> > +    target_ulong newval = (env->mie & ~HS_MODE_INTERRUPTS) | (val & HS_MODE_INTERRUPTS);
> >      return write_mie(env, CSR_MIE, newval);
> >  }
> >
>
> Regards,
> Bin

Regards,
Anup

