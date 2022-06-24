Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217BA5593D7
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 09:00:18 +0200 (CEST)
Received: from localhost ([::1]:55312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4dIf-0005NB-6r
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 03:00:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4dEq-0001Yh-PG
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 02:56:21 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:57369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4dEm-0005ES-3e
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 02:56:20 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.109])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 450001109BBA1;
 Fri, 24 Jun 2022 08:56:14 +0200 (CEST)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 24 Jun
 2022 08:56:13 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0045375c275-4ef6-42be-b36f-7c523d033b0d,
 5EF2319963E9DB1A14486A5EC8730A2EE4B20F29) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7361351e-2989-717c-7561-744624441808@kaod.org>
Date: Fri, 24 Jun 2022 08:56:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 3/8] aspeed: Remove usage of sysbus_mmio_map
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20220624003701.1363500-1-pdel@fb.com>
 <20220624003701.1363500-4-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220624003701.1363500-4-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 29a4aab6-3d9a-4a2f-80cc-6be4193b9a27
X-Ovh-Tracer-Id: 6921469678040812512
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefkedgudduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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

On 6/24/22 02:36, Peter Delevoryas wrote:
> sysbus_mmio_map maps devices into "get_system_memory()".
> 
> With the new SoC memory attribute, we want to make sure that each device is
> mapped into the SoC memory.
> 
> In single SoC machines, the SoC memory is the same as "get_system_memory()",
> but in multi SoC machines it will be different.
> 
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>


Thanks,

C.


