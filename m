Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F47E02D1
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 13:26:33 +0200 (CEST)
Received: from localhost ([::1]:53526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMsJ5-0005m0-Tr
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 07:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44364)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iMsBg-0004xF-BB
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 07:18:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iMsBd-0007zg-TW
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 07:18:52 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:59269)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iMsBQ-0007rc-MQ; Tue, 22 Oct 2019 07:18:41 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MUokB-1iVqIs3SGf-00Qi4t; Tue, 22 Oct 2019 13:18:04 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v14 7/9] hw/m68k: add a dummy SWIM floppy controller
Date: Tue, 22 Oct 2019 13:17:36 +0200
Message-Id: <20191022111738.20803-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191022111738.20803-1-laurent@vivier.eu>
References: <20191022111738.20803-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LSbs3NNIMGLWN6hUALHcqhMaAypene6Sqm8k/BGnoU3za6hfa4J
 wGQkVkBHN6HJCG4wBsNbAhgpIMG/EvY8IcX6RDucsMKPsFlaLM6ePOc3v18DWzIc8luKXmR
 9X/wwD3g1nd4zREZbqzU2TxaATCjWXcPnkctOsTwRBuZ3pSUsX5CXUf0AXSN2uQr/j8N9kp
 8nNH30iL1wrjdWFDpcmiA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZAIqT/4kwno=:XzEoRDyVjL4JriUWtSIK6V
 GhivaqN5JuswPXw1JPg73TlqQad0jn4D8/T7NPKVvz9iTkRroIUbDFgB4S2OJrACdq4jCKe53
 ZALB2pVayoD4I/LGQB6I9BtyqnGE6196gEM3GpFUzheuOssUB7TWXwuoLNAhGc0wmcEQ07hds
 RwK0+vNXjrUdY+cKf7SSd8A24kCwANUYJgpX+KuHTRRkUnMVWqgcF8ljzjjohIiKXiQnLKN5c
 he3aYhy8Y9ed5us/m9ydrr9vAQ1gbMaGecQgpYGOHPTqLVKnbXN8irJhMmyqKpHLsu9MwDfkw
 qVRv7+3paLja9muFIaiZmLZvSC17tTU8QNO5IWdFen9eAx5tu3flV+bMYjWL+V7shdUInKZIv
 IjkR+0dNfqtqwTSgOMNXXSfs6fVP603F96GPPDhT8tn1rLqY/XX0mBZUVD2Fd9LVW8s99tZ/m
 zK0KC/3Xd+sXoFFMtBWJgFmPU2AfUTV5uVnLl/CapTnmZqrA6ghE89Kd5xyOafIgtlWFiSpcD
 6NKt8xIJ9UVILDbtiF6h5eBBfN9pFjNNtk1T37e1NoA46MwGmRQN75AVYpue2i23Qfxi1pZBe
 kGfxFNGZcFMnOWwk9oxRdMIJ6ibhDjXZBcwsLf8w233COyX4JkSA5SOGzBcFIxxSgTsVwjCnP
 WO7ZMh/tnBeqX4W4kIW+0TrnPQW0pho6EcPdYUI5i7KvI7pQpN/8gvtov5RD/CZg1laLDGxU0
 wHkNaTgZYVc1ZSLDvutp6lCKGhmxNRrBbmnHqEElY7KehL65fCVDEQI889P08k7uUC/RFmeqp
 iuo/BzackPmv71hM0wzu+hUpk1LH59piAvw48FUB4Yqao5Bqe5voUMEf/cOR6Hp7Gm6qASejz
 q6MhnNTf3Yp+OcJ9fEHnVtmxpRIj2UZUdEeN4Il4g=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 217.72.192.73
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
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SWIM (Sander-Wozniak Integrated Machine) is the floppy controller of
the 680x0 Macintosh.

This patch introduces only the basic support: it allows to switch from
IWM (Integrated WOZ Machine) mode to the SWIM mode and makes the linux
driver happy.

It cannot read any floppy image.

Co-developed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>
---
 include/hw/block/swim.h |  76 +++++++
 hw/block/swim.c         | 489 ++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS             |   2 +
 hw/block/Kconfig        |   3 +
 hw/block/Makefile.objs  |   1 +
 hw/m68k/Kconfig         |   1 +
 6 files changed, 572 insertions(+)
 create mode 100644 include/hw/block/swim.h
 create mode 100644 hw/block/swim.c

