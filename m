Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F2587116
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Aug 2019 06:51:37 +0200 (CEST)
Received: from localhost ([::1]:56376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvwsK-0001q8-SI
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 00:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58465)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hvwqP-00079M-9V
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 00:49:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hvwqN-0008Qz-Ml
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 00:49:37 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:52179)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>) id 1hvwqM-0008PG-IP
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 00:49:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 464XpL4q3nz9sN4; Fri,  9 Aug 2019 14:49:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1565326170;
 bh=QJuOF95NcuCVQwqtS+jns6Ki7y7qQd7Am/qZCYwut54=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mfdzpjGL23/kDhoE3slfxNhfxNDJ7nCzQizroZF+qwH/BhFlFwonc2tB8lIMBTwTT
 KPj44I3mAqBn/qrihXTWHNsk4jjPOtVIrVA+wHE0qGlOvImITzRaxYcnc+NAatUIt9
 sn2tKfzXK2Ei9YcHiWRC8Cv245xyZ/l3gCDF0V3M=
Date: Fri, 9 Aug 2019 14:39:55 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190809043955.GJ5465@umbus.fritz.box>
References: <20190807071445.4109-1-bala24@linux.ibm.com>
 <20190807071445.4109-2-bala24@linux.ibm.com>
 <20190808104904.GD2534@redhat.com>
 <5b5eb81f-86c7-30c3-16e3-7be969e45fde@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EVh9lyqKgK19OcEf"
Content-Disposition: inline
In-Reply-To: <5b5eb81f-86c7-30c3-16e3-7be969e45fde@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [RFC PATCH 1/6] utils/python_api: add scripting
 interface for Qemu with python lib
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, maddy@linux.vnet.ibm.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Balamuruhan S <bala24@linux.ibm.com>,
 anju@linux.vnet.ibm.com, clg@kaod.org, hari@linux.vnet.ibm.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--EVh9lyqKgK19OcEf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 02:45:02PM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 8/8/19 12:49 PM, Daniel P. Berrang=E9 wrote:
> > On Wed, Aug 07, 2019 at 12:44:40PM +0530, Balamuruhan S wrote:
> >> Adds scripting interface with python library to call functions in
> >> python modules from Qemu that can be used to feed input externally
> >> and without recompiling Qemu that can be used for early development,
> >> testing and can be extended to abstract some of Qemu code out to a
> >> python script to ease maintenance.
> >=20
> > I admit the use case is interesting, but this is opening a can of
> > worms...
> >=20
> > Historically the project has held the view that we do not wish
> > to have an mechanism to support loading out of tree code into the
> > QEMU process. Much previously talk was around dlopen'd C plugins,
> > but dynanically loaded Python plugins are doing the same thing
> > at a conceptual level.
> >=20
> > We didn't wish to expose internals of QEMU in a plugin API to
> > avoid having any kind of API promise across releases.
> >=20
> > There was also the question of licensing with plugins opening
> > the door for people to extend QEMU with non-free/closed source
> > functionality.
> >=20
> > While this series only uses the plugin for one fairly obscure
> > device, once a python plugin feature is intergrated in QEMU
> > there will inevitably be requests to use it in further areas
> > of QEMU.
> >=20
> > IOW, acceptance of this patch is a significant question for
> > the project, and a broader discussion point, than just this
> > PPC feature patch series.
>=20
> Since performance is not an issue, we can use a QMP-PyMMIO bridge.
> Most of the functions required are already exposed, Damien completed the
> missing ones in his 'FAULT INJECTION FRAMEWORK' series:
> https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg06230.html
>=20
> Maybe we simply need a clearer (better documented) QMP 'MMIO' API?

I tend to agree.  If performance is not a consideration to the point
that we can use an embedded Python interpreter, it should also not be
an issue to the point that we can move the processing to an entirely
different process with a vetted protocol in between them (QMP or an
extension thereof being the obvious choice).  That seems safer than
embeddeding arbitrary scripting right into the MMIO paths.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--EVh9lyqKgK19OcEf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl1M+RoACgkQbDjKyiDZ
s5JGtxAA4k3eRK5MctlBW4dMo0gBS8U6czJwfE05gJjjAHtBQw4DxrxP8bjWzLGw
1LS3FvQmezdd4DnIeOLFrWfKYUuj1cGB/5PhM9v/tSDryR4OWcL0oVUCrSBEUZiA
mnoK+4OtybZw8mOSl9ExzzSDei/JWbyFlY3dSAnsTRDm/JHIvmLhzJxEmJOhdoQg
bPI18kzhKgHSUfuNpV5oCrY4sh12nfFkg701w2fOStKEENL1a4X7B3aF+74FACIb
9G+/POQPvvVvL7cMZZuSY1gyAzRffufjfr+bZcab/ADboXZsUmmaOftSewhHC0nk
kqXVDMOl+9De5NdPEF9x2X+muQAmYFlRkMXg8yDBah6goK/wOxEkJHe8SPU5Bxut
v4QEzeLXF1cHylUO2FCmWPUdc33UMTGoZJ0W2OuBh1RJ2a7Wv2iLflqFvT3Ayqhv
qfWy1Kr7hblXmOAr+9wxJoabcd7hceoG4FcEuu2mLjUrKjt3MCtmE9O4L3UaM873
vYT0/7g5zTRz4QGVsOQsyKd/tD9w7mS/l09Ivdt8lzn5McegaciXITb0HY2Q8SwU
Dq8tIYFYashmvf/8t5Jo/kHxJ4Sbppzs21qcQRjJqYYRUqmqfE9/ueAqWSP+GrX2
9Fj9q7C/UaRxT0yfzthrQCkbKJABa0+CDbCmNt+u/SEszFj4jc8=
=OauQ
-----END PGP SIGNATURE-----

--EVh9lyqKgK19OcEf--

