Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8AA3F6FA1
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 08:35:36 +0200 (CEST)
Received: from localhost ([::1]:37660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mImVb-00048A-CW
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 02:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mImRt-0001da-85; Wed, 25 Aug 2021 02:31:45 -0400
Received: from ozlabs.org ([203.11.71.1]:51439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mImRq-00076l-C9; Wed, 25 Aug 2021 02:31:44 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GvbjP6Nyfz9sXN; Wed, 25 Aug 2021 16:31:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629873097;
 bh=YlxmvZgh72hm4dpJlUvuQJmYYXRG5SbOLFaXv38j/i4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HAi98StclEwMV/wFKiocYfUQv+AygnTgZSkbBiEPY6V9+ta4I4iMC71MVqZLfVKvz
 wBpNBMAPvy4ZN5GZRhE1uJfhpYwZmZeAm4O6GcKsCLPHHpmIJQNecIcUSaQK2idH5Y
 PEB7iktOLdyyHpmHHw7sMYdKZ22gHM17myv2f8J8=
Date: Wed, 25 Aug 2021 16:12:27 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 15/26] ppc/pnv: Add a HOMER model to POWER10
Message-ID: <YSXfS070ZALDWJMQ@yekko>
References: <20210809134547.689560-1-clg@kaod.org>
 <20210809134547.689560-16-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RQGYdWsleVmS8KR7"
Content-Disposition: inline
In-Reply-To: <20210809134547.689560-16-clg@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--RQGYdWsleVmS8KR7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 03:45:36PM +0200, C=E9dric Le Goater wrote:
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  include/hw/ppc/pnv.h       | 10 ++++++
>  include/hw/ppc/pnv_homer.h |  3 ++
>  include/hw/ppc/pnv_xscom.h |  3 ++
>  hw/ppc/pnv.c               | 20 ++++++++++++
>  hw/ppc/pnv_homer.c         | 64 ++++++++++++++++++++++++++++++++++++++
>  5 files changed, 100 insertions(+)
>=20
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index f44b9947d00e..3ea2d798eed1 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -128,6 +128,7 @@ struct Pnv10Chip {
>      Pnv9Psi      psi;
>      PnvLpcController lpc;
>      PnvOCC       occ;
> +    PnvHomer     homer;
> =20
>      uint32_t     nr_quads;
>      PnvQuad      *quads;
> @@ -358,4 +359,13 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor);
>  #define PNV10_XIVE2_END_SIZE        0x0000020000000000ull
>  #define PNV10_XIVE2_END_BASE(chip)  PNV10_CHIP_BASE(chip, 0x000606000000=
0000ull)
> =20
> +#define PNV10_OCC_COMMON_AREA_SIZE  0x0000000000800000ull
> +#define PNV10_OCC_COMMON_AREA_BASE  0x300fff800000ull
> +#define PNV10_OCC_SENSOR_BASE(chip) (PNV10_OCC_COMMON_AREA_BASE +       \
> +    PNV_OCC_SENSOR_DATA_BLOCK_BASE((chip)->chip_id))
> +
> +#define PNV10_HOMER_SIZE              0x0000000000400000ull
> +#define PNV10_HOMER_BASE(chip)                                          =
 \
