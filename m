Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1F038E07C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 06:51:24 +0200 (CEST)
Received: from localhost ([::1]:45058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll2Yl-0008Bt-7i
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 00:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll2Wz-00069G-RF; Mon, 24 May 2021 00:49:33 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:52563 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll2Wv-0008IX-HH; Mon, 24 May 2021 00:49:33 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FpPrP3GqBz9sRf; Mon, 24 May 2021 14:49:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621831765;
 bh=RK56pxlcjuTHNyUvpjL4tsFwoLMnvoApCC6P7I10eDE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WdeIgJIM6WHaleaNAYu01A8ZkNox++/wQsif1S56FRDAIXqmqnXiLF0AasMH4R643
 rzR9EX5C7ija3rql3VGbIiMx0vGys7uqsPHxaxwMnLgL5AZ1d1hFFiSWLj8xEnMlHp
 WGaQvtKbAjq5XsyxDAyB9JJMiJ04RfDl3Bly/0WY=
Date: Mon, 24 May 2021 14:42:02 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH qemu v19] spapr: Implement Open Firmware client interface
Message-ID: <YKsums4Wkw0c9d9M@yekko>
References: <20210422125819.1122661-1-aik@ozlabs.ru>
 <c9997a3b-118b-6a23-d3cb-4c3c59dc839d@eik.bme.hu>
 <8e1bae8e-9b8e-0895-5747-9e7cd7d70def@ozlabs.ru>
 <381924b9-29fd-67a0-e311-72c8718f853@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oEEm7vzDPdA5XKpi"
Content-Disposition: inline
In-Reply-To: <381924b9-29fd-67a0-e311-72c8718f853@eik.bme.hu>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--oEEm7vzDPdA5XKpi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 02:17:36PM +0200, BALATON Zoltan wrote:
> On Mon, 17 May 2021, Alexey Kardashevskiy wrote:
> > On 5/16/21 01:04, BALATON Zoltan wrote:
> > > On Thu, 22 Apr 2021, Alexey Kardashevskiy wrote:
> >=20
> > [snip]
> >=20
> > > > +/* Defined as Big Endian */
> > > > +struct prom_args {
> > > > +=A0=A0=A0 uint32_t service;
> > > > +=A0=A0=A0 uint32_t nargs;
> > > > +=A0=A0=A0 uint32_t nret;
> > > > +=A0=A0=A0 uint32_t args[10];
> > > > +} QEMU_PACKED;
> > >=20
> > > This #define and struct definition should probably be moved to
> > > include/hw/ppc/vof.h as I had to copy these when trying to get VOF
> > > running with pegasos2 and these seem to be VOF specific not spapr.
> >=20
> > Correct, I'll fix it - there are 2 copies already.
> >=20
> >=20
> > >=20
> > > I was trying to wire up VOF on pegasos2 as proof of concept but I
> > > did not get very far as it crashed at the first move due to using
> > > mtmsrd which does not exist on the 32 bit CPUs (G4 or G3) used by
> > > pegasos2:
> > >=20
> > > vof_claim virt=3D0x0 size=3D0xc38 align=3D0x0 =3D> 0x0
> > > vof_claim virt=3D0x0 size=3D0x8000 align=3D0x8000 =3D> 0x8000
> > > vof_claim virt=3D0xc00000 size=3D0x18fd62 align=3D0x0 =3D> 0xc00000
> > > vof_claimed 0x0..0xc38 size=3D0xc38
> > > vof_claimed 0x8000..0x10000 size=3D0x8000
> > > vof_claimed 0xc00000..0xd8fd62 size=3D0x18fd62
> > > vof_avail 0xc38..0x8000 size=3D0x73c8
> > > vof_avail 0x10000..0xc00000 size=3D0xbf0000
> > > vof_avail 0xd8fd62..0x20000000 size=3D0x1f27029e
> > > via_superio_cfg: unimplemented register 0xf2
> > > via_superio_cfg: unimplemented register 0xf4
> > > via_superio_cfg: unimplemented register 0xf6
> > > via_superio_cfg: unimplemented register 0xf7
> > > invalid/unsupported opcode: 1f - 12 - 05 - 00 (7fe00164) fff00108 0
> > > ----------------
> > > IN:
> > > 0xfff00100:=A0 3fe00000=A0 lis=A0=A0=A0=A0=A0 r31, 0
> > > 0xfff00104:=A0 63ff0000=A0 ori=A0=A0=A0=A0=A0 r31, r31, 0
> > > 0xfff00108:=A0 7fe00164=A0 mtmsrd=A0=A0 r31
> > >=20
> > > ----------------
> > > IN:
> > > 0xfff00700:=A0 807e8020=A0 lwz=A0=A0=A0=A0=A0 r3, -0x7fe0(r30)
> > > 0xfff00704:=A0 4cc63182=A0 crclr=A0=A0=A0 6
> > > 0xfff00708:=A0 4bfffd1d=A0 bl=A0=A0=A0=A0=A0=A0 0xfff00424
> > >=20
> > > Invalid access at addr 0xFFFF8020, size 4, region '(null)', reason:
> > > rejected
> > >=20
> > > Is this mtmsrd really needed? Do 64-bit Power CPUs start in 64 bit mo=
de?
> >=20
> > Yup:
> > https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dtarget/ppc/translate_in=
it.c.inc;h=3D66e6a4a746f46148e0006081af09391b32c125cd;hb=3DHEAD#l10085
> >=20
> > I cannot find the exact reason for that, probably PAPR or some PPC-OF
> > binding says so.
> >=20
> >=20
> > > I'd expect them to be in compatibility mode unless 64 bit is enabled
> > > but I did not check the docs. If it's needed maybe a dummy handler
> > > has to be at 0x700 to ignore this exception if it's running on a
> > > 32-bit CPU.
> >=20
> > I wanted MSR and the code to be in sync explicitly.
>=20
> OK, then can you add a dummy exception handler at 0x700 to ignore this so=
 it
