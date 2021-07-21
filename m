Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4BE3D0910
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:41:27 +0200 (CEST)
Received: from localhost ([::1]:43694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m65v4-0003Sa-E4
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m65nk-0003iy-Az
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:33:52 -0400
Received: from ozlabs.org ([203.11.71.1]:48055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m65ng-0006vu-Ub
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:33:52 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GV5Pv6bVqz9sj5; Wed, 21 Jul 2021 16:33:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626849219;
 bh=NSWGKUd11WajDo9/mYyvbEK8ev+/PnrT7/tv1UJ28O4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O3pVYBCOhZNZwpEB+RQa+Tixd662uDzN1b51Ak6vB8LXXdKwATsvtzaNonKvbEo8P
 LejILSfDZSlw4258Im3kaPFFZK5Wut8bi2vmOLRBklc+D86AOByBTaLEDjVz8QLvzU
 C8NKHtP8lRBtoOgePYRT5Mwysjz5+Gl+sdU4V2Ho=
Date: Wed, 21 Jul 2021 16:26:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: spapr_events: Sure we may ignore migrate_add_blocker() failure?
Message-ID: <YPe+FefwuwGd23nh@yekko>
References: <87tukvaejt.fsf@dusky.pond.sub.org> <YPTj6ml6LoMJkypI@yekko>
 <87lf62ydow.fsf@dusky.pond.sub.org> <YPUn2quWrztTqyML@yekko>
 <875yx6oabe.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xs41vh+AoWTedjiQ"
Content-Disposition: inline
In-Reply-To: <875yx6oabe.fsf@dusky.pond.sub.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: Aravinda Prasad <arawinda.p@gmail.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--xs41vh+AoWTedjiQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2021 at 12:41:09PM +0200, Markus Armbruster wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
>=20
> > On Mon, Jul 19, 2021 at 09:18:07AM +0200, Markus Armbruster wrote:
> >> David Gibson <david@gibson.dropbear.id.au> writes:
> >>=20
> >> > On Thu, Jul 15, 2021 at 03:32:06PM +0200, Markus Armbruster wrote:
> >> >> Commit 2500fb423a "migration: Include migration support for machine
> >> >> check handling" adds this:
> >> >>=20
> >> >>     ret =3D migrate_add_blocker(spapr->fwnmi_migration_blocker, &lo=
cal_err);
> >> >>     if (ret =3D=3D -EBUSY) {
> >> >>         /*
> >> >>          * We don't want to abort so we let the migration to contin=
ue.
> >> >>          * In a rare case, the machine check handler will run on th=
e target.
> >> >>          * Though this is not preferable, it is better than aborting
> >> >>          * the migration or killing the VM.
> >> >>          */
> >> >>         warn_report("Received a fwnmi while migration was in progre=
ss");
> >> >>     }
> >> >>=20
> >> >> migrate_add_blocker() can fail in two ways:
> >> >>=20
> >> >> 1. -EBUSY: migration is already in progress
> >> >>=20
> >> >>    Ignoring this one is clearly intentional.  The comment explains =
why.
> >> >>    I'm taking it at face value (I'm a spapr ignoramus).
> >> >
> >> > Right.  The argument isn't really about papr particularly, except
> >> > insofar as understanding what fwnmi is.  fwnmi (FirmWare assisted NM=
I)
> >> > is a reporting mechanism for certain low-level hardware failures
> >> > (think memory ECC or cpu level faults, IIRC).  If we migrate between
> >> > detecting and reporting the error, then the particulars we report wi=
ll
> >> > be mostly meaningless since they relate to hardware we're no longer
> >> > running on.  Hence the migration blocker.
> >> >
> >> > However, migrating away from a (non-fatal) fwnmi error is a pretty
> >> > reasonable response, so we don't want to actually fail a migration if
> >> > its already in progress.
> >> >
> >> >>    Aside: I doubt
> >> >>    the warning is going to help users.
> >> >
> >> > You're probably right, but it's not very clear how to do better.  It
> >> > might possibly help someone in tech support explain why the reported
> >> > fwnmi doesn't seem to match the hardware the guest is (now) running
> >> > on.
> >>=20
> >> Perhaps pointing to the actual problem could help: the FWNMI's
> >> information is mostly meaningless.
> >
> > Sorry, I don't follow what you're suggesting.
>=20
> We warn
>=20
>     warning: Received a fwnmi while migration was in progress
>=20
> when we fail to block migration because it's already in progress.
> But what does this mean?  Perhaps warn like this:
>=20
>     warning: FWNMI while migration is in progress
>     The guest's report for this may be less than useful.
>=20
> My phrasing may well be off, but I hope you get the idea.

I see your point.  It may be some time before this reaches the top of
priority list, however.

> Note that we keep quiet when we fail to block migration due to
> -only-migrate.  I agree with that.  The failure makes a difference only
> when migration gets triggered in a narrow time window, which should be
> quite rare.  Would be nice to warn when migration does get triggered in
> that time window, though.  Not sure it's worth the trouble, in
> particular if we'd have to create infrastructure first.
>=20
> >
> >>=20
> >> >> 2. -EACCES: we're running with -only-migratable
> >> >>=20
> >> >>    Why may we ignore -only-migratable here?
> >> >
> >> > Short answer: because I didn't think about that case.  Long answer:
> >> > I think we probably shoud ignore it anyway.  As above, receiving a
> >> > fwnmi doesn't really prevent migration, it just means that if you're
> >> > unlucky it can report stale information.  Since migrating away from a
> >> > possibly-dubious host would be a reasonable response to a non-fatal
> >> > fwnmi, I don't think we want to simply prohibit fwnmi entirely with
> >> > -only-migratable.
> >>=20
> >> I think the comment text and placement could be improved to make clear
> >> ignoring this failure is intentional, too.  How do you like the
> >> following?
> >
> > That's fair..
> >
> >>=20
> >> diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
> >> index a8f2cc6bdc..54d8e856d3 100644
> >> --- a/hw/ppc/spapr_events.c
> >> +++ b/hw/ppc/spapr_events.c
> >> @@ -911,16 +911,14 @@ void spapr_mce_req_event(PowerPCCPU *cpu, bool r=
ecovered)
> >>          }
> >>      }
> >> =20
> >> +    /*
> >> +     * Try to block migration while FWNMI is being handled, so the
> >> +     * machine check handler runs where the information passed to it
> >> +     * actually makes sense.  This won't actually block migration,
> >> +     * only delay it slightly.  If the attempt fails, carry on.
> >> +     */
> >>      ret =3D migrate_add_blocker(spapr->fwnmi_migration_blocker, NULL);
> >>      if (ret =3D=3D -EBUSY) {
> >> -        /*
> >> -         * We don't want to abort so we let the migration to continue.
> >> -         * In a rare case, the machine check handler will run on the =
target.
> >> -         * Though this is not preferable, it is better than aborting
> >> -         * the migration or killing the VM. It is okay to call
> >> -         * migrate_del_blocker on a blocker that was not added (which=
 the
> >> -         * nmi-interlock handler would do when it's called after this=
).
> >> -         */
> >>          warn_report("Received a fwnmi while migration was in progress=
");
> >>      }
> >
> > LGTM.
>=20
> Thanks, I'll post this.
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--xs41vh+AoWTedjiQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD3vhUACgkQbDjKyiDZ
s5LIEA//TAP5xSfXh35II3Pjs8iP3L5gxz1HVuIgb2Qa7aOOvl48Wl1Hxkn+Bdm7
d7ZDyK2tLRc6HJl3fVcKbEKEvXy4XOGFxtT2J19koa035RoVMsn3dDH3G4RJ/qvB
rL+ogmlBiYJ4Yg2ES1r3PuI7/GM04mf2C3oqSeZtCKLhC2WRdn8s2DDj9kQIwsjX
Drvqz94HqI9K21PlE7OR2xw3f5d9u1UKlqvgOdQ2ggT0d0qYGVtHVUcJTgKxV9Xf
QHTW8j1dbcyG+RX9CF/aiZ56Cis5M8+MyQ8Fq9n0/fSHYxbzdakyA9bLxySclBEZ
NSpJte7yyMnTPYJxksZQMhpDOhGz5PZyFgJhWDQhFrD9mSFHk2IUtGMGBS1UOKGm
FVR3XmjSYUAQn4uVmdOl+51l0csTg5EQHGAZMD77XBkIE4/m/X+rS1XkA5VrUdI5
P33cKTW8zOj5MopgwOY3sgbl9RuBSY8fVJgwTq3IhpBt3QQ5cJyH2JogNwhJR9qO
nODsQE+4PrEGFLRYpqAV86JSv8bfkB3xx/dG8e9Jw55QFhRBawN8O0d5VSupaTF/
g8YeekcscTkB7P2+ruTXD3v76inFAPJhDK53nc+OBh4KwuALnZPVulgP4VE9IvmV
vZ9v7EjVt+U/GiPg3Wd71tNrc+pShswQ0XtgZUKwYXOnvWdIzCA=
=rI2A
-----END PGP SIGNATURE-----

--xs41vh+AoWTedjiQ--

