Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F035227D92E
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Sep 2020 22:46:31 +0200 (CEST)
Received: from localhost ([::1]:40044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNMW6-0006Xn-Nv
	for lists+qemu-devel@lfdr.de; Tue, 29 Sep 2020 16:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kNM6Y-00025J-5Z
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 16:20:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kNM6S-0003Xr-Li
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 16:20:05 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601410800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yN07+6aETQ0UOyiqHqTERmvN/o053m9kbVFNHPTfsRo=;
 b=iqF7nAb79ghQAS8uUJDui3mpV43SfSCxTb+2HcKJOqHUbvn6q5JBS4nUPJd85tycybbdq9
 85j08DaWnDcH4FPMsCPqRGRQndZ851dosawsm02GTju3ywgiUGKpjLPC+/LcppawHpgS6W
 0nkPVYAhT3QZcNCbTIaGKs+ZMKFZLW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-9m1pedOJMFKzh8ovOZy_3Q-1; Tue, 29 Sep 2020 16:19:32 -0400
X-MC-Unique: 9m1pedOJMFKzh8ovOZy_3Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2F5E10BBED3;
 Tue, 29 Sep 2020 20:19:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-101.ams2.redhat.com
 [10.36.112.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 297D8619B5;
 Tue, 29 Sep 2020 20:19:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BE11911358C4; Tue, 29 Sep 2020 22:19:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/29] scripts/qapi/parser.py: improve doc comment indent
 handling
Date: Tue, 29 Sep 2020 22:19:10 +0200
Message-Id: <20200929201926.2155622-14-armbru@redhat.com>
In-Reply-To: <20200929201926.2155622-1-armbru@redhat.com>
References: <20200929201926.2155622-1-armbru@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/29 02:22:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Make the handling of indentation in doc comments more sophisticated,
so that when we see a section like:

Notes: some text
       some more text
          indented line 3

we save it for the doc-comment processing code as:

some text
some more text
   indented line 3

and when we see a section with the heading on its own line:

Notes:

some text
some more text
   indented text

we also accept that and save it in the same form.

If we detect that the comment document text is not indented as much
as we expect it to be, we throw a parse error.  (We don't complain
about over-indented sections, because for rST this can be legitimate
markup.)

The golden reference for the doc comment text is updated to remove
the two 'wrong' indents; these now form a test case that we correctly
stripped leading whitespace from an indented multi-line argument
definition.

We update the documentation in docs/devel/qapi-code-gen.txt to
describe the new indentation rules.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20200925162316.21205-6-peter.maydell@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
[Whitespace between sentences tweaked]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/devel/qapi-code-gen.txt          | 23 +++++++
 scripts/qapi/parser.py                | 93 +++++++++++++++++++++------
 tests/qapi-schema/doc-bad-indent.err  |  1 +
 tests/qapi-schema/doc-bad-indent.json |  8 +++
 tests/qapi-schema/doc-bad-indent.out  |  0
 tests/qapi-schema/doc-good.out        |  4 +-
 tests/qapi-schema/meson.build         |  1 +
 7 files changed, 109 insertions(+), 21 deletions(-)
 create mode 100644 tests/qapi-schema/doc-bad-indent.err
 create mode 100644 tests/qapi-schema/doc-bad-indent.json
 create mode 100644 tests/qapi-schema/doc-bad-indent.out

diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.txt
index 9eede44350..2a09d4d292 100644
--- a/docs/devel/qapi-code-gen.txt
+++ b/docs/devel/qapi-code-gen.txt
@@ -901,6 +901,22 @@ commands and events), member (for structs and unions), branch (for
 alternates), or value (for enums), and finally optional tagged
 sections.
 
+Descriptions of arguments can span multiple lines.  The description
+text can start on the line following the '@argname:', in which case it
+must not be indented at all.  It can also start on the same line as
+the '@argname:'.  In this case if it spans multiple lines then second
+and subsequent lines must be indented to line up with the first
+character of the first line of the description:
+
+# @argone:
+# This is a two line description
+# in the first style.
+#
+# @argtwo: This is a two line description
+#          in the second style.
+
+The number of spaces between the ':' and the text is not significant.
+
 FIXME: the parser accepts these things in almost any order.
 FIXME: union branches should be described, too.
 
