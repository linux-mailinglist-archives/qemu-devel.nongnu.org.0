Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FD82B4257
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 12:15:23 +0100 (CET)
Received: from localhost ([::1]:37766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kecTi-0007G5-Tf
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 06:15:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kecPI-00023J-LO
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:10:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kecPE-00028D-Re
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605525044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R3n3NbysL1CyZFoxfLzlrfQINJJBTQDs6IDvrt+hiPg=;
 b=fZ/I4n6zgeZNldPfremxc10GR8vOjMtEdTiBh6qYrnWk4m+5h2GagwkZvbf+X/yztPV0GI
 5E5NX5MziC3k+72q9WOkjuvZluskkTGwSQMH/EMxS0cpQZqjm5ICQLZiW9i6/Aq0HZbDXy
 h/vk0bj4lX1GYIHJhjSTCe7OIEZE7ik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-zeBfAev9M-iLIiJtVx5nRQ-1; Mon, 16 Nov 2020 06:10:42 -0500
X-MC-Unique: zeBfAev9M-iLIiJtVx5nRQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67687186DD26
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 11:10:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C9786EF58;
 Mon, 16 Nov 2020 11:10:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 35691A1EE; Mon, 16 Nov 2020 12:10:36 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/6] usb-storage: switch trace events
Date: Mon, 16 Nov 2020 12:10:31 +0100
Message-Id: <20201116111036.12820-2-kraxel@redhat.com>
In-Reply-To: <20201116111036.12820-1-kraxel@redhat.com>
References: <20201116111036.12820-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace most DPRINTF macros with trace events.
Drop some DPRINTF macros.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20201105134112.25119-2-kraxel@redhat.com
---
 hw/usb/dev-storage.c | 42 +++++++++++++++++-------------------------
 hw/usb/trace-events  | 12 ++++++++++++
 2 files changed, 29 insertions(+), 25 deletions(-)

diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index 648340323f68..e317cde8fd48 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -23,16 +23,10 @@
 #include "qapi/visitor.h"
 #include "qemu/cutils.h"
 #include "qom/object.h"
+#include "trace.h"
 
 //#define DEBUG_MSD
 
-#ifdef DEBUG_MSD
-#define DPRINTF(fmt, ...) \
-do { printf("usb-msd: " fmt , ## __VA_ARGS__); } while (0)
-#else
-#define DPRINTF(fmt, ...) do {} while(0)
-#endif
-
 /* USB requests.  */
 #define MassStorageReset  0xff
 #define GetMaxLun         0xfe
@@ -245,8 +239,8 @@ static void usb_msd_send_status(MSDState *s, USBPacket *p)
 {
     int len;
 
-    DPRINTF("Command status %d tag 0x%x, len %zd\n",
-            s->csw.status, le32_to_cpu(s->csw.tag), p->iov.size);
+    trace_usb_msd_send_status(s->csw.status, le32_to_cpu(s->csw.tag),
+                              p->iov.size);
 
     assert(s->csw.sig == cpu_to_le32(0x53425355));
     len = MIN(sizeof(s->csw), p->iov.size);
@@ -261,7 +255,7 @@ static void usb_msd_packet_complete(MSDState *s)
     /* Set s->packet to NULL before calling usb_packet_complete
        because another request may be issued before
        usb_packet_complete returns.  */
-    DPRINTF("Packet complete %p\n", p);
+    trace_usb_msd_packet_complete();
     s->packet = NULL;
     usb_packet_complete(&s->dev, p);
 }
@@ -289,7 +283,7 @@ static void usb_msd_command_complete(SCSIRequest *req, uint32_t status, size_t r
     MSDState *s = DO_UPCAST(MSDState, dev.qdev, req->bus->qbus.parent);
     USBPacket *p = s->packet;
 
-    DPRINTF("Command complete %d tag 0x%x\n", status, req->tag);
+    trace_usb_msd_cmd_complete(status, req->tag);
 
     s->csw.sig = cpu_to_le32(0x53425355);
     s->csw.tag = cpu_to_le32(req->tag);
@@ -331,6 +325,8 @@ static void usb_msd_request_cancelled(SCSIRequest *req)
 {
     MSDState *s = DO_UPCAST(MSDState, dev.qdev, req->bus->qbus.parent);
 
+    trace_usb_msd_cmd_cancel(req->tag);
+
     if (req == s->req) {
         scsi_req_unref(s->req);
         s->req = NULL;
@@ -342,7 +338,7 @@ static void usb_msd_handle_reset(USBDevice *dev)
 {
     MSDState *s = (MSDState *)dev;
 
-    DPRINTF("Reset\n");
+    trace_usb_msd_reset();
     if (s->req) {
         scsi_req_cancel(s->req);
     }
@@ -388,7 +384,7 @@ static void usb_msd_handle_control(USBDevice *dev, USBPacket *p,
             }
             maxlun++;
         }
-        DPRINTF("MaxLun %d\n", maxlun);
+        trace_usb_msd_maxlun(maxlun);
         data[0] = maxlun;
         p->actual_length = 1;
         break;
@@ -436,7 +432,6 @@ static void usb_msd_handle_data(USBDevice *dev, USBPacket *p)
                              le32_to_cpu(cbw.sig));
                 goto fail;
             }
-            DPRINTF("Command on LUN %d\n", cbw.lun);
             scsi_dev = scsi_device_find(&s->bus, 0, 0, cbw.lun);
             if (scsi_dev == NULL) {
                 error_report("usb-msd: Bad LUN %d", cbw.lun);
@@ -451,8 +446,8 @@ static void usb_msd_handle_data(USBDevice *dev, USBPacket *p)
             } else {
                 s->mode = USB_MSDM_DATAOUT;
             }
-            DPRINTF("Command tag 0x%x flags %08x len %d data %d\n",
-                    tag, cbw.flags, cbw.cmd_len, s->data_len);
+            trace_usb_msd_cmd_submit(cbw.lun, tag, cbw.flags,
+                                     cbw.cmd_len, s->data_len);
             assert(le32_to_cpu(s->csw.residue) == 0);
             s->scsi_len = 0;
             s->req = scsi_req_new(scsi_dev, tag, cbw.lun, cbw.cmd, NULL);
@@ -466,7 +461,7 @@ static void usb_msd_handle_data(USBDevice *dev, USBPacket *p)
             break;
 
         case USB_MSDM_DATAOUT:
-            DPRINTF("Data out %zd/%d\n", p->iov.size, s->data_len);
+            trace_usb_msd_data_out(p->iov.size, s->data_len);
             if (p->iov.size > s->data_len) {
                 goto fail;
             }
@@ -488,14 +483,13 @@ static void usb_msd_handle_data(USBDevice *dev, USBPacket *p)
                 }
             }
             if (p->actual_length < p->iov.size) {
-                DPRINTF("Deferring packet %p [wait data-out]\n", p);
+                trace_usb_msd_packet_async();
                 s->packet = p;
                 p->status = USB_RET_ASYNC;
             }
             break;
 
         default:
-            DPRINTF("Unexpected write (len %zd)\n", p->iov.size);
             goto fail;
         }
         break;
