Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 158213A29E7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:10:35 +0200 (CEST)
Received: from localhost ([::1]:40530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrIa2-0003Dc-58
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lrIZ1-0002NT-AO; Thu, 10 Jun 2021 07:09:31 -0400
Received: from ozlabs.org ([203.11.71.1]:37213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lrIYy-0001WH-HV; Thu, 10 Jun 2021 07:09:31 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G11T00kGHz9sXG; Thu, 10 Jun 2021 21:09:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623323364;
 bh=eahlqrIzXIg+IUun7kiVLVGe7buv97stqzraWECRcxc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Eo76Fl+c7/Jf+hV4zAxPG5UPYI8iyMXj1iJOe+trpWyvIPV4niI2d0p5jxRSoFE49
 1heSRl/5BvY198KNnbDM+ON40T7U5LLo4pso3NyZaXZsxK7Zx8Gn7JKJxPr1OcJz+o
 A2T2rvFx1x+g58qLHRnWZWczeCYheslqcvd0Sd7M=
Date: Thu, 10 Jun 2021 20:37:46 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [RFC PATCH 0/5] ppc/Pegasos2 VOF
Message-ID: <YMHreiLkD7Dp7vuo@yekko>
References: <cover.1622994395.git.balaton@eik.bme.hu>
 <5ab75d13-2fca-17cc-b24f-e86430fdda20@ozlabs.ru>
 <a5786f77-efc1-febb-7ae2-1e9543ca2687@eik.bme.hu>
 <bb539b72-5548-d035-8089-3d49f4babc1d@ozlabs.ru>
 <YMHMbVo2zrV6EsZ8@yekko>
 <b87683ec-675f-51d5-e3cb-f4f932fb2ba8@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dINLBfbSbE+Ys8bl"
Content-Disposition: inline
In-Reply-To: <b87683ec-675f-51d5-e3cb-f4f932fb2ba8@eik.bme.hu>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--dINLBfbSbE+Ys8bl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 10, 2021 at 12:04:59PM +0200, BALATON Zoltan wrote:
>=20
>=20
> On Thu, 10 Jun 2021, David Gibson wrote:
>=20
> > On Thu, Jun 10, 2021 at 05:14:45PM +1000, Alexey Kardashevskiy wrote:
> > >=20
> > >=20
> > > On 6/9/21 20:28, BALATON Zoltan wrote:
> > > > On Wed, 9 Jun 2021, Alexey Kardashevskiy wrote:
> > > > > On 6/7/21 01:46, BALATON Zoltan wrote:
> > > > > > Based-on: <20210520090557.435689-1-aik@ozlabs.ru>
> > > > > > ^ That is v20 of Alexey's VOF patch
> > > > > >=20
> > > > > > Hello,
> > > > > >=20
> > > > > > Posting these for early review now. I plan to rebase on the nex=
t VOF
> > > > > > patch that hopefully fixes those points that I had to circumven=
t in
> > > > > > patch 1 for now. I've reported these before but now all of thos=
e that
> > > > > > are needed for pegasos2 are in one place. Other points I've rep=
orted
> > > > > > could be clean ups but not sttictly needed.
> > > > > >=20
> > > > > > With this series on top of VOF v20 I can now boot Linux and Mor=
phOS on
> > > > > > pegasos2 without needing a firmware blob so I hope this is enou=
gh to
> > > > > > get this board in 6.1 and also have it enabled so users can sta=
rt
> > > > > > using it. That means that VOF will also be merged by then. This=
 now
> > > > > > gives VOF another use case that may help it getting finished.
> > > > > >=20
> > > > > > I've also updated my development tree with this series here:
> > > > > >=20
> > > > > > https://osdn.net/projects/qmiga/scm/git/qemu/tree/pegasos2/
> > > > > >=20
> > > > > > Please review so I can do any needed changes together with the =
rebase
> > > > > > on next VOF patch so we don't miss 6.1 this time.
> > > > >=20
> > > > >=20
> > > > > It would help if you provided the disk or/and kernel or/and
> > > > > initramdisk images and the example command line to give this a tr=
y.
> > > > > And said a few words who is this Pegasos2 guy :) The series looks=
 ok
> > > > > to me otherwise. Thanks,
> > > >=20
> > > > These were in the original series adding this board:
> > > >=20
> > > > https://patchew.org/QEMU/cover.1616680239.git.balaton@eik.bme.hu/
> > >=20
> > >=20
> > > Ah ok. Thanks!
> > >=20
> > >=20
> > > > For testing I've used the kernel from debian 8.11.0 powerpc iso whi=
ch is
> > > > known to work on real hardware and MorphOS demo iso available from
> > > > www.morphos-team.net. For debian look into install/pegasos to find =
the
> > > > right vmlinuz-chrp.initrd kernel, for MorphOS use the boot.img from=
 root
> > > > of the iso as -kernel.
> > > >=20
> > > > What's still missing is some rtas functions like get-time-of-day. A=
re
> > > > these any kind of standard and is there a doc about their parameter=
s and
> > > > returns or I'll heave to find out from kernel sources? I plan to add
> > > > these later but not needed to get it boot.
> > >=20
> > > pseries guests use what the LoPAPR spec (derived from sPAPR - "server=
 PAPR")
> > > describes:
> > >=20
> > > https://openpowerfoundation.org/?resource_lib=3Dlinux-on-power-archit=
ecture-platform-reference
> >=20
> > Of course pegasos won't remotely be PAPR, but you could look at how
> > the RTAS functions are defined there.
> >=20
> > I'm not really sure of the origins of RTAS.  It's not in plain
> > IEEE1275 (the original OF spec), but the fact pegasos uses it suggests
> > it's not purely a PAPR thing, either.
>=20
> Pegasos is supposed to be a CHRP platform so maybe there's something on it
> in that doc, I haven't checked yet but now you mentioned these I should
> probably look there.

Sounds like a good bet.  I believe PAPR is a distant descendent of
CHRP, so that seems pretty likely.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--dINLBfbSbE+Ys8bl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDB63gACgkQbDjKyiDZ
s5Ljmw/8DJ9kXa0Ac3R546oRzBhlQ3RZvQLFY9LPwfZLjbAFexB0qDkf2qvdfnTy
MCnjNYSwuo5QMoI4oy+YiBVVGSkbMBvg24I5cQ+MpbfblpDm9JqNA6dhbB2S9wxj
MIhbrD557CcUDiHgq0O8RrYJDax+RVIz1qNGfIrN2nXe5y5iuETQTglimKI+FcV2
ZGKdvGFYbsr/yjB/iWWnkJE9v+3OTCS0Sv5DF6IIcbLM5qhTjuRRuIVB9BhO/4IP
AYPsR7lcdZrLwM/88bR1xiWTfQ2EiDYxabYEOO/ur++gD1ew9j+JLsokoJw1szTA
EUY2OJVdzh2+ZFljlvu+2ZUVd9oEdZqu+jRJ3XIPl1SaFNJY6V1hzW/Gish8CeCr
5onJMMMC8gYcdDMOmewvGMmRuQ5z6NdPHBm2UuS9y+3n5NWBS9rZSoKIpJKxlbXX
tKsGRTDFkgr8fC7yki/t3ZU8YvuNi8lGDeS3D/CKc/lbbtr9cnPUYsXsgIB65lge
ZRYN9bPWTqy/wnZ/l2KcIpOiFz3b21aTeSrfzFt5gcBe50qJ9M4W0DuxSYV7bXTp
IYnYfVJNOifGZIquzq1P1Do1nlNeyYUtkUeVt7vnTn5Rfgqp8s/UrbILY9seQOZL
OGRnv5Ul82H0GeSmQtKOaywabOyCHQdFKq4GQc+FXZmT8yw5cNg=
=1xu6
-----END PGP SIGNATURE-----

--dINLBfbSbE+Ys8bl--

