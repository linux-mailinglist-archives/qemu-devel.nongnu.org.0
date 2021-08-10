Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1685F3E5081
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 03:07:06 +0200 (CEST)
Received: from localhost ([::1]:49048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDGET-0007bq-1L
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 21:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDG6t-0003AU-Dv; Mon, 09 Aug 2021 20:59:15 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:59385 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDG6p-00082v-C7; Mon, 09 Aug 2021 20:59:15 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GkF2f2X0vz9tjt; Tue, 10 Aug 2021 10:59:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628557146;
 bh=tEwuux3CGTTwM7lrorYICvHmodNGe5XRtEhHZ2NEQp0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OzvavkTvpfMbSqEsU7YQxoDr9zRpe4sDAzvzctDjbOk+f/pDnHgAeaPyJCcYNyqCM
 0M3nHU/XPJ5l6dbm2dLdbslo8unBmrv/qRSOr3nvHgBUMLmEl06oLw4v3GD3lzhiq9
 P5+oJt4Gq9JU5rT8GGgCvvTpL1BH7MaKGgcllkUU=
Date: Tue, 10 Aug 2021 10:58:36 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] ppc/pnv: update skiboot to commit 820d43c0a775.
Message-ID: <YRHPPBdq0RUxC4rB@yekko>
References: <20210806180040.156999-1-clg@kaod.org>
 <3935af0a-1fee-9a56-21ea-d4c94b886bd3@redhat.com>
 <81996cbe-e526-64cb-cfe6-40327effe66d@kaod.org>
 <4e7b51b8-8b77-3634-eab5-eccc2e01b7c7@redhat.com>
 <95c51605-a1dd-5e20-5f8c-8dbcc9de9100@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="biKfmbPG8l00WaMU"
Content-Disposition: inline
In-Reply-To: <95c51605-a1dd-5e20-5f8c-8dbcc9de9100@kaod.org>
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


--biKfmbPG8l00WaMU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 10:14:05AM +0200, C=E9dric Le Goater wrote:
> On 8/9/21 10:06 AM, Philippe Mathieu-Daud=E9 wrote:
> > On 8/9/21 9:55 AM, C=E9dric Le Goater wrote:
> >> Hello Phil,
> >>
> >> On 8/9/21 9:06 AM, Philippe Mathieu-Daud=E9 wrote:
> >>> Hi C=E9dric,
> >>>
> >>> On 8/6/21 8:00 PM, C=E9dric Le Goater wrote:
> >>>> It includes support for the POWER10 processor and the QEMU platform.
> >>>
> >>> 1/ Can you include the output of 'git shortlog v6.4..820d43c0' here?
> >>
> >> OK. See attachement.
> >=20
> > By "here" I meant in the commit description ;)
>=20
> yeah I know but David queued the patch already.

I can replace it with a new version.  Including the shortlog is
probably worth it.

>=20
> >=20
> >>>>
> >>>> Built from submodule.
> >>>
> >>> 2/ Could we have a CI job building this, during 6.2 cycle?
> >>>    (See .gitlab-ci.d/edk2.yml and .gitlab-ci.d/opensbi.yml)
> >>
> >> Sure. It doesn't look too complex.=20
> >>
> >> I plan to add acceptance tests for the QEMU powernv machines also=20
> >> once the OpenPOWER files (zImage.epapr and rootfs.cpio.xz) are=20
> >> published on GH.
> >> =20
> >>>>
> >>>> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> >>>> ---
> >>>>  pc-bios/skiboot.lid | Bin 1667280 -> 2528128 bytes
> >>>>  roms/skiboot        |   2 +-
> >>>>  2 files changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/pc-bios/skiboot.lid b/pc-bios/skiboot.lid
> >>>> index 504b95e8b6611aff3a934ff10f789934680591f9..8a3c278512a428a034ed=
5b1ddbed017ae8c0a9d0 100644
> >>>> GIT binary patch
> >>>> literal 2528128
> >>>
> >>> Consider using 'git-format-patch --no-binary' and a reference
> >>> to your repository to fetch a such big binary patch.
> >>
> >> David would pull from my tree then ? So that's like doing a PR.=20
> >> We can do that next time I send an update if David is OK with=20
> >> that. I should send an update for v7.0 tag.=20
> >=20
> > As you wish. Big patches gave us troubles, i.e. they make crash
> > the 'patches' instance. 2.5MiB is probably borderline and I'm
> > being nit-picky.
> >=20
>=20
> If we can do a PR next time, all should be fine.
>=20
> Thanks,
>=20
> C.
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--biKfmbPG8l00WaMU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmERzzwACgkQbDjKyiDZ
s5LcOhAAzXJdjK6tm+zXrTYJG4KAttqoXwROPi3sC5dRIgpqWDG0bvQpYCAPu7Vo
COSmi1iPdi+zRybgIbpPNTvV+gwvCnwQ08CK0iu++/5byL7m0sPOra62ovRT6Flb
wKajNP9VGjAsxeVuj65h3Gl5ApxVmi8X6ugDGSyvp5sEOEEsLI3+wuvDCurOYE8i
e8hLFDsYxZZKw4oZaIOLEULyKrejAND5etJOZzYMt4FR7YeesW3dlZrs0xdzAmW1
e6z+F0UYy8jBTdCWjKVqKY6XK867Lusnub0bYbbp+aQkm7nfYmJ383PWYh6fHWBT
Db0OcG/puYohfvAitHm13gPccsvwkRvhbvAR5Bg/PcER/2aqZ84vyXlFeNW9n5Ax
TMxSXJ8otPGbjKyXoDHEpj423gUo9TR+Sd78ErFkAhwujXQeJPcCgbmbEmFUvhgx
l6v5JS5H4sWJOahu5mEQuK06XZMIxqPKvSWzSac6/11HnQ/KVZO8GXGGk6fUeg73
Pdr6LT6qrAZX1g3xHdqHczRuMP/B6S7dRp8b6kzKDniW7aUN+LINjVn6PW8XXQ5c
HNs+65PoWhZSFA3YgdK2JCn2/KuSVLXS0vPAhDokztcBGNFh7Bju+8j1LjvmrdIE
Yfw2+rpZJa8CU0JLL8yllpyKk0xqXT0FcyuMWbh46y+AwZ4zJ38=
=ZOs8
-----END PGP SIGNATURE-----

--biKfmbPG8l00WaMU--

