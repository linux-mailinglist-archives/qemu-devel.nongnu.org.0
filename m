Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20057424D6E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 08:52:11 +0200 (CEST)
Received: from localhost ([::1]:45678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNG7-0004cp-AR
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 02:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNCU-0002VX-52
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:48:18 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:35993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNCP-0002ZN-Vk
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:48:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633589293; x=1665125293;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qObVoItFUpTXy7s2IXMxSWsIRmMcNqXO4ARItoO5ffA=;
 b=cTxLpXIBtoaNEOxZzPzex7/sD29Ka4WOJ9cMk3kw2iA9Xj6MFOro3iF9
 YxHMJ+2Tmcp+3+3rm3PmKE/vtcvoT1y0pYyocmCxmIutbqDL23JIBgX0y
 o5Iv+lB7CF5mAABuE99Xod/TQ2JtLgyH/7Gv6ZnXfh+xAzB3HjW2wPvbo
 0rlHVYuDGM//YRJ9lsNZamolHkocUQxzU8bONB9/DShqgKAX1QMT2I0t1
 mdN8b0uZjxTEwMeOatLS6HBg7ZzdZvDd/UuThaJuTfiid9QZly889mV2n
 PhLpdalIfnWFfxVKuw/FK2w7BHSMzKnOlUpisvHATsBOtlu7hxBYzTRsa g==;
X-IronPort-AV: E=Sophos;i="5.85,352,1624291200"; d="scan'208";a="285950638"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 14:48:07 +0800
IronPort-SDR: kbx4arp7mzkgUPCoaO7gWHUdpHO6c7sVKIRkMclgAexMERFhe/3OSObCe3DQeftD9dUON5KkoW
 5vawWWROhpsV9LmeypwfM3fnnncpF0lM/2ajWjVOwvUuzeeWZ/L1j1qc5+vLVVRu2D4g1ZtENs
 aVqzoyoCLj9OxZpmn0Vr/wFTiDFZvlpz/t4Ya9hi0uX0MGCt0psP6jShfZZD3HIaS1HfudOLBV
 zXawonRU60WqHDdJCiDSvTmdC1zcB8vmXy+AbRd/ktDP5sPZqiHf7z1u+5pN9ZYgfr7Hg3i3Dz
 W0NNJqpsPPCWaHmvNxQog7p/
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:22:29 -0700
IronPort-SDR: UlbJN1lNPMohQMx/Ss5ideerZHfqbqyTHNOlQ4PjYexOmO13Xftom8vRpFH3X43rvbktjcqCOT
 4Z1V9AVgPpF6Rpw6gQbYElKwDGC4stJ8muqagPykPXGCJlGethSc0gMJabLYpRFO5YCRtAFLeX
 OH9ketz79SuYSO31lA9G8i5x2yWvedV14A7eXWYhtPXlvZVPzFJsJbVYRv4kZI9CV/752NqDi7
 FZ3k+A5flhIDMxIWXAMwS8w2SDe5+ElsKd+EzrLtlGPlo0C/bsCxQYxER4cUmeQzk/mJ6cymAN
 qNI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:48:08 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HQ22b3SJLz1RvmH
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 23:48:07 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1633589287; x=1636181288; bh=qObVoItFUpTXy7s2IXMxSWsIRmMcNqXO
 4ARItoO5ffA=; b=NuP4u3t54wQ++9kZcx+4lun4vZcTx91WYbUplw5yhp6L3SEg
 76ysWseVe6R5Z8oaSBIc/aB0OwynMbR7LI9Vx5NCEzjXMWPHMWA3uv/Cq06kf12+
 +YoY9so4GxIn3OjiSkT3gXXmpA72sNL5RIQeGYIqzN5sCOyuFQFtFK/Yi8j7L1tC
 oHPByw2WvaBAvYuupvUQqm6krjkImXPIEc9okdGUJz7z7oxWE703CIfeR2dFbIUU
 Moz7ky8mebbanCH6jf4t5AXluRB3eat9Z9iSlE+GRnLZ/DzxO96mcidX1bHD+q5R
 C3l+SomX3iiRY4JkNbTyx44q2g69ciYHkHblIw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 3TRUn4Gqk5iv for <qemu-devel@nongnu.org>;
 Wed,  6 Oct 2021 23:48:07 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.32])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HQ22W690bz1RvTg;
 Wed,  6 Oct 2021 23:48:03 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 00/26] riscv-to-apply queue
