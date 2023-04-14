Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFE86E1BD7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 07:43:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnCCd-00037O-NN; Fri, 14 Apr 2023 01:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pnCCY-00035I-BO
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 01:42:27 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pnCCM-0006Dw-Hs
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 01:42:26 -0400
Received: by mail-qk1-x731.google.com with SMTP id ay7so12602503qkb.6
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 22:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681450933; x=1684042933;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LDW7Di2LC8150lHsw/Gn+K954BmMUr3DlgUOPUM+ix0=;
 b=P1oniHLmCMDiFsjiN4TMKgvzwnX8dZFwTMj1GIO9eSNcszVoVKvbYXPyujr/P+rnC3
 4hLcRhOdzA4WUU1VkP/yKfhunmhwTKcx3csG2HT5l707vipzszUlZNcDTgN7vs5fh3RW
 ANBFH1Jbzfd7fegOrYQQTouIM0txzGyJpaSEm/muCF4MNRjn12oHIxoloQephd+kQrm/
 rdXmB5NCWTEnycpueOemvLjX+Aa5/XQV2yVuc256XyyfZRd6iFX/H6d/VSEHXMvkkKtZ
 htQgHO0Tol/WX5g3o165c+Nu6Z0bntTcuxxSQig5QHxBCr3f5r8tVtuM6+9168IsKFKA
 Amkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681450933; x=1684042933;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LDW7Di2LC8150lHsw/Gn+K954BmMUr3DlgUOPUM+ix0=;
 b=CT73re4SGaxrjSB4QqEISeWKtg0u3iqPpdjobxsLZU/A0JsU/P4qyvwKGXSkSc2bpi
 Z9NlCqR5lF5uGq25ZKo0ij+GJn3ZDlvEuz1AsfAgJ01o/lZXehV/SLg47oJ0VIoVlZ60
 V0XQlflNrj6taN/QoevrW1gMbqCfVLXygQMY4lGxDicP6mAmTR3FQpAiD/f9q1nwxkRU
 4gFZvZ10QA23qr9JXiD2kzbdxKXODMRQHE/BDsRBTtHqI4Snld41kS4vMbct/rcHSSZ1
 11hq7mNNZayE6j2Q9T4meuS5XOo7Tn0SRCzWFWbMex1n/zGDCHjSdypNrGGpohcxn+uE
 LLyw==
X-Gm-Message-State: AAQBX9c0hMgDAXFCJCBzx4HjZ8GnKXDO9Z1JlLIpcE1+BAhm4LjCN+AM
 ppNFjpA+7Po93NPIKtUINbvmnd7n91e5+bn13uyW3w==
X-Google-Smtp-Source: AKy350ZWZrnB56x0tCQC7NuByYCEDqaHpPrGkHYI6SXgDhIopwjD2H2S+Pffq1qL0KXnvSMfmV8kuvUJ3Psp/o4MIps=
X-Received: by 2002:a05:620a:13cd:b0:745:3e2c:3d5a with SMTP id
 g13-20020a05620a13cd00b007453e2c3d5amr875009qkl.12.1681450932685; Thu, 13 Apr
 2023 22:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230410141316.3317474-1-mchitale@ventanamicro.com>
 <20230410141316.3317474-2-mchitale@ventanamicro.com>
 <81f02e0c-0615-da98-5d4d-6f08b6131e45@iscas.ac.cn>
