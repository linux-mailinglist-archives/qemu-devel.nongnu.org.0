Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 341CF375F17
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 05:19:48 +0200 (CEST)
Received: from localhost ([::1]:60606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ler1n-0000SP-8V
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 23:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1leqza-0007Qr-KI; Thu, 06 May 2021 23:17:30 -0400
Received: from ozlabs.org ([203.11.71.1]:36895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1leqzX-0007lG-J8; Thu, 06 May 2021 23:17:30 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fbwc26xxDz9sXV; Fri,  7 May 2021 13:17:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620357442;
 bh=X1GPqMYPhyEDvL3lUkKRfQEBbbAKry0HxDQioMzXHsI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cNoIhAiltjeTXHstxj8+lA1KpPeon6uSM4HcV/L7G+d+6QHUyho7O6/IqI8q/8zPq
 6rcmzd8kb2hG3HQRntKJuQ2aIDiD0XdAhKvimwJo+9kNEIaZ8ZoXUHyIy7G62a/sU7
 h5AaZ2tSkpkxHkKhjHjdl5rlzhO3D4l479HHXJUI=
Date: Fri, 7 May 2021 13:14:22 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: Re: [PATCH v3 3/4] target/ppc: moved ppc_store_lpcr to misc_helper.c
Message-ID: <YJSwjhxpB6dw/LDX@yekko>
References: <20210506163941.106984-1-lucas.araujo@eldorado.org.br>
 <20210506163941.106984-4-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kqGoZaISTrtogDNJ"
Content-Disposition: inline
In-Reply-To: <20210506163941.106984-4-lucas.araujo@eldorado.org.br>
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 farosas@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--kqGoZaISTrtogDNJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 06, 2021 at 01:39:40PM -0300, Lucas Mateus Castro (alqotel) wro=
te:
> Moved the function ppc_store from mmu-hash64.c to misc_helper.c and the
> prototype from mmu-hash64.h to cpu.h as it is a more appropriate place,
> but it will have to have its implementation moved to a new file as
> misc_helper.c should not be compiled in a !TCG environment.
>=20
> Signed-off-by: Lucas Mateus Castro (alqotel)
> <lucas.araujo@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/cpu.h         |  1 +
>  target/ppc/misc_helper.c | 10 ++++++++++
>  target/ppc/mmu-hash64.c  | 10 ----------
>  target/ppc/mmu-hash64.h  |  1 -
>  4 files changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 733a2168c4..a976e7f7b0 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1297,6 +1297,7 @@ void ppc_store_sdr1(CPUPPCState *env, target_ulong =
value);
>  void ppc_store_ptcr(CPUPPCState *env, target_ulong value);
>  #endif /* !defined(CONFIG_USER_ONLY) */
>  void ppc_store_msr(CPUPPCState *env, target_ulong value);
> +void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val);
> =20
>  void ppc_cpu_list(void);
> =20
> diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
> index 002958be26..08a31da289 100644
> --- a/target/ppc/misc_helper.c
> +++ b/target/ppc/misc_helper.c
> @@ -261,6 +261,16 @@ void ppc_store_msr(CPUPPCState *env, target_ulong va=
lue)
>      hreg_store_msr(env, value, 0);
>  }
> =20
> +void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val)
> +{
> +    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> +    CPUPPCState *env =3D &cpu->env;
> +
> +    env->spr[SPR_LPCR] =3D val & pcc->lpcr_mask;
> +    /* The gtse bit affects hflags */
> +    hreg_compute_hflags(env);
> +}
> +
>  /*
>   * This code is lifted from MacOnLinux. It is called whenever THRM1,2
>   * or 3 is read an fixes up the values in such a way that will make
> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> index be3596f27b..c4a4bc7cd2 100644
> --- a/target/ppc/mmu-hash64.c
> +++ b/target/ppc/mmu-hash64.c
> @@ -1120,16 +1120,6 @@ void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu, ta=
rget_ulong ptex,
>      cpu->env.tlb_need_flush =3D TLB_NEED_GLOBAL_FLUSH | TLB_NEED_LOCAL_F=
LUSH;
>  }
> =20
> -void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val)
> -{
> -    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> -    CPUPPCState *env =3D &cpu->env;
> -
> -    env->spr[SPR_LPCR] =3D val & pcc->lpcr_mask;
> -    /* The gtse bit affects hflags */
> -    hreg_compute_hflags(env);
> -}
> -
>  void helper_store_lpcr(CPUPPCState *env, target_ulong val)
>  {
>      PowerPCCPU *cpu =3D env_archcpu(env);
> diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
> index 5dfd7f8b93..4b8b8e7950 100644
> --- a/target/ppc/mmu-hash64.h
> +++ b/target/ppc/mmu-hash64.h
> @@ -15,7 +15,6 @@ void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu,
>                                 target_ulong pte0, target_ulong pte1);
>  unsigned ppc_hash64_hpte_page_shift_noslb(PowerPCCPU *cpu,
>                                            uint64_t pte0, uint64_t pte1);
> -void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val);
>  void ppc_hash64_init(PowerPCCPU *cpu);
>  void ppc_hash64_finalize(PowerPCCPU *cpu);
>  #endif

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kqGoZaISTrtogDNJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCUsI4ACgkQbDjKyiDZ
s5Ix7w/8Dvm7KIx2J9XxrqGFzOfZOGxKytvyRDef9OnJE3Nw0X5WvinccU9qMzgG
NkG0PzyPCMsdf9q80HuvLU0gTuj9FOwGTGKpJ3U4MClsKwoTC5/fkUoANkvU2bR6
z5caxdkRR+kW3Nfu1QAPiwhqHLrMM3U03z8sEMZEZxPnbYxBC+cWnJIa6GmxGFL8
P51TRHkzmnPJUEQYpHPj1x7eV3L6yW8cLtJwAaNHTfGN+RuDobyuWJU+fy5LRya2
n+jq+Vk6Yv3jPYqYXA6QXmlTI7muJw552XAzywpqIIUhIPq7kUg1W5i/JYjpWLfR
9vS5XKPo+WA3c0pqIB+6xe+tlOqmTb9mEEUp7wK3tclUJmmYiQTPldtyOKmJDaEi
N/W1LW8KFwQR9okTHf9xCWNhmzm9pe1LW52kEMYNjEbiRBXijS1tc0IwRdGPlT4b
DWZLi5kAic+MFRsHWU4tlDKeD0Rsn4WBpGRYg7SUhZiNCvYVr7w2b0R+JUoF6fvL
JMBuqvnmg++bJoMvJeZIZ+O3nrfm0Espn0nl6XdvGPb+PytgIIHBbzsLCMm9zJa/
Mbw5qD2IRDRVD+ImmDWJBHyWqzHjybrNof7ArY8YdHJ276YIl2A78lEAWfSuB8v3
NrWFHcCX1e+XB1pVjAj0aywinTQsg7ux+T0ZuagxCHRrWSfA0Xk=
=4OJJ
-----END PGP SIGNATURE-----

--kqGoZaISTrtogDNJ--

