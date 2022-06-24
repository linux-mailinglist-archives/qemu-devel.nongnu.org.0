Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA45559AD0
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:00:28 +0200 (CEST)
Received: from localhost ([::1]:56700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4jrH-0003Ti-GC
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:00:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jaI-0001KB-Im; Fri, 24 Jun 2022 09:42:57 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jaE-0005EU-Oy; Fri, 24 Jun 2022 09:42:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KxPiyT4+eRrpWOcWb0WtwmhI9LLkN92G6Bk9HNizYxo=; b=EWAIzjs/g1/EuxQu+HQyf6YKjc
 LWjhG+GYzDt9cIzrRKOQMw2oCnw2vGZk1btCkTbYrsLMaDQlCNa4ajAbOxHz7ZJha1BXHVcgVLj49
 NLzV8eFHsLvX+eL7OvaWY0gCl4JL1EXxXETt6SsNNOtlCvaqMbd2syS0bty6QqmxRbowUpv5U3Vgf
 X8MaJ1gtRXnNQkKtMVSogtET5sSrXZs6ysY0/xntGlTVkpHUr8MleFojV68Ij4Wm/QtZS7hzC4NSB
 dFf0zKjUA8Su+3kp2jSzVMiSCnaRW05TtS8mbWiLH2Zvfb30EQ/es1pcaBt1m1s1F1l7UIWM3GV4F
 OHXi2XDyHg76pYAp7GHR2F29GzcI8OdLjM/pE3LuV6hS2Q6lHZ/BrT9pvtU0Hppk/W3MF+UKfJco4
 0dsSk7vEHlo4MAS1x1Pn1eFy5biJUdFj1G1uQnmK3HkDIClD3E1U1yZ1F3frsv2stgMbmuwMuQUVZ
 ++nnOqYXrUucpkb6wqgcFsJBaGiD7w8zptDtvNaXzD17Vg8+mgzHrcE8ZhM76cZV/kf29fIIhj2UG
 grilV97XqqCEyDLizDi7ea28SSbY6JJihjfjdnU9knsOBlf4HN79VxVA1eT923pTD7CJ38OXSKNYv
 iRiqyrEpy7YoHQHYo9bdBOGXJcl+9kaDHTxvtF18M=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jYc-00037t-W0; Fri, 24 Jun 2022 14:41:13 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:33 +0100
Message-Id: <20220624134109.881989-19-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 18/54] pckbd: checkpatch fixes
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
---
 hw/input/pckbd.c | 150 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 97 insertions(+), 53 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 45c40fe3f3..c18a1a7fae 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -39,49 +39,86 @@
 
 #include "trace.h"
 
