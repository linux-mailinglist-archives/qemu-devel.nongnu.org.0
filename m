Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C49A3224F8
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 05:45:44 +0100 (CET)
Received: from localhost ([::1]:53836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEPZv-0004Ag-44
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 23:45:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lEPWb-0000HG-5Q; Mon, 22 Feb 2021 23:42:17 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:49921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lEPWY-00058n-Gy; Mon, 22 Feb 2021 23:42:16 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Dl5xX3dQPz9sVV; Tue, 23 Feb 2021 15:42:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614055328;
 bh=tNM6qbrlucmkB6mDeo0gBNZCVtE9BxnAuKHYXbtfc04=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bFv6oZ6+6BJkv82AeWESgJ0NF4n6CFejdLinaTxv3XkreLEcWo4Mev6Q41FNQK1Vh
 RXmQUVQQbYP8S5Aux7WEBzbHWHKtmFmDgTWStQ2Qi46l0FnOiyvxkXQWVKvU21Taiq
 bYpIR5TQXJ7kc+K9K3IkUTmDPd2FL+20Wym+wAMc=
Date: Tue, 23 Feb 2021 15:42:02 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v3 0/6] Pegasos2 emulation
Message-ID: <YDSHmmzHLzMkd+zF@yekko.fritz.box>
References: <cover.1614007326.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NejvI1cd98a9K1fz"
Content-Disposition: inline
In-Reply-To: <cover.1614007326.git.balaton@eik.bme.hu>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--NejvI1cd98a9K1fz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2021 at 04:22:06PM +0100, BALATON Zoltan wrote:
> Hello,
>=20
> This is adding a new PPC board called pegasos2. More info on it can be
> found at:
>=20
> https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2
>=20
> Currently it needs a firmware ROM image that I cannot include due to
> original copyright holder (bPlan) did not release it under a free
> licence but I have plans to write a replacement in the future. With
> the original board firmware it can boot MorphOS now as:
>=20
> qemu-system-ppc -M pegasos2 -cdrom morphos.iso -device ati-vga,romfile=3D=
"" -serial stdio
>=20
> then enter "boot cd boot.img" at the firmware "ok" prompt as described
> in the MorphOS.readme. To boot Linux use same command line with e.g.
> -cdrom debian-8.11.0-powerpc-netinst.iso then enter
> "boot cd install/pegasos"
>=20
> The last patch adds the actual board code after previous patches
> adding VT8231 and MV64361 system controller chip emulation. The
> mv643xx.h header file is taken from Linux and produces a bunch of
> checkpatch warnings due to different formatting rules it follows, I'm
> not sure we want to adopt it and change formatting or keep it as it
> is.

A couple of overall comments:

 * Adding yourself to MAINTAINERS for the new files would be a good
   idea
 * At least some rudimentary tests would be good, though I guess that
   might be tricky with non-free firmware

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--NejvI1cd98a9K1fz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA0h5oACgkQbDjKyiDZ
s5JWIw/8CWW2yLZZ0Z16yuoaKXy3t1qUPa3KzBWYzOyZSm0BayvlNsx4Iax8cyy7
A5J/uRv9MFcqgXl6yXLBAbIux9vZRCEPCILrtCheM8PcSvoTsRl9NGvs9yDvGGvS
06gIbtVF0wPLn8FmCNZPZODKEXrpwfgg/TNtiYQC7Cs2Zlrj3srcf6CPQjp9nJKl
YEuPFVRf++c+gy/QQ9Kf2/mRxihCuOxKkZThpQ4jCtiSYqSUBErNbIcRM/vm1Gd8
GUJCBzpk9MZSJijj93AeZy7AztaIi0f3aCjKHmuoESKu0efTmC7Ar8DDOLh+LXyD
+8mx43isdw5yLjUXTiNFl36VZc3vsu1p7Iqe8t4P0kw2BZl5aVhvZDXAHE8Ivrn7
slSLnmSdeF7nGtRN4XoKEUwgxhQic8HdxxzclkbYcAmXf8CGeyuY6q1Q310vt2KV
lFcdwcrbvJsf3Un4LsnOkswVPsLnkVQh+8DDfoIUN2IJX4B3jHZGGM4G+Gyg4DWK
OxrToY9piApoUWaU/Cv7Iwy3zSUR2Sb8t0atnfJVuQHUM+44EYQWafi8ISGMWSMs
Ag1YH+W8rhEfv/kqK6eFZxA3WQz2fmdtVT49h6EFx843G7m3bR77Prb4sTJu+ZYs
XCqO8Ud198JOoP8P5Y+yDTrQ5GgAkSpZz153zOR/duy5MDj/Fr0=
=dzMk
-----END PGP SIGNATURE-----

--NejvI1cd98a9K1fz--

