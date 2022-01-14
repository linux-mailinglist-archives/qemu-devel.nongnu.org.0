Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2E648E8D1
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 12:04:25 +0100 (CET)
Received: from localhost ([::1]:49158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8KNc-0004Ed-Ei
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 06:04:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8K6b-0007ml-QP
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:46:52 -0500
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:34627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8K6Y-0000dG-3g
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:46:49 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.109])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id AC2BB2168F;
 Fri, 14 Jan 2022 10:46:38 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 14 Jan
 2022 11:46:38 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004c7f93514-eba0-40f6-995b-218445a87d49,
 CC0F12677928C812C874D314DD24F058DC39716A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3416965f-203e-f902-a4cb-a5dcd4da6f83@kaod.org>
Date: Fri, 14 Jan 2022 11:46:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 11/17] ppc/pnv: introduce PnvPHB4 'phb_number' property
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220113192952.911188-1-danielhb413@gmail.com>
 <20220113192952.911188-12-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220113192952.911188-12-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 88d8b6b7-ba92-4299-ab6c-98fd61fa63a6
X-Ovh-Tracer-Id: 6092807347672550368
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/22 20:29, Daniel Henrique Barboza wrote:
> One of the remaining dependencies we have on the PnvPhb4PecStack object
> is the stack->stack_no property. This is set as the position the stack
> occupies in the pec->stacks[] array.
> 
> We need a way to report this same value in the PnvPHB4. This patch
> creates a new property called 'phb_number' to be used in existing code
> in all instances stack->stack_no is currently being used.
> 
> The 'phb_number' name is an indication of our future intention to convert
> the pec->stacks[] array into a pec->phbs[] array, when the PEC object will
> deal directly with phb4 objects.


So the PHB would have a 'phb_number' and a 'index' property ? That's
confusing. Can we simplify ? compute one from another ?

or keep 'stack_no' to make it clear this belongs to the stack subunit
logic.

Thanks,

C.

> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb4.c         | 28 +++++++++++++++++-----------
>   hw/pci-host/pnv_phb4_pec.c     |  2 ++
>   include/hw/pci-host/pnv_phb4.h |  3 +++
>   3 files changed, 22 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index b5045fca64..44f3087913 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -937,7 +937,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
>           mask = phb->nest_regs[PEC_NEST_STK_MMIO_BAR0_MASK];
>           size = ((~mask) >> 8) + 1;
>           snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-mmio0",
> -                 pec->chip_id, pec->index, stack->stack_no);
> +                 pec->chip_id, pec->index, phb->phb_number);
>           memory_region_init(&phb->mmbar0, OBJECT(phb), name, size);
>           memory_region_add_subregion(sysmem, bar, &phb->mmbar0);
>           phb->mmio0_base = bar;
> @@ -949,7 +949,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
>           mask = phb->nest_regs[PEC_NEST_STK_MMIO_BAR1_MASK];
>           size = ((~mask) >> 8) + 1;
>           snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-mmio1",
> -                 pec->chip_id, pec->index, stack->stack_no);
> +                 pec->chip_id, pec->index, phb->phb_number);
>           memory_region_init(&phb->mmbar1, OBJECT(phb), name, size);
>           memory_region_add_subregion(sysmem, bar, &phb->mmbar1);
>           phb->mmio1_base = bar;
> @@ -960,7 +960,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
>           bar = phb->nest_regs[PEC_NEST_STK_PHB_REGS_BAR] >> 8;
>           size = PNV_PHB4_NUM_REGS << 3;
>           snprintf(name, sizeof(name), "pec-%d.%d-phb-%d",
> -                 pec->chip_id, pec->index, stack->stack_no);
> +                 pec->chip_id, pec->index, phb->phb_number);
>           memory_region_init(&phb->phbbar, OBJECT(phb), name, size);
>           memory_region_add_subregion(sysmem, bar, &phb->phbbar);
>       }
> @@ -969,7 +969,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
>           bar = phb->nest_regs[PEC_NEST_STK_INT_BAR] >> 8;
>           size = PNV_PHB4_MAX_INTs << 16;
>           snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-int",
> -                 stack->pec->chip_id, stack->pec->index, stack->stack_no);
> +                 stack->pec->chip_id, stack->pec->index, phb->phb_number);
>           memory_region_init(&phb->intbar, OBJECT(phb), name, size);
>           memory_region_add_subregion(sysmem, bar, &phb->intbar);
>       }
> @@ -1469,20 +1469,20 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
>   
>       /* Initialize the XSCOM regions for the stack registers */
>       snprintf(name, sizeof(name), "xscom-pec-%d.%d-nest-phb-%d",
> -             pec->chip_id, pec->index, stack->stack_no);
> +             pec->chip_id, pec->index, phb->phb_number);
>       pnv_xscom_region_init(&phb->nest_regs_mr, OBJECT(phb),
>                             &pnv_pec_stk_nest_xscom_ops, phb, name,
>                             PHB4_PEC_NEST_STK_REGS_COUNT);
>   
>       snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-phb-%d",
> -             pec->chip_id, pec->index, stack->stack_no);
> +             pec->chip_id, pec->index, phb->phb_number);
>       pnv_xscom_region_init(&phb->pci_regs_mr, OBJECT(phb),
>                             &pnv_pec_stk_pci_xscom_ops, phb, name,
>                             PHB4_PEC_PCI_STK_REGS_COUNT);
>   
>       /* PHB pass-through */
>       snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-phb-%d",
> -             pec->chip_id, pec->index, stack->stack_no);
> +             pec->chip_id, pec->index, phb->phb_number);
>       pnv_xscom_region_init(&phb->phb_regs_mr, OBJECT(phb),
>                             &pnv_phb4_xscom_ops, phb, name, 0x40);
>   
> @@ -1491,14 +1491,14 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
>   
>       /* Populate the XSCOM address space. */
>       pnv_xscom_add_subregion(pec->chip,
> -                            pec_nest_base + 0x40 * (stack->stack_no + 1),
> +                            pec_nest_base + 0x40 * (phb->phb_number + 1),
>                               &phb->nest_regs_mr);
>       pnv_xscom_add_subregion(pec->chip,
> -                            pec_pci_base + 0x40 * (stack->stack_no + 1),
> +                            pec_pci_base + 0x40 * (phb->phb_number + 1),
>                               &phb->pci_regs_mr);
>       pnv_xscom_add_subregion(pec->chip,
>                               pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
> -                            0x40 * stack->stack_no,
> +                            0x40 * phb->phb_number,
>                               &phb->phb_regs_mr);
>   }
>   
> @@ -1568,10 +1568,15 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>               return;
>           }
>   
> -        /* All other phb properties but 'version' are already set */
> +        /*
> +         * All other phb properties but 'version' and 'phb-number'
> +         * are already set.
> +         */
>           pecc = PNV_PHB4_PEC_GET_CLASS(phb->stack->pec);
>           object_property_set_int(OBJECT(phb), "version", pecc->version,
>                                   &error_fatal);
> +        object_property_set_int(OBJECT(phb), "phb-number",
> +                                phb->stack->stack_no, &error_abort);
>   
>           /*
>            * Assign stack->phb since pnv_phb4_update_regions() uses it
> @@ -1677,6 +1682,7 @@ static void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno)
>   }
>   
>   static Property pnv_phb4_properties[] = {
> +        DEFINE_PROP_UINT32("phb-number", PnvPHB4, phb_number, 0),
>           DEFINE_PROP_UINT32("index", PnvPHB4, phb_id, 0),
>           DEFINE_PROP_UINT32("chip-id", PnvPHB4, chip_id, 0),
>           DEFINE_PROP_UINT64("version", PnvPHB4, version, 0),
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 7fe7f1f007..7c4b4023df 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -285,6 +285,8 @@ static void pnv_pec_stk_default_phb_realize(PnvPhb4PecStack *stack,
>   
>       stack->phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
>   
> +    object_property_set_int(OBJECT(stack->phb), "phb-number", stack->stack_no,
> +                            &error_abort);
>       object_property_set_int(OBJECT(stack->phb), "chip-id", pec->chip_id,
>                               &error_fatal);
>       object_property_set_int(OBJECT(stack->phb), "index", phb_id,
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 6968efaba8..fc7807be1c 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -84,6 +84,9 @@ struct PnvPHB4 {
>   
>       uint64_t version;
>   
> +    /* My own PHB number */
> +    uint32_t phb_number;
> +
>       char bus_path[8];
>   
>       /* Main register images */
> 


