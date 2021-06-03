Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19251399F34
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 12:43:36 +0200 (CEST)
Received: from localhost ([::1]:49192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lokp5-0000n6-25
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 06:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loknR-0006Y7-HZ
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 06:41:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loknO-0007pf-RY
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 06:41:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622716910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y3UMpXCncniSOWDV8V/g8EmeW8WrqTc482DfhD9JHiY=;
 b=DtV2KJT1OQBl0GGZwycOzHRo7CPuE6xN3agNeHkox+L526KzYQ1BTs4/41SgcS5UZHCssj
 JBnTBJmKLFKmwgMDm/vd5N7y41REd0CvBy4Kme44XinWVtckzfHOECQpSWPupeW/Ekqx1L
 i1IOaghZqvqKmZLNBZix8cW1bAUrxBI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-yoTHtjk2PoqjW3XmiLbVpA-1; Thu, 03 Jun 2021 06:41:48 -0400
X-MC-Unique: yoTHtjk2PoqjW3XmiLbVpA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1585F107ACE3;
 Thu,  3 Jun 2021 10:41:47 +0000 (UTC)
Received: from thuth.com (ovpn-112-76.ams2.redhat.com [10.36.112.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80A9D5D9F0;
 Thu,  3 Jun 2021 10:41:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/hyperv/vmbus: Make vmstate_vmbus_dev static
Date: Thu,  3 Jun 2021 12:41:39 +0200
Message-Id: <20210603104139.556512-3-thuth@redhat.com>
In-Reply-To: <20210603104139.556512-1-thuth@redhat.com>
References: <20210603104139.556512-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>,
 Jon Doron <arilou@gmail.com>, Roman Kagan <rkagan@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vmstate_vmbus_dev is only used in vmbus.c, no need to export this
via the vmbus.h header file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/hyperv/vmbus.c         | 28 ++++++++++++++--------------
 include/hw/hyperv/vmbus.h |  3 ---
 2 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
index 2384103cb0..f05e419682 100644
--- a/hw/hyperv/vmbus.c
+++ b/hw/hyperv/vmbus.c
@@ -2438,6 +2438,20 @@ static void vmbus_dev_unrealize(DeviceState *dev)
     free_channels(vdev);
 }
 
+static const VMStateDescription vmstate_vmbus_dev = {
+    .name = TYPE_VMBUS_DEVICE,
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8_ARRAY(instanceid.data, VMBusDevice, 16),
+        VMSTATE_UINT16(num_channels, VMBusDevice),
+        VMSTATE_STRUCT_VARRAY_POINTER_UINT16(channels, VMBusDevice,
+                                             num_channels, vmstate_channel,
+                                             VMBusChannel),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static void vmbus_dev_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *kdev = DEVICE_CLASS(klass);
@@ -2464,20 +2478,6 @@ static void vmbus_dev_instance_init(Object *obj)
     }
 }
 
-const VMStateDescription vmstate_vmbus_dev = {
-    .name = TYPE_VMBUS_DEVICE,
-    .version_id = 0,
-    .minimum_version_id = 0,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINT8_ARRAY(instanceid.data, VMBusDevice, 16),
-        VMSTATE_UINT16(num_channels, VMBusDevice),
-        VMSTATE_STRUCT_VARRAY_POINTER_UINT16(channels, VMBusDevice,
-                                             num_channels, vmstate_channel,
-                                             VMBusChannel),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
 /* vmbus generic device base */
 static const TypeInfo vmbus_dev_type_info = {
     .name = TYPE_VMBUS_DEVICE,
diff --git a/include/hw/hyperv/vmbus.h b/include/hw/hyperv/vmbus.h
index f98bea3888..7fab984e62 100644
--- a/include/hw/hyperv/vmbus.h
+++ b/include/hw/hyperv/vmbus.h
@@ -13,7 +13,6 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/dma.h"
 #include "hw/qdev-core.h"
-#include "migration/vmstate.h"
 #include "hw/hyperv/vmbus-proto.h"
 #include "qemu/uuid.h"
 #include "qom/object.h"
@@ -85,8 +84,6 @@ struct VMBusDevice {
     AddressSpace *dma_as;
 };
 
-extern const VMStateDescription vmstate_vmbus_dev;
-
 /*
  * A unit of work parsed out of a message in the receive (i.e. guest->host)
  * ring buffer of a channel.  It's supposed to be subclassed (through
-- 
2.27.0


