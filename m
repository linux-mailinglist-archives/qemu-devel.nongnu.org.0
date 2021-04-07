Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF42D35628F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 06:36:28 +0200 (CEST)
Received: from localhost ([::1]:51722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTzvX-0007Eg-I8
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 00:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lTzuc-0006i5-Uh; Wed, 07 Apr 2021 00:35:30 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:52001 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lTzuX-0002vx-7Z; Wed, 07 Apr 2021 00:35:29 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FFWlm73m0z9sVm; Wed,  7 Apr 2021 14:35:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617770116;
 bh=F6rLxniZ8OJXyCof9diochToeQb0Fmj3+R+JinfTcKE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ah1xskRqx1bgX7JEkiK9qLG6CJPmn5VXqiqC0qrRaDSl2KeY+a5b8fi9LjiPEt/za
 F/8GwKj1UCmzRVyStKd9vmjY+dWo4cngxaS08xtCi+AAFKhnkyvluyyIHOc4TovdEI
 ggJ/dCSGoiJ8ae/Dq+BvMACHdaesiJCDIhXB8Tdo=
Date: Wed, 7 Apr 2021 13:01:52 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Subject: Re: Discussion: Patch series that adds disable-tcg option for ppc
 targets
Message-ID: <YG0goNCJnyeZKfZy@yekko.fritz.box>
References: <CP2PR80MB4499C5000C0178C1594A5424C7769@CP2PR80MB4499.lamprd80.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="l14a4F6iqss2cAjL"
Content-Disposition: inline
In-Reply-To: <CP2PR80MB4499C5000C0178C1594A5424C7769@CP2PR80MB4499.lamprd80.prod.outlook.com>
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Andre Fernando da Silva <andre.silva@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--l14a4F6iqss2cAjL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 06, 2021 at 06:38:21PM +0000, Bruno Piazera Larsen wrote:
> > t's usually best to focus on logical changes, rather than
> > file-by-file.  That said, I'd probably suggest changing the .c files
> > first, then changing the meson file.
>=20
> OK, will do!
>=20
> > I'd lean towards building a whole series, since I think the individual
> > file changes won't make a lot of sense on their own.  That said, it's
> > ok and encouraged to post a relatively early draft of the series as an
> > RFC, so that the overall idea can be reviewed, even if it has obvious
> > omissions (just mention them in the cover letter).
>=20
> Good to know. I'm guessing that the RFC should at least compile,
> though, right? That's mostly what is holding me from sharing what we
> have so far.

Yes, compiling would definitely be preferable.  If you're able to
reduce scope of your initial draft to accomplish that, then I'd
recommend it, so that you can get something out for initial review
sooner.

>=20
> > I'd expect  mmu-*.c to be excluded.  Those are softmmu implementations
> > which shouldn't be used with KVM.  It's possible there are a few
> > helpers that will need to be extracted, though.
>=20
> weirdly enough, removing the mmu-* don't give compilation errors,
> but linker errors.

That's not surprising - the prototypes will be in a header somewhere,
so the compiler will be happy.  It's only at link time it will
discover it doesn't have the helpers that come from those files.

> There are a few helpers that we'll have to see
> how to deal with, but something that I found odd is that cpu_list
> and all it's related functions are defined in translate_init.c.inc,
> instead of cpu.c like most other targets. I'm thinking about moving
> those to the cpu.c and follow the general standard of the rest

That sounds like a good idea (note I haven't looked in any depth to
see if there are some gotchas with that).

> > You'll probably also need changes in hw/ppc/spapr_hcall.c and maybe
> > some other parts of the spapr code: there are a number of hypercalls
> > that we implement in qemu for TCG, but which are (and must be)
> > implemented in KVM when KVM is in use.  So, I expect you'll need to
> > suppress compilation of h_enter, h_remove, h_protect, h_read and
> > h_bulk_remove at least in the !TCG case.
>=20
> Yeah. there are 6 files dealing with spapr that are having linking
> problems, though some might be because of the cpu_list
> problem... But I'm a bit confused on how to interface with KVM, do I
> use an ioctl explicitly, or can it handle it implicitly? wenever I
> google or ask on IRC for KVM stuff the answer is usually "KVM
> handles it" so I never know if/when to call it

I'm afraid this will mostly need to be figured out on a case by case
basis, with some knowledge of the PAPR interfaces.

One general guideline I can give you: look for the (mostly indirect)
calls to kvmppc_enable_hcall().  That call instructs KVM to handle the
designated hypercall, so it's a hint that you may not need the qemu
implementation of it in the KVM case.  However, there are still some
gotchas - in some cases the hypercall must be implemented by KVM for a
KVM guest or it won't work (e.g. H_ENTER), in other cases the KVM
implementation is just an optimization or fast path and the qemu
implementation is needed as well (e.g. H_PUT_TCE).

The other thing to do is to actually look at the KVM code which
dispatches KVM handled hypercalls, specifically
kvmppc_pseries_do_hcall() in arch/powerpc/kvm/book3s_hv.c and
hcall_real_table in arch/powerpc/kvm/book3s_hv_rmhandlers.S.

At the moment, the TCG-only and always-needed hcall implementations in
qemu aren't split from each other.  Doing so would probably be a good
idea, and I'd be happy to add a new TCG-only .c file for it.

Feel free to ask about specific hypercalls, and I'll try to help out.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--l14a4F6iqss2cAjL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBtIJwACgkQbDjKyiDZ
s5LZFA/+NlqN2x+pojlGqC1ovk16TXPtFfDuvG11b2e9o5//BQi89DZ5ZBNVHxrj
fRmUO0adQMOydVidtDD0V0l/LZDkOF0jYtFTfBNo8coiUpTqa3joYA1iyESt5Ky5
Zpe4qC6/HiumIGGW65xvLyGbSUoFZk1SChrZBAH+BdYvR4CddRpdhkE5inmu0OB3
Wg/SWHvEE9aA6TXsJDY9NQoANk6ik9f/BmEOe4rUXqb/1/xHVXU/cUBXRBhUQjvw
EKEApzjFbgHocmB0oDY4yYViefDfRRcU+5bOMPMx69R2JpwtgpOYCrzJVM+dBW5a
4Fnb3sr9cMtqPerWxFcsy78698sDu3MUlLkz4zawqORARccluAIdPKsWMjhgZKJ5
ea0zkfeEg8oog8CMM0troiLZJatOl6C+GdsK1X1fcUXk4zLbQ1aVNmTKqAUVYc+Z
H4fnTdjvcee5p8hybo2rNNit3Uk9SdWHz1FtCQ3LL9d6o6v6FuqpCuxFK9bjFKlI
tiA2Qx3nwdr+m4agUKymr3Hp84GIMmvbTztPakG48AydunSOodpALm9aRIbK5ZDY
vGJ4pheb/oJGbbaOckX7Mx+CtJGIXnrDQpnTOEfvD9qoqp0XgrlhtNvw0j+upGGO
8i2hDDvDEgVAcy9z2PSllyHAuci7WBoYStCsjqADOCr+tcWbfMQ=
=D6Hf
-----END PGP SIGNATURE-----

--l14a4F6iqss2cAjL--

