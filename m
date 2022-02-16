Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C5B4B7FE3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 06:10:21 +0100 (CET)
Received: from localhost ([::1]:51494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCa4-000813-HP
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 00:10:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7D-00012y-0f; Tue, 15 Feb 2022 23:40:31 -0500
Received: from [2404:9400:2221:ea00::3] (port=45333 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC79-0000Gt-Q4; Tue, 15 Feb 2022 23:40:30 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y32l5yz4y3t; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=03M1Vh1URl2LGK2+ZJnUe45DymS8xDegCv/d2B2UbrI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SnEZKXcNO0JYEtp/rtoPYDqbbbmlG9ORZ/Re0fGkFaqn7HuHtMSlHEWps8aYVfXmk
 gSSUKvxos3Ng/qnfOePwIwlB8XaiVe+wlc2JZm8EBeiG8PhbRAF2sA4j9DeOCt2xyx
 fV7fLBs5k6Yx8LgCyuKCbCJhpR4mD6fd+viHC5sw=
Date: Wed, 16 Feb 2022 13:13:13 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 06/27] target/ppc: cpu_init: Move 405 SPRs into
 register_405_sprs
Message-ID: <YgxduYczlp6aP5Ae@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-7-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FKIBnjKB6v5CTm9/"
Content-Disposition: inline
In-Reply-To: <20220215214148.1848266-7-farosas@linux.ibm.com>
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


--FKIBnjKB6v5CTm9/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:41:27PM -0300, Fabiano Rosas wrote:
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu_init.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 1eef006a04..330b765ba9 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -1425,6 +1425,18 @@ static void register_405_sprs(CPUPPCState *env)
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   spr_read_generic, &spr_write_generic,
>                   0x00000000);
> +
> +    /* Bus access control */
> +    /* not emulated, as QEMU never does speculative access */
> +    spr_register(env, SPR_40x_SGR, "SGR",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0xFFFFFFFF);
> +    /* not emulated, as QEMU do not emulate caches */
> +    spr_register(env, SPR_40x_DCWR, "DCWR",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
>  }
> =20
> =20
> @@ -2320,17 +2332,7 @@ static void init_proc_405(CPUPPCState *env)
>      register_40x_sprs(env);
>      register_405_sprs(env);
>      register_usprgh_sprs(env);
> -    /* Bus access control */
> -    /* not emulated, as QEMU never does speculative access */
> -    spr_register(env, SPR_40x_SGR, "SGR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0xFFFFFFFF);
> -    /* not emulated, as QEMU do not emulate caches */
> -    spr_register(env, SPR_40x_DCWR, "DCWR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> +
>      /* Memory management */
>  #if !defined(CONFIG_USER_ONLY)
>      env->nb_tlb =3D 64;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--FKIBnjKB6v5CTm9/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMXbIACgkQgypY4gEw
YSLAIg//ZqnTkPi7sNRB2MlEXaXrpXIFk1yDFjEKoL/nLKifWF4TBWs9eMF7OR9P
XjW7BjxdFh6wOi5JWhDYmHh6nlbb781qrrggqeRzQKVdRmY5torxP0aMSCFQFyXS
m/ECviR2FRbJ/8BvoWEaY9HuZdsakTr37+wfaDGFzs0Fq/0633XKWJh54Z2SkFer
9vb7BfPiqyMo/7vPom+hcQ+ceWMpND4iotWWpWDY8P/oEkCVe5uKbm5h417wvffv
IRfBO3qmcFVl8ffG7mltA9tTwfcKhjC/9Wxu4XEY9Sx3hDeKLkDFd+0DlMhpsswr
34dnlgCuJqCNUliOf1SiLVwoqk478skDQDuXnJw1Cjyx+N4MQ4hkC9FfKKmhO5eQ
Z+Tk5cLwojFdwN/eJ4hD+3gx9RysbeVXA6cVsm8z9u7RLmGcK01B/wz035sy0Wly
gW/dvFYTwsAvtXueQbkisGEkUA4kao2QTVSWXypBAu7yyvjm1KZjAuIz7koBtgJJ
pEqGIHmo9Z86mfKdGadCcY9cujMAxAI82apZsshZaqOy9htqhfeGigycDlPOckyP
N//SV4V704/EWtHfGRlHX0AYEyR9HsHzHjALD/X5/Qo8ffjXdxyU91mq+YlRC3k8
d+4Vydk6OYawTFhtXh7Kiw7ksvEh48a1YAl0fGqQr1WvLHOluiA=
=KpS6
-----END PGP SIGNATURE-----

--FKIBnjKB6v5CTm9/--

