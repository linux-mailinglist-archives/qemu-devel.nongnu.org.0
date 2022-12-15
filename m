Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8655464D6B2
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 07:51:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5i4e-0000nB-5q; Thu, 15 Dec 2022 01:50:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaotianrui@loongson.cn>)
 id 1p5i4a-0000jg-BV
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 01:50:28 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhaotianrui@loongson.cn>) id 1p5i4X-0007Mx-Oa
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 01:50:28 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxdPClw5pj0cEFAA--.13446S3;
 Thu, 15 Dec 2022 14:50:13 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxg+Wkw5pjUDIAAA--.1488S4; 
 Thu, 15 Dec 2022 14:50:13 +0800 (CST)
From: Tianrui Zhao <zhaotianrui@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 philmd@linaro.org
Subject: [PATCH v1 2/2] hw/intc/loongarch_pch_pic: add irq number property
Date: Thu, 15 Dec 2022 14:50:11 +0800
Message-Id: <20221215065011.2133471-3-zhaotianrui@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221215065011.2133471-1-zhaotianrui@loongson.cn>
References: <20221215065011.2133471-1-zhaotianrui@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxg+Wkw5pjUDIAAA--.1488S4
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxtr43tw13CryUJw1kXw1UJrb_yoW7Zr47pF
 W7ZFW3tF4kJF47Xrn7Zw15uwn3JFs29ry29anIkryxCrn8JryYqF1kJ3yDXF1UK3ykJryq
 vrZ5CayY93WUAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bn8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
 1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=zhaotianrui@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

With loongarch 7A1000 manual, irq number supported can be set
in PCH_PIC_INT_ID_HI register. This patch adds irq number property
for loongarch_pch_pic, so that virt machine can set different
irq number when pch_pic intc is added.

Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
---
 hw/intc/loongarch_pch_pic.c         | 29 +++++++++++++++++++++++++----
 hw/loongarch/virt.c                 | 10 ++++++----
 include/hw/intc/loongarch_pch_pic.h |  5 ++---
 3 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/hw/intc/loongarch_pch_pic.c b/hw/intc/loongarch_pch_pic.c
index 3380b09807..26f36501b4 100644
--- a/hw/intc/loongarch_pch_pic.c
+++ b/hw/intc/loongarch_pch_pic.c
@@ -10,6 +10,7 @@
 #include "hw/loongarch/virt.h"
 #include "hw/irq.h"
 #include "hw/intc/loongarch_pch_pic.h"
+#include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "trace.h"
 
@@ -40,7 +41,7 @@ static void pch_pic_irq_handler(void *opaque, int irq, int level)
     LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(opaque);
     uint64_t mask = 1ULL << irq;
 
