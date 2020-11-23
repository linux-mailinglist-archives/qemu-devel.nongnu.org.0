Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E9C2C033B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 11:27:05 +0100 (CET)
Received: from localhost ([::1]:52710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh93n-0002GM-U5
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 05:27:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kh91v-00013d-KG
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 05:25:07 -0500
Received: from 2.mo51.mail-out.ovh.net ([178.33.255.19]:40008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kh91r-000772-38
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 05:25:07 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.194])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 48E8D2389FA;
 Mon, 23 Nov 2020 11:24:58 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 23 Nov
 2020 11:24:58 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006c55c0a43-7d00-4ccf-a44e-704e09192bec,
 AF84A700016AED6247F1F5B9AC1D14952D0C96A6) smtp.auth=clg@kaod.org
Subject: Re: [PATCH for-6.0 6/8] spapr/xics: Add "nr-servers" property
To: Greg Kurz <groug@kaod.org>, <qemu-devel@nongnu.org>
References: <20201120174646.619395-1-groug@kaod.org>
 <20201120174646.619395-7-groug@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a03e2070-186b-59b7-b9f0-178a8dff06c7@kaod.org>
Date: Mon, 23 Nov 2020 11:24:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120174646.619395-7-groug@kaod.org>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ed1cb1b6-1fd6-47f9-8209-7eb42531d719
X-Ovh-Tracer-Id: 10230489503614274528
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegiedgudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtjeertddtfeehnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephfefieetveeuudfgudetudehjeffhfejieevfefhffffueetgfdtleefieeitdegnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 6:46 PM, Greg Kurz wrote:
> The sPAPR ICS device exposes the range of vCPU ids it can handle in
> the "ibm,interrupt-server-ranges" FDT property. The highest vCPU
> id, ie. spapr_max_server_number(), is obtained from the machine
> through the "nr_servers" argument of the generic spapr_irq_dt() call.
> 
> We want to drop the "nr_servers" argument from the API because it
> doesn't make sense for the sPAPR XIVE device actually.
> 
> On POWER9, we also pass the highest vCPU id to the KVM XICS-on-XIVE
> device, in order to optimize resource allocation in the HW.
> 
> This is enough motivation to introduce an "nr-servers" property
> and to use it for both purposes.

I don't see a strong justification for storing this information at
the interrupt controller level. If it can be kept at the machine 
level, like it is today, I think it's better.

