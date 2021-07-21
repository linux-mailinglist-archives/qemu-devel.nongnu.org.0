Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBB33D0925
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:46:41 +0200 (CEST)
Received: from localhost ([::1]:50312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6608-0008Ey-FR
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m65nk-0003j3-C8
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:33:52 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:59781 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m65nh-0006vw-A4
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:33:52 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GV5Pv6xvMz9sjD; Wed, 21 Jul 2021 16:33:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626849219;
 bh=f4/7ePJeqFqaijObxPYrhjoaPyaEHrWbglH7OejUFCg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z6abq1PrSZfmglpDvCAMVY26Ajs6mp5jML+iodcILHFzu/AT9u8o3lgLK0v1hr2Xv
 shSZ34p11ZIVkAN+SuCH2tiwk/b2yMZ6Bz0HP9lD8yg9nVuUBDXHTQJXv/BnO2JNEI
 ifIXQr8TT3PHGVugZh9I5cHGrtCqCsWou4/MFlWE=
Date: Wed, 21 Jul 2021 16:32:28 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: -only-migrate and the two different uses of migration blockers
Message-ID: <YPe/fIBuvGgfiyy3@yekko>
References: <87tukvaejt.fsf@dusky.pond.sub.org> <YPTj6ml6LoMJkypI@yekko>
 <87lf62ydow.fsf@dusky.pond.sub.org> <YPUn2quWrztTqyML@yekko>
 <875yx6oabe.fsf@dusky.pond.sub.org>
 <87sg0amuuz.fsf_-_@dusky.pond.sub.org> <YPVzURLf5qqwtYsZ@work-vm>
 <87o8axh7rr.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/yOfKhnaCViZDb/I"
Content-Disposition: inline
In-Reply-To: <87o8axh7rr.fsf@dusky.pond.sub.org>
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/yOfKhnaCViZDb/I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 20, 2021 at 07:30:16AM +0200, Markus Armbruster wrote:
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
>=20
> > * Markus Armbruster (armbru@redhat.com) wrote:
> >> We appear to use migration blockers in two ways:
> >>=20
> >> (1) Prevent migration for an indefinite time, typically due to use of
> >> some feature that isn't compatible with migration.
> >>=20
> >> (2) Delay migration for a short time.
> >>=20
> >> Option -only-migrate is designed for (1).  It interferes with (2).
> >>=20
> >> Example for (1): device "x-pci-proxy-dev" doesn't support migration.  =
It
> >> adds a migration blocker on realize, and deletes it on unrealize.  With
> >> -only-migrate, device realize fails.  Works as designed.
> >>=20
> >> Example for (2): spapr_mce_req_event() makes an effort to prevent
> >> migration degrate the reporting of FWNMIs.  It adds a migration blocker
> >> when it receives one, and deletes it when it's done handling it.  This
> >> is a best effort; if migration is already in progress by the time FWNMI
> >> is received, we simply carry on, and that's okay.  However, option
> >> -only-migrate sabotages the best effort entirely.
> >
> > That's interesting; it's the first time I've heard of anyone using it as
> > 'best effort'.  I've always regarded blockers as blocking.
>=20
> Me too, until I found this one.

Right, it may well have been the first usage this way, this fwnmi
stuff isn't super old.

> >> While this isn't exactly terrible, it may be a weakness in our thinking
> >> and our infrastructure.  I'm bringing it up so the people in charge are
> >> aware :)
> >
> > Thanks.
> >
> > It almost feels like they need a way to temporarily hold off
> > 'completion' of migratio - i.e. the phase where we stop the CPU and
> > write the device data;  mind you you'd also probably want it to stop
> > cold-migrates/snapshots?
>=20
> Yes, a proper way to delay 'completion' for a bit would be clearer, and
> wouldn't let -only-migrate interfere.

Right.  If that becomes a thing, we should use it here.  Note that
this one use case probably isn't a very strong argument for it,
though.  The only problem here is slightly less that optimal error
reporting in a rare edge case (hardware fault occurs by chance at the
same time as a migration).


=2E... and, also, I half-suspect that the whole fwnmi feature exists
more to tick IBM RAS check boxes than because anyone will actually use
it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/yOfKhnaCViZDb/I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD3v3wACgkQbDjKyiDZ
s5IbAg/+MGCMK8VbnNOeKBmkiipacghZkZ0XfNPeOESitn6fB4qGY1GtKNsxSJK+
Ep5gghg8T0W3Mxh4kOGlTwPIlV2fB2Dj4opmy60qDIW7/8lYXpdyO+KmIWxBqnbO
2INiKCApp4CtgLIvSEeTK8V5dZn61SCOEnRHceyLktCMKm/iJYpcJxIpLPBThYA0
LBTo2Z4CCTcEMjs5RwAg3tLIS0jiCEPlYEqtnAGjCfICmhhCosvQYFLUUAiIF81a
ST5conEmB/75UvOodspBl9x+GdIfFqvMPHD5RXl/FEzpO4rM1CKTjD26GHS0u6Au
l/jw8aXrp3bbaFN9dESwAEZ8zlcqu1Mu3Xk3huZlAl//6rldN3Grpogo8Feh2Ffs
KSIKgi108ao9ApLlMTNUDuqKs11kwQ8qn0EZCC0OS2+x+xeNwJWvKSMsFwz9wEyO
JMPwZHQgZBSCJLYjGM9aJj58pdzfyfWpaFUQQ0tarH1/REiSqm61FoNY7GuNEbGj
6RQbV3Iemw4fXcGjcYvfNmAfjIThGvOHXaUNYFh1oCVLni0ZDv0Ey35lnNgEIeJs
KH3yLM+Gopfl6DJKUDICXN3C7hCyIqAWE+jO4nD4KiV1l74TFfmNTDUUrBfAQ0A1
AoWEwlkDbJ3w/KvBvyT6Y1eJrQds6LJ+HekllMyXxPhEvCrY0Ag=
=El2d
-----END PGP SIGNATURE-----

--/yOfKhnaCViZDb/I--

