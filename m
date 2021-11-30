Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B60EA462A16
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 03:01:40 +0100 (CET)
Received: from localhost ([::1]:57254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrsSh-0001rv-9q
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 21:01:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mrsNg-00089w-Ix; Mon, 29 Nov 2021 20:56:28 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=54875
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mrsNd-0006b1-Or; Mon, 29 Nov 2021 20:56:28 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4J35101Vbxz4xRB; Tue, 30 Nov 2021 12:56:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1638237380;
 bh=JnQnrzo7VA+lsllUOt3nBabJa9ScdflGyDQYICaBPTs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AEJtQV6fraPtF9B1Vxj/IchbbLWpYyAS/IDRRYX3fkPaZSJ3lxvHuyvl8rVznP+t3
 h2hJII7lYrN7UpZRHnZvC4iROfhECQd63FSYL0ypMyg4S7uiDbqtpGGQrnvn5YbQc/
 m+YrsEfSYNgtjFkwAyJOI78mOdSLxu3fwdheo7CM=
Date: Tue, 30 Nov 2021 11:30:52 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: Re: [PATCH v4] target/ppc: fix Hash64 MMU update of PTE bit R
Message-ID: <YaVwvAyhyhlIYhV5@yekko>
References: <20211129185751.25355-1-leandro.lupori@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tZ7zIIgy7HAJXbfD"
Content-Disposition: inline
In-Reply-To: <20211129185751.25355-1-leandro.lupori@eldorado.org.br>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: groug@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--tZ7zIIgy7HAJXbfD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 29, 2021 at 03:57:51PM -0300, Leandro Lupori wrote:
> When updating the R bit of a PTE, the Hash64 MMU was using a wrong byte
> offset, causing the first byte of the adjacent PTE to be corrupted.
> This caused a panic when booting FreeBSD, using the Hash MMU.
>=20
> Fixes: a2dd4e83e76b ("ppc/hash64: Rework R and C bit updates")
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Thanks for your patience with our nitpicking :).

