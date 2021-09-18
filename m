Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 657C3410437
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 07:41:51 +0200 (CEST)
Received: from localhost ([::1]:53844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRT6k-0004sL-Ac
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 01:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mRSyD-0002Ss-2U
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 01:33:01 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:60817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mRSy7-0005qJ-75
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 01:33:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1631943170;
 bh=LU/GF3KPlejxPGvcIV2OIyj8nYFbXCnQoreDqdOzMn4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D0FHYhyysC3XzM/hVmJel1tfOvIWStg2qrwnRjrjHkunyVULfRuIPnqXfxDLn5qU5
 pmyAgo+O7ZZ/EHgOh81FWyvIw6FvoZZ+CmIQ6xGQ59zidFXCSg6q0pGwz197yUT9mu
 92sqTXofYcnzwmsxbRRID5NSTVvnbgE6bupyYC1I=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4HBKGV1G70z9sRN; Sat, 18 Sep 2021 15:32:50 +1000 (AEST)
Date: Sat, 18 Sep 2021 15:28:41 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: Rust in Qemu BoF followup: Rust vs. qemu platform support
Message-ID: <YUV5CWwomyckJVIN@yekko>
References: <YURYvaOpya498Xx2@yekko> <YUR9RXXZ4lSRfcyB@redhat.com>
 <YUS7TUQ11WtyqCMf@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dlbemnZWWEA8AJxy"
Content-Disposition: inline
In-Reply-To: <YUS7TUQ11WtyqCMf@stefanha-x1.localdomain>
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
Cc: peter.maydell@linaro.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>, slp@redhat.com,
 cohuck@redhat.com, qemu-devel@nongnu.org, f4bug@amsat.org, hreitz@redhat.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
 sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--dlbemnZWWEA8AJxy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 04:59:09PM +0100, Stefan Hajnoczi wrote:
65;6402;1c> On Fri, Sep 17, 2021 at 12:34:29PM +0100, Daniel P. Berrang=E9 =
wrote:
> > On Fri, Sep 17, 2021 at 06:58:37PM +1000, David Gibson wrote:
> > > Hi all,
> > >=20
> > > At the qemu-in-rust BoF at KVM Forum, I volunteered to look into
> > > whether Rust supported all the host/build platforms that qemu does,
> > > which is obviously vital if we want to make Rust a non-optional
> > > component of the build.
> > >=20
> > > I've added the information to our wiki at:
> > > 	https://wiki.qemu.org/RustInQemu
> > >=20
> > > TBH, the coverage is not as good as I expected.  Linux, macOS and
> > > Windows are pretty much ok, with the exception of Linux on Sparc.
> > > There are a lot of gaps in *BSD support, however.
> >=20
> > To me the coverage looks pretty much what I'd expect to need
> > for QEMU - almost all boxes that I'd want to see green are
> > green, except OpenBSD, possibly x86 32-bit for *BSD and
> > sparc(64) on Linux.
> >=20
> > Mostly it highlights that we've never explicitly declared what
> > our architecture coverage is intended to be. We do check host
> > arches in configure, but we didn't distinguish this by OS and
> > I think that's a mistake.
> >=20
> > In terms of our CI coverage, the only non-x86 testing we do
> > is for Linux based systems.
> >=20
> > Although its possible people use non-x86 on non-Linux, I don't
> > recall any discussions/bugs/patches targetting this situation,
> > so if we do have users I doubt there's many.
>=20
> macOS on Apple silicon is a non-x86 non-Linux host platform that is
> currently receiving some developer attention. Luckily
> aarch64-apple-darwin is in Tier 2 with host tools.

Yeah, I was figuring macOS on aarch64 would be important with macOS
moving to ARM.  But as you say, that is ok in rust.  Not so much
"luckily" as that being a consequence of it being a fairly active
platform in general.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--dlbemnZWWEA8AJxy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFFeQkACgkQbDjKyiDZ
s5Ir9RAA2R+GLNeLYVrZlP9cQWDjF39D9tC89uEvkKt9rs133LIxeFUBkIXHVsMt
D1siMPtbLn9D/FpaBGMDLWGehTEuNaqP9m26rB/Z4CLhQPmi3rkeBOI27cwbWzcc
hubAwHB3LN79lugjKl45dFBNdmXABJlI97ycK+OX+DAW3navI2Tn+XuWM+RUjHiq
GnXPI2rCvCCZqgm7lsxOdVrpj+Hueq7tU8buqcDUAWGT6lguGiNrpnlCbvVBLkTF
zP82eNlx6hTfxMsMpgPIVdRnGvN1YnxDv9CX1I3kJRYgdwKXp28l1FDUAEo2+Gnd
zqK93CXg19irM+dPj0DjZ55ZdpusVuwZd7BevLEq+1yA8nCcAXhBVm+w9eLKFNDP
cPHeIG2jHjRGqDAhwXZJOm1I9e+PoFnkbqhMu5u/n9uePn7Q8hD5zaI11EC20SxE
+VUoHi/pgycQO176cea8RD1qrzY8i4H1ZQU9q/ZvU2IQu8jZgcRMVp6zW+r91KB0
ZjUdK7/J4o6KZGKAT0Hoz1zFSNHs4JSagcMN6Bn+cznNFCg9wbMX8X79Fz10V+cI
ALOGICfKh+ZBnrHq1GAXgLfChBcZiJekMmFR9vqK5Cyxfp+R62OeEyNi4KAg88ft
3swggTtjJzjHejWyE7q1LwilcSe2V72Z1Jt+JL3icDjBdbzdf6A=
=RN69
-----END PGP SIGNATURE-----

--dlbemnZWWEA8AJxy--

