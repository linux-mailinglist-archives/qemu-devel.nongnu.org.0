Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFD6306AB6
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 02:52:02 +0100 (CET)
Received: from localhost ([::1]:55930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4wTZ-0005Ex-4q
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 20:52:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l4wO6-0007uC-2m; Wed, 27 Jan 2021 20:46:22 -0500
Received: from ozlabs.org ([203.11.71.1]:54035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l4wO2-0005B2-0M; Wed, 27 Jan 2021 20:46:21 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DR3GT1z5xz9sT6; Thu, 28 Jan 2021 12:46:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611798369;
 bh=LGVuQmRvVfZEEUunEofW7BswFPh6zpHadWIYlo9xxAc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CDCvrArK+poJ3sgG+AZvljvYOnTGhkJVY1vhTOJYvJ8ggfARvXL+dVWz+kIe6VqGi
 2HV2IMz7h3f2fKON0+v83bafnkKdKfkstqBnFWI7AmnCC04aHmRikFZU8SASpVLI9X
 XDR0mjfRkJDiR7KqN+IoBIHCJObcTtsMjYWfsBKw=
Date: Thu, 28 Jan 2021 11:49:52 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 4/7] ppc/pnv: Simplify pnv_bmc_create()
Message-ID: <20210128004952.GG18347@yekko.fritz.box>
References: <20210126171059.307867-1-clg@kaod.org>
 <20210126171059.307867-5-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pE2VAHO2njSJCslu"
Content-Disposition: inline
In-Reply-To: <20210126171059.307867-5-clg@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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


--pE2VAHO2njSJCslu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 26, 2021 at 06:10:56PM +0100, C=E9dric Le Goater wrote:
> and reuse pnv_bmc_set_pnor() to share the setting of the PNOR.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-6.0, thanks.

> ---
>  hw/ppc/pnv_bmc.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
> index 67ebb16c4d5f..86d16b493539 100644
> --- a/hw/ppc/pnv_bmc.c
> +++ b/hw/ppc/pnv_bmc.c
> @@ -260,13 +260,8 @@ IPMIBmc *pnv_bmc_create(PnvPnor *pnor)
>      Object *obj;
> =20
>      obj =3D object_new(TYPE_IPMI_BMC_SIMULATOR);
> -    object_ref(OBJECT(pnor));
> -    object_property_add_const_link(obj, "pnor", OBJECT(pnor));
>      qdev_realize(DEVICE(obj), NULL, &error_fatal);
> -
> -    /* Install the HIOMAP protocol handlers to access the PNOR */
> -    ipmi_sim_register_netfn(IPMI_BMC_SIMULATOR(obj), IPMI_NETFN_OEM,
> -                            &hiomap_netfn);
> +    pnv_bmc_set_pnor(IPMI_BMC(obj), pnor);
> =20
>      return IPMI_BMC(obj);
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--pE2VAHO2njSJCslu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmASCjAACgkQbDjKyiDZ
s5LduhAA0KvXkORqJh+Os2eaAMigYf9/w5pu9wvnbwkR7YQsU5c5gw6HCQ8NPVL5
RuQDp67JqYDxeP3DByE/78USTThD7/jfEUTERJLvNyVhokhKBb9MvC0tOlK6c6RQ
hg0bWdYErpk8owQozPpJTOr7+MjI6J3WWGJdL4QMZT7ljXWlBfNkL7AMoZvxN/SJ
4nSVa4UxVEP0nSBDYiFXteAquZEs9lnnl+EOM3WII99fCwVNVjKYcDRBtkj4LqqY
CJLoqZOjHllnQYLbt+OQ7PY1ozX268vHqBuK9vRR9pxmw1+WWxhLa+ByDF+u6TvA
YUKq+4VMgQVC5xJyTzRmPTLeNVL1oHBgcvqP54pb0hC+Og4XsVOTWUhzVptM9NJC
exnNyclS5OEsVhIf4zla5H7YsEhmWZLxickWzKUtfiWrf2v4bVdUDh/UvrA9EiBq
FORxPid11sMNpowsqfmOOKzj5AFYeGQ48wOcuGjXMgAaASiL0DIqTNiH2tJWuO7f
2NXpk1b+SPAxaIJOmBH1HvDYUZc4iqFj4jHkYeu86XdJhv2Q/yH3vl5upqEJhQp/
tKezWxpqsbckp//xkHuxP8KqbhvqNAOSK7MsR7XbvRqOPr01RRx2Fuuhtc46ufX7
Im0Cknb6TrzN07yuNMDLqlkg9Eg5VPedNw1OUKexJN4D+i+RE48=
=8Up2
-----END PGP SIGNATURE-----

--pE2VAHO2njSJCslu--

