Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F071C58C22A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 05:47:20 +0200 (CEST)
Received: from localhost ([::1]:35950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKtjc-0001qI-19
	for lists+qemu-devel@lfdr.de; Sun, 07 Aug 2022 23:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oKtZi-0003uX-Ef
 for qemu-devel@nongnu.org; Sun, 07 Aug 2022 23:37:06 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:59583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oKtZd-0006a4-SR
 for qemu-devel@nongnu.org; Sun, 07 Aug 2022 23:37:06 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4M1MM85GwJz4x1V; Mon,  8 Aug 2022 13:36:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1659929812;
 bh=8OQQJcVY2APwmZnbivlV/OVaNWNgYsGYL/76hugycdA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q4FyMWSC5p9qINF83hohZCJj89CrG0tvotdr8ktjjCvvemxkJhP0HiTKRLHPCkq+O
 0gT6aIgcUDtqfrZCSZ3gXYUPpM9MJ+YWa0htzoPiCkkD2+hb6RilVDmXFUtfttDjuP
 aJuNCNnHt64F+GXv1m9mT2t2RScCCG8IeXAjvMEo=
Date: Mon, 8 Aug 2022 13:25:35 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, qemu-devel@nongnu.org,
 alistair.francis@wdc.com,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH for-7.2 v2 09/20] hw/ppc: set machine->fdt in pnv_reset()
Message-ID: <YvCCL4TKEfqhiKkB@yekko>
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-10-danielhb413@gmail.com>
 <ef56a98c-6261-2342-84e4-46796b69cdbb@linux.ibm.com>
 <20bcdfba-bd98-90b9-e384-8a40d833ebfe@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="44xHHQxvarwmExWy"
Content-Disposition: inline
In-Reply-To: <20bcdfba-bd98-90b9-e384-8a40d833ebfe@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--44xHHQxvarwmExWy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 05, 2022 at 09:31:11AM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 8/5/22 08:03, Frederic Barrat wrote:
> >=20
> >=20
> > On 05/08/2022 11:39, Daniel Henrique Barboza wrote:
> > > This will enable support for 'dumpdtb' and 'info fdt' HMP commands for
> > > all powernv machines.
> > >=20
> > > Cc: C=E9dric Le Goater <clg@kaod.org>
> > > Cc: Frederic Barrat <fbarrat@linux.ibm.com>
> > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > ---
> > > =A0 hw/ppc/pnv.c | 6 +++++-
> > > =A0 1 file changed, 5 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> > > index d3f77c8367..f5162f8b7b 100644
> > > --- a/hw/ppc/pnv.c
> > > +++ b/hw/ppc/pnv.c
> > > @@ -608,7 +608,11 @@ static void pnv_reset(MachineState *machine)
> > > =A0=A0=A0=A0=A0 qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
> > > =A0=A0=A0=A0=A0 cpu_physical_memory_write(PNV_FDT_ADDR, fdt, fdt_tota=
lsize(fdt));
> > > -=A0=A0=A0 g_free(fdt);
> > > +=A0=A0=A0 /*
> > > +=A0=A0=A0=A0 * Update the machine->fdt pointer to enable support for
> > > +=A0=A0=A0=A0 * 'dumpdtb' and 'info fdt' commands.
> > > +=A0=A0=A0=A0 */
> > > +=A0=A0=A0 machine->fdt =3D fdt;
> >=20
> >=20
> > Can pnv_reset() be called several times in the same instance of the qem=
u process, in which case we leak memory?
>=20
> hmmm I think it's possible if we issue a 'system_reset' via the
> monitor.

Right.  I'm not certain about pnv, but on most platforms there's a way
to trigger system_reset from the guest side as well.

> I'll put a g_free(machine->fdt) before the assignment.
>=20
>=20
> Daniel
>=20
>=20
> >=20
> >  =A0 Fred
> >=20
> >=20
> > > =A0 }
> > > =A0 static ISABus *pnv_chip_power8_isa_create(PnvChip *chip, Error **=
errp)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--44xHHQxvarwmExWy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmLwgigACgkQgypY4gEw
YSI34BAArIwvDpo4DZ8XIfzD5I2o4KB9k0Hol8Id1aLnTBoTl0S70NaJKdxGG5U1
Dt11CFVL25VKJjYiyhH6jISuNI+QDnwyCAJfW7feee5fwsMBpXaYS7f/NT02EwLJ
5nsN7ejE6uomALQxuXgx4i2D2ukOjjUbJYt3e4P1b/yp8zHWBGIkr5TeoJk1WIbk
DP0fJJtE2zFa7c2YuXxu2LXDHZ5Ddl9FsAoxQQI+9WUcdiUGXO/VbBOUxvU+7Vu1
7Woyos+O1kNQAHD0pLZMHn269oAuL6cup/4yeZhPHS8gU/iePYYil2ri3qCt3Zff
nqBlwbxpreK85ioGasyXW796pTErnT9iAgq2jJkEi3kFxJoT6v/mJi2C+IQEI6ri
lckBQAZv0+BcFa3X8yu+7wXhoXZlHJaZ7OuTgksnGnRPv9JdMr7e5laib7GP7RTk
/+opCFy45AXR8eVlqm2jxRRNRN/aVQ1rQCekJzjgy3xDg/ghCEpCvcWZ46ET5k1G
s1SSog93QQ2JoHX3Xja1pyWkw5kRtvqAoPJWs5aWqWDusihc7erB/ek6iO5ZUnAs
SawYOvbdaK9+pV+odY/AGRjEG4xX8IZnfXJiO74C6QM+cqbdQ5fxvm1UpsRGNPMX
oH5B5pooUCMz3CIkVBvpSYBdOmHoWzphIU+G4t0QwyKMPAxJkzk=
=C2ul
-----END PGP SIGNATURE-----

--44xHHQxvarwmExWy--

