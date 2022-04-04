Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB05D4F1904
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 17:57:56 +0200 (CEST)
Received: from localhost ([::1]:39896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbP5Y-0006zW-0L
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 11:57:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOvF-0004yM-UU
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:18 -0400
Received: from [2a00:1450:4864:20::42c] (port=36671
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOvB-0000Vh-Fc
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:15 -0400
Received: by mail-wr1-x42c.google.com with SMTP id u3so15188607wrg.3
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 08:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hl9SRvEcx0c1matA6SMuB+Ty+5GSNQsaAxg6ODZ42CQ=;
 b=QIiHDd9DYV2mxNKTQo0XYJoR/aMvbQ6z8wEaxZB3fKFQJWNxnNL2nWXcpBayUKTGym
 kYgjwD2h5m010BW/b6FDu6ZdB1Ee7f2C+BsSGJyp5CtMton+b/ac/O7DjNL40MkSSkZa
 ln7xkoCHvRSWDFCNmcKupQk+b1PqNWy3jA1fYJ+aUSxgpb1T0GnZbPXKD8DUmiCZKZwg
 poU0XVbFj5gloQqaYjmNX35aDyO4lCCHEWiH8vVZtwHv3hJZephyrydW9sv/b84NQP9f
 ScV9kmnaSLB2rWkppGZ/KqwiXOPnHrAJNYZiTIZpEbDqBRzHOobPVSa1SVe7FJfnbYG9
 iKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hl9SRvEcx0c1matA6SMuB+Ty+5GSNQsaAxg6ODZ42CQ=;
 b=YUp9IWD44sXgPBJFQDAb1O9LS50j49PGNA5dApr58h8K/SA9Jw6G3naHxYOKrBTrM5
 RuPtyFet6t3EefovShrkfjW3BDuM/xJ0SbzUd16G91Ed8JJFv2tus4wArgNwh6nEoQtc
 97PGYgjxTqDLW2FOvKRpd0Baj1bejXLpSS06CA4opAYbk3jsj+HrilQmMkW0VdZbK/ZL
 AQF1D16oeWWdGcoEj7K8bOiCbojh92J6wiFVna5ju1aoGYvWgzhCxEUeftUwcm77SNH6
 W3Ua7Fn+zV5z1ij4d+8yPIkrR/m0qemkv8R6B3ArqRev4fCgWoc/C1SVhTDyQgy6X2Td
 UZHQ==
X-Gm-Message-State: AOAM532Avdacq5xe9sEIsF4O4aniT0mrYgTA/WO7aVkMK9Z5wr4wD72F
 cUio20bP7mTc+23BaYply7cKsQ==
X-Google-Smtp-Source: ABdhPJxVFisl8k3I+xee94DDM9xck3YFPmF3rhb8iTxIrx/SBTAQUuoMhNBIBGfVOxPtYGPt31J5kA==
X-Received: by 2002:adf:d1eb:0:b0:205:a502:d2ff with SMTP id
 g11-20020adfd1eb000000b00205a502d2ffmr283713wrd.125.1649087232047; 
 Mon, 04 Apr 2022 08:47:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056000184800b002040e925afasm11731347wri.59.2022.04.04.08.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:47:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.1 12/18] hw/arm/exynos4210: Use TYPE_SPLIT_IRQ in
 exynos4210_init_board_irqs()
Date: Mon,  4 Apr 2022 16:46:52 +0100
Message-Id: <20220404154658.565020-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404154658.565020-1-peter.maydell@linaro.org>
References: <20220404154658.565020-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

In exynos4210_init_board_irqs(), use the TYPE_SPLIT_IRQ device
instead of qemu_irq_split().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/exynos4210.h |  9 ++++++++
 hw/arm/exynos4210.c         | 41 +++++++++++++++++++++++++++++--------
 2 files changed, 42 insertions(+), 8 deletions(-)

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index f0769a4045b..f58ee0f2686 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -28,6 +28,7 @@
 #include "hw/sysbus.h"
 #include "hw/cpu/a9mpcore.h"
 #include "hw/intc/exynos4210_gic.h"
+#include "hw/core/split-irq.h"
 #include "target/arm/cpu-qom.h"
 #include "qom/object.h"
 
@@ -71,6 +72,13 @@
 
 #define EXYNOS4210_NUM_DMA      3
 
+/*
+ * We need one splitter for every external combiner input, plus
+ * one for every non-zero entry in combiner_grp_to_gic_id[].
+ * We'll assert in exynos4210_init_board_irqs() if this is wrong.
+ */
+#define EXYNOS4210_NUM_SPLITTERS (EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ + 60)
+
 typedef struct Exynos4210Irq {
     qemu_irq int_combiner_irq[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
     qemu_irq ext_combiner_irq[EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ];
@@ -95,6 +103,7 @@ struct Exynos4210State {
     qemu_or_irq cpu_irq_orgate[EXYNOS4210_NCPUS];
     A9MPPrivState a9mpcore;
     Exynos4210GicState ext_gic;
+    SplitIRQ splitter[EXYNOS4210_NUM_SPLITTERS];
 };
 
 #define TYPE_EXYNOS4210_SOC "exynos4210"
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 86a9a0dae12..919821833b5 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -263,6 +263,8 @@ static void exynos4210_init_board_irqs(Exynos4210State *s)
     uint32_t grp, bit, irq_id, n;
     Exynos4210Irq *is = &s->irqs;
     DeviceState *extgicdev = DEVICE(&s->ext_gic);
+    int splitcount = 0;
+    DeviceState *splitter;
 
     for (n = 0; n < EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ; n++) {
         irq_id = 0;
@@ -276,13 +278,19 @@ static void exynos4210_init_board_irqs(Exynos4210State *s)
             /* MCT_G1 is passed to External and GIC */
             irq_id = EXT_GIC_ID_MCT_G1;
         }
+
+        assert(splitcount < EXYNOS4210_NUM_SPLITTERS);
+        splitter = DEVICE(&s->splitter[splitcount]);
+        qdev_prop_set_uint16(splitter, "num-lines", 2);
+        qdev_realize(splitter, NULL, &error_abort);
+        splitcount++;
+        s->irq_table[n] = qdev_get_gpio_in(splitter, 0);
+        qdev_connect_gpio_out(splitter, 0, is->int_combiner_irq[n]);
         if (irq_id) {
-            s->irq_table[n] = qemu_irq_split(is->int_combiner_irq[n],
-                                             qdev_get_gpio_in(extgicdev,
-                                                              irq_id - 32));
+            qdev_connect_gpio_out(splitter, 1,
+                                  qdev_get_gpio_in(extgicdev, irq_id - 32));
         } else {
-            s->irq_table[n] = qemu_irq_split(is->int_combiner_irq[n],
-                    is->ext_combiner_irq[n]);
+            qdev_connect_gpio_out(splitter, 1, is->ext_combiner_irq[n]);
         }
     }
     for (; n < EXYNOS4210_MAX_INT_COMBINER_IN_IRQ; n++) {
@@ -293,11 +301,23 @@ static void exynos4210_init_board_irqs(Exynos4210State *s)
                      EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][bit];
 
         if (irq_id) {
-            s->irq_table[n] = qemu_irq_split(is->int_combiner_irq[n],
-                                             qdev_get_gpio_in(extgicdev,
-                                                              irq_id - 32));
+            assert(splitcount < EXYNOS4210_NUM_SPLITTERS);
+            splitter = DEVICE(&s->splitter[splitcount]);
+            qdev_prop_set_uint16(splitter, "num-lines", 2);
+            qdev_realize(splitter, NULL, &error_abort);
+            splitcount++;
+            s->irq_table[n] = qdev_get_gpio_in(splitter, 0);
+            qdev_connect_gpio_out(splitter, 0, is->int_combiner_irq[n]);
+            qdev_connect_gpio_out(splitter, 1,
+                                  qdev_get_gpio_in(extgicdev, irq_id - 32));
         }
     }
+    /*
+     * We check this here to avoid a more obscure assert later when
+     * qdev_assert_realized_properly() checks that we realized every
+     * child object we initialized.
+     */
+    assert(splitcount == EXYNOS4210_NUM_SPLITTERS);
 }
 
 /*
@@ -766,6 +786,11 @@ static void exynos4210_init(Object *obj)
         object_initialize_child(obj, name, &s->cpu_irq_orgate[i], TYPE_OR_IRQ);
     }
 
+    for (i = 0; i < ARRAY_SIZE(s->splitter); i++) {
+        g_autofree char *name = g_strdup_printf("irq-splitter%d", i);
+        object_initialize_child(obj, name, &s->splitter[i], TYPE_SPLIT_IRQ);
+    }
+
     object_initialize_child(obj, "a9mpcore", &s->a9mpcore, TYPE_A9MPCORE_PRIV);
     object_initialize_child(obj, "ext-gic", &s->ext_gic, TYPE_EXYNOS4210_GIC);
 }
-- 
2.25.1


