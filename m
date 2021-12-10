Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2128747026D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 15:07:00 +0100 (CET)
Received: from localhost ([::1]:55830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvgY6-0007qw-WA
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 09:06:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mvgWw-0006za-Hd
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 09:05:47 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:33561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mvgWu-0005Pv-7b
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 09:05:46 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.250])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id BAFFCD1212B2;
 Fri, 10 Dec 2021 15:05:40 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Fri, 10 Dec
 2021 15:05:39 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001ebf0e436-1375-4f7c-a038-19b6b0cb698f,
 C80FE4A66E5B5B4A0E1D48CB2EFD2B2F83D6D903) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <914155fd-646e-b551-9c54-3b132a5abfa5@kaod.org>
Date: Fri, 10 Dec 2021 15:05:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v1] Add dummy Aspeed AST2600 Display Port MCU (DPMCU)
Content-Language: en-US
To: Troy Lee <troy_lee@aspeedtech.com>, <qemu-devel@nongnu.org>
References: <20211210083034.726610-1-troy_lee@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211210083034.726610-1-troy_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 71b9bd2a-f0c3-4eb3-ad13-e6dc41a6c117
X-Ovh-Tracer-Id: 6824079338113305449
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrkedvgdeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.317,
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

On 12/10/21 09:30, Troy Lee wrote:
> AST2600 Display Port MCU introduces 0x18000000~0x1803FFFF as it's memory
> and io address. If guest machine try to access DPMCU memory, it will
> cause a fatal error.

The Aspeed SoCs have an "aspeed_soc.io" region for unimplemented devices
but it's too small. Anyhow, it is better to have per logic unit. We should
change that one day.

For my information, which FW image are you using ?

> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/arm/aspeed_ast2600.c     | 8 ++++++++
>   include/hw/arm/aspeed_soc.h | 2 ++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 0384357a95..e33483fb5d 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -19,9 +19,11 @@
>   #include "sysemu/sysemu.h"
>   
>   #define ASPEED_SOC_IOMEM_SIZE       0x00200000
> +#define ASPEED_SOC_DPMCU_SIZE       0x00040000
>   
>   static const hwaddr aspeed_soc_ast2600_memmap[] = {
>       [ASPEED_DEV_SRAM]      = 0x10000000,
> +    [ASPEED_DEV_DPMCU]     = 0x18000000,
>       /* 0x16000000     0x17FFFFFF : AHB BUS do LPC Bus bridge */
>       [ASPEED_DEV_IOMEM]     = 0x1E600000,
>       [ASPEED_DEV_PWM]       = 0x1E610000,
> @@ -44,6 +46,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
>       [ASPEED_DEV_SCU]       = 0x1E6E2000,
>       [ASPEED_DEV_XDMA]      = 0x1E6E7000,
>       [ASPEED_DEV_ADC]       = 0x1E6E9000,
> +    [ASPEED_DEV_DP]        = 0x1E6EB000,
>       [ASPEED_DEV_VIDEO]     = 0x1E700000,
>       [ASPEED_DEV_SDHCI]     = 0x1E740000,
>       [ASPEED_DEV_EMMC]      = 0x1E750000,
> @@ -104,6 +107,7 @@ static const int aspeed_soc_ast2600_irqmap[] = {
>       [ASPEED_DEV_ETH3]      = 32,
>       [ASPEED_DEV_ETH4]      = 33,
>       [ASPEED_DEV_KCS]       = 138,   /* 138 -> 142 */
> +    [ASPEED_DEV_DP]        = 62,
>   };
>   
>   static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
> @@ -298,6 +302,10 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       memory_region_add_subregion(get_system_memory(),
>                                   sc->memmap[ASPEED_DEV_SRAM], &s->sram);
>   
> +    /* DPMCU */
> +    create_unimplemented_device("aspeed.dpmcu", sc->memmap[ASPEED_DEV_DPMCU],
> +                                ASPEED_SOC_DPMCU_SIZE);
> +
>       /* SCU */
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
>           return;
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 8139358549..18fb7eed46 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -139,6 +139,8 @@ enum {
>       ASPEED_DEV_EMMC,
>       ASPEED_DEV_KCS,
>       ASPEED_DEV_HACE,
> +    ASPEED_DEV_DPMCU,
> +    ASPEED_DEV_DP,
>   };
>   
>   #endif /* ASPEED_SOC_H */
> 


