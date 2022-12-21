Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE236538D4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:42:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87la-0007LA-Rv; Wed, 21 Dec 2022 17:40:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87lY-0007Ky-3j
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:40:48 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87lT-0000Xf-Gk
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:40:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662443; x=1703198443;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d5vpWVFxROcXfEDsxH90Cy/uOr0/JY/lCtmWhsdVpTk=;
 b=AHGUuD+iogPmp/DY8VmiO7ZMapGYfOYS5pjdWTmOuyJvo5c3+r7EWrsk
 VpxIIy8CGSVpyPX2KtgNbi20OqTJ8wrnAYnU4tp06DuZWg4O9QyUUIV1/
 BCkQjpEyjp3przHyj6tn6h/8QfN8C80CzRuXxJkC5JATsxd5DwAXX1Ev8
 CKS2lpMht6RT6rlCkw+klkV+j4nu+NR/Ww+FOgBAXJkKV5d+odb5BkTBO
 mwKSwlUljSluRZyomFp5HhXRmFXCQoO0DEsGFDqWFCYCmzRynatdA47b7
 YaNroDCbYiAPX88l0cC1S30l933JT7Fp3IfhMdmi6AC0dBz7rFfCrZjGd g==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561254"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:40:29 +0800
IronPort-SDR: +x7Dpav8k2DZedAxp8q890l2okxWkxxLpozGHLJF29CpION+PV2N678T3f+H9Yn4NPcQGGibks
 6DDeBqkyc3CO6uj0sx4acdr9Zbh7otOctiK6ZKTvw9Wj4851/tE3dAYh/O1KBBuEpL8sdvJFqL
 yLB0AXjPkrqT1mJam7OL2a45/DY45HyoQFgMFy51Z1TSwQr0k3Gy7/IG18IiUSpDg3sFtHthXd
 4Oxm6lI2ssDvPl43+01l5FWHyl3aLHx67I2jAT8eiPZlQ4rZH37ZDYGD+G+TVnkeDQzr08GcJb
 /aM=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:52:58 -0800
IronPort-SDR: ZBH5AzJTv3/Wrne8AlAsiDkBCaobjlHGjRK+dQiQ/HgNFpPITeBCDGLZIXMs2JO3XeLeNIXPHG
 I2YaiM/cc0l7W4/x4hinOR9jZpcEWPnI1ylwaAzUCrmCJz6+RDeJ1JO0WEH6IB/s94YNvw06Tc
 lk6nKvDQUlG+F9AuM0Ik3b/EgLuNo7HCRvMgSQXfRmuM2Mb1NIgkkp7wQ+eyLP5kzTmDOpbe7O
 oMGagBk0AOpAYm8VnheGPDSZ2YTtMTwo0F026vFvgI49Y/jt+mS+FGeTAJqdGzNLj5rlIFmu3j
 hYc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:40:29 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpLP2qVDz1RwqL
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:40:29 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1671662428; x=1674254429; bh=d5vpWVFxROcXfEDsxH90Cy/uOr0/JY/l
 CtmWhsdVpTk=; b=Q49vwxx7Lln7/gP0qC6smpp5bAlhbmEXfjG3PjC8b58FOG8O
 LBh5y/rT1AwG0P9mKLnMFNUjXGYxqvUOlzErne9aMTsg3Bzey3sd8Sv/vhRSeu+U
 b9CtUSCMBZn5KUdOMBFVrKkIhhnB1cabKSzlv0/CGz5g6DLLAbwWpptegs+DDYlR
 8HTLc3nL/O0aaZxXXsrCwdvqx37muutlkHf+kA9CB+yYlRod3t6+qgOlZtYS1cPv
 yWA1SMv/wbtsYQcEwu4nkPoAm4IVqPFGPFxc8iVG8Fnbq1J32TezuO8L6xt7z6Db
 0c1LZrR+6DoW1Rl5H24gmmZcNzchgdUMTPRDRg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id xMX1KyG9tZlR for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:40:28 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpLM0sQvz1RvLy;
 Wed, 21 Dec 2022 14:40:26 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 00/45] riscv-to-apply queue
