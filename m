Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC59486656
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:52:56 +0100 (CET)
Received: from localhost ([::1]:51920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5U8N-0005K6-L4
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:52:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5Tgg-0005qc-C1
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 09:24:18 -0500
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:56299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5Tgb-0003b7-Na
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 09:24:18 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.148])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5F341227BD;
 Thu,  6 Jan 2022 14:24:10 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 6 Jan
 2022 15:24:09 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00158287c41-e6f7-4dad-898e-36f4b9d9a438,
 49C0EA974A1AE1209641D977CC9A370E508CB387) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <aea8a382-e422-35d7-8f0f-9de116bf8ab1@kaod.org>
Date: Thu, 6 Jan 2022 15:24:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 14/18] pnv_phb4.h: turn phb into a pointer in struct
 PnvPhb4PecStack
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220105212338.49899-1-danielhb413@gmail.com>
 <20220105212338.49899-15-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220105212338.49899-15-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: bb80f6ce-f7db-4303-a7b5-6e60d0b3f2b8
X-Ovh-Tracer-Id: 18125299654305090528
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudefledgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.691,
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

On 1/5/22 22:23, Daniel Henrique Barboza wrote:
> At this moment, stack->phb is the plain PnvPHB4 device itself instead
> of a pointer to the device. This will present a problem when adding user
> creatable devices because we can't deal with this struct and the
> realize() callback from the user creatable device.
> 
> We can't get rid of this attribute, similar to what we did when enabling
> pnv-phb3 user creatable devices, because pnv_phb4_update_regions() needs
> to access stack->phb to do its job. This function is called twice in
> pnv_pec_stk_update_map(), which is one of the nested xscom write
> callbacks (via pnv_pec_stk_nest_xscom_write()). In fact,
> pnv_pec_stk_update_map() code comment is explicit about how the order of
> the unmap/map operations relates with the PHB subregions.
> 
> All of this indicates that this code is tied together in a way that we
> either go on a crusade, featuring lots of refactories and redesign and
> considerable pain, to decouple stack and phb mapping, or we allow stack
> update_map operations to access the associated PHB as it is today even
> after introducing pnv-phb4 user devices.> 
> This patch chooses the latter. Instead of getting rid of stack->phb,
> turn it into a PHB pointer. This will allow us to assign an user created
> PHB to an existing stack later.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb4.c         | 2 +-
>   hw/pci-host/pnv_phb4_pec.c     | 2 +-
>   include/hw/pci-host/pnv_phb4.h | 7 +++++--
>   3 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 4c785bbe4c..9e670e41d2 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1449,7 +1449,7 @@ type_init(pnv_phb4_register_types);
>   
>   void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
>   {
> -    PnvPHB4 *phb = &stack->phb;
> +    PnvPHB4 *phb = stack->phb;
>   
>       /* Unmap first always */
>       if (memory_region_is_mapped(&phb->mr_regs)) {
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 0675fc55bc..be6eefdbb1 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -563,7 +563,7 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>                             PHB4_PEC_PCI_STK_REGS_COUNT);
>   
>       /* PHB pass-through */
> -    pnv_phb4_set_stack_phb_props(stack, &stack->phb);
> +    pnv_phb4_set_stack_phb_props(stack, stack->phb);
>       if (!sysbus_realize(SYS_BUS_DEVICE(&stack->phb), errp)) {

Shouldn't that be stack->phb ?

What about the object_initialize_child() ?


C.

>           return;
>       }
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index b2c4a6b263..2fb5e119c4 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -178,8 +178,11 @@ struct PnvPhb4PecStack {
>       /* The owner PEC */
>       PnvPhb4PecState *pec;
>   
> -    /* The actual PHB */
> -    PnvPHB4 phb;
> +    /*
> +     * PHB4 pointer. pnv_phb4_update_regions() needs to access
> +     * the PHB4 via a PnvPhb4PecStack pointer.
> +     */
> +    PnvPHB4 *phb;
>   };
>   
>   struct PnvPhb4PecState {
> 


