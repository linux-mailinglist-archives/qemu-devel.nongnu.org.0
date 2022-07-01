Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB180562ADA
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 07:25:46 +0200 (CEST)
Received: from localhost ([::1]:38838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o79A1-0000IQ-8K
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 01:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o798T-0007bc-M1; Fri, 01 Jul 2022 01:24:09 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:58465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o798Q-0008Mz-Pz; Fri, 01 Jul 2022 01:24:08 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.15])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 50CEC1132F672;
 Fri,  1 Jul 2022 07:24:00 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 1 Jul 2022
 07:24:00 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0055987a475-6dda-403a-bbc7-f22ba67e84cd,
 4AFA7A5FE9B5479AF1021A557A7101AB3AA64E21) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <015aab44-ba72-1f47-b499-ea5fb06d76e6@kaod.org>
Date: Fri, 1 Jul 2022 07:23:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 3/3] aspeed: sbc: Allow per-machine settings
Content-Language: en-US
To: Peter Delevoryas <me@pjd.dev>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>
References: <20220628154740.1117349-1-clg@kaod.org>
 <20220628154740.1117349-4-clg@kaod.org>
 <Yr5Pnbh3Fbtxdpsk@pdel-mbp.dhcp.thefacebook.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <Yr5Pnbh3Fbtxdpsk@pdel-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 776cfb4a-1e9e-422e-8dcf-c02934bc14bb
X-Ovh-Tracer-Id: 9579156407462628134
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehvddgleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruhdpoffvtefjohhsthepmhhohedvle
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

