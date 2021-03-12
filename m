Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA1233884B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:10:14 +0100 (CET)
Received: from localhost ([::1]:53954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKdoD-0000sY-6E
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:10:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKdim-00036k-QF
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:04:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKdij-0001iJ-TS
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:04:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615539873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N7zaoTIs1AxLT5Odcr0vxonmBvSB25dG2cz3gpK5Odg=;
 b=DPlHP+04zoMc1On0ptlfhv5r0xZQ2pemv/5U6d7BZ4bMh9N1b47ZQGhfbFWzJ7img3V/Mu
 bz6M8wCKb27PF/a3RPyuJ4t3aGTdI0L//mDi8pK2kb7nKaaDoN3WTlruLxXCHCHVmKh1M2
 4dSC2pWEiMJWswzNDxrvhy8RuccNuR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-ZVUYbEUUP0aMELHjA3GUfA-1; Fri, 12 Mar 2021 04:04:31 -0500
X-MC-Unique: ZVUYbEUUP0aMELHjA3GUfA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DCEE760C4
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:04:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CEABA5C255;
 Fri, 12 Mar 2021 09:04:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3850C1800398; Fri, 12 Mar 2021 10:04:25 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] usb/storage: move declarations to usb/msd.h header
Date: Fri, 12 Mar 2021 10:04:22 +0100
Message-Id: <20210312090425.772900-2-kraxel@redhat.com>
In-Reply-To: <20210312090425.772900-1-kraxel@redhat.com>
References: <20210312090425.772900-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In preparation for splitting the usb-storage.c file move
declarations to the new usb/msd.h header file.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/usb/msd.h | 54 ++++++++++++++++++++++++++++++++++++++++++++
 hw/usb/dev-storage.c | 48 +++++----------------------------------
 2 files changed, 60 insertions(+), 42 deletions(-)
 create mode 100644 include/hw/usb/msd.h

diff --git a/include/hw/usb/msd.h b/include/hw/usb/msd.h
new file mode 100644
index 000000000000..7538c54569bf
--- /dev/null
+++ b/include/hw/usb/msd.h
@@ -0,0 +1,54 @@
+/*
+ * USB Mass Storage Device emulation
+ *
+ * Copyright (c) 2006 CodeSourcery.
+ * Written by Paul Brook
+ *
+ * This code is licensed under the LGPL.
+ */
+
+#include "hw/usb.h"
+#include "hw/scsi/scsi.h"
+
+enum USBMSDMode {
+    USB_MSDM_CBW, /* Command Block.  */
+    USB_MSDM_DATAOUT, /* Transfer data to device.  */
+    USB_MSDM_DATAIN, /* Transfer data from device.  */
+    USB_MSDM_CSW /* Command Status.  */
+};
+
+struct usb_msd_csw {
+    uint32_t sig;
+    uint32_t tag;
+    uint32_t residue;
+    uint8_t status;
+};
+
+struct MSDState {
+    USBDevice dev;
+    enum USBMSDMode mode;
+    uint32_t scsi_off;
+    uint32_t scsi_len;
+    uint32_t data_len;
+    struct usb_msd_csw csw;
+    SCSIRequest *req;
+    SCSIBus bus;
+    /* For async completion.  */
+    USBPacket *packet;
+    /* usb-storage only */
+    BlockConf conf;
+    bool removable;
+    bool commandlog;
+    SCSIDevice *scsi_dev;
+};
+
+typedef struct MSDState MSDState;
+#define TYPE_USB_STORAGE "usb-storage-dev"
+DECLARE_INSTANCE_CHECKER(MSDState, USB_STORAGE_DEV,
+                         TYPE_USB_STORAGE)
+
+void usb_msd_transfer_data(SCSIRequest *req, uint32_t len);
+void usb_msd_command_complete(SCSIRequest *req, size_t resid);
+void usb_msd_request_cancelled(SCSIRequest *req);
+void *usb_msd_load_request(QEMUFile *f, SCSIRequest *req);
+void usb_msd_handle_reset(USBDevice *dev);
diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index a5f76fc00120..027e29dda3f5 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -14,6 +14,7 @@
 #include "qemu/option.h"
 #include "qemu/config-file.h"
 #include "hw/usb.h"
