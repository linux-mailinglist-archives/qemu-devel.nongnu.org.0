Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC103710FD
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 06:40:15 +0200 (CEST)
Received: from localhost ([::1]:58106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldQNS-0005Vk-U1
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 00:40:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldQJP-0007fv-L3; Mon, 03 May 2021 00:36:03 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50915 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldQJN-0002Gu-CD; Mon, 03 May 2021 00:36:03 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FYVXR1r1Vz9sWB; Mon,  3 May 2021 14:35:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620016551;
 bh=Qo7uPZb0TEmjH9+1sPEY+icucuXzjpwoLlw9y2G9bYI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fkNu03JBFr8yFXZhvN6nUuPoTx4jYwqH2jXTeUFB3/Mw0qrilISlb18p1q7EXBuzt
 iAdet+FrN/eHABMOv6UDgnysGYWmRuFPaVjqQLNpjSkVW2uIv502PjN7e2DfGKiPuu
 jfdOptzm9HJ6zCCktE2osD9mLT8mfkPfdA96T+eQ=
Date: Mon, 3 May 2021 14:35:37 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [RFC PATCH v2 2/2] hw/ppc: Moved TCG code to spapr_hcall_tcg
Message-ID: <YI99ma3RbAOPlvt7@yekko>
References: <20210430184047.81653-1-lucas.araujo@eldorado.org.br>
 <20210430184047.81653-3-lucas.araujo@eldorado.org.br>
 <87wnsj1gyq.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="r2p7nVQOHB56GBQi"
Content-Disposition: inline
In-Reply-To: <87wnsj1gyq.fsf@linux.ibm.com>
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
Cc: bruno.larsen@eldorado.org.br,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--r2p7nVQOHB56GBQi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 08:38:05PM -0300, Fabiano Rosas wrote:
> "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br> writes:
>=20
> > Also spapr_hcall_tcg.c only has 2 duplicated functions (valid_ptex and
> > is_ram_address), what is the advised way to deal with these
> > duplications?
>=20
> valid_ptex is only needed by the TCG hcalls isn't it?
>=20
> is_ram_address could in theory stay where it is but be exposed via
> hw/ppc/spapr.h since spapr_hcall.c will always be present.
>=20
> > Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org=
=2Ebr>
> > ---
> >  hw/ppc/meson.build       |   3 +
> >  hw/ppc/spapr_hcall.c     | 300 ++--------------------------------
> >  hw/ppc/spapr_hcall_tcg.c | 343 +++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 363 insertions(+), 283 deletions(-)
> >  create mode 100644 hw/ppc/spapr_hcall_tcg.c
>=20
> <snip>
>=20
> > @@ -2021,14 +1752,17 @@ target_ulong spapr_hypercall(PowerPCCPU *cpu, t=
arget_ulong opcode,
> > =20
> >  static void hypercall_register_types(void)
> >  {
> > +
> > +#ifndef CONFIG_TCG
> >      /* hcall-pft */
> > -    spapr_register_hypercall(H_ENTER, h_enter);
> > -    spapr_register_hypercall(H_REMOVE, h_remove);
> > -    spapr_register_hypercall(H_PROTECT, h_protect);
> > -    spapr_register_hypercall(H_READ, h_read);
> > +    spapr_register_hypercall(H_ENTER, h_tcg_only);
> > +    spapr_register_hypercall(H_REMOVE, h_tcg_only);
> > +    spapr_register_hypercall(H_PROTECT, h_tcg_only);
> > +    spapr_register_hypercall(H_READ, h_tcg_only);
> > =20
> >      /* hcall-bulk */
> > -    spapr_register_hypercall(H_BULK_REMOVE, h_bulk_remove);
> > +    spapr_register_hypercall(H_BULK_REMOVE, h_tcg_only);
> > +#endif /* !CONFIG_TCG */
>=20
> My suggestion for this was:
>=20
> #ifndef CONFIG_TCG
> static target_ulong h_tcg_only(PowerPCCPU *cpu, SpaprMachineState *spapr,
>                                target_ulong opcode, target_ulong *args)
> {
>     g_assert_not_reached();
> }
>=20
> static void hypercall_register_tcg(void)
> {
>     spapr_register_hypercall(H_ENTER, h_tcg_only);
>     spapr_register_hypercall(H_REMOVE, h_tcg_only);
>     spapr_register_hypercall(H_PROTECT, h_tcg_only);
>     spapr_register_hypercall(H_READ, h_tcg_only);
>     (...)
> }
> #endif
>=20
> static void hypercall_register_types(void)
> {
>     hypercall_register_tcg();
>=20
>     <register KVM hcalls>
> }
> type_init(hypercall_register_types);

Eh, swings and roundabouts.  Either of these approaches is fine.

> > +static void hypercall_register_types(void)
> > +{
> > +    /* hcall-pft */
> > +    spapr_register_hypercall(H_ENTER, h_enter);
> > +    spapr_register_hypercall(H_REMOVE, h_remove);
> > +    spapr_register_hypercall(H_PROTECT, h_protect);
> > +    spapr_register_hypercall(H_READ, h_read);
> > +
> > +    /* hcall-bulk */
> > +    spapr_register_hypercall(H_BULK_REMOVE, h_bulk_remove);
> > +}
> > +
> > +type_init(hypercall_register_types)
>=20
> And here:
>=20
> void hypercall_register_tcg(void)
> {
>     /* hcall-pft */
>     spapr_register_hypercall(H_ENTER, h_enter);
>     spapr_register_hypercall(H_REMOVE, h_remove);
>     spapr_register_hypercall(H_PROTECT, h_protect);
>     spapr_register_hypercall(H_READ, h_read);
>     (...)
> }
>=20
> Because the TCG and KVM builds are not mutually exlusive, so you would
> end up calling type_init twice (which I don't know much about but I
> assume is not allowed).
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--r2p7nVQOHB56GBQi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCPfZkACgkQbDjKyiDZ
s5IHWxAAopDyIUp1iECLl2uI3nGC+dGCk1eGU/lTzYGpn8M1FRxFSviAKKk7/+Cr
0k5t6HO+5/ZjdxEnrZVyLjRy7pVMTInzhiPMoV/r8Qqs11tgLRrousxU1S4WB9jZ
0r09kZckWCzYSdXRQgyB6rV5cgRONvNnzXtURwaG942rmAyDKKFd+HFI+tJXC8C4
HUMFH8TxncuGgE4hDXfecNiy+OBU8UE9k3B+RmYz27sBCvsJsbGq+A9i+fyxHjFY
FZx8x98/dAGub7Vy1CaDWC1AdTWx+LKfBcTZ7223HFU9mtlJmhVXGo5/Sl2pEfDV
1hMNz/CGfEVxxVkWhP9pP+U+FB35liNVDwuHQ5JLSJaAMMXEJcMdrNWU7y3OCvdW
V+VrAuGYs7l7aKToV3MlzqcwBNkhlbrEZ2ZR0GK8y3DPqvBj8dEJL7z0GCHQSZWD
R1Bm65f0+ySrSfITr6lhODJ3WUz6APnU4DcC5oHSgcE9NlwBiU5Yrp9b/hTgH2Nz
zgsjTV+kdhiQp8tSDzPjQtpyefgKwJwh/VGOTEdklZi5BE9SIoayMT/iTvYSMxAY
hHshOGT2yKkD6BVSdMel6zXRQjahxoAcf8T6Jj1VxJmGT2mFxIUWTEyN0ZJ3z3cI
BA80VrJ2ZrTzvzz9+60j8ChD6gBSyWWyJOKMGsbosq6KcMyJxuc=
=oMuY
-----END PGP SIGNATURE-----

--r2p7nVQOHB56GBQi--

