Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D661A2A750
	for <lists+qemu-devel@lfdr.de>; Sun, 26 May 2019 01:09:30 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47387 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hUfn7-0007dE-UL
	for lists+qemu-devel@lfdr.de; Sat, 25 May 2019 19:09:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hUfku-0006Ih-0G
	for qemu-devel@nongnu.org; Sat, 25 May 2019 19:07:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hUfVM-0002py-M6
	for qemu-devel@nongnu.org; Sat, 25 May 2019 18:51:11 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:55463)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hUfVD-0002Wn-L2; Sat, 25 May 2019 18:51:00 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MeC5x-1gwhag2uFL-00bOdc; Sun, 26 May 2019 00:50:34 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Sun, 26 May 2019 00:50:12 +0200
Message-Id: <20190525225013.13916-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525225013.13916-1-laurent@vivier.eu>
References: <20190525225013.13916-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tLlZfNsd0ZxDYs7xsWvCEoIOX9IiJ1kEZl15ESO+WCtFdHn+UGN
	vTpg4qFX26qp0zpMKpPtXStpmWBBhyOaXZvWsNg3Csp8sfZGy4QsUEWNO9HQ4GbxD44h41n
	iP2jmNnM+Qgi/UudUKdeDzPNIhf7GtmF6P6bdQa1Lsxx8JSxzHa+inL1eMm8EHRd1HFgLEt
	5HMOEI9iYOXvMEVVPYezg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Vfu/v7p967I=:kbtg3x0GzNeQy+t61XmS8K
	0xv+T6CNM7YG0nTmtX7v8b6B22Nmk7TIW8Pg07qWhYIyvNbM4sLGYQOQHV0JmS5f+7kUJg84Z
	IeobZcG9s/HZiPEAeHY73c+EmRBogjbB+Tptdsv4I0C6GR/ou5R6Q9+kMTaEsmrif3aDH72E9
	Uow8k5EV9IU9W9mvO4g63HTx6zRJJ6y8YWkJKRd2agEEmB4XrwvcQvBtN08cPxDQrBWf6McjW
	mXJQN7MPuO5mZg6gzfcIv3fJW9vYcKxOXj9QW5bIoXHnBmyfFU+rTFPUHVP+PqMTdGqb/6w0w
	5zoutCi7Un/4mqRXsG+Iri1J3xoEbXC6wMwvuZG2zflW2MOq6xC07t3zB35z0vRfc0ja+NPBu
	OR3CuwEYCh+ip9U3Ktig688hbJxXXCQqw/T+RwW0VRobFyVAZJMrdWbfdKrl2z7Eh9+x0sI95
	029pIbn+zc2wlrRaunvxlzOJHs8y0L5MzBhrI4gmJamCQhxuIqh1nvWwwUoi/HyoaBvQSCfJA
	+fwTsmzTpS6P1jPYeJRsOBn23NY6VTVnHJr9PVxzWZV8mr67OoA8inEUBDo9et4LEEn6DyS2j
	qc7UmLRtndPKYqrj5ApkRH0cC216hAGOEhTFgZElSUNMEwkPf6B7HHGI9dzfP/fbOENU8AKce
	SquOW87Q8gN5EuccmoYpAigkncgGyd2GWHP6kQTbT9nTP3UFNqc7jUJ/3rAlOhC/MZ6dn05Jt
	CM8dK7FsJ/g4nwMq5ITZGSFJvUho7bLKy5XDvLwFKrhXnxH8nqKr49wrmBo=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: [Qemu-devel] [PATCH v7 09/10] hw/m68k: add a dummy SWIM floppy
 controller
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-block@nongnu.org, Thomas Huth <huth@tuxfamily.org>,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Co-developed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>
---
 hw/block/Kconfig        |   3 +
 hw/block/Makefile.objs  |   1 +
 hw/block/swim.c         | 415 ++++++++++++++++++++++++++++++++++++++++
 include/hw/block/swim.h |  76 ++++++++
 4 files changed, 495 insertions(+)
 create mode 100644 hw/block/swim.c
 create mode 100644 include/hw/block/swim.h

diff --git a/hw/block/Kconfig b/hw/block/Kconfig
index df96dc5dcc..2d17f481ad 100644
--- a/hw/block/Kconfig
+++ b/hw/block/Kconfig
@@ -37,3 +37,6 @@ config VHOST_USER_BLK
     # Only PCI devices are provided for now
     default y if VIRTIO_PCI
     depends on VIRTIO && VHOST_USER && LINUX
