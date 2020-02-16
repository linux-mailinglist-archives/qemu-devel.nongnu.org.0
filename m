Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C9716070C
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Feb 2020 23:55:41 +0100 (CET)
Received: from localhost ([::1]:37656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3Sp9-0008Rk-JC
	for lists+qemu-devel@lfdr.de; Sun, 16 Feb 2020 17:55:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54513)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j3SoF-0007vp-0C
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 17:54:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j3SoD-0006Lg-Lc
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 17:54:42 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:43761)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j3SoC-0006EZ-Oj; Sun, 16 Feb 2020 17:54:41 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48LMr86rvMz9sPK; Mon, 17 Feb 2020 09:54:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1581893672;
 bh=4cMVG36cdnL0jgvZ5OqA62klg9q6qeotJBmXn4l/O14=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=INuy95g7LLdVvUdihvKq1RffpFvT/w8Hgo782gJWSGCRWOeuWwqaWEHKntjQkOIPZ
 S0nVYztgSgy+FezVaeDq7I5bnDTubdU3AK4CERbBNz4H1wQW77+5En1IlvftjB1Qu4
 LQzJiJgMUiYU15UKYvbpYSpHF9hshz8PG/dQzf1k=
Date: Mon, 17 Feb 2020 09:54:10 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 0/2] Small clean up in target/ppc/cpu.h
Message-ID: <20200216225410.GB1697@umbus.fritz.box>
References: <cover.1581888834.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="K8nIJk4ghYZn606h"
Content-Disposition: inline
In-Reply-To: <cover.1581888834.git.balaton@eik.bme.hu>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--K8nIJk4ghYZn606h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 16, 2020 at 10:33:54PM +0100, BALATON Zoltan wrote:
> Just some small clean ups to improve readability of struct CPUPPCState.

Applied to ppc-for-5.0, thanks.

> BALATON Zoltan (2):
>   target/ppc/cpu.h: Move fpu related members closer in cpu env
>   target/ppc/cpu.h: Clean up comments in the struct CPUPPCState
>     definition
>=20
>  target/ppc/cpu.h | 146 ++++++++++++++++++-----------------------------
>  1 file changed, 54 insertions(+), 92 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--K8nIJk4ghYZn606h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5JyBEACgkQbDjKyiDZ
s5I+qg//YLFlqHJ0Al2+cMW+Ffy9Ctf7g1UdWKMxj4GJYUHehDc0xtLn7K6cMq0d
w4q6iATvnm+CmPCsAvgv+P4ucsedwI5ZCLaBUXcSInI9POTO1b56ne9ozEedqlm/
LDWdmhpIySwTpgAextVI1LTyKHI9N4VrIjEiUBjhvKaNjyBaESJKQAGC9z5WZduw
x4zHlaqlcJzEDGbxLNHhYPghHJTXGjk3t/a4r7xfjjOEwxV+grEqdpis1YdnmxOO
5S4IICElZzYt0gZx85vfFmrKiLeiBLDKQRmsB25OBimK/iNmVBm4JeADfq0hz0ch
+Piz2S8PxJz6iEqV0Yx1bjo068zSqm2IJl4da1VIgLtpuuVXcn0+vJHmTZGwMqj+
zMHyOJEfMD63S4LWhYc7LcDfl9CT2nPfDrJnRT0qdk0mj+26wOh7MKZud6Nld6nj
hTgnkt6Oybau690Dh9YZ6Hrpg2nGGxarBzi80Er7gPefChsrDuoHNrx5c1Aivw8n
Z1wvUgDcmNOEfWbEvIWcXemv7WMM2wmT2uFkKJQfZ4L3EUNGZuqX0khodBwLSSDd
sQuhYtnFFTk+6dKWoY2OFrvX7sLiBy2GZyzS65dTjuuLea8zqTu/ws2bGHDDWlPO
mTSEEJtoqlL5YY+XYUu+9VfYx6+EqmNvp13l9NaXCLdC4xj/oKM=
=rODm
-----END PGP SIGNATURE-----

--K8nIJk4ghYZn606h--

