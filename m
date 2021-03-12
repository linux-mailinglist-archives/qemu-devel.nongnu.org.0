Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D693D338361
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 03:01:32 +0100 (CET)
Received: from localhost ([::1]:52478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKX7L-0008OD-TU
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 21:01:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lKX5h-0007H7-56; Thu, 11 Mar 2021 20:59:49 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:35551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lKX5e-0000hD-KY; Thu, 11 Mar 2021 20:59:48 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DxTXG1X6hz9sS8; Fri, 12 Mar 2021 12:59:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615514382;
 bh=9TP8dyzqlwp/0oEiK5sJdPEPLXilz7yAd2Z/EGyhNDM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jHi/J3gxPX1zOmDwcuI4L5pgdxoTv3kgBJDIHJuVMakMtNO19wlzQ6JrzTk5bU7wS
 u3GJOZMaBP4wR6TunrHmHtfq9qu4FsfFUl2TcMJWRtLSPYue85u3ShZRLtCSn+8dLZ
 Rx1F630V2qlGZFqmA8Jt8Co5v02xnDFBuyRaCPHw=
Date: Fri, 12 Mar 2021 12:25:56 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [RESEND PATCH] hw/ppc: e500: Add missing #address-cells and
 #size-cells in the eTSEC node
Message-ID: <YErDJJMlqq4j/r7V@yekko.fritz.box>
References: <20210311081608.66891-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="q2dJ6PrBodl1QJ+q"
Content-Disposition: inline
In-Reply-To: <20210311081608.66891-1-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--q2dJ6PrBodl1QJ+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 04:16:08PM +0800, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
>=20
> Per devicetree spec v0.3 [1] chapter 2.3.5:
>=20
> The #address-cells and #size-cells properties are not inherited
> from ancestors in the devicetree. They shall be explicitly defined.
> If missing, a client program should assume a default value of 2
> for #address-cells, and a value of 1 for #size-cells.
>=20
> These properties are currently missing, causing the <reg> property
> of the queue-group subnode to be incorrectly parsed using default
> values.
>=20
> [1] https://github.com/devicetree-org/devicetree-specification/releases/d=
ownload/v0.3/devicetree-specification-v0.3.pdf
>=20
> Fixes: fdfb7f2cdb2d ("e500: Add support for eTSEC in device tree")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Applied to ppc-for-6.0 (again), thanks.

> ---
>=20
>  hw/ppc/e500.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 1d94485ac8..79467ac512 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -237,6 +237,8 @@ static int create_devtree_etsec(SysBusDevice *sbdev, =
PlatformDevtreeData *data)
>      qemu_fdt_setprop_string(fdt, node, "model", "eTSEC");
>      qemu_fdt_setprop(fdt, node, "local-mac-address", etsec->conf.macaddr=
=2Ea, 6);
>      qemu_fdt_setprop_cells(fdt, node, "fixed-link", 0, 1, 1000, 0, 0);
> +    qemu_fdt_setprop_cells(fdt, node, "#size-cells", 1);
> +    qemu_fdt_setprop_cells(fdt, node, "#address-cells", 1);
> =20
>      qemu_fdt_add_subnode(fdt, group);
>      qemu_fdt_setprop_cells(fdt, group, "reg", mmio0, 0x1000);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--q2dJ6PrBodl1QJ+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBKwyQACgkQbDjKyiDZ
s5JgdA//eOezlXmkSGu5ni9g7CijysYup7GgLTUHGY9FCb0flYfWBiAgiWTSjwUs
s0puvoXKXT6wn8goc2A5Z9qXNsE0yApH/1Ffm2pRjkVhiE2LYTT697yOUH09I5wK
OzP0x5AVj2ENNjekqZzLvjOcbWvwfXoYXjRnVfjfSY1LHi8qLMFXo8TtSiyhvkV9
iQmmIw/fNP8C4jNftYbJhtD7sF7o8uF2HH3jE/OGUYerJn5YwI7tS4WK313IdZmM
Sl0mXcHjnmF9KL4vYmyVGsfDdJNyB0B9Mt4dhJ9ew/PSTHlvEjKOO+BaO0R+cQne
zNYvSQSWcWRPH5SU1A0wXveiQnsaeTzA7wO05FtcfWKofgrQbvXwRiXQb1ln3jtV
QupY+g+BbFGEn+oS8hm8kqqkoGPJ4qqIFPIl3/oqVYYIQsxneMigRL7yN8iU8aA/
4AEOomEbTQsUj+fxMVvOgIk3NbgvNCaokRW0XA/HO4b/XgR6ue1Qe+ERT41kuJ97
CZAtKfmaoJCQa5parnd9YmkFqOazRw3MktVrXgSvj6uFK5F8FL8nP9zE3JBmxPAm
sid7tm4vdERdqKIA7MeJyD89TuxOWQZUZunl5CiH6YwWtFezh5p+ge8m5vQMEpUs
29t/GcaKbHPHXawEVQM79EulgAroOQ8srwD4yNzy/AsDRRuZlOQ=
=KVth
-----END PGP SIGNATURE-----

--q2dJ6PrBodl1QJ+q--

