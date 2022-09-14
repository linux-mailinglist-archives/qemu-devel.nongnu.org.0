Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EDD5B81CD
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 09:10:39 +0200 (CEST)
Received: from localhost ([::1]:34314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYMXd-0004cw-QS
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 03:10:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oYMMY-0005zF-0J
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 02:59:10 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:58257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oYMMT-0000v7-V8
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 02:59:09 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.2])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id E862612899838;
 Wed, 14 Sep 2022 08:59:02 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Wed, 14 Sep
 2022 08:59:02 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0067514f08e-eccd-4d8a-8ad3-3b5bb02df9a6,
 6464241036B73DE4A97B8AD469DDB011F00B0909) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <782517dc-499b-8bf1-1e36-192746db0780@kaod.org>
Date: Wed, 14 Sep 2022 08:58:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 04/20] ppc4xx: Use Ppc4xxSdramBank in
 ppc4xx_sdram_banks()
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <cover.1663097286.git.balaton@eik.bme.hu>
 <b31c8aa08cbe70f8638ad30df8b0c9a2d08a6d20.1663097286.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <b31c8aa08cbe70f8638ad30df8b0c9a2d08a6d20.1663097286.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 2a29bce8-932f-4fec-bf25-7a767990c6ae
X-Ovh-Tracer-Id: 8914312513933249443
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeduhedguddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsrghlrghtohhnsegvihhkrdgsmhgvrdhhuhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.628,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 9/13/22 21:52, BALATON Zoltan wrote:
> Change ppc4xx_sdram_banks() to take one Ppc4xxSdramBank array instead
> of the separate arrays and adjust ppc4xx_sdram_init() and
> ppc440_sdram_init() accordingly as well as machines using these.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
> v2: Use pointer for ram_banks in the prototype of the init funcs as
> an array of struct seems to confuse gcc 12.2.1 and provoke a warning
> 
>   hw/ppc/ppc405.h         |  4 +---
>   hw/ppc/ppc405_uc.c      | 10 +++++-----
>   hw/ppc/ppc440.h         |  5 ++---
>   hw/ppc/ppc440_bamboo.c  | 15 ++++++---------
>   hw/ppc/ppc440_uc.c      |  9 ++++-----
>   hw/ppc/ppc4xx_devs.c    | 21 +++++++++------------
>   hw/ppc/sam460ex.c       | 15 +++++----------
>   include/hw/ppc/ppc4xx.h |  9 +++------
>   8 files changed, 35 insertions(+), 53 deletions(-)
> 
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index 756865621b..ca0972b88b 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -167,9 +167,7 @@ struct Ppc405SoCState {
>       DeviceState parent_obj;
>   
>       /* Public */
> -    MemoryRegion ram_banks[2];
> -    hwaddr ram_bases[2], ram_sizes[2];
> -
> +    Ppc4xxSdramBank ram_banks[2];
>       MemoryRegion *dram_mr;
>       hwaddr ram_size;
>   
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index 1e02347e57..bcbf35bc14 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -1074,14 +1074,14 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>   
>       /* SDRAM controller */
>           /* XXX 405EP has no ECC interrupt */
> -    s->ram_bases[0] = 0;
> -    s->ram_sizes[0] = s->ram_size;
> -    memory_region_init_alias(&s->ram_banks[0], OBJECT(s),
> +    s->ram_banks[0].base = 0;
> +    s->ram_banks[0].size = s->ram_size;
> +    memory_region_init_alias(&s->ram_banks[0].ram, OBJECT(s),
>                                "ppc405.sdram0", s->dram_mr,
> -                             s->ram_bases[0], s->ram_sizes[0]);
> +                             s->ram_banks[0].base, s->ram_banks[0].size);
>   
>       ppc4xx_sdram_init(env, qdev_get_gpio_in(DEVICE(&s->uic), 17), 1,
> -                      s->ram_banks, s->ram_bases, s->ram_sizes);
> +                      s->ram_banks);
>   
>       /* External bus controller */
>       if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->ebc), &s->cpu, errp)) {
> diff --git a/hw/ppc/ppc440.h b/hw/ppc/ppc440.h
> index 7cef936125..e6c905b7d6 100644
> --- a/hw/ppc/ppc440.h
> +++ b/hw/ppc/ppc440.h
> @@ -11,14 +11,13 @@
>   #ifndef PPC440_H
>   #define PPC440_H
>   
> -#include "hw/ppc/ppc.h"
> +#include "hw/ppc/ppc4xx.h"
>   
>   void ppc4xx_l2sram_init(CPUPPCState *env);
>   void ppc4xx_cpr_init(CPUPPCState *env);
>   void ppc4xx_sdr_init(CPUPPCState *env);
>   void ppc440_sdram_init(CPUPPCState *env, int nbanks,
> -                       MemoryRegion *ram_memories,
> -                       hwaddr *ram_bases, hwaddr *ram_sizes,
> +                       Ppc4xxSdramBank *ram_banks,
>                          int do_init);
>   void ppc4xx_ahb_init(CPUPPCState *env);
>   void ppc4xx_dma_init(CPUPPCState *env, int dcr_base);
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index e3412c4fcd..2aac8a3fe9 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -168,9 +168,8 @@ static void bamboo_init(MachineState *machine)
>       unsigned int pci_irq_nrs[4] = { 28, 27, 26, 25 };
>       MemoryRegion *address_space_mem = get_system_memory();
>       MemoryRegion *isa = g_new(MemoryRegion, 1);
> -    MemoryRegion *ram_memories = g_new(MemoryRegion, PPC440EP_SDRAM_NR_BANKS);
> -    hwaddr ram_bases[PPC440EP_SDRAM_NR_BANKS] = {0};
> -    hwaddr ram_sizes[PPC440EP_SDRAM_NR_BANKS] = {0};
> +    Ppc4xxSdramBank *ram_banks = g_new0(Ppc4xxSdramBank,
> +                                        PPC440EP_SDRAM_NR_BANKS);
>       PCIBus *pcibus;
>       PowerPCCPU *cpu;
>       CPUPPCState *env;
> @@ -205,13 +204,11 @@ static void bamboo_init(MachineState *machine)
>                          qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));
>   
>       /* SDRAM controller */
> -    ppc4xx_sdram_banks(machine->ram, PPC440EP_SDRAM_NR_BANKS, ram_memories,
> -                       ram_bases, ram_sizes, ppc440ep_sdram_bank_sizes);
> +    ppc4xx_sdram_banks(machine->ram, PPC440EP_SDRAM_NR_BANKS, ram_banks,
> +                       ppc440ep_sdram_bank_sizes);
>       /* XXX 440EP's ECC interrupts are on UIC1, but we've only created UIC0. */
> -    ppc4xx_sdram_init(env,
> -                      qdev_get_gpio_in(uicdev, 14),
> -                      PPC440EP_SDRAM_NR_BANKS, ram_memories,
> -                      ram_bases, ram_sizes);
> +    ppc4xx_sdram_init(env, qdev_get_gpio_in(uicdev, 14),
> +                      PPC440EP_SDRAM_NR_BANKS, ram_banks);
>       /* Enable SDRAM memory regions, this should be done by the firmware */
>       if (ppc_dcr_write(env->dcr_env, SDRAM0_CFGADDR, 0x20) ||
>           ppc_dcr_write(env->dcr_env, SDRAM0_CFGDATA, 0x80000000)) {
> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
> index 6ab0ad7985..5db59d1190 100644
> --- a/hw/ppc/ppc440_uc.c
> +++ b/hw/ppc/ppc440_uc.c
> @@ -690,8 +690,7 @@ static void sdram_reset(void *opaque)
>   }
>   
>   void ppc440_sdram_init(CPUPPCState *env, int nbanks,
> -                       MemoryRegion *ram_memories,
> -                       hwaddr *ram_bases, hwaddr *ram_sizes,
> +                       Ppc4xxSdramBank *ram_banks,
>                          int do_init)
>   {
>       ppc440_sdram_t *sdram;
> @@ -700,9 +699,9 @@ void ppc440_sdram_init(CPUPPCState *env, int nbanks,
>       sdram = g_malloc0(sizeof(*sdram));
>       sdram->nbanks = nbanks;
>       for (i = 0; i < nbanks; i++) {
> -        sdram->bank[i].ram = ram_memories[i];
> -        sdram->bank[i].base = ram_bases[i];
> -        sdram->bank[i].size = ram_sizes[i];
> +        sdram->bank[i].ram = ram_banks[i].ram;
> +        sdram->bank[i].base = ram_banks[i].base;
> +        sdram->bank[i].size = ram_banks[i].size;
>       }
>       qemu_register_reset(&sdram_reset, sdram);
>       ppc_dcr_register(env, SDRAM0_CFGADDR,
> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
> index 936d6f77fe..7bdcbd6fac 100644
> --- a/hw/ppc/ppc4xx_devs.c
> +++ b/hw/ppc/ppc4xx_devs.c
> @@ -343,9 +343,7 @@ static void sdram_reset(void *opaque)
>   }
>   
>   void ppc4xx_sdram_init(CPUPPCState *env, qemu_irq irq, int nbanks,
> -                       MemoryRegion *ram_memories,
> -                       hwaddr *ram_bases,
> -                       hwaddr *ram_sizes)
> +                       Ppc4xxSdramBank *ram_banks)
>   {
>       ppc4xx_sdram_t *sdram;
>       int i;
> @@ -354,9 +352,9 @@ void ppc4xx_sdram_init(CPUPPCState *env, qemu_irq irq, int nbanks,
>       sdram->irq = irq;
>       sdram->nbanks = nbanks;
>       for (i = 0; i < nbanks; i++) {
> -        sdram->bank[i].ram = ram_memories[i];
> -        sdram->bank[i].base = ram_bases[i];
> -        sdram->bank[i].size = ram_sizes[i];
> +        sdram->bank[i].ram = ram_banks[i].ram;
> +        sdram->bank[i].base = ram_banks[i].base;
> +        sdram->bank[i].size = ram_banks[i].size;
>       }
>       qemu_register_reset(&sdram_reset, sdram);
>       ppc_dcr_register(env, SDRAM0_CFGADDR,
> @@ -376,8 +374,7 @@ void ppc4xx_sdram_init(CPUPPCState *env, qemu_irq irq, int nbanks,
>    * sizes varies by SoC.
>    */
>   void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
> -                        MemoryRegion ram_memories[],
> -                        hwaddr ram_bases[], hwaddr ram_sizes[],
> +                        Ppc4xxSdramBank ram_banks[],
>                           const ram_addr_t sdram_bank_sizes[])
>   {
>       ram_addr_t size_left = memory_region_size(ram);
> @@ -392,13 +389,13 @@ void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
>               if (bank_size <= size_left) {
>                   char name[32];
>   
> -                ram_bases[i] = base;
> -                ram_sizes[i] = bank_size;
> +                ram_banks[i].base = base;
> +                ram_banks[i].size = bank_size;
>                   base += bank_size;
>                   size_left -= bank_size;
>                   snprintf(name, sizeof(name), "ppc4xx.sdram%d", i);
> -                memory_region_init_alias(&ram_memories[i], NULL, name, ram,
> -                                         ram_bases[i], ram_sizes[i]);
> +                memory_region_init_alias(&ram_banks[i].ram, NULL, name, ram,
> +                                         ram_banks[i].base, ram_banks[i].size);
>                   break;
>               }
>           }
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 850bb3b817..f4c2a693fb 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -73,7 +73,6 @@
>   #define OPB_FREQ 115000000
>   #define EBC_FREQ 115000000
>   #define UART_FREQ 11059200
> -#define SDRAM_NR_BANKS 4
>   
>   /* The SoC could also handle 4 GiB but firmware does not work with that. */
>   /* Maybe it overflows a signed 32 bit number somewhere? */
> @@ -274,9 +273,7 @@ static void sam460ex_init(MachineState *machine)
>   {
>       MemoryRegion *address_space_mem = get_system_memory();
>       MemoryRegion *isa = g_new(MemoryRegion, 1);
> -    MemoryRegion *ram_memories = g_new(MemoryRegion, SDRAM_NR_BANKS);
> -    hwaddr ram_bases[SDRAM_NR_BANKS] = {0};
> -    hwaddr ram_sizes[SDRAM_NR_BANKS] = {0};
> +    Ppc4xxSdramBank *ram_banks = g_new0(Ppc4xxSdramBank, 1);
>       MemoryRegion *l2cache_ram = g_new(MemoryRegion, 1);
>       DeviceState *uic[4];
>       int i;
> @@ -345,20 +342,18 @@ static void sam460ex_init(MachineState *machine)
>       /* SDRAM controller */
>       /* put all RAM on first bank because board has one slot
>        * and firmware only checks that */
> -    ppc4xx_sdram_banks(machine->ram, 1, ram_memories, ram_bases, ram_sizes,
> -                       ppc460ex_sdram_bank_sizes);
> +    ppc4xx_sdram_banks(machine->ram, 1, ram_banks, ppc460ex_sdram_bank_sizes);
>   
>       /* FIXME: does 460EX have ECC interrupts? */
> -    ppc440_sdram_init(env, SDRAM_NR_BANKS, ram_memories,
> -                      ram_bases, ram_sizes, 1);
> +    ppc440_sdram_init(env, 1, ram_banks, 1);
>   
>       /* IIC controllers and devices */
>       dev = sysbus_create_simple(TYPE_PPC4xx_I2C, 0x4ef600700,
>                                  qdev_get_gpio_in(uic[0], 2));
>       i2c = PPC4xx_I2C(dev)->bus;
>       /* SPD EEPROM on RAM module */
> -    spd_data = spd_data_generate(ram_sizes[0] < 128 * MiB ? DDR : DDR2,
> -                                 ram_sizes[0]);
> +    spd_data = spd_data_generate(ram_banks->size < 128 * MiB ? DDR : DDR2,
> +                                 ram_banks->size);
>       spd_data[20] = 4; /* SO-DIMM module */
>       smbus_eeprom_init_one(i2c, 0x50, spd_data);
>       /* RTC */
> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
> index a5e6c185af..5013b8bf3a 100644
> --- a/include/hw/ppc/ppc4xx.h
> +++ b/include/hw/ppc/ppc4xx.h
> @@ -43,14 +43,11 @@ enum {
>   };
>   
>   void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
> -                        MemoryRegion ram_memories[],
> -                        hwaddr ram_bases[], hwaddr ram_sizes[],
> +                        Ppc4xxSdramBank ram_banks[],
>                           const ram_addr_t sdram_bank_sizes[]);
>   
> -void ppc4xx_sdram_init (CPUPPCState *env, qemu_irq irq, int nbanks,
> -                        MemoryRegion ram_memories[],
> -                        hwaddr *ram_bases,
> -                        hwaddr *ram_sizes);
> +void ppc4xx_sdram_init(CPUPPCState *env, qemu_irq irq, int nbanks,
> +                       Ppc4xxSdramBank *ram_banks);
>   
>   #define TYPE_PPC4xx_PCI_HOST_BRIDGE "ppc4xx-pcihost"
>   


