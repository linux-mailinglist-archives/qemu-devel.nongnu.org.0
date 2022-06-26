Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59A055B344
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 19:52:42 +0200 (CEST)
Received: from localhost ([::1]:51342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5WR7-0001sG-N6
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 13:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WKU-0001Nr-IU
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:45:51 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:44982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WKS-0008Kf-Bj
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:45:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MYbsknRH0/n9h0FiN61Ir/pQmHwr4gvFPu1T7T48vIg=; b=UjNURMPXdMhnSxVxYekCGMEggM
 2E/aqaxbKXrVCm/r0MppV0CawaPYmRiTIi0FXQFOyh8HrJqiCfk5Bzr0JktAFwyD2G7mOHb/v+5Vf
 gxDcCKm6UbZlEPNnj8QeAKTmkO99wEsnnjxM4mNBXX8dW2zVsFH7vcU2Sw8qep2FAW0eKkyIFv+6v
 v6i/rqMiwISt18ViBsE84plbe0j1pwiQ+38KncPKMUTiHK2ZzH/4+cD7soTti8vo5vEo/uol+Fp8R
 ijugRq6t1tGRZqCPo2t7oZvA9j7oG0ruWiIuunWbEXVbbzdIofZ3gOpZPacI4qjDQO2kMFM2qVHSp
 zpShVKobEnC/dkEGWzTDPATDbo7i2u7SNTPzwJPjAly+RUdXdFWzpuJW3X6gib8uWA7tpDK2AjHPD
 D/7m/sG0Ck4kKT1QjJv+lM6jce4E2ScfS8A5PWacNlFJWvCjxg9wEijv5N2UWBoBUxzNQTc+wkPG4
 VdxTHWh4P5KulryOQJVpLidOqB4FAhfIP6y743m+YMwOMey+UH5FxathScR8bbT1ENIygAaQtWlmA
 Bw1r6tz8BkITthbAfEhvPDOV+f3HedzLIfGT6X3PBvhypUFNBV25ivaoiTJ5qNJqpWdu6dVRiUZvZ
 NtMVxwEpsSWWQSRRwrvDT9mpvNcZQXt9GhI/ZvvJQ=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WJE-0007KY-2d; Sun, 26 Jun 2022 18:44:36 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:44:37 +0100
Message-Id: <20220626174531.969187-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 01/55] ps2: checkpatch fixes
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

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Helge Deller <deller@gmx.de>
Message-Id: <20220624134109.881989-2-mark.cave-ayland@ilande.co.uk>
---
 hw/input/ps2.c | 154 +++++++++++++++++++++++++++----------------------
 1 file changed, 86 insertions(+), 68 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index c16df1de7a..67dd2eca84 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -34,41 +34,41 @@
 #include "trace.h"
 
 /* Keyboard Commands */
-#define KBD_CMD_SET_LEDS	0xED	/* Set keyboard leds */
-#define KBD_CMD_ECHO     	0xEE
-#define KBD_CMD_SCANCODE	0xF0	/* Get/set scancode set */
-#define KBD_CMD_GET_ID 	        0xF2	/* get keyboard ID */
-#define KBD_CMD_SET_RATE	0xF3	/* Set typematic rate */
-#define KBD_CMD_ENABLE		0xF4	/* Enable scanning */
-#define KBD_CMD_RESET_DISABLE	0xF5	/* reset and disable scanning */
-#define KBD_CMD_RESET_ENABLE   	0xF6    /* reset and enable scanning */
-#define KBD_CMD_RESET		0xFF	/* Reset */
+#define KBD_CMD_SET_LEDS        0xED    /* Set keyboard leds */
+#define KBD_CMD_ECHO            0xEE
+#define KBD_CMD_SCANCODE        0xF0    /* Get/set scancode set */
+#define KBD_CMD_GET_ID          0xF2    /* get keyboard ID */
+#define KBD_CMD_SET_RATE        0xF3    /* Set typematic rate */
+#define KBD_CMD_ENABLE          0xF4    /* Enable scanning */
+#define KBD_CMD_RESET_DISABLE   0xF5    /* reset and disable scanning */
+#define KBD_CMD_RESET_ENABLE    0xF6    /* reset and enable scanning */
+#define KBD_CMD_RESET           0xFF    /* Reset */
 #define KBD_CMD_SET_MAKE_BREAK  0xFC    /* Set Make and Break mode */
 #define KBD_CMD_SET_TYPEMATIC   0xFA    /* Set Typematic Make and Break mode */
 
 /* Keyboard Replies */