diff --git a/include/hw/block/swim.h b/include/hw/block/swim.h
new file mode 100644
index 0000000000..6add3499d0
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
+    uint16_t regs[8];
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
diff --git a/hw/block/swim.c b/hw/block/swim.c
new file mode 100644
index 0000000000..c6d117e89b
--- /dev/null
+++ b/hw/block/swim.c
@@ -0,0 +1,489 @@
+/*
+ * QEMU Macintosh floppy disk controller emulator (SWIM)
+ *
+ * Copyright (c) 2014-2018 Laurent Vivier <laurent@vivier.eu>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Only the basic support: it allows to switch from IWM (Integrated WOZ
+ * Machine) mode to the SWIM mode and makes the linux driver happy.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/main-loop.h"
+#include "qapi/error.h"
+#include "sysemu/block-backend.h"
+#include "hw/sysbus.h"
+#include "migration/vmstate.h"
+#include "hw/block/block.h"
+#include "hw/block/swim.h"
+#include "hw/qdev-properties.h"
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
+static void fd_recalibrate(FDrive *drive)
+{
+}
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
+        dev->conf.blk = blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
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
+    /*
+     * rerror/werror aren't supported by fdc and therefore not even registered
+     * with qdev. So set the defaults manually before they are used in
+     * blkconf_apply_backend_options().
+     */
+    dev->conf.rerror = BLOCKDEV_ON_ERROR_AUTO;
+    dev->conf.werror = BLOCKDEV_ON_ERROR_AUTO;
+
+    if (!blkconf_apply_backend_options(&dev->conf,
+                                       blk_is_read_only(dev->conf.blk),
+                                       false, errp)) {
+        return;
+    }
+
+    /*
+     * 'enospc' is the default for -drive, 'report' is what blk_new() gives us
+     * for empty drives.
+     */
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
+static void sysbus_swim_reset(DeviceState *d)
+{
+    SWIM *sys = SWIM(d);
+    SWIMCtrl *ctrl = &sys->ctrl;
+    int i;
+
+    ctrl->mode = 0;
+    ctrl->iwm_switch = 0;
+    for (i = 0; i < 8; i++) {
+        ctrl->regs[i] = 0;
+    }
+    ctrl->iwm_data = 0;
+    ctrl->iwm_mode = 0;
+    ctrl->swim_phase = 0;
+    ctrl->swim_mode = 0;
+    for (i = 0; i < SWIM_MAX_FD; i++) {
+        fd_recalibrate(&ctrl->drives[i]);
+    }
+}
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
+static const VMStateDescription vmstate_fdrive = {
+    .name = "fdrive",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static const VMStateDescription vmstate_swim = {
+    .name = "swim",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_INT32(mode, SWIMCtrl),
+        /* IWM mode */
+        VMSTATE_INT32(iwm_switch, SWIMCtrl),
+        VMSTATE_UINT16_ARRAY(regs, SWIMCtrl, 8),
+        VMSTATE_UINT8(iwm_data, SWIMCtrl),
+        VMSTATE_UINT8(iwm_mode, SWIMCtrl),
+        /* SWIM mode */
+        VMSTATE_UINT8(swim_phase, SWIMCtrl),
+        VMSTATE_UINT8(swim_mode, SWIMCtrl),
+        /* Drives */
+        VMSTATE_STRUCT_ARRAY(drives, SWIMCtrl, SWIM_MAX_FD, 1,
+                             vmstate_fdrive, FDrive),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static const VMStateDescription vmstate_sysbus_swim = {
+    .name = "SWIM",
+    .version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT(ctrl, SWIM, 0, vmstate_swim, SWIMCtrl),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void sysbus_swim_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = sysbus_swim_realize;
+    dc->reset = sysbus_swim_reset;
+    dc->vmsd = &vmstate_sysbus_swim;
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
diff --git a/MAINTAINERS b/MAINTAINERS
index b18246c29f..67506792b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -923,9 +923,11 @@ S: Maintained
 F: hw/misc/mac_via.c
 F: hw/nubus/*
 F: hw/display/macfb.c
+F: hw/block/swim.c
 F: include/hw/misc/mac_via.h
 F: include/hw/nubus/*
 F: include/hw/display/macfb.h
+F: include/hw/block/swim.h
 
 MicroBlaze Machines
 -------------------
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
 
diff --git a/hw/m68k/Kconfig b/hw/m68k/Kconfig
index ef4917dee6..bab4885ca5 100644
--- a/hw/m68k/Kconfig
+++ b/hw/m68k/Kconfig
@@ -18,3 +18,4 @@ config Q800
     select MAC_VIA
     select NUBUS
     select MACFB
+    select SWIM
-- 
2.21.0


