Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6A725B68C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 00:45:23 +0200 (CEST)
Received: from localhost ([::1]:43242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDbVK-0003Xh-JA
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 18:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbU1-0001lp-Qd
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 18:44:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbU0-0008Jx-22
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 18:44:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599086639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Goj47Bu/6SLoRwjOZxfev0ioNtbqUlxNYirlYfcEFVE=;
 b=USNDIzCPHSbE3Vn+/rl7g6B/1O5Pv1jqN+hvkCliRTyxlgg1wo9m5JvkgF97NlFS116N/T
 PqeuoQEsxINAf8qatN9us1cP1uXDxnKmyLyFUov9z/EmRPbuh08h1oTN74GxVgJ71gxrf9
 m1TdUQAxEblztEjKeSmbjbMnzvzM0qA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-VHRcOWL0MDy_8T0fX2Ph1g-1; Wed, 02 Sep 2020 18:43:57 -0400
X-MC-Unique: VHRcOWL0MDy_8T0fX2Ph1g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61D1C1DE02;
 Wed,  2 Sep 2020 22:43:56 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 042815D9CC;
 Wed,  2 Sep 2020 22:43:52 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/63] vmgenid: Rename VMGENID_DEVICE to TYPE_VMGENID
Date: Wed,  2 Sep 2020 18:42:18 -0400
Message-Id: <20200902224311.1321159-11-ehabkost@redhat.com>
In-Reply-To: <20200902224311.1321159-1-ehabkost@redhat.com>
References: <20200902224311.1321159-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 17:54:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, berrange@redhat.com,
 Ben Warren <ben@skyportsystems.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will make the type name constant consistent with the name of
the type checking macro.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Ben Warren <ben@skyportsystems.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org
---
 include/hw/acpi/vmgenid.h | 6 +++---
 hw/acpi/vmgenid.c         | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/hw/acpi/vmgenid.h b/include/hw/acpi/vmgenid.h
index 86cd1da605..aff574df5f 100644
--- a/include/hw/acpi/vmgenid.h
+++ b/include/hw/acpi/vmgenid.h
@@ -6,7 +6,7 @@
 #include "qemu/uuid.h"
 #include "qom/object.h"
 
-#define VMGENID_DEVICE           "vmgenid"
+#define TYPE_VMGENID           "vmgenid"
 #define VMGENID_GUID             "guid"
 #define VMGENID_GUID_FW_CFG_FILE      "etc/vmgenid_guid"
 #define VMGENID_ADDR_FW_CFG_FILE      "etc/vmgenid_addr"
@@ -18,7 +18,7 @@
 
 typedef struct VmGenIdState VmGenIdState;
 DECLARE_INSTANCE_CHECKER(VmGenIdState, VMGENID,
-                         VMGENID_DEVICE)
+                         TYPE_VMGENID)
 
 struct VmGenIdState {
     DeviceClass parent_obj;
@@ -29,7 +29,7 @@ struct VmGenIdState {
 /* returns NULL unless there is exactly one device */
 static inline Object *find_vmgenid_dev(void)
 {
-    return object_resolve_path_type("", VMGENID_DEVICE, NULL);
+    return object_resolve_path_type("", TYPE_VMGENID, NULL);
 }
 
 void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
diff --git a/hw/acpi/vmgenid.c b/hw/acpi/vmgenid.c
index 2df7623d74..53db6af75d 100644
--- a/hw/acpi/vmgenid.c
+++ b/hw/acpi/vmgenid.c
@@ -198,7 +198,7 @@ static void vmgenid_realize(DeviceState *dev, Error **errp)
 
     if (!bios_linker_loader_can_write_pointer()) {
         error_setg(errp, "%s requires DMA write support in fw_cfg, "
-                   "which this machine type does not provide", VMGENID_DEVICE);
+                   "which this machine type does not provide", TYPE_VMGENID);
         return;
     }
 
@@ -206,7 +206,7 @@ static void vmgenid_realize(DeviceState *dev, Error **errp)
      * device. Check if there are several.
      */
     if (!find_vmgenid_dev()) {
-        error_setg(errp, "at most one %s device is permitted", VMGENID_DEVICE);
+        error_setg(errp, "at most one %s device is permitted", TYPE_VMGENID);
         return;
     }
 
@@ -232,7 +232,7 @@ static void vmgenid_device_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo vmgenid_device_info = {
-    .name          = VMGENID_DEVICE,
+    .name          = TYPE_VMGENID,
     .parent        = TYPE_DEVICE,
     .instance_size = sizeof(VmGenIdState),
     .class_init    = vmgenid_device_class_init,
-- 
2.26.2


