Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7E84959C3
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 07:10:44 +0100 (CET)
Received: from localhost ([::1]:60714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAn8D-0001ze-CM
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 01:10:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmwh-0006iR-N2
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:58:48 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:39366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmwc-0003zj-P7
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:58:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744723; x=1674280723;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5MapX0QCYFnXAHavQr90sM8eKhnbCSbOHFiK3mzXSKQ=;
 b=lV0nuKMdcmBlJsd1e7rtwIFKomWWsHrcjxpG4bGx3f4QUH7TceaXFkvL
 q7jcLH/N3GUZYwvzNXJaHO0a0yrUx/E3HGi7cm8quvZnkhGWyYNt6Xv8e
 ZCb2d4wlNSixCcZAV7w3YN7easDXnoh2l5PTnsTEZ4QTgFC0mEqI8xOZ5
 1PFPK4Q790XrO7JrnA/4uWdtkdFMbTJ1Ux+WcwwO6nkeeVnXnxLW8QhC+
 QB04oxCOfwi+Jr3FkM5iw3KvvE7YZE2AomrdyL/n2igChJDMJ8jGj51uH
 lMnZoVoKlc3OaCUdKhAjPWzJ90Uhmz1FK2VfWPawxW7TpgnTwp3lre0Zk g==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="192026067"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 13:58:41 +0800
IronPort-SDR: JoqmY+2TqudKqTPbADq3rXww+SXkVE61IqO+/JU7i/jU51eZXRcx0T0x2+TzBYfCk7Mjo8prEj
 MfrjC7lmLHWn31sNYO7tM/ifo6i7OWYCCymiOCKeZOB1Ga7Or1dYEwaihdjs/H56JpGVe95FL2
 ewM+QPqfZAhSuvcVWqRQmI7k90qk0+WWYGKxWiNDkoJbIZ0sB/0rjHWb+6Ukw47/fnJQjHGjy8
 GVaBAKURtPI9SegOMCfJw0OP/NgVQt5ckN8mBz20eKsP2e3GPWTGO/C7fH+AfCZ+Z1aPNht8jP
 NdVemb382RJO1bPXLZtD3mc1
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:30:51 -0800
IronPort-SDR: rSzHBeS0jQ1VoeWGil0muIvAWDtJ0469iNaKqBgw0P0syEvpAtxLNTB8KPEzUCgNySUP/NbPtC
 5TzQgqIxuUOh2UCUkazYYLpNlpHRSp4cEzPj0nQJU61Z9y5TUSYqIVIfbjSzzzXjlBwY9Yd6xx
 irP+B2U2xFIfPvEP4NXN7IzvDRMXpl5PVdoVOzIKykAguXJRBpvfWj/kqehhAEM6Tm07sIjbUa
 Fv0xCMR4/0aHmSuJoJnyEuZbUp9UQM95PgJGokPrWO/n5K0QFAOfmcmXcBTTG8h5m9l+ZLgOLA
 BhI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:58:40 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7wc2sg8z1SVnx
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 21:58:40 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1642744719; x=1645336720; bh=5MapX0QCYFnXAHavQr90sM8eKhnbCSbO
 HFiK3mzXSKQ=; b=L9m5+wu3Gkr9cDR6qks/FOVIpzxzbobO3PswDw1CjcqWjABV
 4bD2YzBz91STSc4nx0ii19oZTarP9qXLwMYoT3CdTVKUI1Pyi76fUhUHnED9nSDQ
 V9Xz5hgPabO42WC050RfDq+8s/13hw3wOSQntS8EW2ZpzvZagY5vKm6RDK5dpIHg
 UKHZfxAry2GL2UIScgg2QD2Sd+IN5DXRIvHMIAwRwcXNRNOlsCL9a5KAicYSCnAb
 YIEz4lMKvS40GLw0XM8T1Grdj+dtUvHPDwbnKBpfq4w/BXVGwl8vOvM6mN/KAQl8
 VMbxVSWGYIsaRvu7lryz3ZRz6jKK+Ph5xvNMOw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id wUE6RUd5Cc0o for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 21:58:39 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7wY3Rf6z1RvlN;
 Thu, 20 Jan 2022 21:58:36 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 00/61] riscv-to-apply queue
