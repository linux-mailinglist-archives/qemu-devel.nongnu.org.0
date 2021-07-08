Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF683BF4DB
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 06:48:04 +0200 (CEST)
Received: from localhost ([::1]:50684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1LxD-0001em-65
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 00:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1Ls5-0004Ud-Ha; Thu, 08 Jul 2021 00:42:45 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:57975 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1Ls2-0000eL-0b; Thu, 08 Jul 2021 00:42:45 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GL3Ym2bzLz9sX2; Thu,  8 Jul 2021 14:42:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625719356;
 bh=wdziT4r7eHVk+NKjIa91UCdyjz6lG94eOV7lLQShZwQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SHaEqGOfnM7hSrLpii5IFIo4ePnGRNzLJf+Jnyzsfwr9xm/BAhQldZYPzeA2gvsQE
 p+L2q7DJN8xkNuBT6D7cJx+gYRtq5M0Zgxi04rUwA3iEXirUr3GFMcehU1xHtxoV0E
 8beZbBJotSOz6WvDAwuwSXBg95YX2vlQ7YiVSLEI=
Date: Thu, 8 Jul 2021 14:37:39 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 0/4] ppc/Pegasos2: Firmware replacement using VOF
Message-ID: <YOaBE37hTOBawsJO@yekko>
References: <cover.1624811233.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Tpkx/c/bjVDI/Lcq"
Content-Disposition: inline
In-Reply-To: <cover.1624811233.git.balaton@eik.bme.hu>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Tpkx/c/bjVDI/Lcq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 27, 2021 at 06:27:13PM +0200, BALATON Zoltan wrote:
> Based-on: <20210625055155.2252896-1-aik@ozlabs.ru>
> ^ That is v22 of Alexey's VOF patch
>=20
> With this series on top of VOF v22 I can now boot Linux and MorphOS on
> pegasos2 without a firmware blob so I hope this is enough to get this
> board in 6.1 and also have it enabled so people can start using it
> eventually (a lot of people don't compile their QEMU but rely on
> binaries from distros and other sources). Provided that VOF will also
> be merged by then. This gives VOF another use case that may help it
> getting merged at last.
>=20
> Further info and example command lines can be found at
> https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2

Applied to ppc-for-6.1, thanks.

>=20
> Regards,
> BALATON Zoltan
>=20
> BALATON Zoltan (4):
>   ppc/pegasos2: Introduce Pegasos2MachineState structure
>   target/ppc: Allow virtual hypervisor on CPU without HV
>   ppc/pegasos2: Use Virtual Open Firmware as firmware replacement
>   ppc/pegasos2: Implement some RTAS functions with VOF
>=20
>  default-configs/devices/ppc-softmmu.mak |   2 +-
>  hw/ppc/Kconfig                          |   1 +
>  hw/ppc/pegasos2.c                       | 783 +++++++++++++++++++++++-
>  target/ppc/cpu.c                        |   2 +-
>  4 files changed, 771 insertions(+), 17 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Tpkx/c/bjVDI/Lcq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDmgRMACgkQbDjKyiDZ
s5IKwQ/8DYcD4Gu/wqu64ro1epdNfTH5NRfI91WKJhqW59o8Z7zc+0BIIsHlrZiy
wPHp0JAd86J88fVY1CORTxbRHqno/E+lOH4A4g5d/ORbRJqeflPviSQgOdZYnjwU
zQXWxBkJzKMxjdfcAZkNac9D2AvuwhwteBhnnZEQbnf3caPtdvSaQtFiHBS5QS0/
Q14WWNqhcxwFAtis7XRmSqb0UeIm/6qiuOIUv6VvPLmJdN5bb9rjS4rUxsE1YsIU
AYTl674MlTm19pdao86/Za3Ih47GW36cz1EVQNiycTqdvtILdIJmZoeuUVMAKLW/
ACn5hT496lzFEKF3WV03J17m3ojGVefFfN+OtsX64XHab+SWG1y0/ymmtVp/b4mu
8xbJctP5mXOzrQ1SkJGnVfjGzcLf7/SA/uyJFqT/+0Ix7j7dHXNElwBigA2N5Xg2
T0orKUToGOV3lmzIhowKsrCtIiTYvj7rny+H/ot5K8Twz4vbVUPH+L6vo3jIVopJ
lOEUUStJDQh3K4AraFPfekv0VWptGqLZHRROX+aZWCV+bjfvvobxo8XlNM7cFC8Q
MKYCYCC8dkCLfBr3gc+4ejLHV337FFCEbf0YQ7knaTan5lOFkt+yz1fjqY17KJoG
CgY8/EVO3Olc8soc0NAzZuLXaUU6oP0fIuUJlQuigrAFBHkOhzQ=
=mAd3
-----END PGP SIGNATURE-----

--Tpkx/c/bjVDI/Lcq--

