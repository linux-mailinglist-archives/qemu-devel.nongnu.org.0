Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F60A3710FB
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 06:39:22 +0200 (CEST)
Received: from localhost ([::1]:55110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldQMb-0004Ii-H6
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 00:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldQJM-0007Zb-N2; Mon, 03 May 2021 00:36:00 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57997 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldQJI-0002BX-93; Mon, 03 May 2021 00:36:00 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FYVXQ6sgNz9sW5; Mon,  3 May 2021 14:35:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620016550;
 bh=C77nPN58wFOa7AAknwx4Yc41mHY3mBTz+Ma59QFu2Ng=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QbwQABueKUKrYWQAN6MflfxOrATIvROe/UgiDyVTjXieCYXB+D/LxXnURYcJsQg1B
 bsOMDjN5uYePHIGt2JyWhbmcVc8mY7xf2Ux87wDAKrFUivitsnhBRfk+PTFwv6cfvP
 0Xbx2lEKOXy/INjk590Yf55pQ7po0+A2YLl1MYiE=
Date: Mon, 3 May 2021 13:42:48 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/2] target/ppc: Add POWER10 exception model
Message-ID: <YI9xOI3P1Wr8yrEe@yekko>
References: <20210501072436.145444-1-npiggin@gmail.com>
 <20210501072436.145444-3-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SiBgH4f1owh2Pyad"
Content-Disposition: inline
In-Reply-To: <20210501072436.145444-3-npiggin@gmail.com>
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


--SiBgH4f1owh2Pyad
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 01, 2021 at 05:24:35PM +1000, Nicholas Piggin wrote:
> POWER10 adds a new bit that modifies interrupt behaviour, LPCR[HAIL],
> and it removes support for the LPCR[AIL]=3D0b10 mode.
>=20
> Reviewed-by: C=E9dric Le Goater <clg@kaod.org>
> Tested-by: C=E9dric Le Goater <clg@kaod.org>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Applied to ppc-for-6.1, thanks.

