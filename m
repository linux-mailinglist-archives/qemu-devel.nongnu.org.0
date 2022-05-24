Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B35575333A3
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 00:47:27 +0200 (CEST)
Received: from localhost ([::1]:43090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntdJG-0001mZ-FR
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 18:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdGc-0007OK-Vt
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:44:43 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:62466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdGa-0002YV-49
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:44:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653432279; x=1684968279;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2v/UNS96d73yDwPuPAoBbZGt9Qsd316RKDjBfkENBR8=;
 b=JV/jExwCf6pn5sRAh7LrgQMw9FVtQa2deDr4dW4/UD90sJKzg9NF5v7C
 lWBTXUcRtT3nwbzYECXNkpU6HqocqyYEAXaf3jvh442EryuWyXdma7kkh
 blk6Qvd2R2RhMX8/E1VdCt0ZIVwUrJ4+pYwxzUvzuITZ2vqxUQ5eAkkrd
 0lBpOc9dCNhsoVCptdG4csFh85EPBgNwfLEZGPW9mZyaF6fk/qVGxztFA
 KxhcOSpBi3som9xcrkqW9aDrXVI305XlZjUDKvAJ1QZ9mFAHHsVJZgXPK
 0sQo97TPTvgCAtW4yOYkceFHbAAIxn2w+Za/0xxqpTCZycV6F+M6of9Ag Q==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305566648"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 06:44:36 +0800
IronPort-SDR: JwcwE54x6TBS7AdljqWE+BdXUmDUm8wkceAHv24uSDNf+7ypX1NG5YM5rNvpgQvIR9hY+mJyr7
 K/1E2Zp/yi4bC2tmwqkIW4saiihjjsBvZq155U6l51/IWyw0vWdYFSKSQSNEZp8lNJw0joWEwG
 WhUjNzcPt1g1wN/c/XltARWbvZiBKlBBc8+1yLvH+n6ECkx1OJSGAKL3CRM6XiRdbsUvhgKmG1
 SwllSoA7jovTOzvy9opv2SQh4TDCQoX8iEfes1g6wrcAvBuQP8X3+aryhewrdkv8jgTH5THwCe
 vZUhlz2bWJqCpgPHW5VUFwJE
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:04:08 -0700
IronPort-SDR: 90nxiya/GY1hDeV10CHSGsHw4vDIzu4KMk+aDV38256GmzK9GIjil6QyS6iWQwW0Yf98a0swYo
 cpyvkxzc52N9WOZQdcTSzRyqTg+EMlef7nXCd/lwo/qVxipqcgciddL/Xw+uGWgvCEdyTccyRC
 hOWmCe693T96Z5Ano+PQRXWalMeU1URIwI40jFxbD6HNTKdaNAAnV+ReFsTiO7/jW6+O9YOBu6
 cHbIpLNAbeaaf72GuZH1Bqerruek4H13aY1o4a9VTrWYfenngeG0gqzpZXEfg9faZ/afH52FIM
 dbY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:44:36 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L78QW6FVqz1SVnx
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:44:35 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1653432275; x=1656024276; bh=2v/UNS96d73yDwPuPAoBbZGt9Qsd316R
 KDjBfkENBR8=; b=qaoIainf3xg39S/NnAtjqQcMxgBQbgsQCU9WKdgmVrLnD6K8
 ljrIglFKc97MXDkxBT2NV6pwU6mAPnMeBP/I3gcpLl6QI+uKeUBvHJ1bSJ1DkrK/
 LswfntjhXNbVa9XfMZYcens4x4PQF8PhZ/9WBhMJEKTX9mSnnA1A1TzxFBZ2ps5L
 GUsWxcmNMheKRdwFGBQxyWcMghWWM3E8oRYINw/U/nArcwFL5oV40cm32PN0inVZ
 DOW+3w1q597gCEP3FxGzWOiPHXGYAFCvkE5ZRHjk4zdMcewQQoFJELTKEZ4rCQ1m
 i5xnMZjV/RIjYmGdWPTwuFdttAWrXZrZ5epkig==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id RoCE634sIP3A for <qemu-devel@nongnu.org>;
 Tue, 24 May 2022 15:44:35 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.5])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L78QT4TW8z1Rvlc;
 Tue, 24 May 2022 15:44:33 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 00/23] riscv-to-apply queue
