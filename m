Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2182C8CE2
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 19:35:43 +0100 (CET)
Received: from localhost ([::1]:45442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjo1W-0008L9-5S
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 13:35:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kjnx1-0004zm-V7; Mon, 30 Nov 2020 13:31:04 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:59997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kjnwy-0002ps-MX; Mon, 30 Nov 2020 13:31:03 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.148])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id AAF9876C2775;
 Mon, 30 Nov 2020 19:30:55 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 30 Nov
 2020 19:30:55 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005fa30d3a4-948e-4623-946a-54979ee5c12d,
 7ABFBA654CC4F86D18F59E8BA42633C5146172FA) smtp.auth=groug@kaod.org
Date: Mon, 30 Nov 2020 19:30:53 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH for-6.0 v2 1/3] spapr: Improve naming of some vCPU id
 related items
Message-ID: <20201130193053.68646606@bahia.lan>
In-Reply-To: <f5bb360d-fdaa-3952-ddb7-8e1a17cd6b1d@kaod.org>
References: <20201130165258.744611-1-groug@kaod.org>
 <20201130165258.744611-2-groug@kaod.org>
 <f5bb360d-fdaa-3952-ddb7-8e1a17cd6b1d@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 3fa2e08f-8f05-4e0b-b46c-3fa740693288
X-Ovh-Tracer-Id: 4206080579864861152
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudeitddguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthhqfedtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleeuteehgeehfeetveevledvhfeuuedugedugeetudefuedtkeekueegjefgtedvnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 30 Nov 2020 18:32:27 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 11/30/20 5:52 PM, Greg Kurz wrote:
> > The machine tells the IC backend the number of vCPU ids it will be
> > exposed to, in order to:
> > - fill the "ibm,interrupt-server-ranges" property in the DT (XICS)
> > - size the VP block used by the in-kernel chip (XICS-on-XIVE, XIVE)
> >=20
> > The current "nr_servers" and "spapr_max_server_number" naming can
> > mislead people info thinking it is about a quantity of CPUs. Make
> > it clear this is all about vCPU ids.
>=20
> OK. This looks fine.=20
>=20
> But, XIVE does not care about vCPU ids. Only the count of vCPUs

