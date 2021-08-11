Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9963E8A9A
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 08:55:51 +0200 (CEST)
Received: from localhost ([::1]:42722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDi9W-0000as-4w
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 02:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDi0i-00069c-JZ; Wed, 11 Aug 2021 02:46:44 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:42887 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDi0g-0002SA-66; Wed, 11 Aug 2021 02:46:44 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Gl0j5686Dz9sWl; Wed, 11 Aug 2021 16:46:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628664393;
 bh=ebD+ejA8ym3uVWo4e0tSi2Y9dYvvfHrlRZEU6wXruxY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VhzLPBJKChnqSCPbfcm6dPLd1ll0xhOrdgnAz/2JYZdCSp4x7izbGKR1+ojkefVR2
 GyygIPwam+Ldr8w1n8tV8A7bdPFc1RHza7jeQAaQBo7cn9lrIAHkXhMo2P07zL16yq
 zU4GItr0yKYgBWUuvR2sSi43vtf41BK6IiW8lbuM=
Date: Wed, 11 Aug 2021 13:40:19 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 12/19] target/ppc/pmu_book3s_helper.c: enable PMC1
 counter negative EBB
Message-ID: <YRNGo8CnfUSC/bQs@yekko>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-13-danielhb413@gmail.com>
 <YRH6IysrDvn/GJvQ@yekko>
 <6a10c0a7-1c4f-0d24-f2cc-12666e590739@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8s9XN8I+M/45qliP"
Content-Disposition: inline
In-Reply-To: <6a10c0a7-1c4f-0d24-f2cc-12666e590739@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
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


