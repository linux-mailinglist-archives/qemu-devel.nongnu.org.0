Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AFB38DFF5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 05:52:33 +0200 (CEST)
Received: from localhost ([::1]:50238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll1do-0006IM-6a
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 23:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll1Yt-0006Gl-Uy; Sun, 23 May 2021 23:47:27 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:58133 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll1Yq-00039R-2u; Sun, 23 May 2021 23:47:27 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FpNSl2s7jz9sW1; Mon, 24 May 2021 13:47:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621828039;
 bh=BIWDEYII/jagm4T/F6RdV3Uzh5q0Sfjoip02zOdvtHo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LuSQrDeH0dLZb7j6HB+hDQWYyXLmq1x46FvUM6Uzu6GOnOQo40GvKFvs4XmyvUivj
 jw0HCXVhtLUKzTtLQDK2kP9gywnnx8yujdknRXfuacOUq+DRmNagXm6iB3mnnbj3JW
 MdHW5RaCBjbBi1A3Au3NzgyEWN5o20f0x2QOQ1Fc=
Date: Mon, 24 May 2021 13:15:34 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH 09/11] include/exec: added functions to the stubs in
 exec-all.h
Message-ID: <YKsaVk/3Ixd64g+y@yekko>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-10-bruno.larsen@eldorado.org.br>
 <c4b7cba3-eb5f-ff65-9376-da9dc8edf45f@linaro.org>
 <f0fbb69b-76e9-c951-f18d-cfc4629f5f2a@eldorado.org.br>
 <YKHpSU6Kbtj+C4o0@yekko>
 <92660b00-e2a4-056b-0a66-e729f502cc19@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="u6N/ysEqDTBveV2d"
Content-Disposition: inline
In-Reply-To: <92660b00-e2a4-056b-0a66-e729f502cc19@eldorado.org.br>
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
Cc: farosas@linux.ibm.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--u6N/ysEqDTBveV2d
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 08:07:24AM -0300, Bruno Piazera Larsen wrote:
>=20
> On 17/05/2021 00:55, David Gibson wrote:
> > On Thu, May 13, 2021 at 11:03:24AM -0300, Lucas Mateus Martins Araujo e=
 Castro wrote:
> > > On 12/05/2021 15:34, Richard Henderson wrote:
> > > > On 5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
> > > > > From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.b=
r>
> > > > >=20
> > > > > Added tlb_set_page and tlb_set_page_with_attrs to the
> > > > > stubbed functions in exec-all.h=A0 as it is needed
> > > > > in some functions when compiling without TCG
> > > > >=20
> > > > > Signed-off-by: Lucas Mateus Castro
> > > > > (alqotel)<lucas.araujo@eldorado.org.br>
> > > > > ---
> > > > >  =A0 include/exec/exec-all.h | 10 ++++++++++
> > > > >  =A0 1 file changed, 10 insertions(+)
> > > > No, the caller is tcg-specific already.
> > > >=20
> > > >=20
> > > > r~
> > > tlb_set_page is called by many ppc_hash64_handle_mmu_fault,
> > > ppc_radix64_handle_mmu_fault and ppc_hash32_handle_mmu_fault, all of =
which
> > > from what I've seen are only used inside #if defined(CONFIG_SOFTMMU).=
 So
> > > what is the best way to deal with these tlb_set_page calls? Should th=
ese
> > > part of the _handle_mmu_fault functions never be reached or should
> > > these
> > The handle_mmu_fault() functions per se shouldn't be included in a
> > !SOFTMMU build.  We might have to extract some of their internal logic
> > for the gdb path, though.
> >=20
> > > functions never be called?
> > >=20
> > > If it's the latter then should we change the #if defined to #if
> > > defined(CONFIG_SOFTMMU) && (CONFIG_TCG)?
> > That definitely doesn't make sense.  In practice CONFIG_SOFTMMU =3D=3D =
CONFIG_TCG.

Ugh.. sorry.. I was confused again.  In practice CONFIG_SOFTMMU =3D=3D
!CONFIG_USER_ONLY.


> We figured it was the case, but from what I can tell, CONFIG_SOFTMMU is s=
et
> when parsing the target list (in the configure script) and CONFIG_TCG is =
set
> later, when parsing which accelerators were requested. So even though
> SOFTMMU should imply TCG, the way it is coded right now doesn't. We could
> also try and change the configure script, but neither of us is really good
> with bash scripts, so this was the next best solution we came up with.
> >=20
> > >=20
> > > P.S: There was a miscommunication between me and Bruno, this should'v=
e been
> > > a RFC.
> > >=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--u6N/ysEqDTBveV2d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCrGlYACgkQbDjKyiDZ
s5KmNBAA4O32B1CDgmE9uNa+SPXnFOWukaOXa+DztDaSIFDpptQm8H2WIeyFYvBi
WMowqnpq06/I8kFBfP1t0VWoIe11SgvJgxsW0q9E3dhU46elFEwVW3uX1V28mw+z
9NyYWEXQRf6lxC3/ihtuE+XHB86aGG0tGVRafCNattcZlSpKzAvl9H+mHLWbF4ST
xJ8tN7qwR2CHTCjzMIohS2Ktn5am48xoH6995zeoQ0uJO2Hxffoc4NA8xjtgtR6u
YjLbWPbkYqNX2aWlXqpeBSz9LsAKEvuCXpgNHDIksa0zXEtMmo9vRWCxX9Cceum4
dNR3CNKf8KhCVY+sSPSvqW6wqez6tbijpGVrQYDDePVV1yzsCM1vE9afFnjY4AKH
1JEy5a63e8dTrtpgLph5Nfym4KjXfPxtx6GqfzWKsVJKNlxll1Cr674QD834M+Yb
qA9crpWlV1A7qBGcKm+V578YvemPKy5q8BGkmN8wIWWz8yOLEisSaEwYiUW+Z9Rt
QAYD8Tk+eA/NnCOFMEWqwWbdJFYuNDsm6tSc+N5bKYZ5rrr7IDrpAv/zbM6UT9hw
23cH5u11ok/uJn60wK9VK2wtl/CDmewvXNo7R9i+/lCVrgGNM5GOmvcnY9yhbnHZ
Fi4g6Ajl8Odu7dUvhfB6ogupFcna7W546Qk0eexatyJj3CWNHY4=
=5tCu
-----END PGP SIGNATURE-----

--u6N/ysEqDTBveV2d--

