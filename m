Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB89C59541A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 09:48:24 +0200 (CEST)
Received: from localhost ([::1]:38372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNrJH-0000oB-Nx
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 03:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oNr5z-0007aN-4S; Tue, 16 Aug 2022 03:34:39 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:37219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oNr5w-0004UK-DZ; Tue, 16 Aug 2022 03:34:38 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.246])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 8E36E11E8E5B8;
 Tue, 16 Aug 2022 09:34:31 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 16 Aug
 2022 09:34:30 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005aa7428e5-0fbb-43ff-88bd-17a01c5a43d2,
 F9C770E940B196DD2347A7F94772438AA2E7EC4E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8f8f6d43-5cfe-905f-86ab-a40d3e132096@kaod.org>
Date: Tue, 16 Aug 2022 09:34:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 12/22] ppc4xx: Move PLB model to ppc4xx_devs.c
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <cover.1660402839.git.balaton@eik.bme.hu>
 <3f182ba0e89eeea855516cf3651fb8cc4cf9b546.1660402839.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <3f182ba0e89eeea855516cf3651fb8cc4cf9b546.1660402839.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 72d7bdef-ddf3-4463-8c17-b3983431e4f2
X-Ovh-Tracer-Id: 5226145896468417443
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehfedguddvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleelieeigfekfeeitddvieegteeuteekffekleehuefgteetgedvkefghefggfeknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/13/22 17:34, BALATON Zoltan wrote:
> The PLB is shared between 405 and 440 so move it to the shared file.

Should we rename the device to Ppc4xxPlbState ?

Thanks,

C.

> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/ppc405.h         | 11 -----
>   hw/ppc/ppc405_uc.c      | 93 ----------------------------------------
>   hw/ppc/ppc4xx_devs.c    | 94 +++++++++++++++++++++++++++++++++++++++++
>   include/hw/ppc/ppc4xx.h | 11 +++++
>   4 files changed, 105 insertions(+), 104 deletions(-)
> 
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index 31c94e4742..d85c595f9d 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -63,17 +63,6 @@ struct ppc4xx_bd_info_t {
>       uint32_t bi_iic_fast[2];
>   };
>   
> -/* Peripheral local bus arbitrer */
> -#define TYPE_PPC405_PLB "ppc405-plb"
> -OBJECT_DECLARE_SIMPLE_TYPE(Ppc405PlbState, PPC405_PLB);
> -struct Ppc405PlbState {
> -    Ppc4xxDcrDeviceState parent_obj;
> -
> -    uint32_t acr;
> -    uint32_t bear;
> -    uint32_t besr;
> -};
> -
>   /* PLB to OPB bridge */
>   #define TYPE_PPC405_POB "ppc405-pob"
>   OBJECT_DECLARE_SIMPLE_TYPE(Ppc405PobState, PPC405_POB);
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index 922c23346f..3de6c77631 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -137,94 +137,6 @@ ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size)
>   /*****************************************************************************/
>   /* Shared peripherals */
>   
> -/*****************************************************************************/
> -/* Peripheral local bus arbitrer */
> -enum {
> -    PLB3A0_ACR = 0x077,
> -    PLB4A0_ACR = 0x081,
> -    PLB0_BESR  = 0x084,
> -    PLB0_BEAR  = 0x086,
> -    PLB0_ACR   = 0x087,
> -    PLB4A1_ACR = 0x089,
> -};
> -
> -static uint32_t dcr_read_plb(void *opaque, int dcrn)
> -{
> -    Ppc405PlbState *plb = opaque;
> -    uint32_t ret;
> -
> -    switch (dcrn) {
> -    case PLB0_ACR:
> -        ret = plb->acr;
> -        break;
> -    case PLB0_BEAR:
> -        ret = plb->bear;
> -        break;
> -    case PLB0_BESR:
> -        ret = plb->besr;
> -        break;
> -    default:
> -        /* Avoid gcc warning */
> -        ret = 0;
> -        break;
> -    }
> -
> -    return ret;
> -}
> -
> -static void dcr_write_plb(void *opaque, int dcrn, uint32_t val)
> -{
> -    Ppc405PlbState *plb = opaque;
> -
> -    switch (dcrn) {
> -    case PLB0_ACR:
> -        /* We don't care about the actual parameters written as
> -         * we don't manage any priorities on the bus
> -         */
> -        plb->acr = val & 0xF8000000;
> -        break;
> -    case PLB0_BEAR:
> -        /* Read only */
> -        break;
> -    case PLB0_BESR:
> -        /* Write-clear */
> -        plb->besr &= ~val;
> -        break;
> -    }
> -}
> -
> -static void ppc405_plb_reset(DeviceState *dev)
> -{
> -    Ppc405PlbState *plb = PPC405_PLB(dev);
> -
> -    plb->acr = 0x00000000;
> -    plb->bear = 0x00000000;
> -    plb->besr = 0x00000000;
> -}
> -
> -static void ppc405_plb_realize(DeviceState *dev, Error **errp)
> -{
> -    Ppc405PlbState *plb = PPC405_PLB(dev);
> -    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
> -
> -    ppc4xx_dcr_register(dcr, PLB3A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
> -    ppc4xx_dcr_register(dcr, PLB4A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
> -    ppc4xx_dcr_register(dcr, PLB0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
> -    ppc4xx_dcr_register(dcr, PLB0_BEAR, plb, &dcr_read_plb, &dcr_write_plb);
> -    ppc4xx_dcr_register(dcr, PLB0_BESR, plb, &dcr_read_plb, &dcr_write_plb);
> -    ppc4xx_dcr_register(dcr, PLB4A1_ACR, plb, &dcr_read_plb, &dcr_write_plb);
> -}
> -
> -static void ppc405_plb_class_init(ObjectClass *oc, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(oc);
> -
> -    dc->realize = ppc405_plb_realize;
> -    dc->reset = ppc405_plb_reset;
> -    /* Reason: only works as function of a ppc4xx SoC */
> -    dc->user_creatable = false;
> -}
> -
>   /*****************************************************************************/
>   /* PLB to OPB bridge */
>   enum {
> @@ -1535,11 +1447,6 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
>   
>   static const TypeInfo ppc405_types[] = {
>       {
> -        .name           = TYPE_PPC405_PLB,
> -        .parent         = TYPE_PPC4xx_DCR_DEVICE,
> -        .instance_size  = sizeof(Ppc405PlbState),
> -        .class_init     = ppc405_plb_class_init,
> -    }, {
>           .name           = TYPE_PPC405_POB,
>           .parent         = TYPE_PPC4xx_DCR_DEVICE,
>           .instance_size  = sizeof(Ppc405PobState),
> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
> index 7d40c1b68a..843d759b1b 100644
> --- a/hw/ppc/ppc4xx_devs.c
> +++ b/hw/ppc/ppc4xx_devs.c
> @@ -658,6 +658,95 @@ static void ppc4xx_mal_class_init(ObjectClass *oc, void *data)
>       device_class_set_props(dc, ppc4xx_mal_properties);
>   }
>   
> +/*****************************************************************************/
> +/* Peripheral local bus arbitrer */
> +enum {
> +    PLB3A0_ACR = 0x077,
> +    PLB4A0_ACR = 0x081,
> +    PLB0_BESR  = 0x084,
> +    PLB0_BEAR  = 0x086,
> +    PLB0_ACR   = 0x087,
> +    PLB4A1_ACR = 0x089,
> +};
> +
> +static uint32_t dcr_read_plb(void *opaque, int dcrn)
> +{
> +    Ppc405PlbState *plb = opaque;
> +    uint32_t ret;
> +
> +    switch (dcrn) {
> +    case PLB0_ACR:
> +        ret = plb->acr;
> +        break;
> +    case PLB0_BEAR:
> +        ret = plb->bear;
> +        break;
> +    case PLB0_BESR:
> +        ret = plb->besr;
> +        break;
> +    default:
> +        /* Avoid gcc warning */
> +        ret = 0;
> +        break;
> +    }
> +
> +    return ret;
> +}
> +
> +static void dcr_write_plb(void *opaque, int dcrn, uint32_t val)
> +{
> +    Ppc405PlbState *plb = opaque;
> +
> +    switch (dcrn) {
> +    case PLB0_ACR:
> +        /*
> +         * We don't care about the actual parameters written as
> +         * we don't manage any priorities on the bus
> +         */
> +        plb->acr = val & 0xF8000000;
> +        break;
> +    case PLB0_BEAR:
> +        /* Read only */
> +        break;
> +    case PLB0_BESR:
> +        /* Write-clear */
> +        plb->besr &= ~val;
> +        break;
> +    }
> +}
> +
> +static void ppc405_plb_reset(DeviceState *dev)
> +{
> +    Ppc405PlbState *plb = PPC405_PLB(dev);
> +
> +    plb->acr = 0x00000000;
> +    plb->bear = 0x00000000;
> +    plb->besr = 0x00000000;
> +}
> +
> +static void ppc405_plb_realize(DeviceState *dev, Error **errp)
> +{
> +    Ppc405PlbState *plb = PPC405_PLB(dev);
> +    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
> +
> +    ppc4xx_dcr_register(dcr, PLB3A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
> +    ppc4xx_dcr_register(dcr, PLB4A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
> +    ppc4xx_dcr_register(dcr, PLB0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
> +    ppc4xx_dcr_register(dcr, PLB0_BEAR, plb, &dcr_read_plb, &dcr_write_plb);
> +    ppc4xx_dcr_register(dcr, PLB0_BESR, plb, &dcr_read_plb, &dcr_write_plb);
> +    ppc4xx_dcr_register(dcr, PLB4A1_ACR, plb, &dcr_read_plb, &dcr_write_plb);
> +}
> +
> +static void ppc405_plb_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = ppc405_plb_realize;
> +    dc->reset = ppc405_plb_reset;
> +    /* Reason: only works as function of a ppc4xx SoC */
> +    dc->user_creatable = false;
> +}
> +
>   /* PPC4xx_DCR_DEVICE */
>   
>   void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn, void *opaque,
> @@ -694,6 +783,11 @@ static const TypeInfo ppc4xx_types[] = {
>           .instance_size  = sizeof(Ppc4xxMalState),
>           .instance_finalize = ppc4xx_mal_finalize,
>           .class_init     = ppc4xx_mal_class_init,
> +    }, {
> +        .name           = TYPE_PPC405_PLB,
> +        .parent         = TYPE_PPC4xx_DCR_DEVICE,
> +        .instance_size  = sizeof(Ppc405PlbState),
> +        .class_init     = ppc405_plb_class_init,
>       }, {
>           .name           = TYPE_PPC4xx_DCR_DEVICE,
>           .parent         = TYPE_SYS_BUS_DEVICE,
> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
> index f40bd49bc7..e696e159f3 100644
> --- a/include/hw/ppc/ppc4xx.h
> +++ b/include/hw/ppc/ppc4xx.h
> @@ -83,4 +83,15 @@ struct Ppc4xxMalState {
>       uint8_t  rxcnum;
>   };
>   
> +/* Peripheral local bus arbitrer */
> +#define TYPE_PPC405_PLB "ppc405-plb"
> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405PlbState, PPC405_PLB);
> +struct Ppc405PlbState {
> +    Ppc4xxDcrDeviceState parent_obj;
> +
> +    uint32_t acr;
> +    uint32_t bear;
> +    uint32_t besr;
> +};
> +
>   #endif /* PPC4XX_H */


