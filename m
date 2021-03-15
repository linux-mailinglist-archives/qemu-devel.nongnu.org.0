Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4682833C7EF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 21:45:26 +0100 (CET)
Received: from localhost ([::1]:56004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLu5d-0005T6-9H
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 16:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lLu30-0004BF-8b
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:42:42 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:40119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lLu2t-00034S-VB
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:42:41 -0400
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MXHBo-1lDdeL2Z02-00YkmF; Mon, 15 Mar 2021 21:42:31 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] m68k: add a system controller
Date: Mon, 15 Mar 2021 21:42:25 +0100
Message-Id: <20210315204226.3481044-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210315204226.3481044-1-laurent@vivier.eu>
References: <20210315204226.3481044-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ixmB+F/h/8eRE0dJ6r0Qvype6wz7u0gZtsnSlc31g0T6HqCTF1C
 UzC+Ww4TXlGtF5AjA0pkNAAZnVfBbydINqUSutQCArUggFXndD6qnRFdy792NXWHM+9DtUs
 k9aOjyi6zkZPdTnPW0hasikvfBLrEvUdkyfnyD6wBbVH9KHZs3Ta6+dWK9YBI5aSW43S5pu
 d2ebMAd12iR2BaGjZB9pg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kFKN61LyKC4=:zrCErXFdScIDZtINoQMz+G
 D4ZJSgXz/lbT6ibY9P3lxx0wbSsp8CdMU+QIQll5DQl7tf5kd4MYCVbNyRynGTLNiyc5XA8V1
 yuwzm0DBPRUIaF3Sd3FOMaXq0v4tNvvz1YmL3VhJ5Qc7z3v+jLpNZar1j6E5MgP3BocCI4py0
 Y0TKXTVzOZzIkBA7Alr3K4gpKyHrW9Bk7AWEx5Z7X6TLerh6VffPL2fXN/8weZS/bHNFcr4uX
 frOr++0j60Z58pmeiHLJxtyzNKYZoqLQhL2FcOY7VVz/7ULfC2LoGzfkdFTR5Al0xFE5JHvoo
 J+HFc6VjZEMqRMsninGXmrLHNhIwAFAA9ZdqlIdMWrV6fgUVuiBcN0cs0y646tWME07BlhR25
 mj0wtZlMeESUIsOyvwPLWyIDmzONB8/PyTR1uV5yyiuVbishdsstlF2EvWU3G0xLKlR406Kxh
 YMDjmglukA==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a system controller for the m68k-virt machine.
This controller allows the kernel to power off or reset the machine.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210312214145.2936082-5-laurent@vivier.eu>
---
 docs/specs/virt-ctlr.txt    |  26 +++++++
 include/hw/misc/virt_ctrl.h |  22 ++++++
 hw/misc/virt_ctrl.c         | 151 ++++++++++++++++++++++++++++++++++++
 hw/misc/Kconfig             |   3 +
 hw/misc/meson.build         |   3 +
 hw/misc/trace-events        |   7 ++
 6 files changed, 212 insertions(+)
 create mode 100644 docs/specs/virt-ctlr.txt
 create mode 100644 include/hw/misc/virt_ctrl.h
 create mode 100644 hw/misc/virt_ctrl.c

