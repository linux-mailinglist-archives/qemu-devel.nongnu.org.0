Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BDE56018E
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 15:41:57 +0200 (CEST)
Received: from localhost ([::1]:38084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Xx3-0007EH-7D
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 09:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1e-0001o3-OJ; Wed, 29 Jun 2022 08:42:34 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1d-0005Uv-4Z; Wed, 29 Jun 2022 08:42:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zLObqLwS/7sla7asfLaB79nnQfQa8AjCHf2Xw3jAXWQ=; b=Nh7tqmhkb2uoj8UnogkTAkGfZn
 QzG+rha1SjDfm31gH8K8MsoBGtQh1m7Vlw30JdQd/PUbTEV+T93vwqhpdVVLvEXfOF0jSDncRiYIQ
 kA/r3Zdg9ahgZRZJmbRwCCHH/5KMffWBBCx+x6Tmv2p8xmsztxXJlqRtsIFiAk2BLt1eHQhXlzvb0
 Qiq7g9K4B4SJkfK7xhpOXujtNuPZaA/cp3dI0hnvBWDElpAkFB7jh/YKmae9HylW0QQWNSv404jc1
 1TB0vbyd7jYTmCUv+vd0rW1VBYBs6mM59X90TVZD73HfsNPGrSXk2DqOSolug72wgvUHjats4tb1/
 7eLBFPXtxmlR5yzYusZGq97xcioz/LQEPXHI0d/ZWdaKaT/mFsZkRoQ2MnQkRPzBWHbhjCydbgALH
 6z+BZydYwORu9O1pnP3QqV3GDbx5OHwBBu2CukZ2d+3CqmxY0PjAHtGz2aEJ9aRqKXhGWUgFgXRaJ
 AthFXGEuj8cPMMG9H/7mwZDcuX39dK9wd+YCupO1sfVeKWjSlLHiZR8wiAn/eZC6dYbGk3ss5s9xA
 u5XVK/j52XBWgdNojo3H2tvDc95yYHZZP7N3tpKubqowQ2PAjk9kI5yDkX67h4ysUpTcVGd4iBjOE
 R9oLLFB4Oc0/Ay2Kcrg6wwMy6+6MJk0Pjkc5wJHAQ=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wzx-0002tZ-Th; Wed, 29 Jun 2022 13:40:54 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:40:25 +0100
Message-Id: <20220629124026.1077021-40-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 39/40] ps2: remove unused legacy ps2_mouse_init() function
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

Now that the legacy ps2_mouse_init() function is no longer used, it can be completely
removed along with its associated trace-event.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/ps2.c         | 13 -------------
 hw/input/trace-events  |  1 -
 include/hw/input/ps2.h |  1 -
 3 files changed, 15 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 5b1728ef02..05cf7111e3 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -1236,19 +1236,6 @@ static void ps2_mouse_realize(DeviceState *dev, Error **errp)
     qemu_input_handler_register(dev, &ps2_mouse_handler);
 }
 
-void *ps2_mouse_init(void)
-{
-    DeviceState *dev;
-    PS2MouseState *s;
-
-    dev = qdev_new(TYPE_PS2_MOUSE_DEVICE);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    s = PS2_MOUSE_DEVICE(dev);
-
-    trace_ps2_mouse_init(s);
-    return s;
-}
-
 static void ps2_kbd_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
diff --git a/hw/input/trace-events b/hw/input/trace-events
index df998d13eb..29001a827d 100644
--- a/hw/input/trace-events
+++ b/hw/input/trace-events
@@ -41,7 +41,6 @@ ps2_mouse_fake_event(void *opaque) "%p"
 ps2_write_mouse(void *opaque, int val) "%p val %d"
 ps2_kbd_reset(void *opaque) "%p"
 ps2_mouse_reset(void *opaque) "%p"
-ps2_mouse_init(void *s) "%p"
 
 # hid.c
 hid_kbd_queue_full(void) "queue full"
diff --git a/include/hw/input/ps2.h b/include/hw/input/ps2.h
index 18fd10cc75..ff777582cd 100644
--- a/include/hw/input/ps2.h
+++ b/include/hw/input/ps2.h
@@ -98,7 +98,6 @@ struct PS2MouseState {
 OBJECT_DECLARE_SIMPLE_TYPE(PS2MouseState, PS2_MOUSE_DEVICE)
 
 /* ps2.c */
-void *ps2_mouse_init(void);
 void ps2_write_mouse(PS2MouseState *s, int val);
 void ps2_write_keyboard(PS2KbdState *s, int val);
 uint32_t ps2_read_data(PS2State *s);
-- 
2.30.2