+#include "hw/usb/msd.h"
 #include "desc.h"
 #include "hw/qdev-properties.h"
 #include "hw/scsi/scsi.h"
@@ -29,43 +30,6 @@
 #define MassStorageReset  0xff
 #define GetMaxLun         0xfe
 
-enum USBMSDMode {
-    USB_MSDM_CBW, /* Command Block.  */
-    USB_MSDM_DATAOUT, /* Transfer data to device.  */
-    USB_MSDM_DATAIN, /* Transfer data from device.  */
-    USB_MSDM_CSW /* Command Status.  */
-};
-
-struct usb_msd_csw {
-    uint32_t sig;
-    uint32_t tag;
-    uint32_t residue;
-    uint8_t status;
-};
-
-struct MSDState {
-    USBDevice dev;
-    enum USBMSDMode mode;
-    uint32_t scsi_off;
-    uint32_t scsi_len;
-    uint32_t data_len;
-    struct usb_msd_csw csw;
-    SCSIRequest *req;
-    SCSIBus bus;
-    /* For async completion.  */
-    USBPacket *packet;
-    /* usb-storage only */
-    BlockConf conf;
-    bool removable;
-    bool commandlog;
-    SCSIDevice *scsi_dev;
-};
-typedef struct MSDState MSDState;
-
-#define TYPE_USB_STORAGE "usb-storage-dev"
-DECLARE_INSTANCE_CHECKER(MSDState, USB_STORAGE_DEV,
-                         TYPE_USB_STORAGE)
-
 struct usb_msd_cbw {
     uint32_t sig;
     uint32_t tag;
@@ -259,7 +223,7 @@ static void usb_msd_packet_complete(MSDState *s)
     usb_packet_complete(&s->dev, p);
 }
 
-static void usb_msd_transfer_data(SCSIRequest *req, uint32_t len)
+void usb_msd_transfer_data(SCSIRequest *req, uint32_t len)
 {
     MSDState *s = DO_UPCAST(MSDState, dev.qdev, req->bus->qbus.parent);
     USBPacket *p = s->packet;
@@ -277,7 +241,7 @@ static void usb_msd_transfer_data(SCSIRequest *req, uint32_t len)
     }
 }
 
-static void usb_msd_command_complete(SCSIRequest *req, size_t resid)
+void usb_msd_command_complete(SCSIRequest *req, size_t resid)
 {
     MSDState *s = DO_UPCAST(MSDState, dev.qdev, req->bus->qbus.parent);
     USBPacket *p = s->packet;
@@ -320,7 +284,7 @@ static void usb_msd_command_complete(SCSIRequest *req, size_t resid)
     s->req = NULL;
 }
 
-static void usb_msd_request_cancelled(SCSIRequest *req)
+void usb_msd_request_cancelled(SCSIRequest *req)
 {
     MSDState *s = DO_UPCAST(MSDState, dev.qdev, req->bus->qbus.parent);
 
@@ -337,7 +301,7 @@ static void usb_msd_request_cancelled(SCSIRequest *req)
     }
 }
 
-static void usb_msd_handle_reset(USBDevice *dev)
+void usb_msd_handle_reset(USBDevice *dev)
 {
     MSDState *s = (MSDState *)dev;
 
@@ -565,7 +529,7 @@ static void usb_msd_handle_data(USBDevice *dev, USBPacket *p)
     }
 }
 
-static void *usb_msd_load_request(QEMUFile *f, SCSIRequest *req)
+void *usb_msd_load_request(QEMUFile *f, SCSIRequest *req)
 {
     MSDState *s = DO_UPCAST(MSDState, dev.qdev, req->bus->qbus.parent);
 
-- 
2.29.2


