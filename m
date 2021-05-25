Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D99B38F9F3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 07:33:25 +0200 (CEST)
Received: from localhost ([::1]:48206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llPgy-0003C0-4F
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 01:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1llPdk-0007lM-J9; Tue, 25 May 2021 01:30:05 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:47145 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1llPdh-0001HO-Lr; Tue, 25 May 2021 01:30:04 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fq2hg6sDRz9sCD; Tue, 25 May 2021 15:29:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621920595;
 bh=e8lARN7Ncrkgqche/sIM8rK0W0gxEfqpQ/w8EbhR/34=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P3q0zz4WaYRf6Bth3sxqRIXy0rQjkhjbI4lljIqH6h62AdARGp06q9wAPDxvLh6l/
 ieunOM4FYufVNkR4QIgdq8CurcogbyVz2gNsRY4LjWjEv4+nKtoX21gL70Xx5F9XFE
 YDCMml3CqBKRyj+DLIJ2vZaPsTgFW3r1Dyeq+HV8=
Date: Tue, 25 May 2021 15:23:40 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
Message-ID: <YKyJ3I5QIDLwR99t@yekko>
References: <eb49cd30-a4f4-d063-d728-521446a671a6@eik.bme.hu>
 <5825cde5-a408-a438-116d-5a9d9113a52a@ozlabs.ru>
 <ec1742e3-c47-bbee-3a6-ec64442922ab@eik.bme.hu>
 <8527c8d2-c1e7-b3f8-0bda-529ba3864701@ozlabs.ru>
 <babe39af-fd34-8c5-de99-a0f485bfbce@eik.bme.hu>
 <4f6ceca3-5f18-fe70-18f9-4efde8feb1ed@ozlabs.ru>
 <7a4e47e5-59b-9132-eafd-d84d8b73f5c@eik.bme.hu>
 <17fbb016-2e7-d57e-bedd-1ae7814fb860@eik.bme.hu>
 <YKtBJoQXSrSVENFw@yekko>
 <939a489f-40de-da33-dd7-9fd1f5eb190@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kxCZlK7k5EQQRfNC"
Content-Disposition: inline
In-Reply-To: <939a489f-40de-da33-dd7-9fd1f5eb190@eik.bme.hu>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--kxCZlK7k5EQQRfNC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 24, 2021 at 12:55:07PM +0200, BALATON Zoltan wrote:
> On Mon, 24 May 2021, David Gibson wrote:
> > On Sun, May 23, 2021 at 07:09:26PM +0200, BALATON Zoltan wrote:
> > > On Sun, 23 May 2021, BALATON Zoltan wrote:
> > > > On Sun, 23 May 2021, Alexey Kardashevskiy wrote:
> > > > > One thing to note about PCI is that normally I think the client
> > > > > expects the firmware to do PCI probing and SLOF does it. But VOF
> > > > > does not and Linux scans PCI bus(es) itself. Might be a problem f=
or
> > > > > you kernel.
> > > >=20
> > > > I'm not sure what info does MorphOS get from the device tree and wh=
at it
> > > > probes itself but I think it may at least need device ids and info =
about
> > > > the PCI bus to be able to access the config regs, after that it sho=
uld
> > > > set the devices up hopefully. I could add these from the board code=
 to
> > > > device tree so VOF does not need to do anything about it. However I=
'm
> > > > not getting to that point yet because it crashes on something that =
it's
> > > > missing and couldn't yet find out what is that.
> > > >=20
> > > > I'd like to get Linux working now as that would be enough to test t=
his
> > > > and then if for MorphOS we still need a ROM it's not a problem if at
> > > > least we can boot Linux without the original firmware. But I can't =
make
> > > > Linux open a serial console and I don't know what it needs for that=
=2E Do
> > > > you happen to know? I've looked at the sources in Linux/arch/powerp=
c but
> > > > not sure how it would find and open a serial port on pegasos2. It s=
eems
> > > > to work with the board firmware and now I can get it to boot with V=
OF
> > > > but then it does not open serial so it probably needs something in =
the
> > > > device tree or expects the firmware to set something up that we sho=
uld
> > > > add in pegasos2.c when using VOF.
> > >=20
> > > I've now found that Linux uses rtas methods read-pci-config and
> > > write-pci-config for PCI access on pegasos2 so this means that we'll
> > > probably need rtas too (I hoped we could get away without it if it we=
re only
> > > used for shutdown/reboot or so but seems Linux needs it for PCI as we=
ll and
> > > does not scan the bus and won't find some devices without it).
> >=20
> > Yes, definitely sounds like you'll need an RTAS implementation.
>=20
> I plan to fix that after managed to get serial working as that seems to n=
ot
> need it. If I delete the rtas-size property from /rtas on the original
> firmware that makes Linux skip instantiating rtas, but I still get serial
> output just not accessing PCI devices. So I think it should work and keeps
> things simpler at first. Then I'll try rtas later.
>=20
> > > While VOF can do rtas, this causes a problem with the hypercall metho=
d using
> > > sc 1 that goes through vhyp but trips the assert in ppc_store_sdr1() =
so
> > > cannot work after guest is past quiesce.
> >=20
> > > So the question is why is that
> > > assert there
> >=20
> > Ah.. right.  So, vhyp was designed for the PAPR use case, where we
> > want to model the CPU when it's in supervisor and user mode, but not
> > when it's in hypervisor mode.  We want qemu to mimic the behaviour of
> > the hypervisor, rather than attempting to actually execute hypervisor
> > code in the virtual CPU.
> >=20
> > On systems that have a hypervisor mode, SDR1 is hypervisor privileged,
> > so it makes no sense for the guest to attempt to set it.  That should
> > be caught by the general SPR code and turned into a 0x700, hence the
> > assert() if we somehow reach ppc_store_sdr1().
> >=20
> > So, we are seeing a problem here because you want the 'sc 1'
> > interception of vhyp, but not the rest of the stuff that goes with it.
> >=20
> > > and would using sc 1 for hypercalls on pegasos2 cause other
> > > problems later even if the assert could be removed?
> >=20
> > At least in the short term, I think you probably can remove the
> > assert.  In your case the 'sc 1' calls aren't truly to a hypervisor,
> > but a special case escape to qemu for the firmware emulation.  I think
> > it's unlikely to cause problems later, because nothing on a 32-bit
> > system should be attempting an 'sc 1'.  The only thing I can think of
> > that would fail is some test case which explicitly verified that 'sc
> > 1' triggered a 0x700 (SIGILL from userspace).
>=20
> OK so the assert should check if the CPU has an HV bit. I think there was=
 a
> #detine for that somewhere that I can add to the assert then I can try th=
at.
> What I wasn't sure about is that sc 1 would conflict with the guest's usa=
ge
> of normal sc calls or are these going through different paths and only sc=
 1
> will trigger vhyp callback not affecting notmal sc calls?

The vhyp shouldn't affect normal system calls, 'sc 1' is specifically
for hypercalls, as opposed to normal 'sc' (a.k.a. 'sc 0'), and the
vhyp only intercepts the hypercall version (after all Linux on PAPR
certainly uses its own system calls, and hypercalls are active for the
lifetime of the guest there).

> (Or if this causes
> an otherwise unnecessary VM exit on KVM even when it works then maybe
> looking for a different way in the future might be needed.

What you're doing here won't work with KVM as it stands.  There are
basically two paths into the vhyp hypercall path: 1) from TCG, if we
interpret an 'sc 1' instruction we enter vhyp, 2) from KVM, if we get
a KVM_EXIT_PAPR_HCALL KVM exit then we also go to the vhyp path.

The second path is specific to the PAPR (ppc64) implementation of KVM,
and will not work for a non-PAPR platform without substantial
modification of the KVM code.

> But for now if
> this works with modifying the assert to allow this on ppc32 then I go for
> that as that's the simplest way for now.)
>=20
> > > Can somebody who knows
> > > more about it explain this please? If this cannot be resolved then we=
 may
> > > need a different hypercall method on pegasos2 (I've considered MOL OS=
I or
> > > are there other options? I may use some advice from people who know it
> > > better, especially the possible interaction with KVM later as the lon=
g term
> > > goal with pegasos2 is to be able to run with KVM on PPC hardware
> > > eventually.)
> >=20
> > Right, you might need an alternative method eventually.  Really any
> > illegal instruction for your cpu is a possible candidate.  Bear in
> > mind that this is *not* truly a hypercall interface, instead it's
> > something we're special casing for the purposes of faking the
> > firmware.
> >=20
> > The "attn" instruction used on BookE might be a reasonable candidate
> > (assuming it doesn't conflict with something on 32-bit BookS) - that's
> > often used for things like signalling the attention of hardware
> > debuggers, and this is somewhat akin.
> >=20
> > Mostly it's just a matter of working out what would be least messy to
> > intercept in the TCG instruction decoding path.
>=20
> I'll wait for the current ongoing reorganisations to settle for that. If =
an
> alternative is needed I was considering the interface used by Mac on Linu=
x:
>=20
> https://lists.nongnu.org/archive/html/qemu-ppc/2021-03/msg00047.html
>=20
> becuase there are some paravirtual drivers I think that use these on Mac =
OS
> X so this might also be useful for that use case for Mac emulation. But t=
hat
> seems very similar just checking for magic values at a normal syscall whi=
ch
> means all syscalls will be intercepted anyway. In that case if sc 1 does =
not
> interfere with normal sc instructions then it may be better to keep that =
as
> the invalid instruction we trap on.
>=20
> > > But this also means that if that assert cannot be dropped or
> > > there may be other problems with sc 1 hypercalls then we maybe cannot=
 have
> > > the same vof.bin and we'll need a separate version that I would like =
to
> > > avoid if possible so if there's a simple way to keep it working or ma=
ke
> > > vof.bin use alternate hypercall method without needing a separate bin=
ary
> > > that would be the direction I'd tend to go. Even if we need a seoarate
> > > version I'd like to keep as much common as possible.
> > >=20
> > > I've tested that the missing rtas is not the reason for getting no ou=
tput
> > > via serial though, as even when disabling rtas on pegasos2.rom it boo=
ts and
> > > I still get serial output just some PCI devices are not detected (suc=
h as
> > > USB, the video card and the not emulated ethernet port but these are =
not
> > > fatal so it might even work as a first try without rtas, just to boot=
 a
> > > Linux kernel for testing it would be enough if I can fix the serial o=
utput).
> > > I still don't know why it's not finding serial but I think it may be =
some
> > > missing or wrong info in the device tree I generat. I'll try to focus=
 on
> > > this for now and leave the above rtas question for later.
> >=20
> > Oh.. another thought on that.  You have an ISA serial port on Pegasos,
> > I believe.  I wonder if the PCI->ISA bridge needs some configuration /
> > initialization that the firmware is expected to do.  If so you'll need
> > to mimic that setup in qemu for the VOF case.
>=20
> That's what I begin to think because I've added everything to the device
> tree that I thought could be needed and I still don't get it working so it
> may need some config from the firmware. But how do I access device regist=
ers
> from board code? I've tried adding a machine reset method and write to
> memory mapped device registers but all my attempts failed. I've tried
> cpu_stl_le_data and even memory_region_dispatch_write but these did not g=
et
> to the device. What's the way to access guest mmio regs from QEMU?

That's odd, cpu_stl() and memory_region_dispatch_write() should work
=66rom board code (after the relevant memory regions are configured, of
course).  As an ISA serial port, it's probably accessed through IO
space, not memory space though, so you'd need &address_space_io.  And
if there is some bridge configuration then it's the bridge control
registers you need to look at not the serial registers - you'd have to
look at the bridge documentation for that.  Or, I guess the bridge
implementation in qemu, which you wrote part of.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kxCZlK7k5EQQRfNC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCsidoACgkQbDjKyiDZ
s5KGkhAAm8cDIHhghMLopr1fh8U684fcLuGAiEaj9ahaPvz9wO8W9oNhspsdN4bx
ujbhulyS9Zn/JMEopTM+EmKUeAwXiK6T6LvD3RkbpBHFKzLmOht+GWf4Xd0dArYx
E/8Pkk3C7r1Fom7vmUAOXybn9lBr2/2N2ohajbaKgasins3NmRi2ZL6QYm1JiFlf
o9OJAq5V8sj63PgQeKmh1MkBRhBsWTxJuXclNOphIjANorlRnuuYxC/eI3vRntEs
R/Bvn8K8SF/7v+1Yu06ipB+6XQqA8ewxxTlFr/RqhhjE0vsqaoWTe4CqZrk0GEwb
oTDQ1ak0eq4FR4G1jPcgRIsYj/qN9hEaQBp16epAQYuOjOiiaeqklUBxkWhAQ7VK
QDKEVsB7xwCqJ/hbPpf18wVGgu0vAh5/RepE41H10IEEhWDRiFWyAoeyk+o3i1Nb
DY3jgB2DHxdJNEre3K6W+kSDoKZo6spDgcjlqgnwU4+u8TAwYm5EsaUPJVmJHc3x
LPTec8KTsPAfG4o52L6bb+oZBZVFFWT9v9iDvULvCypTg/KpL3bGVqP68jNwRrli
2ZYABsAR/VncBxrj8shoL2JM0j5YZHqd4tu5pz6Gp1a++kJIAqtQ+rqfSkOun7aH
Wmd1Xzm52+DI6JY8eXt+WHPEdYwY2c48zKLqcAoaE5N3pEVJ+FU=
=gBqA
-----END PGP SIGNATURE-----

--kxCZlK7k5EQQRfNC--

