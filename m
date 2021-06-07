Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DB739D3B8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 05:58:43 +0200 (CEST)
Received: from localhost ([::1]:57060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq6PS-0005Hr-MG
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 23:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6I5-0003w8-1d; Sun, 06 Jun 2021 23:51:05 -0400
Received: from ozlabs.org ([203.11.71.1]:45097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6Hu-0002mX-0i; Sun, 06 Jun 2021 23:51:03 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fyzt25075z9sfG; Mon,  7 Jun 2021 13:50:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623037834;
 bh=LX8+7AsHAlDRTcnHMbvmxYaeXs5aSk6sT0fjI4XkEQg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m8YhFuhpvBAomKSZfc6waJeV/guFCdbA/ui6iqp6wReDwxnmCfcybTMDAsmEODAry
 ZQZ0Qr40zBlhEjzVTqYJ68BbE9c9rd/isdA67ESRKGy/k6CQ91IivEFJy6eGDUg5J0
 BNTDDxhebsEDRGHiYxyYL1cEDoz06taLgbIFk7L8=
Date: Mon, 7 Jun 2021 13:30:10 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
Message-ID: <YL2Swhx/XqcPsn5s@yekko>
References: <YKtBJoQXSrSVENFw@yekko>
 <939a489f-40de-da33-dd7-9fd1f5eb190@eik.bme.hu>
 <YKyJ3I5QIDLwR99t@yekko>
 <894b8b19-576d-8b25-922f-58613bad8545@eik.bme.hu>
 <YK8vbO7x2C8kaBWZ@yekko>
 <653edbe1-f912-bc8f-ec7f-c4f069b0a5b9@eik.bme.hu>
 <YLc507CyOVq403TM@yekko>
 <4046a5c1-6c67-7597-90b9-df1751e7ca47@eik.bme.hu>
 <YLnIYRz+tGaXssVd@yekko>
 <3d7b7525-8919-ba90-ae98-e328273771a@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="X9r3heQ4vnjK3u/f"
Content-Disposition: inline
In-Reply-To: <3d7b7525-8919-ba90-ae98-e328273771a@eik.bme.hu>
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


--X9r3heQ4vnjK3u/f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 04, 2021 at 03:59:22PM +0200, BALATON Zoltan wrote:
> On Fri, 4 Jun 2021, David Gibson wrote:
> > On Wed, Jun 02, 2021 at 02:29:29PM +0200, BALATON Zoltan wrote:
> > > On Wed, 2 Jun 2021, David Gibson wrote:
> > > > On Thu, May 27, 2021 at 02:42:39PM +0200, BALATON Zoltan wrote:
> > > > > On Thu, 27 May 2021, David Gibson wrote:
> > > > > > On Tue, May 25, 2021 at 12:08:45PM +0200, BALATON Zoltan wrote:
> > > > > > > On Tue, 25 May 2021, David Gibson wrote:
> > > > > > > > On Mon, May 24, 2021 at 12:55:07PM +0200, BALATON Zoltan wr=
ote:
> > > > > > > > > On Mon, 24 May 2021, David Gibson wrote:
> > > > > > > > > > On Sun, May 23, 2021 at 07:09:26PM +0200, BALATON Zolta=
n wrote:
> > > > > > > > > > > On Sun, 23 May 2021, BALATON Zoltan wrote:
> > > > > > > > > > > > On Sun, 23 May 2021, Alexey Kardashevskiy wrote:
> > > > > > > > > > > > > One thing to note about PCI is that normally I th=
ink the client
> > > > > > > > > > > > > expects the firmware to do PCI probing and SLOF d=
oes it. But VOF
> > > > > > > > > > > > > does not and Linux scans PCI bus(es) itself. Migh=
t be a problem for
> > > > > > > > > > > > > you kernel.
> > > > > > > > > > > >=20
> > > > > > > > > > > > I'm not sure what info does MorphOS get from the de=
vice tree and what it
> > > > > > > > > > > > probes itself but I think it may at least need devi=
ce ids and info about
> > > > > > > > > > > > the PCI bus to be able to access the config regs, a=
fter that it should
> > > > > > > > > > > > set the devices up hopefully. I could add these fro=
m the board code to
> > > > > > > > > > > > device tree so VOF does not need to do anything abo=
ut it. However I'm
> > > > > > > > > > > > not getting to that point yet because it crashes on=
 something that it's
> > > > > > > > > > > > missing and couldn't yet find out what is that.
> > > > > > > > > > > >=20
> > > > > > > > > > > > I'd like to get Linux working now as that would be =
enough to test this
> > > > > > > > > > > > and then if for MorphOS we still need a ROM it's no=
t a problem if at
> > > > > > > > > > > > least we can boot Linux without the original firmwa=
re. But I can't make
> > > > > > > > > > > > Linux open a serial console and I don't know what i=
t needs for that. Do
> > > > > > > > > > > > you happen to know? I've looked at the sources in L=
inux/arch/powerpc but
> > > > > > > > > > > > not sure how it would find and open a serial port o=
n pegasos2. It seems
> > > > > > > > > > > > to work with the board firmware and now I can get i=
t to boot with VOF
> > > > > > > > > > > > but then it does not open serial so it probably nee=
ds something in the
> > > > > > > > > > > > device tree or expects the firmware to set somethin=
g up that we should
> > > > > > > > > > > > add in pegasos2.c when using VOF.
> > > > > > > > > > >=20
> > > > > > > > > > > I've now found that Linux uses rtas methods read-pci-=
config and
> > > > > > > > > > > write-pci-config for PCI access on pegasos2 so this m=
eans that we'll
> > > > > > > > > > > probably need rtas too (I hoped we could get away wit=
hout it if it were only
> > > > > > > > > > > used for shutdown/reboot or so but seems Linux needs =
it for PCI as well and
> > > > > > > > > > > does not scan the bus and won't find some devices wit=
hout it).
> > > > > > > > > >=20
> > > > > > > > > > Yes, definitely sounds like you'll need an RTAS impleme=
ntation.
> > > > > > > > >=20
> > > > > > > > > I plan to fix that after managed to get serial working as=
 that seems to not
> > > > > > > > > need it. If I delete the rtas-size property from /rtas on=
 the original
> > > > > > > > > firmware that makes Linux skip instantiating rtas, but I =
still get serial
> > > > > > > > > output just not accessing PCI devices. So I think it shou=
ld work and keeps
> > > > > > > > > things simpler at first. Then I'll try rtas later.
> > > > > > > > >=20
> > > > > > > > > > > While VOF can do rtas, this causes a problem with the=
 hypercall method using
> > > > > > > > > > > sc 1 that goes through vhyp but trips the assert in p=
pc_store_sdr1() so
> > > > > > > > > > > cannot work after guest is past quiesce.
> > > > > > > > > >=20
> > > > > > > > > > > So the question is why is that
> > > > > > > > > > > assert there
> > > > > > > > > >=20
> > > > > > > > > > Ah.. right.  So, vhyp was designed for the PAPR use cas=
e, where we
> > > > > > > > > > want to model the CPU when it's in supervisor and user =
mode, but not
> > > > > > > > > > when it's in hypervisor mode.  We want qemu to mimic th=
e behaviour of
> > > > > > > > > > the hypervisor, rather than attempting to actually exec=
ute hypervisor
> > > > > > > > > > code in the virtual CPU.
> > > > > > > > > >=20
> > > > > > > > > > On systems that have a hypervisor mode, SDR1 is hypervi=
sor privileged,
> > > > > > > > > > so it makes no sense for the guest to attempt to set it=
=2E  That should
> > > > > > > > > > be caught by the general SPR code and turned into a 0x7=
00, hence the
> > > > > > > > > > assert() if we somehow reach ppc_store_sdr1().
> > > > > > > > > >=20
> > > > > > > > > > So, we are seeing a problem here because you want the '=
sc 1'
> > > > > > > > > > interception of vhyp, but not the rest of the stuff tha=
t goes with it.
> > > > > > > > > >=20
> > > > > > > > > > > and would using sc 1 for hypercalls on pegasos2 cause=
 other
> > > > > > > > > > > problems later even if the assert could be removed?
> > > > > > > > > >=20
> > > > > > > > > > At least in the short term, I think you probably can re=
move the
> > > > > > > > > > assert.  In your case the 'sc 1' calls aren't truly to =
a hypervisor,
> > > > > > > > > > but a special case escape to qemu for the firmware emul=
ation.  I think
> > > > > > > > > > it's unlikely to cause problems later, because nothing =
on a 32-bit
> > > > > > > > > > system should be attempting an 'sc 1'.  The only thing =
I can think of
> > > > > > > > > > that would fail is some test case which explicitly veri=
fied that 'sc
> > > > > > > > > > 1' triggered a 0x700 (SIGILL from userspace).
> > > > > > > > >=20
> > > > > > > > > OK so the assert should check if the CPU has an HV bit. I=
 think there was a
> > > > > > > > > #detine for that somewhere that I can add to the assert t=
hen I can try that.
> > > > > > > > > What I wasn't sure about is that sc 1 would conflict with=
 the guest's usage
> > > > > > > > > of normal sc calls or are these going through different p=
aths and only sc 1
> > > > > > > > > will trigger vhyp callback not affecting notmal sc calls?
> > > > > > > >=20
> > > > > > > > The vhyp shouldn't affect normal system calls, 'sc 1' is sp=
ecifically
> > > > > > > > for hypercalls, as opposed to normal 'sc' (a.k.a. 'sc 0'), =
and the
> > > > > > > > vhyp only intercepts the hypercall version (after all Linux=
 on PAPR
> > > > > > > > certainly uses its own system calls, and hypercalls are act=
ive for the
> > > > > > > > lifetime of the guest there).
> > > > > > > >=20
> > > > > > > > > (Or if this causes
> > > > > > > > > an otherwise unnecessary VM exit on KVM even when it work=
s then maybe
> > > > > > > > > looking for a different way in the future might be needed.
> > > > > > > >=20
> > > > > > > > What you're doing here won't work with KVM as it stands.  T=
here are
> > > > > > > > basically two paths into the vhyp hypercall path: 1) from T=
CG, if we
> > > > > > > > interpret an 'sc 1' instruction we enter vhyp, 2) from KVM,=
 if we get
> > > > > > > > a KVM_EXIT_PAPR_HCALL KVM exit then we also go to the vhyp =
path.
> > > > > > > >=20
> > > > > > > > The second path is specific to the PAPR (ppc64) implementat=
ion of KVM,
> > > > > > > > and will not work for a non-PAPR platform without substanti=
al
> > > > > > > > modification of the KVM code.
> > > > > > >=20
> > > > > > > OK so then at that point when we try KVM we'll need to look a=
t alternative
> > > > > > > ways, I think MOL OSI worked with KVM at least in MOL but wil=
l probably make
> > > > > > > all syscalls exit KVM but since we'll probably need to use KV=
M PR it will
> > > > > > > exit anyway. For now I keep this vhyp as it does not run with=
 KVM for other
> > > > > > > reasons yet so that's another area to clean up so as a proof =
of concept
> > > > > > > first version of using VOF vhyp will do.
> > > > > >=20
> > > > > > Eh, since you'll need to modify KVM anyway, it probably makes j=
ust as
> > > > > > much sense to modify it to catch the 'sc 1' as MoL's magic thin=
gy.
> > > > >=20
> > > > > I'm not sure how KVM works for this case so I also don't know why=
 and what
> > > > > would need to be modified. I think we'll only have KVM PR working=
 as newer
> > > > > POWER CPUs having HV (besides being rare among potential users) a=
re probably
> > > > > too different to run the OSes that expect at most a G4 on pegasos=
2 so likely
> > > > > it won't work with KVM HV.
> > > >=20
> > > > Oh, it definitely won't work with KVM HV.
> > > >=20
> > > > > If we have KVM PR doesn't sc already trap so we
> > > > > could add MOL OSI without further modification to KVM itself only=
 needing
> > > > > change in QEMU?
> > > >=20
> > > > Uh... I guess so?
> > > >=20
> > > > > I also hope that MOL OSI could be useful for porting some
> > > > > paravirt drivers from MOL for running Mac OS X on Mac emulation b=
ut I don't
> > > > > know about that for sure so I'm open to any other solution too.
> > > >=20
> > > > Maybe.  I never know much about MOL to begin with, and anything I d=
id
> > > > know was a decade or more ago so I've probably forgotten.
> > >=20
> > > That may still be more than what I know about it since I never had any
> > > knowledge about PPC KVM and don't have any PPC hardware to test with =
so I'm
> > > mostly guessing. (I could test with KVM emulated in QEMU and I did se=
t up an
> > > environment for that but that's a bit slow and inconvenient so I'd le=
ave KVM
> > > support to those interested and have more knowledge and hardware for =
it.)
> >=20
> > Sounds like a problem for someone else another time, then.
> >=20
> > > > > For now I'm
> > > > > going with vhyp which is enough fot testing with TCG and if someb=
ody wants
> > > > > KVM they could use he original firmware for now so this could be =
improved in
> > > > > a later version unless a simple solution is found before the free=
ze for 6.1.
> > > > > If we're in KVM PR what happens for sc 1 could that be used too s=
o maybe
> > > > > what we have now could work?
> > > >=20
> > > > Note that if you do go down the MOL path it wouldn't be that complex
> > > > to make a "vMOL" interface so you can use the same mechanism for KVM
> > > > and TCG.
> > >=20
> > > Not sure what you mean by VMOL. Is it modifying MOL to use sc 1 like =
VOF
> > > instead of its OSI way for hypercalls?
> >=20
> > No, I mean on the qemu side adding an optional hook which will
> > intercept sc 0 instructions with the MOL magic register values and
> > redirect them to a machine registered callback, rather than emulating
> > the CPU's behaviour of jumping to the system call vector in guest
> > space.
> >=20
> > Basically an equivalent of vhyp, but for MOL magic syscalls, instead
> > of hypercalls.
>=20
> OK, that's basically what BenH's OSI patch I've linked to before did I
> think,

Ok, but probably cleaned up to more modern qemu approaches.

> it may just need updating for changes in target/ppc since that patch
> was created. However that would also mean we'd need another version of VOF
> that uses this instead of sc 1 then so unless we need that I'd keep a sin=
gle
> VOF that works for both spapr and pegasos2.

Yeah, fair enough.

> > > That would lose the advantage of
> > > being able to reuse MOL guest drivers without modification (which mig=
ht be
> > > useful for running OS X guest on Mac emulation) so if we can't use vh=
yp then
> > > maybe using OSI would be the next choice for this reason but for now =
vhyp
> > > seems to be working for what I could test so unless somebody here see=
s a
> > > problem with it and has a better idea I'm going with vhyp for now just
> > > because that's what VOF uses and I don't want to modify VOF to reuse =
it as
> > > it is so I don't need to maintain a separate version and also get any
> > > enhancements without further need to sync with spapr VOF.
> > >=20
> > > I've found this document about possible hypercall interfaces on KVM (=
see
> > > Hypercall ABIs at the end):
> > >=20
> > > https://www.kernel.org/doc/html/latest/virt/kvm/ppc-pv.html
> > >=20
> > > Having both ePAPR (1.) and PAPR (2.) hypercalls is a bit confusing. D=
oes
> > > vhyp correspond to 2. PAPR?
> >=20
> > Yes.
>=20
> What's ePAPR then and how is it different from PAPR? I mean the acronym n=
ot
> the hypercall method, the latter is explained in that doc but what ePAPR
> stands for and why is that method called like that is not clear to me.

