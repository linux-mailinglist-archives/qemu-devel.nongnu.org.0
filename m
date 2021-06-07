Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA5739D3B3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 05:57:00 +0200 (CEST)
Received: from localhost ([::1]:50588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq6Nn-0000xp-VU
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 23:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6I5-0003w7-18; Sun, 06 Jun 2021 23:51:05 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:40061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6Hu-0002mc-7v; Sun, 06 Jun 2021 23:51:03 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fyzt24ZHpz9sXh; Mon,  7 Jun 2021 13:50:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623037834;
 bh=Wc6B5BP17PqjB326d97CKjIyA5HXT/PniWYesWEffGA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TkC1Tx1gF3ki92qi123Z9/et+XIEFx0Ksvr0TmQR+vmAOwhl9Pyhqr5KLn+H6Stvt
 vpO7yokfzpWi+5nS2GV8J6sI4ckUn4cxJqjyi0qxGxnbA70yC8X3T+WOkq9Zd7jlDf
 rw83mM0jNu/z2+D3u1I3Yj5vyhuyeDLMSZkSDzHk=
Date: Mon, 7 Jun 2021 13:37:22 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
Message-ID: <YL2UcvIoUHFIVmXp@yekko>
References: <YKtBJoQXSrSVENFw@yekko>
 <939a489f-40de-da33-dd7-9fd1f5eb190@eik.bme.hu>
 <YKyJ3I5QIDLwR99t@yekko>
 <894b8b19-576d-8b25-922f-58613bad8545@eik.bme.hu>
 <YK8vbO7x2C8kaBWZ@yekko>
 <653edbe1-f912-bc8f-ec7f-c4f069b0a5b9@eik.bme.hu>
 <YLc507CyOVq403TM@yekko>
 <4046a5c1-6c67-7597-90b9-df1751e7ca47@eik.bme.hu>
 <YLnIYRz+tGaXssVd@yekko>
 <e908ae4-e48-395b-a737-8d4d2493f20@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ukabvsOGXhb/rOf8"
Content-Disposition: inline
In-Reply-To: <e908ae4-e48-395b-a737-8d4d2493f20@eik.bme.hu>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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


--ukabvsOGXhb/rOf8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 07, 2021 at 12:21:21AM +0200, BALATON Zoltan wrote:
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
>=20
> So now that it works on TCG with vhyp I tried what it would do on KVM PR
> with the sc 1 but I could only test that on QEMU itself running in a Linux
> guest. First I've hit missing this callback:
>=20
> https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dtarget/ppc/kvm.c;h=3D104a=
308abb5700b2fe075397271f314d7f607543;hb=3DHEAD#l856
>=20
> that I can fix by providing a callback in pegasos2.c that does what the e=
lse
> clause would do returning POWERPC_CPU(current_cpu)->env.spr[SPR_SDR1] (I
> guess that's the correct thing to do if it works without vhyp).

For your case, yes that's right.  Again vhyp is designed for the case
where the (hash) MMU is owned by the hypervisor.  But due to a gross
hack the way we communicate the userspace address of the hash table to
KVM PR is via the SDR1 register, which is why we need that hook.

> After getting past this, the host QEMU crashed on the first sc 1 call with
> this error:
>=20
> qemu: fatal: Trying to deliver HV exception (MSR) 8 with no HV support

> NIP 0000000000000148   LR 0000000000000590 CTR 0000000000000000 XER 00000=
00000000000 CPU#0
> MSR 000000000000d032 HID0 0000000060000000  HF 00004012 iidx 0 didx 0
> TB 00000203 876006644638 DECR 422427
> GPR00 0000000000000680 000000000000fe90 0000000000008e00 000000000000f005
> GPR04 000000000000fe9c 0000000000000001 0000000000000e78 0000000000000000
> GPR08 000000000000fe98 000000000000fe9c 0000000000000001 0000000000000000
> GPR12 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> GPR16 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> GPR20 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> GPR24 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> GPR28 0000000000000000 0000000000000000 0000000000008e9c 000000000000fe90
> CR 20000000  [ E  -  -  -  -  -  -  -  ]             RES ffffffffffffffff
> FPR00 bff0000000000000 0000000000000000 0000000000000000 0000000000000000
> FPR04 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> FPR08 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> FPR12 3ff553f7ced91687 0000000000000000 0000000000000000 0000000000000000
> FPR16 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> FPR20 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> FPR24 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> FPR28 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> FPSCR 0000000082004000
>  SRR0 00000000000001d4  SRR1 300000000000d032    PVR 00000000003c0301 VRS=
AVE 00000000ffffffff
> SPRG0 000000003fe00000 SPRG1 c00000000ff60000  SPRG2 c00000000ff60000  SP=
RG3 0000000000000000
> SPRG4 0000000000000000 SPRG5 0000000000000000  SPRG6 0000000000000000  SP=
RG7 0000000000000000
>  SDR1 000000003f000006   DAR f00000000090abf0  DSISR 0000000042000000
> Aborted (core dumped)
>=20
> (vof.bin looks like this:
>=20
>  100:   3c 40 00 00     lis     r2,0
>  104:   60 42 8e 00     ori     r2,r2,36352
>  108:   48 00 00 cc     b       0x1d4
>  10c:   3c 40 00 00     lis     r2,0
>  110:   60 42 8e 00     ori     r2,r2,36352
>  114:   94 21 ff 90     stwu    r1,-112(r1)
>  118:   93 e1 00 68     stw     r31,104(r1)
>  11c:   7f e8 02 a6     mflr    r31
>  120:   48 00 02 8d     bl      0x3ac
>  124:   60 00 00 00     nop
>  128:   7f e8 03 a6     mtlr    r31
>  12c:   83 e1 00 68     lwz     r31,104(r1)
>  130:   38 21 00 70     addi    r1,r1,112
>  134:   4e 80 00 20     blr
>  138:   7c 64 1b 78     mr      r4,r3
>  13c:   3c 60 00 00     lis     r3,0
>  140:   60 63 f0 05     ori     r3,r3,61445
>  144:   44 00 00 22     sc      1
>  148:   4e 80 00 20     blr
>=20
> so I think it's the sc 1 at 0x144) The error is coming from here:
>=20
> https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dtarget/ppc/excp_helper.c;=
h=3Dfd147e2a37662456d30f7ab74b23bfb036260ced;hb=3DHEAD#l830
>=20
> What does this mean? What would a real CPU do with this and where it could
> be catched to use as hypercall method on CPUs without HV or what else sho=
uld
> we do if we wanted this to work with KVM PR too in the future?

The interesting bit is actually how we're getting to that part of
powerpc_excp.  I guess we must be getting a KVM exit for that 'sc 1',
but I don't know what type.  If we can figure out that would be where
we'd need to intercept it and send it to the vhyp handler instead of
actually trying to enter the hypercall vector on the emulated CPU,
which doesn't have one.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ukabvsOGXhb/rOf8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC9lHIACgkQbDjKyiDZ
s5LfExAAkZtHUqiemWfH58/ii42KdUlG6mVDbCu9OUM2M8/vpBuovgpGjGSj8MPr
p75TBNeGMdL5CmG6dTYP8VSqWz7iLdf0Pf0ClKubsrH3Ttgedbs/zXhmbWrrRUMu
R/gnCbkOTl3j0VGM0j5/9PbxufJ2TXJADq1PZKpgGJ24DFUh+QvkiXjnC4Q7EC7q
e7l4sWdlcM9ldtTfrr/N8sgSMiZhs48gXURebUIlMwTFqO4VVm0VrQ3IuXquPqEi
DJm3qpf8GjokxuygZRMYOIFIX2mwWAAGrUOuoNMNJjYl96V0nOcOex0B9eSiT5Ta
/WnV7Xzb4woPY95f+UUy3q9/lnHpKyFF+UTpwScTCed4X3oXB+/R9aEVsjmHlC4D
tUniQvEJfzNq8hBjCgJeI5AWER7zrm7JorF3yvriT/d04UZYwm61UonlupS0Kn7b
jLBBHBk/iEAtHfSWuZaoiUpgztEzbXmP2JV7A9Mv5qmOURJQ0oCZW4+Z8WP/11Ya
Iz8vSwWpaOh1yx5YuJVvxeq2Hguy1x2CtxIcRwQ6psSYvG3hU0K/0RP3KxT7kcWA
W42mkVILENOWFvHgMKn6lCv5QTx8pO+ZsEjPPFHrKCVlUBxul3+ZrHpgecqsMxXY
SsxVs2SoEaxID7ls6CSbHDLgE1uD6VsL8Pn7PjhrrgLHlSa220w=
=o4Ud
-----END PGP SIGNATURE-----

--ukabvsOGXhb/rOf8--