Date: Wed, 25 May 2022 08:44:05 +1000
Message-Id: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1363756b6=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

The following changes since commit 3757b0d08b399c609954cf57f273b1167e5d7a=
8d:

  Merge tag 'pull-request-2022-05-18' of https://gitlab.com/thuth/qemu in=
to staging (2022-05-20 08:04:30 -0700)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220525

for you to fetch changes up to 8fe63fe8e512d77583d6798acd2164f1fa1e40ab:

  hw/core: loader: Set is_linux to true for VxWorks uImage (2022-05-24 10=
:38:50 +1000)

----------------------------------------------------------------
Third RISC-V PR for QEMU 7.1

 * Fixes for accessing VS hypervisor CSRs
 * Improvements for RISC-V Vector extension
 * Fixes for accessing mtimecmp
 * Add new short-isa-string CPU option
 * Improvements to RISC-V machine error handling
 * Disable the "G" extension by default internally, no functional change
 * Enforce floating point extension requirements
 * Cleanup ISA extension checks
 * Resolve redundant property accessors
 * Fix typo of mimpid cpu option
 * Improvements for virtulisation
 * Add zicsr/zifencei to isa_string
 * Support for VxWorks uImage

----------------------------------------------------------------
Anup Patel (4):
      target/riscv: Fix csr number based privilege checking
      target/riscv: Fix hstatus.GVA bit setting for traps taken from HS-m=
ode
      target/riscv: Set [m|s]tval for both illegal and virtual instructio=
n traps
      hw/riscv: virt: Fix interrupt parent for dynamic platform devices

Atish Patra (1):
      hw/intc: Pass correct hartid while updating mtimecmp

Bernhard Beschow (2):
      hw/vfio/pci-quirks: Resolve redundant property getters
      hw/riscv/sifive_u: Resolve redundant property accessors

Bin Meng (2):
      hw/core: Sync uboot_image.h from U-Boot v2022.01
      hw/core: loader: Set is_linux to true for VxWorks uImage

Dylan Reid (1):
      target/riscv: Fix VS mode hypervisor CSR access

Frank Chang (1):
      target/riscv: Fix typo of mimpid cpu option

Hongren (Zenithal) Zheng (1):
      target/riscv: add zicsr/zifencei to isa_string

Tsukasa OI (9):
      target/riscv: Move Zhinx* extensions on ISA string
      target/riscv: Add short-isa-string option
      hw/riscv: Make CPU config error handling generous (virt/spike)
      hw/riscv: Make CPU config error handling generous (sifive_e/u/opent=
itan)
      target/riscv: Fix coding style on "G" expansion
      target/riscv: Disable "G" by default
      target/riscv: Change "G" expansion
      target/riscv: FP extension requirements
      target/riscv: Move/refactor ISA extension checks

Weiwei Li (1):
      target/riscv: check 'I' and 'E' after checking 'G' in riscv_cpu_rea=
lize

eopXD (1):
      target/riscv: rvv: Fix early exit condition for whole register load=
/store

 hw/core/uboot_image.h                   | 213 +++++++++++++++++++++-----=
------
 target/riscv/cpu.h                      |  12 +-
 hw/core/loader.c                        |  15 +++
 hw/intc/riscv_aclint.c                  |   3 +-
 hw/riscv/opentitan.c                    |   2 +-
 hw/riscv/sifive_e.c                     |   2 +-
 hw/riscv/sifive_u.c                     |  28 +----
 hw/riscv/spike.c                        |   2 +-
 hw/riscv/virt.c                         |  27 ++--
 hw/vfio/pci-quirks.c                    |  34 ++---
 target/riscv/cpu.c                      |  91 ++++++++++----
 target/riscv/cpu_helper.c               |   4 +-
 target/riscv/csr.c                      |  26 ++--
 target/riscv/translate.c                |  17 ++-
 target/riscv/insn_trans/trans_rvv.c.inc |  58 +++++----
 15 files changed, 325 insertions(+), 209 deletions(-)