Ok, history lesson time.

For a long time PAPR has been the document that described the OS
environment for IBM POWER based server hardware.  Before it was called
PAPR (POWER Architecture Platform Requirements) it was called the
"RPA" (Requirements for the POWER Architecture, I think?).  You might
see the old name in a few places.

Requiring a full Open Firmware and a bunch of other fairly heavyweight
stuff, PAPR really wasn't suitable for embedded ppc chips and boards.
The situation with those used to be a complete mess with basically
every board variant having it's own different firmware with its own
different way of presenting some fragments of vital data to the OS.

ePAPR - Embedded Power Architecture Platform Requirements - was
created as a standard to try to unify how this stuff was handled on
embedded ppc chips.  I was one of the authors on early versions of
it.  It's mostly based around giving the OS a flattened device tree,
with some deliberately minimal requirements on firmware initialization
and entry state.  Here's a link to one of those early versions:

http://elinux.org/images/c/cf/Power_ePAPR_APPROVED_v1.1.pdf

I thought there were later versions, but I couldn't seem to find any.
It's possible the process of refining later versions just petered out
as the embedded ppc world mostly died and the flattened device tree
development mostly moved to ARM.

Since some of the embedded chips from Freescale had hypervisor
capabilities, a hypercall model was added to ePAPR - but that wasn't
something I was greatly involved in, so I don't know much about it.

