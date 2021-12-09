Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A4346E0D4
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 03:22:44 +0100 (CET)
Received: from localhost ([::1]:46360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv951-0003lB-3P
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 21:22:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mv90z-0001Pa-F6; Wed, 08 Dec 2021 21:18:33 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=53221
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mv90K-0006uO-Ee; Wed, 08 Dec 2021 21:18:33 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4J8d3Z6sJ6z4xhk; Thu,  9 Dec 2021 13:17:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1639016266;
 bh=uNSGwVTaCElj9UtXTY0MRyj1qGbXhRxBkcgRM1ETTjg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZlyQ937JhMlt3NzgZSlIqg/PCgVL5aM8WEhdzkaquN732l/EWeqlqkYOX7cDh7fJP
 0PtSavC+0+VdFsxvCMINHJQX27ra3sQSQyIs2i7dqVJb+XDGUH2R57uhAGnv3gFJTo
 Y3+LqxgG+2bqNjTHRe7hnkmXJdTssk+wiN/+KfjQ=
Date: Thu, 9 Dec 2021 12:51:11 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v9 09/10] target/ppc: PMU Event-Based exception support
Message-ID: <YbFhDxha+/sZVEf/@yekko>
References: <20211201151734.654994-1-danielhb413@gmail.com>
 <20211201151734.654994-10-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HhZwsrRfoBqPlkgL"
Content-Disposition: inline
In-Reply-To: <20211201151734.654994-10-danielhb413@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gustavo Romero <gustavo.romero@linaro.org>,
 Gustavo Romero <gromero@linux.ibm.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--HhZwsrRfoBqPlkgL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 01, 2021 at 12:17:33PM -0300, Daniel Henrique Barboza wrote:
> From: Gustavo Romero <gromero@linux.ibm.com>
>=20
> Following up the rfebb implementation, this patch adds the EBB exception
> support that are triggered by Performance Monitor alerts. This exception
> occurs when an enabled PMU condition or event happens and both MMCR0_EBE
> and BESCR_PME are set.
>=20
> The supported PM alerts will consist of counter negative conditions of
> the PMU counters. This will be achieved by a timer mechanism that will
> predict when a counter becomes negative. The PMU timer callback will set
> the appropriate bits in MMCR0 and fire a PMC interrupt. The EBB
> exception code will then set the appropriate BESCR bits, set the next
> instruction pointer to the address pointed by the return register
> (SPR_EBBRR), and redirect execution to the handler (pointed by
> SPR_EBBHR).
>=20
> CC: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  target/ppc/cpu.h         |  5 ++++-
>  target/ppc/excp_helper.c | 29 +++++++++++++++++++++++++++++
>  target/ppc/power8-pmu.c  | 40 ++++++++++++++++++++++++++++++++++++++--
>  3 files changed, 71 insertions(+), 3 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 741b8baf4c..8e0e6319ee 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -129,8 +129,10 @@ enum {
>      /* ISA 3.00 additions */
>      POWERPC_EXCP_HVIRT    =3D 101,
>      POWERPC_EXCP_SYSCALL_VECTORED =3D 102, /* scv exception             =
        */
> +    POWERPC_EXCP_EBB =3D 103, /* Event-based branch exception           =
       */
> +
>      /* EOL                                                              =
     */
> -    POWERPC_EXCP_NB       =3D 103,
> +    POWERPC_EXCP_NB       =3D 104,
>      /* QEMU exceptions: special cases we want to stop translation       =
     */
>      POWERPC_EXCP_SYSCALL_USER =3D 0x203, /* System call in user mode onl=
y      */
>  };
> @@ -2452,6 +2454,7 @@ enum {
>      PPC_INTERRUPT_HMI,            /* Hypervisor Maintenance interrupt   =
 */
>      PPC_INTERRUPT_HDOORBELL,      /* Hypervisor Doorbell interrupt      =
  */
>      PPC_INTERRUPT_HVIRT,          /* Hypervisor virtualization interrupt=
  */
> +    PPC_INTERRUPT_PMC,            /* PMU interrupt  */
>  };

All this low-level exception stuff is very clunky, but addressing
that is not reasonably in scope for this series.  So,

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> =20
>  /* Processor Compatibility mask (PCR) */
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 7ead32279c..a26d266fe6 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -799,6 +799,23 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int=
 excp_model, int excp)
>          cpu_abort(cs, "Non maskable external exception "
>                    "is not implemented yet !\n");
>          break;
> +    case POWERPC_EXCP_EBB:       /* Event-based branch exception        =
     */
