Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B213A56A7ED
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 18:22:28 +0200 (CEST)
Received: from localhost ([::1]:44654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9UGp-0007Ls-4D
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 12:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1o9U7U-0000r1-7g
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 12:12:49 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:46039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1o9U7S-0002zn-H6
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 12:12:47 -0400
Received: by mail-pg1-x536.google.com with SMTP id 145so19347382pga.12
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 09:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=ccUA5VVAVRIyQPpXhxs+s0adwHMDI/F1/hlv7Px1Xfo=;
 b=lTabYbdKmE+4qOtWZDwQ5muJMtA+3gH90OYXQOYUq3YoPTJxaLEF0Rlh14iURrKziN
 P2A7bFNjnL+Kd44aizK2gx1++xzgMDU03vzRC5Qu2lIUKkT5ZTcOQglkWQuNKBVCnkS7
 +YoRSuPbD1Q+JIce8V2ma9DQ937Y805VMKFkw1x4EJ1CGAV223/1Ch+Qq7ceAnUhsyxm
 KCI/sLqndcxvsY97+HF79AEdMqyIJiRH3uUrDhB97hNjrEh8HeSHhd3FTw5t8Q7vRsm5
 x9hvGlQxSXSMQwBAvcnwhnvMhYXA1KpVwma09uQwHGd6LpwPFXumv1I9zLCMwGntARq/
 ZRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=ccUA5VVAVRIyQPpXhxs+s0adwHMDI/F1/hlv7Px1Xfo=;
 b=6VqmVFuH5+3xZP7tXhLWLrQvnbGNhK+6PIYBQyvECD4eXHhq6AH5ijrY+QsUl5d6mx
 X6vTz7scn06eoS4wEl5hXrPVgv8v2vlCh0trbN6qWw/JBzBTd6/fNvrWzenHFEGL2ll+
 oxNt6J0Sv43ranKe/hMTuvN8fAyX48c1u0SY75fqvadwZNYLNXOzaENtSkeEAUaqeYHU
 lDGtnYwsWPLPzW/tNET0sH789xxk6fj/0jFC3KXQoN0dzlN7IddQjg9oZRWfRXnO+EgK
 ctD9LCt48AHni/h19wklyerO8oj6ng72l4uLdnN8+IYrthPTg/1zTYTp/heYQ+ZUx1rq
 mEtQ==
X-Gm-Message-State: AJIora/mO17sdWm9bMm8TGe/Mfp3RezdYalNUi3I1JmshTDLcDw5DWbX
 ZuHWRjSldL8Ps6i2Iw0yYRGqLQ==
X-Google-Smtp-Source: AGRyM1v5BKN17DElTi4AXLqAukMwZWefj7wCvXBgDxjVOFHM3DeyMrse94A6Q6vuZjf96ikQ4KibdA==
X-Received: by 2002:a17:902:8309:b0:167:9a4c:cd58 with SMTP id
 bd9-20020a170902830900b001679a4ccd58mr53369931plb.166.1657210364892; 
 Thu, 07 Jul 2022 09:12:44 -0700 (PDT)
Received: from [192.168.1.18] ([182.64.106.38])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a170902ea0100b0015e8d4eb2ddsm12561005plg.295.2022.07.07.09.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 09:12:43 -0700 (PDT)
Message-ID: <67f405603a9fb89f0ebec6e6bac8219e296472b4.camel@ventanamicro.com>
Subject: Re: [RFC PATCH v5 3/4] target/riscv: smstateen check for fcsr
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, "open
 list:RISC-V" <qemu-riscv@nongnu.org>, Alistair Francis
 <alistair.francis@wdc.com>
Date: Thu, 07 Jul 2022 21:42:35 +0530
In-Reply-To: <CAKmqyKPwrhxM0YH_=noivZNsuOfJkkGnDz-ge1SXjfTxP12Q1g@mail.gmail.com>
References: <20220603160425.3667456-1-mchitale@ventanamicro.com>
 <20220603160425.3667456-4-mchitale@ventanamicro.com>
 <CAKmqyKPwrhxM0YH_=noivZNsuOfJkkGnDz-ge1SXjfTxP12Q1g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, 2022-06-16 at 17:17 +1000, Alistair Francis wrote:
> On Sat, Jun 4, 2022 at 2:08 AM Mayuresh Chitale
> <mchitale@ventanamicro.com> wrote:
> > If smstateen is implemented and sstateen0.fcsr is clear
> > then the floating point operations must return illegal
> > instruction exception.
> > 
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >  target/riscv/csr.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> > 
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index ae91ae1f7e..8bbbed38ff 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -77,6 +77,10 @@ static RISCVException fs(CPURISCVState *env, int
> > csrno)
> >          !RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
> >          return RISCV_EXCP_ILLEGAL_INST;
> >      }
> > +
> > +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> > +        return smstateen_acc_ok(env, PRV_U, SMSTATEEN0_FCSR);
> > +    }
> 
> This only checks access to the CSRs. Shouldn't we also be throwing
> errors if any instruction operates on an x register?
Yes.
> 
> >  #endif
> >      return RISCV_EXCP_NONE;
> >  }
> > @@ -1700,6 +1704,10 @@ static RISCVException
> > write_mstateen(CPURISCVState *env, int csrno,
> >                         (1UL << SMSTATEEN0_HSENVCFG);
> > 
> >      reg = &env->mstateen[csrno - CSR_MSTATEEN0];
> > +    if (riscv_has_ext(env, RVF)) {
> > +        wr_mask |= 1UL << SMSTATEEN0_FCSR;
> > +    }
> 
> This doesn't look right.
> 
> "Whenever misa.F = 1, bit 1 of mstateen0 is read-only zero".
> Shouldn't
> that mean we don't allow writes if we have the RVF extension?

I will fix it in the next version.
> 
> Alistair
> 
> > +
> >      write_smstateen(env, reg, wr_mask, new_val);
> > 
> >      return RISCV_EXCP_NONE;
> > @@ -1724,6 +1732,10 @@ static RISCVException
> > write_mstateenh(CPURISCVState *env, int csrno,
> >      reg = &env->mstateen[csrno - CSR_MSTATEEN0H];
> >      val = (uint64_t)new_val << 32;
> >      val |= *reg & 0xFFFFFFFF;
> > +    if (riscv_has_ext(env, RVF)) {
> > +        wr_mask |= 1UL << SMSTATEEN0_FCSR;
> > +    }
> > +
> >      write_smstateen(env, reg, wr_mask, val);
> > 
> >      return RISCV_EXCP_NONE;
> > @@ -1745,6 +1757,10 @@ static RISCVException
> > write_hstateen(CPURISCVState *env, int csrno,
> >                         (1UL << SMSTATEEN0_HSENVCFG);
> >      int index = csrno - CSR_HSTATEEN0;
> > 
> > +    if (riscv_has_ext(env, RVF)) {
> > +        wr_mask |= 1UL << SMSTATEEN0_FCSR;
> > +    }
> > +
> >      reg = &env->hstateen[index];
> >      wr_mask &= env->mstateen[index];
> >      write_smstateen(env, reg, wr_mask, new_val);
> > @@ -1769,6 +1785,10 @@ static RISCVException
> > write_hstateenh(CPURISCVState *env, int csrno,
> >      uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
> >                         (1UL << SMSTATEEN0_HSENVCFG);
> > 
> > +    if (riscv_has_ext(env, RVF)) {
> > +        wr_mask |= 1UL << SMSTATEEN0_FCSR;
> > +    }
> > +
> >      reg = &env->hstateen[index];
> >      val = (uint64_t)new_val << 32;
> >      val |= *reg & 0xFFFFFFFF;
> > @@ -1794,6 +1814,10 @@ static RISCVException
> > write_sstateen(CPURISCVState *env, int csrno,
> >      int index = csrno - CSR_SSTATEEN0;
> >      bool virt = riscv_cpu_virt_enabled(env);
> > 
> > +    if (riscv_has_ext(env, RVF)) {
> > +        wr_mask |= 1UL << SMSTATEEN0_FCSR;
> > +    }
> > +
> >      reg = &env->sstateen[index];
> >      if (virt) {
> >          wr_mask &= env->mstateen[index];
> > --
> > 2.25.1
> > 
> > 


