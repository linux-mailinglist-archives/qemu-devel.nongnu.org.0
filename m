Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1197D2F26BE
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 04:35:50 +0100 (CET)
Received: from localhost ([::1]:51600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzATF-0002RE-4O
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 22:35:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kzAQu-0001KW-T1
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 22:33:26 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:59669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kzAQs-0001L9-Aa
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 22:33:24 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 322AE58058B;
 Mon, 11 Jan 2021 22:33:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 11 Jan 2021 22:33:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=f6sCj4yoLzsvj
 LMN9q30oE+hpZN5dtH4XsdrlmDnnxY=; b=dbUCML8wOVJZNC9B2W34+hp4r8ced
 n8aQ13QCiD+wiqt+xNG5FGxIOEyOKsKIe7+lZBBc/u4eonNDC/BBbZ/rBnjM3MSv
 jcckX6bLL3DZJ6+zyCipYTCgL7Eab3YB/ex1AKu1T2xuOHX2FOSslKelEBrDMg4f
 FCrE3mpgpyld2m/BhCd5wGMn+rZ5L+fyTX/YMZMUQLcHjMB+N8nNkQ4AGhHBP1G0
 6SgHTk3auIbHGxpChHT2OaMF1Q8W6Hjl/UexpE11TSRI4KXVfs9TFSN96RL2u/bt
 3vxP57R1yw4Oy2mesDquog1N7Okw+6iD/Au0YIcWKhiQemf3Bxr08LKkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=f6sCj4yoLzsvjLMN9q30oE+hpZN5dtH4XsdrlmDnnxY=; b=UI8/HmQ+
 x4KoRfo+kVQk5099i5aIg3ppT/U1oJlfFssWF2YsrmZjJ3f9d6du+tYZ14mQNCIB
 MInTir+Lceq0mWvQ9bzST2cj3lKmQvWDAl5ydoyWzNwJZ8M6QLwoezlcn3xth5c/
 9JvT82pd52teBCI/7wLLAIflfdquVebpsEFzi7WJ2E09nFNw/90WdyMR+bo38heP
 6YnZcwJRxdg1ZaRM350RnCJZxgq9FlVtch2RaHzgxMdlDr4176KPRIp31apGq60m
 NS3zqH6cMguca0ldmmxn5an9SEwa62/9JcgRmBl9ejZ6v+XQB65ISEToP0iwAwHa
 BXBXqGlnR1Dt9A==
X-ME-Sender: <xms:fxj9X46m9NgCb0D-tyZ4JFm_ORI57Q7nA_r32MdIGM_ztOBVDkL6iA>
 <xme:fxj9X56arCR-r0baAgNAxdCvPhLllywQ9Penun7pVbkLNwYRboYDGnwFjTFL7t5Gz
 nLCx6ZqCLaeEWH_y5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehvddgiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepfffgkeelueegueejgeeivdfhhedthfekgfdvieeltdfhjeelkedv
 leduffeuvdeinecuffhomhgrihhnpehgnhhurdhorhhgnecukfhppedukedtrdeljedrvd
 egtddrvddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:fxj9X3chcDVppEY0Uf4XJiRmiQ_fHpbbEbcMQ9UKidw3U0kzfLodmA>
 <xmx:fxj9X9KVZs_hb3wIJR0ClouP4KIFD0KIa2TARNmECjpM67uzwCfeBQ>
 <xmx:fxj9X8I6JO8zUIUPg0MgkfEfrUo9s4OsOE4lY1garWUxMY1VW4yF6A>
 <xmx:fxj9XzUe_wwN-4-34KzG8jBZxhaRyqnLhagIBA3MliPLlVUbXGM8xg>
Received: from localhost.localdomain (unknown [180.97.240.21])
 by mail.messagingengine.com (Postfix) with ESMTPA id 368971080067;
 Mon, 11 Jan 2021 22:33:15 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/intc: Add Loongson Inter Processor Interrupt controller
Date: Tue, 12 Jan 2021 11:32:52 +0800
Message-Id: <20210112033253.138140-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210112033253.138140-1-jiaxun.yang@flygoat.com>
References: <20210112033253.138140-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=66.111.4.224;
 envelope-from=jiaxun.yang@flygoat.com; helo=new2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Loongson IPI controller is a MMIO based simple level triggered
interrupt controller. It will trigger IRQ to it's upstream
processor when set register is written.

It also has 8 32bit mailboxes to pass boot information to
secondary processor.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/intc/Kconfig                |   3 +
 hw/intc/loongson_ipi.c         | 146 +++++++++++++++++++++++++++++++++
 hw/intc/meson.build            |   1 +
 include/hw/intc/loongson_ipi.h |  20 +++++
 4 files changed, 170 insertions(+)
 create mode 100644 hw/intc/loongson_ipi.c
 create mode 100644 include/hw/intc/loongson_ipi.h

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index c18d11142a..0e15102662 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -59,6 +59,9 @@ config RX_ICU
 config LOONGSON_LIOINTC
     bool
 
+config LOONGSON_IPI
+    bool
+
 config SIFIVE_CLINT
     bool
 
diff --git a/hw/intc/loongson_ipi.c b/hw/intc/loongson_ipi.c
new file mode 100644
index 0000000000..7246f05f9e
--- /dev/null
+++ b/hw/intc/loongson_ipi.c
@@ -0,0 +1,146 @@
+/*
+ * QEMU Loongson Inter Processor Interrupt Controller
+ *
+ * Copyright (c) 2020-2021 Jiaxun Yang <jiaxun.yang@flygoat.com>
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <https://www.gnu.org/licenses/>.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "qemu/module.h"
+#include "qemu/log.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "hw/intc/loongson_ipi.h"
+
+#define R_ISR       0
+#define R_IEN       1
+#define R_SET       2
+#define R_CLR       3
+/* No register between 0x10~0x20 */
+#define R_MBOX0     8
+#define NUM_MBOX    8
+#define R_END       16
+
+struct loongson_ipi {
+    SysBusDevice parent_obj;
+
+    MemoryRegion mmio;
+    qemu_irq parent_irq;
+
+    uint32_t isr;
+    uint32_t ien;
+    uint32_t mbox[NUM_MBOX];
+};
+
+static uint64_t
+ipi_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    struct loongson_ipi *p = opaque;
+    uint64_t r = 0;
+
+    addr >>= 2;
+    switch (addr) {
+    case R_ISR:
+        r = p->isr;
+        break;
+    case R_IEN:
+        r = p->ien;
+        break;
+    case R_MBOX0 ... (R_END - 1):
+        r = p->mbox[addr - R_MBOX0];
+        break;
+    default:
+        break;
+    }
+
+    qemu_log_mask(CPU_LOG_INT,
+                  "%s: size=%d, addr=%"HWADDR_PRIx", val=%"PRIx64"\n",
+                  __func__, size, addr, r);
+
+    return r;
+}
+
+static void
+ipi_write(void *opaque, hwaddr addr,
+          uint64_t val64, unsigned int size)
+{
+    struct loongson_ipi *p = opaque;
+    uint32_t value = val64;
+
+    addr >>= 2;
+    switch (addr) {
+    case R_ISR:
+        /* Do nothing */
+        break;
+    case R_IEN:
+        p->ien = value;
+        break;
+    case R_SET:
+        p->isr |= value;
+        break;
+    case R_CLR:
+        p->isr &= ~value;
+        break;
+    case R_MBOX0 ... (R_END - 1):
+        p->mbox[addr - R_MBOX0] = value;
+        break;
+    default:
+        break;
+    }
+    p->isr &= p->ien;
+
+    qemu_log_mask(CPU_LOG_INT,
+                  "%s: size=%d, addr=%"HWADDR_PRIx", val=%"PRIx32"\n",
+                  __func__, size, addr, value);
+
+    qemu_set_irq(p->parent_irq, !!p->isr);
+}
+
+static const MemoryRegionOps pic_ops = {
+    .read = ipi_read,
+    .write = ipi_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4
+    }
+};
+
+static void loongson_ipi_init(Object *obj)
+{
+    struct loongson_ipi *p = LOONGSON_IPI(obj);
+
+    sysbus_init_irq(SYS_BUS_DEVICE(obj), &p->parent_irq);
+
+    memory_region_init_io(&p->mmio, obj, &pic_ops, p, "loongson.ipi",
+                          R_END * 4);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &p->mmio);
+}
+
+static const TypeInfo loongson_ipi_info = {
+    .name          = TYPE_LOONGSON_IPI,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(struct loongson_ipi),
+    .instance_init = loongson_ipi_init,
+};
+
+static void loongson_ipi_register_types(void)
+{
+    type_register_static(&loongson_ipi_info);
+}
+
+type_init(loongson_ipi_register_types)
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 53cba11569..5257c5fb94 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -36,6 +36,7 @@ specific_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_irqmp.c'))
 specific_ss.add(when: 'CONFIG_IBEX', if_true: files('ibex_plic.c'))
 specific_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
 specific_ss.add(when: 'CONFIG_LOONGSON_LIOINTC', if_true: files('loongson_liointc.c'))
+specific_ss.add(when: 'CONFIG_LOONGSON_IPI', if_true: files('loongson_ipi.c'))
 specific_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gic.c'))
 specific_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_intc.c'))
 specific_ss.add(when: 'CONFIG_OMPIC', if_true: files('ompic.c'))
diff --git a/include/hw/intc/loongson_ipi.h b/include/hw/intc/loongson_ipi.h
new file mode 100644
index 0000000000..a535c467bf
--- /dev/null
+++ b/include/hw/intc/loongson_ipi.h
@@ -0,0 +1,20 @@
+/*
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file "COPYING" in the main directory of this archive
+ * for more details.
+ *
+ * Copyright (c) 2020-2021 Jiaxun Yang <jiaxun.yang@flygoat.com>
+ *
+ */
+
+#ifndef LOONGSON_IPI_H
+#define LOONGSON_IPI_H
+
+#include "qemu/units.h"
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_LOONGSON_IPI "loongson.ipi"
+#define LOONGSON_IPI(obj) OBJECT_CHECK(struct loongson_ipi, (obj), TYPE_LOONGSON_IPI)
+
+#endif /* LOONGSON_IPI_H */
-- 
2.30.0


