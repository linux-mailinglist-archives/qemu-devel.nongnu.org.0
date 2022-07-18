Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855E057858C
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:35:43 +0200 (CEST)
Received: from localhost ([::1]:33570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRqY-0004qn-KN
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHh-0002BX-BB
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:42 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHd-0003Be-RH
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:41 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v16so1356867wrr.6
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 06:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=O9MWcMSwBbu4CMzo7bCb2HSbS/5shVLaXo9ftmPe+ww=;
 b=HeyTXnKydzyjdu4GVNmzN8UEMoqwJbfD0PphBX71PvydJLoxJBMbjq9IOT6EoSWHd0
 tMtDAopuF6n3UdYtkgf4h1V8iR0wVLAw0ifOCIeBndQY/Zakbjkp7o6pZIyQxo8zUi0K
 /E9hinhd2Lv0XvL+/4gNNUIhNMWThzSbF5Qk9V6NqYeMEUmbeJk0lVSt5OWTLfrHHxsZ
 fh656WOE7EI1NDQ/pqi8CxhDEYbh1QjEVE0wyTSTLf5cUSY3v8L36U/mx+rLWjaO09+k
 15ucqGVDrJoLZ6iY1GFeoBtstxVruAKwO51w6SkJ4q4ItaJ/S5ICyunUSNuAFhZ6BjGx
 DG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O9MWcMSwBbu4CMzo7bCb2HSbS/5shVLaXo9ftmPe+ww=;
 b=1EUAjSnXVBSr3g+jmiZjvvZVo6FLj7x2/EV4IJRmHLrNLUTLvBDW8D/vf0HMTsZpOu
 seD/He0Wf8BtDDH8ZkWKwNC+ts5TL1Dp/ckEepk/GOwE0MAAvR8PUChvET5oa/p9cL4+
 suE7AkAH8DQFMwDbz7q1sHxrezV28DF1WVXDCMPJRgygRUp1j8USuVQx7EqDuz0XU2+2
 EgedeGuDzQd78GFPU424+hMB6Tx+qCzUbnNSvfYPE+Pp0GCF/adMgiBQ0idiOpnEARAg
 dxnrkDhvetdw4m++qJSfAZOzp+xo1Kd27KR2v+kiDwmWaqXjcNQVqOzfaouCT0OfKuyY
 WlLA==
X-Gm-Message-State: AJIora/RHx/3BcyMMNh8VEV64jVJa2bOAkeCx7yWI9f4UfLOTx3wyaze
 YUpbSmCxjnNeKsq90qNO+oiebtzkzc3AHg==
X-Google-Smtp-Source: AGRyM1uamPAydzT6x0uy2qyaaKJ6v35TDP1R9mBY/0mdlBW+qNzokFB+FM7vXMfjlCaykf0h9Aa6nQ==
X-Received: by 2002:a05:6000:1887:b0:21d:97cf:6b80 with SMTP id
 a7-20020a056000188700b0021d97cf6b80mr23413594wri.571.1658152775014; 
 Mon, 18 Jul 2022 06:59:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 id15-20020a05600ca18f00b003a31f1edfa7sm1805798wmb.41.2022.07.18.06.59.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 06:59:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/15] Align Raspberry Pi DMA interrupts with Linux DTS
Date: Mon, 18 Jul 2022 14:59:20 +0100
Message-Id: <20220718135920.13667-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718135920.13667-1-peter.maydell@linaro.org>
References: <20220718135920.13667-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

From: Andrey Makarov <ph.makarov@gmail.com>

There is nothing in the specs on DMA engine interrupt lines: it should have
been in the "BCM2835 ARM Peripherals" datasheet but the appropriate
"ARM peripherals interrupt table" (p.113) is nearly empty.

All Raspberry Pi models 1-3 (based on bcm2835) have
Linux device tree (arch/arm/boot/dts/bcm2835-common.dtsi +25):

    /* dma channel 11-14 share one irq */

This information is repeated in the driver code
(drivers/dma/bcm2835-dma.c +1344):

    /*
     * in case of channel >= 11
     * use the 11th interrupt and that is shared
     */

In this patch channels 0--10 and 11--14 are handled separately.

Signed-off-by: Andrey Makarov <andrey.makarov@auriga.com>
Message-id: 20220716113210.349153-1-andrey.makarov@auriga.com
[PMM: fixed checkpatch nits]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/bcm2835_peripherals.h |   2 +
 hw/arm/bcm2835_peripherals.c         |  26 +++++-
 tests/qtest/bcm2835-dma-test.c       | 118 +++++++++++++++++++++++++++
 tests/qtest/meson.build              |   3 +-
 4 files changed, 147 insertions(+), 2 deletions(-)
 create mode 100644 tests/qtest/bcm2835-dma-test.c

diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index d864879421a..c9d25d493e0 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -17,6 +17,7 @@
 #include "hw/char/bcm2835_aux.h"
 #include "hw/display/bcm2835_fb.h"
 #include "hw/dma/bcm2835_dma.h"
+#include "hw/or-irq.h"
 #include "hw/intc/bcm2835_ic.h"
 #include "hw/misc/bcm2835_property.h"
 #include "hw/misc/bcm2835_rng.h"
@@ -55,6 +56,7 @@ struct BCM2835PeripheralState {
     BCM2835AuxState aux;
     BCM2835FBState fb;
     BCM2835DMAState dma;
+    qemu_or_irq orgated_dma_irq;
     BCM2835ICState ic;
     BCM2835PropertyState property;
     BCM2835RngState rng;
diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 48538c9360c..3c2a4160cd1 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -23,6 +23,13 @@
 /* Capabilities for SD controller: no DMA, high-speed, default clocks etc. */
 #define BCM2835_SDHC_CAPAREG 0x52134b4
 
+/*
+ * According to Linux driver & DTS, dma channels 0--10 have separate IRQ,
+ * while channels 11--14 share one IRQ:
+ */
+#define SEPARATE_DMA_IRQ_MAX 10
+#define ORGATED_DMA_IRQ_COUNT 4
+
 static void create_unimp(BCM2835PeripheralState *ps,
                          UnimplementedDeviceState *uds,
                          const char *name, hwaddr ofs, hwaddr size)
@@ -101,6 +108,11 @@ static void bcm2835_peripherals_init(Object *obj)
     /* DMA Channels */
     object_initialize_child(obj, "dma", &s->dma, TYPE_BCM2835_DMA);
 
+    object_initialize_child(obj, "orgated-dma-irq",
+                            &s->orgated_dma_irq, TYPE_OR_IRQ);
+    object_property_set_int(OBJECT(&s->orgated_dma_irq), "num-lines",
+                            ORGATED_DMA_IRQ_COUNT, &error_abort);
+
     object_property_add_const_link(OBJECT(&s->dma), "dma-mr",
                                    OBJECT(&s->gpu_bus_mr));
 
@@ -322,12 +334,24 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&s->peri_mr, DMA15_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->dma), 1));
 
-    for (n = 0; n <= 12; n++) {
+    for (n = 0; n <= SEPARATE_DMA_IRQ_MAX; n++) {
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma), n,
                            qdev_get_gpio_in_named(DEVICE(&s->ic),
                                                   BCM2835_IC_GPU_IRQ,
                                                   INTERRUPT_DMA0 + n));
     }
