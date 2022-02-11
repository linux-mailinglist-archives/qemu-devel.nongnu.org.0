Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D41B34B31A8
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 01:06:51 +0100 (CET)
Received: from localhost ([::1]:34188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIfwA-0007Y7-LB
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 19:06:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfqd-0004jh-Oy
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:01:08 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:52990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfqX-00007w-Rr
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:01:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624061; x=1676160061;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p7dXbHrQpXaqM2jfjqjlzleGSHWtg37Fr7aFvypxCTI=;
 b=NGX8jlaOr/1jfYIcaNBCmBM0xuQ620+smVxywN7IZYyflBwten8+tAQX
 93Y2ZDWaPnPdBc6WpdaBAlyeQVzhxspVLtkSgBG6c9npecuu4giBMHlTk
 zmoJGS3vPDLcXu1dWVDdIVwjD3ePrw1rUwJVkLBx76VqsdtHRohVUX2LI
 IIQmwahG5B3g4nKvVxMSVbbqlSIWHzK9+kwksYLjBfLOT0XDAVhT5fpv3
 ta0Eq0GrRK/WhMhB7f9OD+5tUYF79d0Ni0Xi4pSDG2koiE9mL2DaqpKHP
 DybNIFoc9gJQOsqJw3NNBTl54OUgULkmcVpgsHrHV7vdu6g7Ncf3i8dNj A==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="304636163"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:00:56 +0800
IronPort-SDR: /amTb2UjGYpR9SuOyyr5jGLABsZ9ZrSNxDkjwyH3wuaJzRmfU2dLkDeU5wGEkX072g8GWFyDSV
 8ZNwuQWNNDPhWyp+7cMzw24RXi/9Wl/67RYYx0N5DbRDxLNBZizK+o9Sbn+7QoqvnaxMc2bjaq
 0XoUbddPU0sn2RdtaXSWVl5nm/u5v4UoRE8rl5yUx7BHx4DWce8UEccNtXvyT6pwHpk2U2kuo+
 WMNxEFTwh4WVF9fAURmwsdHxFDXwCjYiNyeynxE8Igbp1vXhgM94bfgkbjCaSgW3UCZrG+R6ue
 gXpExGna5wOTMo7mwhC2k7Kn
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:33:51 -0800
IronPort-SDR: yoR5Pqtw8WCMMe8S+bxiCTtLo7BoU3OiCx+sRIEl8YnzkOFNQvEIP9cUCpxB+A1n4vdqOiXG6G
 ialRJNnLBWJY5bhHdckufCb+ObbEfvd/qLyPagXKmQDWshN0EiCLRfzmSo5ri4Hhxu1Iw8KGpp
 Q/JJR1T0V2fnm0Bv6+IQrzGr1EXq7KnXGYeYmtrmJPux6gjy73hEwAVGTzrBt1nemIrWsy+dLa
 o1If9psKlBZZV5j8PivLQ3or5ExpjIYifYWmIsS5lGDoUmR6fu8g/vIA0NbhppzwBzK6/Wqwqi
 MMo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:00:56 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwVxh4YBdz1SHwl
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:00:56 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1644624056; x=1647216057; bh=p7dXbHrQpXaqM2jfjqjlzleGSHWtg37F
 r7aFvypxCTI=; b=brJvaE9gjyC3BrJgR70Z5MWUiBG3QpdMLrBEPLYVobTmZ4K1
 goEK/dQiVXJzoq0Q1ZEJr9e7oi3cqE7B5Rpyc3FvPsiZ4Xk0jRfXHcTNCz8nI2Ez
 fdD9lz5VwwAGjAPIYiNqtR51Rmm28njV37UbWgBLWZRPSPIzDSEQtP87ie5ETqt9
 KZXVMBtG3rzMhDoy6kGqvytm3XlDvkN7U4eZBWpuuAMPQvuoOG1JaJ8L8lvKbbJo
 MVwfgtDZahPu00FM976tES0glr0e78j0HP58Ar3IsoA+jVsUi529Qj6A11u4sRei
 5f4RHzDI/OEKmB9M20gBDDw6yWRBoaYBqdcN5Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id IYDFG4deDJcS for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:00:56 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwVxd2y38z1Rwrw;
 Fri, 11 Feb 2022 16:00:52 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 00/40] riscv-to-apply queue
Date: Sat, 12 Feb 2022 09:59:51 +1000
Message-Id: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

From: Alistair Francis <alistair.francis@wdc.com>

The following changes since commit 0a301624c2f4ced3331ffd5bce85b4274fe132=
af:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-202=
20208' into staging (2022-02-08 11:40:08 +0000)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220212

for you to fetch changes up to 31d69b66ed89fa0f66d4e5a15e9664c92c3ed8f8:

  docs/system: riscv: Update description of CPU (2022-02-11 18:31:29 +100=
0)

----------------------------------------------------------------
Fourth RISC-V PR for QEMU 7.0

 * Remove old Ibex PLIC header file
 * Allow writing 8 bytes with generic loader
 * Fixes for RV128
 * Refactor RISC-V CPU configs
 * Initial support for XVentanaCondOps custom extension
 * Fix for vill field in vtype
 * Fix trap cause for RV32 HS-mode CSR access from RV64 HS-mode
 * RISC-V AIA support for virt machine
 * Support for svnapot, svinval and svpbmt extensions

----------------------------------------------------------------
Anup Patel (23):
      target/riscv: Fix trap cause for RV32 HS-mode CSR access from RV64 =
