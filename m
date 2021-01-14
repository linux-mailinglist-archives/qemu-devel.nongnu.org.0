Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4162F55D6
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 02:35:38 +0100 (CET)
Received: from localhost ([::1]:48160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzrY1-0002g0-4n
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 20:35:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kzrVR-0001MR-7j
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 20:32:57 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:34027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kzrVP-0005NH-9K
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 20:32:57 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 98BAA5805C0;
 Wed, 13 Jan 2021 20:32:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 13 Jan 2021 20:32:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=v3BVYMLpE7zub
 OvuCTCkhNzBABvMHf5Y6mSaeLMlJ1g=; b=hzC3GC7Ku5HpRYbZ4h+aQI6FLPUhq
 cQnGk9GVmRp4oHYoPPaZaqA4nPMb8nZUhTGDpxT5ucrfaMNonV3MrRn74eYG0SGV
 k9o+IyyqQY0VhmBefHhiaSsbVOL7PjuCUpBaO3cwFqQC4oaZ3YqrLOFQ69Dza/Hq
 2Ah0xNwydfMudnM1bReoHYEV3+PiFJBjl41ozvDNWRB6YwTwpVTHNwAojfR4ZUTC
 y6OJ2cBH3+AaEtkVIUJXAr4LTASNru3ur8gP68pFWpvd4IfDLShlf6hv5LSqL3Jx
 5q7X4JxXd3gop5IcagqzyPawwWw0xO8PXkips1oTqWHfd1/DD1loxX4/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=v3BVYMLpE7zubOvuCTCkhNzBABvMHf5Y6mSaeLMlJ1g=; b=XSs6POvu
 QxxYBQWrSY6lTNiAZMvUUsvcrLe4NNHzN/pyIPp38Zl8/TdRyiLpNUoxQqzfwoTZ
 AC7oe8f9P/DG6CBkLaNVEshr9XqwiauyvRVRuNWlAjTKWEX9zg4pZOJukX4T7q3C
 b68GWbOslKQJYh5RUImPTYKDYXFAjR2AVDarV/xZAxaHt0ECOuKAJzkAo1UD0pfs
 YvBaa0EZin3g2fVEoLsXpPuUIr2pKb73f1jN6AlnflA9bi5bnqbgXMc04tjFjDiv
 PHUVKnx/Tntzzt9gKeveRf11zvm96UL1ffUg5705t6BK0GsDk24r6RIyvlxNxLCa
 1QTXFZzvVvVndw==
X-ME-Sender: <xms:RZ__X2A4Wh0HcLkfIX5Nj1KrusqKEhRL1UP9_rSGuKyRUhCPZDiPIg>
 <xme:RZ__Xwhdhg5VF0ak8fJ9reWn1Pa0-Vr7yKdvzvMm-SWe23uQMm3BmIEgOv59uLUyS
 qvLS19dhH793TV9Dbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtdeggdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfhirgiguhhn
 ucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenucggtf
 frrghtthgvrhhnpeffgfekleeugeeujeegiedvhfehtdfhkefgvdeiledthfejleekvdel
 udffuedvieenucffohhmrghinhepghhnuhdrohhrghenucfkphepuddujedrudefiedrke
 drudeggeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:RZ__X5kki5FkYUMu4rDSrXoG3n6sJLX9n6DKNZgMc-WSG8Yz-IKuQg>
 <xmx:RZ__X0x3D6vb0jKOpbPVSa7siXTZe9PAZgta-YOfYRdUsypCg1XotQ>
 <xmx:RZ__X7TXF9l7kh9pCFqwVv4umaUNm0jxBzBUeoRhTxW7yX8bYDJFqA>
 <xmx:Rp__X1facgNWxh2obXMVMx46zSWXCHVXF7LqTLdJLKlXDgZlFfC7nA>
Received: from localhost.localdomain (unknown [117.136.8.144])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7CA021080059;
 Wed, 13 Jan 2021 20:32:49 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] hw/intc: Add Loongson Inter Processor Interrupt
 controller
