Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF91A653AC2
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 03:44:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8BYH-0000Kp-SL; Wed, 21 Dec 2022 21:43:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1p8BYF-0000Jx-0i; Wed, 21 Dec 2022 21:43:19 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1p8BYB-0002im-B2; Wed, 21 Dec 2022 21:43:18 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4NcvkM2kCVz4xZ3; Thu, 22 Dec 2022 13:43:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1671676987;
 bh=CudkdyXg3Kzs84QGZmym5+9Cet4eXEofqXLDPdK0cUQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NcZ4WPkBvw0Ji2oKGF7VBdF4x6hTJ+jc9L9nhVKfNdPPW8TzmY1cKA/3LMkRsfRYu
 s5uau9ayGq4OF8DzuevEbcjzFb5IKlRe0F8aTZjYUVtJhX87mQooESyOoxp9mjipfU
 c8ZuEsf7r7/cq2LeHqUEVrPYTPO37xynE0fmixjQ=
Date: Thu, 22 Dec 2022 12:57:44 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-ppc@nongnu.org, kvm@vger.kernel.org,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Greg Kurz <groug@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH-for-8.0 4/4] hw/ppc/spapr_ovec: Avoid target_ulong
 spapr_ovec_parse_vector()
Message-ID: <Y6O5mL60bGnwiHgO@yekko>
References: <20221213123550.39302-1-philmd@linaro.org>
 <20221213123550.39302-5-philmd@linaro.org>
 <c871b044-4241-2f02-ebd6-6b797663a140@gmail.com>
 <5f70da81-2854-766f-1804-59a037a605b8@kaod.org>
 <7c67f0e8-f7b7-8d0d-ba72-06cd2c8d29d3@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="e3Ed+WV8hTo8PG4H"
Content-Disposition: inline
In-Reply-To: <7c67f0e8-f7b7-8d0d-ba72-06cd2c8d29d3@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--e3Ed+WV8hTo8PG4H
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 21, 2022 at 10:26:51AM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 12/21/22 06:46, C=E9dric Le Goater wrote:
> > On 12/16/22 17:47, Daniel Henrique Barboza wrote:
> > >=20
> > >=20
> > > On 12/13/22 09:35, Philippe Mathieu-Daud=E9 wrote:
> > > > spapr_ovec.c is a device, but it uses target_ulong which is
> > > > target specific. The hwaddr type (declared in "exec/hwaddr.h")
> > > > better fits hardware addresses.
> > >=20
> > > As said by Harsh, spapr_ovec is in fact a data structure that stores =
platform
> > > options that are supported by the guest.
> > >=20
> > > That doesn't mean that I oppose the change made here. Aside from sema=
ntics - which
> > > I also don't have a strong opinion about it - I don't believe it matt=
ers that
> > > much - spapr is 64 bit only, so hwaddr will always be =3D=3D target_u=
long.
> > >=20
> > > Cedric/David/Greg, let me know if you have any restriction/thoughts a=
bout this.
> > > I'm inclined to accept it as is.
> >=20
> > Well, I am not sure.
> >=20
> > The vector table variable is the result of a ppc64_phys_to_real() conve=
rsion
> > of the CAS hcall parameter, which is a target_ulong, but ppc64_phys_to_=
real()
> > returns a uint64_t.
> >=20
> > The code is not consistent in another places :
> >=20
> >  =A0 hw/ppc/spapr_tpm_proxy.c uses a uint64_t
> >  =A0 hw/ppc/spapr_hcall.c, a target_ulong
> >  =A0 hw/ppc/spapr_rtas.c, a hwaddr
> >  =A0 hw/ppc/spapr_drc.c, a hwaddr indirectly
> >=20
> > Should we change ppc64_phys_to_real() to return an hwaddr (also) ?
>=20
> It makes sense to me a function called ppc64_phys_to_real() returning
> a hwaddr type.

Yes, I also think that makes sense.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--e3Ed+WV8hTo8PG4H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmOjuZEACgkQgypY4gEw
YSJDeA//ZjZ49AyGlSmymeaAd5ZDdavOON2pCJ11rEOOVppGLLDZBFLVdOO/sG2t
BPQ5j0Du2t8wtNu6ELojxewz7be36Ga9svFHq+O4xOXFUWW7ENNcOBM4ecwZfAp0
FfVgbjttVDHBzCDbGy/mEXC62KeR+RdbbOFExQ97ZPPKc9Mo937X9/L9/2W/QzL1
hnToe2VrdDt9XAUMMynnLDut3G/W1SeqWT5IFFKJI0smglpeGFEVNHnnSy0jkxh7
itSPeOMsXrX6LNI5LaADinMcquKwqfK2J9poWr7WaeOJkC2aru9cbGKN998DqBAe
e6MYkGHrLgwXNL1x4deNXpT2Iho5B2N1gaAjv/dBi2fhbAeJFYo6Y873Zw0CRAEy
pwcruBjNLjJaAh2/0N4LpXpKoVatbY8W3aHvhD9eqa1IUGwxxy69tn7EFtOo9mjy
zvcAwwXjWM6GfYOuscmcRMf2llS6/Xr3/Udz6iIO/BUlEDd0X3ywAEmNn7ka+V+i
5cLF6T/tmUJ7gjmH/EW9Et5C24P0c/BuOakeA7g91EDHzU0BGRja04BrgciaE2/x
VqC2rHbm07N/h+RIbk8S1tye2pXaxex5kmFvxF4HB+42CDQlUvKeXTyYjIZbxBpi
R3RBdRPqVqMjSWt4Mh5I3LFtve9njSDa5F7nN/Bn5CA4oNIezfs=
=fANF
-----END PGP SIGNATURE-----

--e3Ed+WV8hTo8PG4H--

