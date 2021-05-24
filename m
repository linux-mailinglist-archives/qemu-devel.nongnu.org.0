Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3481038DFF1
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 05:49:29 +0200 (CEST)
Received: from localhost ([::1]:41756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll1aq-0000bG-6c
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 23:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll1Yt-0006GZ-3V; Sun, 23 May 2021 23:47:27 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57067 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll1Yq-00039p-5A; Sun, 23 May 2021 23:47:26 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FpNSl3mZQz9sW5; Mon, 24 May 2021 13:47:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621828039;
 bh=p5XM5nStLeEmABgPvavkdfGmhzXJjhlJBgd7aJnVL0I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IKgI6FWfkqTS0K0awnCdzTLCZrs08jiaqMF4qxFQw0SycyTqikcyaX97sC+Frgcdo
 6RbSszVKJUMLE1xtuozxsHcpuHx4TmAzn7kjXJPH4oX+lL9b1pi5/Eb9ePgKAUSOLD
 0LI11iQAndZIpWnkIg5WkDCNCmnYeTaAWkDS0x6s=
Date: Mon, 24 May 2021 13:19:42 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH 22/24] target/ppc: Split out ppc_jumbo_xlate
Message-ID: <YKsbTuLhIkG7jr5z@yekko>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
 <20210518201146.794854-23-richard.henderson@linaro.org>
 <18cfdfb1-a14e-c880-43ac-479fdaf6395d@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DOmuhlTtHgCbeWzZ"
Content-Disposition: inline
In-Reply-To: <18cfdfb1-a14e-c880-43ac-479fdaf6395d@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--DOmuhlTtHgCbeWzZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 03:40:15PM -0300, Bruno Piazera Larsen wrote:
>=20
> On 18/05/2021 17:11, Richard Henderson wrote:
> > Mirror the interface of ppc_radix64_xlate (mostly), putting all
> > of the logic for older mmu translation into a single entry point.
> > For booke, we need to add mmu_idx to the xlate-style interface.
> >=20
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Out of my depth again, but testing seems fine, so

In this case you want "Tested-by" rather than "Acked-by".

