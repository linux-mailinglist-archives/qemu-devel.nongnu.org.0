Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7F73FD119
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:13:43 +0200 (CEST)
Received: from localhost ([::1]:50686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLFkz-0007DW-T2
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFhn-0004nL-54
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:10:23 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:25244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFhj-0007YW-4d
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:10:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462219; x=1661998219;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/+PTVccmxAu9rekmJ5RDa+zi5qrUzIwgEojB800WOlU=;
 b=Y0/sUX6tppawGf9lQAdpb+toyyErbWpAPcsl9KH1HkJWGtfQs1BowXPJ
 FYlM4p1HNRJoBWY1Jeu0QfLDPhcLLsdt8mrRJBlX+qrLOrjQm1s14diyq
 /9Vy/3YvScHuzmfejBggeunjflucez0sNU7pJnhir8uN8mMxElr1itVZF
 RToI/PZS4fSAaB6j52opOA6tiYc7qjbGSajWJ4drN17v4m3OJ7t0/XDhz
 a4OY1Wg1QqL+83ohOEQ/FBcOqClvRmiaiioWl12OA3WNLGolixZpQadJu
 2IluYrgFAl1IwFoPDcPBHUYFbTix93OuZtBnVL4fz08IQy6jLUPLNHTSr g==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="282697977"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:10:15 +0800
IronPort-SDR: bpplXt42IkzJ8j3g2aHAVRCC/H+xbWzt602GPf6fe4jl4RjKdjomAsHdT9XZ3mDWzTl33lUwKk
 BFHAqn6LSA+s2dZmuKJqMuRbMAx6AvNjjOJ2kC+GKLtuvRFFnE6G+Ny8CyAFm7SaO4OrcFSpzh
 ReIRsNBtA+CEwSP4HStMxJ0VV4BZjw6umN528a3130HKHvPpPZqUKnm3ovDRmTt0gvX7GYDJJW
 NCc4HoPH9vdxFEc/TCbxnHFZA7BOdRuemhy9wYe6KAIWwy4YIYduMtsc5wnqg/MIhsGAEJxf2H
 1kH5tqLkhNHlwMPN/PtRLb2F
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:47:04 -0700
IronPort-SDR: GBvqsP2OF8c/+vKTZaMIJHcdSboVTsIIMeHI0y+jTQfr9C1SaY4P45qFVM8U5G7yjK0tB+Rwbz
 H+OMqdGI5o98YXAbMCe/DyT/RGQt4LoS9J8CnCSXL3thqAIWvn1OeF0CZT8cUOMmzc1YxvoeRb
 m7wdNqfJd8cm9ltzkyrQ+Nt8jPyL5lef+ubZHmEM/lpgEhNj/YD4AjVfTIaTm4TEW5ECns/Qk7
 ae/v/hf3FyKgavEjJijD2xA1goa7KNxYGVAC7JsxUg0Mgv3AyQONfw879PnZ4qSY04QuaR+HHG
 Lqk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:10:15 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4GznZb2HVBz1RvlZ
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:10:15 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1630462210; x=1633054211; bh=/+PTVccmxAu9rekmJ5RDa+zi5qrUzIwg
 EojB800WOlU=; b=n6w1PAw1bbyh5K7PxxNp7hhBfdxBYegi9Ll/h+0n3j6QRCMw
 kaV+EUDiuGJjr9iyzLXs7SZwEV/1b0HsC5BHBmH4dC5rXeY+fDvJAlMcbWIpSz4d
 +5E6ZAanNne3nicn3dsVx2dqrGUjHaKjDtfqCf2pURsitRfFQVPdYGg1Bo0htHYA
 YUNzcFvyHjqkNWl+JZ2wufZ9Y7OoB/LmpUW0DJ6dgYRhHQRFISLPJi2Gg8svWAs2
 Hx0flvv3letSHldWSDypKfZib2HQAvc1/q8W2+kZPT6qKfoHieAOxGPDV+mxVyx0
 BJBeuvJxnV/X89vUuieideZExWyb1gQfH6i7tA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id DocyUWlYGCm3 for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:10:10 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4GznZR2pHbz1Rvl9;
 Tue, 31 Aug 2021 19:10:06 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 00/33] riscv-to-apply queue
Date: Wed,  1 Sep 2021 12:09:25 +1000
Message-Id: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
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

The following changes since commit d52dff5d8048d4982437db9606c27bb4127cf9=
d0:

  Merge remote-tracking branch 'remotes/marcandre/tags/clip-pull-request'=
 into staging (2021-08-31 14:38:15 +0100)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210901-2

