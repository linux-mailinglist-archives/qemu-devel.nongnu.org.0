Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB0D465BA6
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 02:29:08 +0100 (CET)
Received: from localhost ([::1]:42952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msauJ-0000NY-3O
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 20:29:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1msaog-0007XY-49; Wed, 01 Dec 2021 20:23:18 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=45389
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1msaoc-0000Vb-2e; Wed, 01 Dec 2021 20:23:17 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4J4J9l4X5tz4xZ1; Thu,  2 Dec 2021 12:23:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1638408187;
 bh=IGfmj/W2bZMtMognfyEH9tIN8fDsodBRhGlEfChwIwE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pZiBQtCJnwBParaydgLw51ibo7riK90WKCO5GiJ3dR2q8w9pqoczUMvoJ8nlxFC9j
 6eAnvWoL5r8NtCDOrqFF+/2uP2oVTMLXZY7Pmm7+jcWq9sanVH9xHyymlOfX/PMMuC
 jvqRD0aCW0PipjDkiyYQCEvEFp1t8BpBVJxzF/6M=
Date: Thu, 2 Dec 2021 12:23:00 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v8 06/10] target/ppc: enable PMU instruction count
Message-ID: <Yagf9OOxSewiNHRR@yekko>
References: <20211125150817.573204-1-danielhb413@gmail.com>
 <20211125150817.573204-7-danielhb413@gmail.com>
 <YaRYwiSLgVW38EKj@yekko>
 <6358310d-c6e4-c5fd-c76c-854674ce1d6b@gmail.com>
 <Yaa5JTZOGZb5hyuK@yekko>
 <87eafee6-befd-c82c-9982-b3adc7e2b372@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fR7BAAAIrrW0QQoe"
Content-Disposition: inline
In-Reply-To: <87eafee6-befd-c82c-9982-b3adc7e2b372@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--fR7BAAAIrrW0QQoe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 01, 2021 at 10:12:27AM -0300, Daniel Henrique Barboza wrote:
> On 11/30/21 20:52, David Gibson wrote:
> > On Tue, Nov 30, 2021 at 07:24:04PM -0300, Daniel Henrique Barboza wrote:
[snip]
> > > > > +static bool pmu_increment_insns(CPUPPCState *env, uint32_t num_i=
nsns)
> > > > > +{
> > > > > +    bool overflow_triggered =3D false;
> > > > > +    int sprn;
> > > > > +
> > > > > +    /* PMC6 never counts instructions */
> > > > > +    for (sprn =3D SPR_POWER_PMC1; sprn <=3D SPR_POWER_PMC5; sprn=
++) {
> > > > > +        if (pmc_get_event(env, sprn) !=3D PMU_EVENT_INSTRUCTIONS=
) {
> > > > > +            continue;
> > > > > +        }
> > > > > +
> > > > > +        env->spr[sprn] +=3D num_insns;
> > > > > +
> > > > > +        if (env->spr[sprn] >=3D PMC_COUNTER_NEGATIVE_VAL &&
> > > > > +            pmc_has_overflow_enabled(env, sprn)) {
> > > > > +
> > > > > +            overflow_triggered =3D true;
> > > > > +            env->spr[sprn] =3D PMC_COUNTER_NEGATIVE_VAL;
> > > >=20
> > > > Does the hardware PMU actually guarantee that the event will happen
> > > > exactly on the overflow?  Or could you count a few into the negative
> > > > zone before the event is delivered?
> > >=20
> > > My understand reading the ISA and from testing with the a real PMU is=
 that yes,
> > > it'll guarantee that the overflow will happen when the counter reache=
s exactly
> > > 0x80000000.
> >=20
> > Ok.  We can't quite achieve that in TCG, which makes forcing the
> > counter to 0x8000000 a reasonable way of faking it.  Might be worth
> > commenting that that's what this is, though.
>=20
> Fair enough.

To expand on this a little, I mentioned in connection with cycle
counting that we kind of have a choice as to which illusion to
preserve.  At least assuming that the VM can see a real real-time
clock, we can either preserve the illusion that cycles have the
advertised frequency, or we can preserve the illusion that
instructions take vaguely the right number of cycles to complete.
With TCG, we can't do both.

We have a somewhat similar tradeoff here: do we prioritize matching
the behaviour that the counter will be exactly 0x80000000 at the time
of an overflow interrupt, or do we prioritize matching the behaviour
that the counter is an accurate and exact count of completed
instructions.  The fact that there is a tradeoff and which side we've
chosen is the key point to describe here, I think.

[In this instance, I think we can get closer to getting both sides
right.  I believe there's a way in TCG to clamp the number of
instructions in a translated block - we could set that based on the
distance to overflow of the PMCs.  That sounds very much not worth it
at this stage - we could look at it as a refinement later if we care]

> > > > > +        }
> > > > > +    }
> > > > > +
> > > > > +    return overflow_triggered;
> > > > > +}
> > > > > +
> > > > >    static void pmu_update_cycles(CPUPPCState *env)
> > > > >    {
> > > > >        uint64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > > > > @@ -258,6 +282,20 @@ static void fire_PMC_interrupt(PowerPCCPU *c=
pu)
> > > > >        return;
> > > > >    }
> > > > > +/* This helper assumes that the PMC is running. */
> > > > > +void helper_insns_inc(CPUPPCState *env, uint32_t num_insns)
> > > > > +{
> > > > > +    bool overflow_triggered;
> > > > > +    PowerPCCPU *cpu;
> > > > > +
> > > > > +    overflow_triggered =3D pmu_increment_insns(env, num_insns);
> > > > > +
> > > > > +    if (overflow_triggered) {
> > > > > +        cpu =3D env_archcpu(env);
> > > > > +        fire_PMC_interrupt(cpu);
> > > > > +    }
> > > > > +}
> > > > > +
> > > > >    static void cpu_ppc_pmu_timer_cb(void *opaque)
> > > > >    {
> > > > >        PowerPCCPU *cpu =3D opaque;
> > > > > diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> > > > > index 9960df6e18..ccc83d0603 100644
> > > > > --- a/target/ppc/translate.c
> > > > > +++ b/target/ppc/translate.c
> > > > > @@ -177,6 +177,7 @@ struct DisasContext {
> > > > >        bool hr;
> > > > >        bool mmcr0_pmcc0;
> > > > >        bool mmcr0_pmcc1;
> > > > > +    bool pmu_frozen;
> > > > >        ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mts=
pr */
> > > > >        int singlestep_enabled;
> > > > >        uint32_t flags;
> > > > > @@ -4170,6 +4171,31 @@ static inline void gen_update_cfar(DisasCo=
ntext *ctx, target_ulong nip)
> > > > >    #endif
> > > > >    }
> > > > > +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> > > >=20
> > > > Should this actually be !CONFIG_USER_ONLY?  IIUC there are
> > > > circumstances where userspace could access the PMU, including
> > > > instruction counting.
> > >=20
> > > The user mode will not be able to use the PMU properly because the MM=
CR1
> > > reg, used to define the events to be sampled, isn't writable by userp=
ace
> > > under any circunstance.
> >=20
> > Couldn't they use PMC5 without writing MMCR1?
>=20
>=20
> Yeah, in theory. Problem state write access to PMCs are granted for MMCR0=
_PMCC
> 0b10 || 0b11. The PMCC bits of MMCR0 aren't user read/writable (only FC, =
PMAO and PMAE
> bits can be r/w from userspace, all other bits are filtered out). With th=
e default
> PMCC value of 0b00 the PMCs are readable, but not writable. So in a way u=
serspace can
> start the PMU and see instruction counting in PMC5 but it wouldn't be abl=
e to set it
> to a specific value and wouldn't be able to use overflows.
>=20
> All that said, the change to allow PMC5 to be incremented in problem stat=
e is simple
> enough so I ended up doing it.

