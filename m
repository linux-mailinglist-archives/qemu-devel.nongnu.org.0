Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D244410F3A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 07:10:50 +0200 (CEST)
Received: from localhost ([::1]:34164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSBZo-0003jt-Tv
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 01:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSBWc-0002Mf-QF
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 01:07:32 -0400
Received: from ozlabs.org ([203.11.71.1]:58041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSBWa-0008Gv-4b
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 01:07:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632114436;
 bh=q4nFBkcW9QewpwPe+jEFVrynaxhjwyCa1vt+jdjnCnk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c1p6jME8Pk3NILH/7T2Cdou7HQctn29ofXFO0alqU8GoLdei/baC/U0JyuKfC/++Z
 suCak5eGsNMLxBq0jVEZbkCa9gEWDIpiJ0/0+cPFR2+2MSWqU0uhXuEe1yWIcRS9VY
 wTO/CePOt4ssgTsjTZWNf1rIm1T8Jylt76TWeKks=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4HCXc454Lbz9sW5; Mon, 20 Sep 2021 15:07:16 +1000 (AEST)
Date: Mon, 20 Sep 2021 13:41:36 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: Rust in Qemu BoF followup: Rust vs. qemu platform support
Message-ID: <YUgC8HThCulgUFcB@yekko>
References: <YURYvaOpya498Xx2@yekko> <87k0jfh88i.fsf@redhat.com>
 <CAJ+F1CJJvqVQrG5iPXV2s7oLbduHfAhHs0pHdZ8XbxLkNi42VQ@mail.gmail.com>
 <YUR2BjppxkBo8mD0@yekko>
 <dc2df310-ee28-a912-3aad-4d3e38974182@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0ZjcOLelooq6n2UP"
Content-Disposition: inline
In-Reply-To: <dc2df310-ee28-a912-3aad-4d3e38974182@linaro.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Sergio Lopez <slp@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, hreitz@redhat.com,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0ZjcOLelooq6n2UP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 18, 2021 at 01:01:35PM -0700, Richard Henderson wrote:
> On 9/17/21 4:03 AM, David Gibson wrote:
> > > For sparc 32, it was added to support Gentoo at that time which didn't
> > > switch to 64-bit yet (https://github.com/rust-lang/rust/pull/48297)
> > >=20
> > > For the past 2-3y, Gentoo sparc is now 64 bit. (like Debian apparentl=
y for
> > > a while)
> > >=20
> > > But apparently, by lack of CI it was downgraded to Tier-3.
> > >=20
> > > Is it reasonable to officially drop support for sparc 32 in QEMU
> > > too?
> >=20
> > As a qemu build arch I would say probably yes.
>=20
> We dropped host support for sparcv8 (true 32-bit) a long time ago.
> We only support sparcv9 in ilp32 (sparcv8plus) and lp64 (sparc64).

We really need to update
https://qemu-project.gitlab.io/qemu/about/build-platforms.html
to clarify this then.  I don't really know what the procedures are for
updating the website.

> I'd be happy top drop sparcv8plus as well, because I haven't been able to
> test it for something like 2-3 years.

Sounds like a reasonable reason.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0ZjcOLelooq6n2UP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFIAu4ACgkQbDjKyiDZ
s5LQTBAAySRhWp+ilaZVmHLlhPeeG5kOiPYo9TPa3aPKC8vyEuUJanGpmcVMZtxu
Snx7GEeHu3j8tyTJF5xrsAKhhOSc/uTzwvnqJrNb2RXur3850Lv6+8N/eKRSoQYZ
jN5lka+MbJIfLoLZOQ46/MHVrnZeomzLwq+PSHjf8n0VVhM7yKLiH89sl2OVjgyO
7hSbPEGlAZvOZNCsvsXRhFtX/IumH8mfJ2a9IU343adiKzNofRb8Z19lwq1BULZF
Fth6/hgT2N1sr7X5FmVY7EPTUrQdgISvLERDmBe0LtgOnSLJ2j306u9oQOneFmG2
teetANbFu7dPnGlYOUPybE/I5Td7uFVVQs/OkHwmtzvqU5v3vIrRKyiYoIP4A/ZF
khFq6wY5XZQ6BhAuugN9yaZ8oeUbRLecFugxWlLQBRKLz3Dx42cJmfbvJbcX0qiy
HQQ/7AnbXzjGSvAauSZ0tdURTa4m2ZMJx8p0ZzDghiIJXo7AYczQaQZVo55F1Oa0
NfHU+zKGQ4a/eY993QLwlmLIw/hsgIjiRVVTwAcOK1aR7M4F0eWYjHtzzu/7h9X9
eOYYT53wUrFrn+mN1vjfNZdNHxcJIsaxESx0jt4yFAORqB9wppvP4pvGggWyUVax
yHFV+ZOof2lq0tEzmttUxPDJ1owUKW/pttrXiKHUGE4zSe+zk1I=
=ukQ2
-----END PGP SIGNATURE-----

--0ZjcOLelooq6n2UP--