for you to fetch changes up to 8e034ae44dba6291beb07f7f2a932c1e5ab83e98:

  target/riscv: Use {get,dest}_gpr for RVV (2021-09-01 11:59:12 +1000)

----------------------------------------------------------------
First RISC-V PR for QEMU 6.2

 - Add a config for Shakti UART
 - Fixup virt flash node
 - Don't override users supplied ISA version
 - Fixup some CSR accesses
 - Use g_strjoinv() for virt machine PLIC string config
 - Fix an overflow in the SiFive CLINT
 - Add 64-bit register access helpers
 - Replace tcg_const_* with direct constant usage

----------------------------------------------------------------
Bin Meng (2):
      hw/riscv: virt: Move flash node to root
      target/riscv: Correct a comment in riscv_csrrw()

David Hoppenbrouwers (1):
      hw/intc/sifive_clint: Fix muldiv64 overflow in sifive_clint_write_t=
imecmp()

Joe Komlodi (2):
      hw/core/register: Add more 64-bit utilities
      hw/registerfields: Use 64-bit bitfield for FIELD_DP64

LIU Zhiwei (2):
      target/riscv: Don't wrongly override isa version
      target/riscv: Add User CSRs read-only check

Peter Maydell (1):
      hw/riscv/virt.c: Assemble plic_hart_config string with g_strjoinv()

Richard Henderson (24):
      target/riscv: Use tcg_constant_*
      tests/tcg/riscv64: Add test for division
      target/riscv: Clean up division helpers
      target/riscv: Add DisasContext to gen_get_gpr, gen_set_gpr
      target/riscv: Introduce DisasExtend and new helpers
      target/riscv: Add DisasExtend to gen_arith*
      target/riscv: Remove gen_arith_div*
      target/riscv: Use gen_arith for mulh and mulhu
      target/riscv: Move gen_* helpers for RVM
      target/riscv: Move gen_* helpers for RVB
      target/riscv: Add DisasExtend to gen_unary
      target/riscv: Use DisasExtend in shift operations
      target/riscv: Use extracts for sraiw and srliw
      target/riscv: Use get_gpr in branches
      target/riscv: Use {get, dest}_gpr for integer load/store
      target/riscv: Fix rmw_sip, rmw_vsip, rmw_hsip vs write-only operati=
on
      target/riscv: Fix hgeie, hgeip
      target/riscv: Reorg csr instructions
      target/riscv: Use {get,dest}_gpr for RVA
      target/riscv: Use gen_shift_imm_fn for slli_uw
      target/riscv: Use {get,dest}_gpr for RVF
      target/riscv: Use {get,dest}_gpr for RVD
      target/riscv: Tidy trans_rvh.c.inc
      target/riscv: Use {get,dest}_gpr for RVV

Vijai Kumar K (1):
      hw/char: Add config for shakti uart

 include/hw/register.h                   |   8 +
 include/hw/registerfields.h             |  10 +-
 target/riscv/helper.h                   |   6 +-
 target/riscv/insn32.decode              |   1 +
 hw/core/register.c                      |  12 +
 hw/intc/sifive_clint.c                  |  25 +-
 hw/riscv/virt.c                         |  35 +-
 target/riscv/cpu.c                      |  14 +-
 target/riscv/csr.c                      |  59 ++-
 target/riscv/op_helper.c                |  18 +-
 target/riscv/translate.c                | 689 +++++++-------------------=
------
 tests/tcg/riscv64/test-div.c            |  58 +++
 target/riscv/insn_trans/trans_rva.c.inc |  49 +--
 target/riscv/insn_trans/trans_rvb.c.inc | 366 +++++++++++++----
 target/riscv/insn_trans/trans_rvd.c.inc | 127 +++---
 target/riscv/insn_trans/trans_rvf.c.inc | 149 ++++---
 target/riscv/insn_trans/trans_rvh.c.inc | 266 +++---------
 target/riscv/insn_trans/trans_rvi.c.inc | 372 +++++++++--------
 target/riscv/insn_trans/trans_rvm.c.inc | 193 +++++++--
 target/riscv/insn_trans/trans_rvv.c.inc | 149 +++----
 hw/char/Kconfig                         |   3 +
 hw/char/meson.build                     |   2 +-
 hw/riscv/Kconfig                        |   5 +-
 tests/tcg/riscv64/Makefile.target       |   5 +
 24 files changed, 1240 insertions(+), 1381 deletions(-)
 create mode 100644 tests/tcg/riscv64/test-div.c
 create mode 100644 tests/tcg/riscv64/Makefile.target

