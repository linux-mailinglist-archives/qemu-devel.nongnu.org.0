Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D2455BDE6
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 05:46:03 +0200 (CEST)
Received: from localhost ([::1]:57342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o62Ar-0004N0-Im
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 23:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1o628n-0003YL-PF
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 23:43:54 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:42547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1o628l-0006r4-5S
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 23:43:53 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 bi22-20020a05600c3d9600b003a04de22ab6so1849211wmb.1
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 20:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NuzYGslFUEVW9RA5w4WuUGuBZql/zriA3y5QLn2MuyM=;
 b=l5ru5UySrtfRg/crJArqEI5qmTFdngpaiVnkRaKuXlJv8Dlu437Tbem5Uw/gyEl+xh
 Ffm210SER8J2VJjd5e4oAtMhgadYknX/sRkrzPM/sRfckHzPge0/ZEt0eb5sE0cxm5YK
 O7dx105tbZ++EqFm04QAI3TmkTW/S2A6PXif7WmZ02Gc75FaLh61BT33BQcs21Dlbkca
 oESjfs1IrAs52rsvuuXw23dRHsSE2anfhDiF5Bz0gEcxIBFT+fP59Ij6u79iFBP/xMgJ
 4Fj8Oabp0JB2Agz+XkFuMPsmfGudNuGCVERIGCyEQsidTZvcyGHmFAbutdr0PST8ufl8
 Tw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NuzYGslFUEVW9RA5w4WuUGuBZql/zriA3y5QLn2MuyM=;
 b=JdRU8hNvlgVQ8ulmx3n7WmFvNK4UOx6oz//z4zGH+zzFcpXvC/aVCMuDItGPPFomDe
 rrIYzhQFhg3JnoI3sk3i4sTcLp/55kxYqIwcfKVFjpwQT9AjirLOP+kvqAgajf1DEnix
 rvOkHQakgJDeBQk3RC9NymZxptra7c2kjv1l3T8NGeCRI7gZyy6NFdBF/20T5NxWNvDv
 sU9FnNSfOnxBbH2+mHkqhfPiuo5a83Ozz22I/Q3ZdoX5GXoDdU/v5SxB0Wt4zdChWft8
 5Ym0/llvct5yKNNyMD0TvtOQW+VCLCVqe9cijkdeKqecqruIHFimxaNWGpGknnly7m4O
 8Ttw==
X-Gm-Message-State: AJIora/LYV/ZpIadr3AZip5MrM7QadlLwUW0tSUsk8wS5NZY8fZom7vv
 E7o2vqyYKf9nYEVGcbftg+WVJ8tnnOb7MGZSv8rXHw==
X-Google-Smtp-Source: AGRyM1soU6q46Ky3t4yOE9Gtkg+wmttQIm2x8hFFse8IxV4a6UuzeTiuTnUmrX2VRNw3YSBnXZK/9eqxBLjfHFir5TE=
X-Received: by 2002:a05:600c:4fd4:b0:3a0:334e:241e with SMTP id
 o20-20020a05600c4fd400b003a0334e241emr24552874wmq.73.1656387828684; Mon, 27
 Jun 2022 20:43:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220609033011.752714-1-apatel@ventanamicro.com>
 <20220609033011.752714-4-apatel@ventanamicro.com>
 <CAKmqyKP3ttDdwbxzusDvok8S+63Z+_ji6y5MaaQr8PsN_nF5Ug@mail.gmail.com>
In-Reply-To: <CAKmqyKP3ttDdwbxzusDvok8S+63Z+_ji6y5MaaQr8PsN_nF5Ug@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 28 Jun 2022 09:13:38 +0530
Message-ID: <CAAhSdy2jpcf7tDiEqL=e66PMrH9aGfAyaO=z8=FMrccrso-dGA@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] target/riscv: Update [m|h]tinst CSR in
 riscv_cpu_do_interrupt()
