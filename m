Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 470B0433C17
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:25:51 +0200 (CEST)
Received: from localhost ([::1]:32878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrvy-0006RS-5h
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mcqTU-00069o-KQ
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:52:21 -0400
Received: from mail.xen0n.name ([115.28.160.31]:48978
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mcqTP-00023A-Sy
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:52:20 -0400
Received: from [192.168.9.172] (unknown [101.88.135.223])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 6E86A600B5;
 Tue, 19 Oct 2021 22:52:09 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1634655129; bh=89UF3xefbX5R1jEug4M03RiiCr6cb8Ucoa6YxBNKyVM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=q9rwxQH5nvecj6Eg3xIrNPmlNuhNiiWsPdzpBzneRwi0yQX/G+h6PsqZoFid9M9g4
 CqAA0cCQzDU6XnM+ECIWd2QXXbGWax8ytFBlErNePNA/M3lm2uJv7fo2KoJocgceV1
 RqQBsX/9Ap4ytrZFCnNk+8V981MgtVTmchi0cHDQ=
Message-ID: <871839b9-c0eb-c6f0-47b6-bd045884e622@xen0n.name>
Date: Tue, 19 Oct 2021 22:52:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101
 Thunderbird/95.0a1
Subject: Re: [PATCH 00/31] Add Loongarch softmmu support.
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.074,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, mst@redhat.com,
 david@gibson.dropbear.id.au, mark.cave-ayland@ilande.co.uk,
 richard.henderson@linaro.org, laurent@vivier.eu, peterx@redhat.com,
 f4bug@amsat.org, alex.bennee@linaro.org, alistair.francis@wdc.com,
 maobibo@loongson.cn, gaosong@loongson.cn, pbonzini@redhat.com,
 bmeng.cn@gmail.com, philmd@redhat.com, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Xiaojuan,

On 10/19/21 15:34, Xiaojuan Yang wrote:
> This series patch add softmmu support for LoongArch.
> Base on the linux-user emulation support V7 patch.
>
> The latest kernel:
>    * https://github.com/loongson/linux/tree/loongarch-next
> The manual:
>    * https://github.com/loongson/LoongArch-Documentation/releases/tag/2021.10.11
>
> Patch 1 Add a readme for code download and supply binary for test.
> Patch 2-3 define CSR registers and set the init/reset value.
> Patch 4-5 Add cpu related functions.
> Patch 6-12 Add Privileged instruction simulation used by LoongArch.
> Patch 13 Emulate a virt pci host based on the LoongArch 7A1000.
> Patch 14 Emulate a virt 3a5000 board different from host.
> Patch 15-20 Emulate the interrupt controller used by the virt board.
> Patch 21-22 Add devices used by the board.
> Patch 23-25 Add bios and smbios support needed for the start.
> Patch 26 Add a simple acpi model.
> Patch 27 Enable mttcg mode.
> Patch 28-29 Support for numa more than 4 cpus.
> Patch 30-31 Add some functions for debug.
>
> Xiaojuan Yang (31):
>    target/loongarch: Upate the README for the softmmu.

Nit: "Update", also remove the trailing period -- QEMU style doesn't 
mandate full sentences for title line of commit messages AFAIK. Other 
places should be fixed as well.

>    target/loongarch: Add CSR registers definition
>    target/loongarch: Set default csr values.
>    target/loongarch: Add basic vmstate description of CPU.
>    target/loongarch: Implement qmp_query_cpu_definitions()
>    target/loongarch: Add mmu support for Loongarch CPU.
>    target/loongarch: Add loongarch csr/iocsr instruction support
And please use consistent casing for "LoongArch", "CSR", "IOCSR", "MMU", 
"TLB" etc etc -- again fix everywhere you can.
>    target/loongarch: Add tlb instruction support
>    target/loongarch: Add other core instructions support
>    target/loongarch: Add loongarch interrupt and exception handle
>    target/loongarch: Add stabletimer support
>    target/loongarch: Add timer related instructions support.
>    hw/pci-host: Add ls7a1000 PCIe Host bridge support for Loongson
>      Platform
>    hw/loongarch: Add a virt loongarch 3A5000 board support
>    hw/loongarch: Add loongarch cpu interrupt support(CPUINTC)
>    hw/loongarch: Add loongarch ipi interrupt support(IPI)
>    hw/intc: Add loongarch ls7a interrupt controller support(PCH-PIC)
>    hw/intc: Add loongarch ls7a msi interrupt controller support(PCH-MSI)
>    hw/intc: Add loongarch extioi interrupt controller(EIOINTC)
>    hw/loongarch: Add irq hierarchy for the system
>    hw/loongarch: Add some devices support for 3A5000.
>    hw/loongarch: Add loongarch ls7a rtc device support
>    hw/loongarch: Add default bios startup support.
>    hw/loongarch: Add -kernel and -initrd options support
>    hw/loongarch: Add loongarch smbios support
>    hw/loongarch: Add loongarch acpi support
>    hw/loongarch: Add mttcg mode support
>    hw/loongarch: use machine->possible_cpus for storing possible topology
>      info
>    hw/loongarch: Add numa support.
>    target/loongarch: Add gdb support.
>    target/loongarch: Add privilege instructions diassembly
>
>   .../devices/loongarch64-softmmu/default.mak   |   3 +
>   configs/targets/loongarch64-softmmu.mak       |   4 +
>   disas/loongarch.c                             | 173 ++++
>   gdb-xml/loongarch-base64.xml                  |  43 +
>   gdb-xml/loongarch-fpu64.xml                   |  57 ++
>   hw/Kconfig                                    |   1 +
>   hw/acpi/Kconfig                               |   4 +
>   hw/acpi/ls7a.c                                | 351 +++++++
>   hw/acpi/meson.build                           |   1 +
>   hw/intc/Kconfig                               |  12 +
>   hw/intc/loongarch_extioi.c                    | 589 +++++++++++
>   hw/intc/loongarch_pch_msi.c                   |  74 ++
>   hw/intc/loongarch_pch_pic.c                   | 284 ++++++
>   hw/intc/meson.build                           |   3 +
>   hw/loongarch/Kconfig                          |  22 +
>   hw/loongarch/acpi-build.c                     | 661 +++++++++++++
>   hw/loongarch/fw_cfg.c                         |  34 +
>   hw/loongarch/fw_cfg.h                         |  16 +
>   hw/loongarch/ipi.c                            | 147 +++
>   hw/loongarch/loongarch_int.c                  |  62 ++
>   hw/loongarch/ls3a5000_virt.c                  | 638 ++++++++++++
>   hw/loongarch/meson.build                      |   7 +
>   hw/meson.build                                |   1 +
>   hw/pci-host/Kconfig                           |   4 +
>   hw/pci-host/ls7a.c                            | 224 +++++
>   hw/pci-host/meson.build                       |   1 +
>   hw/rtc/Kconfig                                |   3 +
>   hw/rtc/ls7a_rtc.c                             | 327 +++++++
>   hw/rtc/meson.build                            |   1 +
>   include/exec/poison.h                         |   2 +
>   include/hw/acpi/ls7a.h                        |  54 ++
>   include/hw/intc/loongarch_extioi.h            | 102 ++
>   include/hw/intc/loongarch_pch_msi.h           |  17 +
>   include/hw/intc/loongarch_pch_pic.h           |  50 +
>   include/hw/loongarch/gipi.h                   |  38 +
>   include/hw/loongarch/loongarch.h              |  79 ++
>   include/hw/pci-host/ls7a.h                    |  67 ++
>   include/sysemu/arch_init.h                    |   1 +
>   linux-user/loongarch64/cpu_loop.c             |   3 +-
>   pc-bios/loongarch_bios.bin                    | Bin 0 -> 4128768 bytes
>   qapi/machine-target.json                      |   6 +-
>   qapi/machine.json                             |   2 +-
>   softmmu/qdev-monitor.c                        |   3 +-
>   target/Kconfig                                |   1 +
>   target/loongarch/Kconfig                      |   2 +
>   target/loongarch/README                       | 134 +++
>   target/loongarch/cpu-csr.h                    | 493 ++++++++++
>   target/loongarch/cpu.c                        | 448 ++++++++-
>   target/loongarch/cpu.h                        |  56 +-
>   target/loongarch/csr_helper.c                 | 765 +++++++++++++++
>   target/loongarch/gdbstub.c                    |  95 ++
>   target/loongarch/helper.h                     |  24 +
>   target/loongarch/insn_trans/trans_core.c      | 302 ++++++
>   target/loongarch/insn_trans/trans_extra.c     |   2 +
>   target/loongarch/insns.decode                 |  45 +
>   target/loongarch/internals.h                  |  93 ++
>   target/loongarch/machine.c                    | 253 +++++
>   target/loongarch/meson.build                  |  10 +
>   target/loongarch/op_helper.c                  |  77 +-
>   target/loongarch/ramdisk                      | Bin 0 -> 3077952 bytes
>   target/loongarch/stabletimer.c                |  71 ++
>   target/loongarch/tlb_helper.c                 | 918 ++++++++++++++++++
>   target/loongarch/translate.c                  |   8 +-
>   target/loongarch/vmlinux                      | Bin 0 -> 24565536 bytes

Well, it might not be exactly nice to add ~30MiB of blob right here, via 
mailing list? IIUC everyone here can only see 17 of your 31 patches, 
maybe the blob-containing mail and subsequent ones all got blocked?

And perhaps it's not okay to put blobs inside target/ in the first 
place, a quick `tree` look at main branch reveals no such file. You may 
host these blobs (better yet, properly open-sourced repos) elsewhere and 
link to them in README instead.

>   64 files changed, 7955 insertions(+), 13 deletions(-)
>   create mode 100644 configs/devices/loongarch64-softmmu/default.mak
>   create mode 100644 configs/targets/loongarch64-softmmu.mak
>   create mode 100644 gdb-xml/loongarch-base64.xml
>   create mode 100644 gdb-xml/loongarch-fpu64.xml
>   create mode 100644 hw/acpi/ls7a.c
>   create mode 100644 hw/intc/loongarch_extioi.c
>   create mode 100644 hw/intc/loongarch_pch_msi.c
>   create mode 100644 hw/intc/loongarch_pch_pic.c
>   create mode 100644 hw/loongarch/Kconfig
>   create mode 100644 hw/loongarch/acpi-build.c
>   create mode 100644 hw/loongarch/fw_cfg.c
>   create mode 100644 hw/loongarch/fw_cfg.h
>   create mode 100644 hw/loongarch/ipi.c
>   create mode 100644 hw/loongarch/loongarch_int.c
>   create mode 100644 hw/loongarch/ls3a5000_virt.c
>   create mode 100644 hw/loongarch/meson.build
>   create mode 100644 hw/pci-host/ls7a.c
>   create mode 100644 hw/rtc/ls7a_rtc.c
While I haven't seen the entirety of the series, these files got created 
but MAINTAINERS is not updated. Please update the corresponding entries.
>   create mode 100644 include/hw/acpi/ls7a.h
>   create mode 100644 include/hw/intc/loongarch_extioi.h
>   create mode 100644 include/hw/intc/loongarch_pch_msi.h
>   create mode 100644 include/hw/intc/loongarch_pch_pic.h
>   create mode 100644 include/hw/loongarch/gipi.h
>   create mode 100644 include/hw/loongarch/loongarch.h
>   create mode 100644 include/hw/pci-host/ls7a.h
>   create mode 100644 pc-bios/loongarch_bios.bin
>   create mode 100644 target/loongarch/Kconfig
>   create mode 100644 target/loongarch/cpu-csr.h
>   create mode 100644 target/loongarch/csr_helper.c
>   create mode 100644 target/loongarch/gdbstub.c
>   create mode 100644 target/loongarch/insn_trans/trans_core.c
>   create mode 100644 target/loongarch/machine.c
>   create mode 100644 target/loongarch/ramdisk
>   create mode 100644 target/loongarch/stabletimer.c
>   create mode 100644 target/loongarch/tlb_helper.c
>   create mode 100755 target/loongarch/vmlinux
>

