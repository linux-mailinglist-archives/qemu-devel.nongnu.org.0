Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 544794C398
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 00:26:24 +0200 (CEST)
Received: from localhost ([::1]:42332 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdj27-0006Iu-Ht
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 18:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36036)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <laurent@vivier.eu>) id 1hdiwt-0001iF-Ae
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 18:21:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1hdiwr-0007mT-03
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 18:20:59 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:32981)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1hdiwm-0007eW-6t; Wed, 19 Jun 2019 18:20:52 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MHXSD-1hr94x30oj-00DX8f; Thu, 20 Jun 2019 00:19:59 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Thu, 20 Jun 2019 00:19:30 +0200
Message-Id: <20190619221933.1981-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190619221933.1981-1-laurent@vivier.eu>
References: <20190619221933.1981-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Vw6GI+FmeIlaBPN8TD5i1Q0v/9m5mPNA8g+tO6Op5R4oF1tvM1N
 55waqZKwPYOsaIATogMAyIivwnKoj0qqOQKIo5NKorY1lhfRv8GOMfkzG43LFianXyQ8W1q
 zP2Je6AF8XXiKfcZnv6j9JXvZ2n0DbOtVMsmaACkYcwMzgXgYJRvx20u7YNWl27OYWP2acg
 gHIqQNI4Trm+yOcmzCgFw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3vnKdxv6NC0=:HvtCTNSLnRUGxgUmIJwKXZ
 AOn37pEEX34pW7tNA0fmMJ2CyvbxjoPxWwQiOPGctJMiJZcJ0+4QXa0cac44JfNZ7QYxRHSnq
 DyyMV4WzmjLpFAX2+q7Yhc04hOUtsaRTb5KJ8QhqqXDxOxF6lnqXniuYTm7Wsb4E/TGReoEEg
 FAqjgLe4hidNtFmhDpIhu8aN/g2YMChbTh9Xu/qaxkNWUlRvr/3ju2z3TIqai+hjtHo9Udffs
 EIezQ3MW3rhwrCmRCSfSA7EXBYrakIZ0nfBe/qWMFdeCtxlg6mAv3Bh4rVrATWz235GvgUuHC
 lEcEe7Qq/gyuRP4nnaING4+krPhr3HPnFaXVuB5mrdMP9m9Zwu4SI3b5XBn3HTwUxEdYNhmjK
 XJ+8S4gYD9BSXtl1//vbdlf8xlTz6umElnfkx/h7rSIx4xLSE5Rgss8KQaJBUHMur6Xev1wol
 e4MN4Lx4d7csCEmi9taEuKJ6MsZFpuA+rlGGGYlNlIQbV7jShfqgVSecpNuLhar63cJB0ATX+
 jOg9bjaui86kE284hFRlpSR0DtvX+qChTFkq7gfL3fZAEEFRP2YA+i5NjwiYHbwSCQQEDQnig
 dU9ROloUG6IdaHDq17Rky+UMeupY/BFZfmj2jX8UWLMR6Vl5rthKqMiRWkNxesYoTEqRIgxZi
 WlZjeO2xPaU8ANZr9ZZHMyOyfCXLoCrc5yJW313U+pDJpentMieBLCL5uJDsxM8xKsIfdq3gr
 vsrEKTksN0rgXO2Udt4v8c3os5VzH3L0trT8LQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-devel] [PATCH v8 07/10] hw/m68k: add Nubus support
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Thomas Huth <huth@tuxfamily.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Co-developed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
---
 hw/Kconfig                          |   1 +
 hw/Makefile.objs                    |   1 +
 hw/nubus/Kconfig                    |   2 +
 hw/nubus/Makefile.objs              |   4 +
 hw/nubus/mac-nubus-bridge.c         |  45 ++++++
 hw/nubus/nubus-bridge.c             |  34 +++++
 hw/nubus/nubus-bus.c                | 111 ++++++++++++++
 hw/nubus/nubus-device.c             | 215 ++++++++++++++++++++++++++++
 include/hw/nubus/mac-nubus-bridge.h |  24 ++++
 include/hw/nubus/nubus.h            |  69 +++++++++
 10 files changed, 506 insertions(+)
 create mode 100644 hw/nubus/Kconfig
 create mode 100644 hw/nubus/Makefile.objs
 create mode 100644 hw/nubus/mac-nubus-bridge.c
 create mode 100644 hw/nubus/nubus-bridge.c
 create mode 100644 hw/nubus/nubus-bus.c
 create mode 100644 hw/nubus/nubus-device.c
 create mode 100644 include/hw/nubus/mac-nubus-bridge.h
 create mode 100644 include/hw/nubus/nubus.h

