Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B37748E8D5
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 12:05:57 +0100 (CET)
Received: from localhost ([::1]:52902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8KP6-0006rU-MB
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 06:05:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8K9e-00037L-7O
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:49:58 -0500
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:60695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8K9c-0000oj-AU
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:49:57 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.140])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 09D2F216E9;
 Fri, 14 Jan 2022 10:49:55 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 14 Jan
 2022 11:49:54 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005d3170bdf-0dde-4312-bed0-c486c6a91e2a,
 CC0F12677928C812C874D314DD24F058DC39716A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <36ccc6e9-aa44-1b3f-8e57-7eaa8563424b@kaod.org>
Date: Fri, 14 Jan 2022 11:49:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 16/17] ppc/pnv: remove PnvPhb4PecStack object
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220113192952.911188-1-danielhb413@gmail.com>
 <20220113192952.911188-17-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220113192952.911188-17-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8cae1689-273e-4dc4-a205-0f62d5c8d3f4
X-Ovh-Tracer-Id: 6147976441895422944
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
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

On 1/13/22 20:29, Daniel Henrique Barboza wrote:
> All the complexity that was scattered between PnvPhb4PecStack and
> PnvPHB4 are now centered in the PnvPHB4 device. PnvPhb4PecStack does not
> serve any purpose in the current code base.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/pci-host/pnv_phb4_pec.c     | 34 ----------------------------------
>   include/hw/pci-host/pnv_phb4.h | 20 --------------------
>   2 files changed, 54 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 61d7add25a..02e7689372 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -282,43 +282,9 @@ static const TypeInfo pnv_pec_type_info = {
>       }
>   };
>   
> -static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
> -{
> -}
> -
> -static Property pnv_pec_stk_properties[] = {
> -        DEFINE_PROP_UINT32("stack-no", PnvPhb4PecStack, stack_no, 0),
> -        DEFINE_PROP_LINK("pec", PnvPhb4PecStack, pec, TYPE_PNV_PHB4_PEC,
> -                         PnvPhb4PecState *),
> -        DEFINE_PROP_END_OF_LIST(),
> -};
> -
> -static void pnv_pec_stk_class_init(ObjectClass *klass, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(klass);
> -
> -    device_class_set_props(dc, pnv_pec_stk_properties);
> -    dc->realize = pnv_pec_stk_realize;
> -    dc->user_creatable = false;
> -
> -    /* TODO: reset regs ? */
> -}
> -
> -static const TypeInfo pnv_pec_stk_type_info = {
> -    .name          = TYPE_PNV_PHB4_PEC_STACK,
> -    .parent        = TYPE_DEVICE,
> -    .instance_size = sizeof(PnvPhb4PecStack),
> -    .class_init    = pnv_pec_stk_class_init,
> -    .interfaces    = (InterfaceInfo[]) {
> -        { TYPE_PNV_XSCOM_INTERFACE },
> -        { }
> -    }
> -};
> -
>   static void pnv_pec_register_types(void)
>   {
>       type_register_static(&pnv_pec_type_info);
> -    type_register_static(&pnv_pec_stk_type_info);
>   }
>   
>   type_init(pnv_pec_register_types);
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 170de2e752..96e8583e48 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -167,26 +167,6 @@ extern const MemoryRegionOps pnv_phb4_xscom_ops;
>   #define TYPE_PNV_PHB4_PEC "pnv-phb4-pec"
>   OBJECT_DECLARE_TYPE(PnvPhb4PecState, PnvPhb4PecClass, PNV_PHB4_PEC)
>   
> -#define TYPE_PNV_PHB4_PEC_STACK "pnv-phb4-pec-stack"
> -OBJECT_DECLARE_SIMPLE_TYPE(PnvPhb4PecStack, PNV_PHB4_PEC_STACK)
> -
> -/* Per-stack data */
> -struct PnvPhb4PecStack {
> -    DeviceState parent;
> -
> -    /* My own stack number */
> -    uint32_t stack_no;
> -
> -    /* The owner PEC */
> -    PnvPhb4PecState *pec;
> -
> -    /*
> -     * PHB4 pointer. pnv_phb4_update_regions() needs to access
> -     * the PHB4 via a PnvPhb4PecStack pointer.
> -     */
> -    PnvPHB4 *phb;
> -};
> -
>   struct PnvPhb4PecState {
>       DeviceState parent;
>   
> 


