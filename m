Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7679F4B7FE2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 06:09:56 +0100 (CET)
Received: from localhost ([::1]:50948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCZf-0007a5-0z
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 00:09:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7Z-0001HW-LE; Tue, 15 Feb 2022 23:40:58 -0500
Received: from [2404:9400:2221:ea00::3] (port=58745 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7X-0000Qe-E5; Tue, 15 Feb 2022 23:40:53 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y33zKDz4y4g; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=2G25A7wVkhWU+v9Y1Pqu5MskOopr7YAnHxWI2tjhjVQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TsGLDbC4MiR9+GJq6LUYeIiEF7kGqY3asZ+HR2ZMCbwWP8iee5xMRVWOm35xBrgKr
 44Icx9rsyr6jexzjk2K5zCg/G8wmLLyh4UvByuo9F1DXz8t+fSsG3x7QhioRfsW8qi
 raqajQ8cb7GJlIJ6J3JxoSDfAxgkkUdSq9ZCGxhY=
Date: Wed, 16 Feb 2022 13:54:34 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 20/27] target/ppc: cpu_init: Reuse init_proc_745 for the
 755
Message-ID: <YgxnalRvE7iMRgS3@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-21-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dlZa5ipQWWsYtg+w"
Content-Disposition: inline
In-Reply-To: <20220215214148.1848266-21-farosas@linux.ibm.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2404:9400:2221:ea00::3
 (failed)
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--dlZa5ipQWWsYtg+w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:41:41PM -0300, Fabiano Rosas wrote:
> The init_proc_755 function is identical to the 745 one except for the
> L2 cache registers. I think it is worth it to make them share code.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

With one nit to consider as a further cleanup..

> ---
>  target/ppc/cpu_init.c | 18 +-----------------
>  1 file changed, 1 insertion(+), 17 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 32f99373dc..b4913e25de 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -4548,24 +4548,8 @@ POWERPC_FAMILY(745)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_755(CPUPPCState *env)
>  {
> -    register_ne_601_sprs(env);
> -    register_sdr1_sprs(env);
> -    register_7xx_sprs(env);
> -    register_755_sprs(env);

"register_755_sprs" seems a bit inaccurate now, since it has things
that are common to 745 & 755.  Maybe rename it register_745_sprs(),
then register_755_L2_cache_sprs() could become simply
register_755_sprs(), since it's registering the only 755 specific
stuff (or just open code it here in init_proc_755).

> +    init_proc_745(env);
>      register_755_L2_cache_sprs(env);
> -
> -    /* Thermal management */
> -    register_thrm_sprs(env);
> -
> -    /* Memory management */
> -    register_low_BATs(env);
> -    register_high_BATs(env);
> -    register_6xx_7xx_soft_tlb(env, 64, 2);
> -    init_excp_7x5(env);
> -    env->dcache_line_size =3D 32;
> -    env->icache_line_size =3D 32;
> -    /* Allocate hardware IRQ controller */
> -    ppc6xx_irq_init(env_archcpu(env));
>  }
> =20
>  POWERPC_FAMILY(755)(ObjectClass *oc, void *data)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--dlZa5ipQWWsYtg+w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMZ2MACgkQgypY4gEw
YSIlwA/+MsGHujsD6eGMMk8xMKaZnVXzYP3/ZlYsIaudUqTkU+8fwxKL9q08CUVA
avsEiGbCMSpuUtmBjCyJ3JP18lDb62tkWfLMUKjS5yNa9gDclxtgbJDkpnn8avGs
nLPV28ZIH3lXlh4SR+ogFkd8e/6MuX9C1pKdHRNkWWGlrzvq7PTae8AmLk5q9JhR
6P1Rqz7cPwtHCAQnifc6IjUcL+Gb14Nn96gYQ9q5RxhUecelTaXfRaB4fjE2K22B
HCar8df7fg3zE+vi5ZPCGOj06tGl/+QUMfErpqoN9cyvFNaHOuiAOyd0qrlwawz6
5EILQguBxRxSnO43nua2ph1v5hocKM70YPWscUR3dGLV6/uaRQczt+CTvN4I+utS
Nqnldl7qLIFXeU/hFRMVyKa9qnaX2+EUW6tr19ZYtqZICQv0AeoH3bAYY1PmlCmm
EejviKo/rf3qutATZVPyNs+IL5sMhSJdyJGWun+aiT3qJZ7k25k/KPSoiiw+2fTG
beVRsJDQ1qwo9K3vInrtFkisjA5bSre3vEwmgCg7SH3pahqAIsu2zFJxfnAgRziN
cD058q7V2/4Nso69BpgJY37p2laNdEgqWWKxR+n9jEd6SXOyqjOTZPyt7KpzJCbe
nMnG4vb2VZyBaVmwAgeF7s7JwV0H1E+6oGVnbc+nC7aBuwwb7BE=
=9YtE
-----END PGP SIGNATURE-----

--dlZa5ipQWWsYtg+w--

