Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B883B27FF
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 08:53:25 +0200 (CEST)
Received: from localhost ([::1]:44738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwJEq-0005hI-0j
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 02:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lwJAK-0002vU-7y; Thu, 24 Jun 2021 02:48:44 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:49153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lwJAH-0000UG-KI; Thu, 24 Jun 2021 02:48:43 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G9W1V28c6z9sRf; Thu, 24 Jun 2021 16:48:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1624517310;
 bh=cV+lDCaYE7isGNr96o+/QRvrnoKJ/k+qoaY6gORyP8Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lYpjbT4nTrwU1pt5jwkza3dimDLoFtZjcqASotuLuHgKxLqXe9GCNbke05lTdYIea
 h+DhnCHuFRq+mnhFSiy6JKKyapncG1CgqNKhlcpnnFHnxr+XVE2ooh+L9n1yToO3zt
 TwFICdt/fauiWh1+BWpJ5ElxnU4o8q5RgTkehfzk=
Date: Thu, 24 Jun 2021 15:47:05 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [RFC PATCH v2 0/7] pSeries base FORM2 NUMA affinity support
Message-ID: <YNQcWSsQj0PFhb08@yekko>
References: <20210616011944.2996399-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="90qkTj+7U0pJkzIw"
Content-Disposition: inline
In-Reply-To: <20210616011944.2996399-1-danielhb413@gmail.com>
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
Cc: aneesh.kumar@linux.ibm.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--90qkTj+7U0pJkzIw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 15, 2021 at 10:19:37PM -0300, Daniel Henrique Barboza wrote:
> Hi,
>=20
> This new version contains changes made after reviews from Aneesh
> and David in v1.

I might hold off on reviewing the qemu patches until the kernel
patches (and the exact design of the dt stuff) are more settled.

>=20
> changes from v1:
> - patches 1 and 2: switched places
> - patch 3: folded into patch 2
> - patch 2:
>     * only make CAS related changes when using the newest
>     machine version
> - patch 3 (former 4):
>     * only advertise FORM2 support for the newest machine version
> - patches 5 and 6 (former 6 and 7):
>     * detect if 'device-node' was set in the command line, and if not,
>     use the 'node' value when writing in the device tree
>=20
> v1 link: https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg03617.h=
tml
>=20
>=20
>=20
> Daniel Henrique Barboza (7):
>   spapr_numa.c: split FORM1 code into helpers
>   spapr: move NUMA data init to post-CAS
>   spapr_numa.c: base FORM2 NUMA affinity support
>   spapr: simplify spapr_numa_associativity_init params
>   nvdimm: add PPC64 'device-node' property
>   spapr_numa, spapr_nvdimm: write secondary NUMA domain for nvdimms
>   spapr: move memory/cpu less check to spapr_numa_FORM1_affinity_init()
>=20
>  hw/mem/nvdimm.c             |  31 +++++
>  hw/ppc/spapr.c              |  60 ++++-----
>  hw/ppc/spapr_hcall.c        |   4 +
>  hw/ppc/spapr_numa.c         | 257 +++++++++++++++++++++++++++++++++---
>  hw/ppc/spapr_nvdimm.c       |   5 +-
>  include/hw/mem/nvdimm.h     |  12 ++
>  include/hw/ppc/spapr.h      |   1 +
>  include/hw/ppc/spapr_numa.h |   6 +-
>  include/hw/ppc/spapr_ovec.h |   1 +
>  9 files changed, 318 insertions(+), 59 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--90qkTj+7U0pJkzIw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDUHFcACgkQbDjKyiDZ
s5LbChAAuTW9lWHCKZUllBEXForV1gpF71dtsufiYwOl0GkxebOWYXRxhzzrCgLS
aPSXkuF7ybwmpcBN7tlDCQUJZh1o0XcCzDF+QNrDI7Wvq4OEJYSQ2+yKyiXn/vLm
/iynJ5IYDSDZJ8RKOzLRCNCZSLmHo5JxjMWR+WWYYxUjUyN3fWlOwzjoh+ijLyQr
Q2rxVuwo+s4QNGBpNyoN4AaKPRKUDefa4iN3vrKdYdf/JZ8U20RfNO65vSZU12kS
FSasqWgwMeHPellvqQ1q/5PU/XCfaVTgt8iXZBzxtNA7QDvCk8kgmTT7uSgf9kud
cBFNml0Y2i+8Hv1+CUd9NWnIiGtXu/qXTqGXNA9sZFKRTNZU5oeuAeOQlRwh8NqF
E8tNNhaqeLqFX4awPOOXLhCB+zC1rFXjjCtlTazO3U4cWLJ188y9BS+S62RNJybV
Lp7/DjXYzQRhM6sNo9XdLOK7KjjZDAMLVPA+H5LN1VQrXwpRC3izYa/3Upyu4vkY
iNq/LyjSRDNoVlQO7hKX77z0qKOsQds5P6WB83zTXnXO+b0TjEqDzEeszN06OTz1
eeT5HavKYtNwctXGJ/1DvGHaJGxKX6KpCLjUvZG/8e9xGgNjX941NK+oPmMlXNLv
dvMycGtERVU5o+78vITqs+rLyKX7AjFvSW/ddTTmduMqfXQfIYQ=
=tIGj
-----END PGP SIGNATURE-----

--90qkTj+7U0pJkzIw--

