Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B55BB12008C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 10:12:56 +0100 (CET)
Received: from localhost ([::1]:48846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igmQx-0005WP-BI
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 04:12:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55133)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1igmQ2-0004uc-TI
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 04:12:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1igmQ1-00079d-8r
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 04:11:58 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:54139)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1igmQ0-0006ov-4i; Mon, 16 Dec 2019 04:11:57 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47bwWV0ZKGz9sP6; Mon, 16 Dec 2019 20:11:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1576487510;
 bh=4E7TJy64cpksRuxA+tYHs7DFaVXkQYq6dHDXcZ+gzFw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sxw254aT0CePSoudyf9Yy1eK3tZ0bNvzXg2BNRNutIjyqbRpgA7S/tFoQowPO3am6
 +4naq932wI+3/7erBeiwYLnFn85yGfVVh7/+62X463E1+Bi01Iju6GAj0mys2Xs76d
 ZYlINAvZxm/HMIeyl/+Zia3JODi1QIqNOyyufnzs=
Date: Mon, 16 Dec 2019 19:39:11 +1100
From: "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] ppc: remove excessive logging
Message-ID: <20191216083911.GE6242@umbus.fritz.box>
References: <20191214121347.17071-1-joakim.tjernlund@infinera.com>
 <4a608af2-62a2-3ffb-0c02-8e0ca699d586@redhat.com>
 <alpine.BSF.2.21.99999.352.1912151147300.3618@zero.eik.bme.hu>
 <d975fe075db9db4266437e1575987fe0f2d82ca4.camel@infinera.com>
 <ec67a070-77e2-08dc-9cc5-05907bbcbe79@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="a+b56+3nqLzpiR9O"
Content-Disposition: inline
In-Reply-To: <ec67a070-77e2-08dc-9cc5-05907bbcbe79@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--a+b56+3nqLzpiR9O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2019 at 09:27:13AM +0100, Thomas Huth wrote:
> On 15/12/2019 22.15, Joakim Tjernlund wrote:
> [...]
> >> LOG_EXCP() is not enabled by default, you have to edit source to enabl=
e it
> >=20
> > LOG_EXCP is enabled on Gentoo, what about other distros?
>=20
> I don't think that this is enabled by any other distro. Why is this
> enabled on Gentoo at all? It really should not be enabled in builds that
> are supposed to be used by normal users. Have you tried to contact the
> package maintainers of the QEMU Gentoo package and asked them to disable
> it there again?

I concur.  LOG_EXCP is definitely there for qemu developer debugging,
it's not intended for use in "normal" builds.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--a+b56+3nqLzpiR9O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl33Qq8ACgkQbDjKyiDZ
s5IHTQ//d2ZJwrep/s0Gu7+uGummFEykCCewY6jzYX6Bs5lwEX03lVpbvfILoo9Z
AAxaXhwwM2c2SlQf7HTcYx0cy9M+9diiwkrGXpDwjzISVSXyQdSrVFJcjJMXDKIU
ekh34rnmJ6ZjJq29j8SMwBSlihYSqC7QanbqKHtf60/LqWBK+L3u3BCdmSZLbI5j
1k6gfo7YMJoIAy0y+jFcoaEKH/6yBovx+Qb8qmkpZ7f6i83orKgH3mYkRW6NdTop
x+u1z12vRewhg4GbFL47YPbvH+GK5U+06nAR3nNCvp108CeBNVySMaIt449FHRLf
kroDyFZPHMN/vld5eHhO8EvatGpueurhS7qxtYPtVGE6yxjIeZ4NsxeM7JcyCVSb
j7oXlSTfUWLfN0/wEE6p45AECKlVTI2SI8HiAPy41fjNNwuJ9UeqYOwBuqbPkZFr
faxdtfjJs0U5/B1vCKQzuh2DDM+Tg+exPgmRlBYq+WUECtfA1i+Iqu1YpFDRLKXI
zad8iLrNJfKgtBsF7sXDHlAy9U7pGnLSTOK7l3sPjjhxs7w281fzBXOBkWyFu9AP
MueTJOLqE6kU9B/MfW5XvO163SwNHITwgqXQS03cqNUJa2UBKl5wRRRyea0CTq77
gvRLzlr4aI0HbjsucdBtW0KzTDMzhTZWOH6ZUgdsGQLvDmJvQ7A=
=RZRv
-----END PGP SIGNATURE-----

--a+b56+3nqLzpiR9O--

