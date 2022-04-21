Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F19509ECB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:39:34 +0200 (CEST)
Received: from localhost ([::1]:43062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhV9p-00084N-Ct
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUq3-00038H-1g
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:07 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:40521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUq0-0003VP-Ti
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:06 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso5635129wme.5
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+j9q4V2tfWLss3L7M8noxjW9hKFspam5EgiESVzgKr8=;
 b=qqHja5fhYrGXsGbPswB0HsAJx6HaUk3AKol4573I3LjVDja13GBsheEg0vvUdXTbIo
 gbTOojWYja759m0mkfWuE5RPBjuZdvXo0BqxMP9U/NnTr9ZLCsYqXe2AKJnLghppOBmn
 dmWEjCM9ab0LGWcHcE4prZ9XTVN7+UUtfBeJGIATW/+kFgdGx5DJHA91rjkx6Qd4zIeh
 jOgNpyJbi1u+VUkGF+cVKxacMTNT8vm5A6jSRCWHo9fvaFTfS2BtEbpDdO5a0lrAhl4A
 GeUljrjMcv9i4SdGkD/CE/lWU1WA0aY3H2dWFW8OZRFRj/OE+wN9iV2zBkf8Qk9LpjrW
 mWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+j9q4V2tfWLss3L7M8noxjW9hKFspam5EgiESVzgKr8=;
 b=UXZhDLaI1CES78gIc1riZMxA+ieDGHfdxVMhfTvdobrxBVTiGbrnTvfjnpPi8qHDG8
 Y3x+GhhDMBZKJStidjr8cnQ/eGaSxEtBhZINeo5L9C6oWLZagoE6eDi0B/1Aaa02yXYF
 CqtxJsMVU43ORnnN8+G2+BaxcCk4PmbOhN1GzCLk+H4l9Bu134eDPnQ+RW6f0aLpDcWG
 XUDfBTLluBgMwF8zfnU5BR/9PgTPf1h2AajC1LkMmodOl+YnwbwZ+21BIAOxjhoNbeUG
 yYAdptGunT3fphjNCz+kW5dzxA0Am625kB3UcFS4dBm3BYnEttage9aBdPXOGTTZoWZ2
 +8vQ==
X-Gm-Message-State: AOAM533B0v1Qxt8JLKeAsJPQ6sKDrx11DVRI+iFDPLfXL9MMpY/fe8AH
 3eRjMA5K6pVDV+A9vZlMAi/M1KihjJadPQ==
X-Google-Smtp-Source: ABdhPJzYGzrQQWtBJqesOnO4V4UiX8IQb6p3xs//Kbh08Cio76XVVr57h1D5YnW/1JqN//DpGr8Wng==
X-Received: by 2002:a05:600c:4f56:b0:392:4cd4:b161 with SMTP id
 m22-20020a05600c4f5600b003924cd4b161mr8238111wmq.178.1650539943498; 
 Thu, 21 Apr 2022 04:19:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.19.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:19:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/31] hw/arm/exynos4210: Move exynos4210_combiner_get_gpioin()
 into exynos4210.c
Date: Thu, 21 Apr 2022 12:18:32 +0100
Message-Id: <20220421111846.2011565-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The function exynos4210_combiner_get_gpioin() currently lives in
exynos4210_combiner.c, but it isn't really part of the combiner
device itself -- it is a function that implements the wiring up of
some interrupt sources to multiple combiner inputs.  Move it to live
with the other SoC-level code in exynos4210.c, along with a few
macros previously defined in exynos4210.h which are now used only
in exynos4210.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220404154658.565020-11-peter.maydell@linaro.org
---
 include/hw/arm/exynos4210.h   | 11 -----
 hw/arm/exynos4210.c           | 82 +++++++++++++++++++++++++++++++++++
 hw/intc/exynos4210_combiner.c | 77 --------------------------------
 3 files changed, 82 insertions(+), 88 deletions(-)

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index 08f52c511ff..b564e3582bb 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -67,11 +67,6 @@
 #define EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ   \
     (EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ * 8)
 
-#define EXYNOS4210_COMBINER_GET_IRQ_NUM(grp, bit)  ((grp)*8 + (bit))
-#define EXYNOS4210_COMBINER_GET_GRP_NUM(irq)       ((irq) / 8)
-#define EXYNOS4210_COMBINER_GET_BIT_NUM(irq) \
-    ((irq) - 8 * EXYNOS4210_COMBINER_GET_GRP_NUM(irq))
-
 /* IRQs number for external and internal GIC */
 #define EXYNOS4210_EXT_GIC_NIRQ     (160-32)
 #define EXYNOS4210_INT_GIC_NIRQ     64
