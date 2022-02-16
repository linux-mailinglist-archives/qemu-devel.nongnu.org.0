Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0748A4B811A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 08:12:43 +0100 (CET)
Received: from localhost ([::1]:47496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKEUT-00034U-Rg
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 02:12:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDoe-0004G1-27
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:28 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:59472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDoa-0006Gk-Ir
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644992963; x=1676528963;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8g0SAM8KeH+FIqs2fXxObCo53sJh5XJYX6qOpSAkyFA=;
 b=YEr1LyFFZDuYL4eTozHUbX9XbmGoHU/ZUjd1wNtGEX7a6j37r8pZv1uf
 WXHveKnfVVNDRz4XgV/SUYL19VlIZJsTTsdthL7YLZ7DyIow8krypHKmO
 QG6885VUVVhVP7b+o3SRh8d6joI1z/Ro+KOW9eJYfh39GpW0f3wbEcapc
 PuiiKUsjFf5/0eqoX3FajvplkuYL5osAah8iKqzIGLc0Emo513euOFDAf
 I9WyOVmlC5rQV2bZix1udY36WvdutHTmvqR9g/AETLgsHwyOPdXNDs/ri
 8nMk3AFJxdKvqq8vFtLH3TuWuoBi+11EpVI324uA9FNIAnurQB6VihLPV w==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="193072655"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:29:21 +0800
IronPort-SDR: 0P7tQVy7qKlNxknTAlj/0oqvT7tKY6HJ4ameCOVpZB4HbPknQKQ8oSs6wtsVAX2h93nljQ9j34
 XzA1MLHStz/Qy5W5HsaIP5jflsX3Y+IKN1qP0AOb9ZTO8C5lFaXLsukH8Q3BZhy0gItwI7j1Mq
 UMIRUFZGkiOaqamCbk8pLEPV208TouHv4O7aHU1Bt9BU+6ULCotZcKqTsqXS/cMXsjPh0l0MyY
 2ihALuo95l9k5+mQLd7V3poPfgRkrm/USbmGWxB5jCNo6TsIqck9u3PjrkNPkdBdXE1qYqe8Wj
 Vw8rzkyScwdLmZEQ96ro8IhR
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:02:11 -0800
IronPort-SDR: M9+ADqJo/h0XEMiGSIRUkBpnUAjOcXaux7+z+K3ZZ61hL4din8IRIM3FR1u5sYWoLTSo6pFx9r
 18A0yUPbFpPgQo8lVn8w5acc17ZEMyfFAHPwZQnKlbJIaozx82bL64VGoPenf+E2k3n2w6WEft
 uSH0eX6G1E1Vr6Lzl8eofumjzPfVHDwhNyVRrssl4O2Who9RqQfqOGH48ktq+2l3kA+HqLC51x
 RZqYpKG7Pft/gjFLchTTJQs/AvaD73ayua1JVJY8huiqP/LZJslnARqv6jS1ZjnxmHjG9fnJN1
 XuM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:29:23 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7N24Wq7z1SVnx
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:29:22 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1644992962; x=1647584963; bh=8g0SAM8KeH+FIqs2fXxObCo53sJh5XJY
 X6qOpSAkyFA=; b=rIkqwZmbv9y2jcrTLC7WVnqm7nCotel2chXbZvOHZZIC0TrO
 ZPk+dvy72JUh5qtXgczwOd6D59bTRM6/dZ7e20Gm+3WqJV9SFDBhJ98DJ0UroflB
 y6xSPHxtMC9vCfRMWir0CbHnAR11zJC72OB8GsxaiLcitZWAOyGFexvLRt5q5F1a
 BlsHUWOy1mOxCrRL6e4nHlS5Duyiduskc81UzPFd0aJpLwwrksbGzU2S5zmtIubM
 NwCejwAJOdL5pGIhh4rOwOqySa8pap5mVqY7Ar9XUaMSluAziYVR+wdF6P9rGzMf
 w2/9QwQHrSUBxcQTKfuv9dRiyOxZPpVil+NSDQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id z2K6irZd_8mZ for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:29:22 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7Mz6n68z1Rwrw;
 Tue, 15 Feb 2022 22:29:19 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 00/35] riscv-to-apply queue
Date: Wed, 16 Feb 2022 16:28:37 +1000
Message-Id: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit ad38520bdeb2b1e0b487db317f29119e94c1c8=
8d:

  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-r=
equest' into staging (2022-02-15 19:30:33 +0000)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220216

for you to fetch changes up to 7035b8420fa52e8c94cf4317c0f88c1b73ced28d:

  docs/system: riscv: Update description of CPU (2022-02-16 12:25:52 +100=
0)

----------------------------------------------------------------
Fourth RISC-V PR for QEMU 7.0

 * Remove old Ibex PLIC header file
 * Allow writing 8 bytes with generic loader
 * Fixes for RV128
 * Refactor RISC-V CPU configs
 * Initial support for XVentanaCondOps custom extension
 * Fix for vill field in vtype
 * Fix trap cause for RV32 HS-mode CSR access from RV64 HS-mode
 * Support for svnapot, svinval and svpbmt extensions

