Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540DD3E8A93
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 08:51:35 +0200 (CEST)
Received: from localhost ([::1]:33718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDi5O-0002m9-7e
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 02:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDi0i-00069d-JQ; Wed, 11 Aug 2021 02:46:44 -0400
Received: from ozlabs.org ([203.11.71.1]:55997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDi0g-0002S4-5j; Wed, 11 Aug 2021 02:46:44 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Gl0j53WSlz9sWd; Wed, 11 Aug 2021 16:46:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628664393;
 bh=uhL84R6flwQnN02FPQN91WIkALs2c2Y/Lj7uc9Z5qIk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=blHLDr9MxaPsuLHcPI9lkq7S/a/kKDzpG8OSYczO5A1XyDOM4amRko5LQSWJ+GBss
 dTlTDmmFlMBk5QcTls1tobZ7i6jCK8sTbp30Q+6DnnNdf968NOlOJH3RHm6A07ATz8
 A/SNf0gUB/2z/txZw6+l73M1+Opk6Abgyc0zbQjA=
Date: Wed, 11 Aug 2021 13:32:26 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 06/19] target/ppc/pmu_book3s_helper: enable PMC1-PMC4
 events
Message-ID: <YRNEyrrSnmrVywpK@yekko>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-7-danielhb413@gmail.com>
 <YRH1j9vNmgs71/Z6@yekko>
 <7a016dad-963c-c1b9-91dd-a383e8e5c743@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tQgVo3/PReoAbz4j"
Content-Disposition: inline
In-Reply-To: <7a016dad-963c-c1b9-91dd-a383e8e5c743@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: gustavo.romero@linaro.org, clg@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--tQgVo3/PReoAbz4j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 10, 2021 at 12:03:15PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 8/10/21 12:42 AM, David Gibson wrote:
> > On Mon, Aug 09, 2021 at 10:10:44AM -0300, Daniel Henrique Barboza wrote:
> > > So far the PMU logic was using PMC5 for instruction counting (linux
> > > kernel PM_INST_CMPL) and PMC6 to count cycles (PM_CYC). We aren't usi=
ng
> > > PMCs 1-4.
> > >=20
> > > Let's enable all PMCs to count these 2 events we already provide. The
> > > logic used to calculate PMC5 is now being provided by
> > > update_PMC_PM_INST_CMPL() and PMC6 logic is now implemented in
> > > update_PMC_PM_CYC().
> > >=20
> > > The enablement of these 2 events for all PMUs are done by using the
> > > Linux kernel definition of those events: 0x02 for PM_INST_CMPL and 0x=
1e
> > > for PM_CYC,
> >=20
> > I'm confused by this.  Surely the specific values here should be
> > defined by the hardware, not by Linux.
>=20
> The hardware/PowerISA defines these events as follows for all counters:
>=20
> 00 Disable events. (No events occur.)
> 01-BF Implementation-dependent
> C0-DF Reserved
>=20
> And then hardware events defined by the ISA goes from E0 to FF. Each coun=
ter
> has a different set of hardware defined events in this range.
>=20
> The Linux perf driver defines some events in the 'Implementation-dependen=
t'
> area, allowing for events codes such as '0x02' to count instructions
> completed in PMC1 even though this event is not defined in the ISA for th=
is
> PMC. I am assuming that the real hardware - at least the ones that IBM
> produces - does this mapping internally. I'll ask around to see if I find
> out whether it's the HW or some part of the Perf subsystem that I don't
> comprehend that are doing it.
>=20
>=20
> I am not particularly happy about having to rely on 'implementation-depen=
dent'
> fields that are defined by the Perf subsystem of Linux in the emulator
> code that should be OS-agnostic. Unfortunately, I didn't find any alterna=
tive
> to make the kernel operate this PMU implementation other than baking these
> event codes into the PMU logic.

Ok, so they are hardware defined, just not architecture defined,
IIUC.  I think that just needs a change to the description - and
making it more explicit that this is the power9 (?) PMU you're
modelling specifically not the (barely) architected "book3s" PMU.

>=20
>=20
> Thanks,
>=20
>=20
> Daniel
>=20
>=20
> >=20
> > > all of those defined by specific bits in MMCR1 for each PMC.
> > > PMCs 1-4 relies on the correct event to be defined in MMCR1. PMC5 and
> > > PMC6 will count PM_INST_CMPL and PMC_CYC, respectively, regardless of
> > > MMCR1 setup.
> > >=20
> > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > ---
> > >   target/ppc/cpu.h               |  8 +++++
> > >   target/ppc/pmu_book3s_helper.c | 60 +++++++++++++++++++++++++++++++=
+--
> > >   2 files changed, 65 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> > > index 8cea8f2aca..afd9cd402b 100644
> > > --- a/target/ppc/cpu.h
> > > +++ b/target/ppc/cpu.h
> > > @@ -350,6 +350,14 @@ typedef struct ppc_v3_pate_t {
> > >   #define MMCR0_FCECE PPC_BIT(38)         /* FC on Enabled Cond or Ev=
ent */
> > >   #define MMCR0_PMCC  PPC_BITMASK(44, 45) /* PMC Control */
> > > +#define MMCR1_PMC1SEL_SHIFT (63 - 39)
> > > +#define MMCR1_PMC1SEL PPC_BITMASK(32, 39)
> > > +#define MMCR1_PMC2SEL_SHIFT (63 - 47)
> > > +#define MMCR1_PMC2SEL PPC_BITMASK(40, 47)
> > > +#define MMCR1_PMC3SEL_SHIFT (63 - 55)
> > > +#define MMCR1_PMC3SEL PPC_BITMASK(48, 55)
> > > +#define MMCR1_PMC4SEL PPC_BITMASK(56, 63)
> > > +
> > >   /* LPCR bits */
> > >   #define LPCR_VPM0         PPC_BIT(0)
> > >   #define LPCR_VPM1         PPC_BIT(1)
> > > diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_h=
elper.c
> > > index 0994531f65..99e62bd37b 100644
> > > --- a/target/ppc/pmu_book3s_helper.c
> > > +++ b/target/ppc/pmu_book3s_helper.c
> > > @@ -28,6 +28,56 @@ static uint64_t get_cycles(uint64_t insns)
> > >       return insns * 4;
> > >   }
> > > +static void update_PMC_PM_INST_CMPL(CPUPPCState *env, int sprn,
> > > +                                    uint64_t curr_icount)
> > > +{
> > > +    env->spr[sprn] +=3D curr_icount - env->pmu_base_icount;
> > > +}
> > > +
> > > +static void update_PMC_PM_CYC(CPUPPCState *env, int sprn,
> > > +                              uint64_t curr_icount)
> > > +{
> > > +    uint64_t insns =3D curr_icount - env->pmu_base_icount;
> > > +    env->spr[sprn] +=3D get_cycles(insns);
> > > +}
> > > +
> > > +static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
> > > +                                        uint64_t curr_icount)
> > > +{
> > > +    int event;
> > > +
> > > +    switch (sprn) {
> > > +    case SPR_POWER_PMC1:
> > > +        event =3D MMCR1_PMC1SEL & env->spr[SPR_POWER_MMCR1];
> > > +        event =3D event >> MMCR1_PMC1SEL_SHIFT;
> > > +        break;
> > > +    case SPR_POWER_PMC2:
> > > +        event =3D MMCR1_PMC2SEL & env->spr[SPR_POWER_MMCR1];
> > > +        event =3D event >> MMCR1_PMC2SEL_SHIFT;
> > > +        break;
> > > +    case SPR_POWER_PMC3:
> > > +        event =3D MMCR1_PMC3SEL & env->spr[SPR_POWER_MMCR1];
> > > +        event =3D event >> MMCR1_PMC3SEL_SHIFT;
> > > +        break;
> > > +    case SPR_POWER_PMC4:
> > > +        event =3D MMCR1_PMC4SEL & env->spr[SPR_POWER_MMCR1];
> > > +        break;
> > > +    default:
> > > +        return;
> > > +    }
> > > +
> > > +    switch (event) {
> > > +    case 0x2:
> > > +        update_PMC_PM_INST_CMPL(env, sprn, curr_icount);
> > > +        break;
> > > +    case 0x1E:
> > > +        update_PMC_PM_CYC(env, sprn, curr_icount);
> > > +        break;
> > > +    default:
> > > +        return;
> > > +    }
> > > +}
> > > +
> > >   /*
> > >    * Set all PMCs values after a PMU freeze via MMCR0_FC.
> > >    *
> > > @@ -37,10 +87,14 @@ static uint64_t get_cycles(uint64_t insns)
> > >   static void update_PMCs_on_freeze(CPUPPCState *env)
> > >   {
> > >       uint64_t curr_icount =3D get_insns();
> > > +    int sprn;
> > > +
> > > +    for (sprn =3D SPR_POWER_PMC1; sprn < SPR_POWER_PMC5; sprn++) {
> > > +        update_programmable_PMC_reg(env, sprn, curr_icount);
> > > +    }
> > > -    env->spr[SPR_POWER_PMC5] +=3D curr_icount - env->pmu_base_icount;
> > > -    env->spr[SPR_POWER_PMC6] +=3D get_cycles(curr_icount -
> > > -                                           env->pmu_base_icount);
> > > +    update_PMC_PM_INST_CMPL(env, SPR_POWER_PMC5, curr_icount);
> > > +    update_PMC_PM_CYC(env, SPR_POWER_PMC6, curr_icount);
> > >   }
> > >   void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tQgVo3/PReoAbz4j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmETRMgACgkQbDjKyiDZ
s5K1QA//d/A/Vesva0NGAZchFz+Pc2xXBQ2TaHGtRrLAHSv9QC4uqkd56VZN6r9X
gNvg/wwNpV47ECrCR6Afhrsb70Pc0tkCx7rcKa0fXlOyYRD1VQj7gcUCu5wSQYmz
KSCWko8LmGTnrXv5kE6PAfZlG/9zIzkycurFgEqVPA4CUq4FqaxB0hfD2TUD5uZ6
9c9xy1uUl7Kv9jfFlp6taEzbKKE9okEVu8Sj7TGPH3O9Bn61g17NtSrITZlNsQAF
gRRDUTW8pIQv8j+m/xQsRMWqeEh6OI0gCBkOWWb7I5qqwu0mnZiujvs/P6lJuU+S
N8FyLDfN/SD61D7OvNLz942dV6QUYTNvGqXzyb3fn6xoODwSU3HM4sJxbQWUjQQ6
c6gFmCxQvHynMLkDBLA04fAorcTyGgLSpWiqqW50exEyQfAA7n1u99qBZpq8lOl5
iPgVQdVCcnO62kDnBXuvkL9bmOzueo8OMS0X0YqA6YooNPpbH7dY8+RzoqOM8MWt
Y0Am5r8KlRt8cQVxseh9+r7jAB8BIoBDNcP9u5cDpFnm1UIAYYanUHRQmf1cS7pa
e5p/ApSxpSR+kR9uzeauFlyzmr9f4WxWFNUZA/kKpYUMoz5vw6VIdzlplLWgnOGg
Wh0hJntUE7bj5D324pn72xfRpocRQ3QpFMIm4hJMqGHuEFBwzxI=
=mk/M
-----END PGP SIGNATURE-----

--tQgVo3/PReoAbz4j--

