Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD82C6F3CE3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 07:08:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptiEI-0004vo-2v; Tue, 02 May 2023 01:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1ptiEB-0004uT-LW; Tue, 02 May 2023 01:07:05 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1ptiE5-0000RQ-U1; Tue, 02 May 2023 01:07:02 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-63b5c4c769aso3844451b3a.3; 
 Mon, 01 May 2023 22:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683004011; x=1685596011;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y2S97pE7Dy6kh3jQjn1/dHI3h9VS79GACzeaQogllW0=;
 b=RPkslV913sCpyH14sa7OdOku6qTVZVNbZBJ3JOXs607x9TUr3BJ/w9GmkhEn53QQml
 oYeXewszksOVaBw4s81oCPb3eJRt4DrJe66pPtzEx478O0sS2FPatvSEK70+Sy69aF1H
 iw1rq6u9ZgprB1wqaJlT1W9kxjD+Aj9Q2SRW9P1OmV3tDTz4ZeTBKgvWcLbQMczyUaxC
 yen6M6vQAkGOibdC4HKDQzHGKvRhv3Zfho4OUvEMkUmeJeTGqCoVHBgkK9b4Kij/K7SV
 pIh2BUwycePHhqBvR0u3qVqFXZqsllBdKDDhXk4TmJ+uaxRUmjRihVuCYqOoNIDmGa1V
 KL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683004011; x=1685596011;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=y2S97pE7Dy6kh3jQjn1/dHI3h9VS79GACzeaQogllW0=;
 b=IKT2MIfucXwyO90AjmTEAQgAX43g6RkgAgS8ZieTd5VMWFrVORrOfM1cCGSEF+Nck6
 BdD6Vq+4orusaqKk/wLXS3dKGkh72Irsul0OSeGxmN2icwzbMXoI9nusCelZncYICpsN
 kr2K6MIRUlp6iPhVVnC1JLOR/1KXXxu99fyypjA3HXMzvSFWkHydm7atRUDYxRjCX9v3
 MoCuviEJlHijaXwUOPci8yTiD25F6ouICKGnqTHAhzFDSSVKGrxuTD4O4j9SONeCJT2S
 bVJ33T787lAhPE2JpFSyNG0RDGdiYyu/RUmttJ7ogiovg9L/nH3ZnNIBLpMo/FM92yeS
 nhmg==
X-Gm-Message-State: AC+VfDygsIBh+RFvugTh/L08Nr3rJTyJnqUE+UhickZmYUMI5yY1wYhP
 x0R0QEuiBj0F8GvxNLWcOik=
X-Google-Smtp-Source: ACHHUZ4tLBIxFqBEOunzMhVWt1DJ5BHDFTQcnS3vjQqHPUmg+Nd9lCSDPsJVVap4HX8JL9UT51ttgw==
X-Received: by 2002:a05:6a00:1993:b0:623:8592:75c4 with SMTP id
 d19-20020a056a00199300b00623859275c4mr22177921pfl.29.1683004010667; 
 Mon, 01 May 2023 22:06:50 -0700 (PDT)
Received: from localhost (118-208-214-188.tpgi.com.au. [118.208.214.188])
 by smtp.gmail.com with ESMTPSA id
 o70-20020a62cd49000000b0062dcf5c01f9sm20779225pfg.36.2023.05.01.22.06.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 22:06:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 May 2023 15:06:45 +1000
Message-Id: <CSBJ4MJFZLA3.HEJL52LKZCF7@wheely>
Subject: Re: [PATCH v2 3/4] ppc: spapr: cleanup spapr_exit_nested() with
 helper routines.
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Harsh Prateek Bora" <harshpb@linux.ibm.com>, <qemu-ppc@nongnu.org>
Cc: <qemu-devel@nongnu.org>, <farosas@suse.de>, <danielhb413@gmail.com>
X-Mailer: aerc 0.14.0
References: <20230424144712.1985425-1-harshpb@linux.ibm.com>
 <20230424144712.1985425-4-harshpb@linux.ibm.com>
