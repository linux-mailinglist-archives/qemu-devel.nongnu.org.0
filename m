Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610DB33C7F0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 21:45:26 +0100 (CET)
Received: from localhost ([::1]:56048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLu5d-0005U6-9i
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 16:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lLu2y-0004Ac-5d
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:42:41 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:58719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lLu2u-00034F-5P
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:42:39 -0400
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MNcYX-1l5dRV2E95-00P68o; Mon, 15 Mar 2021 21:42:30 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] hw/intc: add goldfish-pic
Date: Mon, 15 Mar 2021 21:42:23 +0100
Message-Id: <20210315204226.3481044-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210315204226.3481044-1-laurent@vivier.eu>
References: <20210315204226.3481044-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2XVZ7KG0V4S3m6FA5bLx1btb3/kU9IAu9uKrRdzGqjD96/fFglG
 WkoJ9gAXfVD5v4LME0B1mpWp4Y8IZbIelREEhaZOWbqNnr+/Vf63vrjwmifr8cJ5VVfHbod
 RHDwbvX1F+jKKU8sBfsKj3Foy1dGYf73WLAULOK/HaPJyN9gKVdGCaoArYneSkrBcvh67Oy
 YF4rsIyl95PRvmFVstxjg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1ddkabmc0nA=:HHBCfDe4T8i6fq1XGkc8oA
 I/8puqTWlSYo3LeU5pi9ZD6115WwFuWbQM67wsYRMlck5kk337Ht4zauGMonw6h6y5kJCVG4F
 9a6tns+Jr33pU1qilIMdqMY38ROSiNjHUUpT7ps9406hLFdXffsEgb0/1bkZYld4LSPyBe1Ek
 0cnnsx2pMIsS9H6q2tktHYcOfeUGVp89dE2bcWfrlurPzk6vNN3yGjvl4qkUM/2rOzka4yxMv
 XSzMT9kOeg96IgX3BQ61gKM2Tv9i5LAVqhzl//PC6Rnz3Ft3kWZNAlSEFVla+Em0cWqDmcN0x
 lUl8IvyyHEASPp2g5hKgE/stmFrdpGK9EtH8NYvuNIqmBuNpN7c/LimzIKfzBYP2AIlHQbYOH
 luMg2MXy94/BJeNFblWbzKytR80KgmCG6XHd9bLEUd4CUZZzPCLgDpdKEiqRV
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the goldfish pic device as defined in

https://android.googlesource.com/platform/external/qemu/+/master/docs/GOLDFISH-VIRTUAL-HARDWARE.TXT

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210312214145.2936082-3-laurent@vivier.eu>
---
 include/hw/intc/goldfish_pic.h |  33 +++++
 hw/intc/goldfish_pic.c         | 219 +++++++++++++++++++++++++++++++++
 hw/intc/Kconfig                |   3 +
 hw/intc/meson.build            |   1 +
 hw/intc/trace-events           |   8 ++
 5 files changed, 264 insertions(+)
 create mode 100644 include/hw/intc/goldfish_pic.h
 create mode 100644 hw/intc/goldfish_pic.c

