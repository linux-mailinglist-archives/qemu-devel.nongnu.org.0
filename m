Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6F34B7FDD
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 06:03:56 +0100 (CET)
Received: from localhost ([::1]:45600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCTr-0003lE-1O
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 00:03:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7a-0001HY-2C; Tue, 15 Feb 2022 23:40:58 -0500
Received: from [2404:9400:2221:ea00::3] (port=54803 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7X-0000Qg-EM; Tue, 15 Feb 2022 23:40:53 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y343tfz4y4m; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=kSKwDxkdpOBdk+ZsgLVm7wCuMNFoJNybuRc+DnfnG5I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EYgFeZOHnvp3jkbGINkClMSoVlHkENV7590+3eJpKlGL0ELU42/KRQWhxXScqq405
 aOf3jR24gAPjc3uQkayHyyYIX6Kc9fMc8AJBHo0cyUM/l647+q8aKdSWon9PPgZvk5
 AJg9ySb3Dxnjbv8FwBIgp9mL7TFIitSp6D4wFARI=
Date: Wed, 16 Feb 2022 13:56:27 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 21/27] target/ppc: cpu_init: Rename software TLB function
Message-ID: <Ygxn23DZQ86Z2Eo6@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-22-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JkuY1TiacbHuWJHT"
Content-Disposition: inline
In-Reply-To: <20220215214148.1848266-22-farosas@linux.ibm.com>
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


--JkuY1TiacbHuWJHT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:41:42PM -0300, Fabiano Rosas wrote:
> With the removal of the 7450 software TLB code, the only software TLBs
> that we support currently are the 6xx and 7xx, so there's no need for
> this function to indicate that in its name anymore.

I don't think this is a good idea.  It may not have a function of a
similar name, but 40x and 44x certainly have a software tlb with an
entirely different programming model.  So I think it makes sense to
keep the 6xx/7xx reference here for clarity.

>=20
> Also, it's best to use a generic name for functions that are shared
> and only mention the specific CPU name when the function applies only
> to that (or similar) CPUs.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  target/ppc/cpu_init.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index b4913e25de..3e687d0301 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -428,7 +428,7 @@ static void register_high_BATs(CPUPPCState *env)
>  }
> =20
>  /* Softare table search registers */
> -static void register_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int=
 nb_ways)
> +static void register_soft_tlb_sprs(CPUPPCState *env, int nb_tlbs, int nb=
_ways)
>  {
>  #if !defined(CONFIG_USER_ONLY)
>      env->nb_tlb =3D nb_tlbs;
> @@ -3029,7 +3029,7 @@ static void init_proc_G2(CPUPPCState *env)
>      /* Memory management */
>      register_low_BATs(env);
>      register_high_BATs(env);
> -    register_6xx_7xx_soft_tlb(env, 64, 2);
> +    register_soft_tlb_sprs(env, 64, 2);
>      init_excp_G2(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -3738,7 +3738,7 @@ static void init_proc_603(CPUPPCState *env)
> =20
>      /* Memory management */
>      register_low_BATs(env);
> -    register_6xx_7xx_soft_tlb(env, 64, 2);
> +    register_soft_tlb_sprs(env, 64, 2);
>      init_excp_603(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -4499,7 +4499,7 @@ static void init_proc_745(CPUPPCState *env)
>      /* Memory management */
>      register_low_BATs(env);
>      register_high_BATs(env);
> -    register_6xx_7xx_soft_tlb(env, 64, 2);
> +    register_soft_tlb_sprs(env, 64, 2);
>      init_excp_7x5(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JkuY1TiacbHuWJHT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMZ9UACgkQgypY4gEw
YSI7/xAArP4M/AjelN6/KZ0hIlyF/vqxUd1tyXkmHlty3y8YXFaerRjxXnDmWxhT
rmDbtgTEMpTSoD1iasXOpbZnLwu32nvhsUB3AmK+/YmlvNHd6xLvitT0LhSMuF45
9AWpDOVE7Q8KWRvSRk9bF8+6I+rJcsFJTF4v5Xsv24Kvc25tspX+PZK9FLShcYX2
aLew7hVxDfTRQheQ6aVtv1yJdtmWdibyg6S7N+kqQrejg4JzKMWpA3SOy8rWIDXc
l7NU8VI8Suu/mtjfrBUKDDHlxenC+vY9r4lCfAk0xiPiXAjfu+rDniW6Nsnymvb4
4BHUoAL40ZIrqbykx7LjduX1vyJkq1i1sYSw7nD4u6/gvf38ehZbm93pcx9plw1J
UtBCbb3C2iJ612XulDc1t0s6Cjzabl9q0LN8c1gbPyXaBFUvi5HUb3kCPP5hyFsS
MMdtGWG04x0m38rO/Do1TDlst83BWuHE6WRHeFlmRYDJ8SYP+Gghtrhn4U6SdN+O
pZwrhPQOnDVxbi8R7FPQz5BBTSDUw0RmXnirjsWP4IoeQqTGFowERBHMnrUfm5no
kMPRM06hbPy6sfJaIcQyjVfZjc1pLIRBDS6buQ2RXzdknTsqMEm+NvXM7A4cpp4i
aXYT5MtGZ0j1AxM9ayWeyLGgNN+JH3i8UxKVDoI2g2JnTHMNIjY=
=2Ex/
-----END PGP SIGNATURE-----

--JkuY1TiacbHuWJHT--

