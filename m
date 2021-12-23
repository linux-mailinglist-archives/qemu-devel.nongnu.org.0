Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AA147E441
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 14:56:21 +0100 (CET)
Received: from localhost ([::1]:40920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0OZw-0007Na-NZ
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 08:56:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n0OYY-0006Sc-L0
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 08:54:54 -0500
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:56731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n0OYU-00015v-Sj
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 08:54:52 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.105])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id D406E221AB;
 Thu, 23 Dec 2021 13:54:47 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 23 Dec
 2021 14:54:47 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006a081eba7-e19d-49e8-8f16-6016c3118453,
 8CA006CF2B51D87471028670A5C113E20BDD9F51) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <bcf4643c-6c62-c2c4-76db-7649e9e95225@kaod.org>
Date: Thu, 23 Dec 2021 14:54:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v1 2/2] hw/arm/aspeed_ast2600: create i3c instance
Content-Language: en-US
To: Troy Lee <troy_lee@aspeedtech.com>, <qemu-devel@nongnu.org>,
 <openbmc@lists.ozlabs.org>
References: <20211222092319.2988568-1-troy_lee@aspeedtech.com>
 <20211222092319.2988568-3-troy_lee@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211222092319.2988568-3-troy_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a5ff1ba3-c981-464c-b9c5-a86dcbaffd96
X-Ovh-Tracer-Id: 9198320765851175788
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddruddtkedgheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.264,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 leetroy@gmail.com, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/22/21 10:23, Troy Lee wrote:
> This patch includes i3c instance in ast2600 soc.
>
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>

Looks good but it is based on the QEMU aspeed branch for OpenBMC.
You should rebase on upstream.

Thanks,

C.

> ---
>   hw/arm/aspeed_ast2600.c     | 12 ++++++++++++
>   include/hw/arm/aspeed_soc.h |  3 +++
>   2 files changed, 15 insertions(+)
> 
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index f2fef9d706..219b025bc2 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -63,6 +63,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
>       [ASPEED_DEV_VUART]     = 0x1E787000,
>       [ASPEED_DEV_FSI1]      = 0x1E79B000,
>       [ASPEED_DEV_FSI2]      = 0x1E79B100,
> +    [ASPEED_DEV_I3C]       = 0x1E7A0000,
>       [ASPEED_DEV_SDRAM]     = 0x80000000,
>   };
>   
> @@ -112,6 +113,7 @@ static const int aspeed_soc_ast2600_irqmap[] = {
>       [ASPEED_DEV_FSI1]      = 100,
>       [ASPEED_DEV_FSI2]      = 101,
>       [ASPEED_DEV_DP]        = 62,
> +    [ASPEED_DEV_I3C]       = 102,   /* 102 -> 107 */
>   };
>   
>   static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
> @@ -230,6 +232,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
>   
>       object_initialize_child(obj, "pwm", &s->pwm, TYPE_ASPEED_PWM);
>   
> +    object_initialize_child(obj, "i3c", &s->i3c, TYPE_ASPEED_I3C);
> +
>       object_initialize_child(obj, "fsi[*]", &s->fsi[0], TYPE_ASPEED_APB2OPB);
>   }
>   
> @@ -542,6 +546,14 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->pwm), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_PWM));
>   
> +    /* I3C */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i3c), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i3c), 0, sc->memmap[ASPEED_DEV_I3C]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i3c), 0,
> +                       aspeed_soc_get_irq(s, ASPEED_DEV_I3C));
> +
>       /* FSI */
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->fsi[0]), errp)) {
>           return;
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 0db200d813..0c950fab3c 100644
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
> @@ -53,6 +54,7 @@ struct AspeedSoCState {
>       AspeedRtcState rtc;
>       AspeedTimerCtrlState timerctrl;
>       AspeedI2CState i2c;
> +    AspeedI3CState i3c;
>       AspeedSCUState scu;
>       AspeedHACEState hace;
>       AspeedXDMAState xdma;
> @@ -148,6 +150,7 @@ enum {
>       ASPEED_DEV_FSI2,
>       ASPEED_DEV_DPMCU,
>       ASPEED_DEV_DP,
> +    ASPEED_DEV_I3C,
>   };
>   
>   #endif /* ASPEED_SOC_H */
> 


