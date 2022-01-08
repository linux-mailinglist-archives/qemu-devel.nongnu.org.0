Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B844881B8
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 06:56:54 +0100 (CET)
Received: from localhost ([::1]:55402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n64ij-00026J-8o
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 00:56:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64dH-0007od-4u
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:51:15 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:10162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64dE-0006il-78
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:51:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621070; x=1673157070;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uTfM3GUde/NvVvQU3RI1tNtZB2axXu1miltqA3wtEpA=;
 b=GxOFAfcqvtpwHalmeCxkeBoxO5QUcz/sc2ra/EskppRWAFwgjBIR524n
 B4279ZuV8WboOU/dg2JeMluOxVpqNEYpv8YD3rQvyWZmQ37q84vzEAHFy
 Zn4DBxpoYlbVhSUpNOs9GCQ4RzgNMktSE1P6LZtLfw3tYADr+nZ3zoldB
 w0Lrjp5aeQtQx/dfoss5XTAXvkYG+r+b6uFrfdcTDVvjbViCYjiGELxPa
 goDjjOGixUI+cucpmtbA1N1pX+pj1fRlCZESbkyRyEFq8smSTL3Z/Ym8W
 /522uv3JgiF1KTu+gyuvCLdY6ZsEOoPQjOsRpxikMO9DF2rJo65Q0BNz8 Q==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="194779697"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:51:06 +0800
IronPort-SDR: GquWVs9O/mzptLKcHCdPV9hgEKXPwHKAEguE5ru4kmiOprYaEuXYyzKlRqIwkfkFRwcDBJovp6
 pg0AvS6Y2gefiftsYIadXF/QAoyPjMGkR9RuMsQdNGhDeaJqpq7cVR1nZNilHPqlBmic53GBxK
 YfQaoVfIs7ic5kkJekhs9aBuQBo1AKAwoCrhSJRDg5uib8mI6r+T3zYfYqJEusT0K+lIuT6SCu
 pt5sZZEMzsjnX/lKlws+V/eFkcs2WqjQnxzi0XMKJkNp7O9YxHMQxNr2wiOhgzOmoNtm5QH6yi
 0P7OL7zEJ4tkaQDkyIw53KfO
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:24:55 -0800
IronPort-SDR: XoPzoPU68N8PXojmN5bIdNDUA+8ZDyvQbF/pRFEAXLa2YMmO95oQZwljNmDUL6ZzF63EyIN1B7
 Ik008fJDYErrh6d7UICC3ve+706JXceRaZ7Xbb7XYP7XZiYkFy8cEMKwielPNo/dFmDlAQ0oIu
 zIBNz3ub1iuL2Qtr9uOqCM+riqKG+OSP9F5YGJQ4X5eTDXkVPe/tANtaez+WwldSbrMjRaSVOc
 GQ6iz615ZDHjp+hgh3EYPcXlFz1KREZ9x853Df4OQ1Ww1Vor1RCRUUJR/Z7zUboVY7kHAO1pUG
 nQs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:51:08 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8Mv3WD3z1VSkY
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:51:07 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1641621067; x=1644213068; bh=uTfM3GUde/NvVvQU3RI1tNtZB2axXu1m
 iltqA3wtEpA=; b=Qga2/Z8VfAqgOGWTDgP7ZrkPffxGRUZm4zszkd+zz6c+ELEz
 J4Moh2dpchkS+zHcbJ82Gspc2w3WD9DVl8iXpl/A5U27f8IELk6ninAsBLOccG7m
 qmlPNiXnJX/ALD3GliF7U01kv0Uc66WrqB/NFhyj/s+OXApcSxKzIWHJ22ndWjoh
 egwzFOQmHRxLoI8cOFXuwye6808Pe9lPzni22dQWiT96Hku6cIporBe4z0jF7L9e
 w+pnCDAYcNOxIGn8WxMSZ1F2JnI+sVIMIUzjy1hRYtrfpJVaMz01Fm6mDtmEN5Ol
 X9wTWm8TB4M9ymqI11Kr61f0QRrBnH2jcXFO7Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id kkX6hYbCtG71 for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:51:07 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8Mr0lbsz1VSkV;
 Fri,  7 Jan 2022 21:51:03 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 00/37] riscv-to-apply queue
Date: Sat,  8 Jan 2022 15:50:11 +1000
Message-Id: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

