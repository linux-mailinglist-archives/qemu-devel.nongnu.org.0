Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63ECA4B7FB9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 05:55:31 +0100 (CET)
Received: from localhost ([::1]:33402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCLi-0003co-Cz
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 23:55:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7E-00013M-7c; Tue, 15 Feb 2022 23:40:32 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:38407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC79-0000Gw-OE; Tue, 15 Feb 2022 23:40:30 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y32sx6z4y46; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=pwZCjg6eJXP86+hOAE09GhuznyvWTQjgbUjxg4aCJcc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cm48JC0fC4H6hz+82754VS0jS2JR+fizuOaDX3xC6DR/yd4GK8t3TgT0aO67bR9zE
 8+6QN5JQfb2IU8kkJqn0h0jCvriXum8r6a8d1pw0/ENl9s4eOode5RGc7PWgXzD4At
 15MW4T3JTAHWKwt1f37yOftybmraVjFQO7f9FGKU=
Date: Wed, 16 Feb 2022 13:14:10 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 07/27] target/ppc: cpu_init: Move G2 SPRs into
 register_G2_sprs
Message-ID: <Ygxd8pHI5DFywNgp@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-8-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Um1/rs5qklke6tkW"
Content-Disposition: inline
In-Reply-To: <20220215214148.1848266-8-farosas@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


--Um1/rs5qklke6tkW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:41:28PM -0300, Fabiano Rosas wrote:
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu_init.c | 41 ++++++++++++++++++++++-------------------
>  1 file changed, 22 insertions(+), 19 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 330b765ba9..29f25e093f 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -761,6 +761,28 @@ static void register_G2_sprs(CPUPPCState *env)
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
> +
> +    /* External access control */
> +    spr_register(env, SPR_EAR, "EAR",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +    /* Hardware implementation register */
> +    spr_register(env, SPR_HID0, "HID0",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_HID1, "HID1",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_HID2, "HID2",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
>  }
> =20
>  static void register_74xx_sprs(CPUPPCState *env)
> @@ -2832,26 +2854,7 @@ static void init_proc_G2(CPUPPCState *env)
>      register_sdr1_sprs(env);
>      register_G2_755_sprs(env);
>      register_G2_sprs(env);
> -    /* External access control */
> -    spr_register(env, SPR_EAR, "EAR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* Hardware implementation register */
> -    spr_register(env, SPR_HID0, "HID0",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> =20
> -    spr_register(env, SPR_HID1, "HID1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_HID2, "HID2",
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

--Um1/rs5qklke6tkW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMXesACgkQgypY4gEw
YSIL9Q//dJybsmKCrZPiRJtBPZvPqcbQW88JYTlgQVYCmQigMqsBch/9GR9XLNhB
wE/SogiVYN0wrl07yD2nzHUC5wTntlaq1Kc34Rpy5Z8ChC2Q0K+SqqIauUUFZJuT
lHHWBipBHCIUqTDELqoUacF2AC5NdwXF4RqXm1//fZCvNtdAm6VlnQ2+Ja0PL08f
rlK0DRmc509yJRO1Qo+6IU2M83RfxHqyTXDRgEUuIkuVVsRdZTKdv+sQt6tmgdZc
Nh9ZBqNUOd9EtKZJUdt1FYxKTOJbts/bxn/OSRG4olx7/so99WXpQjdAN/gsUaTR
HwniFTwLnxKqblKmkODugxygIp1hkceXzNALdKH5+OTUMgIWisE2rU3t8EFug4B3
PebGmHK6mhqUD4XWsbhKdTcTNZc3mlhHOrv7OaZYSvA+kcyRYuTwBn0otGhJQpR8
FWa7KMyA92HxHFMwJRU681kpjX0S9dmAemv7GWZEeQOdk3BTw07djpOgSbRFXNae
K0kLLQbomCl84T9u+5qn8EPBzdrX1vk020LIFEiKBO6299f1dsW/LtqhqMfPFE77
jovvWLPul8E45Fxd4iUxGo64Lh3EJDphPMF5FJffl87Mrg8yaU5ArOxc9QIyaBmD
t3ss4YmX/PACTow0B7NL/UD9CGL2PCAQ5T9J09C0TeQcXgNTYos=
=mR6N
-----END PGP SIGNATURE-----

--Um1/rs5qklke6tkW--

