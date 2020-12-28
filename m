Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3872E34C0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 08:33:38 +0100 (CET)
Received: from localhost ([::1]:51660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktn29-0004Gi-1E
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 02:33:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ktmy3-0002IU-K4; Mon, 28 Dec 2020 02:29:23 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:56243 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ktmy0-0000Lh-Ib; Mon, 28 Dec 2020 02:29:23 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D48Lg4QyMz9sWb; Mon, 28 Dec 2020 18:29:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609140555;
 bh=N24vzNGulezPmUe/55qnU/Qtc/JJFe8FqqZgeG5RBek=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VjoQ4cVPGrW+DrWu5M/QS8r5Dg7QXLHSeae7RHuBtL2k+houU5QOMG7c0tnmRhkOr
 /DkqnpGoHtzJp9FlBpWmUTCQ+pAHALZpQMKsUlpaQceTDh8qzmcJeJWTW/6KAxo8tR
 xlbEkynhCbhP9Tw4VFXkgHMm9yr8LoU7Egs/f4EA=
Date: Mon, 28 Dec 2020 18:07:34 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 2/7] mac_oldworld: move initialisation of grackle before
 heathrow
Message-ID: <20201228070734.GD6952@yekko.fritz.box>
References: <20201219104229.1964-1-mark.cave-ayland@ilande.co.uk>
 <20201219104229.1964-3-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LTeJQqWS0MN7I/qa"
Content-Disposition: inline
In-Reply-To: <20201219104229.1964-3-mark.cave-ayland@ilande.co.uk>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: thuth@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--LTeJQqWS0MN7I/qa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 19, 2020 at 10:42:24AM +0000, Mark Cave-Ayland wrote:
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Looks correct, but it could really do with a rationale in the commit messag=
e.

> ---
>  hw/ppc/mac_oldworld.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>=20
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index 2ead34bdf1..e58e0525fe 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -227,6 +227,21 @@ static void ppc_heathrow_init(MachineState *machine)
>          }
>      }
> =20
> +    /* Grackle PCI host bridge */
> +    dev =3D qdev_new(TYPE_GRACKLE_PCI_HOST_BRIDGE);
> +    qdev_prop_set_uint32(dev, "ofw-addr", 0x80000000);
> +    s =3D SYS_BUS_DEVICE(dev);
> +    sysbus_realize_and_unref(s, &error_fatal);
> +
> +    sysbus_mmio_map(s, 0, GRACKLE_BASE);
> +    sysbus_mmio_map(s, 1, GRACKLE_BASE + 0x200000);
> +    /* PCI hole */
> +    memory_region_add_subregion(get_system_memory(), 0x80000000ULL,
> +                                sysbus_mmio_get_region(s, 2));
> +    /* Register 2 MB of ISA IO space */
> +    memory_region_add_subregion(get_system_memory(), 0xfe000000,
> +                                sysbus_mmio_get_region(s, 3));
> +
>      /* XXX: we register only 1 output pin for heathrow PIC */
>      pic_dev =3D qdev_new(TYPE_HEATHROW);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(pic_dev), &error_fatal);
> @@ -251,21 +266,6 @@ static void ppc_heathrow_init(MachineState *machine)
>          tbfreq =3D TBFREQ;
>      }
> =20
> -    /* Grackle PCI host bridge */
> -    dev =3D qdev_new(TYPE_GRACKLE_PCI_HOST_BRIDGE);
> -    qdev_prop_set_uint32(dev, "ofw-addr", 0x80000000);
> -    s =3D SYS_BUS_DEVICE(dev);
> -    sysbus_realize_and_unref(s, &error_fatal);
> -
> -    sysbus_mmio_map(s, 0, GRACKLE_BASE);
> -    sysbus_mmio_map(s, 1, GRACKLE_BASE + 0x200000);
> -    /* PCI hole */
> -    memory_region_add_subregion(get_system_memory(), 0x80000000ULL,
> -                                sysbus_mmio_get_region(s, 2));
> -    /* Register 2 MB of ISA IO space */
> -    memory_region_add_subregion(get_system_memory(), 0xfe000000,
> -                                sysbus_mmio_get_region(s, 3));
> -
>      for (i =3D 0; i < 4; i++) {
>          qdev_connect_gpio_out(dev, i, qdev_get_gpio_in(pic_dev, 0x15 + i=
));
>      }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--LTeJQqWS0MN7I/qa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/phDYACgkQbDjKyiDZ
s5KJlRAA2rq22poAG3B5bbiGI16V3krSy5p2mvfedMc6Gx/9pkwWbbry+tAzjG9X
dB2UatJrW85AH1v/qtmx4RxkBseXSWzhvvVna/k1OHWitsgoU1Uh/4gJIM5bmAOM
QIWxbJ8uwLA8X08lp1tcj7aX/ODBfVejxJS6yf51oycEY0lHkfBaYhPD5wen/Ahq
PKkUPUp3d1Tj/l42Y/zBh3dvxmF3UOUiKp6H6mBz8VLlf4LyMnvKzoyuqyxWHgd0
QmsPgdr9OUH6uXb5ZHz5bppQnllfeWorAQ5o0JsgihvAOARepOKjfe0qmyJW2h6E
cvUhqjoZB1sPbUCUhU5n8kGxh0By73HzadEnfdqz8LTTQggXTgv47vNVAKg7bNpv
B3qZHN430DTHt3BN2IPUApYlqvbC0GBsQaviuVO4poZx9ZNaNB+KM3SPI83wUSMD
XS4naGgQFYscricesyAdPVqylfgk4Ol6okCLkUHXGGwvqLRCBX1mXm62ocyy5i+g
OmGmhKKQLXWeTjSqKZeESmE5yM2ELtHTrb9eYe3sUYB4UFD3dAPHuIVR6AkQ16KB
qB/36Sqd61w3849uiv3ZTa0xL6svZztKvUgUqDUgJBnWj314D+Q5V9JQfQ5NCoMe
16myOExyH+HZ5BtKSdKhvpqaKRZjy7ACAzv6NOBVwEkB45LLEYk=
=IUsM
-----END PGP SIGNATURE-----

--LTeJQqWS0MN7I/qa--

