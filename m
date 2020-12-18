Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648612DEABA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 22:04:37 +0100 (CET)
Received: from localhost ([::1]:53022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqMvU-0005YM-AX
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 16:04:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqMlf-00017R-W4
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 15:54:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqMlZ-0002wB-Ca
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 15:54:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608324860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lIeubXd7XckMMO0W7jjTE150rCoRB2QVIXzx8IVvklg=;
 b=T2Tw9L/4/J4jxfn+FhyH2LA4unqdQ2Gi3SIwKnYJytZcZB5iMVnQy3tkdkwYFRfi2PkQqR
 qfRgI3/cE9EXFLu5igQLVVqQuSJew0KWNPnwySTIrt/F0pvuiZp6lK2JqGHLGHqWYifAbp
 IpPR++XxgwbzkLksZqH4ltLSvnr47lA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-tjDrsMrEP-msCwct5XDsWQ-1; Fri, 18 Dec 2020 15:54:18 -0500
X-MC-Unique: tjDrsMrEP-msCwct5XDsWQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F2F9801817
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 20:54:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D926614FF;
 Fri, 18 Dec 2020 20:54:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DADBE11275D7; Fri, 18 Dec 2020 21:54:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/11] qapi/gen: use './builtin' for the built-in module name
Date: Fri, 18 Dec 2020 21:54:01 +0100
Message-Id: <20201218205407.1326907-6-armbru@redhat.com>
In-Reply-To: <20201218205407.1326907-1-armbru@redhat.com>
References: <20201218205407.1326907-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, ehabkost@redhat.com,
 crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Use this in preference to 'None', which helps remove some edge cases in
the typing.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20201217015927.197287-6-jsnow@redhat.com>
---
 scripts/qapi/gen.py | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index a6dc991b1d..476d0adac4 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -245,23 +245,23 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
         self._pydoc = pydoc
         self._genc: Optional[QAPIGenC] = None
         self._genh: Optional[QAPIGenH] = None
-        self._module: Dict[Optional[str], Tuple[QAPIGenC, QAPIGenH]] = {}
+        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH]] = {}
         self._main_module: Optional[str] = None
 
     @staticmethod
-    def _is_user_module(name: Optional[str]) -> bool:
-        return bool(name and not name.startswith('./'))
+    def _is_user_module(name: str) -> bool:
+        return not name.startswith('./')
 
     @staticmethod
-    def _is_builtin_module(name: Optional[str]) -> bool:
-        return not name
+    def _is_builtin_module(name: str) -> bool:
+        return name == './builtin'
 
-    def _module_dirname(self, name: Optional[str]) -> str:
+    def _module_dirname(self, name: str) -> str:
         if self._is_user_module(name):
             return os.path.dirname(name)
         return ''
 
-    def _module_basename(self, what: str, name: Optional[str]) -> str:
+    def _module_basename(self, what: str, name: str) -> str:
         ret = '' if self._is_builtin_module(name) else self._prefix
         if self._is_user_module(name):
             basename = os.path.basename(name)
@@ -269,15 +269,15 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
             if name != self._main_module:
                 ret += '-' + os.path.splitext(basename)[0]
         else:
-            name = name[2:] if name else 'builtin'
-            ret += re.sub(r'-', '-' + name + '-', what)
+            assert name.startswith('./')
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
@@ -290,8 +290,8 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
             self._main_module = name
         self._add_module(name, blurb)
 
-    def _add_system_module(self, name: Optional[str], blurb: str) -> None:
-        self._add_module(name and './' + name, blurb)
+    def _add_system_module(self, name: str, blurb: str) -> None:
+        self._add_module('./' + name, blurb)
 
     def write(self, output_dir: str, opt_builtins: bool = False) -> None:
         for name in self._module:
@@ -310,7 +310,7 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
     def visit_module(self, name: Optional[str]) -> None:
         if name is None:
             if self._builtin_blurb:
-                self._add_system_module(None, self._builtin_blurb)
+                self._add_system_module('builtin', self._builtin_blurb)
                 self._begin_system_module(name)
             else:
                 # The built-in module has not been created.  No code may
-- 
2.26.2


