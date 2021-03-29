Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7865034C279
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 06:23:37 +0200 (CEST)
Received: from localhost ([::1]:42666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQjRA-0002Fy-Hu
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 00:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lQjOZ-0007uH-CW; Mon, 29 Mar 2021 00:20:55 -0400
Received: from ozlabs.org ([203.11.71.1]:53129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lQjOW-00005U-6S; Mon, 29 Mar 2021 00:20:55 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F7zs91fqxz9sVw; Mon, 29 Mar 2021 15:20:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616991645;
 bh=KOTKqRAxgQ9s/I9AykcTB7cJ0k0ebUWJZHSa0SI2H6k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TKJyZR42MuyKAffqE90XJpcOdnlW78psCiDV1lX/OQ2xDaz50c6gpA4iemvGJzYD9
 7f7D5tYSo+hB/A6WqMlAvgyKs1jszWFOa+FjRQxMl6JfuqyG0Rqlt07Y2skWJaUp4t
 RgMiaENSk1zKQPotou4sN9rW29Reo+LneTmluiCM=
Date: Mon, 29 Mar 2021 15:11:28 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-6.1 06/10] hw/block/pflash_cfi02: Remove
 pflash_setup_mappings()
Message-ID: <YGFTcPHZ+reDwK+T@yekko.fritz.box>
References: <20210326002728.1069834-1-f4bug@amsat.org>
 <20210326002728.1069834-7-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bxLY1v2094gJllAS"
Content-Disposition: inline
In-Reply-To: <20210326002728.1069834-7-f4bug@amsat.org>
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
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--bxLY1v2094gJllAS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 26, 2021 at 01:27:24AM +0100, Philippe Mathieu-Daud=E9 wrote:
> All boards calling pflash_cfi02_register() use nb_mappings=3D1,
> which does not do any mapping:
>=20
>   $ git grep -wl pflash_cfi02_register hw/
>   hw/arm/xilinx_zynq.c
>   hw/block/pflash_cfi02.c
>   hw/lm32/lm32_boards.c
>   hw/ppc/ppc405_boards.c
>   hw/sh4/r2d.c
>=20
> We can remove this now unneeded code.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/block/pflash_cfi02.c | 35 ++---------------------------------
>  1 file changed, 2 insertions(+), 33 deletions(-)
>=20
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 02c514fb6e0..6f4b3e3c3fe 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -75,7 +75,6 @@ struct PFlashCFI02 {
>      uint32_t nb_blocs[PFLASH_MAX_ERASE_REGIONS];
>      uint32_t sector_len[PFLASH_MAX_ERASE_REGIONS];
>      uint32_t chip_len;
> -    uint8_t mappings;
>      uint8_t width;
>      uint8_t be;
>      int wcycle; /* if 0, the flash is read normally */
> @@ -92,13 +91,6 @@ struct PFlashCFI02 {
>      uint16_t unlock_addr1;
>      uint8_t cfi_table[0x4d];
>      QEMUTimer timer;
> -    /*
> -     * The device replicates the flash memory across its memory space.  =
Emulate
> -     * that by having a container (.mem) filled with an array of aliases
> -     * (.mem_mappings) pointing to the flash memory (.orig_mem).
> -     */
> -    MemoryRegion mem;
> -    MemoryRegion *mem_mappings;    /* array; one per mapping */
>      MemoryRegion orig_mem;
>      bool rom_mode;
>      int read_counter; /* used for lazy switch-back to rom mode */
> @@ -158,23 +150,6 @@ static inline void toggle_dq2(PFlashCFI02 *pfl)
>      pfl->status ^=3D 0x04;
>  }
> =20
> -/*
> - * Set up replicated mappings of the same region.
> - */
> -static void pflash_setup_mappings(PFlashCFI02 *pfl)
> -{
> -    unsigned i;
> -    hwaddr size =3D memory_region_size(&pfl->orig_mem);
> -
> -    memory_region_init(&pfl->mem, OBJECT(pfl), "pflash", pfl->mappings *=
 size);
> -    pfl->mem_mappings =3D g_new(MemoryRegion, pfl->mappings);
> -    for (i =3D 0; i < pfl->mappings; ++i) {
> -        memory_region_init_alias(&pfl->mem_mappings[i], OBJECT(pfl),
> -                                 "pflash-alias", &pfl->orig_mem, 0, size=
);
> -        memory_region_add_subregion(&pfl->mem, i * size, &pfl->mem_mappi=
ngs[i]);
> -    }
> -}
> -
>  static void pflash_reset_state_machine(PFlashCFI02 *pfl)
>  {
>      trace_pflash_reset(pfl->name);
> @@ -917,12 +892,7 @@ static void pflash_cfi02_realize(DeviceState *dev, E=
rror **errp)
>      pfl->sector_erase_map =3D bitmap_new(pfl->total_sectors);
> =20
>      pfl->rom_mode =3D true;
> -    if (pfl->mappings > 1) {
> -        pflash_setup_mappings(pfl);
> -        sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
> -    } else {
> -        sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->orig_mem);
> -    }
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->orig_mem);
> =20
>      timer_init_ns(&pfl->timer, QEMU_CLOCK_VIRTUAL, pflash_timer, pfl);
>      pfl->status =3D 0;
> @@ -950,7 +920,6 @@ static Property pflash_cfi02_properties[] =3D {
>      DEFINE_PROP_UINT32("num-blocks3", PFlashCFI02, nb_blocs[3], 0),
>      DEFINE_PROP_UINT32("sector-length3", PFlashCFI02, sector_len[3], 0),
>      DEFINE_PROP_UINT8("width", PFlashCFI02, width, 0),
> -    DEFINE_PROP_UINT8("mappings", PFlashCFI02, mappings, 0),
>      DEFINE_PROP_UINT8("big-endian", PFlashCFI02, be, 0),
>      DEFINE_PROP_UINT16("id0", PFlashCFI02, ident0, 0),
>      DEFINE_PROP_UINT16("id1", PFlashCFI02, ident1, 0),
> @@ -1008,6 +977,7 @@ PFlashCFI02 *pflash_cfi02_register(hwaddr base,
>  {
>      DeviceState *dev =3D qdev_new(TYPE_PFLASH_CFI02);
> =20
> +    assert(nb_mappings <=3D 1);
>      if (blk) {
>          qdev_prop_set_drive(dev, "drive", blk);
>      }
> @@ -1015,7 +985,6 @@ PFlashCFI02 *pflash_cfi02_register(hwaddr base,
>      qdev_prop_set_uint32(dev, "num-blocks", size / sector_len);
>      qdev_prop_set_uint32(dev, "sector-length", sector_len);
>      qdev_prop_set_uint8(dev, "width", width);
> -    qdev_prop_set_uint8(dev, "mappings", nb_mappings);
>      qdev_prop_set_uint8(dev, "big-endian", !!be);
>      qdev_prop_set_uint16(dev, "id0", id0);
>      qdev_prop_set_uint16(dev, "id1", id1);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bxLY1v2094gJllAS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBhU24ACgkQbDjKyiDZ
s5IBFxAArAuwkHR5sJlFAfbjUGS5g33rJ8CpeOpYzpT+V29MaS9xffkTtARS11Xb
lt7Z/8dmaqNChWHyW5oBto0FoT7XDx/z7U4a/6FRUV4rIrjCD2xWfPeAB1/pGqkt
CPa672aQE78kSc2tIvWUMbSAGKDLlBiu6519s6/1HuRg4hTt9p5OmmKvtNO7724j
KhkeXBxMt4hWXG/p/8AlZcvgCyZBfx5/3lvdMpXRt+hCLWJBrvW+N13iyhCRajh9
H8JTeGgcF50qvzpQ1zDzU1fQm2tZ9hDASpgKMVIOcttEVQXNREezqxSOY1esi9Y9
0mVXeTC2VwFJsDTl2CI2gFELHzStZXoN36Z5Ps39e+qQOCuXOESAVJ+szFkiNwLS
v6gx2TRf24ZUD2yqtotToNA5/FbvY7lpaf7gtLB+HZqLKmZ8/7groDNMfJ57Uwox
HjskrhGK4Ic593wDy5xpfJNz7NMdX/8RvyLZI/ABavGuMEhCXL0G9QxRMhXylWfN
YKVkcmpwk1tcju3cmFTK7eDtPr4aMBPixq8rAm7mSza3NvLusQJIsbLBC7rfnffN
gX+OPI3NSsI2KEGtVUYfg8nrlHRtcBUoJN9kD/mruq/N4aiMVmDnkDyb871Tod4o
+FDFgijYfybNi28Z0Vw28FMopwLEdEfERX5aZFE2GXQi98cuVgc=
=8Neu
-----END PGP SIGNATURE-----

--bxLY1v2094gJllAS--

