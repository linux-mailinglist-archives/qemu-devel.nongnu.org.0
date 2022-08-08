Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A00658CB39
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 17:24:18 +0200 (CEST)
Received: from localhost ([::1]:60596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL4c4-0004hP-OG
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 11:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oL4Ye-0000HT-38
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 11:20:44 -0400
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:39029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oL4Yb-0000kx-3M
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 11:20:43 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.131])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id B3D93232AE;
 Mon,  8 Aug 2022 15:20:37 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 8 Aug 2022
 17:20:37 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0054982e82e-9f3a-48aa-b98e-353ff04e3450,
 014009DFAA8B86078D729D00C01D9476BEEC0396) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <01778767-901f-6409-f944-b7fae8acce05@kaod.org>
Date: Mon, 8 Aug 2022 17:20:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 06/22] ppc/ppc405: Start QOMification of the SoC
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: <qemu-ppc@nongnu.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20220808102734.133084-1-clg@kaod.org>
 <20220808102734.133084-7-clg@kaod.org>
 <bb7c8935-1948-2094-abde-eafb1d51c845@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <bb7c8935-1948-2094-abde-eafb1d51c845@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: eb9d5d7f-236d-4b61-b0af-7af7ced5b918
X-Ovh-Tracer-Id: 3009811928454433699
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefkedgkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefgeekieeffeekffegtdegieetvdfgtddvgfekvdevgfdufffhffeufefgtefgleenucffohhmrghinheptghhvggtkhhprghttghhrdhplhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

On 8/8/22 14:59, BALATON Zoltan wrote:
> On Mon, 8 Aug 2022, Cédric Le Goater wrote:
>> This moves all the code previously done in the ppc405ep_init() routine
>> under ppc405_soc_realize(). We can also adjust the number of banks now
>> that we have control on ppc4xx_sdram_init().
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>> hw/ppc/ppc405.h        |  12 ++--
>> hw/ppc/ppc405_boards.c |  12 ++--
>> hw/ppc/ppc405_uc.c     | 123 ++++++++++++++++++++---------------------
>> 3 files changed, 70 insertions(+), 77 deletions(-)
>>
>> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
>> index 66dc21cdfed8..dc862bc8614c 100644
>> --- a/hw/ppc/ppc405.h
>> +++ b/hw/ppc/ppc405.h
>> @@ -73,9 +73,14 @@ struct Ppc405SoCState {
>>     /* Public */
>>     MemoryRegion ram_banks[2];
>>     hwaddr ram_bases[2], ram_sizes[2];
>> +    bool do_dram_init;
>>
>>     MemoryRegion *dram_mr;
>>     hwaddr ram_size;
>> +
>> +    uint32_t sysclk;
> 
> Putting this together with dram_init would keep properties set from outside together which is clearer than here with others set by to object itself but this is just a small thing, not really important.

Makes sense but I am removing SoC::sysclk in the following patches.


> 
>> +    PowerPCCPU *cpu;
>> +    DeviceState *uic;
>> };
>>
>> /* PowerPC 405 core */
>> @@ -84,11 +89,4 @@ ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size);
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
>> index 1dc5065fcc1d..0b39ff08bd65 100644
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
> 
> Maybe clearer as kernel_filename != NULL

ok.

> Is there a problem with indentation in this patch? Does it pass checkpatch.pl?

No. All is fine.

Thanks,

C.
> 
> Regards,
> BALATON Zoltan
> 
>> +    object_property_set_uint(OBJECT(&ppc405->soc), "sys-clk", 33333333,
>> +                             &error_abort);
>>     qdev_realize(DEVICE(&ppc405->soc), NULL, &error_abort);
>>
>> -    cpu = ppc405ep_init(sysmem, ppc405->soc.ram_banks, ppc405->soc.ram_bases,
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
>> index adadb3a0ae08..abcc2537140c 100644
>> --- a/hw/ppc/ppc405_uc.c
>> +++ b/hw/ppc/ppc405_uc.c
>> @@ -1432,121 +1432,118 @@ static void ppc405ep_cpc_init (CPUPPCState *env, clk_setup_t clk_setup[8],
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
>>         /* XXX 405EP has no ECC interrupt */
>> -    ppc4xx_sdram_init(env, qdev_get_gpio_in(uicdev, 17), 2, ram_memories,
>> -                      ram_bases, ram_sizes, do_init);
>> +    s->ram_bases[0] = 0;
>> +    s->ram_sizes[0] = s->ram_size;
>> +    memory_region_init_alias(&s->ram_banks[0], OBJECT(s),
>> +                             "ppc405.sdram0", s->dram_mr,
>> +                             s->ram_bases[0], s->ram_sizes[0]);
>> +
>> +    ppc4xx_sdram_init(env, qdev_get_gpio_in(s->uic, 17), 1,
>> +                      s->ram_banks, s->ram_bases, s->ram_sizes,
>> +                      s->do_dram_init);
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
>> -
>> -    /* Initialize only one bank */
>> -    s->ram_bases[0] = 0;
>> -    s->ram_sizes[0] = s->ram_size;
>> -    memory_region_init_alias(&s->ram_banks[0], OBJECT(s),
>> -                             "ppc405.sdram0", s->dram_mr,
>> -                             s->ram_bases[0], s->ram_sizes[0]);
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


