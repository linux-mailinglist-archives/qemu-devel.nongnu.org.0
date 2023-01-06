Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D8D65FA04
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:16:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdBR-00015y-H0; Thu, 05 Jan 2023 22:14:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdBP-00015I-G9
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:14:15 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdBM-00088M-5g
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:14:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974851; x=1704510851;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y4kmJnW9w5JLj46alAZVwJnWgswKLFkswrgJcwa85es=;
 b=iCmJwID5Nnm/Oh3izhK7/O93bF66fp1Bx8tRypSiGWNSAKIbg4yjelvb
 6j9h5AqR60I+y3A92q5ZnU8lXydmOysk3sm/x2AXcWsBkJgozyGPg+9BT
 9AdG5+jS54MSZH8nkQukIBw/nsmYHGvwyWVlNc1bzHokT+BmPDQYoBuhb
 CVjOEBVnPELwE8Y95kTUxBLjHzg7hFe37eKBpslwwP3wF9z76OMSsPyMY
 86KK9JSxobKqIQiMYUMEiYzx26CD0+a1K8EDns20qHKyLlF4hxnusfdjU
 zpB1NUy3XIzbJvHpvFd41HKcG01Ic9R6sjF3noEGHDNAFU0yAWsZM1P4R g==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254740"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:04 +0800
IronPort-SDR: jC1RIU5/XJHBjyo38+WmzfdnqcPW48QT8y/vlWyDolbLlhduGxawbTTnugFZg9h106hhVG3d7g
 V/TNdM4SVli68aUIXtnw5jwTENhhD2l5tUzu6khWBfGMMBllrLn2iBG5iznJ42YKnYSEwmVDpQ
 ogRg/JFXv4WZXFGMcr1BYDMeNvL23T//zD+RGftbUJh2eIIXIvcYOYl2I+8frfO5YTmcG24fTc
 /FiYnN6cop7A5qB1rP4FoEQR8ZnUMqkoryuR6pqn8L/JT4NYwjWHN3xnugTQGZuvg9sxDGFBNq
 JzU=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:26:15 -0800
IronPort-SDR: nAfhI/kI7i7iEYLoL4rete8+6sj9CCugUhxce3XJ3v2rl8bd6frXzI+6T1l6EqloqF0xvj3qg/
 FItX3gcP0hjDU6bBL0bEkvokHObGfG7gEZL50w2cFRPahhLaDY2qCconvHix1whly2eqUlD1bD
 Ued/rzfsLTiEauKPi/yQHZcotx2vPG5Oy68+qpvNEh4uMv/LaTac39SQaAIXXIGBEL+/4b6UEV
 Ya9oDYtldXZnLcU8GTiI/FgsvneY5OcH7svfCSJu3R8XlLpJRWbIvKz0bf7sq7ZSl0+vtgL6tz
 56o=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:14:06 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7j825fBz1RwqL
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:04 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1672974843; x=1675566844; bh=y4kmJnW9w5JLj46alAZVwJnWgswKLFks
 wrgJcwa85es=; b=uEBPSi0R+JZ5v8jDgehBMtHtPgqGDtWmDv8t6nN5SKP1Px4L
 TV56KiMKw9oUCd9Ux+Y5gxESFXx1Iz6qc4r6TqixPopT5UzLvkKImSgmyVIbKDQV
 LSdQhLAjE9KyvR8EITNeUCs8Y1iyYViwZBnU1Ydffgne7W4LpsVI3RTZCtTyISOt
 QQRtW0BxMYtphmHrIOlSPandrsBJXvmBbegzaoXlHAME7R3mUqi8wviGQcStAbvB
 Blkt9kf+57La9F7i4zdXMzqHjYMnlLXho36VTxwPKalQdQEuDCJ1reqDWIIIrGJ2
 6Cb8xOCYdk0XgpHNsvDBkfnYeC4W0JDoRSk/Fg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id nxVlD92_iu7H for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:03 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7j62gnNz1RvLy;
 Thu,  5 Jan 2023 19:14:02 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 00/43] riscv-to-apply queue
Date: Fri,  6 Jan 2023 13:13:14 +1000
Message-Id: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=363443eaf=alistair.francis@opensource.wdc.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alistair Francis <alistair.francis@wdc.com>

The following changes since commit d1852caab131ea898134fdcea8c14bc2ee75fb=
e9:

  Merge tag 'python-pull-request' of https://gitlab.com/jsnow/qemu into s=
taging (2023-01-05 16:59:22 +0000)

are available in the Git repository at:

  https://github.com/alistair23/qemu.git tags/pull-riscv-to-apply-2023010=
6

for you to fetch changes up to bc92f261519d5c77c70cf2ebcf0a3b9a414d82d0:

  hw/intc: sifive_plic: Fix the pending register range check (2023-01-06 =
10:42:55 +1000)

----------------------------------------------------------------
First RISC-V PR for QEMU 8.0

* Fix PMP propagation for tlb
* Collection of bug fixes
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

Wilfred Mallawa (2):
      hw/riscv/opentitan: bump opentitan
      hw/riscv/opentitan: add aon_timer base unimpl

 include/hw/intc/sifive_plic.h                  |   1 -
 include/hw/misc/mchp_pfsoc_ioscb.h             |   4 +
 include/hw/misc/mchp_pfsoc_sysreg.h            |   1 +
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
 41 files changed, 1225 insertions(+), 254 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvzawrs.c.inc
 create mode 100644 tests/tcg/riscv64/test-noc.S

