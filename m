Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A82471F84
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 04:14:12 +0100 (CET)
Received: from localhost ([::1]:42902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwbn1-0005ve-8M
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 22:14:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mwbmF-0005Fs-77
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 22:13:23 -0500
Received: from mail.loongson.cn ([114.242.206.163]:60248 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mwbm9-0006M7-TF
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 22:13:22 -0500
Received: from localhost.localdomain (unknown [10.20.42.11])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr9dCurZhTwAAAA--.5S3;
 Mon, 13 Dec 2021 11:13:07 +0800 (CST)
Subject: Re: [RFC PATCH v3 00/27] Add LoongArch softmmu support.
To: qemu-level <qemu-devel@nongnu.org>
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <91822021-1d4f-8e4d-1076-c4701c1e2f40@loongson.cn>
Date: Mon, 13 Dec 2021 11:13:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxr9dCurZhTwAAAA--.5S3
X-Coremail-Antispam: 1UD129KBjvJXoW3JF1Utry7GFyxWryDGr1fCrg_yoWxKry3pr
 W7urn5Kr48JrZrJr9Yqa45Xr98XFn7Gr4293Waqry8CrWavryDZF1kt3sFqFy7J348Wry0
 qFnYkw1UWF43JaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9vb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4
 vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r1j6r4UMcIj6xIIjxv20xvE14v26r
 106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vI
 r41lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I
 0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
 GVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
 0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0
 rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr
 0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5CFAJUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.051,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping!

Please help review the V3 patch, thank you!

On 12/04/2021 08:06 PM, Xiaojuan Yang wrote:
> This series patch add softmmu support for LoongArch.
> Base on the linux-user emulation support V13 patch.
>   * https://patchew.org/QEMU/1638610165-15036-1-git-send-email-gaosong@loongson.cn/
> The latest kernel:
>   * https://github.com/loongson/linux/tree/loongarch-next
> The manual:
>   * https://github.com/loongson/LoongArch-Documentation/releases/tag/2021.10.11
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
> Xiaojuan Yang (27):
>   target/loongarch: Update README
>   target/loongarch: Add CSR registers definition
>   target/loongarch: Add basic vmstate description of CPU.
>   target/loongarch: Implement qmp_query_cpu_definitions()
>   target/loongarch: Add stabletimer support
>   target/loongarch: Add MMU support for LoongArch CPU.
>   target/loongarch: Add LoongArch CSR instruction
>   target/loongarch: Add LoongArch IOCSR instruction
>   target/loongarch: Add TLB instruction support
>   target/loongarch: Add other core instructions support
>   target/loongarch: Add LoongArch interrupt and exception handle
>   target/loongarch: Add timer related instructions support.
>   target/loongarch: Add gdb support.
>   hw/pci-host: Add ls7a1000 PCIe Host bridge support for Loongson3
>     Platform
>   hw/loongarch: Add support loongson3-ls7a machine type.
>   hw/loongarch: Add LoongArch cpu interrupt support(CPUINTC)
>   hw/loongarch: Add LoongArch ipi interrupt support(IPI)
>   hw/intc: Add LoongArch ls7a interrupt controller support(PCH-PIC)
>   hw/intc: Add LoongArch ls7a msi interrupt controller support(PCH-MSI)
>   hw/intc: Add LoongArch extioi interrupt controller(EIOINTC)
>   hw/loongarch: Add irq hierarchy for the system
>   hw/loongarch: Add some devices support for 3A5000.
>   hw/loongarch: Add LoongArch ls7a rtc device support
>   hw/loongarch: Add default bios startup support.
>   hw/loongarch: Add -kernel and -initrd options support
>   hw/loongarch: Add LoongArch smbios support
>   hw/loongarch: Add LoongArch acpi support
> 
>  .../devices/loongarch64-softmmu/default.mak   |   3 +
>  configs/targets/loongarch64-softmmu.mak       |   4 +
>  gdb-xml/loongarch-base64.xml                  |  43 +
>  gdb-xml/loongarch-fpu64.xml                   |  57 ++
>  hw/Kconfig                                    |   1 +
>  hw/acpi/Kconfig                               |   4 +
>  hw/acpi/ls7a.c                                | 349 ++++++++
>  hw/acpi/meson.build                           |   1 +
>  hw/intc/Kconfig                               |  15 +
>  hw/intc/loongarch_extioi.c                    | 499 +++++++++++
>  hw/intc/loongarch_ipi.c                       | 162 ++++
>  hw/intc/loongarch_pch_msi.c                   |  67 ++
>  hw/intc/loongarch_pch_pic.c                   | 357 ++++++++
>  hw/intc/meson.build                           |   4 +
>  hw/intc/trace-events                          |  21 +
>  hw/loongarch/Kconfig                          |  23 +
>  hw/loongarch/acpi-build.c                     | 637 ++++++++++++++
>  hw/loongarch/fw_cfg.c                         |  33 +
>  hw/loongarch/fw_cfg.h                         |  15 +
>  hw/loongarch/loongson3.c                      | 509 +++++++++++
>  hw/loongarch/meson.build                      |   6 +
>  hw/meson.build                                |   1 +
>  hw/pci-host/Kconfig                           |   4 +
>  hw/pci-host/ls7a.c                            | 214 +++++
>  hw/pci-host/meson.build                       |   1 +
>  hw/rtc/Kconfig                                |   3 +
>  hw/rtc/ls7a_rtc.c                             | 323 +++++++
>  hw/rtc/meson.build                            |   1 +
>  include/exec/poison.h                         |   2 +
>  include/hw/acpi/ls7a.h                        |  53 ++
>  include/hw/intc/loongarch_extioi.h            |  69 ++
>  include/hw/intc/loongarch_ipi.h               |  47 ++
>  include/hw/intc/loongarch_pch_msi.h           |  21 +
>  include/hw/intc/loongarch_pch_pic.h           |  61 ++
>  include/hw/loongarch/loongarch.h              |  68 ++
>  include/hw/pci-host/ls7a.h                    |  79 ++
>  include/sysemu/arch_init.h                    |   1 +
>  linux-user/loongarch64/cpu_loop.c             |   8 +-
>  qapi/machine-target.json                      |   6 +-
>  qapi/machine.json                             |   2 +-
>  softmmu/qdev-monitor.c                        |   3 +-
>  target/Kconfig                                |   1 +
>  target/loongarch/Kconfig                      |   2 +
>  target/loongarch/README                       |  20 +
>  target/loongarch/cpu-csr.h                    | 236 ++++++
>  target/loongarch/cpu-param.h                  |   2 +-
>  target/loongarch/cpu.c                        | 402 ++++++++-
>  target/loongarch/cpu.h                        | 216 ++++-
>  target/loongarch/csr_helper.c                 | 112 +++
>  target/loongarch/disas.c                      |  57 ++
>  target/loongarch/fpu_helper.c                 |   2 +-
>  target/loongarch/gdbstub.c                    |  97 +++
>  target/loongarch/helper.h                     |  26 +
>  target/loongarch/insn_trans/trans_core.c.inc  | 409 +++++++++
>  target/loongarch/insn_trans/trans_extra.c.inc |  36 +-
>  target/loongarch/insns.decode                 |  44 +
>  target/loongarch/internals.h                  |  29 +
>  target/loongarch/iocsr_helper.c               | 109 +++
>  target/loongarch/machine.c                    | 104 +++
>  target/loongarch/meson.build                  |  11 +
>  target/loongarch/op_helper.c                  |  56 ++
>  target/loongarch/stabletimer.c                |  63 ++
>  target/loongarch/tlb_helper.c                 | 789 ++++++++++++++++++
>  target/loongarch/translate.c                  |   9 +-
>  64 files changed, 6579 insertions(+), 30 deletions(-)
>  create mode 100644 configs/devices/loongarch64-softmmu/default.mak
>  create mode 100644 configs/targets/loongarch64-softmmu.mak
>  create mode 100644 gdb-xml/loongarch-base64.xml
>  create mode 100644 gdb-xml/loongarch-fpu64.xml
>  create mode 100644 hw/acpi/ls7a.c
>  create mode 100644 hw/intc/loongarch_extioi.c
>  create mode 100644 hw/intc/loongarch_ipi.c
>  create mode 100644 hw/intc/loongarch_pch_msi.c
>  create mode 100644 hw/intc/loongarch_pch_pic.c
>  create mode 100644 hw/loongarch/Kconfig
>  create mode 100644 hw/loongarch/acpi-build.c
>  create mode 100644 hw/loongarch/fw_cfg.c
>  create mode 100644 hw/loongarch/fw_cfg.h
>  create mode 100644 hw/loongarch/loongson3.c
>  create mode 100644 hw/loongarch/meson.build
>  create mode 100644 hw/pci-host/ls7a.c
>  create mode 100644 hw/rtc/ls7a_rtc.c
>  create mode 100644 include/hw/acpi/ls7a.h
>  create mode 100644 include/hw/intc/loongarch_extioi.h
>  create mode 100644 include/hw/intc/loongarch_ipi.h
>  create mode 100644 include/hw/intc/loongarch_pch_msi.h
>  create mode 100644 include/hw/intc/loongarch_pch_pic.h
>  create mode 100644 include/hw/loongarch/loongarch.h
>  create mode 100644 include/hw/pci-host/ls7a.h
>  create mode 100644 target/loongarch/Kconfig
>  create mode 100644 target/loongarch/cpu-csr.h
>  create mode 100644 target/loongarch/csr_helper.c
>  create mode 100644 target/loongarch/gdbstub.c
>  create mode 100644 target/loongarch/insn_trans/trans_core.c.inc
>  create mode 100644 target/loongarch/iocsr_helper.c
>  create mode 100644 target/loongarch/machine.c
>  create mode 100644 target/loongarch/stabletimer.c
>  create mode 100644 target/loongarch/tlb_helper.c
> 


