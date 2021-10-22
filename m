Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B07437832
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 15:41:34 +0200 (CEST)
Received: from localhost ([::1]:46970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdund-0001PP-D0
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 09:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mduks-0007IP-R4
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:38:43 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:64360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdukp-0000oF-Fx
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:38:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634909919; x=1666445919;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uEVQAIRqHvXavZjymWUAyQZMtWpXG5LJsdlervEZ8Ys=;
 b=NawACM9jqgyNBLgs3vMM6sO6/cLc4gJ1f4YW0r6qNSa8HXBtnShD4tby
 cZPcGzrkYrZ8Kc98Z7RW9cXKJKRdrBJiIzR85QMU6jJEFoFv/eFmObG0V
 Y+7oT4zf+I14l0GG9Q9Y3Yw9jSvsHRqA77yDNtZEcRYnxIfTtfJq1G5cx
 xcUabCNisWkxcbNFSk+4XwgfINHy9zVylEaqyd1tFesd7XNe+fACn/vCA
 fQj3jEuczdiBOGLwiH6i/sarQwFXJP9ZiL4Od/MKb6zWhKkBFO65jWujj
 yw+QPKKmYeU0mDlqvGnu/LTGdqrReeh/HppJ2lePteCn300CFnDx2NJe0 Q==;
X-IronPort-AV: E=Sophos;i="5.87,172,1631548800"; d="scan'208";a="182632544"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:38:36 +0800
IronPort-SDR: zUQY/3QI3RamAKmSE+LEpTQwdjgh1mu4ir4u0LAKy/OehPd09CB1sqmOsbS/9caP1fenAK98RM
 C+pVnwL2VDjfk9pfSLmHCTrGbjFlxl8K1sUEvnf+I51iFW08AXC4Ur8zmPsJEkqTPa0Yn/BAho
 e4uaboE7GEN3db27l63RJYcv5topQUnOzjU6tZBInJ3iJNLAOGAj2Ka2orKx6p61sLbGdTxmb2
 dAw21jeYh8iTAm9FB8QFuu+g8kxcM0oPflPCLdC4hjjyb916kBlYftETmUE2zddb+Z/0n2InPj
 WFv6+yYn9XN5qsFCJNRSYg4p
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:12:38 -0700
IronPort-SDR: WjiyTawvm60yUO85cnuq2EhR7N/QpEm5giFB2BvhrrYjYO4NucSeLNc2HVOqPoytZf1EQLA2qL
 pirpr/XI6IvOu0wD+WIUi3wjzzeKwjVfk+vx4zc5jZE4y2ED7RE/xaTbRPxbb/c/bm44R08DrP
 BSuMAQVa04w8cm6kiw+JrRZWEb1xXJj68UbujyH9AlvKRH+CvR+8tUFWuAfYhlmo5m+sajxxhL
 le+eSBd4O+lJ65Rb4kb/hn3zklrrIvSaau6CgNiOGfxDww4b2GmRqXFswR5O53EHli6iTrjRZh
 8uM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:38:36 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQRJ3NGhz1RtVn
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:38:36 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1634909915; x=1637501916; bh=uEVQAIRqHvXavZjymWUAyQZMtWpXG5LJ
 sdlervEZ8Ys=; b=Ftc9sO0CyevgxEaKXklJXwyNFgf6ppHpkCfy+nIDRWmBbNVa
 k3lJZ5seMcKJj5y3zUkP0ndB9p2pWxiSPw6u7cumdIa9AloybNU/9CSVdtpAMYGH
 8hVkmCRXq2K4IrE+/k7uS9zqnBzyY/HEDH04+5y1+96IGfHRX5VH2dnX9HhmQsq/
 0vr8Q7j08uwdWGtk9He84Vs1psdipKqs/tklFpR9iwQiLQTZu952oc3B7+OH4rPC
 dI00tVxcxciyCJedOLYlpwPqtRhkCgwOajuGqIf9OnaKu4ZnIwRb45/5OgJ3/IYs
 rgXwcyTg/G6qzcqK+3NE+VMBaLMoQZa7emLcmw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Mv9qUMPJ9AX1 for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:38:35 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQRD2Rwjz1RtVl;
 Fri, 22 Oct 2021 06:38:31 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 00/33] riscv-to-apply queue
Date: Fri, 22 Oct 2021 23:37:39 +1000
Message-Id: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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

The following changes since commit 4c127fdbe81d66e7cafed90908d0fd1f6f2a6c=
d0:

  Merge remote-tracking branch 'remotes/rth/tags/pull-arm-20211021' into =
staging (2021-10-21 09:53:27 -0700)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20211022-2

for you to fetch changes up to 11ec06f9eaedc801ded34c79861367b76ab2b731:

  hw/riscv: spike: Use MachineState::ram and MachineClass::default_ram_id=
 (2021-10-22 23:35:47 +1000)

