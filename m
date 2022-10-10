Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4B05F9849
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 08:23:16 +0200 (CEST)
Received: from localhost ([::1]:41058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohmC1-00008v-Dq
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 02:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ohm4x-00043v-2d; Mon, 10 Oct 2022 02:15:55 -0400
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:44139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ohm4s-0006PD-Sn; Mon, 10 Oct 2022 02:15:54 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.237])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id E057322BC9;
 Mon, 10 Oct 2022 06:15:46 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Mon, 10 Oct
 2022 08:15:46 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006c6f006da-1820-4fd2-99e1-088b8de77256,
 8F9D85B4748BB0730094C5680DDBB13DC71FBC21) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <19338ccf-31f2-7afa-022e-abb15553609f@kaod.org>
Date: Mon, 10 Oct 2022 08:15:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 2/8] m25p80: Add the n25q256a SFDP table
Content-Language: en-US
To: Francisco Iglesias <frasse.iglesias@gmail.com>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <qemu-block@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>
References: <20220722063602.128144-1-clg@kaod.org>
 <20220722063602.128144-3-clg@kaod.org> <20221007140337.GC20384@fralle-msi>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221007140337.GC20384@fralle-msi>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: a983627e-51b4-4a9b-babf-65f4bd5866be
X-Ovh-Tracer-Id: 13299692652137843634
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejvddguddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeeltddtuddtjeevheeltdevjeejkeeguedtkeefjeevkeetfffgvdeltdffjedunecuffhomhgrihhnpehotghtohhprghrthdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehmihgthhgrvghlseifrghllhgvrdgttgdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.934,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/7/22 16:03, Francisco Iglesias wrote:
> On [2022 Jul 22] Fri 08:35:56, Cédric Le Goater wrote:
>> The same values were collected on 4 differents OpenPower systems,
>> palmettos, romulus and tacoma.
>>
>> The SFDP table size is defined as being 0x100 bytes but it could be
>> bigger. Only the mandatory table for basic features is available at
>> byte 0x30.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/block/m25p80_sfdp.h |  2 ++
>>   hw/block/m25p80.c      |  8 +++---
>>   hw/block/m25p80_sfdp.c | 58 ++++++++++++++++++++++++++++++++++++++++++
>>   hw/block/meson.build   |  1 +
>>   4 files changed, 66 insertions(+), 3 deletions(-)
>>   create mode 100644 hw/block/m25p80_sfdp.c
>>
>> diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
>> index 230b07ef3308..d3a0a778ae84 100644
>> --- a/hw/block/m25p80_sfdp.h
>> +++ b/hw/block/m25p80_sfdp.h
>> @@ -15,4 +15,6 @@
>>    */
>>   #define M25P80_SFDP_MAX_SIZE  (1 << 24)
>>   
>> +extern uint8_t m25p80_sfdp_n25q256a(uint32_t addr);
> 
> (-extern above if we would like)
> 
> 
>> +
>>   #endif
>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
>> index abdc4c0b0da7..13e7b28fd2b0 100644
>> --- a/hw/block/m25p80.c
>> +++ b/hw/block/m25p80.c
>> @@ -247,13 +247,15 @@ static const FlashPartInfo known_devices[] = {
>>       { INFO("n25q128a11",  0x20bb18,      0,  64 << 10, 256, ER_4K) },
>>       { INFO("n25q128a13",  0x20ba18,      0,  64 << 10, 256, ER_4K) },
>>       { INFO("n25q256a11",  0x20bb19,      0,  64 << 10, 512, ER_4K) },
>> -    { INFO("n25q256a13",  0x20ba19,      0,  64 << 10, 512, ER_4K) },
>> +    { INFO("n25q256a13",  0x20ba19,      0,  64 << 10, 512, ER_4K),
>> +      .sfdp_read = m25p80_sfdp_n25q256a },
>>       { INFO("n25q512a11",  0x20bb20,      0,  64 << 10, 1024, ER_4K) },
>>       { INFO("n25q512a13",  0x20ba20,      0,  64 << 10, 1024, ER_4K) },
>>       { INFO("n25q128",     0x20ba18,      0,  64 << 10, 256, 0) },
>>       { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512,
>> -           ER_4K | HAS_SR_BP3_BIT6 | HAS_SR_TB) },
>> -    { INFO("n25q512a",    0x20ba20,      0,  64 << 10, 1024, ER_4K) },
>> +           ER_4K | HAS_SR_BP3_BIT6 | HAS_SR_TB),
>> +      .sfdp_read = m25p80_sfdp_n25q256a },
>> +   { INFO("n25q512a",    0x20ba20,      0,  64 << 10, 1024, ER_4K) },
>>       { INFO("n25q512ax3",  0x20ba20,  0x1000,  64 << 10, 1024, ER_4K) },
>>       { INFO("mt25ql512ab", 0x20ba20, 0x1044, 64 << 10, 1024, ER_4K | ER_32K) },
>>       { INFO_STACKED("mt35xu01g", 0x2c5b1b, 0x104100, 128 << 10, 1024,
>> diff --git a/hw/block/m25p80_sfdp.c b/hw/block/m25p80_sfdp.c
>> new file mode 100644
>> index 000000000000..24ec05de79a1
>> --- /dev/null
>> +++ b/hw/block/m25p80_sfdp.c
>> @@ -0,0 +1,58 @@
>> +/*
>> + * M25P80 Serial Flash Discoverable Parameter (SFDP)
>> + *
>> + * Copyright (c) 2020, IBM Corporation.
>> + *
>> + * This code is licensed under the GPL version 2 or later. See the
>> + * COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qemu/host-utils.h"
>> +#include "m25p80_sfdp.h"
>> +
>> +#define define_sfdp_read(model)                                       \
>> +    uint8_t m25p80_sfdp_##model(uint32_t addr)                        \
>> +    {                                                                 \
>> +        assert(is_power_of_2(sizeof(sfdp_##model)));                  \
>> +        return sfdp_##model[addr & (sizeof(sfdp_##model) - 1)];       \
>> +    }
>> +
>> +/*
>> + * Micron
>> + */
>> +static const uint8_t sfdp_n25q256a[] = {
> 
> The datasheets I found wasn't completetly as this table but I can't argue
> with the hw read out of 4 flashes.

It is mentioned there :

   http://datasheet.octopart.com/N25Q256A13E1241F-Micron-datasheet-11552757.pdf

C.


> 
> Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
> 
>> +    0x53, 0x46, 0x44, 0x50, 0x00, 0x01, 0x00, 0xff,
>> +    0x00, 0x00, 0x01, 0x09, 0x30, 0x00, 0x00, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xe5, 0x20, 0xfb, 0xff, 0xff, 0xff, 0xff, 0x0f,
>> +    0x29, 0xeb, 0x27, 0x6b, 0x08, 0x3b, 0x27, 0xbb,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x27, 0xbb,
>> +    0xff, 0xff, 0x29, 0xeb, 0x0c, 0x20, 0x10, 0xd8,
>> +    0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +};
>> +define_sfdp_read(n25q256a);
>> diff --git a/hw/block/meson.build b/hw/block/meson.build
>> index 2389326112ae..3129ca4c52eb 100644
>> --- a/hw/block/meson.build
>> +++ b/hw/block/meson.build
>> @@ -12,6 +12,7 @@ softmmu_ss.add(when: 'CONFIG_ONENAND', if_true: files('onenand.c'))
>>   softmmu_ss.add(when: 'CONFIG_PFLASH_CFI01', if_true: files('pflash_cfi01.c'))
>>   softmmu_ss.add(when: 'CONFIG_PFLASH_CFI02', if_true: files('pflash_cfi02.c'))
>>   softmmu_ss.add(when: 'CONFIG_SSI_M25P80', if_true: files('m25p80.c'))
>> +softmmu_ss.add(when: 'CONFIG_SSI_M25P80', if_true: files('m25p80_sfdp.c'))
>>   softmmu_ss.add(when: 'CONFIG_SWIM', if_true: files('swim.c'))
>>   softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
>>   softmmu_ss.add(when: 'CONFIG_TC58128', if_true: files('tc58128.c'))
>> -- 
>> 2.35.3
>>


