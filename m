Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE11595417
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 09:45:34 +0200 (CEST)
Received: from localhost ([::1]:45220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNrGX-0007bv-PK
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 03:45:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oNr93-0001Qf-Ra
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 03:37:49 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:41615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oNr8x-00052f-T4
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 03:37:49 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.227])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 7B55D11E8E7E5;
 Tue, 16 Aug 2022 09:37:40 +0200 (CEST)
Received: from kaod.org (37.59.142.99) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 16 Aug
 2022 09:37:39 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G00334409749-b4b2-46a4-b6e8-eb90e05bc53a,
 F9C770E940B196DD2347A7F94772438AA2E7EC4E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <346db6e4-0c6e-bcc6-f746-e773ec29a0bc@kaod.org>
Date: Tue, 16 Aug 2022 09:35:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 13/22] ppc4xx: Move EBC model to ppc4xx_devs.c
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <cover.1660402839.git.balaton@eik.bme.hu>
 <b0f82bc6a7a8e6fb2cb79b98336b75b31136c7dc.1660402839.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <b0f82bc6a7a8e6fb2cb79b98336b75b31136c7dc.1660402839.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 8d598514-19fd-4903-867a-4e7d7f2835d9
X-Ovh-Tracer-Id: 5279344664519609251
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehfedguddvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleelieeigfekfeeitddvieegteeuteekffekleehuefgteetgedvkefghefggfeknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> The EBC is shared between 405 and 440 so move it to shared file.

Should we rename the device to Ppc4xxEbcState ?

Thanks,

C.


> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/ppc405.h         |  15 ----
>   hw/ppc/ppc405_uc.c      | 191 ----------------------------------------
>   hw/ppc/ppc4xx_devs.c    | 191 ++++++++++++++++++++++++++++++++++++++++
>   include/hw/ppc/ppc4xx.h |  15 ++++
>   4 files changed, 206 insertions(+), 206 deletions(-)
> 
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index d85c595f9d..c0251f0894 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -85,21 +85,6 @@ struct Ppc405OpbaState {
>       uint8_t pr;
>   };
>   
> -/* Peripheral controller */
> -#define TYPE_PPC405_EBC "ppc405-ebc"
> -OBJECT_DECLARE_SIMPLE_TYPE(Ppc405EbcState, PPC405_EBC);
> -struct Ppc405EbcState {
> -    Ppc4xxDcrDeviceState parent_obj;
> -
> -    uint32_t addr;
> -    uint32_t bcr[8];
> -    uint32_t bap[8];
> -    uint32_t bear;
> -    uint32_t besr0;
> -    uint32_t besr1;
> -    uint32_t cfg;
> -};
> -
>   /* DMA controller */
>   #define TYPE_PPC405_DMA "ppc405-dma"
>   OBJECT_DECLARE_SIMPLE_TYPE(Ppc405DmaState, PPC405_DMA);
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index 3de6c77631..01625e3237 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -299,192 +299,6 @@ static void ppc405_opba_class_init(ObjectClass *oc, void *data)
>   /* Code decompression controller */
>   /* XXX: TODO */
>   
> -/*****************************************************************************/
> -/* Peripheral controller */
> -enum {
> -    EBC0_CFGADDR = 0x012,
> -    EBC0_CFGDATA = 0x013,
> -};
> -
> -static uint32_t dcr_read_ebc(void *opaque, int dcrn)
> -{
> -    Ppc405EbcState *ebc = opaque;
> -    uint32_t ret;
> -
> -    switch (dcrn) {
> -    case EBC0_CFGADDR:
> -        ret = ebc->addr;
> -        break;
> -    case EBC0_CFGDATA:
> -        switch (ebc->addr) {
> -        case 0x00: /* B0CR */
> -            ret = ebc->bcr[0];
> -            break;
> -        case 0x01: /* B1CR */
> -            ret = ebc->bcr[1];
> -            break;
> -        case 0x02: /* B2CR */
> -            ret = ebc->bcr[2];
> -            break;
> -        case 0x03: /* B3CR */
> -            ret = ebc->bcr[3];
> -            break;
> -        case 0x04: /* B4CR */
> -            ret = ebc->bcr[4];
> -            break;
> -        case 0x05: /* B5CR */
> -            ret = ebc->bcr[5];
> -            break;
> -        case 0x06: /* B6CR */
> -            ret = ebc->bcr[6];
> -            break;
> -        case 0x07: /* B7CR */
> -            ret = ebc->bcr[7];
> -            break;
> -        case 0x10: /* B0AP */
> -            ret = ebc->bap[0];
> -            break;
> -        case 0x11: /* B1AP */
> -            ret = ebc->bap[1];
> -            break;
> -        case 0x12: /* B2AP */
> -            ret = ebc->bap[2];
> -            break;
> -        case 0x13: /* B3AP */
> -            ret = ebc->bap[3];
> -            break;
> -        case 0x14: /* B4AP */
> -            ret = ebc->bap[4];
> -            break;
> -        case 0x15: /* B5AP */
> -            ret = ebc->bap[5];
> -            break;
> -        case 0x16: /* B6AP */
> -            ret = ebc->bap[6];
> -            break;
> -        case 0x17: /* B7AP */
> -            ret = ebc->bap[7];
> -            break;
> -        case 0x20: /* BEAR */
> -            ret = ebc->bear;
> -            break;
> -        case 0x21: /* BESR0 */
> -            ret = ebc->besr0;
> -            break;
> -        case 0x22: /* BESR1 */
> -            ret = ebc->besr1;
> -            break;
> -        case 0x23: /* CFG */
> -            ret = ebc->cfg;
> -            break;
> -        default:
> -            ret = 0x00000000;
> -            break;
> -        }
> -        break;
> -    default:
> -        ret = 0x00000000;
> -        break;
> -    }
> -
> -    return ret;
> -}
> -
> -static void dcr_write_ebc(void *opaque, int dcrn, uint32_t val)
> -{
> -    Ppc405EbcState *ebc = opaque;
> -
> -    switch (dcrn) {
> -    case EBC0_CFGADDR:
> -        ebc->addr = val;
> -        break;
> -    case EBC0_CFGDATA:
> -        switch (ebc->addr) {
> -        case 0x00: /* B0CR */
> -            break;
> -        case 0x01: /* B1CR */
> -            break;
> -        case 0x02: /* B2CR */
> -            break;
> -        case 0x03: /* B3CR */
> -            break;
> -        case 0x04: /* B4CR */
> -            break;
> -        case 0x05: /* B5CR */
> -            break;
> -        case 0x06: /* B6CR */
> -            break;
> -        case 0x07: /* B7CR */
> -            break;
> -        case 0x10: /* B0AP */
> -            break;
> -        case 0x11: /* B1AP */
> -            break;
> -        case 0x12: /* B2AP */
> -            break;
> -        case 0x13: /* B3AP */
> -            break;
> -        case 0x14: /* B4AP */
> -            break;
> -        case 0x15: /* B5AP */
> -            break;
> -        case 0x16: /* B6AP */
> -            break;
> -        case 0x17: /* B7AP */
> -            break;
> -        case 0x20: /* BEAR */
> -            break;
> -        case 0x21: /* BESR0 */
> -            break;
> -        case 0x22: /* BESR1 */
> -            break;
> -        case 0x23: /* CFG */
> -            break;
> -        default:
> -            break;
> -        }
> -        break;
> -    default:
> -        break;
> -    }
> -}
> -
> -static void ppc405_ebc_reset(DeviceState *dev)
> -{
> -    Ppc405EbcState *ebc = PPC405_EBC(dev);
> -    int i;
> -
> -    ebc->addr = 0x00000000;
> -    ebc->bap[0] = 0x7F8FFE80;
> -    ebc->bcr[0] = 0xFFE28000;
> -    for (i = 0; i < 8; i++) {
> -        ebc->bap[i] = 0x00000000;
> -        ebc->bcr[i] = 0x00000000;
> -    }
> -    ebc->besr0 = 0x00000000;
> -    ebc->besr1 = 0x00000000;
> -    ebc->cfg = 0x80400000;
> -}
> -
> -static void ppc405_ebc_realize(DeviceState *dev, Error **errp)
> -{
> -    Ppc405EbcState *ebc = PPC405_EBC(dev);
> -    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
> -
> -    ppc4xx_dcr_register(dcr, EBC0_CFGADDR, ebc, &dcr_read_ebc, &dcr_write_ebc);
> -    ppc4xx_dcr_register(dcr, EBC0_CFGDATA, ebc, &dcr_read_ebc, &dcr_write_ebc);
> -}
> -
> -static void ppc405_ebc_class_init(ObjectClass *oc, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(oc);
> -
> -    dc->realize = ppc405_ebc_realize;
> -    dc->reset = ppc405_ebc_reset;
> -    /* Reason: only works as function of a ppc4xx SoC */
> -    dc->user_creatable = false;
> -}
> -
>   /*****************************************************************************/
>   /* DMA controller */
>   enum {
> @@ -1456,11 +1270,6 @@ static const TypeInfo ppc405_types[] = {
>           .parent         = TYPE_SYS_BUS_DEVICE,
>           .instance_size  = sizeof(Ppc405OpbaState),
>           .class_init     = ppc405_opba_class_init,
> -    }, {
> -        .name           = TYPE_PPC405_EBC,
> -        .parent         = TYPE_PPC4xx_DCR_DEVICE,
> -        .instance_size  = sizeof(Ppc405EbcState),
> -        .class_init     = ppc405_ebc_class_init,
>       }, {
>           .name           = TYPE_PPC405_DMA,
>           .parent         = TYPE_PPC4xx_DCR_DEVICE,
> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
> index 843d759b1b..96941ae040 100644
> --- a/hw/ppc/ppc4xx_devs.c
> +++ b/hw/ppc/ppc4xx_devs.c
> @@ -747,6 +747,192 @@ static void ppc405_plb_class_init(ObjectClass *oc, void *data)
>       dc->user_creatable = false;
>   }
>   
> +/*****************************************************************************/
> +/* Peripheral controller */
> +enum {
> +    EBC0_CFGADDR = 0x012,
> +    EBC0_CFGDATA = 0x013,
> +};
> +
> +static uint32_t dcr_read_ebc(void *opaque, int dcrn)
> +{
> +    Ppc405EbcState *ebc = opaque;
> +    uint32_t ret;
> +
> +    switch (dcrn) {
> +    case EBC0_CFGADDR:
> +        ret = ebc->addr;
> +        break;
> +    case EBC0_CFGDATA:
> +        switch (ebc->addr) {
> +        case 0x00: /* B0CR */
> +            ret = ebc->bcr[0];
> +            break;
> +        case 0x01: /* B1CR */
> +            ret = ebc->bcr[1];
> +            break;
> +        case 0x02: /* B2CR */
> +            ret = ebc->bcr[2];
> +            break;
> +        case 0x03: /* B3CR */
> +            ret = ebc->bcr[3];
> +            break;
> +        case 0x04: /* B4CR */
> +            ret = ebc->bcr[4];
> +            break;
> +        case 0x05: /* B5CR */
> +            ret = ebc->bcr[5];
> +            break;
> +        case 0x06: /* B6CR */
> +            ret = ebc->bcr[6];
> +            break;
> +        case 0x07: /* B7CR */
> +            ret = ebc->bcr[7];
> +            break;
> +        case 0x10: /* B0AP */
> +            ret = ebc->bap[0];
> +            break;
> +        case 0x11: /* B1AP */
> +            ret = ebc->bap[1];
> +            break;
> +        case 0x12: /* B2AP */
> +            ret = ebc->bap[2];
> +            break;
> +        case 0x13: /* B3AP */
> +            ret = ebc->bap[3];
> +            break;
> +        case 0x14: /* B4AP */
> +            ret = ebc->bap[4];
> +            break;
> +        case 0x15: /* B5AP */
> +            ret = ebc->bap[5];
> +            break;
> +        case 0x16: /* B6AP */
> +            ret = ebc->bap[6];
> +            break;
> +        case 0x17: /* B7AP */
> +            ret = ebc->bap[7];
> +            break;
> +        case 0x20: /* BEAR */
> +            ret = ebc->bear;
> +            break;
> +        case 0x21: /* BESR0 */
> +            ret = ebc->besr0;
> +            break;
> +        case 0x22: /* BESR1 */
> +            ret = ebc->besr1;
> +            break;
> +        case 0x23: /* CFG */
> +            ret = ebc->cfg;
> +            break;
> +        default:
> +            ret = 0x00000000;
> +            break;
> +        }
> +        break;
> +    default:
> +        ret = 0x00000000;
> +        break;
> +    }
> +
> +    return ret;
> +}
> +
> +static void dcr_write_ebc(void *opaque, int dcrn, uint32_t val)
> +{
> +    Ppc405EbcState *ebc = opaque;
> +
> +    switch (dcrn) {
> +    case EBC0_CFGADDR:
> +        ebc->addr = val;
> +        break;
> +    case EBC0_CFGDATA:
> +        switch (ebc->addr) {
> +        case 0x00: /* B0CR */
> +            break;
> +        case 0x01: /* B1CR */
> +            break;
> +        case 0x02: /* B2CR */
> +            break;
> +        case 0x03: /* B3CR */
> +            break;
> +        case 0x04: /* B4CR */
> +            break;
> +        case 0x05: /* B5CR */
> +            break;
> +        case 0x06: /* B6CR */
> +            break;
> +        case 0x07: /* B7CR */
> +            break;
> +        case 0x10: /* B0AP */
> +            break;
> +        case 0x11: /* B1AP */
> +            break;
> +        case 0x12: /* B2AP */
> +            break;
> +        case 0x13: /* B3AP */
> +            break;
> +        case 0x14: /* B4AP */
> +            break;
> +        case 0x15: /* B5AP */
> +            break;
> +        case 0x16: /* B6AP */
> +            break;
> +        case 0x17: /* B7AP */
> +            break;
> +        case 0x20: /* BEAR */
> +            break;
> +        case 0x21: /* BESR0 */
> +            break;
> +        case 0x22: /* BESR1 */
> +            break;
> +        case 0x23: /* CFG */
> +            break;
> +        default:
> +            break;
> +        }
> +        break;
> +    default:
> +        break;
> +    }
> +}
> +
> +static void ppc405_ebc_reset(DeviceState *dev)
> +{
> +    Ppc405EbcState *ebc = PPC405_EBC(dev);
> +    int i;
> +
> +    ebc->addr = 0x00000000;
> +    ebc->bap[0] = 0x7F8FFE80;
> +    ebc->bcr[0] = 0xFFE28000;
> +    for (i = 0; i < 8; i++) {
> +        ebc->bap[i] = 0x00000000;
> +        ebc->bcr[i] = 0x00000000;
> +    }
> +    ebc->besr0 = 0x00000000;
> +    ebc->besr1 = 0x00000000;
> +    ebc->cfg = 0x80400000;
> +}
> +
> +static void ppc405_ebc_realize(DeviceState *dev, Error **errp)
> +{
> +    Ppc405EbcState *ebc = PPC405_EBC(dev);
> +    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
> +
> +    ppc4xx_dcr_register(dcr, EBC0_CFGADDR, ebc, &dcr_read_ebc, &dcr_write_ebc);
> +    ppc4xx_dcr_register(dcr, EBC0_CFGDATA, ebc, &dcr_read_ebc, &dcr_write_ebc);
> +}
> +
> +static void ppc405_ebc_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = ppc405_ebc_realize;
> +    dc->reset = ppc405_ebc_reset;
> +    /* Reason: only works as function of a ppc4xx SoC */
> +    dc->user_creatable = false;
> +}
> +
>   /* PPC4xx_DCR_DEVICE */
>   
>   void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn, void *opaque,
> @@ -788,6 +974,11 @@ static const TypeInfo ppc4xx_types[] = {
>           .parent         = TYPE_PPC4xx_DCR_DEVICE,
>           .instance_size  = sizeof(Ppc405PlbState),
>           .class_init     = ppc405_plb_class_init,
> +    }, {
> +        .name           = TYPE_PPC405_EBC,
> +        .parent         = TYPE_PPC4xx_DCR_DEVICE,
> +        .instance_size  = sizeof(Ppc405EbcState),
> +        .class_init     = ppc405_ebc_class_init,
>       }, {
>           .name           = TYPE_PPC4xx_DCR_DEVICE,
>           .parent         = TYPE_SYS_BUS_DEVICE,
> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
> index e696e159f3..6e361cf254 100644
> --- a/include/hw/ppc/ppc4xx.h
> +++ b/include/hw/ppc/ppc4xx.h
> @@ -94,4 +94,19 @@ struct Ppc405PlbState {
>       uint32_t besr;
>   };
>   
> +/* Peripheral controller */
> +#define TYPE_PPC405_EBC "ppc405-ebc"
> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405EbcState, PPC405_EBC);
> +struct Ppc405EbcState {
> +    Ppc4xxDcrDeviceState parent_obj;
> +
> +    uint32_t addr;
> +    uint32_t bcr[8];
> +    uint32_t bap[8];
> +    uint32_t bear;
> +    uint32_t besr0;
> +    uint32_t besr1;
> +    uint32_t cfg;
> +};
> +
>   #endif /* PPC4XX_H */


