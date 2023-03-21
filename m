Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F0B6C2EBF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 11:26:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peZBX-0000TX-8A; Tue, 21 Mar 2023 06:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1peZBP-0000PP-OI; Tue, 21 Mar 2023 06:25:35 -0400
Received: from m12.mail.163.com ([220.181.12.197])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1peZBK-0008NJ-He; Tue, 21 Mar 2023 06:25:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Q7Ict
 vYEntp8REioPeWzSgXU06FNaS+arlTH5Xz6zgg=; b=MN7e9v/Ig7F0+Ki0WatUI
 p+/eSndJyrppLHs5GZrtd1cZ0FDD5S8FGJ1NIx1TIvyxQpHlDCmg2DtPMk15ux9v
 UQPxwhK+0Ij8VuBEDj1INfw9nQu2GY9mma5khmOynXSk5iUPkgl/WI03r9METDCV
 0CgeS1IX7ejrGZWTMlJeZ4=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [218.201.129.19])
 by zwqz-smtp-mta-g5-1 (Coremail) with SMTP id _____wBnznIHhhlk7VIWAA--.11160S2;
 Tue, 21 Mar 2023 18:25:13 +0800 (CST)
From: qianfanguijin@163.com
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH v1 00/11] *** add allwinner-r40 support ***
Date: Tue, 21 Mar 2023 18:24:59 +0800
Message-Id: <20230321102510.16754-1-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnznIHhhlk7VIWAA--.11160S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw4rJFyDWw1rtw45Cw15Arb_yoW8KrWrpa
 n0k345Kr1rAa13JFWaqFs7JFyrJa4kGr4Utrn2vFy7AryfKa1Yvr1UK3ZagrWfGFZFqw47
 ZrZIqFy3Ww45taDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRAbbiUUUUU=
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiXQc57VWBo+uC8QACsj
Received-SPF: pass client-ip=220.181.12.197;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

qianfan Zhao (11):
  hw: arm: Add bananapi M2-Ultra and allwinner-r40 support
  hw/arm/allwinner-r40: add Clock Control Unit
  hw: allwinner-r40: Complete uart devices
  hw: arm: allwinner-r40: Add 5 TWI controllers
  hw/misc: AXP221 PMU Emulation
  hw/arm/allwinner-r40: add SDRAM controller device
  hw: sd: allwinner-sdhost: Add sun50i-a64 SoC support
  hw: arm: allwinner-r40: Fix the mmc controller's type
  hw: arm: allwinner-r40: Add emac and gmac support
  tests: avocado: boot_linux_console: Add test case for bpim2u
  docs: system: arm: Introduce bananapi_m2u

 configs/devices/arm-softmmu/default.mak |   1 +
 docs/system/arm/bananapi_m2u.rst        | 138 ++++++
 hw/arm/Kconfig                          |  10 +
 hw/arm/allwinner-r40.c                  | 558 ++++++++++++++++++++++++
 hw/arm/bananapi_m2u.c                   | 131 ++++++
 hw/arm/meson.build                      |   1 +
 hw/misc/Kconfig                         |   4 +
 hw/misc/allwinner-r40-ccu.c             | 207 +++++++++
 hw/misc/allwinner-r40-dramc.c           | 499 +++++++++++++++++++++
 hw/misc/axp221.c                        | 196 +++++++++
 hw/misc/meson.build                     |   3 +
 hw/misc/trace-events                    |  19 +
 hw/sd/allwinner-sdhost.c                |  70 ++-
 include/hw/arm/allwinner-r40.h          | 148 +++++++
 include/hw/misc/allwinner-r40-ccu.h     |  65 +++
 include/hw/misc/allwinner-r40-dramc.h   | 108 +++++
 include/hw/sd/allwinner-sdhost.h        |   9 +
 tests/avocado/boot_linux_console.py     | 173 ++++++++
 18 files changed, 2337 insertions(+), 3 deletions(-)
 create mode 100644 docs/system/arm/bananapi_m2u.rst
 create mode 100644 hw/arm/allwinner-r40.c
 create mode 100644 hw/arm/bananapi_m2u.c
 create mode 100644 hw/misc/allwinner-r40-ccu.c
 create mode 100644 hw/misc/allwinner-r40-dramc.c
 create mode 100644 hw/misc/axp221.c
 create mode 100644 include/hw/arm/allwinner-r40.h
 create mode 100644 include/hw/misc/allwinner-r40-ccu.h
 create mode 100644 include/hw/misc/allwinner-r40-dramc.h

-- 
2.25.1


