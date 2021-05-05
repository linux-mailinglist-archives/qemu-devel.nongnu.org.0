Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 185CE374BD9
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:24:52 +0200 (CEST)
Received: from localhost ([::1]:41422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leQst-0008Cs-3S
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQrT-0006f7-QJ
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:23:23 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:42173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQrQ-00007A-Q5
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:23:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257000; x=1651793000;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6++zvjbJQozC25SqViaLfHSNQpB4Sq2jI4e9fwf7TP4=;
 b=i6OwVnZDiEv65EUMfVXcj3JqyWibPgu+ayw3ZPCwGd4Uuc/ENCFUOJxX
 2C/aeCdEBr9E28Gr+daQ2ri+uudVrkdbQaOuuDqwEiuZMNWBCBUcE+1My
 j6gI0PNLxyztg+o42/czz8hdFR7/9A4f0U78sKINpaCorBWgUTX62rJFU
 msDs6vYYl58fWuLPxrf7ZqtRab9gTE2g2VxF8EFFZReTraJl9O/d/oLkF
 JjerAuTd+zPqNfWu1wnO+UJpDiXrIywF9vrgmlH16tZPRIyJn1az2iJ4v
 0z0YkwEZIgP1ROsqMEyZFyP2kcPsWd5xRkEcN2/cI65TmlevIJ/pbxJHz w==;
IronPort-SDR: NtDmcwfe8+PwiIr8mn1VJuoeatEtI6p3SWRc00pGBdxNbidgj1oLcYBu0uL2o9rXLovMtqq6K8
 Iind5EI+/v9jcDOzsCfZXdv6aFVrGl8n5uChsc/fnvBOdvbvk6k2kMa1U3ghduzNEta4iFemhz
 x9gcyKp1iIsRnFd+oDB/91iTPrayD+GTtPaaStg4B/SQ9iAWJarlIEYzIT7SS1SQ8KCbZqbrZ0
 x0AEp/yOwskZ197pqWkOT4wQ6CaCx57y7+S5aD0ci7x5py1gM0aSZEHocz4w46AE4nIF4ZNyda
 j8Q=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="278356857"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:23:16 +0800
IronPort-SDR: 23XPyANv7atd3tKDu1ZDmGQLthIOZQA9qP2ST6MRtgzlo0tx7APq1wGFkw2mQ20feRj3OLaCAT
 p3IapqJTqCimoXCWy9FkN04PfgN1led8Wmx73PEKFkBonk/dJquWfypDiM+c9p5n6PttmiqrXg
 C+iwy1Yl2wO0VTsIgCv3l4Di9+Aih5d/z2deVdzpaFjRFKhMZ5E+RAD04HMsbUocCS3CStNFHR
 iTKqlTZnVFKoynQX5kVMfdxUG+gh2YyEaz2/UiS6V4I/nXcNhPoE2BdvecKsVKPjKl+15b+W6a
 v3VB/stl8H9k857fXITDDII0
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:01:57 -0700
IronPort-SDR: OjDoi+At+qBsW5OeD8Akv0mTSVg+gMSRVM6u1wdJK6XLg4OJ7RIdOie9Efo6ilZrjLxY6NUvgm
 qEL74cEei82yLTLd3zTyUkfkm4xDwKY6l9FBP3Mo0JkH9spGWTN5EuaySQmSXs74JWPFaZIj/d
 ldCi5XjLZQLgQwMznypuE5u+AHo5wb6kaFbKnp4rf7OtcR1xmQ4zXmqCV5dHwvaQy3VElOAgas
 Bub5D20k6dC52YUu/NGQ4SjCHQ6hTqLdrfrnevurv9I79mIvFw85cwTN5RP30uK7rs6nKU3QG4
 xCE=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:23:14 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 00/42] riscv-to-apply queue
Date: Thu,  6 May 2021 09:22:30 +1000
Message-Id: <20210505232312.4175486-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit d45a5270d075ea589f0b0ddcf963a5fea1f500ac:

  Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6.1-pull-request' into staging (2021-05-05 13:52:00 +0100)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210506

for you to fetch changes up to d9e1a4683bc52ff218dcc133f73017bc4c496346:

  target/riscv: Fix the RV64H decode comment (2021-05-06 08:59:59 +1000)

----------------------------------------------------------------
A large collection of RISC-V fixes, improvements and features

 - Clenaup some left over v1.9 code
 - Documentation improvements
 - Support for the shakti_c machine
 - Internal cleanup of the CSR accesses
 - Updates to the OpenTitan platform
 - Support for the virtio-vga
 - Fix for the saturate subtract in vector extensions
 - Experimental support for the ePMP spec
 - A range of other internal code cleanups and bug fixes

----------------------------------------------------------------
Alexander Wagner (1):
      hw/riscv: Fix OT IBEX reset vector

