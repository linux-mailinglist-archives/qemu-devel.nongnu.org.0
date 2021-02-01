Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8EF30B0C0
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 20:49:36 +0100 (CET)
Received: from localhost ([::1]:57048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6fCZ-0008G4-79
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 14:49:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6f23-0003n4-L4
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:38:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6f21-0005sF-Dq
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:38:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612208318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LCrL02U/DJmzJgE3X/a0/mQGjW6hsPElWxLhSb2Fkq4=;
 b=eYUAgdnHrdCQnw1jIhTK207x6s7KpCiNrYzNiISxCVSzdx3wYFTtzGnODIS8L5l5q1vlU6
 mbEktyoXZJGd4tbqZ7wM4i6Vq6ZCDPYTy6dEymzA8Fy9dOGlep+4ESClJWtG2JachCaaqn
 rd47n/caizc+CQ/pmEN9vLYeqNwXASU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-oqj47l6TMCu9mzHqZtY1YQ-1; Mon, 01 Feb 2021 14:38:14 -0500
X-MC-Unique: oqj47l6TMCu9mzHqZtY1YQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD4971800D41;
 Mon,  1 Feb 2021 19:38:13 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 139C760C66;
 Mon,  1 Feb 2021 19:38:11 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/16] qapi: use './builtin' as the built-in module name
Date: Mon,  1 Feb 2021 14:37:39 -0500
Message-Id: <20210201193747.2169670-9-jsnow@redhat.com>
In-Reply-To: <20210201193747.2169670-1-jsnow@redhat.com>
References: <20210201193747.2169670-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use './builtin' as the built-in module name instead of
None. Clarify the typing that this is now always a string.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/gen.py                      | 18 +++++++++---------
 scripts/qapi/schema.py                   | 20 ++++++++++----------
 tests/qapi-schema/comments.out           |  2 +-
 tests/qapi-schema/doc-good.out           |  2 +-
 tests/qapi-schema/empty.out              |  2 +-
 tests/qapi-schema/event-case.out         |  2 +-
 tests/qapi-schema/include-repetition.out |  2 +-
 tests/qapi-schema/include-simple.out     |  2 +-
 tests/qapi-schema/indented-expr.out      |  2 +-
 tests/qapi-schema/qapi-schema-test.out   |  2 +-
 10 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index da9d4d2d373..9352d79c3a4 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -246,16 +246,16 @@ def __init__(self,
         self._pydoc = pydoc
         self._genc: Optional[QAPIGenC] = None
         self._genh: Optional[QAPIGenH] = None
-        self._module: Dict[Optional[str], Tuple[QAPIGenC, QAPIGenH]] = {}
+        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH]] = {}
         self._main_module: Optional[str] = None
 
     @staticmethod
-    def _module_dirname(name: Optional[str]) -> str:
+    def _module_dirname(name: str) -> str:
         if QAPISchemaModule.is_user_module(name):
             return os.path.dirname(name)
         return ''
 
-    def _module_basename(self, what: str, name: Optional[str]) -> str:
+    def _module_basename(self, what: str, name: str) -> str:
         ret = '' if QAPISchemaModule.is_builtin_module(name) else self._prefix
         if QAPISchemaModule.is_user_module(name):
             basename = os.path.basename(name)
@@ -263,15 +263,15 @@ def _module_basename(self, what: str, name: Optional[str]) -> str:
             if name != self._main_module:
                 ret += '-' + os.path.splitext(basename)[0]
         else:
-            name = name[2:] if name else 'builtin'
-            ret += re.sub(r'-', '-' + name + '-', what)
+            assert QAPISchemaModule.is_system_module(name)
+            ret += re.sub(r'-', '-' + name[2:] + '-', what)
         return ret
 
-    def _module_filename(self, what: str, name: Optional[str]) -> str:
+    def _module_filename(self, what: str, name: str) -> str:
         return os.path.join(self._module_dirname(name),
                             self._module_basename(what, name))
 
-    def _add_module(self, name: Optional[str], blurb: str) -> None:
+    def _add_module(self, name: str, blurb: str) -> None:
         basename = self._module_filename(self._what, name)
         genc = QAPIGenC(basename + '.c', blurb, self._pydoc)
         genh = QAPIGenH(basename + '.h', blurb, self._pydoc)
@@ -284,7 +284,7 @@ def _add_user_module(self, name: str, blurb: str) -> None:
             self._main_module = name
         self._add_module(name, blurb)
 
-    def _add_system_module(self, name: Optional[str], blurb: str) -> None:
+    def _add_system_module(self, name: str, blurb: str) -> None:
         assert QAPISchemaModule.is_system_module(name)
         self._add_module(name, blurb)
 
@@ -302,7 +302,7 @@ def _begin_builtin_module(self) -> None:
     def _begin_user_module(self, name: str) -> None:
         pass
 
-    def visit_module(self, name: Optional[str]) -> None:
+    def visit_module(self, name: str) -> None:
         if QAPISchemaModule.is_builtin_module(name):
             if self._builtin_blurb:
                 self._add_system_module(name, self._builtin_blurb)
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index e80d9320eda..14cf9da7842 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -68,7 +68,8 @@ def check_doc(self):
 
     def _set_module(self, schema, info):
         assert self._checked
