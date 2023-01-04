Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 137D065CBBE
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 03:06:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCtA2-0003BP-Tf; Tue, 03 Jan 2023 21:05:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaotianrui@loongson.cn>)
 id 1pCt9r-00039d-NW
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 21:05:35 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhaotianrui@loongson.cn>) id 1pCt9m-00060Z-2G
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 21:05:32 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Cx5vDi3rRjCEkKAA--.21926S3;
 Wed, 04 Jan 2023 10:05:22 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxTuTf3rRj+20TAA--.61228S5; 
 Wed, 04 Jan 2023 10:05:21 +0800 (CST)
From: Tianrui Zhao <zhaotianrui@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 philmd@linaro.org
Subject: [PATCH v5 3/3] hw/intc/loongarch_pch: Change default irq number of
 pch irq controller
Date: Wed,  4 Jan 2023 10:05:18 +0800
Message-Id: <20230104020518.2564263-4-zhaotianrui@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230104020518.2564263-1-zhaotianrui@loongson.cn>
References: <20230104020518.2564263-1-zhaotianrui@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=a
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxTuTf3rRj+20TAA--.61228S5
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
 ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
 BjDU0xBIdaVrnRJUUUyG1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0I
 I2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0
 Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7
 xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wASzI0E
 04IjxsIE14AKx2xKxwAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrV
 C2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48J
 M4kE6I8I3I0E14AKx2xKxVC2ax8xMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY2
 0_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
 Y4vE14v26r1j6r18MI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
 IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
 6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
 AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
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

Change the default irq number of pch pic to 32, so that the irq
number of pch msi is 224(256 - 32), and move the 'PCH_PIC_IRQ_NUM'
macro to pci-host/ls7a.h and add prefix 'VIRT' on it to keep standard
format.

Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/loongarch_pch_pic.c         | 3 ++-
 hw/loongarch/virt.c                 | 2 +-
 include/hw/intc/loongarch_pch_msi.h | 6 +++---
 include/hw/intc/loongarch_pch_pic.h | 1 -
 include/hw/pci-host/ls7a.h          | 1 +
 5 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/intc/loongarch_pch_pic.c b/hw/intc/loongarch_pch_pic.c
index 33966e7bac..9208fc4460 100644
--- a/hw/intc/loongarch_pch_pic.c
+++ b/hw/intc/loongarch_pch_pic.c
@@ -9,6 +9,7 @@
 #include "qemu/bitops.h"
 #include "hw/sysbus.h"
 #include "hw/loongarch/virt.h"
+#include "hw/pci-host/ls7a.h"
 #include "hw/irq.h"
 #include "hw/intc/loongarch_pch_pic.h"
 #include "hw/qdev-properties.h"
@@ -377,7 +378,7 @@ static void loongarch_pch_pic_realize(DeviceState *dev, Error **errp)
 {
     LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(dev);
 
-    if (!s->irq_num || s->irq_num  > PCH_PIC_IRQ_NUM) {
+    if (!s->irq_num || s->irq_num  > VIRT_PCH_PIC_IRQ_NUM) {
         error_setg(errp, "Invalid 'pic_irq_num'");
         return;
     }
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index a39704e1e7..8f3bb85d58 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -559,7 +559,7 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
     }
 
     pch_pic = qdev_new(TYPE_LOONGARCH_PCH_PIC);
-    num = PCH_PIC_IRQ_NUM;
+    num = VIRT_PCH_PIC_IRQ_NUM;
     qdev_prop_set_uint32(pch_pic, "pch_pic_irq_num", num);
     d = SYS_BUS_DEVICE(pch_pic);
     sysbus_realize_and_unref(d, &error_fatal);
diff --git a/include/hw/intc/loongarch_pch_msi.h b/include/hw/intc/loongarch_pch_msi.h
index c5a52bc327..832e69fa32 100644
--- a/include/hw/intc/loongarch_pch_msi.h
+++ b/include/hw/intc/loongarch_pch_msi.h
@@ -8,10 +8,10 @@
 #define TYPE_LOONGARCH_PCH_MSI "loongarch_pch_msi"
 OBJECT_DECLARE_SIMPLE_TYPE(LoongArchPCHMSI, LOONGARCH_PCH_MSI)
 
-/* Msi irq start start from 64 to 255 */
-#define PCH_MSI_IRQ_START   64
+/* MSI irq start from 32 to 255 */
+#define PCH_MSI_IRQ_START   32
 #define PCH_MSI_IRQ_END     255
-#define PCH_MSI_IRQ_NUM     192
+#define PCH_MSI_IRQ_NUM     224
 
 struct LoongArchPCHMSI {
     SysBusDevice parent_obj;
diff --git a/include/hw/intc/loongarch_pch_pic.h b/include/hw/intc/loongarch_pch_pic.h
index efae5fa8e9..258e3b3294 100644
--- a/include/hw/intc/loongarch_pch_pic.h
+++ b/include/hw/intc/loongarch_pch_pic.h
@@ -9,7 +9,6 @@
 #define PCH_PIC_NAME(name) TYPE_LOONGARCH_PCH_PIC#name
 OBJECT_DECLARE_SIMPLE_TYPE(LoongArchPCHPIC, LOONGARCH_PCH_PIC)
 
-#define PCH_PIC_IRQ_NUM                 64
 #define PCH_PIC_INT_ID_VAL              0x7000000UL
 #define PCH_PIC_INT_ID_VER              0x1UL
 
diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
index 6443327bd7..8061c4bbbf 100644
--- a/include/hw/pci-host/ls7a.h
+++ b/include/hw/pci-host/ls7a.h
@@ -32,6 +32,7 @@
  * 0 ~ 16 irqs used for non-pci device while 16 ~ 64 irqs
  * used for pci device.
  */
+#define VIRT_PCH_PIC_IRQ_NUM     32
 #define PCH_PIC_IRQ_OFFSET       64
 #define VIRT_DEVICE_IRQS         16
 #define VIRT_UART_IRQ            (PCH_PIC_IRQ_OFFSET + 2)
-- 
2.31.1


