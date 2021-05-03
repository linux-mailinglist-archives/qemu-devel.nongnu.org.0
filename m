Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CC73722F8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:28:28 +0200 (CEST)
Received: from localhost ([::1]:51290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldh3D-0001TW-UE
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgpL-0004bR-Ah
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:14:07 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgpI-00008S-MH
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:14:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080044; x=1651616044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+StzjlztuRLfj/ZuyyAiwFvIuh/MaI+qsivRZ24t6Qg=;
 b=HtfOK9L+Z/IEv6s8g4L2vFgBdhVQaWpODHcMVdLXfjvs7ALPkZJchoR3
 T0Jtd3xrr73X9PH/rBsLniZupU7CAe6qvijzfgOAsodc5ZpCkHa6Pk5wU
 d1dVByaKfVmYLhysrAGH3+Zppg2n/8EVhUNlRnDo2dywCKblD1kxU07n6
 jKG54GFHE73mf5RlXE+me0qytvxBQVXzVIGN3M+dc0texnXe//YdP1+ty
 pK/4Ha0Gvc9hL2kf4spNJphdpXLw+RtjH6Aw4QwMZBkhgZQWDMTEccux6
 6j+k33y4OnWix3rcbEt+rEftalHU8YXVTVYOETTROO1olWAZXU3NHfrw7 w==;
IronPort-SDR: qptQZruSw9p+nOsjpeP8VrIdWmGwn6U4xU7G5iYZDa2YJq7dv88ISS2H8HZKfGRFZr6RVVcuh0
 UdUcGmbUfjdMg53+WgxgqB7cVbstzWyW8lfwXvatmw3ildCM6rmC5FryNQ0QKaDPdnukXGLXRY
 kET2wKDrdY9UjM74zkCKqGVUS3pOzBvHqD7RUSJzfOZP9YLfeTG1WYX0sSVZqEYrTvICKox7kc
 Es2GiO6+IHl1RKQRLKorlxGuWNTxWNs6vLxIQNpFhSf1O68vWXPRcacQb42A0DxOAkyCk1EC6y
 uDs=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114607"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:14:02 +0800
IronPort-SDR: b486RxGmX/YhJKh3ctCSyH38w6vKBqK3aWN4VzZKe/v8AedZjfrXjdu/sHXWAgQz5xdjZ4Bt8E
 1K9UqFb7kSuQKWaDclJNbzpdUoQMjnXlUBxeXGO6iaO3a3m0XA7UE3YzHjkN2rCTUs+FNcxnpx
 V8sbs2kxIDQ5y6a0lhQc9ir2ipKLo1brjz4ZB5/wKUQvDwhBT/xvBZSda4O1P2nJxBG1mCPdFO
 mH34U0t2TIwNXq2Br2gFLowiJspKxHHwqtMyaFVQ1DYzXfvzFrAePtvOGkoKWd3asycsPOimrV
 UJaFDYENVrkYcpnoT6dMNq45
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:54:13 -0700
IronPort-SDR: JgrInKymPLkkGEVmXpWrjvMk8tid9vzcOWZmHELGRoA0cCYswCShsD1zm54Qtdc6I5zui6YZ7+
 feJjUeQ4xE8PdRaQVWVEx8GF/5XqFen6d8AzD0Tc+jnqVbC96v7kFfsLuAww20+m0F5Lc01TMa
 ACEfmssPWycoVk/t4ViDsWppo2AesHyepRlU5oLxrMm8madqah1VEcSD9wD5pJtwkYT1aXeid6
 y3DPlejXKrZ3UlxpNqA/vDpXSpeIS1jMizxR5VXVDn5FXTqlYTzCAP7gIcijy0cTvqGecFGe3+
 kWg=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:14:00 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 07/42] hw/char: Add Shakti UART emulation
Date: Tue,  4 May 2021 08:12:52 +1000
Message-Id: <20210503221327.3068768-8-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503221327.3068768-1-alistair.francis@wdc.com>
References: <20210503221327.3068768-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=750139ea6=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Vijai Kumar K <vijai@behindbytes.com>, alistair23@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vijai Kumar K <vijai@behindbytes.com>

This is the initial implementation of Shakti UART.

Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210401181457.73039-4-vijai@behindbytes.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/char/shakti_uart.h |  74 ++++++++++++++
 hw/char/shakti_uart.c         | 185 ++++++++++++++++++++++++++++++++++
 MAINTAINERS                   |   2 +
 hw/char/meson.build           |   1 +
 hw/char/trace-events          |   4 +
 5 files changed, 266 insertions(+)
 create mode 100644 include/hw/char/shakti_uart.h
 create mode 100644 hw/char/shakti_uart.c

