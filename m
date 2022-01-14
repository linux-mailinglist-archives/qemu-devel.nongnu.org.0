Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCFE48E8A6
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 11:54:55 +0100 (CET)
Received: from localhost ([::1]:59482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8KEQ-0007kz-Fk
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 05:54:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8K2T-0002C0-7K
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:42:33 -0500
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:49299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8K2Q-0008Fi-7D
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:42:32 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.6])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id B297F2128E;
 Fri, 14 Jan 2022 10:42:28 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 14 Jan
 2022 11:42:28 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0025df19434-2c0f-4fcd-b329-fddc0510ea40,
 48AE69F32F38AAAF76E9DC5A3CEB3A821FE35450) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8ecb83eb-ce0c-b8d4-fd8a-d48d1dadc430@kaod.org>
Date: Fri, 14 Jan 2022 11:42:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 09/17] ppc/pnv: move nest_regs_mr to PnvPHB4
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220113192952.911188-1-danielhb413@gmail.com>
 <20220113192952.911188-10-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220113192952.911188-10-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: cfe7eaad-bcf1-4e8b-aa5c-6f7a2c7a61a7
X-Ovh-Tracer-Id: 6022438604009016288
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
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
> We're now able to cleanly move nest_regs_mr to the PnvPHB4 device.
> 
> One thing of notice here is the need to use a phb->stack->pec pointer
> because pnv_pec_stk_nest_xscom_write requires a PEC object. Another
> thing that can be noticed in the use of 'stack->stack_no' that still
> remains throughout the XSCOM code.
> 
> After moving all MemoryRegions to the PnvPHB4 object, this illustrates
> what is the remaining role of the stack: provide a PEC pointer and the
> 'stack_no' information. If we can provide these in the PnvPHB4 object
> instead (spoiler: we can, and we will), the PnvPhb4PecStack device will
> be deprecated and can be removed.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/pci-host/pnv_phb4.c         | 16 +++++++---------
>   include/hw/pci-host/pnv_phb4.h |  3 +--
>   2 files changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 0f4464ec67..37bab10fcb 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -861,8 +861,7 @@ const MemoryRegionOps pnv_phb4_xscom_ops = {
>   static uint64_t pnv_pec_stk_nest_xscom_read(void *opaque, hwaddr addr,
>                                               unsigned size)
>   {
> -    PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(opaque);
> -    PnvPHB4 *phb = stack->phb;
> +    PnvPHB4 *phb = PNV_PHB4(opaque);
>       uint32_t reg = addr >> 3;
>   
>       /* TODO: add list of allowed registers and error out if not */
> @@ -982,9 +981,8 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
>   static void pnv_pec_stk_nest_xscom_write(void *opaque, hwaddr addr,
>                                            uint64_t val, unsigned size)
>   {
> -    PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(opaque);
> -    PnvPHB4 *phb = stack->phb;
> -    PnvPhb4PecState *pec = stack->pec;
> +    PnvPHB4 *phb = PNV_PHB4(opaque);
> +    PnvPhb4PecState *pec = phb->stack->pec;
>       uint32_t reg = addr >> 3;
>   
>       switch (reg) {
> @@ -1470,10 +1468,10 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
>       assert(pec);
>   
>       /* Initialize the XSCOM regions for the stack registers */
> -    snprintf(name, sizeof(name), "xscom-pec-%d.%d-nest-stack-%d",
> +    snprintf(name, sizeof(name), "xscom-pec-%d.%d-nest-phb-%d",
>                pec->chip_id, pec->index, stack->stack_no);
> -    pnv_xscom_region_init(&stack->nest_regs_mr, OBJECT(stack),
> -                          &pnv_pec_stk_nest_xscom_ops, stack, name,
> +    pnv_xscom_region_init(&phb->nest_regs_mr, OBJECT(phb),
> +                          &pnv_pec_stk_nest_xscom_ops, phb, name,
>                             PHB4_PEC_NEST_STK_REGS_COUNT);
>   
>       snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-phb-%d",
> @@ -1494,7 +1492,7 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
>       /* Populate the XSCOM address space. */
>       pnv_xscom_add_subregion(pec->chip,
>                               pec_nest_base + 0x40 * (stack->stack_no + 1),
> -                            &stack->nest_regs_mr);
> +                            &phb->nest_regs_mr);
>       pnv_xscom_add_subregion(pec->chip,
>                               pec_pci_base + 0x40 * (stack->stack_no + 1),
>                               &phb->pci_regs_mr);
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index a7e08772c1..1d53dda0ed 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -115,6 +115,7 @@ struct PnvPHB4 {
>       /* Nest registers */
>   #define PHB4_PEC_NEST_STK_REGS_COUNT  0x17
>       uint64_t nest_regs[PHB4_PEC_NEST_STK_REGS_COUNT];
> +    MemoryRegion nest_regs_mr;
>   
>       /* Memory windows from PowerBus to PHB */
>       MemoryRegion phbbar;
> @@ -169,8 +170,6 @@ struct PnvPhb4PecStack {
>       /* My own stack number */
>       uint32_t stack_no;
>   
> -    MemoryRegion nest_regs_mr;
> -
>       /* PHB pass-through XSCOM */
>       MemoryRegion phb_regs_mr;
>   
> 


