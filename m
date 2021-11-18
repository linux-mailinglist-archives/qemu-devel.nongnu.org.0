Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C946455483
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 07:00:53 +0100 (CET)
Received: from localhost ([::1]:34614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnaTY-0001zr-LQ
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 01:00:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mnaPi-000133-OH; Thu, 18 Nov 2021 00:56:51 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=45765
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mnaPd-000790-FO; Thu, 18 Nov 2021 00:56:50 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Hvpvq66q1z4xd4; Thu, 18 Nov 2021 16:56:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1637214999;
 bh=Y64U1rnUctATnuFspPNH9G3wJYQHrb5lW+4e1VHPNIU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I53XYiV+OSSAcLvPs+GLlT1LwuZA/WwN75Di89vGGtJyyaLUkigqalTL4p4WlIwhD
 EGuUmw0ouPJ7qBjpwUaPb38FMj9/ghw/Szq7p5qO9MhTmFNCLm8OkhTJsR1rCJrY4a
 neDIWu3qsS1DkEGsCM5UX8kMZvI23NLebbrtfr2k=
Date: Thu, 18 Nov 2021 16:47:30 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v6 01/10] target/ppc: introduce PMUEventType and PMU
 overflow timers
Message-ID: <YZXo8nu2qOyIN+I4@yekko>
References: <20211108225047.1733607-1-danielhb413@gmail.com>
 <20211108225047.1733607-2-danielhb413@gmail.com>
 <YY3ZPV5C1O/gu9sj@yekko>
 <ffd6cfa3-8813-26b7-2bec-bfcfbb3e2758@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Dou8XHCUN10XfNqB"
Content-Disposition: inline
In-Reply-To: <ffd6cfa3-8813-26b7-2bec-bfcfbb3e2758@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Dou8XHCUN10XfNqB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 13, 2021 at 04:02:02PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 11/12/21 00:02, David Gibson wrote:
> > On Mon, Nov 08, 2021 at 07:50:38PM -0300, Daniel Henrique Barboza wrote:
> > > This patch starts an IBM Power8+ compatible PMU implementation by add=
ing
> > > the representation of PMU events that we are going to sample,
> > > PMUEventType. This enum represents a Perf event that is being sampled=
 by
