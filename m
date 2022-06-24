Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5484559AB4
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 15:54:09 +0200 (CEST)
Received: from localhost ([::1]:38960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4jlA-000834-MW
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 09:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZG-0007Sy-4G; Fri, 24 Jun 2022 09:41:50 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZD-00055k-DR; Fri, 24 Jun 2022 09:41:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x4Ux/flhpbIkk1DOYNpnIWHsBEhYIKBWJPHzdRfuhRU=; b=R0CeQOSbUv7xjyMenlexQZgcCM
 /PUBrEKSt/OlCb3Tv+KiovoA/+Cvti41I/Lk9NzMmK5B2B7e6cGY2cFdxZjLWBl9xwiAtQ9+939JJ
 XWsYNGjQsqXalA+6wyMqTcrx83xZst2Nw1qUIDFsFKm6DuPRpTqwkTs5a0uCvX92c8pQe2+MnioAT
 GRug6pFMnkJ1/6PmRmKK2bX8D5J8TofgJ9YkTufUSV0Z37mr4inMrGONE7tOEwg3OHClt6SM/+hOZ
 7Z1XzA8eI3wdo7qsicRF5mYNA3q+zv39gWxH2id5HSFPAbmsaKF3y76SslOx8azUMmA2Lk41BEr75
 HrLu0EDYL661bKIIGczu1Frp2OlUmWnElaMO+KAMH3cv8ERuBTDcnrM7DeaE3NwPNmsluyxmeSsGc
 oCY3DqyQbu2RdWJOuzZFJnKKyCphWNJ2yOFNQYDwZ+P9yCjMc2opW68LjQ9h7RaHpwk+G4edlK2Vt
 8gCQ7hrzMBD6ReFQIlrafAWK3n8LFPq1+lv2On3WJzjiRUlgQqE3G5OBRhysvXxaPpzgfmsqQL57h
 YuHnix0VVrg2xGNSre1rVbEgP5yIYcG3FI8HK2ienRUF+nphZug9aCe+HhhtRmPYlCEQa+3eq5EDA
 Y/ZfEQiChhAR7F4VUErSIXEO/OIfZPAW17R91YdgI=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jXt-00037t-05; Fri, 24 Jun 2022 14:40:29 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:21 +0100
Message-Id: <20220624134109.881989-7-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 06/54] ps2: improve function prototypes in ps2.c and ps2.h
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

With the latest changes it is now possible to improve some of the function
prototypes in ps2.c and ps.h to use the appropriate PS2KbdState or
PS2MouseState type instead of being a void opaque.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/input/ps2.c         | 22 +++++++++-------------
 include/hw/input/ps2.h |  8 ++++----
 2 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index f4bad9876a..3a770f3b78 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -581,12 +581,11 @@ static void ps2_reset_keyboard(PS2KbdState *s)
     ps2_set_ledstate(s, 0);
 }
 
-void ps2_write_keyboard(void *opaque, int val)
+void ps2_write_keyboard(PS2KbdState *s, int val)
 {
-    PS2KbdState *s = (PS2KbdState *)opaque;
     PS2State *ps2 = PS2_DEVICE(s);
 
-    trace_ps2_write_keyboard(opaque, val);
+    trace_ps2_write_keyboard(s, val);
     ps2_cqueue_reset(ps2);
     switch (ps2->write_cmd) {
     default:
@@ -675,10 +674,9 @@ void ps2_write_keyboard(void *opaque, int val)
  * 1 = translated scancodes (used by qemu internally).
  */
 
-void ps2_keyboard_set_translation(void *opaque, int mode)
+void ps2_keyboard_set_translation(PS2KbdState *s, int mode)
 {
-    PS2KbdState *s = (PS2KbdState *)opaque;
-    trace_ps2_keyboard_set_translation(opaque, mode);
+    trace_ps2_keyboard_set_translation(s, mode);
     s->translate = mode;
 }
 
@@ -857,20 +855,18 @@ static void ps2_mouse_sync(DeviceState *dev)
     }
 }
 
-void ps2_mouse_fake_event(void *opaque)
+void ps2_mouse_fake_event(PS2MouseState *s)
 {
-    PS2MouseState *s = opaque;
-    trace_ps2_mouse_fake_event(opaque);
+    trace_ps2_mouse_fake_event(s);
     s->mouse_dx++;
-    ps2_mouse_sync(opaque);
+    ps2_mouse_sync(DEVICE(s));
 }
 
-void ps2_write_mouse(void *opaque, int val)
+void ps2_write_mouse(PS2MouseState *s, int val)
 {
-    PS2MouseState *s = (PS2MouseState *)opaque;
     PS2State *ps2 = PS2_DEVICE(s);
 
-    trace_ps2_write_mouse(opaque, val);
+    trace_ps2_write_mouse(s, val);
     switch (ps2->write_cmd) {
     default:
     case -1:
diff --git a/include/hw/input/ps2.h b/include/hw/input/ps2.h
index 7f2c3f6090..1a3321d77e 100644
--- a/include/hw/input/ps2.h
+++ b/include/hw/input/ps2.h
@@ -92,8 +92,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(PS2MouseState, PS2_MOUSE_DEVICE)
 /* ps2.c */
 void *ps2_kbd_init(void (*update_irq)(void *, int), void *update_arg);
 void *ps2_mouse_init(void (*update_irq)(void *, int), void *update_arg);
-void ps2_write_mouse(void *, int val);
-void ps2_write_keyboard(void *, int val);
+void ps2_write_mouse(PS2MouseState *s, int val);
+void ps2_write_keyboard(PS2KbdState *s, int val);
 uint32_t ps2_read_data(PS2State *s);
 void ps2_queue_noirq(PS2State *s, int b);
 void ps2_raise_irq(PS2State *s);
@@ -101,8 +101,8 @@ void ps2_queue(PS2State *s, int b);
 void ps2_queue_2(PS2State *s, int b1, int b2);
 void ps2_queue_3(PS2State *s, int b1, int b2, int b3);
 void ps2_queue_4(PS2State *s, int b1, int b2, int b3, int b4);
-void ps2_keyboard_set_translation(void *opaque, int mode);
-void ps2_mouse_fake_event(void *opaque);
+void ps2_keyboard_set_translation(PS2KbdState *s, int mode);
+void ps2_mouse_fake_event(PS2MouseState *s);
 int ps2_queue_empty(PS2State *s);
 
 #endif /* HW_PS2_H */
-- 
2.30.2