-    assert(irq < PCH_PIC_IRQ_NUM);
+    assert(irq < s->irq_num);
     trace_loongarch_pch_pic_irq_handler(irq, level);
 
     if (s->intedge & mask) {
@@ -78,7 +79,12 @@ static uint64_t loongarch_pch_pic_low_readw(void *opaque, hwaddr addr,
         val = PCH_PIC_INT_ID_VAL;
         break;
     case PCH_PIC_INT_ID_HI:
-        val = PCH_PIC_INT_ID_NUM;
+        /*
+         * With 7A1000 manual
+         *   bit  0-15 pch irqchip version
+         *   bit 16-31 irq number supported with pch irqchip
+         */
+        val = PCH_PIC_INT_ID_VER + ((s->irq_num - 1) << 16);
         break;
     case PCH_PIC_INT_MASK_LO:
         val = (uint32_t)s->int_mask;
@@ -365,6 +371,16 @@ static void loongarch_pch_pic_reset(DeviceState *d)
     s->int_polarity = 0x0;
 }
 
+static void loongarch_pch_pic_realize(DeviceState *dev, Error **errp)
+{
+    LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(dev);
+
+    assert(s->irq_num > 0 && (s->irq_num <= 64));
+
+    qdev_init_gpio_out(dev, s->parent_irq, s->irq_num);
+    qdev_init_gpio_in(dev, pch_pic_irq_handler, s->irq_num);
+}
+
 static void loongarch_pch_pic_init(Object *obj)
 {
     LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(obj);
@@ -382,10 +398,13 @@ static void loongarch_pch_pic_init(Object *obj)
     sysbus_init_mmio(sbd, &s->iomem8);
     sysbus_init_mmio(sbd, &s->iomem32_high);
 
-    qdev_init_gpio_out(DEVICE(obj), s->parent_irq, PCH_PIC_IRQ_NUM);
-    qdev_init_gpio_in(DEVICE(obj), pch_pic_irq_handler, PCH_PIC_IRQ_NUM);
 }
 
+static Property loongarch_pch_pic_properties[] = {
+    DEFINE_PROP_UINT32("pch_pic_irq_num",  LoongArchPCHPIC, irq_num, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static const VMStateDescription vmstate_loongarch_pch_pic = {
     .name = TYPE_LOONGARCH_PCH_PIC,
     .version_id = 1,
@@ -411,8 +430,10 @@ static void loongarch_pch_pic_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->realize = loongarch_pch_pic_realize;
     dc->reset = loongarch_pch_pic_reset;
     dc->vmsd = &vmstate_loongarch_pch_pic;
+    device_class_set_props(dc, loongarch_pch_pic_properties);
 }
 
 static const TypeInfo loongarch_pch_pic_info = {
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 3547d5f711..761eb81c65 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -559,6 +559,8 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
     }
 
     pch_pic = qdev_new(TYPE_LOONGARCH_PCH_PIC);
+    num = PCH_PIC_IRQ_NUM;
+    qdev_prop_set_uint32(pch_pic, "pch_pic_irq_num", num);
     d = SYS_BUS_DEVICE(pch_pic);
     sysbus_realize_and_unref(d, &error_fatal);
     memory_region_add_subregion(get_system_memory(), VIRT_IOAPIC_REG_BASE,
@@ -570,13 +572,13 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
                             VIRT_IOAPIC_REG_BASE + PCH_PIC_INT_STATUS_LO,
                             sysbus_mmio_get_region(d, 2));
 
-    /* Connect 64 pch_pic irqs to extioi */
-    for (int i = 0; i < PCH_PIC_IRQ_NUM; i++) {
+    /* Connect pch_pic irqs to extioi */
+    for (int i = 0; i < num; i++) {
         qdev_connect_gpio_out(DEVICE(d), i, qdev_get_gpio_in(extioi, i));
     }
 
     pch_msi = qdev_new(TYPE_LOONGARCH_PCH_MSI);
-    start   =  PCH_PIC_IRQ_NUM;
+    start   =  num;
     num = 256 - start;
     qdev_prop_set_uint32(pch_msi, "msi_irq_base", start);
     qdev_prop_set_uint32(pch_msi, "msi_irq_num", num);
@@ -584,7 +586,7 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
     sysbus_realize_and_unref(d, &error_fatal);
     sysbus_mmio_map(d, 0, VIRT_PCH_MSI_ADDR_LOW);
     for (i = 0; i < num; i++) {
-        /* Connect 192 pch_msi irqs to extioi */
+        /* Connect pch_msi irqs to extioi */
         qdev_connect_gpio_out(DEVICE(d), i,
                               qdev_get_gpio_in(extioi, i + start));
     }
diff --git a/include/hw/intc/loongarch_pch_pic.h b/include/hw/intc/loongarch_pch_pic.h
index 2d4aa9ed6f..ba3a47fa88 100644
--- a/include/hw/intc/loongarch_pch_pic.h
+++ b/include/hw/intc/loongarch_pch_pic.h
@@ -9,11 +9,9 @@
 #define PCH_PIC_NAME(name) TYPE_LOONGARCH_PCH_PIC#name
 OBJECT_DECLARE_SIMPLE_TYPE(LoongArchPCHPIC, LOONGARCH_PCH_PIC)
 
-#define PCH_PIC_IRQ_START               0
-#define PCH_PIC_IRQ_END                 63
 #define PCH_PIC_IRQ_NUM                 64
 #define PCH_PIC_INT_ID_VAL              0x7000000UL
-#define PCH_PIC_INT_ID_NUM              0x3f0001UL
+#define PCH_PIC_INT_ID_VER              0x1UL
 
 #define PCH_PIC_INT_ID_LO               0x00
 #define PCH_PIC_INT_ID_HI               0x04
@@ -66,4 +64,5 @@ struct LoongArchPCHPIC {
     MemoryRegion iomem32_low;
     MemoryRegion iomem32_high;
     MemoryRegion iomem8;
+    unsigned int  irq_num;
 };
-- 
2.31.1