In-Reply-To: <20230424144712.1985425-4-harshpb@linux.ibm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Tue Apr 25, 2023 at 12:47 AM AEST, Harsh Prateek Bora wrote:
> Currently, in spapr_exit_nested(), it does a lot of register state
> restoring from ptregs/hvstate after mapping each of those before
> restoring the L1 host state. This patch breaks down those set of ops
> to respective helper routines for better code readability/maintenance.
>
> Signed-off-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
> ---
>  hw/ppc/spapr_hcall.c | 120 ++++++++++++++++++++++++++-----------------
>  1 file changed, 72 insertions(+), 48 deletions(-)
>
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index f24d4b368e..e69634bc22 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1719,45 +1719,14 @@ static target_ulong h_enter_nested(PowerPCCPU *cp=
u,
>      return env->gpr[3];
>  }
> =20
> -void spapr_exit_nested(PowerPCCPU *cpu, int excp)
> +static void restore_hvstate_from_env(struct kvmppc_hv_guest_state *hvsta=
te,
> +                                     CPUPPCState *env, int excp)
>  {
> -    CPUState *cs =3D CPU(cpu);
> -    CPUPPCState *env =3D &cpu->env;
> -    SpaprCpuState *spapr_cpu =3D spapr_cpu_state(cpu);
> -    target_ulong r3_return =3D env->excp_vectors[excp]; /* hcall return =
value */
> -    target_ulong hv_ptr =3D spapr_cpu->nested_host_state->gpr[4];
> -    target_ulong regs_ptr =3D spapr_cpu->nested_host_state->gpr[5];
> -    struct kvmppc_hv_guest_state *hvstate;
> -    struct kvmppc_pt_regs *regs;
> -    hwaddr len;
> -
> -    assert(spapr_cpu->in_nested);
> -
> -    cpu_ppc_hdecr_exit(env);
> -
> -    len =3D sizeof(*hvstate);
> -    hvstate =3D address_space_map(CPU(cpu)->as, hv_ptr, &len, true,
> -                                MEMTXATTRS_UNSPECIFIED);
> -    if (len !=3D sizeof(*hvstate)) {
> -        address_space_unmap(CPU(cpu)->as, hvstate, len, 0, true);
> -        r3_return =3D H_PARAMETER;
> -        goto out_restore_l1;
> -    }
> -
>      hvstate->cfar =3D env->cfar;
>      hvstate->lpcr =3D env->spr[SPR_LPCR];
>      hvstate->pcr =3D env->spr[SPR_PCR];
>      hvstate->dpdes =3D env->spr[SPR_DPDES];
>      hvstate->hfscr =3D env->spr[SPR_HFSCR];
> -
> -    if (excp =3D=3D POWERPC_EXCP_HDSI) {
> -        hvstate->hdar =3D env->spr[SPR_HDAR];
> -        hvstate->hdsisr =3D env->spr[SPR_HDSISR];
> -        hvstate->asdr =3D env->spr[SPR_ASDR];
> -    } else if (excp =3D=3D POWERPC_EXCP_HISI) {
> -        hvstate->asdr =3D env->spr[SPR_ASDR];
> -    }
> -
>      /* HEIR should be implemented for HV mode and saved here. */
>      hvstate->srr0 =3D env->spr[SPR_SRR0];
>      hvstate->srr1 =3D env->spr[SPR_SRR1];
> @@ -1768,27 +1737,43 @@ void spapr_exit_nested(PowerPCCPU *cpu, int excp)
>      hvstate->pidr =3D env->spr[SPR_BOOKS_PID];
>      hvstate->ppr =3D env->spr[SPR_PPR];
> =20
> -    /* Is it okay to specify write length larger than actual data writte=
n? */
> -    address_space_unmap(CPU(cpu)->as, hvstate, len, len, true);
> +    if (excp =3D=3D POWERPC_EXCP_HDSI) {
> +        hvstate->hdar =3D env->spr[SPR_HDAR];
> +        hvstate->hdsisr =3D env->spr[SPR_HDSISR];
> +        hvstate->asdr =3D env->spr[SPR_ASDR];
> +    } else if (excp =3D=3D POWERPC_EXCP_HISI) {
> +        hvstate->asdr =3D env->spr[SPR_ASDR];
> +    }
> +}
> =20
> -    len =3D sizeof(*regs);
> -    regs =3D address_space_map(CPU(cpu)->as, regs_ptr, &len, true,
> +static int map_and_restore_l2_hvstate(PowerPCCPU *cpu, int excp, target_=
ulong *r3)
> +{
> +    CPUPPCState *env =3D &cpu->env;
> +    SpaprCpuState *spapr_cpu =3D spapr_cpu_state(cpu);
> +    target_ulong hv_ptr =3D spapr_cpu->nested_host_state->gpr[4];
> +    struct kvmppc_hv_guest_state *hvstate;
> +    hwaddr len =3D sizeof(*hvstate);
> +
> +    hvstate =3D address_space_map(CPU(cpu)->as, hv_ptr, &len, true,
>                                  MEMTXATTRS_UNSPECIFIED);
> -    if (!regs || len !=3D sizeof(*regs)) {
> -        address_space_unmap(CPU(cpu)->as, regs, len, 0, true);
> -        r3_return =3D H_P2;
> -        goto out_restore_l1;
> +    if (len !=3D sizeof(*hvstate)) {
> +        address_space_unmap(CPU(cpu)->as, hvstate, len, 0, true);
> +        *r3 =3D H_PARAMETER;
> +        return -1;
>      }
> +    restore_hvstate_from_env(hvstate, env, excp);
> +    /* Is it okay to specify write length larger than actual data writte=
n? */
> +    address_space_unmap(CPU(cpu)->as, hvstate, len, len, true);
> +    return 0;
> +}
> =20
> +static void restore_ptregs_from_env(struct kvmppc_pt_regs *regs,
> +                                    CPUPPCState *env, int excp)
> +{
> +    hwaddr len;
>      len =3D sizeof(env->gpr);
>      assert(len =3D=3D sizeof(regs->gpr));
>      memcpy(regs->gpr, env->gpr, len);
> -
> -    regs->link =3D env->lr;
> -    regs->ctr =3D env->ctr;
> -    regs->xer =3D cpu_read_xer(env);
> -    regs->ccr =3D ppc_get_cr(env);
> -
>      if (excp =3D=3D POWERPC_EXCP_MCHECK ||
>          excp =3D=3D POWERPC_EXCP_RESET ||
>          excp =3D=3D POWERPC_EXCP_SYSCALL) {
> @@ -1798,11 +1783,50 @@ void spapr_exit_nested(PowerPCCPU *cpu, int excp)
>          regs->nip =3D env->spr[SPR_HSRR0];
>          regs->msr =3D env->spr[SPR_HSRR1] & env->msr_mask;
>      }
> +    regs->link =3D env->lr;
> +    regs->ctr =3D env->ctr;
> +    regs->xer =3D cpu_read_xer(env);
> +    regs->ccr =3D ppc_get_cr(env);
> +}
> =20
> +static int map_and_restore_l2_ptregs(PowerPCCPU *cpu, int excp, target_u=
long *r3)
> +{
> +    CPUPPCState *env =3D &cpu->env;
> +    SpaprCpuState *spapr_cpu =3D spapr_cpu_state(cpu);
> +    target_ulong regs_ptr =3D spapr_cpu->nested_host_state->gpr[5];
> +    hwaddr len;
> +    struct kvmppc_pt_regs *regs =3D NULL;
> +
> +    len =3D sizeof(*regs);
> +    regs =3D address_space_map(CPU(cpu)->as, regs_ptr, &len, true,
> +                             MEMTXATTRS_UNSPECIFIED);
> +    if (!regs || len !=3D sizeof(*regs)) {
> +        address_space_unmap(CPU(cpu)->as, regs, len, 0, true);
> +        *r3 =3D H_P2;
> +        return -1;
> +    }
> +    restore_ptregs_from_env(regs, env, excp);
>      /* Is it okay to specify write length larger than actual data writte=
n? */
>      address_space_unmap(CPU(cpu)->as, regs, len, len, true);
> +    return 0;
> +}
> +
> +void spapr_exit_nested(PowerPCCPU *cpu, int excp)
> +{
> +    CPUState *cs =3D CPU(cpu);
> +    CPUPPCState *env =3D &cpu->env;
> +    SpaprCpuState *spapr_cpu =3D spapr_cpu_state(cpu);
> +    target_ulong r3_return =3D env->excp_vectors[excp]; /* hcall return =
value */
> +
> +    assert(spapr_cpu->in_nested);
> +
> +    cpu_ppc_hdecr_exit(env);
> +
> +   if (!map_and_restore_l2_hvstate(cpu, excp, &r3_return)) {
> +       map_and_restore_l2_ptregs (cpu, excp, &r3_return);
> +   }

Same for this one really. Enter/exit nested *is* entirely about
switching from L1 to L2 environment and back so I'm not seeing
where the abstraction is. Just seems more clunky to me.

Abstracting the hcall, error checking, address space mapping and
copying etc into one function and the state switch itself into
another I could see, but that's now spread across the new functions.

So, not sure about this. I think I'd have to see if it was a
precursor to a larger series.

Thanks,
Nick

