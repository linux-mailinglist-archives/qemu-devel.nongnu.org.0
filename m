Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8B8572914
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:14:16 +0200 (CEST)
Received: from localhost ([::1]:49570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBO8z-00028o-QC
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNr3-0004td-Da; Tue, 12 Jul 2022 17:55:41 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqz-0008C6-HV; Tue, 12 Jul 2022 17:55:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I5fm0ZKgqrDzLLOWhbHIgpfeFsWCmLDzBV0AoVbiqAA=; b=W7Rk3bcQPYMcBPpBdat15cDwqe
 7WInAeJL3hefxe+d79gJW34MRpdVHglS/2m1czbsgUdA1gxFzgz9RofKyRhQTdbY2RS9pHwflZvN2
 yHjE3T6HHTYKEXVSEuQtCm0j7Uo68/EHUMxlHExZKXP6MtF6wbYBoLE7VnVxqXY1cVome0Vn0p0KL
 AK97PdAfoUYw9Jo20gBd412ZvpDmvsReJ4KBWkAxm11ocA4NxyHK+4hrYIa+hYTmFtj70nIjwUy6t
 z8zWIXPktWmmOk7Aw5LVUityzx+Yk8f/4Xvbe+f3YxJM+1ZFJ91etkn2xpsHDUPBIw51nhSaygC6e
 kfowRiO3SwsvHEBaC2GrL8Bux10KI798JXxbf7GA5Ir5d7tikh/DPC1r+HXiAEAMHmR8vIy4Dr7Z6
 pfUYShnFkzwXkyO1acPiINlEZlveczI4fe9U/7poGT5H2wdA/tKVnQR2uOIzSy1pAuoOI/jo+UwFx
 81OJ/3ZfKI9EOFg1zqym8Cr08JT52NmcMdzzLyebXOZbPITwACRFIDGg7siczscPqk/YP0a5Dv+eX
 IKrhj0PKMj5rFtyKY55ZqfWiC5XDmnyNCyhvbzzcl/cspQ8T99kd0ebA9zNqrugH1CD9cqwGo57IX
 30A64V8gFFhlWPbthXGJwWt7I3vb1rDkRhbgVKmgk=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNpH-000Bqt-CN; Tue, 12 Jul 2022 22:53:54 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:48 +0100
Message-Id: <20220712215251.7944-38-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 37/40] ps2: remove unused legacy ps2_kbd_init() function
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
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


