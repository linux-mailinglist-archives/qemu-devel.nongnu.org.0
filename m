Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4000638E16E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 09:20:55 +0200 (CEST)
Received: from localhost ([::1]:44010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll4tS-0003Ft-BF
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 03:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll4rq-00016I-1T; Mon, 24 May 2021 03:19:14 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:39683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll4rn-000190-4X; Mon, 24 May 2021 03:19:13 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FpT961pdfz9s24; Mon, 24 May 2021 17:19:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621840746;
 bh=lf1JBYKTrnhUDCbRDjxueAK0ORf7o4TKFcxrDPZdszw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WqveiOPltGLeSqA5KU1/kgpZh05Quj3gM+1bFfi3xXTP6bc5pXr66woYjyeAsi/s0
 XJoFxKObCBZ0GdQY04d2e5BtNmeOYjlt4hvfK45U90v5AAVielUSX4VzWWnI4iMJNW
 l1uUMef7Qbi3x7FJzUpRJk8FPXBMXjyUM5vx2dOg=
Date: Mon, 24 May 2021 15:40:07 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
Message-ID: <YKs8N0RBzcST1nxU@yekko>
References: <20210520090557.435689-1-aik@ozlabs.ru>
 <eb49cd30-a4f4-d063-d728-521446a671a6@eik.bme.hu>
 <5825cde5-a408-a438-116d-5a9d9113a52a@ozlabs.ru>
 <ec1742e3-c47-bbee-3a6-ec64442922ab@eik.bme.hu>
 <8527c8d2-c1e7-b3f8-0bda-529ba3864701@ozlabs.ru>
 <babe39af-fd34-8c5-de99-a0f485bfbce@eik.bme.hu>
 <77716be-4cf7-d222-d465-13685bf0783a@eik.bme.hu>
 <8e2d201d-a6a3-72bc-5d0f-5226930f1cbc@ozlabs.ru>
 <8c712d-a369-4db-177e-2a5e63836af4@eik.bme.hu>
 <f0137979-699f-3df2-59b5-9eeb62cbc654@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="B1/ibYBWMhO+P3Fu"
Content-Disposition: inline
In-Reply-To: <f0137979-699f-3df2-59b5-9eeb62cbc654@ozlabs.ru>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--B1/ibYBWMhO+P3Fu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 24, 2021 at 02:26:42PM +1000, Alexey Kardashevskiy wrote:
>=20
>=20
> On 5/23/21 21:24, BALATON Zoltan wrote:
> > On Sun, 23 May 2021, Alexey Kardashevskiy wrote:
> > > On 23/05/2021 01:02, BALATON Zoltan wrote:
> > > > On Sat, 22 May 2021, BALATON Zoltan wrote:
> > > > > On Sat, 22 May 2021, Alexey Kardashevskiy wrote:
> > > > > > VOF itself does not prints anything in this patch.
> > > > >=20
> > > > > However it seems to be needed for linux as the first thing
> > > > > it does seems to be getting /chosen/stdout and calls exit if
> > > > > it returns nothing. So I'll need this at least for linux. (I
> > > > > think MorphOS may also query it to print a banner or some
> > > > > messages but not sure it needs it, at least it does not
> > > > > abort right away if not found.)
> > > > >=20
> > > > > > > but to see Linux output do I need a stdout in VOF or
> > > > > > > it will just open the serial with its own driver and
> > > > > > > use that?
> > > > > > > So I'm not sure what's the stdout parts in the
> > > > > > > current vof patch does and if I need that for
> > > > > > > anything. I'll try to experiment with it some more
> > > > > > > but fixing the ld and Kconfig seems to be enough to
> > > > > > > get it work for me.
> > > > > >=20
> > > > > > So for the client to print something, /chosen/stdout
> > > > > > needs to have a valid ihandle.
> > > > > > The only way to get a valid ihandle is having a valid
> > > > > > phandle which vof_client_open() can open.
> > > > > > A valid phandle is a phandle of any node in the device
> > > > > > tree. On spapr we pick some spapr-vty, open it and store
> > > > > > in /chosen/stdout.
> > > > > >=20
> > > > > > From this point output from the client can be seen via a tracep=
oint.
> > > >=20
> > > > I've got it now. Looking at the original firmware device tree dump:
> > > >=20
> > > > https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2/attach/Pega=
sosII_OFW-Dump.txt
> > > >=20
> > > > I see that /chosen/stdout points to "screen" which is an alias
> > > > to /bootconsole. Just adding an empty /bootconsole node in the
> > > > device tree and vof_client_open_store() that as /chosen/stdout
> > > > works and I get output via vof_write traces so this is enough
> > > > for now to test Linux. Properly connecting a serial backend can
> > > > thus be postponed.
> > > >=20
> > > > So with this the Linux kernel does not abort on the first device
> > > > tree access but starts to decompress itself then the embedded
> > > > initrd and crashes at calling setprop:
> > > >=20
> > > > [...]
> > > > vof_client_handle: setprop
> > > >=20
> > > > Thread 4 "qemu-system-ppc" received signal SIGSEGV, Segmentation fa=
ult.
> > > > (gdb) bt
> > > > #0=A0 0x0000000000000000 in=A0 ()
> > > > #1=A0 0x0000555555a5c2bf in vof_setprop
> > > > =A0=A0=A0=A0 (vof=3D0x7ffff48e9420, vallen=3D4, valaddr=3D<optimize=
d out>,
> > > > pname=3D<optimized out>, nodeph=3D8, fdt=3D0x7fff8aaff010,
> > > > ms=3D0x5555564f8800)
> > > > =A0=A0=A0=A0 at ../hw/ppc/vof.c:308
> > > > #2=A0 0x0000555555a5c2bf in vof_client_handle
> > > > =A0=A0=A0=A0 (nrets=3D1, rets=3D0x7ffff48e93f0, nargs=3D4,
> > > > args=3D0x7ffff48e93c0, service=3D0x7ffff48e9460 "setprop",
> > > > =A0=A0=A0=A0=A0 vof=3D0x7ffff48e9420, fdt=3D0x7fff8aaff010, ms=3D0x=
5555564f8800)
> > > > at ../hw/ppc/vof.c:842
> > > > #3=A0 0x0000555555a5c2bf in vof_client_call
> > > > =A0=A0=A0=A0 (ms=3D0x5555564f8800, vof=3Dvof@entry=3D0x55555662a3d0,
> > > > fdt=3Dfdt@entry=3D0x7fff8aaff010,
> > > > args_real=3Dargs_real@entry=3D23580472)
> > > > =A0=A0=A0=A0 at ../hw/ppc/vof.c:935
> > > >=20
> > > > loooks like it's trying to set /chosen/linux,initrd-start:
> > >=20
> > > It is not horribly clear why it crashed though.
> >=20
> > It crashed becuase I had TYPE_VOF_MACHINE_IF but did not set a setprop
> > callback and it tried to call that here. Adding a {return true;} empty
> > callback avoids this.
>=20
>=20
> Ah ok.
>=20
> >=20
> > > > (gdb) up
> > > > #1=A0 0x0000555555a5c2bf in vof_setprop (vof=3D0x7ffff48e9420,
> > > > vallen=3D4, valaddr=3D<optimized out>, pname=3D<optimized out>,
> > > > nodeph=3D8,
> > > > =A0=A0=A0=A0 fdt=3D0x7fff8aaff010, ms=3D0x5555564f8800) at ../hw/pp=
c/vof.c:308
> > > > 308=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!vmc->setprop(ms, nodepath=
, propname, val, vallen)) {
> > > > (gdb) p nodepath
> > > > $1 =3D "/chosen\000\060/rPC,750CXE/", '\000' <repeats 234 times>
> > > > (gdb) p propname
> > > > $2 =3D "linux,initrd-start\000linux,initrd-end\000linux,cmdline-tim=
eout\000bootarg"
> > > > (gdb) p val
> > > > $3 =3D <optimized out>
> > > >=20
> > > > I think I need the callback for setprop in TYPE_VOF_MACHINE_IF.
> > > > I can copy spapr_vof_setprop() but some explanation on why
> > > > that's needed might help. Ciould I just do fdt_setprop in my
> > > > callback as vof_setprop() would do without a machine callback or
> > > > is there some special handling needed for these properties?
> > >=20
> > > The short answer is yes, you do not need TYPE_VOF_MACHINE_IF.
> > >=20
> > > The long answer is that we build the FDT on spapr twice:
> > > 1. at the reset time and
> > > 2. after "ibm,client-arhitecture-support" (early in the boot the
> > > spapr paravirtual client says what it supports - ISA level, MMU
> > > features, etc)
> > >=20
> > > Between 1 and 2 the kernel moves initrd and we do not update the
> > > QEMU's version of its location, the tree at 2) will have the old
> > > values.
> > >=20
> > > So for that reason I have TYPE_VOF_MACHINE_IF. You most definitely
> > > do not need it.
> >=20
> > I need TYPE_VOF_MACHINE_IF because that has the quiesce callback that I
> > need to shut VOF down when the guest is finished with it otherwise it
> > would crash later (more on this in next message).
>=20
> Nah, quiesce() only means stopping IO in VOF. VOF is shut down when the
> client decides to stop using it (and zero that memory).
>=20
> > But since I shut down VOF here I don't need to remember changes to the
> > FDT so I can just use an empty setprop callback. (I wouldn't even need
> > that if VOF would check that a callback is non-NULL before calling it.)
>=20
> I'll add the check.
>=20
> I'll need some time to go though the other mails, closer to the weekend,
> there are too many gaps in my knowledge about those 32bit systems.
>=20
> I am really not sure that you need TYPE_PPC_VIRTUAL_HYPERVISOR (is this j=
ust
> to make "sc 1" work? there should be a better way) or RTAS (although it
> looks like you need it for PCI, you likely do not need it for your serial
> device which is ISA which I have no idea how it works). Do you have an
> actual machine? Can you dump its device tree to see what yours is missing?

IIUC, it's basicaly so that the 'sc 1' instructions can be routed
through to VOF.  'sc 1' is an illegal instruction on ppc32, AFAIK, so
we need some sort of hack here.

vhyp wasn't really designed for this, but I suspect it is the simplest
way to intercept those 'sc 1' calls.

Unfortunately, shutting it down presents a real problem.  Currently
you're relying on quiesce being the last call to OF the client makes.
That's often the case in practice, but not necessarily in all cases,
as you've seen.  However, there's no alternative point at which we can
determine that we're done with the client interface.

My inclination for now would be to just leave the vhyp handler in
place.  Strictly speaking it won't give you correct behaviour: later
calls to 'sc 1' will invoke VOF rather than giving a 0x700 exception.
But nothing on a 32-bit system should be attempting 'sc 1' anyway, so
I think it will probably work in practice.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--B1/ibYBWMhO+P3Fu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCrPDUACgkQbDjKyiDZ
s5JpzBAAyBtGwrU1PsxyQH8akf4vC3dHArXuY39FNwGN1gD09gwuLqR5x299Rget
DcbPa3S0A+SNpjJE+0HmP36xGltfEnI82NwL2WZBNnjtHMta3LetOiXLvZVC8Z6n
LPG8D2Z9Xn6fWklSnpiji4raIP7pSH/d8mNLZu/e94+stub30wPvuR0M/9CwXZmT
XnPK5q6UyOjqpXcdLvJ/L9UvZpHF2lBeAJUkEkHDXiIqLjXcyqxficBQVs4EI0qU
vphjpc4o8P9YBN5MbURZry94JxGnOM6EO8m7x3+s2aUwidyLGYdu9NDzSoUtH6Eh
YpGVrCMqIG4adiT/AC+gOdPaNsKZAedmCzAw4hBWgl3TXTixN4VB8E+QZ3dTBVz6
9pAAIFGq0UX5ZJBRFiuDO6u5hweitLbWU7vcbi+NU6ZsPZhjxJZ+Qs0QW66OVpHz
2Be5qY4NtVuHUHbtPFsDT7akOtB0bkbHqW9Tbf7QwWkW6rCvgPT5e07YPU61GvBR
1cch4DHvWrpxrys0/OrKIB5SlFZFdZNCT1gtZyJc6fttqPwsCVMCflL4tmfV6Vn+
crWb/AQY9pllKTmDHUTAOMD7ptYqXNesImD0iCzix0V1bhNluOgaoTI56tNEJE23
mC/rRmDgWAHf5DWMxU2ZqwDcpsrpXWYBT7OlOpW31sX/tpuH+9U=
=KpW+
-----END PGP SIGNATURE-----

--B1/ibYBWMhO+P3Fu--