diff --git a/hw/Kconfig b/hw/Kconfig
index 195f541e50..c34e0aa99a 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -21,6 +21,7 @@ source isa/Kconfig
 source mem/Kconfig
 source misc/Kconfig
 source net/Kconfig
+source nubus/Kconfig
 source nvram/Kconfig
 source pci-bridge/Kconfig
 source pci-host/Kconfig
diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index d770926ba9..686808dd17 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -36,6 +36,7 @@ devices-dirs-$(CONFIG_SOFTMMU) += watchdog/
 devices-dirs-$(CONFIG_SOFTMMU) += xen/
 devices-dirs-$(CONFIG_MEM_DEVICE) += mem/
 devices-dirs-$(CONFIG_SOFTMMU) += smbios/
+devices-dirs-$(CONFIG_NUBUS) += nubus/
 devices-dirs-y += semihosting/
 devices-dirs-y += core/
 common-obj-y += $(devices-dirs-y)
diff --git a/hw/nubus/Kconfig b/hw/nubus/Kconfig
new file mode 100644
index 0000000000..8fb8b22189
--- /dev/null
+++ b/hw/nubus/Kconfig
@@ -0,0 +1,2 @@
+config NUBUS
+    bool
diff --git a/hw/nubus/Makefile.objs b/hw/nubus/Makefile.objs
new file mode 100644
index 0000000000..135ba7878d
--- /dev/null
+++ b/hw/nubus/Makefile.objs
@@ -0,0 +1,4 @@
+common-obj-y += nubus-device.o
+common-obj-y += nubus-bus.o
+common-obj-y += nubus-bridge.o
+common-obj-$(CONFIG_Q800) += mac-nubus-bridge.o
diff --git a/hw/nubus/mac-nubus-bridge.c b/hw/nubus/mac-nubus-bridge.c
new file mode 100644
index 0000000000..7c329300b8
--- /dev/null
+++ b/hw/nubus/mac-nubus-bridge.c
@@ -0,0 +1,45 @@
+/*
+ *  Copyright (c) 2013-2018 Laurent Vivier <laurent@vivier.eu>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/nubus/mac-nubus-bridge.h"
+
+
+static void mac_nubus_bridge_init(Object *obj)
+{
+    MacNubusState *s = MAC_NUBUS_BRIDGE(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+
+    s->bus = NUBUS_BUS(qbus_create(TYPE_NUBUS_BUS, DEVICE(s), NULL));
+
+    sysbus_init_mmio(sbd, &s->bus->super_slot_io);
+    sysbus_init_mmio(sbd, &s->bus->slot_io);
+}
+
+static void mac_nubus_bridge_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "Nubus bridge";
+}
+
+static const TypeInfo mac_nubus_bridge_info = {
+    .name          = TYPE_MAC_NUBUS_BRIDGE,
+    .parent        = TYPE_NUBUS_BRIDGE,
+    .instance_init = mac_nubus_bridge_init,
+    .instance_size = sizeof(MacNubusState),
+    .class_init    = mac_nubus_bridge_class_init,
+};
+
+static void mac_nubus_bridge_register_types(void)
+{
+    type_register_static(&mac_nubus_bridge_info);
+}
+
+type_init(mac_nubus_bridge_register_types)
diff --git a/hw/nubus/nubus-bridge.c b/hw/nubus/nubus-bridge.c
new file mode 100644
index 0000000000..cd8c6a91eb
--- /dev/null
+++ b/hw/nubus/nubus-bridge.c
@@ -0,0 +1,34 @@
+/*
+ * QEMU Macintosh Nubus
+ *
+ * Copyright (c) 2013-2018 Laurent Vivier <laurent@vivier.eu>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/nubus/nubus.h"
+
+static void nubus_bridge_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->fw_name = "nubus";
+}
+
+static const TypeInfo nubus_bridge_info = {
+    .name          = TYPE_NUBUS_BRIDGE,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(SysBusDevice),
+    .class_init    = nubus_bridge_class_init,
+};
+
+static void nubus_register_types(void)
+{
+    type_register_static(&nubus_bridge_info);
+}
+
+type_init(nubus_register_types)
diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
new file mode 100644
index 0000000000..942a6d5342
--- /dev/null
+++ b/hw/nubus/nubus-bus.c
@@ -0,0 +1,111 @@
+/*
+ * QEMU Macintosh Nubus
+ *
+ * Copyright (c) 2013-2018 Laurent Vivier <laurent@vivier.eu>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "hw/nubus/nubus.h"
+#include "hw/sysbus.h"
+#include "qapi/error.h"
+
+
+static NubusBus *nubus_find(void)
+{
+    /* Returns NULL unless there is exactly one nubus device */
+    return NUBUS_BUS(object_resolve_path_type("", TYPE_NUBUS_BUS, NULL));
+}
+
+static void nubus_slot_write(void *opaque, hwaddr addr, uint64_t val,
+                             unsigned int size)
+{
+    /* read only */
+}
+
+
+static uint64_t nubus_slot_read(void *opaque, hwaddr addr,
+                                unsigned int size)
+{
+    return 0;
+}
+
+static const MemoryRegionOps nubus_slot_ops = {
+    .read  = nubus_slot_read,
+    .write = nubus_slot_write,
+    .endianness = DEVICE_BIG_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 1,
+    },
+};
+
+static void nubus_super_slot_write(void *opaque, hwaddr addr, uint64_t val,
+                                   unsigned int size)
+{
+    /* read only */
+}
+
+static uint64_t nubus_super_slot_read(void *opaque, hwaddr addr,
+                                      unsigned int size)
+{
+    return 0;
+}
+
+static const MemoryRegionOps nubus_super_slot_ops = {
+    .read  = nubus_super_slot_read,
+    .write = nubus_super_slot_write,
+    .endianness = DEVICE_BIG_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 1,
+    },
+};
+
+static void nubus_realize(BusState *bus, Error **errp)
+{
+    if (!nubus_find()) {
+        error_setg(errp, "at most one %s device is permitted", TYPE_NUBUS_BUS);
+        return;
+    }
+}
+
+static void nubus_init(Object *obj)
+{
+    NubusBus *nubus = NUBUS_BUS(obj);
+
+    memory_region_init_io(&nubus->super_slot_io, obj, &nubus_super_slot_ops,
+                          nubus, "nubus-super-slots",
+                          NUBUS_SUPER_SLOT_NB * NUBUS_SUPER_SLOT_SIZE);
+
+    memory_region_init_io(&nubus->slot_io, obj, &nubus_slot_ops,
+                          nubus, "nubus-slots",
+                          NUBUS_SLOT_NB * NUBUS_SLOT_SIZE);
+
+    nubus->current_slot = NUBUS_FIRST_SLOT;
+}
+
+static void nubus_class_init(ObjectClass *oc, void *data)
+{
+    BusClass *bc = BUS_CLASS(oc);
+
+    bc->realize = nubus_realize;
+}
+
+static const TypeInfo nubus_bus_info = {
+    .name = TYPE_NUBUS_BUS,
+    .parent = TYPE_BUS,
+    .instance_size = sizeof(NubusBus),
+    .instance_init = nubus_init,
+    .class_init = nubus_class_init,
+};
+
+static void nubus_register_types(void)
+{
+    type_register_static(&nubus_bus_info);
+}
+
+type_init(nubus_register_types)
diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
new file mode 100644
index 0000000000..01ccad9e8e
--- /dev/null
+++ b/hw/nubus/nubus-device.c
@@ -0,0 +1,215 @@
+/*
+ * QEMU Macintosh Nubus
+ *
+ * Copyright (c) 2013-2018 Laurent Vivier <laurent@vivier.eu>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "hw/nubus/nubus.h"
+#include "qapi/error.h"
+
+
+/* The Format Block Structure */
+
+#define FBLOCK_DIRECTORY_OFFSET 0
+#define FBLOCK_LENGTH           4
+#define FBLOCK_CRC              8
+#define FBLOCK_REVISION_LEVEL   12
+#define FBLOCK_FORMAT           13
+#define FBLOCK_TEST_PATTERN     14
+#define FBLOCK_RESERVED         18
+#define FBLOCK_BYTE_LANES       19
+
+#define FBLOCK_SIZE             20
+#define FBLOCK_PATTERN_VAL      0x5a932bc7
+
+static uint64_t nubus_fblock_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    NubusDevice *dev = opaque;
+    uint64_t val;
+
+#define BYTE(v, b) (((v) >> (24 - 8 * (b))) & 0xff)
+    switch (addr) {
+    case FBLOCK_BYTE_LANES:
+        val = dev->byte_lanes;
+        val |= (val ^ 0xf) << 4;
+        break;
+    case FBLOCK_RESERVED:
+        val = 0x00;
+        break;
+    case FBLOCK_TEST_PATTERN...FBLOCK_TEST_PATTERN + 3:
+        val = BYTE(FBLOCK_PATTERN_VAL, addr - FBLOCK_TEST_PATTERN);
+        break;
+    case FBLOCK_FORMAT:
+        val = dev->rom_format;
+        break;
+    case FBLOCK_REVISION_LEVEL:
+        val = dev->rom_rev;
+        break;
+    case FBLOCK_CRC...FBLOCK_CRC + 3:
+        val = BYTE(dev->rom_crc, addr - FBLOCK_CRC);
+        break;
+    case FBLOCK_LENGTH...FBLOCK_LENGTH + 3:
+        val = BYTE(dev->rom_length, addr - FBLOCK_LENGTH);
+        break;
+    case FBLOCK_DIRECTORY_OFFSET...FBLOCK_DIRECTORY_OFFSET + 3:
+        val = BYTE(dev->directory_offset, addr - FBLOCK_DIRECTORY_OFFSET);
+        break;
+    default:
+        val = 0;
+        break;
+    }
+    return val;
+}
+
+static void nubus_fblock_write(void *opaque, hwaddr addr, uint64_t val,
+                               unsigned int size)
+{
+    /* read only */
+}
+
+static const MemoryRegionOps nubus_format_block_ops = {
+    .read = nubus_fblock_read,
+    .write = nubus_fblock_write,
+    .endianness = DEVICE_BIG_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 1,
+    }
+};
+
+static void nubus_register_format_block(NubusDevice *dev)
+{
+    char *fblock_name;
+
+    fblock_name = g_strdup_printf("nubus-slot-%d-format-block",
+                                  dev->slot_nb);
+
+    hwaddr fblock_offset = memory_region_size(&dev->slot_mem) - FBLOCK_SIZE;
+    memory_region_init_io(&dev->fblock_io, NULL, &nubus_format_block_ops,
+                          dev, fblock_name, FBLOCK_SIZE);
+    memory_region_add_subregion(&dev->slot_mem, fblock_offset,
+                                &dev->fblock_io);
+
+    g_free(fblock_name);
+}
+
+static void mac_nubus_rom_write(void *opaque, hwaddr addr, uint64_t val,
+                                       unsigned int size)
+{
+    /* read only */
+}
+
+static uint64_t mac_nubus_rom_read(void *opaque, hwaddr addr,
+                                    unsigned int size)
+{
+    NubusDevice *dev = opaque;
+
+    return dev->rom[addr];
+}
+
+static const MemoryRegionOps mac_nubus_rom_ops = {
+    .read  = mac_nubus_rom_read,
+    .write = mac_nubus_rom_write,
+    .endianness = DEVICE_BIG_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 1,
+    },
+};
+
+
+void nubus_register_rom(NubusDevice *dev, const uint8_t *rom, uint32_t size,
+                        int revision, int format, uint8_t byte_lanes)
+{
+    hwaddr rom_offset;
+    char *rom_name;
+
+    /* FIXME : really compute CRC */
+    dev->rom_length = 0;
+    dev->rom_crc = 0;
+
+    dev->rom_rev = revision;
+    dev->rom_format = format;
+
+    dev->byte_lanes = byte_lanes;
+    dev->directory_offset = -size;
+
+    /* ROM */
+
+    dev->rom = rom;
+    rom_name = g_strdup_printf("nubus-slot-%d-rom", dev->slot_nb);
+    memory_region_init_io(&dev->rom_io, NULL, &mac_nubus_rom_ops,
+                          dev, rom_name, size);
+    memory_region_set_readonly(&dev->rom_io, true);
+
+    rom_offset = memory_region_size(&dev->slot_mem) - FBLOCK_SIZE +
+                 dev->directory_offset;
+    memory_region_add_subregion(&dev->slot_mem, rom_offset, &dev->rom_io);
+
+    g_free(rom_name);
+}
+
+static void nubus_device_realize(DeviceState *dev, Error **errp)
+{
+    NubusBus *nubus = NUBUS_BUS(qdev_get_parent_bus(DEVICE(dev)));
+    NubusDevice *nd = NUBUS_DEVICE(dev);
+    char *name;
+    hwaddr slot_offset;
+
+    if (nubus->current_slot < NUBUS_FIRST_SLOT ||
+            nubus->current_slot > NUBUS_LAST_SLOT) {
+        error_setg(errp, "Cannot register nubus card, not enough slots");
+        return;
+    }
+
+    nd->slot_nb = nubus->current_slot++;
+    name = g_strdup_printf("nubus-slot-%d", nd->slot_nb);
+
+    if (nd->slot_nb < NUBUS_FIRST_SLOT) {
+        /* Super */
+        slot_offset = (nd->slot_nb - 6) * NUBUS_SUPER_SLOT_SIZE;
+
+        memory_region_init(&nd->slot_mem, OBJECT(dev), name,
+                           NUBUS_SUPER_SLOT_SIZE);
+        memory_region_add_subregion(&nubus->super_slot_io, slot_offset,
+                                    &nd->slot_mem);
+    } else {
+        /* Normal */
+        slot_offset = nd->slot_nb * NUBUS_SLOT_SIZE;
+
+        memory_region_init(&nd->slot_mem, OBJECT(dev), name, NUBUS_SLOT_SIZE);
+        memory_region_add_subregion(&nubus->slot_io, slot_offset,
+                                    &nd->slot_mem);
+    }
+
+    g_free(name);
+    nubus_register_format_block(nd);
+}
+
+static void nubus_device_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = nubus_device_realize;
+    dc->bus_type = TYPE_NUBUS_BUS;
+}
+
+static const TypeInfo nubus_device_type_info = {
+    .name = TYPE_NUBUS_DEVICE,
+    .parent = TYPE_DEVICE,
+    .abstract = true,
+    .instance_size = sizeof(NubusDevice),
+    .class_init = nubus_device_class_init,
+};
+
+static void nubus_register_types(void)
+{
+    type_register_static(&nubus_device_type_info);
+}
+
+type_init(nubus_register_types)
diff --git a/include/hw/nubus/mac-nubus-bridge.h b/include/hw/nubus/mac-nubus-bridge.h
new file mode 100644
index 0000000000..ce9c789d99
--- /dev/null
+++ b/include/hw/nubus/mac-nubus-bridge.h
@@ -0,0 +1,24 @@
+/*
+ * Copyright (c) 2013-2018 Laurent Vivier <laurent@vivier.eu>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef HW_NUBUS_MAC_H
+#define HW_NUBUS_MAC_H
+
+#include "hw/nubus/nubus.h"
+
+#define TYPE_MAC_NUBUS_BRIDGE "mac-nubus-bridge"
+#define MAC_NUBUS_BRIDGE(obj) OBJECT_CHECK(MacNubusState, (obj), \
+                                           TYPE_MAC_NUBUS_BRIDGE)
+
+typedef struct MacNubusState {
+    SysBusDevice sysbus_dev;
+
+    NubusBus *bus;
+} MacNubusState;
+
+#endif
diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
new file mode 100644
index 0000000000..096bafb322
--- /dev/null
+++ b/include/hw/nubus/nubus.h
@@ -0,0 +1,69 @@
+/*
+ * Copyright (c) 2013-2018 Laurent Vivier <laurent@vivier.eu>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef HW_NUBUS_NUBUS_H
+#define HW_NUBUS_NUBUS_H
+
+#include "hw/qdev.h"
+#include "exec/address-spaces.h"
+
+#define NUBUS_SUPER_SLOT_SIZE 0x10000000U
+#define NUBUS_SUPER_SLOT_NB   0x9
+
+#define NUBUS_SLOT_SIZE       0x01000000
+#define NUBUS_SLOT_NB         0xF
+
+#define NUBUS_FIRST_SLOT      0x9
+#define NUBUS_LAST_SLOT       0xF
+
+#define TYPE_NUBUS_DEVICE "nubus-device"
+#define NUBUS_DEVICE(obj) \
+     OBJECT_CHECK(NubusDevice, (obj), TYPE_NUBUS_DEVICE)
+
+#define TYPE_NUBUS_BUS "nubus-bus"
+#define NUBUS_BUS(obj) OBJECT_CHECK(NubusBus, (obj), TYPE_NUBUS_BUS)
+
+#define TYPE_NUBUS_BRIDGE "nubus-bridge"
+#define NUBUS_BRIDGE(obj) OBJECT_CHECK(NubusBridge, (obj), TYPE_NUBUS_BRIDGE)
+
+typedef struct NubusBus {
+    BusState qbus;
+
+    MemoryRegion super_slot_io;
+    MemoryRegion slot_io;
+
+    int current_slot;
+} NubusBus;
+
+typedef struct NubusDevice {
+    DeviceState qdev;
+
+    int slot_nb;
+    MemoryRegion slot_mem;
+
+    /* Format Block */
+
+    MemoryRegion fblock_io;
+
+    uint32_t rom_length;
+    uint32_t rom_crc;
+    uint8_t rom_rev;
+    uint8_t rom_format;
+    uint8_t byte_lanes;
+    int32_t directory_offset;
+
+    /* ROM */
+
+    MemoryRegion rom_io;
+    const uint8_t *rom;
+} NubusDevice;
+
+void nubus_register_rom(NubusDevice *dev, const uint8_t *rom, uint32_t size,
+                        int revision, int format, uint8_t byte_lanes);
+
+#endif
-- 
2.21.0


