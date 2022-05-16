Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5194B527D61
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 08:09:05 +0200 (CEST)
Received: from localhost ([::1]:51036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqTui-000315-Ey
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 02:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nqTr1-0001rY-Ld; Mon, 16 May 2022 02:05:15 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:43827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nqTqz-0004Jc-DB; Mon, 16 May 2022 02:05:15 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.192])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 1EB1710021EC8;
 Mon, 16 May 2022 08:05:08 +0200 (CEST)
Received: from kaod.org (37.59.142.109) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 16 May
 2022 08:05:07 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S00365781ab4-dea8-4a1d-8558-9fefb19f8834,
 182B8575423FAF1F37CDABDABB9637A2CFA4B440) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7145f213-5e12-048a-b854-942c40396beb@kaod.org>
Date: Mon, 16 May 2022 08:05:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] aspeed: Introduce a get_irq AspeedSoCClass method
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: qemu-arm <qemu-arm@nongnu.org>, Cameron Esfahani via
 <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Jamin Lin
 <jamin_lin@aspeedtech.com>
References: <20220515211042.2332192-1-clg@kaod.org>
 <353DE7D8-A829-4F80-84A4-A0AA1EF17B29@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <353DE7D8-A829-4F80-84A4-A0AA1EF17B29@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: baeaf182-032e-4e52-8ca0-bcb9a481024d
X-Ovh-Tracer-Id: 16830796234108406633
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrheeggddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/16/22 01:01, Peter Delevoryas wrote:
> 
>> On May 15, 2022, at 2:10 PM, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> and make routine aspeed_soc_get_irq() common to all SoCs. This will be
>> useful to share code.
>>
>> Cc: Jamin Lin <jamin_lin@aspeedtech.com>
>> Cc: Peter Delevoryas <pdel@fb.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>> include/hw/arm/aspeed_soc.h |  3 +++
>> hw/arm/aspeed_ast10x0.c     |  3 ++-
>> hw/arm/aspeed_ast2600.c     |  3 ++-
>> hw/arm/aspeed_soc.c         | 11 +++++++++--
>> 4 files changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
>> index e13af374b923..3789f38603e5 100644
>> --- a/include/hw/arm/aspeed_soc.h
>> +++ b/include/hw/arm/aspeed_soc.h
>> @@ -94,6 +94,7 @@ struct AspeedSoCClass {
>>      const int *irqmap;
>>      const hwaddr *memmap;
>>      uint32_t num_cpus;
>> +    qemu_irq (*get_irq)(AspeedSoCState *s, int dev);
>> };
>>
>>
>> @@ -153,4 +154,6 @@ enum {
>>      ASPEED_DEV_I3C,
>> };
>>
>> +qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
>> +
>> #endif /* ASPEED_SOC_H */
>> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
>> index 427154928254..ddec5706f3c1 100644
>> --- a/hw/arm/aspeed_ast10x0.c
>> +++ b/hw/arm/aspeed_ast10x0.c
>> @@ -61,7 +61,7 @@ static const int aspeed_soc_ast1030_irqmap[] = {
>>      [ASPEED_DEV_KCS]       = 138, /* 138 -> 142 */
>> };
>>
>> -static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
>> +static qemu_irq aspeed_soc_ast1030_get_irq(AspeedSoCState *s, int dev)
>> {
>>      AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
>>
>> @@ -280,6 +280,7 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
>>      sc->irqmap = aspeed_soc_ast1030_irqmap;
>>      sc->memmap = aspeed_soc_ast1030_memmap;
>>      sc->num_cpus = 1;
>> +    sc->get_irq = aspeed_soc_ast1030_get_irq;
>> }
>>
>> static const TypeInfo aspeed_soc_ast1030_type_info = {
>> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
>> index eedda7badc37..255dbc6b95ab 100644
>> --- a/hw/arm/aspeed_ast2600.c
>> +++ b/hw/arm/aspeed_ast2600.c
>> @@ -114,7 +114,7 @@ static const int aspeed_soc_ast2600_irqmap[] = {
>>      [ASPEED_DEV_I3C]       = 102,   /* 102 -> 107 */
>> };
>>
>> -static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
>> +static qemu_irq aspeed_soc_ast2600_get_irq(AspeedSoCState *s, int dev)
>> {
>>      AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
>>
>> @@ -572,6 +572,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
>>      sc->irqmap       = aspeed_soc_ast2600_irqmap;
>>      sc->memmap       = aspeed_soc_ast2600_memmap;
>>      sc->num_cpus     = 2;
>> +    sc->get_irq      = aspeed_soc_ast2600_get_irq;
>> }
>>
>> static const TypeInfo aspeed_soc_ast2600_type_info = {
>> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
>> index 58714cb2a01d..15b641da9a36 100644
>> --- a/hw/arm/aspeed_soc.c
>> +++ b/hw/arm/aspeed_soc.c
>> @@ -121,7 +121,7 @@ static const int aspeed_soc_ast2400_irqmap[] = {
>>
>> #define aspeed_soc_ast2500_irqmap aspeed_soc_ast2400_irqmap
>>
>> -static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
>> +static qemu_irq aspeed_soc_ast2400_get_irq(AspeedSoCState *s, int dev)
>> {
>>      AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
>>
>> @@ -487,6 +487,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
>>      sc->irqmap       = aspeed_soc_ast2400_irqmap;
>>      sc->memmap       = aspeed_soc_ast2400_memmap;
>>      sc->num_cpus     = 1;
>> +    sc->get_irq      = aspeed_soc_ast2400_get_irq;
>> }
>>
>> static const TypeInfo aspeed_soc_ast2400_type_info = {
>> @@ -512,6 +513,7 @@ static void aspeed_soc_ast2500_class_init(ObjectClass *oc, void *data)
>>      sc->irqmap       = aspeed_soc_ast2500_irqmap;
>>      sc->memmap       = aspeed_soc_ast2500_memmap;
>>      sc->num_cpus     = 1;
>> +    sc->get_irq      = aspeed_soc_ast2400_get_irq;
>> }
>>
>> static const TypeInfo aspeed_soc_ast2500_type_info = {
>> @@ -528,4 +530,9 @@ static void aspeed_soc_register_types(void)
>>      type_register_static(&aspeed_soc_ast2500_type_info);
>> };
>>
>> -type_init(aspeed_soc_register_types)
>> +type_init(aspeed_soc_register_types);
>> +
>> +qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev)
>> +{
>> +    return ASPEED_SOC_GET_CLASS(s)->get_irq(s, ctrl);
>> +}
> 
> I think “dev” needs to be changed to “ctrl” or vice-versa.
> (Compilation failure)

Last minute changes ... Sent a v2 !

Thanks,

C.

