Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AD2486633
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:41:09 +0100 (CET)
Received: from localhost ([::1]:54048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Twy-0004LX-3T
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:41:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5Tu1-0001hB-GB
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 09:38:05 -0500
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:55103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5Ttz-0000D6-6t
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 09:38:05 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.124])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5F5CB228F7;
 Thu,  6 Jan 2022 14:38:01 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 6 Jan
 2022 15:38:00 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0040c75a774-2448-4705-8e19-932a506e1c27,
 021048AAC49377EB75D2DE2E73CB44671C288654) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <039a8811-796d-8f05-24f6-2c3184563ae5@kaod.org>
Date: Thu, 6 Jan 2022 15:38:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 16/18] pnv_phb4.c: introduce pnv_pec_init_stack_xscom()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220105212338.49899-1-danielhb413@gmail.com>
 <20220105212338.49899-17-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220105212338.49899-17-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: cd0dcbf5-88da-406b-b8bd-b60ed00bcc1e
X-Ovh-Tracer-Id: 18359205356376263648
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudefledgieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.691,
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

On 1/5/22 22:23, Daniel Henrique Barboza wrote:
> The XSCOM address space of the stack must be populated after the
> initialization of its associated PHB4 is completed. At this moment this
> is always true because stk_realize() will always succeeds the realize of
> stack->phb, but that will not be the case with user creatable pnv-phb4
> devices.
> 
> Create a helper that can be used later on during pnv-phb4 realize() to
> initialize the xscom address space of its stack.

I think this patch prepares ground for user-created devices and should come
earlier in the series.

> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/pci-host/pnv_phb4.c         | 26 ++++++++++++++++++++++++++
>   hw/pci-host/pnv_phb4_pec.c     | 19 +------------------
>   include/hw/pci-host/pnv_phb4.h |  1 +
>   3 files changed, 28 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 9e670e41d2..430a5c10f4 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1158,6 +1158,32 @@ static AddressSpace *pnv_phb4_dma_iommu(PCIBus *bus, void *opaque, int devfn)
>       return &ds->dma_as;
>   }
>   
> +/*
> + * Init the xscom address space of the stack. This must be
> + * called after the associated stack->phb is defined.
> + */
> +void pnv_pec_init_stack_xscom(PnvPhb4PecStack *stack)
> +{
> +    PnvPhb4PecState *pec = stack->pec;
> +    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
> +    PnvChip *chip = pec->chip;
> +    uint32_t pec_nest_base = pecc->xscom_nest_base(pec);
> +    uint32_t pec_pci_base = pecc->xscom_pci_base(pec);
> +
> +
> +    /* Populate the XSCOM address space. */
> +    pnv_xscom_add_subregion(chip,
> +                            pec_nest_base + 0x40 * (stack->stack_no + 1),
> +                            &stack->nest_regs_mr);
> +    pnv_xscom_add_subregion(chip,
> +                            pec_pci_base + 0x40 * (stack->stack_no + 1),
> +                            &stack->pci_regs_mr);
> +    pnv_xscom_add_subregion(chip,
> +                            pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
> +                            0x40 * stack->stack_no,
> +                            &stack->phb_regs_mr);
> +}
> +
>   /*
>    * Return the index/phb-id of a PHB4 that belongs to a
>    * pec->stacks[stack_index] stack.
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 638691783b..41c79d24c4 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -556,10 +556,6 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>   {
>       PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(dev);
>       PnvPhb4PecState *pec = stack->pec;
> -    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
> -    PnvChip *chip = pec->chip;
> -    uint32_t pec_nest_base;
> -    uint32_t pec_pci_base;
>       char name[64];
>   
>       assert(pec);
> @@ -583,20 +579,7 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> -    pec_nest_base = pecc->xscom_nest_base(pec);
> -    pec_pci_base = pecc->xscom_pci_base(pec);
> -
> -    /* Populate the XSCOM address space. */
> -    pnv_xscom_add_subregion(chip,
> -                            pec_nest_base + 0x40 * (stack->stack_no + 1),
> -                            &stack->nest_regs_mr);
> -    pnv_xscom_add_subregion(chip,
> -                            pec_pci_base + 0x40 * (stack->stack_no + 1),
> -                            &stack->pci_regs_mr);
> -    pnv_xscom_add_subregion(chip,
> -                            pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
> -                            0x40 * stack->stack_no,
> -                            &stack->phb_regs_mr);
> +    pnv_pec_init_stack_xscom(stack);
>   }
>   
>   static Property pnv_pec_stk_properties[] = {
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 2fb5e119c4..610580a88f 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -132,6 +132,7 @@ struct PnvPHB4 {
>   
>   void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon);
>   void pnv_phb4_update_regions(PnvPhb4PecStack *stack);
> +void pnv_pec_init_stack_xscom(PnvPhb4PecStack *stack);
>   void pnv_phb4_set_stack_phb_props(PnvPhb4PecStack *stack, PnvPHB4 *phb);
>   int pnv_phb4_pec_get_phb_id(PnvPhb4PecState *pec, int stack_index);
>   extern const MemoryRegionOps pnv_phb4_xscom_ops;
> 