> +        if ((env->spr[SPR_FSCR] & (1ull << FSCR_EBB)) &&
> +            (env->spr[SPR_BESCR] & BESCR_GE) &&
> +            (env->spr[SPR_BESCR] & BESCR_PME)) {
> +            target_ulong nip;
> +
> +            env->spr[SPR_BESCR] &=3D ~BESCR_GE;   /* Clear GE */
> +            env->spr[SPR_BESCR] |=3D BESCR_PMEO;  /* Set PMEO */
> +            env->spr[SPR_EBBRR] =3D env->nip;     /* Save NIP for rfebb =
insn */
> +            nip =3D env->spr[SPR_EBBHR];          /* EBB handler */
> +            powerpc_set_excp_state(cpu, nip, env->msr);
> +        }
> +        /*
> +         * This interrupt is handled by userspace. No need
> +         * to proceed.
> +         */
> +        return;
>      default:
>      excp_invalid:
>          cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
> @@ -1046,6 +1063,18 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>              powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_THERM);
>              return;
>          }
> +        /* PMC -> Event-based branch exception */
> +        if (env->pending_interrupts & (1 << PPC_INTERRUPT_PMC)) {
> +            /*
> +             * Performance Monitor event-based exception can only
> +             * occur in problem state.
> +             */
> +            if (msr_pr =3D=3D 1) {
> +                env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_PMC);
> +                powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_EBB);
> +                return;
> +            }
> +        }
>      }
> =20
>      if (env->resume_as_sreset) {
> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
> index 08d1902cd5..279b824c3f 100644
> --- a/target/ppc/power8-pmu.c
> +++ b/target/ppc/power8-pmu.c
> @@ -297,6 +297,20 @@ void helper_store_pmc(CPUPPCState *env, uint32_t spr=
n, uint64_t value)
>      pmc_update_overflow_timer(env, sprn);
>  }
> =20
> +static void pmu_delete_timers(CPUPPCState *env)
> +{
> +    QEMUTimer *pmc_overflow_timer;
> +    int sprn;
> +
> +    for (sprn =3D SPR_POWER_PMC1; sprn <=3D SPR_POWER_PMC6; sprn++) {
> +        pmc_overflow_timer =3D get_cyc_overflow_timer(env, sprn);
> +
> +        if (pmc_overflow_timer) {
> +            timer_del(pmc_overflow_timer);
> +        }
> +    }
> +}
> +
>  static void fire_PMC_interrupt(PowerPCCPU *cpu)
>  {
>      CPUPPCState *env =3D &cpu->env;
> @@ -305,8 +319,30 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
>          return;
>      }
> =20
> -    /* PMC interrupt not implemented yet */
> -    return;
> +    pmu_update_cycles(env);
> +
> +    if (env->spr[SPR_POWER_MMCR0] & MMCR0_FCECE) {
> +        env->spr[SPR_POWER_MMCR0] &=3D ~MMCR0_FCECE;
> +        env->spr[SPR_POWER_MMCR0] |=3D MMCR0_FC;
> +
> +        /* Changing MMCR0_FC demands a new hflags compute */
> +        hreg_compute_hflags(env);
> +
> +        /*
> +         * Delete all pending timers if we need to freeze
> +         * the PMC. We'll restart them when the PMC starts
> +         * running again.
> +         */
> +        pmu_delete_timers(env);
> +    }
> +
> +    if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMAE) {
> +        env->spr[SPR_POWER_MMCR0] &=3D ~MMCR0_PMAE;
> +        env->spr[SPR_POWER_MMCR0] |=3D MMCR0_PMAO;
> +    }
> +
> +    /* Fire the PMC hardware exception */
> +    ppc_set_irq(cpu, PPC_INTERRUPT_PMC, 1);
>  }
> =20
>  /* This helper assumes that the PMC is running. */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--HhZwsrRfoBqPlkgL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGxYQ0ACgkQbDjKyiDZ
s5IcuRAAlYC49rm0NDnPKAB7ZuyXDPODgBY/3SKpEQV5b3lekgII4CiRetrlMQgj
i1ONebSJl1AJZynRFFPxteuTntqHXRA5ps5mb5Va0O0BqlHaLHlx1TFPKtpeNLvK
/Vmh0Y7A5ZHD4fYjeSJfg0qUbIAMh9o1UTCmLs66hsRqmL5+/nNKPDkNSrL5UlnD
GjbkMDW0V7JLEkEhuKoCURLCPr0c+WGm7bKER1yNvLi8+TPiTuCSiP4hCDWt+Ial
1YyquGks0RbEnyEYyR3dMA48E06vQDFRQ85WHEvB3lZB0ETkJjC+HBJAXPOoUdwG
4TaKkYHT2NdS/tWsXh/iXXLCX1xzpmpIqsIyJzil6vuQxf4iB7zhOwo4SpuU69Mc
40wVOccuzDMstF615pdUopwaxrOpjl2opnr/4slGMGBmrMPFfhE4vWLYG4qUSWdx
zEoROtoGHDtAeTpmF2FyR6q1K+OdGaPmstBjJiY/0Z5B54LjeXCoqm+FUaumglmA
kqBRbjvcYB+YsCrIfhC+t3d/bWIfSTGzyPN2ov0M7AJWydya6UlVHT6P6Q1lcBOD
xSdCYnqV/lekP7vRAP7HfxjTBBrZDRY5PCC+CnIpkGrW5g5GuiUjxd23C8kl/eYK
qTi/nine/ny4558FoXUi4jlucrVvuzthDjQ8OrsmFia0Iy2E6/o=
=+GOE
-----END PGP SIGNATURE-----

--HhZwsrRfoBqPlkgL--

