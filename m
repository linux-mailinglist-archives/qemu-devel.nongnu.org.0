Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 473C93437D2
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 05:17:12 +0100 (CET)
Received: from localhost ([::1]:49768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOC07-0002LR-A3
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 00:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBv0-0006Md-1Q; Mon, 22 Mar 2021 00:11:54 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:46967 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBuv-0004ga-O1; Mon, 22 Mar 2021 00:11:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3gzz0FJnz9sWf; Mon, 22 Mar 2021 15:11:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616386303;
 bh=nGJFrMgRIWVeHL1gFxdVYEZQO8H6uiCvfGzS6gOamYo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JpAfnzuLH2s74qVNzLZOP4tIsCBGSzOHY8v6oyWgnK/giqSSIzfLl3qh8d2gWGc59
 dTIpeIHryZbLpkgU1v8vf+sFCuexLfe0PBQbeuWNxh/DoAmrBEKmukrtVwf3utpZxr
 MlQFEXwLXIX7fb2cZ+jxMShFeMObCnav1Fdo62Zg=
Date: Mon, 22 Mar 2021 14:25:02 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 01/17] target/ppc: Move helper_regs.h functions
 out-of-line
Message-ID: <YFgODk7I309tidak@yekko.fritz.box>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-2-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LSRBAYFRWkic15T3"
Content-Disposition: inline
In-Reply-To: <20210315184615.1985590-2-richard.henderson@linaro.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--LSRBAYFRWkic15T3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2021 at 12:45:59PM -0600, Richard Henderson wrote:
> Move the functions to a new file, helper_regs.c.
>=20
> Note int_helper.c was relying on helper_regs.h to
> indirectly include qemu/log.h.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.0, thanks.

