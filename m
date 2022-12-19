Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A51C650666
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:28:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75ic-0008CI-DS; Sun, 18 Dec 2022 21:17:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75iX-0008Af-Af
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:17:26 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75iT-00013c-3t
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:17:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416240; x=1702952240;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R3DGQGNndstTa+t9dnYffHKM2lwQFgForQa1xofQB9s=;
 b=PIB90HhoLH9a4m4zjsCsqgYGsXRAtI1fzwfYkp37l+3nd3wOhWhThvh5
 RrvA6AZ1fL0eVlNBpsoTvisBi9nVZp9AYpwUxbBEZ87uwGNfwHNwUU7SG
 97oJ7r62yQS07MCEgIPz94cvEeyd0nvK/H7bDfResXThcqYfBEASr8WAo
 bSJmFznyIHLRpwoeTi3HoyH4PRWaCSu9XsaNRnHybwHGQaOWyKjraSxDO
 OeWVTlz2Wc57KZikSSwoOxAFKh3AgzMhjA/kFtMRETDjLQx6w/yqbvvYb
 IymYrMNuqcnt7m2or9/6iABQcHkxQrArOf5SQmCtq8wgjsxBrgIZSvx4d g==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="217199242"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:17:11 +0800
IronPort-SDR: cXX1tWGU5MY7zqxkLzifJiGLPoPb/WIw+zzBI/W+HOdhTNWcshwV+2sWHuUlJV5i70ctVjveTu
 IP0z2ux7SEhMapcAe6Jn19xb5R47AA5o+FFl16bStZGcm+7FJvCaabKyEJgj0zhOGgY7DYvT+p
 Pk5BVGa/Hj5/13mep4Q/bqoU50O7dT2SkAE5ZjGkqMNm3dWLIFF56AzvIy7qYHKRbCVAgKtYpV
 42RjiE22hMoOU0AfRpRXTURiMN8J5AGGkblOnMrvIA1q4yBPnKRgBhAKujiAKqQiK5E1aIhgqn
 ztI=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:29:44 -0800
IronPort-SDR: 0dkykr7XxH5wLkaAM/oPJtIUKzRT9aAD55Z5+Ec8RJzmJCK9qQb2QGPq82qH7iD6bWr/XSYuET
 WMHcYajhu40JEXx7pG/fINf06D2Ty5HskLwQy18JCYZSILgEA1o+btMzsUMeH1JtI0l4ouiIbZ
 2lBGsqBTBX20dxUaiceHIPOUFUoN30T0c6utYbTSpwkhoPaspJ+28MK/0CnkTKYaHdcPJWtLZN
 ma40cjN5xksmxVYH70Mb7HevO1mYQ6ouvVRzw2hZ53AjmanYllJmJnfg7qkzSX7RPU9yh5dQ8s
 urY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:17:12 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3Hq6Kp7z1RvTr
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:17:11 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1671416230; x=1674008231; bh=R3DGQGNndstTa+t9dnYffHKM2lwQFgFo
 rQa1xofQB9s=; b=BPp3omn/CHiwx6GDW1mUXMfw5HdmZq7ZtVyfLbTWp7UpqWbP
 1P+HOPxDj5KNUSVszt9+1IDVwZYemek+0RK/C+OYO4ZsV1koXZehjw/ahaJWuDD8
 Z5WWpaE7k4vTYEtOAdys3JDp9VBa/w/68uktZtZCK/dBdjLzYmph1hNyPicx0c/B
 eew7hy9QF9p2Ui6o2lhPZCaqw1Pyi+HqpOlsiF7FANFrL2dWekpg0hK9+gM9n849
 Q/Qa7QQ441pAOaLWeelWD9gA1RWVMLrIbu7KtSnDMXTzcmwm4WQntSQDcYf446P3
 6McDBHl+8+asXmcs1HBhrWTu0RW/u8k7atZ8hA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id E8wW-x6UColv for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:17:10 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3Hn08Pzz1RvLy;
 Sun, 18 Dec 2022 18:17:08 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 00/45] riscv-to-apply queue
Date: Mon, 19 Dec 2022 12:16:18 +1000
Message-Id: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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

The following changes since commit 562d4af32ec2213061f844b3838223fd7711b5=
6a:

  Merge tag 'pull-loongarch-20221215' of https://gitlab.com/gaosong/qemu =
into staging (2022-12-18 13:53:29 +0000)

are available in the Git repository at:

  https://github.com/alistair23/qemu.git tags/pull-riscv-to-apply-2022121=
9-3

for you to fetch changes up to e59b3c6ece6a1351aeca6b916cd9674e23d15e89:

  hw/intc: sifive_plic: Fix the pending register range check (2022-12-19 =
10:42:14 +1000)

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
 tests/tcg/riscv64/Makefile.target              |   5 +
 tests/tcg/riscv64/test-noc.S                   |  32 ++
 43 files changed, 1255 insertions(+), 266 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvzawrs.c.inc
 create mode 100644 tests/tcg/riscv64/test-noc.S

