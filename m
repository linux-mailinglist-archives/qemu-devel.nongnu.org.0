Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6575B595B22
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 14:01:55 +0200 (CEST)
Received: from localhost ([::1]:58224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNvGb-0004TI-PM
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 08:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oNvDz-0001om-V8; Tue, 16 Aug 2022 07:59:11 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:48425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oNvDw-0005xM-PH; Tue, 16 Aug 2022 07:59:11 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4CAA674632B;
 Tue, 16 Aug 2022 13:59:01 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id EDA4E746324; Tue, 16 Aug 2022 13:59:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id EC35E7462D3;
 Tue, 16 Aug 2022 13:59:00 +0200 (CEST)
Date: Tue, 16 Aug 2022 13:59:00 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 21/22] ppc4xx: Drop empty default cases
In-Reply-To: <79b80025-a5e1-8293-5d93-01450b94b16b@kaod.org>
Message-ID: <1429a6f1-3b97-6eac-fae-b24fb3de34d@eik.bme.hu>
References: <cover.1660402839.git.balaton@eik.bme.hu>
 <011b7081d56ae856c1862bbfe92207ea8fe52399.1660402839.git.balaton@eik.bme.hu>
 <79b80025-a5e1-8293-5d93-01450b94b16b@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-2028902364-1660651140=:43945"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-2028902364-1660651140=:43945
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 16 Aug 2022, Cédric Le Goater wrote:
> On 8/13/22 17:34, BALATON Zoltan wrote:
>> Remove default case labels that do nothing or only there to set a
>> default value that could easily be done at the variable definition
>> instead.
>
> May be instead, the default case labels deserve a LOG_GUEST_ERROR or
> a UNIMP or even g_assert_not_reached() ?

g_assert_not_reached() is probably too much as a lot of these models may 
be incomplete so I think that could cause crashes where it works now but 
adding LOG_UNIMP could be useful to detect missing pieces.

Regards,
BALATON Zoltan