-#define KBD_REPLY_POR		0xAA	/* Power on reset */
-#define KBD_REPLY_ID		0xAB	/* Keyboard ID */
-#define KBD_REPLY_ACK		0xFA	/* Command ACK */
-#define KBD_REPLY_RESEND	0xFE	/* Command NACK, send the cmd again */
+#define KBD_REPLY_POR       0xAA    /* Power on reset */
+#define KBD_REPLY_ID        0xAB    /* Keyboard ID */
+#define KBD_REPLY_ACK       0xFA    /* Command ACK */
+#define KBD_REPLY_RESEND    0xFE    /* Command NACK, send the cmd again */
 
 /* Mouse Commands */
-#define AUX_SET_SCALE11		0xE6	/* Set 1:1 scaling */
-#define AUX_SET_SCALE21		0xE7	/* Set 2:1 scaling */
-#define AUX_SET_RES		0xE8	/* Set resolution */
-#define AUX_GET_SCALE		0xE9	/* Get scaling factor */
-#define AUX_SET_STREAM		0xEA	/* Set stream mode */
-#define AUX_POLL		0xEB	/* Poll */
-#define AUX_RESET_WRAP		0xEC	/* Reset wrap mode */
-#define AUX_SET_WRAP		0xEE	/* Set wrap mode */
-#define AUX_SET_REMOTE		0xF0	/* Set remote mode */
-#define AUX_GET_TYPE		0xF2	/* Get type */
-#define AUX_SET_SAMPLE		0xF3	/* Set sample rate */
-#define AUX_ENABLE_DEV		0xF4	/* Enable aux device */
-#define AUX_DISABLE_DEV		0xF5	/* Disable aux device */
-#define AUX_SET_DEFAULT		0xF6
-#define AUX_RESET		0xFF	/* Reset aux device */
-#define AUX_ACK			0xFA	/* Command byte ACK. */
+#define AUX_SET_SCALE11     0xE6    /* Set 1:1 scaling */
+#define AUX_SET_SCALE21     0xE7    /* Set 2:1 scaling */
+#define AUX_SET_RES         0xE8    /* Set resolution */
+#define AUX_GET_SCALE       0xE9    /* Get scaling factor */
+#define AUX_SET_STREAM      0xEA    /* Set stream mode */
+#define AUX_POLL            0xEB    /* Poll */
+#define AUX_RESET_WRAP      0xEC    /* Reset wrap mode */
+#define AUX_SET_WRAP        0xEE    /* Set wrap mode */
+#define AUX_SET_REMOTE      0xF0    /* Set remote mode */
+#define AUX_GET_TYPE        0xF2    /* Get type */
+#define AUX_SET_SAMPLE      0xF3    /* Set sample rate */
+#define AUX_ENABLE_DEV      0xF4    /* Enable aux device */
+#define AUX_DISABLE_DEV     0xF5    /* Disable aux device */
+#define AUX_SET_DEFAULT     0xF6
+#define AUX_RESET           0xFF    /* Reset aux device */
+#define AUX_ACK             0xFA    /* Command byte ACK. */
 
 #define MOUSE_STATUS_REMOTE     0x40
 #define MOUSE_STATUS_ENABLED    0x20
