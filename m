Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA40337F91
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 22:22:01 +0100 (CET)
Received: from localhost ([::1]:59168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKSkq-0002ux-5x
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 16:22:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lKSZ7-0006p9-Dv
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 16:09:53 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:54029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lKSZ5-00052d-0d
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 16:09:53 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MJEAX-1l0Sbf3gyp-00Kckl; Thu, 11 Mar 2021 22:09:41 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 5/9] char: add goldfish-tty
Date: Thu, 11 Mar 2021 22:09:30 +0100
Message-Id: <20210311210934.1935587-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311210934.1935587-1-laurent@vivier.eu>
References: <20210311210934.1935587-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EJD8nxh1KbmWqONChKKWIcFEoDiwfAjWpK3/M7vw9zD9Uej74+A
 YCigd1G5GNen8XqbLkook2IX9xaX1nWRz45DsJ6/2Ulfh4aShaRsDunUT2AoJjyifvl0Sqe
 yVjV+YufrqpqVqcOAv/AZM/BQRpa8ZIRGyKam55CYVVQG6IqCWVy4bEizgvYG47m2Ao3C90
 CGVasqMeiSrOYY1EjiyTA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PW8LGMEBpZI=:BlcTO6/W5HmtIctiZcLnR/
 qcjezoWb3ebbQpmI4E36yQVfUTUSP02M06PsxnkDI+O/xN8ayJ1nNeQkTUcRDxkMIGyS0g0M5
 p/pBYJtI+7xIloHHiS4dMpsluJiRJPKhkuhisII3YNfWqgPFYJc1KmTWdrukM6c8sr7H74cCB
 DfZmBUA6kXQ5iOmhReaqyDxexa2aFWls7zI+qfyV8dDjZ0ZwZcTnPYqPPPIgx7YPlGDoOFobk
 dpIxkZs4+tTEhP79kf3AJAugJXzn+xzOIEkz9XTfZJRwJFORfLTR789UuqbWKYnTPWyMiLn1t
 7vfTsIKzmYvTkiIr8LvEM5lHMKRwU+xOgkDA+WwwAljZpQRWKxYPGQmPuk9IJXbab6TS1UmP2
 ct4P5Y8ELrG/yVoS2uSnCa8KhRiLfrJhft51Jrod17G5ORn/z+0yFM7caK/8Pn8VA/ctYgtqg
 ysl8bL/quQ==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the goldfish tty device as defined in

https://android.googlesource.com/platform/external/qemu/+/master/docs/GOLDFISH-VIRTUAL-HARDWARE.TXT

and based on the kernel driver code:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/goldfish.c

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210309195941.763896-2-laurent@vivier.eu>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/char/goldfish_tty.h |  35 ++++
 hw/char/goldfish_tty.c         | 283 +++++++++++++++++++++++++++++++++
 hw/char/Kconfig                |   3 +
 hw/char/meson.build            |   2 +
 hw/char/trace-events           |  10 ++
 5 files changed, 333 insertions(+)
 create mode 100644 include/hw/char/goldfish_tty.h
 create mode 100644 hw/char/goldfish_tty.c

