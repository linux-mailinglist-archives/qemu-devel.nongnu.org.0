Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93B05AFF45
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 10:37:34 +0200 (CEST)
Received: from localhost ([::1]:34662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVqYu-0008Tj-UO
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 04:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq2r-0003c5-Ih
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:04:31 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq2n-0004Nn-4Q
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:04:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537860; x=1694073860;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eyV8L1v2CxgPavbXe85JeoWwoqmZPHcuYsPnMprMtsw=;
 b=Mu5SfQNb1RT1QSVFdIjZhJaYAyIHgC+eYKJf8giDS4maOXJZTsE2bs7r
 aN+liarTxajYvNWm4v08w0PnTMi5XCZDdk0RF1M+shr6r+yWrAAxbc4Jb
 TcsuTol7j7qLPkXJxo+vskaW0nuh7BX1MZrFg/nk+09pAnJmyKOVvYkO0
 MwWbyb3jTih+kuOxoDdCKEyRUSttRTVGW3VmuJlvk29Ik/+AqIqhfCIPg
 RVRPxVMQKxBpbs2POVxidyUy0EmY25KCGk4IvKMjREaw0Oo30PMNQgP9Z
 2kPy8/CtJWrQzV7WgJ24EALoNdCmDutOA0Qv1sJbRP8UAfVHyh+bitjIb w==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210714904"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:04:03 +0800
IronPort-SDR: TJliVQE5flL/EAd0nGuJ5tde961WKZ4Q1/cbSUtNlspnCTyQMCQj+xXam7Ur8UmevydPSBYCxe
 vEvIhKYNeeXpUKesWn1ghzs3q+kmwdUnhvGSpUS5L60aaDq10qK+pLubdZEtnrQYp2hTnNyZfb
 jWERGGk7nTMxhbDxgo795HhgEBtl7wE1hWQNgslLrq1SmC2ynRZhIB3B8XkFNgIaqZvHg57UMS
 gs2ocJZszvoUXvokcqOvX5h1Rf5nbxmZQUQkVj6+0d/aza3Swr7eeL4AMjczuTb4skRKzO3HAS
 qP5w7xR1uaFf07zIXqIMG43z
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:19:01 -0700
IronPort-SDR: M8SafYAQbK9Au5zvoTbHVGhDrFyA5g9fEOJjgjZCAllX9q64gxg0WQtU45uqvsrjMNeMgmIcWN
 QVPogwCj2SUamfyOUra2NT/DL1P9nB+S7fpiFoIfqje9Ka9TBBr6nhuXt7YxjwP9Z2nV4T35cF
 VYk+GEULGzooLhqXK26aS97khzQ8njrJ36y78Tbo4zc3oyhVMULcg3DkZxLqRthV6nBKofU/Tq
 S8K4NMaiKWaceKnYu2ZuDwrhbonvM45mzPNnkBaITLJcKjbpuOvvMypjCvlX8QqW1tiVEjdNph
 D8E=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:04:03 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 00/44] riscv-to-apply queue
Date: Wed,  7 Sep 2022 10:03:09 +0200
Message-Id: <20220907080353.111926-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=242877ce7=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
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
Reply-to:  Alistair Francis <alistair.francis@wdc.com>
From:  Alistair Francis via <qemu-devel@nongnu.org>

The following changes since commit 946e9bccf12f2bcc3ca471b820738fb22d14fc80:

  Merge tag 'samuel-thibault' of https://people.debian.org/~sthibault/qemu into staging (2022-09-06 08:31:24 -0400)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220907

for you to fetch changes up to f0551560b5c01b1dcbed1ac46ca0bd1155330f5f:

  target/riscv: Update the privilege field for sscofpmf CSRs (2022-09-07 09:19:15 +0200)

----------------------------------------------------------------
First RISC-V PR for QEMU 7.2

* Update [m|h]tinst CSR in interrupt handling
* Force disable extensions if priv spec version does not match
* fix shifts shamt value for rv128c
* move zmmul out of the experimental
* virt: pass random seed to fdt
* Add checks for supported extension combinations
* Upgrade OpenSBI to v1.1
* Fix typo and restore Pointer Masking functionality for RISC-V
* Add mask agnostic behaviour (rvv_ma_all_1s) for vector extension
* Add Zihintpause support
* opentitan: bump opentitan version
* microchip_pfsoc: fix kernel panics due to missing peripherals
* Remove additional priv version check for mcountinhibit
* virt machine device tree improvements
* Add xicondops in ISA entry
* Use official extension names for AIA CSRs

----------------------------------------------------------------
Alexey Baturo (1):
      target/riscv: Fix typo and restore Pointer Masking functionality for RISC-V

Anup Patel (3):
      target/riscv: Update [m|h]tinst CSR in riscv_cpu_do_interrupt()
      target/riscv: Force disable extensions if priv spec version does not match
      target/riscv: Use official extension names for AIA CSRs

Atish Patra (9):
      target/riscv: Remove additional priv version check for mcountinhibit
      hw/intc: Move mtimer/mtimecmp to aclint
      target/riscv: Add stimecmp support
      target/riscv: Add vstimecmp support
      target/riscv: Add sscofpmf extension support
      target/riscv: Simplify counter predicate function
      target/riscv: Add few cache related PMU events
      hw/riscv: virt: Add PMU DT node to the device tree
      target/riscv: Update the privilege field for sscofpmf CSRs

