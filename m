Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39027490011
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 02:52:16 +0100 (CET)
Received: from localhost ([::1]:42930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9HBu-0002SB-UY
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 20:52:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1n9H9l-0001dD-E3
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 20:50:01 -0500
Received: from mail.loongson.cn ([114.242.206.163]:43988 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1n9H9h-0003C6-MA
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 20:50:01 -0500
Received: from localhost.localdomain (unknown [10.20.42.11])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxeuA6y+Rho6EAAA--.994S3;
 Mon, 17 Jan 2022 09:49:46 +0800 (CST)
Subject: Re: [RFC PATCH v4 00/30] Add LoongArch softmmu support.
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
 <94719c33-35b0-ea1c-b41a-1f25d15c29a0@ilande.co.uk>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <06cd68a4-5067-7e31-43c4-4b1c40f46633@loongson.cn>
Date: Mon, 17 Jan 2022 09:49:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <94719c33-35b0-ea1c-b41a-1f25d15c29a0@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9AxeuA6y+Rho6EAAA--.994S3
X-Coremail-Antispam: 1UD129KBjvJXoW3AF4kXr1DGF4UWFWDXw1DZFb_yoWftr1Dp3
 y7ur1rKr48JFZrJrn2qasxWr98JFn7Gr4293WSqry8CrWIvry3ZF1vy3sFgFy7J3y8Gry0
 qrnYkw1UWa1UJaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9mb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r1j6r4UMcIj6xIIjxv20xvE14v26r
 1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vI
 r41lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I
 0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
 GVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
 0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0
 rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
 1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bzpnQUUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: richard.henderson@linaro.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Mark

On 01/15/2022 10:11 PM, Mark Cave-Ayland wrote:
> On 08/01/2022 09:13, Xiaojuan Yang wrote:
> 
>> This series patch add softmmu support for LoongArch.
>> Base on the linux-user emulation support V14 patch.
>>    * https://patchew.org/QEMU/20220106094200.1801206-1-gaosong@loongson.cn/
>> The latest kernel:
>>    * https://github.com/loongson/linux/tree/loongarch-next
>> The latest uefi:
>>    * https://github.com/loongson/edk2
>>    * https://github.com/loongson/edk2-platforms
>> The manual:
>>    * https://github.com/loongson/LoongArch-Documentation/releases/tag/2021.10.11
>>
>>
>> Changes for v4:
>> 1. Uefi code is open and add some fdt interface to pass info between qemu and uefi.
>> 2. Use a per cpu address space for iocsr.
>> 3. Modify the tlb emulation.
>> 4. Machine and board code mainly follow Mark's advice.
>> 5. Adjust pci host space map.
>> 6. Use more memregion to simplify the interrupt controller's emulate.
>>
>>
>> Changes for v3:
>> 1.Target code mainly follow Richard's code review comments.
>> 2.Put the csr and iocsr read/write instruction emulate into 2 different patch.
>> 3.Simply the tlb emulation.
>> 4.Delete some unused csr registers defintion.
>> 5.Machine and board code mainly follow Mark's advice, discard the obsolete interface.
>> 6.NUMA function is removed for it is not completed.
>> 7.Adjust some format problem and the Naming problem
>>
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
>>    target/loongarch: Implement qmp_query_cpu_definitions()
>>    target/loongarch: Add constant timer support
>>    target/loongarch: Add MMU support for LoongArch CPU.
>>    target/loongarch: Add LoongArch CSR instruction
>>    target/loongarch: Add LoongArch IOCSR instruction
>>    target/loongarch: Add TLB instruction support
>>    target/loongarch: Add other core instructions support
>>    target/loongarch: Add LoongArch interrupt and exception handle
>>    target/loongarch: Add timer related instructions support.
>>    target/loongarch: Add gdb support.
>>    hw/pci-host: Add ls7a1000 PCIe Host bridge support for Loongson3
>>      Platform
>>    hw/loongarch: Add support loongson3-ls7a machine type.
>>    hw/loongarch: Add LoongArch cpu interrupt support(CPUINTC)
>>    hw/loongarch: Add LoongArch ipi interrupt support(IPI)
>>    hw/intc: Add LoongArch ls7a interrupt controller support(PCH-PIC)
>>    hw/intc: Add LoongArch ls7a msi interrupt controller support(PCH-MSI)
>>    hw/intc: Add LoongArch extioi interrupt controller(EIOINTC)
>>    hw/loongarch: Add irq hierarchy for the system
>>    Enable common virtio pci support for LoongArch
>>    hw/loongarch: Add some devices support for 3A5000.
>>    hw/loongarch: Add LoongArch ls7a rtc device support
>>    hw/loongarch: Add default bios startup support.
>>    hw/loongarch: Add -kernel and -initrd options support
>>    hw/loongarch: Add LoongArch smbios support
>>    hw/loongarch: Add LoongArch acpi support
>>    hw/loongarch: Add fdt support.
>>    tests/tcg/loongarch64: Add hello/memory test in loongarch64 system
>>
>>   .../devices/loongarch64-softmmu/default.mak   |   3 +
>>   configs/targets/loongarch64-softmmu.mak       |   4 +
>>   gdb-xml/loongarch-base64.xml                  |  43 +
>>   gdb-xml/loongarch-fpu64.xml                   |  57 ++
>>   hw/Kconfig                                    |   1 +
>>   hw/acpi/Kconfig                               |   4 +
>>   hw/acpi/ls7a.c                                | 374 +++++++++
>>   hw/acpi/meson.build                           |   1 +
>>   hw/intc/Kconfig                               |  15 +
>>   hw/intc/loongarch_extioi.c                    | 376 +++++++++
>>   hw/intc/loongarch_ipi.c                       | 164 ++++
>>   hw/intc/loongarch_pch_msi.c                   |  75 ++
>>   hw/intc/loongarch_pch_pic.c                   | 428 ++++++++++
>>   hw/intc/meson.build                           |   4 +
>>   hw/intc/trace-events                          |  25 +
>>   hw/loongarch/Kconfig                          |  22 +
>>   hw/loongarch/acpi-build.c                     | 636 ++++++++++++++
>>   hw/loongarch/fw_cfg.c                         |  33 +
>>   hw/loongarch/fw_cfg.h                         |  15 +
>>   hw/loongarch/loongson3.c                      | 685 +++++++++++++++
>>   hw/loongarch/meson.build                      |   6 +
>>   hw/meson.build                                |   1 +
>>   hw/pci-host/Kconfig                           |   4 +
>>   hw/pci-host/ls7a.c                            | 218 +++++
>>   hw/pci-host/meson.build                       |   1 +
>>   hw/rtc/Kconfig                                |   3 +
>>   hw/rtc/ls7a_rtc.c                             | 322 ++++++++
>>   hw/rtc/meson.build                            |   1 +
>>   include/exec/poison.h                         |   2 +
>>   include/hw/acpi/ls7a.h                        |  53 ++
>>   include/hw/intc/loongarch_extioi.h            |  69 ++
>>   include/hw/intc/loongarch_ipi.h               |  48 ++
>>   include/hw/intc/loongarch_pch_msi.h           |  21 +
>>   include/hw/intc/loongarch_pch_pic.h           |  74 ++
>>   include/hw/loongarch/loongarch.h              |  75 ++
>>   include/hw/pci-host/ls7a.h                    |  79 ++
>>   include/hw/pci/pci_ids.h                      |   3 +
>>   include/sysemu/arch_init.h                    |   1 +
>>   linux-user/loongarch64/cpu_loop.c             |   8 +-
>>   qapi/machine-target.json                      |   6 +-
>>   qapi/machine.json                             |   2 +-
>>   softmmu/qdev-monitor.c                        |   3 +-
>>   target/Kconfig                                |   1 +
>>   target/loongarch/Kconfig                      |   2 +
>>   target/loongarch/README                       |  25 +
>>   target/loongarch/constant_timer.c             |  63 ++
>>   target/loongarch/cpu-csr.h                    | 236 ++++++
>>   target/loongarch/cpu-param.h                  |   2 +-
>>   target/loongarch/cpu.c                        | 377 ++++++++-
>>   target/loongarch/cpu.h                        | 220 ++++-
>>   target/loongarch/csr_helper.c                 | 112 +++
>>   target/loongarch/disas.c                      |  57 ++
>>   target/loongarch/fpu_helper.c                 |   2 +-
>>   target/loongarch/gdbstub.c                    |  97 +++
>>   target/loongarch/helper.h                     |  26 +
>>   target/loongarch/insn_trans/trans_core.c.inc  | 412 ++++++++++
>>   target/loongarch/insn_trans/trans_extra.c.inc |  36 +-
>>   target/loongarch/insns.decode                 |  44 +
>>   target/loongarch/internals.h                  |  29 +
>>   target/loongarch/iocsr_helper.c               | 120 +++
>>   target/loongarch/machine.c                    | 101 +++
>>   target/loongarch/meson.build                  |  11 +
>>   target/loongarch/op_helper.c                  |  57 ++
>>   target/loongarch/tlb_helper.c                 | 777 ++++++++++++++++++
>>   target/loongarch/translate.c                  |   9 +-
>>   tests/tcg/loongarch64/Makefile.softmmu-target |  33 +
>>   tests/tcg/loongarch64/system/boot.S           |  58 ++
>>   tests/tcg/loongarch64/system/kernel.ld        |  30 +
>>   tests/tcg/loongarch64/system/regdef.h         |  86 ++
>>   69 files changed, 6958 insertions(+), 30 deletions(-)
>>   create mode 100644 configs/devices/loongarch64-softmmu/default.mak
>>   create mode 100644 configs/targets/loongarch64-softmmu.mak
>>   create mode 100644 gdb-xml/loongarch-base64.xml
>>   create mode 100644 gdb-xml/loongarch-fpu64.xml
>>   create mode 100644 hw/acpi/ls7a.c
>>   create mode 100644 hw/intc/loongarch_extioi.c
>>   create mode 100644 hw/intc/loongarch_ipi.c
>>   create mode 100644 hw/intc/loongarch_pch_msi.c
>>   create mode 100644 hw/intc/loongarch_pch_pic.c
>>   create mode 100644 hw/loongarch/Kconfig
>>   create mode 100644 hw/loongarch/acpi-build.c
>>   create mode 100644 hw/loongarch/fw_cfg.c
>>   create mode 100644 hw/loongarch/fw_cfg.h
>>   create mode 100644 hw/loongarch/loongson3.c
>>   create mode 100644 hw/loongarch/meson.build
>>   create mode 100644 hw/pci-host/ls7a.c
>>   create mode 100644 hw/rtc/ls7a_rtc.c
>>   create mode 100644 include/hw/acpi/ls7a.h
>>   create mode 100644 include/hw/intc/loongarch_extioi.h
>>   create mode 100644 include/hw/intc/loongarch_ipi.h
>>   create mode 100644 include/hw/intc/loongarch_pch_msi.h
>>   create mode 100644 include/hw/intc/loongarch_pch_pic.h
>>   create mode 100644 include/hw/loongarch/loongarch.h
>>   create mode 100644 include/hw/pci-host/ls7a.h
>>   create mode 100644 target/loongarch/Kconfig
>>   create mode 100644 target/loongarch/constant_timer.c
>>   create mode 100644 target/loongarch/cpu-csr.h
>>   create mode 100644 target/loongarch/csr_helper.c
>>   create mode 100644 target/loongarch/gdbstub.c
>>   create mode 100644 target/loongarch/insn_trans/trans_core.c.inc
>>   create mode 100644 target/loongarch/iocsr_helper.c
>>   create mode 100644 target/loongarch/machine.c
>>   create mode 100644 target/loongarch/tlb_helper.c
>>   create mode 100644 tests/tcg/loongarch64/Makefile.softmmu-target
>>   create mode 100644 tests/tcg/loongarch64/system/boot.S
>>   create mode 100644 tests/tcg/loongarch64/system/kernel.ld
>>   create mode 100644 tests/tcg/loongarch64/system/regdef.h
> 
> I've just done another review for v4: this is looking much better to me, since without knowing much about Loongarch I can now at least get a feel for the IRQs/memory layouts by following the standard QEMU APIs.
> 
> There are some queries/questions about some MMIO regions (and initialisation of the CPU in sysemu mode) but I don't think they will be too hard to fix once we understand the memory layout.
> 
> Finally a couple of slightly more routine things that this series is missing: an update to the MAINTAINERS file for the target/loongarch directory, and also some .rst documentation describing the basic "virt" machine and its devices e.g. something like https://qemu.readthedocs.io/en/latest/system/target-sparc64.html.
> 

Thank you for your advice, I will learn more about the memory layout and modify the MMIO regions and fixup other things in the next version.

Thanks,
Xiaojuan
> 
> ATB,
> 
> Mark.


