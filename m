Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 018D12AF85A
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 19:43:33 +0100 (CET)
Received: from localhost ([::1]:39078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcv5f-00048z-Vv
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 13:43:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv0s-000086-OK
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:38:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv0r-0007vd-1z
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:38:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605119912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8eJzHFzqbv5EOvpAoO6eSnBp+9AaroA5js3IWE+oEvw=;
 b=ST81n269ayGa7+S/ltYAwAXuVE9DcwlezDja3cQBDM6HH85YD+naX2Gcq/y+WYqvu/U9rP
 NCqWFoMcGvwcZsPWa9wgGz3CYQj3uNWmhRPxi7KUDmI5W8BpFYnOXWHDBNDTTMa7d55228
 PzgkiAUyehqKjD+oRyjfADOq2p08bq8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-UO0rHCkWNBimK33DFyX8wg-1; Wed, 11 Nov 2020 13:38:30 -0500
X-MC-Unique: UO0rHCkWNBimK33DFyX8wg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4685D5F9D6
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 18:38:29 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB0655DA6A;
 Wed, 11 Nov 2020 18:38:28 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/12] tmp421: Register properties as class properties
Date: Wed, 11 Nov 2020 13:38:14 -0500
Message-Id: <20201111183823.283752-4-ehabkost@redhat.com>
In-Reply-To: <20201111183823.283752-1-ehabkost@redhat.com>
References: <20201111183823.283752-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John Snow <jsnow@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Class properties make QOM introspection simpler and easier, as
they don't require an object to be instantiated.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: qemu-devel@nongnu.org
---
 hw/misc/tmp421.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/hw/misc/tmp421.c b/hw/misc/tmp421.c
index ef3c682e32..a3db57dcb5 100644
--- a/hw/misc/tmp421.c
+++ b/hw/misc/tmp421.c
@@ -337,22 +337,6 @@ static void tmp421_realize(DeviceState *dev, Error **errp)
     tmp421_reset(&s->i2c);
 }
 
-static void tmp421_initfn(Object *obj)
-{
-    object_property_add(obj, "temperature0", "int",
-                        tmp421_get_temperature,
-                        tmp421_set_temperature, NULL, NULL);
-    object_property_add(obj, "temperature1", "int",
-                        tmp421_get_temperature,
-                        tmp421_set_temperature, NULL, NULL);
-    object_property_add(obj, "temperature2", "int",
-                        tmp421_get_temperature,
-                        tmp421_set_temperature, NULL, NULL);
-    object_property_add(obj, "temperature3", "int",
-                        tmp421_get_temperature,
-                        tmp421_set_temperature, NULL, NULL);
-}
-
 static void tmp421_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -365,6 +349,19 @@ static void tmp421_class_init(ObjectClass *klass, void *data)
     k->send = tmp421_tx;
     dc->vmsd = &vmstate_tmp421;
     sc->dev = (DeviceInfo *) data;
+
+    object_class_property_add(klass, "temperature0", "int",
+                              tmp421_get_temperature,
+                              tmp421_set_temperature, NULL, NULL);
+    object_class_property_add(klass, "temperature1", "int",
+                              tmp421_get_temperature,
+                              tmp421_set_temperature, NULL, NULL);
+    object_class_property_add(klass, "temperature2", "int",
+                              tmp421_get_temperature,
+                              tmp421_set_temperature, NULL, NULL);
+    object_class_property_add(klass, "temperature3", "int",
+                              tmp421_get_temperature,
+                              tmp421_set_temperature, NULL, NULL);
 }
 
 static const TypeInfo tmp421_info = {
@@ -372,7 +369,6 @@ static const TypeInfo tmp421_info = {
     .parent        = TYPE_I2C_SLAVE,
     .instance_size = sizeof(TMP421State),
     .class_size    = sizeof(TMP421Class),
-    .instance_init = tmp421_initfn,
     .abstract      = true,
 };
 
-- 
2.28.0


