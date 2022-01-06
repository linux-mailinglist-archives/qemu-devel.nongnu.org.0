Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2364486629
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:37:33 +0100 (CET)
Received: from localhost ([::1]:46378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TtU-0007bd-R6
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:37:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n5TbS-00082H-Bj; Thu, 06 Jan 2022 09:18:54 -0500
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:48159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n5TbQ-0002c8-9z; Thu, 06 Jan 2022 09:18:54 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.44])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 6D458207B5;
 Thu,  6 Jan 2022 14:18:49 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 6 Jan
 2022 15:18:48 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006be83f517-aa68-4de3-93d0-f4a4d84f4e8f,
 021048AAC49377EB75D2DE2E73CB44671C288654) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b6a1a1b8-5125-4f91-19b8-d83c7f93c57b@kaod.org>
Date: Thu, 6 Jan 2022 15:18:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 12/18] pnv_phb4_pec.c: move pnv_pec_phb_offset() to
 pnv_phb4.c
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220105212338.49899-1-danielhb413@gmail.com>
 <20220105212338.49899-13-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220105212338.49899-13-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5e701c23-2e00-44e5-883a-f70549a82d79
X-Ovh-Tracer-Id: 18034946185340226528
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudefledgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
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
> The logic inside pnv_pec_phb_offset() will be useful in the next patch
> to determine the stack that should contain a PHB4 device.
> 
> Move the function to pnv_phb4.c and make it public since there's no
> pnv_phb4_pec.h header. While we're at it, add 'stack_index' as a
> parameter and make the function return 'phb-id' directly. And rename it
> to pnv_phb4_pec_get_phb_id() to be even clearer about the function
> intent.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/pci-host/pnv_phb4.c         | 17 +++++++++++++++++
>   hw/pci-host/pnv_phb4_pec.c     | 15 +--------------
>   include/hw/pci-host/pnv_phb4.h |  2 ++
>   3 files changed, 20 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 6c1a33bc66..4c785bbe4c 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1158,6 +1158,23 @@ static AddressSpace *pnv_phb4_dma_iommu(PCIBus *bus, void *opaque, int devfn)
>       return &ds->dma_as;
>   }
>   
> +/*
> + * Return the index/phb-id of a PHB4 that belongs to a
> + * pec->stacks[stack_index] stack.
> + */
> +int pnv_phb4_pec_get_phb_id(PnvPhb4PecState *pec, int stack_index)
> +{
> +    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
> +    int index = pec->index;
> +    int offset = 0;
> +
> +    while (index--) {
> +        offset += pecc->num_stacks[index];
> +    }
> +
> +    return offset + stack_index;
> +}
> +
>   /*
>    * Set the object properties of a phb in relation with its stack.
>    *
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 057d4b07fb..e47d19dfff 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -374,19 +374,6 @@ static void pnv_pec_instance_init(Object *obj)
>       }
>   }
>   
> -static int pnv_pec_phb_offset(PnvPhb4PecState *pec)
> -{
> -    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
> -    int index = pec->index;
> -    int offset = 0;
> -
> -    while (index--) {
> -        offset += pecc->num_stacks[index];
> -    }
> -
> -    return offset;
> -}
> -
>   static void pnv_pec_realize(DeviceState *dev, Error **errp)
>   {
>       PnvPhb4PecState *pec = PNV_PHB4_PEC(dev);
> @@ -405,7 +392,7 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
>       for (i = 0; i < pec->num_stacks; i++) {
>           PnvPhb4PecStack *stack = &pec->stacks[i];
>           Object *stk_obj = OBJECT(stack);
> -        int phb_id = pnv_pec_phb_offset(pec) + i;
> +        int phb_id =  pnv_phb4_pec_get_phb_id(pec, i);
>   
>           object_property_set_int(stk_obj, "stack-no", i, &error_abort);
>           object_property_set_int(stk_obj, "phb-id", phb_id, &error_abort);
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 7f5b9cc0ac..b2c4a6b263 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -15,6 +15,7 @@
>   #include "hw/ppc/xive.h"
>   #include "qom/object.h"
>   
> +typedef struct PnvPhb4PecState PnvPhb4PecState;
>   typedef struct PnvPhb4PecStack PnvPhb4PecStack;
>   typedef struct PnvPHB4 PnvPHB4;
>   typedef struct PnvChip PnvChip;
> @@ -132,6 +133,7 @@ struct PnvPHB4 {
>   void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon);
>   void pnv_phb4_update_regions(PnvPhb4PecStack *stack);
>   void pnv_phb4_set_stack_phb_props(PnvPhb4PecStack *stack, PnvPHB4 *phb);
> +int pnv_phb4_pec_get_phb_id(PnvPhb4PecState *pec, int stack_index);
>   extern const MemoryRegionOps pnv_phb4_xscom_ops;
>   
>   /*
> 


