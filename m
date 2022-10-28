Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5C7610762
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 03:43:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooEMA-00029d-Lc; Thu, 27 Oct 2022 21:40:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1ooEM7-00028j-GL
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 21:40:19 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1ooEM4-0007sE-Ta
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 21:40:19 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxDdn5MltjEP4CAA--.11398S3;
 Fri, 28 Oct 2022 09:40:09 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxXuD4MltjbxcGAA--.21470S4; 
 Fri, 28 Oct 2022 09:40:08 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 philmd@linaro.org
Subject: [PATCH v2 2/3] hw/loongarch: Improve fdt for LoongArch virt machine
Date: Fri, 28 Oct 2022 09:40:06 +0800
Message-Id: <20221028014007.2718352-3-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221028014007.2718352-1-yangxiaojuan@loongson.cn>
References: <20221028014007.2718352-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxXuD4MltjbxcGAA--.21470S4
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXr4UAr1rZw4xGF4fWw4rKrg_yoW5Ar18pF
 ZrCFn5ur48XF17WryS9a43uw43Ars7Cay2qr4furW0yFyUW34UXw4xC39xtFyUXrsYqFn0
 vFZ5t34fW3WI9rJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0AFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x
 0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E
 6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4IE7x
 kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
 6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
 8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE
 2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42
 xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
 7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add new items into LoongArch FDT, including rtc and uart info.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/loongarch/virt.c        | 31 +++++++++++++++++++++++++++++++
 include/hw/pci-host/ls7a.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index fe33e7e3e4..eed9d591e7 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -42,6 +42,35 @@
 #include "hw/display/ramfb.h"
 #include "hw/mem/pc-dimm.h"
 
+static void fdt_add_rtc_node(LoongArchMachineState *lams)
+{
+    char *nodename;
+    hwaddr base = VIRT_RTC_REG_BASE;
+    hwaddr size = VIRT_RTC_LEN;
+    MachineState *ms = MACHINE(lams);
+
+    nodename = g_strdup_printf("/rtc@%" PRIx64, base);
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop_string(ms->fdt, nodename, "compatible", "loongson,ls7a-rtc");
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg", 0x0, base, size);
+    g_free(nodename);
+}
+
+static void fdt_add_uart_node(LoongArchMachineState *lams)
+{
+    char *nodename;
+    hwaddr base = VIRT_UART_BASE;
+    hwaddr size = VIRT_UART_SIZE;
+    MachineState *ms = MACHINE(lams);
+
+    nodename = g_strdup_printf("/serial@%" PRIx64, base);
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop_string(ms->fdt, nodename, "compatible", "ns16550a");
+    qemu_fdt_setprop_cells(ms->fdt, nodename, "reg", 0x0, base, 0x0, size);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "clock-frequency", 100000000);
+    g_free(nodename);
+}
+
 static void create_fdt(LoongArchMachineState *lams)
 {
     MachineState *ms = MACHINE(lams);
@@ -422,6 +451,7 @@ static void loongarch_devices_init(DeviceState *pch_pic, LoongArchMachineState *
                    qdev_get_gpio_in(pch_pic,
                                     VIRT_UART_IRQ - PCH_PIC_IRQ_OFFSET),
                    115200, serial_hd(0), DEVICE_LITTLE_ENDIAN);
+    fdt_add_uart_node(lams);
 
     /* Network init */
     for (i = 0; i < nb_nics; i++) {
@@ -442,6 +472,7 @@ static void loongarch_devices_init(DeviceState *pch_pic, LoongArchMachineState *
     sysbus_create_simple("ls7a_rtc", VIRT_RTC_REG_BASE,
                          qdev_get_gpio_in(pch_pic,
                          VIRT_RTC_IRQ - PCH_PIC_IRQ_OFFSET));
+    fdt_add_rtc_node(lams);
 
     pm_mem = g_new(MemoryRegion, 1);
     memory_region_init_io(pm_mem, NULL, &loongarch_virt_pm_ops,
diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
index 9bd875ca8b..df7fa55a30 100644
--- a/include/hw/pci-host/ls7a.h
+++ b/include/hw/pci-host/ls7a.h
@@ -37,6 +37,7 @@
 #define VIRT_PCI_IRQS            48
 #define VIRT_UART_IRQ            (PCH_PIC_IRQ_OFFSET + 2)
 #define VIRT_UART_BASE           0x1fe001e0
+#define VIRT_UART_SIZE           0X100
 #define VIRT_RTC_IRQ             (PCH_PIC_IRQ_OFFSET + 3)
 #define VIRT_MISC_REG_BASE       (VIRT_PCH_REG_BASE + 0x00080000)
 #define VIRT_RTC_REG_BASE        (VIRT_MISC_REG_BASE + 0x00050100)
-- 
2.31.1


