Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 979BC32D5B1
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 15:54:13 +0100 (CET)
Received: from localhost ([::1]:43530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpMi-00078W-HO
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 09:54:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpH7-0001lv-V2
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:48:25 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:44460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpH4-0007uj-Rj
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:48:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1614869302; x=1646405302;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+lGZXaoYx3pMRxNzsM4PxWtHjJ9efR3jQix8AS/sB7g=;
 b=VBVf30VJ5LgCpneDC2ANy7nE9gGd6X4JjGwQiZBO/SUKse5jxTqR2VVT
 Un55DnDSWvsotvg78hu4ta3aQPQdByUCJjYuIWjM1Ll1nvOse+Wi7wZaM
 SdPaCqAaBV9n+cBEfNYrZ6OdIfTeHCGgv05V9v9lsyuDsVRqJeLjHDOuX
 w/SEqqA1xrvWK7srlHB9EV3lou/2X1usls2c3qCDM6yzOq/dQkrbXKzh7
 Rg/N/J+2/4L/n5V+e9XbSjGH1A5Ebf/xp6iXFmXoPtj1y6YFhc7m5S8h3
 rubBKtwj6NyyRJ6iXEs7c24g/M6FJd4ovAlb7qddUsufH5Hb3I/EQPE1i A==;
IronPort-SDR: MDhPpw039h6goC0y25tWJRwythRZPzXPb00i8Ng9wi2UkahAEif39960bSLcqRcAy3TPiaIk6q
 KmwTH/qPkp9UvHAjMtpYSI2f8G4dBSpf4j13NQvYv0IkrAg6gwLxTLK/CcxJixnBkKN1CEfHdN
 tShHyjdqWBq1UfmklkU5oG/X5zVn4N4d2SiOB3XldbW+B8zXitIyv4u8PyhQJAR8n3RbDhYB25
 7f7erkKvKUf8apP9A8p+I5XV/g2tj3e1Vy2Acbpp5MInmjsvXRJ/rvovtCzamd4MxJCSK0mbN7
 4R4=
X-IronPort-AV: E=Sophos;i="5.81,222,1610380800"; d="scan'208";a="271984408"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Mar 2021 22:48:10 +0800
IronPort-SDR: +bFldTdUIFRD28HOGJT2+TDF7ux+R0wq1NeVlF0t6hyTcuh2HDDaX2906wUOJ1Avp0HHoBoA22
 u8xZeRvfowon2tGMWRBMGXoI1X/C15MBKLaHLJ2zzhVaoo00j3W97lZ+tig8ZrneMpE5ggCl+g
 MwmRV+1z774FnyQA9cPoUe7FDHDVwzBM73fEgmHm8XojuuvqY1C/vonclxaIlkycps8I+6+ddD
 nmQMPKsFQ5nQHc2zzL8M08uBB5xm4fOoaBk3/islVk/CQY7/+OaklVhdzivYENzvb2D1/HiPkc
 krlDPxqKTSdCkObyWvX5a3C/
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2021 06:29:23 -0800
IronPort-SDR: B69Vd/JDsr8qoE78AdFkfo/j1yiEjOVlMOenww4c+Jo9zcjoSDWGMLTPkaF4CanqcxGWre7pWP
 X4XpBN0DNtNs7JucVMGQmp/yWfmveOtnEZz2Z/H8euWkuYfg5OEQeT0sznCjoWfuzo9PDoHaqB
 L1UquYvpwFWscZqIqwwrKAQJeEaDrnxHekUQNzOzbcFmuyJI6odLzfwWUH1om6UZm+d34r/pmd
 Xzqu6Zvu2N5d3ieonpFHrxyUYdCM6h6+4cpzm5vzABm7xb3Lzlo5yZsMTMHEMyDy3gr/NnFRfj
 tV0=
WDCIronportException: Internal
Received: from cnf008142.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.109])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Mar 2021 06:48:10 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 07/19] hw/ssi: Add SiFive SPI controller support
Date: Thu,  4 Mar 2021 09:46:39 -0500
Message-Id: <20210304144651.310037-8-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304144651.310037-1-alistair.francis@wdc.com>
References: <20210304144651.310037-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=690dc056c=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

This adds the SiFive SPI controller model for the FU540 SoC.
The direct memory-mapped SPI flash mode is unsupported.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210126060007.12904-4-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/ssi/sifive_spi.h |  47 +++++
 hw/ssi/sifive_spi.c         | 358 ++++++++++++++++++++++++++++++++++++
 hw/ssi/Kconfig              |   4 +
 hw/ssi/meson.build          |   1 +
 4 files changed, 410 insertions(+)
 create mode 100644 include/hw/ssi/sifive_spi.h
 create mode 100644 hw/ssi/sifive_spi.c

