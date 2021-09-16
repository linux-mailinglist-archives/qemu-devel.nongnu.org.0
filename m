Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F308640ECEA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 23:51:30 +0200 (CEST)
Received: from localhost ([::1]:50666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQzI0-0006gl-RJ
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 17:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzG0-00046L-Vl
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:49:25 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:30118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzFx-0001yu-H6
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:49:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631828961; x=1663364961;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LYX78ujr6cJqHeD7RNx5UIJ6xm1ApKAZpSWUyRulb98=;
 b=qnuxkj1vs7FqXtENs5u5+ytFA8amJG310176Ze3gS+ihI1gZNRmxef21
 V49feD1cQaqU2kI4IWSjerHlByBOrt06ZX6XlReZ32KxnhNRRwyITSNPe
 lbrAWim6jr1hC/BTz4TJLC/UGJroM8aafqZ7xD5ZYlUdT9he5RGew+uF7
 xA4lEfH0KziO8x+3AXMSCNSjJl1pTG0VM7/rzjFXSLSRuu1+kaDktn2Ux
 HgZXu9Oukeg6g0UB2GYTe/tZBZPiqXAw722P43NJb4pxKVF98fldjPj7q
 8MUj0qe4QsaAfVXKNN9CjTB6b3N9zvSojwxBghBGOTRXlY4lm4o7mimAK w==;
X-IronPort-AV: E=Sophos;i="5.85,299,1624291200"; d="scan'208";a="291828375"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2021 05:49:16 +0800
IronPort-SDR: GrXU9fO6xSePQNDGyTcsFx0wQ48B2l2zkU9cZlSg6JxZVAdOEVSYuNRMyu4IN2dhDKgsAjcZp0
 K9ZguWV/km6lPoApdrWCPuULLOyf+n25oqwMdFc0Z66VbYO4NLAt48gbuyHnRKtWq2NQnXkJMU
 Uy77ztMXVYB9Q2Tyniqc6KtB12hVLQ3sVH5itM2cEYgaxzxo0B2RdwqWdzODTG7fxuVqh9btoc
 oX7svYWle0pEBv4G95NwcmpUC8RmyroJhlNw3bygk88FGC/1x15FQpYWgMixqrJHfAKGe7FMyP
 U1UkaBQflB2vyXGLVEvnJU6g
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:24:03 -0700
IronPort-SDR: ODKHjHxdgIQekv1Qz3yHLY3iSrOaAnf2vNblWursk5mMcF08LOXMt9sKiYuyNqE4ZtVYcOqrTd
 sc0q5+GkBy/+I8UqMcvCxIs/xOzTQnYLqOdNieGRaCRW84ZU7XCaRmF1niGLE2KHFSkb7Kj4Qt
 tM8bOxPaQmIqfzHoQP0gfxrCHWwyx6F9dz2TbAKWOneY4yd0bomB+L3wHWKkVg8xlN1FlUBhf3
 Tbt8ropL7NaaS+GeimVMTigKVLGeIx09IXnrzd4eMFcXq2jTxJgflUfAVmB3KgFldR8PZIIRpS
 ptk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:49:17 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H9W24280Wz1Rws4
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 14:49:16 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1631828954; x=1634420955; bh=LYX78ujr6cJqHeD7RNx5UIJ6xm1ApKAZ
 pSWUyRulb98=; b=B0azXbvlJqly6LlRmUt8LrmFE0NL/Pvm95SYeVPRTX1QGMez
 zW+kNw97BZ823dDCEF6bMeuuz1LY5UOtuGTwVh5NegFYaGBh96Rsmo5RMVBIvyrx
 t+KRVjrgDxLRBkfxSd0kDVd4sxQ2xYZC2MSP2s+nldVOMT6dRawCBBkGL5q0LOrq
 RNFYrArAQV4gSAo+xhLC/PyGc62TRkcIOIqEtkAqFqIzEIndUTBT3yuE/oOLytmr
 Q4v8JjjV3oPzLRHl1ZqVLZrg9QEBLHiSdqKyQ0cETra26C9UsCJQeN3stvj2AM+G
 oY1SgQ3O3wlLHa4tdYGVM2Yu5x2gaV+354ZlOg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id djQZe8pNjKM1 for <qemu-devel@nongnu.org>;
 Thu, 16 Sep 2021 14:49:14 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.23])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H9W1z1pFbz1RvlV;
 Thu, 16 Sep 2021 14:49:10 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 00/21] riscv-to-apply queue
Date: Fri, 17 Sep 2021 07:48:43 +1000
Message-Id: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=886e160e1=alistair.francis@opensource.wdc.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

The following changes since commit d1fe59377bbbf91dfded1f08ffe3c636e9db8d=
c0:

  Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6=
.2-pull-request' into staging (2021-09-16 16:02:31 +0100)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210917

