Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 153043E9C1E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 03:59:06 +0200 (CEST)
Received: from localhost ([::1]:57484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDzzt-0006xZ-48
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 21:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDzxw-0005Jb-GW; Wed, 11 Aug 2021 21:57:04 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:43103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDzxt-0002h8-My; Wed, 11 Aug 2021 21:57:04 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GlVDT23f9z9sRK; Thu, 12 Aug 2021 11:56:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628733417;
 bh=236jO1nQ0cYKVXRsU3ZXF1yDpq1s0gsIOgm5xE7Oy3A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eAtZubsVU6UvR6/g4n4uBJzwmEIoe7PMjzERQsrOlz5UuFxdKsMIdpH0l5i6zxWaY
 fWa05+g5sibu1a4A4Y1fUBO3aktCWnbW1fJOKo3tGiGWfOJCXa2U1RfpCLCkOqCHW+
 /fLhXIShFhS/CXXoFP3PM9HCGhEjxdEwY/cWCpKc=
Date: Thu, 12 Aug 2021 11:52:23 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 06/19] target/ppc/pmu_book3s_helper: enable PMC1-PMC4
 events
Message-ID: <YRR+12NBDh8HRa3R@yekko>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-7-danielhb413@gmail.com>
 <YRH1j9vNmgs71/Z6@yekko>
 <7a016dad-963c-c1b9-91dd-a383e8e5c743@gmail.com>
 <1143001e-21ff-a8da-9e74-2720ff49145c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qMs8fnwYpVR2l/HR"
Content-Disposition: inline
In-Reply-To: <1143001e-21ff-a8da-9e74-2720ff49145c@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: gustavo.romero@linaro.org, clg@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--qMs8fnwYpVR2l/HR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 10, 2021 at 08:08:04PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 8/10/21 12:03 PM, Daniel Henrique Barboza wrote:
> >=20
> >=20
> > On 8/10/21 12:42 AM, David Gibson wrote:
> > > On Mon, Aug 09, 2021 at 10:10:44AM -0300, Daniel Henrique Barboza wro=
te:
> > > > So far the PMU logic was using PMC5 for instruction counting (linux
> > > > kernel PM_INST_CMPL) and PMC6 to count cycles (PM_CYC). We aren't u=
sing
> > > > PMCs 1-4.
> > > >=20
> > > > Let's enable all PMCs to count these 2 events we already provide. T=
he
> > > > logic used to calculate PMC5 is now being provided by
> > > > update_PMC_PM_INST_CMPL() and PMC6 logic is now implemented in
> > > > update_PMC_PM_CYC().
> > > >=20
> > > > The enablement of these 2 events for all PMUs are done by using the
> > > > Linux kernel definition of those events: 0x02 for PM_INST_CMPL and =
0x1e
> > > > for PM_CYC,
> > >=20
> > > I'm confused by this.=A0 Surely the specific values here should be
> > > defined by the hardware, not by Linux.
> >=20
> > The hardware/PowerISA defines these events as follows for all counters:
> >=20
> > 00 Disable events. (No events occur.)
> > 01-BF Implementation-dependent
> > C0-DF Reserved
> >=20
> > And then hardware events defined by the ISA goes from E0 to FF. Each co=
unter
> > has a different set of hardware defined events in this range.
> >=20
> > The Linux perf driver defines some events in the 'Implementation-depend=
ent'
> > area, allowing for events codes such as '0x02' to count instructions
> > completed in PMC1 even though this event is not defined in the ISA for =
this
> > PMC. I am assuming that the real hardware - at least the ones that IBM
> > produces - does this mapping internally. I'll ask around to see if I fi=
nd
> > out whether it's the HW or some part of the Perf subsystem that I don't
> > comprehend that are doing it.
>=20
> The kernel guys confirmed that the HW is aware of the implementantion-dep=
endent
> Perf event codes that the Linux kernel uses. Also, by reading the kernel =
code it
> is safe to say that this is true since Power7 at least.

Ok.  I'm pretty sure POWER6 and POWER5 have totally different PMUs
though.  So best to be explicit that this is the POWER7 (and later
compatible chips) PMU model you're building here.

> What we can do here to play nicer with other non-IBM PowerPC chips, that =
might
> not have the same implementation-dependent Perf events in the hardware, i=
s to make
> this mapping only for emulation of IBM processors.

Well.. I'm not sure there are any other chips claiming to implement
the architecture (at least recent versions).  But for the broad swath
of things that might be considered book3s it's much worse than that:
some of the POWER generations have completely different PMU designs.
It's not just different event values, but different numbers of PMCs,
different controls in the MMCRs different all sorts of things.

> That way we can emulate these
> events that IBM PMU implements while not making any assumptions for every=
 other
