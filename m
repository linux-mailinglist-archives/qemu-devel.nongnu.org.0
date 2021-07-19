Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 043203CE092
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 18:06:33 +0200 (CEST)
Received: from localhost ([::1]:54168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Vmq-0000gL-Bn
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 12:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1m5Vif-0004D5-2m; Mon, 19 Jul 2021 12:02:13 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:46641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1m5Vib-0005aU-0H; Mon, 19 Jul 2021 12:02:12 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.173])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 766D1B4DC47D;
 Mon, 19 Jul 2021 18:02:04 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 19 Jul
 2021 18:02:03 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00519c6aee6-6183-4373-8786-a4a95aee2ab1,
 5C81DEF932CE68F5B4ADF8C6EB3FE0DC56E33E11) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [SPAM] [PATCH v2 1/3] hw: aspeed_gpio: Fix memory size
To: Joel Stanley <joel@jms.id.au>
References: <20210713065854.134634-1-joel@jms.id.au>
 <20210713065854.134634-2-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <7c5dd20c-4710-4bdb-605f-e35ed7bfb35a@kaod.org>
Date: Mon, 19 Jul 2021 18:02:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713065854.134634-2-joel@jms.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 37fa16a8-2650-4d23-ab05-d45063835919
X-Ovh-Tracer-Id: 11672204335298939811
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrfedtgdelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghu
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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
> The macro used to calculate the maximum memory size of the MMIO region
> had a mistake, causing all GPIO models to create a mapping of 0x9D8.
> The intent was to have it be 0x9D8 - 0x800.
> 
> This extra size doesn't matter on ast2400 and ast2500, which have a 4KB
> region set aside for the GPIO controller.
> 
> On the ast2600 the 3.3V and 1.8V GPIO controllers are 2KB apart, so the
> regions would overlap. Worse was the 1.8V controller would map over the
> top of the following perianal, which happens to be the RTC.
> 
> The mmio region used by each device is a maximum of 2KB, so avoid the
> calculations and hard code this as the maximum.
> 
> Fixes: 36d737ee82b2 ("hw/gpio: Add in AST2600 specific implementation")
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  hw/gpio/aspeed_gpio.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index 6ae0116be70b..b3dec4448009 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -207,7 +207,6 @@
>  #define GPIO_1_8V_MEM_SIZE            0x9D8
>  #define GPIO_1_8V_REG_ARRAY_SIZE      ((GPIO_1_8V_MEM_SIZE - \
>                                        GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_MAX_MEM_SIZE           MAX(GPIO_3_6V_MEM_SIZE, GPIO_1_8V_MEM_SIZE)
>  
>  static int aspeed_evaluate_irq(GPIOSets *regs, int gpio_prev_high, int gpio)
>  {
> @@ -849,7 +848,7 @@ static void aspeed_gpio_realize(DeviceState *dev, Error **errp)
>      }
>  
>      memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_gpio_ops, s,
> -            TYPE_ASPEED_GPIO, GPIO_MAX_MEM_SIZE);
> +            TYPE_ASPEED_GPIO, 0x800);
>  
>      sysbus_init_mmio(sbd, &s->iomem);
>  }
> 