diff --git a/include/hw/intc/goldfish_pic.h b/include/hw/intc/goldfish_pic.h
new file mode 100644
index 000000000000..ad13ab37fc3e
--- /dev/null
+++ b/include/hw/intc/goldfish_pic.h
@@ -0,0 +1,33 @@
+/*
+ * SPDX-License-Identifer: GPL-2.0-or-later
+ *
+ * Goldfish PIC
+ *
+ * (c) 2020 Laurent Vivier <laurent@vivier.eu>
+ *
+ */
+
+#ifndef HW_INTC_GOLDFISH_PIC_H
+#define HW_INTC_GOLDFISH_PIC_H
+
+#define TYPE_GOLDFISH_PIC "goldfish_pic"
+OBJECT_DECLARE_SIMPLE_TYPE(GoldfishPICState, GOLDFISH_PIC)
+
+#define GOLDFISH_PIC_IRQ_NB 32
+
+struct GoldfishPICState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+    qemu_irq irq;
+
+    uint32_t pending;
+    uint32_t enabled;
+
+    /* statistics */
+    uint64_t stats_irq_count[32];
+    /* for tracing */
+    uint8_t idx;
+};
+
+#endif
diff --git a/hw/intc/goldfish_pic.c b/hw/intc/goldfish_pic.c
new file mode 100644
index 000000000000..e3b43a69f163
--- /dev/null
+++ b/hw/intc/goldfish_pic.c
@@ -0,0 +1,219 @@
+/*
+ * SPDX-License-Identifer: GPL-2.0-or-later
+ *
+ * Goldfish PIC
+ *
+ * (c) 2020 Laurent Vivier <laurent@vivier.eu>
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
+#include "migration/vmstate.h"
+#include "monitor/monitor.h"
+#include "qemu/log.h"
+#include "trace.h"
+#include "hw/intc/intc.h"
+#include "hw/intc/goldfish_pic.h"
+
+/* registers */
+
+enum {
+    REG_STATUS          = 0x00,
+    REG_IRQ_PENDING     = 0x04,
+    REG_IRQ_DISABLE_ALL = 0x08,
+    REG_DISABLE         = 0x0c,
+    REG_ENABLE          = 0x10,
+};
+
+static bool goldfish_pic_get_statistics(InterruptStatsProvider *obj,
+                                        uint64_t **irq_counts,
+                                        unsigned int *nb_irqs)
+{
+    GoldfishPICState *s = GOLDFISH_PIC(obj);
+
+    *irq_counts = s->stats_irq_count;
+    *nb_irqs = ARRAY_SIZE(s->stats_irq_count);
+    return true;
+}
+
+static void goldfish_pic_print_info(InterruptStatsProvider *obj, Monitor *mon)
+{
+    GoldfishPICState *s = GOLDFISH_PIC(obj);
+    monitor_printf(mon, "goldfish-pic.%d: pending=0x%08x enabled=0x%08x\n",
+                   s->idx, s->pending, s->enabled);
+}
+
+static void goldfish_pic_update(GoldfishPICState *s)
+{
+    if (s->pending & s->enabled) {
+        qemu_irq_raise(s->irq);
+    } else {
+        qemu_irq_lower(s->irq);
+    }
+}
+
+static void goldfish_irq_request(void *opaque, int irq, int level)
+{
+    GoldfishPICState *s = opaque;
+
+    trace_goldfish_irq_request(s, s->idx, irq, level);
+
+    if (level) {
+        s->pending |= 1 << irq;
+        s->stats_irq_count[irq]++;
+    } else {
+        s->pending &= ~(1 << irq);
+    }
+    goldfish_pic_update(s);
+}
+
+static uint64_t goldfish_pic_read(void *opaque, hwaddr addr,
+                                  unsigned size)
+{
+    GoldfishPICState *s = opaque;
+    uint64_t value = 0;
+
+    switch (addr) {
+    case REG_STATUS:
+        /* The number of pending interrupts (0 to 32) */
+        value = ctpop32(s->pending & s->enabled);
+        break;
+    case REG_IRQ_PENDING:
+        /* The pending interrupt mask */
+        value = s->pending & s->enabled;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: unimplemented register read 0x%02"HWADDR_PRIx"\n",
+                      __func__, addr);
+        break;
+    }
+
+    trace_goldfish_pic_read(s, s->idx, addr, size, value);
+
+    return value;
+}
+
+static void goldfish_pic_write(void *opaque, hwaddr addr,
+                               uint64_t value, unsigned size)
+{
+    GoldfishPICState *s = opaque;
+
+    trace_goldfish_pic_write(s, s->idx, addr, size, value);
+
+    switch (addr) {
+    case REG_IRQ_DISABLE_ALL:
+        s->enabled = 0;
+        s->pending = 0;
+        break;
+    case REG_DISABLE:
+        s->enabled &= ~value;
+        break;
+    case REG_ENABLE:
+        s->enabled |= value;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: unimplemented register write 0x%02"HWADDR_PRIx"\n",
+                      __func__, addr);
+        break;
+    }
+    goldfish_pic_update(s);
+}
+
+static const MemoryRegionOps goldfish_pic_ops = {
+    .read = goldfish_pic_read,
+    .write = goldfish_pic_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid.max_access_size = 4,
+    .impl.min_access_size = 4,
+    .impl.max_access_size = 4,
+};
+
+static void goldfish_pic_reset(DeviceState *dev)
+{
+    GoldfishPICState *s = GOLDFISH_PIC(dev);
+    int i;
+
+    trace_goldfish_pic_reset(s, s->idx);
+    s->pending = 0;
+    s->enabled = 0;
+
+    for (i = 0; i < ARRAY_SIZE(s->stats_irq_count); i++) {
+        s->stats_irq_count[i] = 0;
+    }
+}
+
+static void goldfish_pic_realize(DeviceState *dev, Error **errp)
+{
+    GoldfishPICState *s = GOLDFISH_PIC(dev);
+
+    trace_goldfish_pic_realize(s, s->idx);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &goldfish_pic_ops, s,
+                          "goldfish_pic", 0x24);
+}
+
+static const VMStateDescription vmstate_goldfish_pic = {
+    .name = "goldfish_pic",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(pending, GoldfishPICState),
+        VMSTATE_UINT32(enabled, GoldfishPICState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void goldfish_pic_instance_init(Object *obj)
+{
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
+    GoldfishPICState *s = GOLDFISH_PIC(obj);
+
+    trace_goldfish_pic_instance_init(s);
+
+    sysbus_init_mmio(dev, &s->iomem);
+    sysbus_init_irq(dev, &s->irq);
+
+    qdev_init_gpio_in(DEVICE(obj), goldfish_irq_request, GOLDFISH_PIC_IRQ_NB);
+}
+
+static Property goldfish_pic_properties[] = {
+    DEFINE_PROP_UINT8("index", GoldfishPICState, idx, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void goldfish_pic_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    InterruptStatsProviderClass *ic = INTERRUPT_STATS_PROVIDER_CLASS(oc);
+
+    dc->reset = goldfish_pic_reset;
+    dc->realize = goldfish_pic_realize;
+    dc->vmsd = &vmstate_goldfish_pic;
+    ic->get_statistics = goldfish_pic_get_statistics;
+    ic->print_info = goldfish_pic_print_info;
+    device_class_set_props(dc, goldfish_pic_properties);
+}
+
+static const TypeInfo goldfish_pic_info = {
+    .name = TYPE_GOLDFISH_PIC,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .class_init = goldfish_pic_class_init,
+    .instance_init = goldfish_pic_instance_init,
+    .instance_size = sizeof(GoldfishPICState),
+    .interfaces = (InterfaceInfo[]) {
+         { TYPE_INTERRUPT_STATS_PROVIDER },
+         { }
+    },
+};
+
+static void goldfish_pic_register_types(void)
+{
+    type_register_static(&goldfish_pic_info);
+}
+
+type_init(goldfish_pic_register_types)
diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 66bf0b90b47a..186cb5daa0ff 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -67,3 +67,6 @@ config SIFIVE_CLINT
 
 config SIFIVE_PLIC
     bool
+
+config GOLDFISH_PIC
+    bool
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 8df3656419e3..5fcb923dd13e 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -57,3 +57,4 @@ specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('xics_spapr.c', 'spapr_xi
 specific_ss.add(when: 'CONFIG_XIVE', if_true: files('xive.c'))
 specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
 		if_true: files('spapr_xive_kvm.c'))
+specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 45ddaf48df8e..c9ab17234b44 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -239,3 +239,11 @@ xive_end_source_read(uint8_t end_blk, uint32_t end_idx, uint64_t addr) "END 0x%x
 
 # pnv_xive.c
 pnv_xive_ic_hw_trigger(uint64_t addr, uint64_t val) "@0x%"PRIx64" val=0x%"PRIx64
+
+# goldfish_pic.c
+goldfish_irq_request(void *dev, int idx, int irq, int level) "pic: %p goldfish-irq.%d irq: %d level: %d"
+goldfish_pic_read(void *dev, int idx, unsigned int addr, unsigned int size, uint64_t value) "pic: %p goldfish-irq.%d reg: 0x%02x size: %d value: 0x%"PRIx64
+goldfish_pic_write(void *dev, int idx, unsigned int addr, unsigned int size, uint64_t value) "pic: %p goldfish-irq.%d reg: 0x%02x size: %d value: 0x%"PRIx64
+goldfish_pic_reset(void *dev, int idx) "pic: %p goldfish-irq.%d"
+goldfish_pic_realize(void *dev, int idx) "pic: %p goldfish-irq.%d"
+goldfish_pic_instance_init(void *dev) "pic: %p goldfish-irq"
-- 
2.29.2


