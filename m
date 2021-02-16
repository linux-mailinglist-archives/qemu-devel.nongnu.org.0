Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 282E231C5AA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 03:48:24 +0100 (CET)
Received: from localhost ([::1]:47248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBqPX-0007Dq-8j
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 21:48:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBpx0-0001xJ-4V
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:18:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBpwo-0003BH-Q2
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:18:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613441921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RvAM2p9Jnry+sfrZ7Q3u3rWfTFYXPxirwLNGlxvqK0Y=;
 b=NxSYZzI5nm+2jvq33W5B1l1W1nvCJ25+G2NPpzViYvJ357D2mEa9bYkmOdQnmEvbiMHFnr
 ojOa0m77dtA3gM0rCWFuOSlI8Y/h9cVJO+Do/2ysm1p8W2R4ZDEfdBC6J+XiHJPFmM9/i8
 EbBMzAjAf7+tcD/prITUc4DRqHi7Le0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-6Cq9WWAGMrKvXsbUn6VyYQ-1; Mon, 15 Feb 2021 21:18:37 -0500
X-MC-Unique: 6Cq9WWAGMrKvXsbUn6VyYQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E825518A08BD;
 Tue, 16 Feb 2021 02:18:36 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 145F210023AF;
 Tue, 16 Feb 2021 02:18:35 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v6 19/19] qapi/introspect.py: add SchemaMetaType enum
Date: Mon, 15 Feb 2021 21:18:09 -0500
Message-Id: <20210216021809.134886-20-jsnow@redhat.com>
In-Reply-To: <20210216021809.134886-1-jsnow@redhat.com>
References: <20210216021809.134886-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follows the qapi/introspect.py definition of the same; this adds a more
precise typing to _gen_tree's mtype parameter.

NB: print(SchemaMetaType.BUILTIN) would produce the string
"SchemaMetaType.BUILTIN", but when using format strings (.format or f-strings),
it relies on the __format__ method defined in the Enum class, which uses the
"value" of the enum instead, producing the string "builtin".

For consistency with old-style format strings (which simply call the
__str__ method of an object), a __str__ dunder is added, though it is
not actually used here in this code.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/introspect.py | 38 +++++++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index c6f5cf8d874..008a21f5c4c 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -11,6 +11,7 @@
 See the COPYING file in the top-level directory.
 """
 
+from enum import Enum
 from typing import (
     Any,
     Dict,
@@ -79,6 +80,23 @@
 SchemaInfoCommand = Dict[str, object]
 
 
+class SchemaMetaType(str, Enum):
+    """
+    Mimics the SchemaMetaType enum from qapi/introspect.json.
+    """
+    BUILTIN = 'builtin'
+    ENUM = 'enum'
+    ARRAY = 'array'
+    OBJECT = 'object'
+    ALTERNATE = 'alternate'
+    COMMAND = 'command'
+    EVENT = 'event'
+
+    def __str__(self) -> str:
+        # Needed for intuitive behavior with old-style format strings.
+        return str(self.value)
+
+
 _ValueT = TypeVar('_ValueT', bound=_Value)
 
 
@@ -251,7 +269,8 @@ def _gen_features(features: Sequence[QAPISchemaFeature]
                       ) -> List[Annotated[str]]:
         return [Annotated(f.name, f.ifcond) for f in features]
 
-    def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object],
+    def _gen_tree(self, name: str, mtype: SchemaMetaType,
+                  obj: Dict[str, object],
                   ifcond: Sequence[str] = (),
                   features: Sequence[QAPISchemaFeature] = ()) -> None:
         """
@@ -299,7 +318,7 @@ def _gen_variant(self, variant: QAPISchemaVariant
 
     def visit_builtin_type(self, name: str, info: Optional[QAPISourceInfo],
                            json_type: str) -> None:
-        self._gen_tree(name, 'builtin', {'json-type': json_type})
+        self._gen_tree(name, SchemaMetaType.BUILTIN, {'json-type': json_type})
 
     def visit_enum_type(self, name: str, info: Optional[QAPISourceInfo],
                         ifcond: Sequence[str],
@@ -307,7 +326,7 @@ def visit_enum_type(self, name: str, info: Optional[QAPISourceInfo],
                         members: List[QAPISchemaEnumMember],
                         prefix: Optional[str]) -> None:
         self._gen_tree(
-            name, 'enum',
+            name, SchemaMetaType.ENUM,
             {'values': [Annotated(m.name, m.ifcond) for m in members]},
             ifcond, features
         )
@@ -316,8 +335,8 @@ def visit_array_type(self, name: str, info: Optional[QAPISourceInfo],
                          ifcond: Sequence[str],
                          element_type: QAPISchemaType) -> None:
         element = self._use_type(element_type)
-        self._gen_tree('[' + element + ']', 'array', {'element-type': element},
-                       ifcond)
+        self._gen_tree('[' + element + ']', SchemaMetaType.ARRAY,
+                       {'element-type': element}, ifcond)
 
     def visit_object_type_flat(self, name: str, info: Optional[QAPISourceInfo],
                                ifcond: Sequence[str],
@@ -330,14 +349,14 @@ def visit_object_type_flat(self, name: str, info: Optional[QAPISourceInfo],
         if variants:
             obj['tag'] = variants.tag_member.name
             obj['variants'] = [self._gen_variant(v) for v in variants.variants]
-        self._gen_tree(name, 'object', obj, ifcond, features)
+        self._gen_tree(name, SchemaMetaType.OBJECT, obj, ifcond, features)
 
     def visit_alternate_type(self, name: str, info: Optional[QAPISourceInfo],
                              ifcond: Sequence[str],
                              features: List[QAPISchemaFeature],
                              variants: QAPISchemaVariants) -> None:
         self._gen_tree(
-            name, 'alternate',
+            name, SchemaMetaType.ALTERNATE,
             {'members': [Annotated({'type': self._use_type(m.type)},
                                    m.ifcond)
                          for m in variants.variants]},
@@ -361,7 +380,7 @@ def visit_command(self, name: str, info: Optional[QAPISourceInfo],
         }
         if allow_oob:
             obj['allow-oob'] = allow_oob
-        self._gen_tree(name, 'command', obj, ifcond, features)
+        self._gen_tree(name, SchemaMetaType.COMMAND, obj, ifcond, features)
 
     def visit_event(self, name: str, info: Optional[QAPISourceInfo],
                     ifcond: Sequence[str], features: List[QAPISchemaFeature],
@@ -370,7 +389,8 @@ def visit_event(self, name: str, info: Optional[QAPISourceInfo],
         assert self._schema is not None
 
         arg_type = arg_type or self._schema.the_empty_object_type
-        self._gen_tree(name, 'event', {'arg-type': self._use_type(arg_type)},
+        self._gen_tree(name, SchemaMetaType.EVENT,
+                       {'arg-type': self._use_type(arg_type)},
                        ifcond, features)
 
 
-- 
2.29.2


