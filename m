Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD346530563
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 21:14:08 +0200 (CEST)
Received: from localhost ([::1]:35912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsr1j-0003Q6-Id
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 15:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqC8-0008PE-EC; Sun, 22 May 2022 14:20:48 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqC2-0003rn-J7; Sun, 22 May 2022 14:20:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q1mWXyKVm23D9a+kIqZwF+SZSIhBaIkVTJQEp4eeW1I=; b=U782SKjSuYvkNsiEguE9+rIq4C
 EiFKPj7cE51zn6VHlMYsUFC7m2ocQIX3JI+GtB0muUEYLmS/c7yWzT5AkhWdlYvOqVg4dTKOW00Ru
 Sd3KcyBhKap7XEOKrGXu59T+zPfuPnllpfGNIsIeas/K653NmWEeOIoKbkk4hcZlNf3LFE4MGe8jZ
 J0lTc2YkL/S+jYmPbysm1xQFfs8xLyQPmMDA6vgZoHciCm2AJb3l83TA4nX5g+7odkgAiaWFN5ubA
 whQwoJetUrVHR72dyjLWcRF8rUt2NjE7BKrRwEIra4WllY5nhNUIHcSQ3lJ8bgL2YeHXZVyMLe64T
 ZBVhk7OGYkO4QPxREt7S4CzEA/VNh2KNyECM+vz6vm97KRyGqf5DA57/n14KUNnFrm0ulT1K7j4Kd
 QhbwudJwlrHd4gtfLNDXwi3g/m+VU6y6+vRPJKDtFh0yj0peBAvkexx2BNnbMM6JXA7NrjETozYoZ
 2o2Ux+m2Fd3uP6ONSZxlBm54D34zYLxEIQJ4fkwpUtEtMxDVdXrZdyiaMLZB7oQxj3AZAc9aigBQ4
 XfkB8wqUKZDW0oCxN9MbYaga7g2E8zXVWuftFlSJirPpYoJRO+Nw88wA5/hkD83sDxbfqhzzvlcm+
 936woTsJ4gr2SYCC50Bw/D9u57KPpRCZVXMl58dMg=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAZ-0007pH-PC; Sun, 22 May 2022 19:19:15 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:24 +0100
Message-Id: <20220522181836.864-39-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 38/50] lasips2: move lasips2 QOM types from lasips2.c to
 lasips2.h
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

This allows the QOM types in lasips2.c to be used elsewhere by simply including
lasips2.h.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c         | 23 -----------------------
 include/hw/input/lasips2.h | 22 ++++++++++++++++++++++
 2 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index db0a791e6c..2caa80bd3c 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -35,29 +35,6 @@
 #include "qapi/error.h"
 
 
-struct LASIPS2State;
-typedef struct LASIPS2Port {
-    struct LASIPS2State *parent;
-    MemoryRegion reg;
-    void *dev;
-    uint8_t id;
-    uint8_t control;
-    uint8_t buf;
-    bool loopback_rbne;
-    bool irq;
-} LASIPS2Port;
-
-struct LASIPS2State {
-    SysBusDevice parent_obj;
-
-    LASIPS2Port kbd;
-    LASIPS2Port mouse;
-    qemu_irq irq;
-};
-
-#define TYPE_LASIPS2 "lasips2"
-OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2State, LASIPS2)
-
 static const VMStateDescription vmstate_lasips2 = {
     .name = "lasips2",
     .version_id = 0,
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 0cd7b59064..ddcea74c14 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -8,8 +8,30 @@
 #define HW_INPUT_LASIPS2_H
 
 #include "exec/hwaddr.h"
+#include "hw/sysbus.h"
+
+struct LASIPS2State;
+typedef struct LASIPS2Port {
+    struct LASIPS2State *parent;
+    MemoryRegion reg;
+    void *dev;
+    uint8_t id;
+    uint8_t control;
+    uint8_t buf;
+    bool loopback_rbne;
+    bool irq;
+} LASIPS2Port;
+
+struct LASIPS2State {
+    SysBusDevice parent_obj;
+
+    LASIPS2Port kbd;
+    LASIPS2Port mouse;
+    qemu_irq irq;
+};
 
 #define TYPE_LASIPS2 "lasips2"
+OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2State, LASIPS2)
 
 void lasips2_init(MemoryRegion *address_space, hwaddr base, qemu_irq irq);
 
-- 
2.20.1


