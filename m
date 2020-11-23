Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 709AC2C02D3
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 10:57:42 +0100 (CET)
Received: from localhost ([::1]:57354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh8bN-0007er-I5
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 04:57:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kh8a7-0006n1-19
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 04:56:23 -0500
Received: from 10.mo52.mail-out.ovh.net ([87.98.187.244]:38564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kh8a4-0004uN-JL
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 04:56:22 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.54])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id AAC6020FFB4;
 Mon, 23 Nov 2020 10:56:16 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 23 Nov
 2020 10:56:15 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005956c2eb2-a118-4da3-b690-8828c17915cf,
 AF84A700016AED6247F1F5B9AC1D14952D0C96A6) smtp.auth=clg@kaod.org
Subject: Re: [PATCH for-6.0 3/8] spapr/xive: Add "nr-servers" property
To: Greg Kurz <groug@kaod.org>, <qemu-devel@nongnu.org>
References: <20201120174646.619395-1-groug@kaod.org>
 <20201120174646.619395-4-groug@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <69f0fcaa-e43f-488c-9c14-c504a4fd762e@kaod.org>
Date: Mon, 23 Nov 2020 10:56:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120174646.619395-4-groug@kaod.org>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 891d5959-2c70-4aca-ab1b-a786adb2a53c
X-Ovh-Tracer-Id: 9745508120019962848
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegiedgudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtjeertddtfeehnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephfefieetveeuudfgudetudehjeffhfejieevfefhffffueetgfdtleefieeitdegnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> The sPAPR XIVE object has an "nr-ends" property that is used
> to size the END table. This property is set by the machine
> code to a value derived from spapr_max_server_number().

Yes. This is done at the machine level.

> spapr_max_server_number() is also used to inform the KVM XIVE
> device about the range of vCPU ids it might be exposed to,
> in order to optimize resource allocation in the HW.

Yes. It's deeply buried in the spapr/irq/xive/kvm layers but it is
called by set_active_intc() which is, for me, a machine level 
operation.

The only other place where the number of vCPUs is used is in 
spapr_xive_dt() to define the vCPU IPI range, which done at
the machine level again.

So I don't agree with this patch.

C.