-/*	Keyboard Controller Commands */
-#define KBD_CCMD_READ_MODE	0x20	/* Read mode bits */
-#define KBD_CCMD_WRITE_MODE	0x60	/* Write mode bits */
-#define KBD_CCMD_GET_VERSION	0xA1	/* Get controller version */
-#define KBD_CCMD_MOUSE_DISABLE	0xA7	/* Disable mouse interface */
-#define KBD_CCMD_MOUSE_ENABLE	0xA8	/* Enable mouse interface */
-#define KBD_CCMD_TEST_MOUSE	0xA9	/* Mouse interface test */
-#define KBD_CCMD_SELF_TEST	0xAA	/* Controller self test */
-#define KBD_CCMD_KBD_TEST	0xAB	/* Keyboard interface test */
-#define KBD_CCMD_KBD_DISABLE	0xAD	/* Keyboard interface disable */
-#define KBD_CCMD_KBD_ENABLE	0xAE	/* Keyboard interface enable */
-#define KBD_CCMD_READ_INPORT    0xC0    /* read input port */
-#define KBD_CCMD_READ_OUTPORT	0xD0    /* read output port */
-#define KBD_CCMD_WRITE_OUTPORT	0xD1    /* write output port */
-#define KBD_CCMD_WRITE_OBUF	0xD2
-#define KBD_CCMD_WRITE_AUX_OBUF	0xD3    /* Write to output buffer as if
-                                           initiated by the auxiliary device */
-#define KBD_CCMD_WRITE_MOUSE	0xD4	/* Write the following byte to the mouse */
-#define KBD_CCMD_DISABLE_A20    0xDD    /* HP vectra only ? */
-#define KBD_CCMD_ENABLE_A20     0xDF    /* HP vectra only ? */
-#define KBD_CCMD_PULSE_BITS_3_0 0xF0    /* Pulse bits 3-0 of the output port P2. */
-#define KBD_CCMD_RESET          0xFE    /* Pulse bit 0 of the output port P2 = CPU reset. */
-#define KBD_CCMD_NO_OP          0xFF    /* Pulse no bits of the output port P2. */
+/* Keyboard Controller Commands */
+
+/* Read mode bits */
+#define KBD_CCMD_READ_MODE         0x20
+/* Write mode bits */
+#define KBD_CCMD_WRITE_MODE        0x60
+/* Get controller version */
+#define KBD_CCMD_GET_VERSION       0xA1
+/* Disable mouse interface */
+#define KBD_CCMD_MOUSE_DISABLE     0xA7
+/* Enable mouse interface */
+#define KBD_CCMD_MOUSE_ENABLE      0xA8
+/* Mouse interface test */
+#define KBD_CCMD_TEST_MOUSE        0xA9
+/* Controller self test */
+#define KBD_CCMD_SELF_TEST         0xAA
+/* Keyboard interface test */
+#define KBD_CCMD_KBD_TEST          0xAB
+/* Keyboard interface disable */
+#define KBD_CCMD_KBD_DISABLE       0xAD
+/* Keyboard interface enable */
+#define KBD_CCMD_KBD_ENABLE        0xAE
+/* read input port */
+#define KBD_CCMD_READ_INPORT       0xC0
+/* read output port */
+#define KBD_CCMD_READ_OUTPORT      0xD0
+/* write output port */
+#define KBD_CCMD_WRITE_OUTPORT     0xD1
+#define KBD_CCMD_WRITE_OBUF        0xD2
+/* Write to output buffer as if initiated by the auxiliary device */
+#define KBD_CCMD_WRITE_AUX_OBUF    0xD3
+/* Write the following byte to the mouse */
+#define KBD_CCMD_WRITE_MOUSE       0xD4
+/* HP vectra only ? */
+#define KBD_CCMD_DISABLE_A20       0xDD
+/* HP vectra only ? */
+#define KBD_CCMD_ENABLE_A20        0xDF
+/* Pulse bits 3-0 of the output port P2. */
+#define KBD_CCMD_PULSE_BITS_3_0    0xF0
+/* Pulse bit 0 of the output port P2 = CPU reset. */
+#define KBD_CCMD_RESET             0xFE
+/* Pulse no bits of the output port P2. */
+#define KBD_CCMD_NO_OP             0xFF
 
 /* Status Register Bits */
-#define KBD_STAT_OBF 		0x01	/* Keyboard output buffer full */
-#define KBD_STAT_IBF 		0x02	/* Keyboard input buffer full */
-#define KBD_STAT_SELFTEST	0x04	/* Self test successful */
-#define KBD_STAT_CMD		0x08	/* Last write was a command write (0=data) */
-#define KBD_STAT_UNLOCKED	0x10	/* Zero if keyboard locked */
-#define KBD_STAT_MOUSE_OBF	0x20	/* Mouse output buffer full */
-#define KBD_STAT_GTO 		0x40	/* General receive/xmit timeout */
-#define KBD_STAT_PERR 		0x80	/* Parity error */
+
+/* Keyboard output buffer full */
+#define KBD_STAT_OBF           0x01
+/* Keyboard input buffer full */
+#define KBD_STAT_IBF           0x02
+/* Self test successful */
+#define KBD_STAT_SELFTEST      0x04
+/* Last write was a command write (0=data) */
+#define KBD_STAT_CMD           0x08
+/* Zero if keyboard locked */
+#define KBD_STAT_UNLOCKED      0x10
+/* Mouse output buffer full */
+#define KBD_STAT_MOUSE_OBF     0x20
+/* General receive/xmit timeout */
+#define KBD_STAT_GTO           0x40
+/* Parity error */
+#define KBD_STAT_PERR          0x80
 
 /* Controller Mode Register Bits */
-#define KBD_MODE_KBD_INT	0x01	/* Keyboard data generate IRQ1 */
-#define KBD_MODE_MOUSE_INT	0x02	/* Mouse data generate IRQ12 */
-#define KBD_MODE_SYS 		0x04	/* The system flag (?) */
-#define KBD_MODE_NO_KEYLOCK	0x08	/* The keylock doesn't affect the keyboard if set */
-#define KBD_MODE_DISABLE_KBD	0x10	/* Disable keyboard interface */
-#define KBD_MODE_DISABLE_MOUSE	0x20	/* Disable mouse interface */
-#define KBD_MODE_KCC 		0x40	/* Scan code conversion to PC format */
-#define KBD_MODE_RFU		0x80
+
+/* Keyboard data generate IRQ1 */
+#define KBD_MODE_KBD_INT       0x01
+/* Mouse data generate IRQ12 */
+#define KBD_MODE_MOUSE_INT     0x02
+/* The system flag (?) */
+#define KBD_MODE_SYS           0x04
+/* The keylock doesn't affect the keyboard if set */
+#define KBD_MODE_NO_KEYLOCK    0x08
+/* Disable keyboard interface */
+#define KBD_MODE_DISABLE_KBD   0x10
+/* Disable mouse interface */
+#define KBD_MODE_DISABLE_MOUSE 0x20
+/* Scan code conversion to PC format */
+#define KBD_MODE_KCC           0x40
+#define KBD_MODE_RFU           0x80
 
 /* Output Port Bits */
 #define KBD_OUT_RESET           0x01    /* 1=normal mode, 0=reset */
