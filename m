Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 555123816C1
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 10:08:30 +0200 (CEST)
Received: from localhost ([::1]:44570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhpLY-0003rz-T5
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 04:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1lhpJt-0002ul-DT
 for qemu-devel@nongnu.org; Sat, 15 May 2021 04:06:45 -0400
Received: from mail.loongson.cn ([114.242.206.163]:58884 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1lhpJo-00080n-1e
 for qemu-devel@nongnu.org; Sat, 15 May 2021 04:06:45 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxD+4FgZ9gKtIWAA--.1553S2;
 Sat, 15 May 2021 16:06:29 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] hw/display/qxl: Set pci rom address aligned with page size
Date: Sat, 15 May 2021 16:06:23 +0800
Message-Id: <1621065983-18305-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9DxD+4FgZ9gKtIWAA--.1553S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JrWDXFyDGr4kKrWrGF1UAwb_yoWDuwc_X3
 yxuws8Gr1jvFs8Ar4UXr1SqFy8Ga1Dur48XF1jqrZIy347Kwn3CF1q9r93Wr15uFZ3Cr17
 Za1DCas0y39xGjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbs8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
 0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK6svPMxAI
 w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI
 8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
 xVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
 8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2
 jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43
 ZEXa7VUb3rc3UUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=maobibo@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, maobibo <maobibo@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: maobibo <maobibo@loongson.cn>

pci memory bar size should be aligned with page size, else it will
not be effective memslot when running in kvm mode.

This patch set qxl pci rom size aligned with page size of host
machine.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 hw/display/qxl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 2ba7563..c84f45e 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -317,11 +317,11 @@ static uint32_t qxl_crc32(const uint8_t *p, unsigned len)
 
 static ram_addr_t qxl_rom_size(void)
 {
-#define QXL_REQUIRED_SZ (sizeof(QXLRom) + sizeof(QXLModes) + sizeof(qxl_modes))
-#define QXL_ROM_SZ 8192
+    uint32_t rom_size;
 
-    QEMU_BUILD_BUG_ON(QXL_REQUIRED_SZ > QXL_ROM_SZ);
-    return QXL_ROM_SZ;
+    rom_size = sizeof(QXLRom) + sizeof(QXLModes) + sizeof(qxl_modes);
+    rom_size = QEMU_ALIGN_UP(rom_size, qemu_real_host_page_size);
+    return rom_size;
 }
 
 static void init_qxl_rom(PCIQXLDevice *d)
-- 
1.8.3.1


