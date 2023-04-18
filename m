Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C16536E5FC2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 13:24:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pojOQ-0006TP-6P; Tue, 18 Apr 2023 07:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1pojON-0006Pz-5N; Tue, 18 Apr 2023 07:20:59 -0400
Received: from m12.mail.163.com ([220.181.12.199])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1pojOH-0006il-UV; Tue, 18 Apr 2023 07:20:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ihQbS
 mm0NdLP0HgtDLwYNjpeodSOuBNqEPGWs4wJIN4=; b=YrlRnmDY0YKfqNoDxanPl
 Tx0wPdj5a8/dVKD77xhHrtXCHdc0EjUOR6TSi7xy60enTa/jxbogcXprNKZmqP8r
 7rKy6kQopuNmK1NfDDAI/DxNsAzxN1PTYsDevajZJt/9rKo/ORx90rU+TpBNIRIW
 7EHAM+dg9MimRAoaRNa21o=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [218.201.129.19])
 by zwqz-smtp-mta-g4-0 (Coremail) with SMTP id _____wDXy2EIfT5k6AUwBw--.24225S2;
 Tue, 18 Apr 2023 19:20:41 +0800 (CST)
From: qianfanguijin@163.com
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH v3 00/11] *** Add allwinner-r40 support ***
Date: Tue, 18 Apr 2023 19:20:29 +0800
Message-Id: <20230418112040.12460-1-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXy2EIfT5k6AUwBw--.24225S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr4DZFWDKF4Utr4kAryUGFg_yoW5CFWkpa
 n8K343Kr1rta43JFWaqFnrJFyrJa4kGr4Utrn7ZryxAryaka1Yvr1UK3WfKrWfGFW2qa17
 ZFZIqF13Wws0qaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_RRiiUUUUU=
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/xtbBzgpV7WI0Y4y0dgAAsH
Received-SPF: pass client-ip=220.181.12.199;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

# v3: 2023-04-18

1. Update some commit messages
2. Squash those two commit about sdcard
   hw: sd: allwinner-sdhost: Add sun50i-a64 SoC support
   hw: arm: allwinner-r40: Fix the mmc controller's type

qianfan Zhao (11):
  hw: arm: Add bananapi M2-Ultra and allwinner-r40 support
  hw/arm/allwinner-r40: add Clock Control Unit
  hw: allwinner-r40: Complete uart devices
  hw: arm: allwinner-r40: Add i2c0 device
  hw/misc: Rename axp209 to axp22x and add support AXP221 PMU
  hw/arm/allwinner-r40: add SDRAM controller device
  hw: sd: allwinner-sdhost: Add sun50i-a64 SoC support
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


