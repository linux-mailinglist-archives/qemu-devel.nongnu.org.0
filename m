Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E08E7332F6C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:58:50 +0100 (CET)
Received: from localhost ([::1]:57396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJiVF-00021R-O5
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJhiN-0005fe-Oz
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:08:19 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:33297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJhiL-0000yj-Vr
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:08:19 -0500
Received: by mail-ed1-x52b.google.com with SMTP id x9so22442880edd.0
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 11:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8d+eN5pLgED+uqQ3pUk7CcgP+iDLiwuObCJhPjjUbm4=;
 b=WnJomdkMzB/mzeeMwmKHfuFq8bg08VOaEoI7AdNDlB6kbLhdLCf38t0rZjHPNQUwuv
 kBmHcZH1QtTsFCcqB4w2ArVxxNa2fhc7O5aRPihzK3OVKjccrnM1sulrvp8RYd5W/Pae
 eFN8jCyqW0hUqEWrE3ErMz0YDoAhREMuOfK+GzDZbWp2sh9WAHy2/omcXHzlixoKMX9l
 DsUhzLUWZlCb60gvVGFbQNdQkLuBQdaDtFOeEzYvqMEd+C624Edhu/tIKrOJ3RJT5YdY
 RL+aEhcI1MUizFLWkxEbCKvTC40lI3ez6qnBEq5wrsXARd63ol97uN3zhH7dd/FYQrAY
 Ik/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8d+eN5pLgED+uqQ3pUk7CcgP+iDLiwuObCJhPjjUbm4=;
 b=ABfH6kERmOTptShuWnIFoVh2QnzJzhQeuwe2RrTku5btPLAOlPLzBDs9jKB/LtltCz
 1d4+Yv9Bemwy6Xnipt0y7lPN1RG3EopsOktCLS1itfOr9b2Q10aYVkcTOsPt0nUo9tfF
 yoWR/K089XNJQstBVBKpmnNfjfGuv+R01rP5/PWKCGuLQ6eY37IqY9WQWZIp6ye0BQeF
 05sUTkoLqnprsYf+5CE+tYcUI4Df/17zCt31hJhWMbF4f2dehIxyOqXNjKmIeKaoSBdD
 p13cuMVgwPJoThnGihoAh1NhHhWEKJ2AF3mmi4j5l9iUuILFZbLePkBFQN2ZCGx4kgDe
 npkg==
X-Gm-Message-State: AOAM530PrCpS6Uuk6XuVvhp1rsMQ2eitm4vp6f5iSlrOz3FmdI2DLhfy
 +kWdaYtnkbgYuVE+71GnBzoKqEuJHD0=
X-Google-Smtp-Source: ABdhPJxUW2RkLWjHUP2PwSclq/EFESGJi9Im/qRwp+XO9jVAZGi6+nKgFTJG8UGS5//tV2zGbPDbbA==
X-Received: by 2002:a05:6402:484:: with SMTP id
 k4mr5810888edv.321.1615316896217; 
 Tue, 09 Mar 2021 11:08:16 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id cb17sm9754784edb.10.2021.03.09.11.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 11:08:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/usb/hcd-uhci: Expose generic prototypes to local header
Date: Tue,  9 Mar 2021 20:08:01 +0100
Message-Id: <20210309190802.830969-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309190802.830969-1-f4bug@amsat.org>
References: <20210309190802.830969-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract generic UHCI prototypes into a new "hcd-uhci.h" local
header so we can reuse them in other units.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/hcd-uhci.h | 93 +++++++++++++++++++++++++++++++++++++++++++++++
 hw/usb/hcd-uhci.c | 60 ++----------------------------
 2 files changed, 96 insertions(+), 57 deletions(-)
 create mode 100644 hw/usb/hcd-uhci.h

diff --git a/hw/usb/hcd-uhci.h b/hw/usb/hcd-uhci.h
new file mode 100644
index 00000000000..e61d8fcb192
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
index 5969eb86b31..d6338c33d86 100644
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
2.26.2


