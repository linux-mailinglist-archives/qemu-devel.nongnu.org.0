Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 468C03E9D13
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 05:54:00 +0200 (CEST)
Received: from localhost ([::1]:36436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE1n4-0002R8-Oa
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 23:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mE1kT-00014C-1c; Wed, 11 Aug 2021 23:51:17 -0400
Received: from ozlabs.org ([203.11.71.1]:36953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mE1kO-00083x-Rb; Wed, 11 Aug 2021 23:51:16 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GlXmC229vz9t4b; Thu, 12 Aug 2021 13:51:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628740267;
 bh=N1+qrVFEoROvJBZPcJtzvhusTTBctVNVweE6sKtVTWI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j573mTq5RVylxCznV+6DBX8FKSW2jV/Oh/YRYlm/XAbGqeHHxat6h6jR7fIekqd8A
 TYgq9pkYyicGX5WcerMIOkSQt2uHLqtDeTltLoXe2b+mKibo90IW0QXkAVbkDbMKkt
 oe9oisx/09iY5wfFTW3+vHmyPGYH07vsnOegWjm4=
Date: Thu, 12 Aug 2021 13:39:38 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 12/19] target/ppc/pmu_book3s_helper.c: enable PMC1
 counter negative EBB
Message-ID: <YRSX+kRCEh1oQjWP@yekko>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-13-danielhb413@gmail.com>
 <YRH6IysrDvn/GJvQ@yekko>
 <6a10c0a7-1c4f-0d24-f2cc-12666e590739@gmail.com>
 <YRNGo8CnfUSC/bQs@yekko>
 <4df4dacf-ba9b-f86e-8510-7c084420e974@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hTNhvpyoPajbP01f"
Content-Disposition: inline
In-Reply-To: <4df4dacf-ba9b-f86e-8510-7c084420e974@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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


--hTNhvpyoPajbP01f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 11, 2021 at 08:18:29AM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 8/11/21 12:40 AM, David Gibson wrote:
> > On Tue, Aug 10, 2021 at 05:26:09PM -0300, Daniel Henrique Barboza wrote:
> > >=20
> > >=20
> > > On 8/10/21 1:01 AM, David Gibson wrote:
> > > > On Mon, Aug 09, 2021 at 10:10:50AM -0300, Daniel Henrique Barboza w=
rote:
> > > > > This patch starts the counter negative EBB support by enabling PM=
C1
> > > > > counter negative condition.
> > > > >=20
> > > > > A counter negative condition happens when a performance monitor c=
ounter
> > > > > reaches the value 0x80000000. When that happens, if a counter neg=
ative
> > > > > condition is enabled in that counter, a performance monitor alert=
 is
> > > > > triggered. For PMC1, this condition is enabled by MMCR0_PMC1CE.
> > > > >=20
> > > > > An icount-based logic is used to predict when we need to wake up =
the timer
> > > > > to trigger the alert in both PM_INST_CMPL (0x2) and PM_CYC (0x1E)=
 events.
> > > > > The timer callback will then trigger a PPC_INTERRUPT_PMC which wi=
ll become a
> > > > > event-based exception later.
> > > > >=20
> > > > > Some EBB powerpc kernel selftests are passing after this patch, b=
ut a
> > > > > substancial amount of them relies on other PMCs to be enabled and=
 events
> > > > > that we don't support at this moment. We'll address that in the n=
ext
> > > > > patches.
> > > > >=20
> > > > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > > > ---
> > > > >    target/ppc/cpu.h               |   1 +
> > > > >    target/ppc/pmu_book3s_helper.c | 127 +++++++++++++++++++++++--=
--------
> > > > >    2 files changed, 92 insertions(+), 36 deletions(-)
> > > > >=20
> > > > > diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> > > > > index 1d38b8cf7a..5c81d459f4 100644
> > > > > --- a/target/ppc/cpu.h
> > > > > +++ b/target/ppc/cpu.h
> > > > > @@ -350,6 +350,7 @@ typedef struct ppc_v3_pate_t {
> > > > >    #define MMCR0_EBE   PPC_BIT(43)         /* Perf Monitor EBB En=
able */
> > > > >    #define MMCR0_FCECE PPC_BIT(38)         /* FC on Enabled Cond =
or Event */
> > > > >    #define MMCR0_PMCC  PPC_BITMASK(44, 45) /* PMC Control */
> > > > > +#define MMCR0_PMC1CE PPC_BIT(48)
> > > > >    #define MMCR1_PMC1SEL_SHIFT (63 - 39)
> > > > >    #define MMCR1_PMC1SEL PPC_BITMASK(32, 39)
> > > > > diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book=
3s_helper.c
> > > > > index 43cc0eb722..58ae65e22b 100644
> > > > > --- a/target/ppc/pmu_book3s_helper.c
> > > > > +++ b/target/ppc/pmu_book3s_helper.c
> > > > > @@ -25,6 +25,7 @@
> > > > >     * and SPAPR code.
> > > > >     */
> > > > >    #define PPC_CPU_FREQ 1000000000
> > > > > +#define COUNTER_NEGATIVE_VAL 0x80000000
> > > > >    static uint64_t get_cycles(uint64_t icount_delta)
> > > > >    {
> > > > > @@ -32,22 +33,9 @@ static uint64_t get_cycles(uint64_t icount_del=
ta)
> > > > >                        NANOSECONDS_PER_SECOND);
> > > > >    }
> > > > > -static void update_PMC_PM_INST_CMPL(CPUPPCState *env, int sprn,
> > > > > -                                    uint64_t icount_delta)
> > > > > -{
> > > > > -    env->spr[sprn] +=3D icount_delta;
> > > > > -}
> > > > > -
> > > > > -static void update_PMC_PM_CYC(CPUPPCState *env, int sprn,
> > > > > -                              uint64_t icount_delta)
> > > > > -{
> > > > > -    env->spr[sprn] +=3D get_cycles(icount_delta);
> > > > > -}
> > > > > -
> > > > > -static void update_programmable_PMC_reg(CPUPPCState *env, int sp=
rn,
> > > > > -                                        uint64_t icount_delta)
> > > > > +static uint8_t get_PMC_event(CPUPPCState *env, int sprn)
> > > > >    {
> > > > > -    int event;
> > > > > +    int event =3D 0x0;
> > > > >        switch (sprn) {
> > > > >        case SPR_POWER_PMC1:
> > > > > @@ -65,11 +53,35 @@ static void update_programmable_PMC_reg(CPUPP=
CState *env, int sprn,
> > > > >        case SPR_POWER_PMC4:
> > > > >            event =3D MMCR1_PMC4SEL & env->spr[SPR_POWER_MMCR1];
> > > > >            break;
> > > > > +    case SPR_POWER_PMC5:
> > > > > +        event =3D 0x2;
> > > > > +        break;
> > > > > +    case SPR_POWER_PMC6:
> > > > > +        event =3D 0x1E;
> > > > > +        break;
> > > >=20
> > > > This looks like a nice cleanup that would be better folded into an
> > > > earlier patch.
> > > >=20
> > > > >        default:
> > > > > -        return;
> > > > > +        break;
> > > > >        }
> > > > > -    switch (event) {
> > > > > +    return event;
> > > > > +}
> > > > > +
> > > > > +static void update_PMC_PM_INST_CMPL(CPUPPCState *env, int sprn,
> > > > > +                                    uint64_t icount_delta)
> > > > > +{
> > > > > +    env->spr[sprn] +=3D icount_delta;
> > > > > +}
> > > > > +
> > > > > +static void update_PMC_PM_CYC(CPUPPCState *env, int sprn,
> > > > > +                              uint64_t icount_delta)
> > > > > +{
> > > > > +    env->spr[sprn] +=3D get_cycles(icount_delta);
> > > > > +}
> > > > > +
> > > > > +static void update_programmable_PMC_reg(CPUPPCState *env, int sp=
rn,
> > > > > +                                        uint64_t icount_delta)
> > > > > +{
> > > > > +    switch (get_PMC_event(env, sprn)) {
> > > > >        case 0x2:
> > > > >            update_PMC_PM_INST_CMPL(env, sprn, icount_delta);
> > > > >            break;
> > > > > @@ -99,30 +111,57 @@ static void update_PMCs(CPUPPCState *env, ui=
nt64_t icount_delta)
> > > > >        update_PMC_PM_CYC(env, SPR_POWER_PMC6, icount_delta);
> > > > >    }
> > > > > +static void set_PMU_excp_timer(CPUPPCState *env)
> > > > > +{
> > > > > +    uint64_t timeout, now, remaining_val;
> > > > > +
> > > > > +    if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_PMC1CE)) {
> > > > > +        return;
> > > > > +    }
> > > > > +
> > > > > +    remaining_val =3D COUNTER_NEGATIVE_VAL - env->spr[SPR_POWER_=
PMC1];
> > > > > +
> > > > > +    switch (get_PMC_event(env, SPR_POWER_PMC1)) {
> > > > > +    case 0x2:
> > > > > +        timeout =3D icount_to_ns(remaining_val);
> > > > > +        break;
> > > > > +    case 0x1e:
> > > > > +        timeout =3D muldiv64(remaining_val, NANOSECONDS_PER_SECO=
ND,
> > > > > +                           PPC_CPU_FREQ);
> > > >=20
> > > > So.. this appears to be simulating to the guest that cycles are
> > > > occurring at a constant rate, consistent with the advertised CPU
> > > > frequency.  Which sounds right, except... it's not clear to me that
> > > > you're using the same logic to generate the values you read from the
> > > > cycles PMC (in that case it shouldn't need to reference icount at a=
ll,
> > > > right?).
> > >=20
> > > 'remaining_val' meaning depends on the event being sampled in the PMC
> > > in that moment. PMCs 1 to 4 can have a multitude of events, PMC5 is a=
lways
> > > count instructions and PMC6 is always counting cycles.
> > >=20
> > > For 0x02, env->spr[SPR_POWER_PMC1] contains instructions. remaining_v=
al is
> > > the remaining insns for the counter negative condition, and icount_to=
_ns()
> > > is the timeout estimation for that. The value of the PMC1 will be set
> > > via update_PMC_PM_INST_CMPL(), which in turn is just a matter of summ=
ing
> > > the elapsed icount delta between start and freeze into the PMC.
> > >=20
> > > For 0x1e, env->spr[SPR_POWER_PMC1] contains cycles. remaining_val is
> > > the remaining cycles for counter negative cycles, and this muldiv64 c=
alc
> > > is the timeout estimation in this case. The PMC value is set via
> > > update_PMC_PM_CYC(), which in turn does a math with the current icount
> > > delta in get_cycles(icount_delta) to get the current PMC value.
> > >=20
> > > All the metrics implemented in this PMU relies on 'icount_delta', the
> > > amount of icount units between the change states of MMCR0_FC (and oth=
er
> > > freeze counter bits like patch 17).
> >=20
> > Ah, sorry, I missed that the PMC value (and therefore remaining val)
> > was based on the icount delta.
> >=20
> > So.. that's consistent, but what is the justification for using
> > something based on icount for cycles, rather than something based on ti=
me?
>=20
>=20
> We could calculate the cycles via time granted that the clock we're using
> is fixed in 1Ghz, so 1ns =3D> 1 cycle. For that, we would need a similar =
mechanic
> to what we already do with icount - get a time_base, cycles would be calc=
ulated
> via a time_delta, etc.
>=20
> However, and commenting a bit on Richard's review in patch 08, the cycle
> calculation we're doing is just returning icount_to_ns(icount_delta) beca=
use
> PPC_CPU_FREQ and NANOSECONDS_PER_SECOND are the same value. So, given tha=
t the
> conditions in which we would need to store and calculate a time delta is =
the
> same as what we're already doing with icount today, isn't
> cycles =3D icount_to_ns(icount_delta) =3D time_delta?
>=20
> I mean, nothing is stopping us from calculating cycles using time, but in=
 the
> end we would do the same thing we're already doing today.

Oh.. ok.  I had assumed that icount worked by instrumenting the
generate TCG code to actually count instructions, rather than working
off the time.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hTNhvpyoPajbP01f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEUl/gACgkQbDjKyiDZ
s5KeRA/8D673a6jixnSx9gCklucazd1XanW3rs5yOKmVOO8d6DirNwN/rsHSYHYr
rzXK6eArkWIdAc524E9CctSwQq6SitK3tKbHQ997nrMNZ/WGst9ZWi6d8TXFnBfR
nl47QPmCLNX3SQtGDYOOXTPfcCY0COSVEWJ7R6SB9vjVFonIVam+33bk8/UDI+01
gy29WY775f4zy/k+9UMYvLb7m0Mpnf5im1RJJjcyw9jcQ6PUoVjf/7LWll/7wZPd
8maV8oZzGozUEJs3Tv3h9khbisxEbTSPuu3cM6MLhPuPUul13MrwV5T8UHNBsXlc
G7+pwkb6mBSLKWhSPJ4jqvMQNm1xkElg8cevLb4sBvXtZjg54hwnx/g6h7AYV2mI
XTGPIckn+MIyCRDJABkNc1iU2tHDrn0SZsni0yhSoY7wZtSI/LbwQ/SHRy+pfBQ6
8ZWSk4pkOrxrPueATsoZsBq/QuNjo+dcnJ7NwwO4v+lk6dOJp/2TdsQOjUlVmnIf
kUcT0UL+UqED0hfSlmKWDs9KXckdXRtTS+Fn6sKgA+ycDaAM9rwHLSp32FitUUdx
Y+uAHN56ORmMPk5odVzmbFFX3gt+1B6olHQJfSHtmRpkc0CalJh+xj6CBIDJy9Qj
8kVNX1VDT05YqSzdt771byuE0q1NRSr0D1y+F9wZicffJPGLJzM=
=5NhX
-----END PGP SIGNATURE-----

--hTNhvpyoPajbP01f--

