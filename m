Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A62410F3B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 07:10:53 +0200 (CEST)
Received: from localhost ([::1]:34198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSBZs-0003lP-4O
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 01:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSBWg-0002NF-G0
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 01:07:35 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:36489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSBWa-0008Gx-8B
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 01:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632114436;
 bh=CD+8NZcYY6GaHF66BPWX5mfulSkLUnto73wqly56k1Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=moMmcdO0E/Gt3EnuMS59aI983uUGP2OEvvRMXsdAK/ATIYYJ+TyBYnAwn7KoL1oPA
 eiA3MYn4ST0H88ok+0WAKW9PCKyhaKmbYzI/adzL09+wrBKuLWX41lichJidwXhzf5
 Nu+SFCaxpmfwuyXGC+Ns6stBaH/4AAN7hrrylxMU=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4HCXc45wgWz9ssP; Mon, 20 Sep 2021 15:07:16 +1000 (AEST)
Date: Mon, 20 Sep 2021 13:43:49 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: Rust in Qemu BoF followup: Rust vs. qemu platform support
Message-ID: <YUgDdSa4qCgxdJ3c@yekko>
References: <YURYvaOpya498Xx2@yekko>
 <YUR9RXXZ4lSRfcyB@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HGLFj1CArKLNkYhW"
Content-Disposition: inline
In-Reply-To: <YUR9RXXZ4lSRfcyB@redhat.com>
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
Cc: peter.maydell@linaro.org, slp@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, f4bug@amsat.org, hreitz@redhat.com, stefanha@redhat.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
 sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--HGLFj1CArKLNkYhW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 12:34:29PM +0100, Daniel P. Berrang=E9 wrote:
> On Fri, Sep 17, 2021 at 06:58:37PM +1000, David Gibson wrote:
> > Hi all,
> >=20
> > At the qemu-in-rust BoF at KVM Forum, I volunteered to look into
> > whether Rust supported all the host/build platforms that qemu does,
> > which is obviously vital if we want to make Rust a non-optional
> > component of the build.
> >=20
> > I've added the information to our wiki at:
> > 	https://wiki.qemu.org/RustInQemu
> >=20
> > TBH, the coverage is not as good as I expected.  Linux, macOS and
> > Windows are pretty much ok, with the exception of Linux on Sparc.
> > There are a lot of gaps in *BSD support, however.
>=20
> To me the coverage looks pretty much what I'd expect to need
> for QEMU - almost all boxes that I'd want to see green are
> green, except OpenBSD, possibly x86 32-bit for *BSD and
> sparc(64) on Linux.
>=20
> Mostly it highlights that we've never explicitly declared what
> our architecture coverage is intended to be. We do check host
> arches in configure, but we didn't distinguish this by OS and
> I think that's a mistake.
>=20
> In terms of our CI coverage, the only non-x86 testing we do
> is for Linux based systems.
>=20
> Although its possible people use non-x86 on non-Linux, I don't
> recall any discussions/bugs/patches targetting this situation,
> so if we do have users I doubt there's many.
>=20
> Would be interesting to hear input from anyone representing
> interests of the various *BSD platforms about their thoughts
> wrt non-x86 coverage.
>=20
> I think our first step is probably to make our architecture
> support explicit, regardless of our use of Rust.

I agree.  Currently
https://qemu-project.gitlab.io/qemu/about/build-platforms.html lists
build OSes and build architectures separately, which kind of implies
the full matrix - but I don't think we really want to support that, so
I think we should pin this down more precisely.

> If we assume QEMU followed a similar 3 tier policy, on the QEMU
> side my interpretation of what we're implicitly targetting would
> be:
>=20
>  Linux:  all arches with a TCG target
>  macOS: x86_64

+ aarch64, since that's on the way.

>  Windows: i686, x86_64
>  FreeBSD: x86_64  (maybe +i686 too)
>  NetBSD: x86_64  (maybe +i686 too)
>  OpenBSD: x86_64  (maybe +i686 too)
>=20
> with tier 1 vs 2 for the above depending on whether we run
> 'make check' in gating CI)
>=20
> That isn't to say that other combinations don't work, but if they
> did work, they would be at most Tier 3 from QEMU's POV.

Makes sense to me.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--HGLFj1CArKLNkYhW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFIA3UACgkQbDjKyiDZ
s5IMtxAAvc7OBtgsLtXhLu6cTeJ3dVxH+Wq5z5GOTG4AwUuc1GM2SI4Kge1dfJCO
3OqKIbr8QqR5cDZbejd+HYgXjUv6YeetNGSEYaFde3QJmg6mdPXV13QA5V368aT1
yhDyyR+OX4MRZGHUY09i060Q24ZtMCB8lZX65kEZSwduvaAmeDCV3+PdYnbHW/O2
3IsORs7jy1KhCvoMHcv/PUDtZiDjJGStv2jvYVlRZCfwz5O/SI9xq4Q4/pJTXnVR
LNN2q7AYhiC25JB6fedZsZdsTVjk7+mqmKZ4n7qoGsDmyMq2rWYkRKhTJVIUNN6G
xD4Dr5HFoqqE3OYQ4OSLViNJFY7gMF7i7PedWYiVgDFGjsJmj5EGdxJ2FSi+GqpI
URTAbdtiy1hJ/kCHOAX7DcwFrP6VY7OpsHk564n2h1nEMtzMEJIJyEnh4v7saK10
0cGR61kItDXFnJnfoddtzygEWog5eqdx4gLti6nwnei376xWTpiiJryfTdKAaQKX
0SQazVyMnCOLb5MzA6Ozqfu+Ki3gPzl7iJ76JiPzVMzF4b73vH92GV5jssXYNlhZ
DK5Qr0snYlwHqaUViQlnrmnBf0Kk2lNR52g+tNbaT3WfsaHPEkmZjhAjNnHwJ89T
Ykw0nR06RL4tKVa7waTr0IsuOWCrhIiZ4KbYm3BUHep2aVawt6c=
=9LEK
-----END PGP SIGNATURE-----

--HGLFj1CArKLNkYhW--

