Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0240137B180
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 00:16:01 +0200 (CEST)
Received: from localhost ([::1]:42316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgafY-0002b3-1y
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 18:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaWC-0007k3-Na
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaWA-0006Ty-L3
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620770778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pkV0GAvbu7qcYa+mswlYzA+gNGbOjdKlXPcM1T77R9U=;
 b=YiTsk8oOvR6c3UN0rH+Ks+gMq+iufdeB6KHd2WkyzhIdPaqYE/TeXwfLi/+h38BcsoWubn
 VsEyoVvZf6WSLR8C+YIRIrv/hvfsIZMZOsppV3JgUwIJk6Rt8narsFE/pLkXeSp5DCP9oE
 3L7V9EJlc9t4+fLqefVY1z+26gGz8fY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-TLy6snXVM1CzTl25ca-WYg-1; Tue, 11 May 2021 18:06:15 -0400
X-MC-Unique: TLy6snXVM1CzTl25ca-WYg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB0DC101371B;
 Tue, 11 May 2021 22:06:14 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BDA860CC9;
 Tue, 11 May 2021 22:06:14 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/21] qapi/parser: add type hint annotations
Date: Tue, 11 May 2021 18:05:52 -0400
Message-Id: <20210511220601.2110055-13-jsnow@redhat.com>
In-Reply-To: <20210511220601.2110055-1-jsnow@redhat.com>
References: <20210511220601.2110055-1-jsnow@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Annotations do not change runtime behavior.
This commit *only* adds annotations.

(Annotations for QAPIDoc are in a forthcoming commit.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 58 +++++++++++++++++++++++++++---------------
 1 file changed, 38 insertions(+), 20 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 336959cbbb1..631863bac14 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -17,16 +17,26 @@
 from collections import OrderedDict
 import os
 import re
-from typing import List
+from typing import (
+    Dict,
+    List,
+    Optional,
+    Set,
+    Union,
+)
 
 from .common import must_match
 from .error import QAPISemError, QAPISourceError
 from .source import QAPISourceInfo
 
 
+# Return value alias for get_expr().
+_ExprValue = Union[List[object], Dict[str, object], str, bool]
+
+
 class QAPIParseError(QAPISourceError):
     """Error class for all QAPI schema parsing errors."""
-    def __init__(self, parser, msg):
+    def __init__(self, parser: 'QAPISchemaParser', msg: str):
         col = 1
         for ch in parser.src[parser.line_pos:parser.pos]:
             if ch == '\t':
@@ -38,7 +48,10 @@ def __init__(self, parser, msg):
 
 class QAPISchemaParser:
 
-    def __init__(self, fname, previously_included=None, incl_info=None):
+    def __init__(self,
+                 fname: str,
+                 previously_included: Optional[Set[str]] = None,
+                 incl_info: Optional[QAPISourceInfo] = None):
         self._fname = fname
         self._included = previously_included or set()
         self._included.add(os.path.abspath(self._fname))
@@ -46,20 +59,20 @@ def __init__(self, fname, previously_included=None, incl_info=None):
 
         # Lexer state (see `accept` for details):
         self.info = QAPISourceInfo(self._fname, incl_info)
-        self.tok = None
+        self.tok: Union[None, str] = None
         self.pos = 0
         self.cursor = 0
-        self.val = None
+        self.val: Optional[Union[bool, str]] = None
         self.line_pos = 0
 
         # Parser output:
-        self.exprs = []
-        self.docs = []
+        self.exprs: List[Dict[str, object]] = []
+        self.docs: List[QAPIDoc] = []
 
         # Showtime!
         self._parse()
 
-    def _parse(self):
+    def _parse(self) -> None:
         cur_doc = None
 
         # May raise OSError; allow the caller to handle it.
@@ -125,7 +138,7 @@ def _parse(self):
         self.reject_expr_doc(cur_doc)
 
     @staticmethod
-    def reject_expr_doc(doc):
+    def reject_expr_doc(doc: Optional['QAPIDoc']) -> None:
         if doc and doc.symbol:
             raise QAPISemError(
                 doc.info,
@@ -133,10 +146,14 @@ def reject_expr_doc(doc):
                 % doc.symbol)
 
     @staticmethod
-    def _include(include, info, incl_fname, previously_included):
+    def _include(include: str,
+                 info: QAPISourceInfo,
+                 incl_fname: str,
+                 previously_included: Set[str]
+                 ) -> Optional['QAPISchemaParser']:
         incl_abs_fname = os.path.abspath(incl_fname)
         # catch inclusion cycle
-        inf = info
+        inf: Optional[QAPISourceInfo] = info
         while inf:
             if incl_abs_fname == os.path.abspath(inf.fname):
                 raise QAPISemError(info, "inclusion loop for %s" % include)
@@ -155,9 +172,9 @@ def _include(include, info, incl_fname, previously_included):
             ) from err
 
     @staticmethod
-    def _pragma(name, value, info):
+    def _pragma(name: str, value: object, info: QAPISourceInfo) -> None:
 
-        def check_list_str(name, value) -> List[str]:
+        def check_list_str(name: str, value: object) -> List[str]:
             if (not isinstance(value, list) or
                     any([not isinstance(elt, str) for elt in value])):
                 raise QAPISemError(
@@ -181,7 +198,7 @@ def check_list_str(name, value) -> List[str]:
         else:
             raise QAPISemError(info, "unknown pragma '%s'" % name)
 
-    def accept(self, skip_comment=True):
+    def accept(self, skip_comment: bool = True) -> None:
         while True:
             self.tok = self.src[self.cursor]
             self.pos = self.cursor
@@ -245,8 +262,8 @@ def accept(self, skip_comment=True):
                                    self.src[self.cursor-1:])
                 raise QAPIParseError(self, "stray '%s'" % match.group(0))
 
-    def get_members(self):
-        expr = OrderedDict()
+    def get_members(self) -> Dict[str, object]:
+        expr: Dict[str, object] = OrderedDict()
         if self.tok == '}':
             self.accept()
             return expr
@@ -272,8 +289,8 @@ def get_members(self):
             if self.tok != "'":
                 raise QAPIParseError(self, "expected string")
 
-    def get_values(self):
-        expr = []
+    def get_values(self) -> List[object]:
+        expr: List[object] = []
         if self.tok == ']':
             self.accept()
             return expr
@@ -289,7 +306,8 @@ def get_values(self):
                 raise QAPIParseError(self, "expected ',' or ']'")
             self.accept()
 
-    def get_expr(self):
+    def get_expr(self) -> _ExprValue:
+        expr: _ExprValue
         if self.tok == '{':
             self.accept()
             expr = self.get_members()
@@ -305,7 +323,7 @@ def get_expr(self):
                 self, "expected '{', '[', string, or boolean")
         return expr
 
-    def get_doc(self, info):
+    def get_doc(self, info: QAPISourceInfo) -> List['QAPIDoc']:
         if self.val != '##':
             raise QAPIParseError(
                 self, "junk after '##' at start of documentation comment")
-- 
2.30.2


