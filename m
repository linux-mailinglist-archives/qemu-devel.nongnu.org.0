Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1765E410F40
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 07:14:54 +0200 (CEST)
Received: from localhost ([::1]:39028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSBdl-0007Bn-4g
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 01:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSBWd-0002Mg-3u
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 01:07:32 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:33657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSBWa-0008Gz-5S
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 01:07:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632114436;
 bh=gr5TnMb7uGZ0EzVGJJs9sl/AWdrK5kG3pu1vtwqDX0g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oe/Kxk8liWkOFnErTAsAVtrFmVPzMYYzpAyWdYPvJR2X17uIdoGUf9iSW77dFz4j9
 FV9oOfRRwGUTeqUF7kzOPPEBhbqGcBelgkrB5oCGeceptPeqz3Joql623p8E+KqcnW
 3rGq2qx1jIbJm6segfoKP9iMxQfyVQSw11Ayzy90=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4HCXc45dNmz9sRN; Mon, 20 Sep 2021 15:07:16 +1000 (AEST)
Date: Mon, 20 Sep 2021 13:53:28 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Warner Losh <imp@bsdimp.com>
Subject: Re: Rust in Qemu BoF followup: Rust vs. qemu platform support
Message-ID: <YUgFuFwRKABXnCM8@yekko>
References: <YURYvaOpya498Xx2@yekko> <YUR9RXXZ4lSRfcyB@redhat.com>
 <CANCZdfoezvfO+wKgqwMf7oCO3dAgpJ28RGecnZs31_o3+iUdGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BOgp+Q9xQOy/CSE7"
Content-Disposition: inline
In-Reply-To: <CANCZdfoezvfO+wKgqwMf7oCO3dAgpJ28RGecnZs31_o3+iUdGA@mail.gmail.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>, slp@redhat.com,
 cohuck@redhat.com, QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Max Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--BOgp+Q9xQOy/CSE7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 10:04:50AM -0600, Warner Losh wrote:
> On Fri, Sep 17, 2021 at 5:35 AM Daniel P. Berrang=E9 <berrange@redhat.com>
> wrote:
>=20
> > On Fri, Sep 17, 2021 at 06:58:37PM +1000, David Gibson wrote:
> > > Hi all,
> > >
> > > At the qemu-in-rust BoF at KVM Forum, I volunteered to look into
> > > whether Rust supported all the host/build platforms that qemu does,
> > > which is obviously vital if we want to make Rust a non-optional
> > > component of the build.
> > >
> > > I've added the information to our wiki at:
> > >       https://wiki.qemu.org/RustInQemu
> > >
> > > TBH, the coverage is not as good as I expected.  Linux, macOS and
> > > Windows are pretty much ok, with the exception of Linux on Sparc.
> > > There are a lot of gaps in *BSD support, however.
> >
> > To me the coverage looks pretty much what I'd expect to need
> > for QEMU - almost all boxes that I'd want to see green are
> > green, except OpenBSD, possibly x86 32-bit for *BSD and
> > sparc(64) on Linux.
> >
> > Mostly it highlights that we've never explicitly declared what
> > our architecture coverage is intended to be. We do check host
> > arches in configure, but we didn't distinguish this by OS and
> > I think that's a mistake.
> >
> > In terms of our CI coverage, the only non-x86 testing we do
> > is for Linux based systems.
> >
> > Although its possible people use non-x86 on non-Linux, I don't
> > recall any discussions/bugs/patches targetting this situation,
> > so if we do have users I doubt there's many.
> >
> > Would be interesting to hear input from anyone representing
> > interests of the various *BSD platforms about their thoughts
> > wrt non-x86 coverage.
> >
> > I think our first step is probably to make our architecture
> > support explicit, regardless of our use of Rust.
> >
> > If we assume QEMU followed a similar 3 tier policy, on the QEMU
> > side my interpretation of what we're implicitly targetting would
> > be:
> >
> >  Linux:  all arches with a TCG target
> >  macOS: x86_64
> >  Windows: i686, x86_64
> >  FreeBSD: x86_64  (maybe +i686 too)
> >  NetBSD: x86_64  (maybe +i686 too)
> >  OpenBSD: x86_64  (maybe +i686 too)
> >
> > with tier 1 vs 2 for the above depending on whether we run
> > 'make check' in gating CI)
> >
>=20
> wrt FreeBSD:
>=20
> The main focus of the project is on AMD64 (x86_64) and ARM64 (aarc64). Wi=
th
> ricsv64 being ascendant as well. i386 and armv7 are fading. ppc64 has

That's another good point.  For the architectures with multiple
variants / editions, we should clarify on
https://qemu-project.gitlab.io/qemu/about/build-platforms.html which
ones we support as well: riscv32 vs. riscv64, sparcv8 vs. sparcv9,
armv6 vs armv7 vs aarch64, etc.

