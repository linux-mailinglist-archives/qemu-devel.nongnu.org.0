Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CDC1B929E
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Apr 2020 20:05:55 +0200 (CEST)
Received: from localhost ([::1]:40666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jSlf8-00016J-9o
	for lists+qemu-devel@lfdr.de; Sun, 26 Apr 2020 14:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33662)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair@alistair23.me>) id 1jSlcK-0007qw-Lm
 for qemu-devel@nongnu.org; Sun, 26 Apr 2020 14:03:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alistair@alistair23.me>) id 1jSlcJ-0007yz-4l
 for qemu-devel@nongnu.org; Sun, 26 Apr 2020 14:03:00 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:33581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1jSlcI-0007um-Lq; Sun, 26 Apr 2020 14:02:58 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id EBD5E5C00DE;
 Sun, 26 Apr 2020 14:02:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sun, 26 Apr 2020 14:02:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=n7/IkdRGcZXl2
 GFpSdQVnpk3LUVqmoSLt3a9GXGcPC4=; b=YzaL7JxEMkfXnaDQZr6/zeBWAITOs
 LBeYlnR9iZDI1htc8v6qipCYhboCErHld+NOa8jnd7m7JR7nVKqEcI8hSpHndjaH
 sI7B/2WJyyLyGAhEzEMP94W0147363bARxl2i2q9Kz5CwFehQwS8NmuCfIALSbnS
 3PQoTw7PLliuwK1jDBDyuQBLjIzo5oo1ycLWDMJWEPs9ok4XoiN8wTGOHrgPY8Oh
 I02bbwnRx3/qJ3BQPg9jDWetBbovbZ4j+Y8SDPSjlmdbQJqLIRKsCW0X5+Xk63Zl
 HIr+iffnWza21dUAmSCKxnslVKKU4KNrZ2tFIPYihFSnO1uY2my450rTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=n7/IkdRGcZXl2GFpSdQVnpk3LUVqmoSLt3a9GXGcPC4=; b=UL2SFxeu
 5RyWx4Oc0QRhNAg246ovwZ8qEj/gxYtpdsfrduhLoKKthycI1sPoc9HNiRIj6pkh
 LYfTbATM1Ar4fySwPv6Ax74F+SbcmAqfpSi90fkA2w9KDUSV39jkLCNdOm4z7Wz/
 S0x1Ovrg45Eo/5CKxdDze5C1Imtx+RTQ4lS0XW9kZy17ggaaYyQMjvqvjUrrWl11
 yq6SGL6CRefBa7UlqkMzQhbyL0+Bem2znCxIyBqtrDkJt4PsYp/9gC/umR6X1qac
 xFFLhXTmog15UttDC/OZEPLt1f84MOcrs5J2r823/pKm+eXGD5rNrJ0Vt7Aw1/V8
 WrbdHF3gzNmACQ==
X-ME-Sender: <xms:0cylXgVMs8pYHJDtqglTK7r5hhzQqRfa3I6sX_8yI39hNt6pcon-dw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrheejgdduvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
 ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucffohhmrghinhepohhpvghnthhithgrnh
 drohhrghenucfkphepjeefrdelfedrkeegrddvtdeknecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhishhtrghirh
 dvfedrmhgv
X-ME-Proxy: <xmx:0cylXhNk5ocaq_8ERvGg4uh7nbYNM6pVBGfKRcUHmj5FSOaplgajAQ>
 <xmx:0cylXoAIy-JPz7iv43sMOu4F70ti29GP4fNAJnokUfbe2xySyPIlmw>
 <xmx:0cylXlc1FQDIOR4oKi1CzQl-GlPGf0C82pcLGElghbZA5oOXWQgviw>
 <xmx:0cylXrADa3CMzrP0N2_svj1oTRiwGQ9h-5gBOx_frPcikBSPCH2kRw>
Received: from ThinkpadX1Yoga3.localdomain (c-73-93-84-208.hsd1.ca.comcast.net
 [73.93.84.208])
 by mail.messagingengine.com (Postfix) with ESMTPA id 25E863065E36;
 Sun, 26 Apr 2020 14:02:57 -0400 (EDT)
From: Alistair Francis <alistair@alistair23.me>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v1 5/9] hw/char: Initial commit of Ibex UART
Date: Sat, 25 Apr 2020 04:29:17 -0700
Message-Id: <c796ba76c4d92f824ce73647a2e5571f9fd542db.1587920572.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1587920572.git.alistair.francis@wdc.com>
References: <cover.1587920572.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=66.111.4.29; envelope-from=alistair@alistair23.me;
 helo=out5-smtp.messagingengine.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/26 14:02:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 66.111.4.29
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
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

