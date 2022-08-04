Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3646E5897B0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 08:16:32 +0200 (CEST)
Received: from localhost ([::1]:54834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJU9n-0005Sr-33
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 02:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJTuQ-0007yk-Tf
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 02:00:38 -0400
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:34709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJTuI-0006tU-UV
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 02:00:37 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.89])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 20126232A9;
 Thu,  4 Aug 2022 06:00:27 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 4 Aug 2022
 08:00:26 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002aff2f24b-086e-444e-9160-8f9ce020bd45,
 E459FF07681E7C706565AD81A8193C11BE0AA2AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <43c27ad1-a6e0-f843-8b00-141d07976c88@kaod.org>
Date: Thu, 4 Aug 2022 08:00:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 05/20] ppc/ppc405: Start QOMification of the SoC
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: <qemu-ppc@nongnu.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 <qemu-devel@nongnu.org>
References: <20220803132844.2370514-1-clg@kaod.org>
 <20220803132844.2370514-6-clg@kaod.org>
 <70f82feb-bea8-943c-87c6-90fab144db51@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <70f82feb-bea8-943c-87c6-90fab144db51@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: a3112d51-7618-42e3-8c4e-0187f58841cf
X-Ovh-Tracer-Id: 6952150453305773024
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvkedguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/4/22 00:23, BALATON Zoltan wrote:
> On Wed, 3 Aug 2022, Cédric Le Goater wrote:
>> This moves all the code previously done in the ppc405ep_init() routine
>> under ppc405_soc_realize(). We can also adjust the number of banks now
>> that we have control on ppc4xx_sdram_init().
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>> hw/ppc/ppc405.h        |  16 ++---
>> hw/ppc/ppc405_boards.c |  12 ++--
>> hw/ppc/ppc405_uc.c     | 144 ++++++++++++++++++++---------------------
>> 3 files changed, 83 insertions(+), 89 deletions(-)
>>
>> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
>> index c8cddb71733a..2c912b328eaf 100644
>> --- a/hw/ppc/ppc405.h
>> +++ b/hw/ppc/ppc405.h
>> @@ -72,11 +72,16 @@ struct Ppc405SoCState {
>>
>>     /* Public */
>>     MemoryRegion sram;
>> -    MemoryRegion ram_memories[2];
>> -    hwaddr ram_bases[2], ram_sizes[2];
>> +    MemoryRegion ram_memories[1];
>> +    hwaddr ram_bases[1], ram_sizes[1];
>> +    bool do_dram_init;
> 
> I'm not sure about this. First of all what's the point having a 1 element array instead of just a normal field if you don't need more than one of these? 

because ppc405ep_init() interface was :

     PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
                             MemoryRegion ram_memories[2],
                             hwaddr ram_bases[2],
                             hwaddr ram_sizes[2],
                             uint32_t sysclk, DeviceState **uicdev,
                             int do_init);

and I didn't refresh the structures.

It is true that the 405 has 2 SDRAM banks. May be we should keep it
that way. I will see if I can come with something better in v3.

The main issue is the ppc4xx_sdram_init() interface. It has been
around for 15 years minimum and it should be reworked, but not now.

Thanks,

C.