diff --git a/include/hw/char/shakti_uart.h b/include/hw/char/shakti_uart.h
new file mode 100644
index 0000000000..526c408233
--- /dev/null
+++ b/include/hw/char/shakti_uart.h
@@ -0,0 +1,74 @@
+/*
+ * SHAKTI UART
+ *
+ * Copyright (c) 2021 Vijai Kumar K <vijai@behindbytes.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef HW_SHAKTI_UART_H
+#define HW_SHAKTI_UART_H
+
+#include "hw/sysbus.h"
+#include "chardev/char-fe.h"
+
+#define SHAKTI_UART_BAUD        0x00
+#define SHAKTI_UART_TX          0x04
+#define SHAKTI_UART_RX          0x08
+#define SHAKTI_UART_STATUS      0x0C
+#define SHAKTI_UART_DELAY       0x10
+#define SHAKTI_UART_CONTROL     0x14
+#define SHAKTI_UART_INT_EN      0x18
+#define SHAKTI_UART_IQ_CYCLES   0x1C
+#define SHAKTI_UART_RX_THRES    0x20
+
+#define SHAKTI_UART_STATUS_TX_EMPTY     (1 << 0)
+#define SHAKTI_UART_STATUS_TX_FULL      (1 << 1)
+#define SHAKTI_UART_STATUS_RX_NOT_EMPTY (1 << 2)
+#define SHAKTI_UART_STATUS_RX_FULL      (1 << 3)
+/* 9600 8N1 is the default setting */
+/* Reg value = (50000000 Hz)/(16 * 9600)*/
+#define SHAKTI_UART_BAUD_DEFAULT    0x0145
+#define SHAKTI_UART_CONTROL_DEFAULT 0x0100
+
+#define TYPE_SHAKTI_UART "shakti-uart"
+#define SHAKTI_UART(obj) \
+    OBJECT_CHECK(ShaktiUartState, (obj), TYPE_SHAKTI_UART)
+
+typedef struct {
+    /* <private> */
+    SysBusDevice parent_obj;
+
+    /* <public> */
+    MemoryRegion mmio;
+
+    uint32_t uart_baud;
+    uint32_t uart_tx;
+    uint32_t uart_rx;
+    uint32_t uart_status;
+    uint32_t uart_delay;
+    uint32_t uart_control;
+    uint32_t uart_interrupt;
+    uint32_t uart_iq_cycles;
+    uint32_t uart_rx_threshold;
+
+    CharBackend chr;
+} ShaktiUartState;
+
+#endif /* HW_SHAKTI_UART_H */
diff --git a/hw/char/shakti_uart.c b/hw/char/shakti_uart.c
new file mode 100644
index 0000000000..6870821325
--- /dev/null
+++ b/hw/char/shakti_uart.c
@@ -0,0 +1,185 @@
+/*
+ * SHAKTI UART
+ *
+ * Copyright (c) 2021 Vijai Kumar K <vijai@behindbytes.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/char/shakti_uart.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
+#include "qemu/log.h"
+
+static uint64_t shakti_uart_read(void *opaque, hwaddr addr, unsigned size)
+{
+    ShaktiUartState *s = opaque;
+
+    switch (addr) {
+    case SHAKTI_UART_BAUD:
+        return s->uart_baud;
+    case SHAKTI_UART_RX:
+        qemu_chr_fe_accept_input(&s->chr);
+        s->uart_status &= ~SHAKTI_UART_STATUS_RX_NOT_EMPTY;
+        return s->uart_rx;
+    case SHAKTI_UART_STATUS:
+        return s->uart_status;
+    case SHAKTI_UART_DELAY:
+        return s->uart_delay;
+    case SHAKTI_UART_CONTROL:
+        return s->uart_control;
+    case SHAKTI_UART_INT_EN:
+        return s->uart_interrupt;
+    case SHAKTI_UART_IQ_CYCLES:
+        return s->uart_iq_cycles;
+    case SHAKTI_UART_RX_THRES:
+        return s->uart_rx_threshold;
+    default:
+        /* Also handles TX REG which is write only */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr);
+    }
+
+    return 0;
+}
+
+static void shakti_uart_write(void *opaque, hwaddr addr,
+                              uint64_t data, unsigned size)
+{
+    ShaktiUartState *s = opaque;
+    uint32_t value = data;
+    uint8_t ch;
+
+    switch (addr) {
+    case SHAKTI_UART_BAUD:
+        s->uart_baud = value;
+        break;
+    case SHAKTI_UART_TX:
+        ch = value;
+        qemu_chr_fe_write_all(&s->chr, &ch, 1);
+        s->uart_status &= ~SHAKTI_UART_STATUS_TX_FULL;
+        break;
+    case SHAKTI_UART_STATUS:
+        s->uart_status = value;
+        break;
+    case SHAKTI_UART_DELAY:
+        s->uart_delay = value;
+        break;
+    case SHAKTI_UART_CONTROL:
+        s->uart_control = value;
+        break;
+    case SHAKTI_UART_INT_EN:
+        s->uart_interrupt = value;
+        break;
+    case SHAKTI_UART_IQ_CYCLES:
+        s->uart_iq_cycles = value;
+        break;
+    case SHAKTI_UART_RX_THRES:
+        s->uart_rx_threshold = value;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr);
+    }
+}
+
+static const MemoryRegionOps shakti_uart_ops = {
+    .read = shakti_uart_read,
+    .write = shakti_uart_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {.min_access_size = 1, .max_access_size = 4},
+    .valid = {.min_access_size = 1, .max_access_size = 4},
+};
+
+static void shakti_uart_reset(DeviceState *dev)
+{
+    ShaktiUartState *s = SHAKTI_UART(dev);
+
+    s->uart_baud = SHAKTI_UART_BAUD_DEFAULT;
+    s->uart_tx = 0x0;
+    s->uart_rx = 0x0;
+    s->uart_status = 0x0000;
+    s->uart_delay = 0x0000;
+    s->uart_control = SHAKTI_UART_CONTROL_DEFAULT;
+    s->uart_interrupt = 0x0000;
+    s->uart_iq_cycles = 0x00;
+    s->uart_rx_threshold = 0x00;
+}
+
+static int shakti_uart_can_receive(void *opaque)
+{
+    ShaktiUartState *s = opaque;
+
+    return !(s->uart_status & SHAKTI_UART_STATUS_RX_NOT_EMPTY);
+}
+
+static void shakti_uart_receive(void *opaque, const uint8_t *buf, int size)
+{
+    ShaktiUartState *s = opaque;
+
+    s->uart_rx = *buf;
+    s->uart_status |= SHAKTI_UART_STATUS_RX_NOT_EMPTY;
+}
+
+static void shakti_uart_realize(DeviceState *dev, Error **errp)
+{
+    ShaktiUartState *sus = SHAKTI_UART(dev);
+    qemu_chr_fe_set_handlers(&sus->chr, shakti_uart_can_receive,
+                             shakti_uart_receive, NULL, NULL, sus, NULL, true);
+}
+
+static void shakti_uart_instance_init(Object *obj)
+{
+    ShaktiUartState *sus = SHAKTI_UART(obj);
+    memory_region_init_io(&sus->mmio,
+                          obj,
+                          &shakti_uart_ops,
+                          sus,
+                          TYPE_SHAKTI_UART,
+                          0x1000);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &sus->mmio);
+}
+
+static Property shakti_uart_properties[] = {
+    DEFINE_PROP_CHR("chardev", ShaktiUartState, chr),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void shakti_uart_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->reset = shakti_uart_reset;
+    dc->realize = shakti_uart_realize;
+    device_class_set_props(dc, shakti_uart_properties);
+}
+
+static const TypeInfo shakti_uart_info = {
+    .name = TYPE_SHAKTI_UART,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(ShaktiUartState),
+    .class_init = shakti_uart_class_init,
+    .instance_init = shakti_uart_instance_init,
+};
+
+static void shakti_uart_register_types(void)
+{
+    type_register_static(&shakti_uart_info);
+}
+type_init(shakti_uart_register_types)
diff --git a/MAINTAINERS b/MAINTAINERS
index 181ea0d76d..93830817f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1397,7 +1397,9 @@ M: Vijai Kumar K <vijai@behindbytes.com>
 L: qemu-riscv@nongnu.org
 S: Supported
 F: hw/riscv/shakti_c.c