> C.
>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/ppc/ppc405_boards.c |  7 +------
>>   hw/ppc/ppc405_uc.c     | 29 +++++------------------------
>>   hw/ppc/ppc440_uc.c     | 27 ---------------------------
>>   hw/ppc/ppc4xx_devs.c   | 31 ++++---------------------------
>>   4 files changed, 10 insertions(+), 84 deletions(-)
>> 
>> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
>> index 083f12b23e..a876b4af85 100644
>> --- a/hw/ppc/ppc405_boards.c
>> +++ b/hw/ppc/ppc405_boards.c
>> @@ -401,7 +401,7 @@ struct Ref405epFpgaState {
>>   static uint64_t ref405ep_fpga_readb(void *opaque, hwaddr addr, unsigned 
>> size)
>>   {
>>       Ref405epFpgaState *fpga = opaque;
>> -    uint32_t ret;
>> +    uint32_t ret = 0;
>>         switch (addr) {
>>       case 0x0:
>> @@ -410,9 +410,6 @@ static uint64_t ref405ep_fpga_readb(void *opaque, 
>> hwaddr addr, unsigned size)
>>       case 0x1:
>>           ret = fpga->reg1;
>>           break;
>> -    default:
>> -        ret = 0;
>> -        break;
>>       }
>>         return ret;
>> @@ -430,8 +427,6 @@ static void ref405ep_fpga_writeb(void *opaque, hwaddr 
>> addr, uint64_t value,
>>       case 0x1:
>>           fpga->reg1 = value;
>>           break;
>> -    default:
>> -        break;
>>       }
>>   }
>>   diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
>> index b13026200f..6c84d87330 100644
>> --- a/hw/ppc/ppc405_uc.c
>> +++ b/hw/ppc/ppc405_uc.c
>> @@ -56,7 +56,7 @@ enum {
>>   static uint32_t dcr_read_pob(void *opaque, int dcrn)
>>   {
>>       Ppc405PobState *pob = opaque;
>> -    uint32_t ret;
>> +    uint32_t ret = 0;
>>         switch (dcrn) {
>>       case POB0_BEAR:
>> @@ -68,10 +68,6 @@ static uint32_t dcr_read_pob(void *opaque, int dcrn)
>>       case POB0_BESR1:
>>           ret = pob->besr1;
>>           break;
>> -    default:
>> -        /* Avoid gcc warning */
>> -        ret = 0;
>> -        break;
>>       }
>>         return ret;
>> @@ -131,7 +127,7 @@ static void ppc405_pob_class_init(ObjectClass *oc, void 
>> *data)
>>   static uint64_t opba_readb(void *opaque, hwaddr addr, unsigned size)
>>   {
>>       Ppc405OpbaState *opba = opaque;
>> -    uint32_t ret;
>> +    uint32_t ret = 0;
>>         switch (addr) {
>>       case 0x00:
>> @@ -140,9 +136,6 @@ static uint64_t opba_readb(void *opaque, hwaddr addr, 
>> unsigned size)
>>       case 0x01:
>>           ret = opba->pr;
>>           break;
>> -    default:
>> -        ret = 0x00;
>> -        break;
>>       }
>>         trace_opba_readb(addr, ret);
>> @@ -163,8 +156,6 @@ static void opba_writeb(void *opaque, hwaddr addr, 
>> uint64_t value,
>>       case 0x01:
>>           opba->pr = value & 0xFF;
>>           break;
>> -    default:
>> -        break;
>>       }
>>   }
>>   static const MemoryRegionOps opba_ops = {
>> @@ -403,7 +394,7 @@ static void ocm_update_mappings(Ppc405OcmState *ocm,
>>   static uint32_t dcr_read_ocm(void *opaque, int dcrn)
>>   {
>>       Ppc405OcmState *ocm = opaque;
>> -    uint32_t ret;
>> +    uint32_t ret = 0;
>>         switch (dcrn) {
>>       case OCM0_ISARC:
>> @@ -418,9 +409,6 @@ static uint32_t dcr_read_ocm(void *opaque, int dcrn)
>>       case OCM0_DSACNTL:
>>           ret = ocm->dsacntl;
>>           break;
>> -    default:
>> -        ret = 0;
>> -        break;
>>       }
>>         return ret;
>> @@ -556,7 +544,7 @@ static void ppc4xx_gpt_compute_timer(Ppc405GptState 
>> *gpt)
>>   static uint64_t ppc4xx_gpt_read(void *opaque, hwaddr addr, unsigned size)
>>   {
>>       Ppc405GptState *gpt = opaque;
>> -    uint32_t ret;
>> +    uint32_t ret = -1;
>>       int idx;
>>         trace_ppc4xx_gpt_read(addr, size);
>> @@ -598,9 +586,6 @@ static uint64_t ppc4xx_gpt_read(void *opaque, hwaddr 
>> addr, unsigned size)
>>           idx = (addr - 0xC0) >> 2;
>>           ret = gpt->mask[idx];
>>           break;
>> -    default:
>> -        ret = -1;
>> -        break;
>>       }
>>         return ret;
>> @@ -844,7 +829,7 @@ static void ppc405ep_compute_clocks(Ppc405CpcState 
>> *cpc)
>>   static uint32_t dcr_read_epcpc(void *opaque, int dcrn)
>>   {
>>       Ppc405CpcState *cpc = opaque;
>> -    uint32_t ret;
>> +    uint32_t ret = 0;
>>         switch (dcrn) {
>>       case PPC405EP_CPC0_BOOT:
>> @@ -871,10 +856,6 @@ static uint32_t dcr_read_epcpc(void *opaque, int dcrn)
>>       case PPC405EP_CPC0_PCI:
>>           ret = cpc->pci;
>>           break;
>> -    default:
>> -        /* Avoid gcc warning */
>> -        ret = 0;
>> -        break;
>>       }
>>         return ret;
>> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
>> index 11fdb88c22..b390672bce 100644
>> --- a/hw/ppc/ppc440_uc.c
>> +++ b/hw/ppc/ppc440_uc.c
>> @@ -147,9 +147,6 @@ static uint32_t dcr_read_l2sram(void *opaque, int dcrn)
>>       case DCR_ISRAM0_DPC:
>>           ret = l2sram->isram0[dcrn - DCR_ISRAM0_BASE];
>>           break;
>> -
>> -    default:
>> -        break;
>>       }
>>         return ret;
>> @@ -304,12 +301,8 @@ static uint32_t dcr_read_cpr(void *opaque, int dcrn)
>>           case CPR0_AHBD:
>>               ret = (1 << 24);
>>               break;
>> -        default:
>> -            break;
>>           }
>>           break;
>> -    default:
>> -        break;
>>       }
>>         return ret;
>> @@ -325,8 +318,6 @@ static void dcr_write_cpr(void *opaque, int dcrn, 
>> uint32_t val)
>>           break;
>>       case CPR0_CFGDATA:
>>           break;
>> -    default:
>> -        break;
>>       }
>>   }
>>   @@ -421,12 +412,8 @@ static uint32_t dcr_read_sdr(void *opaque, int dcrn)
>>           case PESDR1_LOOP:
>>               ret = 1 << 12;
>>               break;
>> -        default:
>> -            break;
>>           }
>>           break;
>> -    default:
>> -        break;
>>       }
>>         return ret;
>> @@ -444,12 +431,8 @@ static void dcr_write_sdr(void *opaque, int dcrn, 
>> uint32_t val)
>>           switch (sdr->addr) {
>>           case 0x00: /* B0CR */
>>               break;
>> -        default:
>> -            break;
>>           }
>>           break;
>> -    default:
>> -        break;
>>       }
>>   }
>>   @@ -646,12 +629,8 @@ static uint32_t dcr_read_sdram(void *opaque, int 
>> dcrn)
>>           case 0xE1: /* SDR0_DDR0 */
>>               ret = SDR0_DDR0_DDRM_ENCODE(1) | SDR0_DDR0_DDRM_DDR1;
>>               break;
>> -        default:
>> -            break;
>>           }
>>           break;
>> -    default:
>> -        break;
>>       }
>>         return ret;
>> @@ -679,12 +658,8 @@ static void dcr_write_sdram(void *opaque, int dcrn, 
>> uint32_t val)
>>           switch (sdram->addr) {
>>           case 0x00: /* B0CR */
>>               break;
>> -        default:
>> -            break;
>>           }
>>           break;
>> -    default:
>> -        break;
>>       }
>>   }
>>   @@ -760,8 +735,6 @@ static uint32_t dcr_read_ahb(void *opaque, int dcrn)
>>       case AHB_BOT:
>>           ret = ahb->bot;
>>           break;
>> -    default:
>> -        break;
>>       }
>>         return ret;
>> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
>> index 49793b56cd..f5806f06e7 100644
>> --- a/hw/ppc/ppc4xx_devs.c
>> +++ b/hw/ppc/ppc4xx_devs.c
>> @@ -182,7 +182,7 @@ static void sdram_unmap_bcr (ppc4xx_sdram_t *sdram)
>>   static uint32_t dcr_read_sdram (void *opaque, int dcrn)
>>   {
>>       ppc4xx_sdram_t *sdram;
>> -    uint32_t ret;
>> +    uint32_t ret = 0;
>>         sdram = opaque;
>>       switch (dcrn) {
>> @@ -238,10 +238,6 @@ static uint32_t dcr_read_sdram (void *opaque, int 
>> dcrn)
>>               break;
>>           }
>>           break;
>> -    default:
>> -        /* Avoid gcc warning */
>> -        ret = 0x00000000;
>> -        break;
>>       }
>>         return ret;
>> @@ -321,8 +317,6 @@ static void dcr_write_sdram (void *opaque, int dcrn, 
>> uint32_t val)
>>                   qemu_irq_lower(sdram->irq);
>>               sdram->eccesr = val;
>>               break;
>> -        default: /* Error */
>> -            break;
>>           }
>>           break;
>>       }
>> @@ -476,7 +470,7 @@ static void ppc4xx_mal_reset(DeviceState *dev)
>>   static uint32_t dcr_read_mal(void *opaque, int dcrn)
>>   {
>>       Ppc4xxMalState *mal = opaque;
>> -    uint32_t ret;
>> +    uint32_t ret = 0;
>>         switch (dcrn) {
>>       case MAL0_CFG:
>> @@ -512,9 +506,6 @@ static uint32_t dcr_read_mal(void *opaque, int dcrn)
>>       case MAL0_RXDEIR:
>>           ret = mal->rxdeir;
>>           break;
>> -    default:
>> -        ret = 0;
>> -        break;
>>       }
>>       if (dcrn >= MAL0_TXCTP0R && dcrn < MAL0_TXCTP0R + mal->txcnum) {
>>           ret = mal->txctpr[dcrn - MAL0_TXCTP0R];
>> @@ -671,7 +662,7 @@ enum {
>>   static uint32_t dcr_read_plb(void *opaque, int dcrn)
>>   {
>>       Ppc405PlbState *plb = opaque;
>> -    uint32_t ret;
>> +    uint32_t ret = 0;
>>         switch (dcrn) {
>>       case PLB0_ACR:
>> @@ -683,10 +674,6 @@ static uint32_t dcr_read_plb(void *opaque, int dcrn)
>>       case PLB0_BESR:
>>           ret = plb->besr;
>>           break;
>> -    default:
>> -        /* Avoid gcc warning */
>> -        ret = 0;
>> -        break;
>>       }
>>         return ret;
>> @@ -756,7 +743,7 @@ enum {
>>   static uint32_t dcr_read_ebc(void *opaque, int dcrn)
>>   {
>>       Ppc405EbcState *ebc = opaque;
>> -    uint32_t ret;
>> +    uint32_t ret = 0;
>>         switch (dcrn) {
>>       case EBC0_CFGADDR:
>> @@ -824,14 +811,8 @@ static uint32_t dcr_read_ebc(void *opaque, int dcrn)
>>           case 0x23: /* CFG */
>>               ret = ebc->cfg;
>>               break;
>> -        default:
>> -            ret = 0x00000000;
>> -            break;
>>           }
>>           break;
>> -    default:
>> -        ret = 0x00000000;
>> -        break;
>>       }
>>         return ret;
>> @@ -887,12 +868,8 @@ static void dcr_write_ebc(void *opaque, int dcrn, 
>> uint32_t val)
>>               break;
>>           case 0x23: /* CFG */
>>               break;
>> -        default:
>> -            break;
>>           }
>>           break;
>> -    default:
>> -        break;
>>       }
>>   }
>> 
>
>
>
--3866299591-2028902364-1660651140=:43945--

