Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1694137F20C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 06:25:04 +0200 (CEST)
Received: from localhost ([::1]:37048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh2uE-0001c1-It
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 00:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sM-00079k-EP; Thu, 13 May 2021 00:23:10 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:60627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sK-0004NY-0G; Thu, 13 May 2021 00:23:06 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fgdms0yTbz9sXM; Thu, 13 May 2021 14:22:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620879773;
 bh=Te9ec4iGZxp8T4h7vb9gyOs+3YGEQdu4WyMCmuauiS8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KdBD29YvGg12KqM7gztQSTpLzHn10GqwQSmCEM7OzQXyhpqkEcVLk4GQyfiYogpcu
 O0iM1AKLZLQ5iDwnJjBkc+vbwtTbMx8qiC4YKdZkmSkexq+gpHFMaj9N0G7h3/kRL6
 YpF+fCh45Jd/2GFkCteMW+zif5xM/HphpGBddJYM=
Date: Thu, 13 May 2021 13:46:02 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 4/5] hw/ppc/fdt: Drop dependency on libfdt
Message-ID: <YJyg+h7NC2ktmHSx@yekko>
References: <20210511155354.3069141-1-philmd@redhat.com>
 <20210511155354.3069141-5-philmd@redhat.com>
 <YJs938JVdO5SRYSs@yekko>
 <ead2acca-d3da-89e5-52f6-e8ae14f6e85f@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MG7yO6xuDdpxT3kY"
Content-Disposition: inline
In-Reply-To: <ead2acca-d3da-89e5-52f6-e8ae14f6e85f@redhat.com>
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
Cc: Thomas Huth <thuth@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--MG7yO6xuDdpxT3kY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 09:59:00AM +0200, Paolo Bonzini wrote:
> On 12/05/21 04:30, David Gibson wrote:
> > On Tue, May 11, 2021 at 05:53:53PM +0200, Philippe Mathieu-Daud=E9 wrot=
e:
> > > hw/ppc/fdt.c defines the ppc_create_page_sizes_prop() function,
> > > which is unrelated to the libfdt. Remove the incorrect library
> > > dependency on the file.
> > >=20
> > > Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> >=20
> > This is definitely wrong as it stands.  AFAICT this doesn't add a
> > build of hw/ppc/fdt.c anywhere, but it is definitely needed by both
> > pseries and powernv machine types, who select FDT_PPC for this exact
> > reason.
> >=20
> > I will grant you that it is badly named.  It is in fact related to
> > libfdt, just rather indirectly.
>=20
> The patch makes sense in general.  The file is only needed for pseries and
> powernv, not for e.g. e500 which does need fdt.

Yes, agreed.

> I would get rid of FDT_PPC completely.  First, before patch 3, you can mo=
ve
> fdt.c to PSERIES and POWERNV (it's too small to need its own Kconfig symb=
ol)
> and only leave
>=20
>    ppc_ss.add(when: 'CONFIG_FDT_PPC', if_true: fdt)

Uh... why do we need even this?

> Since you are at it, remove the silly #ifdef TARGET_PPC64 in the
> hw/ppc/fdt.c file.
>=20
> Then in patch 3:
>=20
> - add to Kconfig.host
>=20
>     config FDT
>        bool
>=20
>     config LIBFDT
>        bool
>        depends on FDT

Um.. I'm not sure what semantic difference you're envisaging between
FDT and LIBFDT.

> - for all the boards I listed in my review, add "select LIBFDT" in additi=
on
> to "depends on FDT".
>=20
> - add to meson.build
>=20
>     softmmu_ss.add(when: 'CONFIG_LIBFDT', if_true: fdt)
>=20
> Paolo
>=20
> > > ---
> > >   hw/ppc/meson.build | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
> > > index e82a6b4105b..580e6e42c8a 100644
> > > --- a/hw/ppc/meson.build
> > > +++ b/hw/ppc/meson.build
> > > @@ -3,9 +3,9 @@
> > >     'ppc.c',
> > >     'ppc_booke.c',
> > >   ))
> > > -ppc_ss.add(when: 'CONFIG_FDT_PPC', if_true: [files(
> > > +ppc_ss.add(when: 'CONFIG_FDT_PPC', if_true: files(
> > >     'fdt.c',
> > > -), fdt])
> > > +))
> > >   ppc_ss.add(when: 'CONFIG_FW_CFG_PPC', if_true: files('fw_cfg.c'))
> > >   # IBM pSeries (sPAPR)
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--MG7yO6xuDdpxT3kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCcoPoACgkQbDjKyiDZ
s5LUiw//Xb937yqe6v0S1lfxaEdU0KzNoH5mShSfIyimA0Sg91KB0aE7z1+Z1oiF
CEcq1ha4gHsDbMwDJAq9R5JO4E40K4ac6pU9qHAL2azXE+WcwupJxqDv6Yb2uB3l
T8YqFvgUYzZ97m0Ac0JVl+mQlw2EuRjzG/tyd1O7d4njl9HpzLKmkwVoRAWt18lE
JpgFIumGhUEiDwDlgbQC1t//edNK83vUdsoLJj28938E52fdBABU1s5nE8vglosR
3rF6Upu1qmr5ghUpNCSiiIjjuegepGgyhI3qBY2Yn7lxuaOcFVubv+7EXuh9Bs7g
evTH+kgp76/jjxkwEYGbgwFTmMMOX64tVwhgJM2YRHrEPdxBbrj7k0J46WTwiJXe
Ij3S7Uqzl68MuHoNYydYEEHB0ciXo8bAWa7ulkF99afoJlIzhkyNFIS1Xctubum/
vCaupm4LBZsD7TLKrfKo0LySjnBPBJGC7U1jbhefZmpLOx9+iutV0K/q4j5t1zRJ
XO3LmHNsDklg52I8KiTJto7GlQRFSZyvfuiW8h3VU3Ti3oypT4DaMHLF+HsZb6qB
SQtX53yMDxg7LflH7qNHRUObXLnAPukPkNqL/VsLQOoMeE4k6alca9alFhBFsKZP
ENhq7Zb+0EijxsY4wwfaOtHASvgale4Pk2JzcEBGJEMjdLjmIGw=
=YxDS
-----END PGP SIGNATURE-----

--MG7yO6xuDdpxT3kY--