On 7/1/22 03:36, Peter Delevoryas wrote:
> On Tue, Jun 28, 2022 at 05:47:40PM +0200, Cédric Le Goater wrote:
>> From: Joel Stanley <joel@jms.id.au>
>>
>> In order to correctly report secure boot running firmware the values
>> of certain registers must be set.
>>
>> We don't yet have documentation from ASPEED on what they mean. The
>> meaning is inferred from u-boot's use of them.
>>
>> Introduce properties so the settings can be configured per-machine.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   include/hw/misc/aspeed_sbc.h | 13 ++++++++++++
>>   hw/misc/aspeed_sbc.c         | 41 ++++++++++++++++++++++++++++++++++--
>>   2 files changed, 52 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/hw/misc/aspeed_sbc.h b/include/hw/misc/aspeed_sbc.h
>> index 67e43b53ecc3..405e6782b97a 100644
>> --- a/include/hw/misc/aspeed_sbc.h
>> +++ b/include/hw/misc/aspeed_sbc.h
>> @@ -17,9 +17,22 @@ OBJECT_DECLARE_TYPE(AspeedSBCState, AspeedSBCClass, ASPEED_SBC)
>>   
>>   #define ASPEED_SBC_NR_REGS (0x93c >> 2)
>>   
>> +#define QSR_AES                     BIT(27)
>> +#define QSR_RSA1024                 (0x0 << 12)
>> +#define QSR_RSA2048                 (0x1 << 12)
>> +#define QSR_RSA3072                 (0x2 << 12)
>> +#define QSR_RSA4096                 (0x3 << 12)
>> +#define QSR_SHA224                  (0x0 << 10)
>> +#define QSR_SHA256                  (0x1 << 10)
>> +#define QSR_SHA384                  (0x2 << 10)
>> +#define QSR_SHA512                  (0x3 << 10)
>> +
>>   struct AspeedSBCState {
>>       SysBusDevice parent;
>>   
>> +    bool emmc_abr;
>> +    uint32_t signing_settings;
>> +
>>       MemoryRegion iomem;
>>   
>>       uint32_t regs[ASPEED_SBC_NR_REGS];
>> diff --git a/hw/misc/aspeed_sbc.c b/hw/misc/aspeed_sbc.c
>> index bfa8b81d01c7..3946e6179bdd 100644
>> --- a/hw/misc/aspeed_sbc.c
>> +++ b/hw/misc/aspeed_sbc.c
>> @@ -11,6 +11,7 @@
>>   #include "qemu/osdep.h"
>>   #include "qemu/log.h"
>>   #include "qemu/error-report.h"
>> +#include "hw/qdev-properties.h"
>>   #include "hw/misc/aspeed_sbc.h"
>>   #include "qapi/error.h"
>>   #include "migration/vmstate.h"
>> @@ -19,6 +20,27 @@
>>   #define R_STATUS        (0x014 / 4)
>>   #define R_QSR           (0x040 / 4)
>>   
>> +/* R_STATUS */
>> +#define ABR_EN                  BIT(14) /* Mirrors SCU510[11] */
>> +#define ABR_IMAGE_SOURCE        BIT(13)
>> +#define SPI_ABR_IMAGE_SOURCE    BIT(12)
>> +#define SB_CRYPTO_KEY_EXP_DONE  BIT(11)
>> +#define SB_CRYPTO_BUSY          BIT(10)
>> +#define OTP_WP_EN               BIT(9)
>> +#define OTP_ADDR_WP_EN          BIT(8)
>> +#define LOW_SEC_KEY_EN          BIT(7)
>> +#define SECURE_BOOT_EN          BIT(6)
>> +#define UART_BOOT_EN            BIT(5)
>> +/* bit 4 reserved*/
>> +#define OTP_CHARGE_PUMP_READY   BIT(3)
>> +#define OTP_IDLE                BIT(2)
>> +#define OTP_MEM_IDLE            BIT(1)
>> +#define OTP_COMPARE_STATUS      BIT(0)
>> +
>> +/* QSR */
>> +#define QSR_RSA_MASK           (0x3 << 12)
>> +#define QSR_HASH_MASK          (0x3 << 10)
>> +
>>   static uint64_t aspeed_sbc_read(void *opaque, hwaddr addr, unsigned int size)
>>   {
>>       AspeedSBCState *s = ASPEED_SBC(opaque);
>> @@ -80,8 +102,17 @@ static void aspeed_sbc_reset(DeviceState *dev)
>>       memset(s->regs, 0, sizeof(s->regs));
>>   
>>       /* Set secure boot enabled with RSA4096_SHA256 and enable eMMC ABR */
>> -    s->regs[R_STATUS] = 0x000044C6;
>> -    s->regs[R_QSR] = 0x07C07C89;
>> +    s->regs[R_STATUS] = OTP_IDLE | OTP_MEM_IDLE;
>> +
>> +    if (s->emmc_abr) {
>> +        s->regs[R_STATUS] &= ABR_EN;
>> +    }
>> +
>> +    if (s->signing_settings) {
>> +        s->regs[R_STATUS] &= SECURE_BOOT_EN;
>> +    }
>> +
>> +    s->regs[R_QSR] = s->signing_settings;
>>   }
>>   
>>   static void aspeed_sbc_realize(DeviceState *dev, Error **errp)
>> @@ -105,6 +136,11 @@ static const VMStateDescription vmstate_aspeed_sbc = {
>>       }
>>   };
>>   
>> +static Property aspeed_sbc_properties[] = {
>> +    DEFINE_PROP_BOOL("emmc-abr", AspeedSBCState, emmc_abr, 0),
>> +    DEFINE_PROP_UINT32("signing-settings", AspeedSBCState, signing_settings, 0),
>> +};
> 
> This needs a DEFINE_PROP_END_OF_LIST(), I bisected to this commit in Cedric's
> aspeed-7.1 branch.

Ah you did also ! Sorry I should have told. The problem only showed
on f35 using clang, and I didn't notice until I pushed the branch
on gitlab yersterday.

> Reviewed-by: Peter Delevoryas <pdel@fb.com>
> Tested-by: Peter Delevoryas <pdel@fb.com>

I will include the patch in the next PR.

Thanks,

C.


>> +
>>   static void aspeed_sbc_class_init(ObjectClass *klass, void *data)
>>   {
>>       DeviceClass *dc = DEVICE_CLASS(klass);
>> @@ -112,6 +148,7 @@ static void aspeed_sbc_class_init(ObjectClass *klass, void *data)
>>       dc->realize = aspeed_sbc_realize;
>>       dc->reset = aspeed_sbc_reset;
>>       dc->vmsd = &vmstate_aspeed_sbc;
>> +    device_class_set_props(dc, aspeed_sbc_properties);
>>   }
>>   
>>   static const TypeInfo aspeed_sbc_info = {
>> -- 
>> 2.35.3
>>
>>


