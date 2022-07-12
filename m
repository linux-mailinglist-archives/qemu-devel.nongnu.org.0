Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6721F571BFC
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 16:11:37 +0200 (CEST)
Received: from localhost ([::1]:45352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBGbu-0000In-87
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 10:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ph.makarov@gmail.com>)
 id 1oBDOG-0003Mj-Ky
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:45:16 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:38429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ph.makarov@gmail.com>)
 id 1oBDOE-00058D-FB
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:45:16 -0400
Received: by mail-lf1-x136.google.com with SMTP id u13so13255433lfn.5
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 03:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eNWSAlhO+fGho2iF5vStaCLXCCON/I+x2i0cO4XYosg=;
 b=lipMVmIi4fgpYNyosNtd6Ym85pvZwUSS2mrSubHjVj0qTzBsCOvw1zDVQlSLfzdp0j
 i7htSf4a7DxU/N5jyMe4EnWIFi6/yl7/A9FUovqzBjMxaLSZIomMIxBh5eb2YCiipq6B
 SQIL4KvIXibiXXxri4RO+a6pWiqELFITEUG2UH80U+9UTKxNDF2TT7YQf548sj3lxGRr
 +ikibofWFAjc535mJFYZO92V47otV/uTv+loL8SOElsX3HkdrQdjCZ6O3Z8TDfL+X/Ey
 w9xFdpSiDsXVl6tXTDFH5RFaP3e9EK+GBS9AtI+Sd0QhU8EIpvkNlosMf7bu1WXUJZ8p
 KsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eNWSAlhO+fGho2iF5vStaCLXCCON/I+x2i0cO4XYosg=;
 b=xjMUFUzT/etCL8BV5yo2H12MY716LPOEKMDyaYX8mFWltBN7nmRLc2W1w1I/ajMCDG
 b/uXlROevGwXm5U4fsnyP1WfSeStOyP1Vbf44cB6H9olrITIsD8UTJB8i6G1Qnzow8vm
 21hb50AzDdVmgMw9Um9jK8M6NAfctxM8y5Eg6irv1wfuXXXxCvCxU5rggCATseCfGi/M
 vxM6rrVxvMYf7VshOXDpyd1cN2zPODf1CvJf7KivrMrFr8PAkrca1hlPQX2we7WWG4vg
 qxigN2xRjdd2uO5bqwtpkEj3RL3rKw8qxJ3Jfz95w7z9gjgL1PxZbYPg3ukm0KAugGb/
 rWnQ==
X-Gm-Message-State: AJIora8MUikCklw+tFVIKexsSyr4TTv7CG1W2oWqsbBLkutDE6ebLIjJ
 B2qyirnvZQIY8NMoQUaE0NW2qWVd9LmQpw==
X-Google-Smtp-Source: AGRyM1scUX7IMtsN0nZVfkzdGWGgAkRVq+tcp+Z3ufOv+uOTFGq21F6y5S3EwzHLiLddgx6guB4wLA==
X-Received: by 2002:a05:6512:38ad:b0:489:f6f7:ac66 with SMTP id
 o13-20020a05651238ad00b00489f6f7ac66mr1069870lft.200.1657622711815; 
 Tue, 12 Jul 2022 03:45:11 -0700 (PDT)
Received: from w1.office.auriga.msk ([37.204.56.188])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a0565123d0200b00489fa1aac53sm157174lfv.96.2022.07.12.03.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 03:45:11 -0700 (PDT)
From: Andrey Makarov <ph.makarov@gmail.com>
X-Google-Original-From: Andrey Makarov <andrey.makarov@auriga.com>
To: qemu-devel@nongnu.org
Cc: Andrey Makarov <andrey.makarov@auriga.com>
Subject: [PATCH v2] Align Raspberry Pi DMA interrupts with Linux DTS
Date: Tue, 12 Jul 2022 13:45:00 +0300
Message-Id: <20220712104500.143538-1-andrey.makarov@auriga.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=ph.makarov@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 12 Jul 2022 10:01:21 -0400
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

In version v2:

1) an OR-gate is added according to review
2) a simple qtest is added for testing DMA & its interrupts

Signed-off-by: Andrey Makarov <andrey.makarov@auriga.com>
---
 hw/arm/bcm2835_peripherals.c         |  21 +++++-
 include/hw/arm/bcm2835_peripherals.h |   2 +
 tests/qtest/bcm2835-dma-test.c       | 106 +++++++++++++++++++++++++++
 tests/qtest/meson.build              |   3 +-
 4 files changed, 130 insertions(+), 2 deletions(-)
 create mode 100644 tests/qtest/bcm2835-dma-test.c

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 48538c9360..5a9c472b5a 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -101,6 +101,11 @@ static void bcm2835_peripherals_init(Object *obj)
     /* DMA Channels */
     object_initialize_child(obj, "dma", &s->dma, TYPE_BCM2835_DMA);
 
+    object_initialize_child(obj, "dma-11-14-irq-orgate",
+                            &s->dma_11_14_irq_orgate, TYPE_OR_IRQ);
+    object_property_set_int(OBJECT(&s->dma_11_14_irq_orgate), "num-lines", 4,
+                            &error_abort);
+
     object_property_add_const_link(OBJECT(&s->dma), "dma-mr",
                                    OBJECT(&s->gpu_bus_mr));
 
@@ -322,13 +327,27 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&s->peri_mr, DMA15_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->dma), 1));
 
-    for (n = 0; n <= 12; n++) {
+    for (n = 0; n <= 10; n++) {
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma), n,
                            qdev_get_gpio_in_named(DEVICE(&s->ic),
                                                   BCM2835_IC_GPU_IRQ,
                                                   INTERRUPT_DMA0 + n));
     }
 
+    /* According to DTS, dma channels 11-14 share one irq */
+    if (!qdev_realize(DEVICE(&s->dma_11_14_irq_orgate), NULL, errp)) {
+        return;
+    }
+    for (n = 11; n <= 14; n++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma), n,
+                           qdev_get_gpio_in(DEVICE(&s->dma_11_14_irq_orgate),
+                                            n - 11));
+    }
+    qdev_connect_gpio_out(DEVICE(&s->dma_11_14_irq_orgate), 0,
+                          qdev_get_gpio_in_named(DEVICE(&s->ic),
+                                                 BCM2835_IC_GPU_IRQ,
+                                                 INTERRUPT_DMA0 + 11));
+
     /* THERMAL */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->thermal), errp)) {
         return;
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index d864879421..79e2f2771a 100644
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
+    qemu_or_irq dma_11_14_irq_orgate;
     BCM2835ICState ic;
     BCM2835PropertyState property;
     BCM2835RngState rng;
diff --git a/tests/qtest/bcm2835-dma-test.c b/tests/qtest/bcm2835-dma-test.c
new file mode 100644
index 0000000000..111adfe7f2
--- /dev/null
+++ b/tests/qtest/bcm2835-dma-test.c
@@ -0,0 +1,106 @@
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
+static void bcm2835_dma_test_interrupt(int dma_c, int irq_line) {
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
+    for (int word = S_ADDR + 4; word < S_ADDR + TXFR_LEN; word += 4)
+        writel(word, ~check_data);
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
+static void bcm2835_dma_test_interrupts(void) {
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
index 31287a9173..3a474010e4 100644
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
2.30.2


