Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B73463486C6
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 03:04:21 +0100 (CET)
Received: from localhost ([::1]:56346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPFMC-0006SK-RT
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 22:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lPFIn-0003id-N2; Wed, 24 Mar 2021 22:00:49 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:43673 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lPFIk-0003CF-P4; Wed, 24 Mar 2021 22:00:49 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F5SxP71hHz9sWT; Thu, 25 Mar 2021 13:00:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616637641;
 bh=BGmCnook0OzRfNMchjz0uo5EDNW2/63NA+XkVIicklo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kMBd9rgSYC+452y1OmF3NiPm1hNJc8SRPl0J3XCxRr47VyOy45Oi0vHu5qd0VbAVa
 BPdo2DdzCU1cLniPn5q6bhtLwqKf5xF6jk9Z/sD1uidygKTOksaEJHR+QWAZ3B7t4Q
 8mgHbwGJQ1HJgw+lMYiVwEF49nJPM4ZNGXuqj/D4=
Date: Thu, 25 Mar 2021 12:54:13 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v10 0/7] Pegasos2 emulation
Message-ID: <YFvtRUqB3E5euojL@yekko.fritz.box>
References: <cover.1615943871.git.balaton@eik.bme.hu>
 <YFk5acXxW6Mdmr+2@yekko.fritz.box>
 <344d1375-eb5e-31fb-5cbf-407497684fe0@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Dk+mxJiVJ2ZxeEMm"
Content-Disposition: inline
In-Reply-To: <344d1375-eb5e-31fb-5cbf-407497684fe0@eik.bme.hu>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, f4bug@amsat.org,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Dk+mxJiVJ2ZxeEMm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 01:57:25PM +0100, BALATON Zoltan wrote:
> On Tue, 23 Mar 2021, David Gibson wrote:
> > On Wed, Mar 17, 2021 at 02:17:51AM +0100, BALATON Zoltan wrote:
> > > Hello,
> > >=20
> > > This is adding a new PPC board called pegasos2. More info on it can be
> > > found at:
> > >=20
> > > https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2
> > >=20
> > > Currently it needs a firmware ROM image that I cannot include due to
> > > original copyright holder (bPlan) did not release it under a free
> > > licence but I have plans to write a replacement in the future. With
> > > the original board firmware it can boot MorphOS now as:
> > >=20
> > > qemu-system-ppc -M pegasos2 -cdrom morphos.iso -device ati-vga,romfil=
e=3D"" -serial stdio
> > >=20
> > > then enter "boot cd boot.img" at the firmware "ok" prompt as described
> > > in the MorphOS.readme. To boot Linux use same command line with e.g.
> > > -cdrom debian-8.11.0-powerpc-netinst.iso then enter
> > > "boot cd install/pegasos"
> > >=20
> > > The last patch adds the actual board code after previous patches
> > > adding VT8231 and MV64361 system controller chip emulation.
> >=20
> > I've applied 1..5 to a new ppc-for-6.1 branch.  Sorry it didn't make
> > it for 6.0, I just didn't have time to look this over until too late.
>=20
> Thanks but maybe you should wait if the dropped original first patch can =
be
> reviewed now and brought back. It would be easier for me to resubmit whole
> series rebased than port the dropped patch on top of a partly applied
> series. Also first patches without the last two is not much useful as the
> vt8231 model these add would not be used by anything else.

Ok, I've dropped your patches from ppc-for-6.1 again, and I'll wait
for the next posting.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Dk+mxJiVJ2ZxeEMm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBb7UUACgkQbDjKyiDZ
s5JwehAAvau9ytESkF3Z3bH36/WSaFkEhnX2uTA2d9/Q3zE4c7zgr5EE2OyM4rBK
WCpleE7U/EZzaq8UgM9Yga8Y7Sr2+PFlrtWsmB2W9URQTEaPtJ5yEss0A3YkWDm6
4XF4gaWSNI2ue9xl8KKgRGF97CUqbsEtGHe46rkXlBkL+9BUIC1c5/a3kakrfH+2
v5qzL/2h0pH4V2Nk/Q5ggUxQnsucs9qyHaj3D3YhaFH6Sga8FAjEiIn61L63Zgxb
lfKw/miSyqNtD7dy9EwPVLRrLJhmUCNWsqIDdCh1yYuLLBLXeghuCU/j1b/b1GXE
btL5A4PbqFpv4Gqmnx3NsEQSttdYOy6gvkXWUxPw7gweBOKFbXWYSGvjvZChevKn
qeZZLsyu38A6DzluiBOI7uT6NWnLvSxVrzrzIUgmcUO0KMGAjPQEGOJRv7QndYft
h7yHHsthYgChC+zFLxPLDUyZmpAwYhjuU7AgCZGUva+SEbfBQA9MOhy9N4tuqtg6
eKfW6xdle+d2xqZ+K99jDewmbHIHtRU70fhPG++4FrDiYG7eprA3iHv7NDXSV52m
S8qT0egHiOOJ2RwIGud3wVRwwbjwj3Wdy6Bndh7mqj/OziOyJM04rQ8i6SVGavBy
PJU+zNP1m4B7RazM+p4NeHg9PG+r6WoCAjg9eAbVI/K/eFT0/aE=
=fVEN
-----END PGP SIGNATURE-----

--Dk+mxJiVJ2ZxeEMm--