Date: Thu, 14 Jan 2021 09:31:46 +0800
Message-Id: <20210114013147.92962-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210114013147.92962-1-jiaxun.yang@flygoat.com>
References: <20210114013147.92962-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.230;
 envelope-from=jiaxun.yang@flygoat.com; helo=new4-smtp.messagingengine.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

It also has 4 64bit mailboxes to pass boot information to
secondary processor.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 include/hw/intc/loongson_ipi.h |  20 ++++
 hw/intc/loongson_ipi.c         | 174 +++++++++++++++++++++++++++++++++
 hw/intc/Kconfig                |   3 +
 hw/intc/meson.build            |   1 +
 hw/intc/trace-events           |   4 +
 5 files changed, 202 insertions(+)
 create mode 100644 include/hw/intc/loongson_ipi.h
 create mode 100644 hw/intc/loongson_ipi.c

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
diff --git a/hw/intc/loongson_ipi.c b/hw/intc/loongson_ipi.c
new file mode 100644
index 0000000000..cce1da8fb9
--- /dev/null
+++ b/hw/intc/loongson_ipi.c
@@ -0,0 +1,174 @@
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
+#include "sysemu/reset.h"
+#include "trace.h"
+
+/*
+ * Mailboxes are actually 4 64bit registers but we treat it as 8 32bit
+ * to simplify implementation.
+ */
+#define NUM_MBOX  8
+
+enum {
+    R_ISR = 0,
+    R_IEN = 1,
+    R_SET = 2,
+    R_CLR = 3,
+    /* No register at 0x10~0x20 */
+    R_MBOX0 = 8,
+    R_END = R_MBOX0 + NUM_MBOX
+};
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
+    case R_SET:
+    case R_CLR:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Reading write only reg: 0x%" HWADDR_PRIx "\n",
+                      __func__, addr);
+        break;
+    case R_MBOX0 ... (R_END - 1):
+        r = p->mbox[addr - R_MBOX0];
+        break;
+    default:
+        break;
+    }
+
+    trace_loongson_ipi_read(addr, r);
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
+    trace_loongson_ipi_write(addr, value);
+
+    qemu_set_irq(p->parent_irq, !!p->isr);
+}
+
+static void ipi_reset(void *opaque)
+{
+    int i;
+    struct loongson_ipi *p = opaque;
+
+    p->ien = 0;
+    p->isr = 0;
+    for (i = 0; i < NUM_MBOX; i++) {
+        p->mbox[i] = 0;
+    }
+}
+
+static const MemoryRegionOps pic_mmio_ops = {
+    .read = ipi_read,
+    .write = ipi_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4
+    },
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8
+    },
+};
+
+static void loongson_ipi_init(Object *obj)
+{
+    struct loongson_ipi *p = LOONGSON_IPI(obj);
+
+    sysbus_init_irq(SYS_BUS_DEVICE(obj), &p->parent_irq);
+
+    memory_region_init_io(&p->mmio, obj, &pic_mmio_ops, p,
+                          "loongson.ipi", R_END * 4);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &p->mmio);
+    qemu_register_reset(ipi_reset, p);
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
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 8ed397a0d5..e43e318be0 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -60,6 +60,10 @@ lm32_pic_set_ip(uint32_t ip) "ip 0x%08x"
 lm32_pic_get_im(uint32_t im) "im 0x%08x"
 lm32_pic_get_ip(uint32_t ip) "ip 0x%08x"
 
+# loongson_ipi.c
+loongson_ipi_read(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " value 0x%08" PRIx64
+loongson_ipi_write(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " value 0x%08" PRIx64
+
 # xics.c
 xics_icp_check_ipi(int server, uint8_t mfrr) "CPU %d can take IPI mfrr=0x%x"
 xics_icp_accept(uint32_t old_xirr, uint32_t new_xirr) "icp_accept: XIRR 0x%"PRIx32"->0x%"PRIx32
-- 
2.30.0


