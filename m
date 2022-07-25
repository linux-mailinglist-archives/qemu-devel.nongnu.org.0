Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDFD57F980
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 08:37:34 +0200 (CEST)
Received: from localhost ([::1]:46858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFrie-0000hX-Ko
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 02:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oFreE-0005rW-2i
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 02:33:04 -0400
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:33199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oFre9-0002Af-PK
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 02:32:55 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.137])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 6BCF422803;
 Mon, 25 Jul 2022 06:32:21 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 25 Jul
 2022 08:32:19 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0016870ca9c-2298-4e02-825e-780df94e8c99,
 D832AE00456E0C65F35A6D2849B778492C3B7DB7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <257967d9-fd97-41ed-e5a1-23e4a89dba57@kaod.org>
Date: Mon, 25 Jul 2022 08:32:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 8/8] arm/aspeed: Replace mx25l25635e chip model
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, Cameron Esfahani via
 <qemu-devel@nongnu.org>
CC: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9_via?= <qemu-arm@nongnu.org>,
 <qemu-block@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, Joel
 Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <frasse.iglesias@gmail.com>, Iris Chen
 <irischenlj@fb.com>, Michael Walle <michael@walle.cc>
References: <20220722063602.128144-1-clg@kaod.org>
 <20220722063602.128144-9-clg@kaod.org>
 <e98735a4-19ae-4628-bacb-549511821c41@www.fastmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <e98735a4-19ae-4628-bacb-549511821c41@www.fastmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 70187cc3-2f05-4ab5-8586-da4583dc029e
X-Ovh-Tracer-Id: 4103905162150316978
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtjedgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeeggffggfehjefgudefieeuffevheetjefgleeukefggeetgfffjeehtdfgjefgnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehmihgthhgrvghlseifrghllhgvrdgttgdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
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

On 7/25/22 04:08, Andrew Jeffery wrote:
> 
> 
> On Fri, 22 Jul 2022, at 16:06, Cédric Le Goater wrote:
>> A mx25l25635f chip model is generally found on these machines. It's
>> newer and uses 4B opcodes which is better to exercise the support in
>> the Linux kernel.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/arm/aspeed.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index 1c611284819d..7e95abc55b09 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -1157,7 +1157,7 @@ static void
>> aspeed_machine_palmetto_class_init(ObjectClass *oc, void *data)
>>       amc->soc_name  = "ast2400-a1";
>>       amc->hw_strap1 = PALMETTO_BMC_HW_STRAP1;
>>       amc->fmc_model = "n25q256a";
>> -    amc->spi_model = "mx25l25635e";
>> +    amc->spi_model = "mx25l25635f";
> 
> Hmm, dmesg reported mx25l25635e on the palmetto I checked
> 
>>       amc->num_cs    = 1;
>>       amc->i2c_init  = palmetto_bmc_i2c_init;
>>       mc->default_ram_size       = 256 * MiB;
>> @@ -1208,7 +1208,7 @@ static void
>> aspeed_machine_ast2500_evb_class_init(ObjectClass *oc, void *data)
>>       amc->soc_name  = "ast2500-a1";
>>       amc->hw_strap1 = AST2500_EVB_HW_STRAP1;
>>       amc->fmc_model = "mx25l25635e";
>> -    amc->spi_model = "mx25l25635e";
>> +    amc->spi_model = "mx25l25635f";
>>       amc->num_cs    = 1;
>>       amc->i2c_init  = ast2500_evb_i2c_init;
>>       mc->default_ram_size       = 512 * MiB;
>> @@ -1258,7 +1258,7 @@ static void
>> aspeed_machine_witherspoon_class_init(ObjectClass *oc, void *data)
>>       mc->desc       = "OpenPOWER Witherspoon BMC (ARM1176)";
>>       amc->soc_name  = "ast2500-a1";
>>       amc->hw_strap1 = WITHERSPOON_BMC_HW_STRAP1;
>> -    amc->fmc_model = "mx25l25635e";
>> +    amc->fmc_model = "mx25l25635f";
> 
> The witherspoon I checked also reported mx25l25635e in dmesg for the
> FMC.
> 
> You do say "generally" in the commit message though.

You can not tell from dmesg.

The MX25L25635F and MX25L25635E models share the same JEDEC ID and
the spi-nor flash device table only contains a mx25l25635e entry.
The MX25L25635F is detected in mx25l25635_post_bfpt_fixups using SFDP.

That's why I added this warning  :

   https://github.com/legoater/linux/commit/934f0708ac597022cbf6c8d6f2ce91d55025e943


C.

> 
> Andrew


