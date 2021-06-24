Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A0D3B2807
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 08:57:04 +0200 (CEST)
Received: from localhost ([::1]:51714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwJIN-00023Y-As
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 02:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lwJAM-0002we-Cn; Thu, 24 Jun 2021 02:48:46 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:39197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lwJAH-0000UB-Ic; Thu, 24 Jun 2021 02:48:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G9W1V3073z9sT6; Thu, 24 Jun 2021 16:48:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1624517310;
 bh=8vmgFuIstK3NcqB7z2kIq379STgE0LGtavc3tJlkeSU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S75egp6wVpTVSv+jCctJw+sdv3S56c/NfOlU10c9kosRim24/Is9fMPW1SPhvsXuD
 HNQeIjadvl4QhVAz07CT0STb3BipKwETz8SlJSBFKV8xOf4RRkdSZzpuwGHlZy3Qm+
 JF2z8Rb63KZ6B6/SrBgyKLp5OBQdW3kRlXWUwOpY=
Date: Thu, 24 Jun 2021 16:30:47 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v2 07/10] target/ppc: Split out ppc_jumbo_xlate
Message-ID: <YNQml4olwaspHlnp@yekko>
References: <20210621125115.67717-1-bruno.larsen@eldorado.org.br>
 <20210621125115.67717-8-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wk9M20qvZ6U1I42Y"
Content-Disposition: inline
In-Reply-To: <20210621125115.67717-8-bruno.larsen@eldorado.org.br>
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
Cc: farosas@linux.ibm.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, clg@kaod.org, matheus.ferst@eldorado.org.br,
 luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--wk9M20qvZ6U1I42Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 21, 2021 at 09:51:12AM -0300, Bruno Larsen (billionai) wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> Mirror the interface of ppc_radix64_xlate (mostly), putting all
> of the logic for older mmu translation into a single entry point.
> For booke, we need to add mmu_idx to the xlate-style interface.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.1.  So, I noticed reviewing this that the
existing debug path is wrong - a bunch of the get_physical_address()
functions make guest visible state changes.  Oh well, this doesn't
make it any worse.

