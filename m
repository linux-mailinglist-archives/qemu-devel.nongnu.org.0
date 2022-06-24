Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EAA5593E5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 09:01:33 +0200 (CEST)
Received: from localhost ([::1]:56624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4dJs-0006Fa-Mh
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 03:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4dGv-0004NG-KR
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 02:58:30 -0400
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:47231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4dGt-0005dE-6N
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 02:58:29 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.132])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 01C352047F;
 Fri, 24 Jun 2022 06:58:23 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 24 Jun
 2022 08:58:23 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0049417caff-1ee3-49aa-aa94-e445215593c8,
 5EF2319963E9DB1A14486A5EC8730A2EE4B20F29) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7cbc6ba7-e645-2126-19e3-f64205485f17@kaod.org>
Date: Fri, 24 Jun 2022 08:58:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 4/8] aspeed: Map unimplemented devices in SoC memory
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20220624003701.1363500-1-pdel@fb.com>
 <20220624003701.1363500-5-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220624003701.1363500-5-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 77868e7e-9dad-4ff0-bba0-67dc59e9f72c
X-Ovh-Tracer-Id: 6957779950296992736
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefkedgudduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>


Thanks,

C.


> ---
>   hw/arm/aspeed_ast10x0.c     | 16 ++++++++++------
>   hw/arm/aspeed_ast2600.c     | 27 ++++++++++++++++++---------
>   hw/arm/aspeed_soc.c         | 23 +++++++++++++++++++----
>   include/hw/arm/aspeed_soc.h |  9 +++++++++
>   4 files changed, 56 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index f8f321374a..d34c06db16 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -142,6 +142,10 @@ static void aspeed_soc_ast1030_init(Object *obj)
>   
>       snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
>       object_initialize_child(obj, "gpio", &s->gpio, typename);
> +
> +    object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
> +    object_initialize_child(obj, "sbc-unimplemented", &s->sbc_unimplemented,
> +                            TYPE_UNIMPLEMENTED_DEVICE);
>   }
>   
>   static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
> @@ -158,12 +162,12 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>       }
>   
>       /* General I/O memory space to catch all unimplemented device */
> -    create_unimplemented_device("aspeed.sbc",
> -                                sc->memmap[ASPEED_DEV_SBC],
> -                                0x40000);
> -    create_unimplemented_device("aspeed.io",
> -                                sc->memmap[ASPEED_DEV_IOMEM],
> -                                ASPEED_SOC_IOMEM_SIZE);
> +    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
> +                                  sc->memmap[ASPEED_DEV_IOMEM],
> +                                  ASPEED_SOC_IOMEM_SIZE);
> +    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->sbc_unimplemented),
> +                                  "aspeed.sbc", sc->memmap[ASPEED_DEV_SBC],
> +                                  0x40000);
>   
>       /* AST1030 CPU Core */
>       armv7m = DEVICE(&s->armv7m);
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 477dd36042..8693660271 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -246,6 +246,13 @@ static void aspeed_soc_ast2600_init(Object *obj)
>       object_initialize_child(obj, "i3c", &s->i3c, TYPE_ASPEED_I3C);
>   
>       object_initialize_child(obj, "sbc", &s->sbc, TYPE_ASPEED_SBC);
> +
> +    object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
> +    object_initialize_child(obj, "video", &s->video, TYPE_UNIMPLEMENTED_DEVICE);
> +    object_initialize_child(obj, "dpmcu", &s->dpmcu, TYPE_UNIMPLEMENTED_DEVICE);
> +    object_initialize_child(obj, "emmc-boot-controller",
> +                            &s->emmc_boot_controller,
> +                            TYPE_UNIMPLEMENTED_DEVICE);
>   }
>   
>   /*
> @@ -267,21 +274,22 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       qemu_irq irq;
>   
>       /* IO space */
> -    create_unimplemented_device("aspeed_soc.io", sc->memmap[ASPEED_DEV_IOMEM],
> -                                ASPEED_SOC_IOMEM_SIZE);
> +    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
> +                                  sc->memmap[ASPEED_DEV_IOMEM],
> +                                  ASPEED_SOC_IOMEM_SIZE);
>       /* RAM */
>       if (!aspeed_soc_dram_init(s, errp)) {
>           return;
>       }
>   
>       /* Video engine stub */
> -    create_unimplemented_device("aspeed.video", sc->memmap[ASPEED_DEV_VIDEO],
> -                                0x1000);
> +    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->video), "aspeed.video",
> +                                  sc->memmap[ASPEED_DEV_VIDEO], 0x1000);
>   
>       /* eMMC Boot Controller stub */
> -    create_unimplemented_device("aspeed.emmc-boot-controller",
> -                                sc->memmap[ASPEED_DEV_EMMC_BC],
> -                                0x1000);
> +    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->emmc_boot_controller),
> +                                  "aspeed.emmc-boot-controller",
> +                                  sc->memmap[ASPEED_DEV_EMMC_BC], 0x1000);
>   
>       /* CPU */
>       for (i = 0; i < sc->num_cpus; i++) {
> @@ -337,8 +345,9 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>                                   sc->memmap[ASPEED_DEV_SRAM], &s->sram);
>   
>       /* DPMCU */
> -    create_unimplemented_device("aspeed.dpmcu", sc->memmap[ASPEED_DEV_DPMCU],
> -                                ASPEED_SOC_DPMCU_SIZE);
> +    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->dpmcu), "aspeed.dpmcu",
> +                                  sc->memmap[ASPEED_DEV_DPMCU],
> +                                  ASPEED_SOC_DPMCU_SIZE);
>   
>       /* SCU */
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 46cbc63644..16394c8e0b 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -223,6 +223,9 @@ static void aspeed_soc_init(Object *obj)
>   
>       snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
>       object_initialize_child(obj, "hace", &s->hace, typename);
> +
> +    object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
> +    object_initialize_child(obj, "video", &s->video, TYPE_UNIMPLEMENTED_DEVICE);
>   }
>   
>   static void aspeed_soc_realize(DeviceState *dev, Error **errp)
> @@ -233,8 +236,9 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>       Error *err = NULL;
>   
>       /* IO space */
> -    create_unimplemented_device("aspeed_soc.io", sc->memmap[ASPEED_DEV_IOMEM],
> -                                ASPEED_SOC_IOMEM_SIZE);
> +    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
> +                                  sc->memmap[ASPEED_DEV_IOMEM],
> +                                  ASPEED_SOC_IOMEM_SIZE);
>   
>       /* RAM */
>       if (!aspeed_soc_dram_init(s, errp)) {
> @@ -242,8 +246,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>       }
>   
>       /* Video engine stub */
> -    create_unimplemented_device("aspeed.video", sc->memmap[ASPEED_DEV_VIDEO],
> -                                0x1000);
> +    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->video), "aspeed.video",
> +                                  sc->memmap[ASPEED_DEV_VIDEO], 0x1000);
>   
>       /* CPU */
>       for (i = 0; i < sc->num_cpus; i++) {
> @@ -611,3 +615,14 @@ void aspeed_mmio_map(AspeedSoCState *s, SysBusDevice *dev, int n, hwaddr addr)
>       memory_region_add_subregion(s->memory, addr,
>                                   sysbus_mmio_get_region(dev, n));
>   }
> +
> +void aspeed_mmio_map_unimplemented(AspeedSoCState *s, SysBusDevice *dev,
> +                                   const char *name, hwaddr addr, uint64_t size)
> +{
> +    qdev_prop_set_string(DEVICE(dev), "name", name);
> +    qdev_prop_set_uint64(DEVICE(dev), "size", size);
> +    sysbus_realize(dev, &error_abort);
> +
> +    memory_region_add_subregion_overlap(s->memory, addr,
> +                                        sysbus_mmio_get_region(dev, 0), -1000);
> +}
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 1ab328d00c..6cfc063985 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -34,6 +34,7 @@
>   #include "hw/usb/hcd-ehci.h"
>   #include "qom/object.h"
>   #include "hw/misc/aspeed_lpc.h"
> +#include "hw/misc/unimp.h"
>   
>   #define ASPEED_SPIS_NUM  2
>   #define ASPEED_EHCIS_NUM 2
> @@ -66,6 +67,7 @@ struct AspeedSoCState {
>       AspeedSMCState spi[ASPEED_SPIS_NUM];
>       EHCISysBusState ehci[ASPEED_EHCIS_NUM];
>       AspeedSBCState sbc;
> +    UnimplementedDeviceState sbc_unimplemented;
>       AspeedSDMCState sdmc;
>       AspeedWDTState wdt[ASPEED_WDTS_NUM];
>       FTGMAC100State ftgmac100[ASPEED_MACS_NUM];
> @@ -77,6 +79,10 @@ struct AspeedSoCState {
>       AspeedLPCState lpc;
>       uint32_t uart_default;
>       Clock *sysclk;
> +    UnimplementedDeviceState iomem;
> +    UnimplementedDeviceState video;
> +    UnimplementedDeviceState emmc_boot_controller;
> +    UnimplementedDeviceState dpmcu;
>   };
>   
>   #define TYPE_ASPEED_SOC "aspeed-soc"
> @@ -169,5 +175,8 @@ qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
>   void aspeed_soc_uart_init(AspeedSoCState *s);
>   bool aspeed_soc_dram_init(AspeedSoCState *s, Error **errp);
>   void aspeed_mmio_map(AspeedSoCState *s, SysBusDevice *dev, int n, hwaddr addr);
> +void aspeed_mmio_map_unimplemented(AspeedSoCState *s, SysBusDevice *dev,
> +                                   const char *name, hwaddr addr,
> +                                   uint64_t size);
>   
>   #endif /* ASPEED_SOC_H */


