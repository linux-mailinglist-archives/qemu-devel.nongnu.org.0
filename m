Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 248903FC025
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 02:52:31 +0200 (CEST)
Received: from localhost ([::1]:57470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKs0r-00049w-Ho
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 20:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mKruE-0001el-5C; Mon, 30 Aug 2021 20:45:38 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40933 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mKru8-00051c-MR; Mon, 30 Aug 2021 20:45:37 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Gz7lB3sjVz9sRN; Tue, 31 Aug 2021 10:45:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630370726;
 bh=N9ARYRzPxVDrc+XcYxH/jUinks22k51MEmxCy9B6/8o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FuHzA1uEmk8KQpH/txK2JJxsxNec7dAu/XSuATk8sbuZ0sBAYWbgqqWtyVVInNopM
 RQDW8vR0/pTSnDF1MZxpduFwWUzxAX1KLTQ8mzktsCaYr+YAA2T5kCMNs4kzNLO7lY
 5k+Nr0Ml5zXyj/udXUMsAMbO2y6Axd3mx0j9pXwk=
Date: Tue, 31 Aug 2021 10:45:21 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Subject: Re: QEMU-KVM offers OPAL firmware interface? OpenBSD guest support?
Message-ID: <YS17oUzgIY0TIjzT@yekko>
References: <HgtFZEnabNjIrsVI3x8MYs2QYSCG4IFStP0MR3qwPWBmXW9kDmQmIwQEWHMVdJbUCu-XvHdMpZGe3pr-B91s1D7y6cn9SVzhxEYms5c3p0o=@protonmail.com>
 <20210827180259.3720d58d@bahia.lan>
 <56141ff67838992a@bloch.sibelius.xs4all.nl>
 <20210827190053.6c68def5@bahia.lan>
 <25bfa81c-9498-4e82-a848-1fbb1c188ff1@kaod.org>
 <561422a20e4f9ae2@bloch.sibelius.xs4all.nl>
 <51bff28d-4779-b023-fee6-b3e9196b7ec5@kaod.org>
 <3QoYEEZauH3xXwC2NcJFnrHe4IaWwu2fqEvtR6tR3RHsY_b0bsyz0oQdcI0b1zdwnXbXhl6bCtaUiyWQjbYgnx5U-Ov_Lm3tMGdMkTwZC88=@protonmail.com>
 <YSyBUSxBiH+UYE/Y@yekko> <20210830160431.GC61714@kunlun.suse.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Da6Gjm0t0DXHydxn"
Content-Disposition: inline
In-Reply-To: <20210830160431.GC61714@kunlun.suse.cz>
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
Cc: pjp@centroid.eu, gardask@gmail.com, rgcinjp@disroot.org, daniel@pocock.pro,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 kite@centroid.eu, Joseph <joseph.mayer@protonmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 siliconbadger@protonmail.com, qemu-ppc@nongnu.org,
 "ppc@openbsd.org" <ppc@openbsd.org>, Mark Kettenis <mark.kettenis@xs4all.nl>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Da6Gjm0t0DXHydxn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 30, 2021 at 06:04:31PM +0200, Michal Such=E1nek wrote:
> On Mon, Aug 30, 2021 at 04:57:21PM +1000, David Gibson wrote:
> > On Sun, Aug 29, 2021 at 04:09:54AM +0000, Joseph wrote:
> > > Hi Mark, C=E9dric, Greg at the openbsd-ppc ML,
>=20
> >=20
> > So.. if you want to run OpenBSD on POWER10 you will definitely need
> > PAPR support, because POWER10 won't support bare metal OS access at
> > all (it will be back to PowerVM always, like POWER5..POWER7).
>=20
> Hello,
>=20
> what is stopping powernv support other than lack of firmware
> support?

The virtualization features of the CPU simply aren't designed to do
full virtualization, only para-virtualization (which is what PAPR
is).  A guest in the POWER model is *aware* that it doesn't have
hypervisor privilege, but a powernv OS expects to have hypervisor
privilege.

I don't know that it's strictly impossible to provide a virtualized
powernv environment.  Specifically, it might be possible to take an
approach similar to KVM PR at a higher level: run the guest in
supervisor mode, but trap and emulate all hypervisor privileged
instructions.  However, I'm not certain that all the things that need
to be trapped do in fact trap, it would require a bunch of careful
research.  Even if it's possible, it would be a big job: essentially a
completely new KVM implementation.

> Doesn't PowerVM use teh very same vrtualization features that KVM
> does?

Yes, that's exactly the point.  The (para-)virtualized guest
environment provided by both PowerVM and KVM is PAPR (the "pseries"
machine type in qemu terms).  "powernv" is the bare metal,
hypervisor-privileged, host environment (that's even where the name
comes from "POWER Non Virtualized").

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Da6Gjm0t0DXHydxn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEte58ACgkQbDjKyiDZ
s5I+RxAAxy/flmcF+SM88zIhn/4uAkBk/YVtloFHi1ZtinCxDlt6sCTOJfh/7VQc
tz07nqoE34uTblwbw1bi1LDYsP8YcCA1O5IK0tXqGJE9XfwHy1Oi5lNUTfU8lupF
62vWiLPyglXcZGcYuw4fpe0tU5aKQIgveIL7fYM3LRMN4dezW/QxhZDNrdPHsb1b
+IUzuAZ0662lbBAAUfCFU5fXwhegMzQ2WN51DvFSl06i05746eCRa0PfHcZVVYXz
PpqIOExxiYK4k93tDnDppK/z4w9kfmooWPhHlq7tgn6twHL5TBy2tN10ID0LgkR0
x83jNz5sBM0l6nTFQx7yWfRVWD6om4tSbcLDeO3zYjlrgBvzqDAPGNhEZlNOPqrp
ind1DK5jHgcGTdiL5bKVKvxil0RNIsImdUnrsGmCDUYHeOhB/SdNnkExs0IudiGF
emshdICFoch54I69kyBF/FOEuyVRhtO6C+CmiHnOQAsinrDBiHrKmpsBRJUV28Jl
4sxDIEPm8Laat4uP6bp9rf8T5HjG2ZhqISOl8xlZ1x+yg5jRUkC3KHLqWlrJyO1O
jm+IP/y0RhS9jl+AyIRELBPQ29or5PElbP++Z34sGBWvN5MbbJ4xdILqxuSbXji8
I/oPd0ZadvYvUGh8q3dr6TuIzXMYt/EW0MWMEkOrEAVvqeci4Kg=
=UwvP
-----END PGP SIGNATURE-----

--Da6Gjm0t0DXHydxn--