> ---
> Changes from v3:
> - rename defines
> ---
>  hw/ppc/spapr.c          | 8 ++++----
>  hw/ppc/spapr_softmmu.c  | 2 +-
>  target/ppc/mmu-hash64.c | 4 ++--
>  target/ppc/mmu-hash64.h | 5 +++++
>  4 files changed, 12 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 163c90388a..3b5fd749be 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1414,7 +1414,7 @@ void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
>          kvmppc_write_hpte(ptex, pte0, pte1);
>      } else {
>          if (pte0 & HPTE64_V_VALID) {
> -            stq_p(spapr->htab + offset + HASH_PTE_SIZE_64 / 2, pte1);
> +            stq_p(spapr->htab + offset + HPTE64_DW1, pte1);
>              /*
>               * When setting valid, we write PTE1 first. This ensures
>               * proper synchronization with the reading code in
> @@ -1430,7 +1430,7 @@ void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
>               * ppc_hash64_pteg_search()
>               */
>              smp_wmb();
> -            stq_p(spapr->htab + offset + HASH_PTE_SIZE_64 / 2, pte1);
> +            stq_p(spapr->htab + offset + HPTE64_DW1, pte1);
>          }
>      }
>  }
> @@ -1438,7 +1438,7 @@ void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
>  static void spapr_hpte_set_c(PPCVirtualHypervisor *vhyp, hwaddr ptex,
>                               uint64_t pte1)
>  {
> -    hwaddr offset =3D ptex * HASH_PTE_SIZE_64 + 15;
> +    hwaddr offset =3D ptex * HASH_PTE_SIZE_64 + HPTE64_DW1_C;
>      SpaprMachineState *spapr =3D SPAPR_MACHINE(vhyp);
> =20
>      if (!spapr->htab) {
> @@ -1454,7 +1454,7 @@ static void spapr_hpte_set_c(PPCVirtualHypervisor *=
vhyp, hwaddr ptex,
>  static void spapr_hpte_set_r(PPCVirtualHypervisor *vhyp, hwaddr ptex,
>                               uint64_t pte1)
>  {
> -    hwaddr offset =3D ptex * HASH_PTE_SIZE_64 + 14;
> +    hwaddr offset =3D ptex * HASH_PTE_SIZE_64 + HPTE64_DW1_R;
>      SpaprMachineState *spapr =3D SPAPR_MACHINE(vhyp);
> =20
>      if (!spapr->htab) {
> diff --git a/hw/ppc/spapr_softmmu.c b/hw/ppc/spapr_softmmu.c
> index f8924270ef..4ee03c83e4 100644
> --- a/hw/ppc/spapr_softmmu.c
> +++ b/hw/ppc/spapr_softmmu.c
> @@ -426,7 +426,7 @@ static void new_hpte_store(void *htab, uint64_t pteg,=
 int slot,
>      addr +=3D slot * HASH_PTE_SIZE_64;
> =20
>      stq_p(addr, pte0);
> -    stq_p(addr + HASH_PTE_SIZE_64 / 2, pte1);
> +    stq_p(addr + HPTE64_DW1, pte1);
>  }
> =20
>  static int rehash_hpte(PowerPCCPU *cpu,
> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> index 19832c4b46..da9fe99ff8 100644
> --- a/target/ppc/mmu-hash64.c
> +++ b/target/ppc/mmu-hash64.c
> @@ -786,7 +786,7 @@ static void ppc_hash64_set_dsi(CPUState *cs, int mmu_=
idx, uint64_t dar, uint64_t
> =20
>  static void ppc_hash64_set_r(PowerPCCPU *cpu, hwaddr ptex, uint64_t pte1)
>  {
> -    hwaddr base, offset =3D ptex * HASH_PTE_SIZE_64 + 16;
> +    hwaddr base, offset =3D ptex * HASH_PTE_SIZE_64 + HPTE64_DW1_R;
> =20
>      if (cpu->vhyp) {
>          PPCVirtualHypervisorClass *vhc =3D
> @@ -803,7 +803,7 @@ static void ppc_hash64_set_r(PowerPCCPU *cpu, hwaddr =
ptex, uint64_t pte1)
> =20
>  static void ppc_hash64_set_c(PowerPCCPU *cpu, hwaddr ptex, uint64_t pte1)
>  {
> -    hwaddr base, offset =3D ptex * HASH_PTE_SIZE_64 + 15;
> +    hwaddr base, offset =3D ptex * HASH_PTE_SIZE_64 + HPTE64_DW1_C;
> =20
>      if (cpu->vhyp) {
>          PPCVirtualHypervisorClass *vhc =3D
> diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
> index c5b2f97ff7..1496955d38 100644
> --- a/target/ppc/mmu-hash64.h
> +++ b/target/ppc/mmu-hash64.h
> @@ -97,6 +97,11 @@ void ppc_hash64_finalize(PowerPCCPU *cpu);
>  #define HPTE64_V_1TB_SEG        0x4000000000000000ULL
>  #define HPTE64_V_VRMA_MASK      0x4001ffffff000000ULL
> =20
> +/* PTE offsets */
> +#define HPTE64_DW1              (HASH_PTE_SIZE_64 / 2)
> +#define HPTE64_DW1_R            (HPTE64_DW1 + 6)
> +#define HPTE64_DW1_C            (HPTE64_DW1 + 7)
> +
>  /* Format changes for ARCH v3 */
>  #define HPTE64_V_COMMON_BITS    0x000fffffffffffffULL
>  #define HPTE64_R_3_0_SSIZE_SHIFT 58

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tZ7zIIgy7HAJXbfD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGlcLoACgkQbDjKyiDZ
s5LIgw//RhsKTptuDSH/UXHAmvU6uzmREIbBgMZwDS1bbzLk37Oz2ZP0wRfJcsqL
Ni+5pheLD7JH2r2aMUzfsQbuvWCnnoOZuwzP3UMeU1hjKH3xMssp+jCAC6AdqqWb
C/rtwLLx4mGOLubUj689T/bHVx2mK3HfxYGsN3SvteAu5XtqADXi4I8H8U1a1Y1+
TqpQtXM9r5tFkNThWXjxBeW4eLTmJnJy2fX6DcW2SRKDwyJlMnVHvAJzoS0YMfaA
eXzZwHTbcrWp6Ukbk51X7FrvTMaT0/3+D+hLnP8nbbVM8BQJxwalRjiVL150pjr1
7dhiW4VjsmcJVCBHpNL0Gy/TbAr7Zhe6Y6JrvQTuNh0/NHBzN2DB4HQi2GKQV22K
YuuWjWw9/3XKRP86dmf0OMYFiJapy3DH2clQ2CYHp5+4wNJ8URy6HcxrecglMXt8
eaVWefu1aiW8I3izQ3swyJl7SfbtJ91HKwi1Ao/jXV8CIl5vMNSo5mg8EzAsEpir
lt8lGw+6xeHd8Q8mH1EuyEm54swoNYSNm9GJxnqceCRn+pidNyi1RrD6vukMte6O
m4BDZA9JrGdQ5lo+2rddIAYe+IRvrgfDGhBmqObJW2oKnrHjZjr3psumeMr7DBLm
GqvicrOmKab8u4fKqgcxg248hXbcD+Mb5TVhsK2JL4Mrjc174jk=
=vDyI
-----END PGP SIGNATURE-----

--tZ7zIIgy7HAJXbfD--

