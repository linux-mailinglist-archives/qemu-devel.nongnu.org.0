Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7338138855B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 05:36:20 +0200 (CEST)
Received: from localhost ([::1]:50096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljD0N-0000lZ-Hi
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 23:36:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljCuQ-00071L-Hw; Tue, 18 May 2021 23:30:10 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:52313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljCuM-0006oI-GM; Tue, 18 May 2021 23:30:08 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlJK20kcMz9sXN; Wed, 19 May 2021 13:29:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621394998;
 bh=bDTCgSYJZ2wXicEoPDgQK+RnP1ank3VXrLrbE9lHXTE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AyPsA+ozSuFLiQBMjP0B1e+9AADiUFQ6U8Peg7ydyTA9b8upNVFRVQOeXIA6W2Ned
 KCRrVf3zuX+cO8jaUBXW7KoR2k61ZQ4NYrOBfn66ziiBQv2r2VEH+fpmZtD8AMdFVS
 uUuY75/RHO7olk2NzimKHcGMkfDVAXBhYxmP7Alg=
Date: Wed, 19 May 2021 12:52:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 00/24] target/ppc: Clean up mmu translation
Message-ID: <YKR9bZmPxOHKlnnP@yekko>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kKR15HyZO/NG1kkN"
Content-Disposition: inline
In-Reply-To: <20210518201146.794854-1-richard.henderson@linaro.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--kKR15HyZO/NG1kkN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 18, 2021 at 03:11:22PM -0500, Richard Henderson wrote:
> This attempts the cleanup I've been talking about with Bruno.
>=20
> On the way, there's a lot of MMUAccessType cleanup, to get the
> code into the form I wanted the interface to share.  There's a
> lot more cleanup that could be done, particularly wrt the older
> mmu models.

I've applied 1..15, still looking at the rest.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kKR15HyZO/NG1kkN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCkfWoACgkQbDjKyiDZ
s5JzkQ/6A/Tij6UTYV6C2HpO6XATMXvQXJJTwunkHF8LMq/jeVUMSi9suuqXc1tM
zplDjXtwPWLgtXvwpx90RXXOztOH37byUEbMmlBD2QRUY4hRCWD4PfyEsuranUtf
znyqkWeuDyqzIRAydbk5IIIMDIChozn7BLtuXi+pPorEmyabN/Qbim5ZBqNEUFSZ
D168RDOHntBLvKySmxUiV6w1D4vLoWvtBd6oJ9hkaTJIdUtoJEuTI1QORgnyA4JV
6gEnnngORD3oDS56WkObCl7Xh65rYD4pE6yQ+IRFvkOWETiYZ+8gpdZxaaCVGXDe
xuorLPYlQTKcp/3gVUyxTuxTls8tGICL0dVXEneZaS+GaXCKuLbRWwsKXGLfwvTY
IKokkzt6gZhpaOnUaQjIsiF+1ssNB0FOvVRu/hOc1lM4jKxMFnx8wsN0EutjRUy7
2gbcQ+aNOm021m02RMIdlY25yZeKS+aIxspRfkCVvZqH3GSMJaEZSm+YLis/i4Na
XnzN+7Xfqr9FfEej3TPEufhmKlPsNAsbyHNSq8+KDIhRgc5CjPtudPFvC/a8Aa7i
jeg2s4dupoo3OufqjgrD/ZpO9PUqGqhSHWdiZ5R9mQwE+KTvv8lhYe8/nhtMn/2y
Dc/eKKFeqyKquDYY4pA+I58Ek+aVMeuWMM6T+WCN/G3AJ8KT9s8=
=3QZQ
-----END PGP SIGNATURE-----

--kKR15HyZO/NG1kkN--

