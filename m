Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CC93710F9
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 06:38:03 +0200 (CEST)
Received: from localhost ([::1]:47494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldQLK-0001F7-Jm
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 00:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldQJL-0007Z2-0V; Mon, 03 May 2021 00:35:59 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40833 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldQJI-0002BU-3n; Mon, 03 May 2021 00:35:58 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FYVXQ5wDTz9sTD; Mon,  3 May 2021 14:35:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620016550;
 bh=vz1IZ/vCseb3flkWMYft/qMlklfiqZ7wCmdfvBZ1sOU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PA3NfU+706xfyM9mJD21/2W8s0xt+1gtlspyCVHnx/2B/QPYKEGXMosU+ToJp8aXV
 miHF2/oli5yQm96B88Lez0j81takrWwI+ZJeIJaeQzizh/GJaE4C9nP86e2S3n+SRG
 15muNB9UkcAsPWT66l24ok6kyyCdvKboQi9VjD/E=
Date: Mon, 3 May 2021 13:41:32 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] target/ppc: rework AIL logic in interrupt delivery
Message-ID: <YI9w7KZoxnvK3oPB@yekko>
References: <20210501072436.145444-1-npiggin@gmail.com>
 <20210501072436.145444-2-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OL6yexeN9xWFqYoW"
Content-Disposition: inline
In-Reply-To: <20210501072436.145444-2-npiggin@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@fr.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--OL6yexeN9xWFqYoW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 01, 2021 at 05:24:34PM +1000, Nicholas Piggin wrote:
> The AIL logic is becoming unmanageable spread all over powerpc_excp(),
> and it is slated to get even worse with POWER10 support.
>=20
> Move it all to a new helper function.
>=20
> Reviewed-by: C=E9dric Le Goater <clg@kaod.org>
> Tested-by: C=E9dric Le Goater <clg@kaod.org>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Applied to ppc-for-6.1, thanks.

