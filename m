Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 513A62DCACB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 03:03:04 +0100 (CET)
Received: from localhost ([::1]:47030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpidD-0004hZ-Ao
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 21:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpiUT-00048o-7m
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:54:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpiUR-0006KA-AU
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:54:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608170038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vFZ9pyFEeriExnyWXREkdCUhynnKVqtGGoUWxl0nB6w=;
 b=Za8i2vSf7VC3PT3B/t7LP0ctclOcsw7Yv+P/r9ocMlu4fupV6U44SC2+TD2CFAN2w/YSQy
 L6sCETgQnBdrLlCAmx1pbL+8X/9bBSwmLlN1Btm70ipao+h2EsTMgIX+Qkq78azxxPWyxi
 nMLY8rYwhiWRpKpZ+IbLscxgy8egNpY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-bkuc4keiP029cYedkCBH3Q-1; Wed, 16 Dec 2020 20:53:56 -0500
X-MC-Unique: bkuc4keiP029cYedkCBH3Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F03FC107ACE3
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:53:55 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-131.rdu2.redhat.com [10.10.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50B3B60CC4;
 Thu, 17 Dec 2020 01:53:55 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 12/13] qapi/instrospect.py: add introspect.json dummy types
Date: Wed, 16 Dec 2020 20:53:42 -0500
Message-Id: <20201217015343.196279-13-jsnow@redhat.com>
In-Reply-To: <20201217015343.196279-1-jsnow@redhat.com>
References: <20201217015343.196279-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add some aliases that declare intent for some of the "dictly-typed"
objects we pass around in introspect.py.

Signed-off-by: John Snow <jsnow@redhat.com>

---

This patch is optional, it can be dropped if desired.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/introspect.py | 48 ++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 18 deletions(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 590898baf93..428397a6954 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -66,8 +66,14 @@
 _value = Union[_scalar, _nonscalar]
 TreeValue = Union[_value, 'Annotated[_value]']
 
-# This is a (strict) alias for an arbitrary object non-scalar, as above:
-_DObject = Dict[str, object]
+# We lack precise object types, so SchemaInfo, children, and related types are
+# typed here loosely as simply python Dicts.
+SchemaInfo = Dict[str, object]
+SchemaInfoObject = Dict[str, object]
+SchemaInfoObjectVariant = Dict[str, object]
+SchemaInfoObjectMember = Dict[str, object]
+SchemaInfoCommand = Dict[str, object]
+
 
 _NodeT = TypeVar('_NodeT', bound=TreeValue)
 
@@ -160,7 +166,7 @@ def __init__(self, prefix: str, unmask: bool):
             ' * QAPI/QMP schema introspection', __doc__)
         self._unmask = unmask
         self._schema: Optional[QAPISchema] = None
-        self._trees: List[Annotated[_DObject]] = []
+        self._trees: List[Annotated[SchemaInfo]] = []
         self._used_types: List[QAPISchemaType] = []
         self._name_map: Dict[str, str] = {}
         self._genc.add(mcgen('''
@@ -232,9 +238,18 @@ def _gen_features(features: List[QAPISchemaFeature]
                       ) -> List[Annotated[str]]:
         return [Annotated(f.name, f.ifcond) for f in features]
 
-    def _gen_tree(self, name: str, mtype: str, obj: _DObject,
+    def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object],
                   ifcond: List[str],
                   features: Optional[List[QAPISchemaFeature]]) -> None:
+        """
+        Build and append a SchemaInfo object to self._trees.
+
+        :param name: The entity's name.
+        :param mtype: The entity's meta-type.
+        :param obj: Additional entity fields, as appropriate for the meta-type.
+        :param ifcond: List of conditionals that apply to this entire entity.
+        :param features: Optional features field for SchemaInfo.
+        """
         comment: Optional[str] = None
         if mtype not in ('command', 'event', 'builtin', 'array'):
             if not self._unmask:
@@ -249,8 +264,8 @@ def _gen_tree(self, name: str, mtype: str, obj: _DObject,
         self._trees.append(Annotated(obj, ifcond, comment))
 
     def _gen_member(self, member: QAPISchemaObjectTypeMember
-                    ) -> Annotated[_DObject]:
-        obj: _DObject = {
+                    ) -> Annotated[SchemaInfoObjectMember]:
+        obj: SchemaInfoObjectMember = {
             'name': member.name,
             'type': self._use_type(member.type)
         }
@@ -260,13 +275,9 @@ def _gen_member(self, member: QAPISchemaObjectTypeMember
             obj['features'] = self._gen_features(member.features)
         return Annotated(obj, member.ifcond)
 
-    def _gen_variants(self, tag_name: str,
-                      variants: List[QAPISchemaVariant]) -> _DObject:
-        return {'tag': tag_name,
-                'variants': [self._gen_variant(v) for v in variants]}
-
-    def _gen_variant(self, variant: QAPISchemaVariant) -> Annotated[_DObject]:
-        obj: _DObject = {
+    def _gen_variant(self, variant: QAPISchemaVariant
+                     ) -> Annotated[SchemaInfoObjectVariant]:
+        obj: SchemaInfoObjectVariant = {
             'case': variant.name,
             'type': self._use_type(variant.type)
         }
@@ -298,11 +309,12 @@ def visit_object_type_flat(self, name: str, info: QAPISourceInfo,
                                features: List[QAPISchemaFeature],
                                members: List[QAPISchemaObjectTypeMember],
                                variants: Optional[QAPISchemaVariants]) -> None:
-        obj: _DObject = {'members': [self._gen_member(m) for m in members]}
+        obj: SchemaInfoObject = {
+            'members': [self._gen_member(m) for m in members]
+        }
         if variants:
-            obj.update(self._gen_variants(variants.tag_member.name,
-                                          variants.variants))
-
+            obj['tag'] = variants.tag_member.name
+            obj['variants'] = [self._gen_variant(v) for v in variants.variants]
         self._gen_tree(name, 'object', obj, ifcond, features)
 
     def visit_alternate_type(self, name: str, info: QAPISourceInfo,
@@ -326,7 +338,7 @@ def visit_command(self, name: str, info: QAPISourceInfo, ifcond: List[str],
 
         arg_type = arg_type or self._schema.the_empty_object_type
         ret_type = ret_type or self._schema.the_empty_object_type
-        obj: _DObject = {
+        obj: SchemaInfoCommand = {
             'arg-type': self._use_type(arg_type),
             'ret-type': self._use_type(ret_type)
         }
-- 
2.26.2


