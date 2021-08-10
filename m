Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F8F3E507C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 03:03:07 +0200 (CEST)
Received: from localhost ([::1]:45272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDGAc-0004u5-6I
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 21:03:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDG6s-0003A5-5r; Mon, 09 Aug 2021 20:59:14 -0400
Received: from ozlabs.org ([203.11.71.1]:43369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDG6p-00083E-BV; Mon, 09 Aug 2021 20:59:13 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GkF2f2r3Hz9tk1; Tue, 10 Aug 2021 10:59:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628557146;
 bh=YoJIepauOb62aiY+06uF0xikhNFKn9Vh5y98fr9Fsgk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lgldmc5a5lHfuyehA8B8kPyaQhWuj1tACi+sjUA4ou8JQ/buIEwGsRYTFQWq4d29c
 oFD3UxjvvFdJ9WsM/Dm7YDevavtRLrub0KPIEb/Yx7QGyeBqy3Q7Yhjrb5RVra0PjO
 Al68mlao6PpLw9w6UKtVIPdDK2/8mGVGmUzzq32c=
Date: Tue, 10 Aug 2021 10:57:53 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] ppc/pnv: update skiboot to commit 820d43c0a775.
Message-ID: <YRHPEZNjlUwYc4Wb@yekko>
References: <20210806180040.156999-1-clg@kaod.org>
 <3935af0a-1fee-9a56-21ea-d4c94b886bd3@redhat.com>
 <81996cbe-e526-64cb-cfe6-40327effe66d@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0Cmr7+5Pw/Mp3ZTG"
Content-Disposition: inline
In-Reply-To: <81996cbe-e526-64cb-cfe6-40327effe66d@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: qemu-ppc@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0Cmr7+5Pw/Mp3ZTG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 09:55:35AM +0200, C=E9dric Le Goater wrote:
> Hello Phil,
>=20
> On 8/9/21 9:06 AM, Philippe Mathieu-Daud=E9 wrote:
> > Hi C=E9dric,
> >=20
> > On 8/6/21 8:00 PM, C=E9dric Le Goater wrote:
> >> It includes support for the POWER10 processor and the QEMU platform.
> >=20
> > 1/ Can you include the output of 'git shortlog v6.4..820d43c0' here?
>=20
> OK. See attachement.
> >>
> >> Built from submodule.
> >=20
> > 2/ Could we have a CI job building this, during 6.2 cycle?
> >    (See .gitlab-ci.d/edk2.yml and .gitlab-ci.d/opensbi.yml)
>=20
> Sure. It doesn't look too complex.=20
>=20
> I plan to add acceptance tests for the QEMU powernv machines also=20
> once the OpenPOWER files (zImage.epapr and rootfs.cpio.xz) are=20
> published on GH.
> =20
> >>
> >> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> >> ---
> >>  pc-bios/skiboot.lid | Bin 1667280 -> 2528128 bytes
> >>  roms/skiboot        |   2 +-
> >>  2 files changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/pc-bios/skiboot.lid b/pc-bios/skiboot.lid
> >> index 504b95e8b6611aff3a934ff10f789934680591f9..8a3c278512a428a034ed5b=
1ddbed017ae8c0a9d0 100644
> >> GIT binary patch
> >> literal 2528128
> >=20
> > Consider using 'git-format-patch --no-binary' and a reference
> > to your repository to fetch a such big binary patch.
>=20
> David would pull from my tree then ? So that's like doing a PR.=20
> We can do that next time I send an update if David is OK with=20
> that. I should send an update for v7.0 tag.

Yes, I'm fine with that.  That's currently how Alexey sends SLOF
updates.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0Cmr7+5Pw/Mp3ZTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmERzxEACgkQbDjKyiDZ
s5Izew/+NJYdAde1k/hCx2+O88ounW0fYuc2oC2prgMuPC+qD/KlfrsOCHfwEo6V
8L8a9+aSiq0eiTG6xqydduR+XlJ5AtM8/uJ15hFMjtUes+iySgXKOpSxqKEPcwGa
O0Gc7XLEJTlauibmt03huOByhpg8sLtsGnyCRk9C9jD+WDM7azDJRjKZYh5812fq
on8BY+MDeGjKxZYhyFlCx34MdKnCkxpLpK1Rhr86VFFEJoN6QTFcZ8rna+IeUP2u
JDzst/YLXLW7cD8dL3trgrOZtjiznLZjG+7g5fJxl9Qff0MuuevfIBYAJfSz9r1m
H3QqG/g1lgOdBcI7cVgUJjlsO84qYj4iGb5oUaC4CFlwlXwT5ZP629lpTuGiQIsP
Gr8JVyh7kHWGklRaW/dbhi4TsLDSiUSTdycbyGptv/7AtPWXKSsFq03SJTT8Caeu
SpQkTot+0HvDbh7ajInlL5Mw1qYNe2t7kLdIpSrd3Ups1IUH/sLAX7YqifVSnNHe
xaOqUSFzFo11ywn5gNgCXu0dcjTkRgdVIr11zGwgqRy2Zen0F2JeXUgIl8bgA7v0
f9MYMWqkmvKmPiXUx5zRaBGvCBsY1FUwm+LBEgsax66pUHgk/i2gCgp1CTpMINVd
MszvYXgTcmzYLy4muClegmpGR9xf5G+A57RbMqK1uCRNXpoE2lE=
=tNmX
-----END PGP SIGNATURE-----

--0Cmr7+5Pw/Mp3ZTG--

