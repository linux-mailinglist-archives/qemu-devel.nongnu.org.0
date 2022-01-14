Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C77648E8C3
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 12:01:39 +0100 (CET)
Received: from localhost ([::1]:41664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8KKw-00075r-Jb
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 06:01:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8K76-0008Mj-TH
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:47:20 -0500
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:47477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8K74-0000ei-BK
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:47:20 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.111])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 5962C215FE;
 Fri, 14 Jan 2022 10:47:14 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 14 Jan
 2022 11:47:13 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00561d93205-0ab0-427a-9017-259a393e4c32,
 CC0F12677928C812C874D314DD24F058DC39716A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ad0957c5-1080-0a79-3bdc-b17c7163ead0@kaod.org>
Date: Fri, 14 Jan 2022 11:47:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 12/17] ppc/pnv: introduce PnvPHB4 'pec' property
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220113192952.911188-1-danielhb413@gmail.com>
 <20220113192952.911188-13-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220113192952.911188-13-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4b5e1276-85ef-4054-a758-eadaa9dccd8b
X-Ovh-Tracer-Id: 6102940449129860064
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
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
> This property will track the owner PEC of this PHB. For now it's
> redundant since we can retrieve the PEC via phb->stack->pec but it
> will not be redundant when we get rid of the stack device.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/pci-host/pnv_phb4.c         | 20 +++++++++++---------
>   hw/pci-host/pnv_phb4_pec.c     |  2 ++
>   include/hw/pci-host/pnv_phb4.h |  3 +++
>   3 files changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 44f3087913..c9117221b2 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -894,8 +894,7 @@ static void pnv_phb4_update_regions(PnvPHB4 *phb)
>   
>   static void pnv_pec_stk_update_map(PnvPHB4 *phb)
>   {
> -    PnvPhb4PecStack *stack = phb->stack;
> -    PnvPhb4PecState *pec = stack->pec;
> +    PnvPhb4PecState *pec = phb->pec;
>       MemoryRegion *sysmem = get_system_memory();
>       uint64_t bar_en = phb->nest_regs[PEC_NEST_STK_BAR_EN];
>       uint64_t bar, mask, size;
> @@ -969,7 +968,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
>           bar = phb->nest_regs[PEC_NEST_STK_INT_BAR] >> 8;
>           size = PNV_PHB4_MAX_INTs << 16;
>           snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-int",
> -                 stack->pec->chip_id, stack->pec->index, phb->phb_number);
> +                 phb->pec->chip_id, phb->pec->index, phb->phb_number);
>           memory_region_init(&phb->intbar, OBJECT(phb), name, size);
>           memory_region_add_subregion(sysmem, bar, &phb->intbar);
>       }
> @@ -982,7 +981,7 @@ static void pnv_pec_stk_nest_xscom_write(void *opaque, hwaddr addr,
>                                            uint64_t val, unsigned size)
>   {
>       PnvPHB4 *phb = PNV_PHB4(opaque);
> -    PnvPhb4PecState *pec = phb->stack->pec;
> +    PnvPhb4PecState *pec = phb->pec;
>       uint32_t reg = addr >> 3;
>   
>       switch (reg) {
> @@ -1458,8 +1457,7 @@ static AddressSpace *pnv_phb4_dma_iommu(PCIBus *bus, void *opaque, int devfn)
>   
>   static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
>   {
> -    PnvPhb4PecStack *stack = phb->stack;
> -    PnvPhb4PecState *pec = stack->pec;
> +    PnvPhb4PecState *pec = phb->pec;
>       PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
>       uint32_t pec_nest_base;
>       uint32_t pec_pci_base;
> @@ -1569,10 +1567,12 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>           }
>   
>           /*
> -         * All other phb properties but 'version' and 'phb-number'
> -         * are already set.
> +         * All other phb properties but 'pec', 'version' and
> +         * 'phb-number' are already set.
>            */
> -        pecc = PNV_PHB4_PEC_GET_CLASS(phb->stack->pec);
> +        object_property_set_link(OBJECT(phb), "pec", OBJECT(phb->stack->pec),
> +                                 &error_abort);
> +        pecc = PNV_PHB4_PEC_GET_CLASS(phb->pec);
>           object_property_set_int(OBJECT(phb), "version", pecc->version,
>                                   &error_fatal);
>           object_property_set_int(OBJECT(phb), "phb-number",
> @@ -1688,6 +1688,8 @@ static Property pnv_phb4_properties[] = {
>           DEFINE_PROP_UINT64("version", PnvPHB4, version, 0),
>           DEFINE_PROP_LINK("stack", PnvPHB4, stack, TYPE_PNV_PHB4_PEC_STACK,
>                            PnvPhb4PecStack *),
> +        DEFINE_PROP_LINK("pec", PnvPHB4, pec, TYPE_PNV_PHB4_PEC,
> +                         PnvPhb4PecState *),
>           DEFINE_PROP_END_OF_LIST(),
>   };
>   
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 7c4b4023df..36cc4ffe7c 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -287,6 +287,8 @@ static void pnv_pec_stk_default_phb_realize(PnvPhb4PecStack *stack,
>   
>       object_property_set_int(OBJECT(stack->phb), "phb-number", stack->stack_no,
>                               &error_abort);
> +    object_property_set_link(OBJECT(stack->phb), "pec", OBJECT(pec),
> +                             &error_abort);
>       object_property_set_int(OBJECT(stack->phb), "chip-id", pec->chip_id,
>                               &error_fatal);
>       object_property_set_int(OBJECT(stack->phb), "index", phb_id,
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index fc7807be1c..f66bc76b78 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -87,6 +87,9 @@ struct PnvPHB4 {
>       /* My own PHB number */
>       uint32_t phb_number;
>   
> +    /* The owner PEC */
> +    PnvPhb4PecState *pec;
> +
>       char bus_path[8];
>   
>       /* Main register images */
> 


