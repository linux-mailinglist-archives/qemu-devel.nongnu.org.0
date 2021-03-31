Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F0434F8B6
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 08:26:47 +0200 (CEST)
Received: from localhost ([::1]:38040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRUJR-0004bu-KX
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 02:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRUGZ-00038p-AK; Wed, 31 Mar 2021 02:23:48 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:59847 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRUGW-0008Bc-6A; Wed, 31 Mar 2021 02:23:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F9GTw25f0z9sW4; Wed, 31 Mar 2021 17:23:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617171812;
 bh=esNa0VDIb/MFssp42TUra8JOJaeJg7hKihrnw8heaYo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mtCqHJTiZ5oE4cGuFd1A8zc7fX9f0eeRJcreMXV2qMGM4IsJCyHogB+3QSBixO+gc
 ycuQae5v84Q1OwsBX1g51TTwXXCebVTm+OmkbI1VmU7Gc/ChIXLhywUtWB52yR1bPq
 KzXMFMj9pOxGp2L4rkPQIGpFoWFFkNj/RDJRBRmc=
Date: Wed, 31 Mar 2021 15:47:26 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v5 02/10] target/ppc: Disconnect hflags from MSR
Message-ID: <YGP+3m96lwZrMxwU@yekko.fritz.box>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
 <20210323184340.619757-3-richard.henderson@linaro.org>
 <YFqBtsijRRcEBB/k@yekko.fritz.box>
 <20210329150522.1b00607d@bahia.lan>
 <d0221e19-6c8b-6cc3-c4aa-2d5fff4ecb8b@linaro.org>
 <YGKvDOCtfbj0avYF@yekko.fritz.box>
 <c368bcc2-3aa0-608e-c596-b7c9df1923e3@linaro.org>
 <YGO9oklIrjN7O0f2@yekko.fritz.box>
 <20210331060427.16984110@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="I2d91hviQJiBss5n"
Content-Disposition: inline
In-Reply-To: <20210331060427.16984110@bahia.lan>
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
Cc: Ivan Warren <ivan@vmfacility.fr>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--I2d91hviQJiBss5n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 06:04:27AM +0200, Greg Kurz wrote:
> On Wed, 31 Mar 2021 11:09:06 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Tue, Mar 30, 2021 at 08:01:13AM -0700, Richard Henderson wrote:
> > > On 3/29/21 10:54 PM, David Gibson wrote:
> > > >    B) Just the hflags patches from my / Richard's tree
> > > >       https://gitlab.com/dgibson/qemu/-/pipelines/278497244
> > >=20
> > > Look closer at this one -- it's an s390x test that's failing:
> > >=20
>=20
> I've been seeing errors with s390x as well in CI but I couldn't
> reproduce locally... and of course, now it seems I cannot
> reproduce locally with ppc64abi32 either :-\

Huh.  Well supporting the idea that the issues I've seen on gitlab
were just bad luck, I've now gotten a clean check with the hflags
patches... bug only on my ppc-for-6.1 branch.

The ppc64 bug that Greg was seeing still makes me nervous, as does the
failures which we saw at one point which showed that new hflags assert
explicitly failing.

Since the hflags stuff is of moderate complexity and is a bug fix,
it's not a regression fix.  So, I'm going to postpone that until
ppc-for-6.1, and move ahead with this PR without it.

Richard - the remaining possible problem with the hflags stuff seems
to manifest with the assert failing in the last patch.  However, I'm
guess that's just exposing some more subtle problem introduced by an
earlier patch.  Any chance you could re-order the series to insert the
assert near the beginning, which might give us a better way of
bisecting if this shows up again.

Greg, if this shows up again for you locally, can you please try to
track it down.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--I2d91hviQJiBss5n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBj/t4ACgkQbDjKyiDZ
s5LHyRAAljufOxBYgRerpN6lrxtjhicz4m4LNfSleGiOVpQj9h1vq+f7b3J5pcnV
ByaMs2OU8aWZ0XGa69CFXwNR/P4YlJiJF1MVmp5C0UUp4eunvd2nBBSUJtlpyVhZ
fgv0o7WoqFeciqNA8dg+JlPVZvVnbY3OjntFZE5UYqQKMYvcURBu13YyHtc9A1m9
u+YnUWnWM1P2b/JNF4ktkYifRsOQIIE7D8tDrYmWK19KcGuF5qHv3GNsYp1o57a1
mSg6oMfM/LcOpGrPhS55taCY/SArupgfwB5G9GosHWj6Z6x78spek2wnbH5uB3fK
0tIOmM7L0a7jABw0QFSTybNHBUZb4/WDysggZKZxIdTp+OGqXwuThaSTkd+nn7Nx
ohlyMiSZ6Wjgyhce0idjYB+XvUz0/GFNUZyxNAdvjIPk7nSulMNF68E48NeGScKm
TL5YPi2t2xWZ1Dff00tLiScQRQ4IupgyNHaZHLfNQ6XqiZ0ha1mHvaki3I80DQvY
uWaX0aCZvBf/Y8F9THNF6UH3fMDs2ZkDgqo9ivQfidf7Pp4UtztTEThmY11Rx839
5EsyT+iujONOWnaa1pj9tH9CqerOy9tjRrupK4UPSgtOR8CL9XvTfa22bf/Tyxh8
V4oP3+fp0ooHCfwy/52QEvUrL5ag1ZwpO9eMg2y0mPezi4VTieE=
=rxPe
-----END PGP SIGNATURE-----

--I2d91hviQJiBss5n--

