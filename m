Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3556CB647
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 07:49:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph2B4-0000sb-7Y; Tue, 28 Mar 2023 01:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1ph2Az-0000q2-LQ; Tue, 28 Mar 2023 01:47:21 -0400
Received: from m12.mail.163.com ([220.181.12.217])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1ph2Au-0005DA-Pn; Tue, 28 Mar 2023 01:47:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=G4HiD
 P2QHQSefVSMWofZpPtDYC20Pxvuc/H+qVQjo0A=; b=KKauKHUn8MHV648huFFOD
 3MKlV0LWQPBmoTMrd4LGPATLkRKg8aEERW/yWTRz2pShlT90funIvi27mY6scGY2
 W0JtR81sxVbj0IHDdQpuqCOSth5YlnTUuRLY93gMgz+avU1LW+/Z0e8v/V6u0jDz
 xyRxWErITfS8/hGY+ChPxs=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [112.224.194.92])
 by zwqz-smtp-mta-g4-4 (Coremail) with SMTP id _____wBHtBBOfyJkWfxRAg--.23168S2;
 Tue, 28 Mar 2023 13:46:56 +0800 (CST)
From: qianfanguijin@163.com
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH v2 00/12] *** add allwinner-r40 support ***
Date: Tue, 28 Mar 2023 13:46:40 +0800
Message-Id: <20230328054654.18620-1-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBHtBBOfyJkWfxRAg--.23168S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr4DZFWDKF48Wr4UJFW7twb_yoW5AFyUpa
 n0k343Kr1rta43JFWaq3ZrJFyrJa4kGr4UJrn7ZryxAryaka1Yvr1UK3WfKrWfGFW2qanr
 ZrZIqF13Wws0qaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_wZ7dUUUUU=
X-Originating-IP: [112.224.194.92]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiXRVA7VWBpDWFlAAAsx
Received-SPF: pass client-ip=220.181.12.217;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: qianfan Zhao <qianfanguijin@163.com>

*** history ***

# v1: 2023-03-21

The first version which add allwinner-r40 support, supported features:

+ ccu
+ dram controller
+ uart
+ i2c and pmic(axp221)
+ sdcard
+ emac/gmac

Also provide a test case under avocado, running quickly test:

$ AVOCADO_ALLOW_LARGE_STORAGE=yes tests/venv/bin/avocado \
    --verbose --show=app,console run -t machine:bpim2u \
    ../tests/avocado/boot_linux_console.py

# v2: 2023-03-28

1. Fix the waring and error reported by checkpatch.pl
2. Remove the other i2c controllers except that i2c0
3. Use an array to register mmc and uart devices
4. Rename axp209 to axp22x and add axp221 support
5. Add a basic SRAM controller

qianfan Zhao (12):
  hw: arm: Add bananapi M2-Ultra and allwinner-r40 support
  hw/arm/allwinner-r40: add Clock Control Unit
  hw: allwinner-r40: Complete uart devices
  hw: arm: allwinner-r40: Add i2c0 device
  hw/misc: Rename axp209 to axp22x and add support AXP221 PMU
  hw/arm/allwinner-r40: add SDRAM controller device
  hw: sd: allwinner-sdhost: Add sun50i-a64 SoC support
  hw: arm: allwinner-r40: Fix the mmc controller's type
  hw: arm: allwinner-r40: Add emac and gmac support
  hw: arm: allwinner-sramc: Add SRAM Controller support for R40
  tests: avocado: boot_linux_console: Add test case for bpim2u
  docs: system: arm: Introduce bananapi_m2u

 configs/devices/arm-softmmu/default.mak |   1 +
 docs/system/arm/bananapi_m2u.rst        | 138 +++++++
 hw/arm/Kconfig                          |  13 +-
 hw/arm/allwinner-r40.c                  | 526 ++++++++++++++++++++++++
 hw/arm/bananapi_m2u.c                   | 145 +++++++
 hw/arm/meson.build                      |   1 +
 hw/misc/Kconfig                         |   5 +-
 hw/misc/allwinner-r40-ccu.c             | 209 ++++++++++
 hw/misc/allwinner-r40-dramc.c           | 513 +++++++++++++++++++++++
 hw/misc/allwinner-sramc.c               | 184 +++++++++
 hw/misc/axp209.c                        | 238 -----------
 hw/misc/axp2xx.c                        | 283 +++++++++++++
 hw/misc/meson.build                     |   5 +-
 hw/misc/trace-events                    |  26 +-
 hw/sd/allwinner-sdhost.c                |  70 +++-
 include/hw/arm/allwinner-r40.h          | 143 +++++++
 include/hw/misc/allwinner-r40-ccu.h     |  65 +++
 include/hw/misc/allwinner-r40-dramc.h   | 108 +++++
 include/hw/misc/allwinner-sramc.h       |  69 ++++
 include/hw/sd/allwinner-sdhost.h        |   9 +
 tests/avocado/boot_linux_console.py     | 176 ++++++++
 21 files changed, 2679 insertions(+), 248 deletions(-)
 create mode 100644 docs/system/arm/bananapi_m2u.rst
 create mode 100644 hw/arm/allwinner-r40.c
 create mode 100644 hw/arm/bananapi_m2u.c
 create mode 100644 hw/misc/allwinner-r40-ccu.c
 create mode 100644 hw/misc/allwinner-r40-dramc.c
 create mode 100644 hw/misc/allwinner-sramc.c
 delete mode 100644 hw/misc/axp209.c
 create mode 100644 hw/misc/axp2xx.c
 create mode 100644 include/hw/arm/allwinner-r40.h
 create mode 100644 include/hw/misc/allwinner-r40-ccu.h
 create mode 100644 include/hw/misc/allwinner-r40-dramc.h
 create mode 100644 include/hw/misc/allwinner-sramc.h

-- 
2.25.1


