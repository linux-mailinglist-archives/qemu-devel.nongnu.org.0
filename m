Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7777A5E72B7
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 06:12:16 +0200 (CEST)
Received: from localhost ([::1]:52264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oba2x-0007a3-DC
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 00:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2580c328f=alistair.francis@opensource.wdc.com>)
 id 1obZyE-0001Qw-5l
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:07:22 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:63921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2580c328f=alistair.francis@opensource.wdc.com>)
 id 1obZyA-0005XX-Lw
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:07:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1663906038; x=1695442038;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=szxt/NUyOqHPtS+84Xtkf8K+XCpiiSZJcNs43xXVb9w=;
 b=Hp9Eyk3evaCGCJkU7pE7OMeuDedtlvc6JKInAGmSh5ogeIqMo0aR0Av+
 8WiZUB2iWfPiKcefwm9URZZxA/A5DtiPnNad5WRqNB0PoZ5YYTyuD5j33
 u6VvInDWeRaKCTRLZd5yMkMGxq/tY1fnRmt2q4xfUUK/qrXwSeaDt7qPp
 nO2AzFhxPLSNKT2Yx6aJT6x1nTmvJV1f+IkvDcqlpAQ82QuDAzOACJhY+
 3B5aBO7RhWDkuEBJIok2XKtgCld/QMFaCHQ//YXJ4bgaxSIB8zNvm0gay
 94MqDP1VhudSCBtnqknk6mjeSZ1cPwmwfxL4XdeE7oHMQ6GBI71hNohCQ w==;
X-IronPort-AV: E=Sophos;i="5.93,337,1654531200"; d="scan'208";a="212510434"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Sep 2022 12:07:12 +0800
IronPort-SDR: QrPQsj8SoiRe2DT0P+O8pCChjOVlSqLb1O+Hhau8Hbo8X4yNOyctxFU8usfqefQvmz2Jy/hMj8
 6jSIH9s2nxEAuUkcRIgagLJx1ccXEkYgIJqhAH0TQwfdjCTP2hEkzRuLX36VmIDpo47ZEhvkZg
 JFI32ZT5F1kdalnq9431ATlry3foNh49zbCvJ0g5JszBSGcwryJtTt+IgiR5dOb2GhT5z1f20j
 WO7Wd0e+QByJFJqFP2P7mXq2Svfpx43K/AUFl21xiJ29t+55rn+ajULfOxOpxUVDRyKz2cdoWt
 fUl6u1lns2e6nofIYgQbZ7SS
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 20:27:15 -0700
IronPort-SDR: 1Qwdukku+8CPrdbP1TECC8BV7VARjlBO4m2dYDBVDdaqbbUW5kiQscliOkC3AFO5PrkWAHF/YD
 NURo5X3PX7ny/YJBxzZtt0PmdXAUgQrtKbCvJ5zVUzPkV89bLkRamCHR05dizFiOLSKDLnQm8S
 OSrCBFx+lQGF41Ivrih5WME8ANFSrUuhKZzFxDK61NXWO+aqfya5LSWTTEKmkbUmkdM7J3nK9G
 YnTK+dqdlHjtR5iakXyqoJTIpxazg+p7Ag60/x77YH5X4tSruxOWQ7qE5j8WY1/ih8+pO66VG7
 Xes=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 21:07:12 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MYdrw43blz1RwqL
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 21:07:12 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1663906031; x=1666498032; bh=szxt/NUyOqHPtS+84Xtkf8K+XCpiiSZJ
 cNs43xXVb9w=; b=YNLzHSERcj+KfJxIldNXAzk+hxKR9BoGVXcjH5i8LCJQz6LI
 8suyb4ieTbqrMphmRyz5PHb38JdipRN7iPEUmbVZJu810ruoLJKWCQpRjfysPO5D
 mlxjUE9k8uFXzfQVFTl5LNatZaKxPdg4mxNUaZffu1JYb/9YXVupHKdOVm9dAtwl
 1duEsrz3aCVmVGiyVdR9sZ8BCW1IZGPiq+bwSv3QxRdJjc6OWzSQIySr9adIIMdL
 gkU02V0lx3oYoAndesB7wbRlczqJW1aziKAgb8WOXf0MUul5+NXTNXQbLE2xM8Tq
 JAt+myn1U1LGW6DDXVrjAWJ815CDEeXAWXgHpg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id KaNLZiQPtXEP for <qemu-devel@nongnu.org>;
 Thu, 22 Sep 2022 21:07:11 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MYdrt1gbVz1RvLy;
 Thu, 22 Sep 2022 21:07:09 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 00/12] riscv-to-apply queue
