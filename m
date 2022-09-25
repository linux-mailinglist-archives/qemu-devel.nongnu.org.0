Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C215E91E9
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 11:44:10 +0200 (CEST)
Received: from localhost ([::1]:36196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocOBE-0005JW-Rx
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 05:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ocO8q-0003lN-Ro; Sun, 25 Sep 2022 05:41:41 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:40830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ocO8o-0007Zq-E5; Sun, 25 Sep 2022 05:41:40 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 454C675A164;
 Sun, 25 Sep 2022 11:41:31 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 03EE075A163; Sun, 25 Sep 2022 11:41:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0270575A0FE;
 Sun, 25 Sep 2022 11:41:30 +0200 (CEST)
Date: Sun, 25 Sep 2022 11:41:30 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH 03/10] mac_{old|new}world: Set default values for some
 local variables
In-Reply-To: <23dc642e-cf89-a7f2-6f54-d13d1ec95a19@eik.bme.hu>
Message-ID: <68bf1469-d0bd-98eb-b913-588ecad2bc4b@eik.bme.hu>
References: <cover.1663368422.git.balaton@eik.bme.hu>
 <f6b04802d0a62668ba99c0086d0dda8ad103a65d.1663368422.git.balaton@eik.bme.hu>
 <861b0aed-f6c3-93f3-187f-90ef721b18df@ilande.co.uk>
 <23dc642e-cf89-a7f2-6f54-d13d1ec95a19@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sun, 25 Sep 2022, BALATON Zoltan wrote:
> On Sun, 25 Sep 2022, Mark Cave-Ayland wrote:
>> On 17/09/2022 00:07, BALATON Zoltan wrote:
>>> Some lines can be dropped making the code flow simpler and easier to
>>> follow by setting default values at variable declaration for some
>>> variables in both mac_oldworld.c and mac_newworld.c.
>>> 
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>>>   hw/ppc/mac_newworld.c | 28 +++++-----------------------
>>>   hw/ppc/mac_oldworld.c | 27 +++++----------------------
>>>   2 files changed, 10 insertions(+), 45 deletions(-)
>>> 
>>> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
>>> index 27e4e8d136..6bc3bd19be 100644
>>> --- a/hw/ppc/mac_newworld.c
>>> +++ b/hw/ppc/mac_newworld.c
>>> @@ -111,11 +111,11 @@ static void ppc_core99_init(MachineState *machine)
>>>       CPUPPCState *env = NULL;
>>>       char *filename;
>>>       IrqLines *openpic_irqs;
>>> -    int i, j, k, ppc_boot_device, machine_arch, bios_size;
>>> +    int i, j, k, ppc_boot_device, machine_arch, bios_size = -1;
>>>       const char *bios_name = machine->firmware ?: PROM_FILENAME;
>>>       MemoryRegion *bios = g_new(MemoryRegion, 1);
>>> -    hwaddr kernel_base, initrd_base, cmdline_base = 0;
>>> -    long kernel_size, initrd_size;
>>> +    hwaddr kernel_base = 0, initrd_base = 0, cmdline_base = 0;
>>> +    long kernel_size = 0, initrd_size = 0;
>>>       UNINHostState *uninorth_pci;
>>>       PCIBus *pci_bus;
>>>       PCIDevice *macio;
>>> @@ -130,7 +130,7 @@ static void ppc_core99_init(MachineState *machine)
>>>       DeviceState *dev, *pic_dev;
>>>       DeviceState *uninorth_internal_dev = NULL, *uninorth_agp_dev = NULL;
>>>       hwaddr nvram_addr = 0xFFF04000;
>>> -    uint64_t tbfreq;
>>> +    uint64_t tbfreq = kvm_enabled() ? kvmppc_get_tbfreq() : TBFREQ;
>>>         /* init CPUs */
>>>       for (i = 0; i < machine->smp.cpus; i++) {
>>> @@ -165,8 +165,6 @@ static void ppc_core99_init(MachineState *machine)
>>>               bios_size = load_image_targphys(filename, PROM_BASE, 
>>> PROM_SIZE);
>>>           }
>>>           g_free(filename);
>>> -    } else {
>>> -        bios_size = -1;
>>>       }
>>>       if (bios_size < 0 || bios_size > PROM_SIZE) {
>>>           error_report("could not load PowerPC bios '%s'", bios_name);
>>> @@ -174,15 +172,12 @@ static void ppc_core99_init(MachineState *machine)
>>>       }
>>>         if (machine->kernel_filename) {
>>> -        int bswap_needed;
>>> +        int bswap_needed = 0;
>>>     #ifdef BSWAP_NEEDED
>>>           bswap_needed = 1;
>>> -#else
>>> -        bswap_needed = 0;
>>>   #endif
>>>           kernel_base = KERNEL_LOAD_ADDR;
>>> -
>>>           kernel_size = load_elf(machine->kernel_filename, NULL,
>>>                                  translate_kernel_address, NULL, NULL, 
>>> NULL,
>>>                                  NULL, NULL, 1, PPC_ELF_MACHINE, 0, 0);
>>> @@ -212,16 +207,10 @@ static void ppc_core99_init(MachineState *machine)
>>>               }
>>>               cmdline_base = TARGET_PAGE_ALIGN(initrd_base + initrd_size);
>>>           } else {
>>> -            initrd_base = 0;
>>> -            initrd_size = 0;
>> 
>> This bit seems a bit odd...
>>
>>>               cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + 
>>> KERNEL_GAP);
>>>           }
>>>           ppc_boot_device = 'm';
>>>       } else {
>>> -        kernel_base = 0;
>>> -        kernel_size = 0;
>>> -        initrd_base = 0;
>>> -        initrd_size = 0;
>> 
>> and also here. The only reason I can think that someone would explicitly 
>> set these variables back to 0 would be if there are cases in the load_*() 
>> functions where non-zero values could be returned for failure. It's worth 
>> having a look to confirm this and see if this also needs some additional 
>> tweaks to the logic flow here.
>
> They aren't set back to 0 but set here the first time. Nothing touches these 
> variables before this if-else do this patch just moves the zero init to the 
> variable declaration and only leaves the cases which set a value different 
> than zero here which I think is easier to follow.

Checked again in the original before this patch to make sure but these are 
in else branches of ifs setting the same variable to some value so I 
think it's either set to value or 0 and these lines settin 0 can'r run if 
the other part setting a value has run so these can't set it back, these 
are just the default 0 values so setting that at the beginning can drop 
these lines. What am I missing? How can these set a value back to 0?

Regards,
BALATON Zoltan

