Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12C8431AA7
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 15:21:19 +0200 (CEST)
Received: from localhost ([::1]:46054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcSZp-0008CJ-Qv
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 09:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mcSMx-0006ka-To
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:07:59 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:50957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mcSMv-0004y1-IB
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:07:59 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.12])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 75024C55FDEE;
 Mon, 18 Oct 2021 15:07:53 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 15:07:52 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0012b8c41e9-bdef-4603-a3bd-a7dad596acff,
 F07B6F3C357710E32BAB16EB0BBFA04B60198819) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <862f8237-8d6f-965b-ed58-00f5ccad3e1f@kaod.org>
Date: Mon, 18 Oct 2021 15:07:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 3/4] aspeed/wdt: Add an alias for the MMIO region
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Peter Maydell
 <peter.maydell@linaro.org>
References: <20211004154635.394258-1-clg@kaod.org>
 <20211004154635.394258-4-clg@kaod.org>
 <484941d7-d6c8-70df-87f5-525078d072e6@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <484941d7-d6c8-70df-87f5-525078d072e6@amsat.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c2330e43-49fd-417b-9716-f027a0eac315
X-Ovh-Tracer-Id: 8190077401291197289
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvtddgheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghu
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org,
 Peter Delevoryas <pdel@fb.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Phil,

On 10/18/21 11:04, Philippe Mathieu-Daudé wrote:
> Hi Cédric,
> 
> On 10/4/21 17:46, Cédric Le Goater wrote:
>> Initialize the region in the instance_init handler because we will
>> want to link this region in the FMC object before the WDT object is
>> realized.
>>
>> Cc: Peter Delevoryas <pdel@fb.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   include/hw/watchdog/wdt_aspeed.h |  1 +
>>   hw/watchdog/wdt_aspeed.c         | 15 ++++++++++++---
>>   2 files changed, 13 insertions(+), 3 deletions(-)
> 
>> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
>> index 146ffcd71301..6426f3a77494 100644
>> --- a/hw/watchdog/wdt_aspeed.c
>> +++ b/hw/watchdog/wdt_aspeed.c
>> @@ -261,6 +261,16 @@ static void aspeed_wdt_timer_expired(void *dev)
>>   
>>   #define PCLK_HZ 24000000
>>   
>> +static void aspeed_wdt_instance_init(Object *obj)
>> +{
>> +    AspeedWDTState *s = ASPEED_WDT(obj);
>> +
>> +    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_wdt_ops, s,
>> +                          TYPE_ASPEED_WDT, ASPEED_WDT_REGS_MAX * 4);
>> +    memory_region_init_alias(&s->iomem_alias, OBJECT(s),
>> +                             TYPE_ASPEED_WDT ".alias",
>> +                             &s->iomem, 0, ASPEED_WDT_REGS_MAX * 4);
>> +}
>>   static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
>>   {
>>       SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>> @@ -275,9 +285,7 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
>>        */
>>       s->pclk_freq = PCLK_HZ;
>>   
>> -    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_wdt_ops, s,
>> -                          TYPE_ASPEED_WDT, ASPEED_WDT_REGS_MAX * 4);
>> -    sysbus_init_mmio(sbd, &s->iomem);
>> +    sysbus_init_mmio(sbd, &s->iomem_alias);
> 
> Exposing an alias that way seems odd. Don't you want to use/expose
> a container instead?

I think I got confused by changes in e9c568dbc225 ("hw/arm/aspeed:
Do not sysbus-map mmio flash region directly, use alias") :)

You are right. This needs a container, not an alias. I will respin
and fix the aspeed-smc flash address space also.

> Anyhow, by moving memory_region_init_io() in init(), the region is
> available for linking before realize(), so why do you need an alias?

yes.

I still need to initialize the watchdog models before the FMC. There
will be a little change in the order.

Thanks,

C.