ePAPR is the reason that the original PAPR is sometimes referred to as
"sPAPR" to disambiguate.

> > > The ePAPR (1.) seems to be preferred by KVM and
> > > MOL OSI supported for compatibility.
> >=20
> > That document looks pretty out of date.  Most of it is only discussing
> > KVM PR, which is now barely maintained.  KVM HV only works with PAPR
> > hypercalls.
>=20
> The links says it's latest kernel docs, so maybe an update need to be sent
> to KVM?

I guess, but the chances of me finding time to do it are approximately
zero.

> > > So if we need something else instead of
> > > 2. PAPR hypercalls there seems to be two options: ePAPR and MOL OSI w=
hich
> > > should work with KVM but then I'm not sure how to handle those on TCG.
> > >=20
> > > > > > > [...]
> > > > > > > > > > > I've tested that the missing rtas is not the reason f=
or getting no output
> > > > > > > > > > > via serial though, as even when disabling rtas on peg=
asos2.rom it boots and
> > > > > > > > > > > I still get serial output just some PCI devices are n=
ot detected (such as
> > > > > > > > > > > USB, the video card and the not emulated ethernet por=
t but these are not
> > > > > > > > > > > fatal so it might even work as a first try without rt=
as, just to boot a
> > > > > > > > > > > Linux kernel for testing it would be enough if I can =
fix the serial output).
> > > > > > > > > > > I still don't know why it's not finding serial but I =
think it may be some
> > > > > > > > > > > missing or wrong info in the device tree I generat. I=
'll try to focus on
> > > > > > > > > > > this for now and leave the above rtas question for la=
ter.
> > > > > > > > > >=20
> > > > > > > > > > Oh.. another thought on that.  You have an ISA serial p=
ort on Pegasos,
> > > > > > > > > > I believe.  I wonder if the PCI->ISA bridge needs some =
configuration /
> > > > > > > > > > initialization that the firmware is expected to do.  If=
 so you'll need
