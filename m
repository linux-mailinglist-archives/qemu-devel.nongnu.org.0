Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD6A34C27B
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 06:24:55 +0200 (CEST)
Received: from localhost ([::1]:49850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQjSQ-00059U-O0
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 00:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lQjOZ-0007uz-KW; Mon, 29 Mar 2021 00:20:55 -0400
Received: from ozlabs.org ([203.11.71.1]:34017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lQjOW-00005X-6s; Mon, 29 Mar 2021 00:20:55 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F7zs94SdGz9sW4; Mon, 29 Mar 2021 15:20:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616991645;
 bh=umubXwmB0G0CpiqVw0TC9gPKSv1UzwrXH1/mL02Xo5I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qFrVq0gmMuJZQaeGZLUEp5qXEjgvgD2zYB2TfdfHMxXMNasZ0I9zI09rGqWE/lqFa
 HALOikngZhXcW2EXVaQrDuk8JuW5vajNErjtt3aNaI+BU1pASuSSDvmdukMsHmhXfn
 EzM9pWQSd11/qQsNn/djOnYDjkj8nJthtyyi8TsA=
Date: Mon, 29 Mar 2021 15:12:20 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-6.1 07/10] hw/block/pflash_cfi02: Simplify
 pflash_cfi02_register() prototype
Message-ID: <YGFTpHZhWxqYxxl2@yekko.fritz.box>
References: <20210326002728.1069834-1-f4bug@amsat.org>
 <20210326002728.1069834-8-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="whqoo4aav4AqWT8g"
Content-Disposition: inline
In-Reply-To: <20210326002728.1069834-8-f4bug@amsat.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--whqoo4aav4AqWT8g
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 26, 2021 at 01:27:25AM +0100, Philippe Mathieu-Daud=E9 wrote:
> The previous commit removed the mapping code from TYPE_PFLASH_CFI02.
> pflash_cfi02_register() doesn't use the 'nb_mappings' argument
> anymore. Simply remove it to simplify.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Revieed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  include/hw/block/flash.h | 1 -
>  hw/arm/digic_boards.c    | 1 -
>  hw/arm/musicpal.c        | 1 -
>  hw/arm/xilinx_zynq.c     | 2 +-
>  hw/block/pflash_cfi02.c  | 3 +--
>  hw/lm32/lm32_boards.c    | 4 ++--
>  hw/ppc/ppc405_boards.c   | 6 +++---
>  hw/sh4/r2d.c             | 2 +-
>  8 files changed, 8 insertions(+), 12 deletions(-)
>=20
> diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
> index 7dde0adcee7..0e5dd818a9d 100644
> --- a/include/hw/block/flash.h
> +++ b/include/hw/block/flash.h
> @@ -36,7 +36,6 @@ PFlashCFI02 *pflash_cfi02_register(hwaddr base,
>                                     hwaddr size,
>                                     BlockBackend *blk,
>                                     uint32_t sector_len,
> -                                   int nb_mappings,
>                                     int width,
>                                     uint16_t id0, uint16_t id1,
>                                     uint16_t id2, uint16_t id3,
> diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
> index 293402b1240..eb694c70d4c 100644
> --- a/hw/arm/digic_boards.c
> +++ b/hw/arm/digic_boards.c
> @@ -128,7 +128,6 @@ static void digic4_add_k8p3215uqb_rom(DigicState *s, =
hwaddr addr,
>                           FLASH_K8P3215UQB_SIZE / FLASH_K8P3215UQB_SECTOR=
_SIZE);
>      qdev_prop_set_uint32(dev, "sector-length", FLASH_K8P3215UQB_SECTOR_S=
IZE);
>      qdev_prop_set_uint8(dev, "width", 4); /* 32-bit */
> -    qdev_prop_set_uint8(dev, "mappings", 0);
>      qdev_prop_set_uint8(dev, "big-endian", 0);
>      qdev_prop_set_uint16(dev, "id0", 0x00ec);
>      qdev_prop_set_uint16(dev, "id1", 0x007e);
> diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
> index 7d1f2f3fb3f..e882e11df36 100644
> --- a/hw/arm/musicpal.c
> +++ b/hw/arm/musicpal.c
> @@ -1657,7 +1657,6 @@ static void musicpal_init(MachineState *machine)
>          qdev_prop_set_uint32(dev, "num-blocks", flash_size / sector_size=
);
>          qdev_prop_set_uint32(dev, "sector-length", sector_size);
>          qdev_prop_set_uint8(dev, "width", 2); /* 16-bit */
> -        qdev_prop_set_uint8(dev, "mappings", 0);
>          qdev_prop_set_uint8(dev, "big-endian", 0);
>          qdev_prop_set_uint16(dev, "id0", 0x00bf);
>          qdev_prop_set_uint16(dev, "id1", 0x236d);
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 8db6cfd47f5..d12b00e7648 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -220,7 +220,7 @@ static void zynq_init(MachineState *machine)
>      pflash_cfi02_register(0xe2000000, "zynq.pflash", FLASH_SIZE,
>                            dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
>                            FLASH_SECTOR_SIZE, 1,
> -                          1, 0x0066, 0x0022, 0x0000, 0x0000, 0x0555, 0x2=
aa,
> +                          0x0066, 0x0022, 0x0000, 0x0000, 0x0555, 0x2aa,
>                            0);
> =20
>      /* Create the main clock source, and feed slcr with it */
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 6f4b3e3c3fe..2b412402fac 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -968,7 +968,7 @@ PFlashCFI02 *pflash_cfi02_register(hwaddr base,
>                                     hwaddr size,
>                                     BlockBackend *blk,
>                                     uint32_t sector_len,
> -                                   int nb_mappings, int width,
> +                                   int width,
>                                     uint16_t id0, uint16_t id1,
>                                     uint16_t id2, uint16_t id3,
>                                     uint16_t unlock_addr0,
> @@ -977,7 +977,6 @@ PFlashCFI02 *pflash_cfi02_register(hwaddr base,
>  {
>      DeviceState *dev =3D qdev_new(TYPE_PFLASH_CFI02);
> =20
> -    assert(nb_mappings <=3D 1);
>      if (blk) {
>          qdev_prop_set_drive(dev, "drive", blk);
>      }
> diff --git a/hw/lm32/lm32_boards.c b/hw/lm32/lm32_boards.c
> index b5d97dd53ed..96877ba7cfb 100644
> --- a/hw/lm32/lm32_boards.c
> +++ b/hw/lm32/lm32_boards.c
> @@ -121,7 +121,7 @@ static void lm32_evr_init(MachineState *machine)
>      pflash_cfi02_register(flash_base, "lm32_evr.flash", flash_size,
>                            dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
>                            flash_sector_size,
> -                          1, 2, 0x01, 0x7e, 0x43, 0x00, 0x555, 0x2aa, 1);
> +                          2, 0x01, 0x7e, 0x43, 0x00, 0x555, 0x2aa, 1);
> =20
>      /* create irq lines */
>      env->pic_state =3D lm32_pic_init(qemu_allocate_irq(cpu_irq_handler, =
cpu, 0));
> @@ -218,7 +218,7 @@ static void lm32_uclinux_init(MachineState *machine)
>      pflash_cfi02_register(flash_base, "lm32_uclinux.flash", flash_size,
>                            dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
>                            flash_sector_size,
> -                          1, 2, 0x01, 0x7e, 0x43, 0x00, 0x555, 0x2aa, 1);
> +                          2, 0x01, 0x7e, 0x43, 0x00, 0x555, 0x2aa, 1);
> =20
>      /* create irq lines */
>      env->pic_state =3D lm32_pic_init(qemu_allocate_irq(cpu_irq_handler, =
env, 0));
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 8f77887fb18..2503e033497 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -198,7 +198,7 @@ static void ref405ep_init(MachineState *machine)
>          pflash_cfi02_register((uint32_t)(-bios_size),
>                                "ef405ep.bios", bios_size,
>                                blk_by_legacy_dinfo(dinfo),
> -                              64 * KiB, 1,
> +                              64 * KiB,
>                                2, 0x0001, 0x22DA, 0x0000, 0x0000, 0x555, =
0x2AA,
>                                1);
>      } else
> @@ -469,7 +469,7 @@ static void taihu_405ep_init(MachineState *machine)
>          pflash_cfi02_register(0xFFE00000,
>                                "taihu_405ep.bios", bios_size,
>                                blk_by_legacy_dinfo(dinfo),
> -                              64 * KiB, 1,
> +                              64 * KiB,
>                                4, 0x0001, 0x22DA, 0x0000, 0x0000, 0x555, =
0x2AA,
>                                1);
>          fl_idx++;
> @@ -502,7 +502,7 @@ static void taihu_405ep_init(MachineState *machine)
>          bios_size =3D 32 * MiB;
>          pflash_cfi02_register(0xfc000000, "taihu_405ep.flash", bios_size,
>                                blk_by_legacy_dinfo(dinfo),
> -                              64 * KiB, 1,
> +                              64 * KiB,
>                                4, 0x0001, 0x22DA, 0x0000, 0x0000, 0x555, =
0x2AA,
>                                1);
>          fl_idx++;
> diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
> index 443820901d4..b7288dcba80 100644
> --- a/hw/sh4/r2d.c
> +++ b/hw/sh4/r2d.c
> @@ -301,7 +301,7 @@ static void r2d_init(MachineState *machine)
>      dinfo =3D drive_get(IF_PFLASH, 0, 0);
>      pflash_cfi02_register(0x0, "r2d.flash", FLASH_SIZE,
>                            dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
> -                          64 * KiB, 1, 2, 0x0001, 0x227e, 0x2220, 0x2200,
> +                          64 * KiB, 2, 0x0001, 0x227e, 0x2220, 0x2200,
>                            0x555, 0x2aa, 0);
> =20
>      /* NIC: rtl8139 on-board, and 2 slots. */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--whqoo4aav4AqWT8g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBhU6QACgkQbDjKyiDZ
s5IfTxAArwoh5tiOGaQDwwySJibn2OlWFHhDeHWypBm4CRO7ISGSS30+jC70bi2X
Tdqm0kpivNw2yvR6mGlyhP9/Hj3mJIzUkmmEiptmYLAJKEvinEOiy54URu/xnoDy
V/kMQqYElaQO5eAerIcp22fv1VNTVsRLWvJhBev7AwaZ3pJ87/7gJmhAmd2bIMya
SPQ7h9SO7I00TV7QqHXaUS4aUhIMmpQL5D/oXpH/QmRoVOqsB3tDPTgMzP6t5Be6
MrHc+Y7ZzbFWmTffQxrQb/kcc98rSQzLbJar5Ulnw1iyjBSSoPQsrpERHBkWto+l
Ffvi7zs5DUcfNymjRz2Uo5rh2oKBj5J5lw1HwB+jLI0zUb0VUMPAHt73xDKk1TiN
qPk2yEjhGXXINHzl0QJn2egYDnOcvUs6QUTr3SPCAX2any3f+RcTdeneyCgZRiy+
YdWPgw/E0dbO0pC5ARtMc3VzdSC3UUVHomwBD48rdMEGZS5NLVpoIFROcGmvwp33
z0Vncv3wgOVXfBnsrcC8XcUyW5SXgVE4r/Egf4/Usb2WOsDyVMZTQ+9278yc0/R/
atVOBrESMk9IPDpq1pXW25zHn+nFU89KiDexvkYKAqr44iHC9iHpCUEOsgCu3ZpP
sK4AYYYVtAsCywGsv1gdIe3KtV7UWkb00LUYH9KOvE9PQ+YGXfY=
=Ft1W
-----END PGP SIGNATURE-----

--whqoo4aav4AqWT8g--

