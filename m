Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A634024E5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 10:10:24 +0200 (CEST)
Received: from localhost ([::1]:59746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNWBS-0006xG-WD
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 04:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mNW9q-0005Sd-62; Tue, 07 Sep 2021 04:08:42 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:35185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mNW9o-00013r-4S; Tue, 07 Sep 2021 04:08:41 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.235])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 579A9BCB92BB;
 Tue,  7 Sep 2021 10:08:36 +0200 (CEST)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 7 Sep
 2021 10:08:33 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G00323369cd5-4b4b-4985-b239-152fbc8049c0,
 984F41D2D9692A95DAA6D5E609006558D983FB00) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH] aspeed/i2c: QOMify AspeedI2CBus
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>
References: <20210907073059.1155224-1-clg@kaod.org>
 <8f13efb2-2b60-929e-3ed6-a3edcee1ab3d@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <433b1e8c-e9a8-a26a-0a4a-0c85f63859c6@kaod.org>
Date: Tue, 7 Sep 2021 10:08:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8f13efb2-2b60-929e-3ed6-a3edcee1ab3d@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 968c58a7-b063-495b-8eb5-c27c90c5c550
X-Ovh-Tracer-Id: 2162853722266897190
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudefhedgtdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepfhegsghughesrghmshgrthdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.332,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/7/21 9:40 AM, Philippe Mathieu-Daudé wrote:
> On 9/7/21 9:30 AM, Cédric Le Goater wrote:
>> The AST2600 SoC realize routine needs to be adapted when connecting
>> the I2C bus IRQs because the bus IRQs have moved to the AspeedI2CBus
>> SysBus device, one level below the Aspeed I2C controller SysBus
>> device.
> 
> When did they move?

With this patch. I will rephrase.

> 
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  include/hw/i2c/aspeed_i2c.h |   8 ++-
>>  hw/arm/aspeed_ast2600.c     |   7 +--
>>  hw/i2c/aspeed_i2c.c         | 103 +++++++++++++++++++++++++++++-------
>>  3 files changed, 93 insertions(+), 25 deletions(-)
> 
>> +static void aspeed_i2c_bus_realize(DeviceState *dev, Error **errp)
>> +{
>> +    AspeedI2CBus *s = ASPEED_I2C_BUS(dev);
>> +    char name[32];
>> +    AspeedI2CClass *aic;
>> +
>> +    if (!s->controller) {
>> +        error_setg(errp, TYPE_ASPEED_I2C_BUS ": 'controller' link not set");
>> +        return;
>> +    }
>> +
>> +    aic = ASPEED_I2C_GET_CLASS(s->controller);
>> +
>> +    snprintf(name, sizeof(name), TYPE_ASPEED_I2C_BUS ".%d", s->id);
> 
> Even if this particular case is safe, it is better to use:
> 
>   g_autofree char *name = g_strdup_printf(TYPE_ASPEED_I2C_BUS ".%d",
>                                           s->id);
> 
> So future developer copying your device code will be safe if they
> modify the format :)


Yeah. I kind of like snprintf but I agree g_strdup_printf() is as good
with the g_autofree variables. I will change the patches.

Thanks,

C. 


>> +
>> +    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
>> +
>> +    s->bus = i2c_init_bus(dev, name);
>> +
>> +    memory_region_init_io(&s->mr, OBJECT(s), &aspeed_i2c_bus_ops,
>> +                          s, name, aic->reg_size);
>> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mr);
>> +}


