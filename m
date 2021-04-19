Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7217936399C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 05:09:06 +0200 (CEST)
Received: from localhost ([::1]:54902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYKHZ-0007an-0x
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 23:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYKGN-0006qs-RA; Sun, 18 Apr 2021 23:07:51 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58043 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYKGL-00051d-Sn; Sun, 18 Apr 2021 23:07:51 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FNsFD2tT7z9vFg; Mon, 19 Apr 2021 13:07:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618801664;
 bh=d+Xa0ZclWhI9lnfInhVHvRiV4xBLA9Ar1Y3wOC532rE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FTi+zYkM1rcS4RMs8Zx8eG75AptBsXi5WaZ86dA3/0aw0N6ZmN/d46dv6C9YJee/j
 Qoj+ULg3pwRaWoLXpdNltpl3Osh7UlNUFFW9NF1b6pk6H95ZLgeIaCehJuSxDoqrdN
 Gj65j8S9wx0E+4mATptu3USem7DQNBAzhIf+KJ7k=
Date: Mon, 19 Apr 2021 11:14:30 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Subject: Re: [RFC PATCH 0/3] tests/tcg/ppc64le: paddi tests
Message-ID: <YHzZdqK4zeeaz2fh@yekko.fritz.box>
References: <20210415214138.563795-1-matheus.ferst@eldorado.org.br>
 <YHkJ52c/ysoS00qk@yekko.fritz.box>
 <338d679e-6619-4f60-5620-24de3ed3bf6d@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RxAfEhJzqKi5IYqc"
Content-Disposition: inline
In-Reply-To: <338d679e-6619-4f60-5620-24de3ed3bf6d@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: thuth@redhat.com, gustavo.romero@protonmail.com, qemu-devel@nongnu.org,
 wainersm@redhat.com, f4bug@amsat.org, luis.pires@eldorado.org.br,
 qemu-ppc@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--RxAfEhJzqKi5IYqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 16, 2021 at 11:13:48AM -0300, Matheus K. Ferst wrote:
> On 16/04/2021 00:52, David Gibson wrote:
> > On Thu, Apr 15, 2021 at 06:41:35PM -0300, matheus.ferst@eldorado.org.br=
 wrote:
> > > From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> > >=20
> > > Based-on: <20210413211129.457272-1-luis.pires@eldorado.org.br>
> >=20
> > First things first: it's unclear to me if this is testing stuff that's
> > already merged, or it's speculative tests for the in-progress prefixed
> > instruction stuff.  i.e. If these tests are applied right now, will
> > they pass?
>=20
> GCC-10 images can be used to test already merged Power10 instructions, su=
ch
> as brh/brw/brd, but I haven't writen tests for them (yet?). Both tests are
> targeting paddi, whose implementation is in-progress, so applying them now
> will fail. Maybe I should split the series? Patch 1 for now, and Patch 2 =
and
> 3 when paddi are merged?

That sounds reasonable, as long as patch 1 does *something* visible
now (e.g. running existing tests with the new compiler).

>=20
> > > This series adds gcc-10 based images to enable the build of tests wit=
h Power10
> > > instructions. Then two tests for paddi are added:
> > > - The first one checks a weird behavior observed on POWER10 Functiona=
l Simulator
> > >    1.1.0, where the 34-bit immediate is treated as a 32-bits one;
> > > - The second one exercises the R=3D1 path of paddi, where CIA is used=
 instead of RA.
> > >    The test is failing with the current implementation because we use=
 cpu_nip,
> > >    which is not updated all the time. Luis already has the fix, it sh=
ould be
> > >    applied on the next version of his patch series.
> > >=20
> > > The main reason to submit this patch as an RFC first is the docker pa=
rt. I would
> > > lie if I tell you that I understand half of what is going on there.
> > >   - 'make docker-test-tcg' fails, but apparently on unrelated things;
> > >   - 'make docker-run-test-tcg@debian-ppc64el-cross' passes, but it lo=
oks
> > >     like the test is skipped?
> > >   - 'make check-tcg' runs the test and passes (with the fix in place =
for the
> > >     second).
> >=20
> > What sort of host was that on?  Unfortunately 'make check-tcg' has
> > been broken on a POWER host for some time, and I've never had time to
> > look into it.
> >=20
>=20
> I'm testing on amd64, but I can also try on ppc64le.
>=20
> > >=20
> > > Finally, get_maintainer.pl found no maintainers for
> > > tests/tcg/ppc64{,le}/Makefile.target. Would it be Mr. Gibson?
> >=20
> > Uh... sorta?  I also don't know much about what's going on here, but
> > I'm probably maintainer by default.
> >=20
>=20
> So, should I update MAINTAINERS in this series?
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RxAfEhJzqKi5IYqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB82XUACgkQbDjKyiDZ
s5JEWA//e+aylgEZGA4akUdiCkR4xt3O0nbntbZGsghCknsHU9/OSOd16VaBanPI
uGUSQAPiwxk6sSOKcUm8+nsX2A5H4urCW8rDIXwyd2hSMrq7yd6fcmZaKLHI4yzl
t5XUEbjDbFAzHe9UTNcLNn5OxkgKeVsPzw1zPLXkC2N12af+cUOGlgqoJ0AMW68A
pk4bCeEUtZNjbwtExGInysH6AI0LVkkF2MGowr2WDEJlPkY4srUgZlR9LJAgM5mu
yTKBjQ3qM6447W+I0ZTPsqA0oxXU55dprp2gnXXx+UEpMH+BcmvPx1LNmNjd3KLU
BCJzLP3i5e38hlax0tucQPFTmKm+pgjVOD8qH79Ywciq5u9UNGCrD5QDGqxxdS12
y4MIq25xDPPPyJfxpnxo1XmOsGRamhMTZdIubvSqqoMaShGodzG6Bt+s0tj0sY4i
a6uEVkDrZ8jhjmwtRYDSiut26R+COisNfU6hh2bnKLwI/gfodm+cmzPHK8zPGqnp
CpFYCC3mk+0d+AqiNg+zJe10phgEMQwRA/vOdVodHJ73kkoXB7huJ4kftcI+uo9p
n/5Y3o9jRGsZt+1MCtPRKCPnmi3nO/3x8aINakz9oGWwBQ6ieeZIbfgtY9LQKCVZ
V0swrGm2gptpcKOY0BXMD1TDiFbaCp3zDDd+JCXpwmz1oJsDk5g=
=IPTA
-----END PGP SIGNATURE-----

--RxAfEhJzqKi5IYqc--

