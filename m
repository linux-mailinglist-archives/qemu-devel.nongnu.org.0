Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53372B1152
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 23:21:14 +0100 (CET)
Received: from localhost ([::1]:36048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdKxt-0004rp-RW
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 17:21:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKR8-0008NZ-9u
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:47:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKR1-0003kW-NS
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:47:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605217635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VQz84vMvQIIjiq4ifmE0IMvZDS24LI1ngCKhfV5ooUA=;
 b=hmmIEG+F1GXaM3BuAaueVImAyoSmEJ0WKG0m5lMXQxWBW8hmL9BJ+w9fi60B8BtyTxa23y
 GqeUojPN4vt5P5cGItff4KeyarAZ50lD1RObnxqEIoagKW992ED3Zv1gHSxbPqLNxv9ca7
 ism/4l9+CgsVK1FXwxrBbCm5fQGJJnI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-JlNz9ZXtPx6KH2P1xpe6uQ-1; Thu, 12 Nov 2020 16:47:13 -0500
X-MC-Unique: JlNz9ZXtPx6KH2P1xpe6uQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A17C107464A;
 Thu, 12 Nov 2020 21:47:12 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CAAE5C1C2;
 Thu, 12 Nov 2020 21:47:07 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 47/53] qom: Include static property API reference in
 documentation
Date: Thu, 12 Nov 2020 16:43:44 -0500
Message-Id: <20201112214350.872250-48-ehabkost@redhat.com>
In-Reply-To: <20201112214350.872250-1-ehabkost@redhat.com>
References: <20201112214350.872250-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

Include the static-properties.h API reference in
docs/devel/qom.rst.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v2 -> v3:
* Redone patch after changes in previous patches in the series
* Split into separate patches.  This one only adds the file to
  qom.rst and Property/PropertyInfo doc comments.  Another patch
  will add the documentation for DEFINE_PROP_* and PROP_*.

Changes v1 -> v2:
* Redone patch after changes in previous patches in the series
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 docs/devel/qom.rst           | 17 +++++++++++++-
 include/qom/field-property.h | 45 ++++++++++++++++++++++++++++++------
 include/qom/property-types.h |  2 +-
 3 files changed, 55 insertions(+), 9 deletions(-)

diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
index 42d0dc4f4d..9e43aa46f2 100644
--- a/docs/devel/qom.rst
+++ b/docs/devel/qom.rst
@@ -376,6 +376,21 @@ the OBJECT_DEFINE_ABSTRACT_TYPE() macro can be used instead:
 
 
 API Reference
--------------
+=============
+
+Core QOM API Reference
+----------------------
 
 .. kernel-doc:: include/qom/object.h
+
+
+Field Property API Reference
+----------------------------
+
+.. kernel-doc:: include/qom/field-property.h
+
+
+Property Types Reference
+------------------------
+
+.. kernel-doc:: include/qom/property-types.h
diff --git a/include/qom/field-property.h b/include/qom/field-property.h
index 91e7a43165..419e5eef75 100644
--- a/include/qom/field-property.h
+++ b/include/qom/field-property.h
@@ -8,15 +8,14 @@
 #include "qapi/util.h"
 
 /**
- * Property:
- * @set_default: true if the default value should be set from @defval,
- *    in which case @info->set_default_value must not be NULL
- *    (if false then no default value is set by the property system
- *     and the field retains whatever value it was given by instance_init).
- * @defval: default value for the property. This is used only if @set_default
- *     is true.
+ * struct Property: definition of a field property
+ *
+ * Field properties are used to read and write fields in object
+ * instance structs.  Field properties are defined using
+ * ``PROP_<type>`` or ``DEFINE_PROP_<type>``.
  */
 struct Property {
+    /* private: */
     /**
      * @name_template: Property name template
      *
@@ -28,27 +27,59 @@ struct Property {
     const PropertyInfo *info;
     ptrdiff_t    offset;
     uint8_t      bitnr;
+    /**
+     * @set_default: true if the default value should be set from @defval,
+     *    in which case @info->set_default_value must not be NULL
+     *    (if false then no default value is set by the property system
+     *     and the field retains whatever value it was given by instance_init).
+     */
     bool         set_default;
+    /**
+     * @defval: default value for the property. This is used only if @set_default
+     *     is true.
+     */
     union {
         int64_t i;
         uint64_t u;
     } defval;
+    /* private: */
     int          arrayoffset;
     const PropertyInfo *arrayinfo;
     int          arrayfieldsize;
     const char   *link_type;
 };
 
+/**
+ * struct PropertyInfo: information on a specific QOM property type
+ */
 struct PropertyInfo {
+    /** @name: property type name */
     const char *name;
+    /** @description: Description for help text */
     const char *description;
+    /** @enum_table: Used by field_prop_get_enum() and field_prop_set_enum() */
     const QEnumLookup *enum_table;
+    /** @print: String formatting function, for the human monitor */
     int (*print)(Object *obj, Property *prop, char *dest, size_t len);
+    /** @set_default_value: Callback for initializing the default value */
     void (*set_default_value)(ObjectProperty *op, const Property *prop);
+    /** @create: Optional callback for creation of property */
     ObjectProperty *(*create)(ObjectClass *oc, const char *name,
                               Property *prop);
+    /**
+     * @get: Property getter.  The opaque parameter will point to
+     *        the &Property struct for the property.
+     */
     ObjectPropertyAccessor *get;
+    /**
+     * @set: Property setter.  The opaque parameter will point to
+     *        the &Property struct for the property.
+     */
     ObjectPropertyAccessor *set;
+    /**
+     * @release: Optional release function, called when the object
+     * is destroyed
+     */
     ObjectPropertyRelease *release;
 };
 
diff --git a/include/qom/property-types.h b/include/qom/property-types.h
index 0aff0d9474..46c82da4e3 100644
--- a/include/qom/property-types.h
+++ b/include/qom/property-types.h
@@ -71,7 +71,7 @@ extern const PropertyInfo prop_info_link;
  * @_name: name of the array
  * @_state: name of the device state structure type
  * @_field: uint32_t field in @_state to hold the array length
- * @_arrayfield: field in @_state (of type '@_arraytype *') which
+ * @_arrayfield: field in @_state (of type ``_arraytype *``) which
  *               will point to the array
  * @_arrayprop: PropertyInfo defining what property the array elements have
  * @_arraytype: C type of the array elements
-- 
2.28.0


