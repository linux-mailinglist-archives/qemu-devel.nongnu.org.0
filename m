Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A135600C3
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 15:10:06 +0200 (CEST)
Received: from localhost ([::1]:46566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6XSH-0006oS-RP
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 09:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1A-0000R0-Cj; Wed, 29 Jun 2022 08:42:04 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X18-0004kf-K5; Wed, 29 Jun 2022 08:42:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8RqL9lVvM9npMy7dBGL61TkGeCT5O1k5zHiN5ztDO/0=; b=0bqZz9BVfujb2/c1ZJ3hW0M10D
 SJFZqwkFcL8P/v8gIR0pBzDRABMpYXBiC/s4z8+3nB/i5BvzOGut7ZUb40etZdZNwz83EiAUhTAVk
 2C4vQ1dEDY58mZL2lXmqDWpsavbezd2IwxBoBw7rABZxberi5S66NW4NmPNw7xFSMOoEQWnKVmmIq
 NQjg317qdRPyO+wnvAl5/eWd77kJsI5fv21rBIuIShTPf6eQyWUiegcypOmnAjoNbIBq07AmIGQSZ
 b2V1oR5bLwYkyyNgB63Ozaje2udIToGidoKv0BQkFHfdTVBWp1u9jjgH8L+GmhTxdl6t0nxMYIbpI
 UsSIIWgG80Uhcy0DweE2IqzDihKtL3lOElsaz6i14nKVqPmec0ksF+TyDQytma1MWSB0zECp41Fuv
 awK89Jqa5e+bzt2VsEsaNr4Xz0zzjACYhpvNb8cYonbdQ8p+ir/tnss/Fcg+vC2AQ1t/wlqQcD54b
 ZAL7xbxkjd5IBja4XIHATrabwZmG1GRsZfUz8necHC2dT32dyoNaNF/6ZFOp/uqxarnrTw4pp/Nhy
 ybjwNnV0c7cZu3tbuhZ7L2uA3VrG/K6estEhEJLeXrYlmyUa2uKahn8gp3eetN4McGSH9zvDDtwsF
 YH1AK5fJgprlCC9L1YG2+dvEMg/j/DyoeBWQAoiss=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6WzV-0002tZ-DU; Wed, 29 Jun 2022 13:40:25 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:40:09 +0100
Message-Id: <20220629124026.1077021-24-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 23/40] lasips2: rename LASIPS2Port irq field to birq
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


