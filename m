Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E31634554F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 03:08:42 +0100 (CET)
Received: from localhost ([::1]:56012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOWTJ-0003Uk-9I
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 22:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKW-0002FM-Fd
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:59:36 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:2072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKT-0006vy-0f
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:59:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616464773; x=1648000773;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6wsHhJwVSWA7s3cp00lrXQHs9DoK8QKhbrZwSkAGJQM=;
 b=i9PBKhSP6WIGC3Tldza7RfjUNfpoHNSCRky50iXOzlD2vH8GDU0SnuJq
 hdnbuOV3RG9ryAQr4VeIaLq7kvsl5I5wOFDfptmFfJ4dPCP9pFsUAtM1G
 Xjikn59QcRfEWcSd0HU0SOXKRS9Dhftf+lo4dwM9U0o5tpt3wTr+olNf2
 PZRjBoTgsVetGe6vXXWe+4XcYZ/vQ/hthQTB3N4ERvmKNH7HsXSqAv6OU
 S4Ys1B7VpmWyoOPLawr4Zc0hqmdqvGBsSkZSh6T9NeHAuzdI+Y+STGWdg
 W31z0p0OGoc9WlEmagFxnf0qOOaO6SKjUVQo32CmW2itvfRN+1MQQ51Ck w==;
IronPort-SDR: Hv7rPF8yMB1jAJyVa2HNLCFww+CFmp76ktmb21B9vc23kLFNbxSdHvzn32lx35o9cjEVBAxnTf
 acoOsfivf6K9FoddR8Z+n7eSJAGXuaGin/h6c4jAC8Y3v+i8iNa6u47Rh0o5icoStfZ5yG10B4
 hM05r2JH+0KYfiaPtj4nuMZXQcHOA4qdu+mdeQg625OqzugpEhTTjA9hXekOB/tWt/oCJo8zjq
 2IV3sdjiVcHfqOTg8bQ785ghsHX9CgT+ndIF61b2CuP6UJkvNoM1LFUwMFkBczn/IE8pPs/jxA
 K+Y=
X-IronPort-AV: E=Sophos;i="5.81,270,1610380800"; d="scan'208";a="162707625"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2021 09:59:29 +0800
IronPort-SDR: qC2+KbuK4h7TS3pgsbPOhJUFXhSxkxemZ1r62J49EjgiKyNuf4z7nsYXVdHLrcb12Bp6kOUH58
 Xk6wpqH+onWL5027a4vTIbot8fIPvoV4ajszKyfXo17P4W3di/Ypc55c1PFoR6rsemvyNPIxlt
 yah1ukrHfKSYFDXCXAogZnPr4sSflKr6n2r8E/pS2OoJhJiF6/0kxcCr0ihUPdpwvH2WRoqVSI
 TOdn35iXeyHOey/TUDQi7ZZO1FFTxD/FeZs+ErNBzQelHWd6nPdqjsmgf6t4pGqJY1E6Z59G/c
 1jPIHgRlxtsAYWCUCtT8A1dD
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 18:41:37 -0700
IronPort-SDR: 2AAckqq9A6wnUnP++n1kbHVNYdoqRDG1H6ZLP8mfCfcp7OvPt+KGLTQ0MQ6hh6JUGhKkqQfH+f
 Dhx0A95MinDXjSN3HIbnhKlQib6EzoSQ8I7UhEOO3SWe4lBoF/ixbY9ZpjEhFpkzLNiCcm2Tep
 /+NXPIiJia8sspD4Dd+UsyDYunLcUiqwdY7yS3S6ri+MbIOYDscTtZRMJdavtPEO4n0U6TiPxs
 4Cv+X7e4eqYox4HnmQdSOOBVmfhAbfdAGXzg9JaYOF0sf5Ye+ADr3yy1q4TeB9+Zz3ShzU2I0A
 0Uc=
WDCIronportException: Internal
Received: from cn6ntbqq2.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.49.5])
 by uls-op-cesaip01.wdc.com with ESMTP; 22 Mar 2021 18:59:29 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 02/16] hw/char: disable ibex uart receive if the buffer is full
Date: Mon, 22 Mar 2021 21:57:42 -0400
Message-Id: <20210323015756.3168650-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323015756.3168650-1-alistair.francis@wdc.com>
References: <20210323015756.3168650-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=709ee912d=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
 qemu-devel@nongnu.org, Alexander Wagner <alexander.wagner@ulal.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Wagner <alexander.wagner@ulal.de>

Not disabling the UART leads to QEMU overwriting the UART receive buffer with
the newest received byte. The rx_level variable is added to allow the use of
the existing OpenTitan driver libraries.

