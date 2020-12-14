Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D2E2DA46F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 00:57:44 +0100 (CET)
Received: from localhost ([::1]:39244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koxip-000851-2E
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 18:57:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1koxf3-0003GD-H0
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 18:53:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1koxf1-0000ta-Q5
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 18:53:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607990026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hKFNRCIXPnZk+5v+fBW9tO/zhEtLRaI3ZElq3h4Cm8U=;
 b=JmxBJIvK2c41m/bT6tGwMDiYh+6KifHzQlvgWI31/PknM0D/j7t4KH3R6D88z9fNdeMNpo
 61KataqJ4ajhDUamljv151o519kqWlGf/+/Qf5NGbJaJWJV4JL+VAGM2D7S3EjTFIZgrE3
 k/fkvkCs7mUM4JQhrPjGhmwiF2zO1PE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-WZeX_-YdMd6P2o05YjVmhA-1; Mon, 14 Dec 2020 18:53:45 -0500
X-MC-Unique: WZeX_-YdMd6P2o05YjVmhA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19CA3800D55
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 23:53:44 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-117.rdu2.redhat.com [10.10.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 459D113470;
 Mon, 14 Dec 2020 23:53:43 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/12] qapi/gen: use './builtin' for the built-in module name
Date: Mon, 14 Dec 2020 18:53:20 -0500
Message-Id: <20201214235327.1007124-6-jsnow@redhat.com>
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

Use this in preference to 'None', which helps remove some edge cases in
the typing.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/gen.py | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index a6dc991b1d03..0c5d1fee6088 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -245,23 +245,23 @@ def __init__(self,
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
@@ -269,15 +269,14 @@ def _module_basename(self, what: str, name: Optional[str]) -> str:
             if name != self._main_module:
                 ret += '-' + os.path.splitext(basename)[0]
         else:
-            name = name[2:] if name else 'builtin'
-            ret += re.sub(r'-', '-' + name + '-', what)
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
@@ -290,8 +289,8 @@ def _add_user_module(self, name: str, blurb: str) -> None:
             self._main_module = name
         self._add_module(name, blurb)
 
-    def _add_system_module(self, name: Optional[str], blurb: str) -> None:
-        self._add_module(name and './' + name, blurb)
+    def _add_system_module(self, name: str, blurb: str) -> None:
+        self._add_module(f"./{name}", blurb)
 
     def write(self, output_dir: str, opt_builtins: bool = False) -> None:
         for name in self._module:
@@ -310,7 +309,7 @@ def _begin_user_module(self, name: str) -> None:
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


