Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A489482F09
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 09:36:46 +0100 (CET)
Received: from localhost ([::1]:49522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4Iph-0007l9-CD
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 03:36:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4Imb-0006sj-Lm
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 03:33:34 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:41443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4ImZ-0007XO-IP
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 03:33:33 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.188])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 29753D525B31;
 Mon,  3 Jan 2022 09:33:30 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 3 Jan
 2022 09:33:29 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006b1f31bb8-93ef-4a44-a1f0-1ee5a2aa1be7,
 71ABFCEAB0EE88409933ED7B68EF8EFCD2601B88) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f7d366d5-61d3-78e5-5292-101bf89fbb63@kaod.org>
Date: Mon, 3 Jan 2022 09:33:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 06/17] pnv_phb4.c: attach default root port in phb4
 realize()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20211228193806.1198496-1-danielhb413@gmail.com>
 <20211228193806.1198496-7-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211228193806.1198496-7-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 227122e8-b73d-454a-9626-ebe3ff76d52f
X-Ovh-Tracer-Id: 13031728474255166432
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudeftddguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12/28/21 20:37, Daniel Henrique Barboza wrote:
> We're adding the default pnv_phb4_root_port in
> pnv_chip_power9_pec_realize() by going into each stack, from eack pec,

each

> accessing the stack PHB and adding the port.
> 
> This will be an annoyance when trying to implement user creatable PHB4
> devices because, when that happens, stack->phb is not guaranteed to be
> valid at that time (we'll assign a PHB to its stack in phb4_realize(),
> after stk_realize()).
> 
> Let's move the attachment of the default root port to pnv_phb4_realize()
> instead. This will create all the default root ports we already create
> today, and it'll be one less thing to worry about when implementing user
> creatable PHB4s.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

This makes sense. I would simply modify and resend the initial patch.

Thanks,

C.

> ---
>   hw/pci-host/pnv_phb4.c |  7 +++++++
>   hw/ppc/pnv.c           | 20 +++-----------------
>   include/hw/ppc/pnv.h   |  1 +
>   3 files changed, 11 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 4554490e51..daa468b812 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -22,6 +22,7 @@
>   #include "hw/irq.h"
>   #include "hw/qdev-properties.h"
>   #include "qom/object.h"
> +#include "sysemu/sysemu.h"
>   #include "trace.h"
>   
>   #define phb_error(phb, fmt, ...)                                        \
> @@ -1224,6 +1225,12 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>       pnv_phb4_update_xsrc(phb);
>   
>       phb->qirqs = qemu_allocate_irqs(xive_source_set_irq, xsrc, xsrc->nr_irqs);
> +
> +    /* Add the default pnv-phb4-root-port */
> +    if (defaults_enabled()) {
> +        pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
> +                                 TYPE_PNV_PHB4_ROOT_PORT);
> +    }
>   }
>   
>   static const char *pnv_phb4_root_bus_path(PCIHostState *host_bridge,
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 605296fab5..c88fef26cf 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1222,7 +1222,7 @@ static void pnv_chip_icp_realize(Pnv8Chip *chip8, Error **errp)
>   }
>   
>   /* Attach a root port */
> -static void pnv_phb_attach_root_port(PCIHostState *pci, const char *name)
> +void pnv_phb_attach_root_port(PCIHostState *pci, const char *name)
>   {
>       PCIDevice *root = pci_new(PCI_DEVFN(0, 0), name);
>   
> @@ -1478,7 +1478,7 @@ static void pnv_chip_quad_realize(Pnv9Chip *chip9, Error **errp)
>   static void pnv_chip_power9_pec_realize(PnvChip *chip, Error **errp)
>   {
>       Pnv9Chip *chip9 = PNV9_CHIP(chip);
> -    int i, j;
> +    int i;
>   
>       for (i = 0; i < chip->num_pecs; i++) {
>           PnvPhb4PecState *pec = &chip9->pecs[i];
> @@ -1500,13 +1500,6 @@ static void pnv_chip_power9_pec_realize(PnvChip *chip, Error **errp)
>   
>           pnv_xscom_add_subregion(chip, pec_nest_base, &pec->nest_regs_mr);
>           pnv_xscom_add_subregion(chip, pec_pci_base, &pec->pci_regs_mr);
> -
> -        for (j = 0; j < pec->num_stacks; j++) {
> -            PnvPHB4 *phb = &pec->stacks[j].phb;
> -
> -            pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
> -                                     TYPE_PNV_PHB4_ROOT_PORT);
> -        }
>       }
>   }
>   
> @@ -1726,7 +1719,7 @@ static void pnv_chip_power10_quad_realize(Pnv10Chip *chip10, Error **errp)
>   static void pnv_chip_power10_phb_realize(PnvChip *chip, Error **errp)
>   {
>       Pnv10Chip *chip10 = PNV10_CHIP(chip);
> -    int i, j;
> +    int i;
>   
>       for (i = 0; i < chip->num_pecs; i++) {
>           PnvPhb4PecState *pec = &chip10->pecs[i];
> @@ -1748,13 +1741,6 @@ static void pnv_chip_power10_phb_realize(PnvChip *chip, Error **errp)
>   
>           pnv_xscom_add_subregion(chip, pec_nest_base, &pec->nest_regs_mr);
>           pnv_xscom_add_subregion(chip, pec_pci_base, &pec->pci_regs_mr);
> -
> -        for (j = 0; j < pec->num_stacks; j++) {
> -            PnvPHB4 *phb = &pec->stacks[j].phb;
> -
> -            pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
> -                                     TYPE_PNV_PHB5_ROOT_PORT);
> -        }
>       }
>   }
>   
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index 6c48fc62ff..7f2197dcc0 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -196,6 +196,7 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
>   
>   PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
>   void pnv_chip_parent_fixup(PnvChip *chip, Object *obj, int index);
> +void pnv_phb_attach_root_port(PCIHostState *pci, const char *name);
>   
>   #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
>   typedef struct PnvMachineClass PnvMachineClass;
> 