Date: Fri, 21 Jan 2022 15:57:29 +1000
Message-Id: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Alistair Francis <alistair.francis@wdc.com>

The following changes since commit 2c89b5af5e72ab8c9d544c6e30399528b22388=
27:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-202=
20120-1' into staging (2022-01-20 16:13:17 +0000)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220121-1

for you to fetch changes up to f297245f6a780f496fb171af6fcd21ff3e6783c3:

  target/riscv: Relax UXL field for debugging (2022-01-21 15:52:57 +1000)

----------------------------------------------------------------
Third RISC-V PR for QEMU 7.0

 * Fixes for OpenTitan timer
 * Correction of OpenTitan PLIC stride length
 * RISC-V KVM support
 * Device tree code cleanup
 * Support for the Zve64f and Zve32f extensions
 * OpenSBI binary loading support for the Spike machine
 * Removal of OpenSBI ELFs
 * Support for the UXL field in xstatus

----------------------------------------------------------------
Anup Patel (3):
      hw/riscv: spike: Allow using binary firmware as bios
      hw/riscv: Remove macros for ELF BIOS image names
      roms/opensbi: Remove ELF images

Frank Chang (17):
      target/riscv: rvv-1.0: Add Zve64f extension into RISC-V
      target/riscv: rvv-1.0: Add Zve64f support for configuration insns
      target/riscv: rvv-1.0: Add Zve64f support for load and store insns
      target/riscv: rvv-1.0: Add Zve64f support for vmulh variant insns
      target/riscv: rvv-1.0: Add Zve64f support for vsmul.vv and vsmul.vx=
 insns
      target/riscv: rvv-1.0: Add Zve64f support for scalar fp insns
      target/riscv: rvv-1.0: Add Zve64f support for single-width fp reduc=
tion insns
      target/riscv: rvv-1.0: Add Zve64f support for widening type-convert=
 insns
      target/riscv: rvv-1.0: Add Zve64f support for narrowing type-conver=
t insns
      target/riscv: rvv-1.0: Allow Zve64f extension to be turned on
      target/riscv: rvv-1.0: Add Zve32f extension into RISC-V
      target/riscv: rvv-1.0: Add Zve32f support for configuration insns
      target/riscv: rvv-1.0: Add Zve32f support for scalar fp insns
      target/riscv: rvv-1.0: Add Zve32f support for single-width fp reduc=
tion insns
      target/riscv: rvv-1.0: Add Zve32f support for widening type-convert=
 insns
      target/riscv: rvv-1.0: Add Zve32f support for narrowing type-conver=
t insns
      target/riscv: rvv-1.0: Allow Zve32f extension to be turned on

LIU Zhiwei (23):
      target/riscv: Adjust pmpcfg access with mxl
      target/riscv: Don't save pc when exception return
      target/riscv: Sign extend link reg for jal and jalr
      target/riscv: Sign extend pc for different XLEN
      target/riscv: Create xl field in env
      target/riscv: Ignore the pc bits above XLEN
      target/riscv: Extend pc for runtime pc write
      target/riscv: Use gdb xml according to max mxlen
      target/riscv: Relax debug check for pm write
      target/riscv: Adjust csr write mask with XLEN
      target/riscv: Create current pm fields in env
      target/riscv: Alloc tcg global for cur_pm[mask|base]
      target/riscv: Calculate address according to XLEN
      target/riscv: Split pm_enabled into mask and base
      target/riscv: Split out the vill from vtype
      target/riscv: Adjust vsetvl according to XLEN
      target/riscv: Remove VILL field in VTYPE
      target/riscv: Fix check range for first fault only
      target/riscv: Adjust vector address with mask
      target/riscv: Adjust scalar reg in vector with XLEN
      target/riscv: Set default XLEN for hypervisor
      target/riscv: Enable uxl field write
      target/riscv: Relax UXL field for debugging

Thomas Huth (1):
      softmmu/device_tree: Silence compiler warning with --enable-sanitiz=
ers

Wilfred Mallawa (3):
      hw: timer: ibex_timer: Fixup reading w/o register
      riscv: opentitan: fixup plic stride len
      hw: timer: ibex_timer: update/add reg address

