Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBC339248E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 03:50:15 +0200 (CEST)
Received: from localhost ([::1]:50426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm5A5-0008JN-PP
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 21:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lm58O-0005wq-Oe; Wed, 26 May 2021 21:48:28 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:55637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lm58M-0001k2-0t; Wed, 26 May 2021 21:48:28 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fr9gy6Dt7z9sT6; Thu, 27 May 2021 11:48:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622080094;
 bh=URSikFUniS+4IktANsd3vFKytBpQCQ/Eo8qdKjaN8xY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bHpiRBjU+0+cAfMMYxARyldUnUAzWiwX8shdGlriFiSiz9DnShwfL3NxRMaXNfiqg
 2C1MkwYyD6wJve0Lr5JvgKj3uoa2g3FqfklM3gXsRQawxB0DjsRP7pQlFRUumg+qGj
 kDQrdaNCZNKFIVLXl4ikIyayY/4SCHxUefmAPRSQ=
Date: Thu, 27 May 2021 11:11:35 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Subject: Re: [PATCH v5 23/23] target/ppc: Move cmp/cmpi/cmpl/cmpli to
 decodetree
Message-ID: <YK7xx2p5pk2NVBHq@yekko>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-24-matheus.ferst@eldorado.org.br>
 <ef3bb078-8afe-2159-f23d-0d8324c4e3f7@linaro.org>
 <bf00a04b-33b6-e067-ead9-e8707f186c02@eldorado.org.br>
 <720be115-3aad-f4bd-e636-5dab76478806@linaro.org>
 <fc7fde45-a8ae-7249-7cac-b9f7fbfbee0f@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Pyj8jq7p7lg48M0v"
Content-Disposition: inline
In-Reply-To: <fc7fde45-a8ae-7249-7cac-b9f7fbfbee0f@eldorado.org.br>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Pyj8jq7p7lg48M0v
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2021 at 12:17:48PM -0300, Matheus K. Ferst wrote:
> On 24/05/2021 15:51, Richard Henderson wrote:
> > On 5/21/21 10:25 AM, Matheus K. Ferst wrote:
> > > On 18/05/2021 07:12, Richard Henderson wrote:
> > > > On 5/17/21 3:50 PM, matheus.ferst@eldorado.org.br wrote:
> > > > > +=C2=A0=C2=A0=C2=A0 if(a->l && (ctx->insns_flags & PPC_64B)) {
> > > >=20
> > > > Space after IF.
> > > > > If I look back to the 6xx manual, I see
> > > >=20
> > > > =C2=A0=C2=A0 NOTE: If L =3D 1, the instruction form is invalid.
> > > >=20
> > > > The fact that we're allowing L=3D1 for ppc32 is an existing bug,
> > > > afaics. We should fix that.
> > > >=20
> > > >=20
> > > > r~
> > >=20
> > > The previous commit on this line in translate.c says that "on most
> > > 32bit CPUs we should always treat the compare as 32bit compare, as
> > > the CPU will ignore the L bit", so maybe it was intentional. Should
> > > we change it anyway?
> >=20
> > The actual change of 36f48d9c78c is about NARROW_MODE, which is about
> > the MSR.SF bit, and is correct.
> >=20
> > The commit message mentions the e500mc specifically does check the L
> > bit, and then hand-waves about the others not checking.=C2=A0 But the t=
ext I
> > found in the 6xx manual says that one checks too.
> >=20
> > I wonder if the IBM folk can shed any further light on this?
> >=20
> >=20
> > r~
>=20
> I was pointed to the 601 manual, which says:
>=20
> "While the PowerPC architecture specifies that the value in the L field
> determines whether the operands are treated as 32- or 64-bit values, the =
601
> ignores the value in the L field and treats the operands as 32-bit values=
=2E"
>=20
> There is also a section in Appendix B called "Reserved Bits in
> Instructions", which says:
>=20
> "These are shown with '/'s in the instruction opcode definitions. In the
> POWER architecture such bits are ignored by the processor. In PowerPC
> architecture they must be 0 or the instruction form is invalid. In several
> cases the PowerPC architecture assumes that such bits in POWER instructio=
ns
> are indeed 0. The cases include the following:
> - cmpi, cmp, cmpli, and cmpl assume that bit 10 in the POWER instructions=
 is
> 0.
> - mtspr and mfspr assume that bits 16=E2=80=9320 in the POWER instruction=
s are 0."
>=20
> Searching the manuals for other processors, I identified that the manuals
> for 405, 440, e500, and e500mc explicit says that the L bit should always=
 be
> 0, and manuals for 603e, 604, 604e, 740/745/750/755, 750CX, 750CL, 750FX,
> 7400/7410, 7447/7447A/7448/7450/7455, e300, and e600 list the bit L in
> operand syntax but do not mention any restrictions on its value.
>=20
> Alfredo Dal Ava Junior (adalva) did some tests for us on his G4 MacBook,
> confirming that the bit is ignored in PowerPC 7447A v1.2, one of which the
> manual does not specify the behavior, but I don't know if can assume the
> same for other processors.
>=20
> If we do bother to emulate the specific behavior for each CPU, what would=
 be
> the default for those whose manual is not explicit and we cannot test? Al=
so,
> I not sure how to check for it, do we need a new POWERPC_FLAG in pcc->fla=
gs?

My inclination would be to make L=3D1 program check on all 32-bit cpus
for now, and if someone pipes up with a guest broken because it
assumes L=3D1 is ignored, we can fix it then.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Pyj8jq7p7lg48M0v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCu8ccACgkQbDjKyiDZ
s5KgPxAAx44GwBvVmx5ZNEluv+a8jXw+r4QYc930ZBR8b/4K6pQWYszXRsjCd9GH
1GS5h/yzk05xgWLAhQZavNLAWpIzR/IqhZj4Luczjy3F5Wjt24p4a3ENTzLh0N/P
U/JB7HI72sWcABNOO+QWs986vjtoqAVss+XZmZoTobpowI0CPX+rt80JX+Qhaq8u
Kq6aRmY0cUWtfIXxav2HU9eDahHy8gOpiFZmA8X9JlujZ2d+DIxyDuMHHganVKdg
dTF9e+swG/NnPNjJ98CV7ncjbADUgAHXg+S0TDqU3awY7W3Gc9GYiP7dHrRLSWvu
Tlv1d7M/HjFv1k///F0VOMVJcWkMKpkP5PHPF5s42Gdp8pTJ3u+hqiKnTBe++3Zq
q2i/uTNJsXGw5bThoyXXdEXnaVUnpGF+i2arwrkN7zBZlU32UpU3d2VT/vyWql2u
56fWBpJvgVojlBmURCyEVONp3pFOWVlTjk8TKmuTJ7q4jkxq+hEqGcGRdPf9CI1m
7cXwKR3Ji9I5ybuv1FZAP84vSRlIGMSnE/tLCAketuFAY5y+7iMgUFe7mIPkl8jR
TpkHPbpDRvF2qfApw8rCM2PMFcptPrvlqwLGDb7XAaetrx+V4fe69rQwqOUGWvVU
TjpglPNLUUuqxuQrhRTzS6n4XEJx+C1Ot43DaMnseHChamD1y0w=
=kz2t
-----END PGP SIGNATURE-----

--Pyj8jq7p7lg48M0v--

