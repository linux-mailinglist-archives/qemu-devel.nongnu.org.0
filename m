Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C49953B2808
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 08:57:15 +0200 (CEST)
Received: from localhost ([::1]:52540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwJIY-0002hC-9b
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 02:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lwJAM-0002wL-6I; Thu, 24 Jun 2021 02:48:46 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:32839 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lwJAH-0000UD-N4; Thu, 24 Jun 2021 02:48:45 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G9W1V2cDnz9sRK; Thu, 24 Jun 2021 16:48:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1624517310;
 bh=xLHOK2+i8lCOtQh05H3KM71/0nx85BcAuFb/qmcsL9I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k1r9XHz6Mrw5IOo7FAD7Wb1RozM1DiFzptXdPChWgDcwukTohqhtBdlPGjDj03xPc
 dcGTHlA4Z3GWu4Vbz59N2qUiNDV0zt4J/PfMgdmIAEBKK9UFgikdIgJwF2HiyqOTni
 TxtiM5C43RW/a9BRr8SI6MoFB92RoymTvVLk6eNc=
Date: Thu, 24 Jun 2021 15:55:02 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v2 05/10] target/ppc: Split out ppc_hash64_xlate
Message-ID: <YNQeNi/LW9dw3CX7@yekko>
References: <20210621125115.67717-1-bruno.larsen@eldorado.org.br>
 <20210621125115.67717-6-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3RLX6a793oCF1AuG"
Content-Disposition: inline
In-Reply-To: <20210621125115.67717-6-bruno.larsen@eldorado.org.br>
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