> Acked-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
>=20
> > ---
> >   target/ppc/mmu_helper.c | 181 +++++++++++++++++++++-------------------
> >   1 file changed, 97 insertions(+), 84 deletions(-)
> >=20
> > diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> > index 863e556a22..68c2e59238 100644
> > --- a/target/ppc/mmu_helper.c
> > +++ b/target/ppc/mmu_helper.c
> > @@ -1427,48 +1427,6 @@ static int get_physical_address(CPUPPCState *env=
, mmu_ctx_t *ctx,
> >       return get_physical_address_wtlb(env, ctx, eaddr, access_type, ty=
pe, 0);
> >   }
> > -hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
> > -{
> > -    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> > -    CPUPPCState *env =3D &cpu->env;
> > -    mmu_ctx_t ctx;
> > -
> > -    switch (env->mmu_model) {
> > -#if defined(TARGET_PPC64)
> > -    case POWERPC_MMU_64B:
> > -    case POWERPC_MMU_2_03:
> > -    case POWERPC_MMU_2_06:
> > -    case POWERPC_MMU_2_07:
> > -        return ppc_hash64_get_phys_page_debug(cpu, addr);
> > -    case POWERPC_MMU_3_00:
> > -        return ppc64_v3_get_phys_page_debug(cpu, addr);
> > -#endif
> > -
> > -    case POWERPC_MMU_32B:
> > -    case POWERPC_MMU_601:
> > -        return ppc_hash32_get_phys_page_debug(cpu, addr);
> > -
> > -    default:
> > -        ;
> > -    }
> > -
> > -    if (unlikely(get_physical_address(env, &ctx, addr, MMU_DATA_LOAD,
> > -                                      ACCESS_INT) !=3D 0)) {
> > -
> > -        /*
> > -         * Some MMUs have separate TLBs for code and data. If we only
> > -         * try an ACCESS_INT, we may not be able to read instructions
> > -         * mapped by code TLBs, so we also try a ACCESS_CODE.
> > -         */
> > -        if (unlikely(get_physical_address(env, &ctx, addr, MMU_INST_FE=
TCH,
> > -                                          ACCESS_CODE) !=3D 0)) {
> > -            return -1;
> > -        }
> > -    }
> > -
> > -    return ctx.raddr & TARGET_PAGE_MASK;
> > -}
> > -
> >   static void booke206_update_mas_tlb_miss(CPUPPCState *env, target_ulo=
ng address,
> >                                            MMUAccessType access_type, i=
nt mmu_idx)
> >   {
> > @@ -1524,30 +1482,38 @@ static void booke206_update_mas_tlb_miss(CPUPPC=
State *env, target_ulong address,
> >   }
> >   /* Perform address translation */
> > -static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong add=
ress,
> > -                                    MMUAccessType access_type, int mmu=
_idx)
> > +/* TODO: Split this by mmu_model. */
> > +static bool ppc_jumbo_xlate(PowerPCCPU *cpu, vaddr eaddr,
> > +                            MMUAccessType access_type,
> > +                            hwaddr *raddrp, int *psizep, int *protp,
> > +                            int mmu_idx, bool guest_visible)
> >   {
> > -    CPUState *cs =3D env_cpu(env);
> > -    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> > +    CPUState *cs =3D CPU(cpu);
> > +    CPUPPCState *env =3D &cpu->env;
> >       mmu_ctx_t ctx;
> >       int type;
> > -    int ret =3D 0;
> > +    int ret;
> >       if (access_type =3D=3D MMU_INST_FETCH) {
> >           /* code access */
> >           type =3D ACCESS_CODE;
> > -    } else {
> > +    } else if (guest_visible) {
> >           /* data access */
> >           type =3D env->access_type;
> > +    } else {
> > +        type =3D ACCESS_INT;
> >       }
> > -    ret =3D get_physical_address_wtlb(env, &ctx, address, access_type,
> > +
> > +    ret =3D get_physical_address_wtlb(env, &ctx, eaddr, access_type,
> >                                       type, mmu_idx);
> >       if (ret =3D=3D 0) {
> > -        tlb_set_page(cs, address & TARGET_PAGE_MASK,
> > -                     ctx.raddr & TARGET_PAGE_MASK, ctx.prot,
> > -                     mmu_idx, TARGET_PAGE_SIZE);
> > -        ret =3D 0;
> > -    } else if (ret < 0) {
> > +        *raddrp =3D ctx.raddr;
> > +        *protp =3D ctx.prot;
> > +        *psizep =3D TARGET_PAGE_BITS;
> > +        return true;
> > +    }
> > +
> > +    if (guest_visible) {
> >           LOG_MMU_STATE(cs);
> >           if (type =3D=3D ACCESS_CODE) {
> >               switch (ret) {
> > @@ -1557,7 +1523,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *=
env, target_ulong address,
> >                   case POWERPC_MMU_SOFT_6xx:
> >                       cs->exception_index =3D POWERPC_EXCP_IFTLB;
> >                       env->error_code =3D 1 << 18;
> > -                    env->spr[SPR_IMISS] =3D address;
> > +                    env->spr[SPR_IMISS] =3D eaddr;
> >                       env->spr[SPR_ICMP] =3D 0x80000000 | ctx.ptem;
> >                       goto tlb_miss;
> >                   case POWERPC_MMU_SOFT_74xx:
> > @@ -1567,29 +1533,25 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState=
 *env, target_ulong address,
> >                   case POWERPC_MMU_SOFT_4xx_Z:
> >                       cs->exception_index =3D POWERPC_EXCP_ITLB;
> >                       env->error_code =3D 0;
> > -                    env->spr[SPR_40x_DEAR] =3D address;
> > +                    env->spr[SPR_40x_DEAR] =3D eaddr;
> >                       env->spr[SPR_40x_ESR] =3D 0x00000000;
> >                       break;
> >                   case POWERPC_MMU_BOOKE206:
> > -                    booke206_update_mas_tlb_miss(env, address, 2, mmu_=
idx);
> > +                    booke206_update_mas_tlb_miss(env, eaddr, 2, mmu_id=
x);
> >                       /* fall through */
> >                   case POWERPC_MMU_BOOKE:
> >                       cs->exception_index =3D POWERPC_EXCP_ITLB;
> >                       env->error_code =3D 0;
> > -                    env->spr[SPR_BOOKE_DEAR] =3D address;
> > +                    env->spr[SPR_BOOKE_DEAR] =3D eaddr;
> >                       env->spr[SPR_BOOKE_ESR] =3D mmubooke206_esr(mmu_i=
dx, MMU_DATA_LOAD);
> > -                    return -1;
> > -                case POWERPC_MMU_MPC8xx:
> > -                    /* XXX: TODO */
> > -                    cpu_abort(cs, "MPC8xx MMU model is not implemented=
\n");
> >                       break;
> > +                case POWERPC_MMU_MPC8xx:
> > +                    cpu_abort(cs, "MPC8xx MMU model is not implemented=
\n");
> >                   case POWERPC_MMU_REAL:
> >                       cpu_abort(cs, "PowerPC in real mode should never =
raise "
> >                                 "any MMU exceptions\n");
> > -                    return -1;
> >                   default:
> >                       cpu_abort(cs, "Unknown or invalid MMU model\n");
> > -                    return -1;
> >                   }
> >                   break;
> >               case -2:
> > @@ -1626,7 +1588,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *=
env, target_ulong address,
> >                           cs->exception_index =3D POWERPC_EXCP_DLTLB;
> >                           env->error_code =3D 0;
> >                       }
> > -                    env->spr[SPR_DMISS] =3D address;
> > +                    env->spr[SPR_DMISS] =3D eaddr;
> >                       env->spr[SPR_DCMP] =3D 0x80000000 | ctx.ptem;
> >                   tlb_miss:
> >                       env->error_code |=3D ctx.key << 19;
> > @@ -1644,7 +1606,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *=
env, target_ulong address,
> >                   tlb_miss_74xx:
> >                       /* Implement LRU algorithm */
> >                       env->error_code =3D ctx.key << 19;
> > -                    env->spr[SPR_TLBMISS] =3D (address & ~((target_ulo=
ng)0x3)) |
> > +                    env->spr[SPR_TLBMISS] =3D (eaddr & ~((target_ulong=
)0x3)) |
> >                           ((env->last_way + 1) & (env->nb_ways - 1));
> >                       env->spr[SPR_PTEHI] =3D 0x80000000 | ctx.ptem;
> >                       break;
> > @@ -1652,7 +1614,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *=
env, target_ulong address,
> >                   case POWERPC_MMU_SOFT_4xx_Z:
> >                       cs->exception_index =3D POWERPC_EXCP_DTLB;
> >                       env->error_code =3D 0;
> > -                    env->spr[SPR_40x_DEAR] =3D address;
> > +                    env->spr[SPR_40x_DEAR] =3D eaddr;
> >                       if (access_type =3D=3D MMU_DATA_STORE) {
> >                           env->spr[SPR_40x_ESR] =3D 0x00800000;
> >                       } else {
> > @@ -1662,23 +1624,20 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState=
 *env, target_ulong address,
> >                   case POWERPC_MMU_MPC8xx:
> >                       /* XXX: TODO */
> >                       cpu_abort(cs, "MPC8xx MMU model is not implemente=
d\n");
> > -                    break;
> >                   case POWERPC_MMU_BOOKE206:
> > -                    booke206_update_mas_tlb_miss(env, address, access_=
type, mmu_idx);
> > +                    booke206_update_mas_tlb_miss(env, eaddr, access_ty=
pe, mmu_idx);
> >                       /* fall through */
> >                   case POWERPC_MMU_BOOKE:
> >                       cs->exception_index =3D POWERPC_EXCP_DTLB;
> >                       env->error_code =3D 0;
> > -                    env->spr[SPR_BOOKE_DEAR] =3D address;
> > +                    env->spr[SPR_BOOKE_DEAR] =3D eaddr;
> >                       env->spr[SPR_BOOKE_ESR] =3D mmubooke206_esr(mmu_i=
dx, access_type);
> > -                    return -1;
> > +                    break;
> >                   case POWERPC_MMU_REAL:
> >                       cpu_abort(cs, "PowerPC in real mode should never =
raise "
> >                                 "any MMU exceptions\n");
> > -                    return -1;
> >                   default:
> >                       cpu_abort(cs, "Unknown or invalid MMU model\n");
> > -                    return -1;
> >                   }
> >                   break;
> >               case -2:
> > @@ -1687,16 +1646,16 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState=
 *env, target_ulong address,
> >                   env->error_code =3D 0;
> >                   if (env->mmu_model =3D=3D POWERPC_MMU_SOFT_4xx
> >                       || env->mmu_model =3D=3D POWERPC_MMU_SOFT_4xx_Z) {
> > -                    env->spr[SPR_40x_DEAR] =3D address;
> > +                    env->spr[SPR_40x_DEAR] =3D eaddr;
> >                       if (access_type =3D=3D MMU_DATA_STORE) {
> >                           env->spr[SPR_40x_ESR] |=3D 0x00800000;
> >                       }
> >                   } else if ((env->mmu_model =3D=3D POWERPC_MMU_BOOKE) =
||
> >                              (env->mmu_model =3D=3D POWERPC_MMU_BOOKE20=
6)) {
> > -                    env->spr[SPR_BOOKE_DEAR] =3D address;
> > +                    env->spr[SPR_BOOKE_DEAR] =3D eaddr;
> >                       env->spr[SPR_BOOKE_ESR] =3D mmubooke206_esr(mmu_i=
dx, access_type);
> >                   } else {
> > -                    env->spr[SPR_DAR] =3D address;
> > +                    env->spr[SPR_DAR] =3D eaddr;
> >                       if (access_type =3D=3D MMU_DATA_STORE) {
> >                           env->spr[SPR_DSISR] =3D 0x0A000000;
> >                       } else {
> > @@ -1711,13 +1670,13 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState=
 *env, target_ulong address,
> >                       /* Floating point load/store */
> >                       cs->exception_index =3D POWERPC_EXCP_ALIGN;
> >                       env->error_code =3D POWERPC_EXCP_ALIGN_FP;
> > -                    env->spr[SPR_DAR] =3D address;
> > +                    env->spr[SPR_DAR] =3D eaddr;
> >                       break;
> >                   case ACCESS_RES:
> >                       /* lwarx, ldarx or stwcx. */
> >                       cs->exception_index =3D POWERPC_EXCP_DSI;
> >                       env->error_code =3D 0;
> > -                    env->spr[SPR_DAR] =3D address;
> > +                    env->spr[SPR_DAR] =3D eaddr;
> >                       if (access_type =3D=3D MMU_DATA_STORE) {
> >                           env->spr[SPR_DSISR] =3D 0x06000000;
> >                       } else {
> > @@ -1728,7 +1687,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *=
env, target_ulong address,
> >                       /* eciwx or ecowx */
> >                       cs->exception_index =3D POWERPC_EXCP_DSI;
> >                       env->error_code =3D 0;
> > -                    env->spr[SPR_DAR] =3D address;
> > +                    env->spr[SPR_DAR] =3D eaddr;
> >                       if (access_type =3D=3D MMU_DATA_STORE) {
> >                           env->spr[SPR_DSISR] =3D 0x06100000;
> >                       } else {
> > @@ -1740,16 +1699,14 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState=
 *env, target_ulong address,
> >                       cs->exception_index =3D POWERPC_EXCP_PROGRAM;
> >                       env->error_code =3D
> >                           POWERPC_EXCP_INVAL | POWERPC_EXCP_INVAL_INVAL;
> > -                    env->spr[SPR_DAR] =3D address;
> > +                    env->spr[SPR_DAR] =3D eaddr;
> >                       break;
> >                   }
> >                   break;
> >               }
> >           }
> > -        ret =3D 1;
> >       }
> > -
> > -    return ret;
> > +    return false;
> >   }
> >   /********************************************************************=
*********/
> > @@ -2958,6 +2915,62 @@ void helper_check_tlb_flush_global(CPUPPCState *=
env)
> >   /********************************************************************=
*********/
> > +static int cpu_ppc_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> > +                                    MMUAccessType access_type, int mmu=
_idx)
> > +{
> > +    CPUState *cs =3D CPU(cpu);
> > +    int page_size, prot;
> > +    hwaddr raddr;
> > +
> > +    if (!ppc_jumbo_xlate(cpu, eaddr, access_type, &raddr,
> > +                         &page_size, &prot, mmu_idx, true)) {
> > +        return 1;
> > +    }
> > +
> > +    tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MAS=
K,
> > +                 prot, mmu_idx, 1UL << page_size);
> > +    return 0;
> > +}
> > +
> > +hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
> > +{
> > +    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> > +    CPUPPCState *env =3D &cpu->env;
> > +    hwaddr raddr;
> > +    int s, p;
> > +
> > +    switch (env->mmu_model) {
> > +#if defined(TARGET_PPC64)
> > +    case POWERPC_MMU_64B:
> > +    case POWERPC_MMU_2_03:
> > +    case POWERPC_MMU_2_06:
> > +    case POWERPC_MMU_2_07:
> > +        return ppc_hash64_get_phys_page_debug(cpu, addr);
> > +    case POWERPC_MMU_3_00:
> > +        return ppc64_v3_get_phys_page_debug(cpu, addr);
> > +#endif
> > +
> > +    case POWERPC_MMU_32B:
> > +    case POWERPC_MMU_601:
> > +        return ppc_hash32_get_phys_page_debug(cpu, addr);
> > +
> > +    default:
> > +        ;
> > +    }
> > +
> > +    /*
> > +     * Some MMUs have separate TLBs for code and data. If we only
> > +     * try an MMU_DATA_LOAD, we may not be able to read instructions
> > +     * mapped by code TLBs, so we also try a MMU_INST_FETCH.
> > +     */
> > +    if (ppc_jumbo_xlate(cpu, addr, MMU_DATA_LOAD, &raddr, &s, &p, 0, f=
alse) ||
> > +        ppc_jumbo_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p, 0, =
false)) {
> > +        return raddr & TARGET_PAGE_MASK;
> > +    }
> > +    return -1;
> > +}
> > +
> > +
> >   bool ppc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
> >                         MMUAccessType access_type, int mmu_idx,
> >                         bool probe, uintptr_t retaddr)
> > @@ -2985,7 +2998,7 @@ bool ppc_cpu_tlb_fill(CPUState *cs, vaddr addr, i=
nt size,
> >           break;
> >       default:
> > -        ret =3D cpu_ppc_handle_mmu_fault(env, addr, access_type, mmu_i=
dx);
> > +        ret =3D cpu_ppc_handle_mmu_fault(cpu, addr, access_type, mmu_i=
dx);
> >           break;
> >       }
> >       if (unlikely(ret !=3D 0)) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DOmuhlTtHgCbeWzZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCrG04ACgkQbDjKyiDZ
s5IxnQ//U6RPtbUfn5Hq5qQWuiEXhwxkEAQLfDxR2ykUJKGiAROtu+lXvBlOBlbS
XaiAHRb8cI1JUwzOxWZ2q3mhOWMK4nP51NA4Rg0gIcYcCy712mRwoUY3h4Yi0j9U
wPgfgwW5ExE1R3FQquYL0t/ZJwm3bYJH0Ok+CSbvLeRzAhUxAjqVd8SprO6XkZvR
tZefn7WACu+BoXWB9oImJXFFu2WAqcEGpz7aZzFJiKL6qn4uZKSn2ele4SF6R1ad
JGXrv+hSkWECUYffpx/7o5SYJ4Qv0Pg+j+ehLvmBqJ7jpLoaZUXvovT71d2clSBD
kDfCiZ+pCAhwNG/yQTwvVhwHB8wAHYkhLDoSBxecyVy44VriLmtifxJKrZbK5hy1
Q55oMAfiFdOBU2NJ8ugQ0szF9+FiiJxVwDuNxLQcbinEKr6HJnNYLjXmyEm0tcj+
oZ9KxPFAqk50m0gECLuqoRN2wq4dXA8drvyNpR1xcmUfgK50kbsvGAmapzugtZY7
p9rhbfXmDfGdISW+0kICWeYs7d8DcqTd4uFcJySnkX4qmhBDF4pSoxUeRAbI/+dm
v96LTKpVTjOAqlyu0AqfT9fkhwTSKQi5KUPlTWRev0YE8B5mXRYihhdj46u8L6p6
dNhmmjYooXYoOLhWnf67jdnPmI9H4Ql3iztuwLbb4Z55JdKfj04=
=3CuB
-----END PGP SIGNATURE-----

--DOmuhlTtHgCbeWzZ--

