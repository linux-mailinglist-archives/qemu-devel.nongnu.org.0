Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DE0659710
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 11:01:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBCBH-0003k7-JV; Fri, 30 Dec 2022 05:00:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaotianrui@loongson.cn>)
 id 1pBCBE-0003ii-Q5
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 05:00:00 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhaotianrui@loongson.cn>) id 1pBCBC-0005Rs-Gd
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 05:00:00 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxB_GXtq5jcnYJAA--.20561S3;
 Fri, 30 Dec 2022 17:59:51 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxtOWWtq5jCSAQAA--.53838S5; 
 Fri, 30 Dec 2022 17:59:51 +0800 (CST)
From: Tianrui Zhao <zhaotianrui@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 philmd@linaro.org
Subject: [PATCH v4 3/3] hw/intc/loongarch_pch: Change default irq number of
 pch irq controller
Date: Fri, 30 Dec 2022 17:59:50 +0800
Message-Id: <20221230095950.2217103-4-zhaotianrui@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221230095950.2217103-1-zhaotianrui@loongson.cn>
References: <20221230095950.2217103-1-zhaotianrui@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxtOWWtq5jCSAQAA--.53838S5
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXr1UGF1UJr4rWFW3CrWfZrb_yoW5tr1kpF
 ZrCF9akF4kWrWUXr92v343Xwn7JFs3ury29F4a9Fy8Cr43JrykXw1kJw4DWFyUKws5Jryq
 qrZ5C3yYv3WUXaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bn8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
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

Change the default irq number of pch pic to 32, so that the irq
number of pch msi is 224(256 - 32), and move the 'PCH_PIC_IRQ_NUM'
macro to pci-host/ls7a.h and add prefix 'VIRT' on it to keep standard
format.

Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
---
 hw/intc/loongarch_pch_pic.c         | 3 ++-
 hw/loongarch/virt.c                 | 2 +-
 include/hw/intc/loongarch_pch_msi.h | 6 +++---
 include/hw/intc/loongarch_pch_pic.h | 1 -
 include/hw/pci-host/ls7a.h          | 1 +
 5 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/intc/loongarch_pch_pic.c b/hw/intc/loongarch_pch_pic.c
index 1440195837..47fd5f20e0 100644
--- a/hw/intc/loongarch_pch_pic.c
+++ b/hw/intc/loongarch_pch_pic.c
@@ -8,6 +8,7 @@
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
 #include "hw/loongarch/virt.h"
+#include "hw/pci-host/ls7a.h"
 #include "hw/irq.h"
 #include "hw/intc/loongarch_pch_pic.h"
 #include "hw/qdev-properties.h"
@@ -376,7 +377,7 @@ static void loongarch_pch_pic_realize(DeviceState *dev, Error **errp)
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
index c5a52bc327..a1172f56ff 100644
--- a/include/hw/intc/loongarch_pch_msi.h
+++ b/include/hw/intc/loongarch_pch_msi.h
@@ -8,10 +8,10 @@
 #define TYPE_LOONGARCH_PCH_MSI "loongarch_pch_msi"
 OBJECT_DECLARE_SIMPLE_TYPE(LoongArchPCHMSI, LOONGARCH_PCH_MSI)
 
-/* Msi irq start start from 64 to 255 */
-#define PCH_MSI_IRQ_START   64
+/* Msi irq start start from 32 to 255 */
+#define PCH_MSI_IRQ_START   32
 #define PCH_MSI_IRQ_END     255
-#define PCH_MSI_IRQ_NUM     192
+#define PCH_MSI_IRQ_NUM     224
 
 struct LoongArchPCHMSI {
     SysBusDevice parent_obj;
diff --git a/include/hw/intc/loongarch_pch_pic.h b/include/hw/intc/loongarch_pch_pic.h
index ba3a47fa88..4ea8808592 100644
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


