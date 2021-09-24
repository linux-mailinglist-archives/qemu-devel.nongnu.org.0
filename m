Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B2B4169FD
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 04:24:29 +0200 (CEST)
Received: from localhost ([::1]:42452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTat1-0003Mv-Gy
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 22:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mTaq3-0002WM-EI; Thu, 23 Sep 2021 22:21:23 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:58895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mTaq0-0003dR-Cs; Thu, 23 Sep 2021 22:21:22 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HFwkd4s57z4xb8; Fri, 24 Sep 2021 12:21:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632450073;
 bh=ePkhUvOgSjQBh0u7tBrDMJPBCJdMeiuyd5G9EE7RIXg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P1Ceo3pJiicb/Gj76VAZIxFvwdO165XaAys72saChyzovOPvkL3hGko61WHwpVRwM
 1VMNQwdM9zPONviLWvo91pgv0gfeTORqjUzVBW8RWJN5exiczKwXNLy51yTZzjJE+q
 3IHQOVShdR1wkNogX7qJVU/UC9/vOJNnETfJH1KQ=
Date: Fri, 24 Sep 2021 12:15:55 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v7 0/7] DEVICE_UNPLUG_GUEST_ERROR QAPI event
Message-ID: <YU0023FxGbYQ3Vvl@yekko>
References: <20210825004835.472919-1-danielhb413@gmail.com>
 <874kac258g.fsf@dusky.pond.sub.org>
 <87wnn8zuju.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EdSGSrsPfeVCgo1i"
Content-Disposition: inline
In-Reply-To: <87wnn8zuju.fsf@dusky.pond.sub.org>
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--EdSGSrsPfeVCgo1i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2021 at 02:03:33PM +0200, Markus Armbruster wrote:
> Markus Armbruster <armbru@redhat.com> writes:
>=20
> > Not yet merged.  David, would you like to do the pull request?
>=20
> Oops, there's v8.  Take that one of course.

I have it in ppc-for-6.2, probably looking at a PR next week.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--EdSGSrsPfeVCgo1i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFNNNkACgkQbDjKyiDZ
s5IqCw//QpufpjbikMc+jlFdAQLznzIONogZ4Un7wFhfzfbrgh0XcLqmsEyLYETZ
7+XG2QvIGhGiircCHEAQTi+QJFemLocyDw5yr4ua//u2i2/6u45Ils1VuWlkW1pO
53IVxPAQmRda4+SVqnCQ21AapuWWMslPYzNkSWitIC8kGhhUM+kIweMBPii6TkGM
sw4lUKouhtRyMhBajrsXOFAnZsUp7vlo5K4hgDaFy7Nb3y6k4H4QkG565yFx//7C
wUH/hVEkfXyhTfG/tZeBKgoJYB5PoW1fIooZA5laZa0+em5C39eVX5TJvAtjDaPt
mN9jY4SU722N5H+AkDsrm5sr/9o0Fr2hU7YmjpFRgceWr3ekMnleYF2k8hYF8yOS
VQ3cCLoxn2HBKt/NqN82PLthIWKLyQHhBsP73wwvncXLM3mXtRcOaurWHoRI233/
ZWsMl1stag7PgTk4mFaELY9+IYUEdgKGfEa7uu04hYCu9G6KWoJEBb4TmBDuowqv
9rMyKHLzZGMKy3iigOYAkrRDgeTwUcoWjgh+/0OHd9uueLJCBP1NqKZLVykY6ZTT
fEUuL27REIEDhP7jK86p8cDApUeD/+569hm4ks3UpAKSGOYM44gOKqK32N42M9ix
bVScKeHWg8cNpTylswNBLnWqF8Wt92JqcKgDl+eu/rMuYJbpA0w=
=TOhO
-----END PGP SIGNATURE-----

--EdSGSrsPfeVCgo1i--

