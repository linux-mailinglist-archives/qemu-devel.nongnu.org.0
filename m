Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A60045BCC50
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 14:58:28 +0200 (CEST)
Received: from localhost ([::1]:46638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaGLz-0005OP-PJ
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 08:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oaGCy-0001WV-IS
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 08:49:08 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50916 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oaGCv-0000I3-SR
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 08:49:08 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx72s9ZShjN8QdAA--.43684S3; 
 Mon, 19 Sep 2022 20:49:03 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, stefanha@gmail.com,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 1/9] hw/loongarch: Remove vga device when loongarch init
Date: Mon, 19 Sep 2022 20:48:53 +0800
Message-Id: <20220919124901.2653396-2-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220919124901.2653396-1-gaosong@loongson.cn>
References: <20220919124901.2653396-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx72s9ZShjN8QdAA--.43684S3
X-Coremail-Antispam: 1UD129KBjvJXoW7AFWfGw47Gr4kGF1xCrW3Jrb_yoW8JFWUpr
 ZxZF1kGrW8JrsrJrZFq34kWF1DJFn7Gry2vF4Sy34vkFyDZr95Zr1rZ34qyFyUA3yrJFyI
 qr95G3yUX3W8GFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Remove the vga device when loongarch machine init and
we will support other display device in the future.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Acked-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20220908094623.73051-2-yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/Kconfig | 1 -
 hw/loongarch/virt.c  | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index a99aa387c3..73c52b093e 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -2,7 +2,6 @@ config LOONGARCH_VIRT
     bool
     select PCI
     select PCI_EXPRESS_GENERIC_BRIDGE
-    imply VGA_PCI
     imply VIRTIO_VGA
     imply PCI_DEVICES
     select ISA_BUS
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 5cc0b05538..b56820ecda 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -378,9 +378,6 @@ static void loongarch_devices_init(DeviceState *pch_pic, LoongArchMachineState *
         pci_nic_init_nofail(nd, pci_bus, nd->model, NULL);
     }
 
-    /* VGA setup */
-    pci_vga_init(pci_bus);
-
     /*
      * There are some invalid guest memory access.
      * Create some unimplemented devices to emulate this.
-- 
2.31.1