> ---
>  hw/ppc/spapr_hcall.c            |  7 ++++-
>  target/ppc/cpu-qom.h            |  2 ++
>  target/ppc/cpu.h                |  5 +--
>  target/ppc/excp_helper.c        | 54 +++++++++++++++++++++++++++++++--
>  target/ppc/translate.c          |  3 +-
>  target/ppc/translate_init.c.inc |  2 +-
>  6 files changed, 65 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 2fbe04a689..7275d0bba1 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1396,7 +1396,12 @@ static target_ulong h_set_mode_resource_addr_trans=
_mode(PowerPCCPU *cpu,
>      }
> =20
>      if (mflags =3D=3D 1) {
> -        /* AIL=3D1 is reserved */
> +        /* AIL=3D1 is reserved in POWER8/POWER9/POWER10 */
> +        return H_UNSUPPORTED_FLAG;
> +    }
> +
> +    if (mflags =3D=3D 2 && (pcc->insns_flags2 & PPC2_ISA310)) {
> +        /* AIL=3D2 is reserved in POWER10 (ISA v3.1) */
>          return H_UNSUPPORTED_FLAG;
>      }
> =20
> diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
> index 118baf8d41..06b6571bc9 100644
> --- a/target/ppc/cpu-qom.h
> +++ b/target/ppc/cpu-qom.h
> @@ -116,6 +116,8 @@ enum powerpc_excp_t {
>      POWERPC_EXCP_POWER8,
>      /* POWER9 exception model           */
>      POWERPC_EXCP_POWER9,
> +    /* POWER10 exception model           */
> +    POWERPC_EXCP_POWER10,
>  };
> =20
>  /***********************************************************************=
******/
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index be24a501fc..8a076fab48 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -354,10 +354,11 @@ typedef struct ppc_v3_pate_t {
>  #define LPCR_PECE_U_SHIFT (63 - 19)
>  #define LPCR_PECE_U_MASK  (0x7ull << LPCR_PECE_U_SHIFT)
>  #define LPCR_HVEE         PPC_BIT(17) /* Hypervisor Virt Exit Enable */
> -#define LPCR_RMLS_SHIFT   (63 - 37)
> +#define LPCR_RMLS_SHIFT   (63 - 37)   /* RMLS (removed in ISA v3.0) */
>  #define LPCR_RMLS         (0xfull << LPCR_RMLS_SHIFT)
> +#define LPCR_HAIL         PPC_BIT(37) /* ISA v3.1 HV AIL=3D3 equivalent =
*/
>  #define LPCR_ILE          PPC_BIT(38)
> -#define LPCR_AIL_SHIFT    (63 - 40)      /* Alternate interrupt location=
 */
> +#define LPCR_AIL_SHIFT    (63 - 40)   /* Alternate interrupt location */
>  #define LPCR_AIL          (3ull << LPCR_AIL_SHIFT)
>  #define LPCR_UPRT         PPC_BIT(41) /* Use Process Table */
>  #define LPCR_EVIRT        PPC_BIT(42) /* Enhanced Virtualisation */
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 73360bb872..5e30a5a056 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -170,7 +170,27 @@ static int powerpc_reset_wakeup(CPUState *cs, CPUPPC=
State *env, int excp,
>   * +-------------------------------------------------------+
>   *
>   * The difference with POWER9 being that MSR[HV] 0->1 interrupts can be =
sent to
> - * the hypervisor in AIL mode if the guest is radix.
> + * the hypervisor in AIL mode if the guest is radix. This is good for
> + * performance but allows the guest to influence the AIL of hypervisor
> + * interrupts using its MSR, and also the hypervisor must disallow guest
> + * interrupts (MSR[HV] 0->0) from using AIL if the hypervisor does not w=
ant to
> + * use AIL for its MSR[HV] 0->1 interrupts.
> + *
> + * POWER10 addresses those issues with a new LPCR[HAIL] bit that is appl=
ied to
> + * interrupts that begin execution with MSR[HV]=3D1 (so both MSR[HV] 0->=
1 and
> + * MSR[HV] 1->1).
> + *
> + * HAIL=3D1 is equivalent to AIL=3D3, for interrupts delivered with MSR[=
HV]=3D1.
> + *
> + * POWER10 behaviour is
> + * | LPCR[AIL] | LPCR[HAIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL |
> + * +-----------+------------+-------------+---------+-------------+-----+
> + * | a         | h          | 00/01/10    | 0       | 0           | 0   |
> + * | a         | h          | 11          | 0       | 0           | a   |
> + * | a         | h          | x           | 0       | 1           | h   |
> + * | a         | h          | 00/01/10    | 1       | 1           | 0   |
> + * | a         | h          | 11          | 1       | 1           | h   |
> + * +--------------------------------------------------------------------+
>   */
>  static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, i=
nt excp,
>                                        target_ulong msr,
> @@ -213,6 +233,32 @@ static inline void ppc_excp_apply_ail(PowerPCCPU *cp=
u, int excp_model, int excp,
>              /* AIL=3D1 is reserved, treat it like AIL=3D0 */
>              return;
>          }
> +
> +    } else if (excp_model =3D=3D POWERPC_EXCP_POWER10) {
> +        if (!mmu_all_on && !hv_escalation) {
> +            /*
> +             * AIL works for HV interrupts even with guest MSR[IR/DR] di=
sabled.
> +             * Guest->guest and HV->HV interrupts do require MMU on.
> +             */
> +            return;
> +        }
> +
> +        if (*new_msr & MSR_HVB) {
> +            if (!(env->spr[SPR_LPCR] & LPCR_HAIL)) {
> +                /* HV interrupts depend on LPCR[HAIL] */
> +                return;
> +            }
> +            ail =3D 3; /* HAIL=3D1 gives AIL=3D3 behaviour for HV interr=
upts */
> +        } else {
> +            ail =3D (env->spr[SPR_LPCR] & LPCR_AIL) >> LPCR_AIL_SHIFT;
> +        }
> +	if (ail =3D=3D 0) {
> +            return;
> +        }
> +        if (ail =3D=3D 1 || ail =3D=3D 2) {
> +            /* AIL=3D1 and AIL=3D2 are reserved, treat them like AIL=3D0=
 */
> +            return;
> +        }
>      } else {
>          /* Other processors do not support AIL */
>          return;
> @@ -328,7 +374,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>  #if defined(TARGET_PPC64)
>      if (excp_model =3D=3D POWERPC_EXCP_POWER7 ||
>          excp_model =3D=3D POWERPC_EXCP_POWER8 ||
> -        excp_model =3D=3D POWERPC_EXCP_POWER9) {
> +        excp_model =3D=3D POWERPC_EXCP_POWER9 ||
> +        excp_model =3D=3D POWERPC_EXCP_POWER10) {
>          lpes0 =3D !!(env->spr[SPR_LPCR] & LPCR_LPES0);
>      } else
>  #endif /* defined(TARGET_PPC64) */
> @@ -848,7 +895,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>          } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
>              new_msr |=3D (target_ulong)1 << MSR_LE;
>          }
> -    } else if (excp_model =3D=3D POWERPC_EXCP_POWER9) {
> +    } else if (excp_model =3D=3D POWERPC_EXCP_POWER9 ||
> +               excp_model =3D=3D POWERPC_EXCP_POWER10) {
>          if (new_msr & MSR_HVB) {
>              if (env->spr[SPR_HID0] & HID0_POWER9_HILE) {
>                  new_msr |=3D (target_ulong)1 << MSR_LE;
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index a53463b9b8..3bbd4cf6ac 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -7731,7 +7731,8 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int =
flags)
>  #if defined(TARGET_PPC64)
>      if (env->excp_model =3D=3D POWERPC_EXCP_POWER7 ||
>          env->excp_model =3D=3D POWERPC_EXCP_POWER8 ||
> -        env->excp_model =3D=3D POWERPC_EXCP_POWER9)  {
> +        env->excp_model =3D=3D POWERPC_EXCP_POWER9 ||
> +        env->excp_model =3D=3D POWERPC_EXCP_POWER10)  {
>          qemu_fprintf(f, "HSRR0 " TARGET_FMT_lx " HSRR1 " TARGET_FMT_lx "=
\n",
>                       env->spr[SPR_HSRR0], env->spr[SPR_HSRR1]);
>      }
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.=
c.inc
> index 01fa76e4a0..78cd2243f4 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -9317,7 +9317,7 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
>      pcc->radix_page_info =3D &POWER10_radix_page_info;
>      pcc->lrg_decr_bits =3D 56;
>  #endif
> -    pcc->excp_model =3D POWERPC_EXCP_POWER9;
> +    pcc->excp_model =3D POWERPC_EXCP_POWER10;
>      pcc->bus_model =3D PPC_FLAGS_INPUT_POWER9;
>      pcc->bfd_mach =3D bfd_mach_ppc64;
>      pcc->flags =3D POWERPC_FLAG_VRE | POWERPC_FLAG_SE |

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SiBgH4f1owh2Pyad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCPcTgACgkQbDjKyiDZ
s5IBgxAAhyAlBtVNxDU95NWDRVSY/yW50M4prKxtduErr+w/uhIvTlh1fpSdDLIm
1SVdOr6wbypyNtY0ZxR6+FDAykbpTHGd0jCRxzVFppwt/cELtgbzTP1hz5GVIQNF
9EFY9F1DJKInsnUXnrvqLGssBR0PWIDtk+x8aL0asHnj1BxqBSYp8VIofg0Q82ji
os6xtm7dwbX7fRADbvzldhFOXQFC7MAIB5kw77Q9lX+1NQwjCBu8gjblscOoI+Cq
naWt6fp5BFAxHlCP56EavnmONStqOAiSqoPXman/sFMlkcrVlWpYzQ6d46IOg8V8
7l5G7EbeFDJiYp7qkJzAYRWi0FuqbPceD95qvmN6qXq+Rs76vn8FcCJfV/uEiJxA
7Ht+oPgkPjsh9wKygP+P0vEr7OEJzqKebmGVk/BofkIQp4E6vIi5y51yr6EybmX1
pIINqRr1BGPS4HwCQq7XKvIYFVZICuH95icBa0QsPsnonVrB7hBAniWex4vLsfGj
cd0UpDRM1sbtfGBoSjAeyHCzTwcTbxuJdMS0yhxgtZI//XR8QzWX968BdWWxyWEp
+KsG6WlL+0vS8Df9xbtU/lsw1L76CMaqLWL8PvlWmg1h3wHbhPnI9WPd4HnxZAfB
jpgFFrZqIQyUnsrXtwU2X+yex/+oigNpyYDMQm+lqkzu2ePTPqo=
=37Nv
-----END PGP SIGNATURE-----

--SiBgH4f1owh2Pyad--

