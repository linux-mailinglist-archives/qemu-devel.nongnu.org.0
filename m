Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5838F3E9C0C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 03:49:17 +0200 (CEST)
Received: from localhost ([::1]:51206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDzqO-0002MJ-1S
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 21:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDzjZ-00085j-7A; Wed, 11 Aug 2021 21:42:13 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:38475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDzjW-0000xs-KW; Wed, 11 Aug 2021 21:42:12 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GlTvK2tZJz9t5H; Thu, 12 Aug 2021 11:42:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628732525;
 bh=OI60lSRlrb0O5leiV1SD4CZEiCZdO2O5jfaBkWMA4vk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XFMPPZmF6wYgWic6Ig2j4r1hZ1l2qe00scN9mMlgPEkxPhChtAdUIvna2pndfwHe2
 9JUY29wQTJ6ylQ5BRYGzCFC4ldULdP+wy3RgZA/RBgzIidx9IShSh7GxbUHRDWimC2
 rsOkae+wM8UDy81pvB4khPUZXgQFtR70j6+zZZE4=
Date: Thu, 12 Aug 2021 11:40:05 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/acceptance: Test powernv machines
Message-ID: <YRR79WcXu7SDmfJ/@yekko>
References: <20210810083346.730652-1-clg@kaod.org>
 <CACPK8Xc5J3tgtv3Z4ZxpR_r3BDaXJvt3mcxSqjyAtTYa+nQA-w@mail.gmail.com>
 <cca773c4-cf08-2fbb-9d9a-26f2fcfa6a34@kaod.org>
 <e14f8f87-8110-4084-94a6-ce09713f3fd2@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DFWLuz1kFMJabNFS"
Content-Disposition: inline
In-Reply-To: <e14f8f87-8110-4084-94a6-ce09713f3fd2@redhat.com>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--DFWLuz1kFMJabNFS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 11, 2021 at 11:07:31AM +0200, Thomas Huth wrote:
> On 10/08/2021 11.09, C=C3=A9dric Le Goater wrote:
> > On 8/10/21 10:36 AM, Joel Stanley wrote:
> > > On Tue, 10 Aug 2021 at 08:34, C=C3=A9dric Le Goater <clg@kaod.org> wr=
ote:
> > > >=20
> > > > Fetch the OpenPOWER images to boot the powernv8 and powernv9 machin=
es
> > > > with a simple PCI layout.
> > > >=20
> > > > Cc: Cleber Rosa <crosa@redhat.com>
> > > > Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
> > > > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > > > ---
> > > >   tests/acceptance/boot_linux_console.py | 42 +++++++++++++++++++++=
+++++
> > > >   1 file changed, 42 insertions(+)
> > > >=20
> > > > diff --git a/tests/acceptance/boot_linux_console.py b/tests/accepta=
nce/boot_linux_console.py
> > > > index 5248c8097df9..da93a475ca87 100644
> > > > --- a/tests/acceptance/boot_linux_console.py
> > > > +++ b/tests/acceptance/boot_linux_console.py
> > > > @@ -1176,6 +1176,48 @@ def test_ppc64_e500(self):
> > > >           tar_hash =3D '6951d86d644b302898da2fd701739c9406527fe1'
> > > >           self.do_test_advcal_2018('19', tar_hash, 'uImage')
> > > >=20
> > > > +    def do_test_ppc64_powernv(self, proc):
> > > > +
> > > > +        images_url =3D ('https://github.com/open-power/op-build/re=
leases/download/v2.7/')
> > > > +
> > > > +        skiboot_url =3D images_url + 'skiboot.lid'
> > > > +        skiboot_hash =3D 'a9ffcddbf238f86cda4b2cae2882d6bd13cff848=
9109758a4980efaf154f4a29'
> > > > +        skiboot_path =3D self.fetch_asset(skiboot_url, asset_hash=
=3Dskiboot_hash,
> > > > +                                       algorithm=3D'sha256')
> > >=20
> > > What's the thought that led you to using this instead of the one that
> > > gets packaged with qemu?
> >=20
> > Good question.
> >=20
> > I considered that the skiboot.lid shipped with QEMU was somewhat a defa=
ult
> > to make things work. The official released versions are the ones used by
> > the outside world on real systems and were a better target for tests.
> >=20
> > That said, using the default version might be enough. Maintainers, plea=
se
> > advise !
>=20
> IMHO:
>=20
> - We want to test the things that *we* ship
>=20
> - We want to download as few things as possible, since downloads
>   often slow down the tests and break CI runs if the network to
>   the download site is not available
>=20
>  =3D=3D> I'd prefer to use the internal skiboot.lid unless there is
>      really a compelling reason to use the external one.
>=20
> Just my 0.02 =E2=82=AC though.

I agree 100%.  If the internal skiboot isn't the "real" one, then we
should update it to something that is.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DFWLuz1kFMJabNFS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEUe/MACgkQbDjKyiDZ
s5KTHRAAtLKR0Md3VvFzOo/Ez7AEIauGPpT0Y6jTz+9Ja8JHw6DdBDMIU8J8Hb3f
a4Qq/5lIVfyXAUwz/8PY6Zr0DVvoENT/K3BGHxCh7oLplKyfgW320DCH4ylmUVhH
v4/Ha3+36A201C+PCPrSXPpiXPp34+4dxsm+767xjZ68q4w3nXucl8IKyqXdCqGZ
rFYnpbSpQiMwqPJTxLxDw+z9gOFYSxTp4XMAtngCJHdeUFBqC910ZGHZydzygHRJ
1tUYXVsfSPhoUqqxlTs1bGtkuhFx14fTKmiyOlvIgQiTjg7VppIVqYtVsUotljcE
j9RErB38ofAe8vhXSOP85k4e2dpqrlzlte3XhhDAxsyd7+ujnPLnFHeEMloWglU3
8hXY+jm7guod/PsaQDg92Kbfb4UYEOU6pte7a/hx/NOZr1dytS38mfjWPOXjYLta
+apUWG6l2yKKhoqrR1tq3UbtmNUyC7U/tJqKGHgXNiNl0P/ze2EsNkUlWQjwgiab
hsDSy/u2uNxmcdxaNBodG82tIFYvOshijXUZoth4d2IgmoD0m5en1KSXQLgK7xGU
E24CtJfBGt0dRL+Z9RcALn9GGMKNmWKDpcPWPRBSESH+hwBQ/4FldWMzSnHOApG8
DrCoYxWWjyx/y35TaOun9rOb929EM0cQq05tlwED3x42UdaFI1A=
=+R4J
-----END PGP SIGNATURE-----

--DFWLuz1kFMJabNFS--

