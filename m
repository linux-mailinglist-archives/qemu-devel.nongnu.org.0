Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8832A39B2A5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 08:32:57 +0200 (CEST)
Received: from localhost ([::1]:51416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp3O4-0005wt-FI
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 02:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lp3LO-0003hu-Uc; Fri, 04 Jun 2021 02:30:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46221 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lp3LK-0001bn-RW; Fri, 04 Jun 2021 02:30:10 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FxCYP4SwLz9sVt; Fri,  4 Jun 2021 16:30:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622788201;
 bh=Gd/uS0Qq7AN2nCcvKBaCi5I8gSzasJBXSrIbwNj7TK0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OoamkkudvwsH9ywUWM00aQHlhE0rfF5UZIn+VzoO7N9ja7hNz4rClwCQAgDaiPwio
 8rOdx34o0ooxngYlo5Z4WfMHOJt0CQoADfpvkFvw0kbvwt7nUV9axVogAtim4bDNJK
 cmn0YpsxkcWpRwY/1eOxhEZKJcr+SZyNpTta9880=
Date: Fri, 4 Jun 2021 16:29:53 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
Message-ID: <YLnIYRz+tGaXssVd@yekko>
References: <7a4e47e5-59b-9132-eafd-d84d8b73f5c@eik.bme.hu>
 <17fbb016-2e7-d57e-bedd-1ae7814fb860@eik.bme.hu>
 <YKtBJoQXSrSVENFw@yekko>
 <939a489f-40de-da33-dd7-9fd1f5eb190@eik.bme.hu>
 <YKyJ3I5QIDLwR99t@yekko>
 <894b8b19-576d-8b25-922f-58613bad8545@eik.bme.hu>
 <YK8vbO7x2C8kaBWZ@yekko>
 <653edbe1-f912-bc8f-ec7f-c4f069b0a5b9@eik.bme.hu>
 <YLc507CyOVq403TM@yekko>
 <4046a5c1-6c67-7597-90b9-df1751e7ca47@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7NvBoHawYatVbMvn"
Content-Disposition: inline
In-Reply-To: <4046a5c1-6c67-7597-90b9-df1751e7ca47@eik.bme.hu>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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


--7NvBoHawYatVbMvn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 02, 2021 at 02:29:29PM +0200, BALATON Zoltan wrote:
> On Wed, 2 Jun 2021, David Gibson wrote:
> > On Thu, May 27, 2021 at 02:42:39PM +0200, BALATON Zoltan wrote:
> > > On Thu, 27 May 2021, David Gibson wrote:
> > > > On Tue, May 25, 2021 at 12:08:45PM +0200, BALATON Zoltan wrote:
> > > > > On Tue, 25 May 2021, David Gibson wrote:
> > > > > > On Mon, May 24, 2021 at 12:55:07PM +0200, BALATON Zoltan wrote:
> > > > > > > On Mon, 24 May 2021, David Gibson wrote:
> > > > > > > > On Sun, May 23, 2021 at 07:09:26PM +0200, BALATON Zoltan wr=
ote:
> > > > > > > > > On Sun, 23 May 2021, BALATON Zoltan wrote:
> > > > > > > > > > On Sun, 23 May 2021, Alexey Kardashevskiy wrote:
> > > > > > > > > > > One thing to note about PCI is that normally I think =
the client
> > > > > > > > > > > expects the firmware to do PCI probing and SLOF does =
it. But VOF
> > > > > > > > > > > does not and Linux scans PCI bus(es) itself. Might be=
 a problem for
> > > > > > > > > > > you kernel.
> > > > > > > > > >=20
> > > > > > > > > > I'm not sure what info does MorphOS get from the device=
 tree and what it
> > > > > > > > > > probes itself but I think it may at least need device i=
ds and info about
> > > > > > > > > > the PCI bus to be able to access the config regs, after=
 that it should
> > > > > > > > > > set the devices up hopefully. I could add these from th=
e board code to
> > > > > > > > > > device tree so VOF does not need to do anything about i=
t. However I'm
> > > > > > > > > > not getting to that point yet because it crashes on som=
ething that it's
> > > > > > > > > > missing and couldn't yet find out what is that.
> > > > > > > > > >=20
> > > > > > > > > > I'd like to get Linux working now as that would be enou=
gh to test this
> > > > > > > > > > and then if for MorphOS we still need a ROM it's not a =
problem if at
> > > > > > > > > > least we can boot Linux without the original firmware. =
But I can't make
> > > > > > > > > > Linux open a serial console and I don't know what it ne=
eds for that. Do
> > > > > > > > > > you happen to know? I've looked at the sources in Linux=
/arch/powerpc but
> > > > > > > > > > not sure how it would find and open a serial port on pe=
gasos2. It seems
> > > > > > > > > > to work with the board firmware and now I can get it to=
 boot with VOF
> > > > > > > > > > but then it does not open serial so it probably needs s=
omething in the
> > > > > > > > > > device tree or expects the firmware to set something up=
 that we should
> > > > > > > > > > add in pegasos2.c when using VOF.
> > > > > > > > >=20
> > > > > > > > > I've now found that Linux uses rtas methods read-pci-conf=
ig and
> > > > > > > > > write-pci-config for PCI access on pegasos2 so this means=
 that we'll
> > > > > > > > > probably need rtas too (I hoped we could get away without=
 it if it were only
> > > > > > > > > used for shutdown/reboot or so but seems Linux needs it f=
or PCI as well and
> > > > > > > > > does not scan the bus and won't find some devices without=
 it).
> > > > > > > >=20
> > > > > > > > Yes, definitely sounds like you'll need an RTAS implementat=
ion.
> > > > > > >=20
> > > > > > > I plan to fix that after managed to get serial working as tha=
t seems to not
> > > > > > > need it. If I delete the rtas-size property from /rtas on the=
 original
> > > > > > > firmware that makes Linux skip instantiating rtas, but I stil=
l get serial
> > > > > > > output just not accessing PCI devices. So I think it should w=
ork and keeps
> > > > > > > things simpler at first. Then I'll try rtas later.
> > > > > > >=20
> > > > > > > > > While VOF can do rtas, this causes a problem with the hyp=
ercall method using
> > > > > > > > > sc 1 that goes through vhyp but trips the assert in ppc_s=
tore_sdr1() so
> > > > > > > > > cannot work after guest is past quiesce.
> > > > > > > >=20
> > > > > > > > > So the question is why is that
> > > > > > > > > assert there
> > > > > > > >=20
> > > > > > > > Ah.. right.  So, vhyp was designed for the PAPR use case, w=
here we
> > > > > > > > want to model the CPU when it's in supervisor and user mode=
, but not
> > > > > > > > when it's in hypervisor mode.  We want qemu to mimic the be=
haviour of
> > > > > > > > the hypervisor, rather than attempting to actually execute =
hypervisor
> > > > > > > > code in the virtual CPU.
> > > > > > > >=20
> > > > > > > > On systems that have a hypervisor mode, SDR1 is hypervisor =
privileged,
> > > > > > > > so it makes no sense for the guest to attempt to set it.  T=
hat should
> > > > > > > > be caught by the general SPR code and turned into a 0x700, =
hence the
> > > > > > > > assert() if we somehow reach ppc_store_sdr1().
> > > > > > > >=20
> > > > > > > > So, we are seeing a problem here because you want the 'sc 1'
> > > > > > > > interception of vhyp, but not the rest of the stuff that go=
es with it.
> > > > > > > >=20
> > > > > > > > > and would using sc 1 for hypercalls on pegasos2 cause oth=
er
> > > > > > > > > problems later even if the assert could be removed?
> > > > > > > >=20
> > > > > > > > At least in the short term, I think you probably can remove=
 the
> > > > > > > > assert.  In your case the 'sc 1' calls aren't truly to a hy=
pervisor,
> > > > > > > > but a special case escape to qemu for the firmware emulatio=
n.  I think
> > > > > > > > it's unlikely to cause problems later, because nothing on a=
 32-bit
> > > > > > > > system should be attempting an 'sc 1'.  The only thing I ca=
n think of
> > > > > > > > that would fail is some test case which explicitly verified=
 that 'sc
> > > > > > > > 1' triggered a 0x700 (SIGILL from userspace).
> > > > > > >=20
> > > > > > > OK so the assert should check if the CPU has an HV bit. I thi=
nk there was a
> > > > > > > #detine for that somewhere that I can add to the assert then =
I can try that.
> > > > > > > What I wasn't sure about is that sc 1 would conflict with the=
 guest's usage
> > > > > > > of normal sc calls or are these going through different paths=
 and only sc 1
> > > > > > > will trigger vhyp callback not affecting notmal sc calls?
> > > > > >=20
> > > > > > The vhyp shouldn't affect normal system calls, 'sc 1' is specif=
ically
> > > > > > for hypercalls, as opposed to normal 'sc' (a.k.a. 'sc 0'), and =
the
> > > > > > vhyp only intercepts the hypercall version (after all Linux on =
PAPR
> > > > > > certainly uses its own system calls, and hypercalls are active =
for the
> > > > > > lifetime of the guest there).
> > > > > >=20
> > > > > > > (Or if this causes
> > > > > > > an otherwise unnecessary VM exit on KVM even when it works th=
en maybe
> > > > > > > looking for a different way in the future might be needed.
> > > > > >=20
> > > > > > What you're doing here won't work with KVM as it stands.  There=
 are
> > > > > > basically two paths into the vhyp hypercall path: 1) from TCG, =
if we
> > > > > > interpret an 'sc 1' instruction we enter vhyp, 2) from KVM, if =
we get
> > > > > > a KVM_EXIT_PAPR_HCALL KVM exit then we also go to the vhyp path.
> > > > > >=20
> > > > > > The second path is specific to the PAPR (ppc64) implementation =
of KVM,
> > > > > > and will not work for a non-PAPR platform without substantial
> > > > > > modification of the KVM code.
> > > > >=20
> > > > > OK so then at that point when we try KVM we'll need to look at al=
ternative
> > > > > ways, I think MOL OSI worked with KVM at least in MOL but will pr=
obably make
> > > > > all syscalls exit KVM but since we'll probably need to use KVM PR=
 it will
