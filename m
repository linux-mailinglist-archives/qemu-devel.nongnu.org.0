Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AF94155C2
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 05:07:13 +0200 (CEST)
Received: from localhost ([::1]:39054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTF4p-00017T-Hm
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 23:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mTF1L-00009f-65; Wed, 22 Sep 2021 23:03:35 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:40575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mTF1H-0007lb-B8; Wed, 22 Sep 2021 23:03:34 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HFKjf3L4rz4xbB; Thu, 23 Sep 2021 13:03:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632366198;
 bh=r++ReFqY9No+7+tL1RdOY6ktvbwglhhtXeCrYcfoaiA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mHYP4jjz6kyOMwlEF69+eWBqgd8CLQRTHMuMStkIgceaowlDTd5kMfA19Rq1EdoKm
 MKYd1FSB+R45lECHvMi97pjNHxVY2cSOv6VT9DUzcfRULOX5Ph/D3zaCSrBg53oAk4
 yuflBOZE4FwIqqszHmcclLLvXP0YvlwxfhXuJZ2Y=
Date: Thu, 23 Sep 2021 11:42:35 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 0/1] fixes in spapr_numa_FORM2_write_rtas_tables()
Message-ID: <YUvbi8ztlC309ch4@yekko>
References: <20210922122852.130054-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yoAwDWodRaKwF4f7"
Content-Disposition: inline
In-Reply-To: <20210922122852.130054-1-danielhb413@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: philmd@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--yoAwDWodRaKwF4f7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2021 at 09:28:51AM -0300, Daniel Henrique Barboza wrote:
> Hi,
>=20
> This new version contains suggestions from Greg, Phillipe and Zoltan
> that were made in the v1.

Applied to ppc-for-6.2, thanks.

>=20
> Changes from v1:
> - keep the heap allocation of both arrays;
> - use stl_be_p();
> - use sizeof(uint32_t) instead of hardcoding '4' when skipping the
> length;
> - use the existing NUMA_DISTANCE_MIN macro.
> - v1 link: https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg05464=
=2Ehtml
>=20
>=20
> Daniel Henrique Barboza (1):
>   spapr_numa.c: fixes in spapr_numa_FORM2_write_rtas_tables()
>=20
>  hw/ppc/spapr_numa.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--yoAwDWodRaKwF4f7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFL24kACgkQbDjKyiDZ
s5LFkBAAnOCqkQg1pIrPcnqPiGbnRjzL6mLvqcE1jYEnk48PHgnDsddz4lLSaKMv
O6KsoDvo77t7qQb0PkRVwsEv5ziwlvG4lSlBIaiAPoYRa2MmYkS1AM6vRJYfKJ1S
/ToXxuDU+uUKOGdo8UUA4lk5Zaymgmmsm6UkHC562NDNWBN5YR6nyZxvg2ocDwPX
fgjYMjsHBa15TBNNJF+CtqKSD5Vx8G/Rc+46Al6+nPuKpRHB2z6VeXeU1BvgtRU8
BZOUnlM5hRWVttGEAbv43mWSQViGwLhi6oTPPeH5gVS4ZxH0mCnQRm0wg5mvF+fW
0+9WPe/aWYEpEScX+qHZDjup26wJtVImPx9vsdqGPBzkMh6hh53ggiROhJ9TdYlm
TbNH5KZsldYsHIcS127gJZsQAnh56Y6GTPbqsMdQvjVFqBxwtdhN0JqAE4bRPI3v
uvwGW7Loukmt4qDo1ga9jmQY/z/oQGQbrPN3bGzFcjkYH+usNRjC1JYm6noy1qhz
YVp36K5iCNDySaIxgsL6r2l+TFLPMTiYrLZr/Fz7TplSiJc5gekhlHqQkx0Kw9XG
RWkV7gcdUsf+GVzvOvpldGK9q6dBDLiVahy2+qHtILAQQX5fZf/ZC9S9CORHdNmF
OHxBX05U1hL1hr2+IvfnWTh98WgDdIcB+8LY5cq96+qaHcmMygY=
=m9dX
-----END PGP SIGNATURE-----

--yoAwDWodRaKwF4f7--

