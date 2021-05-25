Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC22338F9D6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 07:12:54 +0200 (CEST)
Received: from localhost ([::1]:36908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llPN7-0003v1-31
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 01:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1llPL3-0002bV-K3; Tue, 25 May 2021 01:10:45 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:56243 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1llPL0-0000KQ-5a; Tue, 25 May 2021 01:10:44 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fq2GN5hfmz9s24; Tue, 25 May 2021 15:10:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621919436;
 bh=BtIsOP3OmTkKcaBjHPmvs7YwsdiMu++/u6IBilBNNb4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NBgbezLOq7V7kje4KJXdx03rGMhv3hlefeSMiGAsITqdW7wjtCs/a9op7CMdkO1Cw
 rD61CHvxWwKWwTFbMhVskggzE9+Kzysquem5dSxaBgWr81cyLTatQu5R34iJWNHmyQ
 tAbRs0xVXlEKKfgmoKoFswTnEdU5++8uguGKsS1Q=
Date: Tue, 25 May 2021 15:10:02 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 2/5] target/ppc: used ternary operator when
 registering MAS
Message-ID: <YKyGqkjUt0xtVntz@yekko>
References: <20210524135908.47505-1-bruno.larsen@eldorado.org.br>
 <20210524135908.47505-3-bruno.larsen@eldorado.org.br>
 <5e2410bb-5d57-09a3-0746-6357d0481a18@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cX6CBVdADxJaUqnz"
Content-Disposition: inline
In-Reply-To: <5e2410bb-5d57-09a3-0746-6357d0481a18@linaro.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: farosas@linux.ibm.com, qemu-devel@nongnu.org, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--cX6CBVdADxJaUqnz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 24, 2021 at 10:32:18AM -0700, Richard Henderson wrote:
> On 5/24/21 6:59 AM, Bruno Larsen (billionai) wrote:
> > The write calback decision when registering the MAS SPR has been turned
> > into a ternary operation, rather than an if-then-else block.
> >=20
> > Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> > Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> > ---
> >   target/ppc/cpu_init.c | 9 +++------
> >   1 file changed, 3 insertions(+), 6 deletions(-)
>=20
> The commit message here says what, but it doesn't say why.

Right, and "why" is generally the more important thing to be in a
commit message.

> The important part of the change is making the references to
> spr_write_generic* conditional, via SYS_ARG(), so that the code compiles =
out
> for !CONFIG_TCG.
>=20
> The actual code change is fine:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>=20
>=20
> r~
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cX6CBVdADxJaUqnz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCshqoACgkQbDjKyiDZ
s5ImqA//S25rl6v5EiNRJ2ZcDYw9r7SGsHtr43/Yn1bA2a3klHUNzx2InnFAH3lH
3nSaAKFIhJ+uBCXtppDMIWwydtkXRsUra4dDA5jpP8RVNDC5AjWbvUETqHPYQqIe
9vlYRzksmcXFZTnIzlOD/HuLDbAzk9S9teiiHr1VPUiZFncuIYRsL5WGrjZbn9Bh
bRntf1vvvqigQFzN38FnrQRom7DQJ3EbSIA35WY9EiJAwZZc/Gvl7nkAcNHmL0sj
9OG/Ja4cVzNdRsQOjwCLLurIKKXig0GcbLKYbIBpwytzEFEufDNMar4o9/F+goEf
ICxsaC8hFBXIBLaz9BgzWrbt5r3/RIc1uVufVY7K+xqhXWmccWcaKOTqUtqBQRNO
dThgMJ15quOkzxGUBjMdmDga8izmAe00DDOB2OiJ47TwaJLebbm7VSwumXnb6UWE
35y4zFcspnstPP07efJ8yYGAFotPzAVTTXshEERgLje9JfgzYhL8i8uwucz2adFC
i3oVWH3riUzHP0fGEkTy/1lFf89UjuJpqLsmiJkLFR4potjx9ji7dvAEW3vfGPZ9
PypiSUYFLxgINvaJm+YAomHshZvQ+zyg2Cv5Q//QLuX5OJE5YZSbW0DKEj5NvE/e
J5THHrL9phn4FwpIVsBWFLYAA2qbyxxwgAkQQptlmy5YL25sxzs=
=iKTF
-----END PGP SIGNATURE-----

--cX6CBVdADxJaUqnz--

