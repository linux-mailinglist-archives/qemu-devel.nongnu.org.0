Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F17933B43B7
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 14:59:23 +0200 (CEST)
Received: from localhost ([::1]:33656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwlQZ-0005yL-1X
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 08:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwlMN-0007NA-42
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 08:55:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwlMJ-0004Om-Lw
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 08:55:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624625699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Js4++Apqx0GrEMnIJ0e4BLu1+pP3R9isU1O3JNbelWU=;
 b=MBNVmQ5r2t0bwfBL/OOHlQ3rcO6dlJWThQ5jfjy2gCFolPuhGOkbPN9CVknOK653sjFb96
 ZlTW4xlW5NFy7lTV3CNGRyOQOQ0UB9NqrRKs8IjOHKWc0W0+xj5k10iMNkG4Lv/ZYW9/ZT
 DekWz8AaEfHeaKUi4L5Y39cRf1bwu4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-N4yefwUtNASTi1XM-NaMrw-1; Fri, 25 Jun 2021 08:54:57 -0400
X-MC-Unique: N4yefwUtNASTi1XM-NaMrw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF2831084F4B;
 Fri, 25 Jun 2021 12:54:55 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0A8B6091B;
 Fri, 25 Jun 2021 12:54:53 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/6] hw/block/fdc: Declare shared prototypes in fdc-internal.h
Date: Fri, 25 Jun 2021 08:54:38 -0400
Message-Id: <20210625125441.756802-4-jsnow@redhat.com>
In-Reply-To: <20210625125441.756802-1-jsnow@redhat.com>
References: <20210625125441.756802-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

We want to extract ISA/SysBus code from the generic fdc.c file.
First, declare the prototypes we will access from the new units
into a new local header: "fdc-internal.h".

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210614193220.2007159-4-philmd@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 hw/block/fdc-internal.h | 158 ++++++++++++++++++++++++++++++++++++++++
 hw/block/fdc.c          | 131 +++------------------------------
 MAINTAINERS             |   1 +
 3 files changed, 168 insertions(+), 122 deletions(-)
 create mode 100644 hw/block/fdc-internal.h

