Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B7958501B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 14:34:04 +0200 (CEST)
Received: from localhost ([::1]:41452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHPBq-0003g8-HV
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 08:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oHP7P-0000bt-FE
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 08:29:27 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:34687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oHP7N-0008Fe-JS
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 08:29:27 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 12so3921486pga.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 05:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=zf+nBueQ8bQgNZsac8BZX4tR24p7BA8KVigYpzfTrKo=;
 b=QlNoPT/Gpty/OT6rJnmv91ienh19WBrALDNTos7dujiUG1gV6fXhYVuPxFLlN8c57g
 wMYJxuIa11ufwzssFTM+BsnN6uGy8dz+DSVd9KIO0HjZuoRvtEw3CcJgJOX2w72KzoxY
 YtkWAmHoHJYNfiPVijF6GAHgLf2rFeAr5gkgf5FGFPyb4UHBeaoJS5Vf3i30UZXrT3Km
 7RuQ232iyB3RVezs7X+TE6g+5V2NdHYIDtHXNuZ7h330lx3bI1QWQYbUGzwniOj9hDyN
 JembXGcCfuiKgxROqKvVFUu6YoeTBstEj6qmFK70bACNwu51LMpg+rpsUHgcnQYPL8T2
 KUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=zf+nBueQ8bQgNZsac8BZX4tR24p7BA8KVigYpzfTrKo=;
 b=ve1w1mD9cAwmli5+BVbMxFzZ3Dk/UGbhHqcgaj61noIy/+kj9Jw0srp6G38c/gKBAP
 vMXsoziHiS8z/0dW3vC6H2t9tgK3gV1uISLsYhbcbFVRPPstVIObcq36rDHZdZUqSRu7
 2xRZdsc6tzsvJFs74GfbiDMiOUYRxHljWmc5EuGddiiVjHObilhXmH9fNjzt5MBxYVFT
 po8lwHxDylXhRyGtVvk4P/g+UKGvaf3IVyxi2/2hh19bjSvn1QJxA9ev7DpUZ+Bax80+
 oRg5hYI62EcYLcmeoDIebuqknhTVBokWhS++f9Op3o66jnN6MKRPyM7h2IbFsjn2Om4D
 Cx5g==
X-Gm-Message-State: AJIora9JdqPJj59uA+M+koKOZ4QaU6f22RMfgcMMeI39F8CoUfPJ8tTn
 8ti9q0mhiDkzP+Utec1NRUrWsA==
X-Google-Smtp-Source: AGRyM1v+W1Mc1ClxX15bXjMizrXrbB5NvX4S49c04iQDyQmRzfeOOsXrpgyvDt41p4pYfMZKXuY4og==
X-Received: by 2002:a63:e80e:0:b0:419:d02c:fc8b with SMTP id
 s14-20020a63e80e000000b00419d02cfc8bmr2719068pgh.385.1659097763595; 
 Fri, 29 Jul 2022 05:29:23 -0700 (PDT)
Received: from [192.168.1.18] ([171.50.205.214])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a1709029f8f00b001637529493esm3448229plq.66.2022.07.29.05.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 05:29:22 -0700 (PDT)
Message-ID: <ea27c17be274bc650c458769ec41259acbccb8aa.camel@ventanamicro.com>
Subject: Re: [PATCH v6 3/5] target/riscv: smstateen check for fcsr
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com
Date: Fri, 29 Jul 2022 17:59:16 +0530
In-Reply-To: <a0267001-a369-cfab-40ac-05037649166c@codethink.co.uk>
References: <20220721153136.377578-1-mchitale@ventanamicro.com>
 <20220721153136.377578-4-mchitale@ventanamicro.com>
 <e819eb9c-fdec-5138-5b94-f8ddd2331f7a@iscas.ac.cn>
 <fb88d0ccf7f6c4204b932d14fa88f952e314e922.camel@ventanamicro.com>
 <edef6a28-6378-59a6-5fa8-4f3b0be76b71@iscas.ac.cn>
 <62e5130693cbdbb32355001469f267f63d0311c0.camel@ventanamicro.com>
 <a0267001-a369-cfab-40ac-05037649166c@codethink.co.uk>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Thu, 2022-07-28 at 09:09 +0100, Ben Dooks wrote:
> On 28/07/2022 07:15, Mayuresh Chitale wrote:
> > On Mon, 2022-07-25 at 15:23 +0800, Weiwei Li wrote:
> > > 在 2022/7/24 下午11:49, Mayuresh Chitale 写道:
> > > > On Fri, 2022-07-22 at 09:42 +0800, Weiwei Li wrote:
> > > > > 在 2022/7/21 下午11:31, Mayuresh Chitale 写道:
> > > > > > If smstateen is implemented and sstateen0.fcsr is clear
> > > > > > then
> > > > > > the
> > > > > > floating point operations must return illegal instruction
> > > > > > exception.
> > > > > > 
> > > > > > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > > > > > ---
> > > > > >    target/riscv/csr.c                        | 23
> > > > > > ++++++++++++++
> > > > > >    target/riscv/insn_trans/trans_rvf.c.inc   | 38
> > > > > > +++++++++++++++++++++--
> > > > > >    target/riscv/insn_trans/trans_rvzfh.c.inc |  4 +++
> > > > > >    3 files changed, 63 insertions(+), 2 deletions(-)
> > > > > > 
> > > > > > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > > > > > index ab06b117f9..a597b6cbc7 100644
> > > > > > --- a/target/riscv/csr.c
> > > > > > +++ b/target/riscv/csr.c
> > > > > > @@ -96,6 +96,10 @@ static RISCVException fs(CPURISCVState
> > > > > > *env,
> > > > > > int
> > > > > > csrno)
> > > > > >            !RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
> > > > > >            return RISCV_EXCP_ILLEGAL_INST;
> > > > > >        }
> > > > > > +
> > > > > > +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> > > > > > +        return smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR);
> > > > > > +    }
> > > > > >    #endif
> > > > > >        return RISCV_EXCP_NONE;
> > > > > >    }
> > > > > > @@ -1876,6 +1880,9 @@ static RISCVException
> > > > > > write_mstateen0(CPURISCVState *env, int csrno,
> > > > > >                                          target_ulong
> > > > > > new_val)
> > > > > >    {
> > > > > >        uint64_t wr_mask = SMSTATEEN_STATEN |
> > > > > > SMSTATEEN0_HSENVCFG;
> > > > > > +    if (!riscv_has_ext(env, RVF)) {
> > > > > > +        wr_mask |= SMSTATEEN0_FCSR;
> > > > > > +    }
> > > > > >    
> > > > > >        return write_mstateen(env, csrno, wr_mask, new_val);
> > > > > >    }
> > > > > > @@ -1924,6 +1931,10 @@ static RISCVException
> > > > > > write_mstateen0h(CPURISCVState *env, int csrno,
> > > > > >    {
> > > > > >        uint64_t wr_mask = SMSTATEEN_STATEN |
> > > > > > SMSTATEEN0_HSENVCFG;
> > > > > >    
> > > > > > +    if (!riscv_has_ext(env, RVF)) {
> > > > > > +        wr_mask |= SMSTATEEN0_FCSR;
> > > > > > +    }
> > > > > > +
> > > > > >        return write_mstateenh(env, csrno, wr_mask,
> > > > > > new_val);
> > > > > >    }
> > > > > >    
> > > > > > @@ -1973,6 +1984,10 @@ static RISCVException
> > > > > > write_hstateen0(CPURISCVState *env, int csrno,
> > > > > >    {
> > > > > >        uint64_t wr_mask = SMSTATEEN_STATEN |
> > > > > > SMSTATEEN0_HSENVCFG;
> > > > > >    
> > > > > > +    if (!riscv_has_ext(env, RVF)) {
> > > > > > +        wr_mask |= SMSTATEEN0_FCSR;
> > > > > > +    }
> > > > > > +
> > > > > >        return write_hstateen(env, csrno, wr_mask, new_val);
> > > > > >    }
> > > > > >    
> > > > > > @@ -2024,6 +2039,10 @@ static RISCVException
> > > > > > write_hstateen0h(CPURISCVState *env, int csrno,
> > > > > >    {
> > > > > >        uint64_t wr_mask = SMSTATEEN_STATEN |
> > > > > > SMSTATEEN0_HSENVCFG;
> > > > > >    
> > > > > > +    if (!riscv_has_ext(env, RVF)) {
> > > > > > +        wr_mask |= SMSTATEEN0_FCSR;
> > > > > > +    }
> > > > > > +
> > > > > >        return write_hstateenh(env, csrno, wr_mask,
> > > > > > new_val);
> > > > > >    }
> > > > > >    
> > > > > > @@ -2083,6 +2102,10 @@ static RISCVException
> > > > > > write_sstateen0(CPURISCVState *env, int csrno,
> > > > > >    {
> > > > > >        uint64_t wr_mask = SMSTATEEN_STATEN |
> > > > > > SMSTATEEN0_HSENVCFG;
> > > > > >    
> > > > > > +    if (!riscv_has_ext(env, RVF)) {
> > > > > > +        wr_mask |= SMSTATEEN0_FCSR;
> > > > > > +    }
> > > > > > +
> > > > > >        return write_sstateen(env, csrno, wr_mask, new_val);
> > > > > >    }
> > > > > >    
> > > > > > diff --git a/target/riscv/insn_trans/trans_rvf.c.inc
> > > > > > b/target/riscv/insn_trans/trans_rvf.c.inc
> > > > > > index a1d3eb52ad..c43c48336b 100644
> > > > > > --- a/target/riscv/insn_trans/trans_rvf.c.inc
> > > > > > +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> > > > > > @@ -24,9 +24,43 @@
> > > > > >                return false; \
> > > > > >    } while (0)
> > > > > >    
> > > > > > +#ifndef CONFIG_USER_ONLY
> > > > > > +#define SMSTATEEN_CHECK(ctx) do {\
> > > > > > +    CPUState *cpu = ctx->cs; \
> > > > > > +    CPURISCVState *env = cpu->env_ptr; \
> > > > > > +    if (ctx->cfg_ptr->ext_smstateen && \
> > > > > > +        (env->priv < PRV_M)) { \
> > > > > > +        uint64_t stateen = env->mstateen[0]; \
> > > > > > +        uint64_t hstateen = env->hstateen[0]; \
> > > > > > +        uint64_t sstateen = env->sstateen[0]; \
> > > > > > +        if (!(stateen & SMSTATEEN_STATEN)) {\
> > > > > > +            hstateen = 0; \
> > > > > > +            sstateen = 0; \
> > > > > > +        } \
> > > > > > +        if (ctx->virt_enabled) { \
> > > > > > +            stateen &= hstateen; \
> > > > > > +            if (!(hstateen & SMSTATEEN_STATEN)) {\
> > > > > > +                sstateen = 0; \
> > > > > > +            } \
> > > > > > +        } \
> > > > > > +        if (env->priv == PRV_U && has_ext(ctx, RVS))
> > > > > > {\eventually
> > > > > > meaning
> > > > > > +            stateen &= sstateen; \
> > > > > > +        } \
> > > > > > +        if (!(stateen & SMSTATEEN0_FCSR)) { \
> > > > > > +            return false; \
> > > > > > +        } \
> > > > > > +    } \
> 
> given the size of that I would have thought an "static inline"
> function would be easier to write and maintain for SMSTATEEN_CHECK
Ok. I will update in the next version.
> 
> 


