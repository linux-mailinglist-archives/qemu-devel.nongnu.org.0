Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 762C741E308
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 23:08:01 +0200 (CEST)
Received: from localhost ([::1]:35084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mW3Hc-0003hP-Cj
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 17:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mW37l-0007QQ-Go
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 16:57:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mW37X-0000An-Nk
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 16:57:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633035454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l+BxMSJw5WST6w2PIk1+yqse+4FodTaDC6C4vCfFFk0=;
 b=LDOB3gFUCmw39nUoOD8/QI0xv6ruvkP3AB8aSf/gm2jAIkV2k8tCaviTeXKpmtrwu8vl2t
 cdM/CLgCv7Z35EZ6l8AIwJk9Q7MpIMNyFllvDVuudptEs3oSq+O3XoHVvPGlpmbG0xfMlP
 f2npK3OQTRnjilP8It9yGt2dHZlgO2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-PwwuPOBGN4Gf-16eMxv6qA-1; Thu, 30 Sep 2021 16:57:30 -0400
X-MC-Unique: PwwuPOBGN4Gf-16eMxv6qA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 748C7824FA8;
 Thu, 30 Sep 2021 20:57:29 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08A9960938;
 Thu, 30 Sep 2021 20:57:27 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/13] qapi/parser: add type hint annotations (QAPIDoc)
Date: Thu, 30 Sep 2021 16:57:12 -0400
Message-Id: <20210930205716.1148693-10-jsnow@redhat.com>
In-Reply-To: <20210930205716.1148693-1-jsnow@redhat.com>
References: <20210930205716.1148693-1-jsnow@redhat.com>
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
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Annotations do not change runtime behavior.
This commit consists of only annotations.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 67 ++++++++++++++++++++++++------------------
 1 file changed, 39 insertions(+), 28 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 75582ddb003..73c1c4ef599 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -37,6 +37,9 @@
     from .schema import QAPISchemaFeature, QAPISchemaMember
 
 
+#: Represents a single Top Level QAPI schema expression.
+TopLevelExpr = Dict[str, object]
+
 # Return value alias for get_expr().
 _ExprValue = Union[List[object], Dict[str, object], str, bool]
 
@@ -454,7 +457,8 @@ class QAPIDoc:
     """
 
     class Section:
-        def __init__(self, parser, name=None, indent=0):
+        def __init__(self, parser: QAPISchemaParser,
+                     name: Optional[str] = None, indent: int = 0):
             # parser, for error messages about indentation
             self._parser = parser
             # optional section name (argument/member or section name)
@@ -463,7 +467,7 @@ def __init__(self, parser, name=None, indent=0):
             # the expected indent level of the text of this section
             self._indent = indent
 
-        def append(self, line):
+        def append(self, line: str) -> None:
             # Strip leading spaces corresponding to the expected indent level
             # Blank lines are always OK.
             if line:
@@ -478,7 +482,8 @@ def append(self, line):
             self.text += line.rstrip() + '\n'
 
     class ArgSection(Section):
-        def __init__(self, parser, name, indent=0):
+        def __init__(self, parser: QAPISchemaParser,
+                     name: str, indent: int = 0):
             super().__init__(parser, name, indent)
             self.member: Optional['QAPISchemaMember'] = None
 
@@ -489,35 +494,34 @@ class NullSection(Section):
         """
         Immutable dummy section for use at the end of a doc block.
         """
-        def append(self, line):
+        def append(self, line: str) -> None:
             assert False, "Text appended after end_comment() called."
 
-    def __init__(self, parser, info):
+    def __init__(self, parser: QAPISchemaParser, info: QAPISourceInfo):
         # self._parser is used to report errors with QAPIParseError.  The
         # resulting error position depends on the state of the parser.
         # It happens to be the beginning of the comment.  More or less
         # servicable, but action at a distance.
         self._parser = parser
         self.info = info
-        self.symbol = None
+        self.symbol: Optional[str] = None
         self.body = QAPIDoc.Section(parser)
-        # dict mapping parameter name to ArgSection
-        self.args = OrderedDict()
-        self.features = OrderedDict()
-        # a list of Section
-        self.sections = []
+        # dicts mapping parameter/feature names to their ArgSection
+        self.args: Dict[str, QAPIDoc.ArgSection] = OrderedDict()
+        self.features: Dict[str, QAPIDoc.ArgSection] = OrderedDict()
+        self.sections: List[QAPIDoc.Section] = []
         # the current section
         self._section = self.body
         self._append_line = self._append_body_line
 
-    def has_section(self, name):
+    def has_section(self, name: str) -> bool:
         """Return True if we have a section with this name."""
         for i in self.sections:
             if i.name == name:
                 return True
         return False
 
-    def append(self, line):
+    def append(self, line: str) -> None:
         """
         Parse a comment line and add it to the documentation.
 
