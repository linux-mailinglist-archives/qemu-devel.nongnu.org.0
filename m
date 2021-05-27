Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE7239285E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 09:18:54 +0200 (CEST)
Received: from localhost ([::1]:56048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmAI6-0007T1-10
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 03:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lmAC6-00075T-1M; Thu, 27 May 2021 03:12:38 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37283 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lmAC1-0004jR-Fs; Thu, 27 May 2021 03:12:37 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FrJsx4rRDz9sXL; Thu, 27 May 2021 17:12:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622099541;
 bh=ojTeSkXgI7GaXYmoVVMmMFn3/9KjiL6mLYgDbvf/YcI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G1ewISEounAkt1WE3fiyJNTZ8VZW6jeEKwGv673msBe0hAaStZKI4/48Ml6YN0sxp
 zIQf9GQ81OCpjDPGTPpHBHMWaU68SFpBhE/7OTJGw9QiHuLedPfBXXgra/HW+zvhhL
 M0+/5NJWuqtpij7Zv23ebsuMfH+DANflp0FyywQI=
Date: Thu, 27 May 2021 15:34:36 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
Message-ID: <YK8vbO7x2C8kaBWZ@yekko>
References: <ec1742e3-c47-bbee-3a6-ec64442922ab@eik.bme.hu>
 <8527c8d2-c1e7-b3f8-0bda-529ba3864701@ozlabs.ru>
 <babe39af-fd34-8c5-de99-a0f485bfbce@eik.bme.hu>
 <4f6ceca3-5f18-fe70-18f9-4efde8feb1ed@ozlabs.ru>
 <7a4e47e5-59b-9132-eafd-d84d8b73f5c@eik.bme.hu>
 <17fbb016-2e7-d57e-bedd-1ae7814fb860@eik.bme.hu>
 <YKtBJoQXSrSVENFw@yekko>
 <939a489f-40de-da33-dd7-9fd1f5eb190@eik.bme.hu>
 <YKyJ3I5QIDLwR99t@yekko>
 <894b8b19-576d-8b25-922f-58613bad8545@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mDZJamzGsptDvlRX"
Content-Disposition: inline
In-Reply-To: <894b8b19-576d-8b25-922f-58613bad8545@eik.bme.hu>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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


--mDZJamzGsptDvlRX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 12:08:45PM +0200, BALATON Zoltan wrote:
> On Tue, 25 May 2021, David Gibson wrote:
> > On Mon, May 24, 2021 at 12:55:07PM +0200, BALATON Zoltan wrote:
> > > On Mon, 24 May 2021, David Gibson wrote:
> > > > On Sun, May 23, 2021 at 07:09:26PM +0200, BALATON Zoltan wrote:
> > > > > On Sun, 23 May 2021, BALATON Zoltan wrote:
> > > > > > On Sun, 23 May 2021, Alexey Kardashevskiy wrote:
> > > > > > > One thing to note about PCI is that normally I think the clie=
nt
> > > > > > > expects the firmware to do PCI probing and SLOF does it. But =
VOF
> > > > > > > does not and Linux scans PCI bus(es) itself. Might be a probl=
em for
> > > > > > > you kernel.
> > > > > >=20
> > > > > > I'm not sure what info does MorphOS get from the device tree an=
d what it
> > > > > > probes itself but I think it may at least need device ids and i=
nfo about
> > > > > > the PCI bus to be able to access the config regs, after that it=
 should
> > > > > > set the devices up hopefully. I could add these from the board =
code to
> > > > > > device tree so VOF does not need to do anything about it. Howev=
er I'm
> > > > > > not getting to that point yet because it crashes on something t=
hat it's
> > > > > > missing and couldn't yet find out what is that.
> > > > > >=20
> > > > > > I'd like to get Linux working now as that would be enough to te=
st this
> > > > > > and then if for MorphOS we still need a ROM it's not a problem =
if at
> > > > > > least we can boot Linux without the original firmware. But I ca=
n't make
> > > > > > Linux open a serial console and I don't know what it needs for =
that. Do
> > > > > > you happen to know? I've looked at the sources in Linux/arch/po=
werpc but
> > > > > > not sure how it would find and open a serial port on pegasos2. =
It seems
> > > > > > to work with the board firmware and now I can get it to boot wi=
th VOF
> > > > > > but then it does not open serial so it probably needs something=
 in the
> > > > > > device tree or expects the firmware to set something up that we=
 should
> > > > > > add in pegasos2.c when using VOF.
> > > > >=20
> > > > > I've now found that Linux uses rtas methods read-pci-config and
> > > > > write-pci-config for PCI access on pegasos2 so this means that we=
'll
> > > > > probably need rtas too (I hoped we could get away without it if i=
t were only
> > > > > used for shutdown/reboot or so but seems Linux needs it for PCI a=
s well and
> > > > > does not scan the bus and won't find some devices without it).
> > > >=20
> > > > Yes, definitely sounds like you'll need an RTAS implementation.
> > >=20
> > > I plan to fix that after managed to get serial working as that seems =
to not
> > > need it. If I delete the rtas-size property from /rtas on the original
> > > firmware that makes Linux skip instantiating rtas, but I still get se=
rial
> > > output just not accessing PCI devices. So I think it should work and =
keeps
> > > things simpler at first. Then I'll try rtas later.
> > >=20
> > > > > While VOF can do rtas, this causes a problem with the hypercall m=
ethod using
> > > > > sc 1 that goes through vhyp but trips the assert in ppc_store_sdr=
1() so
> > > > > cannot work after guest is past quiesce.
> > > >=20
> > > > > So the question is why is that
> > > > > assert there
> > > >=20
> > > > Ah.. right.  So, vhyp was designed for the PAPR use case, where we
> > > > want to model the CPU when it's in supervisor and user mode, but not
> > > > when it's in hypervisor mode.  We want qemu to mimic the behaviour =
of
> > > > the hypervisor, rather than attempting to actually execute hypervis=
or
> > > > code in the virtual CPU.
> > > >=20
> > > > On systems that have a hypervisor mode, SDR1 is hypervisor privileg=
ed,
> > > > so it makes no sense for the guest to attempt to set it.  That shou=
ld
> > > > be caught by the general SPR code and turned into a 0x700, hence the
> > > > assert() if we somehow reach ppc_store_sdr1().
> > > >=20
> > > > So, we are seeing a problem here because you want the 'sc 1'
> > > > interception of vhyp, but not the rest of the stuff that goes with =
it.
> > > >=20
> > > > > and would using sc 1 for hypercalls on pegasos2 cause other
> > > > > problems later even if the assert could be removed?
> > > >=20
> > > > At least in the short term, I think you probably can remove the
> > > > assert.  In your case the 'sc 1' calls aren't truly to a hypervisor,
> > > > but a special case escape to qemu for the firmware emulation.  I th=
ink
> > > > it's unlikely to cause problems later, because nothing on a 32-bit
> > > > system should be attempting an 'sc 1'.  The only thing I can think =
of
> > > > that would fail is some test case which explicitly verified that 'sc
> > > > 1' triggered a 0x700 (SIGILL from userspace).
> > >=20
> > > OK so the assert should check if the CPU has an HV bit. I think there=
 was a
> > > #detine for that somewhere that I can add to the assert then I can tr=
y that.
> > > What I wasn't sure about is that sc 1 would conflict with the guest's=
 usage
> > > of normal sc calls or are these going through different paths and onl=
y sc 1
> > > will trigger vhyp callback not affecting notmal sc calls?
> >=20
> > The vhyp shouldn't affect normal system calls, 'sc 1' is specifically
> > for hypercalls, as opposed to normal 'sc' (a.k.a. 'sc 0'), and the
> > vhyp only intercepts the hypercall version (after all Linux on PAPR
> > certainly uses its own system calls, and hypercalls are active for the
> > lifetime of the guest there).
> >=20
> > > (Or if this causes
> > > an otherwise unnecessary VM exit on KVM even when it works then maybe
> > > looking for a different way in the future might be needed.
> >=20
> > What you're doing here won't work with KVM as it stands.  There are
> > basically two paths into the vhyp hypercall path: 1) from TCG, if we
> > interpret an 'sc 1' instruction we enter vhyp, 2) from KVM, if we get
> > a KVM_EXIT_PAPR_HCALL KVM exit then we also go to the vhyp path.
> >=20
> > The second path is specific to the PAPR (ppc64) implementation of KVM,
> > and will not work for a non-PAPR platform without substantial
> > modification of the KVM code.
>=20
> OK so then at that point when we try KVM we'll need to look at alternative
> ways, I think MOL OSI worked with KVM at least in MOL but will probably m=
ake
> all syscalls exit KVM but since we'll probably need to use KVM PR it will
> exit anyway. For now I keep this vhyp as it does not run with KVM for oth=
er
> reasons yet so that's another area to clean up so as a proof of concept
> first version of using VOF vhyp will do.

Eh, since you'll need to modify KVM anyway, it probably makes just as
much sense to modify it to catch the 'sc 1' as MoL's magic thingy.

> [...]
> > > > > I've tested that the missing rtas is not the reason for getting n=
o output
> > > > > via serial though, as even when disabling rtas on pegasos2.rom it=
 boots and
> > > > > I still get serial output just some PCI devices are not detected =
(such as
> > > > > USB, the video card and the not emulated ethernet port but these =
are not
> > > > > fatal so it might even work as a first try without rtas, just to =
boot a
> > > > > Linux kernel for testing it would be enough if I can fix the seri=
al output).
> > > > > I still don't know why it's not finding serial but I think it may=
 be some
> > > > > missing or wrong info in the device tree I generat. I'll try to f=
ocus on
> > > > > this for now and leave the above rtas question for later.
> > > >=20
> > > > Oh.. another thought on that.  You have an ISA serial port on Pegas=
os,
> > > > I believe.  I wonder if the PCI->ISA bridge needs some configuratio=
n /
> > > > initialization that the firmware is expected to do.  If so you'll n=
eed
> > > > to mimic that setup in qemu for the VOF case.
> > >=20
> > > That's what I begin to think because I've added everything to the dev=
ice
> > > tree that I thought could be needed and I still don't get it working =
so it
> > > may need some config from the firmware. But how do I access device re=
gisters
> > > from board code? I've tried adding a machine reset method and write to
> > > memory mapped device registers but all my attempts failed. I've tried
> > > cpu_stl_le_data and even memory_region_dispatch_write but these did n=
ot get
> > > to the device. What's the way to access guest mmio regs from QEMU?
> >=20
> > That's odd, cpu_stl() and memory_region_dispatch_write() should work
> > from board code (after the relevant memory regions are configured, of
> > course).  As an ISA serial port, it's probably accessed through IO
> > space, not memory space though, so you'd need &address_space_io.  And
> > if there is some bridge configuration then it's the bridge control
> > registers you need to look at not the serial registers - you'd have to
> > look at the bridge documentation for that.  Or, I guess the bridge
> > implementation in qemu, which you wrote part of.
>=20
> I've found at last that stl_le_phys() works. There are so many of these t=
hat
> I never know when to use which.
>=20
> I think the address_space_rw calls in vof_client_call() in vof.c could al=
so
> use these for somewhat shorter code. I've ended up with
> stl_le_phys(CPU(cpu)->as, addr, val) in my machine reset methodbut I don't
> even need that now as it works without additional setup. Also VOF's memory
> access is basically the same as the already existing rtas_st() and co. so
> maybe that could be reused to make code smaller?

rtas_ld() and rtas_st() should only be used for reading/writing RTAS
parameters to and from memory.  Accessing IO shouldn't be done with
those.

For IO you probably want the cpu_st*() variants in most cases, since
you're trying to emulate an IO access from the virtual cpu.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--mDZJamzGsptDvlRX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCvL2wACgkQbDjKyiDZ
s5IEoQ//cMYxXH9kGYxONrHREY29gRcuJfa16C5PyrVrDnOdYQ6CnLHXFd+FlXOU
fHRkI/7etGVGgUM//RhjyQqKxYJrypd0HwRPf2etx0J0ufRxAuJwaO0K4FGTGqV+
iDrnPblujgYENOClQFwHPJeItw6KiVVOCM3amcS0GQakL8crCkPRQJA1BegmYVJv
DDzgV3AS7M0U3pUMB0HAtJmlHOwr+2llc+5JzXhmXprabDXXXDZ/EPwnEKkL6WCs
89wo6KBZOOGdhyBfbzItqMoedSknlqfaPff2WooSO2o1WZeTGIO4/IvoT6uu/MWq
ajPMux9sud3uAj1NjueKyQx3D/VuKI0tNYTlA33U2HPSADWvm7UKYfqHGgjpX+LI
Q3MDoULtVFrLqLKadTzwRkXgsRIuq9GGWEDGYLZVfz2nTs7uNkSXDXs7MvxPl8If
UvKoHiBy0kQkL+oNV3U2x2+yO+FGYTFofd/F4lp3pzZNDiGl6UlaZW/FyT/3+3tG
R5gfbuO1g1hambISaRuvBfzmwwKObS6tdYvssbJC6KQLl3E67I/1U1zZ1qVmA2Sq
OQ4910YNNC0hAsbT2dUJxyvYSXVJe6rM72BTfvWRxrOUquFQ4TBUvVqN9fR444uT
yV4LjweVFKNhe2LMZag7gVIhaZTVi17umodadWxmJM+u4njGN7g=
=sT1u
-----END PGP SIGNATURE-----

--mDZJamzGsptDvlRX--

