Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 399C738F9F0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 07:32:10 +0200 (CEST)
Received: from localhost ([::1]:45266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llPfl-0001Bx-7w
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 01:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1llPdm-0007lh-1H; Tue, 25 May 2021 01:30:06 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:48987 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1llPdh-0001HQ-Fn; Tue, 25 May 2021 01:30:05 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fq2hh0QjMz9sVb; Tue, 25 May 2021 15:29:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621920596;
 bh=yoHGqqZPBEkTBcfq7sfrwEdj0dArHU4AOEtMVdeI6fg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fl/U4nPHulgbyvFw1rGKO9lYNRr/knkCuSW6K0BsFdfur/JSAb571eRDQ+LgFXV+0
 7eJ3yX8p+urm2mp63SB+MEojqimEyw9d+fuECZpO+j94EhXuS7RF9fc9+rQgsj24Vc
 QgAN6RYtg20q5/vSPl5iYv2/1XNGpMOTz6Cv0QR8=
Date: Tue, 25 May 2021 15:29:26 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
Message-ID: <YKyLNgZrG4IQw0E3@yekko>
References: <eb49cd30-a4f4-d063-d728-521446a671a6@eik.bme.hu>
 <5825cde5-a408-a438-116d-5a9d9113a52a@ozlabs.ru>
 <ec1742e3-c47-bbee-3a6-ec64442922ab@eik.bme.hu>
 <8527c8d2-c1e7-b3f8-0bda-529ba3864701@ozlabs.ru>
 <babe39af-fd34-8c5-de99-a0f485bfbce@eik.bme.hu>
 <4f6ceca3-5f18-fe70-18f9-4efde8feb1ed@ozlabs.ru>
 <7a4e47e5-59b-9132-eafd-d84d8b73f5c@eik.bme.hu>
 <17fbb016-2e7-d57e-bedd-1ae7814fb860@eik.bme.hu>
 <YKtBJoQXSrSVENFw@yekko>
 <fe6791b0-6162-8331-cc-e6e29fc7d07b@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wXl24uXUkcXB6lt8"
Content-Disposition: inline
In-Reply-To: <fe6791b0-6162-8331-cc-e6e29fc7d07b@eik.bme.hu>
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


--wXl24uXUkcXB6lt8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 24, 2021 at 02:42:30PM +0200, BALATON Zoltan wrote:
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
> >=20
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
>=20
> This seems to work to avoid my problem so I can leave vhyp enabled after
> qiuesce for now:
>=20
> diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
> index d957d1a687..13b87b9b36 100644
> --- a/target/ppc/cpu.c
> +++ b/target/ppc/cpu.c
> @@ -70,7 +70,7 @@ void ppc_store_sdr1(CPUPPCState *env, target_ulong valu=
e)
>  {
>      PowerPCCPU *cpu =3D env_archcpu(env);
>      qemu_log_mask(CPU_LOG_MMU, "%s: " TARGET_FMT_lx "\n", __func__, valu=
e);
> -    assert(!cpu->vhyp);
> +    assert(!cpu->env.has_hv_mode || !cpu->vhyp);
>  #if defined(TARGET_PPC64)
>      if (mmu_is_64bit(env->mmu_model)) {
>          target_ulong sdr_mask =3D SDR_64_HTABORG | SDR_64_HTABSIZE;
>=20
> But I wonder if the assert should also be moved within the TARGET_PPC64
> block and if we may need to generate some exception here instead. Not sure
> what a real CPU would do in this case but if accessing sdr1 is privileged=
 in
> HV mode then there should be an exception or if that's catched
> elsewhere

It should be caught elsehwere.  Specifically, when the SDR1 SPR is
registered, on CPUs with a hypervisor mode it should be registered as
hypervisor privileged, so the general mtspr dispatch logic should
generate the exception if it's called from !HV code.  The assert here
is just to sanity check that it has done so before we enter the actual
softmmu code.

> then this assert may not be needed at all. I can make a patch if you tell=
 me
> what should it do.
>=20
> Regards,
> BALATON Zoltan
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wXl24uXUkcXB6lt8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCsizYACgkQbDjKyiDZ
s5JQoRAAsJYq1cwRtEFjdjsZredDbMpGvGiHjQ9/wltww9zpqTzPFcS6J/1a4HhI
HNwECIOfuGRF378vpX5rqjhaUZhveS+tWsuBlAFHWpEp3UKqbYmVxXPSF8VbUflU
zOzpjuTib/QUDBG1kY7RdqxCXseys2xlIXZ3Now6JqtXlCmWB1xlK8L2CfbiQwBy
rFMyIWeYhcIJyl+TR72TMrQJHXXzOamSniC57DGv5Yz2P1ZAhUN/sj3UT83D6G4v
dDcI5luDu1LPxKOsrbLEkuJOfXDJFrGuAz7OEQC2YpC2quPMDuTYMuhF09SeDDN7
DSRusbAGX6OyZLq7saVCNJsKFOvukDlA1vYqYzeYVq+h0MDmwHoTo/45RGmUEz4j
nirNYCYFK+qWsJTQE9saQ/GjYRJQU4K89O+b6dZ6lwov1jhZubzzAILEDxFE1zlE
b85jYYcoe3470cWIbGd/FgyEycW+C2vW0+X4UGCMag4VcER8kA6EFGNXeZKAL1Ny
uiywMcZWpkmbC7Wd39OxU+oDgr23r3BUpTs0HYlIyvLxvPXO+2dgmptoj9XCK66s
cZjHgfE+T3pEV/DKKnomI6j9IfwDBMO0iUy3xNWJMMi6eWiw70o6SOCQpCnl2PmN
Y6GPPK8v+n4LNBQJYEEko+Jgd7qmHvEnUEQ7PsywoLCvIusgnOg=
=SoIP
-----END PGP SIGNATURE-----

--wXl24uXUkcXB6lt8--

