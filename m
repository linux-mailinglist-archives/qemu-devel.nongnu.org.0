Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2648833C566
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:19:55 +0100 (CET)
Received: from localhost ([::1]:60500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLroo-0005dE-4O
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lLrYV-0002Aw-K3
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:03:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lLrYN-0000Xl-SS
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:03:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615831374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aSx+0STUj1xpHQE7GWlBP/eH2KqEI77RcRN96kq8YNc=;
 b=id0DFxlCfHM6MLt/hjtuu/9vNco6bmcIlbOmFlvYICWvMg/Hy/vL+S9GNCxP2Shqz5N1dU
 +XtFxtdtvaOEcbh2zYHnuQzcXXKBEQ61RO4km18m5rSVTec8HQlTvEX8YPPyIo15v1rLa1
 S47mQOVBwv6fAVVop3zYWMabIBqcUcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-InmIflhRNtanlPSx1psmtw-1; Mon, 15 Mar 2021 14:02:52 -0400
X-MC-Unique: InmIflhRNtanlPSx1psmtw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F083363B0;
 Mon, 15 Mar 2021 18:02:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD3CE5DEAD;
 Mon, 15 Mar 2021 18:02:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5BC3018007BD; Mon, 15 Mar 2021 19:02:41 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/13] hw/usb/hcd-uhci: Expose generic prototypes to local
 header
Date: Mon, 15 Mar 2021 19:02:34 +0100
Message-Id: <20210315180240.1597240-8-kraxel@redhat.com>
In-Reply-To: <20210315180240.1597240-1-kraxel@redhat.com>
References: <20210315180240.1597240-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Extract generic UHCI prototypes into a new "hcd-uhci.h" local
header so we can reuse them in other units.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210309190802.830969-3-f4bug@amsat.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-uhci.h | 93 +++++++++++++++++++++++++++++++++++++++++++++++
 hw/usb/hcd-uhci.c | 60 ++----------------------------
 2 files changed, 96 insertions(+), 57 deletions(-)
 create mode 100644 hw/usb/hcd-uhci.h

diff --git a/hw/usb/hcd-uhci.h b/hw/usb/hcd-uhci.h
new file mode 100644
index 000000000000..e61d8fcb1921
--- /dev/null
+++ b/hw/usb/hcd-uhci.h
@@ -0,0 +1,93 @@
+/*
+ * USB UHCI controller emulation
+ *
+ * Copyright (c) 2005 Fabrice Bellard
+ *
+ * Copyright (c) 2008 Max Krasnyansky
+ *     Magor rewrite of the UHCI data structures parser and frame processor
+ *     Support for fully async operation and multiple outstanding transactions
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
+#ifndef HW_USB_HCD_UHCI_H
+#define HW_USB_HCD_UHCI_H
+
+#include "exec/memory.h"
+#include "qemu/timer.h"
+#include "hw/pci/pci.h"
+#include "hw/usb.h"
+
+typedef struct UHCIQueue UHCIQueue;
+
+#define NB_PORTS 2
+
+typedef struct UHCIPort {
+    USBPort port;
+    uint16_t ctrl;
+} UHCIPort;
+
+typedef struct UHCIState {
+    PCIDevice dev;
+    MemoryRegion io_bar;
+    USBBus bus; /* Note unused when we're a companion controller */
+    uint16_t cmd; /* cmd register */
+    uint16_t status;
+    uint16_t intr; /* interrupt enable register */
+    uint16_t frnum; /* frame number */
+    uint32_t fl_base_addr; /* frame list base address */
+    uint8_t sof_timing;
+    uint8_t status2; /* bit 0 and 1 are used to generate UHCI_STS_USBINT */
+    int64_t expire_time;
+    QEMUTimer *frame_timer;
+    QEMUBH *bh;
+    uint32_t frame_bytes;
+    uint32_t frame_bandwidth;
+    bool completions_only;
+    UHCIPort ports[NB_PORTS];
+
+    /* Interrupts that should be raised at the end of the current frame.  */
+    uint32_t pending_int_mask;
+
+    /* Active packets */
+    QTAILQ_HEAD(, UHCIQueue) queues;
+    uint8_t num_ports_vmstate;
+
+    /* Properties */
+    char *masterbus;
+    uint32_t firstport;
+    uint32_t maxframes;
+} UHCIState;
+
+#define TYPE_UHCI "pci-uhci-usb"
+DECLARE_INSTANCE_CHECKER(UHCIState, UHCI, TYPE_UHCI)
+
+typedef struct UHCIInfo {
+    const char *name;
+    uint16_t   vendor_id;
+    uint16_t   device_id;
+    uint8_t    revision;
+    uint8_t    irq_pin;
+    void       (*realize)(PCIDevice *dev, Error **errp);
+    bool       unplug;
+} UHCIInfo;
+
+void uhci_data_class_init(ObjectClass *klass, void *data);
+void usb_uhci_common_realize(PCIDevice *dev, Error **errp);
+
+#endif
diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index 5969eb86b31b..d6338c33d863 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -40,6 +40,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "qom/object.h"
+#include "hcd-uhci.h"
 
 #define FRAME_TIMER_FREQ 1000
 