> > > > > > > > > > to mimic that setup in qemu for the VOF case.
> > > > > > > > >=20
> > > > > > > > > That's what I begin to think because I've added everythin=
g to the device
> > > > > > > > > tree that I thought could be needed and I still don't get=
 it working so it
> > > > > > > > > may need some config from the firmware. But how do I acce=
ss device registers
> > > > > > > > > from board code? I've tried adding a machine reset method=
 and write to
> > > > > > > > > memory mapped device registers but all my attempts failed=
=2E I've tried
> > > > > > > > > cpu_stl_le_data and even memory_region_dispatch_write but=
 these did not get
> > > > > > > > > to the device. What's the way to access guest mmio regs f=
rom QEMU?
> > > > > > > >=20
> > > > > > > > That's odd, cpu_stl() and memory_region_dispatch_write() sh=
ould work
> > > > > > > > from board code (after the relevant memory regions are conf=
igured, of
> > > > > > > > course).  As an ISA serial port, it's probably accessed thr=
ough IO
> > > > > > > > space, not memory space though, so you'd need &address_spac=
e_io.  And
> > > > > > > > if there is some bridge configuration then it's the bridge =
control
> > > > > > > > registers you need to look at not the serial registers - yo=
u'd have to
> > > > > > > > look at the bridge documentation for that.  Or, I guess the=
 bridge
