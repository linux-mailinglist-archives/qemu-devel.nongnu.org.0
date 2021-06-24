Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518A03B2E93
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 14:06:42 +0200 (CEST)
Received: from localhost ([::1]:44594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwO80-0003tS-Ui
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 08:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=802348aeb=alistair.francis@wdc.com>)
 id 1lwO3y-0003f2-U2
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:02:31 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:53591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=802348aeb=alistair.francis@wdc.com>)
 id 1lwO3w-0003oZ-FK
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:02:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1624536148; x=1656072148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8K8GtISv5QuI3fx9PL6mn3y9ZOkm6y/jwxGKQP8i/Ks=;
 b=GRWNOpVrzo/oUUvjbD7Uz7gUAOBIpsKQeWCQMK7L9otk56TnczlRrqn1
 TJhYknK14UhRdRWCbNWHLt0pwE2qIDZY4tc2TbsGcqPZNP5K74SP+GyUk
 XfXV50LLFT453glbznEIt8+9lkYByYtKgqfaKEF+Cn++Otn647PSPTidi
 tMGj3CgpsYNOasjczNEvNX/DoZs5rixEJtfMS04si7m8dk1Fjf9pzkHG+
 PdUd0AjT6yZhSa+6rcFC8+EmS2GMnRzZGgckoifwIM2h62LgtFkwSpWfo
 r/cOd5KFGreZkZTf7nJhRI5lNeVe0Kw0cwS8AMSkNEHrpfu63WS22vZp0 A==;
IronPort-SDR: V7GGmRP3oFD6nkDLRYH99bzs0iK0wHQlp081TYMXFiYepFirly3ncuv9QwpT1E7b16avO17qAw
 EU8/aUuHk5g0DteF+9v2HJ2bNJFFJWtI3wgZIDtiugTyIM7mr4Fm3xfs0fhhQlVoLelEBlQ1Px
 RDP8lr5k1mTsI1or8R+UkOzYs1DHiSEd7u9q7f7ITKlFBdPjTO17fsJFEDTKhSgZSukVVloqGe
 w30f6Dy2Zl3PxATamvRa7Vti3+Nve41nKaXwbYaNZimKBvtXjCW42jTyQNhx/x77F0H0HC1Lh3
 29U=
X-IronPort-AV: E=Sophos;i="5.83,296,1616428800"; d="scan'208";a="173360801"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jun 2021 20:02:15 +0800
IronPort-SDR: Jb4BhOvFNLGTgbN0z1XzkDVerVhQhVGVkFG2W3bRzz0OenNS7nY0TPOUdpt1v3NI/TEeJTL+Gw
 3ReM0z3w6X+mc4Bo3Ku5ivFwNQ5+rNJFYf30PTN2rGz0d55FPMVtNy/MtDIL3Kze+wV/cw2XHV
 PR8rO8nEvVgXuAWAiiVNIlE4iVAPgOR+Ac+sAoFTbXxcJV5KfrohKVYT5obu6j8U4dZHiIi2QQ
 Knh2hefOVcKzIs6AzoTEM74oKrRxIZQd5ZidgPOpD3Yft3dYPCTU0HMsmX/oc3MSRE2ITOcxt4
 ZSPzqTbUiQqyWoia1aqGJh3F
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 04:39:31 -0700
IronPort-SDR: RTvru4PtCZ0G7zN/yNbJViUdsJOXiPjVTUKOUSNX7E4PEbkjydyCd5dDLcW8TZSCleVw7PUmsP
 YWQJ2q7pGh9dDgeUUKzkgX87iygqA+owekXOUlp5G/sUwEanPt3hHdvL8Zxy2G2O5QF2msoPUk
 dKinStAaQzlnDgbR/aDYB5ZihK973FXUxn/OTN8KLO0DBszHHBkCC0GXHXnWl4e5UYnDVQWk75
 jSi9ikmjDjlvXH+yT/C3vlOrR5HZCKItUcGkeX660cAzkYnzCokqY2R8OlMY1DtPjoRh1df6/Y
 q54=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip02.wdc.com with ESMTP; 24 Jun 2021 05:02:16 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 3/7] hw/char: Consistent function names for sifive_uart
Date: Thu, 24 Jun 2021 05:02:07 -0700
Message-Id: <20210624120211.85499-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624120211.85499-1-alistair.francis@wdc.com>
References: <20210624120211.85499-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=802348aeb=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.juenger@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Jünger <lukas.juenger@greensocs.com>

This cleans up function names in the SiFive UART model.

Signed-off-by: Lukas Jünger <lukas.juenger@greensocs.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20210616092326.59639-2-lukas.juenger@greensocs.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/char/sifive_uart.c | 46 ++++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
index fe12666789..5df8212961 100644
--- a/hw/char/sifive_uart.c
+++ b/hw/char/sifive_uart.c
@@ -31,7 +31,7 @@
  */
 
 /* Returns the state of the IP (interrupt pending) register */
-static uint64_t uart_ip(SiFiveUARTState *s)
+static uint64_t sifive_uart_ip(SiFiveUARTState *s)
 {
     uint64_t ret = 0;
 
@@ -48,7 +48,7 @@ static uint64_t uart_ip(SiFiveUARTState *s)
     return ret;
 }
 
