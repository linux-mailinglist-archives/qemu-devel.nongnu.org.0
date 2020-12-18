Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F06C72DDE50
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:03:52 +0100 (CET)
Received: from localhost ([::1]:47908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq8ro-0006oL-0s
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:03:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8pQ-0004vn-U6
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:01:25 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:9924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8pO-0002G4-DQ
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:01:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608271589; x=1639807589;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PLLYWAnBWQ7O/ZTDweRdRbF5ailjF4KdcczuwY6QGwY=;
 b=bCPMpoHlw/WfczXkvrKw+vYLpKq8yHtUwpdtmRTflSEGVYmDADPik6+m
 47MIuRz6Cnp3sgX8EFwUzJEipFhQMopsLQWOVQeARnUakaFtwscqgUfvQ
 7QfNS7Wf7GM0CBoSCsXmIewI+A4QtGLVvgeVoJMsXr06vT/aj2g8t/YO1
 EBB46Q1jCmNRzaRzvFuM6ynecOx69vCX+xTxLJ5nsAAjEgKdtIyt40N9Y
 k20769RkQZ/N67NnoWfQMrzUbHHB4U4N7ksXLlIte+Z2KraY7GQkezuJ4
 UuwnmgExJ5xkPk3A+BnaUlVOM1BvGuAiIqs7jkyGEB4eXXOFtfxdIa91J g==;
IronPort-SDR: 6TI/9v3PdxCmDF7J6hUkWfT/aAIwD4IgrGBOSG7/GZKsaeyEvEvsR29oi7C3yO1eS8m5/rjJcL
 hWMZ6zOFCrT8nTMi7DiqgH+MTWgt6z2JKGLqLYAeMEglYUNbBcu2/NqEZjBsP+LnzugXfPeJFV
 AOwQtgknR+dJWwQg2lYG0FdzM3svrcGrlU5PSLfEiNlh+t3AObKVU4wdM8EtXhcKMYfNPnK0K3
 py9amQmjjKSgbISVLIDn5q2tLjdvqRwhhA9zd7FYaQbK+uAdJaHHDoeTXUT5Jz7Q/D+/tPMyEf
 Moo=
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; d="scan'208";a="259237035"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2020 14:06:22 +0800
IronPort-SDR: Hn+85V2oNnDHBynPGMUwrwvuqIf34rG7RWmzB3de32qvD4OIbvgn4PqM3ZtNFPW6b5VSLLb4tk
 vnaZaYweb2BV54/crOiTbFkHTBQ0cxnVJTp2PgdEzMNNYRP/z2fSwK/rwBsJ0YI90roxFGj+0V
 RwHD45Rf41R3zCf8neaY66ugiwZ+aU1QDBJ5NixhWWSv+eW5QFYfTvp3obAUbI9+Q4j4NkD5mo
 YBQz41K3+F8DokoGZUYWZtCxdkLxb/ZURsSBmNjzLZGkAYczQOI7lOT4tM+3Y8TmuqGViCIhfK
 HGaKBd1ye0dhF6dP1QxbhaJe
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 21:46:33 -0800
IronPort-SDR: i7DVvE4YXsZ+ue3RtrzHtclGOu/LpyOnoBE3+EegHImnQ7YQi7GN40Icj7lzuYnH043gUHkl1/
 JuiTvS/wbQSwhNPdWOAAQDwSt/qQ/7PkYxKIJCK2rWcjur8AJkUaLzJbdDtdimKmD13LYEQl7m
 TNvLiFxX48xK98d48NeE7csb2/kgY5lCI6dfH1yync6QafntVnOce5ZZLY0P9ntNPlgENv78Q1
 JHJRMUyerNiXetLiQDriMxIIzYG2vdIkGPc1n0gDONuDasb2W74d0au9HGz11Ig292JghSOJ3u
 l7Y=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.68])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Dec 2020 22:01:17 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 00/23] riscv-to-apply queue