+F: hw/char/shakti_uart.c
 F: include/hw/riscv/shakti_c.h
+F: include/hw/char/shakti_uart.h
 
 SiFive Machines
 M: Alistair Francis <Alistair.Francis@wdc.com>
diff --git a/hw/char/meson.build b/hw/char/meson.build
index da5bb8b762..014833dded 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -19,6 +19,7 @@ softmmu_ss.add(when: 'CONFIG_SERIAL', if_true: files('serial.c'))
 softmmu_ss.add(when: 'CONFIG_SERIAL_ISA', if_true: files('serial-isa.c'))
 softmmu_ss.add(when: 'CONFIG_SERIAL_PCI', if_true: files('serial-pci.c'))
 softmmu_ss.add(when: 'CONFIG_SERIAL_PCI_MULTI', if_true: files('serial-pci-multi.c'))
+softmmu_ss.add(when: 'CONFIG_SHAKTI', if_true: files('shakti_uart.c'))
 softmmu_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-console.c'))
 softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen_console.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_uartlite.c'))
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 76d52938ea..c8dcade104 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -90,6 +90,10 @@ cmsdk_apb_uart_set_params(int speed) "CMSDK APB UART: params set to %d 8N1"
 nrf51_uart_read(uint64_t addr, uint64_t r, unsigned int size) "addr 0x%" PRIx64 " value 0x%" PRIx64 " size %u"
 nrf51_uart_write(uint64_t addr, uint64_t value, unsigned int size) "addr 0x%" PRIx64 " value 0x%" PRIx64 " size %u"
 
+# shakti_uart.c
+shakti_uart_read(uint64_t addr, uint16_t r, unsigned int size) "addr 0x%" PRIx64 " value 0x%" PRIx16 " size %u"
+shakti_uart_write(uint64_t addr, uint64_t value, unsigned int size) "addr 0x%" PRIx64 " value 0x%" PRIx64 " size %u"
+
 # exynos4210_uart.c
 exynos_uart_dmabusy(uint32_t channel) "UART%d: DMA busy (Rx buffer empty)"
 exynos_uart_dmaready(uint32_t channel) "UART%d: DMA ready"
-- 
2.31.1


