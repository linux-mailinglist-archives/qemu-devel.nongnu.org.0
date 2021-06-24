Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 080EF3B269E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 06:54:05 +0200 (CEST)
Received: from localhost ([::1]:58712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwHNL-0004fQ-Fs
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 00:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lwHLq-0002Iv-31; Thu, 24 Jun 2021 00:52:30 -0400
Received: from ozlabs.org ([203.11.71.1]:43145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lwHLn-0003Q6-9o; Thu, 24 Jun 2021 00:52:29 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G9SRS6T4Zz9sXJ; Thu, 24 Jun 2021 14:52:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1624510340;
 bh=R4Oz/bem0JvDqxaFPvDa7EDCIJAYZ6MJmhB9HrRJWVY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B5k3SUhaoscz3KVoXi3QoowsedGveIxYb4uJMieXtJj+V34XDXAt97qycVHC52SPj
 SjskUwtMOsCK0c7FtoGRJ5m7pkUDXnaAd9b9IZRdPV5LtrAHEL2HAq/liy/nM21XfD
 2iF1vZQPkJyU925U5NUlwAlM5M1hQ40VyOBbjcsI=
Date: Thu, 24 Jun 2021 13:19:28 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v2 02/10] target/ppc: Use MMUAccessType with
 *_handle_mmu_fault
Message-ID: <YNP5wNLe/7OqMMaT@yekko>
References: <20210621125115.67717-1-bruno.larsen@eldorado.org.br>
 <20210621125115.67717-3-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AtcIxi2wfOpPN63h"
Content-Disposition: inline
In-Reply-To: <20210621125115.67717-3-bruno.larsen@eldorado.org.br>
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
Cc: farosas@linux.ibm.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, clg@kaod.org, matheus.ferst@eldorado.org.br,
 luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--AtcIxi2wfOpPN63h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 21, 2021 at 09:51:07AM -0300, Bruno Larsen (billionai) wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> These changes were waiting until we didn't need to match
> the function type of PowerPCCPUClass.handle_mmu_fault.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/mmu-hash32.c  | 7 ++-----
>  target/ppc/mmu-hash32.h  | 4 ++--
>  target/ppc/mmu-hash64.c  | 6 +-----
>  target/ppc/mmu-hash64.h  | 4 ++--
>  target/ppc/mmu-radix64.c | 7 ++-----
>  target/ppc/mmu-radix64.h | 4 ++--
>  6 files changed, 11 insertions(+), 21 deletions(-)
>=20
> diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
> index 9f0a497657..8f19b43e47 100644
> --- a/target/ppc/mmu-hash32.c
> +++ b/target/ppc/mmu-hash32.c
> @@ -415,8 +415,8 @@ static hwaddr ppc_hash32_pte_raddr(target_ulong sr, p=
pc_hash_pte32_t pte,
>      return (rpn & ~mask) | (eaddr & mask);
>  }
> =20
> -int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
> -                                int mmu_idx)
> +int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> +                                MMUAccessType access_type, int mmu_idx)
>  {
>      CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;
> @@ -425,11 +425,8 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vad=
dr eaddr, int rwx,
>      ppc_hash_pte32_t pte;
>      int prot;
>      int need_prot;
> -    MMUAccessType access_type;
>      hwaddr raddr;
> =20
> -    assert((rwx =3D=3D 0) || (rwx =3D=3D 1) || (rwx =3D=3D 2));
> -    access_type =3D rwx;
>      need_prot =3D prot_for_access_type(access_type);
> =20
>      /* 1. Handle real mode accesses */
> diff --git a/target/ppc/mmu-hash32.h b/target/ppc/mmu-hash32.h
> index 898021f0d8..30e35718a7 100644
> --- a/target/ppc/mmu-hash32.h
> +++ b/target/ppc/mmu-hash32.h
> @@ -5,8 +5,8 @@
> =20
>  hwaddr get_pteg_offset32(PowerPCCPU *cpu, hwaddr hash);
>  hwaddr ppc_hash32_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr=
);
> -int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr address, int rw,
> -                                int mmu_idx);
> +int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr address,
> +                                MMUAccessType access_type, int mmu_idx);
> =20
>  /*
>   * Segment register definitions
> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> index 708dffc31b..2febd369b1 100644
> --- a/target/ppc/mmu-hash64.c
> +++ b/target/ppc/mmu-hash64.c
> @@ -874,7 +874,7 @@ static int build_vrma_slbe(PowerPCCPU *cpu, ppc_slb_t=
 *slb)
>  }
> =20
>  int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> -                                int rwx, int mmu_idx)
> +                                MMUAccessType access_type, int mmu_idx)
>  {
>      CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;
> @@ -884,13 +884,9 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vad=
dr eaddr,
>      hwaddr ptex;
>      ppc_hash_pte64_t pte;
>      int exec_prot, pp_prot, amr_prot, prot;
> -    MMUAccessType access_type;
>      int need_prot;
>      hwaddr raddr;
> =20
> -    assert((rwx =3D=3D 0) || (rwx =3D=3D 1) || (rwx =3D=3D 2));
> -    access_type =3D rwx;
> -
>      /*
>       * Note on LPCR usage: 970 uses HID4, but our special variant of
>       * store_spr copies relevant fields into env->spr[SPR_LPCR].
> diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
> index 4b8b8e7950..3e8a8eec1f 100644
> --- a/target/ppc/mmu-hash64.h
> +++ b/target/ppc/mmu-hash64.h
> @@ -8,8 +8,8 @@ void dump_slb(PowerPCCPU *cpu);
>  int ppc_store_slb(PowerPCCPU *cpu, target_ulong slot,
>                    target_ulong esid, target_ulong vsid);
>  hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr=
);
> -int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr address, int rw,
> -                                int mmu_idx);
> +int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr address,
> +                                MMUAccessType access_type, int mmu_idx);
>  void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu,
>                                 target_ulong pte_index,
>                                 target_ulong pte0, target_ulong pte1);
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index b6d191c1d8..1c707d387d 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -555,19 +555,16 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr=
 eaddr,
>      return 0;
>  }
> =20
> -int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
> -                                 int mmu_idx)
> +int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> +                                 MMUAccessType access_type, int mmu_idx)
>  {
>      CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;
>      int page_size, prot;
>      bool relocation;
> -    MMUAccessType access_type;
>      hwaddr raddr;
> =20
>      assert(!(msr_hv && cpu->vhyp));
> -    assert((rwx =3D=3D 0) || (rwx =3D=3D 1) || (rwx =3D=3D 2));
> -    access_type =3D rwx;
> =20
>      relocation =3D (access_type =3D=3D MMU_INST_FETCH ? msr_ir : msr_dr);
>      /* HV or virtual hypervisor Real Mode Access */
> diff --git a/target/ppc/mmu-radix64.h b/target/ppc/mmu-radix64.h
> index f28c5794d0..94bd72cb38 100644
> --- a/target/ppc/mmu-radix64.h
> +++ b/target/ppc/mmu-radix64.h
> @@ -44,8 +44,8 @@
> =20
>  #ifdef TARGET_PPC64
> =20
> -int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
> -                                 int mmu_idx);
> +int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> +                                 MMUAccessType access_type, int mmu_idx);
>  hwaddr ppc_radix64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong add=
r);
> =20
>  static inline int ppc_radix64_get_prot_eaa(uint64_t pte)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--AtcIxi2wfOpPN63h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDT+b8ACgkQbDjKyiDZ
s5K3AxAAlXeGCU6dUPya6F0XsMjW1Poa0DxXLR4NNOp9dLDYwD2B2ryVDrz2rMMy
01tZSpFctFzYOaSZZh34DagfWG8oVypxmLFkHDoii33LAHuMir58OefAGQfQhyfg
1y5d0lcCPtdZf4pEosl6KfBr2r/E9tmQylFRz77K8L7X4hsSyKbhcS74VnYxY3tj
oIjyNB7C0J+O6FKZRtCIEnUAIAPaRMRe0p/RDiOTxqGBt74SwsaJanxeBeDGAgeg
xo/GUR8Tg1FwUoQboVbYNgNJilljy4ttxostmNHGItaBdzYr/99E1QkwYE/4tK3A
0we14ck7xpM4eEE8pYDf593Tsx5+A64DYWbvhKQn48G1QH7JAdfLm+ig93VVkwjL
D9oQ4nCA3pB1kKP5pdHR2lyqhdVOU6FeJ8z1lP3kgFM4nIWePn7LWRMF690vCEqR
JqVt07G87ZMvhYTHMZjqYfDqiHGpmECV2xvAzEmVby5XBcaTJcWzSj29mTN2KYUD
kOy+D1kYiF4GR/Ik1yp5q3l53pHvuKKg9DVfIlldUbcYXwyX85TbkxBRTOFhVZNp
Etv2cNKca7JE9FzHkdCIJKQ0RxhOAQhhkRYDuYeeamfZYsc59ctEIoTPPli2kz8j
cbz1SJlu5c3M1CvDWxOdzB4k1vP4zr2RkXHgmHdtAjJkZfP5BLM=
=DoCv
-----END PGP SIGNATURE-----

--AtcIxi2wfOpPN63h--

