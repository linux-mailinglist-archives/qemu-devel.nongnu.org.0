Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB17358385A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 08:03:35 +0200 (CEST)
Received: from localhost ([::1]:53224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGwcQ-00005w-HA
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 02:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oGwFx-0003kS-N3
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 01:40:25 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:36846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oGwFj-0006eg-BJ
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 01:40:21 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 15-20020a17090a098f00b001f305b453feso4291802pjo.1
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 22:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=GMu4+45QXpHBpeUEiyjZx+yiSeHrkcjArnXTg4jbN94=;
 b=j1XyTHP3pXid2f88mOQ6rCtHw9KkS1nEnaEW7fLDZwrVkMz9FLt8vWE6akgnUAxywl
 7iffas1bTC//GtXinpvMZFg/Px0iYGnzhv8MUK+2AXL7eP5aA3EU18Tdf2Ps5w8X3tSR
 VtTHSdM5jiBw36f0X/L23wIkTe/6rQAcsIrGHuvZn5JJHDbVQQZRdBq6eMaXYy6dJzer
 Gi9a2JCCqi/pw7D3es3JB9kyOt8ZuuqhpTy8g5V7pb6RshO7EF4Q1t1BvuwXNpotDOQZ
 rkir8zln06B2E5Ou/a6R0GA2sjLL3xft7f0UqnSfMt+SPoIIuPyPWQLMvKUnpVdpvwn+
 Ggzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=GMu4+45QXpHBpeUEiyjZx+yiSeHrkcjArnXTg4jbN94=;
 b=e5AKf9E2LLKP+daesv8ZsGm8ujwxJclQggMN443KC1OEn2zKWrBdQaG2xAdim+OuKn
 uBJbLMuO0poOiXlBFrN9gu7cdWYCPp67mBS2iDvCbNqOJ9hJEVK6gmARkYNMB6CnnFHp
 MyI4yLN+3pnisJSaB8LmGJqqwrdT0LNcd3hhyKN+2ZNvQcWz3C0kVHJZqJ5ycA3zM/HF
 w4neGdOYV8tR9LhciUQ/2/ne1oVjJY0OTH8LZ8ibddRm9Uy8NMqtT0zG+GU2RDHY2ELG
 e2xdzyWB895gKUsRhvMV7BKHIa1SXDDVpAjpWrcpSQtjOhppu6ARkharozhyMamNUtAS
 YwZQ==
X-Gm-Message-State: AJIora+vpdKGXDeS1EDwr0GR/6jFo++RNXdU5YTLMIXmcPuL2B+CzmQo
 nm5oO0Kg9NclA3Mofv1Kxyqe3Q==
X-Google-Smtp-Source: AGRyM1s3Fx89695w983MTBUFXmB5D0zreZ3H8VvTamufxmOMltLCq6CVBk/hNb2BxnltBzKQX8yX5A==
X-Received: by 2002:a17:90a:5998:b0:1f2:1c38:7f64 with SMTP id
 l24-20020a17090a599800b001f21c387f64mr8317076pji.16.1658986803533; 
 Wed, 27 Jul 2022 22:40:03 -0700 (PDT)
Received: from [192.168.1.18] ([171.50.205.214])
 by smtp.gmail.com with ESMTPSA id
 w125-20020a628283000000b0052ab5d2d398sm14779436pfd.47.2022.07.27.22.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 22:40:02 -0700 (PDT)
Message-ID: <6ed9c96172423deb68559759b2578b829ee23e95.camel@ventanamicro.com>
Subject: Re: [PATCH v6 1/5] target/riscv: Add smstateen support
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: alistair.francis@wdc.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Date: Thu, 28 Jul 2022 11:09:54 +0530
In-Reply-To: <3da7c29e-cd81-b0bf-91e0-5278385bf03b@iscas.ac.cn>
References: <20220721153136.377578-1-mchitale@ventanamicro.com>
 <20220721153136.377578-2-mchitale@ventanamicro.com>
 <4f472f90-e60b-50a9-c145-aa71f45e8085@iscas.ac.cn>
 <ef20cc58bc34712c976b7e4ecd794a8efb9c40be.camel@ventanamicro.com>
 <3da7c29e-cd81-b0bf-91e0-5278385bf03b@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, 2022-07-25 at 15:11 +0800, Weiwei Li wrote:
> 在 2022/7/24 下午11:39, Mayuresh Chitale 写道:
> > On Fri, 2022-07-22 at 08:31 +0800, Weiwei Li wrote:
> > > 在 2022/7/21 下午11:31, Mayuresh Chitale 写道:
> > > > Smstateen extension specifies a mechanism to close
> > > > the potential covert channels that could cause security issues.
> > > > 
> > > > This patch adds the CSRs defined in the specification and
> > > > the corresponding predicates and read/write functions.
> > > > 
> > > > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > > > ---
> > > >    target/riscv/cpu.h      |   4 +
> > > >    target/riscv/cpu_bits.h |  37 ++++
> > > >    target/riscv/csr.c      | 370
> > > > ++++++++++++++++++++++++++++++++++++++++
> > > >    target/riscv/machine.c  |  21 +++
> > > >    4 files changed, 432 insertions(+)
> > > > 
> > > > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > > > index ffb1a18873..7f8e5b0014 100644
> > > > --- a/target/riscv/cpu.h
> > > > +++ b/target/riscv/cpu.h
> > > > @@ -354,6 +354,9 @@ struct CPUArchState {
> > > >    
> > > >        /* CSRs for execution enviornment configuration */
> > > >        uint64_t menvcfg;
> > > > +    uint64_t mstateen[SMSTATEEN_MAX_COUNT];
> > > > +    uint64_t hstateen[SMSTATEEN_MAX_COUNT];
> > > > +    uint64_t sstateen[SMSTATEEN_MAX_COUNT];
> > > >        target_ulong senvcfg;
> > > >        uint64_t henvcfg;
> > > >    #endif
> > > > @@ -426,6 +429,7 @@ struct RISCVCPUConfig {
> > > >        bool ext_zkt;
> > > >        bool ext_ifencei;
> > > >        bool ext_icsr;
> > > > +    bool ext_smstateen;
> > > >        bool ext_svinval;
> > > >        bool ext_svnapot;
> > > >        bool ext_svpbmt;
> > > > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > > > index 6be5a9e9f0..56b7c5bed6 100644
> > > > --- a/target/riscv/cpu_bits.h
> > > > +++ b/target/riscv/cpu_bits.h
> > > > @@ -199,6 +199,12 @@
> > > >    /* Supervisor Configuration CSRs */
> > > >    #define CSR_SENVCFG         0x10A
> > > >    
> > > > +/* Supervisor state CSRs */
> > > > +#define CSR_SSTATEEN0       0x10C
> > > > +#define CSR_SSTATEEN1       0x10D
> > > > +#define CSR_SSTATEEN2       0x10E
> > > > +#define CSR_SSTATEEN3       0x10F
> > > > +
> > > >    /* Supervisor Trap Handling */
> > > >    #define CSR_SSCRATCH        0x140
> > > >    #define CSR_SEPC            0x141
> > > > @@ -242,6 +248,16 @@
> > > >    #define CSR_HENVCFG         0x60A
> > > >    #define CSR_HENVCFGH        0x61A
> > > >    
> > > > +/* Hypervisor state CSRs */
> > > > +#define CSR_HSTATEEN0       0x60C
> > > > +#define CSR_HSTATEEN0H      0x61C
> > > > +#define CSR_HSTATEEN1       0x60D
> > > > +#define CSR_HSTATEEN1H      0x61D
> > > > +#define CSR_HSTATEEN2       0x60E
> > > > +#define CSR_HSTATEEN2H      0x61E
> > > > +#define CSR_HSTATEEN3       0x60F
> > > > +#define CSR_HSTATEEN3H      0x61F
> > > > +
> > > >    /* Virtual CSRs */
> > > >    #define CSR_VSSTATUS        0x200
> > > >    #define CSR_VSIE            0x204
> > > > @@ -283,6 +299,27 @@
> > > >    #define CSR_MENVCFG         0x30A
> > > >    #define CSR_MENVCFGH        0x31A
> > > >    
> > > > +/* Machine state CSRs */
> > > > +#define CSR_MSTATEEN0       0x30C
> > > > +#define CSR_MSTATEEN0H      0x31C
> > > > +#define CSR_MSTATEEN1       0x30D
> > > > +#define CSR_MSTATEEN1H      0x31D
> > > > +#define CSR_MSTATEEN2       0x30E
> > > > +#define CSR_MSTATEEN2H      0x31E
> > > > +#define CSR_MSTATEEN3       0x30F
> > > > +#define CSR_MSTATEEN3H      0x31F
> > > > +
> > > > +/* Common defines for all smstateen */
> > > > +#define SMSTATEEN_MAX_COUNT 4
> > > > +#define SMSTATEEN0_CS       (1ULL << 0)
> > > > +#define SMSTATEEN0_FCSR     (1ULL << 1)
> > > > +#define SMSTATEEN0_HSCONTXT (1ULL << 57)
> > > > +#define SMSTATEEN0_IMSIC    (1ULL << 58)
> > > > +#define SMSTATEEN0_AIA      (1ULL << 59)
> > > > +#define SMSTATEEN0_SVSLCT   (1ULL << 60)
> > > > +#define SMSTATEEN0_HSENVCFG (1ULL << 62)
> > > > +#define SMSTATEEN_STATEN    (1ULL << 63)
> > > Maybe  SMSTATEEN_STATEEN better.
> > ok. Will update in the next version.
> > > > +
> > > >    /* Enhanced Physical Memory Protection (ePMP) */
> > > >    #define CSR_MSECCFG         0x747
> > > >    #define CSR_MSECCFGH        0x757
> > > > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > > > index 235f2a011e..27032a416c 100644
> > > > --- a/target/riscv/csr.c
> > > > +++ b/target/riscv/csr.c
> > > > @@ -339,6 +339,68 @@ static RISCVException
> > > > hmode32(CPURISCVState
> > > > *env, int csrno)
> > > >    
> > > >    }
> > > >    
> > > > +static RISCVException mstateen(CPURISCVState *env, int csrno)
> > > > +{
> > > > +    CPUState *cs = env_cpu(env);
> > > > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > > > +
> > > > +    if (!cpu->cfg.ext_smstateen) {
> > > > +        return RISCV_EXCP_ILLEGAL_INST;
> > > > +    }
> > > > +
> > > > +    return any(env, csrno);
> > > > +}
> > > > +
> > > > +static RISCVException hstateen_pred(CPURISCVState *env, int
> > > > csrno,
> > > > int base)
> > > > +{
> > > > +    CPUState *cs = env_cpu(env);
> > > > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > > > +
> > > > +    if (!cpu->cfg.ext_smstateen) {
> > > > +        return RISCV_EXCP_ILLEGAL_INST;
> > > > +    }
> > > > +
> > > > +    if (!(env->mstateen[csrno - base] & SMSTATEEN_STATEN)) {
> > > > +        return RISCV_EXCP_ILLEGAL_INST;
> > > > +    }
> > > > +
> > > > +    return hmode(env, csrno);
> > > > +}
> > > > +
> > > > +static RISCVException hstateen(CPURISCVState *env, int csrno)
> > > > +{
> > > > +    return hstateen_pred(env, csrno, CSR_HSTATEEN0);
> > > > +}
> > > > +
> > > > +static RISCVException hstateenh(CPURISCVState *env, int csrno)
> > > > +{
> > > > +    return hstateen_pred(env, csrno, CSR_HSTATEEN0H);
> > > > +}
> > > > +
> > > > +static RISCVException sstateen(CPURISCVState *env, int csrno)
> > > > +{
> > > > +    bool virt = riscv_cpu_virt_enabled(env);
> > > > +    int index = csrno - CSR_SSTATEEN0;
> > > > +    CPUState *cs = env_cpu(env);
> > > > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > > > +
> > > > +    if (!cpu->cfg.ext_smstateen) {
> > > > +        return RISCV_EXCP_ILLEGAL_INST;
> > > > +    }
> > > > +
> > > > +    if (!(env->mstateen[index] & SMSTATEEN_STATEN)) {
> > > > +        return RISCV_EXCP_ILLEGAL_INST;
> > > > +    }
> > > > +
> > > > +    if (virt) {
> > > > +        if (!(env->hstateen[index] & SMSTATEEN_STATEN)) {
> > > > +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > > > +        }
> > > > +    }
> > > > +
> > > > +    return smode(env, csrno);
> > > > +}
> > > > +
> > > >    /* Checks if PointerMasking registers could be accessed */
> > > >    static RISCVException pointer_masking(CPURISCVState *env,
> > > > int
> > > > csrno)
> > > >    {
> > > > @@ -1699,6 +1761,263 @@ static RISCVException
> > > > write_henvcfgh(CPURISCVState *env, int csrno,
> > > >        return RISCV_EXCP_NONE;
> > > >    }
> > > >    
> > > > +static inline void write_smstateen(CPURISCVState *env,
> > > > uint64_t
> > > > *reg,
> > > > +                                   uint64_t wr_mask, uint64_t
> > > > new_val)
> > > > +{
> > > > +    *reg = (*reg & ~wr_mask) | (new_val & wr_mask);
> > > > +}
> > > > +
> > > > +static RISCVException read_mstateen(CPURISCVState *env, int
> > > > csrno,
> > > > +                                    target_ulong *val)
> > > > +{
> > > > +    *val = env->mstateen[csrno - CSR_MSTATEEN0];
> > > > +
> > > > +    return RISCV_EXCP_NONE;
> > > > +}
> > > > +
> > > > +static RISCVException write_mstateen(CPURISCVState *env, int
> > > > csrno,
> > > > +                                     uint64_t wr_mask,
> > > > target_ulong new_val)
> > > > +{
> > > > +    uint64_t *reg;
> > > > +
> > > > +    reg = &env->mstateen[csrno - CSR_MSTATEEN0];
> > > > +    write_smstateen(env, reg, wr_mask, new_val);
> > > > +
> > > > +    return RISCV_EXCP_NONE;
> > > > +}
> > > > +
> > > > +static RISCVException write_mstateen0(CPURISCVState *env, int
> > > > csrno,
> > > > +                                      target_ulong new_val)
> > > > +{
> > > > +    uint64_t wr_mask = SMSTATEEN_STATEN;
> > > > +
> > > > +    return write_mstateen(env, csrno, wr_mask, new_val);
> > > > +}
> > > > +
> > > > +static RISCVException write_mstateen1(CPURISCVState *env, int
> > > > csrno,
> > > > +                                      target_ulong new_val)
> > > > +{
> > > > +    return write_mstateen(env, csrno, SMSTATEEN_STATEN,
> > > > new_val);
> > > > +}
> > > > +
> > > > +static RISCVException write_mstateen2(CPURISCVState *env, int
> > > > csrno,
> > > > +                                      target_ulong new_val)
> > > > +{
> > > > +    return write_mstateen(env, csrno, SMSTATEEN_STATEN,
> > > > new_val);
> > > > +}
> > > > +
> > > > +static RISCVException write_mstateen3(CPURISCVState *env, int
> > > > csrno,
> > > > +                                      target_ulong new_val)
> > > > +{
> > > > +    return write_mstateen(env, csrno, SMSTATEEN_STATEN,
> > > > new_val);
> > > > +}
> > > > +
> > > Mstateen1~3  can share the same write function currently. The
> > > same
> > > to
> > > h/sstateen1~3.
> > I think its better to keep them separate as it will anyway be
> > required
> > once they are defined.
> 
> Only a few bits in mstateen0 is used currently. It may need a long
> time 
> before mstateen1~3 to be used.
> 
> And it's very easy to separate it out if required. So it seems 
> unnecessary to copy two times to prepare
> 
> for future use currently.
> 
I think its better to separate now and then modify the functions for
mstateen1-3 as and when required.
> Regards,
> 
> Weiwei Li
> 
> > > > +static RISCVException read_mstateenh(CPURISCVState *env, int
> > > > csrno,
> > > > +                                      target_ulong *val)
> > > > +{
> > > > +    *val = env->mstateen[csrno - CSR_MSTATEEN0H] >> 32;
> > > > +
> > > > +    return RISCV_EXCP_NONE;
> > > > +}
> > > > +
> > > > +static RISCVException write_mstateenh(CPURISCVState *env, int
> > > > csrno,
> > > > +                                      uint64_t wr_mask,
> > > > target_ulong new_val)
> > > > +{
> > > > +    uint64_t *reg, val;
> > > > +
> > > > +    reg = &env->mstateen[csrno - CSR_MSTATEEN0H];
> > > > +    val = (uint64_t)new_val << 32;
> > > > +    val |= *reg & 0xFFFFFFFF;
> > > > +    write_smstateen(env, reg, wr_mask, val);
> > > > +
> > > > +    return RISCV_EXCP_NONE;
> > > > +}
> > > > +
> > > > +static RISCVException write_mstateen0h(CPURISCVState *env, int
> > > > csrno,
> > > > +                                      target_ulong new_val)
> > > > +{
> > > > +    uint64_t wr_mask = SMSTATEEN_STATEN;
> > > > +
> > > > +    return write_mstateenh(env, csrno, wr_mask, new_val);
> > > > +}
> > > > +
> > > > +static RISCVException write_mstateen1h(CPURISCVState *env, int
> > > > csrno,
> > > > +                                      target_ulong new_val)
> > > > +{
> > > > +    return write_mstateenh(env, csrno, SMSTATEEN_STATEN,
> > > > new_val);
> > > > +}
> > > > +
> > > > +static RISCVException write_mstateen2h(CPURISCVState *env, int
> > > > csrno,
> > > > +                                      target_ulong new_val)
> > > > +{
> > > > +    return write_mstateenh(env, csrno, SMSTATEEN_STATEN,
> > > > new_val);
> > > > +}
> > > > +
> > > > +static RISCVException write_mstateen3h(CPURISCVState *env, int
> > > > csrno,
> > > > +                                      target_ulong new_val)
> > > > +{
> > > > +    return write_mstateenh(env, csrno, SMSTATEEN_STATEN,
> > > > new_val);
> > > > +}
> > > > +
> > > > +static RISCVException read_hstateen(CPURISCVState *env, int
> > > > csrno,
> > > > +                                    target_ulong *val)
> > > > +{
> > > > +    int index = csrno - CSR_HSTATEEN0;
> > > > +
> > > > +    *val = env->hstateen[index] & env->mstateen[index];
> > > > +
> > > > +    return RISCV_EXCP_NONE;
> > > > +}
> > > > +
> > > > +static RISCVException write_hstateen(CPURISCVState *env, int
> > > > csrno,
> > > > +                                     uint64_t mask,
> > > > target_ulong
> > > > new_val)
> > > > +{
> > > > +    int index = csrno - CSR_HSTATEEN0;
> > > > +    uint64_t *reg, wr_mask;
> > > > +
> > > > +    reg = &env->hstateen[index];
> > > > +    wr_mask = env->mstateen[index] & mask;
> > > > +    write_smstateen(env, reg, wr_mask, new_val);
> > > > +
> > > > +    return RISCV_EXCP_NONE;
> > > > +}
> > > > +
> > > > +static RISCVException write_hstateen0(CPURISCVState *env, int
> > > > csrno,
> > > > +                                      target_ulong new_val)
> > > > +{
> > > > +    uint64_t wr_mask = SMSTATEEN_STATEN;
> > > > +
> > > > +    return write_hstateen(env, csrno, wr_mask, new_val);
> > > > +}
> > > > +
> > > > +static RISCVException write_hstateen1(CPURISCVState *env, int
> > > > csrno,
> > > > +                                      target_ulong new_val)
> > > > +{
> > > > +    return write_hstateen(env, csrno, SMSTATEEN_STATEN,
> > > > new_val);
> > > > +}
> > > > +
> > > > +static RISCVException write_hstateen2(CPURISCVState *env, int
> > > > csrno,
> > > > +                                      target_ulong new_val)
> > > > +{
> > > > +    return write_hstateen(env, csrno, SMSTATEEN_STATEN,
> > > > new_val);
> > > > +}
> > > > +
> > > > +static RISCVException write_hstateen3(CPURISCVState *env, int
> > > > csrno,
> > > > +                                      target_ulong new_val)
> > > > +{
> > > > +    return write_hstateen(env, csrno, SMSTATEEN_STATEN,
> > > > new_val);
> > > > +}
> > > > +
> > > > +static RISCVException read_hstateenh(CPURISCVState *env, int
> > > > csrno,
> > > > +                                     target_ulong *val)
> > > > +{
> > > > +    int index = csrno - CSR_HSTATEEN0H;
> > > > +
> > > > +    *val = (env->hstateen[index] >> 32) & (env-
> > > > >mstateen[index] >>
> > > > 32);
> > > > +
> > > > +    return RISCV_EXCP_NONE;
> > > > +}
> > > > +
> > > > +static RISCVException write_hstateenh(CPURISCVState *env, int
> > > > csrno,
> > > > +                                      uint64_t mask,
> > > > target_ulong
> > > > new_val)
> > > > +{
> > > > +    int index = csrno - CSR_HSTATEEN0H;
> > > > +    uint64_t *reg, wr_mask, val;
> > > > +
> > > > +    reg = &env->hstateen[index];
> > > > +    val = (uint64_t)new_val << 32;
> > > > +    val |= *reg & 0xFFFFFFFF;
> > > > +    wr_mask = env->mstateen[index] & mask;
> > > > +    write_smstateen(env, reg, wr_mask, val);
> > > > +
> > > > +    return RISCV_EXCP_NONE;
> > > > +}
> > > > +
> > > > +static RISCVException write_hstateen0h(CPURISCVState *env, int
> > > > csrno,
> > > > +                                       target_ulong new_val)
> > > > +{
> > > > +    uint64_t wr_mask = SMSTATEEN_STATEN;
> > > > +
> > > > +    return write_hstateenh(env, csrno, wr_mask, new_val);
> > > > +}
> > > > +
> > > > +static RISCVException write_hstateen1h(CPURISCVState *env, int
> > > > csrno,
> > > > +                                       target_ulong new_val)
> > > > +{
> > > > +    return write_hstateenh(env, csrno, SMSTATEEN_STATEN,
> > > > new_val);
> > > > +}
> > > > +
> > > > +static RISCVException write_hstateen2h(CPURISCVState *env, int
> > > > csrno,
> > > > +                                       target_ulong new_val)
> > > > +{
> > > > +    return write_hstateenh(env, csrno, SMSTATEEN_STATEN,
> > > > new_val);
> > > > +}
> > > > +
> > > > +static RISCVException write_hstateen3h(CPURISCVState *env, int
> > > > csrno,
> > > > +                                       target_ulong new_val)
> > > > +{
> > > > +    return write_hstateenh(env, csrno, SMSTATEEN_STATEN,
> > > > new_val);
> > > > +}
> > > > +
> > > > +static RISCVException read_sstateen(CPURISCVState *env, int
> > > > csrno,
> > > > +                                    target_ulong *val)
> > > > +{
> > > > +    bool virt = riscv_cpu_virt_enabled(env);
> > > > +    int index = csrno - CSR_SSTATEEN0;
> > > > +
> > > > +    *val = env->sstateen[index] & env->mstateen[index];
> > > > +    if (virt) {
> > > > +        *val &= env->hstateen[index];
> > > > +    }
> > > > +
> > > > +    return RISCV_EXCP_NONE;
> > > > +}
> > > > +
> > > > +static RISCVException write_sstateen(CPURISCVState *env, int
> > > > csrno,
> > > > +                                     uint64_t mask,
> > > > target_ulong
> > > > new_val)
> > > > +{
> > > > +    bool virt = riscv_cpu_virt_enabled(env);
> > > > +    int index = csrno - CSR_SSTATEEN0;
> > > > +    uint64_t wr_mask;
> > > > +    uint64_t *reg;
> > > > +
> > > > +    wr_mask = env->mstateen[index] & mask;
> > > > +    if (virt) {
> > > > +        wr_mask &= env->hstateen[index];
> > > > +    }
> > > > +
> > > > +    reg = &env->sstateen[index];
> > > > +    write_smstateen(env, reg, wr_mask, new_val);
> > > > +
> > > > +    return RISCV_EXCP_NONE;
> > > > +}
> > > > +
> > > > +static RISCVException write_sstateen0(CPURISCVState *env, int
> > > > csrno,
> > > > +                                      target_ulong new_val)
> > > > +{
> > > > +    uint64_t wr_mask = SMSTATEEN_STATEN;
> > > > +
> > > > +    return write_sstateen(env, csrno, wr_mask, new_val);
> > > > +}
> > > > +
> > > > +static RISCVException write_sstateen1(CPURISCVState *env, int
> > > > csrno,
> > > > +                                      target_ulong new_val)
> > > > +{
> > > > +    return write_sstateen(env, csrno, SMSTATEEN_STATEN,
> > > > new_val);
> > > > +}
> > > > +
> > > > +static RISCVException write_sstateen2(CPURISCVState *env, int
> > > > csrno,
> > > > +                                      target_ulong new_val)
> > > > +{
> > > > +    return write_sstateen(env, csrno, SMSTATEEN_STATEN,
> > > > new_val);
> > > > +}
> > > > +
> > > > +static RISCVException write_sstateen3(CPURISCVState *env, int
> > > > csrno,
> > > > +                                      target_ulong new_val)
> > > > +{
> > > > +    return write_sstateen(env, csrno, SMSTATEEN_STATEN,
> > > > new_val);
> > > > +}
> > > > +
> > > >    static RISCVException rmw_mip64(CPURISCVState *env, int
> > > > csrno,
> > > >                                    uint64_t *ret_val,
> > > >                                    uint64_t new_val, uint64_t
> > > > wr_mask)
> > > > @@ -3558,6 +3877,57 @@ riscv_csr_operations
> > > > csr_ops[CSR_TABLE_SIZE]
> > > > = {
> > > >        [CSR_HENVCFGH] = { "henvcfgh", hmode32, read_henvcfgh,
> > > > write_henvcfgh,
> > > >                                              .min_priv_ver =
> > > > PRIV_VERSION_1_12_0 },
> > > >    
> > > > +    /* Smstateen extension CSRs */
> > > > +    [CSR_MSTATEEN0] = { "mstateen0", mstateen, read_mstateen,
> > > > write_mstateen0,
> > > > +                         .min_priv_ver = PRIV_VERSION_1_12_0
> > > > },
> > > The new lines have been updated to align with the last line in my
> > > previous patchset(accepted).
> > > 
> > > So it's better to make ' . ' align with ' " '.
> > ok. Will update in the next version.
> > > Regards,
> > > 
> > > Weiwei Li
> > > 
> > > > +    [CSR_MSTATEEN0H] = { "mstateen0h", mstateen,
> > > > read_mstateenh,
> > > > +                          write_mstateen0h,
> > > > +                          .min_priv_ver = PRIV_VERSION_1_12_0
> > > > },
> > > > +    [CSR_MSTATEEN1] = { "mstateen1", mstateen, read_mstateen,
> > > > write_mstateen1,
> > > > +                         .min_priv_ver = PRIV_VERSION_1_12_0
> > > > },
> > > > +    [CSR_MSTATEEN1H] = { "mstateen1h", mstateen,
> > > > read_mstateenh,
> > > > +                          write_mstateen1h,
> > > > +                          .min_priv_ver = PRIV_VERSION_1_12_0
> > > > },
> > > > +    [CSR_MSTATEEN2] = { "mstateen2", mstateen, read_mstateen,
> > > > write_mstateen2,
> > > > +                         .min_priv_ver = PRIV_VERSION_1_12_0
> > > > },
> > > > +    [CSR_MSTATEEN2H] = { "mstateen2h", mstateen,
> > > > read_mstateenh,
> > > > +                          write_mstateen2h,
> > > > +                          .min_priv_ver = PRIV_VERSION_1_12_0
> > > > },
> > > > +    [CSR_MSTATEEN3] = { "mstateen3", mstateen, read_mstateen,
> > > > write_mstateen3,
> > > > +                         .min_priv_ver = PRIV_VERSION_1_12_0
> > > > },
> > > > +    [CSR_MSTATEEN3H] = { "mstateen3h", mstateen,
> > > > read_mstateenh,
> > > > +                          write_mstateen3h,
> > > > +                          .min_priv_ver = PRIV_VERSION_1_12_0
> > > > },
> > > > +
> > > > +    [CSR_HSTATEEN0] = { "hstateen0", hstateen, read_hstateen,
> > > > write_hstateen0,
> > > > +                         .min_priv_ver = PRIV_VERSION_1_12_0
> > > > },
> > > > +    [CSR_HSTATEEN0H] = { "hstateen0h", hstateenh,
> > > > read_hstateenh,
> > > > +                          write_hstateen0h,
> > > > +                          .min_priv_ver = PRIV_VERSION_1_12_0
> > > > },
> > > > +    [CSR_HSTATEEN1] = { "hstateen1", hstateen, read_hstateen,
> > > > write_hstateen1,
> > > > +                         .min_priv_ver = PRIV_VERSION_1_12_0
> > > > },
> > > > +    [CSR_HSTATEEN1H] = { "hstateen1h", hstateenh,
> > > > read_hstateenh,
> > > > +                          write_hstateen1h,
> > > > +                          .min_priv_ver = PRIV_VERSION_1_12_0
> > > > },
> > > > +    [CSR_HSTATEEN2] = { "hstateen2", hstateen, read_hstateen,
> > > > write_hstateen2,
> > > > +                         .min_priv_ver = PRIV_VERSION_1_12_0
> > > > },
> > > > +    [CSR_HSTATEEN2H] = { "hstateen2h", hstateenh,
> > > > read_hstateenh,
> > > > +                          write_hstateen2h,
> > > > +                          .min_priv_ver = PRIV_VERSION_1_12_0
> > > > },
> > > > +    [CSR_HSTATEEN3] = { "hstateen3", hstateen, read_hstateen,
> > > > write_hstateen3,
> > > > +                         .min_priv_ver = PRIV_VERSION_1_12_0
> > > > },
> > > > +    [CSR_HSTATEEN3H] = { "hstateen3h", hstateenh,
> > > > read_hstateenh,
> > > > +                          write_hstateen3h,
> > > > +                          .min_priv_ver = PRIV_VERSION_1_12_0
> > > > },
> > > > +
> > > > +    [CSR_SSTATEEN0] = { "sstateen0", sstateen, read_sstateen,
> > > > write_sstateen0,
> > > > +                         .min_priv_ver = PRIV_VERSION_1_12_0
> > > > },
> > > > +    [CSR_SSTATEEN1] = { "sstateen1", sstateen, read_sstateen,
> > > > write_sstateen1,
> > > > +                         .min_priv_ver = PRIV_VERSION_1_12_0
> > > > },
> > > > +    [CSR_SSTATEEN2] = { "sstateen2", sstateen, read_sstateen,
> > > > write_sstateen2,
> > > > +                         .min_priv_ver = PRIV_VERSION_1_12_0
> > > > },
> > > > +    [CSR_SSTATEEN3] = { "sstateen3", sstateen, read_sstateen,
> > > > write_sstateen3,
> > > > +                         .min_priv_ver = PRIV_VERSION_1_12_0
> > > > },
> > > >        /* Supervisor Trap Setup */
> > > >        [CSR_SSTATUS]    = { "sstatus",    smode,
> > > > read_sstatus,    write_sstatus, NULL,
> > > >                                                  read_sstatus_i
> > > > 128
> > > >                 },
> > > > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > > > index dc182ca811..ef418ac19d 100644
> > > > --- a/target/riscv/machine.c
> > > > +++ b/target/riscv/machine.c
> > > > @@ -262,6 +262,26 @@ static int riscv_cpu_post_load(void
> > > > *opaque,
> > > > int version_id)
> > > >        return 0;
> > > >    }
> > > >    
> > > > +static bool smstateen_needed(void *opaque)
> > > > +{
> > > > +    RISCVCPU *cpu = opaque;
> > > > +
> > > > +    return cpu->cfg.ext_smstateen;
> > > > +}
> > > > +
> > > > +static const VMStateDescription vmstate_smstateen = {
> > > > +    .name = "cpu/smtateen",
> > > > +    .version_id = 1,
> > > > +    .minimum_version_id = 1,
> > > > +    .needed = smstateen_needed,
> > > > +    .fields = (VMStateField[]) {
> > > > +        VMSTATE_UINT64_ARRAY(env.mstateen, RISCVCPU, 4),
> > > > +        VMSTATE_UINT64_ARRAY(env.hstateen, RISCVCPU, 4),
> > > > +        VMSTATE_UINT64_ARRAY(env.sstateen, RISCVCPU, 4),
> > > > +        VMSTATE_END_OF_LIST()
> > > > +    }
> > > > +};
> > > > +
> > > >    static bool envcfg_needed(void *opaque)
> > > >    {
> > > >        RISCVCPU *cpu = opaque;
> > > > @@ -372,6 +392,7 @@ const VMStateDescription vmstate_riscv_cpu
> > > > = {
> > > >            &vmstate_kvmtimer,
> > > >            &vmstate_envcfg,
> > > >            &vmstate_debug,
> > > > +        &vmstate_smstateen,
> > > >            NULL
> > > >        }
> > > >    };


