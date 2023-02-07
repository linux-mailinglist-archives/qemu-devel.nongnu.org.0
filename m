Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E58868D03B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:11:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI7P-0006RM-S3; Tue, 07 Feb 2023 02:10:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7C-0006P8-N1
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:08 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI74-0008Qm-Eb
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753798; x=1707289798;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hFjzmP1wQQ+KI9QM/4v/19NvZc0Uwq86GAYzd7nJgBE=;
 b=qKPWhsCzkC6Hkbic1bI/yfhXvDLuFGVVI9Dc9/+rYUiQeWz8wS/1iU4J
 Xm/C+mEncewUPDfKOrz8DRI8UHfxDvKXRY6slLwKyqPpAcxDzYlE8nBAN
 /cTeMA+S/iMyMvT1+rS1sltsN+PukexqGvfp9zGTtV3x3Z77ZZqxCuk12
 fQsoTa44TVc1+/3C263/v49/FlZG13c0IEtVAXKgTpssepZeRGmgLG+rS
 He2mN4IUXnKBe6pLLGYKJqU1vV7JXdruG6cTRRYL+43vrhhSyPK9VrRDM
 cGWVvd18MC0NUSd1tPmAINPsxLnaK2RiBxKR+lsgS2xvTvDYNuECp4uA3 w==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657442"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:09:50 +0800
IronPort-SDR: eldaC23P9lhS6zJ5LRR8AlBcesLgTS5pkieTL8b7SxMQEqL7FbizHnzwofA5rYVZvJM/XkbL06
 91ZHpjvHe/QuIMtgJQHvQ5gi7D/75UDJmsFv6UE7bDVKTfMmFegdaOn/oFUAYXCcjP7zI5Rto0
 w+5b/k2XPLhJGlG5G/eJ4ECXgnV73hBVu+nQBEB3P1k0dIadB/NXOXuKXH2RF8WGf4OEYm1418
 7PHejEqh2SmpTY/QRthZHQQ8RmQs2tIJJCZUusSz/NqpXFTCAQIbYa4vgqoRtHcQ+LN/OWQapl
 ohk=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:27:07 -0800
IronPort-SDR: /DRvr06TTV46O8Q+HHIOf2tYmP+qlQsmncxkkTrY2d+B+eBWG/nF36JaVq5GgHiXerERxWtfBE
 ybF63ICaIsUErTzgUUYOtgQ4ylV2uqJoooTHzs5GO6imhSnepXww/NUrbOIz/29UNjnuUuzdSE
 oCArMakDAY4tzLmu8MY1N4iMOKikhi3HN0Eb9mSjijWSabcRFnkc4LJL4WdfKAbTtgPFOyuYdJ
 dWwfABv6ZwUW0NLn37lEysqO4PggSpsBuQSAt6u58VIOIpe4tqnpdEiIUBNWsjDT/7KfbxkN75
 ig8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:09:50 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vQQ0z6Gz1RwqL
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:09:50 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1675753789; x=1678345790; bh=hFjzmP1wQQ+KI9QM/4v/19NvZc0Uwq86
 GAYzd7nJgBE=; b=e2VDaUgncXo9UEoMVrEvy5TxMVAdk6Jmou6D/kQ3Vg+iNNTk
 rDO0oyYNRl2WLcpElPalpgQNkfidyC9ZF8Jw5/DOIgvYeRYkQwXqE2L8JVETaWfM
 WeoqL0L5zEi+wI3Fdg7zU9lpWsW7S6jurHh+VQrhZ/nyRZguwGL/02G04iaqqZs7
 etBqg3Lg70AFBCQICQojY5TatdHdT0qXStmtMjRDftCsQkYZHyKpJhlKo4fjpRJH
 WggzsOEMP6VFMlKKsjlfBkUjVeJimVDVJLDSIPZ12lA2PZfT7XyY+6/rr5qlF2jG
 OmAQfv+DwBqWYRFnyQqr46+d/pykn2VBZcQOzQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id KfFmWaOaaPno for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:09:49 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vQN3Chsz1RvLy;
 Mon,  6 Feb 2023 23:09:48 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 00/32] riscv-to-apply queue
Date: Tue,  7 Feb 2023 17:09:11 +1000
Message-Id: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=395dd5341=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

The following changes since commit 6661b8c7fe3f8b5687d2d90f7b4f3f23d70e3e=
8b:

  Merge tag 'pull-ppc-20230205' of https://gitlab.com/danielhb/qemu into =
staging (2023-02-05 16:49:09 +0000)

are available in the Git repository at:

  https://github.com/alistair23/qemu.git tags/pull-riscv-to-apply-2023020=
7

for you to fetch changes up to 5474aa4f3e0a3e9c171db7c55b5baf15f2e2778c:

  hw/riscv: virt: Simplify virt_{get,set}_aclint() (2023-02-07 08:21:32 +=
1000)

----------------------------------------------------------------
Third RISC-V PR for QEMU 8.0