C. 

 
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  include/hw/ppc/spapr.h      |  4 ++--
>  include/hw/ppc/xics_spapr.h | 21 +++++++++++++++++---
>  hw/intc/xics_kvm.c          |  2 +-
>  hw/intc/xics_spapr.c        | 38 ++++++++++++++++++++++++-------------
>  hw/ppc/spapr.c              |  5 +++--
>  hw/ppc/spapr_irq.c          |  7 +++++--
>  6 files changed, 54 insertions(+), 23 deletions(-)
> 
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 2e89e36cfbdc..b76c84a2f884 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -10,7 +10,7 @@
>  #include "hw/ppc/spapr_irq.h"
>  #include "qom/object.h"
>  #include "hw/ppc/spapr_xive.h"  /* For SpaprXive */
> -#include "hw/ppc/xics.h"        /* For ICSState */
> +#include "hw/ppc/xics_spapr.h"  /* For IcsSpaprState */
>  #include "hw/ppc/spapr_tpm_proxy.h"
>  
>  struct SpaprVioBus;
> @@ -230,7 +230,7 @@ struct SpaprMachineState {
>      SpaprIrq *irq;
>      qemu_irq *qirqs;
>      SpaprInterruptController *active_intc;
> -    ICSState *ics;
> +    IcsSpaprState *ics;
>      SpaprXive *xive;
>  
>      bool cmd_line_caps[SPAPR_CAP_NUM];
> diff --git a/include/hw/ppc/xics_spapr.h b/include/hw/ppc/xics_spapr.h
> index de752c0d2c7e..1a483a873b62 100644
> --- a/include/hw/ppc/xics_spapr.h
> +++ b/include/hw/ppc/xics_spapr.h
> @@ -28,12 +28,27 @@
>  #define XICS_SPAPR_H
>  
>  #include "hw/ppc/spapr.h"
> +#include "hw/ppc/xics.h"
>  #include "qom/object.h"
>  
> +typedef struct IcsSpaprState {
> +    /*< private >*/
> +    ICPState parent_obj;
> +
> +    /*
> +     * The ICS needs to know the upper limit to vCPU ids it
> +     * might be exposed to in order to size the vCPU id range
> +     * in "ibm,interrupt-server-ranges" and to optimize HW
> +     * resource allocation when using the XICS-on-XIVE KVM
> +     * device. It is the purpose of the "nr-servers" property
> +     * which *must* be set to a non-null value before realizing
> +     * the ICS.
> +     */
> +    uint32_t nr_servers;
> +} IcsSpaprState;
> +
>  #define TYPE_ICS_SPAPR "ics-spapr"
> -/* This is reusing the ICSState typedef from TYPE_ICS */
> -DECLARE_INSTANCE_CHECKER(ICSState, ICS_SPAPR,
> -                         TYPE_ICS_SPAPR)
> +DECLARE_INSTANCE_CHECKER(IcsSpaprState, ICS_SPAPR, TYPE_ICS_SPAPR)
>  
>  int xics_kvm_connect(SpaprInterruptController *intc, uint32_t nr_servers,
>                       Error **errp);
> diff --git a/hw/intc/xics_kvm.c b/hw/intc/xics_kvm.c
> index 570d635bcc08..ecbbda0e249b 100644
> --- a/hw/intc/xics_kvm.c
> +++ b/hw/intc/xics_kvm.c
> @@ -350,7 +350,7 @@ void ics_kvm_set_irq(ICSState *ics, int srcno, int val)
>  int xics_kvm_connect(SpaprInterruptController *intc, uint32_t nr_servers,
>                       Error **errp)
>  {
> -    ICSState *ics = ICS_SPAPR(intc);
> +    ICSState *ics = ICS(intc);
>      int rc;
>      CPUState *cs;
>      Error *local_err = NULL;
> diff --git a/hw/intc/xics_spapr.c b/hw/intc/xics_spapr.c
> index 8ae4f41459c3..ce147e8980ed 100644
> --- a/hw/intc/xics_spapr.c
> +++ b/hw/intc/xics_spapr.c
> @@ -34,6 +34,7 @@
>  #include "hw/ppc/xics.h"
>  #include "hw/ppc/xics_spapr.h"
>  #include "hw/ppc/fdt.h"
> +#include "hw/qdev-properties.h"
>  #include "qapi/visitor.h"
>  
>  /*
> @@ -154,7 +155,7 @@ static void rtas_set_xive(PowerPCCPU *cpu, SpaprMachineState *spapr,
>                            uint32_t nargs, target_ulong args,
>                            uint32_t nret, target_ulong rets)
>  {
> -    ICSState *ics = spapr->ics;
> +    ICSState *ics = ICS(spapr->ics);
>      uint32_t nr, srcno, server, priority;
>  
>      CHECK_EMULATED_XICS_RTAS(spapr, rets);
> @@ -189,7 +190,7 @@ static void rtas_get_xive(PowerPCCPU *cpu, SpaprMachineState *spapr,
>                            uint32_t nargs, target_ulong args,
>                            uint32_t nret, target_ulong rets)
>  {
> -    ICSState *ics = spapr->ics;
> +    ICSState *ics = ICS(spapr->ics);
>      uint32_t nr, srcno;
>  
>      CHECK_EMULATED_XICS_RTAS(spapr, rets);
> @@ -221,7 +222,7 @@ static void rtas_int_off(PowerPCCPU *cpu, SpaprMachineState *spapr,
>                           uint32_t nargs, target_ulong args,
>                           uint32_t nret, target_ulong rets)
>  {
> -    ICSState *ics = spapr->ics;
> +    ICSState *ics = ICS(spapr->ics);
>      uint32_t nr, srcno;
>  
>      CHECK_EMULATED_XICS_RTAS(spapr, rets);
> @@ -254,7 +255,7 @@ static void rtas_int_on(PowerPCCPU *cpu, SpaprMachineState *spapr,
>                          uint32_t nargs, target_ulong args,
>                          uint32_t nret, target_ulong rets)
>  {
> -    ICSState *ics = spapr->ics;
> +    ICSState *ics = ICS(spapr->ics);
>      uint32_t nr, srcno;
>  
>      CHECK_EMULATED_XICS_RTAS(spapr, rets);
> @@ -285,10 +286,13 @@ static void rtas_int_on(PowerPCCPU *cpu, SpaprMachineState *spapr,
>  
>  static void ics_spapr_realize(DeviceState *dev, Error **errp)
>  {
> -    ICSState *ics = ICS_SPAPR(dev);
> -    ICSStateClass *icsc = ICS_GET_CLASS(ics);
> +    IcsSpaprState *sics = ICS_SPAPR(dev);
> +    ICSStateClass *icsc = ICS_GET_CLASS(dev);
>      Error *local_err = NULL;
>  
> +    /* Set by spapr_irq_init() */
> +    g_assert(sics->nr_servers);
> +
>      icsc->parent_realize(dev, &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
> @@ -312,7 +316,7 @@ static void xics_spapr_dt(SpaprInterruptController *intc, uint32_t nr_servers,
>                            void *fdt, uint32_t phandle)
>  {
>      uint32_t interrupt_server_ranges_prop[] = {
> -        0, cpu_to_be32(nr_servers),
> +        0, cpu_to_be32(ICS_SPAPR(intc)->nr_servers),
>      };
>      int node;
>  
> @@ -333,7 +337,7 @@ static void xics_spapr_dt(SpaprInterruptController *intc, uint32_t nr_servers,
>  static int xics_spapr_cpu_intc_create(SpaprInterruptController *intc,
>                                         PowerPCCPU *cpu, Error **errp)
>  {
> -    ICSState *ics = ICS_SPAPR(intc);
> +    ICSState *ics = ICS(intc);
>      Object *obj;
>      SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
>  
> @@ -364,7 +368,7 @@ static void xics_spapr_cpu_intc_destroy(SpaprInterruptController *intc,
>  static int xics_spapr_claim_irq(SpaprInterruptController *intc, int irq,
>                                  bool lsi, Error **errp)
>  {
> -    ICSState *ics = ICS_SPAPR(intc);
> +    ICSState *ics = ICS(intc);
>  
>      assert(ics);
>      assert(ics_valid_irq(ics, irq));
> @@ -380,7 +384,7 @@ static int xics_spapr_claim_irq(SpaprInterruptController *intc, int irq,
>  
>  static void xics_spapr_free_irq(SpaprInterruptController *intc, int irq)
>  {
> -    ICSState *ics = ICS_SPAPR(intc);
> +    ICSState *ics = ICS(intc);
>      uint32_t srcno = irq - ics->offset;
>  
>      assert(ics_valid_irq(ics, irq));
> @@ -390,7 +394,7 @@ static void xics_spapr_free_irq(SpaprInterruptController *intc, int irq)
>  
>  static void xics_spapr_set_irq(SpaprInterruptController *intc, int irq, int val)
>  {
> -    ICSState *ics = ICS_SPAPR(intc);
> +    ICSState *ics = ICS(intc);
>      uint32_t srcno = irq - ics->offset;
>  
>      ics_set_irq(ics, srcno, val);
> @@ -398,7 +402,7 @@ static void xics_spapr_set_irq(SpaprInterruptController *intc, int irq, int val)
>  
>  static void xics_spapr_print_info(SpaprInterruptController *intc, Monitor *mon)
>  {
> -    ICSState *ics = ICS_SPAPR(intc);
> +    ICSState *ics = ICS(intc);
>      CPUState *cs;
>  
>      CPU_FOREACH(cs) {
> @@ -426,7 +430,8 @@ static int xics_spapr_activate(SpaprInterruptController *intc,
>                                 uint32_t nr_servers, Error **errp)
>  {
>      if (kvm_enabled()) {
> -        return spapr_irq_init_kvm(xics_kvm_connect, intc, nr_servers, errp);
> +        return spapr_irq_init_kvm(xics_kvm_connect, intc,
> +                                  ICS_SPAPR(intc)->nr_servers, errp);
>      }
>      return 0;
>  }
> @@ -438,6 +443,11 @@ static void xics_spapr_deactivate(SpaprInterruptController *intc)
>      }
>  }
>  
> +static Property ics_spapr_properties[] = {
> +    DEFINE_PROP_UINT32("nr-servers", IcsSpaprState, nr_servers, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  static void ics_spapr_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -446,6 +456,7 @@ static void ics_spapr_class_init(ObjectClass *klass, void *data)
>  
>      device_class_set_parent_realize(dc, ics_spapr_realize,
>                                      &isc->parent_realize);
> +    device_class_set_props(dc, ics_spapr_properties);
>      sicc->activate = xics_spapr_activate;
>      sicc->deactivate = xics_spapr_deactivate;
>      sicc->cpu_intc_create = xics_spapr_cpu_intc_create;
> @@ -462,6 +473,7 @@ static void ics_spapr_class_init(ObjectClass *klass, void *data)
>  static const TypeInfo ics_spapr_info = {
>      .name = TYPE_ICS_SPAPR,
>      .parent = TYPE_ICS,
> +    .instance_size = sizeof(IcsSpaprState),
>      .class_init = ics_spapr_class_init,
>      .interfaces = (InterfaceInfo[]) {
>          { TYPE_SPAPR_INTC },
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 12a012d9dd09..21de0456446b 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4218,15 +4218,16 @@ static void spapr_phb_placement(SpaprMachineState *spapr, uint32_t index,
>  static ICSState *spapr_ics_get(XICSFabric *dev, int irq)
>  {
>      SpaprMachineState *spapr = SPAPR_MACHINE(dev);
> +    ICSState *ics = ICS(spapr->ics);
>  
> -    return ics_valid_irq(spapr->ics, irq) ? spapr->ics : NULL;
> +    return ics_valid_irq(ics, irq) ? ics : NULL;
>  }
>  
>  static void spapr_ics_resend(XICSFabric *dev)
>  {
>      SpaprMachineState *spapr = SPAPR_MACHINE(dev);
>  
> -    ics_resend(spapr->ics);
> +    ics_resend(ICS(spapr->ics));
>  }
>  
>  static ICPState *spapr_icp_get(XICSFabric *xi, int vcpu_id)
> diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
> index 2dacbecfd5fd..be6f4041e433 100644
> --- a/hw/ppc/spapr_irq.c
> +++ b/hw/ppc/spapr_irq.c
> @@ -316,6 +316,9 @@ void spapr_irq_init(SpaprMachineState *spapr, Error **errp)
>          object_property_set_link(obj, ICS_PROP_XICS, OBJECT(spapr),
>                                   &error_abort);
>          object_property_set_int(obj, "nr-irqs", smc->nr_xirqs, &error_abort);
> +        object_property_set_uint(obj, "nr-servers",
> +                                 spapr_max_server_number(spapr),
> +                                 &error_abort);
>          if (!qdev_realize(DEVICE(obj), NULL, errp)) {
>              return;
>          }
> @@ -426,7 +429,7 @@ qemu_irq spapr_qirq(SpaprMachineState *spapr, int irq)
>      assert(irq < (smc->nr_xirqs + SPAPR_XIRQ_BASE));
>  
>      if (spapr->ics) {
> -        assert(ics_valid_irq(spapr->ics, irq));
> +        assert(ics_valid_irq(ICS(spapr->ics), irq));
>      }
>      if (spapr->xive) {
>          assert(irq < spapr->xive->nr_irqs);
> @@ -556,7 +559,7 @@ static int ics_find_free_block(ICSState *ics, int num, int alignnum)
>  
>  int spapr_irq_find(SpaprMachineState *spapr, int num, bool align, Error **errp)
>  {
> -    ICSState *ics = spapr->ics;
> +    ICSState *ics = ICS(spapr->ics);
>      int first = -1;
>  
>      assert(ics);
> 


