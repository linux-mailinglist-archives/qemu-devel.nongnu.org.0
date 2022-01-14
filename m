Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9530748E8A1
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 11:54:07 +0100 (CET)
Received: from localhost ([::1]:57288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8KDe-0006E3-NV
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 05:54:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8K2k-00033P-IA
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:42:50 -0500
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:47223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8K2i-0008I0-H6
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:42:50 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.250])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 3687F2188E;
 Fri, 14 Jan 2022 10:42:47 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 14 Jan
 2022 11:42:46 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0020c783ded-518d-4350-8046-3fadd7ab8078,
 48AE69F32F38AAAF76E9DC5A3CEB3A821FE35450) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <be68c9c0-3f89-42de-f8b4-fc67c4141ca5@kaod.org>
Date: Fri, 14 Jan 2022 11:42:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 10/17] ppc/pnv: move phb_regs_mr to PnvPHB4
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220113192952.911188-1-danielhb413@gmail.com>
 <20220113192952.911188-11-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220113192952.911188-11-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 55716456-5870-4e12-b75a-094ee8ce2e31
X-Ovh-Tracer-Id: 6027786627598683104
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
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
> After recent changes, this MemoryRegion can be migrated to PnvPHB4
> without too much trouble.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/pci-host/pnv_phb4.c         | 6 +++---
>   include/hw/pci-host/pnv_phb4.h | 6 +++---
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 37bab10fcb..b5045fca64 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1481,9 +1481,9 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
>                             PHB4_PEC_PCI_STK_REGS_COUNT);
>   
>       /* PHB pass-through */
> -    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-stack-%d-phb",
> +    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-phb-%d",
>                pec->chip_id, pec->index, stack->stack_no);
> -    pnv_xscom_region_init(&stack->phb_regs_mr, OBJECT(phb),
> +    pnv_xscom_region_init(&phb->phb_regs_mr, OBJECT(phb),
>                             &pnv_phb4_xscom_ops, phb, name, 0x40);
>   
>       pec_nest_base = pecc->xscom_nest_base(pec);
> @@ -1499,7 +1499,7 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
>       pnv_xscom_add_subregion(pec->chip,
>                               pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
>                               0x40 * stack->stack_no,
> -                            &stack->phb_regs_mr);
> +                            &phb->phb_regs_mr);
>   }
>   
>   static void pnv_phb4_instance_init(Object *obj)
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 1d53dda0ed..6968efaba8 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -117,6 +117,9 @@ struct PnvPHB4 {
>       uint64_t nest_regs[PHB4_PEC_NEST_STK_REGS_COUNT];
>       MemoryRegion nest_regs_mr;
>   
> +    /* PHB pass-through XSCOM */
> +    MemoryRegion phb_regs_mr;
> +
>       /* Memory windows from PowerBus to PHB */
>       MemoryRegion phbbar;
>       MemoryRegion intbar;
> @@ -170,9 +173,6 @@ struct PnvPhb4PecStack {
>       /* My own stack number */
>       uint32_t stack_no;
>   
> -    /* PHB pass-through XSCOM */
> -    MemoryRegion phb_regs_mr;
> -
>       /* The owner PEC */
>       PnvPhb4PecState *pec;
>   
> 


