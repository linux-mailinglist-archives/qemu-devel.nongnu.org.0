Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303F410104D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 01:38:27 +0100 (CET)
Received: from localhost ([::1]:40740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWrXF-0007sm-H5
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 19:38:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58025)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iWrWI-0007OU-5x
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 19:37:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iWrWF-0003GJ-VV
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 19:37:25 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:60833 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iWrWE-00039d-PH; Mon, 18 Nov 2019 19:37:23 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47H6N84K9Tz9sPT; Tue, 19 Nov 2019 11:37:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1574123832;
 bh=z7cUct7Ut3GKCcwpXr1e/WmMpPZL1tnr/iD2iq98KjY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qOj7lGKTSHy4/cS/1y6vmYWAQELQ//Cs4oeABUnLiuX8gBbUddQYTVLi+UOM88v8j
 5pmx3Iwh6gS3OfMzq53RE4Wdcc/OkcHmm/3Yc3TGDbiN+I4TJw8SR3CEAfcyPtUjSS
 CeEYR6R37MT/12cXN0frSYmGnwkVAso9mFeQZsZk=
Date: Tue, 19 Nov 2019 11:37:05 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-5.0 0/4] ppc: Some more QOM cleanup for XICS
Message-ID: <20191119003705.GE5582@umbus.fritz.box>
References: <157403283036.409804.13586263493813758117.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Q8BnQc91gJZX4vDc"
Content-Disposition: inline
In-Reply-To: <157403283036.409804.13586263493813758117.stgit@bahia.lan>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: qemu-ppc@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Q8BnQc91gJZX4vDc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 12:20:30AM +0100, Greg Kurz wrote:
> This series consolidates some more QOM links and pointers that point to
> the same object. While here also simplify the XICS interrupt controller
> init in the machine code.

Applied to ppc-for-5.0 (correcting the spelling errors C=E9dric noted).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Q8BnQc91gJZX4vDc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl3TOTEACgkQbDjKyiDZ
s5KwfA//fpM0udWguwVaL18AWT+gKq8OXt4X8TO2CYSXGNLmLBajVyVNRbcVzlbr
xeb4aVZ/oYtks/17W20UQb86Rjn5Rx8cxAgG1P0nLeG0qH03YgLXheMo1iAhAJA7
xKVUGnV0zGt2WuhCqNVr63zi4mQ38hmjtfDlV54ASY4Ji2F+oOOcriEVxYqhNcW3
wKrM/eXmcVQmforD1oS7v5pJwi/uVOO1O4gNbZSZNVJLDkAoyTz2x2Kg0KO397l2
+Ci0zZzYPUQoL3fw4hBmYWe70HmgxCXklyZkHqHGXNjZxiz16njQvVVPD+s54SdE
UmglUkBcTPR0EBCrKQ/7QhGxoUYdCMmj2aifzmwNoFyrwr34n79dAkzvPg/Kr180
aX4dEfP7Rw0npC4bakhCyaSL8RjWyVqE9srTHV+wL1ZhnHV9D/5i+yfG2ajqKUQj
F31slC7XxGZjxuPeyE3w1funuobAmKhbmYikv9bXYmjTStfLPHJxk9dB5A44pySV
uDda3I+Msg1L8u6mVWsl78m85ZeSNgNU7zVsJIDoVLiHLzYeU3dMeCvQI4FgZLfe
83wWdOHmKuuQwjdY0URdConA6wlQIIgGjRUNvx5oI8nvIVb6Q+XnSpT5QF3Dhwox
gZ/cgcBvc//If3PjYfI0GD8Ku5i5neYMKk3pTRR1Zop4T4EtQoU=
=PXlE
-----END PGP SIGNATURE-----

--Q8BnQc91gJZX4vDc--