@@ -118,12 +113,6 @@ void exynos4210_write_secondary(ARMCPU *cpu,
  *  bit - bit number inside group */
 uint32_t exynos4210_get_irq(uint32_t grp, uint32_t bit);
 
-/*
- * Get Combiner input GPIO into irqs structure
- */
-void exynos4210_combiner_get_gpioin(Exynos4210Irq *irqs, DeviceState *dev,
-        int ext);
-
 /*
  * exynos4210 UART
  */
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 5a41af089f9..86a9a0dae12 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -249,6 +249,11 @@ combiner_grp_to_gic_id[64 - EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][8] = {
     { }, { }, { }, { }, { }, { }, { }, { }, { }, { }
 };
 
+#define EXYNOS4210_COMBINER_GET_IRQ_NUM(grp, bit)  ((grp) * 8 + (bit))
+#define EXYNOS4210_COMBINER_GET_GRP_NUM(irq)       ((irq) / 8)
+#define EXYNOS4210_COMBINER_GET_BIT_NUM(irq) \
+    ((irq) - 8 * EXYNOS4210_COMBINER_GET_GRP_NUM(irq))
+
 /*
  * Initialize board IRQs.
  * These IRQs contain splitted Int/External Combiner and External Gic IRQs.
@@ -306,6 +311,83 @@ uint32_t exynos4210_get_irq(uint32_t grp, uint32_t bit)
     return EXYNOS4210_COMBINER_GET_IRQ_NUM(grp, bit);
 }
 
+/*
+ * Get Combiner input GPIO into irqs structure
+ */
+static void exynos4210_combiner_get_gpioin(Exynos4210Irq *irqs,
+                                           DeviceState *dev, int ext)
+{
+    int n;
+    int bit;
+    int max;
+    qemu_irq *irq;
+
+    max = ext ? EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ :
+        EXYNOS4210_MAX_INT_COMBINER_IN_IRQ;
+    irq = ext ? irqs->ext_combiner_irq : irqs->int_combiner_irq;
+
+    /*
+     * Some IRQs of Int/External Combiner are going to two Combiners groups,
+     * so let split them.
+     */
+    for (n = 0; n < max; n++) {
+
+        bit = EXYNOS4210_COMBINER_GET_BIT_NUM(n);
+
+        switch (n) {
+        /* MDNIE_LCD1 INTG1 */
+        case EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 0) ...
+             EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 3):
+            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(0, bit + 4)]);
+            continue;
+
+        /* TMU INTG3 */
+        case EXYNOS4210_COMBINER_GET_IRQ_NUM(3, 4):
+            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(2, bit)]);
+            continue;
+
+        /* LCD1 INTG12 */
+        case EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 0) ...
+             EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 3):
+            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(11, bit + 4)]);
+            continue;
+
+        /* Multi-Core Timer INTG12 */
+        case EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 4) ...
+             EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 8):
+               irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+                       irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
+            continue;
+
+        /* Multi-Core Timer INTG35 */
+        case EXYNOS4210_COMBINER_GET_IRQ_NUM(35, 4) ...
+             EXYNOS4210_COMBINER_GET_IRQ_NUM(35, 8):
+            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
+            continue;
+
+        /* Multi-Core Timer INTG51 */
+        case EXYNOS4210_COMBINER_GET_IRQ_NUM(51, 4) ...
+             EXYNOS4210_COMBINER_GET_IRQ_NUM(51, 8):
+            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
+            continue;
+
+        /* Multi-Core Timer INTG53 */
+        case EXYNOS4210_COMBINER_GET_IRQ_NUM(53, 4) ...
+             EXYNOS4210_COMBINER_GET_IRQ_NUM(53, 8):
+            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
+            continue;
+        }
+
+        irq[n] = qdev_get_gpio_in(dev, n);
+    }
+}
+
 static uint8_t chipid_and_omr[] = { 0x11, 0x02, 0x21, 0x43,
                                     0x09, 0x00, 0x00, 0x00 };
 
diff --git a/hw/intc/exynos4210_combiner.c b/hw/intc/exynos4210_combiner.c
index 4534ee248db..83b42b9bce1 100644
--- a/hw/intc/exynos4210_combiner.c
+++ b/hw/intc/exynos4210_combiner.c
@@ -105,83 +105,6 @@ static const VMStateDescription vmstate_exynos4210_combiner = {
     }
 };
 
-/*
- * Get Combiner input GPIO into irqs structure
- */
-void exynos4210_combiner_get_gpioin(Exynos4210Irq *irqs, DeviceState *dev,
-        int ext)
-{
-    int n;
-    int bit;
-    int max;
-    qemu_irq *irq;
-
-    max = ext ? EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ :
-        EXYNOS4210_MAX_INT_COMBINER_IN_IRQ;
-    irq = ext ? irqs->ext_combiner_irq : irqs->int_combiner_irq;
-
-    /*
-     * Some IRQs of Int/External Combiner are going to two Combiners groups,
-     * so let split them.
-     */
-    for (n = 0; n < max; n++) {
-
-        bit = EXYNOS4210_COMBINER_GET_BIT_NUM(n);
-
-        switch (n) {
-        /* MDNIE_LCD1 INTG1 */
-        case EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 0) ...
-             EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 3):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(0, bit + 4)]);
-            continue;
-
-        /* TMU INTG3 */
-        case EXYNOS4210_COMBINER_GET_IRQ_NUM(3, 4):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(2, bit)]);
-            continue;
-
-        /* LCD1 INTG12 */
-        case EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 0) ...
-             EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 3):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(11, bit + 4)]);
-            continue;
-
-        /* Multi-Core Timer INTG12 */
-        case EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 4) ...
-             EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 8):
-               irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                       irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
-            continue;
-
-        /* Multi-Core Timer INTG35 */
-        case EXYNOS4210_COMBINER_GET_IRQ_NUM(35, 4) ...
-             EXYNOS4210_COMBINER_GET_IRQ_NUM(35, 8):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
-            continue;
-
-        /* Multi-Core Timer INTG51 */
-        case EXYNOS4210_COMBINER_GET_IRQ_NUM(51, 4) ...
-             EXYNOS4210_COMBINER_GET_IRQ_NUM(51, 8):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
-            continue;
-
-        /* Multi-Core Timer INTG53 */
-        case EXYNOS4210_COMBINER_GET_IRQ_NUM(53, 4) ...
-             EXYNOS4210_COMBINER_GET_IRQ_NUM(53, 8):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
-            continue;
-        }
-
-        irq[n] = qdev_get_gpio_in(dev, n);
-    }
-}
-
 static uint64_t
 exynos4210_combiner_read(void *opaque, hwaddr offset, unsigned size)
 {
-- 
2.25.1