> ---
>   hw/arm/aspeed_ast10x0.c     | 25 +++++++++---------
>   hw/arm/aspeed_ast2600.c     | 51 ++++++++++++++++++++-----------------
>   hw/arm/aspeed_soc.c         | 47 ++++++++++++++++++++--------------
>   include/hw/arm/aspeed_soc.h |  1 +
>   4 files changed, 69 insertions(+), 55 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index e074f80cc7..f8f321374a 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -188,7 +188,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, sc->memmap[ASPEED_DEV_SCU]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->scu), 0, sc->memmap[ASPEED_DEV_SCU]);
>   
>       /* I2C */
>   
> @@ -197,7 +197,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV_I2C]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV_I2C]);
>       for (i = 0; i < ASPEED_I2C_GET_CLASS(&s->i2c)->num_busses; i++) {
>           qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->armv7m),
>                                           sc->irqmap[ASPEED_DEV_I2C] + i);
> @@ -209,7 +209,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->lpc), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV_LPC]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV_LPC]);
>   
>       /* Connect the LPC IRQ to the GIC. It is otherwise unused. */
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 0,
> @@ -243,7 +243,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->timerctrl), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->timerctrl), 0,
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->timerctrl), 0,
>                       sc->memmap[ASPEED_DEV_TIMER1]);
>       for (i = 0; i < ASPEED_TIMER_NR_TIMERS; i++) {
>           qemu_irq irq = aspeed_soc_get_irq(s, ASPEED_DEV_TIMER1 + i);
> @@ -254,7 +254,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->adc), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->adc), 0, sc->memmap[ASPEED_DEV_ADC]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->adc), 0, sc->memmap[ASPEED_DEV_ADC]);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
>   
> @@ -264,8 +264,8 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->fmc), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 0, sc->memmap[ASPEED_DEV_FMC]);
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 1,
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->fmc), 0, sc->memmap[ASPEED_DEV_FMC]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->fmc), 1,
>                       ASPEED_SMC_GET_CLASS(&s->fmc)->flash_window_base);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->fmc), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_FMC));
> @@ -277,9 +277,9 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>           if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi[i]), errp)) {
>               return;
>           }
> -        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0,
> +        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->spi[i]), 0,
>                           sc->memmap[ASPEED_DEV_SPI1 + i]);
> -        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 1,
> +        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->spi[i]), 1,
>                           ASPEED_SMC_GET_CLASS(&s->spi[i])->flash_window_base);
>       }
>   
> @@ -287,7 +287,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->sbc), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sbc), 0, sc->memmap[ASPEED_DEV_SBC]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sbc), 0, sc->memmap[ASPEED_DEV_SBC]);
>   
>       /* Watch dog */
>       for (i = 0; i < sc->wdts_num; i++) {
> @@ -298,7 +298,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>           if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
>               return;
>           }
> -        sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
> +        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
>                           sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
>       }
>   
> @@ -306,7 +306,8 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio), 0, sc->memmap[ASPEED_DEV_GPIO]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->gpio), 0,
> +                    sc->memmap[ASPEED_DEV_GPIO]);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
>   }
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index d8e5b607e9..477dd36042 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -310,7 +310,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>                               &error_abort);
>   
>       sysbus_realize(SYS_BUS_DEVICE(&s->a7mpcore), &error_abort);
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->a7mpcore), 0, ASPEED_A7MPCORE_ADDR);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->a7mpcore), 0, ASPEED_A7MPCORE_ADDR);
>   
>       for (i = 0; i < sc->num_cpus; i++) {
>           SysBusDevice *sbd = SYS_BUS_DEVICE(&s->a7mpcore);
> @@ -344,13 +344,13 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, sc->memmap[ASPEED_DEV_SCU]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->scu), 0, sc->memmap[ASPEED_DEV_SCU]);
>   
>       /* RTC */
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->rtc), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->rtc), 0, sc->memmap[ASPEED_DEV_RTC]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->rtc), 0, sc->memmap[ASPEED_DEV_RTC]);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->rtc), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_RTC));
>   
> @@ -360,7 +360,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->timerctrl), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->timerctrl), 0,
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->timerctrl), 0,
>                       sc->memmap[ASPEED_DEV_TIMER1]);
>       for (i = 0; i < ASPEED_TIMER_NR_TIMERS; i++) {
>           qemu_irq irq = aspeed_soc_get_irq(s, ASPEED_DEV_TIMER1 + i);
> @@ -371,7 +371,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->adc), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->adc), 0, sc->memmap[ASPEED_DEV_ADC]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->adc), 0, sc->memmap[ASPEED_DEV_ADC]);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
>   
> @@ -384,7 +384,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV_I2C]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV_I2C]);
>       for (i = 0; i < ASPEED_I2C_GET_CLASS(&s->i2c)->num_busses; i++) {
>           qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore),
>                                           sc->irqmap[ASPEED_DEV_I2C] + i);
> @@ -398,8 +398,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->fmc), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 0, sc->memmap[ASPEED_DEV_FMC]);
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 1,
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->fmc), 0, sc->memmap[ASPEED_DEV_FMC]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->fmc), 1,
>                       ASPEED_SMC_GET_CLASS(&s->fmc)->flash_window_base);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->fmc), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_FMC));
> @@ -411,9 +411,9 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>           if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi[i]), errp)) {
>               return;
>           }
> -        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0,
> +        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->spi[i]), 0,
>                           sc->memmap[ASPEED_DEV_SPI1 + i]);
> -        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 1,
> +        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->spi[i]), 1,
>                           ASPEED_SMC_GET_CLASS(&s->spi[i])->flash_window_base);
>       }
>   
> @@ -422,7 +422,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>           if (!sysbus_realize(SYS_BUS_DEVICE(&s->ehci[i]), errp)) {
>               return;
>           }
> -        sysbus_mmio_map(SYS_BUS_DEVICE(&s->ehci[i]), 0,
> +        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->ehci[i]), 0,
>                           sc->memmap[ASPEED_DEV_EHCI1 + i]);
>           sysbus_connect_irq(SYS_BUS_DEVICE(&s->ehci[i]), 0,
>                              aspeed_soc_get_irq(s, ASPEED_DEV_EHCI1 + i));
> @@ -432,7 +432,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->sdmc), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, sc->memmap[ASPEED_DEV_SDMC]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sdmc), 0,
> +                    sc->memmap[ASPEED_DEV_SDMC]);
>   
>       /* Watch dog */
>       for (i = 0; i < sc->wdts_num; i++) {
> @@ -443,7 +444,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>           if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
>               return;
>           }
> -        sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
> +        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
>                           sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
>       }
>   
> @@ -454,7 +455,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>           if (!sysbus_realize(SYS_BUS_DEVICE(&s->ftgmac100[i]), errp)) {
>               return;
>           }
> -        sysbus_mmio_map(SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
> +        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
>                           sc->memmap[ASPEED_DEV_ETH1 + i]);
>           sysbus_connect_irq(SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
>                              aspeed_soc_get_irq(s, ASPEED_DEV_ETH1 + i));
> @@ -465,7 +466,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>               return;
>           }
>   
> -        sysbus_mmio_map(SYS_BUS_DEVICE(&s->mii[i]), 0,
> +        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->mii[i]), 0,
>                           sc->memmap[ASPEED_DEV_MII1 + i]);
>       }
>   
> @@ -473,7 +474,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->xdma), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->xdma), 0,
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->xdma), 0,
>                       sc->memmap[ASPEED_DEV_XDMA]);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->xdma), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_XDMA));
> @@ -482,14 +483,14 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio), 0, sc->memmap[ASPEED_DEV_GPIO]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->gpio), 0, sc->memmap[ASPEED_DEV_GPIO]);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
>   
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio_1_8v), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio_1_8v), 0,
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->gpio_1_8v), 0,
>                       sc->memmap[ASPEED_DEV_GPIO_1_8V]);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio_1_8v), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_GPIO_1_8V));
> @@ -498,7 +499,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->sdhci), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdhci), 0,
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sdhci), 0,
>                       sc->memmap[ASPEED_DEV_SDHCI]);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_SDHCI));
> @@ -507,7 +508,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->emmc), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->emmc), 0, sc->memmap[ASPEED_DEV_EMMC]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->emmc), 0,
> +                    sc->memmap[ASPEED_DEV_EMMC]);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->emmc), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_EMMC));
>   
> @@ -515,7 +517,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->lpc), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV_LPC]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV_LPC]);
>   
>       /* Connect the LPC IRQ to the GIC. It is otherwise unused. */
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 0,
> @@ -551,7 +553,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->hace), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_HACE]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->hace), 0,
> +                    sc->memmap[ASPEED_DEV_HACE]);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
>   
> @@ -559,7 +562,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->i3c), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i3c), 0, sc->memmap[ASPEED_DEV_I3C]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->i3c), 0, sc->memmap[ASPEED_DEV_I3C]);
>       for (i = 0; i < ASPEED_I3C_NR_DEVICES; i++) {
>           qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore),
>                                           sc->irqmap[ASPEED_DEV_I3C] + i);
> @@ -571,7 +574,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->sbc), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sbc), 0, sc->memmap[ASPEED_DEV_SBC]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sbc), 0, sc->memmap[ASPEED_DEV_SBC]);
>   }
>   
>   static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 3b531519e9..46cbc63644 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -268,13 +268,13 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, sc->memmap[ASPEED_DEV_SCU]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->scu), 0, sc->memmap[ASPEED_DEV_SCU]);
>   
>       /* VIC */
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->vic), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->vic), 0, sc->memmap[ASPEED_DEV_VIC]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->vic), 0, sc->memmap[ASPEED_DEV_VIC]);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->vic), 0,
>                          qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_IRQ));
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->vic), 1,
> @@ -284,7 +284,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->rtc), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->rtc), 0, sc->memmap[ASPEED_DEV_RTC]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->rtc), 0, sc->memmap[ASPEED_DEV_RTC]);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->rtc), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_RTC));
>   
> @@ -294,7 +294,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->timerctrl), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->timerctrl), 0,
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->timerctrl), 0,
>                       sc->memmap[ASPEED_DEV_TIMER1]);
>       for (i = 0; i < ASPEED_TIMER_NR_TIMERS; i++) {
>           qemu_irq irq = aspeed_soc_get_irq(s, ASPEED_DEV_TIMER1 + i);
> @@ -305,7 +305,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->adc), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->adc), 0, sc->memmap[ASPEED_DEV_ADC]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->adc), 0, sc->memmap[ASPEED_DEV_ADC]);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
>   
> @@ -318,7 +318,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV_I2C]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV_I2C]);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_I2C));
>   
> @@ -328,8 +328,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->fmc), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 0, sc->memmap[ASPEED_DEV_FMC]);
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 1,
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->fmc), 0, sc->memmap[ASPEED_DEV_FMC]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->fmc), 1,
>                       ASPEED_SMC_GET_CLASS(&s->fmc)->flash_window_base);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->fmc), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_FMC));
> @@ -339,9 +339,9 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>           if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi[i]), errp)) {
>               return;
>           }
> -        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0,
> +        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->spi[i]), 0,
>                           sc->memmap[ASPEED_DEV_SPI1 + i]);
> -        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 1,
> +        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->spi[i]), 1,
>                           ASPEED_SMC_GET_CLASS(&s->spi[i])->flash_window_base);
>       }
>   
> @@ -350,7 +350,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>           if (!sysbus_realize(SYS_BUS_DEVICE(&s->ehci[i]), errp)) {
>               return;
>           }
> -        sysbus_mmio_map(SYS_BUS_DEVICE(&s->ehci[i]), 0,
> +        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->ehci[i]), 0,
>                           sc->memmap[ASPEED_DEV_EHCI1 + i]);
>           sysbus_connect_irq(SYS_BUS_DEVICE(&s->ehci[i]), 0,
>                              aspeed_soc_get_irq(s, ASPEED_DEV_EHCI1 + i));
> @@ -360,7 +360,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->sdmc), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, sc->memmap[ASPEED_DEV_SDMC]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sdmc), 0,
> +                    sc->memmap[ASPEED_DEV_SDMC]);
>   
>       /* Watch dog */
>       for (i = 0; i < sc->wdts_num; i++) {
> @@ -371,7 +372,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>           if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
>               return;
>           }
> -        sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
> +        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
>                           sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
>       }
>   
> @@ -382,7 +383,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>           if (!sysbus_realize(SYS_BUS_DEVICE(&s->ftgmac100[i]), errp)) {
>               return;
>           }
> -        sysbus_mmio_map(SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
> +        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
>                           sc->memmap[ASPEED_DEV_ETH1 + i]);
>           sysbus_connect_irq(SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
>                              aspeed_soc_get_irq(s, ASPEED_DEV_ETH1 + i));
> @@ -392,7 +393,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->xdma), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->xdma), 0,
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->xdma), 0,
>                       sc->memmap[ASPEED_DEV_XDMA]);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->xdma), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_XDMA));
> @@ -401,7 +402,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio), 0, sc->memmap[ASPEED_DEV_GPIO]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->gpio), 0,
> +                    sc->memmap[ASPEED_DEV_GPIO]);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
>   
> @@ -409,7 +411,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->sdhci), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdhci), 0,
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sdhci), 0,
>                       sc->memmap[ASPEED_DEV_SDHCI]);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_SDHCI));
> @@ -418,7 +420,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->lpc), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV_LPC]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV_LPC]);
>   
>       /* Connect the LPC IRQ to the VIC */
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 0,
> @@ -451,7 +453,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->hace), errp)) {
>           return;
>       }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_HACE]);
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->hace), 0,
> +                    sc->memmap[ASPEED_DEV_HACE]);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
>   }
> @@ -602,3 +605,9 @@ bool aspeed_soc_dram_init(AspeedSoCState *s, Error **errp)
>                                   &s->dram_container);
>       return true;
>   }
> +
> +void aspeed_mmio_map(AspeedSoCState *s, SysBusDevice *dev, int n, hwaddr addr)
> +{
> +    memory_region_add_subregion(s->memory, addr,
> +                                sysbus_mmio_get_region(dev, n));
> +}
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index c8e903b821..1ab328d00c 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -168,5 +168,6 @@ enum {
>   qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
>   void aspeed_soc_uart_init(AspeedSoCState *s);
>   bool aspeed_soc_dram_init(AspeedSoCState *s, Error **errp);
> +void aspeed_mmio_map(AspeedSoCState *s, SysBusDevice *dev, int n, hwaddr addr);
>   
>   #endif /* ASPEED_SOC_H */