The following changes since commit d70075373af51b6aa1d637962c962120e201fc=
98:

  Merge tag 'for_upstream' of git://git.kernel.org/pub/scm/virt/kvm/mst/q=
emu into staging (2022-01-07 17:24:24 -0800)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220108

for you to fetch changes up to 48eaeb56debf91817dea00a2cd9c1f6c986eb531:

  target/riscv: Implement the stval/mtval illegal instruction (2022-01-08=
 15:46:10 +1000)

----------------------------------------------------------------
Second RISC-V PR for QEMU 7.0

 - Fix illegal instruction when PMP is disabled
 - SiFive PDMA 64-bit support
 - SiFive PLIC cleanups
 - Mark Hypervisor extension as non experimental
 - Enable Hypervisor extension by default
 - Support 32 cores on the virt machine
 - Corrections for the Vector extension
 - Experimental support for 128-bit CPUs
 - stval and mtval support for illegal instructions

----------------------------------------------------------------
Alistair Francis (11):
      hw/intc: sifive_plic: Add a reset function
      hw/intc: sifive_plic: Cleanup the write function
      hw/intc: sifive_plic: Cleanup the read function
      hw/intc: sifive_plic: Cleanup remaining functions
      target/riscv: Mark the Hypervisor extension as non experimental
      target/riscv: Enable the Hypervisor extension by default
      hw/riscv: Use error_fatal for SoC realisation
      hw/riscv: virt: Allow support for 32 cores
      target/riscv: Set the opcode in DisasContext
      target/riscv: Fixup setting GVA
      target/riscv: Implement the stval/mtval illegal instruction

Bin Meng (1):
      roms/opensbi: Upgrade from v0.9 to v1.0

Frank Chang (3):
      target/riscv: rvv-1.0: Call the correct RVF/RVD check function for =
widening fp insns
      target/riscv: rvv-1.0: Call the correct RVF/RVD check function for =
widening fp/int type-convert insns
      target/riscv: rvv-1.0: Call the correct RVF/RVD check function for =
narrowing fp/int type-convert insns

Fr=C3=A9d=C3=A9ric P=C3=A9trot (18):
      exec/memop: Adding signedness to quad definitions
      exec/memop: Adding signed quad and octo defines
      qemu/int128: addition of div/rem 128-bit operations
      target/riscv: additional macros to check instruction support
      target/riscv: separation of bitwise logic and arithmetic helpers
      target/riscv: array for the 64 upper bits of 128-bit registers
      target/riscv: setup everything for rv64 to support rv128 execution
      target/riscv: moving some insns close to similar insns
      target/riscv: accessors to registers upper part and 128-bit load/st=
ore
      target/riscv: support for 128-bit bitwise instructions
      target/riscv: support for 128-bit U-type instructions
      target/riscv: support for 128-bit shift instructions
      target/riscv: support for 128-bit arithmetic instructions
      target/riscv: support for 128-bit M extension
      target/riscv: adding high part of some csrs
      target/riscv: helper functions to wrap calls to 128-bit csr insns
      target/riscv: modification of the trans_csrxx for 128-bit support
      target/riscv: actual functions to realize crs 128-bit insns

Jim Shu (2):
      hw/dma: sifive_pdma: support high 32-bit access of 64-bit register
      hw/dma: sifive_pdma: permit 4/8-byte access size of PDMA registers

Nikita Shubin (1):
      target/riscv/pmp: fix no pmp illegal intrs

