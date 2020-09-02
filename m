Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2772125B699
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 00:48:26 +0200 (CEST)
Received: from localhost ([::1]:56598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDbYH-0000or-6O
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 18:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbTx-0001cS-QG
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 18:43:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbTv-0008JD-Rg
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 18:43:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599086635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I5oINIvJ6g0gJtBhiodyhTj34EeSSzAlhxZdmmgOA5c=;
 b=SjRNOa5rqIg3J60zq2nt3nnWwwZY4VgCd2CE7OXXioqwJX5jZCCDqOO3HqKUqsWMkJvPrw
 8ktJMqUpPShR/muGQRDc/qKjacjG50h1daMoWIm5pwXsZ9vn7VTNbWf+LoSj5ThfgxPR9x
 b+2A35Sfus45mlBnnffDgOqs/romhY8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-ZOXGs3vEN9WrMvlSIIWtyw-1; Wed, 02 Sep 2020 18:43:53 -0400
X-MC-Unique: ZOXGs3vEN9WrMvlSIIWtyw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FF331DE00
 for <qemu-devel@nongnu.org>; Wed,  2 Sep 2020 22:43:52 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 168571C4;
 Wed,  2 Sep 2020 22:43:49 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/63] vmcoreinfo: Rename VMCOREINFO_DEVICE to TYPE_VMCOREINFO
Date: Wed,  2 Sep 2020 18:42:17 -0400
Message-Id: <20200902224311.1321159-10-ehabkost@redhat.com>
In-Reply-To: <20200902224311.1321159-1-ehabkost@redhat.com>
References: <20200902224311.1321159-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will make the type name constant consistent with the name of
the type checking macro.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org
---
 include/hw/misc/vmcoreinfo.h | 6 +++---
 hw/misc/vmcoreinfo.c         | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/hw/misc/vmcoreinfo.h b/include/hw/misc/vmcoreinfo.h
index ebada6617a..6e523c3892 100644
--- a/include/hw/misc/vmcoreinfo.h
+++ b/include/hw/misc/vmcoreinfo.h
@@ -16,10 +16,10 @@
 #include "standard-headers/linux/qemu_fw_cfg.h"
 #include "qom/object.h"
 
-#define VMCOREINFO_DEVICE "vmcoreinfo"
+#define TYPE_VMCOREINFO "vmcoreinfo"
 typedef struct VMCoreInfoState VMCoreInfoState;
 DECLARE_INSTANCE_CHECKER(VMCoreInfoState, VMCOREINFO,
-                         VMCOREINFO_DEVICE)
+                         TYPE_VMCOREINFO)
 
 typedef struct fw_cfg_vmcoreinfo FWCfgVMCoreInfo;
 
@@ -33,7 +33,7 @@ struct VMCoreInfoState {
 /* returns NULL unless there is exactly one device */
 static inline VMCoreInfoState *vmcoreinfo_find(void)
 {
-    Object *o = object_resolve_path_type("", VMCOREINFO_DEVICE, NULL);
+    Object *o = object_resolve_path_type("", TYPE_VMCOREINFO, NULL);
 
     return o ? VMCOREINFO(o) : NULL;
 }
diff --git a/hw/misc/vmcoreinfo.c b/hw/misc/vmcoreinfo.c
index a9d718fc23..a68e3ad68c 100644
--- a/hw/misc/vmcoreinfo.c
+++ b/hw/misc/vmcoreinfo.c
@@ -47,13 +47,13 @@ static void vmcoreinfo_realize(DeviceState *dev, Error **errp)
      */
     if (!vmcoreinfo_find()) {
         error_setg(errp, "at most one %s device is permitted",
-                   VMCOREINFO_DEVICE);
+                   TYPE_VMCOREINFO);
         return;
     }
 
     if (!fw_cfg || !fw_cfg->dma_enabled) {
         error_setg(errp, "%s device requires fw_cfg with DMA",
-                   VMCOREINFO_DEVICE);
+                   TYPE_VMCOREINFO);
         return;
     }
 
@@ -94,7 +94,7 @@ static void vmcoreinfo_device_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo vmcoreinfo_device_info = {
-    .name          = VMCOREINFO_DEVICE,
+    .name          = TYPE_VMCOREINFO,
     .parent        = TYPE_DEVICE,
     .instance_size = sizeof(VMCoreInfoState),
     .class_init    = vmcoreinfo_device_class_init,
-- 
2.26.2