Date: Thu, 17 Dec 2020 22:00:51 -0800
Message-Id: <20201218060114.3591217-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=614e9c0eb=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

The following changes since commit 75ee62ac606bfc9eb59310b9446df3434bf6e8c2:

  Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-request' into staging (2020-12-17 18:53:36 +0000)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20201217-1

for you to fetch changes up to d31e970a01e7399b9cd43ec0dc00c857d968987e:

  riscv/opentitan: Update the OpenTitan memory layout (2020-12-17 21:56:44 -0800)

----------------------------------------------------------------
A collection of RISC-V improvements:
 - Improve the sifive_u DTB generation
 - Add QSPI NOR flash to Microchip PFSoC
 - Fix a bug in the Hypervisor HLVX/HLV/HSV instructions
 - Fix some mstatus mask defines
 - Ibex PLIC improvements
 - OpenTitan memory layout update
 - Initial steps towards support for 32-bit CPUs on 64-bit builds

----------------------------------------------------------------
Alex Richardson (1):
      target/riscv: Fix definition of MSTATUS_TW and MSTATUS_TSR

Alistair Francis (18):
      intc/ibex_plic: Clear interrupts that occur during claim process
      hw/riscv: Expand the is 32-bit check to support more CPUs
      target/riscv: Add a TYPE_RISCV_CPU_BASE CPU
      riscv: spike: Remove target macro conditionals
      riscv: virt: Remove target macro conditionals
      hw/riscv: boot: Remove compile time XLEN checks
      hw/riscv: virt: Remove compile time XLEN checks
      hw/riscv: spike: Remove compile time XLEN checks
      hw/riscv: sifive_u: Remove compile time XLEN checks
      target/riscv: fpu_helper: Match function defs in HELPER macros
      target/riscv: Add a riscv_cpu_is_32bit() helper function
      target/riscv: Specify the XLEN for CPUs
      target/riscv: cpu: Remove compile time XLEN checks
      target/riscv: cpu_helper: Remove compile time XLEN checks
      target/riscv: csr: Remove compile time XLEN checks
      target/riscv: cpu: Set XLEN independently from target
      hw/riscv: Use the CPU to determine if 32-bit
      riscv/opentitan: Update the OpenTitan memory layout

Anup Patel (1):
      hw/riscv: sifive_u: Add UART1 DT node in the generated DTB

Vitaly Wool (1):
      hw/riscv: microchip_pfsoc: add QSPI NOR flash

Xinhao Zhang (1):
      hw/core/register.c: Don't use '#' flag of printf format

Yifei Jiang (1):
      target/riscv: Fix the bug of HLVX/HLV/HSV

 include/hw/riscv/boot.h            |  14 +--
 include/hw/riscv/microchip_pfsoc.h |   3 +
 include/hw/riscv/opentitan.h       |  23 +++--
 include/hw/riscv/spike.h           |   6 --
 include/hw/riscv/virt.h            |   6 --
 target/riscv/cpu.h                 |   8 ++
 target/riscv/cpu_bits.h            |   8 +-
 target/riscv/helper.h              |  24 ++---
 hw/core/register.c                 |  16 ++--
 hw/intc/ibex_plic.c                |  13 ++-
 hw/riscv/boot.c                    |  70 ++++++++-------
 hw/riscv/microchip_pfsoc.c         |  21 +++++
 hw/riscv/opentitan.c               |  81 ++++++++++++-----
 hw/riscv/sifive_u.c                |  74 ++++++++++------
 hw/riscv/spike.c                   |  52 ++++++-----
 hw/riscv/virt.c                    |  39 ++++----
 target/riscv/cpu.c                 |  84 ++++++++++++------
 target/riscv/cpu_helper.c          |  15 ++--
 target/riscv/csr.c                 | 176 +++++++++++++++++++------------------
 target/riscv/fpu_helper.c          |   8 --
 20 files changed, 434 insertions(+), 307 deletions(-)

