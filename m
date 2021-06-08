Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 205D839EABA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:32:44 +0200 (CEST)
Received: from localhost ([::1]:37598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPff-00030L-5X
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPdL-0000Af-O0
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:19 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPdI-0004BB-5g
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112214; x=1654648214;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S2GBTHx3tT5Yr9dVjcucvgzwYa7fqkhOsLQMHLS9r8s=;
 b=Uc0iQD8KcKYfqkAp1IwlPPo6RqZLOHAKALrbRGINGMIj/R8qDKVo1n9b
 fXcbs4W89gkc2GDwW8ZBbUv+LXz3mLVqj8zqxNS54xQM8pei5+LdazBJO
 TQrgC4cq4C+BSvN1RDNTaU7eMrzmod2wNbuLg0JAg7zCClDUeRyl9VY0z
 mleEUeauiwpsq8Ao0N82q9A4UUeHpk/zK79yxuNkK0KGEcjYxuxPzXMMS
 YhZEmM7UQhWbvXpjbriWA0+GcukQ9wpfWExHMbw+tag9kLBXqjRlq6kVC
 IgY18ryuDYAAgUx7prulN6r7D3wod0CxHbMoWOiotO3QYdbRx6SOVpXyQ g==;
IronPort-SDR: DCzlsthhF+RR0LOJjgE09Wh+r+hvSvAy73XcWVEDWbwBCmcwCNCFbuZKQf3M1WFZjqjPZgCcOa
 b298os8fC+RPnaV70XE9WE5937x0GL/fRScuwSpDwaIsJsMhwueu3B53AAUjaCuS1U+UkSy2s7
 aMT5aRU4/PZAzFe3M8ZjAJKwqOicrlMF2tsh5mawK830itAgtCE9EQy/Uc7juqi7r3dJszlRi/
 j8wgZEJuLVszA7yMIdnwcsdUXwU6bIyweweiHHvddPj8DVS4VzjLmmDTBGZstxf8XhClyJOjkm
 5Nc=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087327"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:30:10 +0800
IronPort-SDR: nsr7vH0Wzh7qX96phZTPSylYex3zW3GzrtLrobaBTML0FpH5Ebcgmcgix2v2MxxRlUSFOd754A
 uk8hoWnEGtcUWlyPKPY9zc9p22GaqVPVJIm8KhJ/uuiKulu9RnZa/+a/GnzBb7i2AJWQzMTixo
 ZhM+/ztBozBI6fqRipQNuHpF5W6QoKxqCQPbpcbvzFCUS/n3hUoNY6Y4HkNpA1xzAzrHk86uhg
 vdBlWBi3XeDrqJTCz5JL709Ea1IunQ51NRlHGdmqxzJMlEhYxsClgn/r3JCBJ0RuOe01s9GNV8
 aZobBV1R2xxRVN/vYRo/wf0q
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:09:17 -0700
IronPort-SDR: O6zK+D99LJIHiY09fq+BsuAOd8XuxiLqfvYpeREPzcS4vE61rAI7x/Vpu5dn5H2AKw7km2xFe6
 OdOmfxqqSl4t+1yYSPyYJCaMGh5om1+UL1v7Q+CnIeWlJtkFn/3pHOTfo7Uo3Nc2W+cE/eiuXF
 PzcB8F8SLb3qWlYGhXT9Zh91OGXxqggkBET3+HmeZM44kbiAvoQ2Yx5uvIemDvdtofLG2Tgghs
 nvIeHdSa65Xdv5a2hltDZi4jXxvwV6xUnwU8OdhEP/uFTJf8wEEkyXQdv+ps7kkuWiBVcZFdIe
 LMI=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:30:08 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 00/32] riscv-to-apply queue
Date: Tue,  8 Jun 2021 10:29:15 +1000
Message-Id: <20210608002947.1649775-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7863c9c60=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit a35947f15c0ee695eba3c55248ec8ac3e4e23cca:

  Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-updates-070621-2' into staging (2021-06-07 15:45:48 +0100)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210608-1

for you to fetch changes up to d2c1a177b138be35cb96216baa870c3564b123e4:

  target/riscv: rvb: add b-ext version cpu option (2021-06-08 09:59:46 +1000)

