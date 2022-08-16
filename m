Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E60EC595469
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 10:04:05 +0200 (CEST)
Received: from localhost ([::1]:50074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNrYT-0003xu-1N
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 04:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oNrHT-0008Oe-6w; Tue, 16 Aug 2022 03:46:31 -0400
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:46741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oNrHC-0006A3-IF; Tue, 16 Aug 2022 03:46:30 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.103])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id C367C230D6;
 Tue, 16 Aug 2022 07:46:09 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 16 Aug
 2022 09:46:09 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0050a6037b4-eb5b-4915-baa9-09a8aa6ad1cf,
 F9C770E940B196DD2347A7F94772438AA2E7EC4E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8f45e23e-b836-2efe-b947-ef9cbd7671dd@kaod.org>
Date: Tue, 16 Aug 2022 09:46:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 18/22] ppc405: Move machine specific code to
 ppc405_boards.c
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <cover.1660402839.git.balaton@eik.bme.hu>
 <40e17a00dbfa6aadb1643a6362e415fa9f6daced.1660402839.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <40e17a00dbfa6aadb1643a6362e415fa9f6daced.1660402839.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 96609409-8364-4368-b6b9-774f2b6e2a2a
X-Ovh-Tracer-Id: 5422615430004378531
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehfedguddvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
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

On 8/13/22 17:34, BALATON Zoltan wrote:
> These are only used by tha board code so move out from the shared SoC

s/tha/the/

