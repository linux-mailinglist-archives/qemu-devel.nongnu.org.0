Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9222A22E2
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 03:07:23 +0100 (CET)
Received: from localhost ([::1]:33580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZPFi-00037e-Nz
	for lists+qemu-devel@lfdr.de; Sun, 01 Nov 2020 21:07:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kZPDY-0001vC-QI; Sun, 01 Nov 2020 21:05:08 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:42071 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kZPDW-0005az-0o; Sun, 01 Nov 2020 21:05:08 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CPbpL6Xs5z9sVX; Mon,  2 Nov 2020 13:04:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1604282698;
 bh=nLDkD3ziWbVcXQ7izS1+JJAwUeIFujdyvLkoANr7jUs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TIgrFjSeMvmYCdz5/Z4BCsSdOJ9iDAqx1GqkiMkG/oPlcbY1Bjc4tL6a/h4BIXAn1
 iWTHNR4BZ9hhTy0J2EUM3aoxvR3+a3QSvGNzAe/nTfwfqkLqOFHhNwBgTM8b0mDnaa
 XNriyd2z+oH61bgSGPFO2VLjRm/P6TWH/j39tsjQ=
Date: Mon, 2 Nov 2020 12:51:52 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/4] hw/pci-host/prep: Update coding style to make
 checkpatch.pl happy
Message-ID: <20201102015152.GC143651@yekko.fritz.box>
References: <20201012071906.3301481-1-f4bug@amsat.org>
 <20201012071906.3301481-2-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UFHRwCdBEJvubb2X"
Content-Disposition: inline
In-Reply-To: <20201012071906.3301481-2-f4bug@amsat.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--UFHRwCdBEJvubb2X
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 09:19:03AM +0200, Philippe Mathieu-Daud=E9 wrote:
> To make the next commit easier to review, clean this code first.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/pci-host/prep.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
> index d0323fefb10..80dfb67da43 100644
> --- a/hw/pci-host/prep.c
> +++ b/hw/pci-host/prep.c
> @@ -234,8 +234,10 @@ static void raven_pcihost_realizefn(DeviceState *d, =
Error **errp)
>              sysbus_init_irq(dev, &s->pci_irqs[i]);
>          }
>      } else {
> -        /* According to PReP specification section 6.1.6 "System Interru=
pt
> -         * Assignments", all PCI interrupts are routed via IRQ 15 */
> +        /*
> +         * According to PReP specification section 6.1.6 "System Interru=
pt
> +         * Assignments", all PCI interrupts are routed via IRQ 15
> +         */
>          s->or_irq =3D OR_IRQ(object_new(TYPE_OR_IRQ));
>          object_property_set_int(OBJECT(s->or_irq), "num-lines", PCI_NUM_=
PINS,
>                                  &error_fatal);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--UFHRwCdBEJvubb2X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+fZjYACgkQbDjKyiDZ
s5KPpBAArGh7B+VYklfydWvUKxuUgc8kmwX5VKZVuHBHHYN+gE4gmR+xNydIbUrS
s6xlF0y8lQdgm9FTVkHXNFLgQnGpEgV9rrhnwiKLES/XA7c441NvKxgYAanDCM9U
0YvbMwBTz4Y6/5RHTcXxQ9sPCTWNXs9v2K9SYmjTeHfR++QYvve2ofCKOU2WGVMH
JSuENp+vl5h9uJdJm6bJJkgyLTFMyvncREKqpGS54BF8jNIt2wRlOyWm7vRH2L2d
VvBbnkCEt/NYGdHbwq9IrtzH53CbXFFOzuxYE+N0632SnXaFqPeAtBDmg3rvPzd/
JnxhkxfQTgJlEuruxLGNahee5wWSsnU9kWrHSjhnI1+3zmk5B6GHLO/TOvOJDa8a
Biiw8VAiZMCyeDLx+Ym39tyIgNn9ni0HBkPQZNdLEYyFnFIfdl1hvsS3SwjwdzSL
r0/LYCspTFLWrAUt8/tKnS4s0Up6aMWbDmfINAWYRtSqeojykWs/xkaY7hwaJTU4
lBjYN9HhF6lSoakXYcCf/yieaF1gT9EdtoMzgbS1qUT0JlMGTUwuSPtGeiL09e+5
n78CbJfjxDp8AcjN/28TY73Al4TQMei9BL6Swgwr8h9gF9jN1bEW5g9E0YhlZHhh
xyLdFmTZdKKz48FcAKdPg1sztGgoFsd6Rb/unkqgxOSci0kKoQU=
=sy+F
-----END PGP SIGNATURE-----

--UFHRwCdBEJvubb2X--