> > > > > > > > implementation in qemu, which you wrote part of.
> > > > > > >=20
> > > > > > > I've found at last that stl_le_phys() works. There are so man=
y of these that
> > > > > > > I never know when to use which.
> > > > > > >=20
> > > > > > > I think the address_space_rw calls in vof_client_call() in vo=
f.c could also
> > > > > > > use these for somewhat shorter code. I've ended up with
> > > > > > > stl_le_phys(CPU(cpu)->as, addr, val) in my machine reset meth=
odbut I don't
> > > > > > > even need that now as it works without additional setup. Also=
 VOF's memory
> > > > > > > access is basically the same as the already existing rtas_st(=
) and co. so
> > > > > > > maybe that could be reused to make code smaller?
> > > > > >=20
> > > > > > rtas_ld() and rtas_st() should only be used for reading/writing=
 RTAS
> > > > > > parameters to and from memory.  Accessing IO shouldn't be done =
with
> > > > > > those.
> > > > > >=20
> > > > > > For IO you probably want the cpu_st*() variants in most cases, =
since
> > > > > > you're trying to emulate an IO access from the virtual cpu.
> > > > >=20
> > > > > I think I've tried that but what worked to access mmio device reg=
isters are
> > > > > stl_le_phys and similar that are wrappers around address_space_st=
l_*. But I
> > > > > did not mean that for rtas_ld/_st but the part when vof accessing=
 the
> > > > > parameters passed by its hypercall which is memory access:
> > > > >=20
> > > > > https://github.com/patchew-project/qemu/blob/patchew/202105200905=
57.435689-1-aik%40ozlabs.ru/hw/ppc/vof.c
> > > > >=20
> > > > > line 893, and vof_client_call before that is very similar to what=
 h_rtas