diff --git a/include/hw/char/goldfish_tty.h b/include/hw/char/goldfish_tty.h
new file mode 100644
index 000000000000..b9dd67362a68
--- /dev/null
+++ b/include/hw/char/goldfish_tty.h
@@ -0,0 +1,35 @@
+/*
+ * SPDX-License-Identifer: GPL-2.0-or-later
+ *
+ * Goldfish TTY
+ *
+ * (c) 2020 Laurent Vivier <laurent@vivier.eu>
+ *
+ */
+
+#ifndef HW_CHAR_GOLDFISH_TTY_H
+#define HW_CHAR_GOLDFISH_TTY_H
+
+#include "qemu/fifo8.h"
+#include "chardev/char-fe.h"
+
+#define TYPE_GOLDFISH_TTY "goldfish_tty"
+OBJECT_DECLARE_SIMPLE_TYPE(GoldfishTTYState, GOLDFISH_TTY)
+
+#define GOLFISH_TTY_BUFFER_SIZE 128
+
+struct GoldfishTTYState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+    qemu_irq irq;
+    CharBackend chr;
+
+    uint32_t data_len;
+    uint64_t data_ptr;
+    bool int_enabled;
+
+    Fifo8 rx_fifo;
+};
+
+#endif
diff --git a/hw/char/goldfish_tty.c b/hw/char/goldfish_tty.c
new file mode 100644
index 000000000000..9f705f8653cc
--- /dev/null
+++ b/hw/char/goldfish_tty.c
@@ -0,0 +1,283 @@
+/*
+ * SPDX-License-Identifer: GPL-2.0-or-later
+ *
+ * Goldfish TTY
+ *
+ * (c) 2020 Laurent Vivier <laurent@vivier.eu>
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties-system.h"
+#include "hw/sysbus.h"
+#include "migration/vmstate.h"
+#include "chardev/char-fe.h"
+#include "qemu/log.h"
+#include "trace.h"
+#include "exec/address-spaces.h"
+#include "hw/char/goldfish_tty.h"
+
+/* registers */
+
+enum {
+    REG_PUT_CHAR      = 0x00,
+    REG_BYTES_READY   = 0x04,
+    REG_CMD           = 0x08,
+    REG_DATA_PTR      = 0x10,
+    REG_DATA_LEN      = 0x14,
+    REG_DATA_PTR_HIGH = 0x18,
+    REG_VERSION       = 0x20,
+};
+
+/* commands */
+
+enum {
+    CMD_INT_DISABLE   = 0x00,
+    CMD_INT_ENABLE    = 0x01,
+    CMD_WRITE_BUFFER  = 0x02,
+    CMD_READ_BUFFER   = 0x03,
+};
+
+static uint64_t goldfish_tty_read(void *opaque, hwaddr addr,
+                                  unsigned size)
+{
+    GoldfishTTYState *s = opaque;
+    uint64_t value = 0;
+
+    switch (addr) {
+    case REG_BYTES_READY:
+        value = fifo8_num_used(&s->rx_fifo);
+        break;
+    case REG_VERSION:
+        value = 0;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: unimplemented register read 0x%02"HWADDR_PRIx"\n",
+                      __func__, addr);
+        break;
+    }
+
+    trace_goldfish_tty_read(s, addr, size, value);
+
+    return value;
+}
+
+static void goldfish_tty_cmd(GoldfishTTYState *s, uint32_t cmd)
+{
+    uint32_t to_copy;
+    uint8_t *buf;
+    uint8_t data_out[GOLFISH_TTY_BUFFER_SIZE];
+    int len;
+    uint64_t ptr;
+
+    switch (cmd) {
+    case CMD_INT_DISABLE:
+        if (s->int_enabled) {
+            if (!fifo8_is_empty(&s->rx_fifo)) {
+                qemu_set_irq(s->irq, 0);
+            }
+            s->int_enabled = false;
+        }
+        break;
+    case CMD_INT_ENABLE:
+        if (!s->int_enabled) {
+            if (!fifo8_is_empty(&s->rx_fifo)) {
+                qemu_set_irq(s->irq, 1);
+            }
+            s->int_enabled = true;
+        }
+        break;
+    case CMD_WRITE_BUFFER:
+        len = s->data_len;
+        ptr = s->data_ptr;
+        while (len) {
+            to_copy = MIN(GOLFISH_TTY_BUFFER_SIZE, len);
+
+            address_space_rw(&address_space_memory, ptr,
+                             MEMTXATTRS_UNSPECIFIED, data_out, to_copy, 0);
+            qemu_chr_fe_write_all(&s->chr, data_out, to_copy);
+
+            len -= to_copy;
+            ptr += to_copy;
+        }
+        break;
+    case CMD_READ_BUFFER:
+        len = s->data_len;
+        ptr = s->data_ptr;
+        while (len && !fifo8_is_empty(&s->rx_fifo)) {
+            buf = (uint8_t *)fifo8_pop_buf(&s->rx_fifo, len, &to_copy);
+            address_space_rw(&address_space_memory, ptr,
+                            MEMTXATTRS_UNSPECIFIED, buf, to_copy, 1);
+
+            len -= to_copy;
+            ptr += to_copy;
+        }
+        if (s->int_enabled && fifo8_is_empty(&s->rx_fifo)) {
+            qemu_set_irq(s->irq, 0);
+        }
+        break;
+    }
+}
+
+static void goldfish_tty_write(void *opaque, hwaddr addr,
+                               uint64_t value, unsigned size)
+{
+    GoldfishTTYState *s = opaque;
+    unsigned char c;
+
+    trace_goldfish_tty_write(s, addr, size, value);
+
+    switch (addr) {
+    case REG_PUT_CHAR:
+        c = value;
+        qemu_chr_fe_write_all(&s->chr, &c, sizeof(c));
+        break;
+    case REG_CMD:
+        goldfish_tty_cmd(s, value);
+        break;
+    case REG_DATA_PTR:
+        s->data_ptr = value;
+        break;
+    case REG_DATA_PTR_HIGH:
+        s->data_ptr = deposit64(s->data_ptr, 32, 32, value);
+        break;
+    case REG_DATA_LEN:
+        s->data_len = value;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: unimplemented register write 0x%02"HWADDR_PRIx"\n",
+                      __func__, addr);
+        break;
+    }
+}
+
+static const MemoryRegionOps goldfish_tty_ops = {
+    .read = goldfish_tty_read,
+    .write = goldfish_tty_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid.max_access_size = 4,
+    .impl.max_access_size = 4,
+    .impl.min_access_size = 4,
+};
+
+static int goldfish_tty_can_receive(void *opaque)
+{
+    GoldfishTTYState *s = opaque;
+    int available = fifo8_num_free(&s->rx_fifo);
+
+    trace_goldfish_tty_can_receive(s, available);
+
+    return available;
+}
+
+static void goldfish_tty_receive(void *opaque, const uint8_t *buffer, int size)
+{
+    GoldfishTTYState *s = opaque;
+
+    trace_goldfish_tty_receive(s, size);
+
+    g_assert(size <= fifo8_num_free(&s->rx_fifo));
+
+    fifo8_push_all(&s->rx_fifo, buffer, size);
+
+    if (s->int_enabled && !fifo8_is_empty(&s->rx_fifo)) {
+        qemu_set_irq(s->irq, 1);
+    }
+}
+
+static void goldfish_tty_reset(DeviceState *dev)
+{
+    GoldfishTTYState *s = GOLDFISH_TTY(dev);
+
+    trace_goldfish_tty_reset(s);
+
+    fifo8_reset(&s->rx_fifo);
+    s->int_enabled = false;
+    s->data_ptr = 0;
+    s->data_len = 0;
+}
+
+static void goldfish_tty_realize(DeviceState *dev, Error **errp)
+{
+    GoldfishTTYState *s = GOLDFISH_TTY(dev);
+
+    trace_goldfish_tty_realize(s);
+
+    fifo8_create(&s->rx_fifo, GOLFISH_TTY_BUFFER_SIZE);
+    memory_region_init_io(&s->iomem, OBJECT(s), &goldfish_tty_ops, s,
+                          "goldfish_tty", 0x24);
+
+    if (qemu_chr_fe_backend_connected(&s->chr)) {
+        qemu_chr_fe_set_handlers(&s->chr, goldfish_tty_can_receive,
+                                 goldfish_tty_receive, NULL, NULL,
+                                 s, NULL, true);
+    }
+}
+
+static void goldfish_tty_unrealize(DeviceState *dev)
+{
+    GoldfishTTYState *s = GOLDFISH_TTY(dev);
+
+    trace_goldfish_tty_unrealize(s);
+
+    fifo8_destroy(&s->rx_fifo);
+}
+
+static const VMStateDescription vmstate_goldfish_tty = {
+    .name = "goldfish_tty",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(data_len, GoldfishTTYState),
+        VMSTATE_UINT64(data_ptr, GoldfishTTYState),
+        VMSTATE_BOOL(int_enabled, GoldfishTTYState),
+        VMSTATE_FIFO8(rx_fifo, GoldfishTTYState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property goldfish_tty_properties[] = {
+    DEFINE_PROP_CHR("chardev", GoldfishTTYState, chr),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void goldfish_tty_instance_init(Object *obj)
+{
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
+    GoldfishTTYState *s = GOLDFISH_TTY(obj);
+
+    trace_goldfish_tty_instance_init(s);
+
+    sysbus_init_mmio(dev, &s->iomem);
+    sysbus_init_irq(dev, &s->irq);
+}
+
+static void goldfish_tty_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    device_class_set_props(dc, goldfish_tty_properties);
+    dc->reset = goldfish_tty_reset;
+    dc->realize = goldfish_tty_realize;
+    dc->unrealize = goldfish_tty_unrealize;
+    dc->vmsd = &vmstate_goldfish_tty;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+}
+
+static const TypeInfo goldfish_tty_info = {
+    .name = TYPE_GOLDFISH_TTY,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .class_init = goldfish_tty_class_init,
+    .instance_init = goldfish_tty_instance_init,
+    .instance_size = sizeof(GoldfishTTYState),
+};
+
+static void goldfish_tty_register_types(void)
+{
+    type_register_static(&goldfish_tty_info);
+}
+
+type_init(goldfish_tty_register_types)
diff --git a/hw/char/Kconfig b/hw/char/Kconfig
index f6f4fffd1b7c..4cf36ac637ba 100644
--- a/hw/char/Kconfig
+++ b/hw/char/Kconfig
@@ -64,3 +64,6 @@ config MCHP_PFSOC_MMUART
 
 config SIFIVE_UART
     bool
+
+config GOLDFISH_TTY
+    bool
diff --git a/hw/char/meson.build b/hw/char/meson.build
index afe9a0af88c1..6f5c3e5b5bfa 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -39,3 +39,5 @@ specific_ss.add(when: 'CONFIG_HTIF', if_true: files('riscv_htif.c'))
 specific_ss.add(when: 'CONFIG_TERMINAL3270', if_true: files('terminal3270.c'))
 specific_ss.add(when: 'CONFIG_VIRTIO', if_true: files('virtio-serial-bus.c'))
 specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_vty.c'))
+
+specific_ss.add(when: 'CONFIG_GOLDFISH_TTY', if_true: files('goldfish_tty.c'))
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 81026f661277..76d52938ead3 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -20,6 +20,16 @@ virtio_console_flush_buf(unsigned int port, size_t len, ssize_t ret) "port %u, i
 virtio_console_chr_read(unsigned int port, int size) "port %u, size %d"
 virtio_console_chr_event(unsigned int port, int event) "port %u, event %d"
 
+# goldfish_tty.c
+goldfish_tty_read(void *dev, unsigned int addr, unsigned int size, uint64_t value) "tty: %p reg: 0x%02x size: %d value: 0x%"PRIx64
+goldfish_tty_write(void *dev, unsigned int addr, unsigned int size, uint64_t value) "tty: %p reg: 0x%02x size: %d value: 0x%"PRIx64
+goldfish_tty_can_receive(void *dev, unsigned int available) "tty: %p available: %u"
+goldfish_tty_receive(void *dev, unsigned int size) "tty: %p size: %u"
+goldfish_tty_reset(void *dev) "tty: %p"
+goldfish_tty_realize(void *dev) "tty: %p"
+goldfish_tty_unrealize(void *dev) "tty: %p"
+goldfish_tty_instance_init(void *dev) "tty: %p"
+
 # grlib_apbuart.c
 grlib_apbuart_event(int event) "event:%d"
 grlib_apbuart_writel_unknown(uint64_t addr, uint32_t value) "addr 0x%"PRIx64" value 0x%x"
-- 
2.29.2