diff --git a/docs/specs/virt-ctlr.txt b/docs/specs/virt-ctlr.txt
new file mode 100644
index 000000000000..24d38084f7fd
--- /dev/null
+++ b/docs/specs/virt-ctlr.txt
@@ -0,0 +1,26 @@
+Virtual System Controller
+=========================
+
+This device is a simple interface defined for the pure virtual machine with no
+hardware reference implementation to allow the guest kernel to send command
+to the host hypervisor.
+
+The specification can evolve, the current state is defined as below.
+
+This is a MMIO mapped device using 256 bytes.
+
+Two 32bit registers are defined:
+
+1- the features register (read-only, address 0x00)
+
+   This register allows the device to report features supported by the
+   controller.
+   The only feature supported for the moment is power control (0x01).
+
+2- the command register (write-only, address 0x04)
+
+   This register allows the kernel to send the commands to the hypervisor.
+   The implemented commands are part of the power control feature and
+   are reset (1), halt (2) and panic (3).
+   A basic command, no-op (0), is always present and can be used to test the
+   register access. This command has no effect.
diff --git a/include/hw/misc/virt_ctrl.h b/include/hw/misc/virt_ctrl.h
new file mode 100644
index 000000000000..edfadc469505
--- /dev/null
+++ b/include/hw/misc/virt_ctrl.h
@@ -0,0 +1,22 @@
+/*
+ * SPDX-License-Identifer: GPL-2.0-or-later
+ *
+ * Virt system Controller
+ */
+
+#ifndef VIRT_CTRL_H
+#define VIRT_CTRL_H
+
+#define TYPE_VIRT_CTRL "virt-ctrl"
+OBJECT_DECLARE_SIMPLE_TYPE(VirtCtrlState, VIRT_CTRL)
+
+struct VirtCtrlState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+    qemu_irq irq;
+
+    uint32_t irq_enabled;
+};
+
+#endif
diff --git a/hw/misc/virt_ctrl.c b/hw/misc/virt_ctrl.c
new file mode 100644
index 000000000000..2ea01bd7a1f0
--- /dev/null
+++ b/hw/misc/virt_ctrl.c
@@ -0,0 +1,151 @@
+/*
+ * SPDX-License-Identifer: GPL-2.0-or-later
+ *
+ * Virt system Controller
+ */
+
+#include "qemu/osdep.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
+#include "migration/vmstate.h"
+#include "qemu/log.h"
+#include "trace.h"
+#include "sysemu/runstate.h"
+#include "hw/misc/virt_ctrl.h"
+
+enum {
+    REG_FEATURES = 0x00,
+    REG_CMD      = 0x04,
+};
+
+#define FEAT_POWER_CTRL 0x00000001
+
+enum {
+    CMD_NOOP,
+    CMD_RESET,
+    CMD_HALT,
+    CMD_PANIC,
+};
+
+static uint64_t virt_ctrl_read(void *opaque, hwaddr addr, unsigned size)
+{
+    VirtCtrlState *s = opaque;
+    uint64_t value = 0;
+
+    switch (addr) {
+    case REG_FEATURES:
+        value = FEAT_POWER_CTRL;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: unimplemented register read 0x%02"HWADDR_PRIx"\n",
+                      __func__, addr);
+        break;
+    }
+
+    trace_virt_ctrl_write(s, addr, size, value);
+
+    return value;
+}
+
+static void virt_ctrl_write(void *opaque, hwaddr addr, uint64_t value,
+                            unsigned size)
+{
+    VirtCtrlState *s = opaque;
+
+    trace_virt_ctrl_write(s, addr, size, value);
+
+    switch (addr) {
+    case REG_CMD:
+        switch (value) {
+        case CMD_NOOP:
+            break;
+        case CMD_RESET:
+            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+            break;
+        case CMD_HALT:
+            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+            break;
+        case CMD_PANIC:
+            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_PANIC);
+            break;
+        }
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: unimplemented register write 0x%02"HWADDR_PRIx"\n",
+                      __func__, addr);
+        break;
+    }
+}
+
+static const MemoryRegionOps virt_ctrl_ops = {
+    .read = virt_ctrl_read,
+    .write = virt_ctrl_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid.max_access_size = 4,
+    .impl.max_access_size = 4,
+};
+
+static void virt_ctrl_reset(DeviceState *dev)
+{
+    VirtCtrlState *s = VIRT_CTRL(dev);
+
+    trace_virt_ctrl_reset(s);
+}
+
+static void virt_ctrl_realize(DeviceState *dev, Error **errp)
+{
+    VirtCtrlState *s = VIRT_CTRL(dev);
+
+    trace_virt_ctrl_instance_init(s);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &virt_ctrl_ops, s,
+                          "virt-ctrl", 0x100);
+}
+
+static const VMStateDescription vmstate_virt_ctrl = {
+    .name = "virt-ctrl",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(irq_enabled, VirtCtrlState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void virt_ctrl_instance_init(Object *obj)
+{
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
+    VirtCtrlState *s = VIRT_CTRL(obj);
+
+    trace_virt_ctrl_instance_init(s);
+
+    sysbus_init_mmio(dev, &s->iomem);
+    sysbus_init_irq(dev, &s->irq);
+}
+
+static void virt_ctrl_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->reset = virt_ctrl_reset;
+    dc->realize = virt_ctrl_realize;
+    dc->vmsd = &vmstate_virt_ctrl;
+}
+
+static const TypeInfo virt_ctrl_info = {
+    .name = TYPE_VIRT_CTRL,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .class_init = virt_ctrl_class_init,
+    .instance_init = virt_ctrl_instance_init,
+    .instance_size = sizeof(VirtCtrlState),
+};
+
+static void virt_ctrl_register_types(void)
+{
+    type_register_static(&virt_ctrl_info);
+}
+
+type_init(virt_ctrl_register_types)
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 5426b9b1a1ad..c71ed2582046 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -183,4 +183,7 @@ config SIFIVE_U_OTP
 config SIFIVE_U_PRCI
     bool
 
+config VIRT_CTRL
+    bool
+
 source macio/Kconfig
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 7a2b0d031a78..21034dc60a81 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -24,6 +24,9 @@ softmmu_ss.add(when: 'CONFIG_ARM11SCU', if_true: files('arm11scu.c'))
 # Mac devices
 softmmu_ss.add(when: 'CONFIG_MOS6522', if_true: files('mos6522.c'))
 
+# virt devices
+softmmu_ss.add(when: 'CONFIG_VIRT_CTRL', if_true: files('virt_ctrl.c'))
+
 # RISC-V devices
 softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_DMC', if_true: files('mchp_pfsoc_dmc.c'))
 softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_IOSCB', if_true: files('mchp_pfsoc_ioscb.c'))
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index b87d0b4c906a..3d44978cca36 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -255,3 +255,10 @@ pca955x_gpio_change(const char *description, unsigned id, unsigned prev_state, u
 bcm2835_cprman_read(uint64_t offset, uint64_t value) "offset:0x%" PRIx64 " value:0x%" PRIx64
 bcm2835_cprman_write(uint64_t offset, uint64_t value) "offset:0x%" PRIx64 " value:0x%" PRIx64
 bcm2835_cprman_write_invalid_magic(uint64_t offset, uint64_t value) "offset:0x%" PRIx64 " value:0x%" PRIx64
+
+# virt_ctrl.c
+virt_ctrl_read(void *dev, unsigned int addr, unsigned int size, uint64_t value) "ctrl: %p reg: 0x%02x size: %d value: 0x%"PRIx64
+virt_ctrl_write(void *dev, unsigned int addr, unsigned int size, uint64_t value) "ctrl: %p reg: 0x%02x size: %d value: 0x%"PRIx64
+virt_ctrl_reset(void *dev) "ctrl: %p"
+virt_ctrl_realize(void *dev) "ctrl: %p"
+virt_ctrl_instance_init(void *dev) "ctrl: %p"
-- 
2.29.2


