Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA56583907
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 08:54:03 +0200 (CEST)
Received: from localhost ([::1]:36330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGxPF-0004Da-ID
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 02:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oGxDa-0006hr-UD
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:41:58 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:39805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oGxDV-0002s5-Gr
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:41:57 -0400
Received: by mail-pl1-x629.google.com with SMTP id iw1so990450plb.6
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 23:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=7wEWJMYiiXIAOdkUHS+v2xAhnjuGUxbYRFgwJzDm5lY=;
 b=Cl4WmIOUjiayT9lZWxUYDP4Hft9/942DvYIIBO1BtoLR1poirscpoJfA/nG14EXRmw
 A/NV2WRLvjgv6Yaif+vY1vTqNcLP48LdLUekxOuq63DGSudcJFe6zN0tdhzjHYZeNyWm
 K/uI7FKVcqkazCny8LbGDimJ76IRbXGsTY2niPODQ4cR6T0SFOXUwSfMnkN9/GU0jLNf
 JeNuEtTQDA/BSGc2ckhG4hKvJJtdy8NezNCsnjlbGxjuZFa8bV5UhlfIuo3ZV3rNUY+I
 am9JOlDh7Q+ohtQg+CUpwUhKUq0qhUgQsFUZgbX3xBJhhJ+epduOtvC5l0LvvkaFRPw0
 1fJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=7wEWJMYiiXIAOdkUHS+v2xAhnjuGUxbYRFgwJzDm5lY=;
 b=pwQtTC+za9OrSzMXhYR5vh7UqxNplFpUWntcHhHcDReFe3/o/ademXzrp5EzG5QM7+
 DBCbPpDIqKCNiV20cripAO7UKHo5cF4doVeU6XPPICzLEgniLfTI+H9ArWIyp2tL9vHP
 Q3cqrP5SMhanEyHycWwnjrW4my4NvzCraxn4XpZmaub4ot+38uWOGeEnB0w16riQDBh+
 drgnKRXuNv4CrJQeaYGhtut97P8KOVnVnRjuo95aP02FbVkmB/96URBJq126v/2fMo9Y
 cWdFOjMLqJBsxhFY8A6MjJwiKvuZZ57tyVZaUaPVw3s/8d51lgPinzZ/p6xAL7IyV5Lc
 7E7Q==
X-Gm-Message-State: AJIora+Zk/ZrTfZB77M6x7gjyAiCqDCks2W9ADra40+FCzOgEq7/HIGN
 l52YVTK8au/GV4VWvnwWUc2LYg==
X-Google-Smtp-Source: AGRyM1ucut37WJ6l0oDtcdPJupi6bY5oMTCGiZ12wsYe0/C+6IMDaQVBJbwVh0iH9c9QNdUNbSwgrg==
X-Received: by 2002:a17:902:6b07:b0:16b:f220:92fb with SMTP id
 o7-20020a1709026b0700b0016bf22092fbmr26065913plk.96.1658990511775; 
 Wed, 27 Jul 2022 23:41:51 -0700 (PDT)
Received: from [192.168.1.18] ([171.50.205.214])
 by smtp.gmail.com with ESMTPSA id
 w126-20020a623084000000b0050dc76281e0sm11213589pfw.186.2022.07.27.23.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 23:41:51 -0700 (PDT)
Message-ID: <81f0e2ed116a7c39eb0981ed165b00feb815817f.camel@ventanamicro.com>
Subject: Re: [PATCH v6 2/5] target/riscv: smstateen check for h/senvcfg
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: alistair.francis@wdc.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Date: Thu, 28 Jul 2022 12:11:44 +0530
In-Reply-To: <150ceeab-85b7-5bd6-1024-328881a22d74@iscas.ac.cn>
References: <20220721153136.377578-1-mchitale@ventanamicro.com>
 <20220721153136.377578-3-mchitale@ventanamicro.com>
 <150ceeab-85b7-5bd6-1024-328881a22d74@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pl1-x629.google.com
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

On Fri, 2022-07-22 at 08:45 +0800, Weiwei Li wrote:
> 在 2022/7/21 下午11:31, Mayuresh Chitale 写道:
> > Accesses to henvcfg, henvcfgh and senvcfg are allowed only if
> > corresponding bit in mstateen0/hstateen0 is enabled. Otherwise an
> > illegal instruction trap is generated.
> > 
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >   target/riscv/csr.c | 100
> > +++++++++++++++++++++++++++++++++++++++++----
> >   1 file changed, 93 insertions(+), 7 deletions(-)
> > 
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 27032a416c..ab06b117f9 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -40,6 +40,55 @@ void riscv_set_csr_ops(int csrno,
> > riscv_csr_operations *ops)
> >   }
> >   
> >   /* Predicates */
> > +#if !defined(CONFIG_USER_ONLY)
> > +static RISCVException smstateen_acc_ok(CPURISCVState *env, int
> > index,
> > +                                       uint64_t bit)
> > +{
> > +    bool virt = riscv_cpu_virt_enabled(env);
> > +    CPUState *cs = env_cpu(env);
> > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > +    uint64_t hstateen = env->hstateen[index];
> > +    uint64_t sstateen = env->sstateen[index];
> > +
> > +    if (env->priv == PRV_M || !cpu->cfg.ext_smstateen) {
> > +        return RISCV_EXCP_NONE;
> > +    }
> > +
> > +    if (!(env->mstateen[index] & bit)) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    /*
> > +     * Treat hstateen and sstateen as read-only zero if
> > mstateen0.staten
> > +     * is clear.
> > +     */
> > +    if (!(env->mstateen[index] & SMSTATEEN_STATEN)) {
> > +        hstateen = 0;
> > +        sstateen = 0;
> > +    }
> > +
> > +    if (virt) {
> > +        if (!(hstateen & bit)) {
> > +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > +        }
> > +        /*
> > +         * Treat sstateen as read-only zero if hstateen0.staten is
> > clear.
> > +         */
> > +        if (!(hstateen & SMSTATEEN_STATEN)) {
> > +            sstateen = 0;
> > +        }
> > +    }
> > +
> > +    if (env->priv == PRV_U && riscv_has_ext(env, RVS)) {
> > +        if (!(sstateen & bit)) {
> > +            return RISCV_EXCP_ILLEGAL_INST;
> > +        }
> > +    }
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +#endif
> > +
> >   static RISCVException fs(CPURISCVState *env, int csrno)
> >   {
> >   #if !defined(CONFIG_USER_ONLY)
> > @@ -1708,6 +1757,13 @@ static RISCVException
> > write_menvcfgh(CPURISCVState *env, int csrno,
> >   static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
> >                                    target_ulong *val)
> >   {
> > +    RISCVException ret;
> > +
> > +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> 
> I think it's better to add this check into the predicate.
> 
> By the way, sharing the same function for all related csrs  is
> easily 
> misunderstood. However, It seems correct.

We use the default global predicates ie hmode/smode etc for the envcfg
registers and the global predicates cant be modified to include
additional checks for envcfg registers. We could implement new
predicates for envcfg but I think the current approach is simpler.
> 
> Regards,
> 
> Weiwei Li
> 
> > +    if (ret != RISCV_EXCP_NONE) {
> > +        return ret;
> > +    }
> > +
> >       *val = env->senvcfg;
> >       return RISCV_EXCP_NONE;
> >   }
> > @@ -1716,15 +1772,27 @@ static RISCVException
> > write_senvcfg(CPURISCVState *env, int csrno,
> >                                     target_ulong val)
> >   {
> >       uint64_t mask = SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE |
> > SENVCFG_CBZE;
> > +    RISCVException ret;
> >   
> > -    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
> > +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> > +    if (ret != RISCV_EXCP_NONE) {
> > +        return ret;
> > +    }
> >   
> > +    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
> >       return RISCV_EXCP_NONE;
> >   }
> >   
> >   static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
> >                                    target_ulong *val)
> >   {
> > +    RISCVException ret;
> > +
> > +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> > +    if (ret != RISCV_EXCP_NONE) {
> > +        return ret;
> > +    }
> > +
> >       *val = env->henvcfg;
> >       return RISCV_EXCP_NONE;
> >   }
> > @@ -1733,6 +1801,12 @@ static RISCVException
> > write_henvcfg(CPURISCVState *env, int csrno,
> >                                     target_ulong val)
> >   {
> >       uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE |
> > HENVCFG_CBZE;
> > +    RISCVException ret;
> > +
> > +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> > +    if (ret != RISCV_EXCP_NONE) {
> > +        return ret;
> > +    }
> >   
> >       if (riscv_cpu_mxl(env) == MXL_RV64) {
> >           mask |= HENVCFG_PBMTE | HENVCFG_STCE;
> > @@ -1746,6 +1820,13 @@ static RISCVException
> > write_henvcfg(CPURISCVState *env, int csrno,
> >   static RISCVException read_henvcfgh(CPURISCVState *env, int
> > csrno,
> >                                    target_ulong *val)
> >   {
> > +    RISCVException ret;
> > +
> > +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> > +    if (ret != RISCV_EXCP_NONE) {
> > +        return ret;
> > +    }
> > +
> >       *val = env->henvcfg >> 32;
> >       return RISCV_EXCP_NONE;
> >   }
> > @@ -1755,9 +1836,14 @@ static RISCVException
> > write_henvcfgh(CPURISCVState *env, int csrno,
> >   {
> >       uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
> >       uint64_t valh = (uint64_t)val << 32;
> > +    RISCVException ret;
> >   
> > -    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
> > +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> > +    if (ret != RISCV_EXCP_NONE) {
> > +        return ret;
> > +    }
> >   
> > +    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
> >       return RISCV_EXCP_NONE;
> >   }
> >   
> > @@ -1789,7 +1875,7 @@ static RISCVException
> > write_mstateen(CPURISCVState *env, int csrno,
> >   static RISCVException write_mstateen0(CPURISCVState *env, int
> > csrno,
> >                                         target_ulong new_val)
> >   {
> > -    uint64_t wr_mask = SMSTATEEN_STATEN;
> > +    uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
> >   
> >       return write_mstateen(env, csrno, wr_mask, new_val);
> >   }
> > @@ -1836,7 +1922,7 @@ static RISCVException
> > write_mstateenh(CPURISCVState *env, int csrno,
> >   static RISCVException write_mstateen0h(CPURISCVState *env, int
> > csrno,
> >                                         target_ulong new_val)
> >   {
> > -    uint64_t wr_mask = SMSTATEEN_STATEN;
> > +    uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
> >   
> >       return write_mstateenh(env, csrno, wr_mask, new_val);
> >   }
> > @@ -1885,7 +1971,7 @@ static RISCVException
> > write_hstateen(CPURISCVState *env, int csrno,
> >   static RISCVException write_hstateen0(CPURISCVState *env, int
> > csrno,
> >                                         target_ulong new_val)
> >   {
> > -    uint64_t wr_mask = SMSTATEEN_STATEN;
> > +    uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
> >   
> >       return write_hstateen(env, csrno, wr_mask, new_val);
> >   }
> > @@ -1936,7 +2022,7 @@ static RISCVException
> > write_hstateenh(CPURISCVState *env, int csrno,
> >   static RISCVException write_hstateen0h(CPURISCVState *env, int
> > csrno,
> >                                          target_ulong new_val)
> >   {
> > -    uint64_t wr_mask = SMSTATEEN_STATEN;
> > +    uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
> >   
> >       return write_hstateenh(env, csrno, wr_mask, new_val);
> >   }
> > @@ -1995,7 +2081,7 @@ static RISCVException
> > write_sstateen(CPURISCVState *env, int csrno,
> >   static RISCVException write_sstateen0(CPURISCVState *env, int
> > csrno,
> >                                         target_ulong new_val)
> >   {
> > -    uint64_t wr_mask = SMSTATEEN_STATEN;
> > +    uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
> >   
> >       return write_sstateen(env, csrno, wr_mask, new_val);
> >   }


