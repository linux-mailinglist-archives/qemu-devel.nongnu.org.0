Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26717446D0C
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 09:56:38 +0100 (CET)
Received: from localhost ([::1]:37642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjHV6-0008Iu-M6
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 04:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mjHRx-0007Pd-76; Sat, 06 Nov 2021 04:53:21 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:42109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mjHRt-0003MX-V6; Sat, 06 Nov 2021 04:53:20 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HmWP41n6Nz4xdP; Sat,  6 Nov 2021 19:53:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636188792;
 bh=38uXB7008h3CMAPOacODurUFSKmCTMfL7T6EifvxnSY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GXYS+k0ySQxD8tIacSXamSlxBcg+dEDE7GfDU4enTPIA+ajSTpO43N2cvReHnKsl6
 1XOPl8OffcOPTqw3ushgLGNJWmfuhwvdLWFyDNbackNXnORBbExuBeNOukP2T1CWrq
 8Ez9PYrf8D7kUqIkjPKnG9sTu0Sx/zNSf8XPNoV8=
Date: Sat, 6 Nov 2021 19:53:04 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] target/ppc, hw/ppc: Change maintainers
Message-ID: <YYZCcDH/5ssXnORx@yekko>
References: <20211105034640.53754-1-david@gibson.dropbear.id.au>
 <8e05f98a-6a46-f728-5035-fab10f5a209a@gmail.com>
 <880124b9-5cd1-7fcb-fdc6-3d3f8a1da2b6@amsat.org>
 <91972ce2-8d1f-f22e-c87f-45cb3c221b18@gmail.com>
 <YYYCcwEuUNGVMKwu@yekko>
 <e93f45aa-b2dc-6f9a-d056-1bf50d431802@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0FDbn+waxgmVcorr"
Content-Disposition: inline
In-Reply-To: <e93f45aa-b2dc-6f9a-d056-1bf50d431802@kaod.org>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, groug@kaod.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0FDbn+waxgmVcorr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 06, 2021 at 09:28:54AM +0100, C=E9dric Le Goater wrote:
> > > > > Thank you and Greg and Red Hat for all the years of service suppo=
rting
> > > > > qemu-ppc in the community. IBM will shoulder this responsibility =
now.
> > > >=20
> > > > In term of the MAINTAINERS file:
> > > >=20
> > > >           S: Status, one of the following:
> > > >              Supported:   Someone is actually paid to look after th=
is.
> > > >              Maintained:  Someone actually looks after it.
> > > >=20
> > > > The PPC entries have a 'Maintained' status. You say "IBM will shoul=
der
> > > > this responsibility", does that mean the entries will be 'Supported'
> > > > as in "someone paid to look after them"?
> > >=20
> > > Yes. It's appropriate to change the PPC entries of this patch to "Sup=
ported"
> > > now.
> >=20
> > Good point, I've adjusted that.
>=20
> "Supported" would be setting the expectations too high. It is an extra
> activity among what we are already dealing with. Please leave it to
> "Maintained".

Fair enough, reverted.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0FDbn+waxgmVcorr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGGQm4ACgkQbDjKyiDZ
s5KwlhAA4kxjC66agg39NrB+xyA1xWi+xlUfdZY4bInHEH2Uof7uGkL34Ib9W/Gd
fz5WvTzwgIwzBOIYVD3RvdXm97VqMmAUKS262U9caBeEqA+e/H2ECYdo3FMMt5Xa
ZehnnwtmHMHRJy82gqUrFJKpL4XMn+7//asr49ncqj/Uuhs957zGGsqiWzzxHCeC
zXz+C/jaqJ2e3iTnt9ktxTHfB67k3nWYl6HezLAU5nhSCy67jZPeLrOFZjeZ13zW
aasS4slemwOtWBvLDgF4ToSklbOqXWCNenitFaFrQpFwJhS5uPFwYJTq3eFL4xdR
9sDb/anQ9Qol5AV/Hw8U2CpPAVMHCRIXGXBSA1d+qYNia50B95HHW1p+tWDcg9UL
kwKumNv9YjS525/KpCCj4f2Uari8Bc1YsrmdEBID2FF3LNmqC2qNwM1H1JbhGRwk
pFQM5Fn8pm16RqObEPj+YW8+Tfqa4jH34pvvHaTxW5I0RqJU+Hh4z121vKfZDT5b
3Hr/iVvOwwMfDYVbad8yXrlYdf9yTZWN8OvyToCujk5uIaYr1b0e77ko3tyefdao
cJhwMUuhx4KMIotqxT4g8VI/LFTgAl+/OVT1T0BqtWhzxSY3/xaxcwDxUgxjCYyc
6wCHbXvvIFLixC3xz4Zj8DUa7CgmcfMdYf25P+J3FFiuyoiVzUk=
=BewP
-----END PGP SIGNATURE-----

--0FDbn+waxgmVcorr--

