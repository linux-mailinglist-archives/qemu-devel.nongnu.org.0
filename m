Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E98A489CD3
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 16:54:07 +0100 (CET)
Received: from localhost ([::1]:58892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6wzk-0001wS-GH
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 10:54:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n6wya-00014D-OC
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:52:52 -0500
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:42505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n6wyY-0003yn-AY
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:52:52 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.26])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id CCCB61FEA8;
 Mon, 10 Jan 2022 15:52:47 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 16:52:47 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005d773dbbd-5e00-4703-a89b-5ecba4a6b059,
 BF6F17FB45C67FCD004F592EBF28FE1306A73352) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7fca32ac-c582-8227-7344-32ef62ee0805@kaod.org>
Date: Mon, 10 Jan 2022 16:52:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 06/10] ppc/pnv: turn 'phb' into a pointer in struct
 PnvPhb4PecStack
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220110143346.455901-1-danielhb413@gmail.com>
 <20220110143346.455901-7-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220110143346.455901-7-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ea1291f9-1a2c-47a5-847c-afd8ea690647
X-Ovh-Tracer-Id: 6219189614033734624
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudehuddgheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
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

On 1/10/22 15:33, Daniel Henrique Barboza wrote:
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
> after introducing pnv-phb4 user devices.
> 
> This patch chooses the latter. Instead of getting rid of stack->phb,
> turn it into a PHB pointer. This will allow us to assign an user created
> PHB to an existing stack later.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb4.c         |  2 +-
>   hw/pci-host/pnv_phb4_pec.c     | 12 ++++++------
>   include/hw/pci-host/pnv_phb4.h |  7 +++++--
>   3 files changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index fb6c4f993a..1a7395772f 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1443,7 +1443,7 @@ type_init(pnv_phb4_register_types);
>   
>   void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
>   {
> -    PnvPHB4 *phb = &stack->phb;
> +    PnvPHB4 *phb = stack->phb;
>   
>       /* Unmap first always */
>       if (memory_region_is_mapped(&phb->mr_regs)) {
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index d2851e8040..042dc0b775 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -403,9 +403,9 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
>            * available here via the 'i' iterator so it's convenient to
>            * do it now.
>            */
> -        object_property_set_int(OBJECT(&stack->phb), "index", phb_id,
> +        object_property_set_int(OBJECT(stack->phb), "index", phb_id,
>                                   &error_abort);
> -        pnv_phb4_set_stack_phb_props(stack, &stack->phb);
> +        pnv_phb4_set_stack_phb_props(stack, stack->phb);
>   
>           if (!qdev_realize(DEVICE(stk_obj), NULL, errp)) {
>               return;
> @@ -543,7 +543,7 @@ static void pnv_pec_stk_instance_init(Object *obj)
>   {
>       PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(obj);
>   
> -    object_initialize_child(obj, "phb", &stack->phb, TYPE_PNV_PHB4);
> +    stack->phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));

Move qdev_new under pnv_pec_stk_realize() please.

Thanks,

C.



>   }
>   
>   static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
> @@ -574,10 +574,10 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>       /* PHB pass-through */
>       snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-stack-%d-phb",
>                pec->chip_id, pec->index, stack->stack_no);
> -    pnv_xscom_region_init(&stack->phb_regs_mr, OBJECT(&stack->phb),
> -                          &pnv_phb4_xscom_ops, &stack->phb, name, 0x40);
> +    pnv_xscom_region_init(&stack->phb_regs_mr, OBJECT(stack->phb),
> +                          &pnv_phb4_xscom_ops, stack->phb, name, 0x40);
>   
> -    if (!sysbus_realize(SYS_BUS_DEVICE(&stack->phb), errp)) {
> +    if (stack->phb && !sysbus_realize(SYS_BUS_DEVICE(stack->phb), errp)) {
>           return;
>       }
>   
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


