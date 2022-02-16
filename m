Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB014B7FFB
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 06:20:04 +0100 (CET)
Received: from localhost ([::1]:40104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCjS-0003h9-Kr
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 00:20:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7O-0001DK-Cn; Tue, 15 Feb 2022 23:40:42 -0500
Received: from [2404:9400:2221:ea00::3] (port=50353 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7B-0000Hi-U9; Tue, 15 Feb 2022 23:40:37 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y33M2dz4y4X; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=XYSQtiVK+xNR8CV74HYwL2UAnKXJb8nyoWG+5U3GkU0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aZCZOsotcgcAQMT+vIHk6cdm0uhD+LXQZ5gQQFHypcATj483nGEdgY+dgQ/Y6Dr7o
 Twn8p4L2sFRRE3wnP8swFviRasW+yrahOtnZ0/0lGCZLhlsIdO77ETczZ9dScT+xjx
 T9TYpcJ+xuKvfv+Wu8iUkDHeTWGx2T3zYms/zBWE=
Date: Wed, 16 Feb 2022 13:18:10 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 10/27] target/ppc: cpu_init: Deduplicate 440 SPR
 registration
Message-ID: <Ygxe4rSJEL7U4hys@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-11-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="U37l5Up0Lw2deqFg"
Content-Disposition: inline
In-Reply-To: <20220215214148.1848266-11-farosas@linux.ibm.com>
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


--U37l5Up0Lw2deqFg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:41:31PM -0300, Fabiano Rosas wrote:
> Move some of the 440 registers that are being repeated in the 440*
> CPUs to register_440_sprs.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu_init.c | 100 +++++++++++-------------------------------
>  1 file changed, 26 insertions(+), 74 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 79cd14d49c..711834a4c1 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -1396,6 +1396,32 @@ static void register_440_sprs(CPUPPCState *env)
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
> +
> +    /* Processor identification */
> +    spr_register(env, SPR_BOOKE_PIR, "PIR",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_pir,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_BOOKE_IAC3, "IAC3",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_BOOKE_IAC4, "IAC4",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_BOOKE_DVC1, "DVC1",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_BOOKE_DVC2, "DVC2",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
>  }
> =20
>  /* SPR shared between PowerPC 40x implementations */
> @@ -2517,31 +2543,6 @@ static void init_proc_440EP(CPUPPCState *env)
>      register_BookE_sprs(env, 0x000000000000FFFFULL);
>      register_440_sprs(env);
>      register_usprgh_sprs(env);
> -    /* Processor identification */
> -    spr_register(env, SPR_BOOKE_PIR, "PIR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_pir,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_BOOKE_IAC3, "IAC3",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_BOOKE_IAC4, "IAC4",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_BOOKE_DVC1, "DVC1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_BOOKE_DVC2, "DVC2",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> =20
>      spr_register(env, SPR_BOOKE_MCSR, "MCSR",
>                   SPR_NOACCESS, SPR_NOACCESS,
> @@ -2657,31 +2658,7 @@ static void init_proc_440GP(CPUPPCState *env)
>      register_BookE_sprs(env, 0x000000000000FFFFULL);
>      register_440_sprs(env);
>      register_usprgh_sprs(env);
> -    /* Processor identification */
> -    spr_register(env, SPR_BOOKE_PIR, "PIR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_pir,
> -                 0x00000000);
> =20
> -    spr_register(env, SPR_BOOKE_IAC3, "IAC3",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_BOOKE_IAC4, "IAC4",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_BOOKE_DVC1, "DVC1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_BOOKE_DVC2, "DVC2",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
>      /* Memory management */
>  #if !defined(CONFIG_USER_ONLY)
>      env->nb_tlb =3D 64;
> @@ -2738,31 +2715,6 @@ static void init_proc_440x5(CPUPPCState *env)
>      register_BookE_sprs(env, 0x000000000000FFFFULL);
>      register_440_sprs(env);
>      register_usprgh_sprs(env);
> -    /* Processor identification */
> -    spr_register(env, SPR_BOOKE_PIR, "PIR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_pir,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_BOOKE_IAC3, "IAC3",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_BOOKE_IAC4, "IAC4",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_BOOKE_DVC1, "DVC1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_BOOKE_DVC2, "DVC2",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> =20
>      spr_register(env, SPR_BOOKE_MCSR, "MCSR",
>                   SPR_NOACCESS, SPR_NOACCESS,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--U37l5Up0Lw2deqFg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMXtwACgkQgypY4gEw
YSLoCA//br0080cJzYAL1Ybc6keQfbnTiYUkGlPeSpFYRs/oyGZjLK92xIdJ/9fc
NIkEiYgHY7gkngSvZz4rdfCle+cZ/8OesWstBi2K+JWnvWLp6ol5US/wimm8VhCZ
t2C6hK0rd6sD9nFiIYXRJRacOf+vfcv+oV1ac/jqL4Q4kDOZE9ih/+hQgATtaMK0
WaspoYV6eSGUGjSi+CTaBbCAol5tZpTt8ydSbhrHhuLJ9hmuyiOC4ke97e4XYKKB
VGOexFfcB3I2Io5qg3/VwdqMm9EHtVoBjfVyNF2GOnzFdZvxbvCnbn5ZjCldhATX
sYz/yU9G3S4lQKOrto+CLEC7eJyKQ1dOh5T/Q7ZyAUNY9/JHpnDzGbrxdgG9gDtF
qgQNs3byeVeq+7+5hAIPw0EFAy0AcfUCBGh7WxpXbV9L7423VHaNSpX5f9aHktAv
kHfW87hfBIicLhGkVnMumPMH/PksuDuE4mEiJEC3oIF9hOCeKAJ+RSc29UfhWfaN
8bpHTOr7fPWsXI1Ckxd4JtV+9UT6Nip4ederIziXhXvRORwMvQpEuMyeZsX2U926
T/lR3zBfhYYBDZgaQ4GEOgTY1wWPFlbJCX1nFXJrZpbS0Gs0ICvV5IVshWgKt6p9
we0K9NB7Sp0OBBD19DYb4821UkIbz6fIwpYX51UpdbvIidVQ2ac=
=Udam
-----END PGP SIGNATURE-----

--U37l5Up0Lw2deqFg--

