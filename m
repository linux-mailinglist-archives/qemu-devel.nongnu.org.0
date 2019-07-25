Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3613A75FDB
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 09:30:35 +0200 (CEST)
Received: from localhost ([::1]:37010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqugU-0002jo-1F
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 03:30:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38048)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hquff-0000e9-18
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 03:29:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hqufb-0005JH-T3
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 03:29:40 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:57821)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hqufV-0004YD-O7; Fri, 26 Jul 2019 03:29:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45w11J1rBVz9sBZ; Fri, 26 Jul 2019 17:29:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1564126164;
 bh=Pzy0vgp7asCKngwZxuCI/GX0nFz5gexF168CIHS12QY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cM3cEF3kSx4cIt5EdGv0JEujelGn0qn2+GWRCIGLIzFUaVQzS067m0Xt26WEL/3H4
 q2ePNxshd4E5vZmqpVoCmi0eRnvg3cmFl98VgXzH9czLWjN1k9GYgqkyUQGxi8s6k0
 urybRMKo5oOdWa7fAvU4dCq9Jyf15eeYi/zrJfNo=
Date: Thu, 25 Jul 2019 13:31:45 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20190725033145.GC28601@umbus>
References: <20190724103524.20916-1-cohuck@redhat.com>
 <20190724135017.GK11469@habkost.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pAwQNkOnpTn9IO2O"
Content-Disposition: inline
In-Reply-To: <20190724135017.GK11469@habkost.net>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [PATCH for-4.2] hw: add compat machines for 4.2
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--pAwQNkOnpTn9IO2O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2019 at 10:50:17AM -0300, Eduardo Habkost wrote:
> On Wed, Jul 24, 2019 at 12:35:24PM +0200, Cornelia Huck wrote:
> > Add 4.2 machine types for arm/i440fx/q35/s390x/spapr.
> >=20
> > For i440fx and q35, unversioned cpu models are still translated
> > to -v1, as 0788a56bd1ae ("i386: Make unversioned CPU models be
> > aliases") states this should only transition to the latest cpu
> > model version in 4.3 (or later).
> >=20
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>=20
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>=20
> I plan to queue it for 4.2, but I think it's OK to queue this in
> parallel through other trees if necessary (so patches that depend
> on the new machine types can be queued too).

Yeah, I've put it into my ppc-for-4.2 tree, expecting to resolve a
minor conflict once the 4.2 tree opens.

Oh, and, ppc parts

Acked-by: David Gibson <david@gibson.dropbear.id.au>

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--pAwQNkOnpTn9IO2O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl05IqEACgkQbDjKyiDZ
s5K5ExAAhRGVya8wcftc9LiL/mNmXmFUYSmGnNwyXUJtRFYrsgu3Plv4ADd1x7tA
kQiARmhTeuRwoSRKEXMWnL3dbJQXpOcc0+vjac2MOkI2DwPkTIvbiU3InlieTeBu
GS4jgaZ30lx8q4Yjsye8G21mciHPyC6p5vjeWG/1+wU5fmtFtiHNI/4I77B00z5R
s+N7JRKNySdXIkcFDOY0dxxPxwjcfowgL5enQo9JGJ/iPqzibJZKep3qRHAwfQOa
uzUMvyHlfpuePUng7mzO0ZwOBxa7mkyIvyfajAU5GBQinT7hU2dD0sxuDZFKtI8y
YiV3BySga09ROdTdAQEfqmqf9det+9uGPVaTrcKuvyODGxqS8w52afWPpQ9lzvvM
5j8anj6ml/qbd6epCdGfHredbvPw1HEECnAgIjK5Df0RfSoR4O8bzLaMW3fszLFb
L/dpGPYy3VyeiaQS2qqSQc3Y+1RdKdudifjFBD47pRMi2Dedl3eBiAV3l4FS6ggi
RcbMbdJ/03nb0ucgSGNDtgyOXtasvEqm1Slo7sAtJ0n7fKHeSuFCj4UcNHoeXlTD
N+3uIpFMnlhe5k6vWZIjYjj5agvLYOrb7im4Ck9sl6ZPYFJqennoRrJWhgPhUkC+
hpxsvQarGmnOF5Bcgu0Iwfwgo/G1T84qovP1VpL8/FRMk3aNW3w=
=H05V
-----END PGP SIGNATURE-----

--pAwQNkOnpTn9IO2O--

