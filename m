Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA6C2BFFE3
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 07:20:46 +0100 (CET)
Received: from localhost ([::1]:45988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh5DR-0004H7-Fd
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 01:20:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh52J-0001Ke-VR; Mon, 23 Nov 2020 01:09:17 -0500
Received: from ozlabs.org ([203.11.71.1]:57167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh52H-0006eW-Ou; Mon, 23 Nov 2020 01:09:15 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CfcDH4Gg5z9sVd; Mon, 23 Nov 2020 17:09:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606111743;
 bh=El+jrCM/alQAOQN1K9E6Q8D88TURECZmoKUDbzZWGOE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mq2tw6geKYvVp4tsOgAqVsNAClOksKo51/ghv6n6F5U3JYqlq+mVC0BbVkHrFnhoS
 NyeU9VvBP9NmnPvk+d5kLwonWp9SYryfoZbkbe1kw4+1j31TyGZCoHhDqkQx+8YzNH
 E9Fc9Kh3AS5DENapMqStWxLtagCbgLE0xPEDQoDk=
Date: Mon, 23 Nov 2020 17:08:54 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: LemonBoy <thatlemon@gmail.com>
Subject: Re: [PATCH v3 0/4] ppc/translate: Fix unordered f64/f128 comparisons
Message-ID: <20201123060854.GU521467@yekko.fritz.box>
References: <20201112230130.65262-1-thatlemon@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5Dr6Wqe9hdyl7LAI"
Content-Disposition: inline
In-Reply-To: <20201112230130.65262-1-thatlemon@gmail.com>
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--5Dr6Wqe9hdyl7LAI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2020 at 12:01:26AM +0100, LemonBoy wrote:
> Fix a couple of problems found in the emulation of f64/f128 comparisons p=
lus
> some minimal self-contained commits to clean-up some code.

Applied to ppc-for-6.0.

As bug fixes, these could theoretically go into qemu-5.2.  However,
since they're not regressions, I'm more comfortable delaying these to
6.0 given how late we are in the qemu-5.2 cycle.

>=20
> Giuseppe Musacchio (4):
>   ppc/translate: Fix unordered f64/f128 comparisons
>   ppc/translate: Turn the helper macros into functions
>   ppc/translate: Delay NaN checking after comparison
>   ppc/translate: Raise exceptions after setting the cc
>=20
>  target/ppc/fpu_helper.c | 212 +++++++++++++++++++++++-----------------
>  1 file changed, 121 insertions(+), 91 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5Dr6Wqe9hdyl7LAI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+7UfQACgkQbDjKyiDZ
s5I4Vw//fmQYFqyvJlUjVguxzpb4KvPvCbTHKU7ycyhnEnRs7KyI4vrcZaHggteR
jowZTdh5jj4JMFH2Pf+4cfyGcA1n+W36QmmVng/AwTP8rIJzvXgFXCRYgfC4+h47
+ZD3XKXV0fUzy3uGjqruifFd+WU87PUpNkRerznpRRQ6UEiCR7y4WJ/hELqJr3gk
9wGVEJczcA4eeeut7vGDn5bwJHvVP5XX/JiKCjpqNOl+s+UT7KPHNFWgOsvRhJrN
nN3IGmyhL1a7ULm0uWxKbi4M3wCZHwHMhnUqAcv/6EGrPPAIHAe8ifFZaw2aFHco
kK4PlYk1tvYfyjAw9OQl68uJ2xtCpb9mP+y10tqBdcN3R9mqTNVKl9ZWPdkXni54
ttqe3cuwEYKuonO2fMKd8zzWILcMR7YgQRlfujkz33xww4RmK1NKeL8lLhiOtgtB
MSxE2K5iJ0PEOEHGwWAb3eiZK5yiW/VHcwE6VWFw7DSsd9uAwLzsU0vxA9pQlHZg
50aV6whAwOUyTbVEBgYNr1GC/MlurS4KIPDiR1kGjD4nBZElFh6jji3B44F60cDh
a5hMjC/duajkkhWB+b/Pa19tJ6qYIp1Po6rtsjv9E5nkCC8WwWnLAeF1vmFUYgJH
eBwHk1T7LUn1vDcJZ7JsJs+H48kWj6w9cBakNbjoJbV7U/N8+9w=
=8KTi
-----END PGP SIGNATURE-----

--5Dr6Wqe9hdyl7LAI--

