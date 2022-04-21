Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC421509E87
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:27:28 +0200 (CEST)
Received: from localhost ([::1]:43872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhUy7-00042Q-Vx
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpv-0002vU-3I
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:18:59 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpt-0003Ss-4W
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:18:58 -0400
Received: by mail-wr1-x436.google.com with SMTP id c10so6234566wrb.1
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QXsRoPUHqCo0IDRsRtZasRxyubwKd5nnuvujoVU4STM=;
 b=t1uGfVXbk4R7suZ/3tVt3awik1AUZu3LlHN4XGUyFmWcNQU6Vkvro3ZJ+PQ15h0Ilx
 NcCyN2ET3I/7UzweVHFxRSAQbE9X9LBqmCU4nbCsjMW7igWsNK4ssmIVkH3MnMKUlMay
 YcBf1Bzq8OUyNjN6ei1744WxAygVHhVwQKeJ9aGcygUinjBhrrTgXZWNtwW4qHijuDky
 ZWx65f0lIDogvjhS2s3EE2XHdzt4G/G/DMYZxQayMjBrXALvBkdhLxZk/CV+EUG6ijsJ
 aaw25+v4ZBavga8VRSSKGJAeovrd5ezDWl7XiJmu5Hc2Ize9EF5+ibPt4B8A6GFLjx5Z
 6eBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QXsRoPUHqCo0IDRsRtZasRxyubwKd5nnuvujoVU4STM=;
 b=ud4+buKoyG8rag1goBLiVVPAKAh/zRH7RKA7cilN8IPXzg1OYfQZBGqzGCeOCQpuGH
 3D+PVUasJBD7g712u9lSDFclyora1FqMrjL/ePe1IElPXiKe1T7m3FP4EsBKEgXfXFM4
 3zm4a6MOMJN9U30aT2QOK7Ycv5EKUj3Dg5Q0xVWQiVBDEB6I0mhyXHAFh+eaMGVPmgi/
 2CCetcT2Xz4V7gcVgqBJ5gv1O8a+cMTKI0ACDz3wInNDuTdo/ZQ0DfRi/9LtxDmtBCNv
 zkybQ6t9Qe0WO59gciWg3W0Ubhuoi28HDhGYc3/srh0vQLe3aULmH+zzHaz4xfTzncoG
 PUhA==
X-Gm-Message-State: AOAM533ov0Egmz9dh69/2cvsUMpxuW9oyO1NWtA9AcRR8Faf+jfiZWmY
 cgRCxHEgd4pug2FGPTnw1KKWqZ3ELbjE8A==
X-Google-Smtp-Source: ABdhPJzD7YzhicaGwpxPzJwW6TkwEAi3C4PvblZ/2PEjGbTHQArC/CKMtfynTcSiuKZVtuUN2G8EZA==
X-Received: by 2002:a5d:5005:0:b0:207:a7d7:ba4f with SMTP id
 e5-20020a5d5005000000b00207a7d7ba4fmr19148208wrt.163.1650539935722; 
 Thu, 21 Apr 2022 04:18:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.18.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:18:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/31] hw/arm/exynos4210: Use TYPE_OR_IRQ instead of custom
 OR-gate device
Date: Thu, 21 Apr 2022 12:18:23 +0100
Message-Id: <20220421111846.2011565-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

The Exynos4210 SoC device currently uses a custom device
"exynos4210.irq_gate" to model the OR gate that feeds each CPU's IRQ
line.  We have a standard TYPE_OR_IRQ device for this now, so use
that instead.

