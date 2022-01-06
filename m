Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EAD48663C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:43:04 +0100 (CET)
Received: from localhost ([::1]:33062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Typ-0000rH-74
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:43:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n5TqF-00046q-NY; Thu, 06 Jan 2022 09:34:13 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:49341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n5TqA-0006e4-7X; Thu, 06 Jan 2022 09:34:10 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.36])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id D0D17D5FC380;
 Thu,  6 Jan 2022 15:33:56 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 6 Jan
 2022 15:33:56 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004656c1b71-1f0e-4c93-b54e-99320ffe968f,
 021048AAC49377EB75D2DE2E73CB44671C288654) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0c4399b4-2f39-14f9-4000-b0dece09cafd@kaod.org>
Date: Thu, 6 Jan 2022 15:33:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 15/18] pnv_phb4_pec.c: use 'default_enabled()' to init
 stack->phb
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220105212338.49899-1-danielhb413@gmail.com>
 <20220105212338.49899-16-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220105212338.49899-16-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: eee313d4-b4e8-4306-bed0-23d5d6b29f90
X-Ovh-Tracer-Id: 18290243989631634400
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudefledgieegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.691,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
> The next step before enabling user creatable pnv-phb4 devices is to
> decople the init of the stack->phb object from
> pnv_pec_stk_instance_init().
> 
> First, use 'defaults_enabled()' inside pnv_pec_realize() to create the
> stack->phb object, while removing the equivalent object_initiate_child()
> call from stk_instance_init(). Create a new "phb" stack property link so
> we can assign stack->phb in an idiomatic manner.
> 
> Then we need to handle stack->phb->index assignment. The value is
> retrieved with pnv_phb4_pec_get_phd_id() and, until this patch, this was
> being assigned to a 'phb-id' stack link to phb->index. It is simpler to
> assign this directly given that now we need to interact with the PnvPHB4
> object directly to set its other attributes. Assign phb->index directly
> with the value of pnv_phb4_pec_get_phb_id(), and remove the now unused
> link.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb4_pec.c | 29 +++++++++++++++++++++++------
>   1 file changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index be6eefdbb1..638691783b 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -19,6 +19,7 @@
>   #include "hw/pci/pci_bus.h"
>   #include "hw/ppc/pnv.h"
>   #include "hw/qdev-properties.h"
> +#include "sysemu/sysemu.h"
>   
>   #include <libfdt.h>
>   
> @@ -392,11 +393,29 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
>       for (i = 0; i < pec->num_stacks; i++) {
>           PnvPhb4PecStack *stack = &pec->stacks[i];
>           Object *stk_obj = OBJECT(stack);
> -        int phb_id =  pnv_phb4_pec_get_phb_id(pec, i);
>   
>           object_property_set_int(stk_obj, "stack-no", i, &error_abort);
> -        object_property_set_int(stk_obj, "phb-id", phb_id, &error_abort);

This setting of "phb-id" is indeed a problem if the phb object becomes
dynamic. This is because the property is an alias.

>           object_property_set_link(stk_obj, "pec", OBJECT(pec), &error_abort);
> +
> +        /* Create and realize the default stack->phb */
> +        if (defaults_enabled()) {

This should be under pnv_pec_stk_realize() and not pnv_pec_realize()
  
> +            PnvPHB4 *phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
> +            int phb_id = pnv_phb4_pec_get_phb_id(pec, i);
> +
> +            object_property_set_int(OBJECT(phb), "index",
> +                                    phb_id, &error_abort);
> +            object_property_set_link(OBJECT(phb), "stack",
> +                                     stk_obj, &error_abort);
> +
> +            pnv_phb4_set_stack_phb_props(stack, phb);
> +            if (!sysbus_realize_and_unref(SYS_BUS_DEVICE(phb), errp)) {
> +                return;
> +            }
> +
> +            object_property_set_link(stk_obj, "phb", OBJECT(phb),
> +                                     &error_abort);
> +        }
> +
>           if (!qdev_realize(DEVICE(stk_obj), NULL, errp)) {

AFAICT, pnv_pec_stk_realize() still realizes the PHB object but when
defaults_enabled(), pnv_pec_realize() also realizes the PHB object.

How does that work ?


>               return;
>           }
> @@ -531,10 +550,6 @@ static const TypeInfo pnv_pec_type_info = {
>   
>   static void pnv_pec_stk_instance_init(Object *obj)
>   {
> -    PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(obj);
> -
> -    object_initialize_child(obj, "phb", &stack->phb, TYPE_PNV_PHB4);
> -    object_property_add_alias(obj, "phb-id", OBJECT(&stack->phb), "index");

I think this belongs to the previous patch.

>   }
>   
>   static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
> @@ -588,6 +603,8 @@ static Property pnv_pec_stk_properties[] = {
>           DEFINE_PROP_UINT32("stack-no", PnvPhb4PecStack, stack_no, 0),
>           DEFINE_PROP_LINK("pec", PnvPhb4PecStack, pec, TYPE_PNV_PHB4_PEC,
>                            PnvPhb4PecState *),
> +        DEFINE_PROP_LINK("phb", PnvPhb4PecStack, phb, TYPE_PNV_PHB4,
> +                         PnvPHB4 *),

That's weird. I think I understand why. See next email.

Thanks,

C.


>           DEFINE_PROP_END_OF_LIST(),
>   };
>   
> 