@@ -538,18 +542,18 @@ def append(self, line):
         line = line[1:]
         self._append_line(line)
 
-    def end_comment(self):
+    def end_comment(self) -> None:
         self._switch_section(QAPIDoc.NullSection(self._parser))
 
     @staticmethod
-    def _is_section_tag(name):
+    def _is_section_tag(name: str) -> bool:
         return name in ('Returns:', 'Since:',
                         # those are often singular or plural
                         'Note:', 'Notes:',
                         'Example:', 'Examples:',
                         'TODO:')
 
-    def _append_body_line(self, line):
+    def _append_body_line(self, line: str) -> None:
         """
         Process a line of documentation text in the body section.
 
@@ -591,7 +595,7 @@ def _append_body_line(self, line):
             # This is a free-form documentation block
             self._append_freeform(line)
 
-    def _append_args_line(self, line):
+    def _append_args_line(self, line: str) -> None:
         """
         Process a line of documentation text in an argument section.
 
@@ -637,7 +641,7 @@ def _append_args_line(self, line):
 
         self._append_freeform(line)
 
-    def _append_features_line(self, line):
+    def _append_features_line(self, line: str) -> None:
         name = line.split(' ', 1)[0]
 
         if name.startswith('@') and name.endswith(':'):
@@ -669,7 +673,7 @@ def _append_features_line(self, line):
 
         self._append_freeform(line)
 
-    def _append_various_line(self, line):
+    def _append_various_line(self, line: str) -> None:
         """
         Process a line of documentation text in an additional section.
 
@@ -705,7 +709,11 @@ def _append_various_line(self, line):
 
         self._append_freeform(line)
 
-    def _start_symbol_section(self, symbols_dict, name, indent):
+    def _start_symbol_section(
+            self,
+            symbols_dict: Dict[str, 'QAPIDoc.ArgSection'],
+            name: str,
+            indent: int) -> None:
         # FIXME invalid names other than the empty string aren't flagged
         if not name:
             raise QAPIParseError(self._parser, "invalid parameter name")
@@ -717,13 +725,14 @@ def _start_symbol_section(self, symbols_dict, name, indent):
         self._switch_section(new_section)
         symbols_dict[name] = new_section
 
-    def _start_args_section(self, name, indent):
+    def _start_args_section(self, name: str, indent: int) -> None:
         self._start_symbol_section(self.args, name, indent)
 
-    def _start_features_section(self, name, indent):
+    def _start_features_section(self, name: str, indent: int) -> None:
         self._start_symbol_section(self.features, name, indent)
 
-    def _start_section(self, name=None, indent=0):
+    def _start_section(self, name: Optional[str] = None,
+                       indent: int = 0) -> None:
         if name in ('Returns', 'Since') and self.has_section(name):
             raise QAPIParseError(self._parser,
                                  "duplicated '%s' section" % name)
@@ -731,7 +740,7 @@ def _start_section(self, name=None, indent=0):
         self._switch_section(new_section)
         self.sections.append(new_section)
 
-    def _switch_section(self, new_section):
+    def _switch_section(self, new_section: 'QAPIDoc.Section') -> None:
         text = self._section.text = self._section.text.strip()
 
         # Only the 'body' section is allowed to have an empty body.
@@ -746,7 +755,7 @@ def _switch_section(self, new_section):
 
         self._section = new_section
 
-    def _append_freeform(self, line):
+    def _append_freeform(self, line: str) -> None:
         match = re.match(r'(@\S+:)', line)
         if match:
             raise QAPIParseError(self._parser,
@@ -768,14 +777,16 @@ def connect_feature(self, feature: 'QAPISchemaFeature') -> None:
                                % feature.name)
         self.features[feature.name].connect(feature)
 
-    def check_expr(self, expr):
+    def check_expr(self, expr: TopLevelExpr) -> None:
         if self.has_section('Returns') and 'command' not in expr:
             raise QAPISemError(self.info,
                                "'Returns:' is only valid for commands")
 
-    def check(self):
+    def check(self) -> None:
 
-        def check_args_section(args, what):
+        def check_args_section(
+                args: Dict[str, QAPIDoc.ArgSection], what: str
+        ) -> None:
             bogus = [name for name, section in args.items()
                      if not section.member]
             if bogus:
-- 
2.31.1


