Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0138F6EF916
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 19:14:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1priiQ-00065X-Kz; Wed, 26 Apr 2023 13:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1priiN-00064o-99
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 13:13:59 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1priiL-0006Wv-Pf
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 13:13:59 -0400
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-5ef6135d2a8so34298486d6.3
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 10:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682529235; x=1685121235;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mwg1X7miNdObgg0WMJUaSU7st35j6DWbfGZeKCpy0Lw=;
 b=Yto/uz+MiQKySkyu85lDkolNaRe4mb+RbOWZbqLp7yhF0/OcOpVEcKzjkUp4vHsDSR
 6B5z11caKpfSZlop1JgD7KoC76y8uk6hYKsTAtHz/WuHRekHV6w/iTfb1qXWXKXyb58w
 Dms6ZgekR32fXN2fiIc5lZSVlHevfe7MtHMklbhF+33aCkGHlzhxiM3wh7T6TsM4XUQR
 Ni8LB9N4Zf/BcRk3OsM+bI1CsygF7/Rsnxws33ejgtcJeMZMYu/P1Lcnv94w3LhHjYSp
 QwFQomMWdE4dfiw3FXXKLm2uDqILuTfOmw/T09m7itGXeT3eHvrvB+Qjdko/naLIJyDp
 S+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682529235; x=1685121235;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mwg1X7miNdObgg0WMJUaSU7st35j6DWbfGZeKCpy0Lw=;
 b=av4FMNWQJ8SvbL6+fF+cFiDWNUdLybtMJZBZ37D2VKRzt+h8s8Pyy+LVlPaumRVz16
 P6u5qotsw9AtYh1WyIpKfvQJ1bWrsHBAvyQnwuNcya/STasbtSFueF0SJQYVHsRGwxOW
 QBAr9ux8gtPk+nqZrPYR2Rlp7LyOCG/9NT73TNVuZJDdPtbpyc7hun80NJYNU0TVDJXi
 KJiafixLwmlC/lCpVCl7QXmr80PIUxUXXcbTReZQsUH2Y0DwLUhVSsbr5152gbH8Py80
 tVSgkWXxXRfQR4w4piTyJUHfe/fnz25EF1dP86Zt8FROCxQzkBvCJuKL2uvkPHHe8pfi
 QPEA==
X-Gm-Message-State: AAQBX9d2ShJ+c8YMDj+D9caxI1yIfeXhrwXzvxWUHbU3MxiKxXbn1Q3O
 wxKHrcH9Si2wj77YTqaIrW9z7ER0IC9a/NxIhtmIhg==
X-Google-Smtp-Source: AKy350ZCuVD+jNBcwO3/e8e945Qzl8gqZ4p5L2OmvW1l5f3qdzDeP+IFNWScmmcuCgK2SVJSxICGQRkRCw/aR27/ts8=
X-Received: by 2002:ad4:5948:0:b0:5e3:d150:3168 with SMTP id
 eo8-20020ad45948000000b005e3d1503168mr29705793qvb.18.1682529235656; Wed, 26
 Apr 2023 10:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230414160202.1298242-1-mchitale@ventanamicro.com>
 <20230414160202.1298242-3-mchitale@ventanamicro.com>
 <130dce28-e116-bfca-cd94-e63c48073818@iscas.ac.cn>
In-Reply-To: <130dce28-e116-bfca-cd94-e63c48073818@iscas.ac.cn>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Wed, 26 Apr 2023 22:43:19 +0530
Message-ID: <CAN37VV5awVLyAhf=2FexmkVMa4aOV8u=E7O4RkWvpKsYVcVT8g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/4] target/riscv: Reuse TB_FLAGS.MSTATUS_HFS_FS
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=mchitale@ventanamicro.com; helo=mail-qv1-xf31.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Apr 15, 2023 at 7:15=E2=80=AFAM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
>
> On 2023/4/15 00:02, Mayuresh Chitale wrote:
> > When misa.F is clear, TB_FLAGS.MSTATUS_HS_FS field is unused and can
> > be used to save the current state of smstateen0.FCSR check which is
> > needed by the floating point translation routines.
> >
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >   target/riscv/cpu_helper.c | 12 ++++++++++++
> >   target/riscv/translate.c  |  7 +++++++
> >   2 files changed, 19 insertions(+)
> >
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 433ea529b0..fd1731cc39 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -105,6 +105,18 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, targ=
et_ulong *pc,
> >           flags =3D FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_VS,
> >                              get_field(env->mstatus_hs, MSTATUS_VS));
> >       }
> > +    /*
> > +     * If misa.F is 0 then the MSTATUS_HS_FS field of the tb->flags
> > +     * can be used to pass the current state of the smstateen.FCSR bit
> > +     * which must be checked for in the floating point translation rou=
tines
> > +     */
> > +    if (!riscv_has_ext(env, RVF)) {
> > +        if (smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR) =3D=3D RISCV_EXC=
P_NONE) {
> > +            flags =3D FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS, 1);
> > +        } else {
> > +            flags =3D FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS, 0);
> > +        }
> > +    }
> >       if (cpu->cfg.debug && !icount_enabled()) {
> >           flags =3D FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger=
_enabled);
> >       }
> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> > index d0094922b6..e29bbb8b70 100644
> > --- a/target/riscv/translate.c
> > +++ b/target/riscv/translate.c
> > @@ -79,6 +79,7 @@ typedef struct DisasContext {
> >       int frm;
> >       RISCVMXL ol;
> >       bool virt_inst_excp;
> > +    bool smstateen_fcsr_ok;
> >       bool virt_enabled;
> >       const RISCVCPUConfig *cfg_ptr;
> >       bool hlsx;
> > @@ -1202,6 +1203,12 @@ static void riscv_tr_init_disas_context(DisasCon=
textBase *dcbase, CPUState *cs)
> >       ctx->itrigger =3D FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
> >       ctx->zero =3D tcg_constant_tl(0);
> >       ctx->virt_inst_excp =3D false;
> > +    if (has_ext(ctx, RVF)) {
> > +        ctx->smstateen_fcsr_ok =3D 1;
> > +    } else {
> > +        ctx->smstateen_fcsr_ok =3D FIELD_EX32(tb_flags, TB_FLAGS,
> > +                                             MSTATUS_HS_FS);
>
> By the way, it may introduce new question when MSTATUS_FS and
> MSTATUS_HS_FS is merged to save bits in tb_flag
>
> by Richerd's patchset: 20230412114333.118895-5-richard.henderson@linaro.o=
rg
>
> such as: the check "s->mstatus_fs =3D=3D 0" in require_rvf() will be fals=
e
> if smstateen_fcsr_ok is true.
>
> However, this should be true in this case to indicate F is diabled.
>
> So we may need to set ctx->mstatus_fs =3D 0 here once merged with
> Richerd's patchset.

Yes, that is correct.
>
> Regards,
>
> Weiwei Li
>
> > +    }
> >   }
> >
> >   static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
>

