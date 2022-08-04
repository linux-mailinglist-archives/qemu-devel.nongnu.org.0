Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C24B589794
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 07:55:26 +0200 (CEST)
Received: from localhost ([::1]:44320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJTpM-0005NI-FA
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 01:55:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJTd2-000065-9h
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 01:42:40 -0400
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:37235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJTd0-0004XU-Ev
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 01:42:40 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.123])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id CEA29215E0;
 Thu,  4 Aug 2022 05:42:35 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 4 Aug 2022
 07:42:35 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006457e3397-220d-44de-bbd1-ac0f2159a64e,
 E459FF07681E7C706565AD81A8193C11BE0AA2AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <cf6c0f99-32dc-c5e1-1027-28ec19f4ae76@kaod.org>
Date: Thu, 4 Aug 2022 07:42:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 19/20] ppc/ppc405: QOM'ify I2C
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: <qemu-ppc@nongnu.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 <qemu-devel@nongnu.org>
References: <20220803132844.2370514-1-clg@kaod.org>
 <20220803132844.2370514-20-clg@kaod.org>
 <1ab31d3-c5ec-47bd-cdd9-1d1a5e5f7696@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <1ab31d3-c5ec-47bd-cdd9-1d1a5e5f7696@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: fcf23bdb-f6de-4921-ba9b-9dd9aa8e6c49
X-Ovh-Tracer-Id: 6650409278922525664
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvkedguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

On 8/4/22 01:31, BALATON Zoltan wrote:
> On Wed, 3 Aug 2022, Cédric Le Goater wrote:
>> Having an explicit I2C model object will help if one day we want to
>> add I2C devices on the bus.
> 
> Same here as with the UIC in previous patch, it's not QOMifying here either. As for why we may need I2C, on sam460ex the firmware detects RAM accessing the SPD data over I2C so that could be the reason but it may not be used here on 405.

You can still plug I2C devices on the PPC405 command line if you want to.

Thanks,

C.

> 
> Regards,
> BALATON Zoltan
> 
>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>> hw/ppc/ppc405.h    |  2 ++
>> hw/ppc/ppc405_uc.c | 10 ++++++++--
>> 2 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
>> index d29f738cd2d0..d13624ae309c 100644
>> --- a/hw/ppc/ppc405.h
>> +++ b/hw/ppc/ppc405.h
>> @@ -28,6 +28,7 @@
>> #include "qom/object.h"
>> #include "hw/ppc/ppc4xx.h"
>> #include "hw/intc/ppc-uic.h"
>> +#include "hw/i2c/ppc4xx_i2c.h"
>>
>> #define PPC405EP_SDRAM_BASE 0x00000000
>> #define PPC405EP_NVRAM_BASE 0xF0000000
>> @@ -256,6 +257,7 @@ struct Ppc405SoCState {
>>     Ppc405OcmState ocm;
>>     Ppc405GpioState gpio;
>>     Ppc405DmaState dma;
>> +    PPC4xxI2CState i2c;
>>     Ppc405EbcState ebc;
>>     Ppc405OpbaState opba;
>>     Ppc405PobState pob;
>> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
>> index 5cd32e22b7ea..8f0caa45f5f7 100644
>> --- a/hw/ppc/ppc405_uc.c
>> +++ b/hw/ppc/ppc405_uc.c
>> @@ -1461,6 +1461,8 @@ static void ppc405_soc_instance_init(Object *obj)
>>
>>     object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
>>
>> +    object_initialize_child(obj, "i2c", &s->i2c, TYPE_PPC4xx_I2C);
>> +
>>     object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC405_EBC);
>>
>>     object_initialize_child(obj, "opba", &s->opba, TYPE_PPC405_OPBA);
>> @@ -1569,8 +1571,12 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>>     }
>>
>>     /* I2C controller */
>> -    sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500,
>> -                         qdev_get_gpio_in(DEVICE(&s->uic), 2));
>> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c), errp)) {
>> +        return;
>> +    }
>> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, 0xef600500);
>> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c), 0,
>> +                       qdev_get_gpio_in(DEVICE(&s->uic), 2));
>>
>>     /* GPIO */
>>     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
>>


