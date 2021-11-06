Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC95E446CAB
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 06:55:09 +0100 (CET)
Received: from localhost ([::1]:42082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjEfU-0006a4-87
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 01:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mjEck-0005gT-MB; Sat, 06 Nov 2021 01:52:18 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:39559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mjEcf-0007cn-OC; Sat, 06 Nov 2021 01:52:18 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HmRN31Rjfz4xdP; Sat,  6 Nov 2021 16:52:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636177923;
 bh=we8tZVuLsvNQPKYTL4zrt0XiPR5kb6OjPq2mkLAiU4w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H4ecyY6VCoxPql15sHcRh23A/4RNxdFXcg39F6J/FU6/Bll4WEmhDKKI1wTRZ92PD
 eQVIM8ccCaUMdVapoDhJnLA8798TNKKXOO5v7xjPh/OvHuPWrwzxY/H2+wAPsFw/t2
 /R+1pLnM9P/TWmj13UU9TWMRlULBFMS4WuGcQuaE=
Date: Sat, 6 Nov 2021 15:20:03 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH] target/ppc, hw/ppc: Change maintainers
Message-ID: <YYYCcwEuUNGVMKwu@yekko>
References: <20211105034640.53754-1-david@gibson.dropbear.id.au>
 <8e05f98a-6a46-f728-5035-fab10f5a209a@gmail.com>
 <880124b9-5cd1-7fcb-fdc6-3d3f8a1da2b6@amsat.org>
 <91972ce2-8d1f-f22e-c87f-45cb3c221b18@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="D3Q5yqJcQgIm05a1"
Content-Disposition: inline
In-Reply-To: <91972ce2-8d1f-f22e-c87f-45cb3c221b18@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--D3Q5yqJcQgIm05a1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 05, 2021 at 05:05:25PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 11/5/21 16:16, Philippe Mathieu-Daud=E9 wrote:
> > Hi Daniel,
> >=20
> > On 11/5/21 10:48, Daniel Henrique Barboza wrote:
> > > On 11/5/21 00:46, David Gibson wrote:
> > > > As our day jobs and interests have moved onto other things, Greg an=
d I
> > > > have
> > > > been struggling to keep on top of maintainership of target/ppc and
> > > > associated pieces like the pseries and powernv machine types, with =
their
> > > > platform specific devices.
> > > >=20
> > > > We've therefore discussed and plan to transfer maintainership to
> > > > C=E9dric Le
> > > > Goater (primary) and Daniel Henrique Barboza (backup).=A0 C=E9dric =
and Daniel
> > > > have been actively contributing to the area for some time, and they=
're
> > > > supported in this by their current employer, IBM, who has an obvious
> > > > interest in the platform.
> > >=20
> > > Thank you and Greg and Red Hat for all the years of service supporting
> > > qemu-ppc in the community. IBM will shoulder this responsibility now.
> >=20
> > In term of the MAINTAINERS file:
> >=20
> >          S: Status, one of the following:
> >             Supported:   Someone is actually paid to look after this.
> >             Maintained:  Someone actually looks after it.
> >=20
> > The PPC entries have a 'Maintained' status. You say "IBM will shoulder
> > this responsibility", does that mean the entries will be 'Supported'
> > as in "someone paid to look after them"?
>=20
> Yes. It's appropriate to change the PPC entries of this patch to "Support=
ed"
> now.

Good point, I've adjusted that.

> > I wonder because both C=E9dric and you have some commits with an IBM
> > email, but both are registering a non-IBM email as contact. I don't
> > mind the email technical detail, but I am curious about the status
> > and expectations.
>=20
> I had problems using IBM corporate email with mailing lists in the past,
> and started using this gmail account instead. I believe Cedric has a
> similar sob story.
>=20
> FWIW the contrib/gitdm/group-map-ibm file has both our emails there to
> indicate that we're IBM contributors.
>=20
>=20
> Thanks,
>=20
>=20
> Daniel
>=20
> >=20
> > Thanks,
> >=20
> > Phil.
> >=20
> > > > Greg and I do plan to stay around in some capacity for at least the=
 next
