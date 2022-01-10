Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A94489B4B
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 15:33:41 +0100 (CET)
Received: from localhost ([::1]:43794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6vjw-0008Ig-9d
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 09:33:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n6vhl-0006tH-TZ
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:31:28 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:37719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n6vhi-00073J-4O
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:31:25 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.10])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 9AF42D6C2BF4;
 Mon, 10 Jan 2022 15:31:16 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 15:31:15 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002bcff91f6-6bf7-46bd-869d-c5a566962616,
 A9D23E93096AF6ACD837C7DE23AD2D939339D7DC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <35743221-eee1-ad17-3484-bc02cef82e0a@kaod.org>
Date: Mon, 10 Jan 2022 15:31:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 2/2] hw/arm/aspeed_ast2600: create i3c instance
Content-Language: en-US
To: Troy Lee <troy_lee@aspeedtech.com>, <qemu-devel@nongnu.org>
References: <20220110072125.1886683-1-troy_lee@aspeedtech.com>
 <20220110072125.1886683-3-troy_lee@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220110072125.1886683-3-troy_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8f26b3bf-2ad0-4a98-a569-49bdbdfbf86a
X-Ovh-Tracer-Id: 4842495500019403628
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudehuddggedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 hailin.wu@aspeedtech.com, leetroy@gmail.com,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 08:21, Troy Lee wrote:
> This patch includes i3c instance in ast2600 soc.
> 
> v2: Rebase to mainline QEMU
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> ---
>   hw/arm/aspeed_ast2600.c     | 19 ++++++++++++++++++-
>   include/hw/arm/aspeed_soc.h |  3 +++
>   2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index e33483fb5d..36aa31601a 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -29,7 +29,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
>       [ASPEED_DEV_PWM]       = 0x1E610000,
>       [ASPEED_DEV_FMC]       = 0x1E620000,
>       [ASPEED_DEV_SPI1]      = 0x1E630000,
> -    [ASPEED_DEV_SPI2]      = 0x1E641000,
> +    [ASPEED_DEV_SPI2]      = 0x1E631000,

Indeed ! But this belongs to another patch fixing the value.


>       [ASPEED_DEV_EHCI1]     = 0x1E6A1000,
>       [ASPEED_DEV_EHCI2]     = 0x1E6A3000,
>       [ASPEED_DEV_MII1]      = 0x1E650000,
> @@ -61,6 +61,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
>       [ASPEED_DEV_UART1]     = 0x1E783000,
>       [ASPEED_DEV_UART5]     = 0x1E784000,
>       [ASPEED_DEV_VUART]     = 0x1E787000,
> +    [ASPEED_DEV_I3C]       = 0x1E7A0000,
>       [ASPEED_DEV_SDRAM]     = 0x80000000,
>   };
>   
> @@ -108,6 +109,7 @@ static const int aspeed_soc_ast2600_irqmap[] = {
>       [ASPEED_DEV_ETH4]      = 33,
>       [ASPEED_DEV_KCS]       = 138,   /* 138 -> 142 */
>       [ASPEED_DEV_DP]        = 62,
> +    [ASPEED_DEV_I3C]       = 102,   /* 102 -> 107 */
>   };
>   
>   static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
> @@ -223,6 +225,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
>   
>       snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
>       object_initialize_child(obj, "hace", &s->hace, typename);
> +
> +    object_initialize_child(obj, "i3c", &s->i3c, TYPE_ASPEED_I3C);
>   }
>   
>   /*
> @@ -523,6 +527,19 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_HACE]);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
> +    /* I3C */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i3c), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i3c), 0, sc->memmap[ASPEED_DEV_I3C]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i3c), 0,
> +                       aspeed_soc_get_irq(s, ASPEED_DEV_I3C));

The controller device does not have an IRQ line.

Thanks,

C.



> +    for (i = 0; i < ASPEED_I3C_NR_DEVICES; i++) {
> +        qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore),
> +                                        sc->irqmap[ASPEED_DEV_I3C] + i);
> +        /* The AST2600 I3C controller has one IRQ per bus. */
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i3c.devices[i]), 0, irq);
> +    }
>   }
>   
>   static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 18fb7eed46..cae9906684 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -21,6 +21,7 @@
>   #include "hw/timer/aspeed_timer.h"
>   #include "hw/rtc/aspeed_rtc.h"
>   #include "hw/i2c/aspeed_i2c.h"
> +#include "hw/misc/aspeed_i3c.h"
>   #include "hw/ssi/aspeed_smc.h"
>   #include "hw/misc/aspeed_hace.h"
>   #include "hw/watchdog/wdt_aspeed.h"
> @@ -51,6 +52,7 @@ struct AspeedSoCState {
>       AspeedRtcState rtc;
>       AspeedTimerCtrlState timerctrl;
>       AspeedI2CState i2c;
> +    AspeedI3CState i3c;
>       AspeedSCUState scu;
>       AspeedHACEState hace;
>       AspeedXDMAState xdma;
> @@ -141,6 +143,7 @@ enum {
>       ASPEED_DEV_HACE,
>       ASPEED_DEV_DPMCU,
>       ASPEED_DEV_DP,
> +    ASPEED_DEV_I3C,
>   };
>   
>   #endif /* ASPEED_SOC_H */
> 