Alistair Francis (22):
      target/riscv: Convert the RISC-V exceptions to an enum
      target/riscv: Use the RISCVException enum for CSR predicates
      target/riscv: Fix 32-bit HS mode access permissions
      target/riscv: Use the RISCVException enum for CSR operations
      target/riscv: Use RISCVException enum for CSR access
      MAINTAINERS: Update the RISC-V CPU Maintainers
      hw/opentitan: Update the interrupt layout
      hw/riscv: Enable VIRTIO_VGA for RISC-V virt machine
      target/riscv: Fix the PMP is locked check when using TOR
      target/riscv: Add the ePMP feature
      target/riscv/pmp: Remove outdated comment
      target/riscv: Add ePMP support for the Ibex CPU
      target/riscv: Remove the hardcoded RVXLEN macro
      target/riscv: Remove the hardcoded SSTATUS_SD macro
      target/riscv: Remove the hardcoded HGATP_MODE macro
      target/riscv: Remove the hardcoded MSTATUS_SD macro
      target/riscv: Remove the hardcoded SATP_MODE macro
      target/riscv: Remove the unused HSTATUS_WPRI macro
      target/riscv: Remove an unused CASE_OP_32_64 macro
      target/riscv: Consolidate RV32/64 32-bit instructions
      target/riscv: Consolidate RV32/64 16-bit instructions
      target/riscv: Fix the RV64H decode comment

Atish Patra (1):
      target/riscv: Remove privilege v1.9 specific CSR related code

Axel Heider (1):
      docs/system/generic-loader.rst: Fix style

Bin Meng (1):
      hw/riscv: sifive_e: Add 'const' to sifive_e_memmap[]

Dylan Jhong (1):
      target/riscv: Align the data type of reset vector address

Emmanuel Blot (2):
      target/riscv: fix exception index on instruction access fault
      target/riscv: fix a typo with interrupt names

Frank Chang (2):
      target/riscv: fix vrgather macro index variable type bug
      fpu/softfloat: set invalid excp flag for RISC-V muladd instructions

Hou Weiying (4):
      target/riscv: Define ePMP mseccfg
      target/riscv: Add ePMP CSR access functions
      target/riscv: Implementation of enhanced PMP (ePMP)
      target/riscv: Add a config option for ePMP

Jade Fink (1):
      riscv: don't look at SUM when accessing memory from a debugger context

LIU Zhiwei (1):
      target/riscv: Fixup saturate subtract function

Vijai Kumar K (5):
      target/riscv: Add Shakti C class CPU
      riscv: Add initial support for Shakti C machine
      hw/char: Add Shakti UART emulation
      hw/riscv: Connect Shakti UART to Shakti platform
      docs: Add documentation for shakti_c machine

 docs/system/generic-loader.rst              |   9 +-
 docs/system/riscv/shakti-c.rst              |  82 +++
 docs/system/target-riscv.rst                |   1 +
 default-configs/devices/riscv64-softmmu.mak |   1 +
 include/hw/char/shakti_uart.h               |  74 +++
 include/hw/riscv/opentitan.h                |  16 +-
 include/hw/riscv/shakti_c.h                 |  75 +++
 target/riscv/cpu.h                          |  42 +-
 target/riscv/cpu_bits.h                     | 114 +---
 target/riscv/helper.h                       |  18 +-
 target/riscv/pmp.h                          |  14 +
 target/riscv/insn16-32.decode               |  28 -
 target/riscv/insn16-64.decode               |  36 --
 target/riscv/insn16.decode                  |  30 +
 target/riscv/insn32-64.decode               |  88 ---
 target/riscv/insn32.decode                  |  67 ++-
 hw/char/shakti_uart.c                       | 185 +++++++
 hw/intc/ibex_plic.c                         |  20 +-
 hw/riscv/opentitan.c                        |  10 +-
 hw/riscv/shakti_c.c                         | 178 ++++++
 hw/riscv/sifive_e.c                         |   2 +-
 target/riscv/cpu.c                          |  26 +-
 target/riscv/cpu_helper.c                   |  88 ++-
 target/riscv/csr.c                          | 824 +++++++++++++++++-----------
 target/riscv/fpu_helper.c                   |  16 +-
 target/riscv/gdbstub.c                      |   8 +-
 target/riscv/machine.c                      |   8 +-
 target/riscv/monitor.c                      |  22 +-
 target/riscv/op_helper.c                    |  18 +-
 target/riscv/pmp.c                          | 218 +++++++-
 target/riscv/translate.c                    |  38 +-
 target/riscv/vector_helper.c                |  18 +-
 fpu/softfloat-specialize.c.inc              |   6 +
 target/riscv/insn_trans/trans_rva.c.inc     |  14 +-
 target/riscv/insn_trans/trans_rvd.c.inc     |  17 +-
 target/riscv/insn_trans/trans_rvf.c.inc     |   6 +-
 target/riscv/insn_trans/trans_rvh.c.inc     |   8 +-
 target/riscv/insn_trans/trans_rvi.c.inc     |  22 +-
 target/riscv/insn_trans/trans_rvm.c.inc     |  12 +-
 target/riscv/insn_trans/trans_rvv.c.inc     |  39 +-
 MAINTAINERS                                 |  14 +-
 hw/char/meson.build                         |   1 +
 hw/char/trace-events                        |   4 +
 hw/riscv/Kconfig                            |  11 +
 hw/riscv/meson.build                        |   1 +
 target/riscv/meson.build                    |  13 +-
 target/riscv/trace-events                   |   3 +
 47 files changed, 1756 insertions(+), 789 deletions(-)
 create mode 100644 docs/system/riscv/shakti-c.rst
 create mode 100644 include/hw/char/shakti_uart.h
 create mode 100644 include/hw/riscv/shakti_c.h
 delete mode 100644 target/riscv/insn16-32.decode
 delete mode 100644 target/riscv/insn16-64.decode
 delete mode 100644 target/riscv/insn32-64.decode
 create mode 100644 hw/char/shakti_uart.c
 create mode 100644 hw/riscv/shakti_c.c

