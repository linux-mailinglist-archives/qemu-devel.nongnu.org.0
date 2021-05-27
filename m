Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CB7392854
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 09:15:40 +0200 (CEST)
Received: from localhost ([::1]:48010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmAF1-0001zO-Ff
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 03:15:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lmAC3-0006wz-RM; Thu, 27 May 2021 03:12:35 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35069 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lmAC1-0004jQ-EF; Thu, 27 May 2021 03:12:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FrJsx58MXz9sXV; Thu, 27 May 2021 17:12:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622099541;
 bh=zQ5GzFkSI56QC2qYx5sTwyUvHJntva3U3JHmhrZZEB0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qHBpwQGuMGlt98uY63XXGUGlWKncgfh7vRV7YUclcV2pU4dGLcd9akg95Xt7Wv0qq
 8UDlsoemp4GMTFG9ZWQV5fwoEyNl5Gv+E+zKccBlvEKjiR9DinbThx6oRnpHWI0aAL
 TPEER31Xlu8cnyIWWjgRRFc71qfPFOKbP/7XVzZA=
Date: Thu, 27 May 2021 15:31:27 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
Message-ID: <YK8ur8CMVhxe4HyD@yekko>
References: <ec1742e3-c47-bbee-3a6-ec64442922ab@eik.bme.hu>
 <8527c8d2-c1e7-b3f8-0bda-529ba3864701@ozlabs.ru>
 <babe39af-fd34-8c5-de99-a0f485bfbce@eik.bme.hu>
 <4f6ceca3-5f18-fe70-18f9-4efde8feb1ed@ozlabs.ru>
 <7a4e47e5-59b-9132-eafd-d84d8b73f5c@eik.bme.hu>
 <17fbb016-2e7-d57e-bedd-1ae7814fb860@eik.bme.hu>
 <YKtBJoQXSrSVENFw@yekko>
 <fe6791b0-6162-8331-cc-e6e29fc7d07b@eik.bme.hu>
 <YKyLNgZrG4IQw0E3@yekko>
 <a433cec-5524-93f-880-b74d5a8753fd@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cZ4qfviPfG7omgtd"
Content-Disposition: inline
In-Reply-To: <a433cec-5524-93f-880-b74d5a8753fd@eik.bme.hu>
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


--cZ4qfviPfG7omgtd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 11:55:43AM +0200, BALATON Zoltan wrote:
> On Tue, 25 May 2021, David Gibson wrote:
> > On Mon, May 24, 2021 at 02:42:30PM +0200, BALATON Zoltan wrote:
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
> > > >=20
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
> > >=20
> > > This seems to work to avoid my problem so I can leave vhyp enabled af=
ter
> > > qiuesce for now:
> > >=20
> > > diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
> > > index d957d1a687..13b87b9b36 100644
> > > --- a/target/ppc/cpu.c
> > > +++ b/target/ppc/cpu.c
> > > @@ -70,7 +70,7 @@ void ppc_store_sdr1(CPUPPCState *env, target_ulong =
value)
> > >  {
> > >      PowerPCCPU *cpu =3D env_archcpu(env);
> > >      qemu_log_mask(CPU_LOG_MMU, "%s: " TARGET_FMT_lx "\n", __func__, =
value);
> > > -    assert(!cpu->vhyp);
> > > +    assert(!cpu->env.has_hv_mode || !cpu->vhyp);
> > >  #if defined(TARGET_PPC64)
> > >      if (mmu_is_64bit(env->mmu_model)) {
> > >          target_ulong sdr_mask =3D SDR_64_HTABORG | SDR_64_HTABSIZE;
> > >=20
> > > But I wonder if the assert should also be moved within the TARGET_PPC=
64
> > > block and if we may need to generate some exception here instead. Not=
 sure
> > > what a real CPU would do in this case but if accessing sdr1 is privil=
eged in
> > > HV mode then there should be an exception or if that's catched
> > > elsewhere
> >=20
> > It should be caught elsehwere.  Specifically, when the SDR1 SPR is
> > registered, on CPUs with a hypervisor mode it should be registered as
> > hypervisor privileged, so the general mtspr dispatch logic should
> > generate the exception if it's called from !HV code.  The assert here
> > is just to sanity check that it has done so before we enter the actual
> > softmmu code.
>=20
> So what's the decision then? Remove this assert or modify it like above a=
nd
> move it to the TARGET_PPC64 block (as no 32 bit CPU should have an HV bit
> anyway).

Uh, I guess modify it with the if-hv-available thing.  Don't move it
under the ifdef, it still makes logical sense for 32-bit systems, even
though the HV available side should never trip.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cZ4qfviPfG7omgtd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCvLq0ACgkQbDjKyiDZ
s5KhJxAAvZOXbx2qnBpnSw+IzDP0zc/212TAj74WVIWOJvw8YO+dJI5MbkAlrmXe
B+OcjBj7YyQebzN6EIe5YjDAyvhrD1xrZMqxwGNytpG4PqR4U6pTuJcgYs0EAa58
BY/xEcJQTv0CWxDGflOaP8T0rZO5YiiYTAvxIJ0iXLsdsEDAgKC9v3Hz9/C/x3Ow
NKvovLAc8oRmRaiOkWKSvwh2U1F8ywNTSz9srqhB5TmXKrCWaUBA7iSYV1vQijLf
x4iJUqYXcq6LHyKgdH5lv6RDtkHgwbXrBmGeYub7gBoxqA86ZlHuV3A6upodRc/C
lISfkYtGO9eZCNWfCziqU891Fc4bx86qxH/6qiDZPcKYOVG4byXe7iicHr0DWdT1
yi1eU41z9LkIh8nLNiOvo76QnNKApvg+jN8Lg0gFry7fxxAK3QsAquPb4Mx2Hhoz
jYDA2bC0OynHZCoo7Iv2R7w9M0pm4Dpb/qSzRcPx8dnHCP7FLGHn7s+l5XMNrOTU
XxODYztdxV9Bq1xKWUTm07gPadyxTNNLZruu7gdOF8WuWB/bW/JAVcW10BByzq7B
xfWu9CCMUXEcsp46UE1nwvDPJFR7UeAvldicAZrL0lJbZhYt2qVytCojsHnmIDDK
PWt+TrhzCaB9b5fNDoTjiFILth/dVEk2lGenSFN1bInu8DYHX4I=
=JBFW
-----END PGP SIGNATURE-----

--cZ4qfviPfG7omgtd--

