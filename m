Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0116C902
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 08:02:41 +0200 (CEST)
Received: from localhost ([::1]:34486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnzV2-00055z-7p
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 02:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41789)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hnzSw-0006rj-VI
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 02:00:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hnzSv-0004HN-SB
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 02:00:30 -0400
Received: from ozlabs.org ([203.11.71.1]:45809)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hnzSv-0004Dp-GJ; Thu, 18 Jul 2019 02:00:29 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45q3QC0QQkz9sNg; Thu, 18 Jul 2019 16:00:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1563429619;
 bh=tJCyk0mwOIqL3kphIOMwOymlTBe7YfKjRJWZQRx7ez8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IiBBx2RL9jFMkSxEQ4mrNHz7gpQyxOzgX38qRmwN28TcPKP9i4T9bEEPnhing28kr
 8MZgxmnzjCQGggbdO5CvlOI2QnYvyiTxqQpX6RTwJ2PCWfPeCVkBpTMOgEWOafy4or
 rbNrFwjIOWIXPTX8OVbcZGNfVdkH2m4AAAudh9kI=
Date: Thu, 18 Jul 2019 14:31:00 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Message-ID: <20190718043100.GI8468@umbus.fritz.box>
References: <20190718034214.14948-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4BlIp4fARb6QCoOq"
Content-Disposition: inline
In-Reply-To: <20190718034214.14948-1-npiggin@gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-devel] [PATCH v6 0/4] spapr: implement dispatch and
 suspend calls
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
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--4BlIp4fARb6QCoOq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2019 at 01:42:10PM +1000, Nicholas Piggin wrote:
> Lot of good reviews (thanks), several more bug fixes and some good
> cleanups.

Applied to ppc-for-4.2, thanks.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4BlIp4fARb6QCoOq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl0v9gQACgkQbDjKyiDZ
s5KtpA/+LmRLaV5pQoiBt7sbmSjMt342Sngl75SWnUGZb3XBXsjjCed1KqTWYNv3
OX/OJf+slu0PUtd/aBvGj8Uz956FcvM1y7T85rHZYIfZxBqa6lp8vnfBBOsnLZ1Q
fWUAyXGsCa5yDOzjfnfbFfn7/CZgw/XpyA8lD56L2exb4J2+cKdZQtCuWan0ZwEw
E5hvcGS1lIFU3ppgs1bnNYZZpBJyf5JqLo44PB9fAe+f79+p56RprclXtPHx/B+0
iUC4l2y/7cEc5lJOAU9F3e8FHaK2ofZwU23l9xtKPP9yDz7kKZGcni/p6r7aMyBF
MKzaxtAoRg8ttTKOAZeF7y5FOEikrj1FEFSE5b9OtrzoMdbyPrdmgkOWZjiWJstR
rjNQhFYP/lTHKu4YWBSmNVWHpu5fxiJ+uxB0jUt3mt00+4TGu1V26y9OYNJ9POiy
Q7EKAo4rWV7J+xA29IEYo2AJ7goYmb3itQ/tBKvj0u+Hjbkq25TJCDxu4FuxGNPF
74frreo3ykzPDNY/ra88qZMmOcxjP93hpRxSC2mtAo7mg+67ru57/1wzmAB52SBK
6HuKJ6yTn84+VFseZguNdjDvM0jxjdrG88h6/TZzK2Y56GihxCOusjd561rgQHGS
PstjrQNbKu/0dgaBMa2kpd69xOZOza7vrLaVcXPdxKEF1Y99wDo=
=W/EF
-----END PGP SIGNATURE-----

--4BlIp4fARb6QCoOq--

