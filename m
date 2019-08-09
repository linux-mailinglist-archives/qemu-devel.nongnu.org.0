Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31858710E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Aug 2019 06:50:49 +0200 (CEST)
Received: from localhost ([::1]:56360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvwrY-0008Jk-UP
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 00:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58451)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hvwqO-00079I-Ph
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 00:49:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hvwqN-0008Qs-MJ
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 00:49:36 -0400
Received: from ozlabs.org ([203.11.71.1]:47595)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>) id 1hvwqM-0008PD-IE
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 00:49:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 464XpL75DTz9sNp; Fri,  9 Aug 2019 14:49:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1565326171;
 bh=0ylhcvSrZqyTUml+y6OP9wmpNr1+2inu12Eu2Bse/8U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mhaOi2pS6SI4LegFzGfWrc7+Rn/FXCIdNh0wz6IbRkt7cEccdwHWt2SKSUgAoUx4A
 LQDC7js6RGVR5BpGtap56zJtK7MX8tRtEHvgLXpo0VeRR+AP+iTWsRGYt2Af+qfZnu
 soquTKwl0AbM3d4hiRZTxq7/oKAxrpHGDdI4HKNU=
Date: Fri, 9 Aug 2019 14:49:23 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Message-ID: <20190809044923.GO5465@umbus.fritz.box>
References: <20190807071445.4109-1-bala24@linux.ibm.com>
 <9cbb8079-d606-ab69-a5b3-93226888108a@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PtLnLSExlPr13a2X"
Content-Disposition: inline
In-Reply-To: <9cbb8079-d606-ab69-a5b3-93226888108a@kaod.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-devel] [RFC PATCH 0/6] Enhancing Qemu MMIO emulation with
 scripting interface
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
Cc: Peter Maydell <peter.maydell@linaro.org>, maddy@linux.vnet.ibm.com,
 qemu-devel@nongnu.org, Balamuruhan S <bala24@linux.ibm.com>,
 anju@linux.vnet.ibm.com, hari@linux.vnet.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--PtLnLSExlPr13a2X
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 07, 2019 at 10:15:48AM +0200, C=E9dric Le Goater wrote:
> On 07/08/2019 09:14, Balamuruhan S wrote:
> > Hi All,
> >=20
> > This is a proposal to extend mmio callbacks in Qemu with scripting inte=
rface
> > that is prototyped with python in this implementation. It gives ability=
 to
> > feed runtime data through callbacks without recompiling Qemu in generic=
 way.
> > This patchset adds library that provides APIs for Qemu to talk with pyt=
hon
> > scripts placed in path -module-path and how existing xscom can be exten=
ded
> > with python interface infrastructure.
> >=20
> > We have also added an hacky emulation for memory region (OCC common are=
a and HOMER)
> > which is shared between core and un-core engine (ideally this should be=
 via
> > sram device) to showcase the effectiveness of having the scripting inte=
rface
> > (uncore engine taken for discussion here is powerpc specificed called O=
CC).
>=20
> We should try to merge this part first. It is useful as it is after some
> cleanups.
>=20
> > Having scripting interface helps to emulate/test different uncore-core
> > interactions including uncore engine failure or hang. It also helps in =
feeding
> > randomized data at byte level access. This patchset is primarily to ext=
end mmio
> > callbacks with scripting interface and to demonstrate effectiveness it.
>=20
> It is already possible to feed device models with external data using QMP=
 or
> external agents using a chardev backend transport. What are the benefits
> of using the embedded python approach ? =20

Yeah, I also think this needs better justification.

In particular what's the case that Python makes this significantly
easier than hacking up experimental interactions with C.  I mean you
already have to understand POWER9 internals to work with this, right,
so I wouldn't expect Python's greater accessibility to be a big
concern here.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PtLnLSExlPr13a2X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl1M+1MACgkQbDjKyiDZ
s5KQXRAAthU0fsLL6LMihlt+aOB7zoTnC6LWh9RV4Ng248RcjUFh1Y+NR/aLlawh
XIiV+ITXy+GGNdQMG8+IUSHE9JaU0z5gS9Arog1ejhESPhq2kyW3vw3BHeJKgIS2
l+INmgKmzx8xiNwGy+EKxNaOC7DUiLUhyt6Rvd1HFwymLwEbYMnZQB2zh3fQyFzN
GaKJZqvlLSYsOSjIjG/9ONeUAzk3nRaScBwI7jxTbx/EiFGCSD4eA37Qs9B/w7bS
fwhAtatVASqUuomRGj6bl18NylTORo4h4QfR7b9LIBHSFiWUHdW31JYtefJ3JBKs
TfJhhSD3htjBblTEsOb331KzEk+yHFCwtRjP2gFyA85erJjU6IBF6LU4ewebzZsm
phEs695o+HoMbLvur8Dppa1aU9V810VUGRYgGf/mBkK3hYb5z6rIoHg5uTDGLSoh
BsHFrvmWje4gvboN7IVR0a62zCMMXSSf04ajiMFl/BmerRZZlQnzdvbsAT0bQ+hl
4ejpWYe9Wm+iSEly0KQ2SitNxIAxEZ7mXjfiPOPFuQP2o3yzvUs+HTWU2HdSPgpy
zY8wKomwXC8buFoLjsTRzPoHmSV60H78KtZWaCPY7/Ss2hhNceGgg8rjkDRgBELh
+19My0RZ2+1+EQUAAmJ/ZJrmbnFyFDOod8GFJkcsiijRhwnaXqw=
=YK4h
-----END PGP SIGNATURE-----

--PtLnLSExlPr13a2X--

