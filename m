Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2DE5097D4
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 08:43:08 +0200 (CEST)
Received: from localhost ([::1]:40192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhQWx-0000Q2-LQ
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 02:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQQy-0004lT-HK
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:36:56 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQQv-0007um-DG
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:36:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523013; x=1682059013;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bcjnGOYXyFDgcp+f/bhgYdOdLapZtSCwpGMeUwwvz6M=;
 b=GVh6BUe6BDwczzcOhADVgXi7lpZ73aIp4FE37lFYwMvXBTtNtQN/okwE
 C1SMaDC3Ht0M+JQNhcFeUigOlOqBC3f4ZjhKkNRcwrNWqA7DlBGBb6kLY
 ZPUqSWX+UqQ3vKQ6v5DHeUqYEj+oKyBpnUgbc2oti/cM97/dKrdiBRwFk
 hFyVBKbBLGsoYK93M+nu0OoOJiYjsONEKLnm9iOnppfECOqqsX+8NdrA8
 DNr44ueWXGuTJxoZXA4sriVwMbC2sxU7l03Nc7tg1bBzUXv6gyg1Xh7xt
 cDhXnGfsiPS+7UnCTx7H67hS07puXOp4a7qxvu4exscDCU1LcNZ1dei7x g==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302639916"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:36:49 +0800
IronPort-SDR: 2GyubKJhi/Vjqwa5J3M/wBu1t0bMpY4t/0ErZ/I6yWrHxvg2ChPxZFilCFGArRqzS9gH088/xW
 4AsjSZ4Npuqcg9XWSeosZOQp2IKim/nMt+LrXjhAokE+QjvbQ1BtSmGdsyXDUyYAxk+F5oFXVY
 6Z6VQdRK3WcRCtKMlFIBUIaV8p7DegFqUMkqbd8ViwfnLxe2DAcxg4ntIgyQj7WAVKkB6b5Lch
 2GhSgqUw6wdz1i+7u6Q7SFArv+B47LqVDl6ZN2JY+qtnIGC+jOwYm+vbADChouUQJZ3wLZiFKc
 k+oJ/9rq0QXNDbZFYZDBHM0b
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:07:51 -0700
IronPort-SDR: +g7fl7soAMRWz7sg59wt7N2gCriG5mubcrCI8eL4SZwIgPRygOMDAeHRhIsgvMAClJMdO3KJc+
 nc8HiMPMdfmADmY54X9RRUDNlgOK0r4R60K2InPqcMHzlg7vOfqmvYA31NaUJuYyzV4jpmzhje
 pyIu3JEKucRuyfTOMv/xdt/FxkRbHMpaU84BOhD5TptvRGliVQK4/Ymx2afIBnOPdONR+88PO0
 oi0cgjSyJMisEhgRZcfMpPYgk8elgPdY5Sx+0XhBaf2z/rYt5g7fXmaQnBixWNrn31K33sGpaR
 OvE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:36:49 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSW45kwbz1SHwl
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:36:48 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1650523007; x=1653115008; bh=bcjnGOYXyFDgcp+f/bhgYdOdLapZtSCw
 pGMeUwwvz6M=; b=er6DGb2f4Eg5+ZM9rWpstThRN7h9ynCzPA6DWp6YTGjlr5oa
 IME6qFAOhmffIGq3EKdFlDHYl7EaStbqSGtbRBZfyoMnfaC0v31NWlge0Eeq9Gn5
 IxWKwldrqkrhivuNqSAPl5S9dpjcu8l8zbBZBfKjs7H5XPva7kNTvn3eRQVBLURQ
 CkyqxREDOUjvzBD0N5S/WijVtsBKrY3f+Gm+7o8n0Z+ZSHXBu+AdSc8pi3MpglLn
 PsiXEoxicqrH0e+mu0WAbanpKM9wOY6uQ5PwcW7w2NvwlA1/cEGa7CMqYnd9MXiD
 QCBl1e7XXnIFmsy4zhvU+PiX8PShpwyLgFmALw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id U510VhNEiiQT for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:36:47 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSW216TZz1Rvlx;
 Wed, 20 Apr 2022 23:36:45 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 00/31] riscv-to-apply queue
Date: Thu, 21 Apr 2022 16:35:59 +1000
Message-Id: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=10363b772=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit 9c125d17e9402c232c46610802e5931b3639d7=
7b:

  Merge tag 'pull-tcg-20220420' of https://gitlab.com/rth7680/qemu into s=
taging (2022-04-20 16:43:11 -0700)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220421

for you to fetch changes up to e63e7b6cca93242a4d037610caba5626c980b990:

  hw/riscv: boot: Support 64bit fdt address. (2022-04-21 16:29:57 +1000)

