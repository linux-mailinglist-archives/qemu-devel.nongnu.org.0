Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5E368B70D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 09:07:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOwWn-0004bp-Hu; Mon, 06 Feb 2023 03:07:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pOwWj-0004WC-Lj; Mon, 06 Feb 2023 03:07:03 -0500
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pOwWh-0003AI-HY; Mon, 06 Feb 2023 03:07:01 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.105])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id CDA7B20410;
 Mon,  6 Feb 2023 08:06:54 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 6 Feb
 2023 09:06:54 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004641a3327-537f-44f9-a23f-1c793acf9172,
 CF69EBA19D99189A5BFA69977647E68A070273F7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9bdc5d89-cd81-8cf1-56d3-0e8b18c37731@kaod.org>
Date: Mon, 6 Feb 2023 09:06:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/5] hw/ppc/spapr: Set QDev properties using QDev API
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
CC: BALATON Zoltan <balaton@eik.bme.hu>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>, Daniel Henrique
 Barboza <danielhb413@gmail.com>, Markus Armbruster <armbru@redhat.com>, David
 Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20230203211623.50930-1-philmd@linaro.org>
 <20230203211623.50930-5-philmd@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230203211623.50930-5-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: c4ef3834-7fe4-485d-b8e3-5e158943c7aa
X-Ovh-Tracer-Id: 13050868770457488306
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeghedguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgsrghlrghtohhnsegvihhkrdgsmhgvrdhhuhdpmhgrrhhkrdgtrghvvgdqrgihlhgrnhgusehilhgrnhguvgdrtghordhukhdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdphhhpohhushhsihhnsehrvggrtghtohhsrdhorhhgpdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdgrrhhmsghruhesrhgvughhrghtrdgtohhmpdgurghvihgusehgihgssh
 honhdrughrohhpsggvrghrrdhiugdrrghupdhgrhhouhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/3/23 22:16, Philippe Mathieu-Daudé wrote:
> No need to use the low-level QOM API when an object
> inherits from QDev. Directly use the QDev API to set
> its properties.
> 
> All calls use either errp=&error_abort or &error_fatal,
> so converting to the QDev API is almost a no-op (QDev
> API always uses &error_abort).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/intc/spapr_xive.c | 11 ++++-------
>   hw/intc/xics.c       |  4 ++--
>   hw/intc/xive.c       |  4 ++--
>   hw/ppc/spapr_irq.c   |  8 +++-----
>   4 files changed, 11 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> index dc641cc604..213c4cac44 100644
> --- a/hw/intc/spapr_xive.c
> +++ b/hw/intc/spapr_xive.c
> @@ -310,9 +310,8 @@ static void spapr_xive_realize(DeviceState *dev, Error **errp)
>       /*
>        * Initialize the internal sources, for IPIs and virtual devices.
>        */
> -    object_property_set_int(OBJECT(xsrc), "nr-irqs", xive->nr_irqs,
> -                            &error_fatal);
> -    object_property_set_link(OBJECT(xsrc), "xive", OBJECT(xive), &error_abort);
> +    qdev_prop_set_uint32(DEVICE(xsrc), "nr-irqs", xive->nr_irqs);
> +    qdev_prop_set_link(DEVICE(xsrc), "xive", OBJECT(xive));
>       if (!qdev_realize(DEVICE(xsrc), NULL, errp)) {
>           return;
>       }
> @@ -321,10 +320,8 @@ static void spapr_xive_realize(DeviceState *dev, Error **errp)
>       /*
>        * Initialize the END ESB source
>        */
> -    object_property_set_int(OBJECT(end_xsrc), "nr-ends", xive->nr_irqs,
> -                            &error_fatal);
> -    object_property_set_link(OBJECT(end_xsrc), "xive", OBJECT(xive),
> -                             &error_abort);
> +    qdev_prop_set_uint32(DEVICE(end_xsrc), "nr-ends", xive->nr_irqs);
> +    qdev_prop_set_link(DEVICE(end_xsrc), "xive", OBJECT(xive));
>       if (!qdev_realize(DEVICE(end_xsrc), NULL, errp)) {
>           return;
>       }
> diff --git a/hw/intc/xics.c b/hw/intc/xics.c
> index c7f8abd71e..2fd1a15153 100644
> --- a/hw/intc/xics.c
> +++ b/hw/intc/xics.c
> @@ -382,8 +382,8 @@ Object *icp_create(Object *cpu, const char *type, XICSFabric *xi, Error **errp)
>       obj = object_new(type);
>       object_property_add_child(cpu, type, obj);
>       object_unref(obj);
> -    object_property_set_link(obj, ICP_PROP_XICS, OBJECT(xi), &error_abort);
> -    object_property_set_link(obj, ICP_PROP_CPU, cpu, &error_abort);
> +    qdev_prop_set_link(DEVICE(obj), ICP_PROP_XICS, OBJECT(xi));
> +    qdev_prop_set_link(DEVICE(obj), ICP_PROP_CPU, cpu);
>       if (!qdev_realize(DEVICE(obj), NULL, errp)) {
>           object_unparent(obj);
>           obj = NULL;
> diff --git a/hw/intc/xive.c b/hw/intc/xive.c
> index a986b96843..0e34035bc6 100644
> --- a/hw/intc/xive.c
> +++ b/hw/intc/xive.c
> @@ -799,8 +799,8 @@ Object *xive_tctx_create(Object *cpu, XivePresenter *xptr, Error **errp)
>       obj = object_new(TYPE_XIVE_TCTX);
>       object_property_add_child(cpu, TYPE_XIVE_TCTX, obj);
>       object_unref(obj);
> -    object_property_set_link(obj, "cpu", cpu, &error_abort);
> -    object_property_set_link(obj, "presenter", OBJECT(xptr), &error_abort);
> +    qdev_prop_set_link(DEVICE(obj), "cpu", cpu);
> +    qdev_prop_set_link(DEVICE(obj), "presenter", OBJECT(xptr));
>       if (!qdev_realize(DEVICE(obj), NULL, errp)) {
>           object_unparent(obj);
>           return NULL;
> diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
> index a0d1e1298e..283769c074 100644
> --- a/hw/ppc/spapr_irq.c
> +++ b/hw/ppc/spapr_irq.c
> @@ -313,9 +313,8 @@ void spapr_irq_init(SpaprMachineState *spapr, Error **errp)
>           obj = object_new(TYPE_ICS_SPAPR);
>   
>           object_property_add_child(OBJECT(spapr), "ics", obj);
> -        object_property_set_link(obj, ICS_PROP_XICS, OBJECT(spapr),
> -                                 &error_abort);
> -        object_property_set_int(obj, "nr-irqs", smc->nr_xirqs, &error_abort);
> +        qdev_prop_set_link(DEVICE(obj), ICS_PROP_XICS, OBJECT(spapr));
> +        qdev_prop_set_uint32(DEVICE(obj), "nr-irqs", smc->nr_xirqs);
>           if (!qdev_realize(DEVICE(obj), NULL, errp)) {
>               return;
>           }
> @@ -335,8 +334,7 @@ void spapr_irq_init(SpaprMachineState *spapr, Error **errp)
>            * priority
>            */
>           qdev_prop_set_uint32(dev, "nr-ends", nr_servers << 3);
> -        object_property_set_link(OBJECT(dev), "xive-fabric", OBJECT(spapr),
> -                                 &error_abort);
> +        qdev_prop_set_link(dev, "xive-fabric", OBJECT(spapr));
>           sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>   
>           spapr->xive = SPAPR_XIVE(dev);


