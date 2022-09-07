Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDBF5AFF6A
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 10:42:38 +0200 (CEST)
Received: from localhost ([::1]:41198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVqdp-000628-D3
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 04:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq3G-0003g1-Hq
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:04:50 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq3E-0004UV-6n
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:04:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537887; x=1694073887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q6awkahjvcXrJ1BRpioTvls7KsQ/HfLaapeGJc+1NX4=;
 b=BRWAyrc8WmsJSEQn7+DZJyKcEuKmT/WMIrD4bhfAXTOb2JIYtSUK6FjD
 9iIGjoluQmxuVcOnb4Mu8E2wBRzbawojM4zdwrk65Ufp5vzQOPne5dXMB
 CqB/b+7/iwN6Ab4N2susPVbElbH5mAUgBdf4Do+Dm30Xl2D2KbjlKS7DN
 466B4dB1ypaSxoQlffmsLZ2oFQRxPM137jSHHeIJ7DVO+88XPcyIx9Rfx
 1V/TG71K4c6awvhDXCFo2AsnNW83wy3tmERVwKNe7ESlP9aq2vsaFgmIU
 5Lw3FSS2b7ejWk4cc/J3Dp2v1aPMJJUhDXPHf9g0zkqWRMO9xLdF9+wdN Q==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210714982"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:04:35 +0800
IronPort-SDR: Y64Qfvzht7zSFi7/vwx2+Rt4kZKQ1IQMp9tCGl7o+UDXbm8NfWmBJnwz7daEfZWP0jTwAnJ/7x
 OQ4rmoiALBKAomYyDoRyyYo0ogr45FokweL/xr76svzXWpi1q6GVh3wr0+tkrizaCHVnILCTm5
 tfuqX3rsFnrlA6/3Cb9qOdAbkU6XVVWcvX1bc3xsXYt8oK0ZgSwMw5a0GasnohyEzVGYxo8WWV
 nbzvv64uEK3wArLBxw3wQfjutEAC46IN56lY5HasCRvHFnRGl1KV3Uqoy7gJ+iuK8jtrH345wR
 DXnTtzCnIkJbuClcg93+ycjr
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:19:32 -0700
IronPort-SDR: pAPr78m2em2kwUO1hMCn44zg84ermrC+78BReyvywgt3st/a2+0ePuRprL3i4hufMIulBNbRAe
 QduM2vI2NNFTtvG+YnM8lLNo7hrk37brwvMlJF2J/5Sg4sv+vCM2USpXbVHWXpGl2fV/+DWNXw
 8MFQgRrYE2ePKrODIjVegx8vihfk4JALSzKlql+21o5+AcpUXhUbUzs4HV+O880HfEvwuMwW1S
 L/Ot8ttErd7wgt+5vAgu+oYFLi3WpK2++dwkZ5TZm3vHjNB7PMPSgxJ4P92R0zlX4fStf/ljuI
 SfY=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:04:34 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 12/44] roms/opensbi: Upgrade from v1.0 to v1.1
Date: Wed,  7 Sep 2022 10:03:21 +0200
Message-Id: <20220907080353.111926-13-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220907080353.111926-1-alistair.francis@wdc.com>
References: <20220907080353.111926-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=242877ce7=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
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
Reply-to:  Alistair Francis <alistair.francis@wdc.com>
From:  Alistair Francis via <qemu-devel@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

Upgrade OpenSBI from v1.0 to v1.1 and the pre-built bios images.

The v1.1 release includes the following commits:

