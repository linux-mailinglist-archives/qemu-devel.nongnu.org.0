Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3055029F7FC
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 23:29:03 +0100 (CET)
Received: from localhost ([::1]:48548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYGPm-00030r-9J
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 18:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kYG1h-0003we-TQ
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 18:04:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kYG1b-0006fX-SS
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 18:04:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604009042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TY3hhWOxXf4gzliy28PYdxe6IxkZamp50gu0DtVbhdQ=;
 b=GVTOMFMQMYJOcygmwYj2S2oQxGDHBxMmhEbE7GKXh6QfN/k2Mx6U1qu+FEZqS508Y/XQ08
 LLpyk15MndsPtztZVsDosYrzxAgi9q4ErkfHjRcIUPRFMUIT8uDIVxVNgcmu7EMVRpYt11
 gTdrmm7J4wN0eyX4Dv8Gb5sQj1WJGwc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-qv9bIFjzNU-6VbrIZ6JsfQ-1; Thu, 29 Oct 2020 18:04:00 -0400
X-MC-Unique: qv9bIFjzNU-6VbrIZ6JsfQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4DE09CC02
 for <qemu-devel@nongnu.org>; Thu, 29 Oct 2020 22:03:59 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70BC86EF68;
 Thu, 29 Oct 2020 22:03:59 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 33/36] tests: Use static properties at check-qom-proplist test
 case
Date: Thu, 29 Oct 2020 18:02:43 -0400
Message-Id: <20201029220246.472693-34-ehabkost@redhat.com>
In-Reply-To: <20201029220246.472693-1-ehabkost@redhat.com>
References: <20201029220246.472693-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 01:47:28
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use static properties for the bool and string properties used at
check-qom-proplist.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 tests/check-qom-proplist.c | 61 +++++---------------------------------
 1 file changed, 8 insertions(+), 53 deletions(-)

diff --git a/tests/check-qom-proplist.c b/tests/check-qom-proplist.c
index 1b76581980..94ad6631c0 100644
--- a/tests/check-qom-proplist.c
+++ b/tests/check-qom-proplist.c
@@ -26,6 +26,8 @@
 #include "qemu/option.h"
 #include "qemu/config-file.h"
 #include "qom/object_interfaces.h"
+#include "qom/static-property.h"
+#include "qom/static-property-internal.h"
 
 
 #define TYPE_DUMMY "qemu-dummy"
@@ -68,24 +70,6 @@ struct DummyObjectClass {
 };
 
 
-static void dummy_set_bv(Object *obj,
-                         bool value,
-                         Error **errp)
-{
-    DummyObject *dobj = DUMMY_OBJECT(obj);
-
-    dobj->bv = value;
-}
-
-static bool dummy_get_bv(Object *obj,
-                         Error **errp)
-{
-    DummyObject *dobj = DUMMY_OBJECT(obj);
-
-    return dobj->bv;
-}
-
-
 static void dummy_set_av(Object *obj,
                          int value,
                          Error **errp)
@@ -103,39 +87,20 @@ static int dummy_get_av(Object *obj,
     return dobj->av;
 }
 
+static Property bv_prop =
+    DEFINE_PROP_BOOL("bv", DummyObject, bv, false);
 
-static void dummy_set_sv(Object *obj,
-                         const char *value,
-                         Error **errp)
-{
-    DummyObject *dobj = DUMMY_OBJECT(obj);
-
-    g_free(dobj->sv);
-    dobj->sv = g_strdup(value);
-}
-
-static char *dummy_get_sv(Object *obj,
-                          Error **errp)
-{
-    DummyObject *dobj = DUMMY_OBJECT(obj);
-
-    return g_strdup(dobj->sv);
-}
-
+static Property sv_prop =
+    DEFINE_PROP_STRING("sv", DummyObject, sv);
 
 static void dummy_init(Object *obj)
 {
-    object_property_add_bool(obj, "bv",
-                             dummy_get_bv,
-                             dummy_set_bv);
+    object_property_add_static(obj, &bv_prop, NULL);
 }
 
-
 static void dummy_class_init(ObjectClass *cls, void *data)
 {
-    object_class_property_add_str(cls, "sv",
-                                  dummy_get_sv,
-                                  dummy_set_sv);
+    object_class_property_add_static(cls, &sv_prop, NULL);
     object_class_property_add_enum(cls, "av",
                                    "DummyAnimal",
                                    &dummy_animal_map,
@@ -143,21 +108,11 @@ static void dummy_class_init(ObjectClass *cls, void *data)
                                    dummy_set_av);
 }
 
-
-static void dummy_finalize(Object *obj)
-{
-    DummyObject *dobj = DUMMY_OBJECT(obj);
-
-    g_free(dobj->sv);
-}
-
-
 static const TypeInfo dummy_info = {
     .name          = TYPE_DUMMY,
     .parent        = TYPE_OBJECT,
     .instance_size = sizeof(DummyObject),
     .instance_init = dummy_init,
-    .instance_finalize = dummy_finalize,
     .class_size = sizeof(DummyObjectClass),
     .class_init = dummy_class_init,
     .interfaces = (InterfaceInfo[]) {
-- 
2.28.0


