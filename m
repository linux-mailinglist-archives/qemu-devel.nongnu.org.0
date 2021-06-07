Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F8D39D3AC
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 05:54:56 +0200 (CEST)
Received: from localhost ([::1]:41974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq6Ln-0003WI-R0
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 23:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6I3-0003uc-JD; Sun, 06 Jun 2021 23:51:04 -0400
Received: from ozlabs.org ([203.11.71.1]:44691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6Ht-0002mQ-Tr; Sun, 06 Jun 2021 23:51:03 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fyzt22lh9z9sX2; Mon,  7 Jun 2021 13:50:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623037834;
 bh=gT5UmWiZR0IijdfxLEdJm/kwZLwfAzKQFrJAeD+6034=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IByNZwDZVRcQJHlky48nwsb0loIM6K846dieuHeI6kOEjBasjDvUlbTxYoFH4KSBM
 UT7TfJSN2m8UAPX3oiyk0N4BxQuJUO0K6miyvzQGHvt7Foh614pKEv4rIRHOZGZzPO
 eucXnIIIB8huhVnGXliF0e9JuuqI3ndLyTdQRi8k=
Date: Mon, 7 Jun 2021 12:28:24 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: Re: [RFC PATCH 1/4] target/ppc: Don't compile ppc_tlb_invalid_all
 without TCG
Message-ID: <YL2ESEvqIvshXkFe@yekko>
References: <20210602192604.90846-1-lucas.araujo@eldorado.org.br>
 <20210602192604.90846-2-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/MrXFl3z0AevsRXW"
Content-Disposition: inline
In-Reply-To: <20210602192604.90846-2-lucas.araujo@eldorado.org.br>
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
Cc: qemu-devel@nongnu.org, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/MrXFl3z0AevsRXW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 02, 2021 at 04:26:01PM -0300, Lucas Mateus Castro (alqotel) wro=
te:
> The function ppc_tlb_invalid_all is not compiled anymore in a TCG-less
> environment, and the call to that function has been disabled in this
> situation.
>=20
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.b=
r>
> ---
> Is there a better way than to deal with the
> ppc_tlb_invalidate_all call than ifdef? I couldn't think of one.
> ---
>  target/ppc/cpu_init.c   | 4 ++++
>  target/ppc/mmu_helper.c | 4 ++++
>  2 files changed, 8 insertions(+)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 74a397ad6c..2051f24467 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -9114,7 +9114,11 @@ static void ppc_cpu_reset(DeviceState *dev)
>  #if !defined(CONFIG_USER_ONLY)
>      env->nip =3D env->hreset_vector | env->excp_prefix;
>      if (env->mmu_model !=3D POWERPC_MMU_REAL) {
> +#if defined(CONFIG_TCG)
>          ppc_tlb_invalidate_all(env);
> +#else
> +	cpu_abort(env_cpu(env),"PowerPC not in real mode, invalid in this build=
\n");

As Lucas says, this doesn't look right, I think you want a no-op stub
for ppc_tlb_invalidate_all instead().

Also, qemu style is not to use tabs for indentation.

> +#endif
>      }
>  #endif
> =20
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index 1ecb36e85a..803b66f2b0 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -825,6 +825,7 @@ static int mmubooke_get_physical_address(CPUPPCState =
*env, mmu_ctx_t *ctx,
>      return ret;
>  }
> =20
> +#ifdef CONFIG_TCG
>  static void booke206_flush_tlb(CPUPPCState *env, int flags,
>                                 const int check_iprot)
>  {
> @@ -846,6 +847,7 @@ static void booke206_flush_tlb(CPUPPCState *env, int =
flags,
> =20
>      tlb_flush(env_cpu(env));
>  }
> +#endif
> =20
>  static hwaddr booke206_tlb_to_page_size(CPUPPCState *env,
>                                          ppcmas_tlb_t *tlb)
> @@ -1952,6 +1954,7 @@ void helper_store_601_batl(CPUPPCState *env, uint32=
_t nr, target_ulong value)
>  }
>  #endif
> =20
> +#ifdef CONFIG_TCG
>  /***********************************************************************=
******/
>  /* TLB management */
>  void ppc_tlb_invalidate_all(CPUPPCState *env)
> @@ -1995,6 +1998,7 @@ void ppc_tlb_invalidate_all(CPUPPCState *env)
>          break;
>      }
>  }
> +#endif
> =20
>  #ifdef CONFIG_TCG
>  void ppc_tlb_invalidate_one(CPUPPCState *env, target_ulong addr)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/MrXFl3z0AevsRXW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC9hEgACgkQbDjKyiDZ
s5Iq0g/9Hr5X+e5v3FfylzKBk3I6zgrU2jslyVJQ7HRDu8OP4k5OLtOLVI1TcRqH
pFBD0eDjRirG6uCoFwGPG8oomBMdBK6pTfZq8ydgPtJqMIoixQUS65LZS5Bq6D+H
+LJDNtm+02+D7JCC0YNd+u8z9fs5sqqdWSOdpIs44M4/8jJAc05lwjPbcW1vpc+b
nFcneSUV6hs70KxaHt49N0cHT+VaYBd5cIOnAifxaLTxAb3WcdKIFe9Jb02o1EF+
cbWD5rm+6p9ZjmahlC7pGQqNl5opJPYOU95dYYOazoXxmfAJxibXMZMoObywQ+wx
Hp/P27DGwHIMU2SfisHgMgmVzaLqmTN5E8iOkwnsrLFFLLUa+V0zCP7P2grVkSeP
uYdXotYeTZw3TU1VgZ9xYlQOhi9Ze64O142VBpossjBhhh7A4rdAvcr2V8ThD7Na
vN4/LP7R813N7mqnVSzopMzS7LyQpO3Zx6Ta29B8Fn8z8thv8UcniGVFlqv6N1qe
xsdRMVDMWquJB3LhPlxTqJcFVR6tYJ8xfap7nhSEqmDogWCXTCrqhC+fA1VZZRXs
tI/23y7p+ad5OVRfYWKZvB9/LG06JhKVtntuUMosmvzA95y9Xt6AQ9JmcBuFVQh2
Unw6fP9nFC6RUnHvGknxgDFciFY/UIOJYTUF6mMkJDPW0yZcKLk=
=MxDC
-----END PGP SIGNATURE-----

--/MrXFl3z0AevsRXW--

