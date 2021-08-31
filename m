Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FC73FC028
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 02:53:01 +0200 (CEST)
Received: from localhost ([::1]:58534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKs1L-0004yF-Vb
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 20:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mKruD-0001ek-Lp; Mon, 30 Aug 2021 20:45:38 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43803 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mKru8-00051U-MR; Mon, 30 Aug 2021 20:45:36 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Gz7lB2pP9z9sT6; Tue, 31 Aug 2021 10:45:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630370726;
 bh=QrmsPVeR5SkMV2EUyldIP/bO+/wAjtMB3/fahV9TLXw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=auTBLXijy2nfDbROSPUP6NBQZkQjBJCCCQUWF0AYfwIUiUH8hCyjAhSHRP0X4HgWQ
 G0n8yNIOpiVf6Uc2HklKtyAtKlRvapEdVgHi5dHHF2W/ZVXt+oX/TrRTjOWQCyPF+w
 MTSqFhAtPUenoa8/h1dkUlGKu/eXbuDO8iRLc15w=
Date: Tue, 31 Aug 2021 10:27:26 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: QEMU-KVM offers OPAL firmware interface? OpenBSD guest support?
Message-ID: <YS13btS1TgRWIGkI@yekko>
References: <HgtFZEnabNjIrsVI3x8MYs2QYSCG4IFStP0MR3qwPWBmXW9kDmQmIwQEWHMVdJbUCu-XvHdMpZGe3pr-B91s1D7y6cn9SVzhxEYms5c3p0o=@protonmail.com>
 <20210827180259.3720d58d@bahia.lan>
 <56141ff67838992a@bloch.sibelius.xs4all.nl>
 <20210827190053.6c68def5@bahia.lan>
 <25bfa81c-9498-4e82-a848-1fbb1c188ff1@kaod.org>
 <561422a20e4f9ae2@bloch.sibelius.xs4all.nl>
 <51bff28d-4779-b023-fee6-b3e9196b7ec5@kaod.org>
 <3QoYEEZauH3xXwC2NcJFnrHe4IaWwu2fqEvtR6tR3RHsY_b0bsyz0oQdcI0b1zdwnXbXhl6bCtaUiyWQjbYgnx5U-Ov_Lm3tMGdMkTwZC88=@protonmail.com>
 <YSyBUSxBiH+UYE/Y@yekko>
 <341991bb-5cb4-646d-6df-10f61bb8f27b@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YS1tjK9cKwt0tTDt"
Content-Disposition: inline
In-Reply-To: <341991bb-5cb4-646d-6df-10f61bb8f27b@eik.bme.hu>
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
Cc: qemu-ppc@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--YS1tjK9cKwt0tTDt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 30, 2021 at 05:44:00PM +0200, BALATON Zoltan wrote:
> On Mon, 30 Aug 2021, David Gibson wrote:
> > On Sun, Aug 29, 2021 at 04:09:54AM +0000, Joseph wrote:
> > > Hi Mark, C=E9dric, Greg at the openbsd-ppc ML,
> > >=20
> > > It is great to talk to you. Thank you for taking on the conversation.
> > >=20
> > > Right, OpenBSD implements powernv meaning it runs on bare metal on
> > > Power9, that is great.
> > >=20
> > > What I wanted to ask about with this thread is:
> > >=20
> > > To have the same utility of Power9 as of AMD64, it would be great to
> > > have a high speed virtualizer, like what OpenBSD's VMM or Linux' KVM-
> > > QEMU accomplish on AMD64.
> > >=20
> > > Linux KVM-QEMU supports Power9 already so that's a great start: One
> > > runs Linux powernv bare metal on Power9 hardware. Each VM is a
> > > KVM-QEMU instance.
> > >=20
> > > Is there any way today to make Linux-KVM-QEMU as VM host run
> > > OpenBSD as a high speed (say >90% of bare metal performance, here
> > > presume KVM uses PCIe passthrough) VM guest -
> >=20
> > I'm afraid this is more or less impossible, without adding
> > PAPR/pseries support to OpenBSD.  The fundamental problem is that the
> > virtualization facilities on the POWER chip don't really allow
> > efficient full hardware virtualization, only para-virtualization and
> > PAPR is that para-virtualized environment.
> >=20
> > That's why the "powernv" machine type doesn't utilize KVM and is fully
> > emulated and therefore slow.  It might be possible to use the
> > "powernv" machine type with the "PR" implementation of KVM - that's a
> > KVM implementation which works by running the entire guest in
> > userspace and emulating all privileged instructions.  But:
> >=20
> > * KVM PR doesn't currently work properly on POWER9, and getting it
> >   working would be a significant amount of work
> > * The way KVM PR works means it's very fiddly to get right, so it's
> >   unlikely to ever be suitable for production work
> > * Depending on host and guest cpu models there might be a few corner
> >   cases it can never get exactly right
>=20
> Out of curiosity what are the problems with KVM-PR on POWER9 currently and

I don't know entirely.  My point is that I've never had the time
and/or interest to investigate (and to my knowledge no-one else has
either).  The biggest is likely to be that PR also needs to emulate to
some extent the guest CPU's MMU.  That means adding support for the
POWER9 radix-MMU, which would be avery large job.  There are probably
other problems as well: I vaguely recall that if you attempt to boot a
kernel, the first problem you hit is a new-in-POWER9 privileged SPR
which PR doesn't emulate.

> what are the corner cases that it can never get right?

Well, I'm not certain they exist (at least in a way that can't be
worked around) - but I'm not certain they don't either.  In particular
behavioural differences in userspace (i.e. MSR[PR] =3D=3D 1) between host
and guest CPUs couldn't be handled by PR (since it wouldn't get the
necessary trap to emulate).  Those are rare, of course, since the
architecture is pretty strict about user mode behaviour, but I can't
swear that none exist.  There are certainly new non-privileged
instructions that have been added, but it might be possible to work
around those (trap the illegal instruction and emulate if guest has it
and host doesn't, hope the guest doesn't rely on the 0x700 trap if
host has it and guest doesn't).

Or of course you could have a big matrix of host/guest CPU userspace
compatibility, but that in itself is not a trivial job.

> This info may be
> useful for those interested in fixing and using it and having it listed h=
ere
> may save time debugging some known problems.
>=20
> Regards,
> BALATON Zoltan


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--YS1tjK9cKwt0tTDt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEtd2wACgkQbDjKyiDZ
s5Jczg/5AZK/Ybkr1qANqVns5fykP6Kr53wObx4w9fknjRmgYzIiu/JqB8ES3pHD
N78S7X7vExM95azbfbW2rJkqcM4HZ+vBfhS88oSQJa9hSH8KMh+/V7F1iRnugcuJ
pCcdA/n4Xu+Ste6Au7HknlTYncZ+a6cbJmH1vTYWg4+TqD/TVU/CK/wsQVrVepds
jtXNQwBfvE7PKb5bbTTn7Iby2TfJ5+z0xtcWhZEtOGMRjiKgY+xFj20rBLkT4h4w
wj6NhiSIjDImCc4i1Lz1ZcrpwTaBHQyaX9QH4x5AptrLBa56IpvKWV2OAbxE89/L
VLKVfk9PLptLcRIy1A9YjMboMtnRZKeIJtvA6fSSEa1K/oHZzclJxH4Oq6HRFGeA
Xy7YASwEWs6fc1qgy0eRqrDQQsoyAF2GwjxPppVhhUyyzj9DbqPJ9c0r4VjSjX1J
C9CtM4vKKlkHSnHBBWiClImiiEyUtmjlMV2ujsiI3SvDm6H7awHiLVaaTfk/MblB
zdMnAhtCBfDN/ZZRpNro6PSkJ4ENLSxb/OkZvaQlZOl1bOmt8BEg6G3JWa8zHFPn
JY4+W5LGcPR5O7jfxCRamOAf+bC6vryjgK3aiYgWGfmDNA3GohOaFUfxip9MJMbn
y8JVSceQTsBXFUwn8qGitUUwzWX08X6ySMLCgt3udyWXm4cxYRY=
=5RtA
-----END PGP SIGNATURE-----

--YS1tjK9cKwt0tTDt--

