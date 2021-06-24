Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D4A3B2E94
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 14:06:48 +0200 (CEST)
Received: from localhost ([::1]:45310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwO87-0004Xi-LA
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 08:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=802348aeb=alistair.francis@wdc.com>)
 id 1lwO40-0003jR-A4
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:02:32 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:53602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=802348aeb=alistair.francis@wdc.com>)
 id 1lwO3x-0003ro-0K
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:02:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1624536149; x=1656072149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3qkqOh9xUfVzpHWka6NyGJ5iqiTacl9dGnX54ZY7ZzY=;
 b=eNtS+h+5QzoWtpKEQYNvSNMfu/iUxptU6c5mSuTknDYZyJ3i+zOzNzXf
 SXHpGR0twaqk737FV9koWmzdmS3zHLjs9/Ng58iQyQMfJU5UVyVqe2odT
 NcE0D3W6S1wGZaOWN9pYlr1Ekotev8mGezaaxo6XOIODBBu2Z3HZ5ek4U
 +3+s/AeqZsEoxdNY/IKGjRzEcP2z5wtiwl2KelS3c0F6KlbA4h49udZoW
 2CgDlNySftWYQFbuiWg3WdiS+S1+/uZqitAQYnShXleu7dGV+QhNQ/en1
 6o4elHRPJ0B6nmj79dWBqOiAafE+6Qldvz61+Ty1a1AicmVF0AV88F29Z Q==;
IronPort-SDR: pprYtaOQUlgnnAMgtq66wIb6qZt1O5o2vAFxwc7JzT5KsO9Lj1RjxnejsjaVD1YthNc4D2c0oB
 IPzS8LSsZiJSpH0H55U7dlpp+Kd5QT4oLLthjaw7fm6WEkznyEUh8gh72MA67XNhE/LkkSs2LG
 +0B5gj/Sm3M59YAJ5tKFCGliSti/+O0nXf0hlM4FM/aiN129jv0RMgCGzqUAgBgpgclwDVlQyC
 R68CP7QhKDj93o7iHVDHzTeh+gF+oQ2ecgAUclpwzPFrmvRbYDgKOPwy0M43S+dwwihSBIDvKm
 ksY=
X-IronPort-AV: E=Sophos;i="5.83,296,1616428800"; d="scan'208";a="173360803"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jun 2021 20:02:16 +0800
IronPort-SDR: NIh8hmIsRDtweyseeKvOrSdOdl/m7XFToeOQxssVru5jZdvGru8HmXkCjCzYygN3yn95F+wH2X
 YSZuk50TF/cgMQP39UFcjs+p39Td+EyiP3xzxPyErXR+qxuqJJnpIhMbk/y8Ypy+KlAd6SYy/b
 jTT2jedl5+Xg4ULTH2UR8fmj8pJ97HAhJQPI8rtqcmbbG2krcvxvG+YlvkGZH7hf3XlXBRj5Na
 ryFbHTa//jgKrpUBD+FiGix5A+tgwlURnD92settKxN9uicnIMMLfvyu3rcRW/ChC9hNy11RUi
 PXtfUNsT+ZUxsTvThyDmO6b1
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 04:39:31 -0700
IronPort-SDR: 5p7BpJ6t4uEpMNeHnXg7SEAXFEcG646vR8ObNYQsOYHMOKLbwsQuzfjeMqyo+EhuTuWObfBVRZ
 EKJCvPkLzrVYgzLsDBp066caMP3Ssa5RKYHubQl1h6UfKx1XX8ve/DnHHYHnlbOOr88TNmHbNv
 GjcG93RbLkkjrt/QodbUb8U1yalTOSZkRJGC6ZMTk5LMqTgWpVpH7Td5AasqPJeJ+c+GVZoNzl
 dAJz+q5Gp3tuVd2eWU/qSGFsRbzx0HzS0DPGvtJyk96azFiclVJjLyADWRHUMogZR1r7VA9+Ri
 XLA=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip02.wdc.com with ESMTP; 24 Jun 2021 05:02:16 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 5/7] hw/char/ibex_uart: Make the register layout private
Date: Thu, 24 Jun 2021 05:02:09 -0700
Message-Id: <20210624120211.85499-6-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624120211.85499-1-alistair.francis@wdc.com>
References: <20210624120211.85499-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=802348aeb=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't need to expose the register layout in the public header, so
don't.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: c437f570b2b30ab4170387a3ba2fad7d116a4986.1624001156.git.alistair.francis@wdc.com
---
 include/hw/char/ibex_uart.h | 37 -------------------------------------
 hw/char/ibex_uart.c         | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/include/hw/char/ibex_uart.h b/include/hw/char/ibex_uart.h
index 546f958eb8..a39985516a 100644
--- a/include/hw/char/ibex_uart.h
+++ b/include/hw/char/ibex_uart.h
@@ -31,43 +31,6 @@
 #include "qemu/timer.h"
 #include "qom/object.h"
 
