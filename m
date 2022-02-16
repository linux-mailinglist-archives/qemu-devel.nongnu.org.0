Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D04F04B802C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 06:25:17 +0100 (CET)
Received: from localhost ([::1]:51348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCoW-00033D-Er
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 00:25:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7T-0001Fg-2k; Tue, 15 Feb 2022 23:40:47 -0500
Received: from [2404:9400:2221:ea00::3] (port=32907 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7O-0000Jj-Gx; Tue, 15 Feb 2022 23:40:44 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y33Yxnz4y4G; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=/hRwn9Af6kt0KiVh5gdvcNA9w44MtkJ7A4GMiY4+y3A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EVnzjRzgVYPjrzlRni2aHHxjb8E4JSkucAxonHjGGLYx1HvGmIIFTN+v60ZoFqGjq
 UOBefeIpBg16NBMI4jfZsjn9zTupH/GLTFskz/xLN7NW9yz5C8XvHcnnNtxS2V0W5l
 ieip19SDCTYuYcQ6czMe5koEp/h21/a5PFg4NVic=
Date: Wed, 16 Feb 2022 13:19:56 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 12/27] target/ppc: cpu_init: Deduplicate 604 SPR
 registration
Message-ID: <YgxfTPArgspMBzDL@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-13-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YRqcIrA70+l1vDKa"
Content-Disposition: inline
In-Reply-To: <20220215214148.1848266-13-farosas@linux.ibm.com>
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


--YRqcIrA70+l1vDKa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:41:33PM -0300, Fabiano Rosas wrote:
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu_init.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index cae4ab69fe..c54f10cb48 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -694,6 +694,12 @@ static void register_604_sprs(CPUPPCState *env)
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
> +
> +    /* Hardware implementation registers */
> +    spr_register(env, SPR_HID0, "HID0",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
>  }
> =20
>  /* SPR specific to PowerPC 603 implementation */
> @@ -3811,11 +3817,7 @@ static void init_proc_604(CPUPPCState *env)
>      register_ne_601_sprs(env);
>      register_sdr1_sprs(env);
>      register_604_sprs(env);
> -    /* Hardware implementation registers */
> -    spr_register(env, SPR_HID0, "HID0",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> +
>      /* Memory management */
>      register_low_BATs(env);
>      init_excp_604(env);
> @@ -3885,11 +3887,6 @@ static void init_proc_604E(CPUPPCState *env)
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
>      /* Hardware implementation registers */
> -    spr_register(env, SPR_HID0, "HID0",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
>      spr_register(env, SPR_HID1, "HID1",
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   &spr_read_generic, &spr_write_generic,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--YRqcIrA70+l1vDKa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMX0YACgkQgypY4gEw
YSIFxBAAvvj9y6O3a8lLnCgwfoxfiGwOfDG68ePqGatFP0ZtmO+7MyzFba5W3T1a
CbelCRDpR0DCHs8WI6ZZfX9CA/kIuppqejXee4PLrZG0r6riMKrYbINvCLVBjBxo
/mv8WEYgR4nC+7n3WF7Ubqx/P3cr2gYtVkNOf8RxoozCMuDXKSye52C86sRWMv7o
UqmnWnyyKJY443g+Es/CDY0JemHPFay/oZ3+xTw6LZkwrxHfO7Ilb2l/YJuRNRgd
nR5jkmgdoVZkq6e3LTF4wuYqKskH+LJ46dY2STVeTqSiurO7NVh2w6EpyWAwxGuA
DxgQMOe3tXijf9ZabO6nF7zvh208kDpv07sQblJLQNkC+oT803krCK3F3lPpec58
2GS18B7NC4kXeWfMQK0jOBE06PU0vAodWep3xHWTNhc2OUO5b/0MIyIB/4RkyvoE
FLf44Ls+C8OX+wO/NYlAR8oXwHzz6f7XHNZ3pfVw7sVS2wqwCAJQFubG7gBkOjNh
bUkxncY1dMu9nx+ajktMoYwmO4HyT5OEACtyvtHfti7ptHbNkGYJQ3uINFMItv8z
J/7WN7iwGWUwcj9mgSREvHv48D0vyO8I4xZWNShS3DkcLHkMVkgYw+jmDuaLkU8j
QiCH8NWwKF5pg/ymtTNzp6ZcEgYWn2ECreF3eIP1FwkRLMzRdMM=
=x4oK
-----END PGP SIGNATURE-----

--YRqcIrA70+l1vDKa--