@@ -510,6 +504,7 @@ static void usb_msd_handle_data(USBDevice *dev, USBPacket *p)
                 goto fail;
             }
             /* Waiting for SCSI write to complete.  */
+            trace_usb_msd_packet_async();
             s->packet = p;
             p->status = USB_RET_ASYNC;
             break;
@@ -521,7 +516,7 @@ static void usb_msd_handle_data(USBDevice *dev, USBPacket *p)
 
             if (s->req) {
                 /* still in flight */
-                DPRINTF("Deferring packet %p [wait status]\n", p);
+                trace_usb_msd_packet_async();
                 s->packet = p;
                 p->status = USB_RET_ASYNC;
             } else {
@@ -531,8 +526,7 @@ static void usb_msd_handle_data(USBDevice *dev, USBPacket *p)
             break;
 
         case USB_MSDM_DATAIN:
-            DPRINTF("Data in %zd/%d, scsi_len %d\n",
-                    p->iov.size, s->data_len, s->scsi_len);
+            trace_usb_msd_data_in(p->iov.size, s->data_len, s->scsi_len);
             if (s->scsi_len) {
                 usb_msd_copy_data(s, p);
             }
@@ -550,20 +544,18 @@ static void usb_msd_handle_data(USBDevice *dev, USBPacket *p)
                 }
             }
             if (p->actual_length < p->iov.size && s->mode == USB_MSDM_DATAIN) {
-                DPRINTF("Deferring packet %p [wait data-in]\n", p);
+                trace_usb_msd_packet_async();
                 s->packet = p;
                 p->status = USB_RET_ASYNC;
             }
             break;
 
         default:
-            DPRINTF("Unexpected read (len %zd)\n", p->iov.size);
             goto fail;
         }
         break;
 
     default:
-        DPRINTF("Bad token\n");
     fail:
         p->status = USB_RET_STALL;
         break;
diff --git a/hw/usb/trace-events b/hw/usb/trace-events
index a3292d46248f..38e05fc7f4db 100644
--- a/hw/usb/trace-events
+++ b/hw/usb/trace-events
@@ -252,6 +252,18 @@ usb_hub_attach(int addr, int nr) "dev %d, port %d"
 usb_hub_detach(int addr, int nr) "dev %d, port %d"
 usb_hub_status_report(int addr, int status) "dev %d, status 0x%x"
 
+# dev-storage.c
+usb_msd_reset(void) ""
+usb_msd_maxlun(unsigned maxlun) "%d"
+usb_msd_send_status(unsigned status, unsigned tag, size_t size) "status %d, tag 0x%x, len %zd"
+usb_msd_data_in(unsigned packet, unsigned remaining, unsigned total) "%d/%d (scsi %d)"
+usb_msd_data_out(unsigned packet, unsigned remaining) "%d/%d"
+usb_msd_packet_async(void) ""
+usb_msd_packet_complete(void) ""
+usb_msd_cmd_submit(unsigned lun, unsigned tag, unsigned flags, unsigned len, unsigned data_len) "lun %u, tag 0x%x, flags 0x%08x, len %d, data-len %d"
+usb_msd_cmd_complete(unsigned status, unsigned tag) "status %d, tag 0x%x"
+usb_msd_cmd_cancel(unsigned tag) "tag 0x%x"
+
 # dev-uas.c
 usb_uas_reset(int addr) "dev %d"
 usb_uas_command(int addr, uint16_t tag, int lun, uint32_t lun64_1, uint32_t lun64_2) "dev %d, tag 0x%x, lun %d, lun64 0x%08x-0x%08x"
-- 
2.27.0