> model and put it in the boards file.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/ppc405.h        |  38 -----
>   hw/ppc/ppc405_boards.c | 375 +++++++++++++++++++++++++++--------------
>   hw/ppc/ppc405_uc.c     |  92 ----------
>   3 files changed, 251 insertions(+), 254 deletions(-)
> 
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index 12eee97169..6b26fc6d17 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -30,41 +30,6 @@
>   #include "hw/intc/ppc-uic.h"
>   #include "hw/i2c/ppc4xx_i2c.h"
>   
> -#define PPC405EP_SDRAM_BASE 0x00000000
> -#define PPC405EP_NVRAM_BASE 0xF0000000
> -#define PPC405EP_FPGA_BASE  0xF0300000
> -#define PPC405EP_SRAM_BASE  0xFFF00000
> -#define PPC405EP_SRAM_SIZE  (512 * KiB)
> -#define PPC405EP_FLASH_BASE 0xFFF80000
> -
> -/* Bootinfo as set-up by u-boot */
> -typedef struct ppc4xx_bd_info_t ppc4xx_bd_info_t;
> -struct ppc4xx_bd_info_t {
> -    uint32_t bi_memstart;
> -    uint32_t bi_memsize;
> -    uint32_t bi_flashstart;
> -    uint32_t bi_flashsize;
> -    uint32_t bi_flashoffset; /* 0x10 */
> -    uint32_t bi_sramstart;
> -    uint32_t bi_sramsize;
> -    uint32_t bi_bootflags;
> -    uint32_t bi_ipaddr; /* 0x20 */
> -    uint8_t  bi_enetaddr[6];
> -    uint16_t bi_ethspeed;
> -    uint32_t bi_intfreq;
> -    uint32_t bi_busfreq; /* 0x30 */
> -    uint32_t bi_baudrate;
> -    uint8_t  bi_s_version[4];
> -    uint8_t  bi_r_version[32];
> -    uint32_t bi_procfreq;
> -    uint32_t bi_plb_busfreq;
> -    uint32_t bi_pci_busfreq;
> -    uint8_t  bi_pci_enetaddr[6];
> -    uint8_t  bi_pci_enetaddr2[6]; /* PPC405EP specific */
> -    uint32_t bi_opbfreq;
> -    uint32_t bi_iic_fast[2];
> -};
> -
>   /* PLB to OPB bridge */
>   #define TYPE_PPC405_POB "ppc405-pob"
>   OBJECT_DECLARE_SIMPLE_TYPE(Ppc405PobState, PPC405_POB);
> @@ -224,7 +189,4 @@ struct Ppc405SoCState {
>       Ppc4xxMalState mal;
>   };
>   
> -/* PowerPC 405 core */
> -ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size);
> -
>   #endif /* PPC405_H */
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 7af0d7feef..083f12b23e 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -48,6 +48,10 @@
>   #define KERNEL_LOAD_ADDR 0x01000000
>   #define INITRD_LOAD_ADDR 0x01800000
>   
> +#define PPC405EP_SDRAM_BASE 0x00000000
> +#define PPC405EP_SRAM_BASE  0xFFF00000
> +#define PPC405EP_SRAM_SIZE  (512 * KiB)
> +
>   #define USE_FLASH_BIOS
>   
>   #define TYPE_PPC405_MACHINE MACHINE_TYPE_NAME("ppc405")
> @@ -61,112 +65,7 @@ struct Ppc405MachineState {
>       Ppc405SoCState soc;
>   };
>   
> -/*****************************************************************************/
> -/* PPC405EP reference board (IBM) */
> -/* Standalone board with:
> - * - PowerPC 405EP CPU
> - * - SDRAM (0x00000000)
> - * - Flash (0xFFF80000)
> - * - SRAM  (0xFFF00000)
> - * - NVRAM (0xF0000000)
> - * - FPGA  (0xF0300000)
> - */
> -
> -#define TYPE_REF405EP_FPGA "ref405ep-fpga"
> -OBJECT_DECLARE_SIMPLE_TYPE(Ref405epFpgaState, REF405EP_FPGA);
> -struct Ref405epFpgaState {
> -    SysBusDevice parent_obj;
> -
> -    MemoryRegion iomem;
> -
> -    uint8_t reg0;
> -    uint8_t reg1;
> -};
> -
> -static uint64_t ref405ep_fpga_readb(void *opaque, hwaddr addr, unsigned size)
> -{
> -    Ref405epFpgaState *fpga = opaque;
> -    uint32_t ret;
> -
> -    switch (addr) {
> -    case 0x0:
> -        ret = fpga->reg0;
> -        break;
> -    case 0x1:
> -        ret = fpga->reg1;
> -        break;
> -    default:
> -        ret = 0;
> -        break;
> -    }
> -
> -    return ret;
> -}
> -
> -static void ref405ep_fpga_writeb(void *opaque, hwaddr addr, uint64_t value,
> -                                 unsigned size)
> -{
> -    Ref405epFpgaState *fpga = opaque;
> -
> -    switch (addr) {
> -    case 0x0:
> -        /* Read only */
> -        break;
> -    case 0x1:
> -        fpga->reg1 = value;
> -        break;
> -    default:
> -        break;
> -    }
> -}
> -
> -static const MemoryRegionOps ref405ep_fpga_ops = {
> -    .read = ref405ep_fpga_readb,
> -    .write = ref405ep_fpga_writeb,
> -    .impl.min_access_size = 1,
> -    .impl.max_access_size = 1,
> -    .valid.min_access_size = 1,
> -    .valid.max_access_size = 4,
> -    .endianness = DEVICE_BIG_ENDIAN,
> -};
> -
> -static void ref405ep_fpga_reset(DeviceState *dev)
> -{
> -    Ref405epFpgaState *fpga = REF405EP_FPGA(dev);
> -
> -    fpga->reg0 = 0x00;
> -    fpga->reg1 = 0x0F;
> -}
> -
> -static void ref405ep_fpga_realize(DeviceState *dev, Error **errp)
> -{
> -    Ref405epFpgaState *s = REF405EP_FPGA(dev);
> -
> -    memory_region_init_io(&s->iomem, OBJECT(s), &ref405ep_fpga_ops, s,
> -                          "fpga", 0x00000100);
> -    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
> -}
> -
> -static void ref405ep_fpga_class_init(ObjectClass *oc, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(oc);
> -
> -    dc->realize = ref405ep_fpga_realize;
> -    dc->reset = ref405ep_fpga_reset;
> -    /* Reason: only works as part of a ppc405 board */
> -    dc->user_creatable = false;
> -}
> -
> -static const TypeInfo ref405ep_fpga_type = {
> -    .name = TYPE_REF405EP_FPGA,
> -    .parent = TYPE_SYS_BUS_DEVICE,
> -    .instance_size = sizeof(Ref405epFpgaState),
> -    .class_init = ref405ep_fpga_class_init,
> -};
> -
> -/*
> - * CPU reset handler when booting directly from a loaded kernel
> - */
> +/* CPU reset handler when booting directly from a loaded kernel */
>   static struct boot_info {
>       uint32_t entry;
>       uint32_t bdloc;
> @@ -197,6 +96,126 @@ static void main_cpu_reset(void *opaque)
>       env->nip = bi->entry;
>   }
>   
> +/* Bootinfo as set-up by u-boot */
> +typedef struct {
> +    uint32_t bi_memstart;
> +    uint32_t bi_memsize;
> +    uint32_t bi_flashstart;
> +    uint32_t bi_flashsize;
> +    uint32_t bi_flashoffset; /* 0x10 */
> +    uint32_t bi_sramstart;
> +    uint32_t bi_sramsize;
> +    uint32_t bi_bootflags;
> +    uint32_t bi_ipaddr; /* 0x20 */
> +    uint8_t  bi_enetaddr[6];
> +    uint16_t bi_ethspeed;
> +    uint32_t bi_intfreq;
> +    uint32_t bi_busfreq; /* 0x30 */
> +    uint32_t bi_baudrate;
> +    uint8_t  bi_s_version[4];
> +    uint8_t  bi_r_version[32];
> +    uint32_t bi_procfreq;
> +    uint32_t bi_plb_busfreq;
> +    uint32_t bi_pci_busfreq;
> +    uint8_t  bi_pci_enetaddr[6];
> +    uint8_t  bi_pci_enetaddr2[6]; /* PPC405EP specific */
> +    uint32_t bi_opbfreq;
> +    uint32_t bi_iic_fast[2];
> +} ppc4xx_bd_info_t;
> +
> +static void ppc405_set_default_bootinfo(ppc4xx_bd_info_t *bd,
> +                                        ram_addr_t ram_size)
> +{
> +        memset(bd, 0, sizeof(*bd));
> +
> +        bd->bi_memstart = PPC405EP_SDRAM_BASE;
> +        bd->bi_memsize = ram_size;
> +        bd->bi_sramstart = PPC405EP_SRAM_BASE;
> +        bd->bi_sramsize = PPC405EP_SRAM_SIZE;
> +        bd->bi_bootflags = 0;
> +        bd->bi_intfreq = 133333333;
> +        bd->bi_busfreq = 33333333;
> +        bd->bi_baudrate = 115200;
> +        bd->bi_s_version[0] = 'Q';
> +        bd->bi_s_version[1] = 'M';
> +        bd->bi_s_version[2] = 'U';
> +        bd->bi_s_version[3] = '\0';
> +        bd->bi_r_version[0] = 'Q';
> +        bd->bi_r_version[1] = 'E';
> +        bd->bi_r_version[2] = 'M';
> +        bd->bi_r_version[3] = 'U';
> +        bd->bi_r_version[4] = '\0';
> +        bd->bi_procfreq = 133333333;
> +        bd->bi_plb_busfreq = 33333333;
> +        bd->bi_pci_busfreq = 33333333;
> +        bd->bi_opbfreq = 33333333;
> +}
> +
> +static ram_addr_t __ppc405_set_bootinfo(CPUPPCState *env, ppc4xx_bd_info_t *bd)
> +{
> +    CPUState *cs = env_cpu(env);
> +    ram_addr_t bdloc;
> +    int i, n;
> +
> +    /* We put the bd structure at the top of memory */
> +    if (bd->bi_memsize >= 0x01000000UL) {
> +        bdloc = 0x01000000UL - sizeof(ppc4xx_bd_info_t);
> +    } else {
> +        bdloc = bd->bi_memsize - sizeof(ppc4xx_bd_info_t);
> +    }
> +    stl_be_phys(cs->as, bdloc + 0x00, bd->bi_memstart);
> +    stl_be_phys(cs->as, bdloc + 0x04, bd->bi_memsize);
> +    stl_be_phys(cs->as, bdloc + 0x08, bd->bi_flashstart);
> +    stl_be_phys(cs->as, bdloc + 0x0C, bd->bi_flashsize);
> +    stl_be_phys(cs->as, bdloc + 0x10, bd->bi_flashoffset);
> +    stl_be_phys(cs->as, bdloc + 0x14, bd->bi_sramstart);
> +    stl_be_phys(cs->as, bdloc + 0x18, bd->bi_sramsize);
> +    stl_be_phys(cs->as, bdloc + 0x1C, bd->bi_bootflags);
> +    stl_be_phys(cs->as, bdloc + 0x20, bd->bi_ipaddr);
> +    for (i = 0; i < 6; i++) {
> +        stb_phys(cs->as, bdloc + 0x24 + i, bd->bi_enetaddr[i]);
> +    }
> +    stw_be_phys(cs->as, bdloc + 0x2A, bd->bi_ethspeed);
> +    stl_be_phys(cs->as, bdloc + 0x2C, bd->bi_intfreq);
> +    stl_be_phys(cs->as, bdloc + 0x30, bd->bi_busfreq);
> +    stl_be_phys(cs->as, bdloc + 0x34, bd->bi_baudrate);
> +    for (i = 0; i < 4; i++) {
> +        stb_phys(cs->as, bdloc + 0x38 + i, bd->bi_s_version[i]);
> +    }
> +    for (i = 0; i < 32; i++) {
> +        stb_phys(cs->as, bdloc + 0x3C + i, bd->bi_r_version[i]);
> +    }
> +    stl_be_phys(cs->as, bdloc + 0x5C, bd->bi_procfreq);
> +    stl_be_phys(cs->as, bdloc + 0x60, bd->bi_plb_busfreq);
> +    stl_be_phys(cs->as, bdloc + 0x64, bd->bi_pci_busfreq);
> +    for (i = 0; i < 6; i++) {
> +        stb_phys(cs->as, bdloc + 0x68 + i, bd->bi_pci_enetaddr[i]);
> +    }
> +    n = 0x70; /* includes 2 bytes hole */
> +    for (i = 0; i < 6; i++) {
> +        stb_phys(cs->as, bdloc + n++, bd->bi_pci_enetaddr2[i]);
> +    }
> +    stl_be_phys(cs->as, bdloc + n, bd->bi_opbfreq);
> +    n += 4;
> +    for (i = 0; i < 2; i++) {
> +        stl_be_phys(cs->as, bdloc + n, bd->bi_iic_fast[i]);
> +        n += 4;
> +    }
> +
> +    return bdloc;
> +}
> +
> +static ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size)
> +{
> +    ppc4xx_bd_info_t bd;
> +
> +    memset(&bd, 0, sizeof(bd));
> +
> +    ppc405_set_default_bootinfo(&bd, ram_size);
> +
> +    return __ppc405_set_bootinfo(env, &bd);
> +}
> +
>   static void boot_from_kernel(MachineState *machine, PowerPCCPU *cpu)
>   {
>       CPUPPCState *env = &cpu->env;
> @@ -334,6 +353,132 @@ static void ppc405_init(MachineState *machine)
>       }
>   }
>   
> +static void ppc405_machine_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    mc->desc = "PPC405 generic machine";
> +    mc->init = ppc405_init;
> +    mc->default_ram_size = 128 * MiB;
> +    mc->default_ram_id = "ppc405.ram";
> +}
> +
> +static const TypeInfo ppc405_machine_type = {
> +    .name = TYPE_PPC405_MACHINE,
> +    .parent = TYPE_MACHINE,
> +    .instance_size = sizeof(Ppc405MachineState),
> +    .class_init = ppc405_machine_class_init,
> +    .abstract = true,
> +};
> +
> +/*****************************************************************************/
> +/* PPC405EP reference board (IBM) */
> +/*
> + * Standalone board with:
> + * - PowerPC 405EP CPU
> + * - SDRAM (0x00000000)
> + * - Flash (0xFFF80000)
> + * - SRAM  (0xFFF00000)
> + * - NVRAM (0xF0000000)
> + * - FPGA  (0xF0300000)
> + */
> +
> +#define PPC405EP_NVRAM_BASE 0xF0000000
> +#define PPC405EP_FPGA_BASE  0xF0300000
> +#define PPC405EP_FLASH_BASE 0xFFF80000
> +
> +#define TYPE_REF405EP_FPGA "ref405ep-fpga"
> +OBJECT_DECLARE_SIMPLE_TYPE(Ref405epFpgaState, REF405EP_FPGA);
> +struct Ref405epFpgaState {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion iomem;
> +
> +    uint8_t reg0;
> +    uint8_t reg1;
> +};
> +
> +static uint64_t ref405ep_fpga_readb(void *opaque, hwaddr addr, unsigned size)
> +{
> +    Ref405epFpgaState *fpga = opaque;
> +    uint32_t ret;
> +
> +    switch (addr) {
> +    case 0x0:
> +        ret = fpga->reg0;
> +        break;
> +    case 0x1:
> +        ret = fpga->reg1;
> +        break;
> +    default:
> +        ret = 0;
> +        break;
> +    }
> +
> +    return ret;
> +}
> +
> +static void ref405ep_fpga_writeb(void *opaque, hwaddr addr, uint64_t value,
> +                                 unsigned size)
> +{
> +    Ref405epFpgaState *fpga = opaque;
> +
> +    switch (addr) {
> +    case 0x0:
> +        /* Read only */
> +        break;
> +    case 0x1:
> +        fpga->reg1 = value;
> +        break;
> +    default:
> +        break;
> +    }
> +}
> +
> +static const MemoryRegionOps ref405ep_fpga_ops = {
> +    .read = ref405ep_fpga_readb,
> +    .write = ref405ep_fpga_writeb,
> +    .impl.min_access_size = 1,
> +    .impl.max_access_size = 1,
> +    .valid.min_access_size = 1,
> +    .valid.max_access_size = 4,
> +    .endianness = DEVICE_BIG_ENDIAN,
> +};
> +
> +static void ref405ep_fpga_reset(DeviceState *dev)
> +{
> +    Ref405epFpgaState *fpga = REF405EP_FPGA(dev);
> +
> +    fpga->reg0 = 0x00;
> +    fpga->reg1 = 0x0F;
> +}
> +
> +static void ref405ep_fpga_realize(DeviceState *dev, Error **errp)
> +{
> +    Ref405epFpgaState *s = REF405EP_FPGA(dev);
> +
> +    memory_region_init_io(&s->iomem, OBJECT(s), &ref405ep_fpga_ops, s,
> +                          "fpga", 0x00000100);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
> +}
> +
> +static void ref405ep_fpga_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = ref405ep_fpga_realize;
> +    dc->reset = ref405ep_fpga_reset;
> +    /* Reason: only works as part of a ppc405 board */
> +    dc->user_creatable = false;
> +}
> +
> +static const TypeInfo ref405ep_fpga_type = {
> +    .name = TYPE_REF405EP_FPGA,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(Ref405epFpgaState),
> +    .class_init = ref405ep_fpga_class_init,
> +};
> +
>   static void ref405ep_init(MachineState *machine)
>   {
>       DeviceState *dev;
> @@ -375,24 +520,6 @@ static const TypeInfo ref405ep_type = {
>       .class_init = ref405ep_class_init,
>   };
>   
> -static void ppc405_machine_class_init(ObjectClass *oc, void *data)
> -{
> -    MachineClass *mc = MACHINE_CLASS(oc);
> -
> -    mc->desc = "PPC405 generic machine";
> -    mc->init = ppc405_init;
> -    mc->default_ram_size = 128 * MiB;
> -    mc->default_ram_id = "ppc405.ram";
> -}
> -
> -static const TypeInfo ppc405_machine_type = {
> -    .name = TYPE_PPC405_MACHINE,
> -    .parent = TYPE_MACHINE,
> -    .instance_size = sizeof(Ppc405MachineState),
> -    .class_init = ppc405_machine_class_init,
> -    .abstract = true,
> -};
> -
>   static void ppc405_machine_init(void)
>   {
>       type_register_static(&ppc405_machine_type);
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index a7a7d7e65b..b13026200f 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -42,98 +42,6 @@
>   #include "qapi/error.h"
>   #include "trace.h"
>   
> -static void ppc405_set_default_bootinfo(ppc4xx_bd_info_t *bd,
> -                                        ram_addr_t ram_size)
> -{
> -        memset(bd, 0, sizeof(*bd));
> -
> -        bd->bi_memstart = PPC405EP_SDRAM_BASE;
> -        bd->bi_memsize = ram_size;
> -        bd->bi_sramstart = PPC405EP_SRAM_BASE;
> -        bd->bi_sramsize = PPC405EP_SRAM_SIZE;
> -        bd->bi_bootflags = 0;
> -        bd->bi_intfreq = 133333333;
> -        bd->bi_busfreq = 33333333;
> -        bd->bi_baudrate = 115200;
> -        bd->bi_s_version[0] = 'Q';
> -        bd->bi_s_version[1] = 'M';
> -        bd->bi_s_version[2] = 'U';
> -        bd->bi_s_version[3] = '\0';
> -        bd->bi_r_version[0] = 'Q';
> -        bd->bi_r_version[1] = 'E';
> -        bd->bi_r_version[2] = 'M';
> -        bd->bi_r_version[3] = 'U';
> -        bd->bi_r_version[4] = '\0';
> -        bd->bi_procfreq = 133333333;
> -        bd->bi_plb_busfreq = 33333333;
> -        bd->bi_pci_busfreq = 33333333;
> -        bd->bi_opbfreq = 33333333;
> -}
> -
> -static ram_addr_t __ppc405_set_bootinfo(CPUPPCState *env, ppc4xx_bd_info_t *bd)
> -{
> -    CPUState *cs = env_cpu(env);
> -    ram_addr_t bdloc;
> -    int i, n;
> -
> -    /* We put the bd structure at the top of memory */
> -    if (bd->bi_memsize >= 0x01000000UL)
> -        bdloc = 0x01000000UL - sizeof(struct ppc4xx_bd_info_t);
> -    else
> -        bdloc = bd->bi_memsize - sizeof(struct ppc4xx_bd_info_t);
> -    stl_be_phys(cs->as, bdloc + 0x00, bd->bi_memstart);
> -    stl_be_phys(cs->as, bdloc + 0x04, bd->bi_memsize);
> -    stl_be_phys(cs->as, bdloc + 0x08, bd->bi_flashstart);
> -    stl_be_phys(cs->as, bdloc + 0x0C, bd->bi_flashsize);
> -    stl_be_phys(cs->as, bdloc + 0x10, bd->bi_flashoffset);
> -    stl_be_phys(cs->as, bdloc + 0x14, bd->bi_sramstart);
> -    stl_be_phys(cs->as, bdloc + 0x18, bd->bi_sramsize);
> -    stl_be_phys(cs->as, bdloc + 0x1C, bd->bi_bootflags);
> -    stl_be_phys(cs->as, bdloc + 0x20, bd->bi_ipaddr);
> -    for (i = 0; i < 6; i++) {
> -        stb_phys(cs->as, bdloc + 0x24 + i, bd->bi_enetaddr[i]);
> -    }
> -    stw_be_phys(cs->as, bdloc + 0x2A, bd->bi_ethspeed);
> -    stl_be_phys(cs->as, bdloc + 0x2C, bd->bi_intfreq);
> -    stl_be_phys(cs->as, bdloc + 0x30, bd->bi_busfreq);
> -    stl_be_phys(cs->as, bdloc + 0x34, bd->bi_baudrate);
> -    for (i = 0; i < 4; i++) {
> -        stb_phys(cs->as, bdloc + 0x38 + i, bd->bi_s_version[i]);
> -    }
> -    for (i = 0; i < 32; i++) {
> -        stb_phys(cs->as, bdloc + 0x3C + i, bd->bi_r_version[i]);
> -    }
> -    stl_be_phys(cs->as, bdloc + 0x5C, bd->bi_procfreq);
> -    stl_be_phys(cs->as, bdloc + 0x60, bd->bi_plb_busfreq);
> -    stl_be_phys(cs->as, bdloc + 0x64, bd->bi_pci_busfreq);
> -    for (i = 0; i < 6; i++) {
> -        stb_phys(cs->as, bdloc + 0x68 + i, bd->bi_pci_enetaddr[i]);
> -    }
> -    n = 0x70; /* includes 2 bytes hole */
> -    for (i = 0; i < 6; i++) {
> -        stb_phys(cs->as, bdloc + n++, bd->bi_pci_enetaddr2[i]);
> -    }
> -    stl_be_phys(cs->as, bdloc + n, bd->bi_opbfreq);
> -    n += 4;
> -    for (i = 0; i < 2; i++) {
> -        stl_be_phys(cs->as, bdloc + n, bd->bi_iic_fast[i]);
> -        n += 4;
> -    }
> -
> -    return bdloc;
> -}
> -
> -ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size)
> -{
> -    ppc4xx_bd_info_t bd;
> -
> -    memset(&bd, 0, sizeof(bd));
> -
> -    ppc405_set_default_bootinfo(&bd, ram_size);
> -
> -    return __ppc405_set_bootinfo(env, &bd);
> -}
> -
>   /*****************************************************************************/
>   /* Shared peripherals */
>   


