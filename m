Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8588C37F217
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 06:25:04 +0200 (CEST)
Received: from localhost ([::1]:37106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh2uF-0001e2-IH
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 00:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sM-00079l-Oy; Thu, 13 May 2021 00:23:10 -0400
Received: from ozlabs.org ([203.11.71.1]:33103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sK-0004NW-8E; Thu, 13 May 2021 00:23:06 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fgdms1jm3z9sfG; Thu, 13 May 2021 14:22:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620879773;
 bh=Ca+VzzdNRlY3L4/byttyfa8kaEnNbDHi1oiKcqqsReI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gz0kDQsvLFwv+Qhfna/kI5+DbgWAeG4iXmDkwjOnfzPHhW5Ieodz/YO1mc+XCQlhf
 msiS5qo7y/T7X+m8xI2Fe/9LxspUFkJ71PcId7Eid7tQx8Y6qqWlffPq0/sDiD27PG
 cGSQl5S/sneZG5FDg7pnJ2zbWvZ+FhXnRvrhIo5Q=
Date: Thu, 13 May 2021 13:48:40 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH 01/11] target/ppc: created ppc_{store,get}_vscr for
 generic vscr usage
Message-ID: <YJyhmJTLiylQU1le@yekko>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-2-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="a7Xyw1yVe3tGJdxX"
Content-Disposition: inline
In-Reply-To: <20210512140813.112884-2-bruno.larsen@eldorado.org.br>
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--a7Xyw1yVe3tGJdxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 11:08:03AM -0300, Bruno Larsen (billionai) wrote:
> Some functions unrelated to TCG use helper_m{t,f}vscr, so generic versions
> of those functions were added to cpu.c, in preparation for compilation
> without TCG
>=20
> Signed-off-by: Bruno Larsen (billionai)
> <bruno.larsen@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/arch_dump.c  |  3 +--
>  target/ppc/cpu.c        | 16 ++++++++++++++++
>  target/ppc/cpu.h        |  2 ++
>  target/ppc/cpu_init.c   |  2 +-
>  target/ppc/gdbstub.c    |  4 ++--
>  target/ppc/int_helper.c |  9 ++-------
>  6 files changed, 24 insertions(+), 12 deletions(-)
>=20
> diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
> index 9ab04b2c38..9210e61ef4 100644
> --- a/target/ppc/arch_dump.c
> +++ b/target/ppc/arch_dump.c
> @@ -17,7 +17,6 @@
>  #include "elf.h"
>  #include "sysemu/dump.h"
>  #include "sysemu/kvm.h"
> -#include "exec/helper-proto.h"
> =20
>  #ifdef TARGET_PPC64
>  #define ELFCLASS ELFCLASS64
> @@ -176,7 +175,7 @@ static void ppc_write_elf_vmxregset(NoteFuncArg *arg,=
 PowerPCCPU *cpu)
>              vmxregset->avr[i].u64[1] =3D avr->u64[1];
>          }
>      }
> -    vmxregset->vscr.u32[3] =3D cpu_to_dump32(s, helper_mfvscr(&cpu->env)=
);
> +    vmxregset->vscr.u32[3] =3D cpu_to_dump32(s, ppc_get_vscr(&cpu->env));
>  }
> =20
>  static void ppc_write_elf_vsxregset(NoteFuncArg *arg, PowerPCCPU *cpu)
> diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
> index e501a7ff6f..cb794e9f4f 100644
> --- a/target/ppc/cpu.c
> +++ b/target/ppc/cpu.c
> @@ -20,6 +20,7 @@
>  #include "qemu/osdep.h"
>  #include "cpu.h"
>  #include "cpu-models.h"
> +#include "fpu/softfloat-helpers.h"
> =20
>  target_ulong cpu_read_xer(CPUPPCState *env)
>  {
> @@ -45,3 +46,18 @@ void cpu_write_xer(CPUPPCState *env, target_ulong xer)
>                         (1ul << XER_OV) | (1ul << XER_CA) |
>                         (1ul << XER_OV32) | (1ul << XER_CA32));
>  }
> +
> +void ppc_store_vscr(CPUPPCState *env, uint32_t vscr)
> +{
> +    env->vscr =3D vscr & ~(1u << VSCR_SAT);
> +    /* Which bit we set is completely arbitrary, but clear the rest.  */
> +    env->vscr_sat.u64[0] =3D vscr & (1u << VSCR_SAT);
> +    env->vscr_sat.u64[1] =3D 0;
> +    set_flush_to_zero((vscr >> VSCR_NJ) & 1, &env->vec_status);
> +}
> +
> +uint32_t ppc_get_vscr(CPUPPCState *env)
> +{
> +    uint32_t sat =3D (env->vscr_sat.u64[0] | env->vscr_sat.u64[1]) !=3D =
0;
> +    return env->vscr | (sat << VSCR_SAT);
> +}
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 98fcf1c4d6..f43ceec5cb 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -2651,4 +2651,6 @@ static inline bool ppc_has_spr(PowerPCCPU *cpu, int=
 spr)
