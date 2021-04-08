Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CDF357AC1
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 05:26:32 +0200 (CEST)
Received: from localhost ([::1]:50082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lULJO-000789-I5
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 23:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lULHo-0006Ap-Ng; Wed, 07 Apr 2021 23:24:52 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40493 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lULHl-0003os-UO; Wed, 07 Apr 2021 23:24:52 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FG67v702Fz9sWH; Thu,  8 Apr 2021 13:24:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617852283;
 bh=TKgxEGBtWa1dcaindXLAu0NAsjiJh7/NrfqcAuTa+lg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pr4askqPXOSEALvu4zyJBMH5NiOsI98qXJ9S7/4u0EKlZeT1CJe8G51BMwENECTFa
 27W2SYdURHa14/sdYLfhImCYEUCGdxgC6MTGCMiXIa6vVHgL+0F4mfNppPwhoorcvd
 /BFZmTJjgUrGMIPy192PvwvGSmzI6SzuQMh8wnMU=
Date: Thu, 8 Apr 2021 13:14:01 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [for-6.0 PATCH 0/3] ppc: e500: Bump ppce500 u-boot to v2021.04
Message-ID: <YG50+QEhaX+/wEc2@yekko.fritz.box>
References: <20210406081513.1013372-1-bmeng.cn@gmail.com>
 <YG5s0nGaArqTicXD@yekko.fritz.box>
 <CAEUhbmW1ZCsY2z3yjOukxbj3kKJk-CdPj1KUVQFRey0WZR3U9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XLFbET+I8DL0hNXy"
Content-Disposition: inline
In-Reply-To: <CAEUhbmW1ZCsY2z3yjOukxbj3kKJk-CdPj1KUVQFRey0WZR3U9g@mail.gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--XLFbET+I8DL0hNXy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 11:07:22AM +0800, Bin Meng wrote:
> Hi David,
>=20
> On Thu, Apr 8, 2021 at 10:39 AM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> >
> > On Tue, Apr 06, 2021 at 04:15:10PM +0800, Bin Meng wrote:
> > > This series bumps the u-boot.e500 to v2021.04, which fixed a long
> > > overdue broken pci issue caused by QEMU changes since Nov 2014.
> > >
> > > While we are here, add a reST documentation for the ppce500 machine.
> > >
> > > Please pull the full contents (binary) from https://github.com/lbmeng=
/qemu/
> > > ppc branch.
> >
> > This is much to late to go into ppc-for-6.0, but I'm happy to queue it
> > for 6.1.
>=20
> I think this should go 6.0 because it is a bug fix for the long
> overdue broken pci support in the U-Boot binary that QEMU ships.

No.  If we were early in the hard freeze, then maybe.  But this
certainly isn't a regression - it's been broken for 6+ years, which
means we don't have a case to put it in rc3.

>=20
> > However, I'm not sure which branch from your site I need to pull in.
> >
>=20
> It's the ppc branch, as I mentioned in this cover letter.

Sorry, I missed that.  I've now merged these patches into ppc-for-6.1.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--XLFbET+I8DL0hNXy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBudPcACgkQbDjKyiDZ
s5KCHA//c3hht6X/IiPkjKvEptUw3dXjJ0gZDsnWLltoD8iynELP3i4FCAI+s0HX
jpbT84IKmaXom6/V8xv/rbd015kBjdyvvrhMAplfj5NbtRIJGCwu4bgJBNOoLZST
0NVOfN6Y2Q0vvAcQIB0ny3M4GeF6nxrDOmfKZxkUYLhZ5rk3xxF7bHm9ecztuD5l
LGy0KWdqwsz98v/FMOZHFAnwEPoUzKJJzGTjXU1DAUSje96anARbNpLZTUQmuILi
xMj8vbcBt21QjjvcuGf8UO6ZO5hCzlhpQ1MJx6SkwUXUCHIkIHCQcklYnJngl0Vg
oHuseL+wggSvaDptaf9uJoHU3be0JX8srDx14SXFRqLCIljzxpyLsUKpzasRgqGw
WOQdPkn/VTdq9NbeE7H+SHAGK2SgYepzT7wCgKL20ohl9CD3ntiKo1267Hi7SyR7
qfrCM7HIjMFTJgtc2CX3/VhUUbSEsMq5mOKRNfkzy95fsg6ui2nQd8JYQptK3BAs
JPLCp9cdHiTLMwTbxUB12nnu/trPFdJE2zAqv0irxzEoIeAQuyHQrN75gh6y3PZl
f3HPN8EEXW+DNbzTps2LqNWBD0GRaZtZjg3hiwCcLlWsrHw185HUokd84I6UCTG/
qs8tBKh0fisHPJS8Zdbqu+4QOkvKsOV7GDuMBT7wvSJhuwj+z88=
=IP9I
-----END PGP SIGNATURE-----

--XLFbET+I8DL0hNXy--

