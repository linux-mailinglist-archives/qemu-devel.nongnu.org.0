Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A4C35AB98
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 09:10:08 +0200 (CEST)
Received: from localhost ([::1]:38850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lV7kt-00074q-Hw
	for lists+qemu-devel@lfdr.de; Sat, 10 Apr 2021 03:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lV7jy-0006aa-2W
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 03:09:10 -0400
Received: from 9.mo51.mail-out.ovh.net ([46.105.48.137]:47971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lV7jv-0001Fe-Gn
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 03:09:09 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.132])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 6F5F428007D;
 Sat, 10 Apr 2021 09:08:55 +0200 (CEST)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Sat, 10 Apr
 2021 09:08:54 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004b771e90f-ffea-4338-bbb6-79aa8dbdce18,
 7DB109D73D331EFE6E6D278AF4DA1FCDEB920233) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 92.136.227.33
Subject: Re: [PATCH 15/24] aspeed/smc: Add extra controls to request DMA
To: Joel Stanley <joel@jms.id.au>
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-16-clg@kaod.org>
 <CACPK8Xfk9dPXdtr=BZq+9yTrFSYg_pyTX+Gk8JbcomjwVpTmjw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ba185653-d351-05eb-0b56-92e5fb00e77a@kaod.org>
Date: Sat, 10 Apr 2021 09:08:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CACPK8Xfk9dPXdtr=BZq+9yTrFSYg_pyTX+Gk8JbcomjwVpTmjw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 49d78a87-a920-4233-8b50-769d4d3ff1f8
X-Ovh-Tracer-Id: 5694238781912091430
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudekvddgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghu
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/9/21 8:54 AM, Joel Stanley wrote:
> On Wed, 7 Apr 2021 at 17:17, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> The AST2600 SPI controllers have a set of bits to request/grant DMA
>> access. Add a new SMC feature for these controllers and use it to
>> check access to the DMA registers.
> 
> Ah this is why you added the features mask. Makes sense.

Yes. It's a bit redundant with the dma_ctrl() handler but it looks cleaner. 

> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>


Thanks,

C.


