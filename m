Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270612B10F6
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 23:05:15 +0100 (CET)
Received: from localhost ([::1]:52176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdKiQ-0004NC-3y
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 17:05:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKP4-0005wV-86
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:45:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKP2-0003H1-42
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:45:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605217509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IjXLNzryal4KWXA/thVCt00XPDIwSnxo4OtC/UV3xq4=;
 b=HZWBLSp3nCdjqNIguinthgZrLHg2esOfR2wi/0ZYhIHAkjr0IIkLHMNc6thISwO7qENYQB
 3xUPW8Mi2YKwvOGXy4LzYuqNogUT7rR912+hd8bBH4iHI0n4/3PG3Q0ja9Uu0FsJUirCmK
 cPn5hN4L3heAXSy2p9G7j0Aog+JQXIs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-zfjucTHyMASxtzyBO-qccg-1; Thu, 12 Nov 2020 16:45:08 -0500
X-MC-Unique: zfjucTHyMASxtzyBO-qccg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2253880474B;
 Thu, 12 Nov 2020 21:45:07 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 968875D9CA;
 Thu, 12 Nov 2020 21:45:02 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/53] qdev: Make qdev_propinfo_get_uint16() static
Date: Thu, 12 Nov 2020 16:43:10 -0500
Message-Id: <20201112214350.872250-14-ehabkost@redhat.com>
In-Reply-To: <20201112214350.872250-1-ehabkost@redhat.com>
References: <20201112214350.872250-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are no users of the function outside qdev-properties.c.
Make function static and rename it to get_uint16().

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 hw/core/qdev-prop-internal.h | 2 --
 hw/core/qdev-properties.c    | 6 +++---
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/core/qdev-prop-internal.h b/hw/core/qdev-prop-internal.h
index 9cf5cc1d51..d7b77844fe 100644
--- a/hw/core/qdev-prop-internal.h
+++ b/hw/core/qdev-prop-internal.h
@@ -20,8 +20,6 @@ void qdev_propinfo_set_default_value_int(ObjectProperty *op,
 void qdev_propinfo_set_default_value_uint(ObjectProperty *op,
                                           const Property *prop);
 
-void qdev_propinfo_get_uint16(Object *obj, Visitor *v, const char *name,
-                              void *opaque, Error **errp);
 void qdev_propinfo_get_int32(Object *obj, Visitor *v, const char *name,
                              void *opaque, Error **errp);
 void qdev_propinfo_get_size32(Object *obj, Visitor *v, const char *name,
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 5e010afdb8..765e916c23 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -278,8 +278,8 @@ const PropertyInfo qdev_prop_uint8 = {
 
 /* --- 16bit integer --- */
 
-void qdev_propinfo_get_uint16(Object *obj, Visitor *v, const char *name,
-                              void *opaque, Error **errp)
+static void get_uint16(Object *obj, Visitor *v, const char *name,
+                       void *opaque, Error **errp)
 {
     Property *prop = opaque;
     uint16_t *ptr = qdev_get_prop_ptr(obj, prop);
@@ -304,7 +304,7 @@ static void set_uint16(Object *obj, Visitor *v, const char *name,
 
 const PropertyInfo qdev_prop_uint16 = {
     .name  = "uint16",
-    .get   = qdev_propinfo_get_uint16,
+    .get   = get_uint16,
     .set   = set_uint16,
     .set_default_value = qdev_propinfo_set_default_value_uint,
 };
-- 
2.28.0