+    if (!qdev_realize(DEVICE(&s->orgated_dma_irq), NULL, errp)) {
+        return;
+    }
+    for (n = 0; n < ORGATED_DMA_IRQ_COUNT; n++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma),
+                           SEPARATE_DMA_IRQ_MAX + 1 + n,
+                           qdev_get_gpio_in(DEVICE(&s->orgated_dma_irq), n));
+    }
+    qdev_connect_gpio_out(DEVICE(&s->orgated_dma_irq), 0,
+                          qdev_get_gpio_in_named(DEVICE(&s->ic),
+                              BCM2835_IC_GPU_IRQ,
+                              INTERRUPT_DMA0 + SEPARATE_DMA_IRQ_MAX + 1));
 
     /* THERMAL */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->thermal), errp)) {
diff --git a/tests/qtest/bcm2835-dma-test.c b/tests/qtest/bcm2835-dma-test.c
new file mode 100644
index 00000000000..8293d822b94
--- /dev/null
+++ b/tests/qtest/bcm2835-dma-test.c
@@ -0,0 +1,118 @@
+/*
+ * QTest testcase for BCM283x DMA engine (on Raspberry Pi 3)
+ * and its interrupts coming to Interrupt Controller.
+ *
+ * Copyright (c) 2022 Auriga LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest-single.h"
+
+/* Offsets in raspi3b platform: */
+#define RASPI3_DMA_BASE 0x3f007000
+#define RASPI3_IC_BASE  0x3f00b200
+
+/* Used register/fields definitions */
+
+/* DMA engine registers: */
+#define BCM2708_DMA_CS         0
+#define BCM2708_DMA_ACTIVE     (1 << 0)
+#define BCM2708_DMA_INT        (1 << 2)
+
+#define BCM2708_DMA_ADDR       0x04
+
+#define BCM2708_DMA_INT_STATUS 0xfe0
+
+/* DMA Trasfer Info fields: */
+#define BCM2708_DMA_INT_EN     (1 << 0)
+#define BCM2708_DMA_D_INC      (1 << 4)
+#define BCM2708_DMA_S_INC      (1 << 8)
+
+/* Interrupt controller registers: */
+#define IRQ_PENDING_BASIC      0x00
+#define IRQ_GPU_PENDING1_AGGR  (1 << 8)
+#define IRQ_PENDING_1          0x04
+#define IRQ_ENABLE_1           0x10
+
+/* Data for the test: */
+#define SCB_ADDR   256
+#define S_ADDR     32
+#define D_ADDR     64
+#define TXFR_LEN   32
+const uint32_t check_data = 0x12345678;
+
+static void bcm2835_dma_test_interrupt(int dma_c, int irq_line)
+{
+    uint64_t dma_base = RASPI3_DMA_BASE + dma_c * 0x100;
+    int gpu_irq_line = 16 + irq_line;
+
+    /* Check that interrupts are silent by default: */
+    writel(RASPI3_IC_BASE + IRQ_ENABLE_1, 1 << gpu_irq_line);
+    int isr = readl(dma_base + BCM2708_DMA_INT_STATUS);
+    g_assert_cmpint(isr, ==, 0);
+    uint32_t reg0 = readl(dma_base + BCM2708_DMA_CS);
+    g_assert_cmpint(reg0, ==, 0);
+    uint32_t ic_pending = readl(RASPI3_IC_BASE + IRQ_PENDING_BASIC);
+    g_assert_cmpint(ic_pending, ==, 0);
+    uint32_t gpu_pending1 = readl(RASPI3_IC_BASE + IRQ_PENDING_1);
+    g_assert_cmpint(gpu_pending1, ==, 0);
+
+    /* Prepare Control Block: */
+    writel(SCB_ADDR + 0, BCM2708_DMA_S_INC | BCM2708_DMA_D_INC |
+                         BCM2708_DMA_INT_EN); /* transfer info */
+    writel(SCB_ADDR + 4, S_ADDR);             /* source address */
+    writel(SCB_ADDR + 8, D_ADDR);             /* destination address */
+    writel(SCB_ADDR + 12, TXFR_LEN);          /* transfer length */
+    writel(dma_base + BCM2708_DMA_ADDR, SCB_ADDR);
+
+    writel(S_ADDR, check_data);
+    for (int word = S_ADDR + 4; word < S_ADDR + TXFR_LEN; word += 4) {
+        writel(word, ~check_data);
+    }
+    /* Perform the transfer: */
+    writel(dma_base + BCM2708_DMA_CS, BCM2708_DMA_ACTIVE);
+
+    /* Check that destination == source: */
+    uint32_t data = readl(D_ADDR);
+    g_assert_cmpint(data, ==, check_data);
+    for (int word = D_ADDR + 4; word < D_ADDR + TXFR_LEN; word += 4) {
+        data = readl(word);
+        g_assert_cmpint(data, ==, ~check_data);
+    }
+
+    /* Check that interrupt status is set both in DMA and IC controllers: */
+    isr = readl(RASPI3_DMA_BASE + BCM2708_DMA_INT_STATUS);
+    g_assert_cmpint(isr, ==, 1 << dma_c);
+
+    ic_pending = readl(RASPI3_IC_BASE + IRQ_PENDING_BASIC);
+    g_assert_cmpint(ic_pending, ==, IRQ_GPU_PENDING1_AGGR);
+
+    gpu_pending1 = readl(RASPI3_IC_BASE + IRQ_PENDING_1);
+    g_assert_cmpint(gpu_pending1, ==, 1 << gpu_irq_line);
+
+    /* Clean up, clear interrupt: */
+    writel(dma_base + BCM2708_DMA_CS, BCM2708_DMA_INT);
+}
+
+static void bcm2835_dma_test_interrupts(void)
+{
+    /* DMA engines 0--10 have separate IRQ lines, 11--14 - only one: */
+    bcm2835_dma_test_interrupt(0,  0);
+    bcm2835_dma_test_interrupt(10, 10);
+    bcm2835_dma_test_interrupt(11, 11);
+    bcm2835_dma_test_interrupt(14, 11);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+    g_test_init(&argc, &argv, NULL);
+    qtest_add_func("/bcm2835/dma/test_interrupts",
+                   bcm2835_dma_test_interrupts);
+    qtest_start("-machine raspi3b");
+    ret = g_test_run();
+    qtest_end();
+    return ret;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 31287a91739..3a474010e49 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -218,7 +218,8 @@ qtests_aarch64 = \
   ['arm-cpu-features',
    'numa-test',
    'boot-serial-test',
-   'migration-test']
+   'migration-test',
+   'bcm2835-dma-test']
 
 qtests_s390x = \
   (slirp.found() ? ['pxe-test', 'test-netfilter'] : []) +                 \
-- 
2.25.1


