Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EA948E888
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 11:49:33 +0100 (CET)
Received: from localhost ([::1]:48464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8K9E-0008UH-Lg
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 05:49:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8K1V-0000tI-9x
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:41:33 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:55659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8K1R-0008BA-UU
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:41:32 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.216])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 416DBD7B8D32;
 Fri, 14 Jan 2022 11:41:28 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 14 Jan
 2022 11:41:27 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0056ed99d67-493f-401f-a687-cdc0a425491d,
 CC0F12677928C812C874D314DD24F058DC39716A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0aebe019-7fa6-a78f-15c1-68bc0ff7b304@kaod.org>
Date: Fri, 14 Jan 2022 11:41:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 07/17] ppc/pnv: move nest_regs[] to PnvPHB4
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220113192952.911188-1-danielhb413@gmail.com>
 <20220113192952.911188-8-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220113192952.911188-8-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 03d6d9fa-071b-4f8b-8c02-d2f5bab53727
X-Ovh-Tracer-Id: 6005550107298139104
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On 1/13/22 20:29, Daniel Henrique Barboza wrote:
> stack->nest_regs[] is used in several XSCOM functions and it's one of
> the main culprits of having to deal with stack->phb pointers around the
> code.
> 
> Sure, we're having to add 2 extra stack->phb pointers to ease
> nest_regs[] migration to PnvPHB4. They'll be dealt with shortly.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/pci-host/pnv_phb4.c         | 52 ++++++++++++++++++----------------
>   include/hw/pci-host/pnv_phb4.h |  7 +++--
>   2 files changed, 31 insertions(+), 28 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index dc4db091e4..916a7a3cf0 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -862,10 +862,11 @@ static uint64_t pnv_pec_stk_nest_xscom_read(void *opaque, hwaddr addr,
>                                               unsigned size)
>   {
>       PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(opaque);
> +    PnvPHB4 *phb = stack->phb;
>       uint32_t reg = addr >> 3;
>   
>       /* TODO: add list of allowed registers and error out if not */
> -    return stack->nest_regs[reg];
> +    return phb->nest_regs[reg];
>   }
>   
>   static void pnv_phb4_update_regions(PnvPHB4 *phb)
> @@ -897,7 +898,7 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
>       PnvPhb4PecState *pec = stack->pec;
>       PnvPHB4 *phb = stack->phb;
>       MemoryRegion *sysmem = get_system_memory();
> -    uint64_t bar_en = stack->nest_regs[PEC_NEST_STK_BAR_EN];
> +    uint64_t bar_en = phb->nest_regs[PEC_NEST_STK_BAR_EN];
>       uint64_t bar, mask, size;
>       char name[64];
>   
> @@ -933,8 +934,8 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
>       /* Handle maps */
>       if (!memory_region_is_mapped(&phb->mmbar0) &&
>           (bar_en & PEC_NEST_STK_BAR_EN_MMIO0)) {
> -        bar = stack->nest_regs[PEC_NEST_STK_MMIO_BAR0] >> 8;
> -        mask = stack->nest_regs[PEC_NEST_STK_MMIO_BAR0_MASK];
> +        bar = phb->nest_regs[PEC_NEST_STK_MMIO_BAR0] >> 8;
> +        mask = phb->nest_regs[PEC_NEST_STK_MMIO_BAR0_MASK];
>           size = ((~mask) >> 8) + 1;
>           snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-mmio0",
>                    pec->chip_id, pec->index, stack->stack_no);
> @@ -945,8 +946,8 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
>       }
>       if (!memory_region_is_mapped(&phb->mmbar1) &&
>           (bar_en & PEC_NEST_STK_BAR_EN_MMIO1)) {
> -        bar = stack->nest_regs[PEC_NEST_STK_MMIO_BAR1] >> 8;
> -        mask = stack->nest_regs[PEC_NEST_STK_MMIO_BAR1_MASK];
> +        bar = phb->nest_regs[PEC_NEST_STK_MMIO_BAR1] >> 8;
> +        mask = phb->nest_regs[PEC_NEST_STK_MMIO_BAR1_MASK];
>           size = ((~mask) >> 8) + 1;
>           snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-mmio1",
>                    pec->chip_id, pec->index, stack->stack_no);
> @@ -957,7 +958,7 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
>       }
>       if (!memory_region_is_mapped(&phb->phbbar) &&
>           (bar_en & PEC_NEST_STK_BAR_EN_PHB)) {
> -        bar = stack->nest_regs[PEC_NEST_STK_PHB_REGS_BAR] >> 8;
> +        bar = phb->nest_regs[PEC_NEST_STK_PHB_REGS_BAR] >> 8;
>           size = PNV_PHB4_NUM_REGS << 3;
>           snprintf(name, sizeof(name), "pec-%d.%d-phb-%d",
>                    pec->chip_id, pec->index, stack->stack_no);
> @@ -966,7 +967,7 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
>       }
>       if (!memory_region_is_mapped(&phb->intbar) &&
>           (bar_en & PEC_NEST_STK_BAR_EN_INT)) {
> -        bar = stack->nest_regs[PEC_NEST_STK_INT_BAR] >> 8;
> +        bar = phb->nest_regs[PEC_NEST_STK_INT_BAR] >> 8;
>           size = PNV_PHB4_MAX_INTs << 16;
>           snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-int",
>                    stack->pec->chip_id, stack->pec->index, stack->stack_no);
> @@ -982,34 +983,35 @@ static void pnv_pec_stk_nest_xscom_write(void *opaque, hwaddr addr,
>                                            uint64_t val, unsigned size)
>   {
>       PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(opaque);
> +    PnvPHB4 *phb = stack->phb;
>       PnvPhb4PecState *pec = stack->pec;
>       uint32_t reg = addr >> 3;
>   
>       switch (reg) {
>       case PEC_NEST_STK_PCI_NEST_FIR:
> -        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] = val;
> +        phb->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] = val;
>           break;
>       case PEC_NEST_STK_PCI_NEST_FIR_CLR:
> -        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] &= val;
> +        phb->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] &= val;
>           break;
>       case PEC_NEST_STK_PCI_NEST_FIR_SET:
> -        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] |= val;
> +        phb->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] |= val;
>           break;
>       case PEC_NEST_STK_PCI_NEST_FIR_MSK:
> -        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] = val;
> +        phb->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] = val;
>           break;
>       case PEC_NEST_STK_PCI_NEST_FIR_MSKC:
> -        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] &= val;
> +        phb->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] &= val;
>           break;
>       case PEC_NEST_STK_PCI_NEST_FIR_MSKS:
> -        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] |= val;
> +        phb->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] |= val;
>           break;
>       case PEC_NEST_STK_PCI_NEST_FIR_ACT0:
>       case PEC_NEST_STK_PCI_NEST_FIR_ACT1:
> -        stack->nest_regs[reg] = val;
> +        phb->nest_regs[reg] = val;
>           break;
>       case PEC_NEST_STK_PCI_NEST_FIR_WOF:
> -        stack->nest_regs[reg] = 0;
> +        phb->nest_regs[reg] = 0;
>           break;
>       case PEC_NEST_STK_ERR_REPORT_0:
>       case PEC_NEST_STK_ERR_REPORT_1:
> @@ -1017,39 +1019,39 @@ static void pnv_pec_stk_nest_xscom_write(void *opaque, hwaddr addr,
>           /* Flag error ? */
>           break;
>       case PEC_NEST_STK_PBCQ_MODE:
> -        stack->nest_regs[reg] = val & 0xff00000000000000ull;
> +        phb->nest_regs[reg] = val & 0xff00000000000000ull;
>           break;
>       case PEC_NEST_STK_MMIO_BAR0:
>       case PEC_NEST_STK_MMIO_BAR0_MASK:
>       case PEC_NEST_STK_MMIO_BAR1:
>       case PEC_NEST_STK_MMIO_BAR1_MASK:
> -        if (stack->nest_regs[PEC_NEST_STK_BAR_EN] &
> +        if (phb->nest_regs[PEC_NEST_STK_BAR_EN] &
>               (PEC_NEST_STK_BAR_EN_MMIO0 |
>                PEC_NEST_STK_BAR_EN_MMIO1)) {
>               phb_pec_error(pec, "Changing enabled BAR unsupported\n");
>           }
> -        stack->nest_regs[reg] = val & 0xffffffffff000000ull;
> +        phb->nest_regs[reg] = val & 0xffffffffff000000ull;
>           break;
>       case PEC_NEST_STK_PHB_REGS_BAR:
> -        if (stack->nest_regs[PEC_NEST_STK_BAR_EN] & PEC_NEST_STK_BAR_EN_PHB) {
> +        if (phb->nest_regs[PEC_NEST_STK_BAR_EN] & PEC_NEST_STK_BAR_EN_PHB) {
>               phb_pec_error(pec, "Changing enabled BAR unsupported\n");
>           }
> -        stack->nest_regs[reg] = val & 0xffffffffffc00000ull;
> +        phb->nest_regs[reg] = val & 0xffffffffffc00000ull;
>           break;
>       case PEC_NEST_STK_INT_BAR:
> -        if (stack->nest_regs[PEC_NEST_STK_BAR_EN] & PEC_NEST_STK_BAR_EN_INT) {
> +        if (phb->nest_regs[PEC_NEST_STK_BAR_EN] & PEC_NEST_STK_BAR_EN_INT) {
>               phb_pec_error(pec, "Changing enabled BAR unsupported\n");
>           }
> -        stack->nest_regs[reg] = val & 0xfffffff000000000ull;
> +        phb->nest_regs[reg] = val & 0xfffffff000000000ull;
>           break;
>       case PEC_NEST_STK_BAR_EN:
> -        stack->nest_regs[reg] = val & 0xf000000000000000ull;
> +        phb->nest_regs[reg] = val & 0xf000000000000000ull;
>           pnv_pec_stk_update_map(stack);
>           break;
>       case PEC_NEST_STK_DATA_FRZ_TYPE:
>       case PEC_NEST_STK_PBCQ_TUN_BAR:
>           /* Not used for now */
> -        stack->nest_regs[reg] = val;
> +        phb->nest_regs[reg] = val;
>           break;
>       default:
>           qemu_log_mask(LOG_UNIMP, "phb4_pec: nest_xscom_write 0x%"HWADDR_PRIx
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 4a8f510f6d..a7e08772c1 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -112,6 +112,10 @@ struct PnvPHB4 {
>       uint64_t pci_regs[PHB4_PEC_PCI_STK_REGS_COUNT];
>       MemoryRegion pci_regs_mr;
>   
> +    /* Nest registers */
> +#define PHB4_PEC_NEST_STK_REGS_COUNT  0x17
> +    uint64_t nest_regs[PHB4_PEC_NEST_STK_REGS_COUNT];
> +
>       /* Memory windows from PowerBus to PHB */
>       MemoryRegion phbbar;
>       MemoryRegion intbar;
> @@ -165,9 +169,6 @@ struct PnvPhb4PecStack {
>       /* My own stack number */
>       uint32_t stack_no;
>   
> -    /* Nest registers */
> -#define PHB4_PEC_NEST_STK_REGS_COUNT  0x17
> -    uint64_t nest_regs[PHB4_PEC_NEST_STK_REGS_COUNT];
>       MemoryRegion nest_regs_mr;
>   
>       /* PHB pass-through XSCOM */
> 