--3RLX6a793oCF1AuG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 21, 2021 at 09:51:10AM -0300, Bruno Larsen (billionai) wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> Mirror the interface of ppc_radix64_xlate, putting all of
> the logic for hash64 translation into a single function.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/mmu-hash64.c | 125 +++++++++++++++++++---------------------
>  1 file changed, 59 insertions(+), 66 deletions(-)
>=20
> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> index 2febd369b1..c6b167b4dc 100644
> --- a/target/ppc/mmu-hash64.c
> +++ b/target/ppc/mmu-hash64.c
> @@ -873,8 +873,10 @@ static int build_vrma_slbe(PowerPCCPU *cpu, ppc_slb_=
t *slb)
>      return -1;
>  }
> =20
> -int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> -                                MMUAccessType access_type, int mmu_idx)
> +static bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr,
> +                             MMUAccessType access_type,
> +                             hwaddr *raddrp, int *psizep, int *protp,
> +                             bool guest_visible)
>  {
>      CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;
> @@ -918,9 +920,11 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vad=
dr eaddr,
>              slb =3D &vrma_slbe;
>              if (build_vrma_slbe(cpu, slb) !=3D 0) {
>                  /* Invalid VRMA setup, machine check */
> -                cs->exception_index =3D POWERPC_EXCP_MCHECK;
> -                env->error_code =3D 0;
> -                return 1;
> +                if (guest_visible) {
> +                    cs->exception_index =3D POWERPC_EXCP_MCHECK;
> +                    env->error_code =3D 0;
> +                }
> +                return false;
>              }
> =20
>              goto skip_slb_search;
> @@ -929,6 +933,9 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vadd=
r eaddr,
> =20
>              /* Emulated old-style RMO mode, bounds check against RMLS */
>              if (raddr >=3D limit) {
> +                if (!guest_visible) {
> +                    return false;
> +                }
>                  switch (access_type) {
>                  case MMU_INST_FETCH:
>                      ppc_hash64_set_isi(cs, SRR1_PROTFAULT);
> @@ -943,15 +950,16 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, va=
ddr eaddr,
>                  default:
>                      g_assert_not_reached();
>                  }
> -                return 1;
> +                return false;
>              }
> =20
>              raddr |=3D env->spr[SPR_RMOR];
>          }
> -        tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_M=
ASK,
> -                     PAGE_READ | PAGE_WRITE | PAGE_EXEC, mmu_idx,
> -                     TARGET_PAGE_SIZE);
> -        return 0;
> +
> +        *raddrp =3D raddr;
> +        *protp =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> +        *psizep =3D TARGET_PAGE_BITS;
> +        return true;
>      }
> =20
>      /* 2. Translation is on, so look up the SLB */
> @@ -964,6 +972,9 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vadd=
r eaddr,
>              exit(1);
>          }
>          /* Segment still not found, generate the appropriate interrupt */
> +        if (!guest_visible) {
> +            return false;
> +        }
>          switch (access_type) {
>          case MMU_INST_FETCH:
>              cs->exception_index =3D POWERPC_EXCP_ISEG;
> @@ -978,20 +989,25 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, va=
ddr eaddr,
>          default:
>              g_assert_not_reached();
>          }
> -        return 1;
> +        return false;
>      }
> =20
> -skip_slb_search:
> + skip_slb_search:
> =20
>      /* 3. Check for segment level no-execute violation */
>      if (access_type =3D=3D MMU_INST_FETCH && (slb->vsid & SLB_VSID_N)) {
> -        ppc_hash64_set_isi(cs, SRR1_NOEXEC_GUARD);
> -        return 1;
> +        if (guest_visible) {
> +            ppc_hash64_set_isi(cs, SRR1_NOEXEC_GUARD);
> +        }
> +        return false;
>      }
> =20
>      /* 4. Locate the PTE in the hash table */
>      ptex =3D ppc_hash64_htab_lookup(cpu, slb, eaddr, &pte, &apshift);
>      if (ptex =3D=3D -1) {
> +        if (!guest_visible) {
> +            return false;
> +        }
>          switch (access_type) {
>          case MMU_INST_FETCH:
>              ppc_hash64_set_isi(cs, SRR1_NOPTE);
> @@ -1005,7 +1021,7 @@ skip_slb_search:
>          default:
>              g_assert_not_reached();
>          }
> -        return 1;
> +        return false;
>      }
>      qemu_log_mask(CPU_LOG_MMU,
>                    "found PTE at index %08" HWADDR_PRIx "\n", ptex);
> @@ -1021,6 +1037,9 @@ skip_slb_search:
>      if (need_prot & ~prot) {
>          /* Access right violation */
>          qemu_log_mask(CPU_LOG_MMU, "PTE access rejected\n");
> +        if (!guest_visible) {
> +            return false;
> +        }
>          if (access_type =3D=3D MMU_INST_FETCH) {
>              int srr1 =3D 0;
>              if (PAGE_EXEC & ~exec_prot) {
> @@ -1045,7 +1064,7 @@ skip_slb_search:
>              }
>              ppc_hash64_set_dsi(cs, eaddr, dsisr);
>          }
> -        return 1;
> +        return false;
>      }
> =20
>      qemu_log_mask(CPU_LOG_MMU, "PTE access granted !\n");
> @@ -1069,66 +1088,40 @@ skip_slb_search:
> =20
>      /* 7. Determine the real address from the PTE */
> =20
> -    raddr =3D deposit64(pte.pte1 & HPTE64_R_RPN, 0, apshift, eaddr);
> -
> -    tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
> -                 prot, mmu_idx, 1ULL << apshift);
> -
> -    return 0;
> +    *raddrp =3D deposit64(pte.pte1 & HPTE64_R_RPN, 0, apshift, eaddr);
> +    *protp =3D prot;
> +    *psizep =3D apshift;
> +    return true;
>  }
> =20
> -hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr)
> +int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> +                                MMUAccessType access_type, int mmu_idx)
>  {
> -    CPUPPCState *env =3D &cpu->env;
> -    ppc_slb_t vrma_slbe;
> -    ppc_slb_t *slb;
> -    hwaddr ptex, raddr;
> -    ppc_hash_pte64_t pte;
> -    unsigned apshift;
> +    CPUState *cs =3D CPU(cpu);
> +    int page_size, prot;
> +    hwaddr raddr;
> =20
> -    /* Handle real mode */
> -    if (msr_dr =3D=3D 0) {
> -        /* In real mode the top 4 effective address bits are ignored */
> -        raddr =3D addr & 0x0FFFFFFFFFFFFFFFULL;
> +    if (!ppc_hash64_xlate(cpu, eaddr, access_type, &raddr,
> +                          &page_size, &prot, true)) {
> +        return 1;
> +    }
> =20
> -        if (cpu->vhyp) {
> -            /*
> -             * In virtual hypervisor mode, there's nothing to do:
> -             *   EA =3D=3D GPA =3D=3D qemu guest address
> -             */
> -            return raddr;
> -        } else if ((msr_hv || !env->has_hv_mode) && !(addr >> 63)) {
> -            /* In HV mode, add HRMOR if top EA bit is clear */
> -            return raddr | env->spr[SPR_HRMOR];
> -        } else if (ppc_hash64_use_vrma(env)) {
> -            /* Emulated VRMA mode */
> -            slb =3D &vrma_slbe;
> -            if (build_vrma_slbe(cpu, slb) !=3D 0) {
> -                return -1;
> -            }
> -        } else {
> -            target_ulong limit =3D rmls_limit(cpu);
> +    tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
> +                 prot, mmu_idx, 1UL << page_size);
> +    return 0;
> +}
> =20
> -            /* Emulated old-style RMO mode, bounds check against RMLS */
> -            if (raddr >=3D limit) {
> -                return -1;
> -            }
> -            return raddr | env->spr[SPR_RMOR];
> -        }
> -    } else {
> -        slb =3D slb_lookup(cpu, addr);
> -        if (!slb) {
> -            return -1;
> -        }
> -    }
> +hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong eadd=
r)
> +{
> +    int psize, prot;
> +    hwaddr raddr;
> =20
> -    ptex =3D ppc_hash64_htab_lookup(cpu, slb, addr, &pte, &apshift);
> -    if (ptex =3D=3D -1) {
> +    if (!ppc_hash64_xlate(cpu, eaddr, MMU_DATA_LOAD, &raddr,
> +                          &psize, &prot, false)) {
>          return -1;
>      }
> =20
> -    return deposit64(pte.pte1 & HPTE64_R_RPN, 0, apshift, addr)
> -        & TARGET_PAGE_MASK;
> +    return raddr & TARGET_PAGE_MASK;
>  }
> =20
>  void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu, target_ulong ptex,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3RLX6a793oCF1AuG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDUHjUACgkQbDjKyiDZ
s5ImvBAAlffukMbFViIdgOhevY99jgXqOZePs+7nKTm+jPtLg1oRWgOyOjZxHG+2
9NWbZ5CpMkITEThV42n/Tggl7nb43UA4FqwQ6QymXyoQMRsKBm4RDJVgZl1JtMJ6
YvPSEIBCdvAaYQdDIKmT69DwuiT22TqMzJf9GAF7akTRKmktC+kywbwUwBL21akR
FCO+0LGyDTjb9lqvnT8Boh87V7s4pZ+gTXT7Gs7UF9rVIsU5BZGqXl608uMoKdhs
5l4g5RpvAvLQ51hWHOBabo5A1+vic8gb/NczcRE4tK5tUQv3+96d3p6NZslT4zyl
CL48y3/Z3HWZu7JIcf9DlZDI/frTV3EGfXAS7RgL8ULgmQ2IwqFWQglbMKYpDGJl
6xlo/OZT+hLwm+2kLReRy8ljLmFOjFORjOEptjBJpu8XytPCDGMC4H6y2XOtyr5/
I53RW+hSIf9/EwXm2AM8zeDMTUnQDHa8nUru832z/tfvxZTrFP3nCWr1nDnNwrsr
kSFh2jMjSiq6l31IF4fJdSXmgSylYx4l7wnEwU/YnermySKn6/tFrGX9FXIpxIoy
FgWygLFssx8O3OWD/IjmA4R9lPO08yGuuiCZdif1MAWMWSIlHLafaBE0GomttBZ3
g0rjeXUMREhBt82WQ0ABKws+nKG2pvRIkGJ6U1JPZOZviTNWd8U=
=/32o
-----END PGP SIGNATURE-----

--3RLX6a793oCF1AuG--

