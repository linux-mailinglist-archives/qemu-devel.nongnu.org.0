Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A82489CCA
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 16:52:21 +0100 (CET)
Received: from localhost ([::1]:54978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6wy4-0007eq-73
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 10:52:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n6wvR-0005UO-OA
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:49:37 -0500
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:37129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n6wvO-0003F2-IW
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:49:37 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.76])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id D8D3421BCE;
 Mon, 10 Jan 2022 15:49:31 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 16:49:31 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0030fa79e51-5832-4834-9886-712539b63f9e,
 BF6F17FB45C67FCD004F592EBF28FE1306A73352) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c47df0e6-818e-db2c-6538-af22f4b459ab@kaod.org>
Date: Mon, 10 Jan 2022 16:49:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 04/10] pnv_phb4_pec.c: remove stack 'phb-id' alias
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220110143346.455901-1-danielhb413@gmail.com>
 <20220110143346.455901-5-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220110143346.455901-5-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b500b6f9-725b-4bb6-9b5d-f2e222e35dfa
X-Ovh-Tracer-Id: 6164020517053893600
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudehuddgheehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
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
> This alias is a indirect way of setting stack->phb->index. Since we have
> access to a valid stack->phb (for default_enabled() at least - next
> patch will deal with it accordingly) we can directly set the phb 'index'
> attribute.
> 
> Let's also take the opportunity to explain why we're having to deal with
> stack->phb attributes during pec_realize().
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb4_pec.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 1f264d0a9c..417fac4cef 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -395,8 +395,17 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
>           int phb_id = pnv_phb4_pec_get_phb_id(pec, i);
>   
>           object_property_set_int(stk_obj, "stack-no", i, &error_abort);
> -        object_property_set_int(stk_obj, "phb-id", phb_id, &error_abort);
>           object_property_set_link(stk_obj, "pec", OBJECT(pec), &error_abort);
> +
> +        /*
> +         * stack->phb->index is dependent on the position the
> +         * stack occupies in pec->stacks[]. We have this information
> +         * available here via the 'i' iterator so it's convenient to
> +         * do it now.
> +         */
> +        object_property_set_int(OBJECT(&stack->phb), "index", phb_id,
> +                                &error_abort);

I don't like the fact that we are exposing ->phb under the PEC model.
It looks like this is going to be a problem afterwards when defaults
are disabled.

We should move the setting of the PHB ID under pnv_pec_stk_realize()
before the PHB is realized and compute the id with :

        int phb_id = pnv_phb4_pec_get_phb_id(pec, stack->stack_no);

Thanks,

C.

> +
>           if (!qdev_realize(DEVICE(stk_obj), NULL, errp)) {
>               return;
>           }
> @@ -534,7 +543,6 @@ static void pnv_pec_stk_instance_init(Object *obj)
>       PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(obj);
>   
>       object_initialize_child(obj, "phb", &stack->phb, TYPE_PNV_PHB4);
> -    object_property_add_alias(obj, "phb-id", OBJECT(&stack->phb), "index");
>   }
>   
>   static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
> 


