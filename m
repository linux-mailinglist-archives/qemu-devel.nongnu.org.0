Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3579A3BB67D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 06:47:41 +0200 (CEST)
Received: from localhost ([::1]:34846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0GWC-0003xg-63
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 00:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m0GSF-0001ek-20; Mon, 05 Jul 2021 00:43:35 -0400
Received: from ozlabs.org ([203.11.71.1]:35091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m0GSC-0008MA-Ft; Mon, 05 Jul 2021 00:43:34 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GJCk02KXxz9sW8; Mon,  5 Jul 2021 14:43:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625460200;
 bh=lsNrMAXyEODH0618kGTsZ/v+xZ5yIDIymamsI4Gxoc4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jVXxuJlTFTxYLzigcABwf5n/w03ODZbfdMHL+ILubWBqrITP9uMMK/ABNc67QUBxD
 VX0PkrXyZqygwNI8QLYgfxMMWigROqMZ6F5Jl1rAzottamFetRo3QfhfjH8I/Gg0D7
 PmJOpWX6j+R6dfs/Dfz/3C06Zg4ZWQFv9cFL0qtk=
Date: Mon, 5 Jul 2021 14:26:14 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v4 3/3] target/ppc: changed ppc_hash64_xlate to use mmu_idx
Message-ID: <YOKJ5lVSsaxxUu/m@yekko>
References: <20210628133610.1143-1-bruno.larsen@eldorado.org.br>
 <20210628133610.1143-4-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rE3KGW5+m8FRCpxW"
Content-Disposition: inline
In-Reply-To: <20210628133610.1143-4-bruno.larsen@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--rE3KGW5+m8FRCpxW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 28, 2021 at 10:36:10AM -0300, Bruno Larsen (billionai) wrote:
65;6402;1c> Changed hash64 address translation to use the supplied mmu_idx =
instead
> of using the one stored in the msr, for parity purposes (other book3s
> MMUs already use it).
>=20
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/mmu-hash64.c | 43 ++++++++++++++++++++---------------------
>  target/ppc/mmu-hash64.h |  2 +-
>  target/ppc/mmu_helper.c |  2 +-
>  3 files changed, 23 insertions(+), 24 deletions(-)
>=20
> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> index c1b98a97e9..19832c4b46 100644
> --- a/target/ppc/mmu-hash64.c
> +++ b/target/ppc/mmu-hash64.c
> @@ -366,10 +366,9 @@ static inline int ppc_hash64_pte_noexec_guard(PowerP=
CCPU *cpu,
>  }
> =20
>  /* Check Basic Storage Protection */
> -static int ppc_hash64_pte_prot(PowerPCCPU *cpu,
> +static int ppc_hash64_pte_prot(int mmu_idx,
>                                 ppc_slb_t *slb, ppc_hash_pte64_t pte)
>  {
> -    CPUPPCState *env =3D &cpu->env;
>      unsigned pp, key;
>      /*
>       * Some pp bit combinations have undefined behaviour, so default
> @@ -377,7 +376,7 @@ static int ppc_hash64_pte_prot(PowerPCCPU *cpu,
>       */
>      int prot =3D 0;
> =20
> -    key =3D !!(msr_pr ? (slb->vsid & SLB_VSID_KP)
> +    key =3D !!(mmuidx_pr(mmu_idx) ? (slb->vsid & SLB_VSID_KP)
>               : (slb->vsid & SLB_VSID_KS));
>      pp =3D (pte.pte1 & HPTE64_R_PP) | ((pte.pte1 & HPTE64_R_PP0) >> 61);
> =20
> @@ -744,17 +743,17 @@ static bool ppc_hash64_use_vrma(CPUPPCState *env)
>      }
>  }
> =20
> -static void ppc_hash64_set_isi(CPUState *cs, uint64_t error_code)
> +static void ppc_hash64_set_isi(CPUState *cs, int mmu_idx, uint64_t error=
_code)
>  {
>      CPUPPCState *env =3D &POWERPC_CPU(cs)->env;
>      bool vpm;
> =20
> -    if (msr_ir) {
> +    if (!mmuidx_real(mmu_idx)) {
>          vpm =3D !!(env->spr[SPR_LPCR] & LPCR_VPM1);
>      } else {
>          vpm =3D ppc_hash64_use_vrma(env);
>      }
> -    if (vpm && !msr_hv) {
> +    if (vpm && !mmuidx_hv(mmu_idx)) {
>          cs->exception_index =3D POWERPC_EXCP_HISI;
>      } else {
>          cs->exception_index =3D POWERPC_EXCP_ISI;
> @@ -762,17 +761,17 @@ static void ppc_hash64_set_isi(CPUState *cs, uint64=
_t error_code)
>      env->error_code =3D error_code;
>  }
> =20
> -static void ppc_hash64_set_dsi(CPUState *cs, uint64_t dar, uint64_t dsis=
r)
> +static void ppc_hash64_set_dsi(CPUState *cs, int mmu_idx, uint64_t dar, =
uint64_t dsisr)
>  {
>      CPUPPCState *env =3D &POWERPC_CPU(cs)->env;
>      bool vpm;
> =20
> -    if (msr_dr) {
> +    if (!mmuidx_real(mmu_idx)) {
>          vpm =3D !!(env->spr[SPR_LPCR] & LPCR_VPM1);
>      } else {
>          vpm =3D ppc_hash64_use_vrma(env);
>      }
> -    if (vpm && !msr_hv) {
> +    if (vpm && !mmuidx_hv(mmu_idx)) {
>          cs->exception_index =3D POWERPC_EXCP_HDSI;
>          env->spr[SPR_HDAR] =3D dar;
>          env->spr[SPR_HDSISR] =3D dsisr;
> @@ -874,7 +873,7 @@ static int build_vrma_slbe(PowerPCCPU *cpu, ppc_slb_t=
 *slb)
>  }
> =20
>  bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access=
_type,
> -                      hwaddr *raddrp, int *psizep, int *protp,
> +                      hwaddr *raddrp, int *psizep, int *protp, int mmu_i=
dx,
>                        bool guest_visible)
>  {
>      CPUState *cs =3D CPU(cpu);
> @@ -897,7 +896,7 @@ bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr, M=
MUAccessType access_type,
>       */
> =20
>      /* 1. Handle real mode accesses */
> -    if (access_type =3D=3D MMU_INST_FETCH ? !msr_ir : !msr_dr) {
> +    if (mmuidx_real(mmu_idx)) {
>          /*
>           * Translation is supposedly "off", but in real mode the top 4
>           * effective address bits are (mostly) ignored
> @@ -909,7 +908,7 @@ bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr, M=
MUAccessType access_type,
>               * In virtual hypervisor mode, there's nothing to do:
>               *   EA =3D=3D GPA =3D=3D qemu guest address
>               */
> -        } else if (msr_hv || !env->has_hv_mode) {
> +        } else if (mmuidx_hv(mmu_idx) || !env->has_hv_mode) {
>              /* In HV mode, add HRMOR if top EA bit is clear */
>              if (!(eaddr >> 63)) {
>                  raddr |=3D env->spr[SPR_HRMOR];
> @@ -937,13 +936,13 @@ bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr,=
 MMUAccessType access_type,
>                  }
>                  switch (access_type) {
>                  case MMU_INST_FETCH:
> -                    ppc_hash64_set_isi(cs, SRR1_PROTFAULT);
> +                    ppc_hash64_set_isi(cs, mmu_idx, SRR1_PROTFAULT);
>                      break;
>                  case MMU_DATA_LOAD:
> -                    ppc_hash64_set_dsi(cs, eaddr, DSISR_PROTFAULT);
> +                    ppc_hash64_set_dsi(cs, mmu_idx, eaddr, DSISR_PROTFAU=
LT);
>                      break;
>                  case MMU_DATA_STORE:
> -                    ppc_hash64_set_dsi(cs, eaddr,
> +                    ppc_hash64_set_dsi(cs, mmu_idx, eaddr,
>                                         DSISR_PROTFAULT | DSISR_ISSTORE);
>                      break;
>                  default:
> @@ -996,7 +995,7 @@ bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr, M=
MUAccessType access_type,
>      /* 3. Check for segment level no-execute violation */
>      if (access_type =3D=3D MMU_INST_FETCH && (slb->vsid & SLB_VSID_N)) {
>          if (guest_visible) {
> -            ppc_hash64_set_isi(cs, SRR1_NOEXEC_GUARD);
> +            ppc_hash64_set_isi(cs, mmu_idx, SRR1_NOEXEC_GUARD);
>          }
>          return false;
>      }
> @@ -1009,13 +1008,13 @@ bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eadd=
r, MMUAccessType access_type,
>          }
>          switch (access_type) {
>          case MMU_INST_FETCH:
> -            ppc_hash64_set_isi(cs, SRR1_NOPTE);
> +            ppc_hash64_set_isi(cs, mmu_idx, SRR1_NOPTE);
>              break;
>          case MMU_DATA_LOAD:
> -            ppc_hash64_set_dsi(cs, eaddr, DSISR_NOPTE);
> +            ppc_hash64_set_dsi(cs, mmu_idx, eaddr, DSISR_NOPTE);
>              break;
>          case MMU_DATA_STORE:
> -            ppc_hash64_set_dsi(cs, eaddr, DSISR_NOPTE | DSISR_ISSTORE);
> +            ppc_hash64_set_dsi(cs, mmu_idx, eaddr, DSISR_NOPTE | DSISR_I=
SSTORE);
>              break;
>          default:
>              g_assert_not_reached();
> @@ -1028,7 +1027,7 @@ bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr,=
 MMUAccessType access_type,
>      /* 5. Check access permissions */
> =20
>      exec_prot =3D ppc_hash64_pte_noexec_guard(cpu, pte);
> -    pp_prot =3D ppc_hash64_pte_prot(cpu, slb, pte);
> +    pp_prot =3D ppc_hash64_pte_prot(mmu_idx, slb, pte);
>      amr_prot =3D ppc_hash64_amr_prot(cpu, pte);
>      prot =3D exec_prot & pp_prot & amr_prot;
> =20
> @@ -1049,7 +1048,7 @@ bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr,=
 MMUAccessType access_type,
>              if (PAGE_EXEC & ~amr_prot) {
>                  srr1 |=3D SRR1_IAMR; /* Access violates virt pg class ke=
y prot */
>              }
> -            ppc_hash64_set_isi(cs, srr1);
> +            ppc_hash64_set_isi(cs, mmu_idx, srr1);
>          } else {
>              int dsisr =3D 0;
>              if (need_prot & ~pp_prot) {
> @@ -1061,7 +1060,7 @@ bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr,=
 MMUAccessType access_type,
>              if (need_prot & ~amr_prot) {
>                  dsisr |=3D DSISR_AMR;
>              }
> -            ppc_hash64_set_dsi(cs, eaddr, dsisr);
> +            ppc_hash64_set_dsi(cs, mmu_idx, eaddr, dsisr);
>          }
>          return false;
>      }
> diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
> index 9f338e1fe9..c5b2f97ff7 100644
> --- a/target/ppc/mmu-hash64.h
> +++ b/target/ppc/mmu-hash64.h
> @@ -8,7 +8,7 @@ void dump_slb(PowerPCCPU *cpu);
>  int ppc_store_slb(PowerPCCPU *cpu, target_ulong slot,
>                    target_ulong esid, target_ulong vsid);
>  bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access=
_type,
> -                      hwaddr *raddrp, int *psizep, int *protp,
> +                      hwaddr *raddrp, int *psizep, int *protp, int mmu_i=
dx,
>                        bool guest_visible);
>  void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu,
>                                 target_ulong pte_index,
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index a3381e1aa0..0816c889a3 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -2916,7 +2916,7 @@ static bool ppc_xlate(PowerPCCPU *cpu, vaddr eaddr,=
 MMUAccessType access_type,
>      case POWERPC_MMU_2_06:
>      case POWERPC_MMU_2_07:
>          return ppc_hash64_xlate(cpu, eaddr, access_type,
> -                                raddrp, psizep, protp, guest_visible);
> +                                raddrp, psizep, protp, mmu_idx, guest_vi=
sible);
>  #endif
> =20
>      case POWERPC_MMU_32B:

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rE3KGW5+m8FRCpxW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDiieYACgkQbDjKyiDZ
s5LFtA/7BdzqjdFJJImEUgyCs63eajhc6sa58PFP7l8X9Qy4sgmUHtGECcXS/t64
2SqOhSmhKLYb9RyWtFsQON0uOJOj91/Yfvdfl8cOPxvcmQ8MgvdRRiT8bwV+6fMW
6UQ23XI4GhIaUwIpRfMpUsJdxavRAHUw0IOSgM0PBXeYYOG7q3fkbaIiKU0BI9nJ
1HacXrkEGVJmUKXSsW9XXz784hUfLSERPCqnfRzXgA74IbTfpvlrUsbJsaF25cQx
i18VgksgLakdBFHl3ivH3KyblLTzrfiV6t2KBC7puS0JFjhJ7i7vR4MsFPzycPVh
wxCrC7rqHSM9Mdlnobaz3iPRX6fwBSq0bwCqTg3N/9W15CgmBD5sSN7zQeyvy5yz
nXJ/XNt1mTT8VzpmMAto9PB36+yfA56cczS8Xg/5QrFME7+GJPsHhXotBIO0O67+
twHXaZU/lxIt8qCzJxxuBXOaLPiv+UskxZ+6EUq1dUKIrH3BMMKvlLdTXK7pS+U4
GOXsXC7nFplVgiCh8oRRjSK9Xhgluir/GDeiZ4y9wXTkyh/GP3ntn4LUO5JJNJCB
TLE24xDTh2YziqmeGtTjeOqSeKNc91TI03mBXVtFIws6BxfASeaKa6uklo+4WqLU
ClZCTMt73W/fWiArhbCD+S1puYEmacR9uRdFZgneJab9Xq/SqXU=
=QrBT
-----END PGP SIGNATURE-----

--rE3KGW5+m8FRCpxW--

