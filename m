Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C1F5EEE9F
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 09:14:57 +0200 (CEST)
Received: from localhost ([::1]:53760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odnl0-0004G8-T6
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 03:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1odnXH-00045C-4u; Thu, 29 Sep 2022 03:00:50 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1odnXF-00022K-A8; Thu, 29 Sep 2022 03:00:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=26nh+qhfhIsJdASvourMgCh7pHXCwnEm8H4WRRkPDnc=; b=ZfACicPPDl0qxzyanR3G/dJ/8k
 5dkaIbHawQkDN8tq9wcp/7HcwSBTcM17fye6ev4mxYAZWAl9nPGNsiLtl6B4Gj9K4xs1sKxJ8LLOD
 XDx+Z15Upl/pGANRqVXxO1+LVdrv3S03TmKXLQHTlIYnImMmerZXPzJIZePTtm48yac8fUuLnTdFI
 8O0woOwP6Ylx1OmasJyRnCN18bzbNuib7el5vDwiE9JhXZuzOPTFWPOQKwLwaA2YDdlP+chbdKLNy
 StjqBLfwM2Yli1l8LY0Clsrr4D4WKxyiJ3RUdacwecEXAejL7VfaQcSq6hoGMsPkj59R7l5mL6CqD
 acS2PMuPkVG9zRO/6SV905m5+L+IET0IIhzKugTmraRDqVBIDqCpb3aVF54zK+p9QmPk9tFASe3In
 aoMnKuxy8F/zRrKSkY0GLqG5TpMpMcblEc6oUYBfKUVdXv89d7pCLWpOINnFYPC2yC7tP0oPAzJYg
 J28AF7MDnEHvXA8YPAmwGxcRQ61f16nPkafJSZtge9swEgBt4VTJNHDiiI5mZUudbQ5Ac3igWWZwn
 skaXs9lkJmab3V6y2sF6tPBwkPfNXtRxyC9PCeMcF8htbuN940ZbHfQAIwQ92dNKFra5M6Qj28F37
 HtPiUEqVmlw9ljOmFptSQcVNE+6Kj2KW7kHAZrfow=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1odnVT-000BXc-4B; Thu, 29 Sep 2022 07:58:55 +0100
Message-ID: <aa31b36f-8e81-1fec-e4ae-66a26a4c9680@ilande.co.uk>
Date: Thu, 29 Sep 2022 08:00:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <cover.1663368422.git.balaton@eik.bme.hu>
 <f6b04802d0a62668ba99c0086d0dda8ad103a65d.1663368422.git.balaton@eik.bme.hu>
 <861b0aed-f6c3-93f3-187f-90ef721b18df@ilande.co.uk>
 <23dc642e-cf89-a7f2-6f54-d13d1ec95a19@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <23dc642e-cf89-a7f2-6f54-d13d1ec95a19@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 03/10] mac_{old|new}world: Set default values for some
 local variables
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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

On 25/09/2022 10:16, BALATON Zoltan wrote:

