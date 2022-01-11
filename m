Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2642848AAF8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 11:00:29 +0100 (CET)
Received: from localhost ([::1]:55872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Dx6-0003ho-7e
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 05:00:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n7DuH-0002Go-Bv
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 04:57:33 -0500
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:40301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n7Du4-0007pW-3I
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 04:57:31 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.192])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id E8CE220A28;
 Tue, 11 Jan 2022 09:57:16 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 11 Jan
 2022 10:57:16 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00153229854-9994-4dc5-99f9-35f7ad5696bc,
 5383433EA887FCAE918FFCB03530F9AACAE8953B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0cd1c643-a21d-4888-2146-d47dc134529d@kaod.org>
Date: Tue, 11 Jan 2022 10:57:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 5/5] ppc/pnv: turn pnv_phb4_update_regions() into static
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220111005558.549685-1-danielhb413@gmail.com>
 <20220111005558.549685-6-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220111005558.549685-6-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: dd302a9a-872a-446d-b70c-0d71e3d4990f
X-Ovh-Tracer-Id: 6087740798639573984
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudehfedguddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
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

On 1/11/22 01:55, Daniel Henrique Barboza wrote:
> Its only callers are inside pnv_phb4.c.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/pci-host/pnv_phb4.c         | 52 +++++++++++++++++-----------------
>   include/hw/pci-host/pnv_phb4.h |  1 -
>   2 files changed, 26 insertions(+), 27 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 10f8d6a919..34c43bd0f5 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -868,6 +868,32 @@ static uint64_t pnv_pec_stk_nest_xscom_read(void *opaque, hwaddr addr,
>       return stack->nest_regs[reg];
>   }
>   
> +static void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
> +{
> +    PnvPHB4 *phb = stack->phb;
> +
> +    /* Unmap first always */
> +    if (memory_region_is_mapped(&phb->mr_regs)) {
> +        memory_region_del_subregion(&stack->phbbar, &phb->mr_regs);
> +    }
> +    if (memory_region_is_mapped(&phb->xsrc.esb_mmio)) {
> +        memory_region_del_subregion(&stack->intbar, &phb->xsrc.esb_mmio);
> +    }
> +
> +    /* Map registers if enabled */
> +    if (memory_region_is_mapped(&stack->phbbar)) {
> +        memory_region_add_subregion(&stack->phbbar, 0, &phb->mr_regs);
> +    }
> +
> +    /* Map ESB if enabled */
> +    if (memory_region_is_mapped(&stack->intbar)) {
> +        memory_region_add_subregion(&stack->intbar, 0, &phb->xsrc.esb_mmio);
> +    }
> +
> +    /* Check/update m32 */
> +    pnv_phb4_check_all_mbt(phb);
> +}
> +
>   static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
>   {
>       PnvPhb4PecState *pec = stack->pec;
> @@ -1797,32 +1823,6 @@ static void pnv_phb4_register_types(void)
>   
>   type_init(pnv_phb4_register_types);
>   
> -void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
> -{
> -    PnvPHB4 *phb = stack->phb;
> -
> -    /* Unmap first always */
> -    if (memory_region_is_mapped(&phb->mr_regs)) {
> -        memory_region_del_subregion(&stack->phbbar, &phb->mr_regs);
> -    }
> -    if (memory_region_is_mapped(&phb->xsrc.esb_mmio)) {
> -        memory_region_del_subregion(&stack->intbar, &phb->xsrc.esb_mmio);
> -    }
> -
> -    /* Map registers if enabled */
> -    if (memory_region_is_mapped(&stack->phbbar)) {
> -        memory_region_add_subregion(&stack->phbbar, 0, &phb->mr_regs);
> -    }
> -
> -    /* Map ESB if enabled */
> -    if (memory_region_is_mapped(&stack->intbar)) {
> -        memory_region_add_subregion(&stack->intbar, 0, &phb->xsrc.esb_mmio);
> -    }
> -
> -    /* Check/update m32 */
> -    pnv_phb4_check_all_mbt(phb);
> -}
> -
>   void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon)
>   {
>       uint32_t offset = phb->regs[PHB_INT_NOTIFY_INDEX >> 3];
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 82f054cf21..4b7ce8a723 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -131,7 +131,6 @@ struct PnvPHB4 {
>   };
>   
>   void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon);
> -void pnv_phb4_update_regions(PnvPhb4PecStack *stack);
>   int pnv_phb4_pec_get_phb_id(PnvPhb4PecState *pec, int stack_index);
>   extern const MemoryRegionOps pnv_phb4_xscom_ops;
>   
> 


