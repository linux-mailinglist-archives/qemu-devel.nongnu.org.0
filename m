Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70862125A9A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 06:25:06 +0100 (CET)
Received: from localhost ([::1]:35946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihoJ7-0006BI-BK
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 00:25:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57463)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair@alistair23.me>) id 1ihoH5-0004de-NX
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 00:23:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair@alistair23.me>) id 1ihoH3-00038s-Sd
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 00:22:59 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:49285)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alistair@alistair23.me>)
 id 1ihoGz-0002Wm-Bw; Thu, 19 Dec 2019 00:22:53 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 3FE4C48C;
 Thu, 19 Dec 2019 00:22:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Thu, 19 Dec 2019 00:22:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=mkb9XvzbP8BUx
 9v/BWnZw9OFlGMX5weIvYh+iI7dGAw=; b=1iK6pMtr4EZIoHc5s3T0CX7XV/Xdp
 HLgTxjpDolkG2dHcm2cqOn3FtvFoOdIHXlsvOOi+B2ddzt8mc2RwIzE+0A43RDoF
 /H8k/Oy5QG47+7DZ+PZ8TFA0DMW7eErpzKzF6NzV4C0qKkx/EN01BwOs3j6gxtj3
 Pa5Fd5hpXS4eN7plTg9klcEu1VCNEfzxi2W3YPU2c89wL8Yxs8CuKXnVnD2dy0FH
 PVhkZn0U+psjlKozPSHmT5HMPLrSLO1friRV49LgTh4mDg7sIEGYNUdISHm355N4
 qJ0gDYv9/Cj2cU7EgwmjGO497nTphhDVZV5x6ID5q1+HhDtkpCdONYBDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=mkb9XvzbP8BUx9v/BWnZw9OFlGMX5weIvYh+iI7dGAw=; b=U4UneaZN
 XzP9q2OoudJjP9WKgTjQSmvfCRvQf+aRPnZFhqeSGMxRqpOA+GCAKbKEKplfmSzf
 RdoS97uYViWlCD+IwwJC2vYT2SM4usHmMLux69ehHtIJeY0r6dqEOM//FR9WHVXK
 0xZ8Fsn0k/3J1YWvfi1V3RdvS0RucOKJgoKHlWON3pGf9pkuvYoWLYTfreg6+wuk
 ojVs4vJc53WiQxb/uTQQZ1lMEWFdz5qQt3vHrkOpEVkbikcXgIQSBwX6u+D8YvTd
 JVjDatggXpgINgip0NvgAwraOssQyJCzoaROwwkADQLTnKoiSazBudfLyiiadQWH
 MCqWi0kyYjNRRg==
X-ME-Sender: <xms:KQn7XfhzeGtwIxvA6ea8Ua3Doutc0LMvJGAtOfykw4rmbQcSwdZObA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddutddgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
 ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucfkphepjeefrdelfedrkeegrddvtdekne
 curfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdef
 rdhmvgenucevlhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:KQn7Xc-uUi8ijHds4iktWBRZKPq7s1vYfltwZUV0oKP5hCx8GxrGhw>
 <xmx:KQn7XfZtw_byABMxUw3XeVUMehwJ_xyfjZDaXoNz1RcO91YuMHE4kw>
 <xmx:KQn7XaufSgaUthH9mT7kE0q89C-wx0JROiF4cNO1sG164BKnlpckQQ>
 <xmx:KQn7XbvNL0WNKqqmOSqroAekQbvs4Y5DNtfOv9dj10AJm1uQeT0u-w>
