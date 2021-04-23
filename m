Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AF6368BA7
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 05:35:55 +0200 (CEST)
Received: from localhost ([::1]:38928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZmbi-0000U7-4K
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 23:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lZmai-0008Sb-Em; Thu, 22 Apr 2021 23:34:52 -0400
Received: from ozlabs.org ([203.11.71.1]:37197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lZmaf-0008CB-BV; Thu, 22 Apr 2021 23:34:52 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FRKfP187Nz9sW8; Fri, 23 Apr 2021 13:34:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1619148877;
 bh=0sI8ZWJJ2nNaO7OYaNNstU7K8C6z6Ey6r23/Q3Ncm/M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f5HsXvk1MYF3y581qtRNJsVQyx/8aeO6hvgUNCTmM7py9pJ2Qe/+aKlNZZwqG7wh6
 EAQmO53diBigkyxueEpOoo6Ly9+zjyQcYz6TXCM6/txaKwmdP9Fgm9MTVhWaHHYM1M
 OwWfZpotW2qa1HXS4PWSWIEtbQFLJMOmw3v/ygkM=
Date: Fri, 23 Apr 2021 10:08:05 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
Message-ID: <YIIP5RVQvS+Xd+WF@yekko.fritz.box>
References: <CP2PR80MB44990338BCF641993404B901C7469@CP2PR80MB4499.lamprd80.prod.outlook.com>
 <87mttq15a1.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NeueufxrHXGRhabk"
Content-Disposition: inline
In-Reply-To: <87mttq15a1.fsf@linux.ibm.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Andre Fernando da Silva <andre.silva@eldorado.org.br>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--NeueufxrHXGRhabk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 22, 2021 at 04:35:34PM -0300, Fabiano Rosas wrote:
> Bruno Piazera Larsen <bruno.larsen@eldorado.org.br> writes:
>=20
> >> > You are correct! I've just tweaked the code that defines spr_registe=
r and
> >> > it should be working now. I'm still working in splitting the SPR fun=
ctions
> >> > from translate_init, since I think it would make it easier to prepar=
e the
> >> > !TCG case and for adding new architectures in the future, and I foun=
d a
> >> > few more problems:
> >>
> >> Actually looking at the stuff below, I suspect that separating our
> >> "spr" logic specifically might be a bad idea.  At least some of the
> >> SPRs control pretty fundamental things about how the processor
> >> operates, and I suspect separating it from the main translation logic
> >> may be more trouble than it's worth.
>=20
> I disagree with the code proximity argument. Having TCG code clearly
> separate from common code seems more important to me than having the SPR
> callbacks close to the init_proc functions.

Hmm.. I may be misinterpreting what you're intending here.  I
certainly agree that separating TCG only code from common code is a
good idea.  My point, though, is that the vast majority of the SPR
code *is* TCG specific - there are just a relatively few cases where
SPRs have a common path.  That basically only happens when a) the SPR
can be affected by means other than the guest executing instructions
specifically to do that (i.e. usually by hypercalls) and b) accessing
the SPR has some side effects that need to be handled in both TCG and
KVM cases

=46rom the descriptions it sounded like you were trying to separate
*all* SPR code, not just these specific cases from the translation
core, and that's what I'm saying is a bad idea.

> But maybe we should take a look at this RFC before we start discussing
> personal preference too much.
>=20
> > Well, all the errors that I got were related to to read/write functions=
, which
> > I was already separating into a spr_tcg file. The solutions I can see a=
re to
> > include this file in translate.c, and either have the read/write functi=
ons not be
> > static, or include the spr_common.c in translate as well, but only for =
TCG
> > builds. Both solutions sound pretty bad imo, but the first sounds less =
bad,
> > because it's a bit less complexity in the build process.
>=20
> It would be helpful if we could apply these patches and do some
> experimentation before recommending a solution. So I would pick the less
> bad for now. Mention it in the cover letter and then we can discuss
> looking at something more concrete.
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--NeueufxrHXGRhabk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCCD+MACgkQbDjKyiDZ
s5JUSxAAh8o1Kt6UEa4fXokGuOhWjTkCbjuTtVnhGg2wpk6CC9rdQocgaQY6FPhe
ibEYqHBCqjdPYswtlZnqbuzh9q0xakRknQL9P8UxGwIML6w9IAlvhR/Hs8+y25EG
kZ3AxZVYdpcjtWP4BjVPHFsyZXanm62JnKSTvPaNtJxsGmhFrsLZw/Y/HssmE1XU
k5OE47Ne4UZ5PaF5K7KWGq8DhjXid6LT50EOeAWWKiEtjLr9cr1saV6goH1pjujW
xbXJV8YPR6F5fhF79gYu45kvNOnc20sq4AMd9p9oCWZ86SPWf531ONGPp4HTqA2O
0Da7g8sjZ/qajSqUKW0uzMk0zqYBC5PiHnHqHrcdq8zqOtVD42FK23gBDEzcULkZ
yCErSOqjOyjar3fLeH62btNRgcrYICGsH9PCyuUUqo1SGhU91NT6RnwtdpYolgMG
slYTPI+8r3ZRsHYuRHH1Q3R8mFRvbBAyGNBncuFya9rMmZEaL2HrShoEqIZxuQTD
CpincxvbcC9qYl2H3sAugJqp5gRcmhHLLtFNywTDuKvyjyY/dcJE2qS7JuPhB5PZ
WDCoNkdFb/JcYUNZ9DNe1W/t36DjcCHK8ySuZzzr7jvIglTHBma0xP1+ggvTgU1q
ZLTlCxq9u/q3QnzUny8xf1Ubj5majTXKlDX0xtZkX5YgHlZwWRc=
=lee6
-----END PGP SIGNATURE-----

--NeueufxrHXGRhabk--

