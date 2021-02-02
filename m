Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A727830C896
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 18:57:19 +0100 (CET)
Received: from localhost ([::1]:39506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6zvS-0005wV-NX
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 12:57:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6zle-00051U-O0
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:47:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6zlc-0008El-Kl
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:47:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612288028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=igXdpddoN154z3gheiDaIM2pkxAGZEJVxhZzCsNwTjc=;
 b=VRJHWMitfxGE+eV00yoCAuyWwgw95OGQbmGlYik4VA2x40ajRNY509mMl8l6iBRkuOoXp7
 lWQHO1utmeETTW7qncMD5azXj5KticNBUdf85T3KogfgpZQYm0BYmZW0gK4m4ph4hhJDJz
 ElVQo31ZmUFdPg63Q9iPJkDTQi4Ncgg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-ZaCI4Ga2P5KuNzYMJVPAcQ-1; Tue, 02 Feb 2021 12:47:05 -0500
X-MC-Unique: ZaCI4Ga2P5KuNzYMJVPAcQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A3AC106BAED;
 Tue,  2 Feb 2021 17:47:04 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4ECA65C1CF;
 Tue,  2 Feb 2021 17:47:03 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v4 12/14] qapi/introspect.py: add introspect.json dummy types
Date: Tue,  2 Feb 2021 12:46:49 -0500
Message-Id: <20210202174651.2274166-13-jsnow@redhat.com>
In-Reply-To: <20210202174651.2274166-1-jsnow@redhat.com>
References: <20210202174651.2274166-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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

Add some aliases that declare intent for some of the "dictly-typed"
objects we pass around in introspect.py.

Signed-off-by: John Snow <jsnow@redhat.com>

---

This patch is optional, it can be dropped if desired. It is purely for
the sake of demonstrating what the _DObject was meant to convey: a
Python Dict that represents some JSON Object. It does not add any type
safety in and of itself, but does have some (light) annotational
benefit. In this case, it's usually a specific data structure from the
QAPI Schema we are referencing, but do not have "compile-time" access to
in Python.

These are loosely typed and don't bother reproducing the exact structure
of the real types. Python 3.6 does not have support for TypedDict
structures, so this is as good as we can do without involving a
third-party library (e.g. Pydantic), in which we might be able to say:


class SchemaMetaType(str, enum.Enum):
    BUILTIN = "builtin"
    ENUM = "enum"
    ARRAY = "array"
    OBJECT = "object"
    ALTERNATE = "alternate"
    COMMAND = "command"
    EVENT = "event"


class SchemaInfo(pydantic.BaseModel):
    name: str
    meta-type: SchemaMetaType
    features: Optional[List[str]]
    data: Union[SchemaInfoBuiltin, SchemaInfoEnum, SchemaInfoArray,
                SchemaInfoObject, SchemaInfoAlternate, SchemaInfoCommand,
                SchemaInfoEvent]


However, the cost of reproducing and keeping these structure definitions
in-sync between the user-defined portion of the schema and the code
generator is likely not worth doing any such thing. However, it does
illustrate an interesting dependency the generator has on the
user-defined schema itself in terms of types.

So, I settled on using some light types that suggest the form of the
object instead of enforcing the form.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/introspect.py | 49 ++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 18 deletions(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index b7f2a6cf260..eb5d34cdb42 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -66,8 +66,15 @@
 _value = Union[_scalar, _nonscalar]
 TreeValue = Union[_value, 'Annotated[_value]']
 
-# This is a (strict) alias for an arbitrary object non-scalar, as above:
-_DObject = Dict[str, object]
+# These types are based on structures defined in QEMU's schema, so we lack
+# precise types for them here. Python 3.6 does not offer TypedDict constructs,
+# so they are loosely typed here as simple python Dicts.
+SchemaInfo = Dict[str, object]
+SchemaInfoObject = Dict[str, object]
+SchemaInfoObjectVariant = Dict[str, object]
+SchemaInfoObjectMember = Dict[str, object]
+SchemaInfoCommand = Dict[str, object]
+
 
 _NodeT = TypeVar('_NodeT', bound=TreeValue)
 
@@ -160,7 +167,7 @@ def __init__(self, prefix: str, unmask: bool):
             ' * QAPI/QMP schema introspection', __doc__)
         self._unmask = unmask
         self._schema: Optional[QAPISchema] = None
-        self._trees: List[Annotated[_DObject]] = []
+        self._trees: List[Annotated[SchemaInfo]] = []
         self._used_types: List[QAPISchemaType] = []
         self._name_map: Dict[str, str] = {}
         self._genc.add(mcgen('''
@@ -232,9 +239,18 @@ def _gen_features(features: List[QAPISchemaFeature]
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
@@ -249,8 +265,8 @@ def _gen_tree(self, name: str, mtype: str, obj: _DObject,
         self._trees.append(Annotated(obj, ifcond, comment))
 
     def _gen_member(self, member: QAPISchemaObjectTypeMember
-                    ) -> Annotated[_DObject]:
-        obj: _DObject = {
+                    ) -> Annotated[SchemaInfoObjectMember]:
+        obj: SchemaInfoObjectMember = {
             'name': member.name,
             'type': self._use_type(member.type)
         }
@@ -260,13 +276,9 @@ def _gen_member(self, member: QAPISchemaObjectTypeMember
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
@@ -298,11 +310,12 @@ def visit_object_type_flat(self, name: str, info: Optional[QAPISourceInfo],
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
 
     def visit_alternate_type(self, name: str, info: Optional[QAPISourceInfo],
@@ -327,7 +340,7 @@ def visit_command(self, name: str, info: Optional[QAPISourceInfo],
 
         arg_type = arg_type or self._schema.the_empty_object_type
         ret_type = ret_type or self._schema.the_empty_object_type
-        obj: _DObject = {
+        obj: SchemaInfoCommand = {
             'arg-type': self._use_type(arg_type),
             'ret-type': self._use_type(ret_type)
         }
-- 
2.29.2