----------------------------------------------------------------
Second RISC-V PR for QEMU 6.1

 - Update the PLIC and CLINT DT bindings
 - Improve documentation for RISC-V machines
 - Support direct kernel boot for microchip_pfsoc
 - Fix WFI exception behaviour
 - Improve CSR printing
 - Initial support for the experimental Bit Manip extension

----------------------------------------------------------------
Alistair Francis (2):
      docs/system: Move the RISC-V -bios information to removed
      target/riscv/pmp: Add assert for ePMP operations

Bin Meng (9):
      hw/riscv: sifive_u: Switch to use qemu_fdt_setprop_string_array() helper
      hw/riscv: virt: Switch to use qemu_fdt_setprop_string_array() helper
      hw/riscv: Support the official CLINT DT bindings
      hw/riscv: Support the official PLIC DT bindings
      docs/system/riscv: Correct the indentation level of supported devices
      docs/system/riscv: sifive_u: Document '-dtb' usage
      hw/riscv: Use macros for BIOS image names
      hw/riscv: microchip_pfsoc: Support direct kernel boot
      target/riscv: Remove unnecessary riscv_*_names[] declaration

Changbin Du (1):
      target/riscv: Dump CSR mscratch/sscratch/satp

Frank Chang (6):
      target/riscv: rvb: count bits set
      target/riscv: add gen_shifti() and gen_shiftiw() helper functions
      target/riscv: rvb: single-bit instructions
      target/riscv: rvb: generalized reverse
      target/riscv: rvb: generalized or-combine
      target/riscv: rvb: add b-ext version cpu option

Jose Martins (1):
      target/riscv: fix wfi exception behavior

Kito Cheng (11):
      target/riscv: reformat @sh format encoding for B-extension
      target/riscv: rvb: count leading/trailing zeros
      target/riscv: rvb: logic-with-negate
      target/riscv: rvb: pack two words into one register
      target/riscv: rvb: min/max instructions
      target/riscv: rvb: sign-extend instructions
      target/riscv: rvb: shift ones
      target/riscv: rvb: rotate (left/right)
      target/riscv: rvb: address calculation
      target/riscv: rvb: add/shift with prefix zero-extend
      target/riscv: rvb: support and turn on B-extension from command line

LIU Zhiwei (1):
      target/riscv: Pass the same value to oprsz and maxsz.

Philippe Mathieu-Daudé (1):
      target/riscv: Do not include 'pmp.h' in user emulation

 docs/system/deprecated.rst                 |  19 --
 docs/system/removed-features.rst           |   5 +
 docs/system/riscv/microchip-icicle-kit.rst |  50 +++-
 docs/system/riscv/sifive_u.rst             |  77 +++--
 docs/system/target-riscv.rst               |  13 +-
 include/hw/riscv/boot.h                    |   5 +
 target/riscv/cpu.h                         |   9 +-
 target/riscv/cpu_bits.h                    |   1 +
 target/riscv/helper.h                      |   6 +
 target/riscv/insn32.decode                 |  87 +++++-
 hw/riscv/microchip_pfsoc.c                 |  81 +++++-
 hw/riscv/sifive_u.c                        |  24 +-
 hw/riscv/spike.c                           |  12 +-
 hw/riscv/virt.c                            |  25 +-
 target/riscv/bitmanip_helper.c             |  90 ++++++
 target/riscv/cpu.c                         |  38 ++-
 target/riscv/op_helper.c                   |  11 +-
 target/riscv/pmp.c                         |   4 +
 target/riscv/translate.c                   | 306 ++++++++++++++++++++
 target/riscv/insn_trans/trans_rvb.c.inc    | 438 +++++++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvi.c.inc    |  54 +---
 target/riscv/insn_trans/trans_rvv.c.inc    |  89 +++---
 target/riscv/meson.build                   |   1 +
 23 files changed, 1260 insertions(+), 185 deletions(-)
 create mode 100644 target/riscv/bitmanip_helper.c
 create mode 100644 target/riscv/insn_trans/trans_rvb.c.inc

