Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AD148A310
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 23:39:48 +0100 (CET)
Received: from localhost ([::1]:52560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n73KN-0006zl-TN
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 17:39:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1n73Gd-0004rd-F2
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:35:55 -0500
Received: from [2a00:1450:4864:20::52e] (port=33665
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1n73GY-0000qj-VQ
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:35:54 -0500
Received: by mail-ed1-x52e.google.com with SMTP id b13so6312424edn.0
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 14:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gbUbcjTtd9OiUfkrAY740lPB3cnoMdBy3mYgwkQwo0w=;
 b=z0s1OYezpFXBoXPcBQRMFAoTFCDc2QM/XdALWajyohvmUiWU6SrzWNHhqXvGX/OMzZ
 7V4fE+30+pfrvwcIaxHpAJeZuzElLBVLudMmp9NGV/x9mwPnEAdAKxqos7P4FG3tRzFI
 f1JmbFcsP8ctv5aHD3MJm3T3kfF019j2OoAsEwgBEadQDbixQ1BI2/0sfMrtchrwtqoN
 ShFlPZxoIe4fup7Lcw1slNh8G6fpTVsu7VeFw/iFhRaIO9wzqkQmR7JBEGyfcSvsaEct
 31McF7cRv9CfclgFWetMLFTf/BdncmD4IIHJM1jlMn4WDvPqtg9i9SP9YNGxNGFQ7tqt
 lfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gbUbcjTtd9OiUfkrAY740lPB3cnoMdBy3mYgwkQwo0w=;
 b=GSGgLgzrADUdjmTKib9vnKxQD8M+RmsGbJWfTePn2c2C/hIihF927hXWSMXw6BcrKp
 vCt5Uu0tPPS7tChwSsSnl+pSna+KgKTgHsqBaePhuYegXYuJ4degwfCjJIl0ww5ZqCzA
 ZBY2VMF7YC50eTO1/Fy+yDtjDmaw9XlALh8WfSVlVfIQBS38jBIQ83WGsOuaVUOuKIzL
 N2/tiktu41PsAbJNLUZhSmLg9tooPB3eWbhIy7XkBfFFLNPeoVN6ruCG7Q0+hEM4ef08
 S1RLpbntMh6/1kbVoEBzPd0+IAh13ppJsvnhmig0zhWE8FhADO5Gq+Gb9eW/eC89Y3J7
 EC9g==
X-Gm-Message-State: AOAM530sRUGlRB9UtJj0qVtuwdcHT2acpmB9ENRN8BDXXAddLko6WxAr
 94A06/T6km6zgZc80m439qaJUvKp1VH/3ED8KXezZw==
X-Google-Smtp-Source: ABdhPJzDmcu80JjEE3AprkIa9w2JELpQcSlwmre1GiIq6ga7fxYKr++aaIq5Mz8U8MdfVc+8V+lDS2jDoxf6QoBP08Y=
X-Received: by 2002:aa7:d610:: with SMTP id c16mr1660706edr.413.1641854148130; 
 Mon, 10 Jan 2022 14:35:48 -0800 (PST)
MIME-Version: 1.0
References: <20220107004846.378859-1-atishp@rivosinc.com>
 <20220107004846.378859-10-atishp@rivosinc.com>
 <CAEUhbmUmdQxFmn8r1gNNrD8+QGP85=_P_Hqw5ocerbUzti-r4A@mail.gmail.com>
In-Reply-To: <CAEUhbmUmdQxFmn8r1gNNrD8+QGP85=_P_Hqw5ocerbUzti-r4A@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 10 Jan 2022 14:35:37 -0800
Message-ID: <CAHBxVyFB3r08WOgRMLVxpPCQy-dkibMNq5vS35GFEM7ZC5gtgQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/11] target/riscv: Simplify counter predicate function
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=atishp@rivosinc.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, Jan 10, 2022 at 12:27 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Jan 7, 2022 at 10:22 AM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > All the hpmcounters and the fixed counters (CY, IR, TM) can be represented
> > as a unified counter. Thus, the predicate function doesn't need handle each
> > case separately.
> >
> > Simplify the predicate function so that we just handle things differently
> > between RV32/RV64 and S/HS mode.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  target/riscv/csr.c | 111 ++++-----------------------------------------
> >  1 file changed, 10 insertions(+), 101 deletions(-)
> >
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index d3a8bba6a518..feb053eb3f7b 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -109,6 +109,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
> >      CPUState *cs = env_cpu(env);
> >      RISCVCPU *cpu = RISCV_CPU(cs);
> >      int ctr_index;
> > +    uint64_t ctr_mask;
>
> Use target_ulong should be enough?
>

Yeah. Will fix it in the next version.

> >      int base_csrno = CSR_CYCLE;
> >      bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
> >
> > @@ -117,122 +118,30 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
> >          base_csrno += 0x80;
> >      }
> >      ctr_index = csrno - base_csrno;
> > +    ctr_mask = BIT(ctr_index);
> >
> >      if ((csrno >= CSR_CYCLE && csrno <= CSR_INSTRET) ||
> >          (csrno >= CSR_CYCLEH && csrno <= CSR_INSTRETH)) {
> >          goto skip_ext_pmu_check;
> >      }
> >
> > -    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & BIT(ctr_index)))) {
> > +    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & ctr_mask))) {
> >          /* No counter is enabled in PMU or the counter is out of range */
> >          return RISCV_EXCP_ILLEGAL_INST;
> >      }
> >
> >  skip_ext_pmu_check:
> >
> > -    if (env->priv == PRV_S) {
> > -        switch (csrno) {
> > -        case CSR_CYCLE:
> > -            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
> > -                return RISCV_EXCP_ILLEGAL_INST;
> > -            }
> > -            break;
> > -        case CSR_TIME:
> > -            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
> > -                return RISCV_EXCP_ILLEGAL_INST;
> > -            }
> > -            break;
> > -        case CSR_INSTRET:
> > -            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
> > -                return RISCV_EXCP_ILLEGAL_INST;
> > -            }
> > -            break;
> > -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> > -            if (!get_field(env->mcounteren, 1 << ctr_index)) {
> > -                return RISCV_EXCP_ILLEGAL_INST;
> > -            }
> > -            break;
> > -        }
> > -        if (rv32) {
> > -            switch (csrno) {
> > -            case CSR_CYCLEH:
> > -                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
> > -                    return RISCV_EXCP_ILLEGAL_INST;
> > -                }
> > -                break;
> > -            case CSR_TIMEH:
> > -                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
> > -                    return RISCV_EXCP_ILLEGAL_INST;
> > -                }
> > -                break;
> > -            case CSR_INSTRETH:
> > -                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
> > -                    return RISCV_EXCP_ILLEGAL_INST;
> > -                }
> > -                break;
> > -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> > -                if (!get_field(env->mcounteren, 1 << ctr_index)) {
> > -                    return RISCV_EXCP_ILLEGAL_INST;
> > -                }
> > -                break;
> > -            }
> > -        }
> > +    if ((env->priv == PRV_S) && (!get_field(env->mcounteren, ctr_mask))) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> >      }
> >
> >      if (riscv_cpu_virt_enabled(env)) {
> > -        switch (csrno) {
> > -        case CSR_CYCLE:
> > -            if (!get_field(env->hcounteren, COUNTEREN_CY) &&
> > -                get_field(env->mcounteren, COUNTEREN_CY)) {
> > -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -            }
> > -            break;
> > -        case CSR_TIME:
> > -            if (!get_field(env->hcounteren, COUNTEREN_TM) &&
> > -                get_field(env->mcounteren, COUNTEREN_TM)) {
> > -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -            }
> > -            break;
> > -        case CSR_INSTRET:
> > -            if (!get_field(env->hcounteren, COUNTEREN_IR) &&
> > -                get_field(env->mcounteren, COUNTEREN_IR)) {
> > -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -            }
> > -            break;
> > -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> > -            if (!get_field(env->hcounteren, 1 << ctr_index) &&
> > -                 get_field(env->mcounteren, 1 << ctr_index)) {
> > -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -            }
> > -            break;
> > -        }
> > -        if (rv32) {
> > -            switch (csrno) {
> > -            case CSR_CYCLEH:
> > -                if (!get_field(env->hcounteren, COUNTEREN_CY) &&
> > -                    get_field(env->mcounteren, COUNTEREN_CY)) {
> > -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -                }
> > -                break;
> > -            case CSR_TIMEH:
> > -                if (!get_field(env->hcounteren, COUNTEREN_TM) &&
> > -                    get_field(env->mcounteren, COUNTEREN_TM)) {
> > -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -                }
> > -                break;
> > -            case CSR_INSTRETH:
> > -                if (!get_field(env->hcounteren, COUNTEREN_IR) &&
> > -                    get_field(env->mcounteren, COUNTEREN_IR)) {
> > -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -                }
> > -                break;
> > -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> > -                if (!get_field(env->hcounteren, 1 << ctr_index) &&
> > -                     get_field(env->mcounteren, 1 << ctr_index)) {
> > -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -                }
> > -                break;
> > -            }
> > +        if (!get_field(env->mcounteren, ctr_mask)) {
> > +            /* The bit must be set in mcountern for HS mode access */
> > +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > +        } else if (!get_field(env->hcounteren, ctr_mask)) {
> > +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> >          }
> >      }
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

