Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7CA5E91D2
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 11:20:50 +0200 (CEST)
Received: from localhost ([::1]:54520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocNof-0005lG-Rz
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 05:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ocNkn-0002o6-MK; Sun, 25 Sep 2022 05:16:50 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:45686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ocNki-0004DC-HM; Sun, 25 Sep 2022 05:16:46 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 480A875A166;
 Sun, 25 Sep 2022 11:16:41 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C261075A164; Sun, 25 Sep 2022 11:16:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id BFE3E75A163;
 Sun, 25 Sep 2022 11:16:40 +0200 (CEST)
Date: Sun, 25 Sep 2022 11:16:40 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH 03/10] mac_{old|new}world: Set default values for some
 local variables
In-Reply-To: <861b0aed-f6c3-93f3-187f-90ef721b18df@ilande.co.uk>
Message-ID: <23dc642e-cf89-a7f2-6f54-d13d1ec95a19@eik.bme.hu>
References: <cover.1663368422.git.balaton@eik.bme.hu>
 <f6b04802d0a62668ba99c0086d0dda8ad103a65d.1663368422.git.balaton@eik.bme.hu>
 <861b0aed-f6c3-93f3-187f-90ef721b18df@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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

On Sun, 25 Sep 2022, Mark Cave-Ayland wrote:
> On 17/09/2022 00:07, BALATON Zoltan wrote:
>> Some lines can be dropped making the code flow simpler and easier to
>> follow by setting default values at variable declaration for some
>> variables in both mac_oldworld.c and mac_newworld.c.
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/ppc/mac_newworld.c | 28 +++++-----------------------
>>   hw/ppc/mac_oldworld.c | 27 +++++----------------------
>>   2 files changed, 10 insertions(+), 45 deletions(-)
>> 
>> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
>> index 27e4e8d136..6bc3bd19be 100644
>> --- a/hw/ppc/mac_newworld.c
>> +++ b/hw/ppc/mac_newworld.c
>> @@ -111,11 +111,11 @@ static void ppc_core99_init(MachineState *machine)
>>       CPUPPCState *env = NULL;
>>       char *filename;
>>       IrqLines *openpic_irqs;
>> -    int i, j, k, ppc_boot_device, machine_arch, bios_size;
>> +    int i, j, k, ppc_boot_device, machine_arch, bios_size = -1;
>>       const char *bios_name = machine->firmware ?: PROM_FILENAME;
>>       MemoryRegion *bios = g_new(MemoryRegion, 1);
>> -    hwaddr kernel_base, initrd_base, cmdline_base = 0;
>> -    long kernel_size, initrd_size;
>> +    hwaddr kernel_base = 0, initrd_base = 0, cmdline_base = 0;
>> +    long kernel_size = 0, initrd_size = 0;
>>       UNINHostState *uninorth_pci;
>>       PCIBus *pci_bus;
>>       PCIDevice *macio;
>> @@ -130,7 +130,7 @@ static void ppc_core99_init(MachineState *machine)
>>       DeviceState *dev, *pic_dev;
>>       DeviceState *uninorth_internal_dev = NULL, *uninorth_agp_dev = NULL;
>>       hwaddr nvram_addr = 0xFFF04000;
>> -    uint64_t tbfreq;
>> +    uint64_t tbfreq = kvm_enabled() ? kvmppc_get_tbfreq() : TBFREQ;
>>         /* init CPUs */
>>       for (i = 0; i < machine->smp.cpus; i++) {
>> @@ -165,8 +165,6 @@ static void ppc_core99_init(MachineState *machine)
>>               bios_size = load_image_targphys(filename, PROM_BASE, 
>> PROM_SIZE);
>>           }
>>           g_free(filename);
>> -    } else {
>> -        bios_size = -1;
>>       }
>>       if (bios_size < 0 || bios_size > PROM_SIZE) {
>>           error_report("could not load PowerPC bios '%s'", bios_name);
>> @@ -174,15 +172,12 @@ static void ppc_core99_init(MachineState *machine)
>>       }
>>         if (machine->kernel_filename) {
>> -        int bswap_needed;
>> +        int bswap_needed = 0;
>>     #ifdef BSWAP_NEEDED
>>           bswap_needed = 1;
>> -#else
>> -        bswap_needed = 0;
>>   #endif
>>           kernel_base = KERNEL_LOAD_ADDR;
>> -
>>           kernel_size = load_elf(machine->kernel_filename, NULL,
>>                                  translate_kernel_address, NULL, NULL, 
>> NULL,
>>                                  NULL, NULL, 1, PPC_ELF_MACHINE, 0, 0);
>> @@ -212,16 +207,10 @@ static void ppc_core99_init(MachineState *machine)
>>               }
>>               cmdline_base = TARGET_PAGE_ALIGN(initrd_base + initrd_size);
>>           } else {
>> -            initrd_base = 0;
>> -            initrd_size = 0;
>
> This bit seems a bit odd...
>
>>               cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + 
>> KERNEL_GAP);
>>           }
>>           ppc_boot_device = 'm';
>>       } else {
>> -        kernel_base = 0;
>> -        kernel_size = 0;
>> -        initrd_base = 0;
>> -        initrd_size = 0;
>
> and also here. The only reason I can think that someone would explicitly set 
> these variables back to 0 would be if there are cases in the load_*() 
> functions where non-zero values could be returned for failure. It's worth 
> having a look to confirm this and see if this also needs some additional 
> tweaks to the logic flow here.

They aren't set back to 0 but set here the first time. Nothing touches 
these variables before this if-else do this patch just moves the zero init 
to the variable declaration and only leaves the cases which set a value 
different than zero here which I think is easier to follow.

Regards,
BALATON Zoltan

>>           ppc_boot_device = '\0';
>>           /* We consider that NewWorld PowerMac never have any floppy drive
>>            * For now, OHW cannot boot from the network.
>> @@ -343,13 +332,6 @@ static void ppc_core99_init(MachineState *machine)
>>       has_adb = (core99_machine->via_config == CORE99_VIA_CONFIG_CUDA ||
>>                  core99_machine->via_config == CORE99_VIA_CONFIG_PMU_ADB);
>>   -    /* Timebase Frequency */
>> -    if (kvm_enabled()) {
>> -        tbfreq = kvmppc_get_tbfreq();
>> -    } else {
>> -        tbfreq = TBFREQ;
>> -    }
>> -
>>       /* init basic PC hardware */
>>       pci_bus = PCI_HOST_BRIDGE(uninorth_pci)->bus;
>>   diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
>> index 86512d31ad..cb67e44081 100644
>> --- a/hw/ppc/mac_oldworld.c
>> +++ b/hw/ppc/mac_oldworld.c
>> @@ -84,11 +84,11 @@ static void ppc_heathrow_init(MachineState *machine)
>>       PowerPCCPU *cpu = NULL;
>>       CPUPPCState *env = NULL;
>>       char *filename;
>> -    int i, bios_size;
>> +    int i, bios_size = -1;
>>       MemoryRegion *bios = g_new(MemoryRegion, 1);
>>       uint64_t bios_addr;
>> -    uint32_t kernel_base, initrd_base, cmdline_base = 0;
>> -    int32_t kernel_size, initrd_size;
>> +    uint32_t kernel_base = 0, initrd_base = 0, cmdline_base = 0;
>> +    int32_t kernel_size = 0, initrd_size = 0;
>>       PCIBus *pci_bus;
>>       PCIDevice *macio;
>>       MACIOIDEState *macio_ide;
>> @@ -99,7 +99,7 @@ static void ppc_heathrow_init(MachineState *machine)
>>       uint16_t ppc_boot_device;
>>       DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
>>       void *fw_cfg;
>> -    uint64_t tbfreq;
>> +    uint64_t tbfreq = kvm_enabled() ? kvmppc_get_tbfreq() : TBFREQ;
>>         /* init CPUs */
>>       for (i = 0; i < machine->smp.cpus; i++) {
>> @@ -139,8 +139,6 @@ static void ppc_heathrow_init(MachineState *machine)
>>               bios_addr = PROM_BASE;
>>           }
>>           g_free(filename);
>> -    } else {
>> -        bios_size = -1;
>>       }
>>       if (bios_size < 0 || bios_addr - PROM_BASE + bios_size > PROM_SIZE) {
>>           error_report("could not load PowerPC bios '%s'", bios_name);
>> @@ -148,12 +146,10 @@ static void ppc_heathrow_init(MachineState *machine)
>>       }
>>         if (machine->kernel_filename) {
>> -        int bswap_needed;
>> +        int bswap_needed = 0;
>>     #ifdef BSWAP_NEEDED
>>           bswap_needed = 1;
>> -#else
>> -        bswap_needed = 0;
>>   #endif
>>           kernel_base = KERNEL_LOAD_ADDR;
>>           kernel_size = load_elf(machine->kernel_filename, NULL,
>> @@ -186,16 +182,10 @@ static void ppc_heathrow_init(MachineState *machine)
>>               }
>>               cmdline_base = TARGET_PAGE_ALIGN(initrd_base + initrd_size);
>>           } else {
>> -            initrd_base = 0;
>> -            initrd_size = 0;
>>               cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + 
>> KERNEL_GAP);
>>           }
>>           ppc_boot_device = 'm';
>>       } else {
>> -        kernel_base = 0;
>> -        kernel_size = 0;
>> -        initrd_base = 0;
>> -        initrd_size = 0;
>>           ppc_boot_device = '\0';
>>           for (i = 0; machine->boot_config.order[i] != '\0'; i++) {
>>               /*
>> @@ -223,13 +213,6 @@ static void ppc_heathrow_init(MachineState *machine)
>>           }
>>       }
>>   -    /* Timebase Frequency */
>> -    if (kvm_enabled()) {
>> -        tbfreq = kvmppc_get_tbfreq();
>> -    } else {
>> -        tbfreq = TBFREQ;
>> -    }
>> -
>>       /* Grackle PCI host bridge */
>>       grackle_dev = qdev_new(TYPE_GRACKLE_PCI_HOST_BRIDGE);
>>       qdev_prop_set_uint32(grackle_dev, "ofw-addr", 0x80000000);
>
> ... and obviously the same comments for mac_oldworld.c too.
>
>
> ATB,
>
> Mark.
>
>