@@ -911,6 +927,13 @@ A tagged section starts with one of the following words:
 "Note:"/"Notes:", "Since:", "Example"/"Examples", "Returns:", "TODO:".
 The section ends with the start of a new section.
 
+The text of a section can start on a new line, in
+which case it must not be indented at all.  It can also start
+on the same line as the 'Note:', 'Returns:', etc tag.  In this
+case if it spans multiple lines then second and subsequent
+lines must be indented to match the first, in the same way as
+multiline argument descriptions.
+
 A 'Since: x.y.z' tagged section lists the release that introduced the
 definition.
 
diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 04bf10db37..9d1a3e2eea 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -319,17 +319,32 @@ class QAPIDoc:
     """
 
     class Section:
-        def __init__(self, name=None):
+        def __init__(self, parser, name=None, indent=0):
+            # parser, for error messages about indentation
+            self._parser = parser
             # optional section name (argument/member or section name)
             self.name = name
             self.text = ''
+            # the expected indent level of the text of this section
+            self._indent = indent
 
         def append(self, line):
+            # Strip leading spaces corresponding to the expected indent level
+            # Blank lines are always OK.
+            if line:
+                indent = re.match(r'\s*', line).end()
+                if indent < self._indent:
+                    raise QAPIParseError(
+                        self._parser,
+                        "unexpected de-indent (expected at least %d spaces)" %
+                        self._indent)
+                line = line[self._indent:]
+
             self.text += line.rstrip() + '\n'
 
     class ArgSection(Section):
-        def __init__(self, name):
-            super().__init__(name)
+        def __init__(self, parser, name, indent=0):
+            super().__init__(parser, name, indent)
             self.member = None
 
         def connect(self, member):
@@ -343,7 +358,7 @@ class QAPIDoc:
         self._parser = parser
         self.info = info
         self.symbol = None
-        self.body = QAPIDoc.Section()
+        self.body = QAPIDoc.Section(parser)
         # dict mapping parameter name to ArgSection
         self.args = OrderedDict()
         self.features = OrderedDict()
@@ -447,8 +462,21 @@ class QAPIDoc:
         name = line.split(' ', 1)[0]
 
         if name.startswith('@') and name.endswith(':'):
-            line = line[len(name)+1:]
-            self._start_args_section(name[1:-1])
+            # If line is "@arg:   first line of description", find
+            # the index of 'f', which is the indent we expect for any
+            # following lines.  We then remove the leading "@arg:"
+            # from line and replace it with spaces so that 'f' has the
+            # same index as it did in the original line and can be
+            # handled the same way we will handle following lines.
+            indent = re.match(r'@\S*:\s*', line).end()
+            line = line[indent:]
+            if not line:
+                # Line was just the "@arg:" header; following lines
+                # are not indented
+                indent = 0
+            else:
+                line = ' ' * indent + line
+            self._start_args_section(name[1:-1], indent)
         elif self._is_section_tag(name):
             self._append_line = self._append_various_line
             self._append_various_line(line)
@@ -469,8 +497,21 @@ class QAPIDoc:
         name = line.split(' ', 1)[0]
 
         if name.startswith('@') and name.endswith(':'):
-            line = line[len(name)+1:]
-            self._start_features_section(name[1:-1])
+            # If line is "@arg:   first line of description", find
+            # the index of 'f', which is the indent we expect for any
+            # following lines.  We then remove the leading "@arg:"
+            # from line and replace it with spaces so that 'f' has the
+            # same index as it did in the original line and can be
+            # handled the same way we will handle following lines.
+            indent = re.match(r'@\S*:\s*', line).end()
+            line = line[indent:]
+            if not line:
+                # Line was just the "@arg:" header; following lines
+                # are not indented
+                indent = 0
+            else:
+                line = ' ' * indent + line
+            self._start_features_section(name[1:-1], indent)
         elif self._is_section_tag(name):
             self._append_line = self._append_various_line
             self._append_various_line(line)
@@ -502,12 +543,25 @@ class QAPIDoc:
                                  "'%s' can't follow '%s' section"
                                  % (name, self.sections[0].name))
         if self._is_section_tag(name):
-            line = line[len(name)+1:]
-            self._start_section(name[:-1])
+            # If line is "Section:   first line of description", find
+            # the index of 'f', which is the indent we expect for any
+            # following lines.  We then remove the leading "Section:"
+            # from line and replace it with spaces so that 'f' has the
+            # same index as it did in the original line and can be
+            # handled the same way we will handle following lines.
+            indent = re.match(r'\S*:\s*', line).end()
+            line = line[indent:]
+            if not line:
+                # Line was just the "Section:" header; following lines
+                # are not indented
+                indent = 0
+            else:
+                line = ' ' * indent + line
+            self._start_section(name[:-1], indent)
 
         self._append_freeform(line)
 
-    def _start_symbol_section(self, symbols_dict, name):
+    def _start_symbol_section(self, symbols_dict, name, indent):
         # FIXME invalid names other than the empty string aren't flagged
         if not name:
             raise QAPIParseError(self._parser, "invalid parameter name")
@@ -516,21 +570,21 @@ class QAPIDoc:
                                  "'%s' parameter name duplicated" % name)
         assert not self.sections
         self._end_section()
-        self._section = QAPIDoc.ArgSection(name)
+        self._section = QAPIDoc.ArgSection(self._parser, name, indent)
         symbols_dict[name] = self._section
 
-    def _start_args_section(self, name):
-        self._start_symbol_section(self.args, name)
+    def _start_args_section(self, name, indent):
+        self._start_symbol_section(self.args, name, indent)
 
-    def _start_features_section(self, name):
-        self._start_symbol_section(self.features, name)
+    def _start_features_section(self, name, indent):
+        self._start_symbol_section(self.features, name, indent)
 
-    def _start_section(self, name=None):
+    def _start_section(self, name=None, indent=0):
         if name in ('Returns', 'Since') and self.has_section(name):
             raise QAPIParseError(self._parser,
                                  "duplicated '%s' section" % name)
         self._end_section()
-        self._section = QAPIDoc.Section(name)
+        self._section = QAPIDoc.Section(self._parser, name, indent)
         self.sections.append(self._section)
 
     def _end_section(self):
@@ -553,7 +607,8 @@ class QAPIDoc:
     def connect_member(self, member):
         if member.name not in self.args:
             # Undocumented TODO outlaw
-            self.args[member.name] = QAPIDoc.ArgSection(member.name)
+            self.args[member.name] = QAPIDoc.ArgSection(self._parser,
+                                                        member.name)
         self.args[member.name].connect(member)
 
     def connect_feature(self, feature):
diff --git a/tests/qapi-schema/doc-bad-indent.err b/tests/qapi-schema/doc-bad-indent.err
new file mode 100644
index 0000000000..67844539bd
--- /dev/null
+++ b/tests/qapi-schema/doc-bad-indent.err
@@ -0,0 +1 @@
+doc-bad-indent.json:6:1: unexpected de-indent (expected at least 4 spaces)
diff --git a/tests/qapi-schema/doc-bad-indent.json b/tests/qapi-schema/doc-bad-indent.json
new file mode 100644
index 0000000000..edde8f21dc
--- /dev/null
+++ b/tests/qapi-schema/doc-bad-indent.json
@@ -0,0 +1,8 @@
+# Multiline doc comments should have consistent indentation
+
+##
+# @foo:
+# @a: line one
+# line two is wrongly indented
+##
+{ 'command': 'foo', 'data': { 'a': 'int' } }
diff --git a/tests/qapi-schema/doc-bad-indent.out b/tests/qapi-schema/doc-bad-indent.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index 9993ffcd89..b7e3f4313d 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -159,7 +159,7 @@ doc symbol=Alternate
 
     arg=i
 an integer
-    @b is undocumented
+@b is undocumented
     arg=b
 
     feature=alt-feat
@@ -174,7 +174,7 @@ doc symbol=cmd
 the first argument
     arg=arg2
 the second
-       argument
+argument
     arg=arg3
 
     feature=cmd-feat1
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index f1449298b0..83a0a68389 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -53,6 +53,7 @@ schemas = [
   'doc-bad-enum-member.json',
   'doc-bad-event-arg.json',
   'doc-bad-feature.json',
+  'doc-bad-indent.json',
   'doc-bad-section.json',
   'doc-bad-symbol.json',
   'doc-bad-union-member.json',
-- 
2.26.2