> (But then the names in plural become a misnomer too.) On the other hand the SoC likely has two banks, it's just that the board only has one socket and thus only uses one of it but other boards could have two sockets and use both. If the SoC model already has this I'd keep it for that cases or to emulate the SoC more precisely. But I may be wrong, I haven't checked the chip docs and only dimly remember how this was on 460EX.
> 
> Regards,
> BALATON Zoltan
> 
>>
>>     MemoryRegion *dram_mr;
>>     hwaddr ram_size;
>> +
>> +    uint32_t sysclk;
>> +    PowerPCCPU *cpu;
>> +    DeviceState *uic;
>> };
>>
>> /* PowerPC 405 core */
>> @@ -85,11 +90,4 @@ ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size);
>> void ppc4xx_plb_init(CPUPPCState *env);
>> void ppc405_ebc_init(CPUPPCState *env);
>>
>> -PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
>> -                        MemoryRegion ram_memories[2],
>> -                        hwaddr ram_bases[2],
>> -                        hwaddr ram_sizes[2],
>> -                        uint32_t sysclk, DeviceState **uicdev,
>> -                        int do_init);
>> -
>> #endif /* PPC405_H */
>> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
>> index 96db52c5a309..363cb0770506 100644
>> --- a/hw/ppc/ppc405_boards.c
>> +++ b/hw/ppc/ppc405_boards.c
>> @@ -237,9 +237,7 @@ static void ppc405_init(MachineState *machine)
>>     Ppc405MachineState *ppc405 = PPC405_MACHINE(machine);
>>     MachineClass *mc = MACHINE_GET_CLASS(machine);
>>     const char *kernel_filename = machine->kernel_filename;
>> -    PowerPCCPU *cpu;
>>     MemoryRegion *sysmem = get_system_memory();
>> -    DeviceState *uicdev;
>>
>>     if (machine->ram_size != mc->default_ram_size) {
>>         char *sz = size_to_str(mc->default_ram_size);
>> @@ -254,12 +252,12 @@ static void ppc405_init(MachineState *machine)
>>                              machine->ram_size, &error_fatal);
>>     object_property_set_link(OBJECT(&ppc405->soc), "dram",
>>                              OBJECT(machine->ram), &error_abort);
>> +    object_property_set_bool(OBJECT(&ppc405->soc), "dram-init",
>> +                             !(kernel_filename == NULL), &error_abort);
>> +    object_property_set_uint(OBJECT(&ppc405->soc), "sys-clk", 33333333,
>> +                             &error_abort);
>>     qdev_realize(DEVICE(&ppc405->soc), NULL, &error_abort);
>>
>> -    cpu = ppc405ep_init(sysmem, ppc405->soc.ram_memories, ppc405->soc.ram_bases,
>> -                        ppc405->soc.ram_sizes,
>> -                        33333333, &uicdev, kernel_filename == NULL ? 0 : 1);
>> -
>>     /* allocate and load BIOS */
>>     if (machine->firmware) {
>>         MemoryRegion *bios = g_new(MemoryRegion, 1);
>> @@ -315,7 +313,7 @@ static void ppc405_init(MachineState *machine)
>>
>>     /* Load ELF kernel and rootfs.cpio */
>>     } else if (kernel_filename && !machine->firmware) {
>> -        boot_from_kernel(machine, cpu);
>> +        boot_from_kernel(machine, ppc405->soc.cpu);
>>     }
>> }
>>
>> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
>> index 7033bac6bf3f..ed1099e08bbd 100644
>> --- a/hw/ppc/ppc405_uc.c
>> +++ b/hw/ppc/ppc405_uc.c
>> @@ -1432,130 +1432,128 @@ static void ppc405ep_cpc_init (CPUPPCState *env, clk_setup_t clk_setup[8],
>> #endif
>> }
>>
>> -PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
>> -                        MemoryRegion ram_memories[2],
>> -                        hwaddr ram_bases[2],
>> -                        hwaddr ram_sizes[2],
>> -                        uint32_t sysclk, DeviceState **uicdevp,
>> -                        int do_init)
>> +static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>> {
>> +    Ppc405SoCState *s = PPC405_SOC(dev);
>>     clk_setup_t clk_setup[PPC405EP_CLK_NB], tlb_clk_setup;
>>     qemu_irq dma_irqs[4], gpt_irqs[5], mal_irqs[4];
>> -    PowerPCCPU *cpu;
>>     CPUPPCState *env;
>> -    DeviceState *uicdev;
>> -    SysBusDevice *uicsbd;
>> +    Error *err = NULL;
>> +
>> +    /* allocate SRAM */
>> +    memory_region_init_ram(&s->sram, OBJECT(s), "ppc405.sram",
>> +                           PPC405EP_SRAM_SIZE,  &err);
>> +    if (err) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
>> +    memory_region_add_subregion(get_system_memory(), PPC405EP_SRAM_BASE,
>> +                                &s->sram);
>>
>>     memset(clk_setup, 0, sizeof(clk_setup));
>> +
>>     /* init CPUs */
>> -    cpu = ppc4xx_init(POWERPC_CPU_TYPE_NAME("405ep"),
>> +    s->cpu = ppc4xx_init(POWERPC_CPU_TYPE_NAME("405ep"),
>>                       &clk_setup[PPC405EP_CPU_CLK],
>> -                      &tlb_clk_setup, sysclk);
>> -    env = &cpu->env;
>> +                      &tlb_clk_setup, s->sysclk);
>> +    env = &s->cpu->env;
>>     clk_setup[PPC405EP_CPU_CLK].cb = tlb_clk_setup.cb;
>>     clk_setup[PPC405EP_CPU_CLK].opaque = tlb_clk_setup.opaque;
>> -    /* Internal devices init */
>> -    /* Memory mapped devices registers */
>> +
>> +    /* CPU control */
>> +    ppc405ep_cpc_init(env, clk_setup, s->sysclk);
>> +
>>     /* PLB arbitrer */
>>     ppc4xx_plb_init(env);
>> +
>>     /* PLB to OPB bridge */
>>     ppc4xx_pob_init(env);
>> +
>>     /* OBP arbitrer */
>>     ppc4xx_opba_init(0xef600600);
>> +
>>     /* Universal interrupt controller */
>> -    uicdev = qdev_new(TYPE_PPC_UIC);
>> -    uicsbd = SYS_BUS_DEVICE(uicdev);
>> +    s->uic = qdev_new(TYPE_PPC_UIC);
>>
>> -    object_property_set_link(OBJECT(uicdev), "cpu", OBJECT(cpu),
>> +    object_property_set_link(OBJECT(s->uic), "cpu", OBJECT(s->cpu),
>>                              &error_fatal);
>> -    sysbus_realize_and_unref(uicsbd, &error_fatal);
>> -
>> -    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
>> -                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT));
>> -    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT,
>> -                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));
>> +    if (!sysbus_realize(SYS_BUS_DEVICE(s->uic), errp)) {
>> +        return;
>> +    }
>>
>> -    *uicdevp = uicdev;
>> +    sysbus_connect_irq(SYS_BUS_DEVICE(s->uic), PPCUIC_OUTPUT_INT,
>> +                       qdev_get_gpio_in(DEVICE(s->cpu), PPC40x_INPUT_INT));
>> +    sysbus_connect_irq(SYS_BUS_DEVICE(s->uic), PPCUIC_OUTPUT_CINT,
>> +                       qdev_get_gpio_in(DEVICE(s->cpu), PPC40x_INPUT_CINT));
>>
>>     /* SDRAM controller */
>> -        /* XXX 405EP has no ECC interrupt */
>> -    ppc4xx_sdram_init(env, qdev_get_gpio_in(uicdev, 17), 2, ram_memories,
>> -                      ram_bases, ram_sizes, do_init);
>> +    /* XXX 405EP has no ECC interrupt */
>> +    memory_region_init_alias(&s->ram_memories[0], OBJECT(s),
>> +                             "ppc405.ram.alias", s->dram_mr, 0, s->ram_size);
>> +    s->ram_bases[0] = 0;
>> +    s->ram_sizes[0] = s->ram_size;
>> +
>> +    ppc4xx_sdram_init(env, qdev_get_gpio_in(s->uic, 17),
>> +                      ARRAY_SIZE(s->ram_memories), s->ram_memories,
>> +                      s->ram_bases, s->ram_sizes, s->do_dram_init);
>> +
>>     /* External bus controller */
>>     ppc405_ebc_init(env);
>> +
>>     /* DMA controller */
>> -    dma_irqs[0] = qdev_get_gpio_in(uicdev, 5);
>> -    dma_irqs[1] = qdev_get_gpio_in(uicdev, 6);
>> -    dma_irqs[2] = qdev_get_gpio_in(uicdev, 7);
>> -    dma_irqs[3] = qdev_get_gpio_in(uicdev, 8);
>> +    dma_irqs[0] = qdev_get_gpio_in(s->uic, 5);
>> +    dma_irqs[1] = qdev_get_gpio_in(s->uic, 6);
>> +    dma_irqs[2] = qdev_get_gpio_in(s->uic, 7);
>> +    dma_irqs[3] = qdev_get_gpio_in(s->uic, 8);
>>     ppc405_dma_init(env, dma_irqs);
>> -    /* IIC controller */
>> +
>> +    /* I2C controller */
>>     sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500,
>> -                         qdev_get_gpio_in(uicdev, 2));
>> +                         qdev_get_gpio_in(s->uic, 2));
>>     /* GPIO */
>>     ppc405_gpio_init(0xef600700);
>> +
>>     /* Serial ports */
>>     if (serial_hd(0) != NULL) {
>> -        serial_mm_init(address_space_mem, 0xef600300, 0,
>> -                       qdev_get_gpio_in(uicdev, 0),
>> +        serial_mm_init(get_system_memory(), 0xef600300, 0,
>> +                       qdev_get_gpio_in(s->uic, 0),
>>                        PPC_SERIAL_MM_BAUDBASE, serial_hd(0),
>>                        DEVICE_BIG_ENDIAN);
>>     }
>>     if (serial_hd(1) != NULL) {
>> -        serial_mm_init(address_space_mem, 0xef600400, 0,
>> -                       qdev_get_gpio_in(uicdev, 1),
>> +        serial_mm_init(get_system_memory(), 0xef600400, 0,
>> +                       qdev_get_gpio_in(s->uic, 1),
>>                        PPC_SERIAL_MM_BAUDBASE, serial_hd(1),
>>                        DEVICE_BIG_ENDIAN);
>>     }
>> +
>>     /* OCM */
>>     ppc405_ocm_init(env);
>> +
>>     /* GPT */
>> -    gpt_irqs[0] = qdev_get_gpio_in(uicdev, 19);
>> -    gpt_irqs[1] = qdev_get_gpio_in(uicdev, 20);
>> -    gpt_irqs[2] = qdev_get_gpio_in(uicdev, 21);
>> -    gpt_irqs[3] = qdev_get_gpio_in(uicdev, 22);
>> -    gpt_irqs[4] = qdev_get_gpio_in(uicdev, 23);
>> +    gpt_irqs[0] = qdev_get_gpio_in(s->uic, 19);
>> +    gpt_irqs[1] = qdev_get_gpio_in(s->uic, 20);
>> +    gpt_irqs[2] = qdev_get_gpio_in(s->uic, 21);
>> +    gpt_irqs[3] = qdev_get_gpio_in(s->uic, 22);
>> +    gpt_irqs[4] = qdev_get_gpio_in(s->uic, 23);
>>     ppc4xx_gpt_init(0xef600000, gpt_irqs);
>> -    /* PCI */
>> -    /* Uses UIC IRQs 3, 16, 18 */
>> +
>>     /* MAL */
>> -    mal_irqs[0] = qdev_get_gpio_in(uicdev, 11);
>> -    mal_irqs[1] = qdev_get_gpio_in(uicdev, 12);
>> -    mal_irqs[2] = qdev_get_gpio_in(uicdev, 13);
>> -    mal_irqs[3] = qdev_get_gpio_in(uicdev, 14);
>> +    mal_irqs[0] = qdev_get_gpio_in(s->uic, 11);
>> +    mal_irqs[1] = qdev_get_gpio_in(s->uic, 12);
>> +    mal_irqs[2] = qdev_get_gpio_in(s->uic, 13);
>> +    mal_irqs[3] = qdev_get_gpio_in(s->uic, 14);
>>     ppc4xx_mal_init(env, 4, 2, mal_irqs);
>> +
>>     /* Ethernet */
>>     /* Uses UIC IRQs 9, 15, 17 */
>> -    /* CPU control */
>> -    ppc405ep_cpc_init(env, clk_setup, sysclk);
>> -
>> -    return cpu;
>> -}
>> -
>> -static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>> -{
>> -    Ppc405SoCState *s = PPC405_SOC(dev);
>> -    Error *err = NULL;
>> -
>> -    memory_region_init_alias(&s->ram_memories[0], OBJECT(s),
>> -                             "ppc405.ram.alias", s->dram_mr, 0, s->ram_size);
>> -    s->ram_bases[0] = 0;
>> -    s->ram_sizes[0] = s->ram_size;
>> -
>> -    /* allocate SRAM */
>> -    memory_region_init_ram(&s->sram, OBJECT(s), "ppc405.sram",
>> -                           PPC405EP_SRAM_SIZE,  &err);
>> -    if (err) {
>> -        error_propagate(errp, err);
>> -        return;
>> -    }
>> -    memory_region_add_subregion(get_system_memory(), PPC405EP_SRAM_BASE,
>> -                                &s->sram);
>> }
>>
>> static Property ppc405_soc_properties[] = {
>>     DEFINE_PROP_LINK("dram", Ppc405SoCState, dram_mr, TYPE_MEMORY_REGION,
>>                      MemoryRegion *),
>> +    DEFINE_PROP_UINT32("sys-clk", Ppc405SoCState, sysclk, 0),
>> +    DEFINE_PROP_BOOL("dram-init", Ppc405SoCState, do_dram_init, 0),
>>     DEFINE_PROP_UINT64("ram-size", Ppc405SoCState, ram_size, 0),
>>     DEFINE_PROP_END_OF_LIST(),
>> };
>>


