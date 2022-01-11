Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BE348AFDA
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 15:46:31 +0100 (CET)
Received: from localhost ([::1]:43890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7IPu-00012h-0C
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 09:46:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7IMh-0007KP-MR; Tue, 11 Jan 2022 09:43:12 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:47441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7IMb-000879-MM; Tue, 11 Jan 2022 09:43:11 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.33])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id EF697D7044EF;
 Tue, 11 Jan 2022 15:42:53 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 11 Jan
 2022 15:42:53 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R00581501ee9-9e80-44b1-96d2-ee09b712cabd,
 5383433EA887FCAE918FFCB03530F9AACAE8953B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <69ab634e-bdb6-d5ad-e6be-771ac3d9a780@kaod.org>
Date: Tue, 11 Jan 2022 15:42:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 4/5] ppc/pnv: Introduce user creatable pnv-phb4 devices
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220111131027.599784-1-danielhb413@gmail.com>
 <20220111131027.599784-5-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220111131027.599784-5-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6478aa94-235d-47ba-8bdb-3e85a64613c6
X-Ovh-Tracer-Id: 10911377476265348064
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudehfedgieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/22 14:10, Daniel Henrique Barboza wrote:
> This patch introduces pnv-phb4 user creatable devices that are created
> in a similar manner as pnv-phb3 devices, allowing the user to interact
> with the PHBs directly instead of creating PCI Express Controllers that
> will create a certain amount of PHBs per controller index.
> 
> We accomplish this by doing the following:
> 
> - add a pnv_phb4_get_stack() helper to retrieve which stack an user
> created phb4 would occupy;
> 
> - when dealing with an user created pnv-phb4 (detected by checking if
> phb->stack is NULL at the start of phb4_realize()), retrieve its stack
> and initialize its properties as done in stk_realize();
> 
> - use 'defaults_enabled()' in stk_realize() to avoid creating and
> initializing a 'stack->phb' qdev that might be overwritten by an user
> created pnv-phb4 device. This process is wrapped into a new helper
> called pnv_pec_stk_default_phb_realize().
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Nothing is left in the stack model. I think the next cleanup is to
get rid of it.

Thanks,

C.