diff --git a/include/hw/ssi/sifive_spi.h b/include/hw/ssi/sifive_spi.h
new file mode 100644
index 0000000000..47d0d6a47c
--- /dev/null
+++ b/include/hw/ssi/sifive_spi.h
@@ -0,0 +1,47 @@
+/*
+ * QEMU model of the SiFive SPI Controller
+ *
+ * Copyright (c) 2021 Wind River Systems, Inc.
+ *
+ * Author:
+ *   Bin Meng <bin.meng@windriver.com>
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
+#ifndef HW_SIFIVE_SPI_H
+#define HW_SIFIVE_SPI_H
+
+#define SIFIVE_SPI_REG_NUM  (0x78 / 4)
+
+#define TYPE_SIFIVE_SPI "sifive.spi"
+#define SIFIVE_SPI(obj) OBJECT_CHECK(SiFiveSPIState, (obj), TYPE_SIFIVE_SPI)
+
+typedef struct SiFiveSPIState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion mmio;
+    qemu_irq irq;
+
+    uint32_t num_cs;
+    qemu_irq *cs_lines;
+
+    SSIBus *spi;
+
+    Fifo8 tx_fifo;
+    Fifo8 rx_fifo;
+
+    uint32_t regs[SIFIVE_SPI_REG_NUM];
+} SiFiveSPIState;
+
+#endif /* HW_SIFIVE_SPI_H */
diff --git a/hw/ssi/sifive_spi.c b/hw/ssi/sifive_spi.c
new file mode 100644
index 0000000000..0c9ebca3c8
--- /dev/null
+++ b/hw/ssi/sifive_spi.c
@@ -0,0 +1,358 @@
+/*
+ * QEMU model of the SiFive SPI Controller
+ *
+ * Copyright (c) 2021 Wind River Systems, Inc.
+ *
+ * Author:
+ *   Bin Meng <bin.meng@windriver.com>
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
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
+#include "hw/ssi/ssi.h"
+#include "sysemu/sysemu.h"
+#include "qemu/fifo8.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "hw/ssi/sifive_spi.h"
+
+#define R_SCKDIV        (0x00 / 4)
+#define R_SCKMODE       (0x04 / 4)
+#define R_CSID          (0x10 / 4)
+#define R_CSDEF         (0x14 / 4)
+#define R_CSMODE        (0x18 / 4)
+#define R_DELAY0        (0x28 / 4)
+#define R_DELAY1        (0x2C / 4)
+#define R_FMT           (0x40 / 4)
+#define R_TXDATA        (0x48 / 4)
+#define R_RXDATA        (0x4C / 4)
+#define R_TXMARK        (0x50 / 4)
+#define R_RXMARK        (0x54 / 4)
+#define R_FCTRL         (0x60 / 4)
+#define R_FFMT          (0x64 / 4)
+#define R_IE            (0x70 / 4)
+#define R_IP            (0x74 / 4)
+
+#define FMT_DIR         (1 << 3)
+
+#define TXDATA_FULL     (1 << 31)
+#define RXDATA_EMPTY    (1 << 31)
+
+#define IE_TXWM         (1 << 0)
+#define IE_RXWM         (1 << 1)
+
+#define IP_TXWM         (1 << 0)
+#define IP_RXWM         (1 << 1)
+
+#define FIFO_CAPACITY   8
+
+static void sifive_spi_txfifo_reset(SiFiveSPIState *s)
+{
+    fifo8_reset(&s->tx_fifo);
+
+    s->regs[R_TXDATA] &= ~TXDATA_FULL;
+    s->regs[R_IP] &= ~IP_TXWM;
+}
+
+static void sifive_spi_rxfifo_reset(SiFiveSPIState *s)
+{
+    fifo8_reset(&s->rx_fifo);
+
+    s->regs[R_RXDATA] |= RXDATA_EMPTY;
+    s->regs[R_IP] &= ~IP_RXWM;
+}
+
+static void sifive_spi_update_cs(SiFiveSPIState *s)
+{
+    int i;
+
+    for (i = 0; i < s->num_cs; i++) {
+        if (s->regs[R_CSDEF] & (1 << i)) {
+            qemu_set_irq(s->cs_lines[i], !(s->regs[R_CSMODE]));
+        }
+    }
+}
+
+static void sifive_spi_update_irq(SiFiveSPIState *s)
+{
+    int level;
+
+    if (fifo8_num_used(&s->tx_fifo) < s->regs[R_TXMARK]) {
+        s->regs[R_IP] |= IP_TXWM;
+    } else {
+        s->regs[R_IP] &= ~IP_TXWM;
+    }
+
+    if (fifo8_num_used(&s->rx_fifo) > s->regs[R_RXMARK]) {
+        s->regs[R_IP] |= IP_RXWM;
+    } else {
+        s->regs[R_IP] &= ~IP_RXWM;
+    }
+
+    level = s->regs[R_IP] & s->regs[R_IE] ? 1 : 0;
+    qemu_set_irq(s->irq, level);
+}
+
+static void sifive_spi_reset(DeviceState *d)
+{
+    SiFiveSPIState *s = SIFIVE_SPI(d);
+
+    memset(s->regs, 0, sizeof(s->regs));
+
+    /* The reset value is high for all implemented CS pins */
+    s->regs[R_CSDEF] = (1 << s->num_cs) - 1;
+
+    /* Populate register with their default value */
+    s->regs[R_SCKDIV] = 0x03;
+    s->regs[R_DELAY0] = 0x1001;
+    s->regs[R_DELAY1] = 0x01;
+
+    sifive_spi_txfifo_reset(s);
+    sifive_spi_rxfifo_reset(s);
+
+    sifive_spi_update_cs(s);
+    sifive_spi_update_irq(s);
+}
+
+static void sifive_spi_flush_txfifo(SiFiveSPIState *s)
+{
+    uint8_t tx;
+    uint8_t rx;
+
+    while (!fifo8_is_empty(&s->tx_fifo)) {
+        tx = fifo8_pop(&s->tx_fifo);
+        rx = ssi_transfer(s->spi, tx);
+
+        if (!fifo8_is_full(&s->rx_fifo)) {
+            if (!(s->regs[R_FMT] & FMT_DIR)) {
+                fifo8_push(&s->rx_fifo, rx);
+            }
+        }
+    }
+}
+
+static bool sifive_spi_is_bad_reg(hwaddr addr, bool allow_reserved)
+{
+    bool bad;
+
+    switch (addr) {
+    /* reserved offsets */
+    case 0x08:
+    case 0x0C:
+    case 0x1C:
+    case 0x20:
+    case 0x24:
+    case 0x30:
+    case 0x34:
+    case 0x38:
+    case 0x3C:
+    case 0x44:
+    case 0x58:
+    case 0x5C:
+    case 0x68:
+    case 0x6C:
+        bad = allow_reserved ? false : true;
+        break;
+    default:
+        bad = false;
+    }
+
+    if (addr >= (SIFIVE_SPI_REG_NUM << 2)) {
+        bad = true;
+    }
+
+    return bad;
+}
+
+static uint64_t sifive_spi_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    SiFiveSPIState *s = opaque;
+    uint32_t r;
+
+    if (sifive_spi_is_bad_reg(addr, true)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad read at address 0x%"
+                      HWADDR_PRIx "\n", __func__, addr);
+        return 0;
+    }
+
+    addr >>= 2;
+    switch (addr) {
+    case R_TXDATA:
+        if (fifo8_is_full(&s->tx_fifo)) {
+            return TXDATA_FULL;
+        }
+        r = 0;
+        break;
+
+    case R_RXDATA:
+        if (fifo8_is_empty(&s->rx_fifo)) {
+            return RXDATA_EMPTY;
+        }
+        r = fifo8_pop(&s->rx_fifo);
+        break;
+
+    default:
+        r = s->regs[addr];
+        break;
+    }
+
+    sifive_spi_update_irq(s);
+
+    return r;
+}
+
+static void sifive_spi_write(void *opaque, hwaddr addr,
+                             uint64_t val64, unsigned int size)
+{
+    SiFiveSPIState *s = opaque;
+    uint32_t value = val64;
+
+    if (sifive_spi_is_bad_reg(addr, false)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write at addr=0x%"
+                      HWADDR_PRIx " value=0x%x\n", __func__, addr, value);
+        return;
+    }
+
+    addr >>= 2;
+    switch (addr) {
+    case R_CSID:
+        if (value >= s->num_cs) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid csid %d\n",
+                          __func__, value);
+        } else {
+            s->regs[R_CSID] = value;
+            sifive_spi_update_cs(s);
+        }
+        break;
+
+    case R_CSDEF:
+        if (value >= (1 << s->num_cs)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid csdef %x\n",
+                          __func__, value);
+        } else {
+            s->regs[R_CSDEF] = value;
+        }
+        break;
+
+    case R_CSMODE:
+        if (value > 3) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid csmode %x\n",
+                          __func__, value);
+        } else {
+            s->regs[R_CSMODE] = value;
+            sifive_spi_update_cs(s);
+        }
+        break;
+
+    case R_TXDATA:
+        if (!fifo8_is_full(&s->tx_fifo)) {
+            fifo8_push(&s->tx_fifo, (uint8_t)value);
+            sifive_spi_flush_txfifo(s);
+        }
+        break;
+
+    case R_RXDATA:
+    case R_IP:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid write to read-only reigster 0x%"
+                      HWADDR_PRIx " with 0x%x\n", __func__, addr << 2, value);
+        break;
+
+    case R_TXMARK:
+    case R_RXMARK:
+        if (value >= FIFO_CAPACITY) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid watermark %d\n",
+                          __func__, value);
+        } else {
+            s->regs[addr] = value;
+        }
+        break;
+
+    case R_FCTRL:
+    case R_FFMT:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: direct-map flash interface unimplemented\n",
+                      __func__);
+        break;
+
+    default:
+        s->regs[addr] = value;
+        break;
+    }
+
+    sifive_spi_update_irq(s);
+}
+
+static const MemoryRegionOps sifive_spi_ops = {
+    .read = sifive_spi_read,
+    .write = sifive_spi_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4
+    }
+};
+
+static void sifive_spi_realize(DeviceState *dev, Error **errp)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    SiFiveSPIState *s = SIFIVE_SPI(dev);
+    int i;
+
+    s->spi = ssi_create_bus(dev, "spi");
+    sysbus_init_irq(sbd, &s->irq);
+
+    s->cs_lines = g_new0(qemu_irq, s->num_cs);
+    for (i = 0; i < s->num_cs; i++) {
+        sysbus_init_irq(sbd, &s->cs_lines[i]);
+    }
+
+    memory_region_init_io(&s->mmio, OBJECT(s), &sifive_spi_ops, s,
+                          TYPE_SIFIVE_SPI, 0x1000);
+    sysbus_init_mmio(sbd, &s->mmio);
+
+    fifo8_create(&s->tx_fifo, FIFO_CAPACITY);
+    fifo8_create(&s->rx_fifo, FIFO_CAPACITY);
+}
+
+static Property sifive_spi_properties[] = {
+    DEFINE_PROP_UINT32("num-cs", SiFiveSPIState, num_cs, 1),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void sifive_spi_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, sifive_spi_properties);
+    dc->reset = sifive_spi_reset;
+    dc->realize = sifive_spi_realize;
+}
+
+static const TypeInfo sifive_spi_info = {
+    .name           = TYPE_SIFIVE_SPI,
+    .parent         = TYPE_SYS_BUS_DEVICE,
+    .instance_size  = sizeof(SiFiveSPIState),
+    .class_init     = sifive_spi_class_init,
+};
+
+static void sifive_spi_register_types(void)
+{
+    type_register_static(&sifive_spi_info);
+}
+
+type_init(sifive_spi_register_types)
diff --git a/hw/ssi/Kconfig b/hw/ssi/Kconfig
index 9e54a0c8dd..7d90a02181 100644
--- a/hw/ssi/Kconfig
+++ b/hw/ssi/Kconfig
@@ -2,6 +2,10 @@ config PL022
     bool
     select SSI
 
+config SIFIVE_SPI
+    bool
+    select SSI
+
 config SSI
     bool
 
diff --git a/hw/ssi/meson.build b/hw/ssi/meson.build
index dee00c0da6..3d6bc82ab1 100644
--- a/hw/ssi/meson.build
+++ b/hw/ssi/meson.build
@@ -2,6 +2,7 @@ softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_smc.c'))
 softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('mss-spi.c'))
 softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_fiu.c'))
 softmmu_ss.add(when: 'CONFIG_PL022', if_true: files('pl022.c'))
+softmmu_ss.add(when: 'CONFIG_SIFIVE_SPI', if_true: files('sifive_spi.c'))
 softmmu_ss.add(when: 'CONFIG_SSI', if_true: files('ssi.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_SPI', if_true: files('stm32f2xx_spi.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX_SPI', if_true: files('xilinx_spi.c'))
-- 
2.30.1