Philipp Tomsich (1):
      target/riscv: Fix position of 'experimental' comment

 include/disas/dis-asm.h                        |   1 +
 include/exec/memop.h                           |  15 +-
 include/hw/riscv/virt.h                        |   2 +-
 include/qemu/int128.h                          |  27 +
 include/tcg/tcg-op.h                           |   4 +-
 target/arm/translate-a32.h                     |   4 +-
 target/riscv/cpu.h                             |  24 +
 target/riscv/cpu_bits.h                        |   3 +
 target/riscv/helper.h                          |   9 +
 target/riscv/insn16.decode                     |  27 +-
 target/riscv/insn32.decode                     |  25 +
 accel/tcg/cputlb.c                             |  30 +-
 accel/tcg/user-exec.c                          |   8 +-
 disas/riscv.c                                  |   5 +
 hw/dma/sifive_pdma.c                           | 181 ++++++-
 hw/intc/sifive_plic.c                          | 254 +++------
 hw/riscv/microchip_pfsoc.c                     |   2 +-
 hw/riscv/opentitan.c                           |   2 +-
 hw/riscv/sifive_e.c                            |   2 +-
 hw/riscv/sifive_u.c                            |   2 +-
 target/alpha/translate.c                       |  32 +-
 target/arm/helper-a64.c                        |   8 +-
 target/arm/translate-a64.c                     |   8 +-
 target/arm/translate-neon.c                    |   6 +-
 target/arm/translate-sve.c                     |  10 +-
 target/arm/translate-vfp.c                     |   8 +-
 target/arm/translate.c                         |   2 +-
 target/cris/translate.c                        |   2 +-
 target/hppa/translate.c                        |   4 +-
 target/i386/tcg/mem_helper.c                   |   2 +-
 target/i386/tcg/translate.c                    |  36 +-
 target/m68k/op_helper.c                        |   2 +-
 target/mips/tcg/translate.c                    |  58 +-
 target/mips/tcg/tx79_translate.c               |   8 +-
 target/ppc/translate.c                         |  32 +-
 target/riscv/cpu.c                             |  34 +-
 target/riscv/cpu_helper.c                      |  24 +-
 target/riscv/csr.c                             | 194 ++++++-
 target/riscv/gdbstub.c                         |   5 +
 target/riscv/m128_helper.c                     | 109 ++++
 target/riscv/machine.c                         |  22 +
 target/riscv/op_helper.c                       |  47 +-
 target/riscv/translate.c                       | 257 +++++++--
 target/s390x/tcg/mem_helper.c                  |   8 +-
 target/s390x/tcg/translate.c                   |   8 +-
 target/sh4/translate.c                         |  12 +-
 target/sparc/translate.c                       |  36 +-
 target/tricore/translate.c                     |   4 +-
 target/xtensa/translate.c                      |   4 +-
 tcg/tcg.c                                      |   4 +-
 tcg/tci.c                                      |  16 +-
 util/int128.c                                  | 147 +++++
 accel/tcg/ldst_common.c.inc                    |   8 +-
 target/mips/tcg/micromips_translate.c.inc      |  10 +-
 target/ppc/translate/fixedpoint-impl.c.inc     |  22 +-
 target/ppc/translate/fp-impl.c.inc             |   4 +-
 target/ppc/translate/vsx-impl.c.inc            |  42 +-
 target/riscv/insn_trans/trans_rva.c.inc        |  22 +-
 target/riscv/insn_trans/trans_rvb.c.inc        |  48 +-
 target/riscv/insn_trans/trans_rvd.c.inc        |   4 +-
 target/riscv/insn_trans/trans_rvh.c.inc        |   4 +-
 target/riscv/insn_trans/trans_rvi.c.inc        | 716 +++++++++++++++++++=
++----
 target/riscv/insn_trans/trans_rvm.c.inc        | 192 ++++++-
 target/riscv/insn_trans/trans_rvv.c.inc        |  78 ++-
 target/s390x/tcg/translate_vx.c.inc            |  18 +-
 tcg/aarch64/tcg-target.c.inc                   |   2 +-
 tcg/arm/tcg-target.c.inc                       |  10 +-
 tcg/i386/tcg-target.c.inc                      |  12 +-
 tcg/mips/tcg-target.c.inc                      |  12 +-
 tcg/ppc/tcg-target.c.inc                       |  16 +-
 tcg/riscv/tcg-target.c.inc                     |   6 +-
 tcg/s390x/tcg-target.c.inc                     |  18 +-
 tcg/sparc/tcg-target.c.inc                     |  16 +-
 pc-bios/opensbi-riscv32-generic-fw_dynamic.bin | Bin 78680 -> 108504 byt=
es
 pc-bios/opensbi-riscv32-generic-fw_dynamic.elf | Bin 727464 -> 838904 by=
tes
 pc-bios/opensbi-riscv64-generic-fw_dynamic.bin | Bin 75096 -> 105296 byt=
es
 pc-bios/opensbi-riscv64-generic-fw_dynamic.elf | Bin 781264 -> 934696 by=
tes
 roms/opensbi                                   |   2 +-
 target/riscv/meson.build                       |   1 +
 target/s390x/tcg/insn-data.def                 |  28 +-
 util/meson.build                               |   1 +
 81 files changed, 2318 insertions(+), 750 deletions(-)
 create mode 100644 target/riscv/m128_helper.c
 create mode 100644 util/int128.c

