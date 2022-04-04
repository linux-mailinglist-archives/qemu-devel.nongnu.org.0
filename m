Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E10BD4F192B
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 18:08:13 +0200 (CEST)
Received: from localhost ([::1]:36118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbPFU-0006rm-V1
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 12:08:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOvD-0004xN-T9
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:16 -0400
Received: from [2a00:1450:4864:20::429] (port=41602
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOv9-0000Uz-Oi
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:14 -0400
Received: by mail-wr1-x429.google.com with SMTP id k23so2586321wrd.8
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 08:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cvW6KLwNy/I8unDDel937UbRRUD/Y4bI2f5TEKtV4Wk=;
 b=Tn8id/b/pY5ogxZXpNKg4j3P9IxRNwJBEBPSK598X9DFekqeWou/ErbBLQC3yed8es
 4o0DlaVRYJaoW4Ak7DM+J8yKwjsVNIufYiUtQ24DtNvloeUf/f/nlMHnMpqgSd+KhfyK
 ncSHJXaQ2Mk8WvLl4Pj29CkC4YFEgkgqfo0zh9D3OgLdYjlZklbSTIuOFMcgeqATG/VQ
 hTkOns0nwYRXh0SaY3RU++9HQvDmwij/KvfzCJzb17cWpSbrtuLkVN3ZbiqnnetYeCHk
 ZEDZDSEpYuSfwKSaTrvNOtClmBkfiVzFsxGuNqWGBFMJLce9QzYCo+E/XeNiB+0U6M1H
 fcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cvW6KLwNy/I8unDDel937UbRRUD/Y4bI2f5TEKtV4Wk=;
 b=NS40ppomr2bHmwUy16Ou8X63S77bBY60L/J1DJhtyC9rHhU1UqLAHWpKQAnUPZRzcR
 R3jL5Uw3ykl0nhCa9KOl0Ipwl99LlRLalduObe4ezwF8EN9/RGKrVp/K2j+bynM+O5iy
 /TIqYmL6w8TMAGVegfyJavk2Dv67e18xB8CQghlYD2z4h02EfZx08PfwVKswVVuF3A2L
 YGGGmS7kyIjZPKBT+UF4DpmCSLwQUKVFMoLpXgk8YTu+0IqTr4uNxlgF4MVMSpTRfj+K
 +KnB7dnNrVa4jOwHfdugq2dvc3NWBC+KqDSlxRFhIGrGGGQNeT0kR+k6/3VL4smniB+K
 Zisg==
X-Gm-Message-State: AOAM530cfz3TItmx8mso4sOahv8r3/5Ve1Yk6dyuwHKPLQI3LTlDwTzB
 0zgbVOOTpEjEXJ50HJ13WyVbug==
X-Google-Smtp-Source: ABdhPJwLWT+arn6grm4aNcxaa9gb4j1Izi4kUOgcOuTPcuo3WBw7ISYoZD1apctBc2qs/awsut7cxA==
X-Received: by 2002:adf:e181:0:b0:203:f0cc:da0c with SMTP id
 az1-20020adfe181000000b00203f0ccda0cmr288328wrb.668.1649087230393; 
 Mon, 04 Apr 2022 08:47:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056000184800b002040e925afasm11731347wri.59.2022.04.04.08.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:47:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.1 10/18] hw/arm/exynos4210: Move
 exynos4210_combiner_get_gpioin() into exynos4210.c
Date: Mon,  4 Apr 2022 16:46:50 +0100
Message-Id: <20220404154658.565020-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404154658.565020-1-peter.maydell@linaro.org>
References: <20220404154658.565020-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
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