This is the initial commit of the Ibex UART device. Serial TX is
working, while RX has been implemeneted but untested.

This is based on the documentation from:
https://docs.opentitan.org/hw/ip/uart/doc/

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 MAINTAINERS                 |   2 +
 hw/char/Makefile.objs       |   1 +
 hw/char/ibex_uart.c         | 487 ++++++++++++++++++++++++++++++++++++
 hw/riscv/Kconfig            |   4 +
 include/hw/char/ibex_uart.h | 110 ++++++++
 5 files changed, 604 insertions(+)
 create mode 100644 hw/char/ibex_uart.c
 create mode 100644 include/hw/char/ibex_uart.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 3cd9fc0898..f5b6766efd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1232,7 +1232,9 @@ M: Alistair Francis <Alistair.Francis@wdc.com>
 L: qemu-riscv@nongnu.org
 S: Supported
 F: hw/riscv/opentitan.c
+F: hw/char/ibex_uart.c
 F: include/hw/riscv/opentitan.h
+F: include/hw/char/ibex_uart.h
 
 
 SH4 Machines
diff --git a/hw/char/Makefile.objs b/hw/char/Makefile.objs
index 9e9a6c1aff..633996be5b 100644
--- a/hw/char/Makefile.objs
+++ b/hw/char/Makefile.objs
@@ -12,6 +12,7 @@ common-obj-$(CONFIG_VIRTIO_SERIAL) += virtio-console.o
 common-obj-$(CONFIG_XILINX) += xilinx_uartlite.o
 common-obj-$(CONFIG_XEN) += xen_console.o
 common-obj-$(CONFIG_CADENCE) += cadence_uart.o
+common-obj-$(CONFIG_IBEX) += ibex_uart.o
 
 common-obj-$(CONFIG_EXYNOS4) += exynos4210_uart.o
 common-obj-$(CONFIG_COLDFIRE) += mcf_uart.o
diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
new file mode 100644
index 0000000000..70a241d515
--- /dev/null
+++ b/hw/char/ibex_uart.c
@@ -0,0 +1,487 @@
+/*
+ * QEMU lowRISC Ibex UART device
+ *
+ * Copyright (c) 2020 Western Digital
+ *
+ * For details check the documentation here:
+ *    https://docs.opentitan.org/hw/ip/uart/doc/
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/char/ibex_uart.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+
+static void ibex_uart_update_irqs(IbexUartState *s)
+{
+    if (s->uart_intr_state & s->uart_intr_enable & INTR_STATE_TX_WATERMARK) {
+        qemu_set_irq(s->tx_watermark, 1);
+    } else {
+        qemu_set_irq(s->tx_watermark, 0);
+    }
+
+    if (s->uart_intr_state & s->uart_intr_enable & INTR_STATE_RX_WATERMARK) {
+        qemu_set_irq(s->rx_watermark, 1);
+    } else {
+        qemu_set_irq(s->rx_watermark, 0);
+    }
+
+    if (s->uart_intr_state & s->uart_intr_enable & INTR_STATE_TX_EMPTY) {
+        qemu_set_irq(s->tx_empty, 1);
+    } else {
+        qemu_set_irq(s->tx_empty, 0);
+    }
+
+    if (s->uart_intr_state & s->uart_intr_enable & INTR_STATE_RX_OVERFLOW) {
+        qemu_set_irq(s->rx_overflow, 1);
+    } else {
+        qemu_set_irq(s->rx_overflow, 0);
+    }
+}
+
+static int ibex_uart_can_receive(void *opaque)
+{
+    IbexUartState *s = opaque;
+
+    if (s->uart_ctrl & UART_CTRL_RX_ENABLE) {
+        return 1;
+    }
+
+    return 0;
+}
+
+static void ibex_uart_receive(void *opaque, const uint8_t *buf, int size)
+{
+    IbexUartState *s = opaque;
+    uint8_t rx_fifo_level = (s->uart_fifo_ctrl & FIFO_CTRL_RXILVL)
+                            >> FIFO_CTRL_RXILVL_SHIFT;
+
+    s->uart_rdata = *buf;
+
+    s->uart_status &= ~UART_STATUS_RXIDLE;
+    s->uart_status &= ~UART_STATUS_RXEMPTY;
+
+    if (size > rx_fifo_level) {
+        s->uart_intr_state |= INTR_STATE_RX_WATERMARK;
+    }
+
+    ibex_uart_update_irqs(s);
+}
+
+static gboolean ibex_uart_xmit(GIOChannel *chan, GIOCondition cond,
+                               void *opaque)
+{
+    IbexUartState *s = opaque;
+    uint8_t tx_fifo_level = (s->uart_fifo_ctrl & FIFO_CTRL_TXILVL)
+                            >> FIFO_CTRL_TXILVL_SHIFT;
+    int ret;
+
+    /* instant drain the fifo when there's no back-end */
+    if (!qemu_chr_fe_backend_connected(&s->chr)) {
+        s->tx_level = 0;
+        return FALSE;
+    }
+
+    if (!s->tx_level) {
+        s->uart_status &= UART_STATUS_TXFULL;
+        s->uart_status |= UART_STATUS_TXEMPTY;
+        s->uart_intr_state |= INTR_STATE_TX_EMPTY;
+        s->uart_intr_state &= ~INTR_STATE_TX_WATERMARK;
+        ibex_uart_update_irqs(s);
+        return FALSE;
+    }
+
+    ret = qemu_chr_fe_write(&s->chr, s->tx_fifo, s->tx_level);
+
+    if (ret >= 0) {
+        s->tx_level -= ret;
+        memmove(s->tx_fifo, s->tx_fifo + ret, s->tx_level);
+    }
+
+    if (s->tx_level) {
+        guint r = qemu_chr_fe_add_watch(&s->chr, G_IO_OUT | G_IO_HUP,
+                                        ibex_uart_xmit, s);
+        if (!r) {
+            s->tx_level = 0;
+            return FALSE;
+        }
+    }
+
+    /* Clear the TX Full bit */
+    if (s->tx_level != IBEX_UART_TX_FIFO_SIZE) {
+        s->uart_status &= ~UART_STATUS_TXFULL;
+    }
+
+    /* Disable the TX_WATERMARK IRQ */
+    if (s->tx_level < tx_fifo_level) {
+        s->uart_intr_state &= ~INTR_STATE_TX_WATERMARK;
+    }
+
+    /* Set TX empty */
+    if (s->tx_level == 0) {
+        s->uart_status |= UART_STATUS_TXEMPTY;
+        s->uart_intr_state |= INTR_STATE_TX_EMPTY;
+    }
+
+    ibex_uart_update_irqs(s);
+    return FALSE;
+}
+
+static void uart_write_tx_fifo(IbexUartState *s, const uint8_t *buf,
+                               int size)
+{
+    uint64_t current_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    uint8_t tx_fifo_level = (s->uart_fifo_ctrl & FIFO_CTRL_TXILVL)
+                            >> FIFO_CTRL_TXILVL_SHIFT;
+
+    if (size > IBEX_UART_TX_FIFO_SIZE - s->tx_level) {
+        size = IBEX_UART_TX_FIFO_SIZE - s->tx_level;
+        qemu_log_mask(LOG_GUEST_ERROR, "ibex_uart: TX FIFO overflow");
+    }
+
+    memcpy(s->tx_fifo + s->tx_level, buf, size);
+    s->tx_level += size;
+
+    if (s->tx_level > 0) {
+        s->uart_status &= ~UART_STATUS_TXEMPTY;
+    }
+
+    if (s->tx_level >= tx_fifo_level) {
+        s->uart_intr_state |= INTR_STATE_TX_WATERMARK;
+        ibex_uart_update_irqs(s);
+    }
+
+    if (s->tx_level == IBEX_UART_TX_FIFO_SIZE) {
+        s->uart_status |= UART_STATUS_TXFULL;
+    }
+
+    timer_mod(s->fifo_trigger_handle, current_time +
+              (s->char_tx_time * 4));
+}
+
+static void ibex_uart_reset(DeviceState *dev)
+{
+    IbexUartState *s = IBEX_UART(dev);
+
+    s->uart_intr_state = 0x00000000;
+    s->uart_intr_state = 0x00000000;
+    s->uart_intr_enable = 0x00000000;
+    s->uart_ctrl = 0x00000000;
+    s->uart_status = 0x0000003c;
+    s->uart_rdata = 0x00000000;
+    s->uart_fifo_ctrl = 0x00000000;
+    s->uart_fifo_status = 0x00000000;
+    s->uart_ovrd = 0x00000000;
+    s->uart_val = 0x00000000;
+    s->uart_timeout_ctrl = 0x00000000;
+
+    s->tx_level = 0;
+
+    s->char_tx_time = (NANOSECONDS_PER_SECOND / 230400) * 10;
+
+    ibex_uart_update_irqs(s);
+}
+
+static uint64_t ibex_uart_read(void *opaque, hwaddr addr,
+                                       unsigned int size)
+{
+    IbexUartState *s = opaque;
+    uint64_t retvalue = 0;
+
+    switch (addr) {
+    case IBEX_UART_INTR_STATE:
+        retvalue = s->uart_intr_state;
+        break;
+    case IBEX_UART_INTR_ENABLE:
+        retvalue = s->uart_intr_enable;
+        break;
+    case IBEX_UART_INTR_TEST:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: wdata is write only\n", __func__);
+        break;
+
+    case IBEX_UART_CTRL:
+        retvalue = s->uart_ctrl;
+        break;
+    case IBEX_UART_STATUS:
+        retvalue = s->uart_status;
+        break;
+
+    case IBEX_UART_RDATA:
+        retvalue = s->uart_rdata;
+        if (s->uart_ctrl & UART_CTRL_RX_ENABLE) {
+            qemu_chr_fe_accept_input(&s->chr);
+        }
+        break;
+    case IBEX_UART_WDATA:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: wdata is write only\n", __func__);
+        break;
+
+    case IBEX_UART_FIFO_CTRL:
+        retvalue = s->uart_fifo_ctrl;
+        break;
+    case IBEX_UART_FIFO_STATUS:
+        retvalue = s->uart_fifo_status;
+
+        retvalue |= s->tx_level & 0x1F;
+
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: RX fifos are not supported\n", __func__);
+        break;
+
+    case IBEX_UART_OVRD:
+        retvalue = s->uart_ovrd;
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: ovrd is not supported\n", __func__);
+        break;
+    case IBEX_UART_VAL:
+        retvalue = s->uart_val;
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: val is not supported\n", __func__);
+        break;
+    case IBEX_UART_TIMEOUT_CTRL:
+        retvalue = s->uart_timeout_ctrl;
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: timeout_ctrl is not supported\n", __func__);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr);
+        return 0;
+    }
+
+    return retvalue;
+}
+
+static void ibex_uart_write(void *opaque, hwaddr addr,
+                                  uint64_t val64, unsigned int size)
+{
+    IbexUartState *s = opaque;
+    uint32_t value = val64;
+
+    switch (addr) {
+    case IBEX_UART_INTR_STATE:
+        /* Write 1 clear */
+        s->uart_intr_state &= ~value;
+        ibex_uart_update_irqs(s);
+        break;
+    case IBEX_UART_INTR_ENABLE:
+        s->uart_intr_enable = value;
+        ibex_uart_update_irqs(s);
+        break;
+    case IBEX_UART_INTR_TEST:
+        s->uart_intr_state |= value;
+        ibex_uart_update_irqs(s);
+        break;
+
+    case IBEX_UART_CTRL:
+        s->uart_ctrl = value;
+
+        if (value & UART_CTRL_NF) {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: UART_CTRL_NF is not supported\n", __func__);
+        }
+        if (value & UART_CTRL_SLPBK) {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: UART_CTRL_SLPBK is not supported\n", __func__);
+        }
+        if (value & UART_CTRL_LLPBK) {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: UART_CTRL_LLPBK is not supported\n", __func__);
+        }
+        if (value & UART_CTRL_PARITY_EN) {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: UART_CTRL_PARITY_EN is not supported\n",
+                          __func__);
+        }
+        if (value & UART_CTRL_PARITY_ODD) {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: UART_CTRL_PARITY_ODD is not supported\n",
+                          __func__);
+        }
+        if (value & UART_CTRL_RXBLVL) {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: UART_CTRL_RXBLVL is not supported\n", __func__);
+        }
+        if (value & UART_CTRL_NCO) {
+            uint64_t baud = ((value & UART_CTRL_NCO) >> 16);
+            baud *= 1000;
+            baud /= 2 ^ 20;
+
+            s->char_tx_time = (NANOSECONDS_PER_SECOND / baud) * 10;
+        }
+        break;
+    case IBEX_UART_STATUS:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: status is read only\n", __func__);
+        break;
+
+    case IBEX_UART_RDATA:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: rdata is read only\n", __func__);
+        break;
+    case IBEX_UART_WDATA:
+        uart_write_tx_fifo(s, (uint8_t *) &value, 1);
+        break;
+
+    case IBEX_UART_FIFO_CTRL:
+        s->uart_fifo_ctrl = value;
+
+        if (value & FIFO_CTRL_RXRST) {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: RX fifos are not supported\n", __func__);
+        }
+        if (value & FIFO_CTRL_TXRST) {
+            s->tx_level = 0;
+        }
+        break;
+    case IBEX_UART_FIFO_STATUS:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: fifo_status is read only\n", __func__);
+        break;
+
+    case IBEX_UART_OVRD:
+        s->uart_ovrd = value;
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: ovrd is not supported\n", __func__);
+        break;
+    case IBEX_UART_VAL:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: val is read only\n", __func__);
+        break;
+    case IBEX_UART_TIMEOUT_CTRL:
+        s->uart_timeout_ctrl = value;
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: timeout_ctrl is not supported\n", __func__);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr);
+    }
+}
+
+static void fifo_trigger_update(void *opaque)
+{
+    IbexUartState *s = opaque;
+
+    if (s->uart_ctrl & UART_CTRL_TX_ENABLE) {
+        ibex_uart_xmit(NULL, G_IO_OUT, s);
+    }
+}
+
+static const MemoryRegionOps ibex_uart_ops = {
+    .read = ibex_uart_read,
+    .write = ibex_uart_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static int cadence_uart_post_load(void *opaque, int version_id)
+{
+    IbexUartState *s = opaque;
+
+    ibex_uart_update_irqs(s);
+    return 0;
+}
+
+static const VMStateDescription vmstate_ibex_uart = {
+    .name = TYPE_IBEX_UART,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .post_load = cadence_uart_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8_ARRAY(tx_fifo, IbexUartState,
+                            IBEX_UART_TX_FIFO_SIZE),
+        VMSTATE_UINT32(tx_level, IbexUartState),
+        VMSTATE_UINT64(char_tx_time, IbexUartState),
+        VMSTATE_TIMER_PTR(fifo_trigger_handle, IbexUartState),
+        VMSTATE_UINT32(uart_intr_state, IbexUartState),
+        VMSTATE_UINT32(uart_intr_enable, IbexUartState),
+        VMSTATE_UINT32(uart_ctrl, IbexUartState),
+        VMSTATE_UINT32(uart_status, IbexUartState),
+        VMSTATE_UINT32(uart_rdata, IbexUartState),
+        VMSTATE_UINT32(uart_fifo_ctrl, IbexUartState),
+        VMSTATE_UINT32(uart_fifo_status, IbexUartState),
+        VMSTATE_UINT32(uart_ovrd, IbexUartState),
+        VMSTATE_UINT32(uart_val, IbexUartState),
+        VMSTATE_UINT32(uart_timeout_ctrl, IbexUartState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property ibex_uart_properties[] = {
+    DEFINE_PROP_CHR("chardev", IbexUartState, chr),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ibex_uart_init(Object *obj)
+{
+    IbexUartState *s = IBEX_UART(obj);
+
+    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->tx_watermark);
+    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->rx_watermark);
+    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->tx_empty);
+    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->rx_overflow);
+
+    memory_region_init_io(&s->mmio, obj, &ibex_uart_ops, s,
+                          TYPE_IBEX_UART, 0x400);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+}
+
+static void ibex_uart_realize(DeviceState *dev, Error **errp)
+{
+    IbexUartState *s = IBEX_UART(dev);
+
+    s->fifo_trigger_handle = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                          fifo_trigger_update, s);
+
+    qemu_chr_fe_set_handlers(&s->chr, ibex_uart_can_receive,
+                             ibex_uart_receive, NULL, NULL,
+                             s, NULL, true);
+}
+
+static void ibex_uart_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = ibex_uart_reset;
+    dc->realize = ibex_uart_realize;
+    dc->vmsd = &vmstate_ibex_uart;
+    device_class_set_props(dc, ibex_uart_properties);
+}
+
+static const TypeInfo ibex_uart_info = {
+    .name          = TYPE_IBEX_UART,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(IbexUartState),
+    .instance_init = ibex_uart_init,
+    .class_init    = ibex_uart_class_init,
+};
+
+static void ibex_uart_register_types(void)
+{
+    type_register_static(&ibex_uart_info);
+}
+
+type_init(ibex_uart_register_types)
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 94d19571f7..28947ef3e0 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -4,6 +4,9 @@ config HTIF
 config HART
     bool
 
