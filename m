Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C02242B2C00
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Nov 2020 08:41:28 +0100 (CET)
Received: from localhost ([::1]:53560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdqBb-0007nf-Rc
	for lists+qemu-devel@lfdr.de; Sat, 14 Nov 2020 02:41:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kdq8b-0004uH-1n; Sat, 14 Nov 2020 02:38:21 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:33817 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kdq8Z-0005Ad-56; Sat, 14 Nov 2020 02:38:20 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CY6cz1xwqz9sTv; Sat, 14 Nov 2020 18:37:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1605339475;
 bh=zZzdFquSOkXU8Idfmi2IOczKqTqkmJRr84AAXaSmEMM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QZA+sDNTDtRJY2jpSqMxDD9tq7rbeq+cfl56ivHTHD0GTSGHTRZ8FLYdsUk5w2RgD
 TYFWqYFnog6olJuy36YDTglHk/dMwZg7JTfx/8TI+hWESTYNu3H2O/bBe5JQUZRCdy
 h8y4rFxxyPGjHpJmorDiSMLIRgvLRVv3zWZhLjCI=
Date: Wed, 11 Nov 2020 17:22:32 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: LemonBoy <thatlemon@gmail.com>
Subject: Re: [PATCH 1/2] ppc/translate: Implement lxvwsx opcode
Message-ID: <20201111062232.GC396466@yekko.fritz.box>
References: <d7d533e18c2bc10d924ee3e09907ff2b41fddb3a.1604912739.git.thatlemon@gmail.com>
 <a1c67758-7b2c-725c-67b6-e0c52a971d67@linaro.org>
 <9096a38b-0b6f-3531-b88b-e1be1d946831@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ABTtc+pdwF7KHXCz"
Content-Disposition: inline
In-Reply-To: <9096a38b-0b6f-3531-b88b-e1be1d946831@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ABTtc+pdwF7KHXCz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2020 at 10:14:23AM +0100, LemonBoy wrote:
> Is there any chance for this patch series to be merged for 5.2?

No.  We are now in hard freeze, and this is not a bugfix.

>=20
> On 09/11/20 18:39, Richard Henderson wrote:
> > On 11/9/20 1:17 AM, LemonBoy wrote:
> >> Implement the "Load VSX Vector Word & Splat Indexed" opcode, introduced
> >> in Power ISA v3.0.
> >>
> >> Buglink: https://bugs.launchpad.net/qemu/+bug/1793608
> >> Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
> >> ---
> >>  target/ppc/translate/vsx-impl.c.inc | 30 +++++++++++++++++++++++++++++
> >>  target/ppc/translate/vsx-ops.c.inc  |  1 +
> >>  2 files changed, 31 insertions(+)
> >=20
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >=20
> > r~
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ABTtc+pdwF7KHXCz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+rgygACgkQbDjKyiDZ
s5IiIBAApkz5OZmNMsLCEATw5c2PI5fLRbmk5HpDBTwHdWzK58N8TrnIzTXHhvMF
QcGFiZtenF4PV/mLHW9xep5ZYbwhshD+s7I1IZCqoiRq1Qx3Ar8axGmPSqgGru8X
Ov/jynSyyc2Zk8EBa6+Pc0DV7YICxZz+WsGyHgQWtHPsJwBxhVvp5+HtUIgdQ8gR
Dphl3OUk7GGnNb5NFhITm78boSxU1H1hvqGL1npXpwUMc/LyOzwtrsIoZ4L0K5ZT
cHZhNpnzP7wNCzInqdIB/rtj1HB/J/zAUxmqcADlYYGWG/4mjm/GgbEd61I9vpoa
+4F1KFNeO955/SBechPBVOzpbHeBA7cDBTBPFQMtd0K7Yd8S44FfIYEYkNnQSdO0
okxREXXNFhyVmbsvcaVvUDwV1az1YmNV0JaXTC6EwHt2XGYo1XZtOKo/Xc8yJTqQ
tc51775dVOC3FcBRnJ4YmwbN2F/BUv3V2BohKnZ1mkisq/+LVyB5xa4YUf1/W6x5
LnXn00WkR9PODiTp4sFJUfuWlMy+M6B1cVDgGshT3I7Xke/YjZqcfjGM8EW7M5Cf
oohFtTMfvH+fyMuFJQDlgK/vRxKrWGQMsQClChjNDEWvfq9CeOPGkMxqrin3yOkB
JNXg7lKVuICP4IXNhoOdKJwoiyxzHYj0XRDJszbrr5HkEcm/qP8=
=YYOB
-----END PGP SIGNATURE-----

--ABTtc+pdwF7KHXCz--