Yanan Wang (1):
      softmmu/device_tree: Remove redundant pointer assignment

Yifei Jiang (13):
      update-linux-headers: Add asm-riscv/kvm.h
      target/riscv: Add target/riscv/kvm.c to place the public kvm interf=
ace
      target/riscv: Implement function kvm_arch_init_vcpu
      target/riscv: Implement kvm_arch_get_registers
      target/riscv: Implement kvm_arch_put_registers
      target/riscv: Support start kernel directly by KVM
      target/riscv: Support setting external interrupt by KVM
      target/riscv: Handle KVM_EXIT_RISCV_SBI exit
      target/riscv: Add host cpu type
      target/riscv: Add kvm_riscv_get/put_regs_timer
      target/riscv: Implement virtual time adjusting with vm state changi=
ng
      target/riscv: Support virtual time context synchronization
      target/riscv: enable riscv kvm accel

 meson.build                                    |   2 +
 include/hw/char/riscv_htif.h                   |   5 +-
 include/hw/riscv/boot.h                        |   3 +-
 include/hw/riscv/spike.h                       |   1 +
 include/hw/timer/ibex_timer.h                  |   1 -
 linux-headers/asm-riscv/kvm.h                  | 128 ++++++
 target/riscv/cpu.h                             |  58 ++-
 target/riscv/cpu_bits.h                        |   3 +
 target/riscv/helper.h                          |   4 +-
 target/riscv/kvm_riscv.h                       |  25 ++
 target/riscv/sbi_ecall_interface.h             |  72 ++++
 hw/char/riscv_htif.c                           |  33 +-
 hw/intc/sifive_plic.c                          |  20 +-
 hw/riscv/boot.c                                |  16 +-
 hw/riscv/opentitan.c                           |   2 +-
 hw/riscv/spike.c                               |  45 ++-
 hw/riscv/virt.c                                |  83 ++--
 hw/timer/ibex_timer.c                          |  25 +-
 softmmu/device_tree.c                          |  11 +-
 target/riscv/cpu.c                             |  77 +++-
 target/riscv/cpu_helper.c                      |  99 ++---
 target/riscv/csr.c                             |  90 ++++-
 target/riscv/gdbstub.c                         |  71 +++-
 target/riscv/kvm-stub.c                        |  30 ++
 target/riscv/kvm.c                             | 535 +++++++++++++++++++=
++++++
 target/riscv/machine.c                         |  46 ++-
 target/riscv/op_helper.c                       |   7 +-
 target/riscv/pmp.c                             |  12 +-
 target/riscv/translate.c                       |  94 +++--
 target/riscv/vector_helper.c                   |  39 +-
 target/riscv/insn_trans/trans_privileged.c.inc |   9 +-
 target/riscv/insn_trans/trans_rva.c.inc        |   9 +-
 target/riscv/insn_trans/trans_rvd.c.inc        |  19 +-
 target/riscv/insn_trans/trans_rvf.c.inc        |  19 +-
 target/riscv/insn_trans/trans_rvi.c.inc        |  39 +-
 target/riscv/insn_trans/trans_rvv.c.inc        | 225 +++++++++--
 .gitlab-ci.d/opensbi.yml                       |   2 -
 pc-bios/meson.build                            |   2 -
 pc-bios/opensbi-riscv32-generic-fw_dynamic.elf | Bin 838904 -> 0 bytes
 pc-bios/opensbi-riscv64-generic-fw_dynamic.elf | Bin 934696 -> 0 bytes
 roms/Makefile                                  |   2 -
 target/riscv/meson.build                       |   1 +
 42 files changed, 1608 insertions(+), 356 deletions(-)
 create mode 100644 linux-headers/asm-riscv/kvm.h
 create mode 100644 target/riscv/kvm_riscv.h
 create mode 100644 target/riscv/sbi_ecall_interface.h
 create mode 100644 target/riscv/kvm-stub.c
 create mode 100644 target/riscv/kvm.c
 delete mode 100644 pc-bios/opensbi-riscv32-generic-fw_dynamic.elf
 delete mode 100644 pc-bios/opensbi-riscv64-generic-fw_dynamic.elf

