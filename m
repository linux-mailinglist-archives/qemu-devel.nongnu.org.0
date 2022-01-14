Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC2948E87D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 11:46:36 +0100 (CET)
Received: from localhost ([::1]:43898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8K6N-0005DA-RE
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 05:46:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8K0k-0008Hu-Lp
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:40:49 -0500
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:45313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8K0i-0007wG-Fw
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:40:46 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.27])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 7142921888;
 Fri, 14 Jan 2022 10:40:42 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 14 Jan
 2022 11:40:41 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0035d59dba5-dfdb-454e-b448-78c1823b3163,
 CC0F12677928C812C874D314DD24F058DC39716A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c8ede4d3-7409-d6e0-b7da-479e03abbc0e@kaod.org>
Date: Fri, 14 Jan 2022 11:40:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 04/17] ppc/pnv: move intbar to PnvPHB4
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220113192952.911188-1-danielhb413@gmail.com>
 <20220113192952.911188-5-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220113192952.911188-5-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 00fd401c-2b62-4bc9-9b6c-c2e51979ac42
X-Ovh-Tracer-Id: 5992602255690402784
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

On 1/13/22 20:29, Daniel Henrique Barboza wrote:
> This MemoryRegion can also be moved in a single step.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/pci-host/pnv_phb4.c         | 18 +++++++++---------
>   include/hw/pci-host/pnv_phb4.h |  2 +-
>   2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 00eaf91fca..fbc475f27a 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -877,7 +877,7 @@ static void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
>           memory_region_del_subregion(&phb->phbbar, &phb->mr_regs);
>       }
>       if (memory_region_is_mapped(&phb->xsrc.esb_mmio)) {
> -        memory_region_del_subregion(&stack->intbar, &phb->xsrc.esb_mmio);
> +        memory_region_del_subregion(&phb->intbar, &phb->xsrc.esb_mmio);
>       }
>   
>       /* Map registers if enabled */
> @@ -886,8 +886,8 @@ static void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
>       }
>   
>       /* Map ESB if enabled */
> -    if (memory_region_is_mapped(&stack->intbar)) {
> -        memory_region_add_subregion(&stack->intbar, 0, &phb->xsrc.esb_mmio);
> +    if (memory_region_is_mapped(&phb->intbar)) {
> +        memory_region_add_subregion(&phb->intbar, 0, &phb->xsrc.esb_mmio);
>       }
>   
>       /* Check/update m32 */
> @@ -924,9 +924,9 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
>           !(bar_en & PEC_NEST_STK_BAR_EN_PHB)) {
>           memory_region_del_subregion(sysmem, &phb->phbbar);
>       }
> -    if (memory_region_is_mapped(&stack->intbar) &&
> +    if (memory_region_is_mapped(&phb->intbar) &&
>           !(bar_en & PEC_NEST_STK_BAR_EN_INT)) {
> -        memory_region_del_subregion(sysmem, &stack->intbar);
> +        memory_region_del_subregion(sysmem, &phb->intbar);
>       }
>   
>       /* Update PHB */
> @@ -966,14 +966,14 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
>           memory_region_init(&phb->phbbar, OBJECT(phb), name, size);
>           memory_region_add_subregion(sysmem, bar, &phb->phbbar);
>       }
> -    if (!memory_region_is_mapped(&stack->intbar) &&
> +    if (!memory_region_is_mapped(&phb->intbar) &&
>           (bar_en & PEC_NEST_STK_BAR_EN_INT)) {
>           bar = stack->nest_regs[PEC_NEST_STK_INT_BAR] >> 8;
>           size = PNV_PHB4_MAX_INTs << 16;
> -        snprintf(name, sizeof(name), "pec-%d.%d-stack-%d-int",
> +        snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-int",
>                    stack->pec->chip_id, stack->pec->index, stack->stack_no);
> -        memory_region_init(&stack->intbar, OBJECT(stack), name, size);
> -        memory_region_add_subregion(sysmem, bar, &stack->intbar);
> +        memory_region_init(&phb->intbar, OBJECT(phb), name, size);
> +        memory_region_add_subregion(sysmem, bar, &phb->intbar);
>       }
>   
>       /* Update PHB */
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index b11fa80e81..cf5dd4009c 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -114,6 +114,7 @@ struct PnvPHB4 {
>   
>       /* Memory windows from PowerBus to PHB */
>       MemoryRegion phbbar;
> +    MemoryRegion intbar;
>   
>       /* On-chip IODA tables */
>       uint64_t ioda_LIST[PNV_PHB4_MAX_LSIs];
> @@ -169,7 +170,6 @@ struct PnvPhb4PecStack {
>       /* Memory windows from PowerBus to PHB */
>       MemoryRegion mmbar0;
>       MemoryRegion mmbar1;
> -    MemoryRegion intbar;
>       uint64_t mmio0_base;
>       uint64_t mmio0_size;
>       uint64_t mmio1_base;
> 


