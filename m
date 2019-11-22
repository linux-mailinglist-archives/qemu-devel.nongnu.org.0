Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5051105E4E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Nov 2019 02:37:00 +0100 (CET)
Received: from localhost ([::1]:46894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXxsZ-00030E-Op
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 20:36:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46109)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iXxrV-00025Q-Ll
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 20:35:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iXxrS-0004cu-95
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 20:35:51 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:37831 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iXxrP-0004Zq-TM; Thu, 21 Nov 2019 20:35:49 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47JzXG0jZgz9sPc; Fri, 22 Nov 2019 12:35:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1574386542;
 bh=62P9Bw5+9to0Slr+T/14kFaeF/kxhz6hpAJVGFKmB3I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gW3Hi0pZd5YlQeQ2JtADeu5stdmyNVtqHXdykkR84iKdCeF9bwoWzGP66j0UpAk1s
 eVjYPbMA4t4MCf6t0BF7clFZZhF1A80SFpI3i/dwAJxN0wJAwGp+GWdxyp4bOEzxi+
 4cPGAdF80yqWT4sPl6JdLrB/Ln5EZPnYhA08MU7U=
Date: Fri, 22 Nov 2019 12:35:37 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 0/5] vfio/spapr: Handle changes of master irq chip for
 VFIO devices
Message-ID: <20191122013537.GY5582@umbus.fritz.box>
References: <20191121005607.274347-1-david@gibson.dropbear.id.au>
 <20191121095738.71f90700@x1.home>
 <20191122011824.GX5582@umbus.fritz.box>
 <20191121182807.51caac33@x1.home>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="j3eaMWZhMWMo+sdM"
Content-Disposition: inline
In-Reply-To: <20191121182807.51caac33@x1.home>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: kvm@vger.kernel.org, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 groug@kaod.org, Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 clg@kaod.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--j3eaMWZhMWMo+sdM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2019 at 06:28:07PM -0700, Alex Williamson wrote:
> On Fri, 22 Nov 2019 12:18:24 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Thu, Nov 21, 2019 at 09:57:38AM -0700, Alex Williamson wrote:
> > > On Thu, 21 Nov 2019 11:56:02 +1100
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >  =20
> > > > Due to the way feature negotiation works in PAPR (which is a
> > > > paravirtualized platform), we can end up changing the global irq ch=
ip
> > > > at runtime, including it's KVM accelerate model.  That causes
> > > > complications for VFIO devices with INTx, which wire themselves up
> > > > directly to the KVM irqchip for performance.
> > > >=20
> > > > This series introduces a new notifier to let VFIO devices (and
> > > > anything else that needs to in the future) know about changes to the
> > > > master irqchip.  It modifies VFIO to respond to the notifier,
> > > > reconnecting itself to the new KVM irqchip as necessary.
> > > >=20
> > > > In particular this removes a misleading (though not wholly inaccura=
te)
> > > > warning that occurs when using VFIO devices on a pseries machine ty=
pe
> > > > guest.
> > > >=20
> > > > Open question: should this go into qemu-4.2 or wait until 5.0?  It's
> > > > has medium complexity / intrusiveness, but it *is* a bugfix that I
> > > > can't see a simpler way to fix.  It's effectively a regression from
> > > > qemu-4.0 to qemu-4.1 (because that introduced XIVE support by
> > > > default), although not from 4.1 to 4.2. =20
> > >=20
> > > Looks reasonable to me for 4.2, the vfio changes are not as big as th=
ey
> > > appear.  If Paolo approves this week, I can send a pull request,
> > > otherwise I can leave my ack for someone else as I'll be on PTO/holid=
ay
> > > next week.  Thanks, =20
> >=20
> > I'm happy to take it through my tree, and expect to be sending a PR in
> > that timescale, so an ack sounds good.
> >=20
> > I've pulled the series into my ppc-for-4.2 branch tentatively.
>=20
> Tested-by: Alex Williamson <alex.williamson@redhat.com>
> Reviewed-by: Alex Williamson <alex.williamson@redhat.com>
> Acked-by: Alex Williamson <alex.williamson@redhat.com>

Thanks!

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--j3eaMWZhMWMo+sdM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl3XO2kACgkQbDjKyiDZ
s5J/KhAAm+OyfNei3T30mvYb2KiFzebufX6Ppyn3E5awnxLa0HbyUvp4SGFyo6cy
CtSee6Cme6LRat/X3i4ko2YVanig06Gbvm7QKH0uIiHqDdibCZKpJfOj3je2rRRr
1xUXcrbJhlkb56lra+baLdcuc0WjQWTVM3eovIX/nGGDyfhIzRkzlGylDVR/4hpT
VpgS/n0KFqXPm+nK+5YlDersGh2KjRa4r9e8s3EkmPuvh52p6WJlQwit7zEbRq6X
cfg9SBXgQYYf95k5WZxnwiffEdfscxzZexvTYKClFZpJhwhCQXlnt9s1fytbh+al
1zdwShhq0WjiP95XxMnUrMaxCls667o3OU6UF2l7DPAA1lDAtwntxkz8LFhDggMN
uLOOYSr3bD4TQvWYoaIMdAIuj3dT2zte3eaVfij937RwwzRJJubHl15YCHVkIW3X
ahWBcsx3s/jYqyx9jcN6avqk0Df6YCZeJSBCM0QxsSMSBMHNC4ZzkhoBdYPgAjHc
8X5ME5pN8Pq/l8S6YXMeHBZaoSkklN+8Pmd7QZG2XjSW6+r9fmMWWnHXSX797JSy
32mERsXgRjyqwRANUniJxPbqTIhGVy7VzscxW05ne4DkmHpfAT043rLcn5gHJplS
Y+BrLlM/FLydyVNREE+LWiDm6P8/IGEY7t/r8RoqmUt6bnbn9bk=
=T3fw
-----END PGP SIGNATURE-----

--j3eaMWZhMWMo+sdM--

