Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9FC48F743
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 15:12:51 +0100 (CET)
Received: from localhost ([::1]:56476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8jnW-0002I6-5V
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 09:12:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n8jmB-0001Wm-DU
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 09:11:27 -0500
Received: from [2001:41c9:1:41f::167] (port=48832
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n8jm8-0001Mo-9L
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 09:11:27 -0500
Received: from [2a00:23c4:8ba0:4900:614:7796:ec2b:4f88]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n8jle-00066b-C5; Sat, 15 Jan 2022 14:10:58 +0000
Message-ID: <94719c33-35b0-ea1c-b41a-1f25d15c29a0@ilande.co.uk>
Date: Sat, 15 Jan 2022 14:11:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:4900:614:7796:ec2b:4f88
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v4 00/30] Add LoongArch softmmu support.
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 08/01/2022 09:13, Xiaojuan Yang wrote:

> This series patch add softmmu support for LoongArch.
> Base on the linux-user emulation support V14 patch.
>    * https://patchew.org/QEMU/20220106094200.1801206-1-gaosong@loongson.cn/
> The latest kernel:
>    * https://github.com/loongson/linux/tree/loongarch-next
> The latest uefi:
>    * https://github.com/loongson/edk2
>    * https://github.com/loongson/edk2-platforms
> The manual:
>    * https://github.com/loongson/LoongArch-Documentation/releases/tag/2021.10.11
> 
> 
> Changes for v4:
> 1. Uefi code is open and add some fdt interface to pass info between qemu and uefi.
> 2. Use a per cpu address space for iocsr.
> 3. Modify the tlb emulation.
> 4. Machine and board code mainly follow Mark's advice.
> 5. Adjust pci host space map.
> 6. Use more memregion to simplify the interrupt controller's emulate.
> 
> 
> Changes for v3:
> 1.Target code mainly follow Richard's code review comments.
> 2.Put the csr and iocsr read/write instruction emulate into 2 different patch.
> 3.Simply the tlb emulation.
> 4.Delete some unused csr registers defintion.
> 5.Machine and board code mainly follow Mark's advice, discard the obsolete interface.
> 6.NUMA function is removed for it is not completed.
> 7.Adjust some format problem and the Naming problem
> 
> 
> Changes for v2:
> 1.Combine patch 2 and 3 into one.
> 2.Adjust the order of the patch.
> 3.Put all the binaries on the github.
> 4.Modify some emulate errors when use the kernel from the github.
> 5.Adjust some format problem and the Naming problem
> 6.Others mainly follow Richard's code review comments.
> 
> Please help review!
> 
> Thanks
> 
> Xiaojuan Yang (30):
>    target/loongarch: Update README
>    target/loongarch: Add CSR registers definition
>    target/loongarch: Add basic vmstate description of CPU.
>    target/loongarch: Implement qmp_query_cpu_definitions()
>    target/loongarch: Add constant timer support
>    target/loongarch: Add MMU support for LoongArch CPU.
>    target/loongarch: Add LoongArch CSR instruction
>    target/loongarch: Add LoongArch IOCSR instruction
>    target/loongarch: Add TLB instruction support
>    target/loongarch: Add other core instructions support
>    target/loongarch: Add LoongArch interrupt and exception handle
>    target/loongarch: Add timer related instructions support.
>    target/loongarch: Add gdb support.
>    hw/pci-host: Add ls7a1000 PCIe Host bridge support for Loongson3
>      Platform
>    hw/loongarch: Add support loongson3-ls7a machine type.
>    hw/loongarch: Add LoongArch cpu interrupt support(CPUINTC)
>    hw/loongarch: Add LoongArch ipi interrupt support(IPI)
>    hw/intc: Add LoongArch ls7a interrupt controller support(PCH-PIC)
>    hw/intc: Add LoongArch ls7a msi interrupt controller support(PCH-MSI)
>    hw/intc: Add LoongArch extioi interrupt controller(EIOINTC)
>    hw/loongarch: Add irq hierarchy for the system
>    Enable common virtio pci support for LoongArch
>    hw/loongarch: Add some devices support for 3A5000.
>    hw/loongarch: Add LoongArch ls7a rtc device support
>    hw/loongarch: Add default bios startup support.
>    hw/loongarch: Add -kernel and -initrd options support
>    hw/loongarch: Add LoongArch smbios support
>    hw/loongarch: Add LoongArch acpi support
>    hw/loongarch: Add fdt support.
>    tests/tcg/loongarch64: Add hello/memory test in loongarch64 system
> 
>   .../devices/loongarch64-softmmu/default.mak   |   3 +
>   configs/targets/loongarch64-softmmu.mak       |   4 +
>   gdb-xml/loongarch-base64.xml                  |  43 +
>   gdb-xml/loongarch-fpu64.xml                   |  57 ++
>   hw/Kconfig                                    |   1 +
>   hw/acpi/Kconfig                               |   4 +
>   hw/acpi/ls7a.c                                | 374 +++++++++
>   hw/acpi/meson.build                           |   1 +
>   hw/intc/Kconfig                               |  15 +
>   hw/intc/loongarch_extioi.c                    | 376 +++++++++
>   hw/intc/loongarch_ipi.c                       | 164 ++++
>   hw/intc/loongarch_pch_msi.c                   |  75 ++
>   hw/intc/loongarch_pch_pic.c                   | 428 ++++++++++
>   hw/intc/meson.build                           |   4 +
>   hw/intc/trace-events                          |  25 +
>   hw/loongarch/Kconfig                          |  22 +
>   hw/loongarch/acpi-build.c                     | 636 ++++++++++++++
>   hw/loongarch/fw_cfg.c                         |  33 +
>   hw/loongarch/fw_cfg.h                         |  15 +
>   hw/loongarch/loongson3.c                      | 685 +++++++++++++++
>   hw/loongarch/meson.build                      |   6 +
>   hw/meson.build                                |   1 +
>   hw/pci-host/Kconfig                           |   4 +
>   hw/pci-host/ls7a.c                            | 218 +++++
>   hw/pci-host/meson.build                       |   1 +
>   hw/rtc/Kconfig                                |   3 +
>   hw/rtc/ls7a_rtc.c                             | 322 ++++++++
>   hw/rtc/meson.build                            |   1 +
>   include/exec/poison.h                         |   2 +
>   include/hw/acpi/ls7a.h                        |  53 ++
>   include/hw/intc/loongarch_extioi.h            |  69 ++
>   include/hw/intc/loongarch_ipi.h               |  48 ++
>   include/hw/intc/loongarch_pch_msi.h           |  21 +
>   include/hw/intc/loongarch_pch_pic.h           |  74 ++
>   include/hw/loongarch/loongarch.h              |  75 ++
>   include/hw/pci-host/ls7a.h                    |  79 ++
>   include/hw/pci/pci_ids.h                      |   3 +
>   include/sysemu/arch_init.h                    |   1 +
>   linux-user/loongarch64/cpu_loop.c             |   8 +-
>   qapi/machine-target.json                      |   6 +-
>   qapi/machine.json                             |   2 +-
>   softmmu/qdev-monitor.c                        |   3 +-
>   target/Kconfig                                |   1 +
>   target/loongarch/Kconfig                      |   2 +
>   target/loongarch/README                       |  25 +
>   target/loongarch/constant_timer.c             |  63 ++
>   target/loongarch/cpu-csr.h                    | 236 ++++++
>   target/loongarch/cpu-param.h                  |   2 +-
>   target/loongarch/cpu.c                        | 377 ++++++++-
>   target/loongarch/cpu.h                        | 220 ++++-
>   target/loongarch/csr_helper.c                 | 112 +++
>   target/loongarch/disas.c                      |  57 ++
>   target/loongarch/fpu_helper.c                 |   2 +-
>   target/loongarch/gdbstub.c                    |  97 +++
>   target/loongarch/helper.h                     |  26 +
>   target/loongarch/insn_trans/trans_core.c.inc  | 412 ++++++++++
>   target/loongarch/insn_trans/trans_extra.c.inc |  36 +-
>   target/loongarch/insns.decode                 |  44 +
>   target/loongarch/internals.h                  |  29 +
>   target/loongarch/iocsr_helper.c               | 120 +++
>   target/loongarch/machine.c                    | 101 +++
>   target/loongarch/meson.build                  |  11 +
>   target/loongarch/op_helper.c                  |  57 ++
>   target/loongarch/tlb_helper.c                 | 777 ++++++++++++++++++
>   target/loongarch/translate.c                  |   9 +-
>   tests/tcg/loongarch64/Makefile.softmmu-target |  33 +
>   tests/tcg/loongarch64/system/boot.S           |  58 ++
>   tests/tcg/loongarch64/system/kernel.ld        |  30 +
>   tests/tcg/loongarch64/system/regdef.h         |  86 ++
>   69 files changed, 6958 insertions(+), 30 deletions(-)
>   create mode 100644 configs/devices/loongarch64-softmmu/default.mak
>   create mode 100644 configs/targets/loongarch64-softmmu.mak
>   create mode 100644 gdb-xml/loongarch-base64.xml
>   create mode 100644 gdb-xml/loongarch-fpu64.xml
>   create mode 100644 hw/acpi/ls7a.c
>   create mode 100644 hw/intc/loongarch_extioi.c
>   create mode 100644 hw/intc/loongarch_ipi.c
>   create mode 100644 hw/intc/loongarch_pch_msi.c
>   create mode 100644 hw/intc/loongarch_pch_pic.c
>   create mode 100644 hw/loongarch/Kconfig
>   create mode 100644 hw/loongarch/acpi-build.c
>   create mode 100644 hw/loongarch/fw_cfg.c
>   create mode 100644 hw/loongarch/fw_cfg.h
>   create mode 100644 hw/loongarch/loongson3.c
>   create mode 100644 hw/loongarch/meson.build
>   create mode 100644 hw/pci-host/ls7a.c
>   create mode 100644 hw/rtc/ls7a_rtc.c
>   create mode 100644 include/hw/acpi/ls7a.h
>   create mode 100644 include/hw/intc/loongarch_extioi.h
>   create mode 100644 include/hw/intc/loongarch_ipi.h
>   create mode 100644 include/hw/intc/loongarch_pch_msi.h
>   create mode 100644 include/hw/intc/loongarch_pch_pic.h
>   create mode 100644 include/hw/loongarch/loongarch.h
>   create mode 100644 include/hw/pci-host/ls7a.h
>   create mode 100644 target/loongarch/Kconfig
>   create mode 100644 target/loongarch/constant_timer.c
>   create mode 100644 target/loongarch/cpu-csr.h
>   create mode 100644 target/loongarch/csr_helper.c
>   create mode 100644 target/loongarch/gdbstub.c
>   create mode 100644 target/loongarch/insn_trans/trans_core.c.inc
>   create mode 100644 target/loongarch/iocsr_helper.c
>   create mode 100644 target/loongarch/machine.c
>   create mode 100644 target/loongarch/tlb_helper.c
>   create mode 100644 tests/tcg/loongarch64/Makefile.softmmu-target
>   create mode 100644 tests/tcg/loongarch64/system/boot.S
>   create mode 100644 tests/tcg/loongarch64/system/kernel.ld
>   create mode 100644 tests/tcg/loongarch64/system/regdef.h

I've just done another review for v4: this is looking much better to me, since 
without knowing much about Loongarch I can now at least get a feel for the 
IRQs/memory layouts by following the standard QEMU APIs.

There are some queries/questions about some MMIO regions (and initialisation of the 
CPU in sysemu mode) but I don't think they will be too hard to fix once we understand 
the memory layout.

Finally a couple of slightly more routine things that this series is missing: an 
update to the MAINTAINERS file for the target/loongarch directory, and also some .rst 
documentation describing the basic "virt" machine and its devices e.g. something like 
https://qemu.readthedocs.io/en/latest/system/target-sparc64.html.


ATB,

Mark.