@@ -436,8 +436,9 @@ static void ps2_keyboard_event(DeviceState *dev, QemuConsole *src,
                 }
             }
         } else {
-            if (qcode < qemu_input_map_qcode_to_atset1_len)
+            if (qcode < qemu_input_map_qcode_to_atset1_len) {
                 keycode = qemu_input_map_qcode_to_atset1[qcode];
+            }
             if (keycode) {
                 if (keycode & 0xff00) {
                     ps2_put_keycode(s, keycode >> 8);
@@ -530,8 +531,9 @@ static void ps2_keyboard_event(DeviceState *dev, QemuConsole *src,
                 }
             }
         } else {
-            if (qcode < qemu_input_map_qcode_to_atset2_len)
+            if (qcode < qemu_input_map_qcode_to_atset2_len) {
                 keycode = qemu_input_map_qcode_to_atset2[qcode];
+            }
             if (keycode) {
                 if (keycode & 0xff00) {
                     ps2_put_keycode(s, keycode >> 8);
@@ -546,8 +548,9 @@ static void ps2_keyboard_event(DeviceState *dev, QemuConsole *src,
             }
         }
     } else if (s->scancode_set == 3) {
-        if (qcode < qemu_input_map_qcode_to_atset3_len)
+        if (qcode < qemu_input_map_qcode_to_atset3_len) {
             keycode = qemu_input_map_qcode_to_atset3[qcode];
+        }
         if (keycode) {
             /* FIXME: break code should be configured on a key by key basis */
             if (!key->down) {
@@ -569,8 +572,10 @@ uint32_t ps2_read_data(PS2State *s)
     trace_ps2_read_data(s);
     q = &s->queue;
     if (q->count == 0) {
-        /* NOTE: if no data left, we return the last keyboard one
-           (needed for EMM386) */
+        /*
+         * NOTE: if no data left, we return the last keyboard one
+         * (needed for EMM386)
+         */
         /* XXX: need a timer to do things correctly */
         index = q->rptr - 1;
         if (index < 0) {
@@ -619,10 +624,10 @@ void ps2_write_keyboard(void *opaque, int val)
 
     trace_ps2_write_keyboard(opaque, val);
     ps2_cqueue_reset(&s->common);
-    switch(s->common.write_cmd) {
+    switch (s->common.write_cmd) {
     default:
     case -1:
-        switch(val) {
+        switch (val) {
         case 0x00:
             ps2_cqueue_1(&s->common, KBD_REPLY_ACK);
             break;
@@ -632,7 +637,7 @@ void ps2_write_keyboard(void *opaque, int val)
         case KBD_CMD_GET_ID:
             /* We emulate a MF2 AT keyboard here */
             ps2_cqueue_3(&s->common, KBD_REPLY_ACK, KBD_REPLY_ID,
-                s->translate ? 0x41 : 0x83);
+                         s->translate ? 0x41 : 0x83);
             break;
         case KBD_CMD_ECHO:
             ps2_cqueue_1(&s->common, KBD_CMD_ECHO);
@@ -661,8 +666,8 @@ void ps2_write_keyboard(void *opaque, int val)
         case KBD_CMD_RESET:
             ps2_reset_keyboard(s);
             ps2_cqueue_2(&s->common,
-                KBD_REPLY_ACK,
-                KBD_REPLY_POR);
+                         KBD_REPLY_ACK,
+                         KBD_REPLY_POR);
             break;
         case KBD_CMD_SET_TYPEMATIC:
             ps2_cqueue_1(&s->common, KBD_REPLY_ACK);
@@ -700,9 +705,11 @@ void ps2_write_keyboard(void *opaque, int val)
     }
 }
 
-/* Set the scancode translation mode.
-   0 = raw scancodes.
-   1 = translated scancodes (used by qemu internally).  */
+/*
+ * Set the scancode translation mode.
+ * 0 = raw scancodes.
+ * 1 = translated scancodes (used by qemu internally).
+ */
 
 void ps2_keyboard_set_translation(void *opaque, int mode)
 {
@@ -727,30 +734,33 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
     dz1 = s->mouse_dz;
     dw1 = s->mouse_dw;
     /* XXX: increase range to 8 bits ? */
-    if (dx1 > 127)
+    if (dx1 > 127) {
         dx1 = 127;
-    else if (dx1 < -127)
+    } else if (dx1 < -127) {
         dx1 = -127;
-    if (dy1 > 127)
+    }
+    if (dy1 > 127) {
         dy1 = 127;
-    else if (dy1 < -127)
+    } else if (dy1 < -127) {
         dy1 = -127;
+    }
     b = 0x08 | ((dx1 < 0) << 4) | ((dy1 < 0) << 5) | (s->mouse_buttons & 0x07);
     ps2_queue_noirq(&s->common, b);
     ps2_queue_noirq(&s->common, dx1 & 0xff);
     ps2_queue_noirq(&s->common, dy1 & 0xff);
     /* extra byte for IMPS/2 or IMEX */
-    switch(s->mouse_type) {
+    switch (s->mouse_type) {
     default:
         /* Just ignore the wheels if not supported */
         s->mouse_dz = 0;
         s->mouse_dw = 0;
         break;
     case 3:
-        if (dz1 > 127)
+        if (dz1 > 127) {
             dz1 = 127;
-        else if (dz1 < -127)
-                dz1 = -127;
+        } else if (dz1 < -127) {
+            dz1 = -127;
+        }
         ps2_queue_noirq(&s->common, dz1 & 0xff);
         s->mouse_dz -= dz1;
         s->mouse_dw = 0;
@@ -816,8 +826,9 @@ static void ps2_mouse_event(DeviceState *dev, QemuConsole *src,
     InputBtnEvent *btn;
 
     /* check if deltas are recorded when disabled */
-    if (!(s->mouse_status & MOUSE_STATUS_ENABLED))
+    if (!(s->mouse_status & MOUSE_STATUS_ENABLED)) {
         return;
+    }
 
     switch (evt->type) {
     case INPUT_EVENT_KIND_REL:
@@ -868,8 +879,10 @@ static void ps2_mouse_sync(DeviceState *dev)
         qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, NULL);
     }
     if (!(s->mouse_status & MOUSE_STATUS_REMOTE)) {
-        /* if not remote, send event. Multiple events are sent if
-           too big deltas */
+        /*
+         * if not remote, send event. Multiple events are sent if
+         * too big deltas
+         */
         while (ps2_mouse_send_packet(s)) {
             if (s->mouse_dx == 0 && s->mouse_dy == 0
                     && s->mouse_dz == 0 && s->mouse_dw == 0) {
@@ -892,7 +905,7 @@ void ps2_write_mouse(void *opaque, int val)
     PS2MouseState *s = (PS2MouseState *)opaque;
 
     trace_ps2_write_mouse(opaque, val);
-    switch(s->common.write_cmd) {
+    switch (s->common.write_cmd) {
     default:
     case -1:
         /* mouse command */
@@ -906,7 +919,7 @@ void ps2_write_mouse(void *opaque, int val)
                 return;
             }
         }
-        switch(val) {
+        switch (val) {
         case AUX_SET_SCALE11:
             s->mouse_status &= ~MOUSE_STATUS_SCALE21;
             ps2_queue(&s->common, AUX_ACK);
@@ -980,28 +993,32 @@ void ps2_write_mouse(void *opaque, int val)
     case AUX_SET_SAMPLE:
         s->mouse_sample_rate = val;
         /* detect IMPS/2 or IMEX */
-        switch(s->mouse_detect_state) {
+        switch (s->mouse_detect_state) {
         default:
         case 0:
-            if (val == 200)
+            if (val == 200) {
                 s->mouse_detect_state = 1;
+            }
             break;
         case 1:
-            if (val == 100)
+            if (val == 100) {
                 s->mouse_detect_state = 2;
-            else if (val == 200)
+            } else if (val == 200) {
                 s->mouse_detect_state = 3;
-            else
+            } else {
                 s->mouse_detect_state = 0;
+            }
             break;
         case 2:
-            if (val == 80)
+            if (val == 80) {
                 s->mouse_type = 3; /* IMPS/2 */
+            }
             s->mouse_detect_state = 0;
             break;
         case 3:
-            if (val == 80)
+            if (val == 80) {
                 s->mouse_type = 4; /* IMEX */
+            }
             s->mouse_detect_state = 0;
             break;
         }
@@ -1154,13 +1171,14 @@ static const VMStateDescription vmstate_ps2_keyboard_cqueue = {
     }
 };
 
-static int ps2_kbd_post_load(void* opaque, int version_id)
+static int ps2_kbd_post_load(void *opaque, int version_id)
 {
-    PS2KbdState *s = (PS2KbdState*)opaque;
+    PS2KbdState *s = (PS2KbdState *)opaque;
     PS2State *ps2 = &s->common;
 
-    if (version_id == 2)
-        s->scancode_set=2;
+    if (version_id == 2) {
+        s->scancode_set = 2;
+    }
 
     ps2_common_post_load(ps2);
 
@@ -1176,10 +1194,10 @@ static const VMStateDescription vmstate_ps2_keyboard = {
         VMSTATE_STRUCT(common, PS2KbdState, 0, vmstate_ps2_common, PS2State),
         VMSTATE_INT32(scan_enabled, PS2KbdState),
         VMSTATE_INT32(translate, PS2KbdState),
-        VMSTATE_INT32_V(scancode_set, PS2KbdState,3),
+        VMSTATE_INT32_V(scancode_set, PS2KbdState, 3),
         VMSTATE_END_OF_LIST()
     },
-    .subsections = (const VMStateDescription*[]) {
+    .subsections = (const VMStateDescription * []) {
         &vmstate_ps2_keyboard_ledstate,
         &vmstate_ps2_keyboard_need_high_bit,
         &vmstate_ps2_keyboard_cqueue,
-- 
2.30.2


