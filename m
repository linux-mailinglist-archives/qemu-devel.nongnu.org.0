Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374A43A28EC
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:02:14 +0200 (CEST)
Received: from localhost ([::1]:55034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHVt-00084P-Af
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lrHTh-00073Q-51; Thu, 10 Jun 2021 05:59:58 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:42237 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lrHTd-0007Oa-M9; Thu, 10 Jun 2021 05:59:56 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G0zwg1C49z9sX5; Thu, 10 Jun 2021 19:59:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623319187;
 bh=zURFkBGLqANK09Ejun3tU9EmBnFLBmYru54d/TmQlcc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ciE3f3Yt5/UVLQA/2EFroLNUi2Xk8O6lFcVO1P6fHVVh9+Q7soMDA5HRuPx59tF/u
 EudEe5IBh20WlnFFrhsBykusryjKJMXoyfKt+nnLRupSx60fksFxT0OMCAswIVkffq
 0y3PppbdLhsaHGZu/v9QDIKcAChJfHYYsQxHwis0=
Date: Thu, 10 Jun 2021 18:25:17 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [RFC PATCH 0/5] ppc/Pegasos2 VOF
Message-ID: <YMHMbVo2zrV6EsZ8@yekko>
References: <cover.1622994395.git.balaton@eik.bme.hu>
 <5ab75d13-2fca-17cc-b24f-e86430fdda20@ozlabs.ru>
 <a5786f77-efc1-febb-7ae2-1e9543ca2687@eik.bme.hu>
 <bb539b72-5548-d035-8089-3d49f4babc1d@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RCVp3EKsv1kA52M/"
Content-Disposition: inline
In-Reply-To: <bb539b72-5548-d035-8089-3d49f4babc1d@ozlabs.ru>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--RCVp3EKsv1kA52M/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 10, 2021 at 05:14:45PM +1000, Alexey Kardashevskiy wrote:
>=20
>=20
> On 6/9/21 20:28, BALATON Zoltan wrote:
> > On Wed, 9 Jun 2021, Alexey Kardashevskiy wrote:
> > > On 6/7/21 01:46, BALATON Zoltan wrote:
> > > > Based-on: <20210520090557.435689-1-aik@ozlabs.ru>
> > > > ^ That is v20 of Alexey's VOF patch
> > > >=20
> > > > Hello,
> > > >=20
> > > > Posting these for early review now. I plan to rebase on the next VOF
> > > > patch that hopefully fixes those points that I had to circumvent in
> > > > patch 1 for now. I've reported these before but now all of those th=
at
> > > > are needed for pegasos2 are in one place. Other points I've reported
> > > > could be clean ups but not sttictly needed.
> > > >=20
> > > > With this series on top of VOF v20 I can now boot Linux and MorphOS=
 on
> > > > pegasos2 without needing a firmware blob so I hope this is enough to
> > > > get this board in 6.1 and also have it enabled so users can start
> > > > using it. That means that VOF will also be merged by then. This now
> > > > gives VOF another use case that may help it getting finished.
> > > >=20
> > > > I've also updated my development tree with this series here:
> > > >=20
> > > > https://osdn.net/projects/qmiga/scm/git/qemu/tree/pegasos2/
> > > >=20
> > > > Please review so I can do any needed changes together with the reba=
se
> > > > on next VOF patch so we don't miss 6.1 this time.
> > >=20
> > >=20
> > > It would help if you provided the disk or/and kernel or/and
> > > initramdisk images and the example command line to give this a try.
> > > And said a few words who is this Pegasos2 guy :) The series looks ok
> > > to me otherwise. Thanks,
> >=20
> > These were in the original series adding this board:
> >=20
> > https://patchew.org/QEMU/cover.1616680239.git.balaton@eik.bme.hu/
>=20
>=20
> Ah ok. Thanks!
>=20
>=20
> > For testing I've used the kernel from debian 8.11.0 powerpc iso which is
> > known to work on real hardware and MorphOS demo iso available from
> > www.morphos-team.net. For debian look into install/pegasos to find the
> > right vmlinuz-chrp.initrd kernel, for MorphOS use the boot.img from root
> > of the iso as -kernel.
> >=20
> > What's still missing is some rtas functions like get-time-of-day. Are
> > these any kind of standard and is there a doc about their parameters and
> > returns or I'll heave to find out from kernel sources? I plan to add
> > these later but not needed to get it boot.
>=20
> pseries guests use what the LoPAPR spec (derived from sPAPR - "server PAP=
R")
> describes:
>=20
> https://openpowerfoundation.org/?resource_lib=3Dlinux-on-power-architectu=
re-platform-reference

Of course pegasos won't remotely be PAPR, but you could look at how
the RTAS functions are defined there.

I'm not really sure of the origins of RTAS.  It's not in plain
IEEE1275 (the original OF spec), but the fact pegasos uses it suggests
it's not purely a PAPR thing, either.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RCVp3EKsv1kA52M/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDBzGoACgkQbDjKyiDZ
s5KzkA/9Hpy9S2D/QoktH233tISMs8xscDL4i+/73oZMB8Cpm2QNxHvasPZ+LfXE
5HpGil116CHfi6UPffOTGdMyPvZxlAJDrwYLvJ3spDIEBrYDufgBhxFKGU5+dybm
bkl6rPJjE73zAt0MFmVhS1s5LM2MTOuB9R4f2mesL/K5Cc9jrPpXDDzrVdEtIY0Q
Q38pSFezsR5ZZMNjDyjMPranGhsnem1zJjciEsp28F/LkbuVvfwU3sW79DrUYZ5N
V4ZRDSVhJUH7Zdhykq+SgqvCM4GeZHcP9mdr9D/mW2y5SPIKbobB0LA5rNoM16NR
5c6DbvJRwAzVCaPvmv+AhHhb7qDjvukaYzUVXZHdcMlOjWbdxZY/RRNJ1knd4x8p
cJbT0XuIVM2UKLbtC/JTyXw64UQGVuUPMZqKzz2eOa/dMXfDoAq6S4cF69QBfhgS
OsoOXqNVXDM4N7ayBj4GmDTDLk9RNIPO3hGy4/c2dbCx2BKyiLBaLRveFyuISQBu
WWaW618uU2MQzK7aLRfVBk/ms33wAqVSR5T4wY/CZuAXevlHMFlKhN1rFt217CZh
Ess7sh5dvCl0XXNMu4kTRM6UyMpOTu61ZeH6+I/qQGyTKiVEwXOQnInb6lMPYp+/
B9osjc22Km8b+In4dHutJ6n9Wgd8d7c3ee5IXfifeQ98w7IekxM=
=iTzs
-----END PGP SIGNATURE-----

--RCVp3EKsv1kA52M/--

