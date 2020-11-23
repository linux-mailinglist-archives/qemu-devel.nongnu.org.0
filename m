Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5CC2C030B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 11:16:02 +0100 (CET)
Received: from localhost ([::1]:40682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh8t7-00053F-Qj
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 05:16:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kh8rK-00049p-5G
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 05:14:10 -0500
Received: from 6.mo52.mail-out.ovh.net ([188.165.49.222]:57285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kh8rG-00035b-IW
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 05:14:09 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.159])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 69138213EFD;
 Mon, 23 Nov 2020 11:14:03 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 23 Nov
 2020 11:13:22 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004b6a34a2e-7831-4dac-838b-d1005ec4e2b9,
 AF84A700016AED6247F1F5B9AC1D14952D0C96A6) smtp.auth=clg@kaod.org
Subject: Re: [PATCH for-6.0 4/8] spapr/xive: Add "nr-ipis" property
To: Greg Kurz <groug@kaod.org>, <qemu-devel@nongnu.org>
References: <20201120174646.619395-1-groug@kaod.org>
 <20201120174646.619395-5-groug@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0a4a08ab-7c5f-3635-86ac-de5cd536f257@kaod.org>
Date: Mon, 23 Nov 2020 11:13:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120174646.619395-5-groug@kaod.org>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e6997487-a81c-4f0f-a516-d25cacc5e550
X-Ovh-Tracer-Id: 10034582923614456800
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegiedgudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtjeertddtfeehnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveekudfhudeftdevfeeutddtiefhtdejhedtffeludejgedvgefhledttedvuefhnecuffhomhgrihhnpehgnhhurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo52.mail-out.ovh.net
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
> The sPAPR XIVE device exposes a range of LISNs that the guest uses
> for IPIs. This range is currently sized according to the highest
> vCPU id, ie. spapr_max_server_number(), as obtained from the machine
> through the "nr_servers" argument of the generic spapr_irq_dt() call.
> 
> This makes sense for the "ibm,interrupt-server-ranges" property of
> sPAPR XICS, but certainly not for "ibm,xive-lisn-ranges". The range
> should be sized to the maximum number of possible vCPUs. It happens
> that spapr_max_server_number() == smp.max_cpus in practice with the
> machine default settings. This might not be the case though when
> VSMT is in use : we can end up with a much larger range (up to 8
> times bigger) than needed and waste LISNs. 

will it exceed 4K ? if not, we are fine.

The fact that it is so complex to get the number of vCPUs is a 
problem by it self to me. Can we simplify that ? or introduce a 
spapr_max_server_number_id() ? 

> But most importantly, this
> lures people into thinking that IPI numbers are always equal to
> vCPU ids, which is wrong and bit us recently:

do we have a converting routing vcpu_id_to_ipi ? I think we have
that in KVM.

