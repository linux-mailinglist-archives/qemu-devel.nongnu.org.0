Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C282E8465F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 09:53:38 +0200 (CEST)
Received: from localhost ([::1]:37864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvGlO-0008Tp-0s
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 03:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36661)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvGds-00011B-Ti
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 03:45:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvGdq-00087s-NY
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 03:45:52 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:37592)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hvGdo-00084c-RH; Wed, 07 Aug 2019 03:45:50 -0400
Received: by mail-pl1-x641.google.com with SMTP id b3so39517468plr.4;
 Wed, 07 Aug 2019 00:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=sRnA4nrwp6AFiMuamcgkCBOMUL8OMOfiKsUt0uVn5sI=;
 b=oJW4L1Q20eHhOYLT7JUn4o/gH4Q+V3tCZRmCC1pYGOM85dwqaznA+kZ6TRBkeA70Zf
 gDneWEMEdKCn7oFyRKOyDu1y557RfQQakAfzTypZKtdWMrWPy2mwEsgxGtETUb8fui2n
 fQapNBbmiPm/uA/gYkabGGFpAymuuyee6VNPyZxQynVe5OMUl8RQ3eTTumlKxALChPlK
 5JNo+AosOmBagWmsPuz3SvaZiEauq/hY+YUENwV/WDESloBODDJgaGiLwpT4PFod5tCj
 8YduKCGmqve4A9MMSbJ5IGyNsu3RUQRx+dJ/hdAtLGe/F8G9KMjKIcg8e5HpvgIx1nre
 QtxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=sRnA4nrwp6AFiMuamcgkCBOMUL8OMOfiKsUt0uVn5sI=;
 b=bA2KrodjyH+O6uqRBsPvGCX0sDfzQKfA2jlpBY7MD0AmUSw9PHjQmzx5nHUwQCJ73/
 b7XMc7JWUWUwJ+YpTSiDMoN8LeLUz3jzosjWsVvbIKdWHHkEYbQm2FJfGx/CkI/H8cE8
 zn0KG4lscjpWDuQNeyOQRhRrXqQDs8az2ooJuddA56wbK9aI1pHT0COyXgbVKzq9Ggu9
 YyUw04F3xkA4IKuhk1uKXwZZ+aJa4nH94g5YF8qgxyVspGlSL1mhuuicUkE69UcM8QQq
 x6+ZCvoFXwq45jsi+r/cXjC3IogfQotX8EKnOddVCMGXt9qd9mgCMrC8FbnZCLPCQzD1
 DjpQ==
X-Gm-Message-State: APjAAAXacu+YSbpBjBGnJU8CZUSTnQuloFzzpB4LP44Y74bewo+gDdZW
 kugygOzv+m6VhJ0mm/xC9fI=
X-Google-Smtp-Source: APXvYqxhCyEfYRMTp3hTp9rNV8st4SV3I7Jc2+ftDNlyHPuQmHFkmpIpAtYIMNrUTW3yqCTV6/V5fA==
X-Received: by 2002:a17:902:4201:: with SMTP id
 g1mr6963498pld.300.1565163946244; 
 Wed, 07 Aug 2019 00:45:46 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id l44sm20154449pje.29.2019.08.07.00.45.45
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 07 Aug 2019 00:45:45 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Wed,  7 Aug 2019 00:45:10 -0700
Message-Id: <1565163924-18621-15-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
References: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-devel] [PATCH v2 14/28] riscv: sifive: Implement PRCI model
 for FU540
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a simple PRCI model for FU540 (sifive_u). It has different
register layout from the existing PRCI model for FE310 (sifive_e).

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

Changes in v2: None

 hw/riscv/Makefile.objs           |   1 +
 hw/riscv/sifive_u_prci.c         | 163 +++++++++++++++++++++++++++++++++++++++
 include/hw/riscv/sifive_u_prci.h |  90 +++++++++++++++++++++
 3 files changed, 254 insertions(+)
 create mode 100644 hw/riscv/sifive_u_prci.c
 create mode 100644 include/hw/riscv/sifive_u_prci.h

