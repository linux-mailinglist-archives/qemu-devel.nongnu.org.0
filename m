Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E78289FF5
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Oct 2020 12:14:29 +0200 (CEST)
Received: from localhost ([::1]:45962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRBtU-0000AE-ST
	for lists+qemu-devel@lfdr.de; Sat, 10 Oct 2020 06:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kRBb6-00083Q-Tg
 for qemu-devel@nongnu.org; Sat, 10 Oct 2020 05:55:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kRBas-0002jJ-ES
 for qemu-devel@nongnu.org; Sat, 10 Oct 2020 05:55:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602323713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I51Skxoc9dOpXtHDODc8NKoNn/h5Y3I5Y2itjH1HRRc=;
 b=eBk1T5G4u/GapKf2zYfbc4Xg+tZ4Ofh2usDjGp4XxAxG2P+g2Iag9H0N6GHj59UQtoaqpl
 o1ggNTFIo5rB3tPhAEm9IBpZp+UN0cQmVLcV5lcTNPJD1kth2vBEEUA9Yu+mhHkmGqJ0Yh
 0DPPawM7h6xaKUGb3uev6CJvsho8pdc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-jXam-BtaMu6myVU2YY7Wxg-1; Sat, 10 Oct 2020 05:55:11 -0400
X-MC-Unique: jXam-BtaMu6myVU2YY7Wxg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AC78107AD9A;
 Sat, 10 Oct 2020 09:55:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7DC668431;
 Sat, 10 Oct 2020 09:55:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EEFF111275C4; Sat, 10 Oct 2020 11:55:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/34] qapi/gen.py: add type hint annotations
Date: Sat, 10 Oct 2020 11:54:56 +0200
Message-Id: <20201010095504.796182-27-armbru@redhat.com>
In-Reply-To: <20201010095504.796182-1-armbru@redhat.com>
References: <20201010095504.796182-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/10 02:57:53
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Annotations do not change runtime behavior.
This commit *only* adds annotations.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20201009161558.107041-28-jsnow@redhat.com>
Message-Id: <20201009161558.107041-29-jsnow@redhat.com>
[mypy.ini update squashed in]
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/gen.py   | 104 +++++++++++++++++++++++-------------------
 scripts/qapi/mypy.ini |   5 --
 2 files changed, 57 insertions(+), 52 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 2c305c4f82..6b1007a035 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -15,7 +15,13 @@ from contextlib import contextmanager
 import errno
 import os
 import re
