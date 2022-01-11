Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8273048AAA2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 10:36:22 +0100 (CET)
Received: from localhost ([::1]:60892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7DZl-0001eu-4j
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 04:36:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n7DY7-0008WA-79
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 04:34:39 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:46575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n7DY5-0003g0-DT
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 04:34:38 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.158])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 007AFD6EE1A9;
 Tue, 11 Jan 2022 10:34:33 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 11 Jan
 2022 10:34:33 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0059bde8134-4c2b-4d87-85e4-4e2fe080b618,
 5383433EA887FCAE918FFCB03530F9AACAE8953B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9d423b83-4ac9-05bd-3d0b-fe2369be0126@kaod.org>
Date: Tue, 11 Jan 2022 10:34:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 1/5] ppc/pnv: set phb4 properties in stk_realize()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220111005558.549685-1-danielhb413@gmail.com>
 <20220111005558.549685-2-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220111005558.549685-2-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c9bdd54b-1a66-4dcf-98ba-9cc581de565d
X-Ovh-Tracer-Id: 5704090404794960864
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudehfedgtdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
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
> Moving all phb4 properties setup to stk_realize() keeps this logic in
> a single place instead of having it scattered between stk_realize() and
> pec_realize().
> 
> 'phb->index' can be retrieved using stack->stack_no and
> pnv_phb4_pec_get_phb_id(), deprecating the use of 'phb-id' alias that
> was being used for this purpose in pec_realize().
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/pci-host/pnv_phb4_pec.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index d64310e7db..f8038dff17 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -392,10 +392,8 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
>       for (i = 0; i < pec->num_stacks; i++) {
>           PnvPhb4PecStack *stack = &pec->stacks[i];
>           Object *stk_obj = OBJECT(stack);
> -        int phb_id = pnv_phb4_pec_get_phb_id(pec, i);
>   
>           object_property_set_int(stk_obj, "stack-no", i, &error_abort);
> -        object_property_set_int(stk_obj, "phb-id", phb_id, &error_abort);
>           object_property_set_link(stk_obj, "pec", OBJECT(pec), &error_abort);
>           if (!qdev_realize(DEVICE(stk_obj), NULL, errp)) {
>               return;
> @@ -534,7 +532,6 @@ static void pnv_pec_stk_instance_init(Object *obj)
>       PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(obj);
>   
>       object_initialize_child(obj, "phb", &stack->phb, TYPE_PNV_PHB4);
> -    object_property_add_alias(obj, "phb-id", OBJECT(&stack->phb), "index");
>   }
>   
>   static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
> @@ -543,6 +540,7 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>       PnvPhb4PecState *pec = stack->pec;
>       PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
>       PnvChip *chip = pec->chip;
> +    int phb_id = pnv_phb4_pec_get_phb_id(pec, stack->stack_no);
>       uint32_t pec_nest_base;
>       uint32_t pec_pci_base;
>       char name[64];
> @@ -570,6 +568,8 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>   
>       object_property_set_int(OBJECT(&stack->phb), "chip-id", pec->chip_id,
>                               &error_fatal);
> +    object_property_set_int(OBJECT(&stack->phb), "index", phb_id,
> +                            &error_fatal);
>       object_property_set_int(OBJECT(&stack->phb), "version", pecc->version,
>                               &error_fatal);
>       object_property_set_link(OBJECT(&stack->phb), "stack", OBJECT(stack),
> 


