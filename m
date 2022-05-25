Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6F55336CF
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 08:37:58 +0200 (CEST)
Received: from localhost ([::1]:53540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntkeb-00022j-DI
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 02:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ntkTQ-0004Ro-Ez
 for qemu-devel@nongnu.org; Wed, 25 May 2022 02:26:26 -0400
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:45037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ntkTN-000357-Dd
 for qemu-devel@nongnu.org; Wed, 25 May 2022 02:26:23 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.188])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 619F6225CA;
 Wed, 25 May 2022 06:26:08 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 25 May
 2022 08:26:07 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00327ce4a77-58ad-4cad-96d7-470091887cbe,
 D6A97ED6E11FF164423AFC60B0B43C9491D8EECB) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <90800c8c-315e-ecea-0558-9db30698efc7@kaod.org>
Date: Wed, 25 May 2022 08:26:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/4] hw/gpio: Add ASPEED GPIO model for AST1030
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
CC: <steven_lee@aspeedtech.com>, <troy_lee@aspeedtech.com>
References: <20220525053444.27228-1-jamin_lin@aspeedtech.com>
 <20220525053444.27228-3-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220525053444.27228-3-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f1c999fd-8a2f-4b72-8816-18939d0ca77e
X-Ovh-Tracer-Id: 14699749186117536620
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrjeeggddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehtrhhohigplhgvvgesrghsphgvvgguthgvtghhrdgtohhm
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
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

On 5/25/22 07:34, Jamin Lin wrote:
> AST1030 integrates one set of Parallel GPIO Controller
> with maximum 151 control pins, which are 21 groups
> (A~U, exclude pin: M6 M7 Q5 Q6 Q7 R0 R1 R4 R5 R6 R7 S0 S3 S4
> S5 S6 S7 ) and the group T and U are input only.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



> ---
>   hw/arm/aspeed_ast10x0.c | 11 +++++++++++
>   hw/gpio/aspeed_gpio.c   | 27 +++++++++++++++++++++++++++
>   2 files changed, 38 insertions(+)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index 4271549282..3a6b8122b6 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -113,6 +113,9 @@ static void aspeed_soc_ast1030_init(Object *obj)
>           snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
>           object_initialize_child(obj, "wdt[*]", &s->wdt[i], typename);
>       }
> +
> +    snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
> +    object_initialize_child(obj, "gpio", &s->gpio, typename);
>   }
>   
>   static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
> @@ -260,6 +263,14 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>           sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
>                           sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
>       }
> +
> +    /* GPIO */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio), 0, sc->memmap[ASPEED_DEV_GPIO]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
> +                       aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
>   }
>   
>   static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index 4620ea8e8b..5138fe812b 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -819,6 +819,15 @@ static GPIOSetProperties ast2600_1_8v_set_props[ASPEED_GPIO_MAX_NR_SETS] = {
>       [1] = {0x0000000f,  0x0000000f,  {"18E"} },
>   };
>   
> +static GPIOSetProperties ast1030_set_props[ASPEED_GPIO_MAX_NR_SETS] = {
> +    [0] = {0xffffffff,  0xffffffff,  {"A", "B", "C", "D"} },
> +    [1] = {0xffffffff,  0xffffffff,  {"E", "F", "G", "H"} },
> +    [2] = {0xffffffff,  0xffffffff,  {"I", "J", "K", "L"} },
> +    [3] = {0xffffff3f,  0xffffff3f,  {"M", "N", "O", "P"} },
> +    [4] = {0xff060c1f,  0x00060c1f,  {"Q", "R", "S", "T"} },
> +    [5] = {0x000000ff,  0x00000000,  {"U"} },
> +};
> +
>   static const MemoryRegionOps aspeed_gpio_ops = {
>       .read       = aspeed_gpio_read,
>       .write      = aspeed_gpio_write,
> @@ -971,6 +980,16 @@ static void aspeed_gpio_ast2600_1_8v_class_init(ObjectClass *klass, void *data)
>       agc->reg_table = aspeed_1_8v_gpios;
>   }
>   
> +static void aspeed_gpio_1030_class_init(ObjectClass *klass, void *data)
> +{
> +    AspeedGPIOClass *agc = ASPEED_GPIO_CLASS(klass);
> +
> +    agc->props = ast1030_set_props;
> +    agc->nr_gpio_pins = 151;
> +    agc->nr_gpio_sets = 6;
> +    agc->reg_table = aspeed_3_3v_gpios;
> +}
> +
>   static const TypeInfo aspeed_gpio_info = {
>       .name           = TYPE_ASPEED_GPIO,
>       .parent         = TYPE_SYS_BUS_DEVICE,
> @@ -1008,6 +1027,13 @@ static const TypeInfo aspeed_gpio_ast2600_1_8v_info = {
>       .instance_init  = aspeed_gpio_init,
>   };
>   
> +static const TypeInfo aspeed_gpio_ast1030_info = {
> +    .name           = TYPE_ASPEED_GPIO "-ast1030",
> +    .parent         = TYPE_ASPEED_GPIO,
> +    .class_init     = aspeed_gpio_1030_class_init,
> +    .instance_init  = aspeed_gpio_init,
> +};
> +
>   static void aspeed_gpio_register_types(void)
>   {
>       type_register_static(&aspeed_gpio_info);
> @@ -1015,6 +1041,7 @@ static void aspeed_gpio_register_types(void)
>       type_register_static(&aspeed_gpio_ast2500_info);
>       type_register_static(&aspeed_gpio_ast2600_3_3v_info);
>       type_register_static(&aspeed_gpio_ast2600_1_8v_info);
> +    type_register_static(&aspeed_gpio_ast1030_info);
>   }
>   
>   type_init(aspeed_gpio_register_types);


