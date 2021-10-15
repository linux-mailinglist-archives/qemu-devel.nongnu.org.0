Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B20542EA3F
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 09:35:02 +0200 (CEST)
Received: from localhost ([::1]:35622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbHk5-00010b-5T
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 03:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mbHHR-0004Sc-Jm; Fri, 15 Oct 2021 03:05:25 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:37831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mbHH8-0006MS-6K; Fri, 15 Oct 2021 03:05:21 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HVy2N30v0z4xbY; Fri, 15 Oct 2021 18:05:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634281500;
 bh=k4pfv7DWVyPpVoLnu9MAEXQP5sa0tPOQi7ThBW1g/I8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fOd/9YxoNUk0Y465nVJ/aPt8CuevlaRmaFNO6VRL4VbZs2eEVOCmKcs4CybTv+Qux
 KXtF5odG7If5gPkjjTdWc958yKXC+g9hN6uJtnAbAo6S6AuvqqAXX+nXDhszQFNoT2
 soFjIFbfA93oGaAHReZ5aVMS+cM1LGr6sPeITCt4=
Date: Fri, 15 Oct 2021 14:15:14 +1100
From: "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Subject: Re: [PATCH v3 00/22] target/ppc: DFP instructions using decodetree
Message-ID: <YWjyQlmz6yarA7s4@yekko>
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
 <CP2PR80MB36685955837B010A35386926DAA09@CP2PR80MB3668.lamprd80.prod.outlook.com>
 <CPXPR80MB52243FC0D088E4ED5037CA7CDAB89@CPXPR80MB5224.lamprd80.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Wnw3d14Dh+UvtIOe"
Content-Disposition: inline
In-Reply-To: <CPXPR80MB52243FC0D088E4ED5037CA7CDAB89@CPXPR80MB5224.lamprd80.prod.outlook.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
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
Cc: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "groug@kaod.org" <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Wnw3d14Dh+UvtIOe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 05:02:59PM +0000, Luis Fernando Fujita Pires wrote:
> Ping?

I'm not sure who you're asking for what.  From my PoV, I'm waiting for revi=
ews.

>=20
> > -----Original Message-----
> > From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
> > Sent: segunda-feira, 20 de setembro de 2021 15:51
> > To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>; qemu-
> > devel@nongnu.org; qemu-ppc@nongnu.org
> > Cc: david@gibson.dropbear.id.au; groug@kaod.org;
> > richard.henderson@linaro.org
> > Subject: RE: [PATCH v3 00/22] target/ppc: DFP instructions using decode=
tree
> >=20
> > Ping.
> >=20
> > Patches 1-4 were already applied, and patches 5-8, 12, 15, 18 are missi=
ng
> > reviews.
> >=20
> > Thanks,
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Wnw3d14Dh+UvtIOe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFo8kAACgkQbDjKyiDZ
s5Lv0RAAv2CIp82DIW4BpcIqGJXEO4nvBEXIR+eI8ETOUAzfFRFa/StOoVJi1hfO
GOnFbxH21SlzpHRRKSErl7Uq7tbYzFmRs+ql8JCW0c5ovCOJl1bqNWQg/P81BcYg
Bvi0No8fDHeKJzzqNumRaBpsog6CvUKH0RPAXzNvuHGXb3eMnjSZm+5jnRZo5eAD
0iKBKoqwVFMZZHA6KqnOK+rqhkWBeXZ2GY7+uHpoX9NTWof5kK0W+s+NAtVVK1/m
YqRBx1M1uLTR49Aftx0C+G+r0rxnv9zbw849p77P/HAV1V0wgF4sH9/DHv9pJzFS
zv0JIa9sidxYErw8hiRIpMlG+fZj5QQgZGKsRGrnv8UBhM4JXnF+sZ2KS7P8FZeT
qJrkHBScMKoPmL3hvtX7bWHDFBcF2ucfW3FWK2khhU1T81mavRQhik92L3Ld9Cli
N6Pj5t1x+EMIxkcH8TUusaPL8iK4q5yIkgcjxA+3Bhsi/n6aACkNGeziCln4F90v
TPTYRMyss0UE5gXZlY84gQOZ6hqfMRTXRjXLIiBrNnVDaCziyGjF7GCOibCEzqPL
bmIr2LzwG2tXhR3WY4IBBBUs7LtR5xhjhxy9TCr9sse+1/cHLOYLNrzEoh3420AU
UxsY8V60zND8G4kwZnW/O+y4mFD90DdoBdDUzs/rMuRE6DRTlb0=
=I/A6
-----END PGP SIGNATURE-----

--Wnw3d14Dh+UvtIOe--