5b99603 lib: utils/ipi: Fix size check in aclint_mswi_cold_init()
6dde435 lib: utils/sys: Extend HTIF library to allow custom base address
8257262 platform: sifive_fu740: do not use a global in da9063_reset/shutdown
fb688d9 platform: sifive_fu740: fix reset when watchdog is running
5d025eb lib: fix pointer of type 'void *' used in arithmetic
632f593 lib: sbi: Map only the counters enabled in hardware
3b7c204 lib: sbi: Disable interrupt during config matching
a26dc60 lib: sbi: Disable interrupt and inhibit counting in M-mode during init
5d53b55 Makefile: fix build with binutils 2.38
6ad8917 lib: fix compilation when strings.h is included
ce4c018 lib: utils/serial: Round UART8250 baud rate divisor to nearest integer
01250d0 include: sbi: Add AIA related CSR defines
8f96070 lib: sbi: Detect AIA CSRs at boot-time
65b4c7c lib: sbi: Use AIA CSRs for local interrupts when available
222132f lib: sbi: Add sbi_trap_set_external_irqfn() API
5f56314 lib: utils/irqchip: Allow multiple FDT irqchip drivers
1050940 include: sbi: Introduce nascent_init() platform callback
55e79f8 lib: sbi: Enable mie.MEIE bit for IPIs based on external interrupts.
9f73669 lib: utils/irqchip: Add IMSIC library
811da5c lib: utils/irqchip: Add FDT based driver for IMSIC
7127aaa lib: utils: Disable appropriate IMSIC DT nodes in fdt_fixups()
9979265 lib: utils/irqchip: Add APLIC initialization library
3461219 lib: utils/irqchip: Add FDT based driver for APLIC
8e2ef4f lib: utils: Disable appropriate APLIC DT nodes in fdt_fixups()
3a69cc1 lib: sbi: fix typo in is_region_subset
f2ccf2f lib: sbi: verbose sbi_domain_root_add_memregion
f3f4604 lib: sbi: Add a simple external interrupt handling framework
4998a71 lib: utils: serial: Initial commit of xlnx-uartlite
2dfbd3c lib: pmp_set/pmp_get moved errors from runtime to compile time
b6b7220 firmware: Fix code for accessing hart_count and stack_size
d552fc8 lib: Add error messages via conditional compilation for the future
555bdb1 include: Use static asserts for SBI_PLATFORM_xxx_OFFSET defines
1b42d3a include: Use static asserts for SBI_SCRATCH_xxx_OFFSET defines
7924a0b include: Use static asserts for FW_DYNAMIC_INFO_xxx_OFFSET defines
722f80d include: Add defines for [m|h|s]envcfg CSRs
31fecad lib: sbi: Detect menvcfg CSR at boot time
47d6765 lib: sbi: Enable Zicbo[m|z] extensions in the menvcfg CSR
794986f lib: sbi: Enable Svpbmt extension in the menvcfg CSR
499601a lib: sbi: Add Smstateen extension defines
d44568a lib: sbi: Detect Smstateen CSRs at boot-time
3383d6a lib: irqchip/imsic: configure mstateen
5c5cbb5 lib: utils/serial: support 'reg-offset' property
c1e47d0 include: correct the definition of MSTATUS_VS
9cd95e1 lib: sbi/hart: preserve csr validation value
4035ae9 docs: pmu: Improve the PMU DT bindings
d62f6da lib: sbi: Implement Sstc extension
474a9d4 lib: sbi: Fix mstatus_init() for RV32 when Sscofpmf is not available
e576b3e include: sbi: Define SBI_PMU_HW_EVENT_MAX to 256
b0c9df5 lib: sbi: Fix mhpmeventh access for rv32 in absence of sscofpmf
1a754bb lib: sbi: Detect and print privileged spec version
5a6be99 lib: sbi: Remove 's' and 'u' from misa_string() output
5b8b377 lib: sbi: Update the name of ISA string printed at boot time
d4b563c lib: sbi: Remove MCOUNTEREN and SCOUNTEREN hart features
dbc3d8f lib: sbi: Remove MCOUNTINHIBT hart feature
97a17c2 lib: sbi: Remove MENVCFG hart feature
a6ab94f lib: sbi: Fix AIA feature detection
cad6c91 lib: sbi: Convert hart features into hart extensions
be4903a lib: sbi: Detect hart features only once for each hart
994ace3 lib: sbi: Add sbi_hart_update_extension() function
023f0ad lib: sbi_platform: Add callback to populate HART extensions
f726f2d Makefile: Allow generated C source to be anywhere in build directory
7fb474b Makefile: Add support for generating C array at compile time
73cf511 lib: utils/reset: Generate FDT reset driver list at compile-time
1e62705 lib: utils/serial: Generate FDT serial driver list at compile-time
bfeb305 lib: utils/timer: Generate FDT timer driver list at compile-time
3a69d12 lib: utils/irqchip: Generate FDT irqchip driver list at compile-time
4ee0c57 lib: utils/ipi: Generate FDT ipi driver list at compile-time
998ed43 lib: utils/i2c: Generate FDT i2c adapter driver list at compile-time
4eacd82 lib: utils/gpio: Generate FDT gpio driver list at compile-time
a3a3c60 platform: generic: Generate platform override module list at compile-time
9a7a677 platform: generic: Move Sifive platform overrides into own directory
851c14d lib: utils/irqchip: fix typo when checking for CPU node
90a9dd2 lib: utils/fdt: introduce fdt_node_is_enabled()
616da52 lib: utils: check if CPU node is enabled
575bb4e platform: generic: check if CPU node is enabled
1bc67db lib: utils/fdt: rename fdt_parse_max_hart_id
f067bb8 lib: sbi: fix system_opcode_insn
fab0379 lib: utils/fdt: Require match data to be const
295e5f3 lib: sbi_timer: Drop unnecessary get_platform_ticks wrapper
ff65bfe lib: sbi_illegal_insn: Constify illegal_insn_table
cb8271c lib: sbi_illegal_insn: Add emulation for fence.tso
adc3388 lib: sbi_trap: Redirect exception based on hedeleg
ce1d618 platform: generic: add overrides for vendor extensions
b20ed9f lib: sbi_hsm: Call a device hook during hart resume
79e42eb lib: sbi_hsm: Assume a consistent resume address
2ea7799 lib: irqchip/plic: Constify plic_data pointers
8c362e7 lib: irqchip/plic: Factor out a context init function
415ecf2 lib: irqchip/plic: Add context save/restore helpers
2b79b69 lib: irqchip/plic: Add priority save/restore helpers
69be3df lib: utils/irqchip: Add FDT wrappers for PLIC save/restore functions
5e56758 lib: utils/irqchip: Add wrapper for T-HEAD PLIC delegation
9dc5ec5 platform: Add HSM implementation for Allwinner D1
551c70c include: sbi: Add mtinst/htinst psuedoinstructions
187127f lib: sbi: Fixup tinst for exceptions in sbi_misaligned_*()
a07402a lib: sbi: Fix tval and tinst for sbi_get_insn()
c653001 lib: utils: Remove CSRs that set/clear an IMSIC interrupt file bits
7738345 lib: utils/timer: Add a separate compatible for the D1 CLINT
d76a196 lib: irqchip/plic: fix typo in plic_warm_irqchip_init
6f1fe98 lib: utils/timer: Remove Allwinner D1 CLINT compatibles
c6fdbcf include: sbi: Change spec version to 1.0
3f66465 lib: pmu: allow to use the highest available counter
4489876 include: Bump-up version to 1.1

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220713090613.204046-1-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../opensbi-riscv32-generic-fw_dynamic.bin    | Bin 108504 -> 117704 bytes
 .../opensbi-riscv64-generic-fw_dynamic.bin    | Bin 105296 -> 115344 bytes
 roms/opensbi                                  |   2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin b/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin
index dba8e8655f..81bab1adc9 100644
Binary files a/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin and b/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin differ
diff --git a/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin b/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin
index f223e56991..5eb0a74326 100644
Binary files a/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin and b/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin differ
diff --git a/roms/opensbi b/roms/opensbi
index 48f91ee9c9..4489876e93 160000
--- a/roms/opensbi
+++ b/roms/opensbi
@@ -1 +1 @@
-Subproject commit 48f91ee9c960f048c4a7d1da4447d31e04931e38
+Subproject commit 4489876e933d8ba0d8bc6c64bae71e295d45faac
-- 
2.37.2


