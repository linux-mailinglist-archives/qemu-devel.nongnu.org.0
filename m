Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B15525B0D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 07:37:34 +0200 (CEST)
Received: from localhost ([::1]:39958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npNzY-0002b4-Ql
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 01:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1npNtz-0001kr-AZ
 for qemu-devel@nongnu.org; Fri, 13 May 2022 01:31:52 -0400
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:41655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1npNtv-0001Ad-FA
 for qemu-devel@nongnu.org; Fri, 13 May 2022 01:31:45 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.186])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id CD84E2042E;
 Fri, 13 May 2022 05:31:39 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 13 May
 2022 07:31:39 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00122cfcf4c-0516-4dac-b53a-6efc531aabc6,
 7E3099CCCDBDCA9B64B55F14ACBFF9980A3F1D3F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <443933f2-069f-df96-ec62-76c21fc644b2@kaod.org>
Date: Fri, 13 May 2022 07:31:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] hw: aspeed: Init all UART's with serial devices
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <irischenlj@fb.com>, <patrick@stwcx.xyz>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <zev@bewilderbeest.net>, <openbmc@lists.ozlabs.org>, 
 <andrew@aj.id.au>, <peter.maydell@linaro.org>, <joel@jms.id.au>
References: <20220513040220.3657135-1-pdel@fb.com>
 <20220513040220.3657135-3-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220513040220.3657135-3-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c3985cfe-6c89-4949-8446-cbf94258a2c9
X-Ovh-Tracer-Id: 17094256813194120114
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrgeekgdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffeggfekveevvddvffelfeehleffhffhteegkeduueevffffkeejieevffeltdfhnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghu
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
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

On 5/13/22 06:02, Peter Delevoryas wrote:
> Usually, QEMU users just provide one serial device on the command line,
> either through "-nographic" or "-serial stdio -display none", or just using
> VNC and popping up a window. We try to match what the user expects, which is
> to connect the first (and usually only) serial device to the UART a board is
> using as serial0.
> 
> Most Aspeed machines in hw/arm/aspeed.c use UART5 for serial0 in their
> device tree, so we connect UART5 to the first serial device. Some machines
> use UART1 though, or UART3, so the uart_default property lets us specify
> that in a board definition.
> 
> In order to specify a nonstandard serial0 UART, a user basically *must* add
> a new board definition in hw/arm/aspeed.c. There's no way to do this without
> recompiling QEMU, besides constructing the machine completely from scratch
> on the command line.
> 
> To provide more flexibility, we can also support the user specifying more
> serial devices, and connect them to the UART memory regions if possible.
> Even if a user doesn't specify any extra serial devices, it's useful to
> initialize these memory regions as UART's, so that they respond to the guest
> OS more naturally. At the moment, they will just always return zero's for
> everything, and some UART registers have a default non-zero state.
> 
> With this change, if a new OpenBMC image uses UART3 or some other
> nonstandard UART for serial0, you can still use it with the EVB without
> recompiling QEMU, even though uart-default=UART5 for the EVB.
> 
> For example, Facebook's Wedge100 BMC uses UART3: you can fetch an image from
> Github[1] and get the serial console output even while running the palmetto
> machine type, because we explicitly specify that we want UART3 to be
> connected to stdio.
> 
>      qemu-system-arm -machine palmetto-bmc \
>          -drive file=wedge100.mtd,format=raw,if=mtd \
>          -serial null -serial null -serial null -serial stdio -display none
> 
> Similarly, you can boot a Fuji BMC image[2], which uses UART1, using the
> AST2600 EVB machine:
> 
>      qemu-system-arm -machine ast2600-evb \
>          -drive file=fuji.mtd,format=raw,if=mtd \
>          -serial null -serial stdio -display none
> 
> This is kind of complicated, of course: it might be more natural to get rid
> of the uart_default attribute completely, and initialize UART's
> sequentially. But, keeping backward compatibility and the way most users
> know how to use QEMU in mind, this seems to make the most sense.
> 
> [1] https://github.com/facebook/openbmc/releases/download/v2021.49.0/wedge100.mtd
> [2] https://github.com/facebook/openbmc/releases/download/v2021.49.0/fuji.mtd
> 
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>   hw/arm/aspeed_ast10x0.c | 14 +++++++++++---
>   hw/arm/aspeed_ast2600.c | 10 +++++++++-
>   hw/arm/aspeed_soc.c     | 10 +++++++++-
>   3 files changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index f65dc139da..5e6f3a8fed 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -215,10 +215,18 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>                          qdev_get_gpio_in(DEVICE(&s->armv7m),
>                                   sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_4));
>   
> -    /* UART5 - attach an 8250 to the IO space as our UART */
> -    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
> -                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5),
> +    /* UART - attach 8250's to the IO space for each UART */
> +    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
> +                   aspeed_soc_get_irq(s, s->uart_default),

That's a fix for aspeed_ast10x0 that should come first.

>                      38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
> +    for (int i = 1, uart = ASPEED_DEV_UART1; i < 13; i++, uart++) {

'13' should be a AspeecSoCClass attribute. The number of uarts varies
depending on the SoC model and we might want to model that one day.

> +        if (uart == s->uart_default) {
> +            uart++;
> +        }

Shouldn't we test serial_hd(i) validity ?

Thanks,

C.

> +        serial_mm_init(get_system_memory(), sc->memmap[uart], 2,
> +                       aspeed_soc_get_irq(s, uart), 38400, serial_hd(i),
> +                       DEVICE_LITTLE_ENDIAN);
> +    }
>   
>       /* Timer */
>       object_property_set_link(OBJECT(&s->timerctrl), "scu", OBJECT(&s->scu),
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 1b72800682..cbeca7f655 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -372,10 +372,18 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
>   
> -    /* UART - attach an 8250 to the IO space as our UART */
> +    /* UART - attach 8250's to the IO space for each UART */
>       serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
>                      aspeed_soc_get_irq(s, s->uart_default), 38400,
>                      serial_hd(0), DEVICE_LITTLE_ENDIAN);
> +    for (int i = 1, uart = ASPEED_DEV_UART1; i < 13; i++, uart++) {
> +        if (uart == s->uart_default) {
> +            uart++;
> +        }
> +        serial_mm_init(get_system_memory(), sc->memmap[uart], 2,
> +                       aspeed_soc_get_irq(s, uart), 38400, serial_hd(i),
> +                       DEVICE_LITTLE_ENDIAN);
> +    }
>   
>       /* I2C */
>       object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 2cd03d49da..1fc1ed808d 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -303,10 +303,18 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
>   
> -    /* UART - attach an 8250 to the IO space as our UART */
> +    /* UART - attach 8250's to the IO space for each UART */
>       serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
>                      aspeed_soc_get_irq(s, s->uart_default), 38400,
>                      serial_hd(0), DEVICE_LITTLE_ENDIAN);
> +    for (int i = 1, uart = ASPEED_DEV_UART1; i < 5; i++, uart++) {
> +        if (uart == s->uart_default) {
> +            uart++;
> +        }
> +        serial_mm_init(get_system_memory(), sc->memmap[uart], 2,
> +                       aspeed_soc_get_irq(s, uart), 38400, serial_hd(i),
> +                       DEVICE_LITTLE_ENDIAN);
> +    }
>   
>       /* I2C */
>       object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),


