Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D21E58EDFC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 16:13:33 +0200 (CEST)
Received: from localhost ([::1]:42266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLmSi-0007Xm-4b
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 10:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oLlr7-0005hg-TB
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:34:41 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:38077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oLlr5-0006wL-P7
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:34:41 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.197])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 9F1C511DC0494;
 Wed, 10 Aug 2022 15:34:37 +0200 (CEST)
Received: from kaod.org (37.59.142.100) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 10 Aug
 2022 15:34:36 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0033d103583-97fa-4476-8418-1d3407e2c71b,
 043EABA4B22CD34FCE1B70F8CBB6C707CA017DB3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.155.17
Message-ID: <8fff0f53-9286-baa9-b9ae-c760f1efa1a0@kaod.org>
Date: Wed, 10 Aug 2022 15:34:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v3 06/11] ppc/pnv: enable user created pnv-phb for
 powernv8
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, <fbarrat@linux.ibm.com>
References: <20220810100536.473859-1-danielhb413@gmail.com>
 <20220810100536.473859-7-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220810100536.473859-7-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: bea73adc-bcd7-4a14-a010-a679eabd8767
X-Ovh-Tracer-Id: 12965018904989961184
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegvddgieegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehfsggrrhhrrghtsehlihhnuhigrdhisghmrdgtohhmpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/10/22 12:05, Daniel Henrique Barboza wrote:
> The bulk of the work was already done by previous patches.
> 
> Use defaults_enabled() to determine whether we need to create the
> default devices or not.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb.c | 9 +++++++--
>   hw/ppc/pnv.c          | 6 ++++++
>   2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
> index 40a960c54c..887b25d49e 100644
> --- a/hw/pci-host/pnv_phb.c
> +++ b/hw/pci-host/pnv_phb.c
> @@ -17,6 +17,7 @@
>   #include "hw/ppc/pnv.h"
>   #include "hw/qdev-properties.h"
>   #include "qom/object.h"
> +#include "sysemu/sysemu.h"
>   
>   
>   /*
> @@ -174,6 +175,10 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
>           pnv_phb4_bus_init(dev, PNV_PHB4(phb->backend));
>       }
>   
> +    if (phb->version == 3 && !defaults_enabled()) {
> +        return;
> +    }
> +
>       pnv_phb_attach_root_port(pci);
>   }
>   
> @@ -209,7 +214,7 @@ static void pnv_phb_class_init(ObjectClass *klass, void *data)
>       dc->realize = pnv_phb_realize;
>       device_class_set_props(dc, pnv_phb_properties);
>       set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> -    dc->user_creatable = false;
> +    dc->user_creatable = true;
>   }
>   
>   static void pnv_phb_root_port_reset(DeviceState *dev)
> @@ -300,7 +305,7 @@ static void pnv_phb_root_port_class_init(ObjectClass *klass, void *data)
>       device_class_set_parent_reset(dc, pnv_phb_root_port_reset,
>                                     &rpc->parent_reset);
>       dc->reset = &pnv_phb_root_port_reset;
> -    dc->user_creatable = false;
> +    dc->user_creatable = true;
>   
>       k->vendor_id = PCI_VENDOR_ID_IBM;
>       /* device_id will be written during realize() */
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 44066ffb8c..0d3a88578b 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1151,6 +1151,10 @@ static void pnv_chip_power8_instance_init(Object *obj)
>   
>       object_initialize_child(obj, "homer", &chip8->homer, TYPE_PNV8_HOMER);
>   
> +    if (!defaults_enabled()) {
> +        return;
> +    }
> +

May be including the default devices under the 'if' statement would be
better for maintainability :


     if (defaults_enabled()) {
         /* Add defaults */
     }

this is minor.

Thanks,

C.

>       chip8->num_phbs = pcc->num_phbs;
>   
>       for (i = 0; i < chip8->num_phbs; i++) {
> @@ -2103,6 +2107,8 @@ static void pnv_machine_power8_class_init(ObjectClass *oc, void *data)
>   
>       pmc->compat = compat;
>       pmc->compat_size = sizeof(compat);
> +
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB);
>   }
>   
>   static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)


