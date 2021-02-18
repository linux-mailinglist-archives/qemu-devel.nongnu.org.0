Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A3F31F328
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 00:40:20 +0100 (CET)
Received: from localhost ([::1]:49794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCsuB-0001Vn-ON
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 18:40:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lCsnH-0003g8-N0; Thu, 18 Feb 2021 18:33:11 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:40951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lCsnE-0005GQ-CA; Thu, 18 Feb 2021 18:33:11 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DhWGc0bfDz9sRf; Fri, 19 Feb 2021 10:32:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1613691176;
 bh=VCngpZ64eIYn0k+GEmboetTHyTfsQejdkPjpCnGdngg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T5761zfcMM8CH6ATTlUXUzVKaHAYQyHOfClWE0FEctXjLgJd3BQhBZ8ziZAukeB16
 Z3kbz19AEfPk5CT6+/AoRf8DR/71mSfCILfjknMMnIgp9NOiQpM8wDKlDXmwRSQlc6
 c27QlBP1GqawH/mZnincIpWmd8cRzP3RI94NoFKw=
Date: Fri, 19 Feb 2021 09:51:05 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH] hw/ppc: e500: Add missing #address-cells and #size-cells
 in the eTSEC node
Message-ID: <YC7vWfeZkjVAlBxu@yekko.fritz.box>
References: <1613660319-76960-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YbIhh8pgyJsRu/Fo"
Content-Disposition: inline
In-Reply-To: <1613660319-76960-1-git-send-email-bmeng.cn@gmail.com>
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--YbIhh8pgyJsRu/Fo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 18, 2021 at 10:58:39PM +0800, Bin Meng wrote:
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
> to be incorrectly parsed using the default values.

Well, specifically the reg property of the queue-group subnode, rather
than the etsec node itself.

Applied to ppc-for-6.0.

>=20
> [1] https://github.com/devicetree-org/devicetree-specification/releases/d=
ownload/v0.3/devicetree-specification-v0.3.pdf
>=20
> Fixes: fdfb7f2cdb2d ("e500: Add support for eTSEC in device tree")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>=20
>  hw/ppc/e500.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 01517a6..c84a021 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -236,6 +236,8 @@ static int create_devtree_etsec(SysBusDevice *sbdev, =
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

--YbIhh8pgyJsRu/Fo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAu71cACgkQbDjKyiDZ
s5ITPhAA1l4cK2K095FKB4aQK4uxaEL0hTH+ICi0yfxv6807E5XMoFPyXrYu/gY1
l0he1qy1U8wLh75rF12uY1GuyOSHfwI+bdVSTC6r8cOqTxmHuDIGoBRZpfFnS47x
tnvEgxnlPpZD7P0t7KHMZK5L57KA0J8UaqDcZux+kJDYTO8WtngJvlkMYXdrnQmv
hS1qA4qM9S3VEjhl1SGnwY4FT1tZn5cwktU2wy80GsMLHeV6imSr+Q4u7Uei9CKv
c3BdJUJtpdRYQEeE5VjGDfzJVe6WYVRk270BMjX3wHdgmrfDRTsCfZIuKJRpVcPM
7LGlmLKcBhmUEao8fFKc3pW0Kk9AqOHip/iQvoX2CNA6mhh5bjjzna5GU7eKoK1x
GlcRdxqNF7M2voLodkNRMolIEvcKatmU0lT5WaSNuzKI2E6eRkDdJ9PptI6Nx6KH
GUBXs82s70crKSBxoJ1F1jLfFXGe0UfQLtRjkafCj5v1AD8DJrPqdnrIp1S9sEHk
qTWWKmQvK6RSejDl6PWnZ20fBt9jkOEvVHfVNn0UCgKca8G0qTsZhNInSVYbcIyT
WyK2TQgcSR3zL0rQAUKwovyeXgkU/St++4PevzEsWElSW2Z40BIhu8C4AZDAnPj9
EFRHpgg7CokwAleNMSR9mAs79OtpM+1q4kWfC7eNSXptzutAb0o=
=OSYd
-----END PGP SIGNATURE-----

--YbIhh8pgyJsRu/Fo--