> > > a specific counter 'sprn'. Events that aren't available (i.e. no event
> > > was set in MMCR1) will be of type 'PMU_EVENT_INVALID'. Other types ad=
ded
> > > in this patch are PMU_EVENT_CYCLES and PMU_EVENT_INSTRUCTIONS. More
> > > types will be added later on.
> > >=20
> > > Let's also add the required PMU cycle overflow timers. They will be u=
sed
> > > to trigger cycle overflows when cycle events are being sampled. This
> > > timer will call cpu_ppc_pmu_timer_cb(), which in turn calls
> > > fire_PMC_interrupt().  Both functions are stubs that will be implemen=
ted
> > > later on when EBB support is added.
> > >=20
> > > Two new helper files are created to host this new logic.
> > > cpu_ppc_pmu_init() will init all overflow timers during CPU init time.
> > >=20
> > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > ---
> > >   hw/ppc/spapr_cpu_core.c |  6 +++++
> > >   target/ppc/cpu.h        | 15 +++++++++++
> > >   target/ppc/meson.build  |  1 +
> > >   target/ppc/power8-pmu.c | 57 ++++++++++++++++++++++++++++++++++++++=
+++
> > >   target/ppc/power8-pmu.h | 25 ++++++++++++++++++
> > >   5 files changed, 104 insertions(+)
> > >   create mode 100644 target/ppc/power8-pmu.c
> > >   create mode 100644 target/ppc/power8-pmu.h
> > >=20
> > > diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> > > index 58e7341cb7..45abffd891 100644
> > > --- a/hw/ppc/spapr_cpu_core.c
> > > +++ b/hw/ppc/spapr_cpu_core.c
> > > @@ -20,6 +20,7 @@
> > >   #include "target/ppc/kvm_ppc.h"
> > >   #include "hw/ppc/ppc.h"
> > >   #include "target/ppc/mmu-hash64.h"
> > > +#include "target/ppc/power8-pmu.h"
> > >   #include "sysemu/numa.h"
> > >   #include "sysemu/reset.h"
> > >   #include "sysemu/hw_accel.h"
> > > @@ -266,6 +267,11 @@ static bool spapr_realize_vcpu(PowerPCCPU *cpu, =
SpaprMachineState *spapr,
> > >           return false;
> > >       }
> > > +    /* Init PMU interrupt timer (TCG only) */
> > > +    if (!kvm_enabled()) {
> > > +        cpu_ppc_pmu_init(env);
> >=20
> > AFAIK, the PMU should be universal in the cpu model, not tied to spapr
> > specifically, so this looks like the wrong place to trigger the
> > initialization.
>=20
>=20
> Do you mean something like this?

More or less, yes.  However given that this is specifically the POWER8
(and later) PMU I'd name and call the functions accordingly, rather
than "common".

> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 881f39ff76..7503fd76d7 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -45,6 +45,7 @@
>  #include "helper_regs.h"
>  #include "internal.h"
>  #include "spr_tcg.h"
> +#include "power8-pmu.h"
>  /* #define PPC_DEBUG_SPR */
>  /* #define USE_APPLE_GDB */
> @@ -7377,6 +7378,20 @@ static void register_power9_mmu_sprs(CPUPPCState *=
env)
>  #endif
>  }
> +/*
> + * Initialize PMU counter overflow timers for Power8 and
> + * newer Power chips when using TCG.
> + */
> +static void init_tcg_pmu_common(CPUPPCState *env)
> +{
> +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> +    /* Init PMU overflow timers */
> +    if (!kvm_enabled()) {
> +        cpu_ppc_pmu_init(env);
> +    }
> +#endif
> +}
> +
>  static void init_proc_book3s_common(CPUPPCState *env)
>  {
>      register_ne_601_sprs(env);
> @@ -7694,6 +7709,9 @@ static void init_proc_POWER8(CPUPPCState *env)
>      register_sdr1_sprs(env);
>      register_book3s_207_dbg_sprs(env);
> +    /* Common TCG PMU */
> +    init_tcg_pmu_common(env);
> +
>      /* POWER8 Specific Registers */
>      register_book3s_ids_sprs(env);
>      register_rmor_sprs(env);
> @@ -7888,6 +7906,9 @@ static void init_proc_POWER9(CPUPPCState *env)
>      init_proc_book3s_common(env);
>      register_book3s_207_dbg_sprs(env);
> +    /* Common TCG PMU */
> +    init_tcg_pmu_common(env);
> +
>      /* POWER8 Specific Registers */
>      register_book3s_ids_sprs(env);
>      register_amr_sprs(env);
> @@ -8104,6 +8125,9 @@ static void init_proc_POWER10(CPUPPCState *env)
>      init_proc_book3s_common(env);
>      register_book3s_207_dbg_sprs(env);
> +    /* Common TCG PMU */
> +    init_tcg_pmu_common(env);
> +
>      /* POWER8 Specific Registers */
>      register_book3s_ids_sprs(env);
>      register_amr_sprs(env);
>=20
>=20
>=20
> Daniel
>=20
> >=20
> > > +    }
> > > +
> > >       if (!sc->pre_3_0_migration) {
> > >           vmstate_register(NULL, cs->cpu_index, &vmstate_spapr_cpu_st=
ate,
> > >                            cpu->machine_data);
> > > diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> > > index e946da5f3a..04ef9300af 100644
> > > --- a/target/ppc/cpu.h
> > > +++ b/target/ppc/cpu.h
> > > @@ -296,6 +296,15 @@ typedef struct ppc_v3_pate_t {
> > >       uint64_t dw1;
> > >   } ppc_v3_pate_t;
> > > +/* PMU related structs and defines */
> > > +#define PMU_COUNTERS_NUM 6
> > > +#define PMU_TIMERS_NUM   (PMU_COUNTERS_NUM - 1) /* PMC5 doesn't coun=
t cycles */
> > > +typedef enum {
> > > +    PMU_EVENT_INVALID =3D 0,
> > > +    PMU_EVENT_CYCLES,
> > > +    PMU_EVENT_INSTRUCTIONS,
> > > +} PMUEventType;
> > > +
> > >   /******************************************************************=
***********/
> > >   /* Machine state register bits definition                          =
          */
> > >   #define MSR_SF   63 /* Sixty-four-bit mode                         =
   hflags */
> > > @@ -1191,6 +1200,12 @@ struct CPUPPCState {
> > >       uint32_t tm_vscr;
> > >       uint64_t tm_dscr;
> > >       uint64_t tm_tar;
> > > +
> > > +    /*
> > > +     * Timers used to fire performance monitor alerts
> > > +     * when counting cycles.
> > > +     */
> > > +    QEMUTimer *pmu_cyc_overflow_timers[PMU_TIMERS_NUM];
> > >   };
> > >   #define SET_FIT_PERIOD(a_, b_, c_, d_)          \
> > > diff --git a/target/ppc/meson.build b/target/ppc/meson.build
> > > index b85f295703..a49a8911e0 100644
> > > --- a/target/ppc/meson.build
> > > +++ b/target/ppc/meson.build
> > > @@ -51,6 +51,7 @@ ppc_softmmu_ss.add(when: 'TARGET_PPC64', if_true: f=
iles(
> > >     'mmu-book3s-v3.c',
> > >     'mmu-hash64.c',
> > >     'mmu-radix64.c',
> > > +  'power8-pmu.c',
> > >   ))
> > >   target_arch +=3D {'ppc': ppc_ss}
> > > diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
> > > new file mode 100644
> > > index 0000000000..3c2f73896f
> > > --- /dev/null
> > > +++ b/target/ppc/power8-pmu.c
> > > @@ -0,0 +1,57 @@
> > > +/*
> > > + * PMU emulation helpers for TCG IBM POWER chips
> > > + *
> > > + *  Copyright IBM Corp. 2021
> > > + *
> > > + * Authors:
> > > + *  Daniel Henrique Barboza      <danielhb413@gmail.com>
> > > + *
> > > + * This work is licensed under the terms of the GNU GPL, version 2 o=
r later.
> > > + * See the COPYING file in the top-level directory.
> > > + */
> > > +
> > > +#include "qemu/osdep.h"
> > > +
> > > +#include "power8-pmu.h"
> > > +#include "cpu.h"
> > > +#include "helper_regs.h"
> > > +#include "exec/exec-all.h"
> > > +#include "exec/helper-proto.h"
> > > +#include "qemu/error-report.h"
> > > +#include "qemu/main-loop.h"
> > > +#include "hw/ppc/ppc.h"
> > > +
> > > +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> > > +
> > > +static void fire_PMC_interrupt(PowerPCCPU *cpu)
> > > +{
> > > +    CPUPPCState *env =3D &cpu->env;
> > > +
> > > +    if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_EBE)) {
> > > +        return;
> > > +    }
> > > +
> > > +    /* PMC interrupt not implemented yet */
> > > +    return;
> > > +}
> > > +
> > > +static void cpu_ppc_pmu_timer_cb(void *opaque)
> > > +{
> > > +    PowerPCCPU *cpu =3D opaque;
> > > +
> > > +    fire_PMC_interrupt(cpu);
> > > +}
> > > +
> > > +void cpu_ppc_pmu_init(CPUPPCState *env)
> > > +{
> > > +    PowerPCCPU *cpu =3D env_archcpu(env);
> > > +    int i;
> > > +
> > > +    for (i =3D 0; i < PMU_TIMERS_NUM; i++) {
> > > +        env->pmu_cyc_overflow_timers[i] =3D timer_new_ns(QEMU_CLOCK_=
VIRTUAL,
> > > +                                                       &cpu_ppc_pmu_=
timer_cb,
> > > +                                                       cpu);
> > > +    }
> > > +}
> > > +
> > > +#endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
> > > diff --git a/target/ppc/power8-pmu.h b/target/ppc/power8-pmu.h
> > > new file mode 100644
> > > index 0000000000..49a813a443
> > > --- /dev/null
> > > +++ b/target/ppc/power8-pmu.h
> > > @@ -0,0 +1,25 @@
> > > +/*
> > > + * PMU emulation helpers for TCG IBM POWER chips
> > > + *
> > > + *  Copyright IBM Corp. 2021
> > > + *
> > > + * Authors:
> > > + *  Daniel Henrique Barboza      <danielhb413@gmail.com>
> > > + *
> > > + * This work is licensed under the terms of the GNU GPL, version 2 o=
r later.
> > > + * See the COPYING file in the top-level directory.
> > > + */
> > > +
> > > +#ifndef POWER8_PMU
> > > +#define POWER8_PMU
> > > +
> > > +#include "qemu/osdep.h"
> > > +#include "cpu.h"
> > > +#include "exec/exec-all.h"
> > > +#include "exec/helper-proto.h"
> > > +#include "qemu/error-report.h"
> > > +#include "qemu/main-loop.h"
> > > +
> > > +void cpu_ppc_pmu_init(CPUPPCState *env);
> > > +
> > > +#endif
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Dou8XHCUN10XfNqB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGV6PAACgkQbDjKyiDZ
s5KDMBAAsmInhS9bZRWtsIc2jS+gB6wfC/X3fzKT2Wt15gaQ1eXxI26l6EniQJwV
TTTXV+6K49Bd3idplSXLbo7s/j0Tkspfnti8SdCtQH5ukiw8WZB38kfCNEnvSxTc
U/YZzNpu0P0gmG6ROaN3T5lwm79QMaY7U+HtVFYfLWnzhcOizFajpv1E1daGdhn2
qXj9dgv5gwy4qEuNQp+Bc78E3xbYNOR7CKfDEQJqLAhmZ7qJP4dcuVDFPDtCXviW
zOTol+a7sAPOXNBU8rQZw4H570mjffmDqqnK78PrjHkKBYD41/cF/2yWJQ1ZRwkt
6MUeUfoktRiy19DSsTzIuR9528ky99TKniVq2IDSBNt5c2pCtmGRrkbbK4lyOpS5
imlzcMI6NxVi5soxQ1S+3CuZqaIfPFD3DSzpHgrqGnd09Hpmp/ZSKYoxbTfeUqJS
IG3fTtmF+D2S8P5ZXpK6UnluBsZI2m8qYnCeipbjUGno7muxS/QybC+BQXOdy/9X
cEemtMOIEvmUmKZnx3hVj8rtQWY3IquPO0j0SQ+2CZvkZQIzpt2+Yv4+h2GzCG8E
/3Q3BSsmQf/yGLGxI2F6vhcBXKa/Rzm1MXtqt4rmMotWn/NgXjyHjhiZ3uXK+c88
11mnnu0DTWH4Z5NZ+pg5MbUDiEboe9Mo2RWwdBqNlXCDTpT4xcM=
=WWVp
-----END PGP SIGNATURE-----

--Dou8XHCUN10XfNqB--