>  void dump_mmu(CPUPPCState *env);
> =20
>  void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int le=
n);
> +void ppc_store_vscr(CPUPPCState *env, uint32_t vscr);
> +uint32_t ppc_get_vscr(CPUPPCState *env);
>  #endif /* PPC_CPU_H */
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index faece1dca2..b4a2d15c6a 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -55,7 +55,7 @@ static inline void vscr_init(CPUPPCState *env, uint32_t=
 val)
>  {
>      /* Altivec always uses round-to-nearest */
>      set_float_rounding_mode(float_round_nearest_even, &env->vec_status);
> -    helper_mtvscr(env, val);
> +    ppc_store_vscr(env, val);
>  }
> =20
>  /**
> diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
> index 94a7273ee0..9339e7eafe 100644
> --- a/target/ppc/gdbstub.c
> +++ b/target/ppc/gdbstub.c
> @@ -498,7 +498,7 @@ static int gdb_get_avr_reg(CPUPPCState *env, GByteArr=
ay *buf, int n)
>          return 16;
>      }
>      if (n =3D=3D 32) {
> -        gdb_get_reg32(buf, helper_mfvscr(env));
> +        gdb_get_reg32(buf, ppc_get_vscr(env));
>          mem_buf =3D gdb_get_reg_ptr(buf, 4);
>          ppc_maybe_bswap_register(env, mem_buf, 4);
>          return 4;
> @@ -529,7 +529,7 @@ static int gdb_set_avr_reg(CPUPPCState *env, uint8_t =
*mem_buf, int n)
>      }
>      if (n =3D=3D 32) {
>          ppc_maybe_bswap_register(env, mem_buf, 4);
> -        helper_mtvscr(env, ldl_p(mem_buf));
> +        ppc_store_vscr(env, ldl_p(mem_buf));
>          return 4;
>      }
>      if (n =3D=3D 33) {
> diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
> index a44c2d90ea..41f8477d4b 100644
> --- a/target/ppc/int_helper.c
> +++ b/target/ppc/int_helper.c
> @@ -462,17 +462,12 @@ SATCVT(sd, uw, int64_t, uint32_t, 0, UINT32_MAX)
> =20
>  void helper_mtvscr(CPUPPCState *env, uint32_t vscr)
>  {
> -    env->vscr =3D vscr & ~(1u << VSCR_SAT);
> -    /* Which bit we set is completely arbitrary, but clear the rest.  */
> -    env->vscr_sat.u64[0] =3D vscr & (1u << VSCR_SAT);
> -    env->vscr_sat.u64[1] =3D 0;
> -    set_flush_to_zero((vscr >> VSCR_NJ) & 1, &env->vec_status);
> +    ppc_store_vscr(env, vscr);
>  }
> =20
>  uint32_t helper_mfvscr(CPUPPCState *env)
>  {
> -    uint32_t sat =3D (env->vscr_sat.u64[0] | env->vscr_sat.u64[1]) !=3D =
0;
> -    return env->vscr | (sat << VSCR_SAT);
> +    return ppc_get_vscr(env);
>  }
> =20
>  static inline void set_vscr_sat(CPUPPCState *env)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--a7Xyw1yVe3tGJdxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCcoZgACgkQbDjKyiDZ
s5Il0w/9HS4bhgiklk7NOYfkHE4jnsZ0rMUOVGl63RS9NoJKbckrL3CHSRy6FuN5
2O5ODQz72Gu9HGcd9sBAWGi+V1M5CrM2EC1cTvDgYOxvp6P7I9gYxOH68bOJE4m/
KDTvPO7H9E0thp//yEBKOgQnntaWTezYMhP5L59VNFPAyVjijpYMxxIPWYrIKxjO
Xq4dYPzcBCqrvUJTWUwrSxsi7VfR8QeG2Svnk9Wyf6uG3Tp1l0JC0w59BgQI96fw
YeOYEBzSvsBGc0vBwhORSSBpQABCwI6sgfbc5YoTo8D/N1Pmyo5+Nm5py/wOZqrb
7FQDC1c+XafanytHvVwngFhk7h6VJKXiclWkCpCFePkG1Hgc3iupwkJQtD/RNm9q
ymWIjNC7mN1Kx5Yb/FCUV8GYfer1IziORtw8ze0AD+9x/Gvtu2U//P+3/EqdFjn7
aUfazK3cGs/2d6voZ6fi9K6srT/EdyH3f9WgVzEpZeTjxQ3Uxb17K1/OiaorTmy8
i23udjD5v6SrklfJ2SGXvIhfZdt6lQYjPPB0ZEceoMz2NhEWYDhc4x1gqqhtCX+O
fTmGBVFh5L/lcWAiZdnii9++8IPLg1sO8iTDhvPoQI88a3XzEfcdzFnMTaMiPhgh
/CXs9dbGEfqMbOIWhCI6p5oRm545hSDN/6oryCR1JWCISCT7b68=
=JQzo
-----END PGP SIGNATURE-----

--a7Xyw1yVe3tGJdxX--