> https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg01476.html
> 
> Introduce an "nr-ipis" property that the machine sets to smp.max_cpus
> before realizing the deice. Use that instead of "nr_servers" in
> spapr_xive_dt(). Have the machine to claim the same number of IPIs
> in spapr_irq_init().
> 
> This doesn't cause any guest visible change when using the machine
> default settings (ie. VSMT == smp.threads).>
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  include/hw/ppc/spapr_xive.h | 8 ++++++++
>  hw/intc/spapr_xive.c        | 4 +++-
>  hw/ppc/spapr_irq.c          | 4 +++-
>  3 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
> index 7123ea07ed78..69b9fbc1b9a5 100644
> --- a/include/hw/ppc/spapr_xive.h
> +++ b/include/hw/ppc/spapr_xive.h
> @@ -43,6 +43,14 @@ typedef struct SpaprXive {
>  
>      /* DT */
>      gchar *nodename;
> +    /*
> +     * The sPAPR XIVE device needs to know how many vCPUs it
> +     * might be exposed to in order to size the IPI range in
> +     * "ibm,interrupt-server-ranges". It is the purpose of the

There is no "ibm,interrupt-server-ranges"  property in XIVE

> +     * "nr-ipis" property which *must* be set to a non-null
> +     * value before realizing the sPAPR XIVE device.
> +     */
> +    uint32_t nr_ipis;
>  
>      /* Routing table */
>      XiveEAS       *eat;
> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> index e4dbf9c2c409..d13a2955ce9b 100644
> --- a/hw/intc/spapr_xive.c
> +++ b/hw/intc/spapr_xive.c
> @@ -311,6 +311,7 @@ static void spapr_xive_realize(DeviceState *dev, Error **errp)
>      /* Set by spapr_irq_init() */
>      g_assert(xive->nr_irqs);
>      g_assert(xive->nr_servers);
> +    g_assert(xive->nr_ipis);
>  
>      sxc->parent_realize(dev, &local_err);
>      if (local_err) {
> @@ -608,6 +609,7 @@ static Property spapr_xive_properties[] = {
>       */
>      DEFINE_PROP_UINT32("nr-ends", SpaprXive, nr_ends_vmstate, 0),
>      DEFINE_PROP_UINT32("nr-servers", SpaprXive, nr_servers, 0),
> +    DEFINE_PROP_UINT32("nr-ipis", SpaprXive, nr_ipis, 0),
>      DEFINE_PROP_UINT64("vc-base", SpaprXive, vc_base, SPAPR_XIVE_VC_BASE),
>      DEFINE_PROP_UINT64("tm-base", SpaprXive, tm_base, SPAPR_XIVE_TM_BASE),
>      DEFINE_PROP_UINT8("hv-prio", SpaprXive, hv_prio, 7),
> @@ -698,7 +700,7 @@ static void spapr_xive_dt(SpaprInterruptController *intc, uint32_t nr_servers,
>      /* Interrupt number ranges for the IPIs */
>      uint32_t lisn_ranges[] = {
>          cpu_to_be32(SPAPR_IRQ_IPI),
> -        cpu_to_be32(SPAPR_IRQ_IPI + nr_servers),
> +        cpu_to_be32(SPAPR_IRQ_IPI + xive->nr_ipis),

I don't understand why we need nr_ipis. Can't we pass the same value in 
nr_servers from the machine ?

( Conceptually, the first 4K are all IPIs. The first range is for 
  HW threads ) 


>      };
>      /*
>       * EQ size - the sizes of pages supported by the system 4K, 64K,
> diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
> index 8c5627225636..a0fc474ecb06 100644
> --- a/hw/ppc/spapr_irq.c
> +++ b/hw/ppc/spapr_irq.c
> @@ -325,12 +325,14 @@ void spapr_irq_init(SpaprMachineState *spapr, Error **errp)
>  
>      if (spapr->irq->xive) {
>          uint32_t nr_servers = spapr_max_server_number(spapr);
> +        uint32_t max_cpus = MACHINE(spapr)->smp.max_cpus;

So that's the value we should be using in case of VSMT and not 
spapr_max_server_number(). If I am correct, this is a max_cpu_id ?


>          DeviceState *dev;
>          int i;
>  
>          dev = qdev_new(TYPE_SPAPR_XIVE);
>          qdev_prop_set_uint32(dev, "nr-irqs", smc->nr_xirqs + SPAPR_XIRQ_BASE);
>          qdev_prop_set_uint32(dev, "nr-servers", nr_servers);
> +        qdev_prop_set_uint32(dev, "nr-ipis", max_cpus);
>          object_property_set_link(OBJECT(dev), "xive-fabric", OBJECT(spapr),
>                                   &error_abort);
>          sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> @@ -338,7 +340,7 @@ void spapr_irq_init(SpaprMachineState *spapr, Error **errp)
>          spapr->xive = SPAPR_XIVE(dev);
>  
>          /* Enable the CPU IPIs */
> -        for (i = 0; i < nr_servers; ++i) {
> +        for (i = 0; i < max_cpus; ++i) {
>              SpaprInterruptControllerClass *sicc
>                  = SPAPR_INTC_GET_CLASS(spapr->xive);





