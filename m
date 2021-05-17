Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B871B38234A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 06:12:36 +0200 (CEST)
Received: from localhost ([::1]:45348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liUcN-0007Um-RY
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 00:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1liUaA-0004YY-5C; Mon, 17 May 2021 00:10:18 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:36511 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1liUa6-000281-I5; Mon, 17 May 2021 00:10:17 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fk5JK0wdzz9sWB; Mon, 17 May 2021 14:10:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621224609;
 bh=fq2cQAtnBnQ0fMOyrQ182i+fgEGNk+NBktWe+c47y6c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b7ynD3VLDO2IY/aFAmAGVlRIT5wklfRNjB4ECBJJunQonpH1Figysf0WqKutBaW/w
 qqZDCH4BThMem2n1b9pEzHKNMCjx3ipho+Ay9110MamQwl2Jr9tCesuuN7UO/34iSb
 NdPHrqez1GXPy1KuJQcKm3YUn+vDKk/qVFuWaKAE=
Date: Mon, 17 May 2021 13:55:53 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
Subject: Re: [PATCH 09/11] include/exec: added functions to the stubs in
 exec-all.h
Message-ID: <YKHpSU6Kbtj+C4o0@yekko>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-10-bruno.larsen@eldorado.org.br>
 <c4b7cba3-eb5f-ff65-9376-da9dc8edf45f@linaro.org>
 <f0fbb69b-76e9-c951-f18d-cfc4629f5f2a@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="90iBqlPeZSWRIzru"
Content-Disposition: inline
In-Reply-To: <f0fbb69b-76e9-c951-f18d-cfc4629f5f2a@eldorado.org.br>
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
Cc: farosas@linux.ibm.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--90iBqlPeZSWRIzru
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2021 at 11:03:24AM -0300, Lucas Mateus Martins Araujo e Cas=
tro wrote:
>=20
> On 12/05/2021 15:34, Richard Henderson wrote:
> > On 5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
> > > From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.br>
> > >=20
> > > Added tlb_set_page and tlb_set_page_with_attrs to the
> > > stubbed functions in exec-all.h=A0 as it is needed
> > > in some functions when compiling without TCG
> > >=20
> > > Signed-off-by: Lucas Mateus Castro
> > > (alqotel)<lucas.araujo@eldorado.org.br>
> > > ---
> > > =A0 include/exec/exec-all.h | 10 ++++++++++
> > > =A0 1 file changed, 10 insertions(+)
> >=20
> > No, the caller is tcg-specific already.
> >=20
> >=20
> > r~
>=20
> tlb_set_page is called by many ppc_hash64_handle_mmu_fault,
> ppc_radix64_handle_mmu_fault and ppc_hash32_handle_mmu_fault, all of which
> from what I've seen are only used inside #if defined(CONFIG_SOFTMMU). So
> what is the best way to deal with these tlb_set_page calls? Should these
> part of the _handle_mmu_fault functions never be reached or should
> these

The handle_mmu_fault() functions per se shouldn't be included in a
!SOFTMMU build.  We might have to extract some of their internal logic
for the gdb path, though.

> functions never be called?
>=20
> If it's the latter then should we change the #if defined to #if
> defined(CONFIG_SOFTMMU) && (CONFIG_TCG)?

That definitely doesn't make sense.  In practice CONFIG_SOFTMMU =3D=3D CONF=
IG_TCG.

>=20
>=20
> P.S: There was a miscommunication between me and Bruno, this should've be=
en
> a RFC.
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--90iBqlPeZSWRIzru
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCh6UkACgkQbDjKyiDZ
s5JwpA/+LPlP0GS7Ya+TbHnpJkUJUEKDMdh8go57If2V8kz/OwRG8YNeZU345E5R
txVxiLLGk5uyUpi5MiGrPL4rBymn8d9PIe0ALlZKMg9PSqNvsOr4YpARzmaroM02
FXDZ3l6oWS9grOF3r4aXAEJvUZK1X54d6tpgvLdFvmMlNdH2GXdcqV2f4eSmb4II
BBFZPSOtnnWzDCwKcXrgZv8/MbvBczRnQZsVdos5ySnn1yB+fnVzOnZjz6zWaY/P
irfJ+eb2+9MC9kJTMXM2HfmIhmkcdgtH+QLK86SWkiHsKkw1w57LokWM7Dst57oI
+H4X8KmBpZ21rPkt7dONe6Iped2LYMuzz9UAsWurG58Ti6S4odNHlyz39Hv3ea+r
tB0S+o6WGRFcQLGnHEdVUk3SA0Tru+NSF5VSC9lY1Qb+6MziH22apcttRUvHczvp
Es7238I2+wh2unqMtQKtkcOIm6K14ScCCovJxOgmTNnBCVYGwlnUtMV1jrmPsJBx
ns9MpuydIBIkyZeheH96zQX/BUplNokAK5m99rRqYLBCL8i6Ho8v23ALYWpANK4N
D5PNCRhLnyweg6/sg0jcCJZptvDhZjaYI4QetFewKy/9SK04nI53qxa2uek9saf+
B2fJaLuWAVUmU1oKll+6nsLv6TajTNtJ+twOeSm6b3MyoRE5xx4=
=9kKA
-----END PGP SIGNATURE-----

--90iBqlPeZSWRIzru--

