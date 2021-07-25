Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 061C43D4C62
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 08:29:50 +0200 (CEST)
Received: from localhost ([::1]:46044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7Xe0-0002sQ-DZ
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 02:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m7Xax-0001cm-M0
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 02:26:39 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:58237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m7Xat-0007VH-LG
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 02:26:39 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GXY3g0plhz9sX5; Sun, 25 Jul 2021 16:26:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1627194383;
 bh=yiGx7P+evq4F1dJffO2SJWj/ovHyuJi+EUoSDB1d3kc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LoeXHFH9RqnNhjZnMr/xvdr+yMxLKgGbpYt69+nHE0yuQUe3/WYpKB1Dn/hJQATZR
 MF2valNB2+u0vNlDjmI5bf2YxxNmJc8nd6MnHoqV7puKFNFwkYCs+jJ54VPBOLYbiB
 Qy2FUK8ZZV+jwZVbPMLnVHYH0ddFVVod/xDz0yzg=
Date: Sun, 25 Jul 2021 16:25:53 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: -only-migrate and the two different uses of migration blockers
Message-ID: <YP0D8fYaNAeZ3QIz@yekko>
References: <87tukvaejt.fsf@dusky.pond.sub.org> <YPTj6ml6LoMJkypI@yekko>
 <87lf62ydow.fsf@dusky.pond.sub.org> <YPUn2quWrztTqyML@yekko>
 <875yx6oabe.fsf@dusky.pond.sub.org>
 <87sg0amuuz.fsf_-_@dusky.pond.sub.org> <YPVzURLf5qqwtYsZ@work-vm>
 <87o8axh7rr.fsf@dusky.pond.sub.org> <YPe/fIBuvGgfiyy3@yekko>
 <YPmyWFCU45/W4P1z@work-vm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xhslqebtW2m6jvFj"
Content-Disposition: inline
In-Reply-To: <YPmyWFCU45/W4P1z@work-vm>
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--xhslqebtW2m6jvFj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 22, 2021 at 07:00:56PM +0100, Dr. David Alan Gilbert wrote:
> * David Gibson (david@gibson.dropbear.id.au) wrote:
> > On Tue, Jul 20, 2021 at 07:30:16AM +0200, Markus Armbruster wrote:
> > > "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
> > >=20
> > > > * Markus Armbruster (armbru@redhat.com) wrote:
> > > >> We appear to use migration blockers in two ways:
> > > >>=20
> > > >> (1) Prevent migration for an indefinite time, typically due to use=
 of
> > > >> some feature that isn't compatible with migration.
> > > >>=20
> > > >> (2) Delay migration for a short time.
> > > >>=20
> > > >> Option -only-migrate is designed for (1).  It interferes with (2).
> > > >>=20
> > > >> Example for (1): device "x-pci-proxy-dev" doesn't support migratio=
n.  It
> > > >> adds a migration blocker on realize, and deletes it on unrealize. =
 With
> > > >> -only-migrate, device realize fails.  Works as designed.
> > > >>=20
> > > >> Example for (2): spapr_mce_req_event() makes an effort to prevent
> > > >> migration degrate the reporting of FWNMIs.  It adds a migration bl=
ocker
> > > >> when it receives one, and deletes it when it's done handling it.  =
This
> > > >> is a best effort; if migration is already in progress by the time =
FWNMI
> > > >> is received, we simply carry on, and that's okay.  However, option
> > > >> -only-migrate sabotages the best effort entirely.
> > > >
> > > > That's interesting; it's the first time I've heard of anyone using =
it as
> > > > 'best effort'.  I've always regarded blockers as blocking.
> > >=20
> > > Me too, until I found this one.
> >=20
> > Right, it may well have been the first usage this way, this fwnmi
> > stuff isn't super old.
> >=20
> > > >> While this isn't exactly terrible, it may be a weakness in our thi=
nking
> > > >> and our infrastructure.  I'm bringing it up so the people in charg=
e are
> > > >> aware :)
> > > >
> > > > Thanks.
> > > >
> > > > It almost feels like they need a way to temporarily hold off
> > > > 'completion' of migratio - i.e. the phase where we stop the CPU and
> > > > write the device data;  mind you you'd also probably want it to stop
> > > > cold-migrates/snapshots?
> > >=20
> > > Yes, a proper way to delay 'completion' for a bit would be clearer, a=
nd
> > > wouldn't let -only-migrate interfere.
> >=20
> > Right.  If that becomes a thing, we should use it here.  Note that
> > this one use case probably isn't a very strong argument for it,
> > though.  The only problem here is slightly less that optimal error
> > reporting in a rare edge case (hardware fault occurs by chance at the
> > same time as a migration).
>=20
> Can you at least put a scary comment in to say why it's so odd.
>=20
> If you wanted a choice of a different bad way to do this, since you have
> savevm_htab_handlers, you might be able to make htab_save_iterate claim
> there's always more to do.

That would only work if the hash MMU is in use, which won't be the
case with most current systems.

> > .... and, also, I half-suspect that the whole fwnmi feature exists
> > more to tick IBM RAS check boxes than because anyone will actually use
> > it.
>=20
> Ah at least it's always reliable....
>=20
> Dave
>=20
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--xhslqebtW2m6jvFj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD9A+8ACgkQbDjKyiDZ
s5JKAA//aXIbxeQf4hWY75fHDl3PPg+SetCN1AZ2a2LQdwRfPjBZcLGXxgnQmdPb
RaCpvFJd5mWPp7Yc+fLx8mQv+muIwE8h1zXuAVDaZvXzJAdYuDHfQsLVuYOZpBrF
wV+iSsg1Cf1I7oz8SBsXzVvcwuQeCaB0qlDpNn8WUyTg/zXKJUqGa3RrTd6a63mF
Fd+eJAEf4xtSC2E6dCpv02VcTTSoeWnzpVHfvKiZwx0Qc1rW30iG/12vdl6loljH
YIAt0b+6bBmHwqsE24t6q9kBtbvjEYLPuknDuTpoJTtcmEW4PT27+E+zZ9B2P+6v
Qqa6mrM2yqaBf4nNEXdgqLrBWcM9p/iuf7cfSq59eF8oavAHn/Xuve/CJWQR8Xge
MfCHdTTh/bYUHWVI7p5MBIW9tnd5wZRrYgIiec9z5xmyE/Ib/Pg3tkdIbF6rDpZT
CDSQTUgTBVKG4NK5IKNg/qBbnbQe9s9zUVjmXSJ28wuTsTOdEvyX0ZStOFxDHRmk
IhyStHozrw/Ym9z3s3t/qdHbBsiN3OoXjjnWDQgZbG9vCgnCYJmNyPVM5zGO1RWG
NJVpSrIzoB6eN50ZLlFMbc7WN++MXLh43X31aPlNuPASdVqxozwc3946HOP3ZvJc
ZQ1rGRoeXNJrY70E0IZL9xU6U+qLTL8rUONgRYR6oX5wOumtVuM=
=311U
-----END PGP SIGNATURE-----

--xhslqebtW2m6jvFj--

