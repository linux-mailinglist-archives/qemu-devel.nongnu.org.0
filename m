Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFF5617CD3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 13:40:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqZVV-0002Pe-DP; Thu, 03 Nov 2022 08:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oqZV7-0002Jo-1z
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 08:39:19 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oqZV0-0000ZG-PC
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 08:39:16 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxC7ZotmNjRzsEAA--.2779S3;
 Thu, 03 Nov 2022 20:39:04 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxJldltmNjofgLAA--.16257S6; 
 Thu, 03 Nov 2022 20:39:04 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, stefanha@gmail.com,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 4/7] hw/loongarch: Improve fdt for LoongArch virt machine
Date: Thu,  3 Nov 2022 20:38:58 +0800
Message-Id: <20221103123901.2811990-5-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221103123901.2811990-1-gaosong@loongson.cn>
References: <20221103123901.2811990-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxJldltmNjofgLAA--.16257S6
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxGryUZFWkurWDurWDWF4fuFg_yoW5Cw1DpF
 ZxCFn8urW8XF17WrWS9a43Zr4fArs7CFy2qr4xurW0kFyDWw1DXw4xu39xtryUZwn5tFyj
 vFZYqryfW3WvgrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0AFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x
 0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE
 44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFVCjc4
 AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIE
 Y20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
 80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0
 I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04
 k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7Cj
 xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Add new items into LoongArch FDT, including rtc and uart info.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20221028014007.2718352-3-yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/virt.c        | 31 +++++++++++++++++++++++++++++++
 include/hw/pci-host/ls7a.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 50e9829a94..afc1c8ac77 100644
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