In-Reply-To: <81f02e0c-0615-da98-5d4d-6f08b6131e45@iscas.ac.cn>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Fri, 14 Apr 2023 11:11:36 +0530
Message-ID: <CAN37VV7QPR+i-_EUJCZd9Z-VSf80JwSeZds8r=d0aR_ewCffuw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] target/riscv: smstateen check for fcsr
To: liweiwei <liweiwei@iscas.ac.cn>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=mchitale@ventanamicro.com; helo=mail-qk1-x731.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Apr 10, 2023 at 8:14=E2=80=AFPM liweiwei <liweiwei@iscas.ac.cn> wro=
te:
>
>
> On 2023/4/10 22:13, Mayuresh Chitale wrote:
> > If smstateen is implemented and sstateen0.fcsr is clear then the
> > floating point operations must return illegal instruction exception
> > or virtual instruction trap, if relevant.
>
> typo. sstateen0 -> smstateen
Ok.
>
> And fcsr bit only work when F is not enabled.
Will fix it.
>
> >
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >   target/riscv/cpu.h |  3 +++
> >   target/riscv/csr.c | 25 ++++++++++++++++++++++++-
> >   2 files changed, 27 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 638e47c75a..132cf06ff2 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -613,6 +613,9 @@ void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *e=
nv, uint32_t priv,
> >                                                    target_ulong new_val=
,
> >                                                    target_ulong write_m=
ask),
> >                                      void *rmw_fn_arg);
> > +RISCVException smstateen_acc_ok(CPURISCVState *env, int index, uint64_=
t bit);
> This have been added in the latest riscv-to-apply.next.
> > +#else
> > +#define smstateen_acc_ok(env, index, bit) RISCV_EXCP_NONE
>
> This seems unnecessary.  smstateen_acc_ok in this patch works only in
> system mode.
Ok.
>
> Regards,
>
> Weiwei Li
>
> >   #endif
> >   void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
> >
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index d522efc0b6..4979058434 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -43,7 +43,7 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operation=
s *ops)
> >
> >   /* Predicates */
> >   #if !defined(CONFIG_USER_ONLY)
> > -static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
> > +RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
> >                                          uint64_t bit)
> >   {
> >       bool virt =3D riscv_cpu_virt_enabled(env);
> > @@ -83,6 +83,10 @@ static RISCVException fs(CPURISCVState *env, int csr=
no)
> >           !riscv_cpu_cfg(env)->ext_zfinx) {
> >           return RISCV_EXCP_ILLEGAL_INST;
> >       }
> > +
> > +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> > +        return smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR);
> > +    }
> >   #endif
> >       return RISCV_EXCP_NONE;
> >   }
> > @@ -2056,6 +2060,9 @@ static RISCVException write_mstateen0(CPURISCVSta=
te *env, int csrno,
> >                                         target_ulong new_val)
> >   {
> >       uint64_t wr_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> > +    if (!riscv_has_ext(env, RVF)) {
> > +        wr_mask |=3D SMSTATEEN0_FCSR;
> > +    }
> >
> >       return write_mstateen(env, csrno, wr_mask, new_val);
> >   }
> > @@ -2092,6 +2099,10 @@ static RISCVException write_mstateen0h(CPURISCVS=
tate *env, int csrno,
> >   {
> >       uint64_t wr_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> >
> > +    if (!riscv_has_ext(env, RVF)) {
> > +        wr_mask |=3D SMSTATEEN0_FCSR;
> > +    }
> > +
> >       return write_mstateenh(env, csrno, wr_mask, new_val);
> >   }
> >
> > @@ -2129,6 +2140,10 @@ static RISCVException write_hstateen0(CPURISCVSt=
ate *env, int csrno,
> >   {
> >       uint64_t wr_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> >
> > +    if (!riscv_has_ext(env, RVF)) {
> > +        wr_mask |=3D SMSTATEEN0_FCSR;
> > +    }
> > +
> >       return write_hstateen(env, csrno, wr_mask, new_val);
> >   }
> >
> > @@ -2168,6 +2183,10 @@ static RISCVException write_hstateen0h(CPURISCVS=
tate *env, int csrno,
> >   {
> >       uint64_t wr_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> >
> > +    if (!riscv_has_ext(env, RVF)) {
> > +        wr_mask |=3D SMSTATEEN0_FCSR;
> > +    }
> > +
> >       return write_hstateenh(env, csrno, wr_mask, new_val);
> >   }
> >
> > @@ -2215,6 +2234,10 @@ static RISCVException write_sstateen0(CPURISCVSt=
ate *env, int csrno,
> >   {
> >       uint64_t wr_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> >
> > +    if (!riscv_has_ext(env, RVF)) {
> > +        wr_mask |=3D SMSTATEEN0_FCSR;
> > +    }
> > +
> >       return write_sstateen(env, csrno, wr_mask, new_val);
> >   }
> >
>