----------------------------------------------------------------
Fourth RISC-V PR for QEMU 6.2

 - Vector extension bug fixes
 - Bit manipulation extension bug fix
 - Support vhost-user and numa mem options on all boards
 - Rationalise XLEN and operand lengths
 - Bump the OpenTitan FPGA support
 - Remove the Ibex PLIC
 - General code cleanup

----------------------------------------------------------------
Alistair Francis (7):
      target/riscv: Remove some unused macros
      target/riscv: Organise the CPU properties
      hw/riscv: opentitan: Update to the latest build
      hw/intc: Remove the Ibex PLIC
      hw/intc: sifive_plic: Move the properties
      hw/intc: sifive_plic: Cleanup the realize function
      hw/intc: sifive_plic: Cleanup the irq_request function

Bin Meng (6):
      hw/riscv: microchip_pfsoc: Use MachineState::ram and MachineClass::=
default_ram_id
      hw/riscv: opentitan: Use MachineState::ram and MachineClass::defaul=
t_ram_id
      hw/riscv: shakti_c: Use MachineState::ram and MachineClass::default=
_ram_id
      hw/riscv: sifive_e: Use MachineState::ram and MachineClass::default=
_ram_id
      hw/riscv: sifive_u: Use MachineState::ram and MachineClass::default=
_ram_id
      hw/riscv: spike: Use MachineState::ram and MachineClass::default_ra=
m_id

Frank Chang (2):
      target/riscv: Pass the same value to oprsz and maxsz for vmv.v.v
      target/riscv: fix TB_FLAGS bits overlapping bug for rvv/rvh

Mingwang Li (1):
      hw/riscv: virt: Use machine->ram as the system memory

Philipp Tomsich (1):
      target/riscv: Fix orc.b implementation

Richard Henderson (15):
      target/riscv: Move cpu_get_tb_cpu_state out of line
      target/riscv: Create RISCVMXL enumeration
      target/riscv: Split misa.mxl and misa.ext
      target/riscv: Replace riscv_cpu_is_32bit with riscv_cpu_mxl
      target/riscv: Add MXL/SXL/UXL to TB_FLAGS
      target/riscv: Use REQUIRE_64BIT in amo_check64
      target/riscv: Properly check SEW in amo_op
      target/riscv: Replace is_32bit with get_xl/get_xlen
      target/riscv: Replace DisasContext.w with DisasContext.ol
      target/riscv: Use gen_arith_per_ol for RVM
      target/riscv: Adjust trans_rev8_32 for riscv64
      target/riscv: Use gen_unary_per_ol for RVB
      target/riscv: Use gen_shift*_per_ol for RVB, RVI
      target/riscv: Use riscv_csrrw_debug for cpu_dump
      target/riscv: Compute mstatus.sd on demand

Travis Geiselbrecht (1):
      target/riscv: line up all of the registers in the info register dum=
p

 include/hw/riscv/opentitan.h            |   6 +-
 target/riscv/cpu.h                      |  87 +++------
 target/riscv/cpu_bits.h                 |  16 +-
 hw/intc/ibex_plic.c                     | 307 --------------------------=
------
 hw/intc/sifive_plic.c                   |  85 ++++-----
 hw/riscv/boot.c                         |   2 +-
 hw/riscv/microchip_pfsoc.c              |  36 ++--
 hw/riscv/opentitan.c                    |  38 +++-
 hw/riscv/shakti_c.c                     |   6 +-
 hw/riscv/sifive_e.c                     |  16 +-
 hw/riscv/sifive_u.c                     |   6 +-
 hw/riscv/spike.c                        |   6 +-
 hw/riscv/virt.c                         |   6 +-
 linux-user/elfload.c                    |   2 +-
 linux-user/riscv/cpu_loop.c             |   2 +-
 semihosting/arm-compat-semi.c           |   2 +-
 target/riscv/cpu.c                      | 216 ++++++++++++----------
 target/riscv/cpu_helper.c               |  92 +++++++++-
 target/riscv/csr.c                      | 104 ++++++-----
 target/riscv/gdbstub.c                  |  10 +-
 target/riscv/machine.c                  |  10 +-
 target/riscv/monitor.c                  |   4 +-
 target/riscv/translate.c                | 174 +++++++++++++-----
 target/riscv/insn_trans/trans_rvb.c.inc | 153 +++++++++-------
 target/riscv/insn_trans/trans_rvi.c.inc |  44 ++---
 target/riscv/insn_trans/trans_rvm.c.inc |  36 +++-
 target/riscv/insn_trans/trans_rvv.c.inc |  32 ++--
 hw/intc/meson.build                     |   1 -
 28 files changed, 720 insertions(+), 779 deletions(-)
 delete mode 100644 hw/intc/ibex_plic.c

