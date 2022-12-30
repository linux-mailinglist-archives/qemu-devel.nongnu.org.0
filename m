Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85561659711
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 11:01:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBCBI-0003kw-Om; Fri, 30 Dec 2022 05:00:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaotianrui@loongson.cn>)
 id 1pBCBF-0003j6-ID
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 05:00:01 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhaotianrui@loongson.cn>) id 1pBCBD-0005Rr-Az
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 05:00:01 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxuuiXtq5jbnYJAA--.1207S3;
 Fri, 30 Dec 2022 17:59:51 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxtOWWtq5jCSAQAA--.53838S3; 
 Fri, 30 Dec 2022 17:59:51 +0800 (CST)
From: Tianrui Zhao <zhaotianrui@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 philmd@linaro.org
Subject: [PATCH v4 1/3] hw/intc/loongarch_pch_msi: add irq number property
Date: Fri, 30 Dec 2022 17:59:48 +0800
Message-Id: <20221230095950.2217103-2-zhaotianrui@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221230095950.2217103-1-zhaotianrui@loongson.cn>
References: <20221230095950.2217103-1-zhaotianrui@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxtOWWtq5jCSAQAA--.53838S3
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3XF43WF48Wr1xGF4fur1Dtrb_yoW7GFy5pr
 WDuFy5tr48Gw4UuFZ3G347ur98JFn7GFyIvF43KryxCr4UAr90q3WkJ39rWF1UK3yrGryq
 v34kCa9rW3WUCaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
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

This patch adds irq number property for loongarch msi interrupt
controller, and remove hard coding irq number macro.

Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
---
 hw/intc/loongarch_pch_msi.c         | 33 ++++++++++++++++++++++++++---
 hw/loongarch/virt.c                 | 13 +++++++-----
 include/hw/intc/loongarch_pch_msi.h |  3 ++-
 include/hw/pci-host/ls7a.h          |  1 -
 4 files changed, 40 insertions(+), 10 deletions(-)

diff --git a/hw/intc/loongarch_pch_msi.c b/hw/intc/loongarch_pch_msi.c
index b36d6d76e4..09d3890ade 100644
--- a/hw/intc/loongarch_pch_msi.c
+++ b/hw/intc/loongarch_pch_msi.c
@@ -32,7 +32,7 @@ static void loongarch_msi_mem_write(void *opaque, hwaddr addr,
      */
     irq_num = (val & 0xff) - s->irq_base;
     trace_loongarch_msi_set_irq(irq_num);
-    assert(irq_num < PCH_MSI_IRQ_NUM);
+    assert(irq_num < s->irq_num);
     qemu_set_irq(s->pch_msi_irq[irq_num], 1);
 }
 
@@ -49,6 +49,32 @@ static void pch_msi_irq_handler(void *opaque, int irq, int level)
     qemu_set_irq(s->pch_msi_irq[irq], level);
 }
 
