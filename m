Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5CB131C9D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 01:05:50 +0100 (CET)
Received: from localhost ([::1]:54728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iocNY-0002L7-2F
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 19:05:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54973)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iocJk-0007qy-Nt
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 19:01:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iocJj-0005XC-6a
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 19:01:52 -0500
Received: from ozlabs.org ([203.11.71.1]:41549)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iocJh-0005Pg-Uz; Mon, 06 Jan 2020 19:01:51 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47sCGf236Hz9sR8; Tue,  7 Jan 2020 11:01:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1578355306;
 bh=Yr+XDBI6OhT4dlM9pRbUdGEOBejDaidLgTSKUOYnm3Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JC1aG2fAwYcOlg9/PVtbujJ+Eb/xiQJ+jaLdtuDo35Wt97javw3aFXs3LVKyVwj0A
 Ll8+goDHgjqcyprpSFSjVIpfLPCNnISW9vDXWeIfsL5vetgN5henW+dH313iDp5sK8
 +WVL2Cbxqr7hSQqkFwcfmZCcftOdPLLqY/GZsKdw=
Date: Tue, 7 Jan 2020 11:00:40 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] spapr/xive: remove redundant check in spapr_match_nvt()
Message-ID: <20200107000040.GC2098@umbus>
References: <20200106163207.4608-1-clg@kaod.org>
 <20200106182931.54f12057@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ozkSYTWEkbLDijvq"
Content-Disposition: inline
In-Reply-To: <20200106182931.54f12057@bahia.lan>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: qemu-ppc@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ozkSYTWEkbLDijvq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2020 at 06:29:31PM +0100, Greg Kurz wrote:
> On Mon,  6 Jan 2020 17:32:07 +0100
> C=E9dric Le Goater <clg@kaod.org> wrote:
>=20
> > spapr_match_nvt() is a XIVE operation and it used by the machine to
>=20
> ... and it "is" used by the machine...

Adjusted in my tree.

>=20
> > look for a matching target when an event notification is being
> > delivered. An assert checks that spapr_match_nvt() is called only when
> > the machine has selected the XIVE interrupt mode but it is redundant
> > with the XIVE_PRESENTER() dynamic cast.
> >=20
> > Apply the cast to spapr->active_intc and remove the assert.
> >=20
> > Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> > ---
>=20
> Reviewed-by: Greg Kurz <groug@kaod.org>
>=20
> >  hw/ppc/spapr.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index e62c89b3dd40..5008b7563173 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -4198,19 +4198,19 @@ static void spapr_pic_print_info(InterruptStats=
Provider *obj,
> >                     kvm_irqchip_in_kernel() ? "in-kernel" : "emulated");
> >  }
> > =20
> > +/*
> > + * This is a XIVE only operation
> > + */
> >  static int spapr_match_nvt(XiveFabric *xfb, uint8_t format,
> >                             uint8_t nvt_blk, uint32_t nvt_idx,
> >                             bool cam_ignore, uint8_t priority,
> >                             uint32_t logic_serv, XiveTCTXMatch *match)
> >  {
> >      SpaprMachineState *spapr =3D SPAPR_MACHINE(xfb);
> > -    XivePresenter *xptr =3D XIVE_PRESENTER(spapr->xive);
> > +    XivePresenter *xptr =3D XIVE_PRESENTER(spapr->active_intc);
> >      XivePresenterClass *xpc =3D XIVE_PRESENTER_GET_CLASS(xptr);
> >      int count;
> > =20
> > -    /* This is a XIVE only operation */
> > -    assert(spapr->active_intc =3D=3D SPAPR_INTC(spapr->xive));
> > -
> >      count =3D xpc->match_nvt(xptr, format, nvt_blk, nvt_idx, cam_ignor=
e,
> >                             priority, logic_serv, match);
> >      if (count < 0) {
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ozkSYTWEkbLDijvq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4TyigACgkQbDjKyiDZ
s5LiqQ//dZCejbLIQXuIuTAB4O/y3oMaE9RYUnBclsGBMlHuMXMVjsJeIaJ/6OfS
0raDLzMD3gMfj8Xd/9mEvaqCKSGZMJWgfQvrCPO3qvag6OB1PS9Wqoa5vm7fugQd
hJJX3Jx1lxuGL8ZCeP4TEgETNqOUi7K/9Stg01PkIaqYkYocLb0YHAhPe2Gmh+3u
KW3869WEcpAxAZroKRGpPuKIsLXG8GUaVuAal0nzY9Vf28yD+k3FdWi6Yjhp7ffo
l+aGwR6kgoYE7DSwDb5D1r+SzgdZZL9IcCydQPeZR3VdXk2dRWeKzRiW91fbwxZj
FJFzOibfXp39Kszt7DPpsm/PEHWR16wLMcFMveKqBPTXf/kb4aX+ICymPAwZyV0x
3RFw3gl4sy/cK0zz15CXqtOonHgNJZpPsIcDWrd2cigw5xzJO32pK/Ta+SWAt47o
/J5rripBTEWjz3ihmzaU0S5L9EYp7AsOAlry92mFqYUa5tf8VLcjghr6HVP3fLSG
jlv6N5iuHYa8b4rSOafJYuOT3NiasvOU2qP4eNYNq+q4nhve1ZoIB323fHBMdWMV
TL1eTnu+mkoIY3T108XJFysQHE76JN/bcjlgh8oL4//46/BQV4CS1D5QzvZMfoqQ
L4OwuBGPdnpqqh2fudUQES/EiLbHL+neA2exoUIDd3B2Y2ORW1A=
=NNJi
-----END PGP SIGNATURE-----

--ozkSYTWEkbLDijvq--

