Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C21248E887
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 11:49:32 +0100 (CET)
Received: from localhost ([::1]:48348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8K9D-0008Of-5x
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 05:49:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8K0E-0007yP-RG
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:40:15 -0500
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:39555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8K0B-0007iF-AN
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:40:14 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.249])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0EB8221847;
 Fri, 14 Jan 2022 10:40:09 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 14 Jan
 2022 11:40:08 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00468a1becb-3511-44b4-b34f-55d6139e3c9a,
 CC0F12677928C812C874D314DD24F058DC39716A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0bda6396-c15f-4531-c880-7290062da008@kaod.org>
Date: Fri, 14 Jan 2022 11:40:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 03/17] ppc/pnv: move phbbar to PnvPHB4
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220113192952.911188-1-danielhb413@gmail.com>
 <20220113192952.911188-4-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220113192952.911188-4-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 491a48f8-972e-4b6d-9c1f-9ba5664192b1
X-Ovh-Tracer-Id: 5983032108252498912
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
> This MemoryRegion is simple enough to be moved in a single step.
> 
> A 'stack->phb' pointer had to be introduced in pnv_pec_stk_update_map()
> because this function isn't ready to be fully converted to use a PnvPHB4
> pointer instead. This will be dealt with in the following patches.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/pci-host/pnv_phb4.c         | 19 ++++++++++---------
>   include/hw/pci-host/pnv_phb4.h |  4 +++-
>   2 files changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index fd9f6af4b3..00eaf91fca 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -874,15 +874,15 @@ static void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
>   
>       /* Unmap first always */
>       if (memory_region_is_mapped(&phb->mr_regs)) {
> -        memory_region_del_subregion(&stack->phbbar, &phb->mr_regs);
> +        memory_region_del_subregion(&phb->phbbar, &phb->mr_regs);
>       }
>       if (memory_region_is_mapped(&phb->xsrc.esb_mmio)) {
>           memory_region_del_subregion(&stack->intbar, &phb->xsrc.esb_mmio);
>       }
>   
>       /* Map registers if enabled */
> -    if (memory_region_is_mapped(&stack->phbbar)) {
> -        memory_region_add_subregion(&stack->phbbar, 0, &phb->mr_regs);
> +    if (memory_region_is_mapped(&phb->phbbar)) {
> +        memory_region_add_subregion(&phb->phbbar, 0, &phb->mr_regs);
>       }
>   
>       /* Map ESB if enabled */
> @@ -897,6 +897,7 @@ static void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
>   static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
>   {
>       PnvPhb4PecState *pec = stack->pec;
> +    PnvPHB4 *phb = stack->phb;
>       MemoryRegion *sysmem = get_system_memory();
>       uint64_t bar_en = stack->nest_regs[PEC_NEST_STK_BAR_EN];
>       uint64_t bar, mask, size;
> @@ -919,9 +920,9 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
>           !(bar_en & PEC_NEST_STK_BAR_EN_MMIO1)) {
>           memory_region_del_subregion(sysmem, &stack->mmbar1);
>       }
> -    if (memory_region_is_mapped(&stack->phbbar) &&
> +    if (memory_region_is_mapped(&phb->phbbar) &&
>           !(bar_en & PEC_NEST_STK_BAR_EN_PHB)) {
> -        memory_region_del_subregion(sysmem, &stack->phbbar);
> +        memory_region_del_subregion(sysmem, &phb->phbbar);
>       }
>       if (memory_region_is_mapped(&stack->intbar) &&
>           !(bar_en & PEC_NEST_STK_BAR_EN_INT)) {
> @@ -956,14 +957,14 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
>           stack->mmio1_base = bar;
>           stack->mmio1_size = size;
>       }
> -    if (!memory_region_is_mapped(&stack->phbbar) &&
> +    if (!memory_region_is_mapped(&phb->phbbar) &&
>           (bar_en & PEC_NEST_STK_BAR_EN_PHB)) {
>           bar = stack->nest_regs[PEC_NEST_STK_PHB_REGS_BAR] >> 8;
>           size = PNV_PHB4_NUM_REGS << 3;
> -        snprintf(name, sizeof(name), "pec-%d.%d-stack-%d-phb",
> +        snprintf(name, sizeof(name), "pec-%d.%d-phb-%d",
>                    pec->chip_id, pec->index, stack->stack_no);
> -        memory_region_init(&stack->phbbar, OBJECT(stack), name, size);
> -        memory_region_add_subregion(sysmem, bar, &stack->phbbar);
> +        memory_region_init(&phb->phbbar, OBJECT(phb), name, size);
> +        memory_region_add_subregion(sysmem, bar, &phb->phbbar);
>       }
>       if (!memory_region_is_mapped(&stack->intbar) &&
>           (bar_en & PEC_NEST_STK_BAR_EN_INT)) {
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 4487c3a6e2..b11fa80e81 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -112,6 +112,9 @@ struct PnvPHB4 {
>       uint64_t pci_regs[PHB4_PEC_PCI_STK_REGS_COUNT];
>       MemoryRegion pci_regs_mr;
>   
> +    /* Memory windows from PowerBus to PHB */
> +    MemoryRegion phbbar;
> +
>       /* On-chip IODA tables */
>       uint64_t ioda_LIST[PNV_PHB4_MAX_LSIs];
>       uint64_t ioda_MIST[PNV_PHB4_MAX_MIST];
> @@ -166,7 +169,6 @@ struct PnvPhb4PecStack {
>       /* Memory windows from PowerBus to PHB */
>       MemoryRegion mmbar0;
>       MemoryRegion mmbar1;
> -    MemoryRegion phbbar;
>       MemoryRegion intbar;
>       uint64_t mmio0_base;
>       uint64_t mmio0_size;
> 


