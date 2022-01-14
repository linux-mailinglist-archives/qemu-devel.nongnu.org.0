Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4968A48E8CC
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 12:03:06 +0100 (CET)
Received: from localhost ([::1]:45458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8KMJ-0001YT-Rq
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 06:03:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8K7s-0000d0-3b
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:48:08 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:46747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8K7p-0000iC-JL
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:48:07 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.36])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 6F80DD7B95F0;
 Fri, 14 Jan 2022 11:48:00 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 14 Jan
 2022 11:47:59 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003d974ca49-6a1b-4b7d-b34f-1f1a53ca39ac,
 CC0F12677928C812C874D314DD24F058DC39716A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <34e6af4e-83e2-08ef-541b-e9e8df356e27@kaod.org>
Date: Fri, 14 Jan 2022 11:47:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 13/17] ppc/pnv: remove stack pointer from PnvPHB4
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220113192952.911188-1-danielhb413@gmail.com>
 <20220113192952.911188-14-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220113192952.911188-14-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 72580bd9-9153-4446-a47a-b36771654154
X-Ovh-Tracer-Id: 6115888295450414048
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> This pointer was being used for two reasons: pnv_phb4_update_regions()
> was using it to access the PHB and phb4_realize() was using it as a way
> to determine if the PHB was user created.
> 
> We can determine if the PHB is user created via phb->pec, introduced in
> the previous patch, and pnv_phb4_update_regions() is no longer using
> stack->phb.
> 
> Remove the pointer from the PnvPHB4 device.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb4.c         | 17 +++++------------
>   hw/pci-host/pnv_phb4_pec.c     |  2 --
>   include/hw/pci-host/pnv_phb4.h |  2 --
>   3 files changed, 5 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index c9117221b2..25b4248776 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1549,9 +1549,10 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>       char name[32];
>   
>       /* User created PHB */
> -    if (!phb->stack) {
> +    if (!phb->pec) {
>           PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
>           PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
> +        PnvPhb4PecStack *stack;
>           PnvPhb4PecClass *pecc;
>           BusState *s;
>   
> @@ -1560,7 +1561,7 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>               return;
>           }
>   
> -        phb->stack = pnv_phb4_get_stack(chip, phb, &local_err);
> +        stack = pnv_phb4_get_stack(chip, phb, &local_err);
>           if (local_err) {
>               error_propagate(errp, local_err);
>               return;
> @@ -1570,19 +1571,13 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>            * All other phb properties but 'pec', 'version' and
>            * 'phb-number' are already set.
>            */
> -        object_property_set_link(OBJECT(phb), "pec", OBJECT(phb->stack->pec),
> +        object_property_set_link(OBJECT(phb), "pec", OBJECT(stack->pec),
>                                    &error_abort);
>           pecc = PNV_PHB4_PEC_GET_CLASS(phb->pec);
>           object_property_set_int(OBJECT(phb), "version", pecc->version,
>                                   &error_fatal);
>           object_property_set_int(OBJECT(phb), "phb-number",
> -                                phb->stack->stack_no, &error_abort);
> -
> -        /*
> -         * Assign stack->phb since pnv_phb4_update_regions() uses it
> -         * to access the phb.
> -         */
> -        phb->stack->phb = phb;
> +                                stack->stack_no, &error_abort);
>   
>           /*
>            * Reparent user created devices to the chip to build
> @@ -1686,8 +1681,6 @@ static Property pnv_phb4_properties[] = {
>           DEFINE_PROP_UINT32("index", PnvPHB4, phb_id, 0),
>           DEFINE_PROP_UINT32("chip-id", PnvPHB4, chip_id, 0),
>           DEFINE_PROP_UINT64("version", PnvPHB4, version, 0),
> -        DEFINE_PROP_LINK("stack", PnvPHB4, stack, TYPE_PNV_PHB4_PEC_STACK,
> -                         PnvPhb4PecStack *),
>           DEFINE_PROP_LINK("pec", PnvPHB4, pec, TYPE_PNV_PHB4_PEC,
>                            PnvPhb4PecState *),
>           DEFINE_PROP_END_OF_LIST(),
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 36cc4ffe7c..1de0eb9adc 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -295,8 +295,6 @@ static void pnv_pec_stk_default_phb_realize(PnvPhb4PecStack *stack,
>                               &error_fatal);
>       object_property_set_int(OBJECT(stack->phb), "version", pecc->version,
>                               &error_fatal);
> -    object_property_set_link(OBJECT(stack->phb), "stack", OBJECT(stack),
> -                             &error_abort);
>   
>       if (!sysbus_realize(SYS_BUS_DEVICE(stack->phb), errp)) {
>           return;
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index f66bc76b78..90eb4575f8 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -154,8 +154,6 @@ struct PnvPHB4 {
>       XiveSource xsrc;
>       qemu_irq *qirqs;
>   
> -    PnvPhb4PecStack *stack;
> -
>       QLIST_HEAD(, PnvPhb4DMASpace) dma_spaces;
>   };
>   
> 


