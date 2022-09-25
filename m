Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 887D15E91B3
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 10:44:16 +0200 (CEST)
Received: from localhost ([::1]:46020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocNFH-0004lT-55
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 04:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocNCV-0001y8-BK; Sun, 25 Sep 2022 04:41:24 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocNCT-0007kU-3J; Sun, 25 Sep 2022 04:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e2yi+QVI2r85pVFw7rx3EE40kQEJN8jPnYzxne2fQXk=; b=Uq7TNSMiIpSt/8rOXyUUZNT6m9
 1JApOeA2b5q2Ge9DCUxyx0zYnFtJoNhkOEWGYdmYtBHGWqxK/e2MdW4dNXHzjJmJLt+dEMUtXdiJd
 xTBbf9qawjVAiCS+S7iApLIRvC4v+v3Bi1qbOurlYcKpXNkWF6iRuLpJKjui1CjF3wkqG5EPtsRfG
 UlWiyAotXMznsB0TcOSc9uDLCV0OCBL3F/ZVs+ejvvhZdXtpZBr4AthzTon7kIfe5IM1ozGMG6Xgo
 kSu/81Zw/ZFmGX4mzSZmzIMBD3nas50j3YEXNjh+tOgX1BF3oUh8pJl6vOnKCsnjHDETRi0bfqJrO
 n66A/YA974hiiRk09NoRbqjFrODTVc+8/QLmrGlz+d/+l7EqosmeGLvo+MRgKzCLYAq09Onw/M2u/
 OLVLIAp3u1Sze4oJ6Tol2rwoGjeX9lp4nOb+KgCilzRhsdpmurwJIhs/bEl0m5jmYS0SAGFUUGX1T
 D7Qw46IA2rMlTfHXiXaJbnDa4WUCx7hGMOutLtg3YlsVc5CdS7NZfgYM5bhug2iJT9V2DdL1uI7Mm
 uSXc7cqh0T0phqA4r8S/tiogpJay9TnTIluxKinJfTPiK3LoHJoYrFAhLn20WIhmUV82tAxPyY8gJ
 jjvw5Mt+e7m/Tziwl69pTI8n0fpIpi01mlV1lgXKM=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocNAg-0006ld-VC; Sun, 25 Sep 2022 09:39:35 +0100
Message-ID: <5ddd79bb-7a54-750e-8ca4-a928ee98b185@ilande.co.uk>
Date: Sun, 25 Sep 2022 09:41:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1663368422.git.balaton@eik.bme.hu>
 <2f35db85d9f817a2e7c9d994bd8906bc8ec16945.1663368422.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <2f35db85d9f817a2e7c9d994bd8906bc8ec16945.1663368422.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 01/10] mac_newworld: Drop some variables
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 17/09/2022 00:07, BALATON Zoltan wrote:

