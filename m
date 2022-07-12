Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1773A57290B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:10:00 +0200 (CEST)
Received: from localhost ([::1]:37360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBO4t-0001zF-6r
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqF-0003vx-0q; Tue, 12 Jul 2022 17:54:52 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqD-0007ve-Fb; Tue, 12 Jul 2022 17:54:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bV8HZvGS7FLPLzqx9ZZ9DgxHNxJtQvYshDtDFO2Fj4o=; b=AILTIjSryrsyFGtUNX4AX1ztK0
 HjKk1t0ZfZFUjHMlDxHcbm76olJrEp/PY31A+SQYX4secxm9qKkSoQdDdrnkGp41Jch+NiAZSoumu
 R9qNGicKBIFI5H9abnVBhAh7oVBplph8x+GarkZd9QK3aHb5jVK9V3ltKANNE59n/8EV97zpLOdVL
 XcZyqrUWXvfIS7VKIKgR692CZ87jVLLiDmkARIA2SFPZdlJxF+EQrkx+q1pcbCmxcujwjOqMroOfL
 l3ABo/NLB9TJWh1SUEMbekffH6oc5lOULH3CszgIx4sFxeuMtxVb9ibkuZeQ6hsKtCbX+EM4nNuck
 574kPvHTBU5Tqyo7qNJfKzHmr2uzSs7po3M4oOSv0GeXWsOI/lx0bKDF1hmjckQX7XqmYWI90807o
 pppm8imAS62vPmTfdmKDtA1KnAlJ1N7WU4rFeOLXZoTpb4SN+0fagB4PrdRp3pbuUJGiT8761KpG1
 UiOLfcw43kF4H3O3FEXRF8t6Ga57qs3gECU76C4MWe/DoNcpM0mNb2bXinQ01mZwBa4roOdhVeqX1
 VMOgHp5rc5u4EK6umZuj4CbXy8BHGBe36XJI3IVskv6RGTT3foyo6Fdei6UxIm8MnvYLeneMftQ9x
 PyrEQb6xl7cyus1iT9mJShdnkrp0Gdwrl9g4f2FRQ=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNoT-000Bqt-MV; Tue, 12 Jul 2022 22:53:05 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:34 +0100
Message-Id: <20220712215251.7944-24-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 23/40] lasips2: rename LASIPS2Port irq field to birq
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


