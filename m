Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D23E3FE81E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 05:42:56 +0200 (CEST)
Received: from localhost ([::1]:44038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLdct-0003X5-7T
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 23:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLdLa-0001fo-08; Wed, 01 Sep 2021 23:25:02 -0400
Received: from ozlabs.org ([203.11.71.1]:44537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLdLT-0000DZ-IO; Wed, 01 Sep 2021 23:25:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630553072;
 bh=+fh9NTbLUQvQYvvY3mb+kbey81GXe7ZfZS5FNXvX2zI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a0b6mYvXPanvnBPuctehRjmZ1Ca5+2eNkvMhYwklCZ7DwGLyzPxRhBlMOwBLq8iUk
 sxLt2Qh9tVWLSuI8CqVVGXKQngj956f2FDgO000imaHUzyJRBNV7WB4mljoeCMpU+l
 8XTyHP8oemExJnH0qq9Rg1qrFYkIhoSiEma4aVhc=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H0R9r32vXz9t54; Thu,  2 Sep 2021 13:24:32 +1000 (AEST)
Date: Thu, 2 Sep 2021 11:39:31 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 8/8] ppc/pnv: Rename "id" to "quad-id" in PnvQuad
Message-ID: <YTArU/F/ijVDgJi3@yekko>
References: <20210901094153.227671-1-clg@kaod.org>
 <20210901094153.227671-9-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GqiU1KyxgR/hQpDx"
Content-Disposition: inline
In-Reply-To: <20210901094153.227671-9-clg@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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


--GqiU1KyxgR/hQpDx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 01, 2021 at 11:41:53AM +0200, C=E9dric Le Goater wrote:
> This to avoid possible conflicts with the "id" property of QOM objects.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-6.2, thanks.

> ---
>  include/hw/ppc/pnv_core.h | 2 +-
>  hw/ppc/pnv.c              | 4 ++--
>  hw/ppc/pnv_core.c         | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/include/hw/ppc/pnv_core.h b/include/hw/ppc/pnv_core.h
> index 6ecee98a76ed..c22eab2e1f69 100644
> --- a/include/hw/ppc/pnv_core.h
> +++ b/include/hw/ppc/pnv_core.h
> @@ -67,7 +67,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(PnvQuad, PNV_QUAD)
>  struct PnvQuad {
>      DeviceState parent_obj;
> =20
> -    uint32_t id;
> +    uint32_t quad_id;
>      MemoryRegion xscom_regs;
>  };
>  #endif /* PPC_PNV_CORE_H */
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 761b82be7401..93f76738fc94 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1370,10 +1370,10 @@ static void pnv_chip_quad_realize(Pnv9Chip *chip9=
, Error **errp)
>                                             sizeof(*eq), TYPE_PNV_QUAD,
>                                             &error_fatal, NULL);
> =20
> -        object_property_set_int(OBJECT(eq), "id", core_id, &error_fatal);
> +        object_property_set_int(OBJECT(eq), "quad-id", core_id, &error_f=
atal);
>          qdev_realize(DEVICE(eq), NULL, &error_fatal);
> =20
> -        pnv_xscom_add_subregion(chip, PNV9_XSCOM_EQ_BASE(eq->id),
> +        pnv_xscom_add_subregion(chip, PNV9_XSCOM_EQ_BASE(eq->quad_id),
>                                  &eq->xscom_regs);
>      }
>  }
> diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
> index 4de8414df212..19e8eb885f71 100644
> --- a/hw/ppc/pnv_core.c
> +++ b/hw/ppc/pnv_core.c
> @@ -407,13 +407,13 @@ static void pnv_quad_realize(DeviceState *dev, Erro=
r **errp)
>      PnvQuad *eq =3D PNV_QUAD(dev);
>      char name[32];
> =20
> -    snprintf(name, sizeof(name), "xscom-quad.%d", eq->id);
> +    snprintf(name, sizeof(name), "xscom-quad.%d", eq->quad_id);
>      pnv_xscom_region_init(&eq->xscom_regs, OBJECT(dev), &pnv_quad_xscom_=
ops,
>                            eq, name, PNV9_XSCOM_EQ_SIZE);
>  }
> =20
>  static Property pnv_quad_properties[] =3D {
> -    DEFINE_PROP_UINT32("id", PnvQuad, id, 0),
> +    DEFINE_PROP_UINT32("quad-id", PnvQuad, quad_id, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GqiU1KyxgR/hQpDx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEwK1MACgkQbDjKyiDZ
s5IaJw/9FAGXljgir7b1Ov4593CT+KLqJ2q32dNhfOGPhVp9/6tVkRAy+amSh8xv
35+jzHs4fupJvxvnCrX8yex8/alLpi9hg30Sa/05/pEoy0Cg76h+JDB3GP8CTXlH
zuvr51x1p+TNM5qUPjhyfHrhOpAzrSburpODiLzKC+Eg3PsXkX2NRZ6UZHgdH+8H
yY2uXjMRVmL8mOYAFoTlSaMF2QEBtDKOMqnuwblupeMLJ7/9WIVt9RI14ba3yEhe
zIHncdR8Lnh8PTdmT+jljrv3FnK2NCkNcIvGlilrzJLOKmgkePS9g4VU8MkXQ1W4
cDKv2s3B5FsTnvTxkTiI2mTc2BeLm3/XUb1p67/HcQewc2knpPMkrwvohxzC42U0
ccAS17Ugbl9VpnQ8eQGjBqyUG5to+7v3LLkL6yiz0zrM+u0RBNdt0nFiUTfzvPUZ
rd4qu+K+4xu8+Sv7tCUbMTFzXAsrpqhDkR+ZdZQdDzc5tXokhvWueMF+F6EpgMxR
WS2n4GDdoOxb92I53mtxiB3J6Y1pQzZjlKQFCZELzaDrzuHj2fzSPxgZE++QO73F
UFnUBp9/vsFhs9hJocx2QQK1dohY4P46Znw3r85UUDV/zf/kAAnekkJyyJM3CkLa
QTd+u9zQCVpbiklhEvzItxgRxm5GdyyrOGz48Zp8PJLTgWGWNvU=
=LRO+
-----END PGP SIGNATURE-----

--GqiU1KyxgR/hQpDx--

