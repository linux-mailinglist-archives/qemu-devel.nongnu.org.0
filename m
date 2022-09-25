Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E01F55E91B4
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 10:44:55 +0200 (CEST)
Received: from localhost ([::1]:46412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocNFu-0005e8-Rd
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 04:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocNDL-0002zn-6M; Sun, 25 Sep 2022 04:42:18 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocNDJ-0007nv-BN; Sun, 25 Sep 2022 04:42:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VOSgqEfnDgcqvFOK7ZcKwNQHyv5XBq5Ah4sAUJ1AhdI=; b=fHzzjpmDTLOp5uJIb4UbWzZB5b
 sSBuDJRVdGLeY14qHUynHaN4DZYSqf/E7auQAC/6K/jYxkLfIZgo/2+bDpBpsVsnFB75woPb52D7p
 rH13I9DBEJ+C8Izitwg/Qr2Bf4IMgtMFUB6c4HvxIiXLphWzp1F7nlmVxtDOmy7y2c8eXM4hR2Wgf
 EMKvgf9/FzQDw3KoUpgHwhEPRDNFUa2WwehXcCv8QOwbCJBsCsmJsW+9DPKg1z4Z77t+I2Uwyhe0S
 eboKbKPn3ViIJuKnHa07NNLPC1h7U30QyJnMlIboC2k1WSOMxnTPVF79EsCI54yQ0RAZHHe9+ur7l
 VxfP1c9z5ASzrVPGnmdBQZLMivb2BwdBWj0YyYVlBDMC9rO5Gbk5x+VhaNWfXlFAa36rJ4r2MLMt6
 4CyplKGbfdRzhDoM21GJ29R8jIy5BwFsEQHixNfxceEo6ug3dKEA7XRO5388OBuyWiFPPgzXBtwbv
 roLTWx9mAdUAuG346A98ec7IuxCLmzM+7YNlftnYNwn57dQhWhZNaLOO3R/mbiAwtYQsU/AlkLSxl
 Se09RfzsA0MCX4XpZl1oHIGcxHY10BwPeqdByaR++aisNPmZ3QjeVzzCuusXd96l8emxLNowcz9yJ
 yt/VcQKN5Xtgj6i46+8R3WqtZd9pGWqLr8/QCwpMU=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocNBZ-0006ly-Ia; Sun, 25 Sep 2022 09:40:29 +0100
Message-ID: <f7ae1b53-bbee-52e3-2a99-58f612b66ed1@ilande.co.uk>
Date: Sun, 25 Sep 2022 09:42:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1663368422.git.balaton@eik.bme.hu>
 <e58a3c14ae73d40629a3dd8b9b542a69fe86b07f.1663368422.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <e58a3c14ae73d40629a3dd8b9b542a69fe86b07f.1663368422.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 02/10] mac_oldworld: Drop some more variables
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

