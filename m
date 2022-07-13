Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8CC572E11
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 08:19:06 +0200 (CEST)
Received: from localhost ([::1]:50080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBViD-0002aq-K6
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 02:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oBVeh-0000kV-Ll
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 02:15:27 -0400
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:44731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oBVef-0008Jx-82
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 02:15:27 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.128])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 817BC260A6;
 Wed, 13 Jul 2022 06:15:21 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 13 Jul
 2022 08:15:20 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002d9e9464b-fe28-434c-87cf-675b7432ceda,
 B7C06120255AFE5421B63915098EA76FE65B5110) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <b87060c9-5bcb-848c-73f1-86831a20a1fb@kaod.org>
Date: Wed, 13 Jul 2022 08:15:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 2/3] hw/gpio/aspeed: Don't let guests modify input pins
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <thuth@redhat.com>, <lvivier@redhat.com>, <pbonzini@redhat.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220712023219.41065-1-peter@pjd.dev>
 <20220712023219.41065-3-peter@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220712023219.41065-3-peter@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 5381905e-69b8-4883-91b0-fab7de670b25
X-Ovh-Tracer-Id: 7131731487341906735
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudejiedguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheptdehkeelieetvddtlefgveeuheduheetledvtdfgfeffledvjeekjeegledvkeeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
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

On 7/12/22 04:32, Peter Delevoryas wrote:
> Up until now, guests could modify input pins by overwriting the data
> value register. The guest OS should only be allowed to modify output pin
> values, and the QOM property setter should only be permitted to modify
> input pins.
> 
> This change also updates the gpio input pin test to match this
> expectation.
> 
> Andrew suggested this particularly refactoring here:
> 
>      https://lore.kernel.org/qemu-devel/23523aa1-ba81-412b-92cc-8174faba3612@www.fastmail.com/
> 
> Suggested-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> Fixes: 4b7f956862dc ("hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500")
> ---


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


>   hw/gpio/aspeed_gpio.c          | 15 ++++++++-------
>   tests/qtest/aspeed_gpio-test.c |  2 +-
>   2 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index a62a673857..1e267dd482 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -268,7 +268,7 @@ static ptrdiff_t aspeed_gpio_set_idx(AspeedGPIOState *s, GPIOSets *regs)
>   }
>   
>   static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
> -                               uint32_t value)
> +                               uint32_t value, uint32_t mode_mask)
>   {
>       uint32_t input_mask = regs->input_mask;
>       uint32_t direction = regs->direction;
> @@ -277,7 +277,8 @@ static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
>       uint32_t diff;
>       int gpio;
>   
> -    diff = old ^ new;
> +    diff = (old ^ new);
> +    diff &= mode_mask;
>       if (diff) {
>           for (gpio = 0; gpio < ASPEED_GPIOS_PER_SET; gpio++) {
>               uint32_t mask = 1 << gpio;
> @@ -339,7 +340,7 @@ static void aspeed_gpio_set_pin_level(AspeedGPIOState *s, uint32_t set_idx,
>           value &= ~pin_mask;
>       }
>   
> -    aspeed_gpio_update(s, &s->sets[set_idx], value);
> +    aspeed_gpio_update(s, &s->sets[set_idx], value, ~s->sets[set_idx].direction);
>   }
>   
>   /*
> @@ -653,7 +654,7 @@ static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
>           reg_value = update_value_control_source(set, set->data_value,
>                                                   reg_value);
>           set->data_read = reg_value;
> -        aspeed_gpio_update(s, set, reg_value);
> +        aspeed_gpio_update(s, set, reg_value, set->direction);
>           return;
>       case gpio_reg_idx_direction:
>           reg_value = set->direction;
> @@ -753,7 +754,7 @@ static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
>               __func__, offset, data, reg_idx_type);
>           return;
>       }
> -    aspeed_gpio_update(s, set, set->data_value);
> +    aspeed_gpio_update(s, set, set->data_value, UINT32_MAX);
>       return;
>   }
>   
> @@ -799,7 +800,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
>           data &= props->output;
>           data = update_value_control_source(set, set->data_value, data);
>           set->data_read = data;
> -        aspeed_gpio_update(s, set, data);
> +        aspeed_gpio_update(s, set, data, set->direction);
>           return;
>       case gpio_reg_direction:
>           /*
> @@ -875,7 +876,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
>                         PRIx64"\n", __func__, offset);
>           return;
>       }
> -    aspeed_gpio_update(s, set, set->data_value);
> +    aspeed_gpio_update(s, set, set->data_value, UINT32_MAX);
>       return;
>   }
>   
> diff --git a/tests/qtest/aspeed_gpio-test.c b/tests/qtest/aspeed_gpio-test.c
> index 8f52454099..d38f51d719 100644
> --- a/tests/qtest/aspeed_gpio-test.c
> +++ b/tests/qtest/aspeed_gpio-test.c
> @@ -69,7 +69,7 @@ static void test_set_input_pins(const void *data)
>   
>       qtest_writel(s, AST2600_GPIO_BASE + GPIO_ABCD_DATA_VALUE, 0x00000000);
>       value = qtest_readl(s, AST2600_GPIO_BASE + GPIO_ABCD_DATA_VALUE);
> -    g_assert_cmphex(value, ==, 0x00000000);
> +    g_assert_cmphex(value, ==, 0xffffffff);
>   }
>   
>   int main(int argc, char **argv)


