Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D89572977
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:48:16 +0200 (CEST)
Received: from localhost ([::1]:59652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBOfv-0006pz-IB
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNrB-00051o-2R; Tue, 12 Jul 2022 17:55:49 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNr8-0008Hn-BY; Tue, 12 Jul 2022 17:55:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=twL062T9ok65ODDxZgLpwO6rmQAEkTiVC/BWTXx9GiU=; b=idlixx47hzsGWt0YDeacJDWB44
 C12xdrITcZZGz8hgaT+s6tu9+l0IePgc+LwtTVdZ+/dztRRpT3n/ae8H7SmsnXRdXWVfdXYiZKfXO
 ITWrfm7WcNsyrUgpQVvNEq2Jt2OlcV5n+U4LIIFlqWCzZv5xLtGyKH8HL9RzHa/3NbmDndqpJaEQz
 WdlJjeu9Ouxlqur6jZUmBryH0/CLaO+vHTJeloGmdc1ILW3uTVAh5947BMKDMrVsCTh2X1RHj9sIs
 aacatrPvP8Cj409GuBKDntG67pautA6Oaygzgzl8eOOWe+lGTBqRptWlzmy8QirYY2pU4llMzDS4R
 +JYt822hpwScZqOtGsf6kkGmCMtmqxUNxSuD0p6EFFm4lm9KhJcq5o7DK/noEjG9UaRBwWttAvJpL
 EyaUh89SqMMUe+tHIIAeQn7FZlHcJKzC9ElZum3cCgBiiIvFqI/DaeJEClNBSdN4/RrhqhU0jjljp
 /O1b7NJmw2eJ47MIvJ8WIvsk5GmoPwgHcNEaGB0OVnRPynBx0E4Q+ZQFQyGslkQZadQPNFS87kbWw
 eBfn6nPqtOQi8eivGFv4Ryy6GlZUdmhOERsf7lNKkEWhsCQ4ejAqkRyclIpMBS6wB+AynDsCc++en
 g80+7IWz3w6S4HJi2U26FEhS3LwfQzJnRWetNpYAQ=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNpP-000Bqt-AX; Tue, 12 Jul 2022 22:54:03 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:50 +0100
Message-Id: <20220712215251.7944-40-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 39/40] ps2: remove unused legacy ps2_mouse_init() function
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


