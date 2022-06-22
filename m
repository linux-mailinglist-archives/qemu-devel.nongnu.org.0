Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0057554596
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 13:02:29 +0200 (CEST)
Received: from localhost ([::1]:59198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3y7w-0001HS-RR
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 07:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1o3xvu-00082u-JP
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 06:50:02 -0400
Received: from mail.loongson.cn ([114.242.206.163]:55334 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1o3xvr-0004kq-Fd
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 06:50:02 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0838rJi+BtUAA--.28846S3; 
 Wed, 22 Jun 2022 18:43:03 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org,
 chenhuacai@loongson.cn
Subject: [PATCH 01/10] hw/loongarch: rename macro prefix LS_PCI to LS7A_PCI
Date: Wed, 22 Jun 2022 18:42:52 +0800
Message-Id: <20220622104301.804447-2-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220622104301.804447-1-yangxiaojuan@loongson.cn>
References: <20220622104301.804447-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxL0838rJi+BtUAA--.28846S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJr15JF4UXFy5Gr47Ww48JFb_yoW8Xw4kpr
 nxCF97KrW0kFs7JF1vyF12gr1DJayqk3W7ua1xZw4FkFZ7Zr1DZwnrJan8tFWUJF4kXr90
 qa4vkw4Sg3WDJw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename macro LS_PCIECFG_xxx to LS7A_PCI_CFG_xxx to keep consistency
with other macros.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/loongarch/loongson3.c   | 4 ++--
 include/hw/pci-host/ls7a.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index bd20ebbb78..18cb2f61da 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -121,8 +121,8 @@ static void loongarch_devices_init(DeviceState *pch_pic)
     ecam_alias = g_new0(MemoryRegion, 1);
     ecam_reg = sysbus_mmio_get_region(d, 0);
     memory_region_init_alias(ecam_alias, OBJECT(gpex_dev), "pcie-ecam",
-                             ecam_reg, 0, LS_PCIECFG_SIZE);
-    memory_region_add_subregion(get_system_memory(), LS_PCIECFG_BASE,
+                             ecam_reg, 0, LS7A_PCI_CFG_SIZE);
+    memory_region_add_subregion(get_system_memory(), LS7A_PCI_CFG_BASE,
                                 ecam_alias);
 
     /* Map PCI mem space */
diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
index 08c5f78be2..53e9b18f3a 100644
--- a/include/hw/pci-host/ls7a.h
+++ b/include/hw/pci-host/ls7a.h
@@ -18,8 +18,8 @@
 #define LS7A_PCI_MEM_BASE        0x40000000UL
 #define LS7A_PCI_MEM_SIZE        0x40000000UL
 #define LS7A_PCI_IO_OFFSET      0x4000
-#define LS_PCIECFG_BASE         0x20000000
-#define LS_PCIECFG_SIZE         0x08000000
+#define LS7A_PCI_CFG_BASE         0x20000000
+#define LS7A_PCI_CFG_SIZE         0x08000000
 #define LS7A_PCI_IO_BASE        0x18004000UL
 #define LS7A_PCI_IO_SIZE        0xC000
 
-- 
2.31.1


