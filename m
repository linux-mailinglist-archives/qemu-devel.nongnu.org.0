Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7902095369
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 03:32:58 +0200 (CEST)
Received: from localhost ([::1]:60702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzt17-0007ts-IG
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 21:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33690)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1hzszP-0006sh-2Y
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 21:31:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hzszM-0008F7-I9
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 21:31:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:60787 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hzszI-0008BY-UI; Mon, 19 Aug 2019 21:31:07 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46CCtC0qWNz9sN4; Tue, 20 Aug 2019 11:30:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1566264659;
 bh=VjDFyGArDbbV2MrWns11fqvvVnSCWnoZMlTsiEazYfo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SDh0Tz3nhBpPe2g1ZhzfdBOcVzIT2AetrVZ/oVr90cTErJ4VSESmUyeElTrJMPxyY
 Xs5DxjcK2auFRSlGwubNIxcU0Elybc/yjCeDZs1Iy9DANpbpF0TVsk0bsgfgoLNEfR
 iO8ByuauiRth3bMycJJZQIcvvQL/JflgTC4N/PyM=
Date: Tue, 20 Aug 2019 10:59:18 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20190820005918.GA22747@umbus.fritz.box>
References: <1566242388-9244-1-git-send-email-pc@us.ibm.com>
 <5973dc51-ccd2-6b7e-5382-527686f9803a@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline
In-Reply-To: <5973dc51-ccd2-6b7e-5382-527686f9803a@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-devel] [PATCH] ppc: Fix emulated INFINITY and NAN
 conversions
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
Cc: qemu-ppc@nongnu.org, "Paul A. Clarke" <pc@us.ibm.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2019 at 01:57:42PM -0700, Richard Henderson wrote:
> On 8/19/19 12:19 PM, Paul A. Clarke wrote:
> > From: "Paul A. Clarke" <pc@us.ibm.com>
> >=20
> > helper_todouble() was not properly converting INFINITY from 32 bit
> > float to 64 bit double.
> >=20
> > (Normalized operand conversion is unchanged, other than indentation.)
> >=20
> > Signed-off-by: Paul A. Clarke <pc@us.ibm.com>
> > ---
> >  target/ppc/fpu_helper.c | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
>=20
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-4.2, thanks.

>=20
>=20
> r~
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl1bReYACgkQbDjKyiDZ
s5KEPA/9E0ORBYv54NmR3kQLfyWST6dVZEkct9MGIkYd8oWsQZjfOBZW9ZKrRoC+
A3IBMZyalF8CJS55ZLq8FbFjRC4+nHC6AlKYKzvCiqZmxoSYmNtZNaVCUZwsN/IP
70c3pJhyGTjA0jhjsotk19qffQqrhSL2yPxYYGzwk19wwr1xaZNyVvrXJTyvPDm4
bjkfTBtDoYnZc8sRA4z0GF50d+zk1itrOYLt0dJPwC+zvlqToWldPjsHxXl5gF1C
dkfAK4uEZQ5B88SiBZLPMFtQLzsaYuC2/lMIyvbI4FFJnJXQPi7DNsEVoadvewHT
Yq78dOkuG77/mxPvtund5EmubDStiXYDdpotmMinseRyKkpWfJ7G8ICvyrQMsn4Z
62omySY2AbybHf6C9sn2VrWWBzj6yXRf8j+6PKiaBOuyw7RCHC3LORWJQ0UoSe2M
VIN28tAWmPpw17yLPywHZYQGYkWOToKEGk+gOhz0JS11hVUdXxOlQ9F8hhRxS1Un
4VewBl2Q7Uji9wa5PfKHW9K/nxdSauDWvEFAReA7cxB8wI8+u4tUHrXX/6fjh8VY
MoQX38Y8m/a5Hb9UqzFrBkjTtr/ZdNNks1gc+aP17IngtanmtdTVXs0XxZPNsgZj
zVTCuFBp8yVJ+3LfJDcO8HW+fEQ5jnnXPIU7vcRzWBLvm5xfqYQ=
=nmBA
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--

