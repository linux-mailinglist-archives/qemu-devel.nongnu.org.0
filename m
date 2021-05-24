Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E6438E16D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 09:20:49 +0200 (CEST)
Received: from localhost ([::1]:43888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll4tM-0003B0-Ve
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 03:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll4rp-000164-HJ; Mon, 24 May 2021 03:19:13 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35765 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll4rm-00018z-Nz; Mon, 24 May 2021 03:19:13 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FpT962BbGz9sVv; Mon, 24 May 2021 17:19:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621840746;
 bh=TyuO9xag8slLY8s6oSYWlrrlBFA03QTtpaYWqBdo+LM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Srd4KD1Jwx+Nvmz0xP1oFtQfhqZtt/vEjBFvObpRcJuuUn69PCTUNE+71GUXYP/lS
 1MuuS5sorYOm86CgIni+yko6tNuhrjQvOH+yuWJZf69cJP4OfX+mrb6eGmMD7OiCe8
 QPi25dxONyuEqWu4RkuoQPZTCNDFFcEbTYdibmcc=
Date: Mon, 24 May 2021 16:01:10 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
Message-ID: <YKtBJoQXSrSVENFw@yekko>
References: <20210520090557.435689-1-aik@ozlabs.ru>
 <eb49cd30-a4f4-d063-d728-521446a671a6@eik.bme.hu>
 <5825cde5-a408-a438-116d-5a9d9113a52a@ozlabs.ru>
 <ec1742e3-c47-bbee-3a6-ec64442922ab@eik.bme.hu>
 <8527c8d2-c1e7-b3f8-0bda-529ba3864701@ozlabs.ru>
 <babe39af-fd34-8c5-de99-a0f485bfbce@eik.bme.hu>
 <4f6ceca3-5f18-fe70-18f9-4efde8feb1ed@ozlabs.ru>
 <7a4e47e5-59b-9132-eafd-d84d8b73f5c@eik.bme.hu>
 <17fbb016-2e7-d57e-bedd-1ae7814fb860@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fY0G+NmdVzYeCCe9"
Content-Disposition: inline
In-Reply-To: <17fbb016-2e7-d57e-bedd-1ae7814fb860@eik.bme.hu>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--fY0G+NmdVzYeCCe9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 23, 2021 at 07:09:26PM +0200, BALATON Zoltan wrote:
> On Sun, 23 May 2021, BALATON Zoltan wrote:
> > On Sun, 23 May 2021, Alexey Kardashevskiy wrote:
> > > One thing to note about PCI is that normally I think the client
> > > expects the firmware to do PCI probing and SLOF does it. But VOF
> > > does not and Linux scans PCI bus(es) itself. Might be a problem for
> > > you kernel.
> >=20
> > I'm not sure what info does MorphOS get from the device tree and what it
> > probes itself but I think it may at least need device ids and info about
> > the PCI bus to be able to access the config regs, after that it should
> > set the devices up hopefully. I could add these from the board code to
> > device tree so VOF does not need to do anything about it. However I'm
> > not getting to that point yet because it crashes on something that it's
> > missing and couldn't yet find out what is that.
> >=20
> > I'd like to get Linux working now as that would be enough to test this
> > and then if for MorphOS we still need a ROM it's not a problem if at
> > least we can boot Linux without the original firmware. But I can't make
> > Linux open a serial console and I don't know what it needs for that. Do
> > you happen to know? I've looked at the sources in Linux/arch/powerpc but
> > not sure how it would find and open a serial port on pegasos2. It seems
> > to work with the board firmware and now I can get it to boot with VOF
> > but then it does not open serial so it probably needs something in the
> > device tree or expects the firmware to set something up that we should
> > add in pegasos2.c when using VOF.
>=20
> I've now found that Linux uses rtas methods read-pci-config and
> write-pci-config for PCI access on pegasos2 so this means that we'll
> probably need rtas too (I hoped we could get away without it if it were o=
nly
> used for shutdown/reboot or so but seems Linux needs it for PCI as well a=
nd
> does not scan the bus and won't find some devices without it).

Yes, definitely sounds like you'll need an RTAS implementation.

> While VOF can do rtas, this causes a problem with the hypercall method us=
ing
> sc 1 that goes through vhyp but trips the assert in ppc_store_sdr1() so
> cannot work after guest is past quiesce.

> So the question is why is that
> assert there

Ah.. right.  So, vhyp was designed for the PAPR use case, where we
want to model the CPU when it's in supervisor and user mode, but not
when it's in hypervisor mode.  We want qemu to mimic the behaviour of
the hypervisor, rather than attempting to actually execute hypervisor
code in the virtual CPU.

On systems that have a hypervisor mode, SDR1 is hypervisor privileged,
so it makes no sense for the guest to attempt to set it.  That should
be caught by the general SPR code and turned into a 0x700, hence the
assert() if we somehow reach ppc_store_sdr1().

So, we are seeing a problem here because you want the 'sc 1'
interception of vhyp, but not the rest of the stuff that goes with it.

> and would using sc 1 for hypercalls on pegasos2 cause other
> problems later even if the assert could be removed?

At least in the short term, I think you probably can remove the
assert.  In your case the 'sc 1' calls aren't truly to a hypervisor,
but a special case escape to qemu for the firmware emulation.  I think
it's unlikely to cause problems later, because nothing on a 32-bit
system should be attempting an 'sc 1'.  The only thing I can think of
that would fail is some test case which explicitly verified that 'sc
1' triggered a 0x700 (SIGILL from userspace).

> Can somebody who knows
> more about it explain this please? If this cannot be resolved then we may
> need a different hypercall method on pegasos2 (I've considered MOL OSI or
> are there other options? I may use some advice from people who know it
> better, especially the possible interaction with KVM later as the long te=
rm
> goal with pegasos2 is to be able to run with KVM on PPC hardware
> eventually.)

Right, you might need an alternative method eventually.  Really any
illegal instruction for your cpu is a possible candidate.  Bear in
mind that this is *not* truly a hypercall interface, instead it's
something we're special casing for the purposes of faking the
firmware.

The "attn" instruction used on BookE might be a reasonable candidate
(assuming it doesn't conflict with something on 32-bit BookS) - that's
often used for things like signalling the attention of hardware
debuggers, and this is somewhat akin.

Mostly it's just a matter of working out what would be least messy to
intercept in the TCG instruction decoding path.


> But this also means that if that assert cannot be dropped or
> there may be other problems with sc 1 hypercalls then we maybe cannot have
> the same vof.bin and we'll need a separate version that I would like to
> avoid if possible so if there's a simple way to keep it working or make
> vof.bin use alternate hypercall method without needing a separate binary
> that would be the direction I'd tend to go. Even if we need a seoarate
> version I'd like to keep as much common as possible.
>=20
> I've tested that the missing rtas is not the reason for getting no output
> via serial though, as even when disabling rtas on pegasos2.rom it boots a=
nd
> I still get serial output just some PCI devices are not detected (such as
> USB, the video card and the not emulated ethernet port but these are not
> fatal so it might even work as a first try without rtas, just to boot a
> Linux kernel for testing it would be enough if I can fix the serial outpu=
t).
> I still don't know why it's not finding serial but I think it may be some
> missing or wrong info in the device tree I generat. I'll try to focus on
> this for now and leave the above rtas question for later.

Oh.. another thought on that.  You have an ISA serial port on Pegasos,
I believe.  I wonder if the PCI->ISA bridge needs some configuration /
initialization that the firmware is expected to do.  If so you'll need
to mimic that setup in qemu for the VOF case.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--fY0G+NmdVzYeCCe9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCrQSQACgkQbDjKyiDZ
s5JqOQ/8Di+ICgu+kVDi9wfiOjv7tUiqo4V8dSZ7NtrKP6y+IaWZMNIK6zD8pQqE
sT8EmWj5IG+NDiEtaqdbrtocnaRn59WdtN/2JBTnWBETE8+8ylOBhsahFcD8//fF
mXX9YCTRcDoJAyiT/NRTnJc3Dd1zjXHlMZBrMh8G43FQ4hftZXa9Q4Hz8e7eCUjU
om7E1tr4j0pjqtvlO5uuzYrlJjiRL11DVhQqzqPNuHy7F5EylaYXj0+oyMUvCYKf
yKOTm8Lh9X+3ZBKZNZv62MoSpxnrs/a3H26FfF6dJSy1lr3jhCQ8P1EsuRUH174q
hsReSKYwW/p8zXt3Osg+1csjshF/NsN8vZBGwfEqaAnP26/+x8VdlSSIZH1HI2YK
iVQ0yc2+q/+asVFNriF53nimVybPbbRrdbHusQ4ZAYYJk2agt1k4GDhCypqGk9Ye
aU9w7hQ/GoVHIbcMjTPEZUe8brHBjzOSSjOPCJMLk53M19aNDz3TE15x10cx6XFV
I1JQBivBH076TgR455nrSxZYbO2LfTQ9Dv3xGZEk+DD/zKAs2MqIRIzSrCzz0VNF
ChyprWwh8AyH5zHP7C3NzOAgJ3nNJQ6vDnmuPDfmbbty74QEynxSG5WZ3OoQ8O55
CR92iKeGpF8hN7B3m+jEAX/R25w8mcw/AV7pDZbNE43tk5AWea4=
=m1ZP
-----END PGP SIGNATURE-----

--fY0G+NmdVzYeCCe9--