> would also work on a 32-bit CPU? That does not seem to be too difficult.

I don't like that idea.  I really think the idea with VOF should be
that it's explicitly closely married to qemu, so we shouldn't have to
mess around with the firmware image coping with different situations.

So a) I don't think we should go to *any* trouble to have the same VOF
guest image work on multiple machine types (nor multiple qemu
versions).  And b) I think VOF should just assume qemu has started it
in the mode it wants and not try to get it there.

> > > By the way does vof need to be loaded at addr 0 or it could work at
> > > the default ROM address as well? That would simplify usage if it
> > > could run position independent.
> >=20
> > What do you call the default ROM address? SLOF loads at 0 and starts at
> > 0x100, VOF does the same.
>=20
> On pegasos2 the ROM is at 0xfff00000 normally and that's where it starts
> executing at offset 0x100. If I load vof.bin there it starts but hypercal=
ls
> fail as above. I've changed it to load vof at 0 then it works a bit better
> and after adding the property to /chosen it tries to query it but fails
> there for some reason.
>=20
> > Making it run position independend is going to make it more complex and
> > I really (really) want it to be tiny.
>=20
> It's not needed as I can special case it and load vof at 0 but is it more
> complex than just compiling it with the appropriate flag for PIC (-fPIC or
> what is it).
>=20
> > I think what you really want is another vof-pegasos2.bin linked at the
> > address you like and not calling mtmsrd, could be an #ifdef in the
> > existing vof firmware. It is rather expected to have a firmware per a
> > machine type.
>=20
> Is that really needed? Can we make a single firmware binary run on differ=
ent
> CPUs? I think openbios-ppc runs on both 64 and 32 bit PPC while itself
> compiled as 32 bit but also runs with qemu-system-ppc64 -M mac99 which us=
es
> a G5 CPU by default. It does some magic here:
>=20
> https://github.com/openbios/openbios/blob/master/arch/ppc/qemu/start.S
>=20
> but that may be too ugly to copy.
>=20
> Another thing that I'm not sure about is that on 32 bit OpenFirmware cells
> are normally also 32 bit but VOF expects them to be 64 bit so I had to
> change the mem reg and chosen qemu,boot-kernel properties that VOF queries
> to use uint64_t and not sure that would be a problem. For now I'm just
> trying to get some guest code to run and try to use the VOF CI to see if =
it
> would work. If guests expect mem reg to be 32 bit then we may need a
> separate version for that.
>=20
> Regards,
> BALATON Zoltan


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--oEEm7vzDPdA5XKpi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCrLpgACgkQbDjKyiDZ
s5J5HA/9H0VGav0Xbd/APKOiNH11uMVwbxzxG/BR4abQw24nOGj7wrvBbxXiREok
Sv8zc7IcwA7hjmkXjCcrAcejny0RlYgAkWBuNgBjXodZmntprbCoLQc9ZVOGBx4s
3fV4gBPGJPBy4Cbkb5SfqR+GWRcNfYiij1OlSYvArdaRCc3ucWAjFG0vbEJ4WePL
RzNnFK5mtrpHZrlEfvcHpEGDAcwQT9l2Q8Forjztey/gDYbbVH1uMV/pseiAFRSH
0tMKLDXE6ATkvhGMzLCvcmU1hSeEoYstnzfEwSS98CcohQ9WSJ8rZVdiJCrN4VvA
G9w2HCcHXI2bK3HTmMPA+2pPw/ulLuhO0Lr6YyfvG64tD64gen7Fruo00ch88BVI
fL024mnh0gKJ5NZwVuhTRThu15Po9CuTCGno27APL/G4uo8IFUeS5iuRYPH31okc
Xj0kS30n/Q6wA8R5GhfT0Zi2qgxJyf40R87Nlc54pWL/pu251DOavSqwFL1FMqEy
7QOMW9J1gUkpSwtBNfb2Pbh2dPUz8fCjSIYPyIiNlmXbnMCSriwFvaiDeKBledhO
RQB8lXc8CIL9JXz32zErs+vx/K3JGoplm4srudHVbYij/1FadNoMDiXvvA+useRZ
9uF5qhuumR6gcuCL4l8PUYZ913iZDwM47nWy4muGIQOCGHU/f1E=
=D9lK
-----END PGP SIGNATURE-----

--oEEm7vzDPdA5XKpi--