for you to fetch changes up to c14620db9b66de88bb4fef1d0cfc283bb3d53f85:

  hw/riscv: opentitan: Correct the USB Dev address (2021-09-17 07:43:55 +=
1000)

----------------------------------------------------------------
Second RISC-V PR for QEMU 6.2

 - ePMP CSR address updates
 - Convert internal interrupts to use QEMU GPIO lines
 - SiFive PWM support
 - Support for RISC-V ACLINT
 - SiFive PDMA fixes
 - Update to u-boot instructions for sifive_u
 - mstatus.SD bug fix for hypervisor extensions
 - OpenTitan fix for USB dev address

----------------------------------------------------------------
Alistair Francis (9):
      target/riscv: Update the ePMP CSR address
      target/riscv: Expose interrupt pending bits as GPIO lines
      hw/intc: sifive_clint: Use RISC-V CPU GPIO lines
      hw/intc: ibex_plic: Convert the PLIC to use RISC-V CPU GPIO lines
      hw/intc: sifive_plic: Convert the PLIC to use RISC-V CPU GPIO lines
      hw/intc: ibex_timer: Convert the timer to use RISC-V CPU GPIO lines
      hw/timer: Add SiFive PWM support
      sifive_u: Connect the SiFive PWM device
      hw/riscv: opentitan: Correct the USB Dev address

Anup Patel (4):
      hw/intc: Rename sifive_clint sources to riscv_aclint sources
      hw/intc: Upgrade the SiFive CLINT implementation to RISC-V ACLINT
      hw/riscv: virt: Re-factor FDT generation
      hw/riscv: virt: Add optional ACLINT support to virt machine

Bin Meng (2):
      docs/system/riscv: sifive_u: Update U-Boot instructions
      target/riscv: csr: Rename HCOUNTEREN_CY and friends

Frank Chang (4):
      hw/dma: sifive_pdma: reset Next* registers when Control.claim is se=
t
      hw/dma: sifive_pdma: claim bit must be set before DMA transactions
      hw/dma: sifive_pdma: don't set Control.error if 0 bytes to transfer
      target/riscv: Backup/restore mstatus.SD bit when virtual register s=
wapped

Green Wan (1):
      hw/dma: sifive_pdma: allow non-multiple transaction size transactio=
ns

LIU Zhiwei (1):
      target/riscv: Fix satp write

 docs/system/riscv/sifive_u.rst |  50 ++--
 docs/system/riscv/virt.rst     |  10 +
 include/hw/intc/ibex_plic.h    |   2 +
 include/hw/intc/riscv_aclint.h |  80 +++++
 include/hw/intc/sifive_clint.h |  60 ----
 include/hw/intc/sifive_plic.h  |   4 +
 include/hw/riscv/sifive_u.h    |  14 +-
 include/hw/riscv/virt.h        |   2 +
 include/hw/timer/ibex_timer.h  |   2 +
 include/hw/timer/sifive_pwm.h  |  62 ++++
 target/riscv/cpu_bits.h        |  12 +-
 hw/dma/sifive_pdma.c           |  54 +++-
 hw/intc/ibex_plic.c            |  17 +-
 hw/intc/riscv_aclint.c         | 460 +++++++++++++++++++++++++++++
 hw/intc/sifive_clint.c         | 287 ------------------
 hw/intc/sifive_plic.c          |  30 +-
 hw/riscv/microchip_pfsoc.c     |  13 +-
 hw/riscv/opentitan.c           |  13 +-
 hw/riscv/shakti_c.c            |  16 +-
 hw/riscv/sifive_e.c            |  15 +-
 hw/riscv/sifive_u.c            |  68 ++++-
 hw/riscv/spike.c               |  16 +-
 hw/riscv/virt.c                | 654 ++++++++++++++++++++++++++++-------=
------
 hw/timer/ibex_timer.c          |  17 +-
 hw/timer/sifive_pwm.c          | 468 +++++++++++++++++++++++++++++
 target/riscv/cpu.c             |  31 ++
 target/riscv/cpu_helper.c      |   3 +-
 target/riscv/csr.c             |  26 +-
 hw/intc/Kconfig                |   2 +-
 hw/intc/meson.build            |   2 +-
 hw/riscv/Kconfig               |  13 +-
 hw/timer/Kconfig               |   3 +
 hw/timer/meson.build           |   1 +
 hw/timer/trace-events          |   6 +
 34 files changed, 1844 insertions(+), 669 deletions(-)
 create mode 100644 include/hw/intc/riscv_aclint.h
 delete mode 100644 include/hw/intc/sifive_clint.h
 create mode 100644 include/hw/timer/sifive_pwm.h
 create mode 100644 hw/intc/riscv_aclint.c
 delete mode 100644 hw/intc/sifive_clint.c
 create mode 100644 hw/timer/sifive_pwm.c