+
+config SWIM
+    bool
diff --git a/hw/block/Makefile.objs b/hw/block/Makefile.objs
index f5f643f0cc..28c2495a00 100644
--- a/hw/block/Makefile.objs
+++ b/hw/block/Makefile.objs
@@ -8,6 +8,7 @@ common-obj-$(CONFIG_XEN) += xen-block.o
 common-obj-$(CONFIG_ECC) += ecc.o
 common-obj-$(CONFIG_ONENAND) += onenand.o
 common-obj-$(CONFIG_NVME_PCI) += nvme.o
+common-obj-$(CONFIG_SWIM) += swim.o
 
 obj-$(CONFIG_SH4) += tc58128.o
 
diff --git a/hw/block/swim.c b/hw/block/swim.c
new file mode 100644
index 0000000000..48ce6c7235
--- /dev/null
+++ b/hw/block/swim.c
@@ -0,0 +1,415 @@
+/*
+ * QEMU Macintosh floppy disk controller emulator (SWIM)
+ *
+ * Copyright (c) 2014-2018 Laurent Vivier <laurent@vivier.eu>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "sysemu/block-backend.h"
+#include "hw/sysbus.h"
+#include "hw/block/block.h"
+#include "hw/block/swim.h"
+
+/* IWM registers */
+
+#define IWM_PH0L                0
+#define IWM_PH0H                1
+#define IWM_PH1L                2
+#define IWM_PH1H                3
+#define IWM_PH2L                4
+#define IWM_PH2H                5
+#define IWM_PH3L                6
+#define IWM_PH3H                7
+#define IWM_MTROFF              8
+#define IWM_MTRON               9
+#define IWM_INTDRIVE            10
+#define IWM_EXTDRIVE            11
+#define IWM_Q6L                 12
+#define IWM_Q6H                 13
+#define IWM_Q7L                 14
+#define IWM_Q7H                 15
+
+/* SWIM registers */
+
+#define SWIM_WRITE_DATA         0
+#define SWIM_WRITE_MARK         1
+#define SWIM_WRITE_CRC          2
+#define SWIM_WRITE_PARAMETER    3
+#define SWIM_WRITE_PHASE        4
+#define SWIM_WRITE_SETUP        5
+#define SWIM_WRITE_MODE0        6
+#define SWIM_WRITE_MODE1        7
+
+#define SWIM_READ_DATA          8
+#define SWIM_READ_MARK          9
+#define SWIM_READ_ERROR         10
+#define SWIM_READ_PARAMETER     11
+#define SWIM_READ_PHASE         12
+#define SWIM_READ_SETUP         13
+#define SWIM_READ_STATUS        14
+#define SWIM_READ_HANDSHAKE     15
+
+#define REG_SHIFT               9
+
+#define SWIM_MODE_IWM  0
+#define SWIM_MODE_SWIM 1
+
+/* bits in phase register */
+
+#define SWIM_SEEK_NEGATIVE   0x074
+#define SWIM_STEP            0x071
+#define SWIM_MOTOR_ON        0x072
+#define SWIM_MOTOR_OFF       0x076
+#define SWIM_INDEX           0x073
+#define SWIM_EJECT           0x077
+#define SWIM_SETMFM          0x171
+#define SWIM_SETGCR          0x175
+#define SWIM_RELAX           0x033
+#define SWIM_LSTRB           0x008
+#define SWIM_CA_MASK         0x077
+
+/* Select values for swim_select and swim_readbit */
+
+#define SWIM_READ_DATA_0     0x074
+#define SWIM_TWOMEG_DRIVE    0x075
+#define SWIM_SINGLE_SIDED    0x076
+#define SWIM_DRIVE_PRESENT   0x077
+#define SWIM_DISK_IN         0x170
+#define SWIM_WRITE_PROT      0x171
+#define SWIM_TRACK_ZERO      0x172
+#define SWIM_TACHO           0x173
+#define SWIM_READ_DATA_1     0x174
+#define SWIM_MFM_MODE        0x175
+#define SWIM_SEEK_COMPLETE   0x176
+#define SWIM_ONEMEG_MEDIA    0x177
+
+/* Bits in handshake register */
+
+#define SWIM_MARK_BYTE       0x01
+#define SWIM_CRC_ZERO        0x02
+#define SWIM_RDDATA          0x04
+#define SWIM_SENSE           0x08
+#define SWIM_MOTEN           0x10
+#define SWIM_ERROR           0x20
+#define SWIM_DAT2BYTE        0x40
+#define SWIM_DAT1BYTE        0x80
+
+/* bits in setup register */
+
+#define SWIM_S_INV_WDATA     0x01
+#define SWIM_S_3_5_SELECT    0x02
+#define SWIM_S_GCR           0x04
+#define SWIM_S_FCLK_DIV2     0x08
+#define SWIM_S_ERROR_CORR    0x10
+#define SWIM_S_IBM_DRIVE     0x20
+#define SWIM_S_GCR_WRITE     0x40
+#define SWIM_S_TIMEOUT       0x80
+
+/* bits in mode register */
+
+#define SWIM_CLFIFO          0x01
+#define SWIM_ENBL1           0x02
+#define SWIM_ENBL2           0x04
+#define SWIM_ACTION          0x08
+#define SWIM_WRITE_MODE      0x10
+#define SWIM_HEDSEL          0x20
+#define SWIM_MOTON           0x80
+
+static void swim_change_cb(void *opaque, bool load, Error **errp)
+{
+    FDrive *drive = opaque;
+
+    if (!load) {
+        blk_set_perm(drive->blk, 0, BLK_PERM_ALL, &error_abort);
+    } else {
+        if (!blkconf_apply_backend_options(drive->conf,
+                                           blk_is_read_only(drive->blk), false,
+                                           errp)) {
+            return;
+        }
+    }
+}
+
+static const BlockDevOps swim_block_ops = {
+    .change_media_cb = swim_change_cb,
+};
+
+static Property swim_drive_properties[] = {
+    DEFINE_PROP_INT32("unit", SWIMDrive, unit, -1),
+    DEFINE_BLOCK_PROPERTIES(SWIMDrive, conf),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void swim_drive_realize(DeviceState *qdev, Error **errp)
+{
+    SWIMDrive *dev = SWIM_DRIVE(qdev);
+    SWIMBus *bus = SWIM_BUS(qdev->parent_bus);
+    FDrive *drive;
+    int ret;
+
+    if (dev->unit == -1) {
+        for (dev->unit = 0; dev->unit < SWIM_MAX_FD; dev->unit++) {
+            drive = &bus->ctrl->drives[dev->unit];
+            if (!drive->blk) {
+                break;
+            }
+        }
+    }
+
+    if (dev->unit >= SWIM_MAX_FD) {
+        error_setg(errp, "Can't create floppy unit %d, bus supports "
+                   "only %d units", dev->unit, SWIM_MAX_FD);
+        return;
+    }
+
+    drive = &bus->ctrl->drives[dev->unit];
+    if (drive->blk) {
+        error_setg(errp, "Floppy unit %d is in use", dev->unit);
+        return;
+    }
+
+    if (!dev->conf.blk) {
+        /* Anonymous BlockBackend for an empty drive */
+        dev->conf.blk = blk_new(0, BLK_PERM_ALL);
+        ret = blk_attach_dev(dev->conf.blk, qdev);
+        assert(ret == 0);
+    }
+
+    blkconf_blocksizes(&dev->conf);
+    if (dev->conf.logical_block_size != 512 ||
+        dev->conf.physical_block_size != 512)
+    {
+        error_setg(errp, "Physical and logical block size must "
+                   "be 512 for floppy");
+        return;
+    }
+
+    /* rerror/werror aren't supported by fdc and therefore not even registered
+     * with qdev. So set the defaults manually before they are used in
+     * blkconf_apply_backend_options(). */
+    dev->conf.rerror = BLOCKDEV_ON_ERROR_AUTO;
+    dev->conf.werror = BLOCKDEV_ON_ERROR_AUTO;
+
+    if (!blkconf_apply_backend_options(&dev->conf,
+                                       blk_is_read_only(dev->conf.blk),
+                                       false, errp)) {
+        return;
+    }
+
+    /* 'enospc' is the default for -drive, 'report' is what blk_new() gives us
+     * for empty drives. */
+    if (blk_get_on_error(dev->conf.blk, 0) != BLOCKDEV_ON_ERROR_ENOSPC &&
+        blk_get_on_error(dev->conf.blk, 0) != BLOCKDEV_ON_ERROR_REPORT) {
+        error_setg(errp, "fdc doesn't support drive option werror");
+        return;
+    }
+    if (blk_get_on_error(dev->conf.blk, 1) != BLOCKDEV_ON_ERROR_REPORT) {
+        error_setg(errp, "fdc doesn't support drive option rerror");
+        return;
+    }
+
+    drive->conf = &dev->conf;
+    drive->blk = dev->conf.blk;
+    drive->swimctrl = bus->ctrl;
+
+    blk_set_dev_ops(drive->blk, &swim_block_ops, drive);
+}
+
+static void swim_drive_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *k = DEVICE_CLASS(klass);
+    k->realize = swim_drive_realize;
+    set_bit(DEVICE_CATEGORY_STORAGE, k->categories);
+    k->bus_type = TYPE_SWIM_BUS;
+    k->props = swim_drive_properties;
+    k->desc = "virtual SWIM drive";
+}
+
+static const TypeInfo swim_drive_info = {
+    .name = TYPE_SWIM_DRIVE,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(SWIMDrive),
+    .class_init = swim_drive_class_init,
+};
+
+static const TypeInfo swim_bus_info = {
+    .name = TYPE_SWIM_BUS,
+    .parent = TYPE_BUS,
+    .instance_size = sizeof(SWIMBus),
+};
+
+static void iwmctrl_write(void *opaque, hwaddr reg, uint64_t value,
+                          unsigned size)
+{
+    SWIMCtrl *swimctrl = opaque;
+
+    reg >>= REG_SHIFT;
+
+    swimctrl->regs[reg >> 1] = reg & 1;
+
+    if (swimctrl->regs[IWM_Q6] &&
+        swimctrl->regs[IWM_Q7]) {
+        if (swimctrl->regs[IWM_MTR]) {
+            /* data register */
+            swimctrl->iwm_data = value;
+        } else {
+            /* mode register */
+            swimctrl->iwm_mode = value;
+            /* detect sequence to switch from IWM mode to SWIM mode */
+            switch (swimctrl->iwm_switch) {
+            case 0:
+                if (value == 0x57) {
+                    swimctrl->iwm_switch++;
+                }
+                break;
+            case 1:
+                if (value == 0x17) {
+                    swimctrl->iwm_switch++;
+                }
+                break;
+            case 2:
+                if (value == 0x57) {
+                    swimctrl->iwm_switch++;
+                }
+                break;
+            case 3:
+                if (value == 0x57) {
+                    swimctrl->mode = SWIM_MODE_SWIM;
+                    swimctrl->iwm_switch = 0;
+                }
+                break;
+            }
+        }
+    }
+}
+
+static uint64_t iwmctrl_read(void *opaque, hwaddr reg, unsigned size)
+{
+    SWIMCtrl *swimctrl = opaque;
+
+    reg >>= REG_SHIFT;
+
+    swimctrl->regs[reg >> 1] = reg & 1;
+
+    return 0;
+}
+
+static void swimctrl_write(void *opaque, hwaddr reg, uint64_t value,
+                           unsigned size)
+{
+    SWIMCtrl *swimctrl = opaque;
+
+    if (swimctrl->mode == SWIM_MODE_IWM) {
+        iwmctrl_write(opaque, reg, value, size);
+        return;
+    }
+
+    reg >>= REG_SHIFT;
+
+    switch (reg) {
+    case SWIM_WRITE_PHASE:
+        swimctrl->swim_phase = value;
+        break;
+    case SWIM_WRITE_MODE0:
+        swimctrl->swim_mode &= ~value;
+        break;
+    case SWIM_WRITE_MODE1:
+        swimctrl->swim_mode |= value;
+        break;
+    case SWIM_WRITE_DATA:
+    case SWIM_WRITE_MARK:
+    case SWIM_WRITE_CRC:
+    case SWIM_WRITE_PARAMETER:
+    case SWIM_WRITE_SETUP:
+        break;
+    }
+}
+
+static uint64_t swimctrl_read(void *opaque, hwaddr reg, unsigned size)
+{
+    SWIMCtrl *swimctrl = opaque;
+    uint32_t value = 0;
+
+    if (swimctrl->mode == SWIM_MODE_IWM) {
+        return iwmctrl_read(opaque, reg, size);
+    }
+
+    reg >>= REG_SHIFT;
+
+    switch (reg) {
+    case SWIM_READ_PHASE:
+        value = swimctrl->swim_phase;
+        break;
+    case SWIM_READ_HANDSHAKE:
+        if (swimctrl->swim_phase == SWIM_DRIVE_PRESENT) {
+            /* always answer "no drive present" */
+            value = SWIM_SENSE;
+        }
+        break;
+    case SWIM_READ_DATA:
+    case SWIM_READ_MARK:
+    case SWIM_READ_ERROR:
+    case SWIM_READ_PARAMETER:
+    case SWIM_READ_SETUP:
+    case SWIM_READ_STATUS:
+        break;
+    }
+
+    return value;
+}
+
+static const MemoryRegionOps swimctrl_mem_ops = {
+    .write = swimctrl_write,
+    .read = swimctrl_read,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void sysbus_swim_init(Object *obj)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    SWIM *sbs = SWIM(obj);
+    SWIMCtrl *swimctrl = &sbs->ctrl;
+
+    memory_region_init_io(&swimctrl->iomem, obj, &swimctrl_mem_ops, swimctrl,
+                          "swim", 0x2000);
+    sysbus_init_mmio(sbd, &swimctrl->iomem);
+}
+
+static void sysbus_swim_realize(DeviceState *dev, Error **errp)
+{
+    SWIM *sys = SWIM(dev);
+    SWIMCtrl *swimctrl = &sys->ctrl;
+
+    qbus_create_inplace(&swimctrl->bus, sizeof(SWIMBus), TYPE_SWIM_BUS, dev,
+                        NULL);
+    swimctrl->bus.ctrl = swimctrl;
+}
+
+static void sysbus_swim_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = sysbus_swim_realize;
+}
+
+static const TypeInfo sysbus_swim_info = {
+    .name          = TYPE_SWIM,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(SWIM),
+    .instance_init = sysbus_swim_init,
+    .class_init    = sysbus_swim_class_init,
+};
+
+static void swim_register_types(void)
+{
+    type_register_static(&sysbus_swim_info);
+    type_register_static(&swim_bus_info);
+    type_register_static(&swim_drive_info);
+}
+
+type_init(swim_register_types)
diff --git a/include/hw/block/swim.h b/include/hw/block/swim.h
new file mode 100644
index 0000000000..e69c644995
--- /dev/null
+++ b/include/hw/block/swim.h
@@ -0,0 +1,76 @@
+/*
+ * QEMU Macintosh floppy disk controller emulator (SWIM)
+ *
+ * Copyright (c) 2014-2018 Laurent Vivier <laurent@vivier.eu>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef SWIM_H
+#define SWIM_H
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+
+#define SWIM_MAX_FD            2
+
+typedef struct SWIMDrive SWIMDrive;
+typedef struct SWIMBus SWIMBus;
+typedef struct SWIMCtrl SWIMCtrl;
+
+#define TYPE_SWIM_DRIVE "swim-drive"
+#define SWIM_DRIVE(obj) OBJECT_CHECK(SWIMDrive, (obj), TYPE_SWIM_DRIVE)
+
+struct SWIMDrive {
+    DeviceState qdev;
+    int32_t     unit;
+    BlockConf   conf;
+};
+
+#define TYPE_SWIM_BUS "swim-bus"
+#define SWIM_BUS(obj) OBJECT_CHECK(SWIMBus, (obj), TYPE_SWIM_BUS)
+
+struct SWIMBus {
+    BusState bus;
+    struct SWIMCtrl *ctrl;
+};
+
+typedef struct FDrive {
+    SWIMCtrl *swimctrl;
+    BlockBackend *blk;
+    BlockConf *conf;
+} FDrive;
+
+struct SWIMCtrl {
+    MemoryRegion iomem;
+    FDrive drives[SWIM_MAX_FD];
+    int mode;
+    /* IWM mode */
+    int iwm_switch;
+    int regs[8];
+#define IWM_PH0   0
+#define IWM_PH1   1
+#define IWM_PH2   2
+#define IWM_PH3   3
+#define IWM_MTR   4
+#define IWM_DRIVE 5
+#define IWM_Q6    6
+#define IWM_Q7    7
+    uint8_t iwm_data;
+    uint8_t iwm_mode;
+    /* SWIM mode */
+    uint8_t swim_phase;
+    uint8_t swim_mode;
+    SWIMBus bus;
+};
+
+#define TYPE_SWIM "swim"
+#define SWIM(obj) OBJECT_CHECK(SWIM, (obj), TYPE_SWIM)
+
+typedef struct SWIM {
+    SysBusDevice parent_obj;
+    SWIMCtrl     ctrl;
+} SWIM;
+#endif
-- 
2.20.1


