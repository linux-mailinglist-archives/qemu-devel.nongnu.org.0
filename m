Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 936D4572937
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:23:02 +0200 (CEST)
Received: from localhost ([::1]:46038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBOHV-0002ht-Mu
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqX-0004MR-Jw; Tue, 12 Jul 2022 17:55:09 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqW-0007xb-10; Tue, 12 Jul 2022 17:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iTIHgjHlmwkpWFiraU206yHGQd4ocrUAS/TSRUnAMeM=; b=qg2Fqoo6JATBGCK5Q66/yElTZx
 r6aA4Q+UQ+ASj01dA8xvrbFtWQ7JzcIZ9xmfzDutdJRS7Tkhm7cluhNolEYL3DZAvdhgcYIL6/H/D
 iFj8FDYQZaxJ1aNbnWN9Decw3FqoZKsOMgS0vq3S677SCGHg5UFYtyCTJJV8OASHQhjpv477eGpJy
 hJ5Gq/6QMHGNe92Se+lENikcvUsWfW34l4lfuASxoD/g2IXdWJGT8GotvaiOw0LiRY/EeJNK8wj9/
 uZq1EIAs/PRfpkggi/C/pM3TGQ1JDsq1Rf3jlVsOzo2VRIElr6YjxlAzyLbPJ++VJIJzGB0tb6buW
 wqi4hQ5u99oOXnH3vnx8hN2mjcEgic5QW3KBimEbcRUVWdoZ7Bdl1mF/C2kI9d+/4LYsww48ASBIH
 MdAG3HW2yjMxYbfGDkm4Vq/iE1G+UCmAkjoC2tEu3cJ6u6tN7ns6rthTCbPBYxoC4HGWwQ7feXw4W
 a34vNTMNjyeIpo172StI9KMUCVbfrgLbH01ISIhWr5150wa/gJd4Kzxhciw3iziXUCfz3INF9Njva
 1ImObwgO7PYfKyWHTPQlBN4CNWWO/AtzxyX65dTRqEcg2D59wBuKNJ2Pi4bob6S3XcNy+g+3+e26n
 eKVzrUTiVUoWtH6FJ508cEbIZncFXuPKj4NELMa2c=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNon-000Bqt-5p; Tue, 12 Jul 2022 22:53:24 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:40 +0100
Message-Id: <20220712215251.7944-30-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 29/40] lasips2: rename LASIPS2Port parent pointer to lasips2
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

This makes it clearer that the pointer is a reference to the LASIPS2 container
device rather than an implied part of the QOM hierarchy.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/lasips2.c         | 6 +++---
 include/hw/input/lasips2.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 5ceb38c1af..0f392e2bee 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -222,7 +222,7 @@ static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
             }
         }
 
-        if (port->parent->int_status) {
+        if (port->lasips2->int_status) {
             ret |= LASIPS2_STATUS_CMPINTR;
         }
         break;
@@ -368,7 +368,7 @@ static void lasips2_kbd_port_init(Object *obj)
     memory_region_init_io(&lp->reg, obj, &lasips2_reg_ops, lp, "lasips2-kbd",
                           0x100);
     lp->id = 0;
-    lp->parent = container_of(s, LASIPS2State, kbd_port);
+    lp->lasips2 = container_of(s, LASIPS2State, kbd_port);
 }
 
 static void lasips2_kbd_port_class_init(ObjectClass *klass, void *data)
@@ -405,7 +405,7 @@ static void lasips2_mouse_port_init(Object *obj)
     memory_region_init_io(&lp->reg, obj, &lasips2_reg_ops, lp, "lasips2-mouse",
                           0x100);
     lp->id = 1;
-    lp->parent = container_of(s, LASIPS2State, mouse_port);
+    lp->lasips2 = container_of(s, LASIPS2State, mouse_port);
 }
 
 static void lasips2_mouse_port_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 7199f16622..9fe9e63a66 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -37,7 +37,7 @@ typedef struct LASIPS2State LASIPS2State;
 struct LASIPS2Port {
     DeviceState parent_obj;
 
-    LASIPS2State *parent;
+    LASIPS2State *lasips2;
     MemoryRegion reg;
     PS2State *ps2dev;
     uint8_t id;
-- 
2.30.2


