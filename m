Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D146A8166
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:43:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhJi-00047P-E9; Thu, 02 Mar 2023 06:41:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1pXhJd-00042N-4a; Thu, 02 Mar 2023 06:41:41 -0500
Received: from m12.mail.163.com ([123.126.96.233])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1pXhJZ-00069A-5N; Thu, 02 Mar 2023 06:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=jCDes
 igh82Ronj4ZJhWWGo4BX8vn3tjCkvwhAX4N0+w=; b=ncSEJTMevMkQtFw36zWeI
 mnnamlNl7kuYXMYQKuBK+XFuUEQuh04+Tt7ZlJJVmrnM5YsDQYhl9i1FJc0lOY8o
 fyjtIjcFfje29NMBWQtLcogDjhTSQukxZP5qCC+TSB/6/YhFn//CW6kn3BdlvdcL
 h/WHa9mhylzdAFwozATgJw=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [144.123.156.254])
 by smtp20 (Coremail) with SMTP id H91pCgBni79OiwBknjVaGA--.63318S2;
 Thu, 02 Mar 2023 19:41:02 +0800 (CST)
From: qianfanguijin@163.com
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [RFC PATCH v1 00/12] *** Add allwinner R40 device support ***
Date: Thu,  2 Mar 2023 19:40:49 +0800
Message-Id: <20230302114102.32236-1-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: H91pCgBni79OiwBknjVaGA--.63318S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFyUXw48ArWUuFyfXFyUGFg_yoW5GryUpF
 s8C3y5Kr45Ja13AF4aqFsrJFyrJa4kGr4Utrn7ZFy7Ary7Kan0qr1UKa1furWrGrWUKr47
 ZFWSqF1Sgws8taDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRAbbiUUUUU=
X-Originating-IP: [144.123.156.254]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiQg8m7VaEEhmlOQAAsD
Received-SPF: pass client-ip=123.126.96.233;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

v1: 2023-03-02

The first three patches try fix allwinner i2c driver and I already send them
as a standalone PR and can read it from: 

https://patchwork.kernel.org/project/qemu-devel/patch/20230220081252.25348-3-qianfanguijin@163.com/

Hope that patch can merged first before this.

The next patches will add allwinner R40 device support, including ccu, mmc, i2c,
axp221 pmic, sdram controller, emac and gmac. Now the mainline u-boot and
kernel can work fine (It doesn't support booting allwinner bsp code and there
are no plans to support it now).

qianfan Zhao (12):
  hw: allwinner-i2c: Make the trace message more readable
  hw: allwinner-i2c: Fix TWI_CNTR_INT_FLAG on SUN6i SoCs
  hw: arm: allwinner-h3: Fix and complete H3 i2c devices
  hw: arm: Add bananapi M2-Ultra and allwinner-r40 support
  hw/arm/allwinner-r40: add Clock Control Unit
  hw: allwinner-r40: Complete uart devices
  hw: arm: allwinner-r40: Add 5 TWI controllers
  hw/misc: AXP221 PMU Emulation
  hw/arm/allwinner-r40: add SDRAM controller device
  hw: sd: allwinner-sdhost: Add sun50i-a64 SoC support
  hw: arm: allwinner-r40: Fix the mmc controller's type
  hw: arm: allwinner-r40: Add emac and gmac support

 configs/devices/arm-softmmu/default.mak |   1 +
 hw/arm/Kconfig                          |  10 +
 hw/arm/allwinner-h3.c                   |  29 +-
 hw/arm/allwinner-r40.c                  | 555 ++++++++++++++++++++++++
 hw/arm/bananapi_m2u.c                   | 128 ++++++
 hw/arm/meson.build                      |   1 +
 hw/i2c/allwinner-i2c.c                  | 136 +++++-
 hw/i2c/trace-events                     |   5 +-
 hw/misc/Kconfig                         |   4 +
 hw/misc/allwinner-r40-ccu.c             | 207 +++++++++
 hw/misc/allwinner-r40-dramc.c           | 499 +++++++++++++++++++++
 hw/misc/axp221.c                        | 196 +++++++++
 hw/misc/meson.build                     |   3 +
 hw/misc/trace-events                    |  19 +
 hw/sd/allwinner-sdhost.c                |  70 ++-
 include/hw/arm/allwinner-h3.h           |   6 +
 include/hw/arm/allwinner-r40.h          | 148 +++++++
 include/hw/i2c/allwinner-i2c.h          |   6 +
 include/hw/misc/allwinner-r40-ccu.h     |  65 +++
 include/hw/misc/allwinner-r40-dramc.h   | 108 +++++
 include/hw/sd/allwinner-sdhost.h        |   9 +
 21 files changed, 2191 insertions(+), 14 deletions(-)
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