> ---
>  hw/ppc/spapr_hcall.c            |   3 +-
>  target/ppc/cpu.h                |   8 --
>  target/ppc/excp_helper.c        | 165 ++++++++++++++++++++------------
>  target/ppc/translate_init.c.inc |   2 +-
>  4 files changed, 108 insertions(+), 70 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 7b5cd3553c..2fbe04a689 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1395,7 +1395,8 @@ static target_ulong h_set_mode_resource_addr_trans_=
mode(PowerPCCPU *cpu,
>          return H_P4;
>      }
> =20
> -    if (mflags =3D=3D AIL_RESERVED) {
> +    if (mflags =3D=3D 1) {
> +        /* AIL=3D1 is reserved */
>          return H_UNSUPPORTED_FLAG;
>      }
> =20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 8c18bb0762..be24a501fc 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -2405,14 +2405,6 @@ enum {
>      HMER_XSCOM_STATUS_MASK      =3D PPC_BITMASK(21, 23),
>  };
> =20
> -/* Alternate Interrupt Location (AIL) */
> -enum {
> -    AIL_NONE                =3D 0,
> -    AIL_RESERVED            =3D 1,
> -    AIL_0001_8000           =3D 2,
> -    AIL_C000_0000_0000_4000 =3D 3,
> -};
> -
>  /***********************************************************************=
******/
> =20
>  #define is_isa300(ctx) (!!(ctx->insns_flags2 & PPC2_ISA300))
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 344af66f66..73360bb872 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -136,25 +136,111 @@ static int powerpc_reset_wakeup(CPUState *cs, CPUP=
PCState *env, int excp,
>      return POWERPC_EXCP_RESET;
>  }
> =20
> -static uint64_t ppc_excp_vector_offset(CPUState *cs, int ail)
> +/*
> + * AIL - Alternate Interrupt Location, a mode that allows interrupts to =
be
> + * taken with the MMU on, and which uses an alternate location (e.g., so=
 the
> + * kernel/hv can map the vectors there with an effective address).
> + *
> + * An interrupt is considered to be taken "with AIL" or "AIL applies" if=
 they
> + * are delivered in this way. AIL requires the LPCR to be set to enable =
this
> + * mode, and then a number of conditions have to be true for AIL to appl=
y.
> + *
> + * First of all, SRESET, MCE, and HMI are always delivered without AIL, =
because
> + * they specifically want to be in real mode (e.g., the MCE might be sig=
naling
> + * a SLB multi-hit which requires SLB flush before the MMU can be enable=
d).
> + *
> + * After that, behaviour depends on the current MSR[IR], MSR[DR], MSR[HV=
],
> + * whether or not the interrupt changes MSR[HV] from 0 to 1, and the cur=
rent
> + * radix mode (LPCR[HR]).
> + *
> + * POWER8, POWER9 with LPCR[HR]=3D0
> + * | LPCR[AIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL |
> + * +-----------+-------------+---------+-------------+-----+
> + * | a         | 00/01/10    | x       | x           | 0   |
> + * | a         | 11          | 0       | 1           | 0   |
> + * | a         | 11          | 1       | 1           | a   |
> + * | a         | 11          | 0       | 0           | a   |
> + * +-------------------------------------------------------+
> + *
> + * POWER9 with LPCR[HR]=3D1
> + * | LPCR[AIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL |
> + * +-----------+-------------+---------+-------------+-----+
> + * | a         | 00/01/10    | x       | x           | 0   |
> + * | a         | 11          | x       | x           | a   |
> + * +-------------------------------------------------------+
> + *
> + * The difference with POWER9 being that MSR[HV] 0->1 interrupts can be =
sent to
> + * the hypervisor in AIL mode if the guest is radix.
> + */
> +static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, i=
nt excp,
> +                                      target_ulong msr,
> +                                      target_ulong *new_msr,
> +                                      target_ulong *vector)
>  {
> -    uint64_t offset =3D 0;
> +#if defined(TARGET_PPC64)
> +    CPUPPCState *env =3D &cpu->env;
> +    bool mmu_all_on =3D ((msr >> MSR_IR) & 1) && ((msr >> MSR_DR) & 1);
> +    bool hv_escalation =3D !(msr & MSR_HVB) && (*new_msr & MSR_HVB);
> +    int ail =3D 0;
> +
> +    if (excp =3D=3D POWERPC_EXCP_MCHECK ||
> +        excp =3D=3D POWERPC_EXCP_RESET ||
> +        excp =3D=3D POWERPC_EXCP_HV_MAINT) {
> +        /* SRESET, MCE, HMI never apply AIL */
> +        return;
> +    }
> =20
> -    switch (ail) {
> -    case AIL_NONE:
> -        break;
> -    case AIL_0001_8000:
> -        offset =3D 0x18000;
> -        break;
> -    case AIL_C000_0000_0000_4000:
> -        offset =3D 0xc000000000004000ull;
> -        break;
> -    default:
> -        cpu_abort(cs, "Invalid AIL combination %d\n", ail);
> -        break;
> +    if (excp_model =3D=3D POWERPC_EXCP_POWER8 ||
> +        excp_model =3D=3D POWERPC_EXCP_POWER9) {
> +        if (!mmu_all_on) {
> +            /* AIL only works if MSR[IR] and MSR[DR] are both enabled. */
> +            return;
> +        }
> +        if (hv_escalation && !(env->spr[SPR_LPCR] & LPCR_HR)) {
> +            /*
> +             * AIL does not work if there is a MSR[HV] 0->1 transition a=
nd the
> +             * partition is in HPT mode. For radix guests, such interrup=
ts are
> +             * allowed to be delivered to the hypervisor in ail mode.
> +             */
> +            return;
> +        }
> +
> +        ail =3D (env->spr[SPR_LPCR] & LPCR_AIL) >> LPCR_AIL_SHIFT;
> +	if (ail =3D=3D 0) {
> +            return;
> +        }
> +        if (ail =3D=3D 1) {
> +            /* AIL=3D1 is reserved, treat it like AIL=3D0 */
> +            return;
> +        }
> +    } else {
> +        /* Other processors do not support AIL */
> +        return;
>      }
> =20
> -    return offset;
> +    /*
> +     * AIL applies, so the new MSR gets IR and DR set, and an offset app=
lied
> +     * to the new IP.
> +     */
> +    *new_msr |=3D (1 << MSR_IR) | (1 << MSR_DR);
> +
> +    if (excp !=3D POWERPC_EXCP_SYSCALL_VECTORED) {
> +        if (ail =3D=3D 2) {
> +            *vector |=3D 0x0000000000018000ull;
> +        } else if (ail =3D=3D 3) {
> +            *vector |=3D 0xc000000000004000ull;
> +        }
> +    } else {
> +        /*
> +	 * scv AIL is a little different. AIL=3D2 does not change the address,
> +	 * only the MSR. AIL=3D3 replaces the 0x17000 base with 0xc...3000.
> +	 */
> +        if (ail =3D=3D 3) {
> +            *vector &=3D ~0x0000000000017000ull; /* Un-apply the base of=
fset */
> +            *vector |=3D 0xc000000000003000ull; /* Apply scv's AIL=3D3 o=
ffset */
> +        }
> +    }
> +#endif
>  }
> =20
>  static inline void powerpc_set_excp_state(PowerPCCPU *cpu,
> @@ -197,7 +283,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>      CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;
>      target_ulong msr, new_msr, vector;
> -    int srr0, srr1, asrr0, asrr1, lev =3D -1, ail;
> +    int srr0, srr1, asrr0, asrr1, lev =3D -1;
>      bool lpes0;
> =20
>      qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
> @@ -238,25 +324,16 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
>       *
>       * On anything else, we behave as if LPES0 is 1
>       * (externals don't alter MSR:HV)
> -     *
> -     * AIL is initialized here but can be cleared by
> -     * selected exceptions
>       */
>  #if defined(TARGET_PPC64)
>      if (excp_model =3D=3D POWERPC_EXCP_POWER7 ||
>          excp_model =3D=3D POWERPC_EXCP_POWER8 ||
>          excp_model =3D=3D POWERPC_EXCP_POWER9) {
>          lpes0 =3D !!(env->spr[SPR_LPCR] & LPCR_LPES0);
> -        if (excp_model !=3D POWERPC_EXCP_POWER7) {
> -            ail =3D (env->spr[SPR_LPCR] & LPCR_AIL) >> LPCR_AIL_SHIFT;
> -        } else {
> -            ail =3D 0;
> -        }
>      } else
>  #endif /* defined(TARGET_PPC64) */
>      {
>          lpes0 =3D true;
> -        ail =3D 0;
>      }
> =20
>      /*
> @@ -315,7 +392,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>               */
>              new_msr |=3D (target_ulong)MSR_HVB;
>          }
> -        ail =3D 0;
> =20
>          /* machine check exceptions don't have ME set */
>          new_msr &=3D ~((target_ulong)1 << MSR_ME);
> @@ -519,7 +595,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>                            "exception %d with no HV support\n", excp);
>              }
>          }
> -        ail =3D 0;
>          break;
>      case POWERPC_EXCP_DSEG:      /* Data segment exception              =
     */
