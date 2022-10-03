Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC665F3928
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 00:35:41 +0200 (CEST)
Received: from localhost ([::1]:58346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofU2G-0005fw-BF
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 18:35:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ofTcK-0005K5-6I; Mon, 03 Oct 2022 18:08:55 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:44276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ofTcC-0005HP-CB; Mon, 03 Oct 2022 18:08:51 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6E093746335;
 Tue,  4 Oct 2022 00:08:37 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2676174632C; Tue,  4 Oct 2022 00:08:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 24E7C746324;
 Tue,  4 Oct 2022 00:08:37 +0200 (CEST)
Date: Tue, 4 Oct 2022 00:08:37 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH 03/10] mac_{old|new}world: Set default values for some
 local variables
In-Reply-To: <aa31b36f-8e81-1fec-e4ae-66a26a4c9680@ilande.co.uk>
Message-ID: <ca129c-e8d1-6c2d-9ac2-f364314ba285@eik.bme.hu>
References: <cover.1663368422.git.balaton@eik.bme.hu>
 <f6b04802d0a62668ba99c0086d0dda8ad103a65d.1663368422.git.balaton@eik.bme.hu>
 <861b0aed-f6c3-93f3-187f-90ef721b18df@ilande.co.uk>
 <23dc642e-cf89-a7f2-6f54-d13d1ec95a19@eik.bme.hu>
 <aa31b36f-8e81-1fec-e4ae-66a26a4c9680@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-702341427-1664834917=:77348"
X-Spam-Probability: 9%
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-702341427-1664834917=:77348
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 29 Sep 2022, Mark Cave-Ayland wrote:
> On 25/09/2022 10:16, BALATON Zoltan wrote:
>> On Sun, 25 Sep 2022, Mark Cave-Ayland wrote:
>>> On 17/09/2022 00:07, BALATON Zoltan wrote:
>>>> Some lines can be dropped making the code flow simpler and easier to
>>>> follow by setting default values at variable declaration for some
>>>> variables in both mac_oldworld.c and mac_newworld.c.
>>>> 
>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>> ---
>>>>   hw/ppc/mac_newworld.c | 28 +++++-----------------------
>>>>   hw/ppc/mac_oldworld.c | 27 +++++----------------------
>>>>   2 files changed, 10 insertions(+), 45 deletions(-)
>>>> 
>>>> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
>>>> index 27e4e8d136..6bc3bd19be 100644
>>>> --- a/hw/ppc/mac_newworld.c
>>>> +++ b/hw/ppc/mac_newworld.c
>>>> @@ -111,11 +111,11 @@ static void ppc_core99_init(MachineState *machine)
>>>>       CPUPPCState *env = NULL;
>>>>       char *filename;
>>>>       IrqLines *openpic_irqs;
>>>> -    int i, j, k, ppc_boot_device, machine_arch, bios_size;
>>>> +    int i, j, k, ppc_boot_device, machine_arch, bios_size = -1;
>>>>       const char *bios_name = machine->firmware ?: PROM_FILENAME;
>>>>       MemoryRegion *bios = g_new(MemoryRegion, 1);
>>>> -    hwaddr kernel_base, initrd_base, cmdline_base = 0;
>>>> -    long kernel_size, initrd_size;
>>>> +    hwaddr kernel_base = 0, initrd_base = 0, cmdline_base = 0;
>>>> +    long kernel_size = 0, initrd_size = 0;
>>>>       UNINHostState *uninorth_pci;
>>>>       PCIBus *pci_bus;
>>>>       PCIDevice *macio;
>>>> @@ -130,7 +130,7 @@ static void ppc_core99_init(MachineState *machine)
>>>>       DeviceState *dev, *pic_dev;
>>>>       DeviceState *uninorth_internal_dev = NULL, *uninorth_agp_dev = 
>>>> NULL;
>>>>       hwaddr nvram_addr = 0xFFF04000;
>>>> -    uint64_t tbfreq;
>>>> +    uint64_t tbfreq = kvm_enabled() ? kvmppc_get_tbfreq() : TBFREQ;
>>>>         /* init CPUs */
>>>>       for (i = 0; i < machine->smp.cpus; i++) {
>>>> @@ -165,8 +165,6 @@ static void ppc_core99_init(MachineState *machine)
>>>>               bios_size = load_image_targphys(filename, PROM_BASE, 
>>>> PROM_SIZE);
>>>>           }
>>>>           g_free(filename);
>>>> -    } else {
>>>> -        bios_size = -1;
>>>>       }
>>>>       if (bios_size < 0 || bios_size > PROM_SIZE) {
>>>>           error_report("could not load PowerPC bios '%s'", bios_name);
>>>> @@ -174,15 +172,12 @@ static void ppc_core99_init(MachineState *machine)
>>>>       }
>>>>         if (machine->kernel_filename) {
>>>> -        int bswap_needed;
>>>> +        int bswap_needed = 0;
>>>>     #ifdef BSWAP_NEEDED
>>>>           bswap_needed = 1;
>>>> -#else
>>>> -        bswap_needed = 0;
>>>>   #endif
>>>>           kernel_base = KERNEL_LOAD_ADDR;
>>>> -
>>>>           kernel_size = load_elf(machine->kernel_filename, NULL,
>>>>                                  translate_kernel_address, NULL, NULL, 
>>>> NULL,
>>>>                                  NULL, NULL, 1, PPC_ELF_MACHINE, 0, 0);
>>>> @@ -212,16 +207,10 @@ static void ppc_core99_init(MachineState *machine)
>>>>               }
>>>>               cmdline_base = TARGET_PAGE_ALIGN(initrd_base + 
>>>> initrd_size);
>>>>           } else {
>>>> -            initrd_base = 0;
>>>> -            initrd_size = 0;
>>> 
>>> This bit seems a bit odd...
>>> 
>>>>               cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size 
>>>> + KERNEL_GAP);
>>>>           }
>>>>           ppc_boot_device = 'm';
>>>>       } else {
>>>> -        kernel_base = 0;
>>>> -        kernel_size = 0;
>>>> -        initrd_base = 0;
>>>> -        initrd_size = 0;
>>> 
>>> and also here. The only reason I can think that someone would explicitly 
>>> set these variables back to 0 would be if there are cases in the load_*() 
>>> functions where non-zero values could be returned for failure. It's worth 
>>> having a look to confirm this and see if this also needs some additional 
>>> tweaks to the logic flow here.
>> 
>> They aren't set back to 0 but set here the first time. Nothing touches 
>> these variables before this if-else do this patch just moves the zero init 
>> to the variable declaration and only leaves the cases which set a value 
>> different than zero here which I think is easier to follow.
>
> Okay - in that case if you can test with a non-kernel ELF to verify this, and 
> add a note confirming that everything still works for the error paths then 
> that will be fine.

I've originally added non-elf loading to be able to use -bios macrom.bin 
which I've now verified that it still works so this should be OK. I've 
also split this patch up to more parts for easier review in the later 
versions of the series but what it does is basically instead of

int x;
if (cond) {
   x = a;
} else {
   x = 0;
}

we do

int x = 0;
if (cond) {
   x = a;
}

which I thought would be simple to review.

Regards,
BALATON Zoltan
--3866299591-702341427-1664834917=:77348--

