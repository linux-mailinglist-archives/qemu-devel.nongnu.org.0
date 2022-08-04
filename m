Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA885896C2
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 05:54:48 +0200 (CEST)
Received: from localhost ([::1]:53236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJRwc-0007as-Ti
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 23:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oJRuY-00066D-08
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 23:52:38 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:44903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oJRuW-00062A-39
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 23:52:37 -0400
Received: by mail-oi1-x235.google.com with SMTP id bb16so21964491oib.11
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 20:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:user-agent:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
 bh=FrzyCRep0ytAilZMMsRK3Fl1dES56DD/QAH69sn5JC0=;
 b=mmCIDEp2K8pn6XD06kYK7ACKoj+J4QyRsr2qAZABi2d/RbsGFOTU4iLN0XBB7oO0ni
 K1J92RWplbdkta1Uj2hTIUzY5uqjTUrpeWbAW564GRWTKHooO86P8G+Fb0L9pjqgXhQP
 KxL2YMCOqU7vHbflVvNjrVRXPwDUVQG5aOyYUlppOy1YeLwCenjztcEdjmeHXWztysnf
 jXB6CyCeSk8VaGeq5ZhT82SiRxw6V1+igOfn4OQJCU03PEkAZ7Mxbhxu+q+WOXvVIYH1
 uj46zaoPYj8vlRffox6EtsgS6XdMBuQ5ypODgnKSMauHZ4TSxV1uTeEIIr32BwRR8Bt1
 KLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc;
 bh=FrzyCRep0ytAilZMMsRK3Fl1dES56DD/QAH69sn5JC0=;
 b=RECSzDqyIsnclpLBAEH32XL3v6lfXLrVtQ9useKvL0rtwJv2kfb4U16frrMPs8J9l4
 amYSzZYuqi2C5Y8jx8s5imH4BYDfAIMqYwbYBZckOvBzMP74Z0wq+1QNxzRk+ceWCRum
 gAaFjhCFyA1YK528V4ZRIAVY2d0TB+FZIdX9IfbmXVxYyRx/xKGvUS37l2frxT5HgIws
 Fa4gwS94bNihp6lU3F0fD0L3H1gcB3zZP5qv64vHbjCPme2hfODrKIlcGtCJ7dqYrPpt
 001D52orOCliko0dxrtl43HA7qQmNzo26u2o9NJx+ayteEp7gJ19fuJJiNwaEKoJMGLi
 wz5A==
X-Gm-Message-State: ACgBeo3DQOm6SkaV4u6DIeBTQ+IMft8j8+KnWBYolU/GacGU5ZQRo5Pm
 H0Jd8qqsSem3HuyxESLlsMTfZg==
X-Google-Smtp-Source: AA6agR5DJN1NpLBNZcUytU9hoARuB6J+ljl+dyVHHF7VqXS3swcjSFGw1WFGYjfVy5WXCiZeKjgtNQ==
X-Received: by 2002:a05:6808:11c3:b0:32e:b9ef:4cc9 with SMTP id
 p3-20020a05680811c300b0032eb9ef4cc9mr2872486oiv.125.1659585154283; 
 Wed, 03 Aug 2022 20:52:34 -0700 (PDT)
Received: from [192.168.1.18] ([182.70.65.172])
 by smtp.gmail.com with ESMTPSA id
 d13-20020a9d5e0d000000b006359cd3e3b0sm1637803oti.77.2022.08.03.20.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 20:52:33 -0700 (PDT)
Message-ID: <cbf57485ce76ea2fe341f5d77d44f572bc4d29fb.camel@ventanamicro.com>
Subject: Re: [PATCH v7 3/4] target/riscv: smstateen check for fcsr
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: alistair.francis@wdc.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Date: Thu, 04 Aug 2022 09:22:27 +0530
In-Reply-To: <c5d8304d-315c-bf5b-f63c-2d38348fdf4c@iscas.ac.cn>
References: <20220801171843.72986-1-mchitale@ventanamicro.com>
 <20220801171843.72986-4-mchitale@ventanamicro.com>
 <c5d8304d-315c-bf5b-f63c-2d38348fdf4c@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2022-08-03 at 16:32 +0800, Weiwei Li wrote:
> 在 2022/8/2 上午1:18, Mayuresh Chitale 写道:
> > If smstateen is implemented and sstateen0.fcsr is clear then the
> > floating point operations must return illegal instruction
> > exception.
> 
> I think this is not correct. The exception for float point
> operations 
> must be illegal instruction exception
> 
> if FCSR is not existed(that is misa.F is zero and Zfinx is not 
> supported). However, when FCSR is exsited,
> 
> the final exception should be decided by current privilege level and
> the 
> stateen related csr values just
> 
> like the access control of FCSR.
Ok. We can use the language from the spec itself.
> 
> Regards,
> 
> Weiwei Li
> 
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >   target/riscv/csr.c                        | 23 +++++++++++++
> >   target/riscv/insn_trans/trans_rvf.c.inc   | 40
> > +++++++++++++++++++++--
> >   target/riscv/insn_trans/trans_rvzfh.c.inc | 12 +++++++
> >   3 files changed, 72 insertions(+), 3 deletions(-)
> > 
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 011d6c5976..0512391220 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -79,6 +79,10 @@ static RISCVException fs(CPURISCVState *env, int
> > csrno)
> >           !RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
> >           return RISCV_EXCP_ILLEGAL_INST;
> >       }
> > +
> > +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> > +        return smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR);
> > +    }
> >   #endif
> >       return RISCV_EXCP_NONE;
> >   }
> > @@ -1866,6 +1870,9 @@ static RISCVException
> > write_mstateen0(CPURISCVState *env, int csrno,
> >                                         target_ulong new_val)
> >   {
> >       uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> > +    if (!riscv_has_ext(env, RVF)) {
> > +        wr_mask |= SMSTATEEN0_FCSR;
> > +    }
> >   
> >       return write_mstateen(env, csrno, wr_mask, new_val);
> >   }
> > @@ -1914,6 +1921,10 @@ static RISCVException
> > write_mstateen0h(CPURISCVState *env, int csrno,
> >   {
> >       uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> >   
> > +    if (!riscv_has_ext(env, RVF)) {
> > +        wr_mask |= SMSTATEEN0_FCSR;
> > +    }
> > +
> >       return write_mstateenh(env, csrno, wr_mask, new_val);
> >   }
> >   
> > @@ -1963,6 +1974,10 @@ static RISCVException
> > write_hstateen0(CPURISCVState *env, int csrno,
> >   {
> >       uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> >   
> > +    if (!riscv_has_ext(env, RVF)) {
> > +        wr_mask |= SMSTATEEN0_FCSR;
> > +    }
> > +
> >       return write_hstateen(env, csrno, wr_mask, new_val);
> >   }
> >   
> > @@ -2014,6 +2029,10 @@ static RISCVException
> > write_hstateen0h(CPURISCVState *env, int csrno,
> >   {
> >       uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> >   
> > +    if (!riscv_has_ext(env, RVF)) {
> > +        wr_mask |= SMSTATEEN0_FCSR;
> > +    }
> > +
> >       return write_hstateenh(env, csrno, wr_mask, new_val);
> >   }
> >   
> > @@ -2073,6 +2092,10 @@ static RISCVException
> > write_sstateen0(CPURISCVState *env, int csrno,
> >   {
> >       uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> >   
> > +    if (!riscv_has_ext(env, RVF)) {
> > +        wr_mask |= SMSTATEEN0_FCSR;
> > +    }
> > +
> >       return write_sstateen(env, csrno, wr_mask, new_val);
> >   }
> >   
> > diff --git a/target/riscv/insn_trans/trans_rvf.c.inc
> > b/target/riscv/insn_trans/trans_rvf.c.inc
> > index a1d3eb52ad..ce8a0cc34b 100644
> > --- a/target/riscv/insn_trans/trans_rvf.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> > @@ -24,9 +24,43 @@
> >               return false; \
> >   } while (0)
> >   
> > -#define REQUIRE_ZFINX_OR_F(ctx) do {\
> > -    if (!ctx->cfg_ptr->ext_zfinx) { \
> > -        REQUIRE_EXT(ctx, RVF); \
> > +#ifndef CONFIG_USER_ONLY
> > +static inline bool smstateen_check(DisasContext *ctx, int index)
> > +{
> > +    CPUState *cpu = ctx->cs;
> > +    CPURISCVState *env = cpu->env_ptr;
> > +    uint64_t stateen = env->mstateen[index];
> > +
> > +    if (!ctx->cfg_ptr->ext_smstateen || env->priv == PRV_M) {
> > +        return true;
> > +    }
> > +
> > +    if (ctx->virt_enabled) {
> > +        stateen &= env->hstateen[index];
> > +    }
> > +
> > +    if (env->priv == PRV_U && has_ext(ctx, RVS)) {
> > +        stateen &= env->sstateen[index];
> > +    }
> > +
> > +    if (!(stateen & SMSTATEEN0_FCSR)) {
> > +        return false;
> > +    }
> > +
> > +    return true;
> > +}
> > +#else
> > +#define smstateen_check(ctx, index) (true)
> > +#endif
> > +
> > +#define REQUIRE_ZFINX_OR_F(ctx) do { \
> > +    if (!has_ext(ctx, RVF)) { \
> > +        if (!ctx->cfg_ptr->ext_zfinx) { \
> > +            return false; \
> > +        } \
> > +        if (!smstateen_check(ctx, 0)) { \
> > +            return false; \
> > +        } \
> >       } \
> >   } while (0)
> >   
> > diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc
> > b/target/riscv/insn_trans/trans_rvzfh.c.inc
> > index 5d07150cd0..44d962c920 100644
> > --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> > @@ -20,18 +20,27 @@
> >       if (!ctx->cfg_ptr->ext_zfh) {      \
> >           return false;         \
> >       }                         \
> > +    if (!smstateen_check(ctx, 0)) { \
> > +        return false; \
> > +    } \
> >   } while (0)
> >   
> >   #define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
> >       if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr->ext_zfh) { \
> >           return false;                  \
> >       }                                  \
> > +    if (!smstateen_check(ctx, 0)) { \
> > +        return false; \
> > +    } \
> >   } while (0)
> >   
> >   #define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
> >       if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin)) { \
> >           return false;                         \
> >       }                                         \
> > +    if (!smstateen_check(ctx, 0)) { \
> > +        return false; \
> > +    } \
> >   } while (0)
> >   
> >   #define REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx) do { \
> > @@ -39,6 +48,9 @@
> >             ctx->cfg_ptr->ext_zhinx || ctx->cfg_ptr->ext_zhinxmin)) 
> > {     \
> >           return false;                                        \
> >       }                                                        \
> > +    if (!smstateen_check(ctx, 0)) { \
> > +        return false; \
> > +    } \
> >   } while (0)
> >   
> >   static bool trans_flh(DisasContext *ctx, arg_flh *a)


