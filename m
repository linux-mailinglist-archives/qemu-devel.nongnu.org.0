Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 654E516C3B0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 15:20:10 +0100 (CET)
Received: from localhost ([::1]:57682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6b4D-0004WU-G8
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 09:20:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44778)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6apT-0006ga-TB
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 09:05:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6apO-0005IR-Qt
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 09:04:55 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:50909)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6apO-0005IC-KD
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 09:04:50 -0500
Received: by mail-wm1-x32f.google.com with SMTP id a5so3133530wmb.0
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 06:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yx82A80BgFchuY4arBJB9y5p01nca9y/eUUsgMiGXgw=;
 b=aL0IevAW73/+IgMxhYgXFw0v2Vjx2sx5oRUNPfkyQUqmGgHl6fo7D7eKK+wS2w9lVL
 ASnIbXoEyR7jbAAImZotxCXC9xV1TQ3IUANkbtzkStmR+PecdGh09X/9aU3XXILjaRUr
 o7kDxVcYsAJJc31u7Ck8S+C72p16dBmHz/fHFo2JQ72r1aiY6G14otq3bFTM02jRN6hc
 qzHClxCoMR1jmkvnxWnDxN5/vrvRxvxIuMOysI4XoGMQXTOVHHSSvZqoIhIzLRO+lqYA
 6+0lJbZ2fo8Dsev+Un8NhaDO0XKjtr3KZXlEe5+T4QylY+fHQGuBArgUHOjQdk6u8eb1
 kcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yx82A80BgFchuY4arBJB9y5p01nca9y/eUUsgMiGXgw=;
 b=PjN720ppxQfSR5nAIpNNiMrzMFmxmiFDIW8WgkXw59uteTrLWLDpG2T/Gg+MAlYAzx
 Cl5mRFBITDfnMyLGLOZclRpMbwWfECmJafkOUf437L7kXeZyhWL1KkaLl0L3w/fGt/rx
 OvFDznFljR0YVWrOU42KKEkpEgZPVJjktCVjoS5V5c8lPW2cBre3EtLI/8s325xpg4iJ
 hqyEe9ntoM51vl9/RsGJ4kZwMLI3IGvJCujpohM9Js2oGGmRiW5NlAlzg11JOXW3lvbN
 dsZYxtU1gJx2kaqf2KrAX2BpaFsdD7wz1CbaVNMDKZEam/DlY9F3DSKEkZMaZnweMQv4
 TffQ==
X-Gm-Message-State: APjAAAVvGTdqSFE/SyocYbIYVK1u25fMdeKWd6R+rb0W6L8KgoQR3C5U
 6BwcHgQt1HvbW+pHibAEK9R6C5GIcNxJUA==
X-Google-Smtp-Source: APXvYqwR2DqYZdTbKJJ8oF2NeK/aHwTnYWK9g7ToPHH7pQus/W8ZMTPWYkUoA0RY+up52JrQ9J73vg==
X-Received: by 2002:a7b:cbcf:: with SMTP id n15mr5477846wmi.21.1582639489044; 
 Tue, 25 Feb 2020 06:04:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f127sm4322136wma.4.2020.02.25.06.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 06:04:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/12] scripts/qapi/parser.py: improve doc comment indent
 handling
Date: Tue, 25 Feb 2020 14:04:30 +0000
Message-Id: <20200225140437.20609-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200225140437.20609-1-peter.maydell@linaro.org>
References: <20200225140437.20609-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32f
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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

The exception is that we always retain indentation as-is for Examples
sections, because these are literal text.

If we detect that the comment document text is not indented as much
as we expect it to be, we throw a parse error.  (We don't complain
about over-indented sections, because for rST this can be legitimate
markup.)

