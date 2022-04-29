Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C127751416F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 06:33:38 +0200 (CEST)
Received: from localhost ([::1]:60740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkIK1-00009R-EM
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 00:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIIA-0005uT-CK
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:31:42 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkII7-0002S9-LW
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:31:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651206698; x=1682742698;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6TQdPVOjCDUn7CSib6cvvA9Gcrcr+LpBPm7mS6DF+Jk=;
 b=gA0NC97PfJUYsuQXLI83G0wo5Q/Rc46FVMd8BLvV90/p5U5hiZkJ/PF9
 XjEORUTyRWcWUhppa4/1LslFK1loKbF01UO4Z+Bk3SDc1DEHxpDLVDehI
 UdGQb2W9HuH5NcpMNnldKGrC3LayVVrQQI+q/8H0e8aS4P4Yp1YW0MrBE
 CrCaTHmEEnr8+VA89gGYi6K9LoioT/m/OTQhQR4IX3Mz025HK8s4J1eNs
 50myS+ef0IwTJD8kdbXlNL2FNUC0XvgRd8WDDWhH0MD+C5UYdDDE/TsTv
 NSLWTQmbICdijqu4tbH33HMwntybxPTgjUJnSUjsqjACxnEyhcMesxrHk Q==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647273600"; d="scan'208";a="203995885"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Apr 2022 12:31:34 +0800
IronPort-SDR: P89qzzSkZNDZ6S/ae0HWyCWIwhsQZKTmZoEJbeTkf6BU1DbzRA8B3Vpwk9jjpPSbAxbu6b7Abk
 lI0woOG1C3M/Ra6SGdmwomgoM9/K/S+IJ8fJhHsgIRJRKi4tSnbppzBxZoLOqjvGN7PxDJL+nJ
 Bv8c8grr9JP4u/CittYc10S5jfvQfSqSS4Pj7wDFN1voYuGGea7NjJVU1enT+R4PcoY2qogqDJ
 cu6BwOzLpZCsXQ101Ciq1axkKKA9rz3vF0DJChlXf9j++EptsPbzi/DYyiOIuIogpyxO24dpX3
 kdt3eIeBl+mdw6fZvMe7S82p
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:01:43 -0700
IronPort-SDR: rgv9tcEpoDEBHwP7Oyy+xL/XjTnqQaHpB6ekLshxuNzsNauHRAou47QTC2qnWtWDUVFDrTrq5a
 qNVgYb0lM9mh4ZUNPbjrsHt07FeDbZgOlLAJGgWpD963EnK3bRLD1f3JkaRSIxel4w5ZUEJcn9
 1so0VBDL/HzPL7wpVzKD/ystQRNczdIob+AJm4xCNB7fkZnXuYnoW05RNdKhj0AQBb9AfoBH/G
 QuiPO3Agot2ewrrSjSc4jb+dJ512Aukc7JCebQ/UmdzjAsZuvm+tMwbiHKlHWO52VlylltMzdi
 gr4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:31:35 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KqKLv2gNdz1SVnx
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 21:31:35 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1651206694; x=1653798695; bh=6TQdPVOjCDUn7CSib6cvvA9Gcrcr+LpB
 Pm7mS6DF+Jk=; b=YL4fYoVxdkixF0+9poJ7iqJuX6o4e3SRXa+vfm4DdFyRRSTI
 50XpUOx5nm92XwfWhU8NPZDsaT/WcpLhGOcWm5mdG+OBPVmJADRQRCbh3Aj0qLfm
 Hpt53/Co0WmbGpSYLzHz73QArY6sid3JzD5AmK9kq2oCUFppC746uq7iM8J7165z
 JyXdJ6dJK15vjAzmT6MU3aFrQ7PjqRU3Bhmckhhwc9S19hNX9nCBRGOZba4j9PjY
 lQ06SeywcV8WlHc6MHEVFy1qNAb3rVHvne1LF28NZgwKai2N9rGZiGThDDxOyJg8
 Pg3qGx5Ion6N5vnzBxc6BANiafkYpd0/qQzKnQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 5M96OeWvpyjV for <qemu-devel@nongnu.org>;
 Thu, 28 Apr 2022 21:31:34 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KqKLr2qPGz1Rvlc;
 Thu, 28 Apr 2022 21:31:31 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 00/25] riscv-to-apply queue
Date: Fri, 29 Apr 2022 14:30:54 +1000
Message-Id: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=111bf31fc=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

The following changes since commit f22833602095b05733bceaddeb20f3edfced3c=
07:

  Merge tag 'pull-target-arm-20220428' of https://git.linaro.org/people/p=
maydell/qemu-arm into staging (2022-04-28 08:34:17 -0700)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220429

