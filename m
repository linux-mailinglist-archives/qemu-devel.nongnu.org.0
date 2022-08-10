Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B9B58ED78
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:38:56 +0200 (CEST)
Received: from localhost ([::1]:35170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLlvD-0003Es-Ds
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:38:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oLlZI-00031v-V7
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:16:16 -0400
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:34937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oLlZG-0003mj-CT
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:16:16 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.51])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id B29D3210FB;
 Wed, 10 Aug 2022 13:16:10 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 10 Aug
 2022 15:16:10 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0058077df93-b64b-407e-b070-c0c52ca0c655,
 043EABA4B22CD34FCE1B70F8CBB6C707CA017DB3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.155.17
Message-ID: <fd5b35b4-95e8-c7fc-d18d-203579909392@kaod.org>
Date: Wed, 10 Aug 2022 15:16:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v3 04/11] ppc/pnv: add helpers for pnv-phb user
 devices
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, <fbarrat@linux.ibm.com>
References: <20220810100536.473859-1-danielhb413@gmail.com>
 <20220810100536.473859-5-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220810100536.473859-5-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 85568388-81c3-4754-9ed7-b69b6d9c1418
X-Ovh-Tracer-Id: 12653426106869255136
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegvddgiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehfsggrrhhrrghtsehlihhnuhigrdhisghmrdgtohhmpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/10/22 12:05, Daniel Henrique Barboza wrote:
> pnv_parent_qom_fixup() and pnv_parent_bus_fixup() are versions of the
> helpers that were reverted by commit 9c10d86fee "ppc/pnv: Remove
> user-created PHB{3,4,5} devices". They are needed to amend the QOM and
> bus hierarchies of user created pnv-phbs, matching them with default
> pnv-phbs.
> 
> A new helper pnv_phb_user_device_init() is created to handle
> user-created devices setup. We're going to call it inside
> pnv_phb_realize() in case we're realizing an user created device. This
> will centralize all user device realated in a single spot, leaving the
> realize functions of the phb3/phb4 backends untouched.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb.c | 76 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 76 insertions(+)
> 
> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
> index 826c0c144e..18a050a6d3 100644
> --- a/hw/pci-host/pnv_phb.c
> +++ b/hw/pci-host/pnv_phb.c
> @@ -18,6 +18,37 @@
>   #include "hw/qdev-properties.h"
>   #include "qom/object.h"
>   
> +
> +/*
> + * Set the QOM parent of an object child. If the device state
> + * associated with the child has an id, use it as QOM id. Otherwise
> + * use object_typename[index] as QOM id.
> + */
> +static void pnv_parent_qom_fixup(Object *parent, Object *child, int index)
> +{
> +    g_autofree char *default_id =
> +        g_strdup_printf("%s[%d]", object_get_typename(child), index);
> +    const char *dev_id = DEVICE(child)->id;
> +
> +    if (child->parent == parent) {
> +        return;
> +    }
> +
> +    object_ref(child);
> +    object_unparent(child);
> +    object_property_add_child(parent, dev_id ? dev_id : default_id, child);
> +    object_unref(child);
> +}
> +
> +static void pnv_parent_bus_fixup(DeviceState *parent, DeviceState *child)
> +{
> +    BusState *parent_bus = qdev_get_parent_bus(parent);
> +
> +    if (!qdev_set_parent_bus(child, parent_bus, &error_fatal)) {
> +        return;
> +    }
> +}
> +
>   /*
>    * Attach a root port device.
>    *
> @@ -41,6 +72,43 @@ static void pnv_phb_attach_root_port(PCIHostState *pci)
>       pci_realize_and_unref(root, pci->bus, &error_fatal);
>   }
>   
> +/*
> + * User created devices won't have the initial setup that default
> + * devices have. This setup consists of assigning a parent device
> + * (chip for PHB3, PEC for PHB4/5) that will be the QOM/bus parent
> + * of the PHB.
> + */
> +static void pnv_phb_user_device_init(PnvPHB *phb)

Why not pass an errp to this routine ?

> +{
> +    PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
> +    PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
> +    Object *parent = NULL;
> +
> +    if (!chip) {
> +        error_setg(&error_fatal, "invalid chip id: %d", phb->chip_id);

that you could use here.

> +        return;
> +    }
> +
> +    if (phb->version == 3) {
> +        parent = OBJECT(chip);
> +    } else {
> +        /* phb4 support will be added later */
> +        return;
> +    }
> +
> +    /*
> +     * Reparent user created devices to the chip to build
> +     * correctly the device tree. pnv_xscom_dt() needs every
> +     * PHB to be a child of the chip to build the DT correctly.
> +     *
> +     * TODO: for version 3 we're still parenting the PHB with the
> +     * chip. We should parent with a (so far not implemented)
> +     * PHB3 PEC device.
> +     */
> +    pnv_parent_qom_fixup(parent, OBJECT(phb), phb->phb_id);
> +    pnv_parent_bus_fixup(DEVICE(chip), DEVICE(phb));

and in pnv_parent_bus_fixup() also,

> +}
> +
>   static void pnv_phb_realize(DeviceState *dev, Error **errp)
>   {
>       PnvPHB *phb = PNV_PHB(dev);
> @@ -74,6 +142,14 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
>       object_property_set_uint(phb->backend, "chip-id", phb->chip_id, errp);
>       object_property_set_link(phb->backend, "phb-base", OBJECT(phb), errp);
>   
> +    /*
> +     * Handle user created devices. User devices will not have a
> +     * pointer to a chip (PHB3) and a PEC (PHB4/5).
> +     */
> +    if (!phb->chip && !phb->pec) {
> +        pnv_phb_user_device_init(phb);

and return the error message to the caller of pnv_phb_realize()

C.


> +    }
> +
>       if (phb->version == 3) {
>           object_property_set_link(phb->backend, "chip",
>                                    OBJECT(phb->chip), errp);


