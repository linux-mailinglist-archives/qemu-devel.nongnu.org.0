Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EB155B34A
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 19:55:58 +0200 (CEST)
Received: from localhost ([::1]:60226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5WUH-0007mq-G5
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 13:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WKp-0001aA-88
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:46:11 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WKn-0008MK-H3
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KWT39DuVUAjEaQ5p8Bdy+SR+9EyArFYmvEyLuvcUSaY=; b=ex/l3kd/H3HzXSP9TtBn3Pcww0
 sN69/6cBxIchrjr5bEO++VHBS176SziK76PyGQOCVvqP9W/G9mZioWc1gGcMPpYtAbiTenVMs8n+c
 LURk7pCPFfN+tl1o8SgJ/PHga2T8xpMiaCMkZwN26cntVETIiCZCLG+vooelbOsyZt29bysJRo8+d
 ONf2i7kU0e54AJ2f4657N2r28GsHM6rUM9cLAeBVm5HFF80wn5ER3TRF/ePptnKHt/HTzYSUtsjQ+
 xQOWDfYoyQNqQ97Jl97TsBdDpY3zIFYYc42r7vnwd7CvR+i+FrAMgmRCfU/sOM5tjEmhVDJlvFBbB
 d4DVGIs/gcSuvJ1OCuTObBubKFeCT2EsPcei+JZdxd7q/2gwVb39NrFiNNFFV28MnZ+bT+yQPvaTL
 4bHuIaEpsCbqzX8odQZw/xJDAOWLBL2aaqBeP3GHn9+sagqUW0ZCcX+7h4PZzeoPsDibJjVINizyw
 Bhz+cocQPNysnILH44mc7JkXNByS7snVBbPmJai5kS/tl20xKFovsNTEfEabVJOmRVQz4ai6SdRiV
 QAl0KGUi6aMB7dzH1oM4dw7NAbuHxfHsrLH05oIioUreGrbu86GzY/WugIgulOaQqiVM1t4394LlB
 I2OE0FZsd820yeeR6UZSjoz+VO779glxceiPlF9Kk=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WJZ-0007KY-7h; Sun, 26 Jun 2022 18:44:57 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:44:42 +0100
Message-Id: <20220626174531.969187-7-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 06/55] ps2: improve function prototypes in ps2.c and ps2.h
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
Message-Id: <20220624134109.881989-7-mark.cave-ayland@ilande.co.uk>
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