Ok, I think that's a good idea.

You're probably right that at the moment there's no way for a pure
userspace program to access the counters like this.  However, that's
only because of a pretty complex chain of restrictions.  There's no
fundamental reason why we couldn't have some configuration mechanism
to execute a userland program with PMU permission.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--fR7BAAAIrrW0QQoe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGoH/IACgkQbDjKyiDZ
s5IYSxAA1rkcCSfZuDTYSgAzTmxGmktRTdowbtnz0njNjNNKmDjYchnbu69fkcJB
4QbIn41RaDahXRCO5kBad8KJl/jYqRjwIwxxZPYDKcV4+kC49D+ds+AxV3xiI1qw
ulOOpIRHFl2gSJr0zWOErVPOyqy6kdvp64xKbBd9H/B/j3bJvTZfD0C8+mS6Q/9r
QBpgJyzNNI/07yk8gI0DhUiBlwFsQWa+5qqprpkcDb/w2Wk8tH7ZzjiWgSkiazUC
eNClGIlLZ1zAHZJyFArymdsLwkKY8xYDb+2W40XYZK81SlduiCwPAjNwyTCcD8gZ
iFF9QAhaKM+VxFt4JHNSGUBsVNWpfrBzLCXzR6i5XqgFaiqlrnNRavktiiHv04Pl
ILqKPWKKM6LK2q3ykZnnz4OBI1vedTZsgNa3uhXD+FXOsrV0HSUCu6rsJ7WMj0E7
rvPwVaV4NaqBtLOdzqna0IWSJXEAZy4oINBs3qUTd+ZtmrKAkn8AOJ7Ej3ZMMQGL
kSb3aXY5Z0lzw4fqbzYyowim6Ggp6R050K4QfDVSZj8LFYtLPOGMNQhyRBTGA+7G
om7M0vPHXEnELoIDOO1aBlMkloXTYJfFUcUJpaR5esBI3ljU2dbB7lsxEXnpTLSi
mkScQhfGNNA+W6hvCDzYonHfiDT6YV1a05eFpjYj6B+TY7OC0t0=
=UAsG
-----END PGP SIGNATURE-----

--fR7BAAAIrrW0QQoe--

