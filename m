Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB813BE074
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 03:04:21 +0200 (CEST)
Received: from localhost ([::1]:45852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0vzA-0007kR-AB
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 21:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m0vw5-0006pr-17; Tue, 06 Jul 2021 21:01:09 -0400
Received: from ozlabs.org ([203.11.71.1]:50595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m0vw1-0003cF-5u; Tue, 06 Jul 2021 21:01:08 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GKLhK4WMhz9t0k; Wed,  7 Jul 2021 11:00:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625619649;
 bh=xDy5TB6aA80zy/NveaX7ixTskWJbCWyD3I8Q5IL9lu8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OlPX0ctcJeM1+pusim4qo9wqjreAp6C7YHdGMyjXak4glJnIJaFG3KWy2JikhLCRO
 VPD7FnUG00SqadU2DlP69f1CuCEl06tUNWB3sGd0/dfC+8waB5npjMBQqZhiFxr4jD
 PANbE3/nDrkEkPsYRgNazImixxjitAeE4R6z4+xg=
Date: Wed, 7 Jul 2021 10:45:16 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v5 0/2] Clean up MMU translation
Message-ID: <YOT5HIdzIF+UcukB@yekko>
References: <20210706150316.21005-1-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Nhz0LRmepAGuqCWa"
Content-Disposition: inline
In-Reply-To: <20210706150316.21005-1-bruno.larsen@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Nhz0LRmepAGuqCWa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 06, 2021 at 12:03:14PM -0300, Bruno Larsen (billionai) wrote:
> This is the final change relating to mmu_idx permission checking,
> correcting a technical hiccup on how it was handled beforehand.
> It also introduces a common header to be used by all BookS MMUs to help
> with common code in the future.
>=20
> Based-on: dgibson's ppc-for-6.1 tree

Applied to ppc-for-6.1, thanks.

>=20
> Changes for v5:
>  * introduced a common header to also change hash32
>=20
> Changes for v4:
>  * added r-b and t-b tags
>  * changes commit message of the first patch
>  * removed function parameters that were no longer used
>=20
> Changes for v3:
>  * removed patches that were already applied
>  * fixed comments on last patch
>  * added 2 new patches
>=20
> Changes for v2:
>  * rebase on ppc-for-6.1
>  * added the bugfix
>=20
> Bruno Larsen (billionai) (2):
>   target/ppc: introduce mmu-books.h
>   target/ppc: change ppc_hash32_xlate to use mmu_idx
>=20
>  target/ppc/mmu-book3s-v3.h | 14 +------------
>  target/ppc/mmu-books.h     | 30 ++++++++++++++++++++++++++++
>  target/ppc/mmu-hash32.c    | 40 ++++++++++++++++++--------------------
>  target/ppc/mmu-hash32.h    |  2 +-
>  target/ppc/mmu_helper.c    |  2 +-
>  5 files changed, 52 insertions(+), 36 deletions(-)
>  create mode 100644 target/ppc/mmu-books.h
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Nhz0LRmepAGuqCWa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDk+RoACgkQbDjKyiDZ
s5IGNBAAiqrLxcW1A6YbB7bY+kSryws9AeMroeeMjUN2AR4PxZgRqCoEnQJdv6RL
IpHuAnFQE6BYBijQeBK9oSdKNAF6WQKyIYdTJ0/Nf010KJb16BIS/gBBSPjOMioO
DwSodYNiHxmrRORqEzKBk/95H/rPJNzP5wPZq5RZ4ziceJ35zAmfIaSfzGkSRg5r
ubceoyhiOZEAbQgOpITXd7ReOfdyFBXUgAhhxUmuAGNwcfzGbcvgBhT6qInOooCo
uliN0dTkthBf4orwol4EHkgLu8KtCCWCXcXocuAOvbvcm+HzMLNqCaCXEeLBOVwm
kVWdWa4N0A7M4bHUp15E/4FbJGUifyxYWnmWL3aIy/AoxqtBa3ORpA5UfVRGByDd
9tUm//yhTqT33081mmq3b5PRXZsDiinJCmV110Z2bL5IpPDmWUlkMK0CvcIhIMxu
Q2LFBXkOM5BY0Gf2dPdSB/kON/l/937AhIsu8XbwdwILNVWQ4WoG6VR1xuP07FKx
3S82v9mB5K512Yifd2gEWDw+WlBTz+MKeC9IdjJrfvHqwTJbzVkEbV1kvMGZpslK
CzKllp2LZGau3BIvPcwQWuecVCN05Nla/dVoNts4SwxuJe/WaeXWsZJlqNa6ZHkJ
wHCFUn5QBazvWQhbaP6ekOjlAAiwJ8bQMficnEevyeRc/cFhZmo=
=Apkx
-----END PGP SIGNATURE-----

--Nhz0LRmepAGuqCWa--

