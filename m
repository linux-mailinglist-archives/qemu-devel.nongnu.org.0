Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A74A53DF8E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 03:55:33 +0200 (CEST)
Received: from localhost ([::1]:52664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ny1xs-0007YL-OZ
	for lists+qemu-devel@lfdr.de; Sun, 05 Jun 2022 21:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ny1wO-0006jQ-10; Sun, 05 Jun 2022 21:54:00 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d]:33477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ny1wL-0002r4-I0; Sun, 05 Jun 2022 21:53:59 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-e656032735so17654125fac.0; 
 Sun, 05 Jun 2022 18:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x7PL+yZXI59b0beJGZhs8J0huVs49hq6Zfm+hUegC8g=;
 b=Xt2H2c64waLwdAnrBlrJ2NY8clBHp3XEKNkeOc7DQC8wkdw4vCf6KC8hPOqJRQ44nf
 lH63cJRjlvQF0aAyNFlTU3KLauVUsXZxi4Pw0mZMPs/wiAT+USiGVpuLYGimTzhjMA7g
 ynVxduejBC9TPA0wxOjZW1mhSeaLQTxsBDek5AjVX5+93wZTu8/EE6eeh20n/qDvD/yd
 QuXIaz9FX6ZubKwTC1KMuv4SU7n4Wrkmc81cNSbZMaWtzlNpykP6oAbl8iGmzxkcL59h
 ebeWEER9+No5oYmnZErM5dAYG/0uRHsigoiiIvXBMweNRyGnQxqDfu2iEl3OrsDoFNdR
 BFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x7PL+yZXI59b0beJGZhs8J0huVs49hq6Zfm+hUegC8g=;
 b=DwGb4/ncRi5oU1X9uShDou7OptXtzkzKFKhMruih5FV5U0l/hvI8yX910txjEEumH6
 Rljdzi+4acOzPGgwXtBOb8mHf81ZlwmtTHOaV4yBWoitkh5yQM25Y5oItGp8J5AvoAqq
 KnOyKaOSIzGqUE8HSL9gq1AGvui+O+Ck02d+ibXwJx/8cfhNgnBvSD9gHYBHSje2TaAb
 iUlvL3DhO47c6/yOyAs+GK4HYyKsLwc+vqd8lJKDjSFt38rvI58n2Ti6ThpCk5YFoJ8c
 QIbCqQB7uEuzeugq04bZqlQQmdNEeQD0Mugs27On4y04TYO+T3QfwGyoEq4ggTrGUptC
 Rskg==
X-Gm-Message-State: AOAM533WfYNppp6yuq94U/iWNrI+va84hpoS5o4uSYvtM9gJVQS/uQQd
 oHnXLUM28r8que8E6b69IcfICKF6J47Jtan1Y80=
X-Google-Smtp-Source: ABdhPJwYHe6mvlhsSA66PBlBqg0NADc6XMmeOQltsRi+ge5WifqfgTVh8WYCcOocVtrtVQ3QGZU7EUaPj6pr9dpXixg=
X-Received: by 2002:a05:6870:b00a:b0:f1:7f07:8c36 with SMTP id
 y10-20020a056870b00a00b000f17f078c36mr11795824oae.278.1654480435936; Sun, 05
 Jun 2022 18:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220526100536.49672-1-apatel@ventanamicro.com>
 <20220526100536.49672-4-apatel@ventanamicro.com>
 <CAKmqyKOegRg2suJ=pGe9DSNCurSQRGJhYckHzMjt9P_m9Fr0PA@mail.gmail.com>