HS-mode
      target/riscv: Implement SGEIP bit in hip and hie CSRs
      target/riscv: Implement hgeie and hgeip CSRs
      target/riscv: Improve delivery of guest external interrupts
      target/riscv: Allow setting CPU feature from machine/device emulati=
on
      target/riscv: Add AIA cpu feature
      target/riscv: Add defines for AIA CSRs
      target/riscv: Allow AIA device emulation to set ireg rmw callback
      target/riscv: Implement AIA local interrupt priorities
      target/riscv: Implement AIA CSRs for 64 local interrupts on RV32
      target/riscv: Implement AIA hvictl and hviprioX CSRs
      target/riscv: Implement AIA interrupt filtering CSRs
      target/riscv: Implement AIA mtopi, stopi, and vstopi CSRs
      target/riscv: Implement AIA xiselect and xireg CSRs
      target/riscv: Implement AIA IMSIC interface CSRs
      hw/riscv: virt: Use AIA INTC compatible string when available
      target/riscv: Allow users to force enable AIA CSRs in HART
      hw/intc: Add RISC-V AIA APLIC device emulation
      hw/riscv: virt: Add optional AIA APLIC support to virt machine
      hw/intc: Add RISC-V AIA IMSIC device emulation
      hw/riscv: virt: Add optional AIA IMSIC support to virt machine
      docs/system: riscv: Document AIA options for virt machine
      hw/riscv: virt: Increase maximum number of allowed CPUs

Fr=C3=A9d=C3=A9ric P=C3=A9trot (1):
      target/riscv: correct "code should not be reached" for x-rv128

Guo Ren (1):
      target/riscv: Ignore reserved bits in PTE for RV64

LIU Zhiwei (1):
      target/riscv: Fix vill field write in vtype

Petr Tesarik (1):
      Allow setting up to 8 bytes with the generic loader

Philipp Tomsich (7):
      target/riscv: refactor (anonymous struct) RISCVCPU.cfg into 'struct=
 RISCVCPUConfig'
      target/riscv: riscv_tr_init_disas_context: copy pointer-to-cfg into=
 cfg_ptr
      target/riscv: access configuration through cfg_ptr in DisasContext
      target/riscv: access cfg structure through DisasContext
      target/riscv: iterate over a table of decoders
      target/riscv: Add XVentanaCondOps custom extension
      target/riscv: add a MAINTAINERS entry for XVentanaCondOps

Weiwei Li (4):
      target/riscv: add PTE_A/PTE_D/PTE_U bits check for inner PTE
      target/riscv: add support for svnapot extension
      target/riscv: add support for svinval extension
      target/riscv: add support for svpbmt extension

Wilfred Mallawa (1):
      include: hw: remove ibex_plic.h

Yu Li (1):
      docs/system: riscv: Update description of CPU

 docs/system/riscv/virt.rst                         |   22 +-
 include/hw/intc/ibex_plic.h                        |   67 -
 include/hw/intc/riscv_aplic.h                      |   79 ++
 include/hw/intc/riscv_imsic.h                      |   68 ++
 include/hw/riscv/virt.h                            |   41 +-
 target/riscv/cpu.h                                 |  169 ++-
 target/riscv/cpu_bits.h                            |  129 ++
 target/riscv/XVentanaCondOps.decode                |   25 +
 target/riscv/insn32.decode                         |    7 +
 hw/core/generic-loader.c                           |    2 +-
 hw/intc/riscv_aplic.c                              |  978 ++++++++++++++=
+
 hw/intc/riscv_imsic.c                              |  448 +++++++
 hw/riscv/virt.c                                    |  712 +++++++++--
 target/riscv/cpu.c                                 |  113 +-
 target/riscv/cpu_helper.c                          |  377 +++++-
 target/riscv/csr.c                                 | 1282 ++++++++++++++=
++++--
 target/riscv/gdbstub.c                             |    3 +
 target/riscv/machine.c                             |   24 +-
 target/riscv/translate.c                           |   61 +-
 target/riscv/vector_helper.c                       |    1 +
 target/riscv/insn_trans/trans_rvb.c.inc            |    8 +-
 target/riscv/insn_trans/trans_rvi.c.inc            |    2 +-
 target/riscv/insn_trans/trans_rvv.c.inc            |  146 ++-
 target/riscv/insn_trans/trans_rvzfh.c.inc          |    4 +-
 target/riscv/insn_trans/trans_svinval.c.inc        |   75 ++
 .../riscv/insn_trans/trans_xventanacondops.c.inc   |   39 +
 MAINTAINERS                                        |    7 +
 hw/intc/Kconfig                                    |    6 +
 hw/intc/meson.build                                |    2 +
 hw/riscv/Kconfig                                   |    2 +
 target/riscv/meson.build                           |    1 +
 31 files changed, 4409 insertions(+), 491 deletions(-)
 delete mode 100644 include/hw/intc/ibex_plic.h
 create mode 100644 include/hw/intc/riscv_aplic.h
 create mode 100644 include/hw/intc/riscv_imsic.h
 create mode 100644 target/riscv/XVentanaCondOps.decode
 create mode 100644 hw/intc/riscv_aplic.c
 create mode 100644 hw/intc/riscv_imsic.c
 create mode 100644 target/riscv/insn_trans/trans_svinval.c.inc
 create mode 100644 target/riscv/insn_trans/trans_xventanacondops.c.inc