XIVE does not care about vCPU ids indeed but KVM does. The KVM XIVE code
has been indexing VPs with vCPU ids from the start as visible in linux
commit 5af50993850a ("KVM: PPC: Book3S HV: Native usage of the XIVE
interrupt controller") :

+int kvmppc_xive_connect_vcpu(struct kvm_device *dev,
+                            struct kvm_vcpu *vcpu, u32 cpu)
+{
[...]
+       xc->vp_id =3D xive->vp_base + cpu;

This allows to have a quick conversion between vCPU id and VP id
without relying on an intermediate mapping structure.=20

> is relevant. So, it would be nice to add a comment in the code=20
> that we got it wrong at some point or that XICS imposed the use
> of max vCPU ids.
>=20

There's more to it. The vCPU id spacing is a hack that was
introduced to workaround the limitation of pre-POWER9 cpu
types that cannot have HW threads from the same core running
in different MMU contexts. This was probably not such a good
idea but we have to live with it now since vCPU ids are guest
visible. I don't think it brings much to complain once more
over vCPU spacing since this has been addressed with VSMT.

The machine now always have consecutive vCPU ids by default,
ie. number of vCPUs =3D=3D number of vCPU ids. Only custom machine
setups that tweak VSMT to some other value can be affected
by the spacing.

> C.=20
>=20
>=20
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  include/hw/ppc/spapr.h      |  2 +-
> >  include/hw/ppc/spapr_irq.h  |  8 ++++----
> >  include/hw/ppc/spapr_xive.h |  2 +-
> >  include/hw/ppc/xics_spapr.h |  2 +-
> >  hw/intc/spapr_xive.c        |  8 ++++----
> >  hw/intc/spapr_xive_kvm.c    |  4 ++--
> >  hw/intc/xics_kvm.c          |  4 ++--
> >  hw/intc/xics_spapr.c        |  8 ++++----
> >  hw/ppc/spapr.c              |  8 ++++----
> >  hw/ppc/spapr_irq.c          | 18 +++++++++---------
> >  10 files changed, 32 insertions(+), 32 deletions(-)
> >=20
> > diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> > index b7ced9faebf5..dc99d45e2852 100644
> > --- a/include/hw/ppc/spapr.h
> > +++ b/include/hw/ppc/spapr.h
> > @@ -849,7 +849,7 @@ int spapr_hpt_shift_for_ramsize(uint64_t ramsize);
> >  int spapr_reallocate_hpt(SpaprMachineState *spapr, int shift, Error **=
errp);
> >  void spapr_clear_pending_events(SpaprMachineState *spapr);
> >  void spapr_clear_pending_hotplug_events(SpaprMachineState *spapr);
> > -int spapr_max_server_number(SpaprMachineState *spapr);
> > +int spapr_max_vcpu_ids(SpaprMachineState *spapr);
> >  void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
> >                        uint64_t pte0, uint64_t pte1);
> >  void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered);
> > diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
> > index c22a72c9e270..2e53fc9e6cbb 100644
> > --- a/include/hw/ppc/spapr_irq.h
> > +++ b/include/hw/ppc/spapr_irq.h
> > @@ -43,7 +43,7 @@ DECLARE_CLASS_CHECKERS(SpaprInterruptControllerClass,=
 SPAPR_INTC,
> >  struct SpaprInterruptControllerClass {
> >      InterfaceClass parent;
> > =20
> > -    int (*activate)(SpaprInterruptController *intc, uint32_t nr_server=
s,
> > +    int (*activate)(SpaprInterruptController *intc, uint32_t max_vcpu_=
ids,
> >                      Error **errp);
> >      void (*deactivate)(SpaprInterruptController *intc);
> > =20
> > @@ -62,7 +62,7 @@ struct SpaprInterruptControllerClass {
> >      /* These methods should only be called on the active intc */
> >      void (*set_irq)(SpaprInterruptController *intc, int irq, int val);
> >      void (*print_info)(SpaprInterruptController *intc, Monitor *mon);
> > -    void (*dt)(SpaprInterruptController *intc, uint32_t nr_servers,
> > +    void (*dt)(SpaprInterruptController *intc, uint32_t max_vcpu_ids,
> >                 void *fdt, uint32_t phandle);
> >      int (*post_load)(SpaprInterruptController *intc, int version_id);
> >  };
> > @@ -74,7 +74,7 @@ int spapr_irq_cpu_intc_create(struct SpaprMachineStat=
e *spapr,
> >  void spapr_irq_cpu_intc_reset(struct SpaprMachineState *spapr, PowerPC=
CPU *cpu);
> >  void spapr_irq_cpu_intc_destroy(struct SpaprMachineState *spapr, Power=
PCCPU *cpu);
> >  void spapr_irq_print_info(struct SpaprMachineState *spapr, Monitor *mo=
n);
> > -void spapr_irq_dt(struct SpaprMachineState *spapr, uint32_t nr_servers,
> > +void spapr_irq_dt(struct SpaprMachineState *spapr, uint32_t max_vcpu_i=
ds,
> >                    void *fdt, uint32_t phandle);
> > =20
> >  uint32_t spapr_irq_nr_msis(struct SpaprMachineState *spapr);
> > @@ -105,7 +105,7 @@ typedef int (*SpaprInterruptControllerInitKvm)(Spap=
rInterruptController *,
> > =20
> >  int spapr_irq_init_kvm(SpaprInterruptControllerInitKvm fn,
> >                         SpaprInterruptController *intc,
> > -                       uint32_t nr_servers,
> > +                       uint32_t max_vcpu_ids,
> >                         Error **errp);
> > =20
> >  /*
> > diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
> > index 26c8d90d7196..643129b13536 100644
> > --- a/include/hw/ppc/spapr_xive.h
> > +++ b/include/hw/ppc/spapr_xive.h
> > @@ -79,7 +79,7 @@ int spapr_xive_end_to_target(uint8_t end_blk, uint32_=
t end_idx,
> >  /*
> >   * KVM XIVE device helpers
> >   */
> > -int kvmppc_xive_connect(SpaprInterruptController *intc, uint32_t nr_se=
rvers,
> > +int kvmppc_xive_connect(SpaprInterruptController *intc, uint32_t max_v=
cpu_ids,
> >                          Error **errp);
> >  void kvmppc_xive_disconnect(SpaprInterruptController *intc);
> >  void kvmppc_xive_reset(SpaprXive *xive, Error **errp);
> > diff --git a/include/hw/ppc/xics_spapr.h b/include/hw/ppc/xics_spapr.h
> > index de752c0d2c7e..5c0e9430a964 100644
> > --- a/include/hw/ppc/xics_spapr.h
> > +++ b/include/hw/ppc/xics_spapr.h
> > @@ -35,7 +35,7 @@
> >  DECLARE_INSTANCE_CHECKER(ICSState, ICS_SPAPR,
> >                           TYPE_ICS_SPAPR)
> > =20
> > -int xics_kvm_connect(SpaprInterruptController *intc, uint32_t nr_serve=
rs,
> > +int xics_kvm_connect(SpaprInterruptController *intc, uint32_t max_vcpu=
_ids,
> >                       Error **errp);
> >  void xics_kvm_disconnect(SpaprInterruptController *intc);
> >  bool xics_kvm_has_broken_disconnect(void);
> > diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> > index 12dd6d3ce357..d0a0ca822367 100644
> > --- a/hw/intc/spapr_xive.c
> > +++ b/hw/intc/spapr_xive.c
> > @@ -669,7 +669,7 @@ static void spapr_xive_print_info(SpaprInterruptCon=
troller *intc, Monitor *mon)
> >      spapr_xive_pic_print_info(xive, mon);
> >  }
> > =20
> > -static void spapr_xive_dt(SpaprInterruptController *intc, uint32_t nr_=
servers,
> > +static void spapr_xive_dt(SpaprInterruptController *intc, uint32_t max=
_vcpu_ids,
> >                            void *fdt, uint32_t phandle)
> >  {
> >      SpaprXive *xive =3D SPAPR_XIVE(intc);
> > @@ -678,7 +678,7 @@ static void spapr_xive_dt(SpaprInterruptController =
*intc, uint32_t nr_servers,
> >      /* Interrupt number ranges for the IPIs */
> >      uint32_t lisn_ranges[] =3D {
> >          cpu_to_be32(SPAPR_IRQ_IPI),
> > -        cpu_to_be32(SPAPR_IRQ_IPI + nr_servers),
> > +        cpu_to_be32(SPAPR_IRQ_IPI + max_vcpu_ids),
> >      };
> >      /*
> >       * EQ size - the sizes of pages supported by the system 4K, 64K,
> > @@ -733,12 +733,12 @@ static void spapr_xive_dt(SpaprInterruptControlle=
r *intc, uint32_t nr_servers,
> >  }
> > =20
> >  static int spapr_xive_activate(SpaprInterruptController *intc,
> > -                               uint32_t nr_servers, Error **errp)
> > +                               uint32_t max_vcpu_ids, Error **errp)
> >  {
> >      SpaprXive *xive =3D SPAPR_XIVE(intc);
> > =20
> >      if (kvm_enabled()) {
> > -        int rc =3D spapr_irq_init_kvm(kvmppc_xive_connect, intc, nr_se=
rvers,
> > +        int rc =3D spapr_irq_init_kvm(kvmppc_xive_connect, intc, max_v=
cpu_ids,
> >                                      errp);
> >          if (rc < 0) {
> >              return rc;
> > diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
> > index e8667ce5f621..2a938b4429a8 100644
> > --- a/hw/intc/spapr_xive_kvm.c
> > +++ b/hw/intc/spapr_xive_kvm.c
> > @@ -716,7 +716,7 @@ static void *kvmppc_xive_mmap(SpaprXive *xive, int =
pgoff, size_t len,
> >   * All the XIVE memory regions are now backed by mappings from the KVM
> >   * XIVE device.
> >   */
> > -int kvmppc_xive_connect(SpaprInterruptController *intc, uint32_t nr_se=
rvers,
> > +int kvmppc_xive_connect(SpaprInterruptController *intc, uint32_t max_v=
cpu_ids,
> >                          Error **errp)
> >  {
> >      SpaprXive *xive =3D SPAPR_XIVE(intc);
> > @@ -753,7 +753,7 @@ int kvmppc_xive_connect(SpaprInterruptController *i=
ntc, uint32_t nr_servers,
> >      if (kvm_device_check_attr(xive->fd, KVM_DEV_XIVE_GRP_CTRL,
> >                                KVM_DEV_XIVE_NR_SERVERS)) {
> >          ret =3D kvm_device_access(xive->fd, KVM_DEV_XIVE_GRP_CTRL,
> > -                                KVM_DEV_XIVE_NR_SERVERS, &nr_servers, =
true,
> > +                                KVM_DEV_XIVE_NR_SERVERS, &max_vcpu_ids=
, true,
> >                                  errp);
> >          if (ret < 0) {
> >              goto fail;
> > diff --git a/hw/intc/xics_kvm.c b/hw/intc/xics_kvm.c
> > index 570d635bcc08..74e47752185c 100644
> > --- a/hw/intc/xics_kvm.c
> > +++ b/hw/intc/xics_kvm.c
> > @@ -347,7 +347,7 @@ void ics_kvm_set_irq(ICSState *ics, int srcno, int =
val)
> >      }
> >  }
> > =20
> > -int xics_kvm_connect(SpaprInterruptController *intc, uint32_t nr_serve=
rs,
> > +int xics_kvm_connect(SpaprInterruptController *intc, uint32_t max_vcpu=
_ids,
> >                       Error **errp)
> >  {
> >      ICSState *ics =3D ICS_SPAPR(intc);
> > @@ -408,7 +408,7 @@ int xics_kvm_connect(SpaprInterruptController *intc=
, uint32_t nr_servers,
> >      if (kvm_device_check_attr(rc, KVM_DEV_XICS_GRP_CTRL,
> >                                KVM_DEV_XICS_NR_SERVERS)) {
> >          if (kvm_device_access(rc, KVM_DEV_XICS_GRP_CTRL,
> > -                              KVM_DEV_XICS_NR_SERVERS, &nr_servers, tr=
ue,
> > +                              KVM_DEV_XICS_NR_SERVERS, &max_vcpu_ids, =
true,
> >                                &local_err)) {
> >              goto fail;
> >          }
> > diff --git a/hw/intc/xics_spapr.c b/hw/intc/xics_spapr.c
> > index 8ae4f41459c3..8f753a858cc2 100644
> > --- a/hw/intc/xics_spapr.c
> > +++ b/hw/intc/xics_spapr.c
> > @@ -308,11 +308,11 @@ static void ics_spapr_realize(DeviceState *dev, E=
rror **errp)
> >      spapr_register_hypercall(H_IPOLL, h_ipoll);
> >  }
> > =20
> > -static void xics_spapr_dt(SpaprInterruptController *intc, uint32_t nr_=
servers,
> > +static void xics_spapr_dt(SpaprInterruptController *intc, uint32_t max=
_vcpu_ids,
> >                            void *fdt, uint32_t phandle)
> >  {
> >      uint32_t interrupt_server_ranges_prop[] =3D {
> > -        0, cpu_to_be32(nr_servers),
> > +        0, cpu_to_be32(max_vcpu_ids),
> >      };
> >      int node;
> > =20
> > @@ -423,10 +423,10 @@ static int xics_spapr_post_load(SpaprInterruptCon=
troller *intc, int version_id)
> >  }
> > =20
> >  static int xics_spapr_activate(SpaprInterruptController *intc,
> > -                               uint32_t nr_servers, Error **errp)
> > +                               uint32_t max_vcpu_ids, Error **errp)
> >  {
> >      if (kvm_enabled()) {
> > -        return spapr_irq_init_kvm(xics_kvm_connect, intc, nr_servers, =
errp);
> > +        return spapr_irq_init_kvm(xics_kvm_connect, intc, max_vcpu_ids=
, errp);
> >      }
> >      return 0;
> >  }
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index 7e954bc84bed..ab59bfe941d0 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -161,7 +161,7 @@ static void pre_2_10_vmstate_unregister_dummy_icp(i=
nt i)
> >                         (void *)(uintptr_t) i);
> >  }
> > =20
> > -int spapr_max_server_number(SpaprMachineState *spapr)
> > +int spapr_max_vcpu_ids(SpaprMachineState *spapr)
> >  {
> >      MachineState *ms =3D MACHINE(spapr);
> > =20
> > @@ -1164,7 +1164,7 @@ void *spapr_build_fdt(SpaprMachineState *spapr, b=
ool reset, size_t space)
> >      _FDT(fdt_setprop_cell(fdt, 0, "#size-cells", 2));
> > =20
> >      /* /interrupt controller */
> > -    spapr_irq_dt(spapr, spapr_max_server_number(spapr), fdt, PHANDLE_I=
NTC);
> > +    spapr_irq_dt(spapr, spapr_max_vcpu_ids(spapr), fdt, PHANDLE_INTC);
> > =20
> >      ret =3D spapr_dt_memory(spapr, fdt);
> >      if (ret < 0) {
> > @@ -2558,7 +2558,7 @@ static void spapr_init_cpus(SpaprMachineState *sp=
apr)
> >      if (smc->pre_2_10_has_unused_icps) {
> >          int i;
> > =20
> > -        for (i =3D 0; i < spapr_max_server_number(spapr); i++) {
> > +        for (i =3D 0; i < spapr_max_vcpu_ids(spapr); i++) {
> >              /* Dummy entries get deregistered when real ICPState objec=
ts
> >               * are registered during CPU core hotplug.
> >               */
> > @@ -2709,7 +2709,7 @@ static void spapr_machine_init(MachineState *mach=
ine)
> > =20
> >      /*
> >       * VSMT must be set in order to be able to compute VCPU ids, ie to
> > -     * call spapr_max_server_number() or spapr_vcpu_id().
> > +     * call spapr_max_vcpu_ids() or spapr_vcpu_id().
> >       */
> >      spapr_set_vsmt_mode(spapr, &error_fatal);
> > =20
> > diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
> > index a0d1e1298e1e..552e30e93036 100644
> > --- a/hw/ppc/spapr_irq.c
> > +++ b/hw/ppc/spapr_irq.c
> > @@ -72,13 +72,13 @@ void spapr_irq_msi_free(SpaprMachineState *spapr, i=
nt irq, uint32_t num)
> > =20
> >  int spapr_irq_init_kvm(SpaprInterruptControllerInitKvm fn,
> >                         SpaprInterruptController *intc,
> > -                       uint32_t nr_servers,
> > +                       uint32_t max_vcpu_ids,
> >                         Error **errp)
> >  {
> >      Error *local_err =3D NULL;
> > =20
> >      if (kvm_enabled() && kvm_kernel_irqchip_allowed()) {
> > -        if (fn(intc, nr_servers, &local_err) < 0) {
> > +        if (fn(intc, max_vcpu_ids, &local_err) < 0) {
> >              if (kvm_kernel_irqchip_required()) {
> >                  error_prepend(&local_err,
> >                                "kernel_irqchip requested but unavailabl=
e: ");
> > @@ -271,13 +271,13 @@ void spapr_irq_print_info(SpaprMachineState *spap=
r, Monitor *mon)
> >      sicc->print_info(spapr->active_intc, mon);
> >  }
> > =20
> > -void spapr_irq_dt(SpaprMachineState *spapr, uint32_t nr_servers,
> > +void spapr_irq_dt(SpaprMachineState *spapr, uint32_t max_vcpu_ids,
> >                    void *fdt, uint32_t phandle)
> >  {
> >      SpaprInterruptControllerClass *sicc
> >          =3D SPAPR_INTC_GET_CLASS(spapr->active_intc);
> > =20
> > -    sicc->dt(spapr->active_intc, nr_servers, fdt, phandle);
> > +    sicc->dt(spapr->active_intc, max_vcpu_ids, fdt, phandle);
> >  }
> > =20
> >  uint32_t spapr_irq_nr_msis(SpaprMachineState *spapr)
> > @@ -324,7 +324,7 @@ void spapr_irq_init(SpaprMachineState *spapr, Error=
 **errp)
> >      }
> > =20
> >      if (spapr->irq->xive) {
> > -        uint32_t nr_servers =3D spapr_max_server_number(spapr);
> > +        uint32_t max_vcpu_ids =3D spapr_max_vcpu_ids(spapr);
> >          DeviceState *dev;
> >          int i;
> > =20
> > @@ -334,7 +334,7 @@ void spapr_irq_init(SpaprMachineState *spapr, Error=
 **errp)
> >           * 8 XIVE END structures per CPU. One for each available
> >           * priority
> >           */
> > -        qdev_prop_set_uint32(dev, "nr-ends", nr_servers << 3);
> > +        qdev_prop_set_uint32(dev, "nr-ends", max_vcpu_ids << 3);
> >          object_property_set_link(OBJECT(dev), "xive-fabric", OBJECT(sp=
apr),
> >                                   &error_abort);
> >          sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> > @@ -342,7 +342,7 @@ void spapr_irq_init(SpaprMachineState *spapr, Error=
 **errp)
> >          spapr->xive =3D SPAPR_XIVE(dev);
> > =20
> >          /* Enable the CPU IPIs */
> > -        for (i =3D 0; i < nr_servers; ++i) {
> > +        for (i =3D 0; i < max_vcpu_ids; ++i) {
> >              SpaprInterruptControllerClass *sicc
> >                  =3D SPAPR_INTC_GET_CLASS(spapr->xive);
> > =20
> > @@ -479,7 +479,7 @@ static void set_active_intc(SpaprMachineState *spap=
r,
> >                              SpaprInterruptController *new_intc)
> >  {
> >      SpaprInterruptControllerClass *sicc;
> > -    uint32_t nr_servers =3D spapr_max_server_number(spapr);
> > +    uint32_t max_vcpu_ids =3D spapr_max_vcpu_ids(spapr);
> > =20
> >      assert(new_intc);
> > =20
> > @@ -497,7 +497,7 @@ static void set_active_intc(SpaprMachineState *spap=
r,
> > =20
> >      sicc =3D SPAPR_INTC_GET_CLASS(new_intc);
> >      if (sicc->activate) {
> > -        sicc->activate(new_intc, nr_servers, &error_fatal);
> > +        sicc->activate(new_intc, max_vcpu_ids, &error_fatal);
> >      }
> > =20
> >      spapr->active_intc =3D new_intc;
> >=20
>=20