diff --git a/hw/block/fdc-internal.h b/hw/block/fdc-internal.h
new file mode 100644
index 0000000000..036392e9fc
--- /dev/null
+++ b/hw/block/fdc-internal.h
@@ -0,0 +1,158 @@
+/*
+ * QEMU Floppy disk emulator (Intel 82078)
+ *
+ * Copyright (c) 2003, 2007 Jocelyn Mayer
+ * Copyright (c) 2008 Hervé Poussineau
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
+#ifndef HW_BLOCK_FDC_INTERNAL_H
+#define HW_BLOCK_FDC_INTERNAL_H
+
+#include "exec/memory.h"
+#include "exec/ioport.h"
+#include "hw/block/block.h"
+#include "hw/block/fdc.h"
+#include "qapi/qapi-types-block.h"
+
+typedef struct FDCtrl FDCtrl;
+
+/* Floppy bus emulation */
+
+typedef struct FloppyBus {
+    BusState bus;
+    FDCtrl *fdc;
+} FloppyBus;
+
+/* Floppy disk drive emulation */
+
+typedef enum FDriveRate {
+    FDRIVE_RATE_500K = 0x00,  /* 500 Kbps */
+    FDRIVE_RATE_300K = 0x01,  /* 300 Kbps */
+    FDRIVE_RATE_250K = 0x02,  /* 250 Kbps */
+    FDRIVE_RATE_1M   = 0x03,  /*   1 Mbps */
+} FDriveRate;
+
+typedef enum FDriveSize {
+    FDRIVE_SIZE_UNKNOWN,
+    FDRIVE_SIZE_350,
+    FDRIVE_SIZE_525,
+} FDriveSize;
+
+typedef struct FDFormat {
+    FloppyDriveType drive;
+    uint8_t last_sect;
+    uint8_t max_track;
+    uint8_t max_head;
+    FDriveRate rate;
+} FDFormat;
+
+typedef enum FDiskFlags {
+    FDISK_DBL_SIDES  = 0x01,
+} FDiskFlags;
+
+typedef struct FDrive {
+    FDCtrl *fdctrl;
+    BlockBackend *blk;
+    BlockConf *conf;
+    /* Drive status */
+    FloppyDriveType drive;    /* CMOS drive type        */
+    uint8_t perpendicular;    /* 2.88 MB access mode    */
+    /* Position */
+    uint8_t head;
+    uint8_t track;
+    uint8_t sect;
+    /* Media */
+    FloppyDriveType disk;     /* Current disk type      */
+    FDiskFlags flags;
+    uint8_t last_sect;        /* Nb sector per track    */
+    uint8_t max_track;        /* Nb of tracks           */
+    uint16_t bps;             /* Bytes per sector       */
+    uint8_t ro;               /* Is read-only           */
+    uint8_t media_changed;    /* Is media changed       */
+    uint8_t media_rate;       /* Data rate of medium    */
+
+    bool media_validated;     /* Have we validated the media? */
+} FDrive;
+
+struct FDCtrl {
+    MemoryRegion iomem;
+    qemu_irq irq;
+    /* Controller state */
+    QEMUTimer *result_timer;
+    int dma_chann;
+    uint8_t phase;
+    IsaDma *dma;
+    /* Controller's identification */
+    uint8_t version;
+    /* HW */
+    uint8_t sra;
+    uint8_t srb;
+    uint8_t dor;
+    uint8_t dor_vmstate; /* only used as temp during vmstate */
+    uint8_t tdr;
+    uint8_t dsr;
+    uint8_t msr;
+    uint8_t cur_drv;
+    uint8_t status0;
+    uint8_t status1;
+    uint8_t status2;
+    /* Command FIFO */
+    uint8_t *fifo;
+    int32_t fifo_size;
+    uint32_t data_pos;
+    uint32_t data_len;
+    uint8_t data_state;
+    uint8_t data_dir;
+    uint8_t eot; /* last wanted sector */
+    /* States kept only to be returned back */
+    /* precompensation */
+    uint8_t precomp_trk;
+    uint8_t config;
+    uint8_t lock;
+    /* Power down config (also with status regB access mode */
+    uint8_t pwrd;
+    /* Floppy drives */
+    FloppyBus bus;
+    uint8_t num_floppies;
+    FDrive drives[MAX_FD];
+    struct {
+        FloppyDriveType type;
+    } qdev_for_drives[MAX_FD];
+    int reset_sensei;
+    FloppyDriveType fallback; /* type=auto failure fallback */
+    /* Timers state */
+    uint8_t timer0;
+    uint8_t timer1;
+    PortioList portio_list;
+};
+
+extern const FDFormat fd_formats[];
+extern const VMStateDescription vmstate_fdc;
+
+uint32_t fdctrl_read(void *opaque, uint32_t reg);
+void fdctrl_write(void *opaque, uint32_t reg, uint32_t value);
+void fdctrl_reset(FDCtrl *fdctrl, int do_irq);
+void fdctrl_realize_common(DeviceState *dev, FDCtrl *fdctrl, Error **errp);
+
+int fdctrl_transfer_handler(void *opaque, int nchan, int dma_pos, int dma_len);
+
+void fdctrl_init_drives(FloppyBus *bus, DriveInfo **fds);
+
+#endif
diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 1d3a047367..20ddeb98d8 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -48,6 +48,7 @@
 #include "qemu/module.h"
 #include "trace.h"
 #include "qom/object.h"
+#include "fdc-internal.h"
 
 /********************************************************/
 /* debug Floppy devices */
@@ -68,15 +69,8 @@
 #define TYPE_FLOPPY_BUS "floppy-bus"
 OBJECT_DECLARE_SIMPLE_TYPE(FloppyBus, FLOPPY_BUS)
 
-typedef struct FDCtrl FDCtrl;
-typedef struct FDrive FDrive;
 static FDrive *get_drv(FDCtrl *fdctrl, int unit);
 