> > > > > exit anyway. For now I keep this vhyp as it does not run with KVM=
 for other
> > > > > reasons yet so that's another area to clean up so as a proof of c=
oncept
> > > > > first version of using VOF vhyp will do.
> > > >=20
> > > > Eh, since you'll need to modify KVM anyway, it probably makes just =
as
> > > > much sense to modify it to catch the 'sc 1' as MoL's magic thingy.
> > >=20
> > > I'm not sure how KVM works for this case so I also don't know why and=
 what
> > > would need to be modified. I think we'll only have KVM PR working as =
newer
> > > POWER CPUs having HV (besides being rare among potential users) are p=
robably
> > > too different to run the OSes that expect at most a G4 on pegasos2 so=
 likely
> > > it won't work with KVM HV.
> >=20
> > Oh, it definitely won't work with KVM HV.
> >=20
> > > If we have KVM PR doesn't sc already trap so we
> > > could add MOL OSI without further modification to KVM itself only nee=
ding
> > > change in QEMU?
> >=20
> > Uh... I guess so?
> >=20
> > > I also hope that MOL OSI could be useful for porting some
> > > paravirt drivers from MOL for running Mac OS X on Mac emulation but I=
 don't
> > > know about that for sure so I'm open to any other solution too.
> >=20
> > Maybe.  I never know much about MOL to begin with, and anything I did
> > know was a decade or more ago so I've probably forgotten.
>=20
> That may still be more than what I know about it since I never had any
> knowledge about PPC KVM and don't have any PPC hardware to test with so I=
'm
> mostly guessing. (I could test with KVM emulated in QEMU and I did set up=
 an
> environment for that but that's a bit slow and inconvenient so I'd leave =
KVM
> support to those interested and have more knowledge and hardware for it.)

