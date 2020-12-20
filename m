Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4B82DF53C
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Dec 2020 12:32:33 +0100 (CET)
Received: from localhost ([::1]:52612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqwwy-0001z1-A2
	for lists+qemu-devel@lfdr.de; Sun, 20 Dec 2020 06:32:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqwr5-00059y-Qw
 for qemu-devel@nongnu.org; Sun, 20 Dec 2020 06:26:27 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:51951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqwr1-0005Rc-Tg
 for qemu-devel@nongnu.org; Sun, 20 Dec 2020 06:26:27 -0500
Received: from localhost.localdomain ([82.252.144.198]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MulVd-1jzXFn3sGZ-00rpbG; Sun, 20 Dec 2020 12:26:21 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/7] intc: add goldfish-pic
Date: Sun, 20 Dec 2020 12:26:11 +0100
Message-Id: <20201220112615.933036-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201220112615.933036-1-laurent@vivier.eu>
References: <20201220112615.933036-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UoQh7u5RumQABmqDqrdM5kdCGvBRHhCLVuj5LB/8fuNYeZBFOJ7
 34fWoDsfH3eEhK+OJvy1ixoV3RMfCVOM230U88PJDbEZ09pVLQAAPap3IZGCXU8cEoQmEmR
 nqws9qps9j977DzdeUYp2DeQ0I+X79qwgWA+ofh5UMvrbmAXIGZRKNqlEpD9eRnEtkwE1iN
 rXl+IRDL1eF2jygJ0/47A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Z4eXPgt/GXk=:a0wV4OOc2Mokc4kHFGLkKf
 b1yEUPZdgpSCw6exnrlVNNn53wKVs5NGwwKQOcphWM/BX7Uda6jfcyX7hubzmtbd10aitL+jz
 9G4r4lbefbt4oWgZD3hMFE0/vk4AXshIYU26R00+qHFkuPE0rjpyKwbe5ZpTk8AEQ0TlBMlFA
 IHx/w8hwIJfGY4oBvttqvwaV4Hr9k8CZcBb5IIWzQLmPgLjNLRW9MtApdWrS6o+Ti/+5dxplL
 BafMTXMITaI9rXGDlGEeNweqOJgZp7zcHOz3UOchOB3fBF8jaHEzmzrhuQeUf9b15/mRH7QDk
 TZInVESlxj1jFyMKQC0SOubn8KsmKkBgeLF5WLLJmcs9D1mNKA1p3CaHttsfJHB8y2LywhZjm
 f62wwQ0Kb1MWDNFUzCw8cC2WPbkZl8/Neov+1IVPIOtpSqx3BUwmx389ZsRNdxEFEiUILav2W
 7XOVXNY3XA==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/intc/goldfish_pic.h |  33 +++++
 hw/intc/goldfish_pic.c         | 214 +++++++++++++++++++++++++++++++++
 hw/intc/Kconfig                |   3 +
 hw/intc/meson.build            |   1 +
 hw/intc/trace-events           |   8 ++
 5 files changed, 259 insertions(+)
 create mode 100644 include/hw/intc/goldfish_pic.h
 create mode 100644 hw/intc/goldfish_pic.c

diff --git a/include/hw/intc/goldfish_pic.h b/include/hw/intc/goldfish_pic.h
new file mode 100644
index 000000000000..26e7ca75a3ec
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
+    int idx;
+};
+
+#endif
diff --git a/hw/intc/goldfish_pic.c b/hw/intc/goldfish_pic.c
new file mode 100644
index 000000000000..4ed08b17cfe2
--- /dev/null
+++ b/hw/intc/goldfish_pic.c
@@ -0,0 +1,214 @@
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
+    static int counter;
+
+    s->idx = counter++;
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
+    trace_goldfish_pic_instance_init(s, s->idx);
+
+    sysbus_init_mmio(dev, &s->iomem);
+    sysbus_init_irq(dev, &s->irq);
+
+    qdev_init_gpio_in(DEVICE(obj), goldfish_irq_request, GOLDFISH_PIC_IRQ_NB);
+}
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
index d07954086a59..7ed79e7ac29f 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -73,3 +73,6 @@ config SIFIVE_CLINT
 
 config SIFIVE_PLIC
     bool
+
+config GOLDFISH_PIC
+    bool
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 7c3e9daf586e..8a5dfe4289ae 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -54,3 +54,4 @@ specific_ss.add(when: 'CONFIG_XICS_SPAPR', if_true: files('xics_spapr.c'))
 specific_ss.add(when: 'CONFIG_XIVE', if_true: files('xive.c'))
 specific_ss.add(when: 'CONFIG_XIVE_KVM', if_true: files('spapr_xive_kvm.c'))
 specific_ss.add(when: 'CONFIG_XIVE_SPAPR', if_true: files('spapr_xive.c'))
+specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 8ed397a0d587..e9b64ee568fd 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -236,3 +236,11 @@ xive_tctx_tm_write(uint64_t offset, unsigned int size, uint64_t value) "@0x0x%"P
 xive_tctx_tm_read(uint64_t offset, unsigned int size, uint64_t value) "@0x0x%"PRIx64" sz=%d val=0x%" PRIx64
 xive_presenter_notify(uint8_t nvt_blk, uint32_t nvt_idx, uint8_t ring) "found NVT 0x%x/0x%x ring=0x%x"
 xive_end_source_read(uint8_t end_blk, uint32_t end_idx, uint64_t addr) "END 0x%x/0x%x @0x0x%"PRIx64
+
+# goldfish_pic.c
+goldfish_irq_request(void *dev, int idx, int irq, int level) "pic: %p goldfish-irq.%d irq: %d level: %d"
+goldfish_pic_read(void *dev, int idx, unsigned int addr, unsigned int size, uint64_t value) "pic: %p goldfish-irq.%d reg: 0x%02x size: %d value: 0x%"PRIx64
+goldfish_pic_write(void *dev, int idx, unsigned int addr, unsigned int size, uint64_t value) "pic: %p goldfish-irq.%d reg: 0x%02x size: %d value: 0x%"PRIx64
+goldfish_pic_reset(void *dev, int idx) "pic: %p goldfish-irq.%d"
+goldfish_pic_realize(void *dev, int idx) "pic: %p goldfish-irq.%d"
+goldfish_pic_instance_init(void *dev, int idx) "pic: %p goldfish-irq.%d"
-- 
2.29.2


