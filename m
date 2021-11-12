Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA5044DFC3
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 02:28:51 +0100 (CET)
Received: from localhost ([::1]:51698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlLN3-00063q-PS
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 20:28:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mlLLS-0005NE-E9
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 20:27:10 -0500
Received: from mail.loongson.cn ([114.242.206.163]:55996 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mlLLO-0000Sj-BJ
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 20:27:10 -0500
Received: from localhost.localdomain (unknown [10.20.42.11])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxadHhwo1humICAA--.5622S3;
 Fri, 12 Nov 2021 09:26:57 +0800 (CST)
Subject: Re: [RFC PATCH v2 00/30] Add Loongarch softmmu support.
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
 <838eb9b5-c6b7-346f-c031-60435533f551@ilande.co.uk>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <a71c590a-1322-38b9-a724-dd54068defe1@loongson.cn>
Date: Fri, 12 Nov 2021 09:26:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <838eb9b5-c6b7-346f-c031-60435533f551@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9CxadHhwo1humICAA--.5622S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Gry7Jr1UKFyUCF17Ww1kGrg_yoWfGw1kp3
 y7uF1rKr4rJrZrJr92qas8Wr98JFn7GrW2v3WSqry8CrWavry5ZF1vyasFgFy7J3ykGry0
 qFn5Cw1UWa1UJaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9Gb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjc
 xK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG
 64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r1j6r4UMcIj6xIIjxv20xvE14
 v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY
 64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
 8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
 xVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
 AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8I
 cIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
 0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5i_-PUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.999,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi, Mark,

On 11/11/2021 10:58 PM, Mark Cave-Ayland wrote:
> On 11/11/2021 01:34, Xiaojuan Yang wrote:
> 
>> Sorry only part of the v2 patch succeed. I consulted GNU sysadmin,
>> He said our mail server was getting temporarily banned by fail2ban. Now the ban
>> was removed. I resend the v2 series patch. For uefi is preparing to submit to
>> the community only uefi binary can be provided now. All of the series patch
>> add RFC title.
>>
>> This series patch add softmmu support for LoongArch.
>> Base on the linux-user emulation support V9 patch.
>>    * https://patchew.org/QEMU/1630586467-22463-1-git-send-email-gaosong@loongson.cn/diff/1636340895-5255-1-git-send-email-gaosong@loongson.cn/
>>
>> The latest kernel:
>>    * https://github.com/loongson/linux/tree/loongarch-next
>> The manual:
>>    * https://github.com/loongson/LoongArch-Documentation/releases/tag/2021.10.11
>>
>> Changes for v2:
>> 1.Combine patch 2 and 3 into one.
>> 2.Adjust the order of the patch.
>> 3.Put all the binaries on the github.
>> 4.Modify some emulate errors when use the kernel from the github.
>> 5.Adjust some format problem and the Naming problem
>> 6.Others mainly follow Richard's code review comments.
>>
>> Please help review!
>>
>> Thanks
>>
>> Xiaojuan Yang (30):
>>    target/loongarch: Update README
>>    target/loongarch: Add CSR registers definition
>>    target/loongarch: Add basic vmstate description of CPU.
>>    target/loongarch: Define exceptions for LoongArch.
>>    target/loongarch: Implement qmp_query_cpu_definitions()
>>    target/loongarch: Add stabletimer support
>>    target/loongarch: Add MMU support for LoongArch CPU.
>>    target/loongarch: Add LoongArch CSR/IOCSR instruction
>>    target/loongarch: Add TLB instruction support
>>    target/loongarch: Add other core instructions support
>>    target/loongarch: Add LoongArch interrupt and exception handle
>>    target/loongarch: Add timer related instructions support.
>>    target/loongarch: Add gdb support.
>>    target/loongarch: Implement privilege instructions disassembly
>>    hw/pci-host: Add ls7a1000 PCIe Host bridge support for Loongson
>>      Platform
>>    hw/loongarch: Add a virt LoongArch 3A5000 board support
>>    hw/loongarch: Add LoongArch cpu interrupt support(CPUINTC)
>>    hw/loongarch: Add LoongArch ipi interrupt support(IPI)
>>    hw/intc: Add LoongArch ls7a interrupt controller support(PCH-PIC)
>>    hw/intc: Add LoongArch ls7a msi interrupt controller support(PCH-MSI)
>>    hw/intc: Add LoongArch extioi interrupt controller(EIOINTC)
>>    hw/loongarch: Add irq hierarchy for the system
>>    hw/loongarch: Add some devices support for 3A5000.
>>    hw/loongarch: Add LoongArch ls7a rtc device support
>>    hw/loongarch: Add default bios startup support.
>>    hw/loongarch: Add -kernel and -initrd options support
>>    hw/loongarch: Add LoongArch smbios support
>>    hw/loongarch: Add LoongArch acpi support
>>    hw/loongarch: Add machine->possible_cpus
>>    hw/loongarch: Add Numa support.
>>
>>   .../devices/loongarch64-softmmu/default.mak   |   3 +
>>   configs/targets/loongarch64-softmmu.mak       |   4 +
>>   gdb-xml/loongarch-base64.xml                  |  43 +
>>   gdb-xml/loongarch-fpu64.xml                   |  57 ++
>>   hw/Kconfig                                    |   1 +
>>   hw/acpi/Kconfig                               |   4 +
>>   hw/acpi/ls7a.c                                | 349 +++++++
>>   hw/acpi/meson.build                           |   1 +
>>   hw/intc/Kconfig                               |  12 +
>>   hw/intc/loongarch_extioi.c                    | 588 ++++++++++++
>>   hw/intc/loongarch_pch_msi.c                   |  73 ++
>>   hw/intc/loongarch_pch_pic.c                   | 283 ++++++
>>   hw/intc/meson.build                           |   3 +
>>   hw/loongarch/Kconfig                          |  22 +
>>   hw/loongarch/acpi-build.c                     | 653 +++++++++++++
>>   hw/loongarch/fw_cfg.c                         |  33 +
>>   hw/loongarch/fw_cfg.h                         |  15 +
>>   hw/loongarch/ipi.c                            | 146 +++
>>   hw/loongarch/loongarch_int.c                  |  59 ++
>>   hw/loongarch/ls3a5000_virt.c                  | 647 +++++++++++++
>>   hw/loongarch/meson.build                      |   7 +
>>   hw/meson.build                                |   1 +
>>   hw/pci-host/Kconfig                           |   4 +
>>   hw/pci-host/ls7a.c                            | 223 +++++
>>   hw/pci-host/meson.build                       |   1 +
>>   hw/rtc/Kconfig                                |   3 +
>>   hw/rtc/ls7a_rtc.c                             | 323 +++++++
>>   hw/rtc/meson.build                            |   1 +
>>   include/exec/poison.h                         |   2 +
>>   include/hw/acpi/ls7a.h                        |  53 ++
>>   include/hw/intc/loongarch_extioi.h            | 101 ++
>>   include/hw/intc/loongarch_pch_msi.h           |  16 +
>>   include/hw/intc/loongarch_pch_pic.h           |  49 +
>>   include/hw/loongarch/gipi.h                   |  37 +
>>   include/hw/loongarch/loongarch.h              |  78 ++
>>   include/hw/pci-host/ls7a.h                    |  66 ++
>>   include/sysemu/arch_init.h                    |   1 +
>>   qapi/machine-target.json                      |   6 +-
>>   qapi/machine.json                             |   2 +-
>>   softmmu/qdev-monitor.c                        |   3 +-
>>   target/Kconfig                                |   1 +
>>   target/loongarch/Kconfig                      |   2 +
>>   target/loongarch/README                       |  20 +
>>   target/loongarch/cpu-csr.h                    | 334 +++++++
>>   target/loongarch/cpu-param.h                  |   3 +
>>   target/loongarch/cpu.c                        | 390 ++++++++
>>   target/loongarch/cpu.h                        | 220 ++++-
>>   target/loongarch/csr_helper.c                 | 331 +++++++
>>   target/loongarch/disas.c                      |  86 ++
>>   target/loongarch/gdbstub.c                    |  97 ++
>>   target/loongarch/helper.h                     |  24 +
>>   target/loongarch/insn_trans/trans_core.c.inc  | 570 +++++++++++
>>   target/loongarch/insn_trans/trans_extra.c.inc |  32 +
>>   target/loongarch/insns.decode                 |  51 +
>>   target/loongarch/internals.h                  |  26 +
>>   target/loongarch/machine.c                    | 210 ++++
>>   target/loongarch/meson.build                  |  10 +
>>   target/loongarch/op_helper.c                  |  58 ++
>>   target/loongarch/stabletimer.c                |  70 ++
>>   target/loongarch/tlb_helper.c                 | 901 ++++++++++++++++++
>>   target/loongarch/translate.c                  |   7 +
>>   61 files changed, 7410 insertions(+), 6 deletions(-)
>>   create mode 100644 configs/devices/loongarch64-softmmu/default.mak
>>   create mode 100644 configs/targets/loongarch64-softmmu.mak
>>   create mode 100644 gdb-xml/loongarch-base64.xml
>>   create mode 100644 gdb-xml/loongarch-fpu64.xml
>>   create mode 100644 hw/acpi/ls7a.c
>>   create mode 100644 hw/intc/loongarch_extioi.c
>>   create mode 100644 hw/intc/loongarch_pch_msi.c
>>   create mode 100644 hw/intc/loongarch_pch_pic.c
>>   create mode 100644 hw/loongarch/Kconfig
>>   create mode 100644 hw/loongarch/acpi-build.c
>>   create mode 100644 hw/loongarch/fw_cfg.c
>>   create mode 100644 hw/loongarch/fw_cfg.h
>>   create mode 100644 hw/loongarch/ipi.c
>>   create mode 100644 hw/loongarch/loongarch_int.c
>>   create mode 100644 hw/loongarch/ls3a5000_virt.c
>>   create mode 100644 hw/loongarch/meson.build
>>   create mode 100644 hw/pci-host/ls7a.c
>>   create mode 100644 hw/rtc/ls7a_rtc.c
>>   create mode 100644 include/hw/acpi/ls7a.h
>>   create mode 100644 include/hw/intc/loongarch_extioi.h
>>   create mode 100644 include/hw/intc/loongarch_pch_msi.h
>>   create mode 100644 include/hw/intc/loongarch_pch_pic.h
>>   create mode 100644 include/hw/loongarch/gipi.h
>>   create mode 100644 include/hw/loongarch/loongarch.h
>>   create mode 100644 include/hw/pci-host/ls7a.h
>>   create mode 100644 target/loongarch/Kconfig
>>   create mode 100644 target/loongarch/cpu-csr.h
>>   create mode 100644 target/loongarch/csr_helper.c
>>   create mode 100644 target/loongarch/gdbstub.c
>>   create mode 100644 target/loongarch/insn_trans/trans_core.c.inc
>>   create mode 100644 target/loongarch/machine.c
>>   create mode 100644 target/loongarch/stabletimer.c
>>   create mode 100644 target/loongarch/tlb_helper.c
> 
> Hi Xiaojuan,
> 
> I've started to have a look at some of the devices, and replied with a few comments. It feels as if this code has been maintained in a fork for some time, using a lot of design patterns that are no longer recommended for QEMU development.
> 
> In particular:
> 
> - Use qdev GPIOs for IRQs and avoid allocating them with qemu_allocate_irq()
> 
> - Use qdev link properties for passing object references rather than manipulating pointers directly
> 
> - Avoid heap allocations (particularly for MemoryRegions) and instead store them within the relevant device
> 
> - Specify a specific endianness for devices using DEVICE_BIG_ENDIAN and DEVICE_LITTLE_ENDIAN instead of DEVICE_NATIVE_ENDIAN
> 
> - Having separate functions for each MMIO access size isn't generally required with the memory API
> 
> I've stopped reviewing for now as I think these issues will be present throughout the patch series, however I will do my best to answer any questions that you have and will take another look when you post a v3.
> 
> 
> ATB,
> 
> Mark.
 
 Thank you for your review, I will read your comments carefully and then modify. Yes, All the work first started at the qemu3.1 then port to the master.
 I'm sorry for the unrecommended design patterns. I will try my best to modify. I believe the V3 version will be much better and look foward to your review again.

Thanks,
Xiaojuan 