----------------------------------------------------------------
First RISC-V PR for QEMU 7.1

 * Add support for Ibex SPI to OpenTitan
 * Add support for privileged spec version 1.12.0
 * Use privileged spec version 1.12.0 for virt machine by default
 * Allow software access to MIP SEIP
 * Add initial support for the Sdtrig extension
 * Optimisations for vector extensions
 * Improvements to the misa ISA string
 * Add isa extenstion strings to the device tree
 * Don't allow `-bios` options with KVM machines
 * Fix NAPOT range computation overflow
 * Fix DT property mmu-type when CPU mmu option is disabled
 * Make RISC-V ACLINT mtime MMIO register writable
 * Add and enable native debug feature
 * Support 64bit fdt address.

----------------------------------------------------------------
Alistair Francis (2):
      target/riscv: cpu: Fixup indentation
      target/riscv: Allow software access to MIP SEIP

Atish Patra (7):
      target/riscv: Define simpler privileged spec version numbering
      target/riscv: Add the privileged spec version 1.12.0
      target/riscv: Introduce privilege version field in the CSR ops.
      target/riscv: Add support for mconfigptr
      target/riscv: Add *envcfg* CSRs support
      target/riscv: Enable privileged spec version 1.12
      target/riscv: Add isa extenstion strings to the device tree

Bin Meng (7):
      target/riscv: Add initial support for the Sdtrig extension
      target/riscv: debug: Implement debug related TCGCPUOps
      target/riscv: cpu: Add a config option for native debug
      target/riscv: csr: Hook debug CSR read/write
      target/riscv: machine: Add debug state description
      target/riscv: cpu: Enable native debug feature
      hw/core: tcg-cpu-ops.h: Update comments of debug_check_watchpoint()

Dylan Jhong (1):
      hw/riscv: boot: Support 64bit fdt address.

Frank Chang (3):
      hw/intc: Add .impl.[min|max]_access_size declaration in RISC-V ACLI=
NT
      hw/intc: Support 32/64-bit mtimecmp and mtime accesses in RISC-V AC=
LINT
      hw/intc: Make RISC-V ACLINT mtime MMIO register writable

Jim Shu (1):
      hw/intc: riscv_aclint: Add reset function of ACLINT devices

Nicolas Pitre (1):
      target/riscv/pmp: fix NAPOT range computation overflow

Niklas Cassel (1):
      hw/riscv: virt: fix DT property mmu-type when CPU mmu option is dis=
abled

Ralf Ramsauer (1):
      hw/riscv: virt: Exit if the user provided -bios in combination with=
 KVM

Richard Henderson (1):
      target/riscv: Use cpu_loop_exit_restore directly from mmu faults

Tsukasa OI (1):
      target/riscv: misa to ISA string conversion fix

Weiwei Li (3):
      target/riscv: optimize condition assign for scale < 0
      target/riscv: optimize helper for vmv<nr>r.v
      target/riscv: fix start byte for vmv<nf>r.v when vstart !=3D 0

Wilfred Mallawa (2):
      hw/ssi: Add Ibex SPI device model
      riscv: opentitan: Connect opentitan SPI Host

 include/hw/core/tcg-cpu-ops.h           |   1 +
 include/hw/intc/riscv_aclint.h          |   1 +
 include/hw/riscv/boot.h                 |   4 +-
 include/hw/riscv/opentitan.h            |  30 +-
 include/hw/ssi/ibex_spi_host.h          |  94 +++++
 target/riscv/cpu.h                      |  40 ++-
 target/riscv/cpu_bits.h                 |  40 +++
 target/riscv/debug.h                    | 114 ++++++
 target/riscv/helper.h                   |   5 +-
 hw/intc/riscv_aclint.c                  | 144 ++++++--
 hw/riscv/boot.c                         |  12 +-
 hw/riscv/opentitan.c                    |  36 +-
 hw/riscv/virt.c                         |  24 +-
 hw/ssi/ibex_spi_host.c                  | 612 ++++++++++++++++++++++++++=
++++++
 target/riscv/cpu.c                      | 120 ++++++-
 target/riscv/cpu_helper.c               |  10 +-
 target/riscv/csr.c                      | 282 +++++++++++++--
 target/riscv/debug.c                    | 441 +++++++++++++++++++++++
 target/riscv/machine.c                  |  55 +++
 target/riscv/pmp.c                      |  14 +-
 target/riscv/vector_helper.c            |  31 +-
 target/riscv/insn_trans/trans_rvv.c.inc |  25 +-
 hw/ssi/meson.build                      |   1 +
 hw/ssi/trace-events                     |   7 +
 target/riscv/meson.build                |   1 +
 25 files changed, 1971 insertions(+), 173 deletions(-)
 create mode 100644 include/hw/ssi/ibex_spi_host.h
 create mode 100644 target/riscv/debug.h
 create mode 100644 hw/ssi/ibex_spi_host.c
 create mode 100644 target/riscv/debug.c

