Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788FC284071
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 22:13:18 +0200 (CEST)
Received: from localhost ([::1]:42546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPWrF-00030N-Ef
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 16:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kPWXO-000101-J9
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 15:52:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kPWXL-0007CT-5O
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 15:52:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601927562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tvDLu/JBbn85OCLJquCEvaQViToStLPp4V8efTSo5QE=;
 b=KkwhmE4xXw74bR2iJN1775aHrzp2YPBHn6z2laDk5U/qm2IW6qiyuyRozDdcV+syF83RhD
 O88qt2svNHxzxgmekbWoj8mmQTPVyHtCA0+Q9eTCuGVr3Ptxia8DJXO4bpzVJSomO+z35V
 Ji0dzrln+/zB5pD/Wf7O/halGQcn5ZE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-tEyNQZr0MueDIKs3-GOZJA-1; Mon, 05 Oct 2020 15:52:40 -0400
X-MC-Unique: tEyNQZr0MueDIKs3-GOZJA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 720CB8030D8
 for <qemu-devel@nongnu.org>; Mon,  5 Oct 2020 19:52:39 +0000 (UTC)
Received: from scv.redhat.com (ovpn-120-38.rdu2.redhat.com [10.10.120.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA0465C1BD;
 Mon,  5 Oct 2020 19:52:38 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 27/36] qapi/gen.py: add type hint annotations
Date: Mon,  5 Oct 2020 15:51:49 -0400
Message-Id: <20201005195158.2348217-28-jsnow@redhat.com>
In-Reply-To: <20201005195158.2348217-1-jsnow@redhat.com>
References: <20201005195158.2348217-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 01:25:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
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
Cc: Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Annotations do not change runtime behavior.
This commit *only* adds annotations.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 scripts/qapi/gen.py | 104 ++++++++++++++++++++++++--------------------
 1 file changed, 57 insertions(+), 47 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 1bad37fc06b..d0391cd8718 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -17,7 +17,13 @@
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
@@ -29,31 +35,31 @@
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
@@ -78,7 +84,7 @@ def write(self, output_dir):
         f.close()
 
 
-def _wrap_ifcond(ifcond, before, after):
+def _wrap_ifcond(ifcond: List[str], before: str, after: str) -> str:
     if before == after:
         return after   # suppress empty #if ... #endif
 
@@ -118,40 +124,38 @@ def build_params(arg_type: Optional[QAPISchemaObjectType],
 
 
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
 
@@ -167,7 +171,7 @@ def _top(self):
 ''',
                      blurb=self._blurb, copyright=self._copyright)
 
-    def _bottom(self):
+    def _bottom(self) -> str:
         return mcgen('''
 
 /* Dummy declaration to prevent empty .o file */
@@ -177,16 +181,15 @@ def _bottom(self):
 
 
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
 
@@ -214,8 +217,11 @@ def ifcontext(ifcond, *args):
 
 
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
@@ -223,38 +229,42 @@ def __init__(self, prefix, what, blurb, pydoc):
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
@@ -266,27 +276,27 @@ def _module_basename(self, what, name):
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
@@ -294,13 +304,13 @@ def write(self, output_dir, opt_builtins=False):
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
@@ -314,7 +324,7 @@ def visit_module(self, name):
             self._add_user_module(name, self._user_blurb)
             self._begin_user_module(name)
 
-    def visit_include(self, name, info):
+    def visit_include(self, name: str, info: QAPISourceInfo) -> None:
         relname = os.path.relpath(self._module_filename(self._what, name),
                                   os.path.dirname(self._genh.fname))
         self._genh.preamble_add(mcgen('''
-- 
2.26.2


