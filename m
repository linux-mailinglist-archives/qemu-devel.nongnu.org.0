Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BDE276069
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 20:48:18 +0200 (CEST)
Received: from localhost ([::1]:33226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kL9oP-0005hx-GJ
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 14:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kL9iE-0000KO-AC
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 14:41:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kL9iB-0002DO-TT
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 14:41:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600886511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rd+uuIzEv/rQad31KXmql6b1Oo0b+0+yD6+TLr6F1P4=;
 b=HuUlZFoRkLgn9+nCDms8H3Hg2eGQuIxU1uYm7cEVNn5O7DBOrAlsRbbr4vISlK8fELwJt4
 kioNJS78yOkmlF3qke6DicaGOGjm+QNuY4OJWJ5CsYpgMTgkaanEApNQerXR9BHK/wXgXU
 fscE5HMsKVczQTTl7/DxOvA7EwQW4hc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-SHj5JPVbMcKJ4M8A564QBw-1; Wed, 23 Sep 2020 14:41:26 -0400
X-MC-Unique: SHj5JPVbMcKJ4M8A564QBw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23D9D801AF7;
 Wed, 23 Sep 2020 18:41:25 +0000 (UTC)
Received: from localhost (unknown [10.10.67.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C42DE5576A;
 Wed, 23 Sep 2020 18:41:24 +0000 (UTC)
Date: Wed, 23 Sep 2020 14:41:24 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 32/38] qapi/introspect.py: create a typed 'Node' data
 structure
Message-ID: <20200923184124.GV3312949@habkost.net>
References: <20200922210101.4081073-1-jsnow@redhat.com>
 <20200922210101.4081073-33-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200922210101.4081073-33-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 22, 2020 at 05:00:55PM -0400, John Snow wrote:
> Replacing the un-typed tuple, add a typed Node that we can add typed
> metadata to.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

This is the most complex patch so far, and it's very hard to
understand what it does without type annotations.

Have you consider adding type annotations to the code before
patch 30/38 (even if using `object` in some parts), so we can
make this easier to review?

In case it's useful, below is an attempt to add type annotations
to the old code.  It can be applied after patch 29/38.  It reuses
portions of patch 33/38.

Signed-off-by: John Snow <jsnow@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 scripts/qapi/introspect.py | 138 ++++++++++++++++++++++++++-----------
 scripts/qapi/mypy.ini      |   5 --
 scripts/qapi/schema.py     |   2 +-
 3 files changed, 100 insertions(+), 45 deletions(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index b036fcf9ce7..4eaebdef58b 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -10,6 +10,17 @@ This work is licensed under the terms of the GNU GPL, version 2.
 See the COPYING file in the top-level directory.
 """
 
+from typing import (
+    Dict,
+    Generic,
+    List,
+    NamedTuple,
+    Optional,
+    Sequence,
+    TypeVar,
+    Tuple
+)
+
 from .common import (
     c_name,
     gen_endif,
@@ -17,25 +28,48 @@ from .common import (
     mcgen,
 )
 from .gen import QAPISchemaMonolithicCVisitor
-from .schema import (QAPISchemaArrayType, QAPISchemaBuiltinType,
-                     QAPISchemaType)
-
-
-def _make_tree(obj, ifcond, features, extra=None):
+from .schema import (
+    QAPISchema,
+    QAPISchemaArrayType,
+    QAPISchemaBuiltinType,
+    QAPISchemaEntity,
+    QAPISchemaEnumMember,
+    QAPISchemaFeature,
+    QAPISchemaObjectType,
+    QAPISchemaObjectTypeMember,
+    QAPISchemaType,
+    QAPISchemaVariant,
+    QAPISchemaVariants,
+)
+from .source import QAPISourceInfo
+
+T = TypeVar('T')
+# this should actually be: Union[str, list, dict, bool, 'AnnotatedNode']
+# but mypy doesn't support recursive types
+TreeNode = object
+TreeDict = Dict[str, TreeNode]
+Extra = Dict[str, object]
+AnnotatedNode = Tuple[T, Extra]
+
+def _make_tree(obj: TreeDict, ifcond: List[str],
+               features: List[QAPISchemaFeature],
+               extra: Optional[Extra] = None) -> TreeNode:
     if extra is None:
         extra = {}
     if ifcond:
         extra['if'] = ifcond
     if features:
-        obj['features'] = [(f.name, {'if': f.ifcond}) for f in features]
+        obj['features'] = ([(f.name, {'if': f.ifcond}) for f in features])
     if extra:
         return (obj, extra)
     return obj
 
 
-def _tree_to_qlit(obj, level=0, suppress_first_indent=False):
+def _tree_to_qlit(obj: TreeNode,
+                  level: int = 0,
+                  suppress_first_indent : bool = False) -> str:
 
-    def indent(level):
+    def indent(level: int) -> str:
         return level * 4 * ' '
 
     if isinstance(obj, tuple):
@@ -85,21 +119,20 @@ def _tree_to_qlit(obj, level=0, suppress_first_indent=False):
     return ret
 
 
-def to_c_string(string):
+def to_c_string(string: str) -> str:
     return '"' + string.replace('\\', r'\\').replace('"', r'\"') + '"'
 
 
 class QAPISchemaGenIntrospectVisitor(QAPISchemaMonolithicCVisitor):
-
-    def __init__(self, prefix, unmask):
+    def __init__(self, prefix: str, unmask: bool):
         super().__init__(
             prefix, 'qapi-introspect',
             ' * QAPI/QMP schema introspection', __doc__)
         self._unmask = unmask
-        self._schema = None
-        self._trees = []
-        self._used_types = []
-        self._name_map = {}
+        self._schema: Optional[QAPISchema] = None
+        self._trees: List[TreeNode] = []
+        self._used_types: List[QAPISchemaType] = []
+        self._name_map: Dict[str, str] = {}
         self._genc.add(mcgen('''
 #include "qemu/osdep.h"
 #include "%(prefix)sqapi-introspect.h"
@@ -107,10 +140,10 @@ class QAPISchemaGenIntrospectVisitor(QAPISchemaMonolithicCVisitor):
 ''',
                              prefix=prefix))
 
-    def visit_begin(self, schema):
+    def visit_begin(self, schema: QAPISchema) -> None:
         self._schema = schema
 
-    def visit_end(self):
+    def visit_end(self) -> None:
         # visit the types that are actually used
         for typ in self._used_types:
             typ.visit(self)
@@ -132,18 +165,18 @@ const QLitObject %(c_name)s = %(c_string)s;
         self._used_types = []
         self._name_map = {}
 
-    def visit_needed(self, entity):
+    def visit_needed(self, entity: QAPISchemaEntity) -> bool:
         # Ignore types on first pass; visit_end() will pick up used types
         return not isinstance(entity, QAPISchemaType)
 
-    def _name(self, name):
+    def _name(self, name: str) -> str:
         if self._unmask:
             return name
         if name not in self._name_map:
             self._name_map[name] = '%d' % len(self._name_map)
         return self._name_map[name]
 
-    def _use_type(self, typ):
+    def _use_type(self, typ: QAPISchemaType) -> str:
         # Map the various integer types to plain int
         if typ.json_type() == 'int':
             typ = self._schema.lookup_type('int')
@@ -162,8 +195,10 @@ const QLitObject %(c_name)s = %(c_string)s;
             return '[' + self._use_type(typ.element_type) + ']'
         return self._name(typ.name)
 
-    def _gen_tree(self, name, mtype, obj, ifcond, features):
-        extra = None
+    def _gen_tree(self, name: str, mtype: str, obj: TreeDict,
+                  ifcond: List[str],
+                  features: Optional[List[QAPISchemaFeature]]) -> None:
+        extra: Extra = None
         if mtype not in ('command', 'event', 'builtin', 'array'):
             if not self._unmask:
                 # Output a comment to make it easy to map masked names
@@ -174,44 +209,60 @@ const QLitObject %(c_name)s = %(c_string)s;
         obj['meta-type'] = mtype
         self._trees.append(_make_tree(obj, ifcond, features, extra))
 
-    def _gen_member(self, member):
+    def _gen_member(self,
+                    member: QAPISchemaObjectTypeMember) -> TreeNode:
         obj = {'name': member.name, 'type': self._use_type(member.type)}
         if member.optional:
             obj['default'] = None
         return _make_tree(obj, member.ifcond, member.features)
 
-    def _gen_variants(self, tag_name, variants):
+    def _gen_variants(self, tag_name: str,
+                      variants: List[QAPISchemaVariant]) -> TreeDict:
         return {'tag': tag_name,
                 'variants': [self._gen_variant(v) for v in variants]}
 
-    def _gen_variant(self, variant):
+    def _gen_variant(self, variant: QAPISchemaVariant) -> TreeNode:
         obj = {'case': variant.name, 'type': self._use_type(variant.type)}
         return _make_tree(obj, variant.ifcond, None)
 
-    def visit_builtin_type(self, name, info, json_type):
+    def visit_builtin_type(self, name: str,
+                           info: Optional[QAPISourceInfo],
+                           json_type: str) -> None:
         self._gen_tree(name, 'builtin', {'json-type': json_type}, [], None)
 
-    def visit_enum_type(self, name, info, ifcond, features, members, prefix):
+    def visit_enum_type(self, name: str, info: QAPISourceInfo,
+                        ifcond: List[str], features: List[QAPISchemaFeature],
+                        members: List[QAPISchemaEnumMember],
+                        prefix: Optional[str]) -> None:
         self._gen_tree(name, 'enum',
                        {'values': [_make_tree(m.name, m.ifcond, None)
                                    for m in members]},
                        ifcond, features)
 
-    def visit_array_type(self, name, info, ifcond, element_type):
+    def visit_array_type(self, name: str, info: Optional[QAPISourceInfo],
+                         ifcond: List[str],
+                         element_type: QAPISchemaType) -> None:
         element = self._use_type(element_type)
         self._gen_tree('[' + element + ']', 'array', {'element-type': element},
                        ifcond, None)
 
-    def visit_object_type_flat(self, name, info, ifcond, features,
-                               members, variants):
-        obj = {'members': [self._gen_member(m) for m in members]}
+    def visit_object_type_flat(self, name: str, info: Optional[QAPISourceInfo],
+                               ifcond: List[str],
+                               features: List[QAPISchemaFeature],
+                               members: Sequence[QAPISchemaObjectTypeMember],
+                               variants: Optional[QAPISchemaVariants]) -> None:
+        obj: TreeDict = {'members': [self._gen_member(m) for m in members]}
         if variants:
             obj.update(self._gen_variants(variants.tag_member.name,
                                           variants.variants))
 
         self._gen_tree(name, 'object', obj, ifcond, features)
 
-    def visit_alternate_type(self, name, info, ifcond, features, variants):
+    def visit_alternate_type(self, name: str, info: QAPISourceInfo,
+                             ifcond: List[str],
+                             features: List[QAPISchemaFeature],
+                             variants: QAPISchemaVariants) -> None:
+
         self._gen_tree(name, 'alternate',
                        {'members': [
                            _make_tree({'type': self._use_type(m.type)},
@@ -219,24 +270,33 @@ const QLitObject %(c_name)s = %(c_string)s;
                            for m in variants.variants]},
                        ifcond, features)
 
-    def visit_command(self, name, info, ifcond, features,
-                      arg_type, ret_type, gen, success_response, boxed,
-                      allow_oob, allow_preconfig):
+    def visit_command(self, name: str, info: QAPISourceInfo, ifcond: List[str],
+                      features: List[QAPISchemaFeature],
+                      arg_type: QAPISchemaObjectType,
+                      ret_type: Optional[QAPISchemaType], gen: bool,
+                      success_response: bool, boxed: bool, allow_oob: bool,
+                      allow_preconfig: bool) -> None:
+
         arg_type = arg_type or self._schema.the_empty_object_type
         ret_type = ret_type or self._schema.the_empty_object_type
-        obj = {'arg-type': self._use_type(arg_type),
-               'ret-type': self._use_type(ret_type)}
+        obj: TreeDict = {
+            'arg-type': self._use_type(arg_type),
+            'ret-type': self._use_type(ret_type)
+        }
         if allow_oob:
             obj['allow-oob'] = allow_oob
         self._gen_tree(name, 'command', obj, ifcond, features)
 
-    def visit_event(self, name, info, ifcond, features, arg_type, boxed):
+    def visit_event(self, name: str, info: QAPISourceInfo,
+                    ifcond: List[str], features: List[QAPISchemaFeature],
+                    arg_type: QAPISchemaObjectType, boxed: bool) -> None:
         arg_type = arg_type or self._schema.the_empty_object_type
         self._gen_tree(name, 'event', {'arg-type': self._use_type(arg_type)},
                        ifcond, features)
 
 
-def gen_introspect(schema, output_dir, prefix, opt_unmask):
+def gen_introspect(schema: QAPISchema, output_dir: str, prefix: str,
+                   opt_unmask: bool) -> None:
     vis = QAPISchemaGenIntrospectVisitor(prefix, opt_unmask)
     schema.visit(vis)
     vis.write(output_dir)
diff --git a/scripts/qapi/mypy.ini b/scripts/qapi/mypy.ini
index dbfeda748cc..9ce8b56f225 100644
--- a/scripts/qapi/mypy.ini
+++ b/scripts/qapi/mypy.ini
@@ -19,11 +19,6 @@ disallow_untyped_defs = False
 disallow_incomplete_defs = False
 check_untyped_defs = False
 
-[mypy-qapi.introspect]
-disallow_untyped_defs = False
-disallow_incomplete_defs = False
-check_untyped_defs = False
-
 [mypy-qapi.parser]
 disallow_untyped_defs = False
 disallow_incomplete_defs = False
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index bb0cd717f1a..3023bab44b6 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -28,7 +28,7 @@ from .parser import QAPISchemaParser
 class QAPISchemaEntity:
     meta: Optional[str] = None
 
-    def __init__(self, name, info, doc, ifcond=None, features=None):
+    def __init__(self, name: str, info, doc, ifcond=None, features=None):
         assert name is None or isinstance(name, str)
         for f in features or []:
             assert isinstance(f, QAPISchemaFeature)
-- 
2.26.2

-- 
Eduardo