> On Sun, 25 Sep 2022, Mark Cave-Ayland wrote:
>> On 17/09/2022 00:07, BALATON Zoltan wrote:
>>> Some lines can be dropped making the code flow simpler and easier to
>>> follow by setting default values at variable declaration for some
>>> variables in both mac_oldworld.c and mac_newworld.c.
>>>
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>>>   hw/ppc/mac_newworld.c | 28 +++++-----------------------
>>>   hw/ppc/mac_oldworld.c | 27 +++++----------------------
>>>   2 files changed, 10 insertions(+), 45 deletions(-)
>>>
>>> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
>>> index 27e4e8d136..6bc3bd19be 100644
>>> --- a/hw/ppc/mac_newworld.c
>>> +++ b/hw/ppc/mac_newworld.c
>>> @@ -111,11 +111,11 @@ static void ppc_core99_init(MachineState *machine)
>>>       CPUPPCState *env = NULL;
>>>       char *filename;
>>>       IrqLines *openpic_irqs;
>>> -    int i, j, k, ppc_boot_device, machine_arch, bios_size;
>>> +    int i, j, k, ppc_boot_device, machine_arch, bios_size = -1;
>>>       const char *bios_name = machine->firmware ?: PROM_FILENAME;
>>>       MemoryRegion *bios = g_new(MemoryRegion, 1);
>>> -    hwaddr kernel_base, initrd_base, cmdline_base = 0;
>>> -    long kernel_size, initrd_size;
>>> +    hwaddr kernel_base = 0, initrd_base = 0, cmdline_base = 0;
>>> +    long kernel_size = 0, initrd_size = 0;
>>>       UNINHostState *uninorth_pci;
>>>       PCIBus *pci_bus;
>>>       PCIDevice *macio;
>>> @@ -130,7 +130,7 @@ static void ppc_core99_init(MachineState *machine)
>>>       DeviceState *dev, *pic_dev;
>>>       DeviceState *uninorth_internal_dev = NULL, *uninorth_agp_dev = NULL;
>>>       hwaddr nvram_addr = 0xFFF04000;
>>> -    uint64_t tbfreq;
>>> +    uint64_t tbfreq = kvm_enabled() ? kvmppc_get_tbfreq() : TBFREQ;
>>>         /* init CPUs */
>>>       for (i = 0; i < machine->smp.cpus; i++) {
>>> @@ -165,8 +165,6 @@ static void ppc_core99_init(MachineState *machine)
>>>               bios_size = load_image_targphys(filename, PROM_BASE, PROM_SIZE);
>>>           }
>>>           g_free(filename);
>>> -    } else {
>>> -        bios_size = -1;
>>>       }
>>>       if (bios_size < 0 || bios_size > PROM_SIZE) {
>>>           error_report("could not load PowerPC bios '%s'", bios_name);
>>> @@ -174,15 +172,12 @@ static void ppc_core99_init(MachineState *machine)
>>>       }
>>>         if (machine->kernel_filename) {
>>> -        int bswap_needed;
>>> +        int bswap_needed = 0;
>>>     #ifdef BSWAP_NEEDED
>>>           bswap_needed = 1;
>>> -#else
>>> -        bswap_needed = 0;
>>>   #endif
>>>           kernel_base = KERNEL_LOAD_ADDR;
>>> -
>>>           kernel_size = load_elf(machine->kernel_filename, NULL,
>>>                                  translate_kernel_address, NULL, NULL, NULL,
>>>                                  NULL, NULL, 1, PPC_ELF_MACHINE, 0, 0);
>>> @@ -212,16 +207,10 @@ static void ppc_core99_init(MachineState *machine)
>>>               }
>>>               cmdline_base = TARGET_PAGE_ALIGN(initrd_base + initrd_size);
>>>           } else {
>>> -            initrd_base = 0;
>>> -            initrd_size = 0;
>>
>> This bit seems a bit odd...
>>
>>>               cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + 
>>> KERNEL_GAP);
>>>           }
>>>           ppc_boot_device = 'm';
>>>       } else {
>>> -        kernel_base = 0;
>>> -        kernel_size = 0;
>>> -        initrd_base = 0;
>>> -        initrd_size = 0;
>>
>> and also here. The only reason I can think that someone would explicitly set these 
>> variables back to 0 would be if there are cases in the load_*() functions where 
>> non-zero values could be returned for failure. It's worth having a look to confirm 
>> this and see if this also needs some additional tweaks to the logic flow here.
> 
> They aren't set back to 0 but set here the first time. Nothing touches these 
> variables before this if-else do this patch just moves the zero init to the variable 
> declaration and only leaves the cases which set a value different than zero here 
> which I think is easier to follow.

Okay - in that case if you can test with a non-kernel ELF to verify this, and add a 
note confirming that everything still works for the error paths then that will be fine.


ATB,

Mark.

