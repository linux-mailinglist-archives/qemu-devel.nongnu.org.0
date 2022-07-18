Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 774EB578AA7
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 21:26:24 +0200 (CEST)
Received: from localhost ([::1]:39572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDWNk-0008SO-KE
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 15:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVbk-0002KS-0b
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:36:40 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVbh-000628-9R
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:36:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u3cNEbsPRXS9tXtrXVikpiC/SSAdKb6BGhboPI7uAVs=; b=PrAIGRTnlSz7T48E7P55jwf9I5
 CwlrFBIVOdwkfio4eM7cumGf4xpGz9EpsE+i3lsVm1P8Fa7jmuj/PlSz8FUYJuSO1xtPrbTnP8uJO
 Nyy7i5d3zes6Nc8v5hxr6etiNxc7P6f/SjoQ9IN32q524gHMtYH1yoCWOlwAzelDy+kWgccnGNN2q
 Hxkah4AuzHUMqUSJ3Hcte4QNJLzIK3+t20sh+JQWpddYg+lrgytqFsMlvh+z8j/MvxJAbE2B1xdFp
 OkKVQBI5v+8lwQfkzCUSkNYnPdUT1c68xsQ+/bzkVzKJCgziYr7qROgonYJfAd5MHGXtQez0x6Fg0
 BI/6TDfUDxmcaYt0DowITUgWQj4bXIaxyoveaW5I6+6Zw8wLrDlyQXJI3Er/nDLCjBZh+dWN1dBLb
 jxfnWS80aWk+gbO/q0+fFnbsEyO2l6UYn6agVd51HRuOr0VwejLEoJc2k+I8jbI4wa0ZKrPbqQJA0
 HgTfzQruP+poyHDn3fMEKiqMGl8+yCqUjIoU4XJ5+/GjujDQz0ZAK1YLDAMHXGwJRmjGHg/AjZwZZ
 OPpvSR6q4Rq1REdTOe02pKr+HeUDk/0eOrqj4758xEImzNC95R82PR3GsXSO6IWhxcdYfpAZNlsqL
 f4svYeVgNJwQC8NKZIZTrsUciB8OKI6YgEKoxqGS0=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVaB-000B51-WE; Mon, 18 Jul 2022 19:35:08 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:38 +0100
Message-Id: <20220718183339.124253-40-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 39/40] ps2: remove unused legacy ps2_mouse_init() function
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
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220712215251.7944-40-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