> +    (0x300ffd800000ll + ((uint64_t)(chip)->chip_id) * PNV10_HOMER_SIZE)
> +
>  #endif /* PPC_PNV_H */
> diff --git a/include/hw/ppc/pnv_homer.h b/include/hw/ppc/pnv_homer.h
> index 1889e3083c57..07e8b193116e 100644
> --- a/include/hw/ppc/pnv_homer.h
> +++ b/include/hw/ppc/pnv_homer.h
> @@ -32,6 +32,9 @@ DECLARE_INSTANCE_CHECKER(PnvHomer, PNV8_HOMER,
>  #define TYPE_PNV9_HOMER TYPE_PNV_HOMER "-POWER9"
>  DECLARE_INSTANCE_CHECKER(PnvHomer, PNV9_HOMER,
>                           TYPE_PNV9_HOMER)
> +#define TYPE_PNV10_HOMER TYPE_PNV_HOMER "-POWER10"
> +DECLARE_INSTANCE_CHECKER(PnvHomer, PNV10_HOMER,
> +                         TYPE_PNV10_HOMER)
> =20
>  struct PnvHomer {
>      DeviceState parent;
> diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
> index 75db33d46af6..7c7440de0c40 100644
> --- a/include/hw/ppc/pnv_xscom.h
> +++ b/include/hw/ppc/pnv_xscom.h
> @@ -134,6 +134,9 @@ struct PnvXScomInterfaceClass {
>  #define PNV10_XSCOM_OCC_BASE       PNV9_XSCOM_OCC_BASE
>  #define PNV10_XSCOM_OCC_SIZE       PNV9_XSCOM_OCC_SIZE
> =20
> +#define PNV10_XSCOM_PBA_BASE       0x01010CDA
> +#define PNV10_XSCOM_PBA_SIZE       0x40
> +
>  #define PNV10_XSCOM_XIVE2_BASE     0x2010800
>  #define PNV10_XSCOM_XIVE2_SIZE     0x400
> =20
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 125466023148..2d7eade23ccc 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1614,6 +1614,7 @@ static void pnv_chip_power10_instance_init(Object *=
obj)
>      object_initialize_child(obj, "psi", &chip10->psi, TYPE_PNV10_PSI);
>      object_initialize_child(obj, "lpc", &chip10->lpc, TYPE_PNV10_LPC);
>      object_initialize_child(obj, "occ",  &chip10->occ, TYPE_PNV10_OCC);
> +    object_initialize_child(obj, "homer", &chip10->homer, TYPE_PNV10_HOM=
ER);
> =20
>      for (i =3D 0; i < PNV10_CHIP_MAX_PEC; i++) {
>          object_initialize_child(obj, "pec[*]", &chip10->pecs[i],
> @@ -1797,6 +1798,25 @@ static void pnv_chip_power10_realize(DeviceState *=
dev, Error **errp)
>      pnv_xscom_add_subregion(chip, PNV10_XSCOM_OCC_BASE,
>                              &chip10->occ.xscom_regs);
> =20
> +    /* OCC SRAM model */
> +    memory_region_add_subregion(get_system_memory(),
> +                                PNV10_OCC_SENSOR_BASE(chip),
> +                                &chip10->occ.sram_regs);
> +
> +    /* HOMER */
> +    object_property_set_link(OBJECT(&chip10->homer), "chip", OBJECT(chip=
),
> +                             &error_abort);
> +    if (!qdev_realize(DEVICE(&chip10->homer), NULL, errp)) {
> +        return;
> +    }
> +    /* Homer Xscom region */
> +    pnv_xscom_add_subregion(chip, PNV10_XSCOM_PBA_BASE,
> +                            &chip10->homer.pba_regs);
> +
> +    /* Homer mmio region */
> +    memory_region_add_subregion(get_system_memory(), PNV10_HOMER_BASE(ch=
ip),
> +                                &chip10->homer.regs);
> +
>      /* PHBs */
>      pnv_chip_power10_phb_realize(chip, &local_err);
>      if (local_err) {
> diff --git a/hw/ppc/pnv_homer.c b/hw/ppc/pnv_homer.c
> index 9a262629b73a..ea73919e54ca 100644
> --- a/hw/ppc/pnv_homer.c
> +++ b/hw/ppc/pnv_homer.c
> @@ -332,6 +332,69 @@ static const TypeInfo pnv_homer_power9_type_info =3D=
 {
>      .class_init    =3D pnv_homer_power9_class_init,
>  };
> =20
> +static uint64_t pnv_homer_power10_pba_read(void *opaque, hwaddr addr,
> +                                          unsigned size)
> +{
> +    PnvHomer *homer =3D PNV_HOMER(opaque);
> +    PnvChip *chip =3D homer->chip;
> +    uint32_t reg =3D addr >> 3;
> +    uint64_t val =3D 0;
> +
> +    switch (reg) {
> +    case PBA_BAR0:
> +        val =3D PNV10_HOMER_BASE(chip);
> +        break;
> +    case PBA_BARMASK0: /* P10 homer region mask */
> +        val =3D (PNV10_HOMER_SIZE - 1) & 0x300000;
> +        break;
> +    case PBA_BAR2: /* P10 occ common area */
> +        val =3D PNV10_OCC_COMMON_AREA_BASE;
> +        break;
> +    case PBA_BARMASK2: /* P10 occ common area size */
> +        val =3D (PNV10_OCC_COMMON_AREA_SIZE - 1) & 0x700000;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "PBA: read to unimplemented register: O=
x%"
> +                      HWADDR_PRIx "\n", addr >> 3);
> +    }
> +    return val;
> +}
> +
> +static void pnv_homer_power10_pba_write(void *opaque, hwaddr addr,
> +                                         uint64_t val, unsigned size)
> +{
> +    qemu_log_mask(LOG_UNIMP, "PBA: write to unimplemented register: Ox%"
> +                  HWADDR_PRIx "\n", addr >> 3);
> +}
> +
> +static const MemoryRegionOps pnv_homer_power10_pba_ops =3D {
> +    .read =3D pnv_homer_power10_pba_read,
> +    .write =3D pnv_homer_power10_pba_write,
> +    .valid.min_access_size =3D 8,
> +    .valid.max_access_size =3D 8,
> +    .impl.min_access_size =3D 8,
> +    .impl.max_access_size =3D 8,
> +    .endianness =3D DEVICE_BIG_ENDIAN,
> +};
> +
> +static void pnv_homer_power10_class_init(ObjectClass *klass, void *data)
> +{
> +    PnvHomerClass *homer =3D PNV_HOMER_CLASS(klass);
> +
> +    homer->pba_size =3D PNV10_XSCOM_PBA_SIZE;
> +    homer->pba_ops =3D &pnv_homer_power10_pba_ops;
> +    homer->homer_size =3D PNV10_HOMER_SIZE;
> +    homer->homer_ops =3D &pnv_power9_homer_ops; /* TODO */
> +    homer->core_max_base =3D PNV9_CORE_MAX_BASE;
> +}
> +
> +static const TypeInfo pnv_homer_power10_type_info =3D {
> +    .name          =3D TYPE_PNV10_HOMER,
> +    .parent        =3D TYPE_PNV_HOMER,
> +    .instance_size =3D sizeof(PnvHomer),
> +    .class_init    =3D pnv_homer_power10_class_init,
> +};
> +
>  static void pnv_homer_realize(DeviceState *dev, Error **errp)
>  {
>      PnvHomer *homer =3D PNV_HOMER(dev);
> @@ -377,6 +440,7 @@ static void pnv_homer_register_types(void)
>      type_register_static(&pnv_homer_type_info);
>      type_register_static(&pnv_homer_power8_type_info);
>      type_register_static(&pnv_homer_power9_type_info);
> +    type_register_static(&pnv_homer_power10_type_info);
>  }
> =20
>  type_init(pnv_homer_register_types);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RQGYdWsleVmS8KR7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEl30sACgkQbDjKyiDZ
s5KXfxAAgRoJnFC2ohV+QhzdEdJg9AqhQsvk2G5QXnbun3KjxmnGBj/MtqanHlkq
VZMrPZ0NFIfcd8txYXxUApK2k44VqQCvqdcq7wOW3ypEnE+WkiGhgM/ASDKm1Gul
6Ug0xrZC0uR6VhbFNnY0ONF6Yj+tdTBgr4Ois+Fnoz6ljTa0Ly1ZUEfAooLWdp91
y7EdlIMDss9Fc6rgH115wYEm+HZnu7eqlooGXBgl7QiEq1I2S+SMMKD+Q0BSI4ao
OT+l4HQ8thaZusrfCFD5yAqdwqYeZENl0cxqj9to31i0Vazkiz7SZEVCJBMSb/tv
n7RVo2F/9DfLCdc99Q/iOiA2Cn8z1ghKx9zYGtuQxDT0rrcQtLPK1C3exUK/AlTw
LXj4owHDPE/UJ80+0BOksfj4Lv3AFtipKWhWxZp59Lk7/nUjHL5VowYmY9vBkyw4
hA6XRNMbsqxBC0MiTjIC9YPAdY0XaCpEWTgh5zRPhYD8MFRP2sQGNl9nuBoon2s8
koO/yGH+Go8UAldcVQWsupskqXpj+gdSV0re2woiSH5fgAZnHJ8zCMSbTw4aAjKp
OtJVs628qcG7gFc8niqPbFETZj5ZMeFkZQu2jBInfa7QZ7FXsYlTR0/YV8jZX3hD
3RWZLRsFWq2APWbYzgMAj0uE3Lo6OjF1BAAJWmheOHp8sUsNgTw=
=B3Xw
-----END PGP SIGNATURE-----

--RQGYdWsleVmS8KR7--

