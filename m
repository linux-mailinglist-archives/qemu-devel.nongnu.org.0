Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DA7372BEA
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 16:22:22 +0200 (CEST)
Received: from localhost ([::1]:39780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldvwL-0002b5-4D
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 10:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ldvuy-00029t-0z
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:20:56 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:35577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ldvuw-0004yV-6J
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:20:55 -0400
Received: from [192.168.100.1] ([82.142.20.222]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mw8gc-1lNVWm3Xkq-00s8No; Tue, 04 May 2021 16:20:48 +0200
Subject: Re: [PATCH] m68k: virt: correctly set the initial PC
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210504131816.73272-1-laurent@vivier.eu>
 <f85a2d4d-b31e-7752-c9dc-1bb0263fe739@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <87eb232c-18dc-eaef-d78b-7150c78fa0bc@vivier.eu>
Date: Tue, 4 May 2021 16:20:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f85a2d4d-b31e-7752-c9dc-1bb0263fe739@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: fr
X-Provags-ID: V03:K1:0cLMnp5uEutUeyEzh+ufQJcUPLSyMj/S+r36yhHjqUpHR34fbRt
 gktZPLaGQACSnYpwZEspYSlFh/S8XN+1bvhnApZda+bOZ+bE4v81l3hxg+kz3FYBDTifETw
 il1XNmwjHecFeqg9yuGf/FhyiMAkdf3F8Qo4IOBCIy3bMNk2Jbetl599uHJTGBEHXV5uKOW
 FjQ1N3rZ7sS6bI8i0rJ1A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9ipoL+ujaBg=:pJLGX9QF2f7BXpu4612uUL
 8LBko5jWMvzdtWChrTO4RW4dvRHXAB2I4SfrfzOdd7216jIfeCGoR1k2g1FXgXJF8eztEzu8H
 mk7lg9/FWFbJlJv4Yd3k+jMDiQKfHmvpYCXUJiwbi+49D5ZIoMuKTesL24jryMxzp0o2b/iKw
 eeGVY7ZnA5aRfIYEKMIqWnExxgYsz4laNqAM7UlRQGgyXWSXMWk3EqHD059RgDlTkODBDPbJ2
 nJPr21n18vPBv+RQxcd1N/7zIon5rf1r1bxKEJz4Z/ZByJNYs2VEOVm5cff37Yax7vZx0KCwm
 IHXHMCE4PdxMwFKZHN2L+Kb3ia+sAaIbJCApyAzkTtwjP2DxeZzK7+NBSNKMujjlTlmgSV4Xm
 OaOb0ZD2kUwJIZcFGOeizBA4M87cjy1vzTlusvOpDeJF6BgrDzbcPt/NcZwEWGV+JyAUbcw9S
 DZTRMxhKrWVyGVkpSd1kDdN5EnxIbzLUFAVpaZz1W7gvgMreeSYKAQumgi/m8zV8H3coGDG95
 /F18cWxSXs7+B5W3735y3w=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Le 04/05/2021 à 16:13, Philippe Mathieu-Daudé a écrit :
> On 5/4/21 3:18 PM, Laurent Vivier wrote:
>> Set initial PC to the entry of the loaded kernel.
>>
>> This fixes kernel reboot with "-kernel" parameter.
>>
>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>> ---
>>  hw/m68k/virt.c | 22 +++++++++++++++++-----
>>  1 file changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
>> index e9a5d4c69b97..4fb3a7ebf0f2 100644
>> --- a/hw/m68k/virt.c
>> +++ b/hw/m68k/virt.c
>> @@ -88,14 +88,21 @@
>>  #define VIRT_VIRTIO_MMIO_BASE 0xff010000     /* MMIO: 0xff010000 - 0xff01ffff */
>>  #define VIRT_VIRTIO_IRQ_BASE  PIC_IRQ(2, 1)  /* PIC: 2, 3, 4, 5, IRQ: ALL */
>>  
>> +typedef struct {
>> +    M68kCPU *cpu;
>> +    hwaddr initial_pc;
>> +    hwaddr initial_stack;
>> +} ResetInfo;
>> +
>>  static void main_cpu_reset(void *opaque)
>>  {
>> -    M68kCPU *cpu = opaque;
>> +    ResetInfo *reset_info = opaque;
>> +    M68kCPU *cpu = reset_info->cpu;
>>      CPUState *cs = CPU(cpu);
>>  
>>      cpu_reset(cs);
>> -    cpu->env.aregs[7] = ldl_phys(cs->as, 0);
>> -    cpu->env.pc = ldl_phys(cs->as, 4);
>> +    cpu->env.aregs[7] = reset_info->initial_stack;
>> +    cpu->env.pc = reset_info->initial_pc;
>>  }
>>  
>>  static void virt_init(MachineState *machine)
>> @@ -116,6 +123,7 @@ static void virt_init(MachineState *machine)
>>      SysBusDevice *sysbus;
>>      hwaddr io_base;
>>      int i;
>> +    ResetInfo *reset_info;
>>  
>>      if (ram_size > 3399672 * KiB) {
>>          /*
>> @@ -127,9 +135,13 @@ static void virt_init(MachineState *machine)
>>          exit(1);
>>      }
>>  
>> +    reset_info = g_malloc0(sizeof(ResetInfo));
>> +
>>      /* init CPUs */
>>      cpu = M68K_CPU(cpu_create(machine->cpu_type));
>> -    qemu_register_reset(main_cpu_reset, cpu);
>> +
>> +    reset_info->cpu = cpu;
>> +    qemu_register_reset(main_cpu_reset, reset_info);
>>  
>>      /* RAM */
>>      memory_region_add_subregion(get_system_memory(), 0, machine->ram);
>> @@ -209,7 +221,7 @@ static void virt_init(MachineState *machine)
>>              error_report("could not load kernel '%s'", kernel_filename);
>>              exit(1);
>>          }
>> -        stl_phys(cs->as, 4, elf_entry); /* reset initial PC */
>> +        reset_info->initial_pc = elf_entry;
> Missing the stack?
>
>            reset_info->initial_stack = ldl_phys(cs->as, 0);

No, as it's a g_malloc0(), initial_stack is set to 0, so aregs[7] (SP) will be reset to 0 on reboot.
We could also set it to  ram_size if we want something usable, but it's not needed for the kernel
entry point.

Thanks,

Laurent


