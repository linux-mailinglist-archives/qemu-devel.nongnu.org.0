Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870F440F687
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 13:09:12 +0200 (CEST)
Received: from localhost ([::1]:35638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRBjz-0003DQ-Fw
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 07:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mRBej-000107-1a
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 07:03:46 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39441 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mRBeg-0002Jz-5J
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 07:03:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1631876617;
 bh=CwhAEdJBND6aVKDuMYACTXqkgvp+cwmWT1bdm1mWDIk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R1gOxTN5o2fCYvjud8mfasimmY30bDl78FOKHj1quDm/eEUJSlrBFC9inzmKNfeAH
 8Bb+05fsLVI7m4HuA1r7czoO6WThOnO7udyCcwUc332HmDV4Js01/6lA+MVh4/dlf9
 uEUn+nqtViEtt8ljpU9XZggofDj1a0VSTDAI5LlY=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H9rfd5YxMz9sRN; Fri, 17 Sep 2021 21:03:37 +1000 (AEST)
Date: Fri, 17 Sep 2021 21:03:34 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: Rust in Qemu BoF followup: Rust vs. qemu platform support
Message-ID: <YUR2BjppxkBo8mD0@yekko>
References: <YURYvaOpya498Xx2@yekko> <87k0jfh88i.fsf@redhat.com>
 <CAJ+F1CJJvqVQrG5iPXV2s7oLbduHfAhHs0pHdZ8XbxLkNi42VQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="H6fcbcTbWPaz6kDV"
Content-Disposition: inline
In-Reply-To: <CAJ+F1CJJvqVQrG5iPXV2s7oLbduHfAhHs0pHdZ8XbxLkNi42VQ@mail.gmail.com>
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
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--H6fcbcTbWPaz6kDV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 01:54:22PM +0400, Marc-Andr=E9 Lureau wrote:
> Hi
>=20
> On Fri, Sep 17, 2021 at 1:19 PM Cornelia Huck <cohuck@redhat.com> wrote:
>=20
> > On Fri, Sep 17 2021, David Gibson <david@gibson.dropbear.id.au> wrote:
> >
> > > Hi all,
> > >
> > > At the qemu-in-rust BoF at KVM Forum, I volunteered to look into
> > > whether Rust supported all the host/build platforms that qemu does,
> > > which is obviously vital if we want to make Rust a non-optional
> > > component of the build.
> > >
> > > I've added the information to our wiki at:
> > >       https://wiki.qemu.org/RustInQemu
> >
> > Thank you for doing that!
> >
> >
> Yes, the condensed coloured matrix is much more readable than the Rust lo=
ng
> list. I wonder if they would also adopt it :)

So, in this case we have the relatively small matrix of qemu supported
build OSes by qemu supported build ISAs.  For the Rust page there's a
much larger list of OSes, and a somewhat larger list of ISAs.  Or
larger still since it's really ABIs they're listing there rather than
just ISAs.  And lots of that matrix would be missing for all the OSes
that only support a handful of ISAs.  So I think trying to do it as a
matrix there would get pretty unwieldy.

> > > TBH, the coverage is not as good as I expected.  Linux, macOS and
> > > Windows are pretty much ok, with the exception of Linux on Sparc.
> > > There are a lot of gaps in *BSD support, however.
> >
> > Yes :(
>=20
> Can we say reasonably that QEMU is supported on *BSD other than x86 (and
> aarch64?), I wonder. Maybe we should consider moving those under the
> unsupported rank.

Yeah, that was my first question as well.  I included it all since the
qemu page doesn't qualify the list of OSes/archs, but I did wonder if
anyone is really using obscure archs with a BSD.

> > Do we actually have an idea what we would require? I'm surprised that
> > there are so many targets without host tools or without std support (but
> > maybe they are only missing small things.)
>=20
> For sparc 32, it was added to support Gentoo at that time which didn't
> switch to 64-bit yet (https://github.com/rust-lang/rust/pull/48297)
>=20
> For the past 2-3y, Gentoo sparc is now 64 bit. (like Debian apparently for
> a while)
>=20
> But apparently, by lack of CI it was downgraded to Tier-3.
>=20
> Is it reasonable to officially drop support for sparc 32 in QEMU
> too?

As a qemu build arch I would say probably yes.  As a qemu *target*
arch, probably not.  Qemu targets aren't really relevant to this
discussion, but I'm clarifying since if someone sees "XXX arch support
in qemu" without context they'll probably think of target arch before
host arch.

> > > I've included some notes on where the information comes from, and some
> > > uncertainties in there.
> > >
> > > I've made an effort to get the information correct, but double
> > > checking would be appreciated.
> >
> > I did not spot any errors on a quick cross check, but I'm not really
> > sure about what the BSDs support.
> >
> > >
> > > I haven't yet looked into the packaging situation for the Rust
> > > toolchain on various platforms and distros, but I still intend to do
> > > so.
> >
> >
> >
> I would share our wiki page on r/rust if you don't mind, as there are
> various people that can help us fill the gaps I think.

Fine by me.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--H6fcbcTbWPaz6kDV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFEdgYACgkQbDjKyiDZ
s5KKdhAAlAXfpx1QKry/AI8mphhmreowiqq4ACbBy2NoPJ0Rq56uwMiU2w0M/TEZ
oElSn894kkmRxAYCHKs4rbGUViUK8jifze18fBeDvvdvje/DdcAACO/Rr9eix9ut
nx2dTZKD6rcMUvgknPVPnuEsYJ0d+VwKVP5Ogq5FlRsOCvxcVQ+oFzvR9Yb9bbW+
WgXwaqTcObOl9B7lUKjK0FkCQNNoaroBVYETCKNanGLRE6aqyPBMYMtUkX00RUQl
toZmnyqolWlQmRbKfkCbs2DmgV/k0D6w0jCvTcZ9AwP0lte/UWx7vxwHJRu4Pppx
TCYEeQyj6oFwPUNzwrajfKMSS67O94KjgZFW5Fd97Pl+NZPfFJjlDLrGV1fKmPJc
/Fi4EqGj4iUM6+j4dFFBUrgHI8GRwc4AJUyoFdshWDahluP6fS3XaXPVCrOsfQ/d
YxAsIckT0+OpTxDlnaGJY7VyuzUoN6JRydfMYg2pfFks7EdlKGx+LZx6JwoaNi9K
MMtItBMNkznXw7kZRuywkwftO88oFct9v6zCiyAN4cwN1ptST+T26qW3kJXfyV7j
Za55pq/ixyzi2y0IJ4qWgx3iARbDl6PNq+ukzES0u/HWMDoIZV3Hq7VWbhyaB94Q
mAZG7QNtjt5r/OfMIVunD7kBgRANcPX3eiV3xtAz0yBZS44wf5I=
=I0oF
-----END PGP SIGNATURE-----

--H6fcbcTbWPaz6kDV--

