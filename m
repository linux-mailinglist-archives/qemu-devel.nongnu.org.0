Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F0149064E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 11:57:24 +0100 (CET)
Received: from localhost ([::1]:42918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9PhT-00032B-Ga
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 05:57:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9Pcf-00015W-0S; Mon, 17 Jan 2022 05:52:25 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:55515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9Pcc-000130-Mc; Mon, 17 Jan 2022 05:52:24 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.89])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id D3FFBD834226;
 Mon, 17 Jan 2022 11:52:19 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 17 Jan
 2022 11:52:19 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004b9b32ed9-2428-4108-bde2-a39b58d05633,
 9556A11AC16C5E8FE4FF301E40865CB3D13C347E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0f40f8a3-b27b-89d2-b52b-a64fe2705dbf@kaod.org>
Date: Mon, 17 Jan 2022 11:52:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 2/8] ppc/pnv: reduce stack->stack_no usage
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220114180719.52117-1-danielhb413@gmail.com>
 <20220114180719.52117-3-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220114180719.52117-3-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7ce96dd4-d6f7-4dfb-9337-b73e9777760e
X-Ovh-Tracer-Id: 5360127983811333088
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddugddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
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

On 1/14/22 19:07, Daniel Henrique Barboza wrote:
> 'stack->stack_no' represents the order that a stack appears in its PEC.
> Its primary use is in XSCOM address space calculation in
> pnv_phb4_xscom_realize() when calculating the memory region offset.
> 
> This attribute is redundant with phb->phb_id, which is calculated via
> pnv_phb4_pec_get_phb_id() using stack->stack_no information. It'll also
> be awkward to assign it when dealing with PECs and PHBs only in a future
> patch.
> 
> A new pnv_phb4_get_phb_stack_no() helper is introduced to eliminate most
> of the stack->stack_no uses we have. The only use left after this patch
> is during pnv_pec_stk_default_phb_realize() when calculating phb_id,
> which will also handled in the next patches.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks

C.

