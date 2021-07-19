Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3FD3CE0B4
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 18:09:13 +0200 (CEST)
Received: from localhost ([::1]:35690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5VpQ-0007GH-5Q
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 12:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1m5Vj9-0004jl-9j
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:02:44 -0400
Received: from 8.mo52.mail-out.ovh.net ([46.105.37.156]:60165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1m5Vj6-0005vj-ED
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:02:42 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.22])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 3A5A1288110;
 Mon, 19 Jul 2021 18:02:37 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 19 Jul
 2021 18:02:36 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002800e77bb-c648-4a6a-8127-6a75136583fd,
 5C81DEF932CE68F5B4ADF8C6EB3FE0DC56E33E11) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [SPAM] [PATCH v2 3/3] hw: aspeed_gpio: Clarify GPIO controller
 name
To: Joel Stanley <joel@jms.id.au>
References: <20210713065854.134634-1-joel@jms.id.au>
 <20210713065854.134634-4-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <51d4bd19-39d7-d211-7cba-8ef74b859a80@kaod.org>
Date: Mon, 19 Jul 2021 18:02:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713065854.134634-4-joel@jms.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7df562e3-3049-4b32-9e23-6d79d721080e
X-Ovh-Tracer-Id: 11681211536934931363
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrfedtgdelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo52.mail-out.ovh.net
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Rashmica Gupta <rashmica.g@gmail.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 8:58 AM, Joel Stanley wrote:
> There are two GPIO controllers in the ast2600; one is 3.3V and the other
> is 1.8V.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  hw/gpio/aspeed_gpio.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index dc721aec5da7..dfa6d6cb40a9 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -164,12 +164,12 @@
>  #define GPIO_YZAAAB_DIRECTION      (0x1E4 >> 2)
>  #define GPIO_AC_DATA_VALUE         (0x1E8 >> 2)
>  #define GPIO_AC_DIRECTION          (0x1EC >> 2)
> -#define GPIO_3_6V_MEM_SIZE         0x1F0
> -#define GPIO_3_6V_REG_ARRAY_SIZE   (GPIO_3_6V_MEM_SIZE >> 2)
> +#define GPIO_3_3V_MEM_SIZE         0x1F0
> +#define GPIO_3_3V_REG_ARRAY_SIZE   (GPIO_3_3V_MEM_SIZE >> 2)
>  
>  /* AST2600 only - 1.8V gpios */
>  /*
> - * The AST2600 two copies of the GPIO controller: the same 3.6V gpios as the
> + * The AST2600 two copies of the GPIO controller: the same 3.3V gpios as the
>   * AST2400 (memory offsets 0x0-0x198) and a second controller with 1.8V gpios
>   * (memory offsets 0x800-0x9D4).
>   */
> @@ -380,7 +380,7 @@ static uint32_t update_value_control_source(GPIOSets *regs, uint32_t old_value,
>      return new_value;
>  }
>  
> -static const AspeedGPIOReg aspeed_3_6v_gpios[GPIO_3_6V_REG_ARRAY_SIZE] = {
> +static const AspeedGPIOReg aspeed_3_3v_gpios[GPIO_3_3V_REG_ARRAY_SIZE] = {
>      /* Set ABCD */
>      [GPIO_ABCD_DATA_VALUE] =     { 0, gpio_reg_data_value },
>      [GPIO_ABCD_DIRECTION] =      { 0, gpio_reg_direction },
> @@ -800,7 +800,7 @@ static const GPIOSetProperties ast2500_set_props[] = {
>      [7] = {0x000000ff,  0x000000ff,  {"AC"} },
>  };
>  
> -static GPIOSetProperties ast2600_3_6v_set_props[] = {
> +static GPIOSetProperties ast2600_3_3v_set_props[] = {
>      [0] = {0xffffffff,  0xffffffff,  {"A", "B", "C", "D"} },
>      [1] = {0xffffffff,  0xffffffff,  {"E", "F", "G", "H"} },
>      [2] = {0xffffffff,  0xffffffff,  {"I", "J", "K", "L"} },
> @@ -927,7 +927,7 @@ static void aspeed_gpio_ast2400_class_init(ObjectClass *klass, void *data)
>      agc->nr_gpio_pins = 216;
>      agc->nr_gpio_sets = 7;
>      agc->gap = 196;
> -    agc->reg_table = aspeed_3_6v_gpios;
> +    agc->reg_table = aspeed_3_3v_gpios;
>  }
>  
>  static void aspeed_gpio_2500_class_init(ObjectClass *klass, void *data)
> @@ -938,17 +938,17 @@ static void aspeed_gpio_2500_class_init(ObjectClass *klass, void *data)
>      agc->nr_gpio_pins = 228;
>      agc->nr_gpio_sets = 8;
>      agc->gap = 220;
> -    agc->reg_table = aspeed_3_6v_gpios;
> +    agc->reg_table = aspeed_3_3v_gpios;
>  }
>  
> -static void aspeed_gpio_ast2600_3_6v_class_init(ObjectClass *klass, void *data)
> +static void aspeed_gpio_ast2600_3_3v_class_init(ObjectClass *klass, void *data)
>  {
>      AspeedGPIOClass *agc = ASPEED_GPIO_CLASS(klass);
>  
> -    agc->props = ast2600_3_6v_set_props;
> +    agc->props = ast2600_3_3v_set_props;
>      agc->nr_gpio_pins = 208;
>      agc->nr_gpio_sets = 7;
> -    agc->reg_table = aspeed_3_6v_gpios;
> +    agc->reg_table = aspeed_3_3v_gpios;
>  }
>  
>  static void aspeed_gpio_ast2600_1_8v_class_init(ObjectClass *klass, void *data)
> @@ -984,10 +984,10 @@ static const TypeInfo aspeed_gpio_ast2500_info = {
>      .instance_init  = aspeed_gpio_init,
>  };
>  
> -static const TypeInfo aspeed_gpio_ast2600_3_6v_info = {
> +static const TypeInfo aspeed_gpio_ast2600_3_3v_info = {
>      .name           = TYPE_ASPEED_GPIO "-ast2600",
>      .parent         = TYPE_ASPEED_GPIO,
> -    .class_init     = aspeed_gpio_ast2600_3_6v_class_init,
> +    .class_init     = aspeed_gpio_ast2600_3_3v_class_init,
>      .instance_init  = aspeed_gpio_init,
>  };
>  
> @@ -1003,7 +1003,7 @@ static void aspeed_gpio_register_types(void)
>      type_register_static(&aspeed_gpio_info);
>      type_register_static(&aspeed_gpio_ast2400_info);
>      type_register_static(&aspeed_gpio_ast2500_info);
> -    type_register_static(&aspeed_gpio_ast2600_3_6v_info);
> +    type_register_static(&aspeed_gpio_ast2600_3_3v_info);
>      type_register_static(&aspeed_gpio_ast2600_1_8v_info);
>  }
>  
> 


