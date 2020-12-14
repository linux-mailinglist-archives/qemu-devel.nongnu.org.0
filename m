Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC142DA480
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 01:03:14 +0100 (CET)
Received: from localhost ([::1]:56144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koxo9-0006cM-SQ
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 19:03:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1koxfD-0003Xk-Ji
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 18:54:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1koxf8-0000uV-By
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 18:53:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607990033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g22mw6VCBBku3TozxhC+MNGMi192VGwuNN8d7ZsT+tQ=;
 b=bYOy7w9y5OgT8btRe91RCHVFQOLHVWAuXtzXs+fAkR9FIBX1tmcyocj6y/B5vQih6fNbkp
 V3TRhFzlUP1xggihHrVxIwuEabBZKMa8ceYP8wy3VH6PxrREkmoEJkO7bmWUluXlWrCcLZ
 G1/fNz3qqUEhttesBrkC3dXytv3q1GY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-JsO2DfalPlunt_lLvCXG0g-1; Mon, 14 Dec 2020 18:53:51 -0500
X-MC-Unique: JsO2DfalPlunt_lLvCXG0g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E074C107ACE3
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 23:53:50 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-117.rdu2.redhat.com [10.10.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00CF518F0A;
 Mon, 14 Dec 2020 23:53:49 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/12] qapi/schema: Name the builtin module "" instead of None
Date: Mon, 14 Dec 2020 18:53:26 -0500
Message-Id: <20201214235327.1007124-12-jsnow@redhat.com>
In-Reply-To: <20201214235327.1007124-1-jsnow@redhat.com>
References: <20201214235327.1007124-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of using None as the built-in module filename, use an empty
string instead. This allows us to clarify the type of various interfaces
dealing with module names as always taking a string, which saves us from
having to use Optional[str] everywhere.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/gen.py                      |  6 +++---
 scripts/qapi/schema.py                   | 12 ++++++------
 scripts/qapi/types.py                    |  2 +-
 scripts/qapi/visit.py                    |  2 +-
 tests/qapi-schema/comments.out           |  2 +-
 tests/qapi-schema/doc-good.out           |  2 +-
 tests/qapi-schema/empty.out              |  2 +-
 tests/qapi-schema/event-case.out         |  2 +-
 tests/qapi-schema/include-repetition.out |  2 +-
 tests/qapi-schema/include-simple.out     |  2 +-
 tests/qapi-schema/indented-expr.out      |  2 +-
 tests/qapi-schema/qapi-schema-test.out   |  2 +-
 12 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index b2c89213d838..a577a4a7f002 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -309,14 +309,14 @@ def write(self, output_dir: str, opt_builtins: bool = False) -> None:
             genc.write(output_dir)
             genh.write(output_dir)
 
-    def _begin_system_module(self, name: None) -> None:
+    def _begin_system_module(self, name: str) -> None:
         pass
 
     def _begin_user_module(self, name: str) -> None:
         pass
 
-    def visit_module(self, name: Optional[str]) -> None:
-        if name is None:
+    def visit_module(self, name: str) -> None:
+        if not name:
             if self._builtin_blurb:
                 self._add_system_module('builtin', self._builtin_blurb)
                 self._begin_system_module(name)
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index d5f19732b516..8d8b8758f65e 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -69,7 +69,7 @@ def check_doc(self):
 
     def _set_module(self, schema, info):
         assert self._checked
-        self._module = schema.module_by_fname(info and info.fname)
+        self._module = schema.module_by_fname(info.fname)
         self._module.add_entity(self)
 
     def set_module(self, schema):
@@ -826,7 +826,7 @@ def __init__(self, fname):
         self._entity_dict = {}
         self._module_dict = OrderedDict()
         self._schema_dir = os.path.dirname(fname)
-        self._make_module(None)  # built-ins
+        self._make_module(QAPISourceInfo.builtin().fname)  # built-ins
         self._make_module(fname)
         self._predefining = True
         self._def_predefineds()
@@ -871,10 +871,10 @@ def resolve_type(self, name, info, what):
                 info, "%s uses unknown type '%s'" % (what, name))
         return typ
 
