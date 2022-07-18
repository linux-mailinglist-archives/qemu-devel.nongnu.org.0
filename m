Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6E15789AA
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 20:40:28 +0200 (CEST)
Received: from localhost ([::1]:47026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDVfO-0005rb-P1
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 14:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZB-0007pa-Pl
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:34:01 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZA-0005WG-9r
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:34:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dTijwKG5W8z5uCTtDSUU5DZQU2CZ45SFe9y4iXV1cCQ=; b=Ch7L3XRKHzGr2QrwPDlxD/7Drg
 SqArirdkoFNo+rwMDebNHgB/mCBoVu/5Kcq8smE2y/r1dNBRBoZ59DzjO5iPfXJvtDAuViyOXZcDW
 kGxwZM1b/1BgkaBoqM/0IPZq0aI6Ei4D87Bwez0X3oLrGCTfNbFzgWxYYMM3FBvN2wZTHetwC7Cnl
 ebXNq44oEekqAvDxmMUeit6s0hRVAUhP87wrqgR3ZP8rhQygbpVjJBE0RayU2Zia7h7vnmKoCI0xY
 d/Ge3L2sqn8v9ZPC4WUHF0ry0QgxiqpoPgYsdtQAUaGH3CAGNxgpKm2O3tW3uS3qhHuiF5IS2NJTy
 bxDFrHJDWJKj6QQKvp+tYqHJ5RmB+aKGWiKNj3mTL7BcvkeM9uYJ0Lqh58DIm/ZIJSBDhniKSbVKK
 6blK97PozrU/HVZq18s+QAWUHVfIdyPjfzPm2jgd5ainln8dluKKg512vei8WHro1K6z4jYHbP9E9
 KKNQXRPXjxAa+vpUva8F7gBC/6XFZqMBGUC5C7+8z1Y3KvHNn6XPE+515bicZc7sDwt9YZQFOousO
 aBbg6k+QY2jfYH08+/Ra6rmUxtQBBl5S45DdH12A0C/g5Dfiqz79EsCt3LNS3r0RQ+rHLbtS83zGg
 W+wwLZrNyNvRrqoPBwXXRgN3PHj5aqT8GKRIh4UBg=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVXo-000B51-RD; Mon, 18 Jul 2022 19:32:40 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:01 +0100
Message-Id: <20220718183339.124253-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 02/40] pl050: rename pl050_keyboard_init() to pl050_kbd_init()
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

This is for consistency with all of the other devices that use the PS2 keyboard
device.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220712215251.7944-3-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/pl050.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index c7980b6ed7..8e32b8ed46 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -166,7 +166,7 @@ static void pl050_realize(DeviceState *dev, Error **errp)
                           qdev_get_gpio_in_named(dev, "ps2-input-irq", 0));
 }
 
-static void pl050_keyboard_init(Object *obj)
+static void pl050_kbd_init(Object *obj)
 {
     PL050State *s = PL050(obj);
 
@@ -183,7 +183,7 @@ static void pl050_mouse_init(Object *obj)
 static const TypeInfo pl050_kbd_info = {
     .name          = "pl050_keyboard",
     .parent        = TYPE_PL050,
-    .instance_init = pl050_keyboard_init,
+    .instance_init = pl050_kbd_init,
 };
 
 static const TypeInfo pl050_mouse_info = {
-- 
2.30.2