>>
>> Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  include/hw/ssi/aspeed_smc.h |  1 +
>>  hw/ssi/aspeed_smc.c         | 74 +++++++++++++++++++++++++++++++++----
>>  2 files changed, 68 insertions(+), 7 deletions(-)
>>
>> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
>> index 07879fd1c4a7..cdaf165300b6 100644
>> --- a/include/hw/ssi/aspeed_smc.h
>> +++ b/include/hw/ssi/aspeed_smc.h
>> @@ -55,6 +55,7 @@ typedef struct AspeedSMCController {
>>                                 const AspeedSegments *seg);
>>      void (*reg_to_segment)(const struct AspeedSMCState *s, uint32_t reg,
>>                             AspeedSegments *seg);
>> +    void (*dma_ctrl)(struct AspeedSMCState *s, uint32_t value);
>>  } AspeedSMCController;
>>
>>  typedef struct AspeedSMCFlash {
>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>> index 4521bbd4864e..189b35637c77 100644
>> --- a/hw/ssi/aspeed_smc.c
>> +++ b/hw/ssi/aspeed_smc.c
>> @@ -127,6 +127,8 @@
>>
>>  /* DMA Control/Status Register */
>>  #define R_DMA_CTRL        (0x80 / 4)
>> +#define   DMA_CTRL_REQUEST      (1 << 31)
>> +#define   DMA_CTRL_GRANT        (1 << 30)
>>  #define   DMA_CTRL_DELAY_MASK   0xf
>>  #define   DMA_CTRL_DELAY_SHIFT  8
>>  #define   DMA_CTRL_FREQ_MASK    0xf
>> @@ -228,6 +230,7 @@ static uint32_t aspeed_smc_segment_to_reg(const AspeedSMCState *s,
>>                                            const AspeedSegments *seg);
>>  static void aspeed_smc_reg_to_segment(const AspeedSMCState *s, uint32_t reg,
>>                                        AspeedSegments *seg);
>> +static void aspeed_smc_dma_ctrl(AspeedSMCState *s, uint32_t value);
>>
>>  /*
>>   * AST2600 definitions
>> @@ -257,7 +260,10 @@ static uint32_t aspeed_2600_smc_segment_to_reg(const AspeedSMCState *s,
>>                                                 const AspeedSegments *seg);
>>  static void aspeed_2600_smc_reg_to_segment(const AspeedSMCState *s,
>>                                             uint32_t reg, AspeedSegments *seg);
>> +static void aspeed_2600_smc_dma_ctrl(AspeedSMCState *s, uint32_t value);
>> +
>>  #define ASPEED_SMC_FEATURE_DMA       0x1
>> +#define ASPEED_SMC_FEATURE_DMA_GRANT 0x2
>>
>>  static inline bool aspeed_smc_has_dma(const AspeedSMCState *s)
>>  {
>> @@ -281,6 +287,7 @@ static const AspeedSMCController controllers[] = {
>>          .nregs             = ASPEED_SMC_R_SMC_MAX,
>>          .segment_to_reg    = aspeed_smc_segment_to_reg,
>>          .reg_to_segment    = aspeed_smc_reg_to_segment,
>> +        .dma_ctrl          = aspeed_smc_dma_ctrl,
>>      }, {
>>          .name              = "aspeed.fmc-ast2400",
>>          .r_conf            = R_CONF,
>> @@ -299,6 +306,7 @@ static const AspeedSMCController controllers[] = {
>>          .nregs             = ASPEED_SMC_R_MAX,
>>          .segment_to_reg    = aspeed_smc_segment_to_reg,
>>          .reg_to_segment    = aspeed_smc_reg_to_segment,
>> +        .dma_ctrl          = aspeed_smc_dma_ctrl,
>>      }, {
>>          .name              = "aspeed.spi1-ast2400",
>>          .r_conf            = R_SPI_CONF,
>> @@ -315,6 +323,7 @@ static const AspeedSMCController controllers[] = {
>>          .nregs             = ASPEED_SMC_R_SPI_MAX,
>>          .segment_to_reg    = aspeed_smc_segment_to_reg,
>>          .reg_to_segment    = aspeed_smc_reg_to_segment,
>> +        .dma_ctrl          = aspeed_smc_dma_ctrl,
>>      }, {
>>          .name              = "aspeed.fmc-ast2500",
>>          .r_conf            = R_CONF,
>> @@ -333,6 +342,7 @@ static const AspeedSMCController controllers[] = {
>>          .nregs             = ASPEED_SMC_R_MAX,
>>          .segment_to_reg    = aspeed_smc_segment_to_reg,
>>          .reg_to_segment    = aspeed_smc_reg_to_segment,
>> +        .dma_ctrl          = aspeed_smc_dma_ctrl,
>>      }, {
>>          .name              = "aspeed.spi1-ast2500",
>>          .r_conf            = R_CONF,
>> @@ -349,6 +359,7 @@ static const AspeedSMCController controllers[] = {
>>          .nregs             = ASPEED_SMC_R_MAX,
>>          .segment_to_reg    = aspeed_smc_segment_to_reg,
>>          .reg_to_segment    = aspeed_smc_reg_to_segment,
>> +        .dma_ctrl          = aspeed_smc_dma_ctrl,
>>      }, {
>>          .name              = "aspeed.spi2-ast2500",
>>          .r_conf            = R_CONF,
>> @@ -365,6 +376,7 @@ static const AspeedSMCController controllers[] = {
>>          .nregs             = ASPEED_SMC_R_MAX,
>>          .segment_to_reg    = aspeed_smc_segment_to_reg,
>>          .reg_to_segment    = aspeed_smc_reg_to_segment,
>> +        .dma_ctrl          = aspeed_smc_dma_ctrl,
>>      }, {
>>          .name              = "aspeed.fmc-ast2600",
>>          .r_conf            = R_CONF,
>> @@ -383,6 +395,7 @@ static const AspeedSMCController controllers[] = {
>>          .nregs             = ASPEED_SMC_R_MAX,
>>          .segment_to_reg    = aspeed_2600_smc_segment_to_reg,
>>          .reg_to_segment    = aspeed_2600_smc_reg_to_segment,
>> +        .dma_ctrl          = aspeed_2600_smc_dma_ctrl,
>>      }, {
>>          .name              = "aspeed.spi1-ast2600",
>>          .r_conf            = R_CONF,
>> @@ -395,12 +408,14 @@ static const AspeedSMCController controllers[] = {
>>          .segments          = aspeed_segments_ast2600_spi1,
>>          .flash_window_base = ASPEED26_SOC_SPI_FLASH_BASE,
>>          .flash_window_size = 0x10000000,
>> -        .features          = ASPEED_SMC_FEATURE_DMA,
>> +        .features          = ASPEED_SMC_FEATURE_DMA |
>> +                             ASPEED_SMC_FEATURE_DMA_GRANT,
>>          .dma_flash_mask    = 0x0FFFFFFC,
>>          .dma_dram_mask     = 0x3FFFFFFC,
>>          .nregs             = ASPEED_SMC_R_MAX,
>>          .segment_to_reg    = aspeed_2600_smc_segment_to_reg,
>>          .reg_to_segment    = aspeed_2600_smc_reg_to_segment,
>> +        .dma_ctrl          = aspeed_2600_smc_dma_ctrl,
>>      }, {
>>          .name              = "aspeed.spi2-ast2600",
>>          .r_conf            = R_CONF,
>> @@ -413,12 +428,14 @@ static const AspeedSMCController controllers[] = {
>>          .segments          = aspeed_segments_ast2600_spi2,
>>          .flash_window_base = ASPEED26_SOC_SPI2_FLASH_BASE,
>>          .flash_window_size = 0x10000000,
>> -        .features          = ASPEED_SMC_FEATURE_DMA,
>> +        .features          = ASPEED_SMC_FEATURE_DMA |
>> +                             ASPEED_SMC_FEATURE_DMA_GRANT,
>>          .dma_flash_mask    = 0x0FFFFFFC,
>>          .dma_dram_mask     = 0x3FFFFFFC,
>>          .nregs             = ASPEED_SMC_R_MAX,
>>          .segment_to_reg    = aspeed_2600_smc_segment_to_reg,
>>          .reg_to_segment    = aspeed_2600_smc_reg_to_segment,
>> +        .dma_ctrl          = aspeed_2600_smc_dma_ctrl,
>>      },
>>  };
>>
>> @@ -1240,7 +1257,7 @@ static void aspeed_smc_dma_done(AspeedSMCState *s)
>>      }
>>  }
>>
>> -static void aspeed_smc_dma_ctrl(AspeedSMCState *s, uint64_t dma_ctrl)
>> +static void aspeed_smc_dma_ctrl(AspeedSMCState *s, uint32_t dma_ctrl)
>>  {
>>      if (!(dma_ctrl & DMA_CTRL_ENABLE)) {
>>          s->regs[R_DMA_CTRL] = dma_ctrl;
>> @@ -1265,6 +1282,46 @@ static void aspeed_smc_dma_ctrl(AspeedSMCState *s, uint64_t dma_ctrl)
>>      aspeed_smc_dma_done(s);
>>  }
>>
>> +static inline bool aspeed_smc_dma_granted(AspeedSMCState *s)
>> +{
>> +    if (!(s->ctrl->features & ASPEED_SMC_FEATURE_DMA_GRANT)) {
>> +        return true;
>> +    }
>> +
>> +    if (!(s->regs[R_DMA_CTRL] & DMA_CTRL_GRANT)) {
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA not granted\n",  __func__);
>> +        return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>> +static void aspeed_2600_smc_dma_ctrl(AspeedSMCState *s, uint32_t dma_ctrl)
>> +{
>> +    /* Preserve DMA bits  */
>> +    dma_ctrl |= s->regs[R_DMA_CTRL] & (DMA_CTRL_REQUEST | DMA_CTRL_GRANT);
>> +
>> +    if (dma_ctrl == 0xAEED0000) {
>> +        /* automatically grant request */
>> +        s->regs[R_DMA_CTRL] |= (DMA_CTRL_REQUEST | DMA_CTRL_GRANT);
>> +        return;
>> +    }
>> +
>> +    /* clear request */
>> +    if (dma_ctrl == 0xDEEA0000) {
>> +        s->regs[R_DMA_CTRL] &= ~(DMA_CTRL_REQUEST | DMA_CTRL_GRANT);
>> +        return;
>> +    }
>> +
>> +    if (!aspeed_smc_dma_granted(s)) {
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA not granted\n",  __func__);
>> +        return;
>> +    }
>> +
>> +    aspeed_smc_dma_ctrl(s, dma_ctrl);
>> +    s->regs[R_DMA_CTRL] &= ~(DMA_CTRL_REQUEST | DMA_CTRL_GRANT);
>> +}
>> +
>>  static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
>>                               unsigned int size)
>>  {
>> @@ -1297,12 +1354,15 @@ static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
>>      } else if (addr == R_INTR_CTRL) {
>>          s->regs[addr] = value;
>>      } else if (aspeed_smc_has_dma(s) && addr == R_DMA_CTRL) {
>> -        aspeed_smc_dma_ctrl(s, value);
>> -    } else if (aspeed_smc_has_dma(s) && addr == R_DMA_DRAM_ADDR) {
>> +        s->ctrl->dma_ctrl(s, value);
>> +    } else if (aspeed_smc_has_dma(s) && addr == R_DMA_DRAM_ADDR &&
>> +               aspeed_smc_dma_granted(s)) {
>>          s->regs[addr] = DMA_DRAM_ADDR(s, value);
>> -    } else if (aspeed_smc_has_dma(s) && addr == R_DMA_FLASH_ADDR) {
>> +    } else if (aspeed_smc_has_dma(s) && addr == R_DMA_FLASH_ADDR &&
>> +               aspeed_smc_dma_granted(s)) {
>>          s->regs[addr] = DMA_FLASH_ADDR(s, value);
>> -    } else if (aspeed_smc_has_dma(s) && addr == R_DMA_LEN) {
>> +    } else if (aspeed_smc_has_dma(s) && addr == R_DMA_LEN &&
>> +               aspeed_smc_dma_granted(s)) {
>>          s->regs[addr] = DMA_LENGTH(value);
>>      } else {
>>          qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx "\n",
>> --
>> 2.26.3
>>