-static void update_irq(SiFiveUARTState *s)
+static void sifive_uart_update_irq(SiFiveUARTState *s)
 {
     int cond = 0;
     if ((s->ie & SIFIVE_UART_IE_TXWM) ||
@@ -63,7 +63,7 @@ static void update_irq(SiFiveUARTState *s)
 }
 
 static uint64_t
-uart_read(void *opaque, hwaddr addr, unsigned int size)
+sifive_uart_read(void *opaque, hwaddr addr, unsigned int size)
 {
     SiFiveUARTState *s = opaque;
     unsigned char r;
@@ -74,7 +74,7 @@ uart_read(void *opaque, hwaddr addr, unsigned int size)
             memmove(s->rx_fifo, s->rx_fifo + 1, s->rx_fifo_len - 1);
             s->rx_fifo_len--;
             qemu_chr_fe_accept_input(&s->chr);
-            update_irq(s);
+            sifive_uart_update_irq(s);
             return r;
         }
         return 0x80000000;
@@ -84,7 +84,7 @@ uart_read(void *opaque, hwaddr addr, unsigned int size)
     case SIFIVE_UART_IE:
         return s->ie;
     case SIFIVE_UART_IP:
-        return uart_ip(s);
+        return sifive_uart_ip(s);
     case SIFIVE_UART_TXCTRL:
         return s->txctrl;
     case SIFIVE_UART_RXCTRL:
@@ -99,8 +99,8 @@ uart_read(void *opaque, hwaddr addr, unsigned int size)
 }
 
 static void
-uart_write(void *opaque, hwaddr addr,
-           uint64_t val64, unsigned int size)
+sifive_uart_write(void *opaque, hwaddr addr,
+                  uint64_t val64, unsigned int size)
 {
     SiFiveUARTState *s = opaque;
     uint32_t value = val64;
@@ -109,11 +109,11 @@ uart_write(void *opaque, hwaddr addr,
     switch (addr) {
     case SIFIVE_UART_TXFIFO:
         qemu_chr_fe_write(&s->chr, &ch, 1);
-        update_irq(s);
+        sifive_uart_update_irq(s);
         return;
     case SIFIVE_UART_IE:
         s->ie = val64;
-        update_irq(s);
+        sifive_uart_update_irq(s);
         return;
     case SIFIVE_UART_TXCTRL:
         s->txctrl = val64;
@@ -129,9 +129,9 @@ uart_write(void *opaque, hwaddr addr,
                   __func__, (int)addr, (int)value);
 }
 
-static const MemoryRegionOps uart_ops = {
-    .read = uart_read,
-    .write = uart_write,
+static const MemoryRegionOps sifive_uart_ops = {
+    .read = sifive_uart_read,
+    .write = sifive_uart_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
     .valid = {
         .min_access_size = 4,
@@ -139,7 +139,7 @@ static const MemoryRegionOps uart_ops = {
     }
 };
 
-static void uart_rx(void *opaque, const uint8_t *buf, int size)
+static void sifive_uart_rx(void *opaque, const uint8_t *buf, int size)
 {
     SiFiveUARTState *s = opaque;
 
@@ -150,26 +150,27 @@ static void uart_rx(void *opaque, const uint8_t *buf, int size)
     }
     s->rx_fifo[s->rx_fifo_len++] = *buf;
 
-    update_irq(s);
+    sifive_uart_update_irq(s);
 }
 
-static int uart_can_rx(void *opaque)
+static int sifive_uart_can_rx(void *opaque)
 {
     SiFiveUARTState *s = opaque;
 
     return s->rx_fifo_len < sizeof(s->rx_fifo);
 }
 
-static void uart_event(void *opaque, QEMUChrEvent event)
+static void sifive_uart_event(void *opaque, QEMUChrEvent event)
 {
 }
 
-static int uart_be_change(void *opaque)
+static int sifive_uart_be_change(void *opaque)
 {
     SiFiveUARTState *s = opaque;
 
-    qemu_chr_fe_set_handlers(&s->chr, uart_can_rx, uart_rx, uart_event,
-        uart_be_change, s, NULL, true);
+    qemu_chr_fe_set_handlers(&s->chr, sifive_uart_can_rx, sifive_uart_rx,
+                             sifive_uart_event, sifive_uart_be_change, s,
+                             NULL, true);
 
     return 0;
 }
@@ -183,9 +184,10 @@ SiFiveUARTState *sifive_uart_create(MemoryRegion *address_space, hwaddr base,
     SiFiveUARTState *s = g_malloc0(sizeof(SiFiveUARTState));
     s->irq = irq;
     qemu_chr_fe_init(&s->chr, chr, &error_abort);
-    qemu_chr_fe_set_handlers(&s->chr, uart_can_rx, uart_rx, uart_event,
-        uart_be_change, s, NULL, true);
-    memory_region_init_io(&s->mmio, NULL, &uart_ops, s,
+    qemu_chr_fe_set_handlers(&s->chr, sifive_uart_can_rx, sifive_uart_rx,
+                             sifive_uart_event, sifive_uart_be_change, s,
+                             NULL, true);
+    memory_region_init_io(&s->mmio, NULL, &sifive_uart_ops, s,
                           TYPE_SIFIVE_UART, SIFIVE_UART_MAX);
     memory_region_add_subregion(address_space, base, &s->mmio);
     return s;
-- 
2.31.1


