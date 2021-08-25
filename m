Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B53173F6FAB
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 08:38:10 +0200 (CEST)
Received: from localhost ([::1]:42886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mImY5-0007lL-OJ
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 02:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mImRu-0001fN-R6; Wed, 25 Aug 2021 02:31:46 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:48361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mImRq-00076i-MW; Wed, 25 Aug 2021 02:31:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GvbjP5gHLz9sWd; Wed, 25 Aug 2021 16:31:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629873097;
 bh=QnMZA1gfGRdzmua2zlaKa6J0d3dyZPsKeHsCz5BmF8U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Isjg+hGffo203VHdf5zhI8vSvdMY4KFAT0ivttf3VfSLtmcB9nySQLwuJ+ho124sf
 PuMvHPe95KfpCx8WzkVWfOV+5rW7BHRt4tqD/PQC3kVgqr8n5/3U5QdtLE1K9C4lSJ
 0AqQG1YKKfaB3UrEuetmAbfTLd97T3ZnTnrSOWfQ=
Date: Wed, 25 Aug 2021 16:06:48 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 12/26] ppc/pnv: Add a OCC model for POWER10
Message-ID: <YSXd+C8IBxgbRd6L@yekko>
References: <20210809134547.689560-1-clg@kaod.org>
 <20210809134547.689560-13-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="inUUuPcegtpYWfgj"