Date: Thu, 22 Dec 2022 08:39:37 +1000
Message-Id: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=3472792e2=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alistair Francis <alistair.francis@wdc.com>

The following changes since commit 222059a0fccf4af3be776fe35a5ea2d6a68f9a=
0b:

  Merge tag 'pull-ppc-20221221' of https://gitlab.com/danielhb/qemu into =
staging (2022-12-21 18:08:09 +0000)

are available in the Git repository at:

  https://github.com/alistair23/qemu.git tags/pull-riscv-to-apply-2022122=
2-1

for you to fetch changes up to 71a9bc59728a054036f3db7dd82dab8f8bd2baf9:

  hw/intc: sifive_plic: Fix the pending register range check (2022-12-22 =
08:36:30 +1000)

----------------------------------------------------------------
First RISC-V PR for QEMU 8.0

* Fix PMP propagation for tlb
* Collection of bug fixes
* Add the `FIELDx_1CLEAR()` macro
* Bump the OpenTitan supported version
* Add smstateen support
* Support native debug icount trigger
* Remove the redundant ipi-id property in the virt machine
* Support cache-related PMU events in virtual mode
* Add some missing PolarFire SoC io regions
* Fix mret exception cause when no pmp rule is configured
* Fix bug where disabling compressed instructions would crash QEMU
* Add Zawrs ISA extension support
* A range of code refactoring and cleanups

----------------------------------------------------------------
Anup Patel (1):
      target/riscv: Typo fix in sstc() predicate

Atish Patra (1):
      hw/riscv: virt: Remove the redundant ipi-id property

Bin Meng (20):
      target/riscv: Add some comments for sstatus CSR in riscv_cpu_dump_s=
tate()
      target/riscv: Fix mret exception cause when no pmp rule is configur=
ed
      target/riscv: Simplify helper_sret() a little bit
      target/riscv: Clear mstatus.MPRV when leaving M-mode for priv spec =
1.12+
      hw/riscv: Select MSI_NONBROKEN in SIFIVE_PLIC
      hw/intc: Select MSI_NONBROKEN in RISC-V AIA interrupt controllers
      hw/riscv: Fix opentitan dependency to SIFIVE_PLIC
      hw/riscv: Sort machines Kconfig options in alphabetical order
      hw/riscv: spike: Remove misleading comments
      hw/intc: sifive_plic: Drop PLICMode_H
      hw/intc: sifive_plic: Improve robustness of the PLIC config parser
      hw/intc: sifive_plic: Use error_setg() to propagate the error up vi=
a errp in sifive_plic_realize()
      hw/intc: sifive_plic: Update "num-sources" property default value
      hw/riscv: microchip_pfsoc: Fix the number of interrupt sources of P=
LIC
      hw/riscv: sifive_e: Fix the number of interrupt sources of PLIC
      hw/riscv: sifive_u: Avoid using magic number for "riscv, ndev"
      hw/riscv: virt: Fix the value of "riscv, ndev" in the dtb
      hw/intc: sifive_plic: Change "priority-base" to start from interrup=
t source 0
      hw/riscv: opentitan: Drop "hartid-base" and "priority-base" initial=
ization
      hw/intc: sifive_plic: Fix the pending register range check

Christoph Muellner (1):
      RISC-V: Add Zawrs ISA extension support

Conor Dooley (3):
      hw/misc: pfsoc: add fabric clocks to ioscb
      hw/riscv: pfsoc: add missing FICs as unimplemented
      hw/{misc, riscv}: pfsoc: add system controller as unimplemented

Fr=C3=A9d=C3=A9ric P=C3=A9trot (1):
      hw/intc: sifive_plic: Renumber the S irqs for numa support

Jim Shu (2):
      target/riscv: support cache-related PMU events in virtual mode
      hw/intc: sifive_plic: fix out-of-bound access of source_priority ar=
ray