> > > > 6 months, providing reviews and advice to assist the new maintainer=
s into
> > > > the role.
> > >=20
> > > I hope both of you stay around way longer than that :)
> > >=20
> > >=20
> > >=20
> > > Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > >=20
> > > >=20
> > > > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > > > ---
> > > >  =A0 MAINTAINERS | 20 ++++++++++++++------
> > > >  =A0 1 file changed, 14 insertions(+), 6 deletions(-)
> > > >=20
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 797be5b366..066c4fb2b0 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -262,8 +262,10 @@ F: hw/openrisc/
> > > >  =A0 F: tests/tcg/openrisc/
> > > >  =A0 =A0 PowerPC TCG CPUs
> > > > -M: David Gibson <david@gibson.dropbear.id.au>
> > > > -M: Greg Kurz <groug@kaod.org>
> > > > +M: C=E9dric Le Goater <clg@kaod.org>
> > > > +M: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > > +R: David Gibson <david@gibson.dropbear.id.au>
> > > > +R: Greg Kurz <groug@kaod.org>
> > > >  =A0 L: qemu-ppc@nongnu.org
> > > >  =A0 S: Maintained
> > > >  =A0 F: target/ppc/
> > > > @@ -382,8 +384,10 @@ F: target/mips/kvm*
> > > >  =A0 F: target/mips/sysemu/
> > > >  =A0 =A0 PPC KVM CPUs
> > > > -M: David Gibson <david@gibson.dropbear.id.au>
> > > > -M: Greg Kurz <groug@kaod.org>
> > > > +M: C=E9dric Le Goater <clg@kaod.org>
> > > > +M: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > > +R: David Gibson <david@gibson.dropbear.id.au>
> > > > +R: Greg Kurz <groug@kaod.org>
> > > >  =A0 S: Maintained
> > > >  =A0 F: target/ppc/kvm.c
> > > >  =A0 @@ -1321,8 +1325,10 @@ F: include/hw/rtc/m48t59.h
> > > >  =A0 F: tests/acceptance/ppc_prep_40p.py
> > > >  =A0 =A0 sPAPR
> > > > -M: David Gibson <david@gibson.dropbear.id.au>
> > > > -M: Greg Kurz <groug@kaod.org>
> > > > +M: C=E9dric Le Goater <clg@kaod.org>
> > > > +M: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > > +R: David Gibson <david@gibson.dropbear.id.au>
> > > > +R: Greg Kurz <groug@kaod.org>
> > > >  =A0 L: qemu-ppc@nongnu.org
> > > >  =A0 S: Maintained
> > > >  =A0 F: hw/*/spapr*
> > > > @@ -1382,6 +1388,8 @@ F: include/hw/pci-host/mv64361.h
> > > >  =A0 =A0 Virtual Open Firmware (VOF)
> > > >  =A0 M: Alexey Kardashevskiy <aik@ozlabs.ru>
> > > > +R: C=E9dric Le Goater <clg@kaod.org>
> > > > +R: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > >  =A0 R: David Gibson <david@gibson.dropbear.id.au>
> > > >  =A0 R: Greg Kurz <groug@kaod.org>
> > > >  =A0 L: qemu-ppc@nongnu.org
> > > >=20
> > >=20
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--D3Q5yqJcQgIm05a1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGGAnMACgkQbDjKyiDZ
s5JUGQ/+Ps3SUH7MyzWp0fH6MpTHcD8zC8AOIb9HwgXWR5/kN0iTA38uRZK6xhc0
8zXfdkO0t8TDcno372FfBgTWs49kbWo87fjjicsgCSp3yc1AHIZPJYmTbQ/7Kn7c
fHX9iTMN8o2Ydi8KS1qDZzxnMTPfkEcf67HcIHPuMBdHYg/Zo/K07AU4/6fAE7Yi
aAWGeIj3tOtgbVZMSNR7sFlhkSbfMT7Cks3CzOd1fp+WoWFdpL7Qu/Fng2HFxfAq
5XGcodlRlIHBwrvjHNhbA9dfkfDdLSKZJiJ6c3hji7/RFOPHlGGk9ufYK//DjJ4f
6z7jftrSExI1QQBxy1qBG0qBmnq59VnrBPhYmxm1mmA5M0dTALT0T4yC6EJ7p2vK
HS2QHFTbfwzp3SHGtHsq8naA31wVnEptOrzWpWR11U7f08E01Nl4dZVlRvkb0jkc
FHXoSmtdF+IcEowJ7ntX9Ha4GGiD4VmvR/MIcGX+ZTHjVlGWncnxHCG6O7vhRRS6
OtIeMoM7A7nxVJgFL8D+FL8p/250CGlb7B4gNJX3ph4YxqKd0xtgfBfpS7MgLPMG
PZbJencQ0lhobrfFGDq2gEZ5xqjmOXB+7jnW/Nm2+NljMklWx/SzKJgGsraGemnH
DkGyUX/Y/IS1NDRq2ScWwL0u0sEIL8gwNT1I1g4TLad4+mPDBjQ=
=412y
-----END PGP SIGNATURE-----

--D3Q5yqJcQgIm05a1--

