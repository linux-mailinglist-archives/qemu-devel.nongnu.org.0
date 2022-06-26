Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5048055B35C
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 20:06:57 +0200 (CEST)
Received: from localhost ([::1]:59222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5Weu-0001KQ-D4
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 14:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WLY-0003ER-O9
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:46:56 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WLX-0008QZ-6P
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:46:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T0/8kru0KvAIppaEYfijXCOmacMiTEBKpJSz+cHMFJg=; b=Ugl0XrLiXSfyagBmFBdLgh6zs6
 ZEl/41z/7LpOfrE3jsSZ5VUPSKRySQBR8k9jC6iNkVZm4Ope/YjtfhjSioYg0VOB95ZTJ73qvPPZ7
 rs2GMhmQmTnpD7G4ZYdvYnokewowjT2UWB94s4+c1KExiVZgrlM71wSeTgubBeNYtc8r1EfoaVdX+
 M3lO28QnLYC6Qkc/863PzYdm2PuAhHWo6rYoP1lLmNEwu0mhyJeINy50Zc7w1WBMn5QAD3fE/XHyH
 js0ut6ZUXCx0wJ24HgYGq/UgsX6QHJhO30OmX/e2yT5C6julRi1ODVE7Q6rncLBVV4DDG7UDORDDD
 xW0FJnIXnU1HU/vYKzpu/l32n2A9z/w30qaG/TCOy0ZzCiZZxRRKLsM19bYEKY150y2ChoGK3Ee6E
 zkmr5yQZdaLRbG1YiRjbYLx276SYxqVNpySR097U6wEXSpWS3xdU3Ywt7dnYnaFhJ6BKDYk8NFRrz
 1Q9luCMH+4ChAefs7YederFODpg0J1D2R563x/VDZI/pwz1DjOMP80wEOhYgYjGLk/q+Ig3uyA5e/
 YTdNLT6Zh9/WXAI6ZukLuOf9e5fnZ539q3w24Qswbx7LmY2e8GagmPMHwh6mOUe/FGh0CWaUSe0hO
 HZnzskKxf3072vhFqHH/9/LYudUjIXLmvWjmlrzpU=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WK9-0007KY-24; Sun, 26 Jun 2022 18:45:33 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:44:53 +0100
Message-Id: <20220626174531.969187-18-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 17/55] lasips2: rename ps2dev_update_irq() to
 lasips2_port_set_irq()
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

This better reflects that the IRQ input opaque is a LASIPS2Port structure
and not a PS2_DEVICE.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Helge Deller <deller@gmx.de>
Message-Id: <20220624134109.881989-18-mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 2ac3433014..adfde1684f 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -253,7 +253,7 @@ static const MemoryRegionOps lasips2_reg_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void ps2dev_update_irq(void *opaque, int level)
+static void lasips2_port_set_irq(void *opaque, int level)
 {
     LASIPS2Port *port = opaque;
 
@@ -275,8 +275,8 @@ void lasips2_init(MemoryRegion *address_space,
 
     vmstate_register(NULL, base, &vmstate_lasips2, s);
 
-    s->kbd.dev = ps2_kbd_init(ps2dev_update_irq, &s->kbd);
-    s->mouse.dev = ps2_mouse_init(ps2dev_update_irq, &s->mouse);
+    s->kbd.dev = ps2_kbd_init(lasips2_port_set_irq, &s->kbd);
+    s->mouse.dev = ps2_mouse_init(lasips2_port_set_irq, &s->mouse);
 
     memory_region_init_io(&s->kbd.reg, NULL, &lasips2_reg_ops, &s->kbd,
                           "lasips2-kbd", 0x100);
-- 
2.30.2