> ---
>  target/ppc/mmu_helper.c | 179 +++++++++++++++++++++-------------------
>  1 file changed, 96 insertions(+), 83 deletions(-)
>=20
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index c4b1c93e47..2e92deb105 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -1435,48 +1435,6 @@ static int get_physical_address(CPUPPCState *env, =
mmu_ctx_t *ctx,
>  }
>  #endif
> =20
> -hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
> -{
> -    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> -    CPUPPCState *env =3D &cpu->env;
> -    mmu_ctx_t ctx;
> -
> -    switch (env->mmu_model) {
> -#if defined(TARGET_PPC64)
> -    case POWERPC_MMU_64B:
> -    case POWERPC_MMU_2_03:
> -    case POWERPC_MMU_2_06:
> -    case POWERPC_MMU_2_07:
> -        return ppc_hash64_get_phys_page_debug(cpu, addr);
> -    case POWERPC_MMU_3_00:
> -        return ppc64_v3_get_phys_page_debug(cpu, addr);
> -#endif
> -
> -    case POWERPC_MMU_32B:
> -    case POWERPC_MMU_601:
> -        return ppc_hash32_get_phys_page_debug(cpu, addr);
> -
> -    default:
> -        ;
> -    }
> -
> -    if (unlikely(get_physical_address(env, &ctx, addr, MMU_DATA_LOAD,
> -                                      ACCESS_INT) !=3D 0)) {
> -
> -        /*
> -         * Some MMUs have separate TLBs for code and data. If we only
> -         * try an ACCESS_INT, we may not be able to read instructions
> -         * mapped by code TLBs, so we also try a ACCESS_CODE.
> -         */
> -        if (unlikely(get_physical_address(env, &ctx, addr, MMU_INST_FETC=
H,
> -                                          ACCESS_CODE) !=3D 0)) {
> -            return -1;
> -        }
> -    }
> -
> -    return ctx.raddr & TARGET_PAGE_MASK;
> -}
> -
>  static void booke206_update_mas_tlb_miss(CPUPPCState *env, target_ulong =
address,
>                                           MMUAccessType access_type, int =
mmu_idx)
>  {
> @@ -1532,30 +1490,38 @@ static void booke206_update_mas_tlb_miss(CPUPPCSt=
ate *env, target_ulong address,
>  }
> =20
>  /* Perform address translation */
> -static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong addre=
ss,
> -                                    MMUAccessType access_type, int mmu_i=
dx)
> +/* TODO: Split this by mmu_model. */
> +static bool ppc_jumbo_xlate(PowerPCCPU *cpu, vaddr eaddr,
> +                            MMUAccessType access_type,
> +                            hwaddr *raddrp, int *psizep, int *protp,
> +                            int mmu_idx, bool guest_visible)
>  {
> -    CPUState *cs =3D env_cpu(env);
> -    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> +    CPUState *cs =3D CPU(cpu);
> +    CPUPPCState *env =3D &cpu->env;
>      mmu_ctx_t ctx;
>      int type;
> -    int ret =3D 0;
> +    int ret;
> =20
>      if (access_type =3D=3D MMU_INST_FETCH) {
>          /* code access */
>          type =3D ACCESS_CODE;
> -    } else {
> +    } else if (guest_visible) {
>          /* data access */
>          type =3D env->access_type;
> +    } else {
> +        type =3D ACCESS_INT;
>      }
> -    ret =3D get_physical_address_wtlb(env, &ctx, address, access_type,
> +
> +    ret =3D get_physical_address_wtlb(env, &ctx, eaddr, access_type,
>                                      type, mmu_idx);
>      if (ret =3D=3D 0) {
> -        tlb_set_page(cs, address & TARGET_PAGE_MASK,
> -                     ctx.raddr & TARGET_PAGE_MASK, ctx.prot,
> -                     mmu_idx, TARGET_PAGE_SIZE);
> -        ret =3D 0;
> -    } else if (ret < 0) {
> +        *raddrp =3D ctx.raddr;
> +        *protp =3D ctx.prot;
> +        *psizep =3D TARGET_PAGE_BITS;
> +        return true;
> +    }
> +
> +    if (guest_visible) {
>          LOG_MMU_STATE(cs);
>          if (type =3D=3D ACCESS_CODE) {
>              switch (ret) {
> @@ -1565,7 +1531,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *en=
v, target_ulong address,
>                  case POWERPC_MMU_SOFT_6xx:
>                      cs->exception_index =3D POWERPC_EXCP_IFTLB;
>                      env->error_code =3D 1 << 18;
> -                    env->spr[SPR_IMISS] =3D address;
> +                    env->spr[SPR_IMISS] =3D eaddr;
>                      env->spr[SPR_ICMP] =3D 0x80000000 | ctx.ptem;
>                      goto tlb_miss;
>                  case POWERPC_MMU_SOFT_74xx:
> @@ -1575,29 +1541,25 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *=
env, target_ulong address,
>                  case POWERPC_MMU_SOFT_4xx_Z:
>                      cs->exception_index =3D POWERPC_EXCP_ITLB;
>                      env->error_code =3D 0;
> -                    env->spr[SPR_40x_DEAR] =3D address;
> +                    env->spr[SPR_40x_DEAR] =3D eaddr;
>                      env->spr[SPR_40x_ESR] =3D 0x00000000;
>                      break;
>                  case POWERPC_MMU_BOOKE206:
> -                    booke206_update_mas_tlb_miss(env, address, 2, mmu_id=
x);
> +                    booke206_update_mas_tlb_miss(env, eaddr, 2, mmu_idx);
>                      /* fall through */
>                  case POWERPC_MMU_BOOKE:
>                      cs->exception_index =3D POWERPC_EXCP_ITLB;
>                      env->error_code =3D 0;
> -                    env->spr[SPR_BOOKE_DEAR] =3D address;
> +                    env->spr[SPR_BOOKE_DEAR] =3D eaddr;
>                      env->spr[SPR_BOOKE_ESR] =3D mmubooke206_esr(mmu_idx,=
 MMU_DATA_LOAD);
> -                    return -1;
> +                    break;
>                  case POWERPC_MMU_MPC8xx:
> -                    /* XXX: TODO */
>                      cpu_abort(cs, "MPC8xx MMU model is not implemented\n=
");
> -                    break;
>                  case POWERPC_MMU_REAL:
>                      cpu_abort(cs, "PowerPC in real mode should never rai=
se "
>                                "any MMU exceptions\n");
> -                    return -1;
>                  default:
>                      cpu_abort(cs, "Unknown or invalid MMU model\n");
> -                    return -1;
>                  }
>                  break;
>              case -2:
> @@ -1634,7 +1596,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *en=
v, target_ulong address,
>                          cs->exception_index =3D POWERPC_EXCP_DLTLB;
>                          env->error_code =3D 0;
>                      }
> -                    env->spr[SPR_DMISS] =3D address;
> +                    env->spr[SPR_DMISS] =3D eaddr;
>                      env->spr[SPR_DCMP] =3D 0x80000000 | ctx.ptem;
>                  tlb_miss:
>                      env->error_code |=3D ctx.key << 19;
> @@ -1652,7 +1614,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *en=
v, target_ulong address,
>                  tlb_miss_74xx:
>                      /* Implement LRU algorithm */
>                      env->error_code =3D ctx.key << 19;
> -                    env->spr[SPR_TLBMISS] =3D (address & ~((target_ulong=
)0x3)) |
> +                    env->spr[SPR_TLBMISS] =3D (eaddr & ~((target_ulong)0=
x3)) |
>                          ((env->last_way + 1) & (env->nb_ways - 1));
>                      env->spr[SPR_PTEHI] =3D 0x80000000 | ctx.ptem;
>                      break;
> @@ -1660,7 +1622,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *en=
v, target_ulong address,
>                  case POWERPC_MMU_SOFT_4xx_Z:
>                      cs->exception_index =3D POWERPC_EXCP_DTLB;
>                      env->error_code =3D 0;
> -                    env->spr[SPR_40x_DEAR] =3D address;
> +                    env->spr[SPR_40x_DEAR] =3D eaddr;
>                      if (access_type =3D=3D MMU_DATA_STORE) {
>                          env->spr[SPR_40x_ESR] =3D 0x00800000;
>                      } else {
> @@ -1670,23 +1632,20 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *=
env, target_ulong address,
>                  case POWERPC_MMU_MPC8xx:
>                      /* XXX: TODO */
>                      cpu_abort(cs, "MPC8xx MMU model is not implemented\n=
");
> -                    break;
>                  case POWERPC_MMU_BOOKE206:
> -                    booke206_update_mas_tlb_miss(env, address, access_ty=
pe, mmu_idx);
> +                    booke206_update_mas_tlb_miss(env, eaddr, access_type=
, mmu_idx);
>                      /* fall through */
>                  case POWERPC_MMU_BOOKE:
>                      cs->exception_index =3D POWERPC_EXCP_DTLB;
>                      env->error_code =3D 0;
> -                    env->spr[SPR_BOOKE_DEAR] =3D address;
> +                    env->spr[SPR_BOOKE_DEAR] =3D eaddr;
>                      env->spr[SPR_BOOKE_ESR] =3D mmubooke206_esr(mmu_idx,=
 access_type);
> -                    return -1;
> +                    break;
>                  case POWERPC_MMU_REAL:
>                      cpu_abort(cs, "PowerPC in real mode should never rai=
se "
>                                "any MMU exceptions\n");
> -                    return -1;
>                  default:
>                      cpu_abort(cs, "Unknown or invalid MMU model\n");
> -                    return -1;
>                  }
>                  break;
>              case -2:
> @@ -1695,16 +1654,16 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *=
env, target_ulong address,
>                  env->error_code =3D 0;
>                  if (env->mmu_model =3D=3D POWERPC_MMU_SOFT_4xx
>                      || env->mmu_model =3D=3D POWERPC_MMU_SOFT_4xx_Z) {
> -                    env->spr[SPR_40x_DEAR] =3D address;
> +                    env->spr[SPR_40x_DEAR] =3D eaddr;
>                      if (access_type =3D=3D MMU_DATA_STORE) {
>                          env->spr[SPR_40x_ESR] |=3D 0x00800000;
>                      }
>                  } else if ((env->mmu_model =3D=3D POWERPC_MMU_BOOKE) ||
>                             (env->mmu_model =3D=3D POWERPC_MMU_BOOKE206))=
 {
> -                    env->spr[SPR_BOOKE_DEAR] =3D address;
> +                    env->spr[SPR_BOOKE_DEAR] =3D eaddr;
>                      env->spr[SPR_BOOKE_ESR] =3D mmubooke206_esr(mmu_idx,=
 access_type);
>                  } else {
> -                    env->spr[SPR_DAR] =3D address;
> +                    env->spr[SPR_DAR] =3D eaddr;
>                      if (access_type =3D=3D MMU_DATA_STORE) {
>                          env->spr[SPR_DSISR] =3D 0x0A000000;
>                      } else {
> @@ -1719,13 +1678,13 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *=
env, target_ulong address,
>                      /* Floating point load/store */
>                      cs->exception_index =3D POWERPC_EXCP_ALIGN;
>                      env->error_code =3D POWERPC_EXCP_ALIGN_FP;
> -                    env->spr[SPR_DAR] =3D address;
> +                    env->spr[SPR_DAR] =3D eaddr;
>                      break;
>                  case ACCESS_RES:
>                      /* lwarx, ldarx or stwcx. */
>                      cs->exception_index =3D POWERPC_EXCP_DSI;
>                      env->error_code =3D 0;
> -                    env->spr[SPR_DAR] =3D address;
> +                    env->spr[SPR_DAR] =3D eaddr;
>                      if (access_type =3D=3D MMU_DATA_STORE) {
>                          env->spr[SPR_DSISR] =3D 0x06000000;
>                      } else {
> @@ -1736,7 +1695,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *en=
v, target_ulong address,
>                      /* eciwx or ecowx */
>                      cs->exception_index =3D POWERPC_EXCP_DSI;
>                      env->error_code =3D 0;
> -                    env->spr[SPR_DAR] =3D address;
> +                    env->spr[SPR_DAR] =3D eaddr;
>                      if (access_type =3D=3D MMU_DATA_STORE) {
>                          env->spr[SPR_DSISR] =3D 0x06100000;
>                      } else {
> @@ -1748,16 +1707,14 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *=
env, target_ulong address,
>                      cs->exception_index =3D POWERPC_EXCP_PROGRAM;
>                      env->error_code =3D
>                          POWERPC_EXCP_INVAL | POWERPC_EXCP_INVAL_INVAL;
> -                    env->spr[SPR_DAR] =3D address;
> +                    env->spr[SPR_DAR] =3D eaddr;
>                      break;
>                  }
>                  break;
>              }
>          }
> -        ret =3D 1;
>      }
> -
> -    return ret;
> +    return false;
>  }
> =20
>  #ifdef CONFIG_TCG
> @@ -2942,6 +2899,62 @@ void helper_check_tlb_flush_global(CPUPPCState *en=
v)
> =20
>  /***********************************************************************=
******/
> =20
> +static int cpu_ppc_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> +                                    MMUAccessType access_type, int mmu_i=
dx)
> +{
> +    CPUState *cs =3D CPU(cpu);
> +    int page_size, prot;
> +    hwaddr raddr;
> +
> +    if (!ppc_jumbo_xlate(cpu, eaddr, access_type, &raddr,
> +                         &page_size, &prot, mmu_idx, true)) {
> +        return 1;
> +    }
> +
> +    tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
> +                 prot, mmu_idx, 1UL << page_size);
> +    return 0;
> +}
> +
> +hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
> +{
> +    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> +    CPUPPCState *env =3D &cpu->env;
> +    hwaddr raddr;
> +    int s, p;
> +
> +    switch (env->mmu_model) {
> +#if defined(TARGET_PPC64)
> +    case POWERPC_MMU_64B:
> +    case POWERPC_MMU_2_03:
> +    case POWERPC_MMU_2_06:
> +    case POWERPC_MMU_2_07:
> +        return ppc_hash64_get_phys_page_debug(cpu, addr);
> +    case POWERPC_MMU_3_00:
> +        return ppc64_v3_get_phys_page_debug(cpu, addr);
> +#endif
> +
> +    case POWERPC_MMU_32B:
> +    case POWERPC_MMU_601:
> +        return ppc_hash32_get_phys_page_debug(cpu, addr);
> +
> +    default:
> +        ;
> +    }
> +
> +    /*
> +     * Some MMUs have separate TLBs for code and data. If we only
> +     * try an MMU_DATA_LOAD, we may not be able to read instructions
> +     * mapped by code TLBs, so we also try a MMU_INST_FETCH.
> +     */
> +    if (ppc_jumbo_xlate(cpu, addr, MMU_DATA_LOAD, &raddr, &s, &p, 0, fal=
se) ||
> +        ppc_jumbo_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p, 0, fa=
lse)) {
> +        return raddr & TARGET_PAGE_MASK;
> +    }
> +    return -1;
> +}
> +
> +
>  bool ppc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
>                        MMUAccessType access_type, int mmu_idx,
>                        bool probe, uintptr_t retaddr)
> @@ -2969,7 +2982,7 @@ bool ppc_cpu_tlb_fill(CPUState *cs, vaddr addr, int=
 size,
>          break;
> =20
>      default:
> -        ret =3D cpu_ppc_handle_mmu_fault(env, addr, access_type, mmu_idx=
);
> +        ret =3D cpu_ppc_handle_mmu_fault(cpu, addr, access_type, mmu_idx=
);
>          break;
>      }
>      if (unlikely(ret !=3D 0)) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wk9M20qvZ6U1I42Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDUJpUACgkQbDjKyiDZ
s5IELxAAkXmFtzr3aC3ScCyd+oBMQNuivFUmWof9VEbvoqXK2Rd4X5zmhuRit5l8
ZxUd+hTxdYS+t33SdeX5FZVHycRxxa2iJiJQvwbPh/UGmD2KNaAIPFRKX21Hsun0
T6cylBpnq4VRzpo18TqR/BA0C4aJPF6eSYAZiWUPFf67R6Uru6Y9tk2GGc+Vcxri
S5QdqUM1Mbvj6J5Uzh0ltBkzxWQBo5Hy7e+/ej4Xv4T6c8c8DtomLusAryTDq8sR
lwE6o5hWYLVUWvzZgWYte9JUNjRKmA3hdQG7M1f7y0z0IwslVbnXQH9js4f+q05J
hNXXepNV2q+bqHJU6XcyMG6WhE7z//6jab/gUsV16bSmpZnZ/tdtxLpsPaL9X9AF
Pipvoe4Nt6YA5NvegSK+b67QXkdECFa1ir2paGJKDd4b/QqXvn+J74FrZ3XnpKIp
mgJU9kyRt+TyIhbuboPinjJszNCOxQaFYQsReVvXKNAOl8DCufrWFaOcB5I+HzII
pigOL2gYRqfyYcqSMxfiNqSTHpbhcJki/dgzAEPWS2sGO2h21FnsBZGv7//vmFrO
R1aISlPAWQI98951HLxCJNdCeHpca8sid77Ll1ZzmIZ0Wivxzvv5nIHwTxLmDRxX
DEm7B5vIqJtup2XF/0xY7m25ZvnK0GMoZWou7VR8WyIMtoB//uU=
=LyAr
-----END PGP SIGNATURE-----

--wk9M20qvZ6U1I42Y--