> Drop some more local variables additionally to commit b8df32555ce5 to
> match clean ups done to mac_newwold in previous patch.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/mac_oldworld.c | 43 +++++++++++++++++++++----------------------
>   1 file changed, 21 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index 03732ca7ed..86512d31ad 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -80,14 +80,13 @@ static void ppc_heathrow_reset(void *opaque)
>   
>   static void ppc_heathrow_init(MachineState *machine)
>   {
> -    ram_addr_t ram_size = machine->ram_size;
>       const char *bios_name = machine->firmware ?: PROM_FILENAME;
> -    const char *boot_device = machine->boot_config.order;
>       PowerPCCPU *cpu = NULL;
>       CPUPPCState *env = NULL;
>       char *filename;
> -    int i;
> +    int i, bios_size;
>       MemoryRegion *bios = g_new(MemoryRegion, 1);
> +    uint64_t bios_addr;
>       uint32_t kernel_base, initrd_base, cmdline_base = 0;
>       int32_t kernel_size, initrd_size;
>       PCIBus *pci_bus;
> @@ -97,16 +96,13 @@ static void ppc_heathrow_init(MachineState *machine)
>       SysBusDevice *s;
>       DeviceState *dev, *pic_dev, *grackle_dev;
>       BusState *adb_bus;
> -    uint64_t bios_addr;
> -    int bios_size;
> -    unsigned int smp_cpus = machine->smp.cpus;
>       uint16_t ppc_boot_device;
>       DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
>       void *fw_cfg;
>       uint64_t tbfreq;
>   
>       /* init CPUs */
> -    for (i = 0; i < smp_cpus; i++) {
> +    for (i = 0; i < machine->smp.cpus; i++) {
>           cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
>           env = &cpu->env;
>   
> @@ -116,9 +112,9 @@ static void ppc_heathrow_init(MachineState *machine)
>       }
>   
>       /* allocate RAM */
> -    if (ram_size > 2047 * MiB) {
> +    if (machine->ram_size > 2047 * MiB) {
>           error_report("Too much memory for this machine: %" PRId64 " MB, "
> -                     "maximum 2047 MB", ram_size / MiB);
> +                     "maximum 2047 MB", machine->ram_size / MiB);
>           exit(1);
>       }
>   
> @@ -165,12 +161,12 @@ static void ppc_heathrow_init(MachineState *machine)
>                                  NULL, NULL, 1, PPC_ELF_MACHINE, 0, 0);
>           if (kernel_size < 0)
>               kernel_size = load_aout(machine->kernel_filename, kernel_base,
> -                                    ram_size - kernel_base, bswap_needed,
> -                                    TARGET_PAGE_SIZE);
> +                                    machine->ram_size - kernel_base,
> +                                    bswap_needed, TARGET_PAGE_SIZE);
>           if (kernel_size < 0)
>               kernel_size = load_image_targphys(machine->kernel_filename,
>                                                 kernel_base,
> -                                              ram_size - kernel_base);
> +                                              machine->ram_size - kernel_base);
>           if (kernel_size < 0) {
>               error_report("could not load kernel '%s'",
>                            machine->kernel_filename);
> @@ -182,7 +178,7 @@ static void ppc_heathrow_init(MachineState *machine)
>                                               KERNEL_GAP);
>               initrd_size = load_image_targphys(machine->initrd_filename,
>                                                 initrd_base,
> -                                              ram_size - initrd_base);
> +                                              machine->ram_size - initrd_base);
>               if (initrd_size < 0) {
>                   error_report("could not load initial ram disk '%s'",
>                                machine->initrd_filename);
> @@ -201,19 +197,22 @@ static void ppc_heathrow_init(MachineState *machine)
>           initrd_base = 0;
>           initrd_size = 0;
>           ppc_boot_device = '\0';
> -        for (i = 0; boot_device[i] != '\0'; i++) {
> -            /* TOFIX: for now, the second IDE channel is not properly
> +        for (i = 0; machine->boot_config.order[i] != '\0'; i++) {
> +            /*
> +             * TOFIX: for now, the second IDE channel is not properly
>                *        used by OHW. The Mac floppy disk are not emulated.
>                *        For now, OHW cannot boot from the network.
>                */
>   #if 0
> -            if (boot_device[i] >= 'a' && boot_device[i] <= 'f') {
> -                ppc_boot_device = boot_device[i];
> +            if (machine->boot_config.order[i] >= 'a' &&
> +                machine->boot_config.order[i] <= 'f') {
> +                ppc_boot_device = machine->boot_config.order[i];
>                   break;
>               }
>   #else
> -            if (boot_device[i] >= 'c' && boot_device[i] <= 'd') {
> -                ppc_boot_device = boot_device[i];
> +            if (machine->boot_config.order[i] >= 'c' &&
> +                machine->boot_config.order[i] <= 'd') {
> +                ppc_boot_device = machine->boot_config.order[i];
>                   break;
>               }
>   #endif
> @@ -266,7 +265,7 @@ static void ppc_heathrow_init(MachineState *machine)
>       }
>   
>       /* Connect the heathrow PIC outputs to the 6xx bus */
> -    for (i = 0; i < smp_cpus; i++) {
> +    for (i = 0; i < machine->smp.cpus; i++) {
>           switch (PPC_INPUT(env)) {
>           case PPC_FLAGS_INPUT_6xx:
>               /* XXX: we register only 1 output pin for heathrow PIC */
> @@ -323,9 +322,9 @@ static void ppc_heathrow_init(MachineState *machine)
>       sysbus_mmio_map(s, 0, CFG_ADDR);
>       sysbus_mmio_map(s, 1, CFG_ADDR + 2);
>   
> -    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)smp_cpus);
> +    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)machine->smp.cpus);
>       fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)machine->smp.max_cpus);
> -    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
> +    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)machine->ram_size);
>       fw_cfg_add_i16(fw_cfg, FW_CFG_MACHINE_ID, ARCH_HEATHROW);
>       fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, kernel_base);
>       fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