Sounds like a problem for someone else another time, then.

> > > For now I'm
> > > going with vhyp which is enough fot testing with TCG and if somebody =
wants
> > > KVM they could use he original firmware for now so this could be impr=
oved in
> > > a later version unless a simple solution is found before the freeze f=
or 6.1.
> > > If we're in KVM PR what happens for sc 1 could that be used too so ma=
ybe
> > > what we have now could work?
> >=20
> > Note that if you do go down the MOL path it wouldn't be that complex
> > to make a "vMOL" interface so you can use the same mechanism for KVM
> > and TCG.
>=20
> Not sure what you mean by VMOL. Is it modifying MOL to use sc 1 like VOF
> instead of its OSI way for hypercalls?

No, I mean on the qemu side adding an optional hook which will
intercept sc 0 instructions with the MOL magic register values and
redirect them to a machine registered callback, rather than emulating
the CPU's behaviour of jumping to the system call vector in guest
space.

Basically an equivalent of vhyp, but for MOL magic syscalls, instead
of hypercalls.

> That would lose the advantage of
> being able to reuse MOL guest drivers without modification (which might be
> useful for running OS X guest on Mac emulation) so if we can't use vhyp t=
hen
> maybe using OSI would be the next choice for this reason but for now vhyp
> seems to be working for what I could test so unless somebody here sees a
> problem with it and has a better idea I'm going with vhyp for now just
> because that's what VOF uses and I don't want to modify VOF to reuse it as
> it is so I don't need to maintain a separate version and also get any
> enhancements without further need to sync with spapr VOF.
>=20
> I've found this document about possible hypercall interfaces on KVM (see
> Hypercall ABIs at the end):
>=20
> https://www.kernel.org/doc/html/latest/virt/kvm/ppc-pv.html
>=20
> Having both ePAPR (1.) and PAPR (2.) hypercalls is a bit confusing. Does
> vhyp correspond to 2. PAPR?

