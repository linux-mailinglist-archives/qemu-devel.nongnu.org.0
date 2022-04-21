Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7417509E9C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:35:11 +0200 (CEST)
Received: from localhost ([::1]:60908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhV5a-0000gL-G1
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUq5-0003AC-3F
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:10 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUq2-0003Vn-EF
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:08 -0400
Received: by mail-wr1-x42c.google.com with SMTP id s25so1326008wrb.8
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6iEh6vhBWVu8vdp664MaCGIOBRqTLHZP+x0CHEhw0js=;
 b=Fm30hB+yVssk93ZtLO9H3OCgJ/vc2BiWLPA7lgfLDj/QcTjk3HDqW9hdzflhnzzTza
 sml/i3TJ2Q5w53rmmhx3kPVjOvJTWoN3ZA6eIushhhLOPKNWfVH129QFKN6/6PPD3dgP
 dXleNo6/nQfvgo+UhWTcx2ZLRTZ8C/j4vU+0hm05DmGT3DWTTcxJxINm5e7QnepCPP7h
 /R6USRYGkvxlq340C8dUUoWmam38nex5ro0b9TyIqZFYErCxfmJRGH5NTjhx/dtSUT7E
 /7lAReiPYVt4UPRQk1+49fDo7WtFd1sjDum1jbcJMI/S3mzwdCqqMSlWqiuDNTJQzWWX
 wRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6iEh6vhBWVu8vdp664MaCGIOBRqTLHZP+x0CHEhw0js=;
 b=y1sf7AW3dLX9PTXIio4YRtrmOL2wL5HFYwDaGQMXiwPBWa2ZC01q8MojvG2AIKkBnu
 vId5kgk9x8LQZ6Pg3PKXCwnUqwfGoLx9f88PvpQYbVQbz8bu9xgkV0zebDABe5Wn8By3
 E4CG9D6e1nNi9Qj3ElmiJLcJZT1FkQX57cvwa1raD6QJ4qUAXMF8AoND/PW6ybhA3BDO
 iwRzSv7M/KyeF50/0cnoyEoAkrQ8mKoc01Gtrxt3xE+weXHk5UmrQROELBz3MPiu65Fr
 FARVCzBDLAgnTuW/IPP943j/QkC+4V9X5jyzARQAMA3KsaBypRpPi5ySCYZQ8eW9WTnw
 Eefg==
X-Gm-Message-State: AOAM531X4Rne7JF7RZjUEUBytBv0NKqhUMEnbFeMY07NLAaKIyPdgek5
 EJafr11Z0kIF6a1KbaxTZBDFPFqZMPMCRA==
X-Google-Smtp-Source: ABdhPJyzC007qti0UJXbR/6IVBZcFMETLIe+R83sOoCE8rILLPVp29fcjK7n6yNMcpkGLu3C2YS4qw==
X-Received: by 2002:adf:f2cb:0:b0:20a:77c2:3958 with SMTP id
 d11-20020adff2cb000000b0020a77c23958mr18539139wrp.589.1650539945226; 
 Thu, 21 Apr 2022 04:19:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.19.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:19:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/31] hw/arm/exynos4210: Use TYPE_SPLIT_IRQ in
 exynos4210_init_board_irqs()
Date: Thu, 21 Apr 2022 12:18:34 +0100
Message-Id: <20220421111846.2011565-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

In exynos4210_init_board_irqs(), use the TYPE_SPLIT_IRQ device
instead of qemu_irq_split().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220404154658.565020-13-peter.maydell@linaro.org
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


