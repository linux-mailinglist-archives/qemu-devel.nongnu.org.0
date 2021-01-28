Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3C0308271
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 01:36:22 +0100 (CET)
Received: from localhost ([::1]:59256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Hlt-0003Cj-Mv
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 19:36:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5Hk5-0001OL-L0; Thu, 28 Jan 2021 19:34:29 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:35057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5Hk1-0003Io-S3; Thu, 28 Jan 2021 19:34:29 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DRdd93q2lz9sWP; Fri, 29 Jan 2021 11:34:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611880461;
 bh=h0FK6zCHMQjiHymhut4WJBUllrX1ywa6qOBAKKclkNE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FX1dxWBhl4vc1ejEiXsHqw/AS1BsUkCmsTXUK7yYX4txyzs2OxX46ipgFKAjJJUVp
 6MZ0pZJNvrj5bVOtutV4asOVjPrjYmwq1vE0WRTOCVYoNs2jMvbhEammKlHAOjyQmM
 FpVa9oiorchOmKbYBRJOha07FLS954miESvZV1kQ=
Date: Fri, 29 Jan 2021 09:41:55 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 4/7] ppc/pnv: Simplify pnv_bmc_create()
Message-ID: <20210128224155.GC6951@yekko.fritz.box>
References: <20210126171059.307867-1-clg@kaod.org>
 <20210126171059.307867-5-clg@kaod.org>
 <CACPK8Xfw-E8TetGdfDYpMZChFbY7cQNGLX8_xh390A-vanS--w@mail.gmail.com>
 <9ea1ce11-15ba-3eea-f7a4-b036a9db841f@kaod.org>
 <20210128130428.62b9adde@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Content-Disposition: inline
In-Reply-To: <20210128130428.62b9adde@bahia.lan>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-ppc@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 28, 2021 at 01:04:28PM +0100, Greg Kurz wrote:
> On Thu, 28 Jan 2021 08:46:01 +0100
> C=E9dric Le Goater <clg@kaod.org> wrote:
>=20
> > On 1/28/21 1:46 AM, Joel Stanley wrote:
> > > On Tue, 26 Jan 2021 at 17:14, C=E9dric Le Goater <clg@kaod.org> wrote:
> > >>
> > >> and reuse pnv_bmc_set_pnor() to share the setting of the PNOR.
> > >>
> > >> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> > >> ---
> > >>  hw/ppc/pnv_bmc.c | 7 +------
> > >>  1 file changed, 1 insertion(+), 6 deletions(-)
> > >>
> > >> diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
> > >> index 67ebb16c4d5f..86d16b493539 100644
> > >> --- a/hw/ppc/pnv_bmc.c
> > >> +++ b/hw/ppc/pnv_bmc.c
> > >> @@ -260,13 +260,8 @@ IPMIBmc *pnv_bmc_create(PnvPnor *pnor)
> > >>      Object *obj;
> > >>
> > >>      obj =3D object_new(TYPE_IPMI_BMC_SIMULATOR);
> > >> -    object_ref(OBJECT(pnor));
> > >> -    object_property_add_const_link(obj, "pnor", OBJECT(pnor));
> > >=20
> > > I assume it's ok to move the link set to after the realise of the BMC=
 object?
> > =20
> >=20
> > When 2 objects need to be linked, one has to be realized first.=20
>=20
> Realize isn't a QOM concept in the first place...
>=20
> > I suppose this is why it is allowed but I am not expert in that area.=
=20
> >=20
>=20
> ... so no surprise object_property_add_const_link() doesn't care
> about it.
>=20
> > Greg  ?
> >=20
>=20
> What is important though is that a property with a given name
> can only be added *once* to an object during its lifetime.
> Doing the contrary is a bug and QEMU aborts. So, with this
> in mind, it seems to me that adding QOM properties to a
> device object should only be done from some init path
> that is only called once.
>=20
> > That was the case already when defining a "ipmi-bmc-sim" device on the=
=20
> > command line.=20
> >=20
>=20
> Yeah and the property is added during machine reset... which
> is typically a path that can be taken several times during
> the machine lifetime. The potential crash is avoided because
> pnv_reset() doesn't call pnv_bmc_set_pnor() if pnv->bmc is
> already set, but this is a fragile workaround...

Oof, yeah.  In general we should avoid creating or realizing objects
at machine reset time.  There might be a few exceptions, but they're
rare.

> A QOM link doesn't look like the correct way to model the BMC
> accesses to the PNOR. Since the only user is hiomap_cmd(),
> it seems you could reach the same result with a pointer to
> the PNOR object being passed to ipmi_sim_register_netfn()
> and later passed to hiomap_cmd().
>=20
> > C.=20
> >=20
> >=20
> > >>      qdev_realize(DEVICE(obj), NULL, &error_fatal);
> > >> -
> > >> -    /* Install the HIOMAP protocol handlers to access the PNOR */
> > >> -    ipmi_sim_register_netfn(IPMI_BMC_SIMULATOR(obj), IPMI_NETFN_OEM,
> > >> -                            &hiomap_netfn);
> > >> +    pnv_bmc_set_pnor(IPMI_BMC(obj), pnor);
> > >>
> > >>      return IPMI_BMC(obj);
> > >>  }
> > >>
> > >>
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmATPbIACgkQbDjKyiDZ
s5JS6Q//arqNjetVICTFI1e5y7nvU5q3GxLDarZs/CAfgJPayTssIkZPathoY1B5
PyGda7Me4dqIaWboYf5PH2a2DWQKXOLUnrtuFUq8+jDIccgV1BqaVn/+vlkOGAq/
wq5XLCShQJc5gOvZRSBSShvQ6TEDkLOKXlVkp0eT54t/2aaqHTFOKzoJ3ykRAnLD
17SU7oZxSk6XJf+GoEzkH+PrMuggkDIHRFo1irtiPD6vu5TOUedG2o/HDiY28RZZ
8UIoa8V5JgXZlJbaQbETDbi9Ubs4RBSsk9KIsY/mRXcmq4MY5X/bMrEWEFb4Vw4P
uxiWvBvnES9H8O4TTx42gx1IhXWjbSTjgn3nBvKetKFHXf92j6f8ZwDjbEcQncrt
cBniJg/BROlAA15ddGAsgWuRidE33qB61ZhdKhm0TYhgqgEt9d9n70vR2Zwm6P3H
XAwOO9SmpP2rycLRqgn8AxJr86tl9HxLt7TOGHc57RSiU34cTzJTMqBiY3jAIGDW
mMMep8e02c0dQLVRZHKU7RDuUmLYTnJ5c3jNHl3jkBu+EtdxH7UeU10cpji52aB5
TyvYgJNsA7YS5R0MMeO1hKLZjnSWqwsVCnwpWx1Y5IsiIHY0U4+7mpa7ohfxmBYC
ZXSJL/eIdwQ/1vf+Xds6WbhXqR7sTlzWnpNIdiyJ2tIDHRhPjq4=
=JrPS
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--