Date: Thu,  7 Oct 2021 16:47:25 +1000
Message-Id: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=907902f29=alistair.francis@opensource.wdc.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

The following changes since commit ca61fa4b803e5d0abaf6f1ceb690f23bb78a4d=
ef:

  Merge remote-tracking branch 'remotes/quic/tags/pull-hex-20211006' into=
 staging (2021-10-06 12:11:14 -0700)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20211007

for you to fetch changes up to 9ae6ecd848dcd1b32003526ab65a0d4c644dfb07:

  hw/riscv: shakti_c: Mark as not user creatable (2021-10-07 08:41:33 +10=
00)

----------------------------------------------------------------
Third RISC-V PR for QEMU 6.2

 - Add Zb[abcs] instruction support
 - Remove RVB support
 - Bug fix of setting mstatus_hs.[SD|FS] bits
 - Mark some UART devices as 'input'
 - QOMify PolarFire MMUART
 - Fixes for sifive PDMA
 - Mark shakti_c as not user creatable

----------------------------------------------------------------
Alistair Francis (1):
      hw/riscv: shakti_c: Mark as not user creatable

Bin Meng (5):
      hw/char: ibex_uart: Register device in 'input' category
      hw/char: shakti_uart: Register device in 'input' category
      hw/char: sifive_uart: Register device in 'input' category
      hw/dma: sifive_pdma: Fix Control.claim bit detection
      hw/dma: sifive_pdma: Don't run DMA when channel is disclaimed

Frank Chang (1):
      target/riscv: Set mstatus_hs.[SD|FS] bits if Clean and V=3D1 in mar=
k_fs_dirty()

Philipp Tomsich (16):
      target/riscv: Introduce temporary in gen_add_uw()
      target/riscv: fix clzw implementation to operate on arg1
      target/riscv: clwz must ignore high bits (use shift-left & changed =
logic)
      target/riscv: Add x-zba, x-zbb, x-zbc and x-zbs properties
      target/riscv: Reassign instructions to the Zba-extension
      target/riscv: Remove the W-form instructions from Zbs
      target/riscv: Remove shift-one instructions (proposed Zbo in pre-0.=
93 draft-B)
      target/riscv: Reassign instructions to the Zbs-extension
      target/riscv: Add instructions of the Zbc-extension
      target/riscv: Reassign instructions to the Zbb-extension
      target/riscv: Add orc.b instruction for Zbb, removing gorc/gorci
      target/riscv: Add a REQUIRE_32BIT macro
      target/riscv: Add rev8 instruction, removing grev/grevi
      target/riscv: Add zext.h instructions to Zbb, removing pack/packu/p=
ackh
      target/riscv: Remove RVB (replaced by Zb[abcs])
      disas/riscv: Add Zb[abcs] instructions

Philippe Mathieu-Daud=C3=A9 (3):
      hw/char/mchp_pfsoc_mmuart: Simplify MCHP_PFSOC_MMUART_REG definitio=
n
      hw/char/mchp_pfsoc_mmuart: Use a MemoryRegion container
      hw/char/mchp_pfsoc_mmuart: QOM'ify PolarFire MMUART

 include/hw/char/mchp_pfsoc_mmuart.h     |  17 +-
 target/riscv/cpu.h                      |  11 +-
 target/riscv/helper.h                   |   6 +-
 target/riscv/insn32.decode              | 115 ++++-----
 disas/riscv.c                           | 157 +++++++++++-
 hw/char/ibex_uart.c                     |   1 +
 hw/char/mchp_pfsoc_mmuart.c             | 116 +++++++--
 hw/char/shakti_uart.c                   |   1 +
 hw/char/sifive_uart.c                   |   1 +
 hw/dma/sifive_pdma.c                    |  13 +-
 hw/riscv/shakti_c.c                     |   7 +
 target/riscv/bitmanip_helper.c          |  65 +----
 target/riscv/cpu.c                      |  30 +--
 target/riscv/translate.c                |  36 ++-
 target/riscv/insn_trans/trans_rvb.c.inc | 419 ++++++++++----------------=
------
 15 files changed, 516 insertions(+), 479 deletions(-)