----------------------------------------------------------------
Anup Patel (18):
      target/riscv: Fix trap cause for RV32 HS-mode CSR access from RV64 =
HS-mode
      target/riscv: Implement SGEIP bit in hip and hie CSRs
      target/riscv: Implement hgeie and hgeip CSRs
      target/riscv: Improve delivery of guest external interrupts
      target/riscv: Allow setting CPU feature from machine/device emulati=
on
      target/riscv: Add AIA cpu feature
      target/riscv: Add defines for AIA CSRs
      target/riscv: Allow AIA device emulation to set ireg rmw callback
      target/riscv: Implement AIA local interrupt priorities
      target/riscv: Implement AIA CSRs for 64 local interrupts on RV32
      target/riscv: Implement AIA hvictl and hviprioX CSRs
      target/riscv: Implement AIA interrupt filtering CSRs
      target/riscv: Implement AIA mtopi, stopi, and vstopi CSRs
      target/riscv: Implement AIA xiselect and xireg CSRs
      target/riscv: Implement AIA IMSIC interface CSRs
      hw/riscv: virt: Use AIA INTC compatible string when available
      target/riscv: Allow users to force enable AIA CSRs in HART
      hw/intc: Add RISC-V AIA APLIC device emulation

Fr=C3=A9d=C3=A9ric P=C3=A9trot (1):
      target/riscv: correct "code should not be reached" for x-rv128

Guo Ren (1):
      target/riscv: Ignore reserved bits in PTE for RV64

LIU Zhiwei (1):
      target/riscv: Fix vill field write in vtype

Petr Tesarik (1):
      Allow setting up to 8 bytes with the generic loader

Philipp Tomsich (7):
      target/riscv: refactor (anonymous struct) RISCVCPU.cfg into 'struct=
 RISCVCPUConfig'
      target/riscv: riscv_tr_init_disas_context: copy pointer-to-cfg into=
 cfg_ptr
      target/riscv: access configuration through cfg_ptr in DisasContext
      target/riscv: access cfg structure through DisasContext
      target/riscv: iterate over a table of decoders
      target/riscv: Add XVentanaCondOps custom extension
      target/riscv: add a MAINTAINERS entry for XVentanaCondOps

Weiwei Li (4):
      target/riscv: add PTE_A/PTE_D/PTE_U bits check for inner PTE
      target/riscv: add support for svnapot extension
      target/riscv: add support for svinval extension
      target/riscv: add support for svpbmt extension

Wilfred Mallawa (1):
      include: hw: remove ibex_plic.h

Yu Li (1):
      docs/system: riscv: Update description of CPU

 docs/system/riscv/virt.rst                         |    6 +-
 include/hw/intc/ibex_plic.h                        |   67 -
 include/hw/intc/riscv_aplic.h                      |   79 ++
 target/riscv/cpu.h                                 |  169 ++-
 target/riscv/cpu_bits.h                            |  129 ++
 target/riscv/XVentanaCondOps.decode                |   25 +
 target/riscv/insn32.decode                         |    7 +
 hw/core/generic-loader.c                           |    2 +-
 hw/intc/riscv_aplic.c                              |  978 ++++++++++++++=
+
 hw/riscv/virt.c                                    |   13 +-
 target/riscv/cpu.c                                 |  113 +-
 target/riscv/cpu_helper.c                          |  377 +++++-
 target/riscv/csr.c                                 | 1282 ++++++++++++++=
++++--
 target/riscv/gdbstub.c                             |    3 +
 target/riscv/machine.c                             |   24 +-
 target/riscv/translate.c                           |   61 +-
 target/riscv/vector_helper.c                       |    1 +
 target/riscv/insn_trans/trans_rvb.c.inc            |    8 +-
 target/riscv/insn_trans/trans_rvi.c.inc            |    2 +-
 target/riscv/insn_trans/trans_rvv.c.inc            |  146 ++-
 target/riscv/insn_trans/trans_rvzfh.c.inc          |    4 +-
 target/riscv/insn_trans/trans_svinval.c.inc        |   75 ++
 .../riscv/insn_trans/trans_xventanacondops.c.inc   |   39 +
 MAINTAINERS                                        |    7 +
 hw/intc/Kconfig                                    |    3 +
 hw/intc/meson.build                                |    1 +
 target/riscv/meson.build                           |    1 +
 27 files changed, 3252 insertions(+), 370 deletions(-)
 delete mode 100644 include/hw/intc/ibex_plic.h
 create mode 100644 include/hw/intc/riscv_aplic.h
 create mode 100644 target/riscv/XVentanaCondOps.decode
 create mode 100644 hw/intc/riscv_aplic.c
 create mode 100644 target/riscv/insn_trans/trans_svinval.c.inc
 create mode 100644 target/riscv/insn_trans/trans_xventanacondops.c.inc

