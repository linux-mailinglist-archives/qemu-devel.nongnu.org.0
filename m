Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54057578A92
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 21:20:35 +0200 (CEST)
Received: from localhost ([::1]:58428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDWIE-00019B-FQ
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 15:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVbB-0001WU-9P
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:36:05 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVb8-0005yD-9L
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:36:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gI7WYMtgMBeE2AGy2fFw/ySzWRXvdrVqmsTeIYJTX0g=; b=0XhymoVUOnnIWy9stQnTEN08M/
 uZcTyo0clE1iT+kLwbFVd36Djk/ql7WUdYqJJOieqmy0MfKTRWBx5BF5f2FyoPuOl7J0YTSm/MsvK
 lJrlr8QQAqfg/jjUR5q3FEoQkunLpj9j5O7pjGawhXz5bSQ3eIR5jSDM1pROg7OcpzvxC6IJA/4o/
 D2CNiEaZT/g73tsJ6JnzD5UmRlsxgWCGl6RDfvTQAxnEKGJtdluGT7OZa6b4FDSug8b5lmoxgYzMd
 q86BaEUgP6ZX3GlYk983++R8mP1zwFSh9C/OsZkBzLsQrdFQwkSP5EDDXgue30rHqXx93YRgsqBtL
 6Dyl3fxlLsCSatK1uS9ItFDkjlcnkxL1aPiFowgPZRwVs4N7TS4aklKml8ifMUwnCiD6gpjPP4nYw
 P+nKwnI8dOHUtRBerxWti6b3itpubnRv9U+OngoFBMQ+pqbUOK8u3430H07bS/Sf+MmsEvxJp/YyI
 j2SzJMU87WIAAytQthV1TImxdhKy0pBwbA9PgHrsYfEQLHx4SLOAmRewsCEF8fQl4sRyyGlhjnXEK
 E8UFnywMHNHmzrfVjPoXa/JWDUJoHxran6o6YNShM28V3ikziWrqhpPSuF6mRW8jceWOi+xLNtpu6
 dSOAIvc38Hjnqm40XzA0pvjfPNMVAZTrbZZ1Tg5Q0=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZc-000B51-SI; Mon, 18 Jul 2022 19:34:33 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:29 +0100
Message-Id: <20220718183339.124253-31-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 30/40] lasips2: standardise on lp name for LASIPS2Port variables
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

This is shorter to type and keeps the naming convention consistent within the
LASIPS2 device.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220712215251.7944-31-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/lasips2.c | 52 +++++++++++++++++++++++-----------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 0f392e2bee..09d909c843 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -139,28 +139,28 @@ static void lasips2_set_irq(void *opaque, int n, int level)
 static void lasips2_reg_write(void *opaque, hwaddr addr, uint64_t val,
                               unsigned size)
 {
-    LASIPS2Port *port = opaque;
+    LASIPS2Port *lp = LASIPS2_PORT(opaque);
 
-    trace_lasips2_reg_write(size, port->id, addr,
+    trace_lasips2_reg_write(size, lp->id, addr,
                             lasips2_write_reg_name(addr), val);
 
     switch (addr & 0xc) {
     case REG_PS2_CONTROL:
-        port->control = val;
+        lp->control = val;
         break;
 
     case REG_PS2_XMTDATA:
-        if (port->control & LASIPS2_CONTROL_LOOPBACK) {
-            port->buf = val;
-            port->loopback_rbne = true;
-            qemu_set_irq(port->irq, 1);
+        if (lp->control & LASIPS2_CONTROL_LOOPBACK) {
+            lp->buf = val;
+            lp->loopback_rbne = true;
+            qemu_set_irq(lp->irq, 1);
             break;
         }
 
-        if (port->id) {
-            ps2_write_mouse(PS2_MOUSE_DEVICE(port->ps2dev), val);
+        if (lp->id) {
+            ps2_write_mouse(PS2_MOUSE_DEVICE(lp->ps2dev), val);
         } else {
-            ps2_write_keyboard(PS2_KBD_DEVICE(port->ps2dev), val);
+            ps2_write_keyboard(PS2_KBD_DEVICE(lp->ps2dev), val);
         }
         break;
 
@@ -176,53 +176,53 @@ static void lasips2_reg_write(void *opaque, hwaddr addr, uint64_t val,
 
 static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
 {
-    LASIPS2Port *port = opaque;
+    LASIPS2Port *lp = LASIPS2_PORT(opaque);
     uint64_t ret = 0;
 
     switch (addr & 0xc) {
     case REG_PS2_ID:
-        ret = port->id;
+        ret = lp->id;
         break;
 
     case REG_PS2_RCVDATA:
-        if (port->control & LASIPS2_CONTROL_LOOPBACK) {
-            port->loopback_rbne = false;
-            qemu_set_irq(port->irq, 0);
-            ret = port->buf;
+        if (lp->control & LASIPS2_CONTROL_LOOPBACK) {
+            lp->loopback_rbne = false;
+            qemu_set_irq(lp->irq, 0);
+            ret = lp->buf;
             break;
         }
 
-        ret = ps2_read_data(port->ps2dev);
+        ret = ps2_read_data(lp->ps2dev);
         break;
 
     case REG_PS2_CONTROL:
-        ret = port->control;
+        ret = lp->control;
         break;
 
     case REG_PS2_STATUS:
         ret = LASIPS2_STATUS_DATSHD | LASIPS2_STATUS_CLKSHD;
 
-        if (port->control & LASIPS2_CONTROL_DIAG) {
-            if (!(port->control & LASIPS2_CONTROL_DATDIR)) {
+        if (lp->control & LASIPS2_CONTROL_DIAG) {
+            if (!(lp->control & LASIPS2_CONTROL_DATDIR)) {
                 ret &= ~LASIPS2_STATUS_DATSHD;
             }
 
-            if (!(port->control & LASIPS2_CONTROL_CLKDIR)) {
+            if (!(lp->control & LASIPS2_CONTROL_CLKDIR)) {
                 ret &= ~LASIPS2_STATUS_CLKSHD;
             }
         }
 
-        if (port->control & LASIPS2_CONTROL_LOOPBACK) {
-            if (port->loopback_rbne) {
+        if (lp->control & LASIPS2_CONTROL_LOOPBACK) {
+            if (lp->loopback_rbne) {
                 ret |= LASIPS2_STATUS_RBNE;
             }
         } else {
-            if (!ps2_queue_empty(port->ps2dev)) {
+            if (!ps2_queue_empty(lp->ps2dev)) {
                 ret |= LASIPS2_STATUS_RBNE;
             }
         }
 
-        if (port->lasips2->int_status) {
+        if (lp->lasips2->int_status) {
             ret |= LASIPS2_STATUS_CMPINTR;
         }
         break;
@@ -233,7 +233,7 @@ static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
         break;
     }
 
-    trace_lasips2_reg_read(size, port->id, addr,
+    trace_lasips2_reg_read(size, lp->id, addr,
                            lasips2_read_reg_name(addr), ret);
     return ret;
 }
-- 
2.30.2