-        self._module = schema.module_by_fname(info and info.fname)
+        fname = info.fname if info else './builtin'
+        self._module = schema.module_by_fname(fname)
         self._module.add_entity(self)
 
     def set_module(self, schema):
@@ -142,16 +143,16 @@ def __init__(self, name):
         self._entity_list = []
 
     @staticmethod
-    def is_system_module(name: Optional[str]) -> bool:
+    def is_system_module(name: str) -> bool:
         """
         System modules are internally defined modules.
 
         Their names start with the "./" prefix.
         """
-        return name is None or name.startswith('./')
+        return name.startswith('./')
 
     @classmethod
-    def is_user_module(cls, name: Optional[str]) -> bool:
+    def is_user_module(cls, name: str) -> bool:
         """
         User modules are those defined by the user in qapi JSON files.
 
@@ -160,13 +161,13 @@ def is_user_module(cls, name: Optional[str]) -> bool:
         return not cls.is_system_module(name)
 
     @staticmethod
-    def is_builtin_module(name: Optional[str]) -> bool:
+    def is_builtin_module(name: str) -> bool:
         """
         The built-in module is a single System module for the built-in types.
 
-        It is presently always the value 'None'.
+        It is always "./builtin".
         """
-        return name is None
+        return name == './builtin'
 
     def add_entity(self, ent):
         self._entity_list.append(ent)
@@ -852,7 +853,7 @@ def __init__(self, fname):
         self._entity_dict = {}
         self._module_dict = OrderedDict()
         self._schema_dir = os.path.dirname(fname)
-        self._make_module(None)  # built-ins
+        self._make_module('./builtin')
         self._make_module(fname)
         self._predefining = True
         self._def_predefineds()
@@ -897,7 +898,7 @@ def resolve_type(self, name, info, what):
                 info, "%s uses unknown type '%s'" % (what, name))
         return typ
 
-    def _module_name(self, fname):
+    def _module_name(self, fname: str) -> str:
         if QAPISchemaModule.is_system_module(fname):
             return fname
         return os.path.relpath(fname, self._schema_dir)
@@ -910,7 +911,6 @@ def _make_module(self, fname):
 
     def module_by_fname(self, fname):
         name = self._module_name(fname)
-        assert name in self._module_dict
         return self._module_dict[name]
 
     def _def_include(self, expr, info, doc):
diff --git a/tests/qapi-schema/comments.out b/tests/qapi-schema/comments.out
index 273f0f54e16..ce4f6a4f0f5 100644
--- a/tests/qapi-schema/comments.out
+++ b/tests/qapi-schema/comments.out
@@ -1,4 +1,4 @@
-module None
+module ./builtin
 object q_empty
 enum QType
     prefix QTYPE
diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index 419284dae29..715b0bbc1af 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -1,4 +1,4 @@
-module None
+module ./builtin
 object q_empty
 enum QType
     prefix QTYPE
diff --git a/tests/qapi-schema/empty.out b/tests/qapi-schema/empty.out
index 69666c39ad2..3feb3f69d3d 100644
--- a/tests/qapi-schema/empty.out
+++ b/tests/qapi-schema/empty.out
@@ -1,4 +1,4 @@
-module None
+module ./builtin
 object q_empty
 enum QType
     prefix QTYPE
diff --git a/tests/qapi-schema/event-case.out b/tests/qapi-schema/event-case.out
index 42ae519656d..9ae44052ac4 100644
--- a/tests/qapi-schema/event-case.out
+++ b/tests/qapi-schema/event-case.out
@@ -1,4 +1,4 @@
-module None
+module ./builtin
 object q_empty
 enum QType
     prefix QTYPE
diff --git a/tests/qapi-schema/include-repetition.out b/tests/qapi-schema/include-repetition.out
index 0b654ddebb6..16dbd9b8194 100644
--- a/tests/qapi-schema/include-repetition.out
+++ b/tests/qapi-schema/include-repetition.out
@@ -1,4 +1,4 @@
-module None
+module ./builtin
 object q_empty
 enum QType
     prefix QTYPE
diff --git a/tests/qapi-schema/include-simple.out b/tests/qapi-schema/include-simple.out
index 061f81e5090..48e923bfbc8 100644
--- a/tests/qapi-schema/include-simple.out
+++ b/tests/qapi-schema/include-simple.out
@@ -1,4 +1,4 @@
-module None
+module ./builtin
 object q_empty
 enum QType
     prefix QTYPE
diff --git a/tests/qapi-schema/indented-expr.out b/tests/qapi-schema/indented-expr.out
index 04356775cd1..6a30ded3fa6 100644
--- a/tests/qapi-schema/indented-expr.out
+++ b/tests/qapi-schema/indented-expr.out
@@ -1,4 +1,4 @@
-module None
+module ./builtin
 object q_empty
 enum QType
     prefix QTYPE
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 8868ca0dca9..3b1387d9f18 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -1,4 +1,4 @@
-module None
+module ./builtin
 object q_empty
 enum QType
     prefix QTYPE
-- 
2.29.2