-    def _module_name(self, fname):
-        if not fname:
-            return None
-        return os.path.relpath(fname, self._schema_dir)
+    def _module_name(self, fname: str) -> str:
+        if fname:
+            return os.path.relpath(fname, self._schema_dir)
+        return fname
 
     def _make_module(self, fname):
         name = self._module_name(fname)
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index a3a16284006b..12eeea3aaffe 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -272,7 +272,7 @@ def __init__(self, prefix: str):
             prefix, 'qapi-types', ' * Schema-defined QAPI types',
             ' * Built-in QAPI types', __doc__)
 
-    def _begin_system_module(self, name: None) -> None:
+    def _begin_system_module(self, name: str) -> None:
         self._genc.preamble_add(mcgen('''
 #include "qemu/osdep.h"
 #include "qapi/dealloc-visitor.h"
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index 3f49c307c566..76e34ee7f02e 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -305,7 +305,7 @@ def __init__(self, prefix: str):
             prefix, 'qapi-visit', ' * Schema-defined QAPI visitors',
             ' * Built-in QAPI visitors', __doc__)
 
-    def _begin_system_module(self, name: None) -> None:
+    def _begin_system_module(self, name: str) -> None:
         self._genc.preamble_add(mcgen('''
 #include "qemu/osdep.h"
 #include "qapi/error.h"
diff --git a/tests/qapi-schema/comments.out b/tests/qapi-schema/comments.out
index 08aba8354e2a..02000c06e5e0 100644
--- a/tests/qapi-schema/comments.out
+++ b/tests/qapi-schema/comments.out
@@ -1,4 +1,4 @@
-module "None"
+module ""
 object q_empty
 enum QType
     prefix QTYPE
diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index 83a3d9bd69b5..494533d74793 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -1,4 +1,4 @@
-module "None"
+module ""
 object q_empty
 enum QType
     prefix QTYPE
diff --git a/tests/qapi-schema/empty.out b/tests/qapi-schema/empty.out
index 0dac23c80c15..059caa4e1d2a 100644
--- a/tests/qapi-schema/empty.out
+++ b/tests/qapi-schema/empty.out
@@ -1,4 +1,4 @@
-module "None"
+module ""
 object q_empty
 enum QType
     prefix QTYPE
diff --git a/tests/qapi-schema/event-case.out b/tests/qapi-schema/event-case.out
index ace511ba5a96..4d9d2b519f4b 100644
--- a/tests/qapi-schema/event-case.out
+++ b/tests/qapi-schema/event-case.out
@@ -1,4 +1,4 @@
-module "None"
+module ""
 object q_empty
 enum QType
     prefix QTYPE
diff --git a/tests/qapi-schema/include-repetition.out b/tests/qapi-schema/include-repetition.out
index f7ab4987943c..31d64631b665 100644
--- a/tests/qapi-schema/include-repetition.out
+++ b/tests/qapi-schema/include-repetition.out
@@ -1,4 +1,4 @@
-module "None"
+module ""
 object q_empty
 enum QType
     prefix QTYPE
diff --git a/tests/qapi-schema/include-simple.out b/tests/qapi-schema/include-simple.out
index 81bdeb887b66..1b35b3295713 100644
--- a/tests/qapi-schema/include-simple.out
+++ b/tests/qapi-schema/include-simple.out
@@ -1,4 +1,4 @@
-module "None"
+module ""
 object q_empty
 enum QType
     prefix QTYPE
diff --git a/tests/qapi-schema/indented-expr.out b/tests/qapi-schema/indented-expr.out
index 361a58185e67..aed689e7bd67 100644
--- a/tests/qapi-schema/indented-expr.out
+++ b/tests/qapi-schema/indented-expr.out
@@ -1,4 +1,4 @@
-module "None"
+module ""
 object q_empty
 enum QType
     prefix QTYPE
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 4f5ab9fd596c..4a899ba63ecb 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -1,4 +1,4 @@
-module "None"
+module ""
 object q_empty
 enum QType
     prefix QTYPE
-- 
2.26.2