+config IBEX
+    bool
+
 config SIFIVE
     bool
     select MSI_NONBROKEN
@@ -29,6 +32,7 @@ config SPIKE
 
 config OPENTITAN
     bool
+    select IBEX
     select HART
     select UNIMP
 
diff --git a/include/hw/char/ibex_uart.h b/include/hw/char/ibex_uart.h
new file mode 100644
index 0000000000..2bec772615
--- /dev/null
+++ b/include/hw/char/ibex_uart.h
@@ -0,0 +1,110 @@
+/*
+ * QEMU lowRISC Ibex UART device
+ *
+ * Copyright (c) 2020 Western Digital
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef HW_IBEX_UART_H
+#define HW_IBEX_UART_H
+
+#include "hw/sysbus.h"
+#include "chardev/char-fe.h"
+#include "qemu/timer.h"
+
+#define IBEX_UART_INTR_STATE   0x00
+    #define INTR_STATE_TX_WATERMARK (1 << 0)
+    #define INTR_STATE_RX_WATERMARK (1 << 1)
+    #define INTR_STATE_TX_EMPTY     (1 << 2)
+    #define INTR_STATE_RX_OVERFLOW  (1 << 3)
+#define IBEX_UART_INTR_ENABLE  0x04
+#define IBEX_UART_INTR_TEST    0x08
+
+#define IBEX_UART_CTRL         0x0c
+    #define UART_CTRL_TX_ENABLE     (1 << 0)
+    #define UART_CTRL_RX_ENABLE     (1 << 1)
+    #define UART_CTRL_NF            (1 << 2)
+    #define UART_CTRL_SLPBK         (1 << 4)
+    #define UART_CTRL_LLPBK         (1 << 5)
+    #define UART_CTRL_PARITY_EN     (1 << 6)
+    #define UART_CTRL_PARITY_ODD    (1 << 7)
+    #define UART_CTRL_RXBLVL        (3 << 8)
+    #define UART_CTRL_NCO           (0xFFFF << 16)
+
+#define IBEX_UART_STATUS       0x10
+    #define UART_STATUS_TXFULL  (1 << 0)
+    #define UART_STATUS_RXFULL  (1 << 1)
+    #define UART_STATUS_TXEMPTY (1 << 2)
+    #define UART_STATUS_RXIDLE  (1 << 4)
+    #define UART_STATUS_RXEMPTY (1 << 5)
+
+#define IBEX_UART_RDATA        0x14
+#define IBEX_UART_WDATA        0x18
+
+#define IBEX_UART_FIFO_CTRL    0x1c
+    #define FIFO_CTRL_RXRST          (1 << 0)
+    #define FIFO_CTRL_TXRST          (1 << 1)
+    #define FIFO_CTRL_RXILVL         (7 << 2)
+    #define FIFO_CTRL_RXILVL_SHIFT   (2)
+    #define FIFO_CTRL_TXILVL         (3 << 5)
+    #define FIFO_CTRL_TXILVL_SHIFT   (5)
+
+#define IBEX_UART_FIFO_STATUS  0x20
+#define IBEX_UART_OVRD         0x24
+#define IBEX_UART_VAL          0x28
+#define IBEX_UART_TIMEOUT_CTRL 0x2c
+
+#define IBEX_UART_TX_FIFO_SIZE 16
+
+#define TYPE_IBEX_UART "ibex-uart"
+#define IBEX_UART(obj) \
+    OBJECT_CHECK(IbexUartState, (obj), TYPE_IBEX_UART)
+
+typedef struct {
+    /* <private> */
+    SysBusDevice parent_obj;
+
+    /* <public> */
+    MemoryRegion mmio;
+
+    uint8_t tx_fifo[IBEX_UART_TX_FIFO_SIZE];
+    uint32_t tx_level;
+
+    QEMUTimer *fifo_trigger_handle;
+    uint64_t char_tx_time;
+
+    uint32_t uart_intr_state;
+    uint32_t uart_intr_enable;
+    uint32_t uart_ctrl;
+    uint32_t uart_status;
+    uint32_t uart_rdata;
+    uint32_t uart_fifo_ctrl;
+    uint32_t uart_fifo_status;
+    uint32_t uart_ovrd;
+    uint32_t uart_val;
+    uint32_t uart_timeout_ctrl;
+
+    CharBackend chr;
+    qemu_irq tx_watermark;
+    qemu_irq rx_watermark;
+    qemu_irq tx_empty;
+    qemu_irq rx_overflow;
+} IbexUartState;
+#endif /* HW_IBEX_UART_H */
-- 
2.26.2


