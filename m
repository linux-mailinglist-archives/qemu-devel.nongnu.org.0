Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7A748AAB9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 10:43:15 +0100 (CET)
Received: from localhost ([::1]:40968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7DgQ-0007jf-7Z
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 04:43:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n7Ddn-0005gl-B8
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 04:40:32 -0500
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:45289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n7Ddk-0004mW-BW
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 04:40:31 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.125])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 14BF820F9A;
 Tue, 11 Jan 2022 09:40:26 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 11 Jan
 2022 10:40:25 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001c44b9f4e-4b63-4ed9-960f-431593f390c7,
 FFD8DCB8B568E78E86EDC96A86417857C679DA6D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <4bbaca19-4155-cba8-9c2a-2540e545f188@kaod.org>
Date: Tue, 11 Jan 2022 10:40:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 3/5] ppc/pnv: turn 'phb' into a pointer in struct
 PnvPhb4PecStack
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220111005558.549685-1-danielhb413@gmail.com>
 <20220111005558.549685-4-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220111005558.549685-4-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0e608ee2-6005-4189-b736-bc3adaf3c764
X-Ovh-Tracer-Id: 5803169596703738848
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudehfedgtdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
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

On 1/11/22 01:55, Daniel Henrique Barboza wrote:
> At this moment, stack->phb is the plain PnvPHB4 device itself instead of
> a pointer to the device. This will present a problem when adding user
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
> PHB to an existing stack later. In this process,
> pnv_pec_stk_instance_init() is removed because stack->phb is being
> initialized in stk_realize() instead.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/pci-host/pnv_phb4.c         |  2 +-
>   hw/pci-host/pnv_phb4_pec.c     | 20 +++++++-------------
>   include/hw/pci-host/pnv_phb4.h |  7 +++++--
>   3 files changed, 13 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 1bd74fd932..3ffa8f51e9 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1728,7 +1728,7 @@ type_init(pnv_phb4_register_types);
>   
>   void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
>   {
> -    PnvPHB4 *phb = &stack->phb;
> +    PnvPHB4 *phb = stack->phb;
>   
>       /* Unmap first always */
>       if (memory_region_is_mapped(&phb->mr_regs)) {
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index bf0fdf33fd..d4c52a5d28 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -275,13 +275,6 @@ static const TypeInfo pnv_pec_type_info = {
>       }
>   };
>   
> -static void pnv_pec_stk_instance_init(Object *obj)
> -{
> -    PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(obj);
> -
> -    object_initialize_child(obj, "phb", &stack->phb, TYPE_PNV_PHB4);
> -}
> -
>   static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>   {
>       PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(dev);
> @@ -289,15 +282,17 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>       PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
>       int phb_id = pnv_phb4_pec_get_phb_id(pec, stack->stack_no);
>   
> -    object_property_set_int(OBJECT(&stack->phb), "chip-id", pec->chip_id,
> +    stack->phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
> +
> +    object_property_set_int(OBJECT(stack->phb), "chip-id", pec->chip_id,
>                               &error_fatal);
> -    object_property_set_int(OBJECT(&stack->phb), "index", phb_id,
> +    object_property_set_int(OBJECT(stack->phb), "index", phb_id,
>                               &error_fatal);
> -    object_property_set_int(OBJECT(&stack->phb), "version", pecc->version,
> +    object_property_set_int(OBJECT(stack->phb), "version", pecc->version,
>                               &error_fatal);
> -    object_property_set_link(OBJECT(&stack->phb), "stack", OBJECT(stack),
> +    object_property_set_link(OBJECT(stack->phb), "stack", OBJECT(stack),
>                                &error_abort);
> -    if (!sysbus_realize(SYS_BUS_DEVICE(&stack->phb), errp)) {
> +    if (!sysbus_realize(SYS_BUS_DEVICE(stack->phb), errp)) {
>           return;
>       }
>   }
> @@ -324,7 +319,6 @@ static const TypeInfo pnv_pec_stk_type_info = {
>       .name          = TYPE_PNV_PHB4_PEC_STACK,
>       .parent        = TYPE_DEVICE,
>       .instance_size = sizeof(PnvPhb4PecStack),
> -    .instance_init = pnv_pec_stk_instance_init,
>       .class_init    = pnv_pec_stk_class_init,
>       .interfaces    = (InterfaceInfo[]) {
>           { TYPE_PNV_XSCOM_INTERFACE },
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 5ee996ebc6..82f054cf21 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -177,8 +177,11 @@ struct PnvPhb4PecStack {
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