The golden reference for the doc comment text is updated to remove
the two 'wrong' indents; these now form a test case that we correctly
stripped leading whitespace from an indented multi-line argument
definition.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v1->v2: Update doc-good.out as per final para.
---
 scripts/qapi/parser.py         | 82 +++++++++++++++++++++++++++-------
 tests/qapi-schema/doc-good.out |  4 +-
 2 files changed, 67 insertions(+), 19 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 2196ec5de1e..66f802641c9 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -313,18 +313,32 @@ class QAPIDoc(object):
     """
 
     class Section(object):
-        def __init__(self, name=None):
+        def __init__(self, parser, name=None, indent=0):
+            # parser, for error messages about indentation
+            self._parser = parser
             # optional section name (argument/member or section name)
             self.name = name
             # the list of lines for this section
             self.text = ''
+            # the expected indent level of the text of this section
+            self._indent = indent
 
         def append(self, line):
+            # Strip leading spaces corresponding to the expected indent level
+            # Blank lines are always OK.
+            if line:
+                spacecount = len(line) - len(line.lstrip(" "))
+                if spacecount > self._indent:
+                    spacecount = self._indent
+                if spacecount < self._indent:
+                    raise QAPIParseError(self._parser, "unexpected de-indent")
+                line = line[spacecount:]
+
             self.text += line.rstrip() + '\n'
 
     class ArgSection(Section):
-        def __init__(self, name):
-            QAPIDoc.Section.__init__(self, name)
+        def __init__(self, parser, name, indent=0):
+            QAPIDoc.Section.__init__(self, parser, name, indent)
             self.member = None
 
         def connect(self, member):
@@ -338,7 +352,7 @@ class QAPIDoc(object):
         self._parser = parser
         self.info = info
         self.symbol = None
-        self.body = QAPIDoc.Section()
+        self.body = QAPIDoc.Section(parser)
         # dict mapping parameter name to ArgSection
         self.args = OrderedDict()
         self.features = OrderedDict()
@@ -443,7 +457,18 @@ class QAPIDoc(object):
 
         if name.startswith('@') and name.endswith(':'):
             line = line[len(name)+1:]
-            self._start_args_section(name[1:-1])
+            if not line or line.isspace():
+                # Line was just the "@arg:" header; following lines
+                # are not indented
+                indent = 0
+                line = ''
+            else:
+                # Line is "@arg: first line of description"; following
+                # lines should be indented by len(name) + 1, and we
+                # pad out this first line so it is handled the same way
+                indent = len(name) + 1
+                line = ' ' * indent + line
+            self._start_args_section(name[1:-1], indent)
         elif self._is_section_tag(name):
             self._append_line = self._append_various_line
             self._append_various_line(line)
@@ -465,7 +490,17 @@ class QAPIDoc(object):
 
         if name.startswith('@') and name.endswith(':'):
             line = line[len(name)+1:]
-            self._start_features_section(name[1:-1])
+            if not line or line.isspace():
+                # Line is just the "@name:" header, no ident for following lines
+                indent = 0
+                line = ''
+            else:
+                # Line is "@arg: first line of description"; following
+                # lines should be indented by len(name) + 3, and we
+                # pad out this first line so it is handled the same way
+                indent = len(name) + 1
+                line = ' ' * indent + line
+            self._start_features_section(name[1:-1], indent)
         elif self._is_section_tag(name):
             self._append_line = self._append_various_line
             self._append_various_line(line)
@@ -498,11 +533,23 @@ class QAPIDoc(object):
                                  % (name, self.sections[0].name))
         elif self._is_section_tag(name):
             line = line[len(name)+1:]
-            self._start_section(name[:-1])
+            if not line or line.isspace():
+                # Line is just "SectionName:", no indent for following lines
+                indent = 0
+                line = ''
+            elif name.startswith("Example"):
+                # The "Examples" section is literal-text, so preserve
+                # all the indentation as-is
+                indent = 0
+            else:
+                # Line is "SectionName: some text", indent required
+                indent = len(name) + 1
+                line = ' ' * indent + line
+            self._start_section(name[:-1], indent)
 
         self._append_freeform(line)
 
-    def _start_symbol_section(self, symbols_dict, name):
+    def _start_symbol_section(self, symbols_dict, name, indent):
         # FIXME invalid names other than the empty string aren't flagged
         if not name:
             raise QAPIParseError(self._parser, "invalid parameter name")
@@ -511,21 +558,21 @@ class QAPIDoc(object):
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
@@ -548,7 +595,7 @@ class QAPIDoc(object):
     def connect_member(self, member):
         if member.name not in self.args:
             # Undocumented TODO outlaw
-            self.args[member.name] = QAPIDoc.ArgSection(member.name)
+            self.args[member.name] = QAPIDoc.ArgSection(self._parser, member.name)
         self.args[member.name].connect(member)
 
     def connect_feature(self, feature):
@@ -556,7 +603,8 @@ class QAPIDoc(object):
             raise QAPISemError(feature.info,
                                "feature '%s' lacks documentation"
                                % feature.name)
-            self.features[feature.name] = QAPIDoc.ArgSection(feature.name)
+            self.features[feature.name] = QAPIDoc.ArgSection(self._parser,
+                                                             feature.name)
         self.features[feature.name].connect(feature)
 
     def check_expr(self, expr):
diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index a65bce639ff..0302ce0bde1 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -144,7 +144,7 @@ doc symbol=Alternate
 
     arg=i
 an integer
-    @b is undocumented
+@b is undocumented
     arg=b
 
 doc freeform
@@ -157,7 +157,7 @@ doc symbol=cmd
 the first argument
     arg=arg2
 the second
-       argument
+argument
     arg=arg3
 
     feature=cmd-feat1
-- 
2.20.1