> PowerPC chip that implements Book3s.
>=20
>=20
> Thanks,
>=20
>=20
> Daniel
>=20
>=20
> >=20
> >=20
> > I am not particularly happy about having to rely on 'implementation-dep=
endent'
> > fields that are defined by the Perf subsystem of Linux in the emulator
> > code that should be OS-agnostic. Unfortunately, I didn't find any alter=
native
> > to make the kernel operate this PMU implementation other than baking th=
ese
> > event codes into the PMU logic.
> >=20
> >=20
> > Thanks,
> >=20
> >=20
> > Daniel
> >=20
> >=20
> > >=20
> > > > all of those defined by specific bits in MMCR1 for each PMC.
> > > > PMCs 1-4 relies on the correct event to be defined in MMCR1. PMC5 a=
nd
> > > > PMC6 will count PM_INST_CMPL and PMC_CYC, respectively, regardless =
of
> > > > MMCR1 setup.
> > > >=20
> > > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > > ---
> > > > =A0 target/ppc/cpu.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
 8 +++++
> > > > =A0 target/ppc/pmu_book3s_helper.c | 60 +++++++++++++++++++++++++++=
+++++--
> > > > =A0 2 files changed, 65 insertions(+), 3 deletions(-)
> > > >=20
> > > > diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> > > > index 8cea8f2aca..afd9cd402b 100644
> > > > --- a/target/ppc/cpu.h
> > > > +++ b/target/ppc/cpu.h
> > > > @@ -350,6 +350,14 @@ typedef struct ppc_v3_pate_t {
> > > > =A0 #define MMCR0_FCECE PPC_BIT(38)=A0=A0=A0=A0=A0=A0=A0=A0 /* FC o=
n Enabled Cond or Event */
> > > > =A0 #define MMCR0_PMCC=A0 PPC_BITMASK(44, 45) /* PMC Control */
> > > > +#define MMCR1_PMC1SEL_SHIFT (63 - 39)
> > > > +#define MMCR1_PMC1SEL PPC_BITMASK(32, 39)
> > > > +#define MMCR1_PMC2SEL_SHIFT (63 - 47)
> > > > +#define MMCR1_PMC2SEL PPC_BITMASK(40, 47)
> > > > +#define MMCR1_PMC3SEL_SHIFT (63 - 55)
> > > > +#define MMCR1_PMC3SEL PPC_BITMASK(48, 55)
> > > > +#define MMCR1_PMC4SEL PPC_BITMASK(56, 63)
> > > > +
> > > > =A0 /* LPCR bits */
> > > > =A0 #define LPCR_VPM0=A0=A0=A0=A0=A0=A0=A0=A0 PPC_BIT(0)
> > > > =A0 #define LPCR_VPM1=A0=A0=A0=A0=A0=A0=A0=A0 PPC_BIT(1)
> > > > diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s=
_helper.c
> > > > index 0994531f65..99e62bd37b 100644
> > > > --- a/target/ppc/pmu_book3s_helper.c
> > > > +++ b/target/ppc/pmu_book3s_helper.c
> > > > @@ -28,6 +28,56 @@ static uint64_t get_cycles(uint64_t insns)
> > > > =A0=A0=A0=A0=A0 return insns * 4;
> > > > =A0 }
> > > > +static void update_PMC_PM_INST_CMPL(CPUPPCState *env, int sprn,
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 uint64_t curr_icount)
> > > > +{
> > > > +=A0=A0=A0 env->spr[sprn] +=3D curr_icount - env->pmu_base_icount;
> > > > +}
> > > > +
> > > > +static void update_PMC_PM_CYC(CPUPPCState *env, int sprn,
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 uint64_t curr_icount)
> > > > +{
> > > > +=A0=A0=A0 uint64_t insns =3D curr_icount - env->pmu_base_icount;
> > > > +=A0=A0=A0 env->spr[sprn] +=3D get_cycles(insns);
> > > > +}
> > > > +
> > > > +static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 uint64_t curr_icount)
> > > > +{
> > > > +=A0=A0=A0 int event;
> > > > +
> > > > +=A0=A0=A0 switch (sprn) {
> > > > +=A0=A0=A0 case SPR_POWER_PMC1:
> > > > +=A0=A0=A0=A0=A0=A0=A0 event =3D MMCR1_PMC1SEL & env->spr[SPR_POWER=
_MMCR1];
> > > > +=A0=A0=A0=A0=A0=A0=A0 event =3D event >> MMCR1_PMC1SEL_SHIFT;
> > > > +=A0=A0=A0=A0=A0=A0=A0 break;
> > > > +=A0=A0=A0 case SPR_POWER_PMC2:
> > > > +=A0=A0=A0=A0=A0=A0=A0 event =3D MMCR1_PMC2SEL & env->spr[SPR_POWER=
_MMCR1];
> > > > +=A0=A0=A0=A0=A0=A0=A0 event =3D event >> MMCR1_PMC2SEL_SHIFT;
> > > > +=A0=A0=A0=A0=A0=A0=A0 break;
> > > > +=A0=A0=A0 case SPR_POWER_PMC3:
> > > > +=A0=A0=A0=A0=A0=A0=A0 event =3D MMCR1_PMC3SEL & env->spr[SPR_POWER=
_MMCR1];
> > > > +=A0=A0=A0=A0=A0=A0=A0 event =3D event >> MMCR1_PMC3SEL_SHIFT;
> > > > +=A0=A0=A0=A0=A0=A0=A0 break;
> > > > +=A0=A0=A0 case SPR_POWER_PMC4:
> > > > +=A0=A0=A0=A0=A0=A0=A0 event =3D MMCR1_PMC4SEL & env->spr[SPR_POWER=
_MMCR1];
> > > > +=A0=A0=A0=A0=A0=A0=A0 break;
> > > > +=A0=A0=A0 default:
> > > > +=A0=A0=A0=A0=A0=A0=A0 return;
> > > > +=A0=A0=A0 }
> > > > +
> > > > +=A0=A0=A0 switch (event) {
> > > > +=A0=A0=A0 case 0x2:
> > > > +=A0=A0=A0=A0=A0=A0=A0 update_PMC_PM_INST_CMPL(env, sprn, curr_icou=
nt);
> > > > +=A0=A0=A0=A0=A0=A0=A0 break;
> > > > +=A0=A0=A0 case 0x1E:
> > > > +=A0=A0=A0=A0=A0=A0=A0 update_PMC_PM_CYC(env, sprn, curr_icount);
> > > > +=A0=A0=A0=A0=A0=A0=A0 break;
> > > > +=A0=A0=A0 default:
> > > > +=A0=A0=A0=A0=A0=A0=A0 return;
> > > > +=A0=A0=A0 }
> > > > +}
> > > > +
> > > > =A0 /*
> > > > =A0=A0 * Set all PMCs values after a PMU freeze via MMCR0_FC.
> > > > =A0=A0 *
> > > > @@ -37,10 +87,14 @@ static uint64_t get_cycles(uint64_t insns)
> > > > =A0 static void update_PMCs_on_freeze(CPUPPCState *env)
> > > > =A0 {
> > > > =A0=A0=A0=A0=A0 uint64_t curr_icount =3D get_insns();
> > > > +=A0=A0=A0 int sprn;
> > > > +
> > > > +=A0=A0=A0 for (sprn =3D SPR_POWER_PMC1; sprn < SPR_POWER_PMC5; spr=
n++) {
> > > > +=A0=A0=A0=A0=A0=A0=A0 update_programmable_PMC_reg(env, sprn, curr_=
icount);
> > > > +=A0=A0=A0 }
> > > > -=A0=A0=A0 env->spr[SPR_POWER_PMC5] +=3D curr_icount - env->pmu_bas=
e_icount;
> > > > -=A0=A0=A0 env->spr[SPR_POWER_PMC6] +=3D get_cycles(curr_icount -
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 env->pmu_base_=
icount);
> > > > +=A0=A0=A0 update_PMC_PM_INST_CMPL(env, SPR_POWER_PMC5, curr_icount=
);
> > > > +=A0=A0=A0 update_PMC_PM_CYC(env, SPR_POWER_PMC6, curr_icount);
> > > > =A0 }
> > > > =A0 void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
> > >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qMs8fnwYpVR2l/HR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEUftcACgkQbDjKyiDZ
s5JoeBAA0jJKtjpPimM52QB6mi59KnH/lAgmY29tqKPERwURL6r6If6PciOTexcY
pHYVgUgxLZ7pZT2mUf0XrdTp7wErv/DNLnbZGyzbHoeV2k9HKGMfY7MkrClOqrAj
j50zz98Wz4wfqmev7Y7HSjwlvUEsQYT3bWGQM1WXI3+KYO59bmYXWq04HlmFIpiQ
Ojd98CzAey6FXupozp9VsXXVReL02LZIxj2vdgiVtM6lasX2cY1KfXOsIrN60V8N
GSvTTVzTWDd31hB7n3zheZfkE7aPSkaCb44bWAv4NSjMtOLYCgNVcxx+Fw04009s
tr8f7YALNw3qRHDWm253OmOqfFJfhQ0ncDc5//Y8BCbPa3Y0CwNGx91j2HZ5ocm6
+fRiN/sSfzymkvWDZymXKUNfQx2DazlhC5bd9bpFSpUQTc83Qr10I1wqfE62SiUc
ihkd9uSWki9PLYQyXxjoGQIW1pVO71WDhJWrLOpmVP1zwq48sxkygT67D1Y+k61l
1poDh0cBoNFoTd2yYUy4WLmKU6sPklQzfxeyxypZAtJpITCD9RviVWskCictRd7t
7yBM5kEPIwac5Z99J28I3c2i/kfolO/lHwj63ZqQX7LhaJtM6lGabcuS/kuVdXyP
yD0sCgDMPCKV/6xoCrPbDHa0ZPRCtQIHaM22ABJ68FfE4/phKUI=
=BRR8
-----END PGP SIGNATURE-----

--qMs8fnwYpVR2l/HR--

