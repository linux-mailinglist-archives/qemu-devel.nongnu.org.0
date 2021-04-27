Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8AC36BD0A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 03:58:24 +0200 (CEST)
Received: from localhost ([::1]:39770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbCzW-0005aY-QH
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 21:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lbCy5-0003pW-1k; Mon, 26 Apr 2021 21:56:53 -0400
Received: from ozlabs.org ([203.11.71.1]:35319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lbCy1-0000hj-BS; Mon, 26 Apr 2021 21:56:52 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FTlHV4KqXz9sXG; Tue, 27 Apr 2021 11:56:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1619488598;
 bh=3GPsU4l4QdzotKVn6XCmCEvww3A8V7FWO4ADgeDJz24=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KC96LlPbdMl25oVPUA2Gr0omODOX45Bt4I8yARnER2Ge2J5ZxGoKC3p8leNY7HEOQ
 gJmosOGwwYtlw6DABct+kygwMQ3EPvv6T/qMcULuRXJzpHbst+whUt3MI9gnFzA5XH
 CaZ33XCO8WoWKUXcfCoKeKF4nWAfZFwG5yZahK2M=
Date: Tue, 27 Apr 2021 11:29:24 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
Message-ID: <YIdo9Gg5GW0EQUOD@yekko.fritz.box>
References: <CP2PR80MB44990338BCF641993404B901C7469@CP2PR80MB4499.lamprd80.prod.outlook.com>
 <87mttq15a1.fsf@linux.ibm.com> <YIIP5RVQvS+Xd+WF@yekko.fritz.box>
 <874kfxf7v5.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CF687K1U+U4j0WQH"
Content-Disposition: inline
In-Reply-To: <874kfxf7v5.fsf@linux.ibm.com>
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
Cc: Thomas Huth <thuth@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Andre Fernando da Silva <andre.silva@eldorado.org.br>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--CF687K1U+U4j0WQH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 10:28:14AM -0300, Fabiano Rosas wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
>=20
> > On Thu, Apr 22, 2021 at 04:35:34PM -0300, Fabiano Rosas wrote:
> >> Bruno Piazera Larsen <bruno.larsen@eldorado.org.br> writes:
> >>=20
> >> >> > You are correct! I've just tweaked the code that defines spr_regi=
ster and
> >> >> > it should be working now. I'm still working in splitting the SPR =
functions
> >> >> > from translate_init, since I think it would make it easier to pre=
pare the
> >> >> > !TCG case and for adding new architectures in the future, and I f=
ound a
> >> >> > few more problems:
> >> >>
> >> >> Actually looking at the stuff below, I suspect that separating our
> >> >> "spr" logic specifically might be a bad idea.  At least some of the
> >> >> SPRs control pretty fundamental things about how the processor
> >> >> operates, and I suspect separating it from the main translation log=
ic
> >> >> may be more trouble than it's worth.
> >>=20
> >> I disagree with the code proximity argument. Having TCG code clearly
> >> separate from common code seems more important to me than having the S=
PR
> >> callbacks close to the init_proc functions.
> >
> > Hmm.. I may be misinterpreting what you're intending here.  I
> > certainly agree that separating TCG only code from common code is a
> > good idea.  My point, though, is that the vast majority of the SPR
> > code *is* TCG specific - there are just a relatively few cases where
> > SPRs have a common path.  That basically only happens when a) the SPR
> > can be affected by means other than the guest executing instructions
> > specifically to do that (i.e. usually by hypercalls) and b) accessing
> > the SPR has some side effects that need to be handled in both TCG and
> > KVM cases
>=20
> The SPR code in translate_init.c.inc currently comprises of:
>=20
> 1) the gen_spr* functions that are called during init_proc for each
> processor type;

Ah... that's one part of the confusion.  I forgot about these
functions.  These should indeed be common, despite sharing the gen_*()
prefix with mostly things that are explicitly TCG only.

> 2) the spr_register macros and _spr_register function that adds the SPRs
> to env->spr, called from (1);
>=20
> 3) the TCG-specific SPR read|write callbacks, registered by (2);
>=20
> 4) the KVM specific attribute one_reg_id, registered by (2).
>=20
> The intention is to have one .c file (cpu_init.c) that deals with
> processor initialization, which is mostly setting PowerPCCPUClass
> attributes and registering the appropriate SPRs for each processor
> family (1,2). We're considering that to be shared between KVM and TCG
> for now.

Yes, that's what I'd expect.

> What is going into a separate file are the read and write SPR callbacks,
> which are TCG specific (3). They are still referenced from the other
> file when registering the SPRs, but are ignored when building for
> KVM-only. These are kept in a TCG-only compilation unit.

Ah, right, I'd forgotten that many of the callbacks are in
translate_init.c not translate.c.  Indeed, those will have to move.

> There's still a
> decision to be made whether we should have a separate spr_tcg file for
> them, or move them into translate.c along with the rest of TCG code.

Ah, I see.  Ok, yes, in that case moving them to a new TCG only spr
file makes more sense to me.  translate.c is already enormous.

>=20
> The one_reg_id is just one attribute so that does not change.
>=20
> > From the descriptions it sounded like you were trying to separate
> > *all* SPR code, not just these specific cases from the translation
> > core, and that's what I'm saying is a bad idea.
>=20
> So, if anything, the SPR callbacks are moving _closer_ to the
> translation core.

Right.  Sorry for the misunderstanding.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--CF687K1U+U4j0WQH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCHaPMACgkQbDjKyiDZ
s5IVAA//Wdh+AHfpFcgqpWyAwDS2Fiq0kWLwkezKpq7tvpLX7pNrLsb9ncim1PcH
rTYttBjJoIh9CiK9ohyBYMiggBqPqNUOY0JGH9SGV6l+0azbIUWDsye7D0gtGsFb
0/fNyf0nmcwo5jncd5LyOIU4Vrv1zKmUlG4l9aEfd/O0eBW3dpiwnhPb45NbYHxW
I5kvAhVyky3u1h5e73SMwQOAglvIKKq8RxuvTMzC5DdOq9EF1mxECqznZdHX/LnJ
BrWQft6Pecty4Ek51iy8NoFTFBzPy6fCSnR4GTIR3T1rpMAY0+/sH9v6y0M7GQQN
xEt1HgD/ZKQWLkfUSuMPXYQoNwLuSsShwT3ZUAMUl9Z125dtasT+EKCiHw3sli7i
Nq+wzAuV+VulhJEWN9bC9LVltEquvk4fOPdfsoelIKj4vXh69stWT90YQSVdGhKS
4Xyr4yXS3kK0y5dBlNjoAXdQxmIb6avb0P5vTOIlj4SB/5ZKzLq+gXsli14wzMXV
m+q37x3+QuYEcjxjpOrc6gO3TI1r4NPtcu/wBYRNcWT3BsqDW00RSu+py2IWDDCT
KMnR1BH7l/UfFA+JwaPbqp9yaGuxNlm1y7fkPIqmmFKHxrI8VKklIt+vpeVyvnqf
eBYyoUmh8HCMShBTdJV93O2vayVLEywqEQ8SI3GtFoQpb/6GLuU=
=S7YP
-----END PGP SIGNATURE-----

--CF687K1U+U4j0WQH--

