Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DF957F5E5
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jul 2022 17:51:22 +0200 (CEST)
Received: from localhost ([::1]:48224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFdt3-0006wg-GT
	for lists+qemu-devel@lfdr.de; Sun, 24 Jul 2022 11:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oFdrP-0005Sm-0A
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 11:49:39 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:46633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oFdrN-0003am-4H
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 11:49:38 -0400
Received: by mail-pg1-x529.google.com with SMTP id 6so8261270pgb.13
 for <qemu-devel@nongnu.org>; Sun, 24 Jul 2022 08:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=8Kud0WmqyTpynKDivxzl5QQYrlenaOxA914g7zGCRYw=;
 b=YERYvVkT8g3g9M0TMKk8Pd+FfAtbAEn69mUgL+XQnBbeb29tuQolMcrbkE6GbOiASR
 4VnJQEKRRcxxXv9pgSjxpQJVCEwaHXLttFx/6jrq5JDosWEokqD8UVOY8AsYe4OI30Jm
 WxIfnciwC0qHwZgRuckJJaXuP/KI1/IsxB+XpszBCitEjzpzj9cCZjJh/MdIX3xoLwRT
 D3iyht3jRwMbPNsZscWLOxM48fOHwsPurzgujAiIhsXmIczbTzCwGTmeJSUCOvdLCdKn
 fb8EPFCtJ4oTJaNgY/KglKeFN6A5u5zacx613vm2us8CeLu0Xkr6D/f2FNGPA4YdHW1G
 Xe3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=8Kud0WmqyTpynKDivxzl5QQYrlenaOxA914g7zGCRYw=;
 b=KRsIx0sFdZ+tnm8G9fS2QKTuQ3/Us2sc4IANWK9lPd7iSBSPfMHCTNV7Wr2GUa7PNL
 SoQk5zOqhdkStvtij7TI37ZIp5c30a6e3D9L0uoiaeLeEoDonZ3FcL4CssTJSrul58to
 K74ls0Xtvrkt9Udrg2n5AHx0bljGg6m1uj3qy0FnFVQrqy6+dD+ddzFAM2Hoi/BN5Icv
 w8ci3RHdWTVpEk4cjjNlznsyoec16DqkbujTGLwkbmZzFjwAlbexIam6Jek/JSSa4XEb
 RzcPBUQkKKEGGcORJHm7TrwkBkUQ/j3XE8Opib089Mygv/YUT4JMWjfXSxLgAHn4h6ap
 xRCA==
X-Gm-Message-State: AJIora82+Ua23qs+K7Sd22oN8q5UZwaQZ+NlVIEDg8sHpWwhQxXjDiuY
 jZJk99CDPNR/AOWlwN0SR0FoxA==
X-Google-Smtp-Source: AGRyM1tj6zc8F1MG2qCNRAPa63a9pFgAUXxufK9PPwJi0ZqvVVXQEezEcw6cozXqYTVHa9AoFAmwBg==
X-Received: by 2002:a05:6a00:124c:b0:52b:26b6:2ab4 with SMTP id
 u12-20020a056a00124c00b0052b26b62ab4mr9050898pfi.85.1658677775347; 
 Sun, 24 Jul 2022 08:49:35 -0700 (PDT)
Received: from [192.168.1.18] ([182.70.95.50])
 by smtp.gmail.com with ESMTPSA id
 s27-20020a63525b000000b00419b02043e1sm6693938pgl.38.2022.07.24.08.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 08:49:34 -0700 (PDT)
Message-ID: <fb88d0ccf7f6c4204b932d14fa88f952e314e922.camel@ventanamicro.com>
Subject: Re: [PATCH v6 3/5] target/riscv: smstateen check for fcsr
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com
Date: Sun, 24 Jul 2022 21:19:28 +0530
In-Reply-To: <e819eb9c-fdec-5138-5b94-f8ddd2331f7a@iscas.ac.cn>
References: <20220721153136.377578-1-mchitale@ventanamicro.com>
 <20220721153136.377578-4-mchitale@ventanamicro.com>
 <e819eb9c-fdec-5138-5b94-f8ddd2331f7a@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pg1-x529.google.com
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

On Fri, 2022-07-22 at 09:42 +0800, Weiwei Li wrote:
> 在 2022/7/21 下午11:31, Mayuresh Chitale 写道:
> > If smstateen is implemented and sstateen0.fcsr is clear then the
> > floating point operations must return illegal instruction
> > exception.
> > 
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >   target/riscv/csr.c                        | 23 ++++++++++++++
> >   target/riscv/insn_trans/trans_rvf.c.inc   | 38
> > +++++++++++++++++++++--
> >   target/riscv/insn_trans/trans_rvzfh.c.inc |  4 +++
> >   3 files changed, 63 insertions(+), 2 deletions(-)
> > 
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index ab06b117f9..a597b6cbc7 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -96,6 +96,10 @@ static RISCVException fs(CPURISCVState *env, int
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
> > @@ -1876,6 +1880,9 @@ static RISCVException
> > write_mstateen0(CPURISCVState *env, int csrno,
> >                                         target_ulong new_val)
> >   {
> >       uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
> > +    if (!riscv_has_ext(env, RVF)) {
> > +        wr_mask |= SMSTATEEN0_FCSR;
> > +    }
> >   
> >       return write_mstateen(env, csrno, wr_mask, new_val);
> >   }
> > @@ -1924,6 +1931,10 @@ static RISCVException
> > write_mstateen0h(CPURISCVState *env, int csrno,
> >   {
> >       uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
> >   
> > +    if (!riscv_has_ext(env, RVF)) {
> > +        wr_mask |= SMSTATEEN0_FCSR;
> > +    }
> > +
> >       return write_mstateenh(env, csrno, wr_mask, new_val);
> >   }
> >   
> > @@ -1973,6 +1984,10 @@ static RISCVException
> > write_hstateen0(CPURISCVState *env, int csrno,
> >   {
> >       uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
> >   
> > +    if (!riscv_has_ext(env, RVF)) {
> > +        wr_mask |= SMSTATEEN0_FCSR;
> > +    }
> > +
> >       return write_hstateen(env, csrno, wr_mask, new_val);
> >   }
> >   
> > @@ -2024,6 +2039,10 @@ static RISCVException
> > write_hstateen0h(CPURISCVState *env, int csrno,
> >   {
> >       uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
> >   
> > +    if (!riscv_has_ext(env, RVF)) {
> > +        wr_mask |= SMSTATEEN0_FCSR;
> > +    }
> > +
> >       return write_hstateenh(env, csrno, wr_mask, new_val);
> >   }
> >   
> > @@ -2083,6 +2102,10 @@ static RISCVException
> > write_sstateen0(CPURISCVState *env, int csrno,
> >   {
> >       uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
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
> > index a1d3eb52ad..c43c48336b 100644
> > --- a/target/riscv/insn_trans/trans_rvf.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> > @@ -24,9 +24,43 @@
> >               return false; \
> >   } while (0)
> >   
> > +#ifndef CONFIG_USER_ONLY
> > +#define SMSTATEEN_CHECK(ctx) do {\
> > +    CPUState *cpu = ctx->cs; \
> > +    CPURISCVState *env = cpu->env_ptr; \
> > +    if (ctx->cfg_ptr->ext_smstateen && \
> > +        (env->priv < PRV_M)) { \
> > +        uint64_t stateen = env->mstateen[0]; \
> > +        uint64_t hstateen = env->hstateen[0]; \
> > +        uint64_t sstateen = env->sstateen[0]; \
> > +        if (!(stateen & SMSTATEEN_STATEN)) {\
> > +            hstateen = 0; \
> > +            sstateen = 0; \
> > +        } \
> > +        if (ctx->virt_enabled) { \
> > +            stateen &= hstateen; \
> > +            if (!(hstateen & SMSTATEEN_STATEN)) {\
> > +                sstateen = 0; \
> > +            } \
> > +        } \
> > +        if (env->priv == PRV_U && has_ext(ctx, RVS)) {\eventually
> > meaning
> > +            stateen &= sstateen; \
> > +        } \
> > +        if (!(stateen & SMSTATEEN0_FCSR)) { \
> > +            return false; \
> > +        } \
> > +    } \
> > +} while (0)
> 
> It's better to add a space before '\'.
ok. will modify in the next version.
> 
> > +#else
> > +#define SMSTATEEN_CHECK(ctx)
> > +#endif
> > +
> >   #define REQUIRE_ZFINX_OR_F(ctx) do {\
> > -    if (!ctx->cfg_ptr->ext_zfinx) { \
> > -        REQUIRE_EXT(ctx, RVF); \
> > +    if (!has_ext(ctx, RVF)) { \
> > +        SMSTATEEN_CHECK(ctx); \
> > +        if (!ctx->cfg_ptr->ext_zfinx) { \
> > +            return false; \
> > +        } \
> >       } \
> >   } while (0)
> 
> SMSTATEEN_CHECK is for CSR. and REQUIRE_ZFINX_OR_F is for Extension.
> I think It's better to separate them. By the way, if we want the
> smallest modification
> for current code, adding it to REQUIRE_FPU seems better.
Actually REQUIRE_FPU is checking for mstatus.fs but as per smstateen
spec we need to check for misa.f which is done in REQUIRE_ZFINX_OR_F.
> Regards,
> Weiwei Li
> 
> >   
> > diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc
> > b/target/riscv/insn_trans/trans_rvzfh.c.inc
> > index 5d07150cd0..b165ea9d58 100644
> > --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> > @@ -17,24 +17,28 @@
> >    */
> >   
> >   #define REQUIRE_ZFH(ctx) do { \
> > +    SMSTATEEN_CHECK(ctx); \
> >       if (!ctx->cfg_ptr->ext_zfh) {      \
> >           return false;         \
> >       }                         \
> >   } while (0)
> >   
> >   #define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
> > +    SMSTATEEN_CHECK(ctx); \
> >       if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr->ext_zfh) { \
> >           return false;                  \
> >       }                                  \
> >   } while (0)
> >   
> >   #define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
> > +    SMSTATEEN_CHECK(ctx); \
> >       if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin)) { \
> >           return false;                         \
> >       }                                         \
> >   } while (0)
> >   
> >   #define REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx) do { \
> > +    SMSTATEEN_CHECK(ctx); \
> >       if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin
> > ||          \
> >             ctx->cfg_ptr->ext_zhinx || ctx->cfg_ptr->ext_zhinxmin)) 
> > {     \
> >           return false;                                        \