Signed-off-by: Alexander Wagner <alexander.wagner@ulal.de>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210309152130.13038-1-alexander.wagner@ulal.de
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/char/ibex_uart.h |  4 ++++
 hw/char/ibex_uart.c         | 23 ++++++++++++++++++-----
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/include/hw/char/ibex_uart.h b/include/hw/char/ibex_uart.h
index 03d19e3f6f..546f958eb8 100644
--- a/include/hw/char/ibex_uart.h
+++ b/include/hw/char/ibex_uart.h
@@ -62,6 +62,8 @@ REG32(FIFO_CTRL, 0x1c)
     FIELD(FIFO_CTRL, RXILVL, 2, 3)
     FIELD(FIFO_CTRL, TXILVL, 5, 2)
 REG32(FIFO_STATUS, 0x20)
+    FIELD(FIFO_STATUS, TXLVL, 0, 5)
+    FIELD(FIFO_STATUS, RXLVL, 16, 5)
 REG32(OVRD, 0x24)
 REG32(VAL, 0x28)
 REG32(TIMEOUT_CTRL, 0x2c)
@@ -82,6 +84,8 @@ struct IbexUartState {
     uint8_t tx_fifo[IBEX_UART_TX_FIFO_SIZE];
     uint32_t tx_level;
 
+    uint32_t rx_level;
+
     QEMUTimer *fifo_trigger_handle;
     uint64_t char_tx_time;
 
diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
index edcaa30ade..73b8f2e45b 100644
--- a/hw/char/ibex_uart.c
+++ b/hw/char/ibex_uart.c
@@ -66,7 +66,8 @@ static int ibex_uart_can_receive(void *opaque)
 {
     IbexUartState *s = opaque;
 
-    if (s->uart_ctrl & R_CTRL_RX_ENABLE_MASK) {
+    if ((s->uart_ctrl & R_CTRL_RX_ENABLE_MASK)
+           && !(s->uart_status & R_STATUS_RXFULL_MASK)) {
         return 1;
     }
 
@@ -83,6 +84,11 @@ static void ibex_uart_receive(void *opaque, const uint8_t *buf, int size)
 
     s->uart_status &= ~R_STATUS_RXIDLE_MASK;
     s->uart_status &= ~R_STATUS_RXEMPTY_MASK;
+    /* The RXFULL is set after receiving a single byte
+     * as the FIFO buffers are not yet implemented.
+     */
+    s->uart_status |= R_STATUS_RXFULL_MASK;
+    s->rx_level += 1;
 
     if (size > rx_fifo_level) {
         s->uart_intr_state |= R_INTR_STATE_RX_WATERMARK_MASK;
@@ -199,6 +205,7 @@ static void ibex_uart_reset(DeviceState *dev)
     s->uart_timeout_ctrl = 0x00000000;
 
     s->tx_level = 0;
+    s->rx_level = 0;
 
     s->char_tx_time = (NANOSECONDS_PER_SECOND / 230400) * 10;
 
@@ -243,11 +250,15 @@ static uint64_t ibex_uart_read(void *opaque, hwaddr addr,
 
     case R_RDATA:
         retvalue = s->uart_rdata;
-        if (s->uart_ctrl & R_CTRL_RX_ENABLE_MASK) {
+        if ((s->uart_ctrl & R_CTRL_RX_ENABLE_MASK) && (s->rx_level > 0)) {
             qemu_chr_fe_accept_input(&s->chr);
 
-            s->uart_status |= R_STATUS_RXIDLE_MASK;
-            s->uart_status |= R_STATUS_RXEMPTY_MASK;
+            s->rx_level -= 1;
+            s->uart_status &= ~R_STATUS_RXFULL_MASK;
+            if (s->rx_level == 0) {
+                s->uart_status |= R_STATUS_RXIDLE_MASK;
+                s->uart_status |= R_STATUS_RXEMPTY_MASK;
+            }
         }
         break;
     case R_WDATA:
@@ -261,7 +272,8 @@ static uint64_t ibex_uart_read(void *opaque, hwaddr addr,
     case R_FIFO_STATUS:
         retvalue = s->uart_fifo_status;
 
-        retvalue |= s->tx_level & 0x1F;
+        retvalue |= (s->rx_level & 0x1F) << R_FIFO_STATUS_RXLVL_SHIFT;
+        retvalue |= (s->tx_level & 0x1F) << R_FIFO_STATUS_TXLVL_SHIFT;
 
         qemu_log_mask(LOG_UNIMP,
                       "%s: RX fifos are not supported\n", __func__);
@@ -364,6 +376,7 @@ static void ibex_uart_write(void *opaque, hwaddr addr,
         s->uart_fifo_ctrl = value;
 
         if (value & R_FIFO_CTRL_RXRST_MASK) {
+            s->rx_level = 0;
             qemu_log_mask(LOG_UNIMP,
                           "%s: RX fifos are not supported\n", __func__);
         }
-- 
2.30.1