-struct FloppyBus {
-    BusState bus;
-    FDCtrl *fdc;
-};
-
 static const TypeInfo floppy_bus_info = {
     .name = TYPE_FLOPPY_BUS,
     .parent = TYPE_BUS,
@@ -93,32 +87,11 @@ static void floppy_bus_create(FDCtrl *fdc, FloppyBus *bus, DeviceState *dev)
 /********************************************************/
 /* Floppy drive emulation                               */
 
-typedef enum FDriveRate {
-    FDRIVE_RATE_500K = 0x00,  /* 500 Kbps */
-    FDRIVE_RATE_300K = 0x01,  /* 300 Kbps */
-    FDRIVE_RATE_250K = 0x02,  /* 250 Kbps */
-    FDRIVE_RATE_1M   = 0x03,  /*   1 Mbps */
-} FDriveRate;
-
-typedef enum FDriveSize {
-    FDRIVE_SIZE_UNKNOWN,
-    FDRIVE_SIZE_350,
-    FDRIVE_SIZE_525,
-} FDriveSize;
-
-typedef struct FDFormat {
-    FloppyDriveType drive;
-    uint8_t last_sect;
-    uint8_t max_track;
-    uint8_t max_head;
-    FDriveRate rate;
-} FDFormat;
-
 /* In many cases, the total sector size of a format is enough to uniquely
  * identify it. However, there are some total sector collisions between
  * formats of different physical size, and these are noted below by
  * highlighting the total sector size for entries with collisions. */
-static const FDFormat fd_formats[] = {
+const FDFormat fd_formats[] = {
     /* First entry is default format */
     /* 1.44 MB 3"1/2 floppy disks */
     { FLOPPY_DRIVE_TYPE_144, 18, 80, 1, FDRIVE_RATE_500K, }, /* 3.5" 2880 */
@@ -186,35 +159,6 @@ static FDriveSize drive_size(FloppyDriveType drive)
 #define FD_SECTOR_SC           2   /* Sector size code */
 #define FD_RESET_SENSEI_COUNT  4   /* Number of sense interrupts on RESET */
 
-/* Floppy disk drive emulation */
-typedef enum FDiskFlags {
-    FDISK_DBL_SIDES  = 0x01,
-} FDiskFlags;
-
-struct FDrive {
-    FDCtrl *fdctrl;
-    BlockBackend *blk;
-    BlockConf *conf;
-    /* Drive status */
-    FloppyDriveType drive;    /* CMOS drive type        */
-    uint8_t perpendicular;    /* 2.88 MB access mode    */
-    /* Position */
-    uint8_t head;
-    uint8_t track;
-    uint8_t sect;
-    /* Media */
-    FloppyDriveType disk;     /* Current disk type      */
-    FDiskFlags flags;
-    uint8_t last_sect;        /* Nb sector per track    */
-    uint8_t max_track;        /* Nb of tracks           */
-    uint16_t bps;             /* Bytes per sector       */
-    uint8_t ro;               /* Is read-only           */
-    uint8_t media_changed;    /* Is media changed       */
-    uint8_t media_rate;       /* Data rate of medium    */
-
-    bool media_validated;     /* Have we validated the media? */
-};
-
 
 static FloppyDriveType get_fallback_drive_type(FDrive *drv);
 
@@ -626,10 +570,7 @@ static const TypeInfo floppy_drive_info = {
 /********************************************************/
 /* Intel 82078 floppy disk controller emulation          */
 
-static void fdctrl_reset(FDCtrl *fdctrl, int do_irq);
 static void fdctrl_to_command_phase(FDCtrl *fdctrl);
-static int fdctrl_transfer_handler (void *opaque, int nchan,
-                                    int dma_pos, int dma_len);
 static void fdctrl_raise_irq(FDCtrl *fdctrl);
 static FDrive *get_cur_drv(FDCtrl *fdctrl);
 
@@ -828,58 +769,6 @@ enum {
 #define FD_MULTI_TRACK(state) ((state) & FD_STATE_MULTI)
 #define FD_FORMAT_CMD(state) ((state) & FD_STATE_FORMAT)
 
-struct FDCtrl {
-    MemoryRegion iomem;
-    qemu_irq irq;
-    /* Controller state */
-    QEMUTimer *result_timer;
-    int dma_chann;
-    uint8_t phase;
-    IsaDma *dma;
-    /* Controller's identification */
-    uint8_t version;
-    /* HW */
-    uint8_t sra;
-    uint8_t srb;
-    uint8_t dor;
-    uint8_t dor_vmstate; /* only used as temp during vmstate */
-    uint8_t tdr;
-    uint8_t dsr;
-    uint8_t msr;
-    uint8_t cur_drv;
-    uint8_t status0;
-    uint8_t status1;
-    uint8_t status2;
-    /* Command FIFO */
-    uint8_t *fifo;
-    int32_t fifo_size;
-    uint32_t data_pos;
-    uint32_t data_len;
-    uint8_t data_state;
-    uint8_t data_dir;
-    uint8_t eot; /* last wanted sector */
-    /* States kept only to be returned back */
-    /* precompensation */
-    uint8_t precomp_trk;
-    uint8_t config;
-    uint8_t lock;
-    /* Power down config (also with status regB access mode */
-    uint8_t pwrd;
-    /* Floppy drives */
-    FloppyBus bus;
-    uint8_t num_floppies;
-    FDrive drives[MAX_FD];
-    struct {
-        FloppyDriveType type;
-    } qdev_for_drives[MAX_FD];
-    int reset_sensei;
-    FloppyDriveType fallback; /* type=auto failure fallback */
-    /* Timers state */
-    uint8_t timer0;
-    uint8_t timer1;
-    PortioList portio_list;
-};
-
 static FloppyDriveType get_fallback_drive_type(FDrive *drv)
 {
     return drv->fdctrl->fallback;
@@ -909,7 +798,7 @@ struct FDCtrlISABus {
     int32_t bootindexB;
 };
 
-static uint32_t fdctrl_read (void *opaque, uint32_t reg)
+uint32_t fdctrl_read(void *opaque, uint32_t reg)
 {
     FDCtrl *fdctrl = opaque;
     uint32_t retval;
@@ -946,7 +835,7 @@ static uint32_t fdctrl_read (void *opaque, uint32_t reg)
     return retval;
 }
 
-static void fdctrl_write (void *opaque, uint32_t reg, uint32_t value)
+void fdctrl_write(void *opaque, uint32_t reg, uint32_t value)
 {
     FDCtrl *fdctrl = opaque;
 
@@ -1178,7 +1067,7 @@ static const VMStateDescription vmstate_fdc_phase = {
     }
 };
 
-static const VMStateDescription vmstate_fdc = {
+const VMStateDescription vmstate_fdc = {
     .name = "fdc",
     .version_id = 2,
     .minimum_version_id = 2,
@@ -1268,7 +1157,7 @@ static void fdctrl_raise_irq(FDCtrl *fdctrl)
 }
 
 /* Reset controller */
-static void fdctrl_reset(FDCtrl *fdctrl, int do_irq)
+void fdctrl_reset(FDCtrl *fdctrl, int do_irq)
 {
     int i;
 
@@ -1747,8 +1636,7 @@ static void fdctrl_start_transfer_del(FDCtrl *fdctrl, int direction)
 }
 
 /* handlers for DMA transfers */
-static int fdctrl_transfer_handler (void *opaque, int nchan,
-                                    int dma_pos, int dma_len)
+int fdctrl_transfer_handler(void *opaque, int nchan, int dma_pos, int dma_len)
 {
     FDCtrl *fdctrl;
     FDrive *cur_drv;
@@ -2484,7 +2372,7 @@ static void fdctrl_result_timer(void *opaque)
 
 /* Init functions */
 
-static void fdctrl_init_drives(FloppyBus *bus, DriveInfo **fds)
+void fdctrl_init_drives(FloppyBus *bus, DriveInfo **fds)
 {
     DeviceState *dev;
     int i;
@@ -2542,8 +2430,7 @@ void sun4m_fdctrl_init(qemu_irq irq, hwaddr io_base,
     fdctrl_init_drives(&sys->state.bus, fds);
 }
 
-static void fdctrl_realize_common(DeviceState *dev, FDCtrl *fdctrl,
-                                  Error **errp)
+void fdctrl_realize_common(DeviceState *dev, FDCtrl *fdctrl, Error **errp)
 {
     int i, j;
     FDrive *drive;
diff --git a/MAINTAINERS b/MAINTAINERS
index 3443d2a5b5..0dee966a31 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1671,6 +1671,7 @@ M: John Snow <jsnow@redhat.com>
 L: qemu-block@nongnu.org
 S: Supported
 F: hw/block/fdc.c
+F: hw/block/fdc-internal.h
 F: include/hw/block/fdc.h
 F: tests/qtest/fdc-test.c
 T: git https://gitlab.com/jsnow/qemu.git ide
-- 
2.31.1