> ---
>  target/ppc/helper_regs.h | 184 ++----------------------------------
>  target/ppc/helper_regs.c | 197 +++++++++++++++++++++++++++++++++++++++
>  target/ppc/int_helper.c  |   1 +
>  target/ppc/meson.build   |   1 +
>  4 files changed, 207 insertions(+), 176 deletions(-)
>  create mode 100644 target/ppc/helper_regs.c
>=20
> diff --git a/target/ppc/helper_regs.h b/target/ppc/helper_regs.h
> index efcc903427..4148a442b3 100644
> --- a/target/ppc/helper_regs.h
> +++ b/target/ppc/helper_regs.h
> @@ -20,184 +20,16 @@
>  #ifndef HELPER_REGS_H
>  #define HELPER_REGS_H
> =20
> -#include "qemu/main-loop.h"
> -#include "exec/exec-all.h"
> -#include "sysemu/kvm.h"
> +void hreg_swap_gpr_tgpr(CPUPPCState *env);
> +void hreg_compute_mem_idx(CPUPPCState *env);
> +void hreg_compute_hflags(CPUPPCState *env);
> +void cpu_interrupt_exittb(CPUState *cs);
> +int hreg_store_msr(CPUPPCState *env, target_ulong value, int alter_hv);
> =20
> -/* Swap temporary saved registers with GPRs */
> -static inline void hreg_swap_gpr_tgpr(CPUPPCState *env)
> -{
> -    target_ulong tmp;
> -
> -    tmp =3D env->gpr[0];
> -    env->gpr[0] =3D env->tgpr[0];
> -    env->tgpr[0] =3D tmp;
> -    tmp =3D env->gpr[1];
> -    env->gpr[1] =3D env->tgpr[1];
> -    env->tgpr[1] =3D tmp;
> -    tmp =3D env->gpr[2];
> -    env->gpr[2] =3D env->tgpr[2];
> -    env->tgpr[2] =3D tmp;
> -    tmp =3D env->gpr[3];
> -    env->gpr[3] =3D env->tgpr[3];
> -    env->tgpr[3] =3D tmp;
> -}
> -
> -static inline void hreg_compute_mem_idx(CPUPPCState *env)
> -{
> -    /*
> -     * This is our encoding for server processors. The architecture
> -     * specifies that there is no such thing as userspace with
> -     * translation off, however it appears that MacOS does it and some
> -     * 32-bit CPUs support it. Weird...
> -     *
> -     *   0 =3D Guest User space virtual mode
> -     *   1 =3D Guest Kernel space virtual mode
> -     *   2 =3D Guest User space real mode
> -     *   3 =3D Guest Kernel space real mode
> -     *   4 =3D HV User space virtual mode
> -     *   5 =3D HV Kernel space virtual mode
> -     *   6 =3D HV User space real mode
> -     *   7 =3D HV Kernel space real mode
> -     *
> -     * For BookE, we need 8 MMU modes as follow:
> -     *
> -     *  0 =3D AS 0 HV User space
> -     *  1 =3D AS 0 HV Kernel space
> -     *  2 =3D AS 1 HV User space
> -     *  3 =3D AS 1 HV Kernel space
> -     *  4 =3D AS 0 Guest User space
> -     *  5 =3D AS 0 Guest Kernel space
> -     *  6 =3D AS 1 Guest User space
> -     *  7 =3D AS 1 Guest Kernel space
> -     */
> -    if (env->mmu_model & POWERPC_MMU_BOOKE) {
> -        env->immu_idx =3D env->dmmu_idx =3D msr_pr ? 0 : 1;
> -        env->immu_idx +=3D msr_is ? 2 : 0;
> -        env->dmmu_idx +=3D msr_ds ? 2 : 0;
> -        env->immu_idx +=3D msr_gs ? 4 : 0;
> -        env->dmmu_idx +=3D msr_gs ? 4 : 0;
> -    } else {
> -        env->immu_idx =3D env->dmmu_idx =3D msr_pr ? 0 : 1;
> -        env->immu_idx +=3D msr_ir ? 0 : 2;
> -        env->dmmu_idx +=3D msr_dr ? 0 : 2;
> -        env->immu_idx +=3D msr_hv ? 4 : 0;
> -        env->dmmu_idx +=3D msr_hv ? 4 : 0;
> -    }
> -}
> -
> -static inline void hreg_compute_hflags(CPUPPCState *env)
> -{
> -    target_ulong hflags_mask;
> -
> -    /* We 'forget' FE0 & FE1: we'll never generate imprecise exceptions =
*/
> -    hflags_mask =3D (1 << MSR_VR) | (1 << MSR_AP) | (1 << MSR_SA) |
> -        (1 << MSR_PR) | (1 << MSR_FP) | (1 << MSR_SE) | (1 << MSR_BE) |
> -        (1 << MSR_LE) | (1 << MSR_VSX) | (1 << MSR_IR) | (1 << MSR_DR);
> -    hflags_mask |=3D (1ULL << MSR_CM) | (1ULL << MSR_SF) | MSR_HVB;
> -    hreg_compute_mem_idx(env);
> -    env->hflags =3D env->msr & hflags_mask;
> -    /* Merge with hflags coming from other registers */
> -    env->hflags |=3D env->hflags_nmsr;
> -}
> -
> -static inline void cpu_interrupt_exittb(CPUState *cs)
> -{
> -    if (!kvm_enabled()) {
> -        return;
> -    }
> -
> -    if (!qemu_mutex_iothread_locked()) {
> -        qemu_mutex_lock_iothread();
> -        cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
> -        qemu_mutex_unlock_iothread();
> -    } else {
> -        cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
> -    }
> -}
> -
> -static inline int hreg_store_msr(CPUPPCState *env, target_ulong value,
> -                                 int alter_hv)
> -{
> -    int excp;
> -#if !defined(CONFIG_USER_ONLY)
> -    CPUState *cs =3D env_cpu(env);
> -#endif
> -
> -    excp =3D 0;
> -    value &=3D env->msr_mask;
> -#if !defined(CONFIG_USER_ONLY)
> -    /* Neither mtmsr nor guest state can alter HV */
> -    if (!alter_hv || !(env->msr & MSR_HVB)) {
> -        value &=3D ~MSR_HVB;
> -        value |=3D env->msr & MSR_HVB;
> -    }
> -    if (((value >> MSR_IR) & 1) !=3D msr_ir ||
> -        ((value >> MSR_DR) & 1) !=3D msr_dr) {
> -        cpu_interrupt_exittb(cs);
> -    }
> -    if ((env->mmu_model & POWERPC_MMU_BOOKE) &&
> -        ((value >> MSR_GS) & 1) !=3D msr_gs) {
> -        cpu_interrupt_exittb(cs);
> -    }
> -    if (unlikely((env->flags & POWERPC_FLAG_TGPR) &&
> -                 ((value ^ env->msr) & (1 << MSR_TGPR)))) {
> -        /* Swap temporary saved registers with GPRs */
> -        hreg_swap_gpr_tgpr(env);
> -    }
> -    if (unlikely((value >> MSR_EP) & 1) !=3D msr_ep) {
> -        /* Change the exception prefix on PowerPC 601 */
> -        env->excp_prefix =3D ((value >> MSR_EP) & 1) * 0xFFF00000;
> -    }
> -    /*
> -     * If PR=3D1 then EE, IR and DR must be 1
> -     *
> -     * Note: We only enforce this on 64-bit server processors.
> -     * It appears that:
> -     * - 32-bit implementations supports PR=3D1 and EE/DR/IR=3D0 and Mac=
OS
> -     *   exploits it.
> -     * - 64-bit embedded implementations do not need any operation to be
> -     *   performed when PR is set.
> -     */
> -    if (is_book3s_arch2x(env) && ((value >> MSR_PR) & 1)) {
> -        value |=3D (1 << MSR_EE) | (1 << MSR_DR) | (1 << MSR_IR);
> -    }
> -#endif
> -    env->msr =3D value;
> -    hreg_compute_hflags(env);
> -#if !defined(CONFIG_USER_ONLY)
> -    if (unlikely(msr_pow =3D=3D 1)) {
> -        if (!env->pending_interrupts && (*env->check_pow)(env)) {
> -            cs->halted =3D 1;
> -            excp =3D EXCP_HALTED;
> -        }
> -    }
> -#endif
> -
> -    return excp;
> -}
> -
> -#if !defined(CONFIG_USER_ONLY)
> -static inline void check_tlb_flush(CPUPPCState *env, bool global)
> -{
> -    CPUState *cs =3D env_cpu(env);
> -
> -    /* Handle global flushes first */
> -    if (global && (env->tlb_need_flush & TLB_NEED_GLOBAL_FLUSH)) {
> -        env->tlb_need_flush &=3D ~TLB_NEED_GLOBAL_FLUSH;
> -        env->tlb_need_flush &=3D ~TLB_NEED_LOCAL_FLUSH;
> -        tlb_flush_all_cpus_synced(cs);
> -        return;
> -    }
> -
> -    /* Then handle local ones */
> -    if (env->tlb_need_flush & TLB_NEED_LOCAL_FLUSH) {
> -        env->tlb_need_flush &=3D ~TLB_NEED_LOCAL_FLUSH;
> -        tlb_flush(cs);
> -    }
> -}
> -#else
> +#ifdef CONFIG_USER_ONLY
>  static inline void check_tlb_flush(CPUPPCState *env, bool global) { }
> +#else
> +void check_tlb_flush(CPUPPCState *env, bool global);
>  #endif
> =20
>  #endif /* HELPER_REGS_H */
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> new file mode 100644
> index 0000000000..5e18232b84
> --- /dev/null
> +++ b/target/ppc/helper_regs.c
> @@ -0,0 +1,197 @@
> +/*
> + *  PowerPC emulation special registers manipulation helpers for qemu.
> + *
> + *  Copyright (c) 2003-2007 Jocelyn Mayer
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/main-loop.h"
> +#include "exec/exec-all.h"
> +#include "sysemu/kvm.h"
> +#include "helper_regs.h"
> +
> +/* Swap temporary saved registers with GPRs */
> +void hreg_swap_gpr_tgpr(CPUPPCState *env)
> +{
> +    target_ulong tmp;
> +
> +    tmp =3D env->gpr[0];
> +    env->gpr[0] =3D env->tgpr[0];
> +    env->tgpr[0] =3D tmp;
> +    tmp =3D env->gpr[1];
> +    env->gpr[1] =3D env->tgpr[1];
> +    env->tgpr[1] =3D tmp;
> +    tmp =3D env->gpr[2];
> +    env->gpr[2] =3D env->tgpr[2];
> +    env->tgpr[2] =3D tmp;
> +    tmp =3D env->gpr[3];
> +    env->gpr[3] =3D env->tgpr[3];
> +    env->tgpr[3] =3D tmp;
> +}
> +
> +void hreg_compute_mem_idx(CPUPPCState *env)
> +{
> +    /*
> +     * This is our encoding for server processors. The architecture
> +     * specifies that there is no such thing as userspace with
> +     * translation off, however it appears that MacOS does it and some
> +     * 32-bit CPUs support it. Weird...
> +     *
> +     *   0 =3D Guest User space virtual mode
> +     *   1 =3D Guest Kernel space virtual mode
> +     *   2 =3D Guest User space real mode
> +     *   3 =3D Guest Kernel space real mode
> +     *   4 =3D HV User space virtual mode
> +     *   5 =3D HV Kernel space virtual mode
> +     *   6 =3D HV User space real mode
> +     *   7 =3D HV Kernel space real mode
> +     *
> +     * For BookE, we need 8 MMU modes as follow:
> +     *
> +     *  0 =3D AS 0 HV User space
> +     *  1 =3D AS 0 HV Kernel space
> +     *  2 =3D AS 1 HV User space
> +     *  3 =3D AS 1 HV Kernel space
> +     *  4 =3D AS 0 Guest User space
> +     *  5 =3D AS 0 Guest Kernel space
> +     *  6 =3D AS 1 Guest User space
> +     *  7 =3D AS 1 Guest Kernel space
> +     */
> +    if (env->mmu_model & POWERPC_MMU_BOOKE) {
> +        env->immu_idx =3D env->dmmu_idx =3D msr_pr ? 0 : 1;
> +        env->immu_idx +=3D msr_is ? 2 : 0;
> +        env->dmmu_idx +=3D msr_ds ? 2 : 0;
> +        env->immu_idx +=3D msr_gs ? 4 : 0;
> +        env->dmmu_idx +=3D msr_gs ? 4 : 0;
> +    } else {
> +        env->immu_idx =3D env->dmmu_idx =3D msr_pr ? 0 : 1;
> +        env->immu_idx +=3D msr_ir ? 0 : 2;
> +        env->dmmu_idx +=3D msr_dr ? 0 : 2;
> +        env->immu_idx +=3D msr_hv ? 4 : 0;
> +        env->dmmu_idx +=3D msr_hv ? 4 : 0;
> +    }
> +}
> +
> +void hreg_compute_hflags(CPUPPCState *env)
> +{
> +    target_ulong hflags_mask;
> +
> +    /* We 'forget' FE0 & FE1: we'll never generate imprecise exceptions =
*/
> +    hflags_mask =3D (1 << MSR_VR) | (1 << MSR_AP) | (1 << MSR_SA) |
> +        (1 << MSR_PR) | (1 << MSR_FP) | (1 << MSR_SE) | (1 << MSR_BE) |
> +        (1 << MSR_LE) | (1 << MSR_VSX) | (1 << MSR_IR) | (1 << MSR_DR);
> +    hflags_mask |=3D (1ULL << MSR_CM) | (1ULL << MSR_SF) | MSR_HVB;
> +    hreg_compute_mem_idx(env);
> +    env->hflags =3D env->msr & hflags_mask;
> +    /* Merge with hflags coming from other registers */
> +    env->hflags |=3D env->hflags_nmsr;
> +}
> +
> +void cpu_interrupt_exittb(CPUState *cs)
> +{
> +    if (!kvm_enabled()) {
> +        return;
> +    }
> +
> +    if (!qemu_mutex_iothread_locked()) {
> +        qemu_mutex_lock_iothread();
> +        cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
> +        qemu_mutex_unlock_iothread();
> +    } else {
> +        cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
> +    }
> +}
> +
> +int hreg_store_msr(CPUPPCState *env, target_ulong value, int alter_hv)
> +{
> +    int excp;
> +#if !defined(CONFIG_USER_ONLY)
> +    CPUState *cs =3D env_cpu(env);
> +#endif
> +
> +    excp =3D 0;
> +    value &=3D env->msr_mask;
> +#if !defined(CONFIG_USER_ONLY)
> +    /* Neither mtmsr nor guest state can alter HV */
> +    if (!alter_hv || !(env->msr & MSR_HVB)) {
> +        value &=3D ~MSR_HVB;
> +        value |=3D env->msr & MSR_HVB;
> +    }
> +    if (((value >> MSR_IR) & 1) !=3D msr_ir ||
> +        ((value >> MSR_DR) & 1) !=3D msr_dr) {
> +        cpu_interrupt_exittb(cs);
> +    }
> +    if ((env->mmu_model & POWERPC_MMU_BOOKE) &&
> +        ((value >> MSR_GS) & 1) !=3D msr_gs) {
> +        cpu_interrupt_exittb(cs);
> +    }
> +    if (unlikely((env->flags & POWERPC_FLAG_TGPR) &&
> +                 ((value ^ env->msr) & (1 << MSR_TGPR)))) {
> +        /* Swap temporary saved registers with GPRs */
> +        hreg_swap_gpr_tgpr(env);
> +    }
> +    if (unlikely((value >> MSR_EP) & 1) !=3D msr_ep) {
> +        /* Change the exception prefix on PowerPC 601 */
> +        env->excp_prefix =3D ((value >> MSR_EP) & 1) * 0xFFF00000;
> +    }
> +    /*
> +     * If PR=3D1 then EE, IR and DR must be 1
> +     *
> +     * Note: We only enforce this on 64-bit server processors.
> +     * It appears that:
> +     * - 32-bit implementations supports PR=3D1 and EE/DR/IR=3D0 and Mac=
OS
> +     *   exploits it.
> +     * - 64-bit embedded implementations do not need any operation to be
> +     *   performed when PR is set.
> +     */
> +    if (is_book3s_arch2x(env) && ((value >> MSR_PR) & 1)) {
> +        value |=3D (1 << MSR_EE) | (1 << MSR_DR) | (1 << MSR_IR);
> +    }
> +#endif
> +    env->msr =3D value;
> +    hreg_compute_hflags(env);
> +#if !defined(CONFIG_USER_ONLY)
> +    if (unlikely(msr_pow =3D=3D 1)) {
> +        if (!env->pending_interrupts && (*env->check_pow)(env)) {
> +            cs->halted =3D 1;
> +            excp =3D EXCP_HALTED;
> +        }
> +    }
> +#endif
> +
> +    return excp;
> +}
> +
> +#ifndef CONFIG_USER_ONLY
> +void check_tlb_flush(CPUPPCState *env, bool global)
> +{
> +    CPUState *cs =3D env_cpu(env);
> +
> +    /* Handle global flushes first */
> +    if (global && (env->tlb_need_flush & TLB_NEED_GLOBAL_FLUSH)) {
> +        env->tlb_need_flush &=3D ~TLB_NEED_GLOBAL_FLUSH;
> +        env->tlb_need_flush &=3D ~TLB_NEED_LOCAL_FLUSH;
> +        tlb_flush_all_cpus_synced(cs);
> +        return;
> +    }
> +
> +    /* Then handle local ones */
> +    if (env->tlb_need_flush & TLB_NEED_LOCAL_FLUSH) {
> +        env->tlb_need_flush &=3D ~TLB_NEED_LOCAL_FLUSH;
> +        tlb_flush(cs);
> +    }
> +}
> +#endif
> diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
> index 429de28494..a44c2d90ea 100644
> --- a/target/ppc/int_helper.c
> +++ b/target/ppc/int_helper.c
> @@ -22,6 +22,7 @@
>  #include "internal.h"
>  #include "qemu/host-utils.h"
>  #include "qemu/main-loop.h"
> +#include "qemu/log.h"
>  #include "exec/helper-proto.h"
>  #include "crypto/aes.h"
>  #include "fpu/softfloat.h"
> diff --git a/target/ppc/meson.build b/target/ppc/meson.build
> index bbfef90e08..4079d01ee3 100644
> --- a/target/ppc/meson.build
> +++ b/target/ppc/meson.build
> @@ -6,6 +6,7 @@ ppc_ss.add(files(
>    'excp_helper.c',
>    'fpu_helper.c',
>    'gdbstub.c',
> +  'helper_regs.c',
>    'int_helper.c',
>    'mem_helper.c',
>    'misc_helper.c',

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--LSRBAYFRWkic15T3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBYDg4ACgkQbDjKyiDZ
s5IRNxAA3AZcJHbuYRM91OR/y8g7nOdEuVJQgQ1Nh3gA8xhz5/dSw+Ms+a0a3qjb
U6g8db6KOkqfcR9vVNBzmyWjN5vcbbs+9SCidPLrrYJwLRWb20efrKzrFaMFikyi
5n/eF1VWqAqb/VMLjAPXnWDczRdy1wxO2UZiaCgAUnpja8RLPSLueDCR2lD1npuu
V7QEdqapuRhFjBMjXZ9/9y2fXSpivPr1Bxs5ygDOz0gqwZtbMsejTCnKEoA6ejby
Ede6TFfhLXVAkk+SKxXQEKFEtdk/cT0vxREE5S+rTG0Du27jG9CW8CHXgC3fIvkQ
SdIcdUyRewuxmcWN6vK8UtgxDjymcMc4f0T5llAVZV6BZtYPSmEdqiyITOCVPFzk
UiEs0lXAN1aGbg61cudK7zv0IM1ibN0ZldcKl1dPEuEZvlAD7VrlujmotOCFX9Zx
WwB1W2ikhdjLwYpe6WX/mee/ZlfmIvmwai6k9UTwAHrH6+tLY/kL6LOU9mYjok34
ACShXIo06XBp/4vu3D/4DrjKIUAgxkSaf6hXJ2kTib+lNwOV4NDYDFH9KlzUUdC8
Bvz2jufskDe7F/URxAL0cykpLQlY33iLJe+w4SUnZhap+YqKz+Cmapy0GxBuNJzd
QMoel+Q0Z2rI300Ohmk1fxxvCEbcTmweO22kDeH0YgIXyGjtQwc=
=gjI/
-----END PGP SIGNATURE-----

--LSRBAYFRWkic15T3--