> This is enough motivation to introduce an "nr-servers" property
> and to use it for both purposes. The existing "nr-ends" property
> is now longer used. It is kept around though because it is exposed
> to -global. It will continue to be ignored as before without
> causing QEMU to exit.
> 
> The associated nr_ends field cannot be dropped from SpaprXive
> because it is explicitly used by vmstate_spapr_xive(). It is
> thus renamed to nr_ends_vmstate.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  include/hw/ppc/spapr_xive.h | 16 +++++++++++++++-
>  hw/intc/spapr_xive.c        | 28 ++++++++++++++++++++++------
>  hw/ppc/spapr_irq.c          |  6 +-----
>  3 files changed, 38 insertions(+), 12 deletions(-)
> 
> diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
> index 4b967f13c030..7123ea07ed78 100644
> --- a/include/hw/ppc/spapr_xive.h
> +++ b/include/hw/ppc/spapr_xive.h
> @@ -23,6 +23,16 @@
>  typedef struct SpaprXive {
>      XiveRouter    parent;
>  
> +    /*
> +     * The XIVE device needs to know the highest vCPU id it might
> +     * be exposed to in order to size the END table. It may also
> +     * propagate the value to the KVM XIVE device in order to
> +     * optimize resource allocation in the HW.
> +     * This must be set to a non-null value using the "nr-servers"
> +     * property, before realizing the device.
> +     */
> +    uint32_t      nr_servers;
> +
>      /* Internal interrupt source for IPIs and virtual devices */
>      XiveSource    source;
>      hwaddr        vc_base;
> @@ -38,7 +48,11 @@ typedef struct SpaprXive {
>      XiveEAS       *eat;
>      uint32_t      nr_irqs;
>      XiveEND       *endt;
> -    uint32_t      nr_ends;
> +    /*
> +     * This is derived from nr_servers but it must be kept around because
> +     * vmstate_spapr_xive uses it.
> +     */
> +    uint32_t      nr_ends_vmstate;
>  
>      /* TIMA mapping address */
>      hwaddr        tm_base;
> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> index f473ad9cba47..e4dbf9c2c409 100644
> --- a/hw/intc/spapr_xive.c
> +++ b/hw/intc/spapr_xive.c
> @@ -99,6 +99,12 @@ int spapr_xive_end_to_target(uint8_t end_blk, uint32_t end_idx,
>      return 0;
>  }
>  
> +/*
> + * 8 XIVE END structures per CPU. One for each available
> + * priority
> + */
> +#define spapr_xive_cpu_end_idx(vcpu, prio) (((vcpu) << 3) + prio)
> +
>  static void spapr_xive_cpu_to_end(PowerPCCPU *cpu, uint8_t prio,
>                                    uint8_t *out_end_blk, uint32_t *out_end_idx)
>  {
> @@ -109,7 +115,7 @@ static void spapr_xive_cpu_to_end(PowerPCCPU *cpu, uint8_t prio,
>      }
>  
>      if (out_end_idx) {
> -        *out_end_idx = (cpu->vcpu_id << 3) + prio;
> +        *out_end_idx = spapr_xive_cpu_end_idx(cpu->vcpu_id, prio);
>      }
>  }
>  
> @@ -290,7 +296,8 @@ static void spapr_xive_instance_init(Object *obj)
>  
>  uint32_t spapr_xive_nr_ends(const SpaprXive *xive)
>  {
> -    return xive->nr_ends;
> +    g_assert(xive->nr_servers);
> +    return spapr_xive_cpu_end_idx(xive->nr_servers, 0);
>  }
>  
>  static void spapr_xive_realize(DeviceState *dev, Error **errp)
> @@ -303,7 +310,7 @@ static void spapr_xive_realize(DeviceState *dev, Error **errp)
>  
>      /* Set by spapr_irq_init() */
>      g_assert(xive->nr_irqs);
> -    g_assert(xive->nr_ends);
> +    g_assert(xive->nr_servers);
>  
>      sxc->parent_realize(dev, &local_err);
>      if (local_err) {
> @@ -360,6 +367,8 @@ static void spapr_xive_realize(DeviceState *dev, Error **errp)
>      sysbus_mmio_map(SYS_BUS_DEVICE(xive), 0, xive->vc_base);
>      sysbus_mmio_map(SYS_BUS_DEVICE(xive), 1, xive->end_base);
>      sysbus_mmio_map(SYS_BUS_DEVICE(xive), 2, xive->tm_base);
> +
> +    xive->nr_ends_vmstate = spapr_xive_nr_ends(xive);
>  }
>  
>  static int spapr_xive_get_eas(XiveRouter *xrtr, uint8_t eas_blk,
> @@ -547,7 +556,7 @@ static const VMStateDescription vmstate_spapr_xive = {
>          VMSTATE_UINT32_EQUAL(nr_irqs, SpaprXive, NULL),
>          VMSTATE_STRUCT_VARRAY_POINTER_UINT32(eat, SpaprXive, nr_irqs,
>                                       vmstate_spapr_xive_eas, XiveEAS),
> -        VMSTATE_STRUCT_VARRAY_POINTER_UINT32(endt, SpaprXive, nr_ends,
> +        VMSTATE_STRUCT_VARRAY_POINTER_UINT32(endt, SpaprXive, nr_ends_vmstate,
>                                               vmstate_spapr_xive_end, XiveEND),
>          VMSTATE_END_OF_LIST()
>      },
> @@ -591,7 +600,14 @@ static void spapr_xive_free_irq(SpaprInterruptController *intc, int lisn)
>  
>  static Property spapr_xive_properties[] = {
>      DEFINE_PROP_UINT32("nr-irqs", SpaprXive, nr_irqs, 0),
> -    DEFINE_PROP_UINT32("nr-ends", SpaprXive, nr_ends, 0),
> +    /*
> +     * "nr-ends" is deprecated by "nr-servers" since QEMU 6.0.
> +     * It is just kept around because it is exposed to the user
> +     * through -global and we don't want it to fail, even if
> +     * the value is actually overridden internally.
> +     */
> +    DEFINE_PROP_UINT32("nr-ends", SpaprXive, nr_ends_vmstate, 0),
> +    DEFINE_PROP_UINT32("nr-servers", SpaprXive, nr_servers, 0),
>      DEFINE_PROP_UINT64("vc-base", SpaprXive, vc_base, SPAPR_XIVE_VC_BASE),
>      DEFINE_PROP_UINT64("tm-base", SpaprXive, tm_base, SPAPR_XIVE_TM_BASE),
>      DEFINE_PROP_UINT8("hv-prio", SpaprXive, hv_prio, 7),
> @@ -742,7 +758,7 @@ static int spapr_xive_activate(SpaprInterruptController *intc,
>      SpaprXive *xive = SPAPR_XIVE(intc);
>  
>      if (kvm_enabled()) {
> -        int rc = spapr_irq_init_kvm(kvmppc_xive_connect, intc, nr_servers,
> +        int rc = spapr_irq_init_kvm(kvmppc_xive_connect, intc, xive->nr_servers,
>                                      errp);
>          if (rc < 0) {
>              return rc;
> diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
> index f59960339ec3..8c5627225636 100644
> --- a/hw/ppc/spapr_irq.c
> +++ b/hw/ppc/spapr_irq.c
> @@ -330,11 +330,7 @@ void spapr_irq_init(SpaprMachineState *spapr, Error **errp)
>  
>          dev = qdev_new(TYPE_SPAPR_XIVE);
>          qdev_prop_set_uint32(dev, "nr-irqs", smc->nr_xirqs + SPAPR_XIRQ_BASE);
> -        /*
> -         * 8 XIVE END structures per CPU. One for each available
> -         * priority
> -         */
> -        qdev_prop_set_uint32(dev, "nr-ends", nr_servers << 3);
> +        qdev_prop_set_uint32(dev, "nr-servers", nr_servers);
>          object_property_set_link(OBJECT(dev), "xive-fabric", OBJECT(spapr),
>                                   &error_abort);
>          sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> 