> strong,
> but episodic, interest as well. The rest are bit players.
>=20
> i386 (i686 really), armv7 and riscv7 are the next tier of interest in
> FreeBSD
> land. i386 is confined to 32-bit VMs with only a few legacy hardware
> deployments
> still kicking. armv7 is more popular on embedded boards, some of which ha=
ve
> a need to run qemu. riscv64 has a rust port that's being upstreamed, but =
not
> there yet and there's likely interest to run qemu on it for research
> projects.
> riscv64 isn't widely deployed but has a lot of developer interest /
> mindshare.
> sparc64 was removed from FreeBSD 13 and has been irrelevant for
> years.

I've updated my table entry to N/A on that basis.  Thanks for the
clarification, this wasn't obvious to me from
https://www.freebsd.org/platforms/ (it says "Tier 4", without
explaining what that means).

> ppc 32 bit has some minor interest. mips has been fading fast and stands
> an excellent chance of being removed before FreeBSD 14 (which is currently
> slated for 2022). PowerPC 64 is hard to talk about... there's interest th=
at
> comes
> and goes, but when it's around, it's quite intense. It's quite likely the=
re
> will
> be interest to run qemu on ppc64 on FreeBSD, but that's much less certain.

Ok.  That one has Tier3* support in Rust, which is probably good
enough for the informal tier of support it has in qemu.

> So it all depends on what having rust means for those platforms that don't
> have
> it.

Well, working out what we can do with that is kind of the point of
constructing this matrix.

> Would it be a 'half a loaf' situation where the non-rust bits would be
> buildable
> but cool new drivers written in rust won't be? Or will it be so central
> that rust is
> table stakes to even start a qemu build? To be honest, I'm not sure this
> difference
> would greatly affect the above answer :).

I'd say the "half a loaf" situation is pretty much going ahead
regardless.  Whether we're willing to go ahead with making Rust
mandatory for the basic build is an open question, which this analysis
is largely about answering.

> Rust works really well on x86_64 and aarch64 (though there's more often a
> lag
> on the latter of a few weeks). I know of a rust riscv64 port, but that's
> just getting
> ready to upstream. No first-hand or second-hand clue on the rest.
>=20
> FreeBSD tl;dr: x86_64 and aarch64 are must have. i386, armv7 and riscv64 =
are
> really nice to have. ppc64 might also be in that list, but that's less
> certain. The rest
> have little to no relevance.
>=20
> Warner
>=20
> P.S I've been poking at people to get our QEMU aarch64 CI story in better
> shape than it is today... I'll have to continue to prompt those
> interested...

Might be worth talking to the Rust people as well, to see if you can
get a promotion from Tier3 to Tier2.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--BOgp+Q9xQOy/CSE7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFIBbgACgkQbDjKyiDZ
s5J+tQ//QuMysALk8VpqBABLok2xUjisrllmRg3LA4mqYBLHMO+H8y0jYDkwdA9K
jorwvFvFhe0yyEry4qPX5YJ8EwNU6tSZZ/b4AwciCp+VrMDFUGeLiTjmAZxLe0/Y
d1ggK0M3ZfJWhKL8iUNr3biM1P7m6kWLvQ2dxM0rTaYFuxf4o/45nNazvLGyAo8k
TC96uNAHpVJWs9Wshax1FM2vxaF9J72/EkMi926XgM7NoRqhjvsmc8ckHm0KtUZj
Hdy3YnkLBSiRuP88fRMCzeZt+8iCFpOq7OBTC+ODW3C7PozmnnvJSRYqsjeVbkwL
PyPJHSvW3uO09nVhWPFQmT7rrneVWgtj6cGhIA5+vnDjLRfZtIDSp5ws6hVR2EfH
E7esuBlo1DIE1zUouCKbZhTDcBU4Kt6MYIQL9x6Z9ICahVmVuw4WXMLWykVSmK0p
3avNKI75B2jUFOj05y3CQiXFHYB5yMw/qduV7m++12aLEv2xr8GACDX6lcp8548v
Zkymu+YJ2kZ+TG56tPXXRd6qw14laXZCb3RVmdGUMZ+FQ0PpZOkQZrbYNksWK9S4
F2g3bqqo3I3WdlR05dA+ZDp8XgAZKRgXEBH4AvqHeTmzzhUslzIif5jIA2yfNXdL
vOtRRi40tbgTa3/FrzR8Tbq9Z2FzfmqwylVCrW/OPjJqjV9XuAU=
=lMMM
-----END PGP SIGNATURE-----

--BOgp+Q9xQOy/CSE7--