Bin Meng (2):
      roms/opensbi: Upgrade from v1.0 to v1.1
      docs: List kvm as a supported accelerator on RISC-V

Conor Dooley (5):
      hw/riscv: microchip_pfsoc: fix kernel panics due to missing peripherals
      hw/riscv: virt: fix uart node name
      hw/riscv: virt: fix the plic's address cells
      hw/riscv: virt: fix syscon subnode paths
      hw/core: fix platform bus node name

Daniel Henrique Barboza (1):
      hw/riscv: remove 'fdt' param from riscv_setup_rom_reset_vec()

Dao Lu (1):
      target/riscv: Add Zihintpause support

Frédéric Pétrot (1):
      target/riscv: fix shifts shamt value for rv128c

Jason A. Donenfeld (1):
      hw/riscv: virt: pass random seed to fdt

Rahul Pathak (1):
      target/riscv: Add xicondops in ISA entry

Weiwei Li (8):
      target/riscv: move zmmul out of the experimental properties
      target/riscv: Add check for supported privilege mode combinations
      target/riscv: H extension depends on I extension
      target/riscv: Fix checkpatch warning may triggered in csr_ops table
      target/riscv: Add check for csrs existed with U extension
      target/riscv: Fix checks in hmode/hmode32
      target/riscv: Simplify the check in hmode to reuse the check in riscv_csrrw_check
      target/riscv: Fix priority of csr related check in riscv_csrrw_check

Wilfred Mallawa (1):
      hw/riscv: opentitan: bump opentitan version

Yueh-Ting (eop) Chen (9):
      target/riscv: rvv: Add mask agnostic for vv instructions
      target/riscv: rvv: Add mask agnostic for vector load / store instructions
      target/riscv: rvv: Add mask agnostic for vx instructions
      target/riscv: rvv: Add mask agnostic for vector integer shift instructions
      target/riscv: rvv: Add mask agnostic for vector integer comparison instructions
      target/riscv: rvv: Add mask agnostic for vector fix-point arithmetic instructions
      target/riscv: rvv: Add mask agnostic for vector floating-point instructions
      target/riscv: rvv: Add mask agnostic for vector mask instructions
      target/riscv: rvv: Add mask agnostic for vector permutation instructions

eopXD (1):
      target/riscv: rvv: Add option 'rvv_ma_all_1s' to enable optional mask agnostic behavior

 docs/about/build-platforms.rst                 |    2 +-
 include/hw/intc/riscv_aclint.h                 |    2 +
 include/hw/riscv/boot.h                        |    2 +-
 include/hw/riscv/microchip_pfsoc.h             |   14 +-
 include/hw/riscv/opentitan.h                   |   11 +-
 include/hw/riscv/virt.h                        |    1 +
 include/hw/timer/ibex_timer.h                  |    2 +
 target/riscv/cpu.h                             |   48 +-
 target/riscv/cpu_bits.h                        |   63 ++
 target/riscv/instmap.h                         |   45 +
 target/riscv/internals.h                       |    5 +-
 target/riscv/pmu.h                             |    8 +
 target/riscv/time_helper.h                     |   30 +
 target/riscv/insn16.decode                     |    7 +-
 target/riscv/insn32.decode                     |    7 +-
 disas/riscv.c                                  |   27 +-
 hw/core/sysbus-fdt.c                           |    2 +-
 hw/intc/riscv_aclint.c                         |   48 +-
 hw/intc/riscv_imsic.c                          |    4 +-
 hw/riscv/boot.c                                |    4 +-
 hw/riscv/microchip_pfsoc.c                     |   69 +-
 hw/riscv/opentitan.c                           |   12 +-
 hw/riscv/shakti_c.c                            |    3 +-
 hw/riscv/spike.c                               |    2 +-
 hw/riscv/virt.c                                |   45 +-
 hw/timer/ibex_timer.c                          |   18 +-
 target/riscv/cpu.c                             |  204 +++--
 target/riscv/cpu_helper.c                      |  293 ++++++-
 target/riscv/csr.c                             | 1038 +++++++++++++++---------
 target/riscv/machine.c                         |    8 +-
 target/riscv/pmu.c                             |  425 +++++++++-
 target/riscv/time_helper.c                     |  114 +++
 target/riscv/translate.c                       |   24 +-
 target/riscv/vector_helper.c                   |  152 +++-
 target/riscv/insn_trans/trans_rvi.c.inc        |   16 +
 target/riscv/insn_trans/trans_rvv.c.inc        |   28 +
 pc-bios/opensbi-riscv32-generic-fw_dynamic.bin |  Bin 108504 -> 117704 bytes
 pc-bios/opensbi-riscv64-generic-fw_dynamic.bin |  Bin 105296 -> 115344 bytes
 roms/opensbi                                   |    2 +-
 target/riscv/meson.build                       |    3 +-
 40 files changed, 2229 insertions(+), 559 deletions(-)
 create mode 100644 target/riscv/time_helper.h
 create mode 100644 target/riscv/time_helper.c

