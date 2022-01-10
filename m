Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5445B488EB8
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 03:44:28 +0100 (CET)
Received: from localhost ([::1]:33044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6kfb-0002Rw-6F
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 21:44:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1n6ke6-0001Wb-Gi
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 21:42:54 -0500
Received: from mail.loongson.cn ([114.242.206.163]:59858 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1n6ke3-00078X-60
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 21:42:54 -0500
Received: from localhost.localdomain (unknown [10.20.42.11])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cx6+gindth0w0BAA--.4261S3;
 Mon, 10 Jan 2022 10:42:43 +0800 (CST)
Subject: Re: [RFC PATCH v4 00/30] Add LoongArch softmmu support.
To: WANG Xuerui <i.qemu@xen0n.name>, qemu-devel@nongnu.org
References: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
 <1ee6013f-957f-caaa-3269-7779e8cfc57a@xen0n.name>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <3b5d66ce-8a75-af33-39f7-c43b45624c6a@loongson.cn>
Date: Mon, 10 Jan 2022 10:42:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1ee6013f-957f-caaa-3269-7779e8cfc57a@xen0n.name>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Cx6+gindth0w0BAA--.4261S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Zw1kCFykJw1rWFW8tr18Zrb_yoWDtw4Up3
 y7ur1rKr48GrZrJrn2qasxWr98JFn7GrW2v3WSqry8CrWavry3Zr1vyasIgFy7J3ykGry0
 qrnYkw1UWa1UJaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9vb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Jr0_Gr1lYx0E2Ix0cI8IcVAFwI0_Jr
 I_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxG
 rwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxV
 CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
 6r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
 WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG
 6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr
 0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5mNt3UUUUU==
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Xuerui

    Thank you for all you advice, I will modify the target part carefully.

Xiaojuan


On 01/09/2022 05:26 PM, WANG Xuerui wrote:
> Hi Xiaojuan,
> 
> I've just finished reviewing the first part (target modifications) as I'm not familiar with QEMU device emulation. You may have to revise the target part carefully, and re-organize at the series level to accelerate upstreaming though, as Richard pointed out in the other patch series (Song Gao's LoongArch linux-user support series) that the series as a whole is blocked.
> 
> 
> On 1/8/22 17:13, Xiaojuan Yang wrote:
>> This series patch add softmmu support for LoongArch.
>> Base on the linux-user emulation support V14 patch.
>>    *https://patchew.org/QEMU/20220106094200.1801206-1-gaosong@loongson.cn/
> 
> There's a recognized syntax for marking patch series dependency [1], so that your series could be auto-applied by Patchew for ease of consumption. You can look at Song Gao's v14 LoongArch linux-user series for example usage.
> 
> [1]: https://www.qemu.org/docs/master/devel/submitting-a-patch.html#base-patches-against-current-git-master
> 
>> The latest kernel:
>>    *https://github.com/loongson/linux/tree/loongarch-next
>> The latest uefi:
>>    *https://github.com/loongson/edk2
>>    *https://github.com/loongson/edk2-platforms
>> The manual:
>>    *https://github.com/loongson/LoongArch-Documentation/releases/tag/2021.10.11
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
> 
> There are serious issues with your commit message...
> 
> First of all, some of your commit message titles end with a period, while some don't; the QEMU convention is to NOT use one. So please fix all commits like this to remove the trailing period.
> 
>>    target/loongarch: Implement qmp_query_cpu_definitions()
>>    target/loongarch: Add constant timer support
> "Implement the constant timer" would be more concise and idiomatic English.
>>    target/loongarch: Add MMU support for LoongArch CPU.
>>    target/loongarch: Add LoongArch CSR instruction
>>    target/loongarch: Add LoongArch IOCSR instruction
> You don't need to emphasize "LoongArch" because the component prefix "target/loongarch" says it all. Also all of these commits add support for multiple instructions at once, so you would say "instructions". You may need to check all places for simple plural form mistakes like these.
>>    target/loongarch: Add TLB instruction support
>>    target/loongarch: Add other core instructions support
>>    target/loongarch: Add LoongArch interrupt and exception handle
> "handlers"?
>>    target/loongarch: Add timer related instructions support.
>>    target/loongarch: Add gdb support.
>>    hw/pci-host: Add ls7a1000 PCIe Host bridge support for Loongson3
>>      Platform
> "Add the LS7A1000 PCIe host bridge" would be enough; although currently the LS7A chip is only paired with Loongson 3 CPUs, there's no intrinsic reasons to only support this combination ever.
>>    hw/loongarch: Add support loongson3-ls7a machine type.
> "Support the loongson3-ls7a machine type"
>>    hw/loongarch: Add LoongArch cpu interrupt support(CPUINTC)
> You may just say "Implement the LoongArch CPUINTC"; people naturally look in the diff to get what CPUINTC means. Same for other following commits with similar commit messages.
>>    hw/loongarch: Add LoongArch ipi interrupt support(IPI)
>>    hw/intc: Add LoongArch ls7a interrupt controller support(PCH-PIC)
>>    hw/intc: Add LoongArch ls7a msi interrupt controller support(PCH-MSI)
>>    hw/intc: Add LoongArch extioi interrupt controller(EIOINTC)
>>    hw/loongarch: Add irq hierarchy for the system
>>    Enable common virtio pci support for LoongArch
> This patch is missing component prefix in its title.
>>    hw/loongarch: Add some devices support for 3A5000.
> What's "some"? You may want to clarify a bit, or to split patches if you cannot make your title short and concise.
>>    hw/loongarch: Add LoongArch ls7a rtc device support
> The LS7A RTC is usable for MIPS-based Loongson systems too, like the 3A4000/LS7A1000 combination, so is this really LoongArch-specific?
>>    hw/loongarch: Add default bios startup support.
>>    hw/loongarch: Add -kernel and -initrd options support
>>    hw/loongarch: Add LoongArch smbios support
>>    hw/loongarch: Add LoongArch acpi support
>>    hw/loongarch: Add fdt support.
>>    tests/tcg/loongarch64: Add hello/memory test in loongarch64 system
> "for" loongarch64 systems
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
>>


