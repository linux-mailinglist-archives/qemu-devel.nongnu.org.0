Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABD32D4864
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:55:23 +0100 (CET)
Received: from localhost ([::1]:47766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3gQ-0006Ee-Gx
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:55:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kn3U3-00034k-7B
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:42:35 -0500
Received: from 2.mo51.mail-out.ovh.net ([178.33.255.19]:52833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kn3Tz-0007du-Nh
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:42:34 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.51])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id ACE9523F9CB;
 Wed,  9 Dec 2020 18:42:27 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 9 Dec 2020
 18:42:27 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002bf903900-04de-4958-a6fd-bf4f45c1863c,
 661A724A132DD26A84B163D3BB90DC3732340046) smtp.auth=groug@kaod.org
Date: Wed, 9 Dec 2020 18:42:25 +0100
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH 1/6] spapr: Add an "spapr" property to sPAPR CPU core
Message-ID: <20201209184225.1b544523@bahia.lan>
In-Reply-To: <de3d6170-3e28-ce78-41a3-59eca3cb6b67@redhat.com>
References: <20201209170052.1431440-1-groug@kaod.org>
 <20201209170052.1431440-2-groug@kaod.org>
 <de3d6170-3e28-ce78-41a3-59eca3cb6b67@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 4a5b274e-0932-4612-abff-cce26658c5e2
X-Ovh-Tracer-Id: 901564354188384736
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudejkedguddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveelhfdtudffhfeiveehhfelgeellefgteffteekudegheejfffghefhfeeuudffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=178.33.255.19; envelope-from=groug@kaod.org;
 helo=2.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Dec 2020 18:34:31 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 12/9/20 6:00 PM, Greg Kurz wrote:
