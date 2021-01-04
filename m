Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6742E8F13
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 01:58:11 +0100 (CET)
Received: from localhost ([::1]:51520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwECI-0006SH-Hm
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 19:58:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwEB6-0005vs-As; Sun, 03 Jan 2021 19:56:56 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:55533 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwEB3-00060R-J7; Sun, 03 Jan 2021 19:56:56 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D8HJV4sT0z9sSs; Mon,  4 Jan 2021 11:56:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609721802;
 bh=fyv8gYd6i3HM546G8nXo2Omf/kCwVdQ46o2UC+Jm28E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IU7WOeEy1rVwvk9qhSU026ZJ2jzC8tIGHrx/3gf6w8ibLuc03mf3sFjPyH4hC+SUU
 Kqva04QrCILLDITfMm8Z+2lcsPoqnNvUSKkNhq2JfnNE5ouq197vHmUB5ZGG07xJBZ
 YpcdbPrwtvo6L1D11FtBiKh+1THge1Z1CG/ZSANY=
Date: Mon, 4 Jan 2021 11:31:47 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v2 1/3] ppc4xx: Move common dependency on serial to
 common option
Message-ID: <20210104003147.GA1915@yekko.fritz.box>
References: <cover.1609413115.git.balaton@eik.bme.hu>
 <9c0b7267edf1dc4624702a29101154a8910682f2.1609413115.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline
In-Reply-To: <9c0b7267edf1dc4624702a29101154a8910682f2.1609413115.git.balaton@eik.bme.hu>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 31, 2020 at 12:11:55PM +0100, BALATON Zoltan via wrote:
> All machines that select SERIAL also select PPC4XX so we can just add
> this common dependency there once.
>=20
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Applied to ppc-for-6.0.

> ---
>  hw/ppc/Kconfig | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index dd86e664d2..8548f42b0d 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -37,7 +37,6 @@ config PPC405
>      select M48T59
>      select PFLASH_CFI02
>      select PPC4XX
> -    select SERIAL
> =20
>  config PPC440
>      bool
> @@ -46,13 +45,13 @@ config PPC440
>      imply E1000_PCI
>      select PCI_EXPRESS
>      select PPC4XX
> -    select SERIAL
>      select FDT_PPC
> =20
>  config PPC4XX
>      bool
>      select BITBANG_I2C
>      select PCI
> +    select SERIAL
> =20
>  config SAM460EX
>      bool
> @@ -61,7 +60,6 @@ config SAM460EX
>      select IDE_SII3112
>      select M41T80
>      select PPC440
> -    select SERIAL
>      select SM501
>      select SMBUS_EEPROM
>      select USB_EHCI_SYSBUS
> @@ -123,7 +121,6 @@ config VIRTEX
>      bool
>      select PPC4XX
>      select PFLASH_CFI01
> -    select SERIAL
>      select XILINX
>      select XILINX_ETHLITE
>      select FDT_PPC

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/yYfAACgkQbDjKyiDZ
s5JwDQ/+Jp5MxBOg10z5blF3W6chn0QTWGSAD61Vh7gTbSkRPijJxWUDst4BfybX
uR8Ji4nrJA8UswMhbq33U3u99HS1nXOPBsAswjzZvaYRIspjx5dtF1ym+WmUZKCl
swAPXba03h6B0w+HTLvp6o8C4gtkp3FViogAvYc+EP7rU9r//xfode19fwvN0RkP
HS0CgbrMl+HJpV0rvb7tPryoitaLxRL9mS0AHvCJrt2JehKrFOEDGfq1KTmqSIdn
EwC/n5Wy5a32skvEzkT8aUROJdHXWj0YLo9UXF/w8Q3xXNzN3DT70/XrQ2CqItyI
aFHoWhV4e+RnV8tUi8MpEc+l1m88Oyak6+zFbGj7sHwxakdQR1LvBTg0ruxug4rw
azzsDqozLhCASwoxRKHoHYooV/+tid2tevWL8WUBNiIfyrysMMInz9mjNkO9r81n
ulV3nrDbOxCntLGpwuoyEwAcVVI7INyYERmCjFmQIXizigOI/AaMSa09hSkjpyx7
sRwYAR/t19Fz1G+C+qrsq1wQZ7bjeQ2GEledHc0WLEHOtW0VGIo2ThheVM0Hl4aA
MenzuZQYjgWpzZwCZsbhQ+8/8pScPF/r2LiW231iniH821vDc20e+xXkTQ71ZTN2
blQgTfmlKuin0R+2Jhq8iK0gSm4+ydhGuKXZyRG/PB9Cxhfu01s=
=7Am5
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--