diff --git a/hw/riscv/Makefile.objs b/hw/riscv/Makefile.objs
index c859697..b95bbd5 100644
--- a/hw/riscv/Makefile.objs
+++ b/hw/riscv/Makefile.objs
@@ -8,6 +8,7 @@ obj-$(CONFIG_SIFIVE) += sifive_gpio.o
 obj-$(CONFIG_SIFIVE) += sifive_plic.o
 obj-$(CONFIG_SIFIVE) += sifive_test.o
 obj-$(CONFIG_SIFIVE_U) += sifive_u.o
+obj-$(CONFIG_SIFIVE_U) += sifive_u_prci.o
 obj-$(CONFIG_SIFIVE) += sifive_uart.o
 obj-$(CONFIG_SPIKE) += spike.o
 obj-$(CONFIG_RISCV_VIRT) += virt.o
diff --git a/hw/riscv/sifive_u_prci.c b/hw/riscv/sifive_u_prci.c
new file mode 100644
index 0000000..35e5962
--- /dev/null
+++ b/hw/riscv/sifive_u_prci.c
@@ -0,0 +1,163 @@
+/*
+ * QEMU SiFive U PRCI (Power, Reset, Clock, Interrupt)
+ *
+ * Copyright (c) 2019 Bin Meng <bmeng.cn@gmail.com>
+ *
+ * Simple model of the PRCI to emulate register reads made by the SDK BSP
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "qemu/module.h"
+#include "target/riscv/cpu.h"
+#include "hw/riscv/sifive_u_prci.h"
+
+static uint64_t sifive_prci_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    SiFivePRCIState *s = opaque;
+
+    switch (addr) {
+    case SIFIVE_PRCI_HFXOSCCFG:
+        return s->hfxosccfg;
+    case SIFIVE_PRCI_COREPLLCFG0:
+        return s->corepllcfg0;
+    case SIFIVE_PRCI_DDRPLLCFG0:
+        return s->ddrpllcfg0;
+    case SIFIVE_PRCI_DDRPLLCFG1:
+        return s->ddrpllcfg1;
+    case SIFIVE_PRCI_GEMGXLPLLCFG0:
+        return s->gemgxlpllcfg0;
+    case SIFIVE_PRCI_GEMGXLPLLCFG1:
+        return s->gemgxlpllcfg1;
+    case SIFIVE_PRCI_CORECLKSEL:
+        return s->coreclksel;
+    case SIFIVE_PRCI_DEVICESRESET:
+        return s->devicesreset;
+    case SIFIVE_PRCI_CLKMUXSTATUS:
+        return s->clkmuxstatus;
+    }
+
+    hw_error("%s: read: addr=0x%x\n", __func__, (int)addr);
+    return 0;
+}
+
+static void sifive_prci_write(void *opaque, hwaddr addr,
+                              uint64_t val64, unsigned int size)
+{
+    SiFivePRCIState *s = opaque;
+
+    switch (addr) {
+    case SIFIVE_PRCI_HFXOSCCFG:
+        s->hfxosccfg = (uint32_t) val64;
+        /* OSC stays ready */
+        s->hfxosccfg |= SIFIVE_PRCI_HFXOSCCFG_RDY;
+        break;
+    case SIFIVE_PRCI_COREPLLCFG0:
+        s->corepllcfg0 = (uint32_t) val64;
+        /* internal feedback */
+        s->corepllcfg0 |= SIFIVE_PRCI_PLLCFG0_FSE;
+        /* PLL stays locked */
+        s->corepllcfg0 |= SIFIVE_PRCI_PLLCFG0_LOCK;
+        break;
+    case SIFIVE_PRCI_DDRPLLCFG0:
+        s->ddrpllcfg0 = (uint32_t) val64;
+        /* internal feedback */
+        s->ddrpllcfg0 |= SIFIVE_PRCI_PLLCFG0_FSE;
+        /* PLL stays locked */
+        s->ddrpllcfg0 |= SIFIVE_PRCI_PLLCFG0_LOCK;
+        break;
+    case SIFIVE_PRCI_DDRPLLCFG1:
+        s->ddrpllcfg1 = (uint32_t) val64;
+        break;
+    case SIFIVE_PRCI_GEMGXLPLLCFG0:
+        s->gemgxlpllcfg0 = (uint32_t) val64;
+         /* internal feedback */
+        s->gemgxlpllcfg0 |= SIFIVE_PRCI_PLLCFG0_FSE;
+       /* PLL stays locked */
+        s->gemgxlpllcfg0 |= SIFIVE_PRCI_PLLCFG0_LOCK;
+        break;
+    case SIFIVE_PRCI_GEMGXLPLLCFG1:
+        s->gemgxlpllcfg1 = (uint32_t) val64;
+        break;
+    case SIFIVE_PRCI_CORECLKSEL:
+        s->coreclksel = (uint32_t) val64;
+        break;
+    case SIFIVE_PRCI_DEVICESRESET:
+        s->devicesreset = (uint32_t) val64;
+        break;
+    case SIFIVE_PRCI_CLKMUXSTATUS:
+        s->clkmuxstatus = (uint32_t) val64;
+        break;
+    default:
+        hw_error("%s: bad write: addr=0x%x v=0x%x\n",
+                 __func__, (int)addr, (int)val64);
+    }
+}
+
+static const MemoryRegionOps sifive_prci_ops = {
+    .read = sifive_prci_read,
+    .write = sifive_prci_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4
+    }
+};
+
+static void sifive_prci_init(Object *obj)
+{
+    SiFivePRCIState *s = SIFIVE_U_PRCI(obj);
+
+    memory_region_init_io(&s->mmio, obj, &sifive_prci_ops, s,
+                          TYPE_SIFIVE_U_PRCI, SIFIVE_U_PRCI_REG_SIZE);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+
+    /* Initialize register to power-on-reset values */
+    s->hfxosccfg = (SIFIVE_PRCI_HFXOSCCFG_RDY | SIFIVE_PRCI_HFXOSCCFG_EN);
+    s->corepllcfg0 = (SIFIVE_PRCI_PLLCFG0_DIVR | SIFIVE_PRCI_PLLCFG0_DIVF |
+                      SIFIVE_PRCI_PLLCFG0_DIVQ | SIFIVE_PRCI_PLLCFG0_FSE |
+                      SIFIVE_PRCI_PLLCFG0_LOCK);
+    s->ddrpllcfg0 = (SIFIVE_PRCI_PLLCFG0_DIVR | SIFIVE_PRCI_PLLCFG0_DIVF |
+                     SIFIVE_PRCI_PLLCFG0_DIVQ | SIFIVE_PRCI_PLLCFG0_FSE |
+                     SIFIVE_PRCI_PLLCFG0_LOCK);
+    s->gemgxlpllcfg0 = (SIFIVE_PRCI_PLLCFG0_DIVR | SIFIVE_PRCI_PLLCFG0_DIVF |
+                        SIFIVE_PRCI_PLLCFG0_DIVQ | SIFIVE_PRCI_PLLCFG0_FSE |
+                        SIFIVE_PRCI_PLLCFG0_LOCK);
+    s->coreclksel = SIFIVE_PRCI_CORECLKSEL_HFCLK;
+}
+
+static const TypeInfo sifive_prci_info = {
+    .name          = TYPE_SIFIVE_U_PRCI,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(SiFivePRCIState),
+    .instance_init = sifive_prci_init,
+};
+
+static void sifive_prci_register_types(void)
+{
+    type_register_static(&sifive_prci_info);
+}
+
+type_init(sifive_prci_register_types)
+
+
+/* Create PRCI device */
+DeviceState *sifive_u_prci_create(hwaddr addr)
+{
+    DeviceState *dev = qdev_create(NULL, TYPE_SIFIVE_U_PRCI);
+    qdev_init_nofail(dev);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+    return dev;
+}
diff --git a/include/hw/riscv/sifive_u_prci.h b/include/hw/riscv/sifive_u_prci.h
new file mode 100644
index 0000000..f3a4656
--- /dev/null
+++ b/include/hw/riscv/sifive_u_prci.h
@@ -0,0 +1,90 @@
+/*
+ * QEMU SiFive U PRCI (Power, Reset, Clock, Interrupt) interface
+ *
+ * Copyright (c) 2019 Bin Meng <bmeng.cn@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_SIFIVE_U_PRCI_H
+#define HW_SIFIVE_U_PRCI_H
+
+enum {
+    SIFIVE_PRCI_HFXOSCCFG       = 0x00,
+    SIFIVE_PRCI_COREPLLCFG0     = 0x04,
+    SIFIVE_PRCI_DDRPLLCFG0      = 0x0C,
+    SIFIVE_PRCI_DDRPLLCFG1      = 0x10,
+    SIFIVE_PRCI_GEMGXLPLLCFG0   = 0x1C,
+    SIFIVE_PRCI_GEMGXLPLLCFG1   = 0x20,
+    SIFIVE_PRCI_CORECLKSEL      = 0x24,
+    SIFIVE_PRCI_DEVICESRESET    = 0x28,
+    SIFIVE_PRCI_CLKMUXSTATUS    = 0x2C
+};
+
+/*
+ * Current FU540-C000 manual says ready bit is at bit 29, but
+ * freedom-u540-c000-bootloader codes (ux00prci.h) says it is at bit 31.
+ * We have to trust the actual codes that worked.
+ *
+ * see https://github.com/sifive/freedom-u540-c000-bootloader
+ */
+enum {
+    SIFIVE_PRCI_HFXOSCCFG_EN    = (1 << 30),
+    SIFIVE_PRCI_HFXOSCCFG_RDY   = (1 << 31),
+};
+
+/* xxxPLLCFG0 register bits */
+enum {
+    SIFIVE_PRCI_PLLCFG0_DIVR    = (1 << 0),
+    SIFIVE_PRCI_PLLCFG0_DIVF    = (31 << 6),
+    SIFIVE_PRCI_PLLCFG0_DIVQ    = (3 << 15),
+    SIFIVE_PRCI_PLLCFG0_FSE     = (1 << 25),
+    SIFIVE_PRCI_PLLCFG0_LOCK    = (1 << 31)
+};
+
+/* xxxPLLCFG1 register bits */
+enum {
+    SIFIVE_PRCI_PLLCFG1_CKE     = (1 << 24)
+};
+
+enum {
+    SIFIVE_PRCI_CORECLKSEL_HFCLK = (1 << 0)
+};
+
+#define SIFIVE_U_PRCI_REG_SIZE  0x1000
+
+#define TYPE_SIFIVE_U_PRCI      "riscv.sifive.u.prci"
+
+#define SIFIVE_U_PRCI(obj) \
+    OBJECT_CHECK(SiFivePRCIState, (obj), TYPE_SIFIVE_U_PRCI)
+
+typedef struct SiFivePRCIState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion mmio;
+    uint32_t hfxosccfg;
+    uint32_t corepllcfg0;
+    uint32_t ddrpllcfg0;
+    uint32_t ddrpllcfg1;
+    uint32_t gemgxlpllcfg0;
+    uint32_t gemgxlpllcfg1;
+    uint32_t coreclksel;
+    uint32_t devicesreset;
+    uint32_t clkmuxstatus;
+} SiFivePRCIState;
+
+DeviceState *sifive_u_prci_create(hwaddr addr);
+
+#endif /* HW_SIFIVE_U_PRCI_H */
-- 
2.7.4