+static void loongarch_pch_msi_realize(DeviceState *dev, Error **errp)
+{
+    LoongArchPCHMSI *s = LOONGARCH_PCH_MSI(dev);
+
+    if (!s->irq_num || s->irq_num  > PCH_MSI_IRQ_NUM) {
+        error_setg(errp, "Invalid 'msi_irq_num'");
+        return;
+    }
+
+    s->pch_msi_irq = g_new(qemu_irq, s->irq_num);
+    if (!s->pch_msi_irq) {
+        error_report("loongarch_pch_msi: fail to alloc memory");
+        exit(1);
+    }
+
+    qdev_init_gpio_out(dev, s->pch_msi_irq, s->irq_num);
+    qdev_init_gpio_in(dev, pch_msi_irq_handler, s->irq_num);
+}
+
+static void loongarch_pch_msi_unrealize(DeviceState *dev)
+{
+    LoongArchPCHMSI *s = LOONGARCH_PCH_MSI(dev);
+
+    g_free(s->pch_msi_irq);
+}
+
 static void loongarch_pch_msi_init(Object *obj)
 {
     LoongArchPCHMSI *s = LOONGARCH_PCH_MSI(obj);
@@ -59,12 +85,11 @@ static void loongarch_pch_msi_init(Object *obj)
     sysbus_init_mmio(sbd, &s->msi_mmio);
     msi_nonbroken = true;
 
-    qdev_init_gpio_out(DEVICE(obj), s->pch_msi_irq, PCH_MSI_IRQ_NUM);
-    qdev_init_gpio_in(DEVICE(obj), pch_msi_irq_handler, PCH_MSI_IRQ_NUM);
 }
 
 static Property loongarch_msi_properties[] = {
     DEFINE_PROP_UINT32("msi_irq_base", LoongArchPCHMSI, irq_base, 0),
+    DEFINE_PROP_UINT32("msi_irq_num",  LoongArchPCHMSI, irq_num, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -72,6 +97,8 @@ static void loongarch_pch_msi_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->realize = loongarch_pch_msi_realize;
+    dc->unrealize = loongarch_pch_msi_unrealize;
     device_class_set_props(dc, loongarch_msi_properties);
 }
 
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 958be74fa1..1e58346aeb 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -496,7 +496,7 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
     LoongArchCPU *lacpu;
     CPULoongArchState *env;
     CPUState *cpu_state;
-    int cpu, pin, i;
+    int cpu, pin, i, start, num;
 
     ipi = qdev_new(TYPE_LOONGARCH_IPI);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(ipi), &error_fatal);
@@ -576,14 +576,17 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
     }
 
     pch_msi = qdev_new(TYPE_LOONGARCH_PCH_MSI);
-    qdev_prop_set_uint32(pch_msi, "msi_irq_base", PCH_MSI_IRQ_START);
+    start   =  PCH_PIC_IRQ_NUM;
+    num = EXTIOI_IRQS - start;
+    qdev_prop_set_uint32(pch_msi, "msi_irq_base", start);
+    qdev_prop_set_uint32(pch_msi, "msi_irq_num", num);
     d = SYS_BUS_DEVICE(pch_msi);
     sysbus_realize_and_unref(d, &error_fatal);
     sysbus_mmio_map(d, 0, VIRT_PCH_MSI_ADDR_LOW);
-    for (i = 0; i < PCH_MSI_IRQ_NUM; i++) {
-        /* Connect 192 pch_msi irqs to extioi */
+    for (i = 0; i < num; i++) {
+        /* Connect pch_msi irqs to extioi */
         qdev_connect_gpio_out(DEVICE(d), i,
-                              qdev_get_gpio_in(extioi, i + PCH_MSI_IRQ_START));
+                              qdev_get_gpio_in(extioi, i + start));
     }
 
     loongarch_devices_init(pch_pic, lams);
diff --git a/include/hw/intc/loongarch_pch_msi.h b/include/hw/intc/loongarch_pch_msi.h
index 6d67560dea..c5a52bc327 100644
--- a/include/hw/intc/loongarch_pch_msi.h
+++ b/include/hw/intc/loongarch_pch_msi.h
@@ -15,8 +15,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(LoongArchPCHMSI, LOONGARCH_PCH_MSI)
 
 struct LoongArchPCHMSI {
     SysBusDevice parent_obj;
-    qemu_irq pch_msi_irq[PCH_MSI_IRQ_NUM];
+    qemu_irq *pch_msi_irq;
     MemoryRegion msi_mmio;
     /* irq base passed to upper extioi intc */
     unsigned int irq_base;
+    unsigned int irq_num;
 };
diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
index df7fa55a30..6443327bd7 100644
--- a/include/hw/pci-host/ls7a.h
+++ b/include/hw/pci-host/ls7a.h
@@ -34,7 +34,6 @@
  */
 #define PCH_PIC_IRQ_OFFSET       64
 #define VIRT_DEVICE_IRQS         16
-#define VIRT_PCI_IRQS            48
 #define VIRT_UART_IRQ            (PCH_PIC_IRQ_OFFSET + 2)
 #define VIRT_UART_BASE           0x1fe001e0
 #define VIRT_UART_SIZE           0X100
-- 
2.31.1


