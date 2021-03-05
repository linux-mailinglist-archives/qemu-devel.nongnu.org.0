Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE8F32DECC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 02:10:02 +0100 (CET)
Received: from localhost ([::1]:37686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHyye-0004nP-1F
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 20:10:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lHyw7-0003eb-QO; Thu, 04 Mar 2021 20:07:23 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:36577 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lHyw5-0001GE-Ai; Thu, 04 Mar 2021 20:07:23 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Ds8ht1v5Nz9sW4; Fri,  5 Mar 2021 12:07:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614906430;
 bh=s0wRZu0/+tuLPWzvmvXeXIjTSXu2BPLEFslkvWH9Euc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GEJtH2zfPI4na1IS1CE06PgWyOgpzAvrGA0mnkNV5pUwZc71Xcgfniig6gFgfI6zE
 tDl7DbQNYuPpB7Xrviw1D9pH4PubxJVfYxan1uvDMHkkcTpZtZ0H8D5qjamrF79/sy
 TIu6SQ5oJPQ4+04QW2KDax/4RsJoVKZ04LBHmNXc=
Date: Fri, 5 Mar 2021 12:02:37 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 4/8] vt82c686: Introduce abstract TYPE_VIA_ISA and
 base vt82c686b_isa on it
Message-ID: <YEGDLehnK3Vhp56s@yekko.fritz.box>
References: <cover.1614719482.git.balaton@eik.bme.hu>
 <07df96112b78673ca191f9a4ffa17bf3a11160f3.1614719482.git.balaton@eik.bme.hu>
 <da48a752-9b2d-6cd8-9603-4cc528fea628@amsat.org>
 <11fb7590-89f3-62e7-48e3-d44226876e78@eik.bme.hu>
 <14cc6696-869d-679a-883f-fbcd30fe6ba1@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="H+A5279dMSSaCAQE"
Content-Disposition: inline
In-Reply-To: <14cc6696-869d-679a-883f-fbcd30fe6ba1@amsat.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--H+A5279dMSSaCAQE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 04, 2021 at 11:42:10PM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 3/4/21 9:16 PM, BALATON Zoltan wrote:
> > On Thu, 4 Mar 2021, Philippe Mathieu-Daud=E9 wrote:
> >> On 3/2/21 10:11 PM, BALATON Zoltan wrote:
> >>> To allow reusing ISA bridge emulation for vt8231_isa move the device
> >>> state of vt82c686b_isa emulation in an abstract via_isa class.
> >>>
> >>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> >>> ---
> >>> =A0hw/isa/vt82c686.c=A0=A0=A0=A0=A0=A0=A0 | 70 ++++++++++++++++++++++=
------------------
> >>> =A0include/hw/pci/pci_ids.h |=A0 2 +-
> >>> =A02 files changed, 40 insertions(+), 32 deletions(-)
> >>>
> >>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> >>> index 72234bc4d1..5137f97f37 100644
> >>> --- a/hw/isa/vt82c686.c
> >>> +++ b/hw/isa/vt82c686.c
> >>> @@ -609,24 +609,48 @@ static const TypeInfo vt8231_superio_info =3D {
> >>> =A0};
> >>>
> >>>
> >>> -OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState, VT82C686B_ISA)
> >>> +#define TYPE_VIA_ISA "via-isa"
> >>> +OBJECT_DECLARE_SIMPLE_TYPE(ViaISAState, VIA_ISA)
> >>>
> >>> -struct VT82C686BISAState {
> >>> +struct ViaISAState {
> >>> =A0=A0=A0=A0 PCIDevice dev;
> >>> =A0=A0=A0=A0 qemu_irq cpu_intr;
> >>> =A0=A0=A0=A0 ViaSuperIOState *via_sio;
> >>> =A0};
> >>>
> >>> +static const VMStateDescription vmstate_via =3D {
> >>> +=A0=A0=A0 .name =3D "via-isa",
> >>
> >> You changed the migration stream name, so I think we have
> >> a problem with migration... No clue how to do that properly.
> >=20
> > I don't think these machines support migration or state description of
> > vt86c686b was not missing something before these patches that would make
> > it not work anyway so I did not worry about this too much. I doubt
> > anybody wants to migrate a fuloong2e machine so this should not be a
> > problem in practice but maybe you can mention it in the release notes if
> > you think that would be necessary.
>=20
> Maybe just add in the description:
>=20
>  This change breaks migration back compatibility, but
>  this is not an issue for the Fuloong2E machine.

Hrm.  If migration was never supported, why is there a vmstate
description there at all though?

That said, I don't think breaking compat is a problem: that's only an
issue where we actually have versioned machine types, which covers
only pc, pseries, arm virt and a very few others.  I don't think this
device was used on any of them.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--H+A5279dMSSaCAQE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBBgy0ACgkQbDjKyiDZ
s5JOGhAAhXYFHdJa1nt2jkSBsZDdyIdPZPoh1pfHsJTzOY+auRZLtF1FlpPEcFmN
0tYscy0phijH2hRcq20TqqUHHzx5NxZ9aPEwG4m/+P01E1UtDlb2wjagshVGs4VC
bLDOK4+DBiBpYDIjB4/Yn0aYPyjApDr2foUUO/FaFX79VZBYPkB/ML3DH42tLMnB
39+vX7bOCjBxwG8aGje2E0MMfXdFn9buEARi4RbXhVQGjx/kaBZ71KliRpzmbZvZ
vNYttHPWyPwNs7VL9wfbT+Crsk3lYBU09H5rvzig/TqmV5DSBalMkrjtJVhgYbA9
LfEadVe94yUx624wSIfOFIchy/mLETpThu7tJe9r02COpuIzNUl3gRK0KiNo4JyN
5y2MKjuBwVOHEt6Uwvgr61x8ihUt5s6kx0WSrpfKbzdkbjhTSNaRTMIRS5jlXoWD
WZpVQa9RFp503dkgDGokJRJgmjnYgCSpRJzCPSZ+8QzeDwFJ3WvVbhP5oRjjXYEZ
vu4LBnBMOlftkQwFnSZMLwii4M9H+vNIXzx/uYVB3XOtQoLYUFEdg7HqsevRYA/F
dYc6bhWE8VRaLsdyq6T6brzBTTodQr8prfPbGmnObX47kvO6VuJpycJ5MWyEWhL5
fDya2wEglqlwxAHlIDue4RxmS92TMhdNcP6e/C41TmKJCf7687c=
=aLiX
-----END PGP SIGNATURE-----

--H+A5279dMSSaCAQE--

