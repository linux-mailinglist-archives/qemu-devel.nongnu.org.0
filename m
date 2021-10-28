Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B0943DA8A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 06:47:45 +0200 (CEST)
Received: from localhost ([::1]:49964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfxKK-0001ea-Ig
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 00:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxGi-0007gJ-2q
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:44:00 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:41703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxGf-0001GX-A2
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:43:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635396237; x=1666932237;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TGJt0n0LmddYT2UdTE2+Xhe+xmz8vhN2tfxSNdEgUs8=;
 b=PQQ4kX99EhmPcwuV58QsIovUR64YQeuqptDfjyYM5hM1e/rWMR1hRzbO
 0uJ1zRX1ZPBysruUHr/OX8c4/8Qx5i+jhYjuWP502tV/DkwFkB8pUdYXH
 HeuSwJMOcME+qDjRAFZLD3YAq1t+M3I5ZpjNvZOjxRiok7rhs0o+rxqoW
 dCnRK2letf1yo3nQBOSWJf4SijuEOznE7gIZRnE/z4u50w0sBRPSEvcqp
 k7E5IDv7RfqYW8YkP3ocsDsV5ilLWGtTA6td6Pi77W971QGACdRZ55+bg
 mUIDqjNDj/lQNnfZgdajI8PkpNHJ1kcZyc0iKa6r0zdh+en4jCrTehv6L Q==;
X-IronPort-AV: E=Sophos;i="5.87,188,1631548800"; d="scan'208";a="184975462"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2021 12:43:54 +0800
IronPort-SDR: E34cTRWl6qF1wBJ8ca+2k54CDTFXYlqVr2BfGfocRoeDgBAgoJr9maw9OkAZ94dGo0CMkbboiS
 +QNqsPCw0Q5aXwJubjbktqqOPFMkTi2DrZKzweF0yvr6nb/0dve8a/fFwzH4OnwnDI1UeiqSH0
 5w6E18Gg1RgyLRtsHoYH7+pWNAQeLh8l96jsKL7+RijuBQkkuCRbVmECacnvzwZSxrTQKr5w1J
 U4XoxLVNVdbEfmdnoO7D1PMUrfUjvWVIs6vMxqNPvuXRcX1sCnB9VhtfZIGBANV6bM2bHr490P
 fqBbBx/HBo5LN/UE96JmrbOy
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:17:49 -0700
IronPort-SDR: ph056GA5vJ3oh/9wgjlrMkxkHSX8PnwddXJ2DD1KGMjQOwHhm2c3WBFm+R1hW4gBLgPRxBsAJn
 Axv/aKCjEvVsj/tPWdxlPYvVEMuWMr+DBOUnGnH4vAfj7hLlG++WbPnF9Qf88fSTQWtdAo3cAw
 rTwFPB77YKLYTPt5bAozvHuY1pIL3Q2ZtA19luFjqGMfMQ43JBGpM+j5J+u8UIgYetlaPN8sZr
 7NMOjQM6g4yXj2qLMMPcC2r9F5q6mI7Y6p+WwncT4J24GTt1AuLRNhFYe2apgVLlU9ezbBhDIh
 59I=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:43:54 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HftHY5qM9z1RtVn
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 21:43:53 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1635396233; x=1637988234; bh=TGJt0n0LmddYT2UdTE2+Xhe+xmz8vhN2
 tfxSNdEgUs8=; b=YhkbITwi5hcVzmO9Bqu4EwQpihj7MkjSY1Y/cGKdbCdoqsu2
 Y/BabBP1w/ENfq98M99c85ljFQpwKM8kLoPXfhB7Fx0SwutXhSJa0pUFdXiwGyjC
 dCHl0NHVExZq8MGUbwj1xZUbq6hzfOfg8/AJ6/l+VdL5IfoSTbPRjQpNzwr6WU/T
 hNlVPiKix8Kv9H2UYxFuBpIDdcWdyYMOpLDTt3nXzzOP+BZ4RuG2l/q5AwBxeAQa
 Xp5faFCJpLhcBBLRaSqmd+AdcJlr/nwMwRj56XLhND1ScpV5tPErO1gidp6ucz0F
 kW2HRXfow9VPWz1avEByVlG0ZoGlsJmMNdnZ/A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id TDK4LWBYMqVR for <qemu-devel@nongnu.org>;
 Wed, 27 Oct 2021 21:43:53 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HftHV5BJgz1RtVl;
 Wed, 27 Oct 2021 21:43:50 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 00/18] riscv-to-apply queue