for you to fetch changes up to 325b7c4e7582c229d28c47123c3b986ed948eb84:

  hw/riscv: Enable TPM backends (2022-04-29 10:48:48 +1000)

----------------------------------------------------------------
Second RISC-V PR for QEMU 7.1

 * Improve device tree generation
 * Support configuarable marchid, mvendorid, mipid CSR values
 * Add support for the Zbkb, Zbkc, Zbkx, Zknd/Zkne, Zknh, Zksed/Zksh and =
Zkr extensions
 * Fix incorrect PTE merge in walk_pte
 * Add TPM support to the virt board

----------------------------------------------------------------
Alistair Francis (6):
      hw/riscv: virt: Add a machine done notifier
      hw/core: Move the ARM sysbus-fdt to core
      hw/riscv: virt: Create a platform bus
      hw/riscv: virt: Add support for generating platform FDT entries
      hw/riscv: virt: Add device plug support
      hw/riscv: Enable TPM backends

Bin Meng (2):
      hw/riscv: spike: Add '/chosen/stdout-path' in device tree unconditi=
onally
      hw/riscv: Don't add empty bootargs to device tree

Frank Chang (1):
      target/riscv: Support configuarable marchid, mvendorid, mipid CSR v=
alues

Ralf Ramsauer (1):
      target/riscv: Fix incorrect PTE merge in walk_pte

Weiwei Li (15):
      target/riscv: rvk: add cfg properties for zbk* and zk*
      target/riscv: rvk: add support for zbkb extension
      target/riscv: rvk: add support for zbkc extension
      target/riscv: rvk: add support for zbkx extension
      crypto: move sm4_sbox from target/arm
      target/riscv: rvk: add support for zknd/zkne extension in RV32
      target/riscv: rvk: add support for zkne/zknd extension in RV64
      target/riscv: rvk: add support for sha256 related instructions in z=
knh extension
      target/riscv: rvk: add support for sha512 related instructions for =
RV32 in zknh extension
      target/riscv: rvk: add support for sha512 related instructions for =
RV64 in zknh extension
      target/riscv: rvk: add support for zksed/zksh extension
      target/riscv: rvk: add CSR support for Zkr
      disas/riscv.c: rvk: add disas support for Zbk* and Zk* instructions
      target/riscv: rvk: expose zbk* and zk* properties
      target/riscv: add scalar crypto related extenstion strings to isa_s=
tring

 docs/system/riscv/virt.rst              |  20 ++
 include/crypto/sm4.h                    |   6 +
 include/hw/{arm =3D> core}/sysbus-fdt.h   |   0
 include/hw/riscv/virt.h                 |   8 +-
 target/riscv/cpu.h                      |  17 ++
 target/riscv/cpu_bits.h                 |   9 +
 target/riscv/helper.h                   |  22 ++
 target/riscv/pmp.h                      |   8 +-
 target/riscv/insn32.decode              |  97 ++++++--
 crypto/sm4.c                            |  49 ++++
 disas/riscv.c                           | 173 +++++++++++++-
 hw/arm/virt.c                           |   2 +-
 hw/arm/xlnx-versal-virt.c               |   1 -
 hw/{arm =3D> core}/sysbus-fdt.c           |   2 +-
 hw/riscv/microchip_pfsoc.c              |   2 +-
 hw/riscv/sifive_u.c                     |   2 +-
 hw/riscv/spike.c                        |   7 +-
 hw/riscv/virt.c                         | 319 +++++++++++++++++---------
 target/arm/crypto_helper.c              |  36 +--
 target/riscv/bitmanip_helper.c          |  80 +++++++
 target/riscv/cpu.c                      |  58 +++++
 target/riscv/crypto_helper.c            | 302 ++++++++++++++++++++++++
 target/riscv/csr.c                      | 118 +++++++++-
 target/riscv/monitor.c                  |  11 +-
 target/riscv/op_helper.c                |   9 +
 target/riscv/translate.c                |   8 +
 target/riscv/insn_trans/trans_rvb.c.inc | 116 ++++++++--
 target/riscv/insn_trans/trans_rvk.c.inc | 391 ++++++++++++++++++++++++++=
++++++
 crypto/meson.build                      |   1 +
 hw/arm/meson.build                      |   1 -
 hw/core/meson.build                     |   1 +
 hw/riscv/Kconfig                        |   2 +
 target/riscv/meson.build                |   3 +-
 33 files changed, 1682 insertions(+), 199 deletions(-)
 create mode 100644 include/crypto/sm4.h
 rename include/hw/{arm =3D> core}/sysbus-fdt.h (100%)
 create mode 100644 crypto/sm4.c
 rename hw/{arm =3D> core}/sysbus-fdt.c (99%)
 create mode 100644 target/riscv/crypto_helper.c
 create mode 100644 target/riscv/insn_trans/trans_rvk.c.inc

