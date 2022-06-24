Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1395593B5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 08:46:39 +0200 (CEST)
Received: from localhost ([::1]:44502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4d5R-0006Au-P9
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 02:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4d00-0003VR-Vi
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 02:41:01 -0400
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:47205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4czx-0003D3-1P
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 02:41:00 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.7])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 179F122EF9;
 Fri, 24 Jun 2022 06:40:54 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 24 Jun
 2022 08:40:53 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001ee67035a-e007-4a4b-ad7f-3bae3bc28713,
 E6A4B675E747F7C4DAB6964939055BC5BE69314E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a36b0263-2f91-ff1c-0345-1ed8e6268c14@kaod.org>
Date: Fri, 24 Jun 2022 08:40:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/8] aspeed: Add memory property to Aspeed SoC
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20220624003701.1363500-1-pdel@fb.com>
 <20220624003701.1363500-3-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220624003701.1363500-3-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 39a26b61-fcab-4664-96af-2a3c13d9e62d
X-Ovh-Tracer-Id: 6662512699069467616
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefkedgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
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
> Multi-SoC machines can use this property to specify a memory container
> for each SoC. Single SoC machines will just specify get_system_memory().
> 
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/arm/aspeed.c             |  4 ++++
>   hw/arm/aspeed_ast10x0.c     |  5 ++---
>   hw/arm/aspeed_ast2600.c     |  4 ++--
>   hw/arm/aspeed_soc.c         | 14 ++++++++------
>   include/hw/arm/aspeed_soc.h |  1 +
>   5 files changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index dc09773b0b..b43dc0fda8 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -329,6 +329,8 @@ static void aspeed_machine_init(MachineState *machine)
>                               &error_abort);
>       object_property_set_int(OBJECT(&bmc->soc), "hw-strap2", amc->hw_strap2,
>                               &error_abort);
> +    object_property_set_link(OBJECT(&bmc->soc), "memory",
> +                             OBJECT(get_system_memory()), &error_abort);
>       object_property_set_link(OBJECT(&bmc->soc), "dram",
>                                OBJECT(machine->ram), &error_abort);
>       if (machine->kernel_filename) {
> @@ -1336,6 +1338,8 @@ static void aspeed_minibmc_machine_init(MachineState *machine)
>       object_initialize_child(OBJECT(machine), "soc", &bmc->soc, amc->soc_name);
>       qdev_connect_clock_in(DEVICE(&bmc->soc), "sysclk", sysclk);
>   
> +    object_property_set_link(OBJECT(&bmc->soc), "memory",
> +                             OBJECT(get_system_memory()), &error_abort);
>       qdev_prop_set_uint32(DEVICE(&bmc->soc), "uart-default",
>                            amc->uart_default);
>       qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index 5df480a21f..e074f80cc7 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -148,7 +148,6 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>   {
>       AspeedSoCState *s = ASPEED_SOC(dev_soc);
>       AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
> -    MemoryRegion *system_memory = get_system_memory();
>       DeviceState *armv7m;
>       Error *err = NULL;
>       int i;
> @@ -172,7 +171,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>       qdev_prop_set_string(armv7m, "cpu-type", sc->cpu_type);
>       qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
>       object_property_set_link(OBJECT(&s->armv7m), "memory",
> -                             OBJECT(system_memory), &error_abort);
> +                             OBJECT(s->memory), &error_abort);
>       sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), &error_abort);
>   
>       /* Internal SRAM */
> @@ -181,7 +180,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>           error_propagate(errp, err);
>           return;
>       }
> -    memory_region_add_subregion(system_memory,
> +    memory_region_add_subregion(s->memory,
>                                   sc->memmap[ASPEED_DEV_SRAM],
>                                   &s->sram);
>   
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index f950fff070..d8e5b607e9 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -295,7 +295,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>           object_property_set_int(OBJECT(&s->cpu[i]), "cntfrq", 1125000000,
>                                   &error_abort);
>           object_property_set_link(OBJECT(&s->cpu[i]), "memory",
> -                                 OBJECT(get_system_memory()), &error_abort);
> +                                 OBJECT(s->memory), &error_abort);
>   
>           if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
>               return;
> @@ -333,7 +333,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>           error_propagate(errp, err);
>           return;
>       }
> -    memory_region_add_subregion(get_system_memory(),
> +    memory_region_add_subregion(s->memory,
>                                   sc->memmap[ASPEED_DEV_SRAM], &s->sram);
>   
>       /* DPMCU */
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 06e5629800..3b531519e9 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -248,7 +248,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>       /* CPU */
>       for (i = 0; i < sc->num_cpus; i++) {
>           object_property_set_link(OBJECT(&s->cpu[i]), "memory",
> -                                 OBJECT(get_system_memory()), &error_abort);
> +                                 OBJECT(s->memory), &error_abort);
>           if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
>               return;
>           }
> @@ -261,7 +261,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>           error_propagate(errp, err);
>           return;
>       }
> -    memory_region_add_subregion(get_system_memory(),
> +    memory_region_add_subregion(s->memory,
>                                   sc->memmap[ASPEED_DEV_SRAM], &s->sram);
>   
>       /* SCU */
> @@ -456,6 +456,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>                          aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
>   }
>   static Property aspeed_soc_properties[] = {
> +    DEFINE_PROP_LINK("memory", AspeedSoCState, memory, TYPE_MEMORY_REGION,
> +                     MemoryRegion *),
>       DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
>                        MemoryRegion *),
>       DEFINE_PROP_UINT32("uart-default", AspeedSoCState, uart_default,
> @@ -555,14 +557,14 @@ void aspeed_soc_uart_init(AspeedSoCState *s)
>       int i, uart;
>   
>       /* Attach an 8250 to the IO space as our UART */
> -    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
> +    serial_mm_init(s->memory, sc->memmap[s->uart_default], 2,
>                      aspeed_soc_get_irq(s, s->uart_default), 38400,
>                      serial_hd(0), DEVICE_LITTLE_ENDIAN);
>       for (i = 1, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
>           if (uart == s->uart_default) {
>               uart++;
>           }
> -        serial_mm_init(get_system_memory(), sc->memmap[uart], 2,
> +        serial_mm_init(s->memory, sc->memmap[uart], 2,
>                          aspeed_soc_get_irq(s, uart), 38400,
>                          serial_hd(i), DEVICE_LITTLE_ENDIAN);
>       }
> @@ -596,7 +598,7 @@ bool aspeed_soc_dram_init(AspeedSoCState *s, Error **errp)
>       memory_region_add_subregion_overlap(&s->dram_container, ram_size,
>                         sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0), -1000);
>   
> -    memory_region_add_subregion(get_system_memory(),
> -                      sc->memmap[ASPEED_DEV_SDRAM], &s->dram_container);
> +    memory_region_add_subregion(s->memory, sc->memmap[ASPEED_DEV_SDRAM],
> +                                &s->dram_container);
>       return true;
>   }
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index e8a104823d..c8e903b821 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -49,6 +49,7 @@ struct AspeedSoCState {
>       ARMCPU cpu[ASPEED_CPUS_NUM];
>       A15MPPrivState     a7mpcore;
>       ARMv7MState        armv7m;
> +    MemoryRegion *memory;
>       MemoryRegion *dram_mr;
>       MemoryRegion dram_container;
>       MemoryRegion sram;


