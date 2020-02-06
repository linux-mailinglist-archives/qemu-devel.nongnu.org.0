Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA09F153DB1
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 04:48:39 +0100 (CET)
Received: from localhost ([::1]:60200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izY9e-0002hp-Bc
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 22:48:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36392)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1izY8q-0001uH-5s
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 22:47:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1izY8o-00076P-MS
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 22:47:47 -0500
Received: from ozlabs.org ([203.11.71.1]:37391)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1izY8n-0006ZG-Rh; Wed, 05 Feb 2020 22:47:46 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48CksN0LJHz9sRG; Thu,  6 Feb 2020 14:47:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1580960856;
 bh=Ga0M2cIVzY5IsNZzjobJ3QA/R2sZ0RL9C9laxcmBVpA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jeCFnM2999TH5rjRThl7UT80uZrqa+zPe5nrOs44WT1+ub8rJ/ZGn7tZXs3ief3ZQ
 jD16ussTN9hVUdEbuOGBRvOXr8NA4RGkHmvAhBU8vaTd2Kj4dcZq7kQmFBZNhaxvf8
 PALquFCfKkuvvVoQ9C0FLRHndZ7XCSYwxu4J+L9c=
Date: Thu, 6 Feb 2020 14:45:58 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2 0/2] ppc/pnv: fix build dependencies
Message-ID: <20200206034558.GK60221@umbus.fritz.box>
References: <20200205232016.588202-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DozTQjXnjm3C9Xhk"
Content-Disposition: inline
In-Reply-To: <20200205232016.588202-1-lvivier@redhat.com>
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
Cc: Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--DozTQjXnjm3C9Xhk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 06, 2020 at 12:20:14AM +0100, Laurent Vivier wrote:
> Building only POWERNV machine without PSERIES machine
> fails because of a couple of reasons:
>=20
> - qtest uses rtas function only provided by PSERIES,
> - the dependency to PCI Express has been added to XIVE_SPAPR
>   rather than to POWERNV

Applied to ppc-for-5.0, thanks.

>=20
> v2: remove PCI already selected by PCI_EXPRESS
>     remove PCIE_PORT, set by default to yes with PCI_DEVICES
>=20
> Laurent Vivier (2):
>   qtest: Fix rtas dependencies
>   ppc/pnv: Fix PCI_EXPRESS dependency
>=20
>  hw/ppc/Kconfig | 4 ++--
>  qtest.c        | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DozTQjXnjm3C9Xhk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl47i/YACgkQbDjKyiDZ
s5LDbg//ZwI+2hw0aj/KhgG3Sb8JlRxZhe5dq3RguvuckSq+ile3liob34IugQR7
o3jYVHQPDFyaI9A1u8irpsnEawQ3Roy0VE/FPvz0LEM606SgXjuMMRDMfciRjHz4
UIQ6i8zw205irTqJ2mddlp6OYvuBIhosWmrITuxtWUqA1OPpdq1cqrhWLS3Nw7sy
iDbNoPT6RY/Nbjvc+zGTKwwJQKwW6gm7/LP6QdQkUaNz+PthatVg7BMHGfWtSAK0
LAkaUqpiYQa3wnHTqdLtu3unrJ9ELUpcTewcWWzAPjpA+mkLZo0gd+JWM2vjlxi6
QuYQIDcNbVf5zzWgaEA2+lOuk2eg3vQiv3cKKGnRMOohz4RZtxpiQJHogcO/izhT
Q4Kl8Dy+ff6VPX6qGPSKUOXUAPU52OX0Hbz/toJd3HGiOh3B4c8gxdPQp5ESf4Dd
wP1vOfqaIQwEyfuv1NlQjUAv9/Pxb6imWFaGEmxhW6svU+q38nNHNIK7iBVK8TTh
ZAd8jwMNnQ9icus/0yEjizm6DZK1aqlKoQPWuMucR6YNB9aBv1yuFqnJTgvbxKKR
gyr+ioNha2H0SZ1SVrwG0wUqFLMcOlyRcYpxqr+Jr5NmxXmoO2WjItklzX5oc0F1
RFxUPWpaHArl9zNpYSXGDSJFMO3Tw5BRIVImGqpu1LpyEkal4g0=
=jitm
-----END PGP SIGNATURE-----

--DozTQjXnjm3C9Xhk--

