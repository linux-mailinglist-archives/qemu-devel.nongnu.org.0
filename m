Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0354A41FA0C
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 08:19:13 +0200 (CEST)
Received: from localhost ([::1]:32996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWYMa-0000kb-BR
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 02:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mWYHY-0007fT-1A; Sat, 02 Oct 2021 02:14:01 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:56359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mWYHV-0005y4-Ah; Sat, 02 Oct 2021 02:13:59 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HLxWC2rysz4xR9; Sat,  2 Oct 2021 16:13:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1633155223;
 bh=T03u0y09I8sU/aWod3xcxl0QZwPZ5jzJ9qVqZpCzTb8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j1S36sWZhyV+WyNmG4eKduQ412cA8DYS6Qyf8b89+ABYcZsqoSRrSBnBIJGXUhWeH
 11QhsYqdFXjr21uTgI3dCAvQXYlfgr5OXK2fTddbV1Qxi5MnSleVhi1Gi7CM68p88Q
 5XCaKaVmkssRm+ZzPikcCkcfziQ99Q1Er9m8lzO8=
Date: Sat, 2 Oct 2021 14:35:44 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/3] dtc: Update to version 1.6.1
Message-ID: <YVfhoE1H9zJoHFcC@yekko>
References: <20210827120901.150276-1-thuth@redhat.com>
 <20210827120901.150276-4-thuth@redhat.com>
 <7004c933-5262-3119-80f5-722a8e858046@redhat.com>
 <YVbQERWD9fY0kxxW@redhat.com>
 <CAFEAcA8PdNEHU2YMGT56bCwezf9i+BGxijwevLJakrR_N1Yjhw@mail.gmail.com>
 <YVbYavVeV/OmYON6@redhat.com>
 <9e3620ce-4a79-da2c-aaf1-20832622c576@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CtqrD5SHFPPLy0Ox"
Content-Disposition: inline
In-Reply-To: <9e3620ce-4a79-da2c-aaf1-20832622c576@redhat.com>
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--CtqrD5SHFPPLy0Ox
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 01, 2021 at 01:41:04PM +0200, Thomas Huth wrote:
> On 01/10/2021 11.44, Daniel P. Berrang=E9 wrote:
> > On Fri, Oct 01, 2021 at 10:37:51AM +0100, Peter Maydell wrote:
> > > On Fri, 1 Oct 2021 at 10:10, Daniel P. Berrang=E9 <berrange@redhat.co=
m> wrote:
> > > >=20
> > > > On Thu, Sep 30, 2021 at 09:10:12AM +0200, Thomas Huth wrote:
> > > > > On 27/08/2021 14.09, Thomas Huth wrote:
> > > > > > The dtc submodule is currently pointing to non-release commit. =
It's nicer
> > > > > > if submodules point to release versions instead and since dtc 1=
=2E6.1 is
> > > > > > available now, let's update to that version.
> > >=20
> > > > Most of our supported platforms don't have version 1.6.1 available.
> > > >=20
> > > > As a general goal IMHO we should be seeking to eliminate bundling of
> > > > 3rd party modules that are commonly available in distros. We've
> > > > carried dtc for a hell of a long time, and if we keep updating our
> > > > submodule we'll keep relyin on new features, and never be able to
> > > > drop it because it will always be newer than what's in the distros.
> > > >=20
> > > > So personally I think we should never again update dtc and capstone
> > > > modules. If we want to take adbantage of new features, then do that
> > > > through conditional compilation, as we do for any of the other 3rd
> > > > party libraries consumed.
>=20
> I basically agree, especially for capstone. But for dtc, that also means
> that we cannot compile certain target boards if its not available ... tha=
t's
> somewhat more ugly than if there is just a missing backend feature ... bu=
t I
> guess it's still ok. Users could always install a recent libfdt first.
>=20
> > > I agree in general, but (per the commit message here) our dtc
> > > submodule is currently pointing at some random not-a-release
> > > commit in upstream dtc. We should at least move forward to
> > > whatever the next released dtc after that is, before we say
> > > "no more dtc updates".
> >=20
> > Yep, if we want to fix it onto an official version tag, that's
> > OK, just not jumping right to very latest version.
>=20
> That was the intention here. Accidentally, the first release tag after the
> commit that we are currently using, is version 1.6.1, which also happens =
to
> be the latest version, too.

Note that while I think this is a good idea, there's no real stability
difference between official releases and any random git commit.  I
tend to make releases when somebody complains that there's a new
feature or fix they want that isn't yet in a numbered release.  They
don't get any additional testing beyond the build-in make check which
I also run on every commit.. and which is generally fine, because the
coverage is pretty good (a rather contrained problem space makes that
relatively easy).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--CtqrD5SHFPPLy0Ox
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFX4Z4ACgkQbDjKyiDZ
s5L6/Q/5AQQv7fdicFHTTVzoa2xZEwm9xron/98P5yEHGAvFyiCajSN8a9et14KG
i399FKzn3mQ4hnvKaFceIoeVUBU1/ie+XQfVxf6v0QWlhzAuGimsW0Igv6IMFxA6
oq2AIPx99IyBlDXIHWALasZDlExNH4nYO3rZDJwlJQLVgaCU7N5oWvek3G/mmzo3
Dr663uinXfaKCC/+aDKod/TZLi2QCY/j25mZbwJkZD8qXZckYgqFPDQ7QMaQxDMw
Izf1l6eu4fGpBuaxT081/dnOQeV2iy8LpQQgm67NKTB5knT4gGEMH7cOmZq2N45L
LLDtQtbfecbOpE/jpl/4VJqfHVSwwBl6ehP+vOw9GqRdLxKab18nRRFKenYPyXQ1
yMXNcAFKnQFdmVocehHkUFqjMIDZbMKcj/ezfpcwAV91hdU/GY+jmpRy+AhAbFd8
24zm+n2FXF+GLVLDx6pyCFHPcBnz5UGmir2T15TLUBct2wt926cj6McqCKEiRsoX
1RRMHN94P2n8hG1uyKbYene4XzYLnpDRAaNnCA06T1G2IkLd00VdqqI6rZ7WGBc7
BN7yCec+SfggEriKigsrvurlzgALALUfKYE3ItYd3WT9KWW86qzG5FZ5Tr3Ven8R
9IMOWXBMVIIXOL4+thhH/3GUOaLiv6f7tFGi5Xsq09WG/xqnQKc=
=FWPS
-----END PGP SIGNATURE-----

--CtqrD5SHFPPLy0Ox--

