Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406385789DE
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 20:55:26 +0200 (CEST)
Received: from localhost ([::1]:44740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDVtt-0000nx-AN
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 14:55:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVal-0000rJ-2O
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:35:39 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVah-0005pU-N9
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:35:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LPUw9T0GQY+YP6VXVk8nZ9EF9m1aGFvkXGtGXYL4N5s=; b=s/lz69+ZoRTWuRUK/cKh2YgQZU
 8e4mMLyjuPvzZkckewlzMr8mJKi1Ym9/nz3sb3QvU5t3lDsPMC/d8pzTmxMPYoEpR3T4Ykb4E2kBS
 /eg4yUoGfNjIqgsltAmT4cMfDfbZrxMnXruRQP3gi1EekpFpBnuyMBEoYEC7Bd3kPtAgH3QL0+v1W
 VYSTnB0bDftV2dVUxGQVP9HFRi9L+9aGosw0kZMZfcqHpCMAu5/ZEg81eX9qfuB0Fv0eFKyFL/udP
 wtNiZ1FS45AQiIoZVLEty5tqeSQ+iGObqHS9POF4yq3Q9OvU45rJwJmfVZUfDd8G6A8cXvMCvPHPQ
 DRwvE0eraxJ/2skF1ZB2bsVJPxfz/2FXrm40RpXxIwpUk3iQq0l3w0meqFwhTJSeeRVO1NnYc50aB
 Z6pI8uSAtXU8LHqfoQsp+R5+4v9jKOSMAwQZudx/npx2cnUH+tBNpWjjQg32/2k7ZgG9B2A+P+yGV
 CD+0AfOKJ1exJZiRfmQqVqEQVVEeJrE55LbkWGGftNIENNEcfDyeNbnkl5m1S9b9IlZB4tjFFEcQn
 M7IDZGhj2TZYy9IzIoTnmQhXWcOi0SM6+GM4MVziwYs98hXA5OK9ABQYnZ0v12//xmmqcXgVpdLn1
 sPD0CI7rDOw5W7Cd+BJVoZhrHKT8/gwCG8GmW/qBM=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZB-000B51-Ll; Mon, 18 Jul 2022 19:34:05 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:22 +0100
Message-Id: <20220718183339.124253-24-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 23/40] lasips2: rename LASIPS2Port irq field to birq
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

The existing boolean irq field in LASIPS2Port will soon be replaced by a proper
qemu_irq, so rename the field to birq to allow the upcoming qemu_irq to use the
irq name.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220712215251.7944-24-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/lasips2.c         | 24 ++++++++++++------------
 include/hw/input/lasips2.h |  2 +-
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index ce87c66f2a..49e5c90b73 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -42,10 +42,10 @@ static const VMStateDescription vmstate_lasips2 = {
     .fields = (VMStateField[]) {
         VMSTATE_UINT8(kbd_port.parent_obj.control, LASIPS2State),
         VMSTATE_UINT8(kbd_port.parent_obj.id, LASIPS2State),
-        VMSTATE_BOOL(kbd_port.parent_obj.irq, LASIPS2State),
+        VMSTATE_BOOL(kbd_port.parent_obj.birq, LASIPS2State),
         VMSTATE_UINT8(mouse_port.parent_obj.control, LASIPS2State),
         VMSTATE_UINT8(mouse_port.parent_obj.id, LASIPS2State),
-        VMSTATE_BOOL(mouse_port.parent_obj.irq, LASIPS2State),
+        VMSTATE_BOOL(mouse_port.parent_obj.birq, LASIPS2State),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -119,10 +119,10 @@ static const char *lasips2_write_reg_name(uint64_t addr)
 
 static void lasips2_update_irq(LASIPS2State *s)
 {
-    trace_lasips2_intr(s->kbd_port.parent_obj.irq |
-                       s->mouse_port.parent_obj.irq);
-    qemu_set_irq(s->irq, s->kbd_port.parent_obj.irq |
-                         s->mouse_port.parent_obj.irq);
+    trace_lasips2_intr(s->kbd_port.parent_obj.birq |
+                       s->mouse_port.parent_obj.birq);
+    qemu_set_irq(s->irq, s->kbd_port.parent_obj.birq |
+                         s->mouse_port.parent_obj.birq);
 }
 
 static void lasips2_reg_write(void *opaque, hwaddr addr, uint64_t val,
@@ -141,7 +141,7 @@ static void lasips2_reg_write(void *opaque, hwaddr addr, uint64_t val,
     case REG_PS2_XMTDATA:
         if (port->control & LASIPS2_CONTROL_LOOPBACK) {
             port->buf = val;
-            port->irq = true;
+            port->birq = true;
             port->loopback_rbne = true;
             lasips2_update_irq(port->parent);
             break;
@@ -176,7 +176,7 @@ static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
 
     case REG_PS2_RCVDATA:
         if (port->control & LASIPS2_CONTROL_LOOPBACK) {
-            port->irq = false;
+            port->birq = false;
             port->loopback_rbne = false;
             lasips2_update_irq(port->parent);
             ret = port->buf;
@@ -213,8 +213,8 @@ static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
             }
         }
 
-        if (port->parent->kbd_port.parent_obj.irq ||
-            port->parent->mouse_port.parent_obj.irq) {
+        if (port->parent->kbd_port.parent_obj.birq ||
+            port->parent->mouse_port.parent_obj.birq) {
                 ret |= LASIPS2_STATUS_CMPINTR;
         }
         break;
@@ -245,7 +245,7 @@ static void lasips2_set_kbd_irq(void *opaque, int n, int level)
     LASIPS2State *s = LASIPS2(opaque);
     LASIPS2Port *port = LASIPS2_PORT(&s->kbd_port);
 
-    port->irq = level;
+    port->birq = level;
     lasips2_update_irq(port->parent);
 }
 
@@ -254,7 +254,7 @@ static void lasips2_set_mouse_irq(void *opaque, int n, int level)
     LASIPS2State *s = LASIPS2(opaque);
     LASIPS2Port *port = LASIPS2_PORT(&s->mouse_port);
 
-    port->irq = level;
+    port->birq = level;
     lasips2_update_irq(port->parent);
 }
 
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 84807bec36..4c4b471737 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -40,7 +40,7 @@ struct LASIPS2Port {
     uint8_t control;
     uint8_t buf;
     bool loopback_rbne;
-    bool irq;
+    bool birq;
 };
 
 #define TYPE_LASIPS2_KBD_PORT "lasips2-kbd-port"
-- 
2.30.2