-REG32(INTR_STATE, 0x00)
-    FIELD(INTR_STATE, TX_WATERMARK, 0, 1)
-    FIELD(INTR_STATE, RX_WATERMARK, 1, 1)
-    FIELD(INTR_STATE, TX_EMPTY, 2, 1)
-    FIELD(INTR_STATE, RX_OVERFLOW, 3, 1)
-REG32(INTR_ENABLE, 0x04)
-REG32(INTR_TEST, 0x08)
-REG32(CTRL, 0x0C)
-    FIELD(CTRL, TX_ENABLE, 0, 1)
-    FIELD(CTRL, RX_ENABLE, 1, 1)
-    FIELD(CTRL, NF, 2, 1)
-    FIELD(CTRL, SLPBK, 4, 1)
-    FIELD(CTRL, LLPBK, 5, 1)
-    FIELD(CTRL, PARITY_EN, 6, 1)
-    FIELD(CTRL, PARITY_ODD, 7, 1)
-    FIELD(CTRL, RXBLVL, 8, 2)
-    FIELD(CTRL, NCO, 16, 16)
-REG32(STATUS, 0x10)
-    FIELD(STATUS, TXFULL, 0, 1)
-    FIELD(STATUS, RXFULL, 1, 1)
-    FIELD(STATUS, TXEMPTY, 2, 1)
-    FIELD(STATUS, RXIDLE, 4, 1)
-    FIELD(STATUS, RXEMPTY, 5, 1)
-REG32(RDATA, 0x14)
-REG32(WDATA, 0x18)
-REG32(FIFO_CTRL, 0x1c)
-    FIELD(FIFO_CTRL, RXRST, 0, 1)
-    FIELD(FIFO_CTRL, TXRST, 1, 1)
-    FIELD(FIFO_CTRL, RXILVL, 2, 3)
-    FIELD(FIFO_CTRL, TXILVL, 5, 2)
-REG32(FIFO_STATUS, 0x20)
-    FIELD(FIFO_STATUS, TXLVL, 0, 5)
-    FIELD(FIFO_STATUS, RXLVL, 16, 5)
-REG32(OVRD, 0x24)
-REG32(VAL, 0x28)
-REG32(TIMEOUT_CTRL, 0x2c)
-
 #define IBEX_UART_TX_FIFO_SIZE 16
 #define IBEX_UART_CLOCK 50000000 /* 50MHz clock */
 
diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
index 73b8f2e45b..fe4b6c3c9e 100644
--- a/hw/char/ibex_uart.c
+++ b/hw/char/ibex_uart.c
@@ -35,6 +35,43 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 
+REG32(INTR_STATE, 0x00)
+    FIELD(INTR_STATE, TX_WATERMARK, 0, 1)
+    FIELD(INTR_STATE, RX_WATERMARK, 1, 1)
+    FIELD(INTR_STATE, TX_EMPTY, 2, 1)
+    FIELD(INTR_STATE, RX_OVERFLOW, 3, 1)
+REG32(INTR_ENABLE, 0x04)
+REG32(INTR_TEST, 0x08)
+REG32(CTRL, 0x0C)
+    FIELD(CTRL, TX_ENABLE, 0, 1)
+    FIELD(CTRL, RX_ENABLE, 1, 1)
+    FIELD(CTRL, NF, 2, 1)
+    FIELD(CTRL, SLPBK, 4, 1)
+    FIELD(CTRL, LLPBK, 5, 1)
+    FIELD(CTRL, PARITY_EN, 6, 1)
+    FIELD(CTRL, PARITY_ODD, 7, 1)
+    FIELD(CTRL, RXBLVL, 8, 2)
+    FIELD(CTRL, NCO, 16, 16)
+REG32(STATUS, 0x10)
+    FIELD(STATUS, TXFULL, 0, 1)
+    FIELD(STATUS, RXFULL, 1, 1)
+    FIELD(STATUS, TXEMPTY, 2, 1)
+    FIELD(STATUS, RXIDLE, 4, 1)
+    FIELD(STATUS, RXEMPTY, 5, 1)
+REG32(RDATA, 0x14)
+REG32(WDATA, 0x18)
+REG32(FIFO_CTRL, 0x1c)
+    FIELD(FIFO_CTRL, RXRST, 0, 1)
+    FIELD(FIFO_CTRL, TXRST, 1, 1)
+    FIELD(FIFO_CTRL, RXILVL, 2, 3)
+    FIELD(FIFO_CTRL, TXILVL, 5, 2)
+REG32(FIFO_STATUS, 0x20)
+    FIELD(FIFO_STATUS, TXLVL, 0, 5)
+    FIELD(FIFO_STATUS, RXLVL, 16, 5)
+REG32(OVRD, 0x24)
+REG32(VAL, 0x28)
+REG32(TIMEOUT_CTRL, 0x2c)
+
 static void ibex_uart_update_irqs(IbexUartState *s)
 {
     if (s->uart_intr_state & s->uart_intr_enable & R_INTR_STATE_TX_WATERMARK_MASK) {
-- 
2.31.1


