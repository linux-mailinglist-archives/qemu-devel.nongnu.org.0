Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911C131E428
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 03:02:28 +0100 (CET)
Received: from localhost ([::1]:35926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCYeB-0007vH-JQ
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 21:02:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYbp-0006Hp-F3
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:01 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:40586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYbl-0008Jj-MK
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1613613598; x=1645149598;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s+YX4f6k0w0A0f9/Et+7nZl3oCy3oU4STUShijCDatw=;
 b=NHeO2/f9OTvKsKeCqXXLZ1LN8FtRbednGURhiJTUIUCn4f88WHnIgTpo
 r07H84Nylxxa1tFMyf6kISclAcAGctSbns0P7g/GhQoLV0Fomqs/aDZDm
 4ZsXAyXn2CcWWzlwAMWy43f9pH/qE71fkqH2Wb70I90DDF4DwQzXXmsRI
 GrKFsN9ylErLXOen78MwrneCXAKzkD1VKiu282FDm4yn1nsFodaXlbFFV
 uS4CPMV2vgmwlZQgt76qptixYavLQwMOEn7Q7W1h2jPjuxQaz0iubOGMz
 IUZVFJmRw1IQ8wvn3gfVhoVvDZjnRvxE9jRrA93hDDT0IvbJP6vsvhVsq g==;
IronPort-SDR: rQI0rT/hUJJReTGI+L0MHq+JqUdEy1rmqkduHxytvwu1T6//wt7ueQclzjgTjEajww59HEF+T9
 zVfUH+DAnhBnN3aWe+jSAzCGfX18hYtx4oDNVm4kzJb0QkiKqXhX+wAa9/ffScCza0L3AWrDH8
 OHFV6tn+jQrg/+9Ud+oUZqy3xrd+9fZQdaRkF4NQ5rVBunaacjIEHFHXHxEe20yrK/bi5OYdzF
 ipVxPDh2SBN5wKZLVCJAQ1B8IKfsc4eMKq4RYo2SHvEGcZalVSwo3+SPl2V/SsZ48JrdpBOxcY
 Vwo=
X-IronPort-AV: E=Sophos;i="5.81,185,1610380800"; d="scan'208";a="161392109"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Feb 2021 09:59:54 +0800
IronPort-SDR: zktlvqXx8QlEu1wbKvCIwsNRBFXBaNuYmJ0cWnl2LrFDO+0urAxXCres8pXZgGlQ+glKPKYnOm
 8w7TZcJSGD6b7wbR0aZSL2x0WRE9/WudM7UVyD4WKhkGSiCV2CufXbocuZBg+OsiIzXs/rta3y
 GdOzaduaZoesdBF+R0ulzM4difu/2moqsdbsBF/5sl37P+TBqeKQXnF14MAk5RZc/h+dEiS1fQ
 4qbMZGIOeedKHCBulXeUvTf8ejO8Dd2luJja18EExks6U1YeiDkw5esDL5HDfLF8LSevgMvVTm
 nziuwdmGFzr+bZvFIsAsMmbM
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 17:43:24 -0800
IronPort-SDR: ZC1XztvrKDp3xB0s3+vyYQOcwum7yYzjGJ7QBUTPk+0NWWXvn8xZf1cl5N9pII1vPQSox8XvMr
 IRMQxxuIjFHNemJCynooHCKWewQSh5N/PGwWC/ZppYWuV+EK8qq6Bn6w2MfUg7SgSoPGqwKBvD
 mQpwS9kn0aDtkhfuIGoZpaPx4mAsMC7H0ZBtM2GCY/dEu15OpESGUmHqh7EbQzgxnzYSP9PmlS
 /KtPzIVWducZl5IEZMNPHwUPeCpvCp3D7SNwTIsPlim6ZgcnVAurgCU2HebehOe0M8DQ8QsqgQ
 ZRU=
WDCIronportException: Internal
Received: from cn57xfd72.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.43])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Feb 2021 17:59:54 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 00/19] riscv-to-apply queue
Date: Wed, 17 Feb 2021 17:59:15 -0800
Message-Id: <20210218015934.1623959-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=6763bdb70=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 1af5629673bb5c1592d993f9fb6119a62845f576:

  Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20210216' into staging (2021-02-17 14:44:18 +0000)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210217-1