@@ -50,8 +51,6 @@
 
 #define MAX_FRAMES_PER_TICK    (QH_VALID / 2)
 
-#define NB_PORTS 2
-
 enum {
     TD_RESULT_STOP_FRAME = 10,
     TD_RESULT_COMPLETE,
@@ -62,20 +61,8 @@ enum {
 
 typedef struct UHCIState UHCIState;
 typedef struct UHCIAsync UHCIAsync;
-typedef struct UHCIQueue UHCIQueue;
-typedef struct UHCIInfo UHCIInfo;
 typedef struct UHCIPCIDeviceClass UHCIPCIDeviceClass;
 
-struct UHCIInfo {
-    const char *name;
-    uint16_t   vendor_id;
-    uint16_t   device_id;
-    uint8_t    revision;
-    uint8_t    irq_pin;
-    void       (*realize)(PCIDevice *dev, Error **errp);
-    bool       unplug;
-};
-
 struct UHCIPCIDeviceClass {
     PCIDeviceClass parent_class;
     UHCIInfo       info;
@@ -107,43 +94,6 @@ struct UHCIQueue {
     int8_t    valid;
 };
 
-typedef struct UHCIPort {
-    USBPort port;
-    uint16_t ctrl;
-} UHCIPort;
-
-struct UHCIState {
-    PCIDevice dev;
-    MemoryRegion io_bar;
-    USBBus bus; /* Note unused when we're a companion controller */
-    uint16_t cmd; /* cmd register */
-    uint16_t status;
-    uint16_t intr; /* interrupt enable register */
-    uint16_t frnum; /* frame number */
-    uint32_t fl_base_addr; /* frame list base address */
-    uint8_t sof_timing;
-    uint8_t status2; /* bit 0 and 1 are used to generate UHCI_STS_USBINT */
-    int64_t expire_time;
-    QEMUTimer *frame_timer;
-    QEMUBH *bh;
-    uint32_t frame_bytes;
-    uint32_t frame_bandwidth;
-    bool completions_only;
-    UHCIPort ports[NB_PORTS];
-
-    /* Interrupts that should be raised at the end of the current frame.  */
-    uint32_t pending_int_mask;
-
-    /* Active packets */
-    QTAILQ_HEAD(, UHCIQueue) queues;
-    uint8_t num_ports_vmstate;
-
-    /* Properties */
-    char *masterbus;
-    uint32_t firstport;
-    uint32_t maxframes;
-};
-
 typedef struct UHCI_TD {
     uint32_t link;
     uint32_t ctrl; /* see TD_CTRL_xxx */
@@ -160,10 +110,6 @@ static void uhci_async_cancel(UHCIAsync *async);
 static void uhci_queue_fill(UHCIQueue *q, UHCI_TD *td);
 static void uhci_resume(void *opaque);
 
-#define TYPE_UHCI "pci-uhci-usb"
-DECLARE_INSTANCE_CHECKER(UHCIState, UHCI,
-                         TYPE_UHCI)
-
 static inline int32_t uhci_queue_token(UHCI_TD *td)
 {
     if ((td->token & (0xf << 15)) == 0) {
@@ -1213,7 +1159,7 @@ static USBPortOps uhci_port_ops = {
 static USBBusOps uhci_bus_ops = {
 };
 
-static void usb_uhci_common_realize(PCIDevice *dev, Error **errp)
+void usb_uhci_common_realize(PCIDevice *dev, Error **errp)
 {
     Error *err = NULL;
     PCIDeviceClass *pc = PCI_DEVICE_GET_CLASS(dev);
@@ -1335,7 +1281,7 @@ static const TypeInfo uhci_pci_type_info = {
     },
 };
 
-static void uhci_data_class_init(ObjectClass *klass, void *data)
+void uhci_data_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
-- 
2.29.2