Yes.

> The ePAPR (1.) seems to be preferred by KVM and
> MOL OSI supported for compatibility.

That document looks pretty out of date.  Most of it is only discussing
KVM PR, which is now barely maintained.  KVM HV only works with PAPR
hypercalls.

> So if we need something else instead of
> 2. PAPR hypercalls there seems to be two options: ePAPR and MOL OSI which
> should work with KVM but then I'm not sure how to handle those on TCG.
>=20
> > > > > [...]
> > > > > > > > > I've tested that the missing rtas is not the reason for g=
etting no output
> > > > > > > > > via serial though, as even when disabling rtas on pegasos=
2.rom it boots and
> > > > > > > > > I still get serial output just some PCI devices are not d=
etected (such as
> > > > > > > > > USB, the video card and the not emulated ethernet port bu=
t these are not
> > > > > > > > > fatal so it might even work as a first try without rtas, =
just to boot a
> > > > > > > > > Linux kernel for testing it would be enough if I can fix =
the serial output).
> > > > > > > > > I still don't know why it's not finding serial but I thin=
k it may be some
> > > > > > > > > missing or wrong info in the device tree I generat. I'll =
try to focus on
> > > > > > > > > this for now and leave the above rtas question for later.
> > > > > > > >=20
> > > > > > > > Oh.. another thought on that.  You have an ISA serial port =
on Pegasos,
> > > > > > > > I believe.  I wonder if the PCI->ISA bridge needs some conf=
iguration /
> > > > > > > > initialization that the firmware is expected to do.  If so =
you'll need
> > > > > > > > to mimic that setup in qemu for the VOF case.
> > > > > > >=20
> > > > > > > That's what I begin to think because I've added everything to=
 the device
> > > > > > > tree that I thought could be needed and I still don't get it =
working so it
> > > > > > > may need some config from the firmware. But how do I access d=
evice registers
> > > > > > > from board code? I've tried adding a machine reset method and=
 write to
> > > > > > > memory mapped device registers but all my attempts failed. I'=
ve tried
> > > > > > > cpu_stl_le_data and even memory_region_dispatch_write but the=
se did not get
> > > > > > > to the device. What's the way to access guest mmio regs from =
QEMU?
> > > > > >=20
> > > > > > That's odd, cpu_stl() and memory_region_dispatch_write() should=
 work
> > > > > > from board code (after the relevant memory regions are configur=
ed, of
> > > > > > course).  As an ISA serial port, it's probably accessed through=
 IO
> > > > > > space, not memory space though, so you'd need &address_space_io=
=2E  And
> > > > > > if there is some bridge configuration then it's the bridge cont=
rol
> > > > > > registers you need to look at not the serial registers - you'd =
have to
> > > > > > look at the bridge documentation for that.  Or, I guess the bri=
dge
> > > > > > implementation in qemu, which you wrote part of.
> > > > >=20
> > > > > I've found at last that stl_le_phys() works. There are so many of=
 these that