> > The sPAPR CPU core device can only work with pseries machine types.
> > This is currently checked in the realize function with a dynamic
> > cast of qdev_get_machine(). Some other places also need to reach
> > out to the machine using qdev_get_machine().
> >=20
> > Make this dependency explicit by introducing an "spapr" link
> > property which officialy points to the machine. This link is
> > set by pseries machine types only in the pre-plug handler. This
> > allows to drop some users of qdev_get_machine().
> >=20
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  include/hw/ppc/spapr_cpu_core.h |  2 ++
> >  hw/ppc/spapr.c                  |  4 ++++
> >  hw/ppc/spapr_cpu_core.c         | 17 +++++++----------
> >  3 files changed, 13 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/include/hw/ppc/spapr_cpu_core.h b/include/hw/ppc/spapr_cpu=
_core.h
> > index dab3dfc76c0a..0969b29fd96c 100644
> > --- a/include/hw/ppc/spapr_cpu_core.h
> > +++ b/include/hw/ppc/spapr_cpu_core.h
> > @@ -10,6 +10,7 @@
> >  #define HW_SPAPR_CPU_CORE_H
> > =20
> >  #include "hw/cpu/core.h"
> > +#include "hw/ppc/spapr.h"
> >  #include "hw/qdev-core.h"
> >  #include "target/ppc/cpu-qom.h"
> >  #include "target/ppc/cpu.h"
> > @@ -24,6 +25,7 @@ OBJECT_DECLARE_TYPE(SpaprCpuCore, SpaprCpuCoreClass,
> >  struct SpaprCpuCore {
> >      /*< private >*/
> >      CPUCore parent_obj;
> > +    SpaprMachineState *spapr;
> > =20
> >      /*< public >*/
> >      PowerPCCPU **threads;
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index d1dcf3ab2c94..4cc51723c62e 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -3816,6 +3816,10 @@ static void spapr_core_pre_plug(HotplugHandler *=
hotplug_dev, DeviceState *dev,
> >      int index;
> >      unsigned int smp_threads =3D machine->smp.threads;
> > =20
> > +    /* Required by spapr_cpu_core_realize() */
> > +    object_property_set_link(OBJECT(dev), "spapr", OBJECT(hotplug_dev),
> > +                             &error_abort);
> > +
> >      if (dev->hotplugged && !mc->has_hotpluggable_cpus) {
> >          error_setg(errp, "CPU hotplug not supported for this machine");
> >          return;
> > diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> > index 2f7dc3c23ded..dec09367e4a0 100644
> > --- a/hw/ppc/spapr_cpu_core.c
> > +++ b/hw/ppc/spapr_cpu_core.c
> > @@ -25,14 +25,13 @@
> >  #include "sysemu/hw_accel.h"
> >  #include "qemu/error-report.h"
> > =20
> > -static void spapr_reset_vcpu(PowerPCCPU *cpu)
> > +static void spapr_reset_vcpu(PowerPCCPU *cpu, SpaprMachineState *spapr)
> >  {
> >      CPUState *cs =3D CPU(cpu);
> >      CPUPPCState *env =3D &cpu->env;
> >      PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> >      SpaprCpuState *spapr_cpu =3D spapr_cpu_state(cpu);
> >      target_ulong lpcr;
> > -    SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
> > =20
> >      cpu_reset(cs);
> > =20
> > @@ -186,7 +185,7 @@ static void spapr_unrealize_vcpu(PowerPCCPU *cpu, S=
paprCpuCore *sc)
> >      if (!sc->pre_3_0_migration) {
> >          vmstate_unregister(NULL, &vmstate_spapr_cpu_state, cpu->machin=
e_data);
> >      }
> > -    spapr_irq_cpu_intc_destroy(SPAPR_MACHINE(qdev_get_machine()), cpu);
> > +    spapr_irq_cpu_intc_destroy(sc->spapr, cpu);
> >      qdev_unrealize(DEVICE(cpu));
> >  }
> > =20
> > @@ -200,7 +199,7 @@ static void spapr_cpu_core_reset(DeviceState *dev)
> >      int i;
> > =20
> >      for (i =3D 0; i < cc->nr_threads; i++) {
> > -        spapr_reset_vcpu(sc->threads[i]);
> > +        spapr_reset_vcpu(sc->threads[i], sc->spapr);
>=20
> Why reset() needs access to the machine state, don't
> you have it in realize()?
>=20

This is for the vCPU threads of the sPAPR CPU core. They don't have the
link to the machine state.

> >      }
> >  }
> > =20
> > @@ -314,16 +313,12 @@ err:
> > =20
> >  static void spapr_cpu_core_realize(DeviceState *dev, Error **errp)
> >  {
> > -    /* We don't use SPAPR_MACHINE() in order to exit gracefully if the=
 user
> > -     * tries to add a sPAPR CPU core to a non-pseries machine.
> > -     */
> > -    SpaprMachineState *spapr =3D
> > -        (SpaprMachineState *) object_dynamic_cast(qdev_get_machine(),
> > -                                                  TYPE_SPAPR_MACHINE);
> >      SpaprCpuCore *sc =3D SPAPR_CPU_CORE(OBJECT(dev));
> > +    SpaprMachineState *spapr =3D sc->spapr;
> >      CPUCore *cc =3D CPU_CORE(OBJECT(dev));
> >      int i;
> > =20
> > +    /* Set in spapr_core_pre_plug() */
> >      if (!spapr) {
> >          error_setg(errp, TYPE_SPAPR_CPU_CORE " needs a pseries machine=
");
> >          return;
> > @@ -345,6 +340,8 @@ static Property spapr_cpu_core_properties[] =3D {
> >      DEFINE_PROP_INT32("node-id", SpaprCpuCore, node_id, CPU_UNSET_NUMA=
_NODE_ID),
> >      DEFINE_PROP_BOOL("pre-3.0-migration", SpaprCpuCore, pre_3_0_migrat=
ion,
> >                       false),
> > +    DEFINE_PROP_LINK("spapr", SpaprCpuCore, spapr, TYPE_SPAPR_MACHINE,
> > +                     SpaprMachineState *),
> >      DEFINE_PROP_END_OF_LIST()
> >  };
> > =20
> >=20
>=20


