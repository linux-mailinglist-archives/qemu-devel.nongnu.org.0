Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0817351B938
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 09:35:18 +0200 (CEST)
Received: from localhost ([::1]:53438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmW16-0000Oa-M1
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 03:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nmVyh-00085h-8k
 for qemu-devel@nongnu.org; Thu, 05 May 2022 03:32:52 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57970 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nmVyT-0005oW-W4
 for qemu-devel@nongnu.org; Thu, 05 May 2022 03:32:42 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL9uEfXNiIpgKAA--.43076S3; 
 Thu, 05 May 2022 15:32:21 +0800 (CST)
Subject: Re: [PATCH v3 00/43] Add LoongArch softmmu support
To: qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 gaosong@loongson.cn
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <7f1d5d41-130e-5e7e-20e5-5e805628676a@loongson.cn>
Date: Thu, 5 May 2022 15:32:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxL9uEfXNiIpgKAA--.43076S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Zr1kAFyfKrWUXF47GF43trb_yoWkAr1kpr
 47ur1rKF48JrZ7Jrsaqa45WrykXF4xGr4293WSqryrCrWSvr9rZF1kK3sFqFy3J348Wry0
 qFnYkw1UWa15JaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
 IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
 6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
 IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E
 87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
 ZFpf9x0JUdEfOUUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi  Richard and Mark,
Could you help us review the patch [1] ?

[1] :
[PATCH v3 34/43] hw/intc: Add LoongArch extioi interrupt
[PATCH v3 38/43] hw/loongarch: Add LoongArch ls7a rtc device support
[PATCH v3 39/43] hw/loongarch: Add LoongArch load elf function.
[PATCH v3 40/43] hw/loongarch: Add LoongArch ls7a acpi device support

Thanks.
Xiaojuan
On 2022/4/29 下午6:06, Xiaojuan Yang wrote:
> Hi All,
>
> As this series only supports running binary files in ELF format, and does not depend on
> BIOS and kernel file. so this series are changed from RFC to patch v1.
>
>
> The manual:
>    - https://github.com/loongson/LoongArch-Documentation/releases/tag/2022.03.17
>
> Old series:
>    - https://patchew.org/QEMU/20220328125749.2918087-1-yangxiaojuan@loongson.cn/
>    - https://patchew.org/QEMU/20220106094200.1801206-1-gaosong@loongson.cn/
>
> Thanks.
> Xiaojuan
>
> -----
> v3:
>
>    - Add Check csr_names.
>    - Drop CSR_CPUID, use cpu->cpu_index.
>    - Fixed loongarch extioi device emulation. ipmap and coremap register change to 32bits.
>    - Check_iocsr() function moved to loongarch_ipi_writel().
>    - Pch_pic/msi use qdev_init_gpio_out() to init irq, and use qdev_connect_gpio_out() to connect irq.
>    - Load elf function moved to hw/loongarch/loongson.c
>
> v2:
>    - Improvents to CSR/IOCSR instructions translation.
>    - Fixed extioi device emulation. It is represented by only one memory region.
>    - Fixed IPI device emulation. The registers are represented with uint64_t.
>    - Use do_cpu_reset() and cpu_set_pc() to specify the load address.
>
> v2: https://patchew.org/QEMU/20220425091027.2877892-1-yangxiaojuan@loongson.cn/
> v1: https://patchew.org/QEMU/20220415094058.3584233-1-yangxiaojuan@loongson.cn/
>
>
> Song Gao (18):
>    target/loongarch: Add README
>    target/loongarch: Add core definition
>    target/loongarch: Add main translation routines
>    target/loongarch: Add fixed point arithmetic instruction translation
>    target/loongarch: Add fixed point shift instruction translation
>    target/loongarch: Add fixed point bit instruction translation
>    target/loongarch: Add fixed point load/store instruction translation
>    target/loongarch: Add fixed point atomic instruction translation
>    target/loongarch: Add fixed point extra instruction translation
>    target/loongarch: Add floating point arithmetic instruction
>      translation
>    target/loongarch: Add floating point comparison instruction
>      translation
>    target/loongarch: Add floating point conversion instruction
>      translation
>    target/loongarch: Add floating point move instruction translation
>    target/loongarch: Add floating point load/store instruction
>      translation
>    target/loongarch: Add branch instruction translation
>    target/loongarch: Add disassembler
>    target/loongarch: Add target build suport
>    target/loongarch: 'make check-tcg' support
>
> Xiaojuan Yang (25):
>    target/loongarch: Add system emulation introduction
>    target/loongarch: Add CSRs definition
>    target/loongarch: Add basic vmstate description of CPU.
>    target/loongarch: Implement qmp_query_cpu_definitions()
>    target/loongarch: Add MMU support for LoongArch CPU.
>    target/loongarch: Add LoongArch interrupt and exception handle
>    target/loongarch: Add constant timer support
>    target/loongarch: Add LoongArch CSR instruction
>    target/loongarch: Add LoongArch IOCSR instruction
>    target/loongarch: Add TLB instruction support
>    target/loongarch: Add other core instructions support
>    target/loongarch: Add timer related instructions support.
>    hw/loongarch: Add support loongson3 virt machine type.
>    hw/loongarch: Add LoongArch ipi interrupt support(IPI)
>    hw/intc: Add LoongArch ls7a interrupt controller support(PCH-PIC)
>    hw/intc: Add LoongArch ls7a msi interrupt controller support(PCH-MSI)
>    hw/intc: Add LoongArch extioi interrupt controller(EIOINTC)
>    hw/loongarch: Add irq hierarchy for the system
>    Enable common virtio pci support for LoongArch
>    hw/loongarch: Add some devices support for 3A5000.
>    hw/loongarch: Add LoongArch ls7a rtc device support
>    hw/loongarch: Add LoongArch load elf function.
>    hw/loongarch: Add LoongArch ls7a acpi device support
>    target/loongarch: Add gdb support.
>    tests/tcg/loongarch64: Add hello/memory test in loongarch64 system
>
>   MAINTAINERS                                   |  26 +
>   .../devices/loongarch64-softmmu/default.mak   |   3 +
>   configs/targets/loongarch64-softmmu.mak       |   4 +
>   docs/system/loongarch/loongson3.rst           |  41 +
>   gdb-xml/loongarch-base64.xml                  |  44 +
>   gdb-xml/loongarch-fpu64.xml                   |  57 ++
>   hw/Kconfig                                    |   1 +
>   hw/acpi/Kconfig                               |   4 +
>   hw/acpi/ls7a.c                                | 374 ++++++++
>   hw/acpi/meson.build                           |   1 +
>   hw/intc/Kconfig                               |  15 +
>   hw/intc/loongarch_extioi.c                    | 248 +++++
>   hw/intc/loongarch_ipi.c                       | 242 +++++
>   hw/intc/loongarch_pch_msi.c                   |  73 ++
>   hw/intc/loongarch_pch_pic.c                   | 431 +++++++++
>   hw/intc/meson.build                           |   4 +
>   hw/intc/trace-events                          |  21 +
>   hw/loongarch/Kconfig                          |  18 +
>   hw/loongarch/loongson3.c                      | 361 ++++++++
>   hw/loongarch/meson.build                      |   4 +
>   hw/meson.build                                |   1 +
>   hw/rtc/Kconfig                                |   3 +
>   hw/rtc/ls7a_rtc.c                             | 322 +++++++
>   hw/rtc/meson.build                            |   1 +
>   include/disas/dis-asm.h                       |   2 +
>   include/exec/poison.h                         |   2 +
>   include/hw/acpi/ls7a.h                        |  53 ++
>   include/hw/intc/loongarch_extioi.h            |  58 ++
>   include/hw/intc/loongarch_ipi.h               |  52 ++
>   include/hw/intc/loongarch_pch_msi.h           |  20 +
>   include/hw/intc/loongarch_pch_pic.h           |  69 ++
>   include/hw/loongarch/virt.h                   |  42 +
>   include/hw/pci-host/ls7a.h                    |  48 +
>   include/sysemu/arch_init.h                    |   1 +
>   meson.build                                   |   1 +
>   qapi/machine-target.json                      |   6 +-
>   qapi/machine.json                             |   2 +-
>   softmmu/qdev-monitor.c                        |   3 +-
>   target/Kconfig                                |   1 +
>   target/loongarch/Kconfig                      |   2 +
>   target/loongarch/README                       |  64 ++
>   target/loongarch/constant_timer.c             |  64 ++
>   target/loongarch/cpu-csr.h                    | 208 +++++
>   target/loongarch/cpu-param.h                  |  18 +
>   target/loongarch/cpu.c                        | 698 ++++++++++++++
>   target/loongarch/cpu.h                        | 391 ++++++++
>   target/loongarch/csr_helper.c                 |  92 ++
>   target/loongarch/disas.c                      | 757 +++++++++++++++
>   target/loongarch/fpu_helper.c                 | 862 ++++++++++++++++++
>   target/loongarch/gdbstub.c                    |  81 ++
>   target/loongarch/helper.h                     | 131 +++
>   target/loongarch/insn_trans/trans_arith.c.inc | 304 ++++++
>   .../loongarch/insn_trans/trans_atomic.c.inc   | 113 +++
>   target/loongarch/insn_trans/trans_bit.c.inc   | 212 +++++
>   .../loongarch/insn_trans/trans_branch.c.inc   |  83 ++
>   target/loongarch/insn_trans/trans_extra.c.inc | 101 ++
>   .../loongarch/insn_trans/trans_farith.c.inc   | 105 +++
>   target/loongarch/insn_trans/trans_fcmp.c.inc  |  56 ++
>   target/loongarch/insn_trans/trans_fcnv.c.inc  |  33 +
>   .../loongarch/insn_trans/trans_fmemory.c.inc  | 153 ++++
>   target/loongarch/insn_trans/trans_fmov.c.inc  | 157 ++++
>   .../loongarch/insn_trans/trans_memory.c.inc   | 229 +++++
>   .../insn_trans/trans_privileged.c.inc         | 465 ++++++++++
>   target/loongarch/insn_trans/trans_shift.c.inc | 106 +++
>   target/loongarch/insns.decode                 | 486 ++++++++++
>   target/loongarch/internals.h                  |  56 ++
>   target/loongarch/iocsr_helper.c               |  67 ++
>   target/loongarch/machine.c                    | 102 +++
>   target/loongarch/meson.build                  |  30 +
>   target/loongarch/op_helper.c                  | 132 +++
>   target/loongarch/tlb_helper.c                 | 763 ++++++++++++++++
>   target/loongarch/translate.c                  | 280 ++++++
>   target/loongarch/translate.h                  |  45 +
>   target/meson.build                            |   1 +
>   tests/tcg/configure.sh                        |   1 +
>   tests/tcg/loongarch64/Makefile.softmmu-target |  33 +
>   tests/tcg/loongarch64/system/boot.S           |  56 ++
>   tests/tcg/loongarch64/system/kernel.ld        |  30 +
>   tests/tcg/loongarch64/system/regdef.h         |  86 ++
>   79 files changed, 10308 insertions(+), 4 deletions(-)
>   create mode 100644 configs/devices/loongarch64-softmmu/default.mak
>   create mode 100644 configs/targets/loongarch64-softmmu.mak
>   create mode 100644 docs/system/loongarch/loongson3.rst
>   create mode 100644 gdb-xml/loongarch-base64.xml
>   create mode 100644 gdb-xml/loongarch-fpu64.xml
>   create mode 100644 hw/acpi/ls7a.c
>   create mode 100644 hw/intc/loongarch_extioi.c
>   create mode 100644 hw/intc/loongarch_ipi.c
>   create mode 100644 hw/intc/loongarch_pch_msi.c
>   create mode 100644 hw/intc/loongarch_pch_pic.c
>   create mode 100644 hw/loongarch/Kconfig
>   create mode 100644 hw/loongarch/loongson3.c
>   create mode 100644 hw/loongarch/meson.build
>   create mode 100644 hw/rtc/ls7a_rtc.c
>   create mode 100644 include/hw/acpi/ls7a.h
>   create mode 100644 include/hw/intc/loongarch_extioi.h
>   create mode 100644 include/hw/intc/loongarch_ipi.h
>   create mode 100644 include/hw/intc/loongarch_pch_msi.h
>   create mode 100644 include/hw/intc/loongarch_pch_pic.h
>   create mode 100644 include/hw/loongarch/virt.h
>   create mode 100644 include/hw/pci-host/ls7a.h
>   create mode 100644 target/loongarch/Kconfig
>   create mode 100644 target/loongarch/README
>   create mode 100644 target/loongarch/constant_timer.c
>   create mode 100644 target/loongarch/cpu-csr.h
>   create mode 100644 target/loongarch/cpu-param.h
>   create mode 100644 target/loongarch/cpu.c
>   create mode 100644 target/loongarch/cpu.h
>   create mode 100644 target/loongarch/csr_helper.c
>   create mode 100644 target/loongarch/disas.c
>   create mode 100644 target/loongarch/fpu_helper.c
>   create mode 100644 target/loongarch/gdbstub.c
>   create mode 100644 target/loongarch/helper.h
>   create mode 100644 target/loongarch/insn_trans/trans_arith.c.inc
>   create mode 100644 target/loongarch/insn_trans/trans_atomic.c.inc
>   create mode 100644 target/loongarch/insn_trans/trans_bit.c.inc
>   create mode 100644 target/loongarch/insn_trans/trans_branch.c.inc
>   create mode 100644 target/loongarch/insn_trans/trans_extra.c.inc
>   create mode 100644 target/loongarch/insn_trans/trans_farith.c.inc
>   create mode 100644 target/loongarch/insn_trans/trans_fcmp.c.inc
>   create mode 100644 target/loongarch/insn_trans/trans_fcnv.c.inc
>   create mode 100644 target/loongarch/insn_trans/trans_fmemory.c.inc
>   create mode 100644 target/loongarch/insn_trans/trans_fmov.c.inc
>   create mode 100644 target/loongarch/insn_trans/trans_memory.c.inc
>   create mode 100644 target/loongarch/insn_trans/trans_privileged.c.inc
>   create mode 100644 target/loongarch/insn_trans/trans_shift.c.inc
>   create mode 100644 target/loongarch/insns.decode
>   create mode 100644 target/loongarch/internals.h
>   create mode 100644 target/loongarch/iocsr_helper.c
>   create mode 100644 target/loongarch/machine.c
>   create mode 100644 target/loongarch/meson.build
>   create mode 100644 target/loongarch/op_helper.c
>   create mode 100644 target/loongarch/tlb_helper.c
>   create mode 100644 target/loongarch/translate.c
>   create mode 100644 target/loongarch/translate.h
>   create mode 100644 tests/tcg/loongarch64/Makefile.softmmu-target
>   create mode 100644 tests/tcg/loongarch64/system/boot.S
>   create mode 100644 tests/tcg/loongarch64/system/kernel.ld
>   create mode 100644 tests/tcg/loongarch64/system/regdef.h
>


