Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB0D51CF51
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 05:17:56 +0200 (CEST)
Received: from localhost ([::1]:50136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmoTb-0000se-56
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 23:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nmoSC-0007La-IM; Thu, 05 May 2022 23:16:28 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:40033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nmoS9-00073w-T7; Thu, 05 May 2022 23:16:27 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 24632OOh041963;
 Fri, 6 May 2022 11:02:24 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 6 May
 2022 11:15:22 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <steven_lee@aspeedtech.com>
Subject: [PATCH v1 1/1] docs: add minibmc section in aspeed document
Date: Fri, 6 May 2022 11:15:21 +0800
Message-ID: <20220506031521.13254-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220506031521.13254-1-jamin_lin@aspeedtech.com>
References: <20220506031521.13254-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 24632OOh041963
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 docs/system/arm/aspeed.rst | 61 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 60ed94f187..6f2e4fb53d 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -120,3 +120,64 @@ FMC chip and a bigger (64M) SPI chip, use :
 .. code-block:: bash
 
   -M ast2500-evb,fmc-model=mx25l25635e,spi-model=mx66u51235f
+
+
+Aspeed minibmc family boards (``ast1030-evb``)
+==================================================================
+
+The QEMU Aspeed machines model mini BMCs of various Aspeed evaluation
+boards. They are based on different releases of the
+Aspeed SoC : the AST1030 integrating an ARM Cortex M4F CPU (200MHz).
+
+The SoC comes with SRAM, SPI, I2C, etc.
+
+AST1030 SoC based machines :
+
+- ``ast1030-evb``          Aspeed AST1030 Evaluation board (Cortex-M4F)
+
+Supported devices
+-----------------
+
+ * SMP (for the AST1030 Cortex-M4F)
+ * Interrupt Controller (VIC)
+ * Timer Controller
+ * I2C Controller
+ * System Control Unit (SCU)
+ * SRAM mapping
+ * Static Memory Controller (SMC or FMC) - Only SPI Flash support
+ * SPI Memory Controller
+ * USB 2.0 Controller
+ * Watchdog Controller
+ * GPIO Controller (Master only)
+ * UART
+ * LPC Peripheral Controller (a subset of subdevices are supported)
+ * Hash/Crypto Engine (HACE) - Hash support only. TODO: HMAC and RSA
+ * ADC
+
+
+Missing devices
+---------------
+
+ * PWM and Fan Controller
+ * Slave GPIO Controller
+ * PECI Controller
+ * Mailbox Controller
+ * Virtual UART
+ * eSPI Controller
+ * I3C Controller
+
+Boot options
+------------
+
+The Aspeed machines can be started using the ``-kernel`` to load a
+Zephyr OS or from a firmware. Images can be downloaded from the
+ASPEED GitHub release repository :
+
+   https://github.com/AspeedTech-BMC/zephyr/releases
+
+To boot a kernel directly from a Zephyr build tree:
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M ast1030-evb -nographic \
+        -kernel zephyr.elf
-- 
2.17.1