@@ -89,7 +126,8 @@
 #define KBD_OUT_OBF             0x10    /* Keyboard output buffer full */
 #define KBD_OUT_MOUSE_OBF       0x20    /* Mouse output buffer full */
 
-/* OSes typically write 0xdd/0xdf to turn the A20 line off and on.
+/*
+ * OSes typically write 0xdd/0xdf to turn the A20 line off and on.
  * We make the default value of the outport include these four bits,
  * so that the subsection is rarely necessary.
  */
@@ -133,8 +171,10 @@ typedef struct KBDState {
     hwaddr mask;
 } KBDState;
 
-/* XXX: not generating the irqs if KBD_MODE_DISABLE_KBD is set may be
-   incorrect, but it avoids having to simulate exact delays */
+/*
+ * XXX: not generating the irqs if KBD_MODE_DISABLE_KBD is set may be
+ * incorrect, but it avoids having to simulate exact delays
+ */
 static void kbd_update_irq_lines(KBDState *s)
 {
     int irq_kbd_level, irq_mouse_level;
@@ -302,21 +342,23 @@ static void kbd_write_command(void *opaque, hwaddr addr,
 
     trace_pckbd_kbd_write_command(val);
 
-    /* Bits 3-0 of the output port P2 of the keyboard controller may be pulsed
+    /*
+     * Bits 3-0 of the output port P2 of the keyboard controller may be pulsed
      * low for approximately 6 micro seconds. Bits 3-0 of the KBD_CCMD_PULSE
      * command specify the output port bits to be pulsed.
      * 0: Bit should be pulsed. 1: Bit should not be modified.
      * The only useful version of this command is pulsing bit 0,
      * which does a CPU reset.
      */
-    if((val & KBD_CCMD_PULSE_BITS_3_0) == KBD_CCMD_PULSE_BITS_3_0) {
-        if(!(val & 1))
+    if ((val & KBD_CCMD_PULSE_BITS_3_0) == KBD_CCMD_PULSE_BITS_3_0) {
+        if (!(val & 1)) {
             val = KBD_CCMD_RESET;
-        else
+        } else {
             val = KBD_CCMD_NO_OP;
+        }
     }
 
-    switch(val) {
+    switch (val) {
     case KBD_CCMD_READ_MODE:
         kbd_queue(s, s->mode, 0);
         break;
@@ -409,7 +451,7 @@ static void kbd_write_data(void *opaque, hwaddr addr,
 
     trace_pckbd_kbd_write_data(val);
 
-    switch(s->write_cmd) {
+    switch (s->write_cmd) {
     case 0:
         ps2_write_keyboard(s->kbd, val);
         /* sending data to the keyboard reenables PS/2 communication */
@@ -607,7 +649,7 @@ static const VMStateDescription vmstate_kbd = {
         VMSTATE_UINT8(pending_tmp, KBDState),
         VMSTATE_END_OF_LIST()
     },
-    .subsections = (const VMStateDescription*[]) {
+    .subsections = (const VMStateDescription * []) {
         &vmstate_kbd_outport,
         &vmstate_kbd_extended_state,
         NULL
@@ -619,10 +661,11 @@ static uint64_t kbd_mm_readfn(void *opaque, hwaddr addr, unsigned size)
 {
     KBDState *s = opaque;
 
-    if (addr & s->mask)
+    if (addr & s->mask) {
         return kbd_read_status(s, 0, 1) & 0xff;
-    else
+    } else {
         return kbd_read_data(s, 0, 1) & 0xff;
+    }
 }
 
 static void kbd_mm_writefn(void *opaque, hwaddr addr,
@@ -630,10 +673,11 @@ static void kbd_mm_writefn(void *opaque, hwaddr addr,
 {
     KBDState *s = opaque;
 
-    if (addr & s->mask)
+    if (addr & s->mask) {
         kbd_write_command(s, 0, value & 0xff, 1);
-    else
+    } else {
         kbd_write_data(s, 0, value & 0xff, 1);
+    }
 }
 
 
-- 
2.30.2


