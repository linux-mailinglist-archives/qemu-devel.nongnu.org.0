Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798CE65723F
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 04:08:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAMn4-00084l-BP; Tue, 27 Dec 2022 22:07:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1pAMn0-00084J-AB
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 22:07:34 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1pAMmx-0003cw-Ss
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 22:07:34 -0500
Received: from loongson.cn (unknown [10.2.9.158])
 by gateway (Coremail) with SMTP id _____8Cx5vDnsqtj7+0IAA--.19535S3;
 Wed, 28 Dec 2022 11:07:20 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.9.158])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bxjb7nsqtjdV4OAA--.22021S2; 
 Wed, 28 Dec 2022 11:07:19 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Cc: Song Gao <gaosong@loongson.cn>,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/loongarch/virt: rename PCH_PIC_IRQ_OFFSET with
 VIRT_GSI_BASE
Date: Wed, 28 Dec 2022 11:07:19 +0800
Message-Id: <20221228030719.991878-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bxjb7nsqtjdV4OAA--.22021S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxJFWkAF1fKr4DJF4fKrWfKrg_yoWrCFy3pa
 98uF9Iqr40gay7Xr92v3W5uasxJrsxCay29r43WryxKF17Kryjqry8Aws8tFyUXrZ5JFW2
 qrykt3s2g3WUXrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b7kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS
 0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
 AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1l
 Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC20s
 026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
 JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
 v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xva
 j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJV
 W8JbIYCTnIWIevJa73UjIFyTuYvjxUzsqWUUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=maobibo@loongson.cn;
 helo=loongson.cn
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

In theory gsi base can start from 0 on loongarch virt machine,
however gsi base is hard-coded in linux kernel loongarch system,
else system fails to boot.

This patch renames macro PCH_PIC_IRQ_OFFSET with VIRT_GSI_BASE,
keeps value unchanged. GSI base is common concept in acpi spec
and easy to understand.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 hw/loongarch/acpi-build.c  |  2 +-
 hw/loongarch/virt.c        |  8 ++++----
 include/hw/pci-host/ls7a.h | 17 +++++++++--------
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
index c2b237736d..33e04e4b76 100644
--- a/hw/loongarch/acpi-build.c
+++ b/hw/loongarch/acpi-build.c
@@ -272,7 +272,7 @@ static void build_pci_device_aml(Aml *scope, LoongArchMachineState *lams)
         .pio.size    = VIRT_PCI_IO_SIZE,
         .ecam.base   = VIRT_PCI_CFG_BASE,
         .ecam.size   = VIRT_PCI_CFG_SIZE,
-        .irq         = PCH_PIC_IRQ_OFFSET + VIRT_DEVICE_IRQS,
+        .irq         = VIRT_GSI_BASE + VIRT_DEVICE_IRQS,
         .bus         = lams->pci_bus,
     };
 
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index c8a495ea30..3754e2151f 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -432,7 +432,7 @@ static DeviceState *create_acpi_ged(DeviceState *pch_pic, LoongArchMachineState
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, VIRT_GED_REG_ADDR);
 
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0,
-                       qdev_get_gpio_in(pch_pic, VIRT_SCI_IRQ - PCH_PIC_IRQ_OFFSET));
+                       qdev_get_gpio_in(pch_pic, VIRT_SCI_IRQ - VIRT_GSI_BASE));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     return dev;
 }
@@ -452,7 +452,7 @@ static DeviceState *create_platform_bus(DeviceState *pch_pic)
 
     sysbus = SYS_BUS_DEVICE(dev);
     for (i = 0; i < VIRT_PLATFORM_BUS_NUM_IRQS; i++) {
-        irq = VIRT_PLATFORM_BUS_IRQ - PCH_PIC_IRQ_OFFSET + i;
+        irq = VIRT_PLATFORM_BUS_IRQ - VIRT_GSI_BASE + i;
         sysbus_connect_irq(sysbus, i, qdev_get_gpio_in(pch_pic, irq));
     }
 
@@ -509,7 +509,7 @@ static void loongarch_devices_init(DeviceState *pch_pic, LoongArchMachineState *
 
     serial_mm_init(get_system_memory(), VIRT_UART_BASE, 0,
                    qdev_get_gpio_in(pch_pic,
-                                    VIRT_UART_IRQ - PCH_PIC_IRQ_OFFSET),
+                                    VIRT_UART_IRQ - VIRT_GSI_BASE),
                    115200, serial_hd(0), DEVICE_LITTLE_ENDIAN);
     fdt_add_uart_node(lams);
 
@@ -531,7 +531,7 @@ static void loongarch_devices_init(DeviceState *pch_pic, LoongArchMachineState *
     create_unimplemented_device("pci-dma-cfg", 0x1001041c, 0x4);
     sysbus_create_simple("ls7a_rtc", VIRT_RTC_REG_BASE,
                          qdev_get_gpio_in(pch_pic,
-                         VIRT_RTC_IRQ - PCH_PIC_IRQ_OFFSET));
+                         VIRT_RTC_IRQ - VIRT_GSI_BASE));
     fdt_add_rtc_node(lams);
 
     pm_mem = g_new(MemoryRegion, 1);
diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
index df7fa55a30..194aac905e 100644
--- a/include/hw/pci-host/ls7a.h
+++ b/include/hw/pci-host/ls7a.h
@@ -28,24 +28,25 @@
 #define VIRT_PCH_MSI_ADDR_LOW    0x2FF00000UL
 
 /*
- * According to the kernel pch irq start from 64 offset
- * 0 ~ 16 irqs used for non-pci device while 16 ~ 64 irqs
- * used for pci device.
+ * GSI_BASE is hard-coded with 64 in linux kernel, else kernel fails to boot
+ * 0  - 15  GSI for ISA devices even if there is no ISA devices
+ * 16 - 63  GSI for CPU devices such as timers/perf monitor etc
+ * 64 -     GSI for external devices
  */
-#define PCH_PIC_IRQ_OFFSET       64
+#define VIRT_GSI_BASE            64
 #define VIRT_DEVICE_IRQS         16
 #define VIRT_PCI_IRQS            48
-#define VIRT_UART_IRQ            (PCH_PIC_IRQ_OFFSET + 2)
+#define VIRT_UART_IRQ            (VIRT_GSI_BASE + 2)
 #define VIRT_UART_BASE           0x1fe001e0
 #define VIRT_UART_SIZE           0X100
-#define VIRT_RTC_IRQ             (PCH_PIC_IRQ_OFFSET + 3)
+#define VIRT_RTC_IRQ             (VIRT_GSI_BASE + 3)
 #define VIRT_MISC_REG_BASE       (VIRT_PCH_REG_BASE + 0x00080000)
 #define VIRT_RTC_REG_BASE        (VIRT_MISC_REG_BASE + 0x00050100)
 #define VIRT_RTC_LEN             0x100
-#define VIRT_SCI_IRQ             (PCH_PIC_IRQ_OFFSET + 4)
+#define VIRT_SCI_IRQ             (VIRT_GSI_BASE + 4)
 
 #define VIRT_PLATFORM_BUS_BASEADDRESS   0x16000000
 #define VIRT_PLATFORM_BUS_SIZE          0x2000000
 #define VIRT_PLATFORM_BUS_NUM_IRQS      2
-#define VIRT_PLATFORM_BUS_IRQ           69
+#define VIRT_PLATFORM_BUS_IRQ           (VIRT_GSI_BASE + 5)
 #endif
-- 
2.27.0