for you to fetch changes up to d0867d2dad4125d2295b28d6f91fa49cf034ffd2:

  hw/riscv: virt: Map high mmio for PCIe (2021-02-17 17:47:19 -0800)

----------------------------------------------------------------
RISC-V PR for 6.0

This PR is a collection of RISC-V patches:
 - Improvements to SiFive U OTP
 - Upgrade OpenSBI to v0.9
 - Support the QMP dump-guest-memory
 - Add support for the SiFive SPI controller (sifive_u)
 - Initial RISC-V system documentation
 - A fix for the Goldfish RTC
 - MAINTAINERS updates
 - Support for high PCIe memory in the virt machine

----------------------------------------------------------------
Alistair Francis (1):
      MAINTAINERS: Add a SiFive machine section

Bin Meng (16):
      target/riscv: Declare csr_ops[] with a known size
      hw/misc: sifive_u_otp: Use error_report() when block operation fails
      roms/opensbi: Upgrade from v0.8 to v0.9
      hw/block: m25p80: Add ISSI SPI flash support
      hw/block: m25p80: Add various ISSI flash information
      hw/ssi: Add SiFive SPI controller support
      hw/riscv: sifive_u: Add QSPI0 controller and connect a flash
      hw/riscv: sifive_u: Add QSPI2 controller and connect an SD card
      hw/riscv: sifive_u: Change SIFIVE_U_GEM_IRQ to decimal value
      docs/system: Sort targets in alphabetical order
      docs/system: Add RISC-V documentation
      docs/system: riscv: Add documentation for sifive_u machine
      hw/riscv: Drop 'struct MemmapEntry'
      hw/riscv: virt: Drop the 'link_up' parameter of gpex_pcie_init()
      hw/riscv: virt: Limit RAM size in a 32-bit system
      hw/riscv: virt: Map high mmio for PCIe

Laurent Vivier (1):
      goldfish_rtc: re-arm the alarm after migration

Yifei Jiang (1):
      target-riscv: support QMP dump-guest-memory

 docs/system/riscv/sifive_u.rst                 | 336 +++++++++++++++++++++++
 docs/system/target-riscv.rst                   |  72 +++++
 docs/system/targets.rst                        |  20 +-
 include/hw/riscv/sifive_u.h                    |   9 +-
 include/hw/ssi/sifive_spi.h                    |  47 ++++
 target/riscv/cpu.h                             |   6 +-
 target/riscv/cpu_bits.h                        |   1 +
 hw/block/m25p80.c                              |  57 +++-
 hw/misc/sifive_u_otp.c                         |  13 +-
 hw/riscv/microchip_pfsoc.c                     |   9 +-
 hw/riscv/opentitan.c                           |   9 +-
 hw/riscv/sifive_e.c                            |   9 +-
 hw/riscv/sifive_u.c                            | 102 ++++++-
 hw/riscv/spike.c                               |   9 +-
 hw/riscv/virt.c                                |  72 +++--
 hw/rtc/goldfish_rtc.c                          |   2 +
 hw/ssi/sifive_spi.c                            | 358 +++++++++++++++++++++++++
 target/riscv/arch_dump.c                       | 202 ++++++++++++++
 target/riscv/cpu.c                             |   2 +
 MAINTAINERS                                    |   9 +
 hw/riscv/Kconfig                               |   3 +
 hw/ssi/Kconfig                                 |   4 +
 hw/ssi/meson.build                             |   1 +
 pc-bios/opensbi-riscv32-generic-fw_dynamic.bin | Bin 62144 -> 78680 bytes
 pc-bios/opensbi-riscv32-generic-fw_dynamic.elf | Bin 558668 -> 727464 bytes
 pc-bios/opensbi-riscv64-generic-fw_dynamic.bin | Bin 70792 -> 75096 bytes
 pc-bios/opensbi-riscv64-generic-fw_dynamic.elf | Bin 620424 -> 781264 bytes
 roms/opensbi                                   |   2 +-
 target/riscv/meson.build                       |   1 +
 29 files changed, 1290 insertions(+), 65 deletions(-)
 create mode 100644 docs/system/riscv/sifive_u.rst
 create mode 100644 docs/system/target-riscv.rst
 create mode 100644 include/hw/ssi/sifive_spi.h
 create mode 100644 hw/ssi/sifive_spi.c
 create mode 100644 target/riscv/arch_dump.c

