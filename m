Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E6325B692
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 00:46:28 +0200 (CEST)
Received: from localhost ([::1]:48228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDbWN-0005oC-O0
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 18:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbTn-0001Dl-2J
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 18:43:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbTl-0008HS-CW
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 18:43:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599086624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WXJ/b0LkDVNKrk5vHQjxjP6R69KmWMuMwiYPAGzJ5gM=;
 b=PoZuveSqSJOQo+8P0CMO9tzPbFbHlkId/yy1R1cLjgR9dUY04EjtKtlicCC7HQTonNjuoo
 6Qm1FiCrR+IKxnqTJXnH0cQcrocl78+T/SpbJ9YlN1IRv/vnOdQ+4yZr95IicUvNnAn0/Y
 PTm8hX9UncjDprvmVP/DP6RdaqCx9/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-1cciWdVGP4mQP_vem-JdZg-1; Wed, 02 Sep 2020 18:43:40 -0400
X-MC-Unique: 1cciWdVGP4mQP_vem-JdZg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2F651074642;
 Wed,  2 Sep 2020 22:43:38 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BBB61045EAF;
 Wed,  2 Sep 2020 22:43:33 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/63] ap-device: Rename AP_DEVICE_TYPE to TYPE_AP_DEVICE
Date: Wed,  2 Sep 2020 18:42:13 -0400
Message-Id: <20200902224311.1321159-6-ehabkost@redhat.com>
In-Reply-To: <20200902224311.1321159-1-ehabkost@redhat.com>
References: <20200902224311.1321159-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:42:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, Pierre Morel <pmorel@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will make the type name constant consistent with the name of
the type checking macro.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Tony Krowiak <akrowiak@linux.ibm.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Pierre Morel <pmorel@linux.ibm.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: David Hildenbrand <david@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org
---
 include/hw/s390x/ap-device.h | 4 ++--
 hw/s390x/ap-device.c         | 2 +-
 hw/vfio/ap.c                 | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/hw/s390x/ap-device.h b/include/hw/s390x/ap-device.h
index fb250a20f3..e502745de5 100644
--- a/include/hw/s390x/ap-device.h
+++ b/include/hw/s390x/ap-device.h
@@ -14,7 +14,7 @@
 #include "hw/qdev-core.h"
 #include "qom/object.h"
 
-#define AP_DEVICE_TYPE       "ap-device"
+#define TYPE_AP_DEVICE       "ap-device"
 
 struct APDevice {
     DeviceState parent_obj;
@@ -22,6 +22,6 @@ struct APDevice {
 typedef struct APDevice APDevice;
 
 DECLARE_INSTANCE_CHECKER(APDevice, AP_DEVICE,
-                         AP_DEVICE_TYPE)
+                         TYPE_AP_DEVICE)
 
 #endif /* HW_S390X_AP_DEVICE_H */
diff --git a/hw/s390x/ap-device.c b/hw/s390x/ap-device.c
index fc0b41e937..237d1f19c5 100644
--- a/hw/s390x/ap-device.c
+++ b/hw/s390x/ap-device.c
@@ -21,7 +21,7 @@ static void ap_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo ap_device_info = {
-    .name = AP_DEVICE_TYPE,
+    .name = TYPE_AP_DEVICE,
     .parent = TYPE_DEVICE,
     .instance_size = sizeof(APDevice),
     .class_size = sizeof(DeviceClass),
diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
index f399ec0a31..68ed059b39 100644
--- a/hw/vfio/ap.c
+++ b/hw/vfio/ap.c
@@ -177,7 +177,7 @@ static void vfio_ap_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo vfio_ap_info = {
     .name = VFIO_AP_DEVICE_TYPE,
-    .parent = AP_DEVICE_TYPE,
+    .parent = TYPE_AP_DEVICE,
     .instance_size = sizeof(VFIOAPDevice),
     .class_init = vfio_ap_class_init,
 };
-- 
2.26.2


