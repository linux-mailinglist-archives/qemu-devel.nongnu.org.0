Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7950789093
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Aug 2019 10:13:55 +0200 (CEST)
Received: from localhost ([::1]:39354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hwizC-0004bS-M2
	for lists+qemu-devel@lfdr.de; Sun, 11 Aug 2019 04:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60304)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hwisv-00067c-71
 for qemu-devel@nongnu.org; Sun, 11 Aug 2019 04:07:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hwist-0003zg-Cx
 for qemu-devel@nongnu.org; Sun, 11 Aug 2019 04:07:25 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:38673)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hwist-0003yz-5L; Sun, 11 Aug 2019 04:07:23 -0400
Received: by mail-pf1-x441.google.com with SMTP id o70so2898867pfg.5;
 Sun, 11 Aug 2019 01:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=WeF0H+SPuetrWshd7mC6KXaI8a55OKj2qP+PPJ4WnO0=;
 b=km8SvdUoqevrrLoNrvaDZ+3JzkGIm6x7faMCav/JAVGZN6sGMz+udZQRCySqZjz7WS
 zJD9IbSDZI9yhSGDo1/gfO94jx445u116jemymNR3g6IkAxDCL3qcIs/ieHTszI0QYCs
 uMPuYxm4vMBQ1XKbwe0F9XEVcvSEr2Vw32CQFgfal4PInmjCq9zxf1FM4Xf8DalsBSwm
 81j+tlS2k3KsCpJkOX9OLbDbhwSj4VqQFSlIZC0P7aPOfv5fBcSa0FbZ910GAt4RT6Ym
 z/cegKXRnupE8jpsW997lbu5lA0sWXOwn7kb6Gbx8c/98xbxQHSXcKV7pFilKCTVG/7D
 UxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=WeF0H+SPuetrWshd7mC6KXaI8a55OKj2qP+PPJ4WnO0=;
 b=oVgKWtQanmAGo8Q5ETQnhnCbPe4KXCMaSgopkyco0Hl8QhKYlRR9Hl+YnztXE+stFP
 j8ZKXL3bMQ6r3ua/bOSCxichlC5IXfeJ42NZOX4IHUIz3gcoljqSDXoP/v1eVcuDe2Qb
 Wukqj5EKGwVQ+Hzzdhe0raMif94ifTwIPlN5YgI8E5ZrQarjYoqLf4IpxiTTRbUiwC3H
 lVUrmtDNLGKQbkE0YR+HrB30/99nPez7+ABWQR7aMqzbRsZIetMKVrSXNdPIgDJ4Y5zl
 flsS2P/Pu3CaZB5IsPYvgZyPUcox2TBSuY8u6acCfYEtsk8+ki+cj8w1x1qS/jSibNbo
 33iw==
X-Gm-Message-State: APjAAAWo1pfMYVxvu8T5IAyOULv2AK/OA/fJQOulVFJt0gtKcmORFxMf
 eaUh7llPioFyQAbcykML0oSJowwG
X-Google-Smtp-Source: APXvYqwcPXWl3E3XHhS/X3MeVjyWgxZvTWc8l0DjyAK+Ok1YYELjO23rlUe29Eeuqx9l9rSsxQPLFw==
X-Received: by 2002:a63:ed55:: with SMTP id m21mr25342125pgk.343.1565510842077; 
 Sun, 11 Aug 2019 01:07:22 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id v8sm87339107pgs.82.2019.08.11.01.07.21
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 11 Aug 2019 01:07:21 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Sun, 11 Aug 2019 01:06:47 -0700
Message-Id: <1565510821-3927-15-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565510821-3927-1-git-send-email-bmeng.cn@gmail.com>
References: <1565510821-3927-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-devel] [PATCH v3 14/28] riscv: sifive: Implement PRCI model
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

Changes in v3: None
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