* Update disas for xnor/orn/andn and slli.uw
* Update opentitan IRQs
* Fix rom code when Zicsr is disabled
* Update VS timer whenever htimedelta changes
* A collection of fixes for virtulisation
* Set tval for triggered watchpoints
* Cleanups for board and FDT creation
* Add support for the T-Head vendor extensions
* A fix for virtual instr exception
* Fix ctzw behavior
* Fix SBI getchar handler for KVM

----------------------------------------------------------------
Alistair Francis (1):
      hw/riscv: boot: Don't use CSRs if they are disabled

Anup Patel (4):
      target/riscv: Update VS timer whenever htimedelta changes
      target/riscv: Don't clear mask in riscv_cpu_update_mip() for VSTIP
      target/riscv: No need to re-start QEMU timer when timecmp =3D=3D UI=
NT64_MAX
      target/riscv: Ensure opcode is saved for all relevant instructions

Bin Meng (1):
      hw/riscv: virt: Simplify virt_{get,set}_aclint()

Christoph M=C3=BCllner (14):
      RISC-V: Adding XTheadCmo ISA extension
      RISC-V: Adding XTheadSync ISA extension
      RISC-V: Adding XTheadBa ISA extension
      RISC-V: Adding XTheadBb ISA extension
      RISC-V: Adding XTheadBs ISA extension
      RISC-V: Adding XTheadCondMov ISA extension
      RISC-V: Adding T-Head multiply-accumulate instructions
      RISC-V: Adding T-Head MemPair extension
      RISC-V: Adding T-Head MemIdx extension
      RISC-V: Adding T-Head FMemIdx extension
      RISC-V: Set minimum priv version for Zfh to 1.11
      RISC-V: Add initial support for T-Head C906
      RISC-V: Adding XTheadFmv ISA extension
      target/riscv: add a MAINTAINERS entry for XThead* extension support

Daniel Henrique Barboza (6):
      hw/riscv/virt.c: calculate socket count once in create_fdt_imsic()
      hw/riscv/virt.c: rename MachineState 'mc' pointers to 'ms'
      hw/riscv/spike.c: rename MachineState 'mc' pointers to' ms'
      hw/riscv/boot.c: calculate fdt size after fdt_pack()
      hw/riscv: split fdt address calculation from fdt load
      hw/riscv: change riscv_compute_fdt_addr() semantics

Deepak Gupta (1):
      target/riscv: fix for virtual instr exception

Philipp Tomsich (1):
      target/riscv: update disas.c for xnor/orn/andn and slli.uw

Sergey Matyukevich (1):
      target/riscv: set tval for triggered watchpoints

Vladimir Isaev (2):
      target/riscv: fix ctzw behavior
      target/riscv: fix SBI getchar handler for KVM

Wilfred Mallawa (1):
      include/hw/riscv/opentitan: update opentitan IRQs

 MAINTAINERS                                 |    8 +
 include/hw/riscv/boot.h                     |    4 +-
 include/hw/riscv/opentitan.h                |   14 +-
 target/riscv/cpu.h                          |   12 +
 target/riscv/cpu_vendorid.h                 |    6 +
 target/riscv/helper.h                       |    1 +
 target/riscv/xthead.decode                  |  185 +++++
 disas/riscv.c                               |    8 +-
 hw/riscv/boot.c                             |   62 +-
 hw/riscv/microchip_pfsoc.c                  |    7 +-
 hw/riscv/opentitan.c                        |   80 +-
 hw/riscv/sifive_u.c                         |    8 +-
 hw/riscv/spike.c                            |   25 +-
 hw/riscv/virt.c                             |  476 ++++++------
 target/riscv/cpu.c                          |   55 +-
 target/riscv/cpu_helper.c                   |    8 +-
 target/riscv/csr.c                          |   16 +
 target/riscv/debug.c                        |    1 -
 target/riscv/kvm.c                          |    5 +-
 target/riscv/op_helper.c                    |    6 +
 target/riscv/time_helper.c                  |   36 +-
 target/riscv/translate.c                    |   32 +
 target/riscv/insn_trans/trans_rva.c.inc     |   10 +-
 target/riscv/insn_trans/trans_rvb.c.inc     |    1 +
 target/riscv/insn_trans/trans_rvd.c.inc     |    2 +
 target/riscv/insn_trans/trans_rvf.c.inc     |    2 +
 target/riscv/insn_trans/trans_rvh.c.inc     |    3 +
 target/riscv/insn_trans/trans_rvi.c.inc     |    2 +
 target/riscv/insn_trans/trans_rvzfh.c.inc   |    2 +
 target/riscv/insn_trans/trans_svinval.c.inc |    3 +
 target/riscv/insn_trans/trans_xthead.c.inc  | 1094 +++++++++++++++++++++=
++++++
 target/riscv/meson.build                    |    1 +
 32 files changed, 1847 insertions(+), 328 deletions(-)
 create mode 100644 target/riscv/cpu_vendorid.h
 create mode 100644 target/riscv/xthead.decode
 create mode 100644 target/riscv/insn_trans/trans_xthead.c.inc

