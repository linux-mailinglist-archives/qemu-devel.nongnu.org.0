Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0160965FB7F
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 07:34:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDgI4-0000LB-8E; Fri, 06 Jan 2023 01:33:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pDgI1-0000Jr-Ic
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 01:33:17 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pDgHx-0000Dg-Ge
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 01:33:17 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxrvCkwLdjKAkAAA--.443S3;
 Fri, 06 Jan 2023 14:33:08 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxg+WhwLdjihIVAA--.1106S5; 
 Fri, 06 Jan 2023 14:33:07 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 Tianrui Zhao <zhaotianrui@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 3/3] hw/intc/loongarch_pch: Change default irq number of pch
 irq controller
Date: Fri,  6 Jan 2023 14:33:05 +0800
Message-Id: <20230106063305.3919094-4-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230106063305.3919094-1-gaosong@loongson.cn>
References: <20230106063305.3919094-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxg+WhwLdjihIVAA--.1106S5
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXr1UGrWUAr1fGw48ury3Jwb_yoWrJr15pF
 ZrCFnakF4kWrWUXrn2v343Xwn7JFs3ury29F4a9Fy8CF43JrykXw1kJw4DXFyUtws5Jryq
 qrZ5C390v3WUXaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0xFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xAC
 xx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx2
 6rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
 xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
 cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
 AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
 14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
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

From: Tianrui Zhao <zhaotianrui@loongson.cn>

Change the default irq number of pch pic to 32, so that the irq
number of pch msi is 224(256 - 32), and move the 'PCH_PIC_IRQ_NUM'
macro to pci-host/ls7a.h and add prefix 'VIRT' on it to keep standard
format.

Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230104020518.2564263-4-zhaotianrui@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
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
index 35d4bce3b3..66be925068 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -616,7 +616,7 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
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


