Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D65E55601BB
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 15:53:08 +0200 (CEST)
Received: from localhost ([::1]:59398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Y7v-0005gF-Ey
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 09:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1U-0001Ma-Gv; Wed, 29 Jun 2022 08:42:24 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1S-0005IF-UC; Wed, 29 Jun 2022 08:42:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HSKpiIvSIuW6hPkBrgEwAcnGpKHNg9JW0sGOT9eVK/A=; b=E9rIiBv5pcFwsALp801zjVrSDb
 MOAoa6GU2JV4UUuF5QLV6JjVDAFInEXGx6LGS5j3+9MQE4zWOEo3CEjDwLHX5gPdGGnaFFCzkC5Wq
 l37HGWVq9PIgvMFcLMvTG64eIgLxTXvRqtUU8RiXoFHzycDjlr9f3aetGDljlY7vm7hvf4S2fqoym
 t+5OFmMXYJhetb+9N4/cUNcmmFEVVYGXq8snIsqA2H41lRw+kXQ2cwzNgcx7OzSXlKaaDM59991XZ
 3tAXSSyw7cTC4FnkjveotnjdnO8MaI8e6s7I9OVBcSw7+I7W+M4/i0nBrnaX0Xvi8ISuUKGb9hTE3
 PNmE+oXTDZ9wI+EO2ldLINGCB+LCR2IPcEOhwAmdrDbrD/bb1hF1awphCWZYf6sO403UYOd9TtXpl
 n91z0d79iV0pXTI+wWaey/y59XZbS/G74bf8aWs/ajwSYuMLg76/vGcB/X4mUiqML/7A8r0x68FPK
 UC3LTwtnYyFmj0LShfM+2/nE1t7W/Fno9krd8aY6Y7LgSM+SlZVLDXVTebZL95oz/MToTNUWwG6PN
 0wrUOJ6cWdAK2HzmYj4Md0AZE1PLIw9NrjT/jiXflntGv2HnLV7/4t+ZL+uNNXS39ok+unX+qJOJf
 P42zb/fkPT4GSNG4Hn36DXuLbjvTVHl8S2vGLnls4=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wzt-0002tZ-1p; Wed, 29 Jun 2022 13:40:45 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:40:23 +0100
Message-Id: <20220629124026.1077021-38-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 37/40] ps2: remove unused legacy ps2_kbd_init() function
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

Now that the legacy ps2_kbd_init() function is no longer used, it can be completely
removed along with its associated trace-event.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/ps2.c         | 13 -------------
 hw/input/trace-events  |  1 -
 include/hw/input/ps2.h |  1 -
 3 files changed, 15 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 59bac28ac8..5b1728ef02 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -1224,19 +1224,6 @@ static void ps2_kbd_realize(DeviceState *dev, Error **errp)
     qemu_input_handler_register(dev, &ps2_keyboard_handler);
 }
 
-void *ps2_kbd_init(void)
-{
-    DeviceState *dev;
-    PS2KbdState *s;
-
-    dev = qdev_new(TYPE_PS2_KBD_DEVICE);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    s = PS2_KBD_DEVICE(dev);
-
-    trace_ps2_kbd_init(s);
-    return s;
-}
-
 static QemuInputHandler ps2_mouse_handler = {
     .name  = "QEMU PS/2 Mouse",
     .mask  = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_REL,
diff --git a/hw/input/trace-events b/hw/input/trace-events
index e0bfe7f3ee..df998d13eb 100644
--- a/hw/input/trace-events
+++ b/hw/input/trace-events
@@ -41,7 +41,6 @@ ps2_mouse_fake_event(void *opaque) "%p"
 ps2_write_mouse(void *opaque, int val) "%p val %d"
 ps2_kbd_reset(void *opaque) "%p"
 ps2_mouse_reset(void *opaque) "%p"
-ps2_kbd_init(void *s) "%p"
 ps2_mouse_init(void *s) "%p"
 
 # hid.c
diff --git a/include/hw/input/ps2.h b/include/hw/input/ps2.h
index a78619d8cb..18fd10cc75 100644
--- a/include/hw/input/ps2.h
+++ b/include/hw/input/ps2.h
@@ -98,7 +98,6 @@ struct PS2MouseState {
 OBJECT_DECLARE_SIMPLE_TYPE(PS2MouseState, PS2_MOUSE_DEVICE)
 
 /* ps2.c */
-void *ps2_kbd_init(void);
 void *ps2_mouse_init(void);
 void ps2_write_mouse(PS2MouseState *s, int val);
 void ps2_write_keyboard(PS2KbdState *s, int val);
-- 
2.30.2