To: Alistair Francis <alistair23@gmail.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::330;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Jun 28, 2022 at 4:48 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Thu, Jun 9, 2022 at 1:31 PM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > We should write transformed instruction encoding of the trapped
> > instruction in [m|h]tinst CSR at time of taking trap as defined
> > by the RISC-V privileged specification v1.12.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>
> This fails to pass checkpatch
>
> ERROR: suspect code indent for conditional statements (13, 17)
> #257: FILE: target/riscv/cpu_helper.c:1480:
> +             if (MASK_OP_SYSTEM(insn) == OPC_RISC_HLVHSV) {
> +                 xinsn = insn;
>
> total: 1 errors, 0 warnings, 389 lines checked

Okay, I will quickly send v7.

Regards,
Anup

>
> Alistair
>
> > ---
> >  target/riscv/cpu.h        |   3 +
> >  target/riscv/cpu_helper.c | 231 +++++++++++++++++++++++++++++++++++++-
> >  target/riscv/instmap.h    |  43 +++++++
> >  3 files changed, 271 insertions(+), 6 deletions(-)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 194a58d760..11726e9031 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -271,6 +271,9 @@ struct CPUArchState {
> >      /* Signals whether the current exception occurred with two-stage address
> >         translation active. */
> >      bool two_stage_lookup;
> > +    /* Signals whether the current exception occurred while doing two-stage
> > +       address translation for the VS-stage page table walk. */
> > +    bool two_stage_indirect_lookup;
> >
> >      target_ulong scounteren;
> >      target_ulong mcounteren;
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 16c6045459..62a6762617 100644
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
> > @@ -1055,7 +1056,8 @@ restart:
> >
> >  static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
> >                                  MMUAccessType access_type, bool pmp_violation,
> > -                                bool first_stage, bool two_stage)
> > +                                bool first_stage, bool two_stage,
> > +                                bool two_stage_indirect)
> >  {
> >      CPUState *cs = env_cpu(env);
> >      int page_fault_exceptions, vm;
> > @@ -1105,6 +1107,7 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
> >      }
> >      env->badaddr = address;
> >      env->two_stage_lookup = two_stage;
> > +    env->two_stage_indirect_lookup = two_stage_indirect;
> >  }
> >
> >  hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
> > @@ -1150,6 +1153,7 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
> >      env->badaddr = addr;
> >      env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
> >                              riscv_cpu_two_stage_lookup(mmu_idx);
> > +    env->two_stage_indirect_lookup = false;
> >      cpu_loop_exit_restore(cs, retaddr);
> >  }
> >
> > @@ -1175,6 +1179,7 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> >      env->badaddr = addr;
> >      env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
> >                              riscv_cpu_two_stage_lookup(mmu_idx);
> > +    env->two_stage_indirect_lookup = false;
> >      cpu_loop_exit_restore(cs, retaddr);
> >  }
> >
> > @@ -1190,6 +1195,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> >      bool pmp_violation = false;
> >      bool first_stage_error = true;
> >      bool two_stage_lookup = false;
> > +    bool two_stage_indirect_error = false;
> >      int ret = TRANSLATE_FAIL;
> >      int mode = mmu_idx;
> >      /* default TLB page size */
> > @@ -1227,6 +1233,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> >           */
> >          if (ret == TRANSLATE_G_STAGE_FAIL) {
> >              first_stage_error = false;
> > +            two_stage_indirect_error = true;
> >              access_type = MMU_DATA_LOAD;
> >          }
> >
> > @@ -1310,12 +1317,207 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> >          raise_mmu_exception(env, address, access_type, pmp_violation,
> >                              first_stage_error,
> >                              riscv_cpu_virt_enabled(env) ||
> > -                                riscv_cpu_two_stage_lookup(mmu_idx));
> > +                                riscv_cpu_two_stage_lookup(mmu_idx),
> > +                            two_stage_indirect_error);
> >          cpu_loop_exit_restore(cs, retaddr);
> >      }
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
> > @@ -1340,6 +1542,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >      target_ulong cause = cs->exception_index & RISCV_EXCP_INT_MASK;
> >      uint64_t deleg = async ? env->mideleg : env->medeleg;
> >      target_ulong tval = 0;
> > +    target_ulong tinst = 0;
> >      target_ulong htval = 0;
> >      target_ulong mtval2 = 0;
> >
> > @@ -1355,18 +1558,31 @@ void riscv_cpu_do_interrupt(CPUState *cs)
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
> > +            if (env->two_stage_indirect_lookup) {
> > +                /*
> > +                 * special pseudoinstruction for G-stage fault taken while
> > +                 * doing VS-stage page table walk.
> > +                 */
> > +                tinst = (riscv_cpu_xlen(env) == 32) ? 0x00002000 : 0x00003000;
> > +            } else {
> > +                /* transformed instruction for all other load/store faults */
> > +                tinst = riscv_transformed_insn(env, env->bins);
> > +            }
> > +            break;
> > +        case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
> > +        case RISCV_EXCP_INST_ADDR_MIS:
> > +        case RISCV_EXCP_INST_ACCESS_FAULT:
> > +        case RISCV_EXCP_INST_PAGE_FAULT:
> >              write_gva = env->two_stage_lookup;
> >              tval = env->badaddr;
> >              break;
> > @@ -1448,6 +1664,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >          env->sepc = env->pc;
> >          env->stval = tval;
> >          env->htval = htval;
> > +        env->htinst = tinst;
> >          env->pc = (env->stvec >> 2 << 2) +
> >              ((async && (env->stvec & 3) == 1) ? cause * 4 : 0);
> >          riscv_cpu_set_mode(env, PRV_S);
> > @@ -1478,6 +1695,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >          env->mepc = env->pc;
> >          env->mtval = tval;
> >          env->mtval2 = mtval2;
> > +        env->mtinst = tinst;
> >          env->pc = (env->mtvec >> 2 << 2) +
> >              ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
> >          riscv_cpu_set_mode(env, PRV_M);
> > @@ -1490,6 +1708,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >       */
> >
> >      env->two_stage_lookup = false;
> > +    env->two_stage_indirect_lookup = false;
> >  #endif
> >      cs->exception_index = RISCV_EXCP_NONE; /* mark handled to qemu */
> >  }
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