>      case POWERPC_EXCP_ISEG:      /* Instruction segment exception       =
     */
> @@ -790,24 +865,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int=
 excp_model, int excp)
>      }
>  #endif
> =20
> -    /*
> -     * AIL only works if MSR[IR] and MSR[DR] are both enabled.
> -     */
> -    if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1)) {
> -        ail =3D 0;
> -    }
> -
> -    /*
> -     * AIL does not work if there is a MSR[HV] 0->1 transition and the
> -     * partition is in HPT mode. For radix guests, such interrupts are
> -     * allowed to be delivered to the hypervisor in ail mode.
> -     */
> -    if ((new_msr & MSR_HVB) && !(msr & MSR_HVB)) {
> -        if (!(env->spr[SPR_LPCR] & LPCR_HR)) {
> -            ail =3D 0;
> -        }
> -    }
> -
>      vector =3D env->excp_vectors[excp];
>      if (vector =3D=3D (target_ulong)-1ULL) {
>          cpu_abort(cs, "Raised an exception without defined vector %d\n",
> @@ -848,23 +905,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int=
 excp_model, int excp)
>          /* Save MSR */
>          env->spr[srr1] =3D msr;
> =20
> -        /* Handle AIL */
> -        if (ail) {
> -            new_msr |=3D (1 << MSR_IR) | (1 << MSR_DR);
> -            vector |=3D ppc_excp_vector_offset(cs, ail);
> -        }
> -
>  #if defined(TARGET_PPC64)
>      } else {
> -        /* scv AIL is a little different */
> -        if (ail) {
> -            new_msr |=3D (1 << MSR_IR) | (1 << MSR_DR);
> -        }
> -        if (ail =3D=3D AIL_C000_0000_0000_4000) {
> -            vector |=3D 0xc000000000003000ull;
> -        } else {
> -            vector |=3D 0x0000000000017000ull;
> -        }
>          vector +=3D lev * 0x20;
> =20
>          env->lr =3D env->nip;
> @@ -872,6 +914,9 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>  #endif
>      }
> =20
> +    /* This can update new_msr and vector if AIL applies */
> +    ppc_excp_apply_ail(cpu, excp_model, excp, msr, &new_msr, &vector);
> +
>      powerpc_set_excp_state(cpu, vector, new_msr);
>  }
> =20
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.=
c.inc
> index 9ab2c32cc4..01fa76e4a0 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -3457,7 +3457,7 @@ static void init_excp_POWER9(CPUPPCState *env)
> =20
>  #if !defined(CONFIG_USER_ONLY)
>      env->excp_vectors[POWERPC_EXCP_HVIRT]    =3D 0x00000EA0;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL_VECTORED] =3D 0x00000000;
> +    env->excp_vectors[POWERPC_EXCP_SYSCALL_VECTORED] =3D 0x00017000;
>  #endif
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--OL6yexeN9xWFqYoW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCPcOoACgkQbDjKyiDZ
s5KoVw/+N1eTgrQzyXerXBGZclEeDsNmYG6k/kL2QKV+J/7yz9PglDNR6RPbUbpg
0qDJ7V8IPPjkT4TNn6/OWTejGsZ8yEwKa1wmKWe2j6LQYDF1OV4cUFx1a++0i+ix
lTzA3LDAXbS9lRGWnmPUf2fP1Muwq758XUPDo5OocI0RpXBcliEY5xZsE1j1gDvQ
8DRzWjlklYVnhD+V3NcIrMI1l6jofc0rig1nppNc8DWMyI7HWwH5ML7oBhw+FpkG
Nx/s+rVCwKf00ZeeCQSCjv+fwQp7KO+ic4KOXISfJmJ55oo3ZA2gVHLed3CAicyb
fAsOtTXv8x9SPixtYqe1c2dbqZkuTyA/LNRXLckTtFSJr+G06+oih2DkQjV/minm
5edBiOKCqdClLjEsztOF0HxvhepqcohWKLgMUh2eeyFaUoZWPXAOcsTBYXCoZfV8
mzBu1z7NyFA5EZKUmbm3TwQh1lbbZlHa1iVTDX5+S81frmdiP3nGmlaxicroMN0A
GW2LnXo+WFAvGl607E+aODhAyumdjn5ApXRERnusjyB8pGw554Z2hbyhE8azCIz2
bHERN/P/esB5UX94IDnTRb3wCp6U2ZCVR5521GnPOVEBRLraNA8kp4BC7Rd1manX
0og/79KKfyVDbo8jodzXB1RcO15dA3TQA5qibIXV0GcLH0qQwyQ=
=szs7
-----END PGP SIGNATURE-----

--OL6yexeN9xWFqYoW--