> Values not used frequently enough may not worth putting in a local
> variable, especially with names almost as long as the original value
> because that does not improve readability, to the contrary it makes it
> harder to see what value is used. Drop a few such variables. This is
> the same clean up that was done for mac_oldworld in commit b8df32555ce5.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/mac_newworld.c | 65 +++++++++++++++++++------------------------
>   1 file changed, 29 insertions(+), 36 deletions(-)
> 
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index cf7eb72391..27e4e8d136 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -106,18 +106,13 @@ static void ppc_core99_reset(void *opaque)
>   /* PowerPC Mac99 hardware initialisation */
>   static void ppc_core99_init(MachineState *machine)
>   {
> -    ram_addr_t ram_size = machine->ram_size;
> -    const char *bios_name = machine->firmware ?: PROM_FILENAME;
> -    const char *kernel_filename = machine->kernel_filename;
> -    const char *kernel_cmdline = machine->kernel_cmdline;
> -    const char *initrd_filename = machine->initrd_filename;
> -    const char *boot_device = machine->boot_config.order;
>       Core99MachineState *core99_machine = CORE99_MACHINE(machine);
>       PowerPCCPU *cpu = NULL;
>       CPUPPCState *env = NULL;
>       char *filename;
>       IrqLines *openpic_irqs;
> -    int linux_boot, i, j, k;
> +    int i, j, k, ppc_boot_device, machine_arch, bios_size;
> +    const char *bios_name = machine->firmware ?: PROM_FILENAME;
>       MemoryRegion *bios = g_new(MemoryRegion, 1);
>       hwaddr kernel_base, initrd_base, cmdline_base = 0;
>       long kernel_size, initrd_size;
> @@ -129,22 +124,16 @@ static void ppc_core99_init(MachineState *machine)
>       MACIOIDEState *macio_ide;
>       BusState *adb_bus;
>       MacIONVRAMState *nvr;
> -    int bios_size;
> -    int ppc_boot_device;
>       DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
>       void *fw_cfg;
> -    int machine_arch;
>       SysBusDevice *s;
>       DeviceState *dev, *pic_dev;
>       DeviceState *uninorth_internal_dev = NULL, *uninorth_agp_dev = NULL;
>       hwaddr nvram_addr = 0xFFF04000;
>       uint64_t tbfreq;
> -    unsigned int smp_cpus = machine->smp.cpus;
> -
> -    linux_boot = (kernel_filename != NULL);
>   
>       /* init CPUs */
> -    for (i = 0; i < smp_cpus; i++) {
> +    for (i = 0; i < machine->smp.cpus; i++) {
>           cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
>           env = &cpu->env;
>   
> @@ -184,7 +173,7 @@ static void ppc_core99_init(MachineState *machine)
>           exit(1);
>       }
>   
> -    if (linux_boot) {
> +    if (machine->kernel_filename) {
>           int bswap_needed;
>   
>   #ifdef BSWAP_NEEDED
> @@ -194,29 +183,31 @@ static void ppc_core99_init(MachineState *machine)
>   #endif
>           kernel_base = KERNEL_LOAD_ADDR;
>   
> -        kernel_size = load_elf(kernel_filename, NULL,
> +        kernel_size = load_elf(machine->kernel_filename, NULL,
>                                  translate_kernel_address, NULL, NULL, NULL,
>                                  NULL, NULL, 1, PPC_ELF_MACHINE, 0, 0);
>           if (kernel_size < 0)
> -            kernel_size = load_aout(kernel_filename, kernel_base,
> -                                    ram_size - kernel_base, bswap_needed,
> -                                    TARGET_PAGE_SIZE);
> +            kernel_size = load_aout(machine->kernel_filename, kernel_base,
> +                                    machine->ram_size - kernel_base,
> +                                    bswap_needed, TARGET_PAGE_SIZE);
>           if (kernel_size < 0)
> -            kernel_size = load_image_targphys(kernel_filename,
> +            kernel_size = load_image_targphys(machine->kernel_filename,
>                                                 kernel_base,
> -                                              ram_size - kernel_base);
> +                                              machine->ram_size - kernel_base);
>           if (kernel_size < 0) {
> -            error_report("could not load kernel '%s'", kernel_filename);
> +            error_report("could not load kernel '%s'",
> +                         machine->kernel_filename);
>               exit(1);
>           }
>           /* load initrd */
> -        if (initrd_filename) {
> +        if (machine->initrd_filename) {
>               initrd_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + KERNEL_GAP);
> -            initrd_size = load_image_targphys(initrd_filename, initrd_base,
> -                                              ram_size - initrd_base);
> +            initrd_size = load_image_targphys(machine->initrd_filename,
> +                                              initrd_base,
> +                                              machine->ram_size - initrd_base);
>               if (initrd_size < 0) {
>                   error_report("could not load initial ram disk '%s'",
> -                             initrd_filename);
> +                             machine->initrd_filename);
>                   exit(1);
>               }
>               cmdline_base = TARGET_PAGE_ALIGN(initrd_base + initrd_size);
> @@ -235,9 +226,10 @@ static void ppc_core99_init(MachineState *machine)
>           /* We consider that NewWorld PowerMac never have any floppy drive
>            * For now, OHW cannot boot from the network.
>            */
> -        for (i = 0; boot_device[i] != '\0'; i++) {
> -            if (boot_device[i] >= 'c' && boot_device[i] <= 'f') {
> -                ppc_boot_device = boot_device[i];
> +        for (i = 0; machine->boot_config.order[i] != '\0'; i++) {
> +            if (machine->boot_config.order[i] >= 'c' &&
> +                machine->boot_config.order[i] <= 'f') {
> +                ppc_boot_device = machine->boot_config.order[i];
>                   break;
>               }
>           }
> @@ -254,8 +246,8 @@ static void ppc_core99_init(MachineState *machine)
>       memory_region_add_subregion(get_system_memory(), 0xf8000000,
>                                   sysbus_mmio_get_region(s, 0));
>   
> -    openpic_irqs = g_new0(IrqLines, smp_cpus);
> -    for (i = 0; i < smp_cpus; i++) {
> +    openpic_irqs = g_new0(IrqLines, machine->smp.cpus);
> +    for (i = 0; i < machine->smp.cpus; i++) {
>           /* Mac99 IRQ connection between OpenPIC outputs pins
>            * and PowerPC input pins
>            */
> @@ -398,7 +390,7 @@ static void ppc_core99_init(MachineState *machine)
>       /* OpenPIC */
>       s = SYS_BUS_DEVICE(pic_dev);
>       k = 0;
> -    for (i = 0; i < smp_cpus; i++) {
> +    for (i = 0; i < machine->smp.cpus; i++) {
>           for (j = 0; j < OPENPIC_OUTPUT_NB; j++) {
>               sysbus_connect_irq(s, k++, openpic_irqs[i].irq[j]);
>           }
> @@ -480,15 +472,16 @@ static void ppc_core99_init(MachineState *machine)
>       sysbus_mmio_map(s, 0, CFG_ADDR);
>       sysbus_mmio_map(s, 1, CFG_ADDR + 2);
>   
> -    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)smp_cpus);
> +    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)machine->smp.cpus);
>       fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)machine->smp.max_cpus);
> -    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
> +    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)machine->ram_size);
>       fw_cfg_add_i16(fw_cfg, FW_CFG_MACHINE_ID, machine_arch);
>       fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, kernel_base);
>       fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
> -    if (kernel_cmdline) {
> +    if (machine->kernel_cmdline) {
>           fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_CMDLINE, cmdline_base);
> -        pstrcpy_targphys("cmdline", cmdline_base, TARGET_PAGE_SIZE, kernel_cmdline);
> +        pstrcpy_targphys("cmdline", cmdline_base, TARGET_PAGE_SIZE,
> +                         machine->kernel_cmdline);
>       } else {
>           fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_CMDLINE, 0);
>       }

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