> ---
>   hw/pci-host/pnv_phb4.c | 46 +++++++++++++++++++++++++++++++-----------
>   1 file changed, 34 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 2658ef2d84..4933fe57fe 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -868,6 +868,28 @@ static uint64_t pnv_pec_stk_nest_xscom_read(void *opaque, hwaddr addr,
>       return phb->nest_regs[reg];
>   }
>   
> +/*
> + * Return the 'stack_no' of a PHB4. 'stack_no' is the order
> + * the PHB4 occupies in the PEC. This is the reverse of what
> + * pnv_phb4_pec_get_phb_id() does.
> + *
> + * E.g. a phb with phb_id = 4 and pec->index = 1 (PEC1) will
> + * be the second phb (stack_no = 1) of the PEC.
> + */
> +static int pnv_phb4_get_phb_stack_no(PnvPHB4 *phb)
> +{
> +    PnvPhb4PecState *pec = phb->pec;
> +    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
> +    int index = pec->index;
> +    int stack_no = phb->phb_id;
> +
> +    while (index--) {
> +        stack_no -= pecc->num_stacks[index];
> +    }
> +
> +    return stack_no;
> +}
> +
>   static void pnv_phb4_update_regions(PnvPHB4 *phb)
>   {
>       /* Unmap first always */
> @@ -894,10 +916,10 @@ static void pnv_phb4_update_regions(PnvPHB4 *phb)
>   
>   static void pnv_pec_stk_update_map(PnvPHB4 *phb)
>   {
> -    PnvPhb4PecStack *stack = phb->stack;
>       PnvPhb4PecState *pec = phb->pec;
>       MemoryRegion *sysmem = get_system_memory();
>       uint64_t bar_en = phb->nest_regs[PEC_NEST_STK_BAR_EN];
> +    int stack_no = pnv_phb4_get_phb_stack_no(phb);
>       uint64_t bar, mask, size;
>       char name[64];
>   
> @@ -937,7 +959,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
>           mask = phb->nest_regs[PEC_NEST_STK_MMIO_BAR0_MASK];
>           size = ((~mask) >> 8) + 1;
>           snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-mmio0",
> -                 pec->chip_id, pec->index, stack->stack_no);
> +                 pec->chip_id, pec->index, stack_no);
>           memory_region_init(&phb->mmbar0, OBJECT(phb), name, size);
>           memory_region_add_subregion(sysmem, bar, &phb->mmbar0);
>           phb->mmio0_base = bar;
> @@ -949,7 +971,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
>           mask = phb->nest_regs[PEC_NEST_STK_MMIO_BAR1_MASK];
>           size = ((~mask) >> 8) + 1;
>           snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-mmio1",
> -                 pec->chip_id, pec->index, stack->stack_no);
> +                 pec->chip_id, pec->index, stack_no);
>           memory_region_init(&phb->mmbar1, OBJECT(phb), name, size);
>           memory_region_add_subregion(sysmem, bar, &phb->mmbar1);
>           phb->mmio1_base = bar;
> @@ -960,7 +982,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
>           bar = phb->nest_regs[PEC_NEST_STK_PHB_REGS_BAR] >> 8;
>           size = PNV_PHB4_NUM_REGS << 3;
>           snprintf(name, sizeof(name), "pec-%d.%d-phb-%d",
> -                 pec->chip_id, pec->index, stack->stack_no);
> +                 pec->chip_id, pec->index, stack_no);
>           memory_region_init(&phb->phbbar, OBJECT(phb), name, size);
>           memory_region_add_subregion(sysmem, bar, &phb->phbbar);
>       }
> @@ -969,7 +991,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
>           bar = phb->nest_regs[PEC_NEST_STK_INT_BAR] >> 8;
>           size = PNV_PHB4_MAX_INTs << 16;
>           snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-int",
> -                 phb->pec->chip_id, phb->pec->index, stack->stack_no);
> +                 phb->pec->chip_id, phb->pec->index, stack_no);
>           memory_region_init(&phb->intbar, OBJECT(phb), name, size);
>           memory_region_add_subregion(sysmem, bar, &phb->intbar);
>       }
> @@ -1458,9 +1480,9 @@ static AddressSpace *pnv_phb4_dma_iommu(PCIBus *bus, void *opaque, int devfn)
>   
>   static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
>   {
> -    PnvPhb4PecStack *stack = phb->stack;
>       PnvPhb4PecState *pec = phb->pec;
>       PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
> +    int stack_no = pnv_phb4_get_phb_stack_no(phb);
>       uint32_t pec_nest_base;
>       uint32_t pec_pci_base;
>       char name[64];
> @@ -1469,20 +1491,20 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
>   
>       /* Initialize the XSCOM regions for the stack registers */
>       snprintf(name, sizeof(name), "xscom-pec-%d.%d-nest-phb-%d",
> -             pec->chip_id, pec->index, stack->stack_no);
> +             pec->chip_id, pec->index, stack_no);
>       pnv_xscom_region_init(&phb->nest_regs_mr, OBJECT(phb),
>                             &pnv_pec_stk_nest_xscom_ops, phb, name,
>                             PHB4_PEC_NEST_STK_REGS_COUNT);
>   
>       snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-phb-%d",
> -             pec->chip_id, pec->index, stack->stack_no);
> +             pec->chip_id, pec->index, stack_no);
>       pnv_xscom_region_init(&phb->pci_regs_mr, OBJECT(phb),
>                             &pnv_pec_stk_pci_xscom_ops, phb, name,
>                             PHB4_PEC_PCI_STK_REGS_COUNT);
>   
>       /* PHB pass-through */
>       snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-phb-%d",
> -             pec->chip_id, pec->index, stack->stack_no);
> +             pec->chip_id, pec->index, stack_no);
>       pnv_xscom_region_init(&phb->phb_regs_mr, OBJECT(phb),
>                             &pnv_phb4_xscom_ops, phb, name, 0x40);
>   
> @@ -1491,14 +1513,14 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
>   
>       /* Populate the XSCOM address space. */
>       pnv_xscom_add_subregion(pec->chip,
> -                            pec_nest_base + 0x40 * (stack->stack_no + 1),
> +                            pec_nest_base + 0x40 * (stack_no + 1),
>                               &phb->nest_regs_mr);
>       pnv_xscom_add_subregion(pec->chip,
> -                            pec_pci_base + 0x40 * (stack->stack_no + 1),
> +                            pec_pci_base + 0x40 * (stack_no + 1),
>                               &phb->pci_regs_mr);
>       pnv_xscom_add_subregion(pec->chip,
>                               pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
> -                            0x40 * stack->stack_no,
> +                            0x40 * stack_no,
>                               &phb->phb_regs_mr);
>   }
>   
> 


