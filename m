Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62208398442
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 10:37:17 +0200 (CEST)
Received: from localhost ([::1]:47324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loMNI-0003XG-GC
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 04:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loMMG-0002b6-Vd; Wed, 02 Jun 2021 04:36:12 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:34231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loMMD-0008WG-Ca; Wed, 02 Jun 2021 04:36:12 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fw2Rn2Tfvz9sSs; Wed,  2 Jun 2021 18:36:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622622965;
 bh=3gOCYgRKpiH9LHeKCJD1L9L8Us+/XwWY12516M+F8Mw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SGVz4qQjCzLmqpVV2H0eKz1IHA+YDz8KE0SWazEIQnOjAKWNi7aD+B2GffpkLdE5e
 DMos+ka4oPvaLK1p/K6DCoLmoKBpv3du/WszkfVeq2BLiSuqs0zzDE8qPo8k1mzmqD
 fK6LweGl2mS3bmSdH5TdlhkV8LmXaKGPysvHHyr4=
Date: Wed, 2 Jun 2021 17:57:07 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
Message-ID: <YLc507CyOVq403TM@yekko>
References: <babe39af-fd34-8c5-de99-a0f485bfbce@eik.bme.hu>
 <4f6ceca3-5f18-fe70-18f9-4efde8feb1ed@ozlabs.ru>
 <7a4e47e5-59b-9132-eafd-d84d8b73f5c@eik.bme.hu>
 <17fbb016-2e7-d57e-bedd-1ae7814fb860@eik.bme.hu>
 <YKtBJoQXSrSVENFw@yekko>
 <939a489f-40de-da33-dd7-9fd1f5eb190@eik.bme.hu>
 <YKyJ3I5QIDLwR99t@yekko>
 <894b8b19-576d-8b25-922f-58613bad8545@eik.bme.hu>
 <YK8vbO7x2C8kaBWZ@yekko>
 <653edbe1-f912-bc8f-ec7f-c4f069b0a5b9@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+80HpdrM9cgIx0Ia"
Content-Disposition: inline
In-Reply-To: <653edbe1-f912-bc8f-ec7f-c4f069b0a5b9@eik.bme.hu>
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


--+80HpdrM9cgIx0Ia
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 02:42:39PM +0200, BALATON Zoltan wrote:
> On Thu, 27 May 2021, David Gibson wrote:
> > On Tue, May 25, 2021 at 12:08:45PM +0200, BALATON Zoltan wrote:
> > > On Tue, 25 May 2021, David Gibson wrote:
> > > > On Mon, May 24, 2021 at 12:55:07PM +0200, BALATON Zoltan wrote:
> > > > > On Mon, 24 May 2021, David Gibson wrote:
> > > > > > On Sun, May 23, 2021 at 07:09:26PM +0200, BALATON Zoltan wrote:
> > > > > > > On Sun, 23 May 2021, BALATON Zoltan wrote:
> > > > > > > > On Sun, 23 May 2021, Alexey Kardashevskiy wrote:
> > > > > > > > > One thing to note about PCI is that normally I think the =
client
> > > > > > > > > expects the firmware to do PCI probing and SLOF does it. =
But VOF
> > > > > > > > > does not and Linux scans PCI bus(es) itself. Might be a p=
roblem for
> > > > > > > > > you kernel.
> > > > > > > >=20
> > > > > > > > I'm not sure what info does MorphOS get from the device tre=
e and what it
> > > > > > > > probes itself but I think it may at least need device ids a=
nd info about
> > > > > > > > the PCI bus to be able to access the config regs, after tha=
t it should
> > > > > > > > set the devices up hopefully. I could add these from the bo=
ard code to
> > > > > > > > device tree so VOF does not need to do anything about it. H=
owever I'm
> > > > > > > > not getting to that point yet because it crashes on somethi=
ng that it's
> > > > > > > > missing and couldn't yet find out what is that.
> > > > > > > >=20
> > > > > > > > I'd like to get Linux working now as that would be enough t=
o test this
> > > > > > > > and then if for MorphOS we still need a ROM it's not a prob=
lem if at
> > > > > > > > least we can boot Linux without the original firmware. But =
I can't make
> > > > > > > > Linux open a serial console and I don't know what it needs =
for that. Do
> > > > > > > > you happen to know? I've looked at the sources in Linux/arc=
h/powerpc but
> > > > > > > > not sure how it would find and open a serial port on pegaso=
s2. It seems
> > > > > > > > to work with the board firmware and now I can get it to boo=
t with VOF
> > > > > > > > but then it does not open serial so it probably needs somet=
hing in the
> > > > > > > > device tree or expects the firmware to set something up tha=
t we should
> > > > > > > > add in pegasos2.c when using VOF.
> > > > > > >=20
> > > > > > > I've now found that Linux uses rtas methods read-pci-config a=
nd
> > > > > > > write-pci-config for PCI access on pegasos2 so this means tha=
t we'll
> > > > > > > probably need rtas too (I hoped we could get away without it =
if it were only
> > > > > > > used for shutdown/reboot or so but seems Linux needs it for P=
CI as well and
> > > > > > > does not scan the bus and won't find some devices without it).
> > > > > >=20
> > > > > > Yes, definitely sounds like you'll need an RTAS implementation.
> > > > >=20
> > > > > I plan to fix that after managed to get serial working as that se=
ems to not
> > > > > need it. If I delete the rtas-size property from /rtas on the ori=
ginal
> > > > > firmware that makes Linux skip instantiating rtas, but I still ge=
t serial
> > > > > output just not accessing PCI devices. So I think it should work =
and keeps
> > > > > things simpler at first. Then I'll try rtas later.
> > > > >=20
> > > > > > > While VOF can do rtas, this causes a problem with the hyperca=
ll method using
> > > > > > > sc 1 that goes through vhyp but trips the assert in ppc_store=
_sdr1() so
> > > > > > > cannot work after guest is past quiesce.
> > > > > >=20
> > > > > > > So the question is why is that
> > > > > > > assert there
> > > > > >=20
> > > > > > Ah.. right.  So, vhyp was designed for the PAPR use case, where=
 we
> > > > > > want to model the CPU when it's in supervisor and user mode, bu=
t not
> > > > > > when it's in hypervisor mode.  We want qemu to mimic the behavi=
our of
> > > > > > the hypervisor, rather than attempting to actually execute hype=
rvisor
> > > > > > code in the virtual CPU.
> > > > > >=20
> > > > > > On systems that have a hypervisor mode, SDR1 is hypervisor priv=
ileged,
> > > > > > so it makes no sense for the guest to attempt to set it.  That =
should
> > > > > > be caught by the general SPR code and turned into a 0x700, henc=
e the
> > > > > > assert() if we somehow reach ppc_store_sdr1().
> > > > > >=20
> > > > > > So, we are seeing a problem here because you want the 'sc 1'
> > > > > > interception of vhyp, but not the rest of the stuff that goes w=
ith it.
> > > > > >=20
> > > > > > > and would using sc 1 for hypercalls on pegasos2 cause other
> > > > > > > problems later even if the assert could be removed?
> > > > > >=20
> > > > > > At least in the short term, I think you probably can remove the
> > > > > > assert.  In your case the 'sc 1' calls aren't truly to a hyperv=
isor,
> > > > > > but a special case escape to qemu for the firmware emulation.  =
I think
> > > > > > it's unlikely to cause problems later, because nothing on a 32-=
bit
> > > > > > system should be attempting an 'sc 1'.  The only thing I can th=
ink of
> > > > > > that would fail is some test case which explicitly verified tha=
t 'sc
> > > > > > 1' triggered a 0x700 (SIGILL from userspace).
> > > > >=20
> > > > > OK so the assert should check if the CPU has an HV bit. I think t=
here was a
> > > > > #detine for that somewhere that I can add to the assert then I ca=
n try that.
> > > > > What I wasn't sure about is that sc 1 would conflict with the gue=
st's usage
> > > > > of normal sc calls or are these going through different paths and=
 only sc 1
> > > > > will trigger vhyp callback not affecting notmal sc calls?
> > > >=20
> > > > The vhyp shouldn't affect normal system calls, 'sc 1' is specifical=
ly
> > > > for hypercalls, as opposed to normal 'sc' (a.k.a. 'sc 0'), and the
> > > > vhyp only intercepts the hypercall version (after all Linux on PAPR
> > > > certainly uses its own system calls, and hypercalls are active for =
the
> > > > lifetime of the guest there).
> > > >=20
> > > > > (Or if this causes
> > > > > an otherwise unnecessary VM exit on KVM even when it works then m=
aybe
> > > > > looking for a different way in the future might be needed.
> > > >=20
> > > > What you're doing here won't work with KVM as it stands.  There are
> > > > basically two paths into the vhyp hypercall path: 1) from TCG, if we
> > > > interpret an 'sc 1' instruction we enter vhyp, 2) from KVM, if we g=
et
> > > > a KVM_EXIT_PAPR_HCALL KVM exit then we also go to the vhyp path.
> > > >=20
> > > > The second path is specific to the PAPR (ppc64) implementation of K=
VM,
> > > > and will not work for a non-PAPR platform without substantial
> > > > modification of the KVM code.
> > >=20
> > > OK so then at that point when we try KVM we'll need to look at altern=
ative
> > > ways, I think MOL OSI worked with KVM at least in MOL but will probab=
ly make
> > > all syscalls exit KVM but since we'll probably need to use KVM PR it =
will
> > > exit anyway. For now I keep this vhyp as it does not run with KVM for=
 other
> > > reasons yet so that's another area to clean up so as a proof of conce=
pt
> > > first version of using VOF vhyp will do.
> >=20
> > Eh, since you'll need to modify KVM anyway, it probably makes just as
> > much sense to modify it to catch the 'sc 1' as MoL's magic thingy.
>=20
> I'm not sure how KVM works for this case so I also don't know why and what
> would need to be modified. I think we'll only have KVM PR working as newer
> POWER CPUs having HV (besides being rare among potential users) are proba=
bly
> too different to run the OSes that expect at most a G4 on pegasos2 so lik=
ely
> it won't work with KVM HV.

Oh, it definitely won't work with KVM HV.

> If we have KVM PR doesn't sc already trap so we
> could add MOL OSI without further modification to KVM itself only needing
> change in QEMU?

Uh... I guess so?

> I also hope that MOL OSI could be useful for porting some
> paravirt drivers from MOL for running Mac OS X on Mac emulation but I don=
't
> know about that for sure so I'm open to any other solution too.

Maybe.  I never know much about MOL to begin with, and anything I did
know was a decade or more ago so I've probably forgotten.

> For now I'm
> going with vhyp which is enough fot testing with TCG and if somebody wants
> KVM they could use he original firmware for now so this could be improved=
 in
> a later version unless a simple solution is found before the freeze for 6=
=2E1.
> If we're in KVM PR what happens for sc 1 could that be used too so maybe
> what we have now could work?

Note that if you do go down the MOL path it wouldn't be that complex
to make a "vMOL" interface so you can use the same mechanism for KVM
and TCG.

> > > [...]
> > > > > > > I've tested that the missing rtas is not the reason for getti=
ng no output
> > > > > > > via serial though, as even when disabling rtas on pegasos2.ro=
m it boots and
> > > > > > > I still get serial output just some PCI devices are not detec=
ted (such as
> > > > > > > USB, the video card and the not emulated ethernet port but th=
ese are not
> > > > > > > fatal so it might even work as a first try without rtas, just=
 to boot a
> > > > > > > Linux kernel for testing it would be enough if I can fix the =
serial output).
> > > > > > > I still don't know why it's not finding serial but I think it=
 may be some
> > > > > > > missing or wrong info in the device tree I generat. I'll try =
to focus on
> > > > > > > this for now and leave the above rtas question for later.
> > > > > >=20
> > > > > > Oh.. another thought on that.  You have an ISA serial port on P=
egasos,
> > > > > > I believe.  I wonder if the PCI->ISA bridge needs some configur=
ation /
> > > > > > initialization that the firmware is expected to do.  If so you'=
ll need
> > > > > > to mimic that setup in qemu for the VOF case.
> > > > >=20
> > > > > That's what I begin to think because I've added everything to the=
 device
> > > > > tree that I thought could be needed and I still don't get it work=
ing so it
> > > > > may need some config from the firmware. But how do I access devic=
e registers
> > > > > from board code? I've tried adding a machine reset method and wri=
te to
> > > > > memory mapped device registers but all my attempts failed. I've t=
ried
> > > > > cpu_stl_le_data and even memory_region_dispatch_write but these d=
id not get
> > > > > to the device. What's the way to access guest mmio regs from QEMU?
> > > >=20
> > > > That's odd, cpu_stl() and memory_region_dispatch_write() should work
> > > > from board code (after the relevant memory regions are configured, =
of
> > > > course).  As an ISA serial port, it's probably accessed through IO
> > > > space, not memory space though, so you'd need &address_space_io.  A=
nd
> > > > if there is some bridge configuration then it's the bridge control
> > > > registers you need to look at not the serial registers - you'd have=
 to
> > > > look at the bridge documentation for that.  Or, I guess the bridge
> > > > implementation in qemu, which you wrote part of.
> > >=20
> > > I've found at last that stl_le_phys() works. There are so many of the=
se that
> > > I never know when to use which.
> > >=20
> > > I think the address_space_rw calls in vof_client_call() in vof.c coul=
d also
> > > use these for somewhat shorter code. I've ended up with
> > > stl_le_phys(CPU(cpu)->as, addr, val) in my machine reset methodbut I =
don't
> > > even need that now as it works without additional setup. Also VOF's m=
emory
> > > access is basically the same as the already existing rtas_st() and co=
=2E so
> > > maybe that could be reused to make code smaller?
> >=20
> > rtas_ld() and rtas_st() should only be used for reading/writing RTAS
> > parameters to and from memory.  Accessing IO shouldn't be done with
> > those.
> >=20
> > For IO you probably want the cpu_st*() variants in most cases, since
> > you're trying to emulate an IO access from the virtual cpu.
>=20
> I think I've tried that but what worked to access mmio device registers a=
re
> stl_le_phys and similar that are wrappers around address_space_stl_*. But=
 I
> did not mean that for rtas_ld/_st but the part when vof accessing the
> parameters passed by its hypercall which is memory access:
>=20
> https://github.com/patchew-project/qemu/blob/patchew/20210520090557.43568=
9-1-aik%40ozlabs.ru/hw/ppc/vof.c
>=20
> line 893, and vof_client_call before that is very similar to what h_rtas
> does here:
>=20
> https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dhw/ppc/spapr_hcall.c;h=3D=
f25014afda408002ee1ec1027a0dd7a6025eca61;hb=3DHEAD#l639
>=20
> and I also need to do the same for rtas in pegasos2 for which I'm just us=
ing
> ldl_be_phys for now but I wonder if we really need 3 ways to do the same =
or
> the rtas_ld/_st could be made more generic and reused here?

For your rtas implementation you could definitely re-use them.  For
the client call I'm a bit less confident, but if the in-guest-memory
structures are really the same, then it would make sense.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+80HpdrM9cgIx0Ia
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC3OdIACgkQbDjKyiDZ
s5LPIA/+IGOrmhh88qhZVV05MGhwSZLBkkGIi2MUHPO7lB+/iAZFwj+ACFWqNF/w
jrYNA4gcG4TWPknesIiMf+1jjWTsp4xMveHvasUH4J2gPRJcUzrJdOSM0q7B9HpK
3D+meUVSxWJ1MOSwkgAPtr2Htvr5f//zOp3tQthjOYJ59J0HVVay/uJqqrH6sC7S
9sWE+JQQBg4ULFSJGthAin5IyOEWjOBENqwhrFHLoPKJG+G/ouObwbWUWoXZLql7
ejS9M/LpNW5l4Q3K7sk7181/h6wRHWjdOc694uwBOTGWxc6hY0OFbqhfBhJZVd3r
HwS91MaakAr541RQm3m5xkxrkFXiRUrZItY3MpwAojPjq/5YdCBs1AGfBJbb9NV8
mnPJGYsCujjMgBW+oqWBRk9AwOl0MtAqJS7g+3e55ZIyK60oDKbinexAxz8B69us
GxSvUUqVeTmvqV/Cvs5r4bm0bJUXy2eyVxSy59lU7kKhsXKdad5mYd6CpsW1OA08
b8VhceXp3eoSb0X9T3+sqs95YQtai70gKk37uKJjZq0nRVmTE07nAYGLBMj/W4A1
XcZGc+UcVxybMLb2kF8z8RJBFxg3n/1MD75QfoEsTocJOtfIkxyQZoVpRQhWGl16
uSBc78H7GXBTBYh1lmF9XWsr1UvFk/SSJMK6/XxP7lvs4s/cmc4=
=eoMU
-----END PGP SIGNATURE-----

--+80HpdrM9cgIx0Ia--

