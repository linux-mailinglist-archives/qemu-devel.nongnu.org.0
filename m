Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEE43CCCB1
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 05:42:00 +0200 (CEST)
Received: from localhost ([::1]:44482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5KAJ-0003Kl-3p
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 23:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m5K6Q-0001Ch-33; Sun, 18 Jul 2021 23:37:58 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:59193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m5K6L-0002wA-6C; Sun, 18 Jul 2021 23:37:57 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GSnbv1KyHz9sWl; Mon, 19 Jul 2021 13:37:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626665867;
 bh=HRiikgjK21c0gpyuGwqoXyX7EaLskNkA/03GbkFOb/w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ClogegyIuzMDrtRRH7a5Xu2xSEPSWfFhsiOD8etLye8aQHAsGl4PFd23LAzWwA5BE
 D9rtVkCeHyzsbyHaFi7yOuTxgyCuqJ/TlDDKBWYx+kLBT8sSp5NOP+qoE25rjywArP
 PrJ1i0T3Hp6oMuGitnluW+sqfawvlYChPEpQa5Ck=
Date: Mon, 19 Jul 2021 12:14:33 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 2/2] i2c/smbus_eeprom: Add feature bit to SPD data
Message-ID: <YPTgCUk1lZBuJhbE@yekko>
References: <cover.1626367844.git.balaton@eik.bme.hu>
 <19d42ade295d5297aa624a9eb757b8df18cf64d6.1626367844.git.balaton@eik.bme.hu>
 <20210718180329.GM3431@minyard.net>
 <bc5ad55d-7bef-c7a9-fbea-9828e998f56b@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="H0njV8DADKRUn0cq"
Content-Disposition: inline
In-Reply-To: <bc5ad55d-7bef-c7a9-fbea-9828e998f56b@eik.bme.hu>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--H0njV8DADKRUn0cq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 18, 2021 at 10:39:16PM +0200, BALATON Zoltan wrote:
> On Sun, 18 Jul 2021, Corey Minyard wrote:
> > On Thu, Jul 15, 2021 at 06:50:44PM +0200, BALATON Zoltan wrote:
> > > Add the differential clock input feature bit to the generated SPD
> > > data. Most guests don't seem to care but pegasos2 firmware version 1.2
> > > checks for this bit and stops with unsupported module type error if
> > > it's not present. Since this feature is likely present on real memory
> > > modules add it in the general code rather than patching the generated
> > > SPD data in pegasos2 board only.
> > >=20
> > > Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> >=20
> > I checked this all out and it looks correct to me.  I can take it in my
> > tree, if necessary.  Feature freeze is in two days, so probably not for
> > 6.1, though it could be pushed into there if its needed in 6.1.
> >=20
> > Or:
> >=20
> > Acked-by: Corey Minyard <cminyard@mvista.com>
>=20
> Thanks. As this fixes pegasos2 ROM 1.2 that some users may find instead of
> the 1.1 version I consider this a bugfix not a feature and would like to =
get
> merged for 6.1 if possible (hopefully can be in David's tree with the oth=
er
> patch that's also a bugfix) because that way it won't happen that some us=
ers
> will get problems if they find the wrong ROM. With this patch both versio=
ns
> available on line work so there should be no problem for anyone. Other
> firmware ROMs don't seem to care so they're unlikely to break and the only
> machines using it now are pegasos2, sam460ex and fuloong2e and only when
> using firmware ROM so this does not need to wait until 6.2 I think as 6.1=
 is
> the first version pegasos2 is available and it would be nice to get it
> working well in the first version.

I'll accept the argument that this is a bugfix, and reasonable to
merge at least early in the freeze.  So, I've merged it into my tree
with Corey's ack.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--H0njV8DADKRUn0cq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD04AkACgkQbDjKyiDZ
s5JBig//cyozbLvcxM3EeiZj1MKDfoZZQ21dqy7iwsqI10gB9qXdVBa6RljI/W+P
4Mc4XrrICoEOykZgMXX4eVVivO3kIYRe+LpRiZzUM19vpjuiNtzw/JrKPnjYM8Si
h3OkEPXG4AB4BkV3vuyC7JyFWXZzW540+RAlXEGNnHi8BCwSFjQyxQ6qbh7xNTry
EQuFLRyuoRWbnYKoUdzkTuirhOJOxYY6lYrBngVL2S0MMaDcOKTOYDqv7A91+IMe
pP7S07KR0/FTkxAcxUM9/9/4yVwJc91TSqMTZhuU0v7XQR5/YucGd3sy8y9czl7v
e0Qt4QPdEZOWm0N4kmmN4rIGjU7/1fAHANs6YCeaK9z4oIbF8lzBAp6qfhxId16i
F8NLJgB3Exbisu0s7BUM6sczHfU6UXq7sEBAc1QEnbfzk7ryINvVk+F7v+smE29C
JUtz159FaPzq8zzHHpjUVp4tq5g95yzF2mDVMpNrjGygbL+tBajXaSqZ3wTHR93m
BagGv4mTr3NrGibdZ45mcF2tKwpn7+c+6eM0U6XHa4e+lTaDSvVdm4PA2IkgoxGP
518gXbtK0JWfDpERPWdcynpBiEQSdDOAk3TKmc1n3Yzm/e8ZwZTUntGJXc553mqc
CriaSFVUW3CVH3Oz+bneV725GspxQFrCdGzxBhjbdw+7A7U6U38=
=jvqG
-----END PGP SIGNATURE-----

--H0njV8DADKRUn0cq--