Date: Thu, 28 Oct 2021 14:43:24 +1000
Message-Id: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=928ee31ee=alistair.francis@opensource.wdc.com;
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

The following changes since commit c52d69e7dbaaed0ffdef8125e79218672c3016=
1d:

  Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-2021102=
7' into staging (2021-10-27 11:45:18 -0700)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20211028

for you to fetch changes up to 344b61e1478c8eb37e81b96f63d8f5071f5a38e1:

  target/riscv: remove force HS exception (2021-10-28 14:39:23 +1000)

----------------------------------------------------------------
Fifth RISC-V PR for QEMU 6.2

 - Use a shared PLIC config helper function
 - Fixup the OpenTitan PLIC configuration
 - Add support for the experimental J extension
 - Update the fmin/fmax handling
 - Fixup VS interrupt forwarding

----------------------------------------------------------------
Alexey Baturo (7):
      target/riscv: Add J-extension into RISC-V
      target/riscv: Add CSR defines for RISC-V PM extension
      target/riscv: Support CSRs required for RISC-V PM extension except =
for the h-mode
      target/riscv: Add J extension state description
      target/riscv: Print new PM CSRs in QEMU logs
      target/riscv: Support pointer masking for RISC-V for i/c/f/d/a type=
s of instructions
      target/riscv: Allow experimental J-ext to be turned on

Alistair Francis (6):
      hw/riscv: virt: Don't use a macro for the PLIC configuration
      hw/riscv: boot: Add a PLIC config string function
      hw/riscv: sifive_u: Use the PLIC config helper function
      hw/riscv: microchip_pfsoc: Use the PLIC config helper function
      hw/riscv: virt: Use the PLIC config helper function
      hw/riscv: opentitan: Fixup the PLIC context addresses

Anatoly Parshintsev (1):
      target/riscv: Implement address masking functions required for RISC=
-V Pointer Masking extension

Chih-Min Chao (2):
      softfloat: add APIs to handle alternative sNaN propagation for fmax=
/fmin
      target/riscv: change the api for RVF/RVD fmin/fmax

Jose Martins (2):
      target/riscv: fix VS interrupts forwarding to HS
      target/riscv: remove force HS exception

 include/fpu/softfloat.h                 |  10 ++
 include/hw/riscv/boot.h                 |   2 +
 include/hw/riscv/microchip_pfsoc.h      |   1 -
 include/hw/riscv/sifive_u.h             |   1 -
 include/hw/riscv/virt.h                 |   1 -
 target/riscv/cpu.h                      |  17 +-
 target/riscv/cpu_bits.h                 | 102 +++++++++++-
 fpu/softfloat.c                         |  19 ++-
 hw/riscv/boot.c                         |  25 +++
 hw/riscv/microchip_pfsoc.c              |  14 +-
 hw/riscv/opentitan.c                    |   4 +-
 hw/riscv/sifive_u.c                     |  14 +-
 hw/riscv/virt.c                         |  20 +--
 target/riscv/cpu.c                      |  13 ++
 target/riscv/cpu_helper.c               |  72 +++-----
 target/riscv/csr.c                      | 285 ++++++++++++++++++++++++++=
++++++
 target/riscv/fpu_helper.c               |  16 +-
 target/riscv/machine.c                  |  27 +++
 target/riscv/translate.c                |  43 +++++
 fpu/softfloat-parts.c.inc               |  25 ++-
 target/riscv/insn_trans/trans_rva.c.inc |   3 +
 target/riscv/insn_trans/trans_rvd.c.inc |   2 +
 target/riscv/insn_trans/trans_rvf.c.inc |   2 +
 target/riscv/insn_trans/trans_rvi.c.inc |   2 +
 24 files changed, 605 insertions(+), 115 deletions(-)

