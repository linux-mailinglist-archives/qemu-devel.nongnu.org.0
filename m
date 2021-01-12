Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89472F2A18
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 09:34:11 +0100 (CET)
Received: from localhost ([::1]:49262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzF7x-0004r1-V7
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 03:34:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzF6L-0004IB-F4; Tue, 12 Jan 2021 03:32:30 -0500
Received: from ozlabs.org ([203.11.71.1]:54935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzF6I-0000E6-QW; Tue, 12 Jan 2021 03:32:28 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DFP2X19HVz9sf9; Tue, 12 Jan 2021 19:32:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610440340;
 bh=AtqpNzyn+Y9L8YUURtGReatMowRCZuDFDiAJ9L6Wh9g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KG35xSAqPQlE0xf8OpTEvIaHSh7O+ivOfS1YVm5jV0S1bckJ2veWQxq0S3enCIDrN
 DvUk5ki6detSKF94j9y9THpLCS8WJ/LcWjjB8CZHB/2MOieCACjMEEuweMrLXb2jPA
 gp60T6rKVRE4pmo36VGExyhUImZ+fuDwJuB0ma6o=
Date: Tue, 12 Jan 2021 17:22:26 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v2 0/3] Fix up sam460ex fixes
Message-ID: <20210112062226.GA427679@yekko.fritz.box>
References: <cover.1610143658.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline
In-Reply-To: <cover.1610143658.git.balaton@eik.bme.hu>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 08, 2021 at 11:07:38PM +0100, BALATON Zoltan wrote:
> Accidentally the wrong version of this series was committed, this
> series fixes that up to the last version that was meant to be merged.
> This v2 is rebased on Peter's UIC series and clarifies commit message
> of last patch.
>=20
> Based-on: <20210108171212.16500-1-peter.maydell@linaro.org>
>=20
> BALATON Zoltan (3):
>   Revert "sam460ex: Remove FDT_PPC dependency from KConfig"
>   Revert "ppc4xx: Move common dependency on serial to common option"
>   sam460ex: Use type cast macro instead of simple cast
>=20
>  hw/ppc/Kconfig    | 6 +++++-
>  hw/ppc/sam460ex.c | 7 ++-----
>  2 files changed, 7 insertions(+), 6 deletions(-)
>=20

Applied to ppc-for-6.0, thanks.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/9QCAACgkQbDjKyiDZ
s5Lugg/+MpY/xigQsoSbON/FBUvvHIlwDgxvcp0xL7Z0lxUH2lhBIGffmFWuQvkO
f9vM8Z9bFzkk/Jw9Jbc5T6bvR5dqmNrNy/ivMpYUBEJ/Tly2sUxS5VEpwRx+uuGf
gqbgI8iQchOFHq3wX8eUJYeq61CO6FQO1dHHP3Y0zuT1Wn8VE4d4oM0mrNsVJ6Z+
HRen2lEvMZLFnKnojgj2rAq6SnGWzXICjjs2+NKC/VVqj7NBlr5qSAWvI6/XKtPN
aRmADZ0K3SJUt/mtD4XRZLrGRLc1qlygC+7B1HyW99/Z/TAATsBeiISN4ADpnLXV
APHl5Avf8HVDOhimo1AbE0ExGaSbyn7oRvRl2emVHjgAn9X2PPLwzEbisdZr1aP+
FsRtbYzcHzpSsCJtZdvxUbbOyZfOYouZt1356YbLlGxDdCbxuTJMwFIqt/+s/v7i
46ci2tRT/2+xIgDVFZd0mxLuUCjAudrjvjOSOXLEtJ3/DDL45oVfz3GNr+gKrx1Q
gKzgznJouPiRyZlR20IV2QeI6kuLtw1trBJ31AzqfTDqtzHd6bgEo1ANUEm2/vxc
sleQAMIKjRoKhTpHm7XaBGL7MEZ8tXZ5lGTjV5Dq4uFsfhjL4G68rY1R/LE5IjEA
Q4TQQEB9fjaLVbgav0sjayLxkWUP0Y4FPoycbMIbe3p7KXenGIE=
=G1/B
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--

