Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFD8412D27
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 04:57:42 +0200 (CEST)
Received: from localhost ([::1]:37868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSVyX-0004Z6-0H
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 22:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSVrF-0007Bs-HX; Mon, 20 Sep 2021 22:50:09 -0400
Received: from ozlabs.org ([203.11.71.1]:47161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSVrA-0007DT-Ih; Mon, 20 Sep 2021 22:50:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632192599;
 bh=avSpN0GcdhZZir+03tH3DbO3+b0MelMEW/UYRJ5b9iQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GmdufEdV3ftR+BJJ7AEy7u2NIf3uYcWHLka/dZCR4XxEnUwSqKRU/OSk/FtXQHLF7
 xJVNliwWS6iEwj3fSG/8p2uy4T2w30MjE+bl/7F8nRxPTG8b9lAmaj0odD5gjioi+X
 XcvYOrhTAB0NP+mZTy003mwLrJypJpxvnMdjfOzQ=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4HD5WC6tCZz9t1C; Tue, 21 Sep 2021 12:49:59 +1000 (AEST)
Date: Tue, 21 Sep 2021 11:37:28 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v9 0/7] pSeries FORM2 affinity support
Message-ID: <YUk3WDs+vXnuWFb/@yekko>
References: <20210920174947.556324-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0cAexWSl5QfWzzxL"
Content-Disposition: inline
In-Reply-To: <20210920174947.556324-1-danielhb413@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0cAexWSl5QfWzzxL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 02:49:40PM -0300, Daniel Henrique Barboza wrote:
> Hi,
>=20
> This version has a changed asked by Greg in patch 4, along with
> Greg's R-bs.
>=20
> Changes from v8:
> - added Greg's reviewed-by in patches 3, 5, 6 and 7
> - patch 4:
>   * changed get_associativity() to return a const pointer
> - v8 link:
> https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg04747.html

Applied to ppc-for-6.2, thanks.

>=20
> Daniel Henrique Barboza (7):
>   spapr_numa.c: split FORM1 code into helpers
>   spapr_numa.c: scrap 'legacy_numa' concept
>   spapr_numa.c: parametrize FORM1 macros
>   spapr_numa.c: rename numa_assoc_array to FORM1_assoc_array
>   spapr: move FORM1 verifications to post CAS
>   spapr_numa.c: FORM2 NUMA affinity support
>   spapr_numa.c: handle auto NUMA node with no distance info
>=20
>  hw/ppc/spapr.c              |  41 +---
>  hw/ppc/spapr_hcall.c        |   7 +
>  hw/ppc/spapr_numa.c         | 380 ++++++++++++++++++++++++++++++------
>  include/hw/ppc/spapr.h      |  35 ++--
>  include/hw/ppc/spapr_numa.h |   1 +
>  include/hw/ppc/spapr_ovec.h |   1 +
>  6 files changed, 354 insertions(+), 111 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0cAexWSl5QfWzzxL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFJN1gACgkQbDjKyiDZ
s5KlYA//Yi7HCtOPrd/AUiU/0eak2jXygoj6Nq1IHkHP9EgWhVjsEw0Cw6DiiZ5R
4xx2Mjyy9Rbjzh8iAqY49UzXEhyo0OWsG+6JHaRg9rYVAGqeoFgbWuqSJFR+mK/P
utLkERTPbcl/7kb3qFZEguC5Trx+i6WP48IjEQCn9MoDSHfaBtERw2AGr2K0AOwW
OOcw6V2i53G8IDHja5zDa9vpjq3TuuRT0OTvv/+NbAzSTyhG70aC202jNgph91Gu
yn0CaddLtf7e1t5SZ+8oU+V7XqrQw5Lq15laPeaYYh5NSWavjt7LpXArEGHuOZgs
xZhdjpOspq4LyGytjn+yKU43LC9loFEedSmXUAzVGrzbWmaY9G6BFjYRPZ51PK/8
ujTFPGDr/B5OjcxzYJSFcU85X6WCDFcmFAHI5M7kdtmTT1vVP9Pe4tYIH59saJJM
atvNmvXboW8qpJQfv7vE8CleKo5+xyYcBSya6u0I2pDGmzOndxPWo8NJoWQsHl16
kuinqJYiy6/wD2iZMjWxB+ZCUsIedL+EIlUGPdsI4+H6zW16Nk2UfmIqAWXuORdu
SiQ+KFUsyO8Vx5Grb95GBMkVY5+ISLHCcADWjFob7ZM7NQ4eKd/+tnWMG/2eLNiw
aBK7KKg7N0EDi2E2HkLhejNKq0OVF0WBtgGYqIMdB1xfIixwsMw=
=h9UT
-----END PGP SIGNATURE-----

--0cAexWSl5QfWzzxL--