Date: Fri, 23 Sep 2022 14:06:52 +1000
Message-Id: <20220923040704.428285-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=2580c328f=alistair.francis@opensource.wdc.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

The following changes since commit 6160d8ff81fb9fba70f5dad88d43ffd0fa4498=
4c:

  Merge tag 'edgar/xilinx-next-2022-09-21.for-upstream' of https://github=
.com/edgarigl/qemu into staging (2022-09-22 13:24:28 -0400)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git pull-riscv-to-apply-20220923-2

for you to fetch changes up to a4260684f8e2c8722d1feae0d41d956fc4109007:

  hw/riscv/sifive_e: Fix inheritance of SiFiveEState (2022-09-23 09:11:34=
 +1000)

----------------------------------------------------------------
Second RISC-V PR for QEMU 7.2

* Fixup typos and register addresses for Ibex SPI
* Cleanup the RISC-V virt machine documentation
* Remove the sideleg and sedeleg CSR macros
* Fix the CSR check for cycle{h}, instret{h}, time{h}, hpmcounter3-31{h}
* Remove fixed numbering from GDB xml feature files
* Allow setting the resetvec for the OpenTitan machine
* Check the correct exception cause in vector GDB stub
* Fix inheritance of SiFiveEState

----------------------------------------------------------------
Alex Benn=C3=A9e (1):
      docs/system: clean up code escape for riscv virt platform

Alistair Francis (3):
      target/riscv: Set the CPU resetvec directly
      hw/riscv: opentitan: Fixup resetvec
      hw/riscv: opentitan: Expose the resetvec as a SoC property

Andrew Burgess (2):
      target/riscv: remove fflags, frm, and fcsr from riscv-*-fpu.xml
      target/riscv: remove fixed numbering from GDB xml feature files

Bernhard Beschow (1):
      hw/riscv/sifive_e: Fix inheritance of SiFiveEState

Frank Chang (1):
      target/riscv: Check the correct exception cause in vector GDB stub

Rahul Pathak (1):
      target/riscv: Remove sideleg and sedeleg

Weiwei Li (1):
      target/riscv: fix csr check for cycle{h}, instret{h}, time{h}, hpmc=
ounter3-31{h}

Wilfred Mallawa (2):
      hw/ssi: ibex_spi: fixup typos in ibex_spi_host
      hw/ssi: ibex_spi: update reg addr

 docs/system/riscv/virt.rst   | 13 +++++++++----
 include/hw/riscv/opentitan.h |  2 ++
 include/hw/riscv/sifive_e.h  |  3 ++-
 target/riscv/cpu.h           |  3 +--
 target/riscv/cpu_bits.h      |  2 --
 disas/riscv.c                |  2 --
 hw/riscv/opentitan.c         |  8 +++++++-
 hw/ssi/ibex_spi_host.c       |  8 ++++----
 target/riscv/cpu.c           | 13 +++----------
 target/riscv/csr.c           | 13 +++++++++----
 target/riscv/gdbstub.c       | 36 ++++--------------------------------
 target/riscv/machine.c       |  6 +++---
 gdb-xml/riscv-32bit-cpu.xml  |  6 +-----
 gdb-xml/riscv-32bit-fpu.xml  | 10 +---------
 gdb-xml/riscv-64bit-cpu.xml  |  6 +-----
 gdb-xml/riscv-64bit-fpu.xml  | 10 +---------
 16 files changed, 48 insertions(+), 93 deletions(-)