Content-Disposition: inline
In-Reply-To: <20210809134547.689560-13-clg@kaod.org>
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--inUUuPcegtpYWfgj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 03:45:33PM +0200, C=E9dric Le Goater wrote:
> Our OCC model is very mininal and POWER10 can simply reuse the OCC
> model we introduced for POWER9.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  include/hw/ppc/pnv.h       |  1 +
>  include/hw/ppc/pnv_occ.h   |  2 ++
>  include/hw/ppc/pnv_xscom.h |  3 +++
>  hw/ppc/pnv.c               | 10 ++++++++++
>  hw/ppc/pnv_occ.c           | 16 ++++++++++++++++
>  5 files changed, 32 insertions(+)
>=20
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index b773b09f9f8e..a299fbc7f25c 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -127,6 +127,7 @@ struct Pnv10Chip {
>      PnvXive2     xive;
>      Pnv9Psi      psi;
>      PnvLpcController lpc;
> +    PnvOCC       occ;
>  };
> =20
>  #define PNV10_PIR2FUSEDCORE(pir) (((pir) >> 3) & 0xf)
> diff --git a/include/hw/ppc/pnv_occ.h b/include/hw/ppc/pnv_occ.h
> index b78185aecaf2..f982ba002481 100644
> --- a/include/hw/ppc/pnv_occ.h
> +++ b/include/hw/ppc/pnv_occ.h
> @@ -32,6 +32,8 @@ DECLARE_INSTANCE_CHECKER(PnvOCC, PNV8_OCC,
>  #define TYPE_PNV9_OCC TYPE_PNV_OCC "-POWER9"
>  DECLARE_INSTANCE_CHECKER(PnvOCC, PNV9_OCC,
>                           TYPE_PNV9_OCC)
> +#define TYPE_PNV10_OCC TYPE_PNV_OCC "-POWER10"
> +DECLARE_INSTANCE_CHECKER(PnvOCC, PNV10_OCC, TYPE_PNV10_OCC)
> =20
>  #define PNV_OCC_SENSOR_DATA_BLOCK_OFFSET 0x00580000
>  #define PNV_OCC_SENSOR_DATA_BLOCK_SIZE   0x00025800
> diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
> index 188da874a4b0..151df15378d1 100644
> --- a/include/hw/ppc/pnv_xscom.h
> +++ b/include/hw/ppc/pnv_xscom.h
> @@ -131,6 +131,9 @@ struct PnvXScomInterfaceClass {
>  #define PNV10_XSCOM_PSIHB_BASE     0x3011D00
>  #define PNV10_XSCOM_PSIHB_SIZE     0x100
> =20
> +#define PNV10_XSCOM_OCC_BASE       PNV9_XSCOM_OCC_BASE
> +#define PNV10_XSCOM_OCC_SIZE       PNV9_XSCOM_OCC_SIZE
> +
>  #define PNV10_XSCOM_XIVE2_BASE     0x2010800
>  #define PNV10_XSCOM_XIVE2_SIZE     0x400
> =20
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 28c928b3985a..f75d90e61fa8 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1602,6 +1602,7 @@ static void pnv_chip_power10_instance_init(Object *=
obj)
>                                "xive-fabric");
>      object_initialize_child(obj, "psi", &chip10->psi, TYPE_PNV10_PSI);
>      object_initialize_child(obj, "lpc", &chip10->lpc, TYPE_PNV10_LPC);
> +    object_initialize_child(obj, "occ",  &chip10->occ, TYPE_PNV10_OCC);
>  }
> =20
>  static void pnv_chip_power10_realize(DeviceState *dev, Error **errp)
> @@ -1667,6 +1668,15 @@ static void pnv_chip_power10_realize(DeviceState *=
dev, Error **errp)
>      chip->fw_mr =3D &chip10->lpc.isa_fw;
>      chip->dt_isa_nodename =3D g_strdup_printf("/lpcm-opb@%" PRIx64 "/lpc=
@0",
>                                              (uint64_t) PNV10_LPCM_BASE(c=
hip));
> +
> +    /* Create the simplified OCC model */
> +    object_property_set_link(OBJECT(&chip10->occ), "psi", OBJECT(&chip10=
->psi),
> +                             &error_abort);
> +    if (!qdev_realize(DEVICE(&chip10->occ), NULL, errp)) {
> +        return;
> +    }
> +    pnv_xscom_add_subregion(chip, PNV10_XSCOM_OCC_BASE,
> +                            &chip10->occ.xscom_regs);
>  }
> =20
>  static uint32_t pnv_chip_power10_xscom_pcba(PnvChip *chip, uint64_t addr)
> diff --git a/hw/ppc/pnv_occ.c b/hw/ppc/pnv_occ.c
> index 5a716c256edc..4ed66f5e1fcc 100644
> --- a/hw/ppc/pnv_occ.c
> +++ b/hw/ppc/pnv_occ.c
> @@ -236,7 +236,9 @@ static const MemoryRegionOps pnv_occ_power9_xscom_ops=
 =3D {
>  static void pnv_occ_power9_class_init(ObjectClass *klass, void *data)
>  {
>      PnvOCCClass *poc =3D PNV_OCC_CLASS(klass);
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> =20
> +    dc->desc =3D "PowerNV OCC Controller (POWER9)";
>      poc->xscom_size =3D PNV9_XSCOM_OCC_SIZE;
>      poc->xscom_ops =3D &pnv_occ_power9_xscom_ops;
>      poc->psi_irq =3D PSIHB9_IRQ_OCC;
> @@ -249,6 +251,19 @@ static const TypeInfo pnv_occ_power9_type_info =3D {
>      .class_init    =3D pnv_occ_power9_class_init,
>  };
> =20
> +static void pnv_occ_power10_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    dc->desc =3D "PowerNV OCC Controller (POWER10)";
> +}
> +
> +static const TypeInfo pnv_occ_power10_type_info =3D {
> +    .name          =3D TYPE_PNV10_OCC,
> +    .parent        =3D TYPE_PNV9_OCC,
> +    .class_init    =3D pnv_occ_power10_class_init,
> +};
> +
>  static void pnv_occ_realize(DeviceState *dev, Error **errp)
>  {
>      PnvOCC *occ =3D PNV_OCC(dev);
> @@ -297,6 +312,7 @@ static void pnv_occ_register_types(void)
>      type_register_static(&pnv_occ_type_info);
>      type_register_static(&pnv_occ_power8_type_info);
>      type_register_static(&pnv_occ_power9_type_info);
> +    type_register_static(&pnv_occ_power10_type_info);
>  }
> =20
>  type_init(pnv_occ_register_types);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--inUUuPcegtpYWfgj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEl3fgACgkQbDjKyiDZ
s5Ke6g//RQ0cOyvNslWXro/NbweGwNZP9Qk8eYBL141J9t4cKoE4EUo5srvjNQ97
GV6QHWkGfdXqCCs7RbQgPQS/sIsYym82DBm4WgG8i7P3v+FvTj8l0zXBSWz1sLzE
XbBIwvNllmvai1Hjvags6kVZy015kD/jhd2nTjxK8liYaPPuQeyTkNAGPqWG3ZTu
7dCMfKOa/smlbxo/L2wcNWwk8jUBVXWKKqlpYJBJSVl1/JKPHQEZt543khXukeam
QKzRXZj7TxqyNBG9XmN2cme3Bmy6Xv9Uh85TuEYk2tMQpoJ3IZbaAcQ752u2qxtD
wliUnswXor3kIj4G+Ac1mH6+JFNwPDobbizWc5DTl4qybbSPBnR3rfjRvjldvyjM
yHsu4aqAQfkZ0QP9F+cXYDiOzqID1WyRFhEUG+CgQayFnKu6M5wTPluOuM7K3Fag
gb148VM1AT0+3aIotyh6KSaRDo8lEjY06TSZDSBUNsA4+nbJxiLaAX/ORApbWBPL
sAPG25AMt0gzVEzkpRGLwVRpORP65gNOixI1w1sWIqXt7DUycgJtVT0sVHWvIykD
CbCDOKq+c0JJD54B7E/y9lKZt0LIyDcrjDL9JFEPWMao07jMTX1tzzVmBuUngvTz
Gexp3IjK5EOSxp7IslWV68KFGqhwkzUqcKFc+NH/s8pz53xS6V0=
=5ffP
-----END PGP SIGNATURE-----

--inUUuPcegtpYWfgj--