> > > > > I never know when to use which.
> > > > >=20
> > > > > I think the address_space_rw calls in vof_client_call() in vof.c =
could also
> > > > > use these for somewhat shorter code. I've ended up with
> > > > > stl_le_phys(CPU(cpu)->as, addr, val) in my machine reset methodbu=
t I don't
> > > > > even need that now as it works without additional setup. Also VOF=
's memory
> > > > > access is basically the same as the already existing rtas_st() an=
d co. so
> > > > > maybe that could be reused to make code smaller?
> > > >=20
> > > > rtas_ld() and rtas_st() should only be used for reading/writing RTAS
> > > > parameters to and from memory.  Accessing IO shouldn't be done with
> > > > those.
> > > >=20
> > > > For IO you probably want the cpu_st*() variants in most cases, since
> > > > you're trying to emulate an IO access from the virtual cpu.
> > >=20
> > > I think I've tried that but what worked to access mmio device registe=
rs are
> > > stl_le_phys and similar that are wrappers around address_space_stl_*.=
 But I
> > > did not mean that for rtas_ld/_st but the part when vof accessing the
> > > parameters passed by its hypercall which is memory access:
> > >=20
> > > https://github.com/patchew-project/qemu/blob/patchew/20210520090557.4=
35689-1-aik%40ozlabs.ru/hw/ppc/vof.c
> > >=20
> > > line 893, and vof_client_call before that is very similar to what h_r=
tas
> > > does here:
> > >=20
> > > https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dhw/ppc/spapr_hcall.c;=
h=3Df25014afda408002ee1ec1027a0dd7a6025eca61;hb=3DHEAD#l639
> > >=20
> > > and I also need to do the same for rtas in pegasos2 for which I'm jus=
t using
> > > ldl_be_phys for now but I wonder if we really need 3 ways to do the s=
ame or
> > > the rtas_ld/_st could be made more generic and reused here?
> >=20
> > For your rtas implementation you could definitely re-use them.  For
> > the client call I'm a bit less confident, but if the in-guest-memory
> > structures are really the same, then it would make sense.
>=20
> The memory structure seems very similar to me, the only difference is
> calling the first field service in VOF instead of token in RTAS. Both are
> just an array of big endian unit32_t with token, nargs, nret at the front
> followed by args and rets. Since these rtas_ld/st are defined in spapr.h I
> did not bother to split them off, so for pegasos2 rtas I'm just using the
> ldl_be_* functions directly for which these are a shorthand for. If these
> were split off for sharing between spapr rtas and VOF I may be able to re=
use
> them as well but it's not that important so just mentioned it as a possib=
le
> later clean up.

Ok, sounds reasonable to re-use them then, though maybe add an aliased
name for clarity ofci_{ld,st}(), maybe?  (for "Open Firmware Client
Interface")

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--7NvBoHawYatVbMvn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC5yGEACgkQbDjKyiDZ
s5KsoA/7BJNEdDf4cmT+uX1Md5IJEtcTdqBcg6UHffTf7CO6DI06ce8niqeTwZFN
9CXK/Gca1yMRgc1RlE/PVjJxBjd2bx3wsxnoPEt6B5yhFJkikWgPtkJU4aSHi5Nj
l12Ll4nYI14574wL+rGszI8ulUxa3T3DQntGuO42EHlfGM7/aKTFQprlXGKH7pqB
I+oF3es4LFXTaMANxDG5In1TVQcn8BWgzm56ywgOYNTbLRskIisnY1QxalWB6Yvb
QT5Ik2b1vASZJkyKJyLJzVlPzj+H9XahHUx2vnDT/fCKXr71gZidyhdC48Zhqk2b
0KxSjb+ZdcisadKrl7Jr153gJUUB/1OFxVNC7LpCgo+vEGwrEoa0rUAY+5woir50
PFx+woWZu/9tj3WOlxxgzuzSTqxqAbRtMf5NI5Cwi74M2aSY5kCYNh/sOeppNVjL
eZ4Zjpr4L2fbOVW23f0Kg2T/WS993l2GYA8VEAAxZ4UHOCBk2U6sQJRcO5lnxf6o
IQlOpGeOoMZUxyvP3ATSnglfQqApHC6LReoS9emMCm3wGjm25JdPBWwLeIdxxGgH
RnNQ++ap3j/Vj811ZOpDtGn4N76o0bvOtxBn5cc+xcoXF6uukBdboteoxc2OwEgo
y5HAkcSaud+9gmB0j/mJJIcihCllXrxP9dYe8cqb2IyN7rOvlt4=
=q4UP
-----END PGP SIGNATURE-----

--7NvBoHawYatVbMvn--

