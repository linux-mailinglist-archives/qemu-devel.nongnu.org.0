Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C98E410434
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 07:36:04 +0200 (CEST)
Received: from localhost ([::1]:51624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRT18-0003Cc-LT
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 01:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mRSyC-0002Sj-5i
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 01:33:00 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:55203 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mRSy7-0005q6-DJ
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 01:32:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1631943170;
 bh=+MTyllj8JNkt5mdIdOpsmOq70bwR12NWZZYBfCL4RuI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nGJu3oq/jvryZweAKG9j5bHFcP3SnTzDz+6ewOr3+haYv5dElHNYaMC6zgn+JD57d
 njiyiG+fzzvK/OgyIjBJ/5NO0pnY1d/5TROMA7p+f8Krrl3d6fqdF0hs+Z63dWuXUI
 KDzJGfB1qwyGnUTMCoBELa/V+7t7dOio+h9g9NLk=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4HBKGV0cc1z9sX3; Sat, 18 Sep 2021 15:32:50 +1000 (AEST)
Date: Sat, 18 Sep 2021 15:25:28 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: Rust in Qemu BoF followup: Rust vs. qemu platform support
Message-ID: <YUV4SDIFjpvIfmX1@yekko>
References: <YURYvaOpya498Xx2@yekko>
 <CAAdtpL5W9eztLiPSu=goROh8eHMn+7BLUuKaEfukcVrKCEAtXg@mail.gmail.com>
 <YUS6kp0l7eiHt/fu@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NgGe6oOgRT5lgLhZ"
Content-Disposition: inline
In-Reply-To: <YUS6kp0l7eiHt/fu@stefanha-x1.localdomain>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Sergio Lopez <slp@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, hreitz@redhat.com,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--NgGe6oOgRT5lgLhZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 04:56:02PM +0100, Stefan Hajnoczi wrote:
> On Fri, Sep 17, 2021 at 01:11:56PM +0200, Philippe Mathieu-Daud=E9 wrote:
> > Le ven. 17 sept. 2021 10:58, David Gibson <david@gibson.dropbear.id.au>=
 a
> > =E9crit :
> >=20
> > > Hi all,
> > >
> > > At the qemu-in-rust BoF at KVM Forum, I volunteered to look into
> > > whether Rust supported all the host/build platforms that qemu does,
> > > which is obviously vital if we want to make Rust a non-optional
> > > component of the build
> > >
> >=20
> > Could user mode emulation be impacted by this decision? What code used =
by
> > user emulation could potentially be converted to Rust?
>=20
> qemu-user does not have the same security requirements as qemu-system,
> since the application is running under a given uid/gid on the host
> system and can invoke system calls.
>=20
> I think the benefits of Rust in qemu-user would be more around
> expressiveness (language constructs like pattern matching, traits, etc)
> and correctness (memory leaks, concurrency, etc). Both benefits might
> motivate someone to write parts of qemu-user in Rust, so I guess the
> answer is "all of it potentially could be converted". It's impossible to
> know until someone contributes patches.

Right.  It certainly could be used there, but I don't know it's the
most promising or interesting area for it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--NgGe6oOgRT5lgLhZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFFeEYACgkQbDjKyiDZ
s5IjJxAAgKv2l9ZQIX5+JP7xeaxyn+OdMgeSb+C9WNLh2DrWarN9vuHO2afFW0vG
GQPAs7bbMYeVgL4/pzGERdCXcM7+vLaPy4yYyaPamZ/ohMCM+gyQJjYnG+5ZJY3M
L+LBkTyY42INXut0cjffNMLYPxT9m+0JvRntfhUbjGzM02lAC5fqcjS+Uk8lWKOH
bzPJhCeBoV/RiTIhjiw8dbpVlbnTBmtOpNYJGIGdQR5rGGPad1r6l0zN+1VvRz9y
AF7S5NnIzDol9vDod/aqlapXcOHMWWMZ2brFa1XbdbOrlbpvU6lTXjkktEutfpCU
fheaEHuRB0SElweo6FnElv6BIxFunkV1FdeUAFJrg7qzI8GYEfQ8IZ8LLcW1Gttl
l/FUOLfVRRWLADuDBNeoG2UyIk56EqCQIqX0Gx89IUH6vGFGbytndDK0tNuOdJ5t
nHrS1kZ5J7AtdwpUWin0Xjl3GIyda/PAe6JqXaTxayaSlEGYQBQ6qHUDbxY1BfuW
cq9d7KfK4oCpdkBjyJP9rG2pvbFzXxKuu5Z0BniEHj+Lq6nUhRBTM9yCnsEuMs4U
EkOybOdXwV31qy08jvif5mTxnbdqfr7DMv18mZytPBqBXJzOwARPGeFvZ+sDQDJp
PYFWLm39bB2prhm+YhKls3qxJ1BqHmV5+8qy/GyvG9yzWjKKeCk=
=Ft80
-----END PGP SIGNATURE-----

--NgGe6oOgRT5lgLhZ--

