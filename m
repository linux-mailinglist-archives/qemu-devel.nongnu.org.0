Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A326148AAF5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 11:00:00 +0100 (CET)
Received: from localhost ([::1]:55524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Dwc-0003Te-W5
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 04:59:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n7Dtf-00020r-UQ
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 04:56:55 -0500
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:55011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n7Dtd-0007km-DO
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 04:56:55 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.2])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 802F8210A3;
 Tue, 11 Jan 2022 09:56:50 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 11 Jan
 2022 10:56:50 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0025a69fd6a-38b7-438b-bcd7-13caabd37744,
 FFD8DCB8B568E78E86EDC96A86417857C679DA6D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3e80ed50-37db-4b39-7c02-d69350fbf3c3@kaod.org>
Date: Tue, 11 Jan 2022 10:56:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 4/5] ppc/pnv: Introduce user creatable pnv-phb4 devices
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220111005558.549685-1-danielhb413@gmail.com>
 <20220111005558.549685-5-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220111005558.549685-5-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 79f21e74-472f-4965-9df1-69b57d60b3d4
X-Ovh-Tracer-Id: 6080422447090338784
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudehfedguddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/11/22 01:55, Daniel Henrique Barboza wrote:
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
> created pnv-phb4 device.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb4.c     | 75 +++++++++++++++++++++++++++++++++++++-
>   hw/pci-host/pnv_phb4_pec.c |  5 +++
>   hw/ppc/pnv.c               |  2 +
>   3 files changed, 80 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 3ffa8f51e9..10f8d6a919 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1487,15 +1487,86 @@ static void pnv_phb4_instance_init(Object *obj)
>       object_initialize_child(obj, "source", &phb->xsrc, TYPE_XIVE_SOURCE);
>   }
>   
> +static PnvPhb4PecStack *pnv_phb4_get_stack(int chip_id, int index,
> +                                           Error **errp)
> +{
> +    PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
> +    PnvChip *chip = pnv_get_chip(pnv, chip_id);
> +    Pnv9Chip *chip9 = PNV9_CHIP(chip);
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

Arg. my comment on the pnv_phb4_get_stack() prototype was clearly
a mistake ! We are calling twice pnv_get_chip() to get the chip
and there is no reason for it.

Can you changed it back ? Sorry about that ... You can flame me.

> +        PnvPhb4PecClass *pecc;
> +        BusState *s;
> +
> +        if (!chip) {
> +            error_setg(errp, "invalid chip id: %d", phb->chip_id);
> +            return;
> +        }
> +
> +        phb->stack = pnv_phb4_get_stack(phb->chip_id, phb->phb_id,
> +                                        &local_err);
> +        if (local_err) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
> +
> +        /* All other phb properties but 'version' are already set */
> +        pecc = PNV_PHB4_PEC_GET_CLASS(phb->stack->pec);
> +        object_property_set_int(OBJECT(phb), "version", pecc->version,
> +                                &error_fatal);

Yes :/ This version is a constant and should probably be a class attribute.

I am not sure we need a property anymore. we could change pnv_phb4_reg_read()
with :
    
    switch (off) {
    case PHB_VERSION:
         return PNV_PHB4_PEC_GET_CLASS(phb->stack->pec)->version;


Another small problem to handle is the root port type :

     /* Add a single Root port if running with defaults */
     if (defaults_enabled()) {
         pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
                                  TYPE_PNV_PHB4_ROOT_PORT);
     }


With PHB5, we should use another type. This can come later.

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
>       pnv_phb4_XSCOM_init(phb);
>   
> @@ -1600,7 +1671,7 @@ static void pnv_phb4_class_init(ObjectClass *klass, void *data)
>       dc->realize         = pnv_phb4_realize;
>       device_class_set_props(dc, pnv_phb4_properties);
>       set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> -    dc->user_creatable  = false;
> +    dc->user_creatable  = true;
>   
>       xfc->notify         = pnv_phb4_xive_notify;
>   }
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index d4c52a5d28..dfd25831d5 100644
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
> @@ -282,6 +283,10 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>       PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
>       int phb_id = pnv_phb4_pec_get_phb_id(pec, stack->stack_no);
>   
> +    if (!defaults_enabled()) {> +        return;

May be move all the code doing the PHB4 device realize in a helper routine
and call it under if (defaults_enabled()) { ... }

Thanks,

C.


> +    }
> +
>       stack->phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
>
>       object_property_set_int(OBJECT(stack->phb), "chip-id", pec->chip_id,
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