(This is a migration compatibility break, but that is OK for this
machine type.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220404154658.565020-2-peter.maydell@linaro.org
---
 include/hw/arm/exynos4210.h |  1 +
 hw/arm/exynos4210.c         | 31 ++++++++++++++++---------------
 2 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index 60b9e126f55..3999034053e 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -102,6 +102,7 @@ struct Exynos4210State {
     MemoryRegion bootreg_mem;
     I2CBus *i2c_if[EXYNOS4210_I2C_NUMBER];
     qemu_or_irq pl330_irq_orgate[EXYNOS4210_NUM_DMA];
+    qemu_or_irq cpu_irq_orgate[EXYNOS4210_NCPUS];
 };
 
 #define TYPE_EXYNOS4210_SOC "exynos4210"
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 0299e81f853..dfc0a4eec25 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -205,7 +205,6 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
 {
     Exynos4210State *s = EXYNOS4210_SOC(socdev);
     MemoryRegion *system_mem = get_system_memory();
-    qemu_irq gate_irq[EXYNOS4210_NCPUS][EXYNOS4210_IRQ_GATE_NINPUTS];
     SysBusDevice *busdev;
     DeviceState *dev, *uart[4], *pl330[3];
     int i, n;
@@ -235,18 +234,13 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
 
     /* IRQ Gate */
     for (i = 0; i < EXYNOS4210_NCPUS; i++) {
-        dev = qdev_new("exynos4210.irq_gate");
-        qdev_prop_set_uint32(dev, "n_in", EXYNOS4210_IRQ_GATE_NINPUTS);
-        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-        /* Get IRQ Gate input in gate_irq */
-        for (n = 0; n < EXYNOS4210_IRQ_GATE_NINPUTS; n++) {
-            gate_irq[i][n] = qdev_get_gpio_in(dev, n);
-        }
-        busdev = SYS_BUS_DEVICE(dev);
-
-        /* Connect IRQ Gate output to CPU's IRQ line */
-        sysbus_connect_irq(busdev, 0,
-                           qdev_get_gpio_in(DEVICE(s->cpu[i]), ARM_CPU_IRQ));
+        DeviceState *orgate = DEVICE(&s->cpu_irq_orgate[i]);
+        object_property_set_int(OBJECT(orgate), "num-lines",
+                                EXYNOS4210_IRQ_GATE_NINPUTS,
+                                &error_abort);
+        qdev_realize(orgate, NULL, &error_abort);
+        qdev_connect_gpio_out(orgate, 0,
+                              qdev_get_gpio_in(DEVICE(s->cpu[i]), ARM_CPU_IRQ));
     }
 
     /* Private memory region and Internal GIC */
@@ -256,7 +250,8 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     sysbus_realize_and_unref(busdev, &error_fatal);
     sysbus_mmio_map(busdev, 0, EXYNOS4210_SMP_PRIVATE_BASE_ADDR);
     for (n = 0; n < EXYNOS4210_NCPUS; n++) {
-        sysbus_connect_irq(busdev, n, gate_irq[n][0]);
+        sysbus_connect_irq(busdev, n,
+                           qdev_get_gpio_in(DEVICE(&s->cpu_irq_orgate[n]), 0));
     }
     for (n = 0; n < EXYNOS4210_INT_GIC_NIRQ; n++) {
         s->irqs.int_gic_irq[n] = qdev_get_gpio_in(dev, n);
@@ -275,7 +270,8 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     /* Map Distributer interface */
     sysbus_mmio_map(busdev, 1, EXYNOS4210_EXT_GIC_DIST_BASE_ADDR);
     for (n = 0; n < EXYNOS4210_NCPUS; n++) {
-        sysbus_connect_irq(busdev, n, gate_irq[n][1]);
+        sysbus_connect_irq(busdev, n,
+                           qdev_get_gpio_in(DEVICE(&s->cpu_irq_orgate[n]), 1));
     }
     for (n = 0; n < EXYNOS4210_EXT_GIC_NIRQ; n++) {
         s->irqs.ext_gic_irq[n] = qdev_get_gpio_in(dev, n);
@@ -488,6 +484,11 @@ static void exynos4210_init(Object *obj)
         object_initialize_child(obj, name, orgate, TYPE_OR_IRQ);
         g_free(name);
     }
+
+    for (i = 0; i < ARRAY_SIZE(s->cpu_irq_orgate); i++) {
+        g_autofree char *name = g_strdup_printf("cpu-irq-orgate%d", i);
+        object_initialize_child(obj, name, &s->cpu_irq_orgate[i], TYPE_OR_IRQ);
+    }
 }
 
 static void exynos4210_class_init(ObjectClass *klass, void *data)
-- 
2.25.1