> > > > > does here:
> > > > >=20
> > > > > https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dhw/ppc/spapr_hcal=
l.c;h=3Df25014afda408002ee1ec1027a0dd7a6025eca61;hb=3DHEAD#l639
> > > > >=20
> > > > > and I also need to do the same for rtas in pegasos2 for which I'm=
 just using
> > > > > ldl_be_phys for now but I wonder if we really need 3 ways to do t=
he same or
> > > > > the rtas_ld/_st could be made more generic and reused here?
> > > >=20
> > > > For your rtas implementation you could definitely re-use them.  For
> > > > the client call I'm a bit less confident, but if the in-guest-memory
> > > > structures are really the same, then it would make sense.
> > >=20
> > > The memory structure seems very similar to me, the only difference is
> > > calling the first field service in VOF instead of token in RTAS. Both=
 are
> > > just an array of big endian unit32_t with token, nargs, nret at the f=
ront
> > > followed by args and rets. Since these rtas_ld/st are defined in spap=
r.h I
> > > did not bother to split them off, so for pegasos2 rtas I'm just using=
 the
> > > ldl_be_* functions directly for which these are a shorthand for. If t=
hese
> > > were split off for sharing between spapr rtas and VOF I may be able t=
o reuse
> > > them as well but it's not that important so just mentioned it as a po=
ssible
> > > later clean up.
> >=20
> > Ok, sounds reasonable to re-use them then, though maybe add an aliased
> > name for clarity ofci_{ld,st}(), maybe?  (for "Open Firmware Client
> > Interface")
>=20
> I'll wait for what Alexey decides to do in the next VOF patch version and=
 if
> I can reuse that (I could if these were defined in vof.h). I don't want to
> come up with yet another abstraction to ldl_be_* which does not seem to m=
ake
> it more clear than using the actual functions for guest memory access whi=
ch
> is what we're doing while getting the hypercall args so I think either us=
ing
> ldl_be_* directly or reusing already existing rfas_ls/_st would make sense
> but adding similar funcs with another name just makes it more confusing.

Well, the point of the rtas_ld() functions isn't o be a different way
of accessing memory.  It's just a convenience wrapper that takes an
RTAS args array and an argument index and does the right thing to
retrieve it for you.

So, if your RTAS function implementation when you want to get argument
0, you just go rtas_ld(args, 0) - more readable than having a bunch of
offset calculations and a long winded call to the BE memory access
function.  You can look at the examples in hw/ppc/sppar_rtas.c to see
how its used.

Actually, looking again at how it works, you should probably only use
rtas_ld() if your general dispatch code has pre-parsed the args
structure into separate args and rets arrays, again as we do in
spapr_rtas.c

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--X9r3heQ4vnjK3u/f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC9ksAACgkQbDjKyiDZ
s5Kq+Q/9HLFjRBdOWEy9N2jayChSopx2cJdECYr4gdFjnLjWaqfrNDnyjDWwY5fa
wEngS9BR/CxNYNJET58dR8KO4NZPIqJg9yxsNps6aoajoUNO8+1GAWKL/JFf3Jum
oz5/YJz9QseDUM5N55sywYknoCcX4f7/6d6FnK+50U2iHEHvmNfVgZD3IQlyIaV9
bxT569dFYYsAxmd4WaAxwIlAZOSvO5vjscE+uerZDJ79BHatLg6WmA5PtxopgdIs
AiRIBQT5xp8h1y8SunOSUf0MuETBJn1aPza27q8/dJ38K48HyKZJOhepU8OBw8A0
p/w0O71QOwGTtgJwN1StmXY/O5yo2AUr5alABWmSCNGUyi4O+KhqIxQgx7Sxi2OL
d7YQ/WYgSuPJn56iwqX47iz94OZl3nTxJvJczqTeWBIy+ecT5vHCWMhbX68xwzp1
py0sJH0oI9zh33vCnm8EIHJR2cSZ9jCPmEeJEIq5/Opo70vNrhX9y6AULGeQ8k4+
rsD0xsXxhiX35FCKYqqbTCRzuLC1iQMYBRgedRlFwbO558rMuYGzNZhg1Z1oBPRn
YhU0hpdaBc7CAVa64zarrKKdqbp78u6JPrW6qZCHX48300MAYRK2xESCz9hwEyd5
Cxa7R/e3X4brdfGE6Tvt4wbY+phTkokwxzAjjU3Eu2c6VqAUzNA=
=arWu
-----END PGP SIGNATURE-----

--X9r3heQ4vnjK3u/f--

