Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 868A5590686
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 20:52:32 +0200 (CEST)
Received: from localhost ([::1]:57424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMDIF-00048a-IX
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 14:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oMDDg-0008CD-CW
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 14:47:51 -0400
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25]:51675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oMDDe-0006Be-5V
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 14:47:48 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.227])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 12EF22069F;
 Thu, 11 Aug 2022 18:47:43 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 11 Aug
 2022 20:47:42 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005ecd354e9-22eb-455f-923f-6b4ea4d62e41,
 B18B381393FCCA734C2622819310E7EBE9D8D149) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.155.17
Message-ID: <42522dd2-a2f4-a4b7-ae4b-6b47c28b07f5@kaod.org>
Date: Thu, 11 Aug 2022 20:47:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v4 04/11] ppc/pnv: add helpers for pnv-phb user
 devices
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, <fbarrat@linux.ibm.com>
References: <20220811163950.578927-1-danielhb413@gmail.com>
 <20220811163950.578927-5-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220811163950.578927-5-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: aba9cd1a-132d-4e87-ad32-d1d05a1d4474
X-Ovh-Tracer-Id: 5678476180607044576
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeggedgudeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepfhgsrghrrhgrtheslhhinhhugidrihgsmhdrtghomhdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/11/22 18:39, Daniel Henrique Barboza wrote:
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
> Another helper called pnv_chip_add_phb() was added to handle the
> particularities of each chip version when adding a new PHB.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/pci-host/pnv_phb.c | 75 +++++++++++++++++++++++++++++++++++++++++++
>   hw/ppc/pnv.c          | 20 ++++++++++++
>   include/hw/ppc/pnv.h  |  1 +
>   3 files changed, 96 insertions(+)
> 
> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
> index 826c0c144e..5dc44f45d1 100644
> --- a/hw/pci-host/pnv_phb.c
> +++ b/hw/pci-host/pnv_phb.c
> @@ -18,6 +18,38 @@
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
> +static void pnv_parent_bus_fixup(DeviceState *parent, DeviceState *child,
> +                                 Error **errp)
> +{
> +    BusState *parent_bus = qdev_get_parent_bus(parent);
> +
> +    if (!qdev_set_parent_bus(child, parent_bus, errp)) {
> +        return;
> +    }
> +}
> +
>   /*
>    * Attach a root port device.
>    *
> @@ -41,6 +73,39 @@ static void pnv_phb_attach_root_port(PCIHostState *pci)
>       pci_realize_and_unref(root, pci->bus, &error_fatal);
>   }
>   
> +/*
> + * User created devices won't have the initial setup that default
> + * devices have. This setup consists of assigning a parent device
> + * (chip for PHB3, PEC for PHB4/5) that will be the QOM/bus parent
> + * of the PHB.
> + */
> +static bool pnv_phb_user_device_init(PnvPHB *phb, Error **errp)
> +{
> +    PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
> +    PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
> +    Object *parent = NULL;
> +
> +    if (!chip) {
> +        error_setg(errp, "invalid chip id: %d", phb->chip_id);
> +        return false;
> +    }
> +
> +    parent = pnv_chip_add_phb(chip, phb, errp);
> +    if (!parent) {
> +        return false;
> +    }
> +
> +    /*
> +     * Reparent user created devices to the chip to build
> +     * correctly the device tree. pnv_xscom_dt() needs every
> +     * PHB to be a child of the chip to build the DT correctly.
> +     */
> +    pnv_parent_qom_fixup(parent, OBJECT(phb), phb->phb_id);
> +    pnv_parent_bus_fixup(DEVICE(chip), DEVICE(phb), errp);
> +
> +    return true;
> +}
> +
>   static void pnv_phb_realize(DeviceState *dev, Error **errp)
>   {
>       PnvPHB *phb = PNV_PHB(dev);
> @@ -74,6 +139,16 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
>       object_property_set_uint(phb->backend, "chip-id", phb->chip_id, errp);
>       object_property_set_link(phb->backend, "phb-base", OBJECT(phb), errp);
>   
> +    /*
> +     * Handle user created devices. User devices will not have a
> +     * pointer to a chip (PHB3) and a PEC (PHB4/5).
> +     */
> +    if (!phb->chip && !phb->pec) {
> +        if (!pnv_phb_user_device_init(phb, errp)) {
> +            return;
> +        }
> +    }
> +
>       if (phb->version == 3) {
>           object_property_set_link(phb->backend, "chip",
>                                    OBJECT(phb->chip), errp);
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index f9e5a3d248..2deaac17f7 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -281,6 +281,26 @@ static void pnv_dt_icp(PnvChip *chip, void *fdt, uint32_t pir,
>       g_free(reg);
>   }
>   
> +/*
> + * Adds a PnvPHB to the chip. Returns the parent obj of the
> + * PHB which varies with each version (phb version 3 is parented
> + * by the chip, version 4 and 4 are parented by the PEC
> + * device).
> + *
> + * TODO: for version 3 we're still parenting the PHB with the
> + * chip. We should parent with a (so far not implemented)
> + * PHB3 PEC device.
> + */
> +Object *pnv_chip_add_phb(PnvChip *chip, PnvPHB *phb, Error **errp)
> +{
> +    if (phb->version == 3) {
> +        return OBJECT(chip);
> +    } else {
> +        /* phb4 support will be added later */
> +        return NULL;
> +    }
> +}
> +
>   static void pnv_chip_power8_dt_populate(PnvChip *chip, void *fdt)
>   {
>       static const char compat[] = "ibm,power8-xscom\0ibm,xscom";
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index 033d907287..781d0acffa 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -231,6 +231,7 @@ struct PnvMachineState {
>   };
>   
>   PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id);
> +Object *pnv_chip_add_phb(PnvChip *chip, PnvPHB *phb, Error **errp);
>   
>   #define PNV_FDT_ADDR          0x01000000
>   #define PNV_TIMEBASE_FREQ     512000000ULL


