Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B281E332B37
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:57:22 +0100 (CET)
Received: from localhost ([::1]:60016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJejZ-0007s1-Nk
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:57:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.wagner@ulal.de>)
 id 1lJeBw-0000os-6d
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:22:36 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.220]:10032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.wagner@ulal.de>)
 id 1lJeBt-0004zC-Vm
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:22:35 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1615303343; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=ZX7vBtvORktP+qeuy9nL8/Wnr8kduWg62tULnrxZGL9QUGd5UAdpN/vg3/f0b8GSYl
 2r0l93YHrHrv7IweYRpWTYdIsciMbW3A04aGLErTHYvruf0cKqxyAZCF7DXEXFRQmgRN
 3cWBrdH4WlwQPAn4Wdh1uILO76xxXBLJTew+/14Hbjju4ZAKRqM65D8ppKRKuueRZ9hZ
 w3+4ccqDF0ulmlYhZaoUwrRx+FUdQu4ZqXuvx2VUmuj3HkXcXma/3YgvgSUOfmc5wZ+i
 ao1/vITNFPeDYCz9SAkn7JSYQeQU4B/IA9KPlkLrJNj/wLu+iX06xGRDIr+WlL8Pf03i
 /r9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1615303343;
 s=strato-dkim-0002; d=strato.com;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=vxak6Gsq+lkPt5Ig4Yxohv5c4XhfssiY9iZ889FXKhQ=;
 b=HFTMcBDKUNGorlm51j9a5G0qeLnyjae3Qyw+knjbbWexVJCYec5KsuqHVd2pPXhMwG
 9gyedxebGMHH1pdgsuqTBDs+uveVVsK4GreNOBnYM3aIPct7mnotYtHL4jKn6sgYfmwA
 ouK3D6ZP4yKdkN1dnkEe0R4T3c7sKKbQF1UiFF1vTH7HKPvB89Zpy7IHolk+ZsRWPZs9
 foriibyfpPd9w3FmeE3Sj8As/ipRGMIzWP4PKjuOt0LAqSQtYYYFklBxBkDuAgyH7pPb
 DuVgJ7rUF0yzk44M/ARAEhIVuaTFQ4o47alzz/7jLovXr2OGASiod54BVSBMQy4YharP
 GSXQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1615303343;
 s=strato-dkim-0002; d=ulal.de;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=vxak6Gsq+lkPt5Ig4Yxohv5c4XhfssiY9iZ889FXKhQ=;
 b=hqIT7SlH6EJV6mUKWIYX4oARJ4xCW695HDsDQOUEjZFHG5EjFWo1/wirJfDIuFo4mO
 lFfKeflZbMgsaMV8q7ziF076JKWCDFClyTeRxtkALE+L6H7Amjp0NA7eYS9DpXwjFp+7
 47PBoi5k+FIi77D7MaPZvA5pZVJ34LOn2mRz92VnbmubQE1pA4CI+cYhqVvGqydrj6dq
 3nJ32Le6X3q28+Hn/iKp/BMo/ubGAaYOHP/dceG9eSikhaM47UWhCKmsZ5mQB6I9xef6
 px8xfJHrBvSCsc7+V5dE/qN1czZc6okVLhxq62kIwRkk4NlHLgI4EM3C61AuJsjwQrmr
 QYSg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":LWABbUGmf/p3d3fx281mbpk9zOkHG9L8L9MnY9md4b2JTjr0xj1uUQtYCbJnQW9aY+KkeQGMenXp0qUAdrQH120clOmDF/WGxJ0nW9BfcQmjrQti"
X-RZG-CLASS-ID: mo00
Received: from alwagner-T470s.fritz.box by smtp.strato.de (RZmta 47.20.3 AUTH)
 with ESMTPSA id c075a1x29FMMHjg
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 9 Mar 2021 16:22:22 +0100 (CET)
From: Alexander Wagner <alexander.wagner@ulal.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/char: disable ibex uart receive if the buffer is full
Date: Tue,  9 Mar 2021 16:21:30 +0100
Message-Id: <20210309152130.13038-1-alexander.wagner@ulal.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=81.169.146.220;
 envelope-from=alexander.wagner@ulal.de; helo=mo4-p00-ob.smtp.rzone.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, Alistair.Francis@wdc.com,
 Alexander Wagner <alexander.wagner@ulal.de>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not disabling the UART leads to QEMU overwriting the UART receive buffer with
the newest received byte. The rx_level variable is added to allow the use of
the existing OpenTitan driver libraries.

Signed-off-by: Alexander Wagner <alexander.wagner@ulal.de>
---
 hw/char/ibex_uart.c         | 23 ++++++++++++++++++-----
 include/hw/char/ibex_uart.h |  4 ++++
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
index 89f1182c9b..bc3e2482bc 100644
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
 
-- 
2.25.1


