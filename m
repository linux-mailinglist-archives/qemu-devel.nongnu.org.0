Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDF4489D5D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 17:18:36 +0100 (CET)
Received: from localhost ([::1]:33136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6xNT-00084x-23
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 11:18:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n6xHl-0000mu-PS
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 11:12:42 -0500
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:55667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n6xHj-0006qq-CP
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 11:12:41 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.36])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 125C520D78;
 Mon, 10 Jan 2022 16:12:34 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 17:12:33 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001c043d640-316d-404d-8976-6d5686d0b223,
 A9D23E93096AF6ACD837C7DE23AD2D939339D7DC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a9a31743-1f3f-3502-e6db-b912b4a7a5a5@kaod.org>
Date: Mon, 10 Jan 2022 17:12:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 09/10] ppc/pnv: Introduce user creatable pnv-phb4
 devices
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220110143346.455901-1-danielhb413@gmail.com>
 <20220110143346.455901-10-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220110143346.455901-10-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e23f05aa-5a60-4e6c-bb9f-1408d8b94c4a
X-Ovh-Tracer-Id: 6553018935300099040
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudehuddgiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 15:33, Daniel Henrique Barboza wrote:
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
> - if a suitable pec->stack is found, setup the phb attributes in a
> similar fashion as done in pnv_phb4_pec_realize() when defaults are
> enabled;
> 
> - use 'defaults_enabled()' in pnv_pec_stk_instance_init() to avoid
> creating a 'stack->phb' qdev that might be overwritten by an user
> created pnv-phb4 device.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb4.c     | 86 +++++++++++++++++++++++++++++++++++++-
>   hw/pci-host/pnv_phb4_pec.c | 25 ++++++-----
>   hw/ppc/pnv.c               |  2 +
>   3 files changed, 101 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index fc23a96b7f..8c8f5dd0e1 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1229,15 +1229,97 @@ static void pnv_phb4_instance_init(Object *obj)
>       object_initialize_child(obj, "source", &phb->xsrc, TYPE_XIVE_SOURCE);
>   }
>   
> +static PnvPhb4PecStack *pnv_phb4_get_stack(PnvChip *chip, PnvPHB4 *phb,
> +                                           Error **errp)
> +{
> +    Pnv9Chip *chip9 = NULL;
> +    int chip_id = phb->chip_id;
> +    int index = phb->phb_id;


Change the pnv_phb4_get_stack() prototype to :

   static PnvPhb4PecStack *pnv_phb4_get_stack(int chip_id, int index,
                                              Error **errp);

it will simplify the pnv_phb4_realize() routine.


> +    int i, j;
> +
> +    if (chip->num_pecs == 0) {
> +        /*
> +         * This is expected to happen since chip-id and index are
> +         * being set by the user in the command line. Return an
> +         * informative error instead of asserting.
> +         */

I don't understand how this can happen since num_pecs is initialized :
  
   chip->num_pecs = pcc->num_pecs

and

   k->num_pecs = PNV9_CHIP_MAX_PEC;

> +        error_setg(errp, "chip id %d has no PCIE controllers", chip_id);
> +        return NULL;
> +    }
> +
> +    chip9 = PNV9_CHIP(chip);
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
> +    PnvPhb4PecStack *stack = NULL;
> +    Error *local_err = NULL;
>       int nr_irqs;
>       char name[32];
>   
> -    assert(phb->stack);
> +    /* User created PHB */
> +    if (!phb->stack) {
> +        PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
> +        PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
> +        BusState *s;
> +
> +        if (!chip) {
> +            error_setg(errp, "invalid chip id: %d", phb->chip_id);
> +            return;
> +        }
> +
> +        stack = pnv_phb4_get_stack(chip, phb, &local_err);
> +        if (local_err) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
> +
> +        /*
> +         * Assign the phb to the stack. If pnv_phb4_get_stack() returned
> +         * stack = NULL without an error we're better of aborting.
> +         */
> +        g_assert(stack);

This can not happend if pnv_phb4_get_stack() returns local_err;

> +        stack->phb = phb;
> +
> +        object_property_set_int(OBJECT(phb), "index",
> +                                phb->phb_id, &error_abort);

This is redundant. "index" has already been set by the user if the PHB
is user created or by the PnvPhb4PecStack realize routine.

> +        pnv_phb4_set_stack_phb_props(stack, phb);

I have the feeling this should be called after the 'if (!phb->stack)'
code section and not in pnv_pec_realize() like PATCH 5 does.

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
> @@ -1342,7 +1424,7 @@ static void pnv_phb4_class_init(ObjectClass *klass, void *data)
>       dc->realize         = pnv_phb4_realize;
>       device_class_set_props(dc, pnv_phb4_properties);
>       set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> -    dc->user_creatable  = false;
> +    dc->user_creatable  = true;
>   
>       xfc->notify         = pnv_phb4_xive_notify;
>   }
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 5e02a51f04..1e3233e7ec 100644
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
> @@ -397,15 +398,17 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
>           object_property_set_int(stk_obj, "stack-no", i, &error_abort);
>           object_property_set_link(stk_obj, "pec", OBJECT(pec), &error_abort);
>   
> -        /*
> -         * stack->phb->index is dependent on the position the
> -         * stack occupies in pec->stacks[]. We have this information
> -         * available here via the 'i' iterator so it's convenient to
> -         * do it now.
> -         */
> -        object_property_set_int(OBJECT(stack->phb), "index", phb_id,
> -                                &error_abort);
> -        pnv_phb4_set_stack_phb_props(stack, stack->phb);
> +        if (defaults_enabled()) {
> +            /*
> +             * stack->phb->index is dependent on the position the
> +             * stack occupies in pec->stacks[]. We have this information
> +             * available here via the 'i' iterator so it's convenient to
> +             * do it now.
> +             */
> +            object_property_set_int(OBJECT(stack->phb), "index", phb_id,
> +                                    &error_abort);
> +            pnv_phb4_set_stack_phb_props(stack, stack->phb);
> +        }

This clearly belongs to PHB4 realize handler.

Thanks,

C.

>           if (!qdev_realize(DEVICE(stk_obj), NULL, errp)) {
>               return;
> @@ -543,7 +546,9 @@ static void pnv_pec_stk_instance_init(Object *obj)
>   {
>       PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(obj);
>   
> -    stack->phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
> +    if (defaults_enabled()) {
> +        stack->phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
> +    }
>   }
>   
>   static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
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