In-Reply-To: <CAKmqyKOegRg2suJ=pGe9DSNCurSQRGJhYckHzMjt9P_m9Fr0PA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jun 2022 11:53:29 +1000
Message-ID: <CAKmqyKPrnd80=xk=scf+-Wags8hR6NGSu4P8kH_fUpcELUVkiQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] target/riscv: Update [m|h]tinst CSR in
 riscv_cpu_do_interrupt()
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=alistair23@gmail.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Mon, Jun 6, 2022 at 11:48 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Thu, May 26, 2022 at 8:12 PM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > We should write transformed instruction encoding of the trapped
> > instruction in [m|h]tinst CSR at time of taking trap as defined
> > by the RISC-V privileged specification v1.12.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Whoops, I thought there was another patch. This doesn't seem to
implemented the guest-page fault pseudoinstructions which can be
generated while doing VS-stage translation

Alistair

>
> Alistair
>
> > ---
> >  target/riscv/cpu_helper.c | 210 +++++++++++++++++++++++++++++++++++++-
> >  target/riscv/instmap.h    |  43 ++++++++
> >  2 files changed, 249 insertions(+), 4 deletions(-)
> >
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index d99fac9d2d..2a2b6776fb 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -22,6 +22,7 @@
> >  #include "qemu/main-loop.h"
> >  #include "cpu.h"
> >  #include "exec/exec-all.h"
> > +#include "instmap.h"
> >  #include "tcg/tcg-op.h"
> >  #include "trace.h"
> >  #include "semihosting/common-semi.h"
> > @@ -1316,6 +1317,200 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> >
> >      return true;
> >  }
> > +
> > +static target_ulong riscv_transformed_insn(CPURISCVState *env,
> > +                                           target_ulong insn)
> > +{
> > +    bool xinsn_has_addr_offset = false;
> > +    target_ulong xinsn = 0;
> > +
> > +    /*
> > +     * Only Quadrant 0 and Quadrant 2 of RVC instruction space need to
> > +     * be uncompressed. The Quadrant 1 of RVC instruction space need
> > +     * not be transformed because these instructions won't generate
> > +     * any load/store trap.
> > +     */
> > +
> > +    if ((insn & 0x3) != 0x3) {
> > +        /* Transform 16bit instruction into 32bit instruction */
> > +        switch (GET_C_OP(insn)) {
> > +        case OPC_RISC_C_OP_QUAD0: /* Quadrant 0 */
> > +            switch (GET_C_FUNC(insn)) {
> > +            case OPC_RISC_C_FUNC_FLD_LQ:
> > +                if (riscv_cpu_xlen(env) != 128) { /* C.FLD (RV32/64) */
> > +                    xinsn = OPC_RISC_FLD;
> > +                    xinsn = SET_RD(xinsn, GET_C_RS2S(insn));
> > +                    xinsn = SET_RS1(xinsn, GET_C_RS1S(insn));
> > +                    xinsn = SET_I_IMM(xinsn, GET_C_LD_IMM(insn));
> > +                    xinsn_has_addr_offset = true;
> > +                }
> > +                break;
> > +            case OPC_RISC_C_FUNC_LW: /* C.LW */
> > +                xinsn = OPC_RISC_LW;
> > +                xinsn = SET_RD(xinsn, GET_C_RS2S(insn));
> > +                xinsn = SET_RS1(xinsn, GET_C_RS1S(insn));
> > +                xinsn = SET_I_IMM(xinsn, GET_C_LW_IMM(insn));
> > +                xinsn_has_addr_offset = true;
> > +                break;
> > +            case OPC_RISC_C_FUNC_FLW_LD:
> > +                if (riscv_cpu_xlen(env) == 32) { /* C.FLW (RV32) */
> > +                    xinsn = OPC_RISC_FLW;
> > +                    xinsn = SET_RD(xinsn, GET_C_RS2S(insn));
> > +                    xinsn = SET_RS1(xinsn, GET_C_RS1S(insn));
> > +                    xinsn = SET_I_IMM(xinsn, GET_C_LW_IMM(insn));
> > +                    xinsn_has_addr_offset = true;
> > +                } else { /* C.LD (RV64/RV128) */
> > +                    xinsn = OPC_RISC_LD;
> > +                    xinsn = SET_RD(xinsn, GET_C_RS2S(insn));
> > +                    xinsn = SET_RS1(xinsn, GET_C_RS1S(insn));
> > +                    xinsn = SET_I_IMM(xinsn, GET_C_LD_IMM(insn));
> > +                    xinsn_has_addr_offset = true;
> > +                }
> > +                break;
> > +            case OPC_RISC_C_FUNC_FSD_SQ:
> > +                if (riscv_cpu_xlen(env) != 128) { /* C.FSD (RV32/64) */
> > +                    xinsn = OPC_RISC_FSD;
> > +                    xinsn = SET_RS2(xinsn, GET_C_RS2S(insn));
> > +                    xinsn = SET_RS1(xinsn, GET_C_RS1S(insn));
> > +                    xinsn = SET_S_IMM(xinsn, GET_C_SD_IMM(insn));
> > +                    xinsn_has_addr_offset = true;
> > +                }
> > +                break;
> > +            case OPC_RISC_C_FUNC_SW: /* C.SW */
> > +                xinsn = OPC_RISC_SW;
> > +                xinsn = SET_RS2(xinsn, GET_C_RS2S(insn));
> > +                xinsn = SET_RS1(xinsn, GET_C_RS1S(insn));
> > +                xinsn = SET_S_IMM(xinsn, GET_C_SW_IMM(insn));
> > +                xinsn_has_addr_offset = true;
> > +                break;
> > +            case OPC_RISC_C_FUNC_FSW_SD:
> > +                if (riscv_cpu_xlen(env) == 32) { /* C.FSW (RV32) */
> > +                    xinsn = OPC_RISC_FSW;
> > +                    xinsn = SET_RS2(xinsn, GET_C_RS2S(insn));
> > +                    xinsn = SET_RS1(xinsn, GET_C_RS1S(insn));
> > +                    xinsn = SET_S_IMM(xinsn, GET_C_SW_IMM(insn));
> > +                    xinsn_has_addr_offset = true;
> > +                } else { /* C.SD (RV64/RV128) */
> > +                    xinsn = OPC_RISC_SD;
> > +                    xinsn = SET_RS2(xinsn, GET_C_RS2S(insn));
> > +                    xinsn = SET_RS1(xinsn, GET_C_RS1S(insn));
> > +                    xinsn = SET_S_IMM(xinsn, GET_C_SD_IMM(insn));
> > +                    xinsn_has_addr_offset = true;
> > +                }
> > +                break;
> > +            default:
> > +                break;
> > +            }
> > +            break;
> > +        case OPC_RISC_C_OP_QUAD2: /* Quadrant 2 */
> > +            switch (GET_C_FUNC(insn)) {
> > +            case OPC_RISC_C_FUNC_FLDSP_LQSP:
> > +                if (riscv_cpu_xlen(env) != 128) { /* C.FLDSP (RV32/64) */
> > +                    xinsn = OPC_RISC_FLD;
> > +                    xinsn = SET_RD(xinsn, GET_C_RD(insn));
> > +                    xinsn = SET_RS1(xinsn, 2);
> > +                    xinsn = SET_I_IMM(xinsn, GET_C_LDSP_IMM(insn));
> > +                    xinsn_has_addr_offset = true;
> > +                }
> > +                break;
> > +            case OPC_RISC_C_FUNC_LWSP: /* C.LWSP */
> > +                xinsn = OPC_RISC_LW;
> > +                xinsn = SET_RD(xinsn, GET_C_RD(insn));
> > +                xinsn = SET_RS1(xinsn, 2);
> > +                xinsn = SET_I_IMM(xinsn, GET_C_LWSP_IMM(insn));
> > +                xinsn_has_addr_offset = true;
> > +                break;
> > +            case OPC_RISC_C_FUNC_FLWSP_LDSP:
> > +                if (riscv_cpu_xlen(env) == 32) { /* C.FLWSP (RV32) */
> > +                    xinsn = OPC_RISC_FLW;
> > +                    xinsn = SET_RD(xinsn, GET_C_RD(insn));
> > +                    xinsn = SET_RS1(xinsn, 2);
> > +                    xinsn = SET_I_IMM(xinsn, GET_C_LWSP_IMM(insn));
> > +                    xinsn_has_addr_offset = true;
> > +                } else { /* C.LDSP (RV64/RV128) */
> > +                    xinsn = OPC_RISC_LD;
> > +                    xinsn = SET_RD(xinsn, GET_C_RD(insn));
> > +                    xinsn = SET_RS1(xinsn, 2);
> > +                    xinsn = SET_I_IMM(xinsn, GET_C_LDSP_IMM(insn));
> > +                    xinsn_has_addr_offset = true;
> > +                }
> > +                break;
> > +            case OPC_RISC_C_FUNC_FSDSP_SQSP:
> > +                if (riscv_cpu_xlen(env) != 128) { /* C.FSDSP (RV32/64) */
> > +                    xinsn = OPC_RISC_FSD;
> > +                    xinsn = SET_RS2(xinsn, GET_C_RS2(insn));
> > +                    xinsn = SET_RS1(xinsn, 2);
> > +                    xinsn = SET_S_IMM(xinsn, GET_C_SDSP_IMM(insn));
> > +                    xinsn_has_addr_offset = true;
> > +                }
> > +                break;
> > +            case OPC_RISC_C_FUNC_SWSP: /* C.SWSP */
> > +                xinsn = OPC_RISC_SW;
> > +                xinsn = SET_RS2(xinsn, GET_C_RS2(insn));
> > +                xinsn = SET_RS1(xinsn, 2);
> > +                xinsn = SET_S_IMM(xinsn, GET_C_SWSP_IMM(insn));
> > +                xinsn_has_addr_offset = true;
> > +                break;
> > +            case 7:
> > +                if (riscv_cpu_xlen(env) == 32) { /* C.FSWSP (RV32) */
> > +                    xinsn = OPC_RISC_FSW;
> > +                    xinsn = SET_RS2(xinsn, GET_C_RS2(insn));
> > +                    xinsn = SET_RS1(xinsn, 2);
> > +                    xinsn = SET_S_IMM(xinsn, GET_C_SWSP_IMM(insn));
> > +                    xinsn_has_addr_offset = true;
> > +                } else { /* C.SDSP (RV64/RV128) */
> > +                    xinsn = OPC_RISC_SD;
> > +                    xinsn = SET_RS2(xinsn, GET_C_RS2(insn));
> > +                    xinsn = SET_RS1(xinsn, 2);
> > +                    xinsn = SET_S_IMM(xinsn, GET_C_SDSP_IMM(insn));
> > +                    xinsn_has_addr_offset = true;
> > +                }
> > +                break;
> > +            default:
> > +                break;
> > +            }
> > +            break;
> > +        default:
> > +            break;
> > +        }
> > +
> > +        /*
> > +         * Clear Bit1 of transformed instruction to indicate that
> > +         * original insruction was a 16bit instruction
> > +         */
> > +        xinsn &= ~((target_ulong)0x2);
> > +    } else {
> > +        /* No need to transform 32bit (or wider) instructions */
> > +        xinsn = insn;
> > +
> > +        /* Check for instructions which need address offset */
> > +        switch (MASK_OP_MAJOR(insn)) {
> > +        case OPC_RISC_LOAD:
> > +        case OPC_RISC_STORE:
> > +        case OPC_RISC_ATOMIC:
> > +        case OPC_RISC_FP_LOAD:
> > +        case OPC_RISC_FP_STORE:
> > +             xinsn_has_addr_offset = true;
> > +             break;
> > +        case OPC_RISC_SYSTEM:
> > +             if (MASK_OP_SYSTEM(insn) == OPC_RISC_HLVHSV) {
> > +                 xinsn_has_addr_offset = true;
> > +             }
> > +             break;
> > +        }
> > +    }
> > +
> > +    if (xinsn_has_addr_offset) {
> > +        /*
> > +         * The "Addr. Offset" field in transformed instruction is non-zero
> > +         * only for misaligned load/store traps which are very unlikely on
> > +         * QEMU so for now always set "Addr. Offset" to zero.
> > +         */
> > +        xinsn = SET_RS1(xinsn, 0);
> > +    }
> > +
> > +    return xinsn;
> > +}
> >  #endif /* !CONFIG_USER_ONLY */
> >
> >  /*
> > @@ -1340,6 +1535,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >      target_ulong cause = cs->exception_index & RISCV_EXCP_INT_MASK;
> >      uint64_t deleg = async ? env->mideleg : env->medeleg;
> >      target_ulong tval = 0;
> > +    target_ulong tinst = 0;
> >      target_ulong htval = 0;
> >      target_ulong mtval2 = 0;
> >
> > @@ -1355,18 +1551,22 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >      if (!async) {
> >          /* set tval to badaddr for traps with address information */
> >          switch (cause) {
> > -        case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
> >          case RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT:
> >          case RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT:
> > -        case RISCV_EXCP_INST_ADDR_MIS:
> > -        case RISCV_EXCP_INST_ACCESS_FAULT:
> >          case RISCV_EXCP_LOAD_ADDR_MIS:
> >          case RISCV_EXCP_STORE_AMO_ADDR_MIS:
> >          case RISCV_EXCP_LOAD_ACCESS_FAULT:
> >          case RISCV_EXCP_STORE_AMO_ACCESS_FAULT:
> > -        case RISCV_EXCP_INST_PAGE_FAULT:
> >          case RISCV_EXCP_LOAD_PAGE_FAULT:
> >          case RISCV_EXCP_STORE_PAGE_FAULT:
> > +            write_gva = env->two_stage_lookup;
> > +            tval = env->badaddr;
> > +            tinst = riscv_transformed_insn(env, env->bins);
> > +            break;
> > +        case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
> > +        case RISCV_EXCP_INST_ADDR_MIS:
> > +        case RISCV_EXCP_INST_ACCESS_FAULT:
> > +        case RISCV_EXCP_INST_PAGE_FAULT:
> >              write_gva = env->two_stage_lookup;
> >              tval = env->badaddr;
> >              break;
> > @@ -1448,6 +1648,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >          env->sepc = env->pc;
> >          env->stval = tval;
> >          env->htval = htval;
> > +        env->htinst = tinst;
> >          env->pc = (env->stvec >> 2 << 2) +
> >              ((async && (env->stvec & 3) == 1) ? cause * 4 : 0);
> >          riscv_cpu_set_mode(env, PRV_S);
> > @@ -1478,6 +1679,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >          env->mepc = env->pc;
> >          env->mtval = tval;
> >          env->mtval2 = mtval2;
> > +        env->mtinst = tinst;
> >          env->pc = (env->mtvec >> 2 << 2) +
> >              ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
> >          riscv_cpu_set_mode(env, PRV_M);
> > diff --git a/target/riscv/instmap.h b/target/riscv/instmap.h
> > index 40b6d2b64d..f564a69d90 100644
> > --- a/target/riscv/instmap.h
> > +++ b/target/riscv/instmap.h
> > @@ -184,6 +184,8 @@ enum {
> >      OPC_RISC_CSRRWI      = OPC_RISC_SYSTEM | (0x5 << 12),
> >      OPC_RISC_CSRRSI      = OPC_RISC_SYSTEM | (0x6 << 12),
> >      OPC_RISC_CSRRCI      = OPC_RISC_SYSTEM | (0x7 << 12),
> > +
> > +    OPC_RISC_HLVHSV      = OPC_RISC_SYSTEM | (0x4 << 12),
> >  };
> >
> >  #define MASK_OP_FP_LOAD(op)   (MASK_OP_MAJOR(op) | (op & (0x7 << 12)))
> > @@ -316,6 +318,12 @@ enum {
> >  #define GET_RS2(inst)  extract32(inst, 20, 5)
> >  #define GET_RD(inst)   extract32(inst, 7, 5)
> >  #define GET_IMM(inst)  sextract64(inst, 20, 12)
> > +#define SET_RS1(inst, val)  deposit32(inst, 15, 5, val)
> > +#define SET_RS2(inst, val)  deposit32(inst, 20, 5, val)
> > +#define SET_RD(inst, val)   deposit32(inst, 7, 5, val)
> > +#define SET_I_IMM(inst, val)  deposit32(inst, 20, 12, val)
> > +#define SET_S_IMM(inst, val)  \
> > +    deposit32(deposit32(inst, 7, 5, val), 25, 7, (val) >> 5)
> >
> >  /* RVC decoding macros */
> >  #define GET_C_IMM(inst)             (extract32(inst, 2, 5) \
> > @@ -346,6 +354,8 @@ enum {
> >                                      | (extract32(inst, 5, 1) << 6))
> >  #define GET_C_LD_IMM(inst)          ((extract16(inst, 10, 3) << 3) \
> >                                      | (extract16(inst, 5, 2) << 6))
> > +#define GET_C_SW_IMM(inst)          GET_C_LW_IMM(inst)
> > +#define GET_C_SD_IMM(inst)          GET_C_LD_IMM(inst)
> >  #define GET_C_J_IMM(inst)           ((extract32(inst, 3, 3) << 1) \
> >                                      | (extract32(inst, 11, 1) << 4) \
> >                                      | (extract32(inst, 2, 1) << 5) \
> > @@ -366,4 +376,37 @@ enum {
> >  #define GET_C_RS1S(inst)            (8 + extract16(inst, 7, 3))
> >  #define GET_C_RS2S(inst)            (8 + extract16(inst, 2, 3))
> >
> > +#define GET_C_FUNC(inst)           extract32(inst, 13, 3)
> > +#define GET_C_OP(inst)             extract32(inst, 0, 2)
> > +
> > +enum {
> > +    /* RVC Quadrants */
> > +    OPC_RISC_C_OP_QUAD0 = 0x0,
> > +    OPC_RISC_C_OP_QUAD1 = 0x1,
> > +    OPC_RISC_C_OP_QUAD2 = 0x2
> > +};
> > +
> > +enum {
> > +    /* RVC Quadrant 0 */
> > +    OPC_RISC_C_FUNC_ADDI4SPN = 0x0,
> > +    OPC_RISC_C_FUNC_FLD_LQ = 0x1,
> > +    OPC_RISC_C_FUNC_LW = 0x2,
> > +    OPC_RISC_C_FUNC_FLW_LD = 0x3,
> > +    OPC_RISC_C_FUNC_FSD_SQ = 0x5,
> > +    OPC_RISC_C_FUNC_SW = 0x6,
> > +    OPC_RISC_C_FUNC_FSW_SD = 0x7
> > +};
> > +
> > +enum {
> > +    /* RVC Quadrant 2 */
> > +    OPC_RISC_C_FUNC_SLLI_SLLI64 = 0x0,
> > +    OPC_RISC_C_FUNC_FLDSP_LQSP = 0x1,
> > +    OPC_RISC_C_FUNC_LWSP = 0x2,
> > +    OPC_RISC_C_FUNC_FLWSP_LDSP = 0x3,
> > +    OPC_RISC_C_FUNC_JR_MV_EBREAK_JALR_ADD = 0x4,
> > +    OPC_RISC_C_FUNC_FSDSP_SQSP = 0x5,
> > +    OPC_RISC_C_FUNC_SWSP = 0x6,
> > +    OPC_RISC_C_FUNC_FSWSP_SDSP = 0x7
> > +};
> > +
> >  #endif
> > --
> > 2.34.1
> >
> >

