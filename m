Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 161011409D1
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 13:34:11 +0100 (CET)
Received: from localhost ([::1]:56424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isQpG-0007YG-4l
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 07:34:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41429)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1isQiJ-0007n2-JB
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 07:27:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1isQiG-0005oz-3T
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 07:26:59 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:56167 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1isQiF-0005jQ-BZ; Fri, 17 Jan 2020 07:26:56 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47zgKh08qzz9sRs; Fri, 17 Jan 2020 23:26:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1579264008;
 bh=YYqADTc/vQ2oa49vmSLvivrEs9lM7YBlYI4S2cNfv8A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U7m1fVtNucUmgDWgu0t6KK5k9aoLPYDRNoaXjwXDgdmCG05nVWpK2X/KeQQRt6hfh
 uDE7hvhDcSqnCyS2Jy6axWpZ1BOuFEFN4XUIbi7qFoQz2OgxRkT4XJw59D8ax0LY0l
 ZI8g0BXoa1smlWIpV+BxcmJOc0P1xIKUiGuqftgM=
Date: Fri, 17 Jan 2020 19:30:04 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v6 2/3] kvm-all: Introduce kvm_set_singlestep
Message-ID: <20200117093004.GZ54439@umbus>
References: <20200110151344.278471-1-farosas@linux.ibm.com>
 <20200110151344.278471-3-farosas@linux.ibm.com>
 <20200117092748.GY54439@umbus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="p1zSJVlfBL7BTggM"
Content-Disposition: inline
In-Reply-To: <20200117092748.GY54439@umbus>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--p1zSJVlfBL7BTggM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 17, 2020 at 07:27:48PM +1000, David Gibson wrote:
> On Fri, Jan 10, 2020 at 12:13:43PM -0300, Fabiano Rosas wrote:
> > For single stepping (via KVM) of a guest vcpu to work, KVM needs not
> > only to support the SET_GUEST_DEBUG ioctl but to also recognize the
> > KVM_GUESTDBG_SINGLESTEP bit in the control field of the
> > kvm_guest_debug struct.
> >=20
> > This patch adds support for querying the single step capability so
> > that QEMU can decide what to do for the platforms that do not have
> > such support.
> >=20
> > This will allow architecture-specific implementations of a fallback
> > mechanism for single stepping in cases where KVM does not support it.
> >=20
> > Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>=20
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
>=20
> and ppc parts
>=20
> Acked-by: David Gibson <david@gibson.dropbear.id.au>

Btw, I'm happy to take this through my tree, but I'd appreciate an ack
=66rom Paolo before touching kvm-all.c and exec.c.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--p1zSJVlfBL7BTggM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4hfpwACgkQbDjKyiDZ
s5J96xAAuh0npqdU2LbTiGtkLoyBxtLOyVM7iOlH8KiIBsBufgm9HlSAuxtpZ5DK
GDOJ3SnAR/B013wj4ajwlgwJwhwMS9KWy9geJYQJWIkO7vpeDSK64l6mPFYv6rrA
EbCsJjg1DjRTSVhqvdyOrCXSzsRB6c9epEMjx/9AQ655BwPVEmR1DZPEJGqzXicI
nnYd2tqyKhs74XWK3MKlOZKKxNG/sgnRpJS1XBtubVNwhWIf8S7cNsaK7Cmf0ynb
DYVn48oqTKNUSTFAcZjKWWPucP8nVJXk0XWlHtiadr5LF7NDLFqhv0TWm6QarPo9
B0Vx3HdxntJZKhV8ApuBspjJ54C9jL+jYiVDzBsi09h86+uQxaapoXFd1eZZ9WsV
0iEXrwXYHDlJm8cJ9gUUVXL+FThWnhzr7xdlORnyvL/WytaPUOBTSGbo/9lmgqOM
xAuRL1nwCiRzN51vvq4V3vrS2a1BqQR5g6WBLf3TCGPTkBUsRx576agPyyBMo9Va
f7UDkP9wMkP+U35+zGs7h8b6MFZbAMVDn4WrkDyOYjAKXGfSBP868Bc4UuXAMe/U
IGaHsP454bqAfcXVWKDyw88yC2JVKXiNb/d6O0H6ZzU9dHfym1sXau4XKvpJ9WJB
7n1vAjFD5/AtxxK634OHeZM9W32qsFPwN6s0FdQ1PDsZHBx0fjA=
=aNFC
-----END PGP SIGNATURE-----

--p1zSJVlfBL7BTggM--

