Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BA048E878
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 11:44:09 +0100 (CET)
Received: from localhost ([::1]:39732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8K40-0002Mq-KO
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 05:44:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8JzX-0007dX-5E
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:39:31 -0500
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:44371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8JzU-0007e4-Qe
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:39:30 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.90])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id DFD69216F0;
 Fri, 14 Jan 2022 10:39:25 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 14 Jan
 2022 11:39:25 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002f8edeba6-6596-43a7-b93e-2da32fb6b0dc,
 48AE69F32F38AAAF76E9DC5A3CEB3A821FE35450) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <139b4270-81b3-dfdc-09b8-7d0f5577d097@kaod.org>
Date: Fri, 14 Jan 2022 11:39:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 02/17] ppc/pnv: move PCI registers to PnvPHB4
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220113192952.911188-1-danielhb413@gmail.com>
 <20220113192952.911188-3-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220113192952.911188-3-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 143cfece-0f84-469e-813a-89b648ebc6d5
X-Ovh-Tracer-Id: 5970928682445081568
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

On 1/13/22 20:29, Daniel Henrique Barboza wrote:
> Previous patch changed pnv_pec_stk_pci_xscom_read() and
> pnv_pec_stk_pci_xscom_write() to use a PnvPHB4 opaque, making it easier
> to move both pci_regs[] and the pci_regs_mr MemoryRegion to the PnvHB4
> object.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/pci-host/pnv_phb4.c         | 30 +++++++++++++++---------------
>   include/hw/pci-host/pnv_phb4.h | 10 +++++-----
>   2 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index e010572376..fd9f6af4b3 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1071,54 +1071,54 @@ static const MemoryRegionOps pnv_pec_stk_nest_xscom_ops = {
>   static uint64_t pnv_pec_stk_pci_xscom_read(void *opaque, hwaddr addr,
>                                              unsigned size)
>   {
> -    PnvPhb4PecStack *stack = PNV_PHB4(opaque)->stack;
> +    PnvPHB4 *phb = PNV_PHB4(opaque);
>       uint32_t reg = addr >> 3;
>   
>       /* TODO: add list of allowed registers and error out if not */
> -    return stack->pci_regs[reg];
> +    return phb->pci_regs[reg];
>   }
>   
>   static void pnv_pec_stk_pci_xscom_write(void *opaque, hwaddr addr,
>                                           uint64_t val, unsigned size)
>   {
> -    PnvPhb4PecStack *stack = PNV_PHB4(opaque)->stack;
> +    PnvPHB4 *phb = PNV_PHB4(opaque);
>       uint32_t reg = addr >> 3;
>   
>       switch (reg) {
>       case PEC_PCI_STK_PCI_FIR:
> -        stack->pci_regs[reg] = val;
> +        phb->pci_regs[reg] = val;
>           break;
>       case PEC_PCI_STK_PCI_FIR_CLR:
> -        stack->pci_regs[PEC_PCI_STK_PCI_FIR] &= val;
> +        phb->pci_regs[PEC_PCI_STK_PCI_FIR] &= val;
>           break;
>       case PEC_PCI_STK_PCI_FIR_SET:
> -        stack->pci_regs[PEC_PCI_STK_PCI_FIR] |= val;
> +        phb->pci_regs[PEC_PCI_STK_PCI_FIR] |= val;
>           break;
>       case PEC_PCI_STK_PCI_FIR_MSK:
> -        stack->pci_regs[reg] = val;
> +        phb->pci_regs[reg] = val;
>           break;
>       case PEC_PCI_STK_PCI_FIR_MSKC:
> -        stack->pci_regs[PEC_PCI_STK_PCI_FIR_MSK] &= val;
> +        phb->pci_regs[PEC_PCI_STK_PCI_FIR_MSK] &= val;
>           break;
>       case PEC_PCI_STK_PCI_FIR_MSKS:
> -        stack->pci_regs[PEC_PCI_STK_PCI_FIR_MSK] |= val;
> +        phb->pci_regs[PEC_PCI_STK_PCI_FIR_MSK] |= val;
>           break;
>       case PEC_PCI_STK_PCI_FIR_ACT0:
>       case PEC_PCI_STK_PCI_FIR_ACT1:
> -        stack->pci_regs[reg] = val;
> +        phb->pci_regs[reg] = val;
>           break;
>       case PEC_PCI_STK_PCI_FIR_WOF:
> -        stack->pci_regs[reg] = 0;
> +        phb->pci_regs[reg] = 0;
>           break;
>       case PEC_PCI_STK_ETU_RESET:
> -        stack->pci_regs[reg] = val & 0x8000000000000000ull;
> +        phb->pci_regs[reg] = val & 0x8000000000000000ull;
>           /* TODO: Implement reset */
>           break;
>       case PEC_PCI_STK_PBAIB_ERR_REPORT:
>           break;
>       case PEC_PCI_STK_PBAIB_TX_CMD_CRED:
>       case PEC_PCI_STK_PBAIB_TX_DAT_CRED:
> -        stack->pci_regs[reg] = val;
> +        phb->pci_regs[reg] = val;
>           break;
>       default:
>           qemu_log_mask(LOG_UNIMP, "phb4_pec_stk: pci_xscom_write 0x%"HWADDR_PRIx
> @@ -1477,7 +1477,7 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
>   
>       snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-phb-%d",
>                pec->chip_id, pec->index, stack->stack_no);
> -    pnv_xscom_region_init(&stack->pci_regs_mr, OBJECT(phb),
> +    pnv_xscom_region_init(&phb->pci_regs_mr, OBJECT(phb),
>                             &pnv_pec_stk_pci_xscom_ops, phb, name,
>                             PHB4_PEC_PCI_STK_REGS_COUNT);
>   
> @@ -1496,7 +1496,7 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
>                               &stack->nest_regs_mr);
>       pnv_xscom_add_subregion(pec->chip,
>                               pec_pci_base + 0x40 * (stack->stack_no + 1),
> -                            &stack->pci_regs_mr);
> +                            &phb->pci_regs_mr);
>       pnv_xscom_add_subregion(pec->chip,
>                               pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
>                               0x40 * stack->stack_no,
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 4b7ce8a723..4487c3a6e2 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -107,6 +107,11 @@ struct PnvPHB4 {
>       MemoryRegion pci_mmio;
>       MemoryRegion pci_io;
>   
> +    /* PCI registers (excluding pass-through) */
> +#define PHB4_PEC_PCI_STK_REGS_COUNT  0xf
> +    uint64_t pci_regs[PHB4_PEC_PCI_STK_REGS_COUNT];
> +    MemoryRegion pci_regs_mr;
> +
>       /* On-chip IODA tables */
>       uint64_t ioda_LIST[PNV_PHB4_MAX_LSIs];
>       uint64_t ioda_MIST[PNV_PHB4_MAX_MIST];
> @@ -155,11 +160,6 @@ struct PnvPhb4PecStack {
>       uint64_t nest_regs[PHB4_PEC_NEST_STK_REGS_COUNT];
>       MemoryRegion nest_regs_mr;
>   
> -    /* PCI registers (excluding pass-through) */
> -#define PHB4_PEC_PCI_STK_REGS_COUNT  0xf
> -    uint64_t pci_regs[PHB4_PEC_PCI_STK_REGS_COUNT];
> -    MemoryRegion pci_regs_mr;
> -
>       /* PHB pass-through XSCOM */
>       MemoryRegion phb_regs_mr;
>   
> 


