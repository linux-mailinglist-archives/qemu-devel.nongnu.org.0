Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D0C5585D0
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 20:04:14 +0200 (CEST)
Received: from localhost ([::1]:49802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4RBd-0006Pi-7z
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 14:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o4RAC-0005RA-7X; Thu, 23 Jun 2022 14:02:44 -0400
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:37979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o4RA9-0008DF-Dr; Thu, 23 Jun 2022 14:02:43 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.10])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id CC26425979;
 Thu, 23 Jun 2022 18:02:37 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 23 Jun
 2022 20:02:37 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005b7d94ccc-9f3e-4b87-9036-307a8549d851,
 1905447EDF4A6B95D61F03ED56167C5A36471571) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d56bc12b-2680-d3e4-af15-8a039078a93a@kaod.org>
Date: Thu, 23 Jun 2022 20:02:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] aspeed: Set the dram container at the SoC level
Content-Language: en-US
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Peter Delevoryas
 <pdel@fb.com>
References: <20220623175615.3936148-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220623175615.3936148-1-clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 762ec6dd-56dc-44dc-b7ca-516876297a63
X-Ovh-Tracer-Id: 12302989757063924518
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedguddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphguvghlsehfsgdrtghomhdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
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

On 6/23/22 19:56, Cédric Le Goater wrote:
> Currently, the Aspeed machines allocate a ram container region in
> which the machine ram region is mapped. See commit ad1a9782186d
> ("aspeed: add a RAM memory region container"). An extra region is
> mapped after ram in the ram container to catch invalid access done by
> FW. That's how FW determines the size of ram. See commit ebe31c0a8ef7
> ("aspeed: add a max_ram_size property to the memory controller").
> 
> Let's move all the logic under the SoC where it should be. It will
> also ease the work on multi SoC support.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   include/hw/arm/aspeed_soc.h |  2 ++
>   hw/arm/aspeed.c             | 39 ++-----------------------------------
>   hw/arm/aspeed_ast2600.c     |  4 ++--
>   hw/arm/aspeed_soc.c         | 38 ++++++++++++++++++++++++++++++++++--
>   4 files changed, 42 insertions(+), 41 deletions(-)
> 
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 02a5a9ffcbd3..b8d1ef496ae6 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -50,6 +50,7 @@ struct AspeedSoCState {
>       A15MPPrivState     a7mpcore;
>       ARMv7MState        armv7m;
>       MemoryRegion *dram_mr;
> +    MemoryRegion dram_container;
>       MemoryRegion sram;
>       AspeedVICState vic;
>       AspeedRtcState rtc;
> @@ -165,5 +166,6 @@ enum {
>   
>   qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
>   void aspeed_soc_uart_init(AspeedSoCState *s);
> +void aspeed_soc_dram_init(AspeedSoCState *s, Error **errp);
>   
>   #endif /* ASPEED_SOC_H */
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index a06f7c1b62a9..dc09773b0ba5 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -174,27 +174,6 @@ struct AspeedMachineState {
>   #define BLETCHLEY_BMC_HW_STRAP1 AST2600_EVB_HW_STRAP1
>   #define BLETCHLEY_BMC_HW_STRAP2 AST2600_EVB_HW_STRAP2
>   
> -/*
> - * The max ram region is for firmwares that scan the address space
> - * with load/store to guess how much RAM the SoC has.
> - */
> -static uint64_t max_ram_read(void *opaque, hwaddr offset, unsigned size)
> -{
> -    return 0;
> -}
> -
> -static void max_ram_write(void *opaque, hwaddr offset, uint64_t value,
> -                           unsigned size)
> -{
> -    /* Discard writes */
> -}
> -
> -static const MemoryRegionOps max_ram_ops = {
> -    .read = max_ram_read,
> -    .write = max_ram_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> -};
> -
>   #define AST_SMP_MAILBOX_BASE            0x1e6e2180
>   #define AST_SMP_MBOX_FIELD_ENTRY        (AST_SMP_MAILBOX_BASE + 0x0)
>   #define AST_SMP_MBOX_FIELD_GOSIGN       (AST_SMP_MAILBOX_BASE + 0x4)
> @@ -324,20 +303,16 @@ static void aspeed_machine_init(MachineState *machine)
>       AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(machine);
>       AspeedSoCClass *sc;
>       DriveInfo *drive0 = drive_get(IF_MTD, 0, 0);
> -    ram_addr_t max_ram_size;
>       int i;
>       NICInfo *nd = &nd_table[0];
>   
> -    memory_region_init(&bmc->ram_container, NULL, "aspeed-ram-container",
> -                       4 * GiB);
> -    memory_region_add_subregion(&bmc->ram_container, 0, machine->ram);
> -
>       object_initialize_child(OBJECT(machine), "soc", &bmc->soc, amc->soc_name);
>   
>       sc = ASPEED_SOC_GET_CLASS(&bmc->soc);
>   
>       /*
> -     * This will error out if isize is not supported by memory controller.
> +     * This will error out if the RAM size is not supported by the
> +     * memory controller of the SoC.
>        */
>       object_property_set_uint(OBJECT(&bmc->soc), "ram-size", machine->ram_size,
>                                &error_fatal);
> @@ -369,16 +344,6 @@ static void aspeed_machine_init(MachineState *machine)
>                            amc->uart_default);
>       qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
>   
> -    memory_region_add_subregion(get_system_memory(),
> -                                sc->memmap[ASPEED_DEV_SDRAM],
> -                                &bmc->ram_container);
> -
> -    max_ram_size = object_property_get_uint(OBJECT(&bmc->soc), "max-ram-size",
> -                                            &error_abort);
> -    memory_region_init_io(&bmc->max_ram, NULL, &max_ram_ops, NULL,
> -                          "max_ram", max_ram_size  - machine->ram_size);
> -    memory_region_add_subregion(&bmc->ram_container, machine->ram_size, &bmc->max_ram);
> -
>       aspeed_board_init_flashes(&bmc->soc.fmc,
>                                 bmc->fmc_model ? bmc->fmc_model : amc->fmc_model,
>                                 amc->num_cs, 0);
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index b0a4199b6960..6488362b1e0a 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -197,8 +197,6 @@ static void aspeed_soc_ast2600_init(Object *obj)
>       object_initialize_child(obj, "sdmc", &s->sdmc, typename);
>       object_property_add_alias(obj, "ram-size", OBJECT(&s->sdmc),
>                                 "ram-size");
> -    object_property_add_alias(obj, "max-ram-size", OBJECT(&s->sdmc),
> -                              "max-ram-size");
>   
>       for (i = 0; i < sc->wdts_num; i++) {
>           snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
> @@ -271,6 +269,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       /* IO space */
>       create_unimplemented_device("aspeed_soc.io", sc->memmap[ASPEED_DEV_IOMEM],
>                                   ASPEED_SOC_IOMEM_SIZE);
> +    /* RAM */
> +    aspeed_soc_dram_init(s, errp);


I will send a v2 to add a test here.

Thanks,

C.

>   
>       /* Video engine stub */
>       create_unimplemented_device("aspeed.video", sc->memmap[ASPEED_DEV_VIDEO],
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 30574d4276ab..a05a830bc62a 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -11,6 +11,7 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu/units.h"
>   #include "qapi/error.h"
>   #include "hw/misc/unimp.h"
>   #include "hw/arm/aspeed_soc.h"
> @@ -191,8 +192,6 @@ static void aspeed_soc_init(Object *obj)
>       object_initialize_child(obj, "sdmc", &s->sdmc, typename);
>       object_property_add_alias(obj, "ram-size", OBJECT(&s->sdmc),
>                                 "ram-size");
> -    object_property_add_alias(obj, "max-ram-size", OBJECT(&s->sdmc),
> -                              "max-ram-size");
>   
>       for (i = 0; i < sc->wdts_num; i++) {
>           snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
> @@ -237,6 +236,9 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>       create_unimplemented_device("aspeed_soc.io", sc->memmap[ASPEED_DEV_IOMEM],
>                                   ASPEED_SOC_IOMEM_SIZE);
>   
> +    /* RAM */
> +    aspeed_soc_dram_init(s, errp);
> +
>       /* Video engine stub */
>       create_unimplemented_device("aspeed.video", sc->memmap[ASPEED_DEV_VIDEO],
>                                   0x1000);
> @@ -561,3 +563,35 @@ void aspeed_soc_uart_init(AspeedSoCState *s)
>                          serial_hd(i), DEVICE_LITTLE_ENDIAN);
>       }
>   }
> +
> +void aspeed_soc_dram_init(AspeedSoCState *s, Error **errp)
> +{
> +    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
> +    ram_addr_t ram_size, max_ram_size;
> +    DeviceState *dev;
> +
> +    memory_region_init(&s->dram_container, OBJECT(s), "ram-container", 4 * GiB);
> +    memory_region_add_subregion(&s->dram_container, 0, s->dram_mr);
> +
> +    /*
> +     * Add a memory region beyond the RAM region to let firmwares scan
> +     * the address space with load/store and guess how much RAM the
> +     * SoC has.
> +     */
> +    ram_size = object_property_get_uint(OBJECT(&s->sdmc), "ram-size",
> +                                        &error_abort);
> +    max_ram_size = object_property_get_uint(OBJECT(&s->sdmc), "max-ram-size",
> +                                            &error_abort);
> +
> +    dev = qdev_new(TYPE_UNIMPLEMENTED_DEVICE);
> +    qdev_prop_set_string(dev, "name", "ram-empty");
> +    qdev_prop_set_uint64(dev, "size", max_ram_size  - ram_size);
> +    if (!sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), errp)) {
> +        return;
> +    }
> +    memory_region_add_subregion_overlap(&s->dram_container, ram_size,
> +                      sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0), -1000);
> +
> +    memory_region_add_subregion(get_system_memory(),
> +                      sc->memmap[ASPEED_DEV_SDRAM], &s->dram_container);
> +}


