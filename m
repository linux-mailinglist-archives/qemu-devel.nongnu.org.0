Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAA6241134
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 21:54:38 +0200 (CEST)
Received: from localhost ([::1]:49698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5DsT-0008U1-LF
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 15:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k5Dog-0000VF-Am
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 15:50:42 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k5Dob-0004l5-OB
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 15:50:41 -0400
Received: by mail-wm1-x32e.google.com with SMTP id 3so692692wmi.1
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 12:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=in8nHFzKOQegCgF8vb8hOhMAaiGbmURtCJ4Hj4NuXzg=;
 b=oEINfCMrjNcCDNfoGaT77zm+BZJrp0tyYJNIvjAA06OSfwbf5+4gKdoKyPgiahXWTp
 pfMyQC/iMt1nVN4IJYZyKqRM4/cdzhH76cYT+MiQXvmwhbs5bZUyR5vYzH/oIiqreEEC
 DeTLiaM8EF6zQrQ/4J59qYPsHyrCEUQem7Awb7AIPzp7EB/ib7SYwIiNfC3xRumLY4QN
 yt6PaA8qQWKwMUrJ50fBhW3Qh/zmONMuAOnCAnXOJcBTH/iOfAFzCVQ4El1AI/6+joS8
 QPzQUq/kERTMt0jSTkQR7nqCeoIiQnDxWEndvu2tEyiJg1GwqQNzsi6V//NSmtTy6Ygg
 S4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=in8nHFzKOQegCgF8vb8hOhMAaiGbmURtCJ4Hj4NuXzg=;
 b=tbAP0HSd9hthXBsNozdC3RUPjsyB7Ew5SnrqHI/2jf4OZzEy+QR31tQGROI3TqceKf
 ZKHan6ASIlDhU3VIQFLfQDaSs4UvjhmZtRij3ahf5pqTUrijNeabgnndxJRThigLFk4p
 pVh38gvAyyavDizm1BX595sIadP4ouANVWygSbmRowMO80vLCHicxNpAnZo7sMmKyTps
 c4RaSJvgWu8EqVYy/zLM3q+BDNhJsbBBkSWZ9K4HwDpXR3KlR/LMPgVPIrmg649tYDZS
 bSOZs7pBirvrOT3Ue5fFuSP0J1E6BVwE8YBfQzZCUZbhezPBKS6lFDoZ/2R1xqcWBjVE
 AlaA==
X-Gm-Message-State: AOAM532cVzYj9g0cb6Xp+rqGsnxPDgDKKfn+/L7a+vCzshgbD1WJta9m
 dMMV96DvXwxOFI3jbBiX6D41lP5pVDtyMg==
X-Google-Smtp-Source: ABdhPJzLPjoKYwq19yk3SwarDfhuwmOzgWFfI2kjgugOvqyQUN5XOAqcGI0j609qI9Y/Z7dLjWXztA==
X-Received: by 2002:a1c:964b:: with SMTP id y72mr745852wmd.69.1597089035390;
 Mon, 10 Aug 2020 12:50:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b129sm976087wmb.29.2020.08.10.12.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 12:50:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/20] scripts/qapi/parser.py: improve doc comment indent
 handling
Date: Mon, 10 Aug 2020 20:50:07 +0100
Message-Id: <20200810195019.25427-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200810195019.25427-1-peter.maydell@linaro.org>
References: <20200810195019.25427-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v1->v2: Update doc-good.out as per final para.
---
 scripts/qapi/parser.py         | 81 +++++++++++++++++++++++++++-------
 tests/qapi-schema/doc-good.out |  4 +-
 2 files changed, 67 insertions(+), 18 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 7fae4478d34..d9f11eadd96 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -308,18 +308,32 @@ class QAPIDoc:
     """
 
     class Section:
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
-            super().__init__(name)
+        def __init__(self, parser, name, indent=0):
+            super().__init__(parser, name, indent)
             self.member = None
 
         def connect(self, member):
@@ -333,7 +347,7 @@ class QAPIDoc:
         self._parser = parser
         self.info = info
         self.symbol = None
-        self.body = QAPIDoc.Section()
+        self.body = QAPIDoc.Section(parser)
         # dict mapping parameter name to ArgSection
         self.args = OrderedDict()
         self.features = OrderedDict()
@@ -438,7 +452,18 @@ class QAPIDoc:
 
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
@@ -460,7 +485,17 @@ class QAPIDoc:
 
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
@@ -493,11 +528,23 @@ class QAPIDoc:
                                  % (name, self.sections[0].name))
         if self._is_section_tag(name):
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
@@ -506,21 +553,21 @@ class QAPIDoc:
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
@@ -543,7 +590,7 @@ class QAPIDoc:
     def connect_member(self, member):
         if member.name not in self.args:
             # Undocumented TODO outlaw
-            self.args[member.name] = QAPIDoc.ArgSection(member.name)
+            self.args[member.name] = QAPIDoc.ArgSection(self._parser, member.name)
         self.args[member.name].connect(member)
 
     def connect_feature(self, feature):
@@ -551,6 +598,8 @@ class QAPIDoc:
             raise QAPISemError(feature.info,
                                "feature '%s' lacks documentation"
                                % feature.name)
+            self.features[feature.name] = QAPIDoc.ArgSection(self._parser,
+                                                             feature.name)
         self.features[feature.name].connect(feature)
 
     def check_expr(self, expr):
diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index 0ef85d959ac..bbf77b08dc3 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -158,7 +158,7 @@ doc symbol=Alternate
 
     arg=i
 an integer
-    @b is undocumented
+@b is undocumented
     arg=b
 
     feature=alt-feat
@@ -173,7 +173,7 @@ doc symbol=cmd
 the first argument
     arg=arg2
 the second
-       argument
+argument
     arg=arg3
 
     feature=cmd-feat1
-- 
2.20.1


