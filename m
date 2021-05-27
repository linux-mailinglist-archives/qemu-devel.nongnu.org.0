Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B46A2392492
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 03:52:05 +0200 (CEST)
Received: from localhost ([::1]:56000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm5Bs-0003cn-QO
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 21:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lm58O-0005wr-OW; Wed, 26 May 2021 21:48:28 -0400
Received: from ozlabs.org ([203.11.71.1]:38013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lm58M-0001k1-7K; Wed, 26 May 2021 21:48:28 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fr9gy6f6zz9sW7; Thu, 27 May 2021 11:48:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622080094;
 bh=NOh5fQbU7mlfLswUdyWROcPC0+3hWyzZ67SVS++efvw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nvF0q+bI4xAfDdveca38kJkiaTToRItQw70wZqrDQpw6vwP/HHxcr9O0IJ+4pZbaq
 cvez9plzZ2TAO8X+6NNDN+rOLOijdhronZkNYb8/fMIVLC0kIJnaKmnWkcXbDBQvX1
 L7N+xT6i3r2CyR2EXiKQsdrVcIgULhhAFGQ6UFVQ=
Date: Thu, 27 May 2021 11:13:32 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH] target/ppc: fold ppc_store_ptcr into it's only caller
Message-ID: <YK7yPJCY4DQ9umiQ@yekko>
References: <20210526143516.125582-1-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tXbCr37ujpbVfDaz"
Content-Disposition: inline
In-Reply-To: <20210526143516.125582-1-bruno.larsen@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--tXbCr37ujpbVfDaz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2021 at 11:35:16AM -0300, Bruno Larsen (billionai) wrote:
> ppc_store_ptcr, defined in mmu_helper.c, was only used by
> helper_store_ptcr, in misc_helper.c. To avoid possible confusion,
> the function was folded into the helper.
>=20
> Signed-off-by: Bruno Larsen (billionai)
> <bruno.larsen@eldorado.org.br>

LGTM, applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/cpu.h         |  1 -
>  target/ppc/misc_helper.c | 24 +++++++++++++++++++++++-
>  target/ppc/mmu_helper.c  | 28 ----------------------------
>  3 files changed, 23 insertions(+), 30 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 203f07e48e..f39f5e0fff 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1290,7 +1290,6 @@ bool ppc_cpu_tlb_fill(CPUState *cs, vaddr address, =
int size,
> =20
>  #if !defined(CONFIG_USER_ONLY)
>  void ppc_store_sdr1(CPUPPCState *env, target_ulong value);
> -void ppc_store_ptcr(CPUPPCState *env, target_ulong value);
>  #endif /* !defined(CONFIG_USER_ONLY) */
>  void ppc_store_msr(CPUPPCState *env, target_ulong value);
>  void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val);
> diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
> index 442b12652c..c33f5f39b9 100644
> --- a/target/ppc/misc_helper.c
> +++ b/target/ppc/misc_helper.c
> @@ -23,6 +23,7 @@
>  #include "exec/helper-proto.h"
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
> +#include "mmu-book3s-v3.h"
> =20
>  #include "helper_regs.h"
> =20
> @@ -116,7 +117,28 @@ void helper_store_sdr1(CPUPPCState *env, target_ulon=
g val)
>  void helper_store_ptcr(CPUPPCState *env, target_ulong val)
>  {
>      if (env->spr[SPR_PTCR] !=3D val) {
> -        ppc_store_ptcr(env, val);
> +        PowerPCCPU *cpu =3D env_archcpu(env);
> +        target_ulong ptcr_mask =3D PTCR_PATB | PTCR_PATS;
> +        target_ulong patbsize =3D val & PTCR_PATS;
> +
> +        qemu_log_mask(CPU_LOG_MMU, "%s: " TARGET_FMT_lx "\n", __func__, =
val);
> +
> +        assert(!cpu->vhyp);
> +        assert(env->mmu_model & POWERPC_MMU_3_00);
> +
> +        if (val & ~ptcr_mask) {
> +            error_report("Invalid bits 0x"TARGET_FMT_lx" set in PTCR",
> +                         val & ~ptcr_mask);
> +            val &=3D ptcr_mask;
> +        }
> +
> +        if (patbsize > 24) {
> +            error_report("Invalid Partition Table size 0x" TARGET_FMT_lx
> +                         " stored in PTCR", patbsize);
> +            return;
> +        }
> +
> +        env->spr[SPR_PTCR] =3D val;
>          tlb_flush(env_cpu(env));
>      }
>  }
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index 5395e5ee5a..d45936be49 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -1987,34 +1987,6 @@ void ppc_tlb_invalidate_one(CPUPPCState *env, targ=
et_ulong addr)
> =20
>  /***********************************************************************=
******/
>  /* Special registers manipulation */
> -#if defined(TARGET_PPC64)
> -void ppc_store_ptcr(CPUPPCState *env, target_ulong value)
> -{
> -    PowerPCCPU *cpu =3D env_archcpu(env);
> -    target_ulong ptcr_mask =3D PTCR_PATB | PTCR_PATS;
> -    target_ulong patbsize =3D value & PTCR_PATS;
> -
> -    qemu_log_mask(CPU_LOG_MMU, "%s: " TARGET_FMT_lx "\n", __func__, valu=
e);
> -
> -    assert(!cpu->vhyp);
> -    assert(env->mmu_model & POWERPC_MMU_3_00);
> -
> -    if (value & ~ptcr_mask) {
> -        error_report("Invalid bits 0x"TARGET_FMT_lx" set in PTCR",
> -                     value & ~ptcr_mask);
> -        value &=3D ptcr_mask;
> -    }
> -
> -    if (patbsize > 24) {
> -        error_report("Invalid Partition Table size 0x" TARGET_FMT_lx
> -                     " stored in PTCR", patbsize);
> -        return;
> -    }
> -
> -    env->spr[SPR_PTCR] =3D value;
> -}
> -
> -#endif /* defined(TARGET_PPC64) */
> =20
>  /* Segment registers load and store */
>  target_ulong helper_load_sr(CPUPPCState *env, target_ulong sr_num)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tXbCr37ujpbVfDaz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCu8jwACgkQbDjKyiDZ
s5I9MRAAkPiU91fTeDHXdEYep//o4gJolnRyVVGSLZOjqtKEauVVTGbnL1wnmR0o
IHxOCyW9X/tlxZvfyjLw8UPpTL8VMEKYUod84t1FFgM0fQUsGFnEgYltZNiJczNh
0MFAWPD5MlaBtA0r7jn6MlWfYDURuv5Jq8P+towapkkpvkSEMO+f2R9id9e57vRi
Alc+fXoB9EreU8z7N9JwHqnrf73mSQA228jwR9H+NLopNvXYazDj54t8KwGO4hXT
l36D2uTAIHKBwqy5w9ANEJ/RvXRD/Ycd6J21tnynHGr6lyr0HqRqVMaZGZXcZSjq
swNKuNBppzE9iGeaooAA4vHjSy5dUkAmeNIByDXHk+UsEekFqIMfHNqWAMh8SnN5
OSQvoY4BTmfbOGlkU2lNEkz88RuPjAzc2DgFVuy3ZBXNvpsNsTnK4ChSLHVkjqAH
K9oxfEMfda1QgxIfgX6aJ3PTEtSo08/a9HRX3t3p9dRcNQD5pCJx08iSwhoYjnS8
w/wJVpMpPtYOIjJNS1UWju9+15BUgsA2bRzN+fTl7SnHtqsC9aZD7pIJLUYODDmx
K+MCrf7hVVkDLrqmoq7MkA8f34Oqk6idkanHzSuTP2bhFwaSZ5SELtpyL++Q/0BW
kQbx2hstJmGQwwwp+RU8Bw2A0xaKdeBsmWnzDS+O9Z3TQj2euX0=
=WERj
-----END PGP SIGNATURE-----

--tXbCr37ujpbVfDaz--