--8s9XN8I+M/45qliP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 10, 2021 at 05:26:09PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 8/10/21 1:01 AM, David Gibson wrote:
> > On Mon, Aug 09, 2021 at 10:10:50AM -0300, Daniel Henrique Barboza wrote:
> > > This patch starts the counter negative EBB support by enabling PMC1
> > > counter negative condition.
> > >=20
> > > A counter negative condition happens when a performance monitor count=
er
> > > reaches the value 0x80000000. When that happens, if a counter negative
> > > condition is enabled in that counter, a performance monitor alert is
> > > triggered. For PMC1, this condition is enabled by MMCR0_PMC1CE.
> > >=20
> > > An icount-based logic is used to predict when we need to wake up the =
timer
> > > to trigger the alert in both PM_INST_CMPL (0x2) and PM_CYC (0x1E) eve=
nts.
> > > The timer callback will then trigger a PPC_INTERRUPT_PMC which will b=
ecome a
> > > event-based exception later.
> > >=20
> > > Some EBB powerpc kernel selftests are passing after this patch, but a
> > > substancial amount of them relies on other PMCs to be enabled and eve=
nts
> > > that we don't support at this moment. We'll address that in the next
> > > patches.
> > >=20
> > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > ---
> > >   target/ppc/cpu.h               |   1 +
> > >   target/ppc/pmu_book3s_helper.c | 127 +++++++++++++++++++++++-------=
---
> > >   2 files changed, 92 insertions(+), 36 deletions(-)
> > >=20
> > > diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> > > index 1d38b8cf7a..5c81d459f4 100644
> > > --- a/target/ppc/cpu.h
> > > +++ b/target/ppc/cpu.h
> > > @@ -350,6 +350,7 @@ typedef struct ppc_v3_pate_t {
> > >   #define MMCR0_EBE   PPC_BIT(43)         /* Perf Monitor EBB Enable =
*/
> > >   #define MMCR0_FCECE PPC_BIT(38)         /* FC on Enabled Cond or Ev=
ent */
> > >   #define MMCR0_PMCC  PPC_BITMASK(44, 45) /* PMC Control */
> > > +#define MMCR0_PMC1CE PPC_BIT(48)
> > >   #define MMCR1_PMC1SEL_SHIFT (63 - 39)
> > >   #define MMCR1_PMC1SEL PPC_BITMASK(32, 39)
> > > diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_h=
elper.c
> > > index 43cc0eb722..58ae65e22b 100644
> > > --- a/target/ppc/pmu_book3s_helper.c
> > > +++ b/target/ppc/pmu_book3s_helper.c
> > > @@ -25,6 +25,7 @@
> > >    * and SPAPR code.
> > >    */
> > >   #define PPC_CPU_FREQ 1000000000
> > > +#define COUNTER_NEGATIVE_VAL 0x80000000
> > >   static uint64_t get_cycles(uint64_t icount_delta)
> > >   {
> > > @@ -32,22 +33,9 @@ static uint64_t get_cycles(uint64_t icount_delta)
> > >                       NANOSECONDS_PER_SECOND);
> > >   }
> > > -static void update_PMC_PM_INST_CMPL(CPUPPCState *env, int sprn,
> > > -                                    uint64_t icount_delta)
> > > -{
> > > -    env->spr[sprn] +=3D icount_delta;
> > > -}
> > > -
> > > -static void update_PMC_PM_CYC(CPUPPCState *env, int sprn,
> > > -                              uint64_t icount_delta)
> > > -{
> > > -    env->spr[sprn] +=3D get_cycles(icount_delta);
> > > -}
> > > -
> > > -static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
> > > -                                        uint64_t icount_delta)
> > > +static uint8_t get_PMC_event(CPUPPCState *env, int sprn)
> > >   {
> > > -    int event;
> > > +    int event =3D 0x0;
> > >       switch (sprn) {
> > >       case SPR_POWER_PMC1:
> > > @@ -65,11 +53,35 @@ static void update_programmable_PMC_reg(CPUPPCSta=
te *env, int sprn,
> > >       case SPR_POWER_PMC4:
> > >           event =3D MMCR1_PMC4SEL & env->spr[SPR_POWER_MMCR1];
> > >           break;
> > > +    case SPR_POWER_PMC5:
> > > +        event =3D 0x2;
> > > +        break;
> > > +    case SPR_POWER_PMC6:
> > > +        event =3D 0x1E;
> > > +        break;
> >=20
> > This looks like a nice cleanup that would be better folded into an
> > earlier patch.
> >=20
> > >       default:
> > > -        return;
> > > +        break;
> > >       }
> > > -    switch (event) {
> > > +    return event;
> > > +}
> > > +
> > > +static void update_PMC_PM_INST_CMPL(CPUPPCState *env, int sprn,
> > > +                                    uint64_t icount_delta)
> > > +{
> > > +    env->spr[sprn] +=3D icount_delta;
> > > +}
> > > +
> > > +static void update_PMC_PM_CYC(CPUPPCState *env, int sprn,
> > > +                              uint64_t icount_delta)
> > > +{
> > > +    env->spr[sprn] +=3D get_cycles(icount_delta);
> > > +}
> > > +
> > > +static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
> > > +                                        uint64_t icount_delta)
> > > +{
> > > +    switch (get_PMC_event(env, sprn)) {
> > >       case 0x2:
> > >           update_PMC_PM_INST_CMPL(env, sprn, icount_delta);
> > >           break;
> > > @@ -99,30 +111,57 @@ static void update_PMCs(CPUPPCState *env, uint64=
_t icount_delta)
> > >       update_PMC_PM_CYC(env, SPR_POWER_PMC6, icount_delta);
> > >   }
> > > +static void set_PMU_excp_timer(CPUPPCState *env)
> > > +{
> > > +    uint64_t timeout, now, remaining_val;
> > > +
> > > +    if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_PMC1CE)) {
> > > +        return;
> > > +    }
> > > +
> > > +    remaining_val =3D COUNTER_NEGATIVE_VAL - env->spr[SPR_POWER_PMC1=
];
> > > +
> > > +    switch (get_PMC_event(env, SPR_POWER_PMC1)) {
> > > +    case 0x2:
> > > +        timeout =3D icount_to_ns(remaining_val);
> > > +        break;
> > > +    case 0x1e:
> > > +        timeout =3D muldiv64(remaining_val, NANOSECONDS_PER_SECOND,
> > > +                           PPC_CPU_FREQ);
> >=20
> > So.. this appears to be simulating to the guest that cycles are
> > occurring at a constant rate, consistent with the advertised CPU
> > frequency.  Which sounds right, except... it's not clear to me that
> > you're using the same logic to generate the values you read from the
> > cycles PMC (in that case it shouldn't need to reference icount at all,
> > right?).
>=20
> 'remaining_val' meaning depends on the event being sampled in the PMC
> in that moment. PMCs 1 to 4 can have a multitude of events, PMC5 is always
> count instructions and PMC6 is always counting cycles.
>=20
> For 0x02, env->spr[SPR_POWER_PMC1] contains instructions. remaining_val is
> the remaining insns for the counter negative condition, and icount_to_ns()
> is the timeout estimation for that. The value of the PMC1 will be set
> via update_PMC_PM_INST_CMPL(), which in turn is just a matter of summing
> the elapsed icount delta between start and freeze into the PMC.
>=20
> For 0x1e, env->spr[SPR_POWER_PMC1] contains cycles. remaining_val is
> the remaining cycles for counter negative cycles, and this muldiv64 calc
> is the timeout estimation in this case. The PMC value is set via
> update_PMC_PM_CYC(), which in turn does a math with the current icount
> delta in get_cycles(icount_delta) to get the current PMC value.
>=20
> All the metrics implemented in this PMU relies on 'icount_delta', the
> amount of icount units between the change states of MMCR0_FC (and other
> freeze counter bits like patch 17).

Ah, sorry, I missed that the PMC value (and therefore remaining val)
was based on the icount delta.

So.. that's consistent, but what is the justification for using
something based on icount for cycles, rather than something based on time?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8s9XN8I+M/45qliP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmETRqMACgkQbDjKyiDZ
s5Jn0RAAvXOFjD3K5oYnQ8TkRiRg56/IXaFy2/Te2MCuCjP7QY3voHf2lUatuNM1
+0rqRQHe2eFfujOzMw/0KQMOkoXQ7EcHAL8jPZts6Y7cVqglIVVBF1wii9z4ZUnZ
MvpiJFC7VfL4sbaTPrUsOzDQhpZOiPr5dmbC3XOVHe8QpEXoKNOpMZ+ETRkQblOV
2CjWcW3YqUmUNpc8C9LLJ/Ztnn36KWwDl729HYsOxQKxmBxt0wi+2qMUUzzHX0uX
7ohZZpq0xIJdQ7ScTdQQGTASQQ1J5h7lfRCMpynjWnri7yKddh5JrOeoO8Sw7TzL
1Xt76P/y7EDqWT5cbeY2wKDIdGSl8ZrrzwEZ8zF2D3GtACzzx9xG9e7oDxZ58jvr
Uyt0jhxbkt0iLFrECMD7EhLuW+hGT3510j86a1kgCZCfo+3/FJiBoETcmv/HTYm9
bPDdxHLd6FZYrTHWslT4DXfyt3ktqIwa0beyLLy7qubbj3R6RjJk18CgAX8Zro6+
9XrlKJyecW8BUsdHQTIQk0A5PMi+1pYC5k42sZdy/364AGx3Krnmm7MNJwZzANd5
3uH/WZreKxipsAWCZ2eZH52k5yBhzEf8iyuJotYH5fPYDYdZ83ibbeT+tkj7Lc0D
kP6HB2SJieta8YdrAJsBbT9ZX9urYu2yco4j1jSxsjWHHRp1vRw=
=2QOH
-----END PGP SIGNATURE-----

--8s9XN8I+M/45qliP--