Received: from alistair-xps-14z.alistair23.me
 (c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0B33080060;
 Thu, 19 Dec 2019 00:22:48 -0500 (EST)
From: Alistair Francis <alistair@alistair23.me>
To: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 philmd@redhat.com
Subject: [PATCH v7 2/4] hw/misc: Add the STM32F4xx EXTI device
Date: Wed, 18 Dec 2019 21:22:48 -0800
Message-Id: <ef941d59fd8658589d34ed432e1d6dfdcf7fb1d0.1576658572.git.alistair@alistair23.me>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1576658572.git.alistair@alistair23.me>
References: <cover.1576658572.git.alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 64.147.123.20
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair@alistair23.me>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/Kconfig                   |   1 +
 hw/misc/Kconfig                  |   3 +
 hw/misc/Makefile.objs            |   1 +
 hw/misc/stm32f4xx_exti.c         | 188 +++++++++++++++++++++++++++++++
 hw/misc/trace-events             |   5 +
 include/hw/misc/stm32f4xx_exti.h |  60 ++++++++++
 6 files changed, 258 insertions(+)
 create mode 100644 hw/misc/stm32f4xx_exti.c
 create mode 100644 include/hw/misc/stm32f4xx_exti.h

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 4660d14715..3d86691ae0 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -315,6 +315,7 @@ config STM32F405_SOC
     bool
     select ARM_V7M
     select STM32F4XX_SYSCFG
+    select STM32F4XX_EXTI
 
 config XLNX_ZYNQMP_ARM
     bool
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 72609650b7..bdd77d8020 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -85,6 +85,9 @@ config STM32F2XX_SYSCFG
 config STM32F4XX_SYSCFG
     bool
 
+config STM32F4XX_EXTI
+    bool
+
 config MIPS_ITU
     bool
 
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index ea8025e0bb..c6ecbdd7b0 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -59,6 +59,7 @@ common-obj-$(CONFIG_ZYNQ) += zynq_slcr.o
 common-obj-$(CONFIG_ZYNQ) += zynq-xadc.o
 common-obj-$(CONFIG_STM32F2XX_SYSCFG) += stm32f2xx_syscfg.o
 common-obj-$(CONFIG_STM32F4XX_SYSCFG) += stm32f4xx_syscfg.o
+common-obj-$(CONFIG_STM32F4XX_EXTI) += stm32f4xx_exti.o
 obj-$(CONFIG_MIPS_CPS) += mips_cmgcr.o
 obj-$(CONFIG_MIPS_CPS) += mips_cpc.o
 obj-$(CONFIG_MIPS_ITU) += mips_itu.o
diff --git a/hw/misc/stm32f4xx_exti.c b/hw/misc/stm32f4xx_exti.c
new file mode 100644
index 0000000000..02e7810046
--- /dev/null
+++ b/hw/misc/stm32f4xx_exti.c
@@ -0,0 +1,188 @@
+/*
+ * STM32F4XX EXTI
+ *
+ * Copyright (c) 2014 Alistair Francis <alistair@alistair23.me>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "trace.h"
+#include "hw/irq.h"
+#include "migration/vmstate.h"
+#include "hw/misc/stm32f4xx_exti.h"
+
+static void stm32f4xx_exti_reset(DeviceState *dev)
+{
+    STM32F4xxExtiState *s = STM32F4XX_EXTI(dev);
+
+    s->exti_imr = 0x00000000;
+    s->exti_emr = 0x00000000;
+    s->exti_rtsr = 0x00000000;
+    s->exti_ftsr = 0x00000000;
+    s->exti_swier = 0x00000000;
+    s->exti_pr = 0x00000000;
+}
+
+static void stm32f4xx_exti_set_irq(void *opaque, int irq, int level)
+{
+    STM32F4xxExtiState *s = opaque;
+
+    trace_stm32f4xx_exti_set_irq(irq, level);
+
+    if (((1 << irq) & s->exti_rtsr) && level) {
+        /* Rising Edge */
+        s->exti_pr |= 1 << irq;
+    }
+
+    if (((1 << irq) & s->exti_ftsr) && !level) {
+        /* Falling Edge */
+        s->exti_pr |= 1 << irq;
+    }
+
+    if (!((1 << irq) & s->exti_imr)) {
+        /* Interrupt is masked */
+        return;
+    }
+    qemu_irq_pulse(s->irq[irq]);
+}
+
+static uint64_t stm32f4xx_exti_read(void *opaque, hwaddr addr,
+                                     unsigned int size)
+{
+    STM32F4xxExtiState *s = opaque;
+
+    trace_stm32f4xx_exti_read(addr);
+
+    switch (addr) {
+    case EXTI_IMR:
+        return s->exti_imr;
+    case EXTI_EMR:
+        return s->exti_emr;
+    case EXTI_RTSR:
+        return s->exti_rtsr;
+    case EXTI_FTSR:
+        return s->exti_ftsr;
+    case EXTI_SWIER:
+        return s->exti_swier;
+    case EXTI_PR:
+        return s->exti_pr;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "STM32F4XX_exti_read: Bad offset %x\n", (int)addr);
+        return 0;
+    }
+    return 0;
+}
+
+static void stm32f4xx_exti_write(void *opaque, hwaddr addr,
+                       uint64_t val64, unsigned int size)
+{
+    STM32F4xxExtiState *s = opaque;
+    uint32_t value = (uint32_t) val64;
+
+    trace_stm32f4xx_exti_write(addr, value);
+
+    switch (addr) {
+    case EXTI_IMR:
+        s->exti_imr = value;
+        return;
+    case EXTI_EMR:
+        s->exti_emr = value;
+        return;
+    case EXTI_RTSR:
+        s->exti_rtsr = value;
+        return;
+    case EXTI_FTSR:
+        s->exti_ftsr = value;
+        return;
+    case EXTI_SWIER:
+        s->exti_swier = value;
+        return;
+    case EXTI_PR:
+        /* This bit is cleared by writing a 1 to it */
+        s->exti_pr &= ~value;
+        return;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "STM32F4XX_exti_write: Bad offset %x\n", (int)addr);
+    }
+}
+
+static const MemoryRegionOps stm32f4xx_exti_ops = {
+    .read = stm32f4xx_exti_read,
+    .write = stm32f4xx_exti_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void stm32f4xx_exti_init(Object *obj)
+{
+    STM32F4xxExtiState *s = STM32F4XX_EXTI(obj);
+    int i;
+
+    for (i = 0; i < NUM_INTERRUPT_OUT_LINES; i++) {
+        sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq[i]);
+    }
+
+    memory_region_init_io(&s->mmio, obj, &stm32f4xx_exti_ops, s,
+                          TYPE_STM32F4XX_EXTI, 0x400);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+
+    qdev_init_gpio_in(DEVICE(obj), stm32f4xx_exti_set_irq,
+                      NUM_GPIO_EVENT_IN_LINES);
+}
+
+static const VMStateDescription vmstate_stm32f4xx_exti = {
+    .name = TYPE_STM32F4XX_EXTI,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(exti_imr, STM32F4xxExtiState),
+        VMSTATE_UINT32(exti_emr, STM32F4xxExtiState),
+        VMSTATE_UINT32(exti_rtsr, STM32F4xxExtiState),
+        VMSTATE_UINT32(exti_ftsr, STM32F4xxExtiState),
+        VMSTATE_UINT32(exti_swier, STM32F4xxExtiState),
+        VMSTATE_UINT32(exti_pr, STM32F4xxExtiState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void stm32f4xx_exti_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = stm32f4xx_exti_reset;
+    dc->vmsd = &vmstate_stm32f4xx_exti;
+}
+
+static const TypeInfo stm32f4xx_exti_info = {
+    .name          = TYPE_STM32F4XX_EXTI,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(STM32F4xxExtiState),
+    .instance_init = stm32f4xx_exti_init,
+    .class_init    = stm32f4xx_exti_class_init,
+};
+
+static void stm32f4xx_exti_register_types(void)
+{
+    type_register_static(&stm32f4xx_exti_info);
+}
+
+type_init(stm32f4xx_exti_register_types)
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 02327562bc..91a3794d68 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -90,6 +90,11 @@ stm32f4xx_pulse_exti(int irq) "Pulse EXTI: %d"
 stm32f4xx_syscfg_read(uint64_t addr) "reg read: addr: 0x%" PRIx64 " "
 stm32f4xx_syscfg_write(uint64_t addr, uint64_t data) "reg write: addr: 0x%" PRIx64 " val: 0x%" PRIx64 ""
 
+# stm32f4xx_exti
+stm32f4xx_exti_set_irq(int irq, int leve) "Set EXTI: %d to %d"
+stm32f4xx_exti_read(uint64_t addr) "reg read: addr: 0x%" PRIx64 " "
+stm32f4xx_exti_write(uint64_t addr, uint64_t data) "reg write: addr: 0x%" PRIx64 " val: 0x%" PRIx64 ""
+
 # tz-mpc.c
 tz_mpc_reg_read(uint32_t offset, uint64_t data, unsigned size) "TZ MPC regs read: offset 0x%x data 0x%" PRIx64 " size %u"
 tz_mpc_reg_write(uint32_t offset, uint64_t data, unsigned size) "TZ MPC regs write: offset 0x%x data 0x%" PRIx64 " size %u"
diff --git a/include/hw/misc/stm32f4xx_exti.h b/include/hw/misc/stm32f4xx_exti.h
new file mode 100644
index 0000000000..707036a41b
--- /dev/null
+++ b/include/hw/misc/stm32f4xx_exti.h
@@ -0,0 +1,60 @@
+/*
+ * STM32F4XX EXTI
+ *
+ * Copyright (c) 2014 Alistair Francis <alistair@alistair23.me>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef HW_STM_EXTI_H
+#define HW_STM_EXTI_H
+
+#include "hw/sysbus.h"
+#include "hw/hw.h"
+
+#define EXTI_IMR   0x00
+#define EXTI_EMR   0x04
+#define EXTI_RTSR  0x08
+#define EXTI_FTSR  0x0C
+#define EXTI_SWIER 0x10
+#define EXTI_PR    0x14
+
+#define TYPE_STM32F4XX_EXTI "stm32f4xx-exti"
+#define STM32F4XX_EXTI(obj) \
+    OBJECT_CHECK(STM32F4xxExtiState, (obj), TYPE_STM32F4XX_EXTI)
+
+#define NUM_GPIO_EVENT_IN_LINES 16
+#define NUM_INTERRUPT_OUT_LINES 16
+
+typedef struct {
+    SysBusDevice parent_obj;
+
+    MemoryRegion mmio;
+
+    uint32_t exti_imr;
+    uint32_t exti_emr;
+    uint32_t exti_rtsr;
+    uint32_t exti_ftsr;
+    uint32_t exti_swier;
+    uint32_t exti_pr;
+
+    qemu_irq irq[NUM_INTERRUPT_OUT_LINES];
+} STM32F4xxExtiState;
+
+#endif
-- 
2.24.0


