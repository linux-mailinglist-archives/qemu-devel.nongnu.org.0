Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 789A52CCAA3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 00:44:41 +0100 (CET)
Received: from localhost ([::1]:54594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkbnc-0002xY-1O
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 18:44:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kkbl8-00022H-NP; Wed, 02 Dec 2020 18:42:07 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:40545 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kkbl3-0006wf-M9; Wed, 02 Dec 2020 18:42:05 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cmb905FTmz9sT5; Thu,  3 Dec 2020 10:41:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606952516;
 bh=9PRjnUz8XIpW6FK1YgwwXBndUPLqYjSagN87z+iicmM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UDFk4d6XwWtXTIkPFAA4flgnS7hUEcshgpPz1G8/nF1+k/IN5L9qx2GcxMaEsw5Uh
 V4v+vH3oXuujxzJ5FNgxQHn75qSgC0xfi6PsXqA/wyvgqxBCkUVxxzml+Z7L3ZQKJt
 8vzRwXpBxTIHvQxDDZKbaEL3s2zmRXxZ1DAfO+C4=
Date: Wed, 2 Dec 2020 15:56:16 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-6.0 v2 1/3] spapr: Improve naming of some vCPU id
 related items
Message-ID: <20201202045616.GC7801@yekko.fritz.box>
References: <20201130165258.744611-1-groug@kaod.org>
 <20201130165258.744611-2-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lCAWRPmW1mITcIfM"
Content-Disposition: inline
In-Reply-To: <20201130165258.744611-2-groug@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--lCAWRPmW1mITcIfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 30, 2020 at 05:52:56PM +0100, Greg Kurz wrote:
> The machine tells the IC backend the number of vCPU ids it will be
> exposed to, in order to:
> - fill the "ibm,interrupt-server-ranges" property in the DT (XICS)
> - size the VP block used by the in-kernel chip (XICS-on-XIVE, XIVE)
>=20
> The current "nr_servers" and "spapr_max_server_number" naming can
> mislead people info thinking it is about a quantity of CPUs. Make
> it clear this is all about vCPU ids.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

I know it seems very finicky, but can you please
s/max_vcpu_ids/max_vcpu_id/g

At least to be "max_vcpu_ids" has some of the same confusion as the
existing code - it reads like the maximum *number* of IDs, rather than
the maximum *value* of IDs.

