Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B12561918
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 13:27:22 +0200 (CEST)
Received: from localhost ([::1]:46126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6sKP-0001oj-Gx
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 07:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sHg-00073Z-HP; Thu, 30 Jun 2022 07:24:32 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:32865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sHd-0001xW-Ic; Thu, 30 Jun 2022 07:24:32 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LYbZW0nn8z4xYN;
 Thu, 30 Jun 2022 21:24:19 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LYbZT1XRhz4xD5;
 Thu, 30 Jun 2022 21:24:16 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 00/27] aspeed queue
Date: Thu, 30 Jun 2022 13:23:44 +0200
Message-Id: <20220630112411.1474431-1-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The following changes since commit 621745c4f349ac09b72706c46febee983abca916:

  Merge tag 'trivial-branch-for-7.1-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-06-30 04:49:40 +0530)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20220630

for you to fetch changes up to 55c57023b740c29151d42600af9ac43ba00e56cc:

  hw/misc/aspeed: Add PECI controller (2022-06-30 09:21:14 +0200)

----------------------------------------------------------------
aspeed queue:

* m25p80 improvements (Iris)
* Code cleanup in preparation of multi SoC machine (Peter)
* New MAX31785 model (Mahesh)
* New Qualcomm machines (Jae and Graeme)
* Core I2C slave mode (Klaus)
* Aspeed I2C slave mode for old and new register interface (Peter and Klaus)
* New Aspeed PECI model (Peter)
* Various small fixes

----------------------------------------------------------------
Cédric Le Goater (4):
      aspeed: Set the dram container at the SoC level
      aspeed/scu: Add trace events for read ops
      aspeed/i2c: Change trace event for NORMAL_STOP states
      aspeed/smc: Fix potential overflow

Graeme Gregory (1):
      hw/arm/aspeed: add Qualcomm Firework BMC machine

Iris Chen (2):
      hw: m25p80: add WP# pin and SRWD bit for write protection
      hw: m25p80: add tests for write protect (WP# and SRWD bit)

Jae Hyun Yoo (2):
      hw/arm/aspeed: add support for the Qualcomm DC-SCM v1 board
      hw/arm/aspeed: firework: add I2C MUXes for VR channels

Joel Stanley (1):
      aspeed/hace: Accumulative mode supported

Klaus Jensen (3):
      hw/i2c: support multiple masters
      hw/i2c: add asynchronous send
      hw/i2c/aspeed: add slave device in old register mode

Maheswara Kurapati (4):
      hw/i2c: pmbus: Page #255 is valid page for read requests.
      hw/sensor: add Maxim MAX31785 device
      hw/arm/aspeed: Add MAX31785 Fan controllers
      hw/arm/aspeed: firework: Add Thermal Diodes

Peter Delevoryas (10):
      aspeed: Set CPU memory property explicitly
      aspeed: Add memory property to Aspeed SoC
      aspeed: Remove usage of sysbus_mmio_map
      aspeed: Map unimplemented devices in SoC memory
      aspeed: Remove use of qemu_get_cpu
      hw/i2c/aspeed: Fix R_I2CD_FUN_CTRL reference
      hw/i2c/aspeed: Fix DMA len write-enable bit handling
      hw/i2c/aspeed: Fix MASTER_EN missing error message
      hw/i2c/aspeed: Add new-registers DMA slave mode RX support
      hw/misc/aspeed: Add PECI controller

 include/hw/arm/aspeed_soc.h   |  16 ++
 include/hw/i2c/aspeed_i2c.h   |  11 +
 include/hw/i2c/i2c.h          |  30 +++
 include/hw/misc/aspeed_peci.h |  29 +++
 hw/arm/aspeed.c               | 136 +++++++---
 hw/arm/aspeed_ast10x0.c       |  59 +++--
 hw/arm/aspeed_ast2600.c       | 104 +++++---
 hw/arm/aspeed_soc.c           | 143 ++++++++---
 hw/arm/pxa2xx.c               |   2 +
 hw/block/m25p80.c             |  82 ++++--
 hw/display/sii9022.c          |   2 +
 hw/display/ssd0303.c          |   2 +
 hw/i2c/aspeed_i2c.c           | 236 ++++++++++++++---
 hw/i2c/core.c                 |  70 +++++-
 hw/i2c/pmbus_device.c         |   6 +-
 hw/i2c/smbus_slave.c          |   4 +
 hw/misc/aspeed_hace.c         |   6 +-
 hw/misc/aspeed_peci.c         | 152 +++++++++++
 hw/misc/aspeed_scu.c          |   2 +
 hw/nvram/eeprom_at24c.c       |   2 +
 hw/sensor/lsm303dlhc_mag.c    |   2 +
 hw/sensor/max31785.c          | 573 ++++++++++++++++++++++++++++++++++++++++++
 hw/ssi/aspeed_smc.c           |   4 +-
 tests/qtest/aspeed_smc-test.c |  62 +++++
 hw/arm/Kconfig                |   2 +
 hw/i2c/trace-events           |   2 +
 hw/misc/meson.build           |   3 +-
 hw/misc/trace-events          |   6 +
 hw/sensor/Kconfig             |   4 +
 hw/sensor/meson.build         |   1 +
 30 files changed, 1573 insertions(+), 180 deletions(-)
 create mode 100644 include/hw/misc/aspeed_peci.h
 create mode 100644 hw/misc/aspeed_peci.c
 create mode 100644 hw/sensor/max31785.c

