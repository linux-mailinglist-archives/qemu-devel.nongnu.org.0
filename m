Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FAC3FB1AF
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 09:12:32 +0200 (CEST)
Received: from localhost ([::1]:35452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKbSv-0000Gq-A4
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 03:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mKbEr-0004or-At; Mon, 30 Aug 2021 02:57:51 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:55471 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mKbEo-0008PJ-Uk; Mon, 30 Aug 2021 02:57:49 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Gyh356nygz9sR4; Mon, 30 Aug 2021 16:57:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630306657;
 bh=kIswjZcPbNpVHhhlQHxOlgKRttoIb4mdcKEzfDRzlo0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=grGDyEUNlgk2JDIPkGWuxtstnHihXsmZ0YRKdH5xTcPI358vPGvSAqsiGHrXDkiTM
 qvwcM7sq/XVLKO+3yDpoCOi0o0lQVAAxgZcqQa8SvlPDT1Wm4KplO7wmcTr81LxXkA
 E11nugXsjEVv4OeS23GB1BY5Zd3v6U1QpotlJXIQ=
Date: Mon, 30 Aug 2021 16:57:21 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Joseph <joseph.mayer@protonmail.com>
Subject: Re: QEMU-KVM offers OPAL firmware interface? OpenBSD guest support?
Message-ID: <YSyBUSxBiH+UYE/Y@yekko>
References: <7r8MLHEKQicVkfT4tQLsiRXQmt_800XbV1s0mM_QJTgOY7XadpiRcD4HizmXByPaZRsMQV2WbNKDfKU-PdVo3ZO9JC6fJ0MF5LM_j5a2fgA=@protonmail.com>
 <20210827170113.5f4ed260@bahia.lan>
 <HgtFZEnabNjIrsVI3x8MYs2QYSCG4IFStP0MR3qwPWBmXW9kDmQmIwQEWHMVdJbUCu-XvHdMpZGe3pr-B91s1D7y6cn9SVzhxEYms5c3p0o=@protonmail.com>
 <20210827180259.3720d58d@bahia.lan>
 <56141ff67838992a@bloch.sibelius.xs4all.nl>
 <20210827190053.6c68def5@bahia.lan>
 <25bfa81c-9498-4e82-a848-1fbb1c188ff1@kaod.org>
 <561422a20e4f9ae2@bloch.sibelius.xs4all.nl>
 <51bff28d-4779-b023-fee6-b3e9196b7ec5@kaod.org>
 <3QoYEEZauH3xXwC2NcJFnrHe4IaWwu2fqEvtR6tR3RHsY_b0bsyz0oQdcI0b1zdwnXbXhl6bCtaUiyWQjbYgnx5U-Ov_Lm3tMGdMkTwZC88=@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vq5cOuJQdTdvWDLr"
Content-Disposition: inline
In-Reply-To: <3QoYEEZauH3xXwC2NcJFnrHe4IaWwu2fqEvtR6tR3RHsY_b0bsyz0oQdcI0b1zdwnXbXhl6bCtaUiyWQjbYgnx5U-Ov_Lm3tMGdMkTwZC88=@protonmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: pjp@centroid.eu, gardask@gmail.com, rgcinjp@disroot.org, daniel@pocock.pro,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 kite@centroid.eu, qemu-ppc@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 siliconbadger@protonmail.com, "ppc@openbsd.org" <ppc@openbsd.org>,
 Mark Kettenis <mark.kettenis@xs4all.nl>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--vq5cOuJQdTdvWDLr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 29, 2021 at 04:09:54AM +0000, Joseph wrote:
> Hi Mark, C=E9dric, Greg at the openbsd-ppc ML,
>=20
> It is great to talk to you. Thank you for taking on the conversation.
>=20
> Right, OpenBSD implements powernv meaning it runs on bare metal on
> Power9, that is great.
>=20
> What I wanted to ask about with this thread is:
>=20
> To have the same utility of Power9 as of AMD64, it would be great to
> have a high speed virtualizer, like what OpenBSD's VMM or Linux' KVM-
> QEMU accomplish on AMD64.
>=20
> Linux KVM-QEMU supports Power9 already so that's a great start: One
> runs Linux powernv bare metal on Power9 hardware. Each VM is a
> KVM-QEMU instance.
>=20
> Is there any way today to make Linux-KVM-QEMU as VM host run
> OpenBSD as a high speed (say >90% of bare metal performance, here
> presume KVM uses PCIe passthrough) VM guest -

I'm afraid this is more or less impossible, without adding
PAPR/pseries support to OpenBSD.  The fundamental problem is that the
virtualization facilities on the POWER chip don't really allow
efficient full hardware virtualization, only para-virtualization and
PAPR is that para-virtualized environment.

That's why the "powernv" machine type doesn't utilize KVM and is fully
emulated and therefore slow.  It might be possible to use the
"powernv" machine type with the "PR" implementation of KVM - that's a
KVM implementation which works by running the entire guest in
userspace and emulating all privileged instructions.  But:

 * KVM PR doesn't currently work properly on POWER9, and getting it
   working would be a significant amount of work
 * The way KVM PR works means it's very fiddly to get right, so it's
   unlikely to ever be suitable for production work
 * Depending on host and guest cpu models there might be a few corner
   cases it can never get exactly right
 * KVM PR will never be all that fast, although it will be
   significantly faster than full emulation

> From the discussion I gather it's not possible without OpenBSD being
> extended with pseries mode support, is it so?

Essentially yes.  The situation is different from x86.  On x86 the
bare metal PC platform was the original "normal" one, and then that
platform was made possible as a virtual guest.  There were some
alternative paravirtualized guest platforms (notably XenPV) but they
never really caught on.

On POWER, the paravirtualized PAPR platform was the original "normal"
one, as provided by PowerVM, which was included in the POWER
firmware.  Then bare metal machines became available and the powernv
platform was created.  KVM kept the same paravirtualized PAPR platform
for the guest as PowerVM used for compatibility, rather than inventing
a new one.

> (Great to see that Power hardware is on par with or faster than AMD64,
> so the hardware part of this equation is clearly there: Power10 is
> advertised to be released late this year, lithography will be down
> from 14nm to 7, they say performance will 3x and electricity 1/3.)

So.. if you want to run OpenBSD on POWER10 you will definitely need
PAPR support, because POWER10 won't support bare metal OS access at
all (it will be back to PowerVM always, like POWER5..POWER7).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--vq5cOuJQdTdvWDLr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEsgU8ACgkQbDjKyiDZ
s5Janw//fLfRsJ1fy6bnVfoRmF2P6PA8bYqXK+c/bWDvOxSBS9sGXOaTXQ1K6kbX
3ScOrFnv6XA3cOZwy9gk3pNUPtIwBk39txFMvxXk09h4P/P8IMzwZJdZQFaQBs/R
1c12Yb4o1xw0OS9ZdsFwuJfaN15d17IL093+wWGUgNzps+q989bEOh7DBJyUVJWS
GHsJ6aLZ6Lzb4WIiY6KeSc8hjd2grvuWh0HQR4kdW5/pA1WCgFhL64rTD+HkIXxA
q6+Yusvm+PwPYt+Suz5naq0ifeUcXilJRlBJLonDT7FnyOYWWh3dj6pGwJqTwg3F
0TBzsWE7thVaauEhYqqf7z7NGCdBNHdaQLYDFM0tVPB4Q+tosQxr9O2YaCC/pxEh
DP5pB++OL7vqrgkJG8xG1UhzI3hWCl/I/ppQQEczXqM7onAfkqubJIg+7c6HqlMe
K5pD+TGsFAvOK7KxaozD4hEbAbAn6U+07qgckNDBGLdDUwAhf2oO2cUuYiOVIq1f
rmoFeHE/6lrv/uXUTtLpzTgYYAGjK4zbA5Y+O+ke5QkAkwkLqztTqfzTib2H/Pdm
zNCxE46QsqnWN9qBJIU3p0JkyYWB7tesNVIZ0GR1VJfqHxRf6baZEExxRemWI5VF
PovyTcedP62SFH6NTavBJX0ukE2fPU0N1CqlnitSYckwJZTVdpk=
=sQx+
-----END PGP SIGNATURE-----

--vq5cOuJQdTdvWDLr--