-from typing import Optional
+from typing import (
+    Dict,
+    Iterator,
+    List,
+    Optional,
+    Tuple,
+)
 
 from .common import (
     c_fname,
@@ -27,31 +33,31 @@ from .common import (
     mcgen,
 )
 from .schema import QAPISchemaObjectType, QAPISchemaVisitor
+from .source import QAPISourceInfo
 
 
 class QAPIGen:
-
-    def __init__(self, fname):
+    def __init__(self, fname: Optional[str]):
         self.fname = fname
         self._preamble = ''
         self._body = ''
 
-    def preamble_add(self, text):
+    def preamble_add(self, text: str) -> None:
         self._preamble += text
 
-    def add(self, text):
+    def add(self, text: str) -> None:
         self._body += text
 
-    def get_content(self):
+    def get_content(self) -> str:
         return self._top() + self._preamble + self._body + self._bottom()
 
-    def _top(self):
+    def _top(self) -> str:
         return ''
 
-    def _bottom(self):
+    def _bottom(self) -> str:
         return ''
 
-    def write(self, output_dir):
+    def write(self, output_dir: str) -> None:
         # Include paths starting with ../ are used to reuse modules of the main
         # schema in specialised schemas. Don't overwrite the files that are
         # already generated for the main schema.
@@ -76,7 +82,7 @@ class QAPIGen:
         f.close()
 
 
-def _wrap_ifcond(ifcond, before, after):
+def _wrap_ifcond(ifcond: List[str], before: str, after: str) -> str:
     if before == after:
         return after   # suppress empty #if ... #endif
 
@@ -116,40 +122,38 @@ def build_params(arg_type: Optional[QAPISchemaObjectType],
 
 
 class QAPIGenCCode(QAPIGen):
-
-    def __init__(self, fname):
+    def __init__(self, fname: Optional[str]):
         super().__init__(fname)
-        self._start_if = None
+        self._start_if: Optional[Tuple[List[str], str, str]] = None
 
-    def start_if(self, ifcond):
+    def start_if(self, ifcond: List[str]) -> None:
         assert self._start_if is None
         self._start_if = (ifcond, self._body, self._preamble)
 
-    def end_if(self):
+    def end_if(self) -> None:
         assert self._start_if
         self._wrap_ifcond()
         self._start_if = None
 
-    def _wrap_ifcond(self):
+    def _wrap_ifcond(self) -> None:
         self._body = _wrap_ifcond(self._start_if[0],
                                   self._start_if[1], self._body)
         self._preamble = _wrap_ifcond(self._start_if[0],
                                       self._start_if[2], self._preamble)
 
-    def get_content(self):
+    def get_content(self) -> str:
         assert self._start_if is None
         return super().get_content()
 
 
 class QAPIGenC(QAPIGenCCode):
-
-    def __init__(self, fname, blurb, pydoc):
+    def __init__(self, fname: str, blurb: str, pydoc: str):
         super().__init__(fname)
         self._blurb = blurb
         self._copyright = '\n * '.join(re.findall(r'^Copyright .*', pydoc,
                                                   re.MULTILINE))
 
-    def _top(self):
+    def _top(self) -> str:
         return mcgen('''
 /* AUTOMATICALLY GENERATED, DO NOT MODIFY */
 
@@ -165,7 +169,7 @@ class QAPIGenC(QAPIGenCCode):
 ''',
                      blurb=self._blurb, copyright=self._copyright)
 
-    def _bottom(self):
+    def _bottom(self) -> str:
         return mcgen('''
 
 /* Dummy declaration to prevent empty .o file */
@@ -175,16 +179,15 @@ char qapi_dummy_%(name)s;
 
 
 class QAPIGenH(QAPIGenC):
-
-    def _top(self):
+    def _top(self) -> str:
         return super()._top() + guardstart(self.fname)
 
-    def _bottom(self):
+    def _bottom(self) -> str:
         return guardend(self.fname)
 
 
 @contextmanager
-def ifcontext(ifcond, *args):
+def ifcontext(ifcond: List[str], *args: QAPIGenCCode) -> Iterator[None]:
     """
     A with-statement context manager that wraps with `start_if()` / `end_if()`.
 
@@ -212,8 +215,11 @@ def ifcontext(ifcond, *args):
 
 
 class QAPISchemaMonolithicCVisitor(QAPISchemaVisitor):
-
-    def __init__(self, prefix, what, blurb, pydoc):
+    def __init__(self,
+                 prefix: str,
+                 what: str,
+                 blurb: str,
+                 pydoc: str):
         self._prefix = prefix
         self._what = what
         self._genc = QAPIGenC(self._prefix + self._what + '.c',
@@ -221,38 +227,42 @@ class QAPISchemaMonolithicCVisitor(QAPISchemaVisitor):
         self._genh = QAPIGenH(self._prefix + self._what + '.h',
                               blurb, pydoc)
 
-    def write(self, output_dir):
+    def write(self, output_dir: str) -> None:
         self._genc.write(output_dir)
         self._genh.write(output_dir)
 
 
 class QAPISchemaModularCVisitor(QAPISchemaVisitor):
-
-    def __init__(self, prefix, what, user_blurb, builtin_blurb, pydoc):
+    def __init__(self,
+                 prefix: str,
+                 what: str,
+                 user_blurb: str,
+                 builtin_blurb: Optional[str],
+                 pydoc: str):
         self._prefix = prefix
         self._what = what
         self._user_blurb = user_blurb
         self._builtin_blurb = builtin_blurb
         self._pydoc = pydoc
-        self._genc = None
-        self._genh = None
-        self._module = {}
-        self._main_module = None
+        self._genc: Optional[QAPIGenC] = None
+        self._genh: Optional[QAPIGenH] = None
+        self._module: Dict[Optional[str], Tuple[QAPIGenC, QAPIGenH]] = {}
+        self._main_module: Optional[str] = None
 
     @staticmethod
-    def _is_user_module(name):
+    def _is_user_module(name: Optional[str]) -> bool:
         return bool(name and not name.startswith('./'))
 
     @staticmethod
-    def _is_builtin_module(name):
+    def _is_builtin_module(name: Optional[str]) -> bool:
         return not name
 
-    def _module_dirname(self, what, name):
+    def _module_dirname(self, what: str, name: Optional[str]) -> str:
         if self._is_user_module(name):
             return os.path.dirname(name)
         return ''
 
-    def _module_basename(self, what, name):
+    def _module_basename(self, what: str, name: Optional[str]) -> str:
         ret = '' if self._is_builtin_module(name) else self._prefix
         if self._is_user_module(name):
             basename = os.path.basename(name)
@@ -264,27 +274,27 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
             ret += re.sub(r'-', '-' + name + '-', what)
         return ret
 
-    def _module_filename(self, what, name):
+    def _module_filename(self, what: str, name: Optional[str]) -> str:
         return os.path.join(self._module_dirname(what, name),
                             self._module_basename(what, name))
 
-    def _add_module(self, name, blurb):
+    def _add_module(self, name: Optional[str], blurb: str) -> None:
         basename = self._module_filename(self._what, name)
         genc = QAPIGenC(basename + '.c', blurb, self._pydoc)
         genh = QAPIGenH(basename + '.h', blurb, self._pydoc)
         self._module[name] = (genc, genh)
         self._genc, self._genh = self._module[name]
 
-    def _add_user_module(self, name, blurb):
+    def _add_user_module(self, name: str, blurb: str) -> None:
         assert self._is_user_module(name)
         if self._main_module is None:
             self._main_module = name
         self._add_module(name, blurb)
 
-    def _add_system_module(self, name, blurb):
+    def _add_system_module(self, name: Optional[str], blurb: str) -> None:
         self._add_module(name and './' + name, blurb)
 
-    def write(self, output_dir, opt_builtins=False):
+    def write(self, output_dir: str, opt_builtins: bool = False) -> None:
         for name in self._module:
             if self._is_builtin_module(name) and not opt_builtins:
                 continue
@@ -292,13 +302,13 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
             genc.write(output_dir)
             genh.write(output_dir)
 
-    def _begin_system_module(self, name):
+    def _begin_system_module(self, name: None) -> None:
         pass
 
-    def _begin_user_module(self, name):
+    def _begin_user_module(self, name: str) -> None:
         pass
 
-    def visit_module(self, name):
+    def visit_module(self, name: Optional[str]) -> None:
         if name is None:
             if self._builtin_blurb:
                 self._add_system_module(None, self._builtin_blurb)
@@ -312,7 +322,7 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
             self._add_user_module(name, self._user_blurb)
             self._begin_user_module(name)
 
-    def visit_include(self, name, info):
+    def visit_include(self, name: str, info: QAPISourceInfo) -> None:
         relname = os.path.relpath(self._module_filename(self._what, name),
                                   os.path.dirname(self._genh.fname))
         self._genh.preamble_add(mcgen('''
diff --git a/scripts/qapi/mypy.ini b/scripts/qapi/mypy.ini
index 1b8555dfa3..c6960ff2db 100644
--- a/scripts/qapi/mypy.ini
+++ b/scripts/qapi/mypy.ini
@@ -14,11 +14,6 @@ disallow_untyped_defs = False
 disallow_incomplete_defs = False
 check_untyped_defs = False
 
-[mypy-qapi.gen]
-disallow_untyped_defs = False
-disallow_incomplete_defs = False
-check_untyped_defs = False
-
 [mypy-qapi.introspect]
 disallow_untyped_defs = False
 disallow_incomplete_defs = False
-- 
2.26.2