> ---
>  include/hw/ppc/spapr.h      |  2 +-
>  include/hw/ppc/spapr_irq.h  |  8 ++++----
>  include/hw/ppc/spapr_xive.h |  2 +-
>  include/hw/ppc/xics_spapr.h |  2 +-
>  hw/intc/spapr_xive.c        |  8 ++++----
>  hw/intc/spapr_xive_kvm.c    |  4 ++--
>  hw/intc/xics_kvm.c          |  4 ++--
>  hw/intc/xics_spapr.c        |  8 ++++----
>  hw/ppc/spapr.c              |  8 ++++----
>  hw/ppc/spapr_irq.c          | 18 +++++++++---------
>  10 files changed, 32 insertions(+), 32 deletions(-)
>=20
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index b7ced9faebf5..dc99d45e2852 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -849,7 +849,7 @@ int spapr_hpt_shift_for_ramsize(uint64_t ramsize);
>  int spapr_reallocate_hpt(SpaprMachineState *spapr, int shift, Error **er=
rp);
>  void spapr_clear_pending_events(SpaprMachineState *spapr);
>  void spapr_clear_pending_hotplug_events(SpaprMachineState *spapr);
> -int spapr_max_server_number(SpaprMachineState *spapr);
> +int spapr_max_vcpu_ids(SpaprMachineState *spapr);
>  void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
>                        uint64_t pte0, uint64_t pte1);
>  void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered);
> diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
> index c22a72c9e270..2e53fc9e6cbb 100644
> --- a/include/hw/ppc/spapr_irq.h
> +++ b/include/hw/ppc/spapr_irq.h
> @@ -43,7 +43,7 @@ DECLARE_CLASS_CHECKERS(SpaprInterruptControllerClass, S=
PAPR_INTC,
>  struct SpaprInterruptControllerClass {
>      InterfaceClass parent;
> =20
> -    int (*activate)(SpaprInterruptController *intc, uint32_t nr_servers,
> +    int (*activate)(SpaprInterruptController *intc, uint32_t max_vcpu_id=
s,
>                      Error **errp);
>      void (*deactivate)(SpaprInterruptController *intc);
> =20
> @@ -62,7 +62,7 @@ struct SpaprInterruptControllerClass {
>      /* These methods should only be called on the active intc */
>      void (*set_irq)(SpaprInterruptController *intc, int irq, int val);
>      void (*print_info)(SpaprInterruptController *intc, Monitor *mon);
> -    void (*dt)(SpaprInterruptController *intc, uint32_t nr_servers,
> +    void (*dt)(SpaprInterruptController *intc, uint32_t max_vcpu_ids,
>                 void *fdt, uint32_t phandle);
>      int (*post_load)(SpaprInterruptController *intc, int version_id);
>  };
> @@ -74,7 +74,7 @@ int spapr_irq_cpu_intc_create(struct SpaprMachineState =
*spapr,
>  void spapr_irq_cpu_intc_reset(struct SpaprMachineState *spapr, PowerPCCP=
U *cpu);
>  void spapr_irq_cpu_intc_destroy(struct SpaprMachineState *spapr, PowerPC=
CPU *cpu);
>  void spapr_irq_print_info(struct SpaprMachineState *spapr, Monitor *mon);
> -void spapr_irq_dt(struct SpaprMachineState *spapr, uint32_t nr_servers,
> +void spapr_irq_dt(struct SpaprMachineState *spapr, uint32_t max_vcpu_ids,
>                    void *fdt, uint32_t phandle);
> =20
>  uint32_t spapr_irq_nr_msis(struct SpaprMachineState *spapr);
> @@ -105,7 +105,7 @@ typedef int (*SpaprInterruptControllerInitKvm)(SpaprI=
nterruptController *,
> =20
>  int spapr_irq_init_kvm(SpaprInterruptControllerInitKvm fn,
>                         SpaprInterruptController *intc,
> -                       uint32_t nr_servers,
> +                       uint32_t max_vcpu_ids,
>                         Error **errp);
> =20
>  /*
> diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
> index 26c8d90d7196..643129b13536 100644
> --- a/include/hw/ppc/spapr_xive.h
> +++ b/include/hw/ppc/spapr_xive.h
> @@ -79,7 +79,7 @@ int spapr_xive_end_to_target(uint8_t end_blk, uint32_t =
end_idx,
>  /*
>   * KVM XIVE device helpers
>   */
> -int kvmppc_xive_connect(SpaprInterruptController *intc, uint32_t nr_serv=
ers,
> +int kvmppc_xive_connect(SpaprInterruptController *intc, uint32_t max_vcp=
u_ids,
>                          Error **errp);
>  void kvmppc_xive_disconnect(SpaprInterruptController *intc);
>  void kvmppc_xive_reset(SpaprXive *xive, Error **errp);
> diff --git a/include/hw/ppc/xics_spapr.h b/include/hw/ppc/xics_spapr.h
> index de752c0d2c7e..5c0e9430a964 100644
> --- a/include/hw/ppc/xics_spapr.h
> +++ b/include/hw/ppc/xics_spapr.h
> @@ -35,7 +35,7 @@
>  DECLARE_INSTANCE_CHECKER(ICSState, ICS_SPAPR,
>                           TYPE_ICS_SPAPR)
> =20
> -int xics_kvm_connect(SpaprInterruptController *intc, uint32_t nr_servers,
> +int xics_kvm_connect(SpaprInterruptController *intc, uint32_t max_vcpu_i=
ds,
>                       Error **errp);
>  void xics_kvm_disconnect(SpaprInterruptController *intc);
>  bool xics_kvm_has_broken_disconnect(void);
> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> index 12dd6d3ce357..d0a0ca822367 100644
> --- a/hw/intc/spapr_xive.c
> +++ b/hw/intc/spapr_xive.c
> @@ -669,7 +669,7 @@ static void spapr_xive_print_info(SpaprInterruptContr=
oller *intc, Monitor *mon)
>      spapr_xive_pic_print_info(xive, mon);
>  }
> =20
> -static void spapr_xive_dt(SpaprInterruptController *intc, uint32_t nr_se=
rvers,
> +static void spapr_xive_dt(SpaprInterruptController *intc, uint32_t max_v=
cpu_ids,
>                            void *fdt, uint32_t phandle)
>  {
>      SpaprXive *xive =3D SPAPR_XIVE(intc);
> @@ -678,7 +678,7 @@ static void spapr_xive_dt(SpaprInterruptController *i=
ntc, uint32_t nr_servers,
>      /* Interrupt number ranges for the IPIs */
>      uint32_t lisn_ranges[] =3D {
>          cpu_to_be32(SPAPR_IRQ_IPI),
> -        cpu_to_be32(SPAPR_IRQ_IPI + nr_servers),
> +        cpu_to_be32(SPAPR_IRQ_IPI + max_vcpu_ids),
>      };
>      /*
>       * EQ size - the sizes of pages supported by the system 4K, 64K,
> @@ -733,12 +733,12 @@ static void spapr_xive_dt(SpaprInterruptController =
*intc, uint32_t nr_servers,
>  }
> =20
>  static int spapr_xive_activate(SpaprInterruptController *intc,
> -                               uint32_t nr_servers, Error **errp)
> +                               uint32_t max_vcpu_ids, Error **errp)
>  {
>      SpaprXive *xive =3D SPAPR_XIVE(intc);
> =20
>      if (kvm_enabled()) {
> -        int rc =3D spapr_irq_init_kvm(kvmppc_xive_connect, intc, nr_serv=
ers,
> +        int rc =3D spapr_irq_init_kvm(kvmppc_xive_connect, intc, max_vcp=
u_ids,
>                                      errp);
>          if (rc < 0) {
>              return rc;
> diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
> index e8667ce5f621..2a938b4429a8 100644
> --- a/hw/intc/spapr_xive_kvm.c
> +++ b/hw/intc/spapr_xive_kvm.c
> @@ -716,7 +716,7 @@ static void *kvmppc_xive_mmap(SpaprXive *xive, int pg=
off, size_t len,
>   * All the XIVE memory regions are now backed by mappings from the KVM
>   * XIVE device.
>   */
> -int kvmppc_xive_connect(SpaprInterruptController *intc, uint32_t nr_serv=
ers,
> +int kvmppc_xive_connect(SpaprInterruptController *intc, uint32_t max_vcp=
u_ids,
>                          Error **errp)
>  {
>      SpaprXive *xive =3D SPAPR_XIVE(intc);
> @@ -753,7 +753,7 @@ int kvmppc_xive_connect(SpaprInterruptController *int=
c, uint32_t nr_servers,
>      if (kvm_device_check_attr(xive->fd, KVM_DEV_XIVE_GRP_CTRL,
>                                KVM_DEV_XIVE_NR_SERVERS)) {
>          ret =3D kvm_device_access(xive->fd, KVM_DEV_XIVE_GRP_CTRL,
> -                                KVM_DEV_XIVE_NR_SERVERS, &nr_servers, tr=
ue,
> +                                KVM_DEV_XIVE_NR_SERVERS, &max_vcpu_ids, =
true,
>                                  errp);
>          if (ret < 0) {
>              goto fail;
> diff --git a/hw/intc/xics_kvm.c b/hw/intc/xics_kvm.c
> index 570d635bcc08..74e47752185c 100644
> --- a/hw/intc/xics_kvm.c
> +++ b/hw/intc/xics_kvm.c
> @@ -347,7 +347,7 @@ void ics_kvm_set_irq(ICSState *ics, int srcno, int va=
l)
>      }
>  }
> =20
> -int xics_kvm_connect(SpaprInterruptController *intc, uint32_t nr_servers,
> +int xics_kvm_connect(SpaprInterruptController *intc, uint32_t max_vcpu_i=
ds,
>                       Error **errp)
>  {
>      ICSState *ics =3D ICS_SPAPR(intc);
> @@ -408,7 +408,7 @@ int xics_kvm_connect(SpaprInterruptController *intc, =
uint32_t nr_servers,
>      if (kvm_device_check_attr(rc, KVM_DEV_XICS_GRP_CTRL,
>                                KVM_DEV_XICS_NR_SERVERS)) {
>          if (kvm_device_access(rc, KVM_DEV_XICS_GRP_CTRL,
> -                              KVM_DEV_XICS_NR_SERVERS, &nr_servers, true,
> +                              KVM_DEV_XICS_NR_SERVERS, &max_vcpu_ids, tr=
ue,
>                                &local_err)) {
>              goto fail;
>          }
> diff --git a/hw/intc/xics_spapr.c b/hw/intc/xics_spapr.c
> index 8ae4f41459c3..8f753a858cc2 100644
> --- a/hw/intc/xics_spapr.c
> +++ b/hw/intc/xics_spapr.c
> @@ -308,11 +308,11 @@ static void ics_spapr_realize(DeviceState *dev, Err=
or **errp)
>      spapr_register_hypercall(H_IPOLL, h_ipoll);
>  }
> =20
> -static void xics_spapr_dt(SpaprInterruptController *intc, uint32_t nr_se=
rvers,
> +static void xics_spapr_dt(SpaprInterruptController *intc, uint32_t max_v=
cpu_ids,
>                            void *fdt, uint32_t phandle)
>  {
>      uint32_t interrupt_server_ranges_prop[] =3D {
> -        0, cpu_to_be32(nr_servers),
> +        0, cpu_to_be32(max_vcpu_ids),
>      };
>      int node;
> =20
> @@ -423,10 +423,10 @@ static int xics_spapr_post_load(SpaprInterruptContr=
oller *intc, int version_id)
>  }
> =20
>  static int xics_spapr_activate(SpaprInterruptController *intc,
> -                               uint32_t nr_servers, Error **errp)
> +                               uint32_t max_vcpu_ids, Error **errp)
>  {
>      if (kvm_enabled()) {
> -        return spapr_irq_init_kvm(xics_kvm_connect, intc, nr_servers, er=
rp);
> +        return spapr_irq_init_kvm(xics_kvm_connect, intc, max_vcpu_ids, =
errp);
>      }
>      return 0;
>  }
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 7e954bc84bed..ab59bfe941d0 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -161,7 +161,7 @@ static void pre_2_10_vmstate_unregister_dummy_icp(int=
 i)
>                         (void *)(uintptr_t) i);
>  }
> =20
> -int spapr_max_server_number(SpaprMachineState *spapr)
> +int spapr_max_vcpu_ids(SpaprMachineState *spapr)
>  {
>      MachineState *ms =3D MACHINE(spapr);
> =20
> @@ -1164,7 +1164,7 @@ void *spapr_build_fdt(SpaprMachineState *spapr, boo=
l reset, size_t space)
>      _FDT(fdt_setprop_cell(fdt, 0, "#size-cells", 2));
> =20
>      /* /interrupt controller */
> -    spapr_irq_dt(spapr, spapr_max_server_number(spapr), fdt, PHANDLE_INT=
C);
> +    spapr_irq_dt(spapr, spapr_max_vcpu_ids(spapr), fdt, PHANDLE_INTC);
> =20
>      ret =3D spapr_dt_memory(spapr, fdt);
>      if (ret < 0) {
> @@ -2558,7 +2558,7 @@ static void spapr_init_cpus(SpaprMachineState *spap=
r)
>      if (smc->pre_2_10_has_unused_icps) {
>          int i;
> =20
> -        for (i =3D 0; i < spapr_max_server_number(spapr); i++) {
> +        for (i =3D 0; i < spapr_max_vcpu_ids(spapr); i++) {
>              /* Dummy entries get deregistered when real ICPState objects
>               * are registered during CPU core hotplug.
>               */
> @@ -2709,7 +2709,7 @@ static void spapr_machine_init(MachineState *machin=
e)
> =20
>      /*
>       * VSMT must be set in order to be able to compute VCPU ids, ie to
> -     * call spapr_max_server_number() or spapr_vcpu_id().
> +     * call spapr_max_vcpu_ids() or spapr_vcpu_id().
>       */
>      spapr_set_vsmt_mode(spapr, &error_fatal);
> =20
> diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
> index a0d1e1298e1e..552e30e93036 100644
> --- a/hw/ppc/spapr_irq.c
> +++ b/hw/ppc/spapr_irq.c
> @@ -72,13 +72,13 @@ void spapr_irq_msi_free(SpaprMachineState *spapr, int=
 irq, uint32_t num)
> =20
>  int spapr_irq_init_kvm(SpaprInterruptControllerInitKvm fn,
>                         SpaprInterruptController *intc,
> -                       uint32_t nr_servers,
> +                       uint32_t max_vcpu_ids,
>                         Error **errp)
>  {
>      Error *local_err =3D NULL;
> =20
>      if (kvm_enabled() && kvm_kernel_irqchip_allowed()) {
> -        if (fn(intc, nr_servers, &local_err) < 0) {
> +        if (fn(intc, max_vcpu_ids, &local_err) < 0) {
>              if (kvm_kernel_irqchip_required()) {
>                  error_prepend(&local_err,
>                                "kernel_irqchip requested but unavailable:=
 ");
> @@ -271,13 +271,13 @@ void spapr_irq_print_info(SpaprMachineState *spapr,=
 Monitor *mon)
>      sicc->print_info(spapr->active_intc, mon);
>  }
> =20
> -void spapr_irq_dt(SpaprMachineState *spapr, uint32_t nr_servers,
> +void spapr_irq_dt(SpaprMachineState *spapr, uint32_t max_vcpu_ids,
>                    void *fdt, uint32_t phandle)
>  {
>      SpaprInterruptControllerClass *sicc
>          =3D SPAPR_INTC_GET_CLASS(spapr->active_intc);
> =20
> -    sicc->dt(spapr->active_intc, nr_servers, fdt, phandle);
> +    sicc->dt(spapr->active_intc, max_vcpu_ids, fdt, phandle);
>  }
> =20
>  uint32_t spapr_irq_nr_msis(SpaprMachineState *spapr)
> @@ -324,7 +324,7 @@ void spapr_irq_init(SpaprMachineState *spapr, Error *=
*errp)
>      }
> =20
>      if (spapr->irq->xive) {
> -        uint32_t nr_servers =3D spapr_max_server_number(spapr);
> +        uint32_t max_vcpu_ids =3D spapr_max_vcpu_ids(spapr);
>          DeviceState *dev;
>          int i;
> =20
> @@ -334,7 +334,7 @@ void spapr_irq_init(SpaprMachineState *spapr, Error *=
*errp)
>           * 8 XIVE END structures per CPU. One for each available
>           * priority
>           */
> -        qdev_prop_set_uint32(dev, "nr-ends", nr_servers << 3);
> +        qdev_prop_set_uint32(dev, "nr-ends", max_vcpu_ids << 3);
>          object_property_set_link(OBJECT(dev), "xive-fabric", OBJECT(spap=
r),
>                                   &error_abort);
>          sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> @@ -342,7 +342,7 @@ void spapr_irq_init(SpaprMachineState *spapr, Error *=
*errp)
>          spapr->xive =3D SPAPR_XIVE(dev);
> =20
>          /* Enable the CPU IPIs */
> -        for (i =3D 0; i < nr_servers; ++i) {
> +        for (i =3D 0; i < max_vcpu_ids; ++i) {
>              SpaprInterruptControllerClass *sicc
>                  =3D SPAPR_INTC_GET_CLASS(spapr->xive);
> =20
> @@ -479,7 +479,7 @@ static void set_active_intc(SpaprMachineState *spapr,
>                              SpaprInterruptController *new_intc)
>  {
>      SpaprInterruptControllerClass *sicc;
> -    uint32_t nr_servers =3D spapr_max_server_number(spapr);
> +    uint32_t max_vcpu_ids =3D spapr_max_vcpu_ids(spapr);
> =20
>      assert(new_intc);
> =20
> @@ -497,7 +497,7 @@ static void set_active_intc(SpaprMachineState *spapr,
> =20
>      sicc =3D SPAPR_INTC_GET_CLASS(new_intc);
>      if (sicc->activate) {
> -        sicc->activate(new_intc, nr_servers, &error_fatal);
> +        sicc->activate(new_intc, max_vcpu_ids, &error_fatal);
>      }
> =20
>      spapr->active_intc =3D new_intc;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--lCAWRPmW1mITcIfM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/HHm4ACgkQbDjKyiDZ
s5KjNw/+LjD/8p82jr6s2AMbsLaAQwrs2ZOYrxFAjlJSCLDYBoOXDh977+A3/A8H
gqfEHqcrt6alcdPPMMrj3uVrq4l9VfzucnYdW4wt7fjs/Af9aFqM7A1vq+xeWT9J
qsPLFexFYVTKRDlC2l3dMRKQ0Dr4JgH6GVALxyacTcUwqHHH0heTVOCYmqFvWwq9
fpYG3qI6GiuDbFhNqh4kbEXShKnKQs+ePAYqXV2tCkmTqJctLLznySMhypO3+kCf
lRgsZB0gWPQ9mQr/BufkfRjtom97Z+rw2+uavcZtYGLZuQA3wYdx0Qw9VaCFdepQ
SBM6fGFgt1d/qND+HP82Sivx0U1KcyUm4C51GsqMYMetfXFBZd5Ncdy67ppgLL1Z
TAp6QLm/e0eIH78j2DguvG/1mcRI2vfD9K4DLZ6wwaJ5U9k9O5L7ZYy88/sYBO8O
/1ePcqwnqbHXCLpVnN4YVtnG+1JeGLP5LgBV/YHhvNmiwASaN7nqe/gwq0TLxGHK
cx4N2qQO+bySIQIuTcMnwHP+Nl/ezdryqLCwz97zjvwbBoqq/JX3AneY7Xs/1JST
nKmB41yjDqfnUXtREdnRwzaQsYdIE0vsW/uSlmZX4Kh9w+80QQfsh0JUjM4OiLl0
dduOpDdpW5ksIaOwjeuvc5E3Au62x3EnrTS0y4mDUzEo4VH3g18=
=rJ93
-----END PGP SIGNATURE-----

--lCAWRPmW1mITcIfM--

