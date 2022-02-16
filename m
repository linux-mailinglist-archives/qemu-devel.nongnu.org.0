Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569714B7FC7
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 05:58:06 +0100 (CET)
Received: from localhost ([::1]:37466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCOD-0006Tw-Ck
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 23:58:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7W-0001HF-Om; Tue, 15 Feb 2022 23:40:58 -0500
Received: from [2404:9400:2221:ea00::3] (port=35661 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7T-0000PL-3t; Tue, 15 Feb 2022 23:40:50 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y33fpZz4y4b; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=4yLYZtEKgyPT1TOx0XZG25wKDth/S/+sY/U9VP2NT8I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J1FCaHKW5t/mB9lrie53kPD6bomf/335+Ym4jNVsjdGMXtKgg18EjMHGOYBueCTYR
 6T6lpYWB4k7CDdofH0ylxfMoGLuSZdwgaTCTC2Gpb+qwiSh2pjKRd7zfGal3+/Pxyl
 zinsFIQJLi7KJDhCOddCyIjcEymgnC477GZsdGl0=
Date: Wed, 16 Feb 2022 13:26:57 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 16/27] target/ppc: cpu_init: Move e300 SPR registration
 into a function
Message-ID: <Ygxg8SmuSEzUOGNo@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-17-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tzcmZaWu7OynjqrW"
Content-Disposition: inline
In-Reply-To: <20220215214148.1848266-17-farosas@linux.ibm.com>
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


--tzcmZaWu7OynjqrW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:41:37PM -0300, Fabiano Rosas wrote:
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Rationale for this only becomes clear at patch 18/27, a commit message
would have helped.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu_init.c | 64 +++++++++++++++++++++++--------------------
>  1 file changed, 35 insertions(+), 29 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index ddd27c21ae..adda07e56d 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -768,6 +768,40 @@ static void register_603_sprs(CPUPPCState *env)
>                   0x00000000);
>  }
> =20
> +static void register_e300_sprs(CPUPPCState *env)
> +{
> +    /* hardware implementation registers */
> +    spr_register(env, SPR_HID2, "HID2",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +    /* Breakpoints */
> +    spr_register(env, SPR_DABR, "DABR",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_DABR2, "DABR2",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_IABR2, "IABR2",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_IBCR, "IBCR",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_DBCR, "DBCR",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +}
> +
>  /* SPR specific to PowerPC G2 implementation */
>  static void register_G2_sprs(CPUPPCState *env)
>  {
> @@ -3217,36 +3251,8 @@ static void init_proc_e300(CPUPPCState *env)
>      register_ne_601_sprs(env);
>      register_sdr1_sprs(env);
>      register_603_sprs(env);
> -    /* hardware implementation registers */
> -    spr_register(env, SPR_HID2, "HID2",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* Breakpoints */
> -    spr_register(env, SPR_DABR, "DABR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> +    register_e300_sprs(env);
> =20
> -    spr_register(env, SPR_DABR2, "DABR2",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_IABR2, "IABR2",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_IBCR, "IBCR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_DBCR, "DBCR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
>      /* Memory management */
>      register_low_BATs(env);
>      register_high_BATs(env);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tzcmZaWu7OynjqrW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMYOoACgkQgypY4gEw
YSIvvxAAuVsuIdc7waL23JmKHaZ9YemeY3XeAXfmrJ+25NpU7q21VwNkZBoFmZBS
jhqaRwvxaWuEpBe3QInGDhfWZwbMwlW8DWhXG8Esw5HdGnt3hpwp/v9HEyBqsKw7
ydz/Q5gwPDT83f0ofdwV4neLHj3+msA25kLaup2Csy5nURAAgeYno71QhbfzbD3M
pQUiS1HfSKoZHbH2YkldrSif7SGTtofj2yF7spu57Ql5lbYksJFjye8OcdmwUtYv
0hpgmvqZ2zQQDdJC8hB+2aCowHcQzXbwslO3yE7SRQ0kUXEPYPkUUwemMElM7IJt
UgH9yWo2z1GJjEEfKwJs0NQu4fNbg10kGeIJLT9OEJ7Zsm+scp9XqIr8SagYFEQO
VVkpcVPLy1wpQl2B0gm95MHT1PYAzZ0WaJe5o0RT+BVj/oIXETHl153v83XVESJo
7zq6Pd1zHl4mCq6uIMF1HG88YbfegJjaRH5QTKC2uzmWAsbVyO8eNkrzHuC5iJax
w/dQIsv3bPFqawMq7QzemoKSNTd0piVppqbQgERgz4laY3RWQchdio+OwufWwFVP
WFNY/h8ZaWassgD8kcMd5OBHJCdOma/vw/+NbPfsPdxL4ZaHhxH9QAKto86GcmEH
cY5HlHSRO2aCGX0q4rvX1yhHlCFuk7W/6R8uoVpvnEHKNV14oO4=
=9O9k
-----END PGP SIGNATURE-----

--tzcmZaWu7OynjqrW--