LIU Zhiwei (5):
      target/riscv: Fix PMP propagation for tlb
      target/riscv: Add itrigger support when icount is not enabled
      target/riscv: Add itrigger support when icount is enabled
      target/riscv: Enable native debug itrigger
      target/riscv: Add itrigger_enabled field to CPURISCVState

Mayuresh Chitale (3):
      target/riscv: Add smstateen support
      target/riscv: smstateen check for h/s/envcfg
      target/riscv: generate virtual instruction exception

Richard Henderson (4):
      tcg/riscv: Fix range matched by TCG_CT_CONST_M12
      tcg/riscv: Fix reg overlap case in tcg_out_addsub2
      tcg/riscv: Fix base register for user-only qemu_ld/st
      target/riscv: Set pc_succ_insn for !rvc illegal insn

Wilfred Mallawa (4):
      hw/registerfields: add `FIELDx_1CLEAR()` macro
      hw/ssi/ibex_spi: implement `FIELD32_1CLEAR` macro
      hw/riscv/opentitan: bump opentitan
      hw/riscv/opentitan: add aon_timer base unimpl

 include/hw/intc/sifive_plic.h                  |   1 -
 include/hw/misc/mchp_pfsoc_ioscb.h             |   4 +
 include/hw/misc/mchp_pfsoc_sysreg.h            |   1 +
 include/hw/registerfields.h                    |  22 ++
 include/hw/riscv/microchip_pfsoc.h             |   7 +-
 include/hw/riscv/opentitan.h                   |  10 +-
 include/hw/riscv/shakti_c.h                    |   2 +-
 include/hw/riscv/sifive_e.h                    |   9 +-
 include/hw/riscv/sifive_u.h                    |   2 +-
 include/hw/riscv/virt.h                        |   8 +-
 target/riscv/cpu.h                             |  10 +
 target/riscv/cpu_bits.h                        |  37 +++
 target/riscv/debug.h                           |  13 +
 target/riscv/helper.h                          |   2 +
 target/riscv/pmp.h                             |   6 +-
 target/riscv/insn32.decode                     |   4 +
 hw/intc/sifive_plic.c                          |  66 +++--
 hw/misc/mchp_pfsoc_ioscb.c                     |  78 ++++-
 hw/misc/mchp_pfsoc_sysreg.c                    |  18 +-
 hw/riscv/microchip_pfsoc.c                     | 121 ++++----
 hw/riscv/opentitan.c                           |  26 +-
 hw/riscv/sifive_u.c                            |   3 +-
 hw/riscv/spike.c                               |   1 -
 hw/riscv/virt.c                                |   7 +-
 hw/ssi/ibex_spi_host.c                         |  21 +-
 target/riscv/cpu.c                             |  11 +
 target/riscv/cpu_helper.c                      |  26 +-
 target/riscv/csr.c                             | 393 +++++++++++++++++++=
+++++-
 target/riscv/debug.c                           | 205 +++++++++++++
 target/riscv/machine.c                         |  36 +++
 target/riscv/op_helper.c                       |  28 +-
 target/riscv/pmp.c                             |  90 ++----
 target/riscv/translate.c                       |  54 +++-
 target/riscv/insn_trans/trans_privileged.c.inc |   4 +-
 target/riscv/insn_trans/trans_rvi.c.inc        |   8 +-
 target/riscv/insn_trans/trans_rvv.c.inc        |   4 +-
 target/riscv/insn_trans/trans_rvzawrs.c.inc    |  51 ++++
 tcg/riscv/tcg-target.c.inc                     |  68 +++--
 hw/intc/Kconfig                                |   3 +
 hw/riscv/Kconfig                               |  22 +-
 tests/tcg/Makefile.target                      |   2 +
 tests/tcg/riscv64/Makefile.target              |   6 +
 tests/tcg/riscv64/test-noc.S                   |  32 ++
 43 files changed, 1256 insertions(+), 266 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvzawrs.c.inc
 create mode 100644 tests/tcg/riscv64/test-noc.S

