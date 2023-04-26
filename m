Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 240536EF918
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 19:14:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prihp-0005pi-SG; Wed, 26 Apr 2023 13:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1prihm-0005p4-IH
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 13:13:22 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1prihk-0006Mr-V2
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 13:13:22 -0400
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-74e4f839ae4so217863085a.0
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 10:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682529199; x=1685121199;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kKWq+akiZ6qt4/X3uZ4ViZTyHY5TTxKUCFivCZPt8NM=;
 b=HP8KVBShM/giG+FmBCtUhnM2lFYlOnT8pD2WXPZCp7URxfun8c5Fkvr2JC134XJjNX
 5MT+XGAyubzxOqYb9xBK3qmUUfiApycZja31xBxKkeztfeBrAmJHbXpFS9sOwOAyLkgP
 xNdAj7Q68AZtI5gyfz5P8vy9wkFUJUFqh7C6yunCQZ8T8C37cVL+f7ndEixspuGIfEZE
 feiFBpM6fupsNuZsZ6Elt8ewbBfqjjx2xHlVZQNn0e5XN4BC+H8gjgf6eV1USrzNX34s
 inYfl3Ld4A9hZauHHFRqKkYAeDkvN6ZH1HmFiv+wWkKY/KNMgG5bCnTJSsuqXlqbGyAy
 wbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682529199; x=1685121199;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kKWq+akiZ6qt4/X3uZ4ViZTyHY5TTxKUCFivCZPt8NM=;
 b=fgDeoyfSMEF45Vddv04vhrL0brFbZLSIAl5cVGipQ/Mg10QBdH2nhliwpkDL88aWAx
 ckoppNm3hstmHqCVDQ3RQAnLZi9r6ZRujODFvmEtEpks9NzaAX2l/EqEEJI5ZO4aFsXe
 v5M4Gg3AhU76jkBaDuhHA2fBwCS8GKqI76/ukxMyTfAqLooASXiGjCYDKZnM60V8rZV8
 Q9hwq/s0tSs30778iVkW7FdIg5Or7g59OX3Rqbr3DZxnna8DRB+nKFtzq0RN0tvvtXp0
 duzk1uYeaVIGYNhy9a7qtAGdqLJCkEYWgB8/ieihr2BSjw8SikJT5tr2L+/ElikySHg4
 VPFg==
X-Gm-Message-State: AAQBX9dumnVyrP9CWConKJdrUtmd+1quhe/a23y5eWBXu5tkm+dNZAy1
 BN3zH1zps0Et7nH0gyEhiuCedZFsgfnhDkuHJ4cnqw==
X-Google-Smtp-Source: AKy350YVdDdBiy/QpEno5On4XkrNMzwTtDVxQFgiOolJoaDmg3eKyaRQl7O6E+btnsmviGxiQzZJ9LmOEMI6Zkh7RNc=
X-Received: by 2002:a05:6214:1cc8:b0:5ac:58cc:69d1 with SMTP id
 g8-20020a0562141cc800b005ac58cc69d1mr32422744qvd.31.1682529199362; Wed, 26
 Apr 2023 10:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230414160202.1298242-1-mchitale@ventanamicro.com>
 <20230414160202.1298242-2-mchitale@ventanamicro.com>
 <3ee55aaa-e8aa-e715-b8c2-2dff938b9553@iscas.ac.cn>
In-Reply-To: <3ee55aaa-e8aa-e715-b8c2-2dff938b9553@iscas.ac.cn>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Wed, 26 Apr 2023 22:42:43 +0530
Message-ID: <CAN37VV6o1w8MA_FoGzBcZAZoG4Lsjq74Vif3SQhzZQ7fvaKxew@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/4] target/riscv: smstateen check for fcsr
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=mchitale@ventanamicro.com; helo=mail-qk1-x72f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Apr 15, 2023 at 6:32=E2=80=AFAM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
>
> On 2023/4/15 00:01, Mayuresh Chitale wrote:
> > If smstateen is implemented and smtateen0.fcsr is clear and misa.F
> > is off then the floating point operations must return illegal
> > instruction exception or virtual instruction trap, if relevant.
> >
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >   target/riscv/csr.c | 23 +++++++++++++++++++++++
> >   1 file changed, 23 insertions(+)
> >
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index f4d2dcfdc8..8ae9e95f9f 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -82,6 +82,10 @@ static RISCVException fs(CPURISCVState *env, int csr=
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
> > @@ -2081,6 +2085,9 @@ static RISCVException write_mstateen0(CPURISCVSta=
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
> > @@ -2117,6 +2124,10 @@ static RISCVException write_mstateen0h(CPURISCVS=
tate *env, int csrno,
> >   {
> >       uint64_t wr_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> >
> > +    if (!riscv_has_ext(env, RVF)) {
> > +        wr_mask |=3D SMSTATEEN0_FCSR;
> > +    }
> > +
>
> FCSR is bit 1 of mstateen0.  So it seems unnecessary to be added to
> wr_mask for mstateen0h.
>
> Similar to hstateen0h.
>
> Otherwise,  Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
>
Thanks, I will make the change above in the next version.
> Weiwei Li
> >       return write_mstateenh(env, csrno, wr_mask, new_val);
> >   }
> >
> > @@ -2154,6 +2165,10 @@ static RISCVException write_hstateen0(CPURISCVSt=
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
> > @@ -2193,6 +2208,10 @@ static RISCVException write_hstateen0h(CPURISCVS=
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
> > @@ -2240,6 +2259,10 @@ static RISCVException write_sstateen0(CPURISCVSt=
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

