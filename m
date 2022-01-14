Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F0048E87A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 11:45:01 +0100 (CET)
Received: from localhost ([::1]:42518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8K4q-0004HJ-PW
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 05:45:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8K1F-0000g1-Oa
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:41:17 -0500
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:52843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8K1B-00088r-Og
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:41:15 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.180])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 11C1621884;
 Fri, 14 Jan 2022 10:41:12 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 14 Jan
 2022 11:41:10 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001722b2f82-6247-44a6-ac3c-1529c29d4af8,
 CC0F12677928C812C874D314DD24F058DC39716A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <24923ff5-358a-51b1-4b51-3f758ed8b004@kaod.org>
Date: Fri, 14 Jan 2022 11:41:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 06/17] ppc/pnv: move mmbar0/mmbar1 and friends to PnvPHB4
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220113192952.911188-1-danielhb413@gmail.com>
 <20220113192952.911188-7-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220113192952.911188-7-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f063407a-ee88-4c24-bd06-145213c29169
X-Ovh-Tracer-Id: 6000765030001183712
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
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

On 1/13/22 20:29, Daniel Henrique Barboza wrote:
> These 2 MemoryRegions, together with mmio(0|1)_base and mmio(0|1)_size
> variables, are used together in the same functions. We're better of
> moving them all in a single step.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/pci-host/pnv_phb4.c         | 52 +++++++++++++++++-----------------
>   include/hw/pci-host/pnv_phb4.h | 14 ++++-----
>   2 files changed, 32 insertions(+), 34 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 034721f159..dc4db091e4 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -228,16 +228,16 @@ static void pnv_phb4_check_mbt(PnvPHB4 *phb, uint32_t index)
>       /* TODO: Figure out how to implemet/decode AOMASK */
>   
>       /* Check if it matches an enabled MMIO region in the PEC stack */
> -    if (memory_region_is_mapped(&phb->stack->mmbar0) &&
> -        base >= phb->stack->mmio0_base &&
> -        (base + size) <= (phb->stack->mmio0_base + phb->stack->mmio0_size)) {
> -        parent = &phb->stack->mmbar0;
> -        base -= phb->stack->mmio0_base;
> -    } else if (memory_region_is_mapped(&phb->stack->mmbar1) &&
> -        base >= phb->stack->mmio1_base &&
> -        (base + size) <= (phb->stack->mmio1_base + phb->stack->mmio1_size)) {
> -        parent = &phb->stack->mmbar1;
> -        base -= phb->stack->mmio1_base;
> +    if (memory_region_is_mapped(&phb->mmbar0) &&
> +        base >= phb->mmio0_base &&
> +        (base + size) <= (phb->mmio0_base + phb->mmio0_size)) {
> +        parent = &phb->mmbar0;
> +        base -= phb->mmio0_base;
> +    } else if (memory_region_is_mapped(&phb->mmbar1) &&
> +        base >= phb->mmio1_base &&
> +        (base + size) <= (phb->mmio1_base + phb->mmio1_size)) {
> +        parent = &phb->mmbar1;
> +        base -= phb->mmio1_base;
>       } else {
>           phb_error(phb, "PHB MBAR %d out of parent bounds", index);
>           return;
> @@ -910,13 +910,13 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
>        */
>   
>       /* Handle unmaps */
> -    if (memory_region_is_mapped(&stack->mmbar0) &&
> +    if (memory_region_is_mapped(&phb->mmbar0) &&
>           !(bar_en & PEC_NEST_STK_BAR_EN_MMIO0)) {
> -        memory_region_del_subregion(sysmem, &stack->mmbar0);
> +        memory_region_del_subregion(sysmem, &phb->mmbar0);
>       }
> -    if (memory_region_is_mapped(&stack->mmbar1) &&
> +    if (memory_region_is_mapped(&phb->mmbar1) &&
>           !(bar_en & PEC_NEST_STK_BAR_EN_MMIO1)) {
> -        memory_region_del_subregion(sysmem, &stack->mmbar1);
> +        memory_region_del_subregion(sysmem, &phb->mmbar1);
>       }
>       if (memory_region_is_mapped(&phb->phbbar) &&
>           !(bar_en & PEC_NEST_STK_BAR_EN_PHB)) {
> @@ -931,29 +931,29 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
>       pnv_phb4_update_regions(phb);
>   
>       /* Handle maps */
> -    if (!memory_region_is_mapped(&stack->mmbar0) &&
> +    if (!memory_region_is_mapped(&phb->mmbar0) &&
>           (bar_en & PEC_NEST_STK_BAR_EN_MMIO0)) {
>           bar = stack->nest_regs[PEC_NEST_STK_MMIO_BAR0] >> 8;
>           mask = stack->nest_regs[PEC_NEST_STK_MMIO_BAR0_MASK];
>           size = ((~mask) >> 8) + 1;
> -        snprintf(name, sizeof(name), "pec-%d.%d-stack-%d-mmio0",
> +        snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-mmio0",
>                    pec->chip_id, pec->index, stack->stack_no);
> -        memory_region_init(&stack->mmbar0, OBJECT(stack), name, size);
> -        memory_region_add_subregion(sysmem, bar, &stack->mmbar0);
> -        stack->mmio0_base = bar;
> -        stack->mmio0_size = size;
> +        memory_region_init(&phb->mmbar0, OBJECT(phb), name, size);
> +        memory_region_add_subregion(sysmem, bar, &phb->mmbar0);
> +        phb->mmio0_base = bar;
> +        phb->mmio0_size = size;
>       }
> -    if (!memory_region_is_mapped(&stack->mmbar1) &&
> +    if (!memory_region_is_mapped(&phb->mmbar1) &&
>           (bar_en & PEC_NEST_STK_BAR_EN_MMIO1)) {
>           bar = stack->nest_regs[PEC_NEST_STK_MMIO_BAR1] >> 8;
>           mask = stack->nest_regs[PEC_NEST_STK_MMIO_BAR1_MASK];
>           size = ((~mask) >> 8) + 1;
> -        snprintf(name, sizeof(name), "pec-%d.%d-stack-%d-mmio1",
> +        snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-mmio1",
>                    pec->chip_id, pec->index, stack->stack_no);
> -        memory_region_init(&stack->mmbar1, OBJECT(stack), name, size);
> -        memory_region_add_subregion(sysmem, bar, &stack->mmbar1);
> -        stack->mmio1_base = bar;
> -        stack->mmio1_size = size;
> +        memory_region_init(&phb->mmbar1, OBJECT(phb), name, size);
> +        memory_region_add_subregion(sysmem, bar, &phb->mmbar1);
> +        phb->mmio1_base = bar;
> +        phb->mmio1_size = size;
>       }
>       if (!memory_region_is_mapped(&phb->phbbar) &&
>           (bar_en & PEC_NEST_STK_BAR_EN_PHB)) {
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index cf5dd4009c..4a8f510f6d 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -115,6 +115,12 @@ struct PnvPHB4 {
>       /* Memory windows from PowerBus to PHB */
>       MemoryRegion phbbar;
>       MemoryRegion intbar;
> +    MemoryRegion mmbar0;
> +    MemoryRegion mmbar1;
> +    uint64_t mmio0_base;
> +    uint64_t mmio0_size;
> +    uint64_t mmio1_base;
> +    uint64_t mmio1_size;
>   
>       /* On-chip IODA tables */
>       uint64_t ioda_LIST[PNV_PHB4_MAX_LSIs];
> @@ -167,14 +173,6 @@ struct PnvPhb4PecStack {
>       /* PHB pass-through XSCOM */
>       MemoryRegion phb_regs_mr;
>   
> -    /* Memory windows from PowerBus to PHB */
> -    MemoryRegion mmbar0;
> -    MemoryRegion mmbar1;
> -    uint64_t mmio0_base;
> -    uint64_t mmio0_size;
> -    uint64_t mmio1_base;
> -    uint64_t mmio1_size;
> -
>       /* The owner PEC */
>       PnvPhb4PecState *pec;
>   
> 


