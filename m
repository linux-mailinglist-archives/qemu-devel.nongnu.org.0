Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6728C3FE95B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 08:38:46 +0200 (CEST)
Received: from localhost ([::1]:55206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLgN3-0007UC-DE
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 02:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLgIQ-0004Zq-GH; Thu, 02 Sep 2021 02:33:58 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:59409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLgIM-0001as-Do; Thu, 02 Sep 2021 02:33:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630564427;
 bh=4tyTeKwoKjXKvhwQIwhVdvRNGxya25AV2gwHobgYFyc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bc6QzLAHPxsr4onsmcJFY7MqtwQpXWVQoZAfVb65P3mqO1vwcU5jIeg1FfKQW3Pkl
 AJ6lORSidYZ+aP3H+owvXwcFOZ21+zclsZq5XunHI+Yq7X1IhIAui0MGQog9VUFisK
 Lw3SNsQ+LT4KixsCZxPAqYXuSaXAg57n6EdrGr2E=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H0WNC6kRZz9sW5; Thu,  2 Sep 2021 16:33:47 +1000 (AEST)
Date: Thu, 2 Sep 2021 16:33:14 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 5/8] ppc/pnv: Add an assert when calculating the RAM
 distribution on chips
Message-ID: <YTBwKg4G/6IfPip7@yekko>
References: <20210901094153.227671-1-clg@kaod.org>
 <20210901094153.227671-6-clg@kaod.org> <YTAq3pj2Chwzk6km@yekko>
 <62d0de2e-bb8a-6bba-aa2b-029474c47d11@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="k6sVBurpploFim1h"
Content-Disposition: inline
In-Reply-To: <62d0de2e-bb8a-6bba-aa2b-029474c47d11@kaod.org>
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--k6sVBurpploFim1h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 02, 2021 at 08:28:49AM +0200, C=E9dric Le Goater wrote:
> On 9/2/21 3:37 AM, David Gibson wrote:
> > On Wed, Sep 01, 2021 at 11:41:50AM +0200, C=E9dric Le Goater wrote:
> >> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> >=20
> > Uh.. I thought the proposed assert was about making it clear there
> > wouldn't be a divide by zero, which would want > 1, not < 2.
>=20
> This is very wrong :) How did I come with this ?=20
>=20
> I will keep it for the next round of powernv10. Are you ready for a
> v2 ?

Ready enough.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--k6sVBurpploFim1h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEwcCgACgkQbDjKyiDZ
s5IbLA//dYVLlINMVkfQKuOj8zpFRagIlRcxs2VILaghDrqdJB6dgmquaWjNvrZY
b/8AFvbiTZxgkcKSflkINPU45qrgTfdkuEzQTBJa5k9uDwuxDGrvHhzCtGAZpVF4
M5zzD7KuQWJnmmsm1df6H7mFnifuZsffJ+T2W7yFypv9ICVMUa1uuYYvIpnoXTLo
cA2cpjcQADSjGIXd2GDhdcM9go7pHbvOeNOfB493lZICsfAGcmJ115LrYtCzrf5T
ZhGw82opncwE8KfXsjoHy5fRGSG28qCgEMVqQinOWkVLR2THbFc0lnFTsqaDI5nO
nLQShdL1Tek3V7gG0YQJP5KX4ugTbeXiG8Cc+0QbhF+Ipq16EGtAZKcXbL1HFV3f
EuSMmA5K3CDuuSDLLwlcQj4e0DO6oxTcWVlEQu9sooch24X2YTbljV6RMOaa/Hbe
qHi8R+2j/8SmDypYk7Y3Dq5lVyCky+7jAi21uhhzAdl3bCJr1NrQyHjQLhTvt9ju
q7Lw760ndJwf3SNkRNDdwpHRm9WOBOow28fmyEUo5fEh11XJmH4Fj3DtJ7T07gSI
HqCecn8oK3QUGK9zHoJtajAgtVT3XcZknS7mGMBuQ40Z7LrWpQsWwhM7jF4Yb4yX
pKBm8KCGoMLG+Eso8Pz4NTJp9CRDYW9BSKqzbHNaRS4M+MRR5cA=
=2WG4
-----END PGP SIGNATURE-----

--k6sVBurpploFim1h--

