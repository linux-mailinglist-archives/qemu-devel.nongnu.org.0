Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5254B7FC3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 05:56:32 +0100 (CET)
Received: from localhost ([::1]:35124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCMh-0004nd-21
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 23:56:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7O-0001DF-Bq; Tue, 15 Feb 2022 23:40:42 -0500
Received: from [2404:9400:2221:ea00::3] (port=39849 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7B-0000Hh-Uu; Tue, 15 Feb 2022 23:40:32 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y33Fssz4y49; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=eVSFZPn3tpCUn8se5ozKQKfKcA7E3htOBwLa2luYH3k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NOP9rv+/03ICymjmkvEf4t64JjvP87jtzxNZSZ26ME/4a/aMq8Vh214FzcAzp5f3U
 hWfGTJwTzN7a0/g0IDkYQbGP5krp28fnJHPRMwZnKmB6n4QtPlpbChfpZOPnLHZPOT
 q10fhR3D+lDGQlq3kVz6HNjteB9yokVB9hep5RXw=
Date: Wed, 16 Feb 2022 13:19:02 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 11/27] target/ppc: cpu_init: Deduplicate 603 SPR
 registration
Message-ID: <YgxfFkw60PMz0SCK@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-12-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RUcaLG8QPV64NcqJ"
Content-Disposition: inline
In-Reply-To: <20220215214148.1848266-12-farosas@linux.ibm.com>
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


--RUcaLG8QPV64NcqJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:41:32PM -0300, Fabiano Rosas wrote:
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu_init.c | 28 +++++++++-------------------
>  1 file changed, 9 insertions(+), 19 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 711834a4c1..cae4ab69fe 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -710,6 +710,15 @@ static void register_603_sprs(CPUPPCState *env)
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
> =20
> +    spr_register(env, SPR_HID0, "HID0",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_HID1, "HID1",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
>  }
> =20
>  /* SPR specific to PowerPC G2 implementation */
> @@ -3162,16 +3171,6 @@ static void init_proc_e300(CPUPPCState *env)
>      register_sdr1_sprs(env);
>      register_603_sprs(env);
>      /* hardware implementation registers */
> -    spr_register(env, SPR_HID0, "HID0",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_HID1, "HID1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
>      spr_register(env, SPR_HID2, "HID2",
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   &spr_read_generic, &spr_write_generic,
> @@ -3718,16 +3717,7 @@ static void init_proc_603(CPUPPCState *env)
>      register_ne_601_sprs(env);
>      register_sdr1_sprs(env);
>      register_603_sprs(env);
> -    /* hardware implementation registers */
> -    spr_register(env, SPR_HID0, "HID0",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> =20
> -    spr_register(env, SPR_HID1, "HID1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
>      /* Memory management */
>      register_low_BATs(env);
>      register_6xx_7xx_soft_tlb(env, 64, 2);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RUcaLG8QPV64NcqJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMXxAACgkQgypY4gEw
YSKhpRAAi4YVPUQgfgRRlOtX1U0uUfkrikjEaDOydKRBirc/Nw7S6TfapJ+7GMVy
ei3WGogOi4pj/j6/+11ZCl84571pHOA29jmJavaKAIzIoMXzSB5EJ+s4nG/YnA9Z
Ymhnh9grroGugZ4MBkB7boFsdaExJcG4mPUmik4i7zvbS+aUVgaAneyUMcq48vvG
LwmZ9P0yqlUKxJuhE4i1BQjvrRwOxic09FNr6pHfTA58rP1geYt3kZoyoFacKYEQ
fA3bcz9HtttOeWS08dKt+dKkpIdDw+LYGtkJ4PFjJhcpjlr9AQfY5fl/NfAkigl7
iRuQNrV0m/T+cTgGvZMFz2RIPVsXWZjRoUMVmH9KQ80awf6NxND/jpxhHuRS/c8C
/JaJLJ0rn1Nbvvdqb56UYPJsj65r5LkH5VIlpRv8gwvEm/3TAUut4fslfNFlarHW
P7a0ovtoAZZsqc1vjhZJkXhzF5Ga9W0W/0QeuqZDP6zKLUK0n1vfg5HpT39Xc8Y+
G0CTrki8x6MetumIBM+D7OM0DbMjahWIAZ5KjLHUihz0pdFtIEFkYH4amhCvGcRU
ilCCQiInDeC0GZanN9nP2e0VeWbtW9Qtcv3AZnQ3zMcEdKTjwzLSq1RJa7V+tvjJ
hoA8Ce3TXGlkCaZ2LiAECI8kB+bVWosJu2UFmWPqkM1tOXMYUw4=
=l1gc
-----END PGP SIGNATURE-----

--RUcaLG8QPV64NcqJ--