> ---
>   hw/pci-host/pnv_phb4.c     | 74 ++++++++++++++++++++++++++++++++++++--
>   hw/pci-host/pnv_phb4_pec.c | 17 +++++++--
>   hw/ppc/pnv.c               |  2 ++
>   3 files changed, 89 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index ee046725ac..ca2f4078e5 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1487,15 +1487,85 @@ static void pnv_phb4_instance_init(Object *obj)
>       object_initialize_child(obj, "source", &phb->xsrc, TYPE_XIVE_SOURCE);
>   }
>   
> +static PnvPhb4PecStack *pnv_phb4_get_stack(PnvChip *chip, PnvPHB4 *phb,
> +                                           Error **errp)
> +{
> +    Pnv9Chip *chip9 = PNV9_CHIP(chip);
> +    int chip_id = phb->chip_id;
> +    int index = phb->phb_id;
> +    int i, j;
> +
> +    for (i = 0; i < chip->num_pecs; i++) {
> +        /*
> +         * For each PEC, check the amount of stacks it supports
> +         * and see if the given phb4 index matches a stack.
> +         */
> +        PnvPhb4PecState *pec = &chip9->pecs[i];
> +
> +        for (j = 0; j < pec->num_stacks; j++) {
> +            if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
> +                return &pec->stacks[j];
> +            }
> +        }
> +    }
> +
> +    error_setg(errp,
> +               "pnv-phb4 chip-id %d index %d didn't match any existing PEC",
> +               chip_id, index);
> +
> +    return NULL;
> +}
> +
>   static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>   {
>       PnvPHB4 *phb = PNV_PHB4(dev);
>       PCIHostState *pci = PCI_HOST_BRIDGE(dev);
>       XiveSource *xsrc = &phb->xsrc;
> +    Error *local_err = NULL;
>       int nr_irqs;
>       char name[32];
>   
> -    assert(phb->stack);
> +    /* User created PHB */
> +    if (!phb->stack) {
> +        PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
> +        PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
> +        PnvPhb4PecClass *pecc;
> +        BusState *s;
> +
> +        if (!chip) {
> +            error_setg(errp, "invalid chip id: %d", phb->chip_id);
> +            return;
> +        }
> +
> +        phb->stack = pnv_phb4_get_stack(chip, phb, &local_err);
> +        if (local_err) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
> +
> +        /* All other phb properties but 'version' are already set */
> +        pecc = PNV_PHB4_PEC_GET_CLASS(phb->stack->pec);
> +        object_property_set_int(OBJECT(phb), "version", pecc->version,
> +                                &error_fatal);
> +
> +        /*
> +         * Assign stack->phb since pnv_phb4_update_regions() uses it
> +         * to access the phb.
> +         */
> +        phb->stack->phb = phb;
> +
> +        /*
> +         * Reparent user created devices to the chip to build
> +         * correctly the device tree.
> +         */
> +        pnv_chip_parent_fixup(chip, OBJECT(phb), phb->phb_id);
> +
> +        s = qdev_get_parent_bus(DEVICE(chip));
> +        if (!qdev_set_parent_bus(DEVICE(phb), s, &local_err)) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
> +    }
>   
>       /* Set the "big_phb" flag */
>       phb->big_phb = phb->phb_id == 0 || phb->phb_id == 3;
> @@ -1600,7 +1670,7 @@ static void pnv_phb4_class_init(ObjectClass *klass, void *data)
>       dc->realize         = pnv_phb4_realize;
>       device_class_set_props(dc, pnv_phb4_properties);
>       set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> -    dc->user_creatable  = false;
> +    dc->user_creatable  = true;
>   
>       xfc->notify         = pnv_phb4_xive_notify;
>   }
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index d4c52a5d28..7fe7f1f007 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -19,6 +19,7 @@
>   #include "hw/pci/pci_bus.h"
>   #include "hw/ppc/pnv.h"
>   #include "hw/qdev-properties.h"
> +#include "sysemu/sysemu.h"
>   
>   #include <libfdt.h>
>   
> @@ -275,9 +276,9 @@ static const TypeInfo pnv_pec_type_info = {
>       }
>   };
>   
> -static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
> +static void pnv_pec_stk_default_phb_realize(PnvPhb4PecStack *stack,
> +                                            Error **errp)
>   {
> -    PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(dev);
>       PnvPhb4PecState *pec = stack->pec;
>       PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
>       int phb_id = pnv_phb4_pec_get_phb_id(pec, stack->stack_no);
> @@ -292,11 +293,23 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>                               &error_fatal);
>       object_property_set_link(OBJECT(stack->phb), "stack", OBJECT(stack),
>                                &error_abort);
> +
>       if (!sysbus_realize(SYS_BUS_DEVICE(stack->phb), errp)) {
>           return;
>       }
>   }
>   
> +static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
> +{
> +    PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(dev);
> +
> +    if (!defaults_enabled()) {
> +        return;
> +    }
> +
> +    pnv_pec_stk_default_phb_realize(stack, errp);
> +}
> +
>   static Property pnv_pec_stk_properties[] = {
>           DEFINE_PROP_UINT32("stack-no", PnvPhb4PecStack, stack_no, 0),
>           DEFINE_PROP_LINK("pec", PnvPhb4PecStack, pec, TYPE_PNV_PHB4_PEC,
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index fe7e67e73a..837146a2fb 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1960,6 +1960,8 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
>       pmc->compat = compat;
>       pmc->compat_size = sizeof(compat);
>       pmc->dt_power_mgt = pnv_dt_power_mgt;
> +
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB4);
>   }
>   
>   static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
> 


