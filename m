Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF426FC130
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 10:05:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwIGw-00007M-2P; Tue, 09 May 2023 04:00:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwIGt-00005V-4a
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:00:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwIGr-0008WQ-Dk
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:00:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683619228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FvUllLDLPKYO8ys7jy7h1a3CYFLt/gSwkapma1yTRd8=;
 b=JMznOZkmF5eE7m5nmKKJEJXEMDYo1GclVuvGokXsfFFVAm6G6iUF9ulTaX4ljdkctaPKXP
 tRlfojqSFRpJRe/jBMdQPOu/1ULsDNAMJT1c1D6O0OiHaCsaf0LGdsWYYNzb0PSFJutXJC
 RRCwcwXSWM+KvG7yYwVgNjjBfFp++KU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-Q4DsQckCOh-Sz_OGFvyNww-1; Tue, 09 May 2023 04:00:25 -0400
X-MC-Unique: Q4DsQckCOh-Sz_OGFvyNww-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 734C487DC04;
 Tue,  9 May 2023 08:00:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 145EF1121314;
 Tue,  9 May 2023 08:00:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3CCE421F1643; Tue,  9 May 2023 10:00:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	Juan Quintela <quintela@redhat.com>
Subject: [PULL 14/17] qapi: Section parameter @indent is no longer used, drop
Date: Tue,  9 May 2023 10:00:08 +0200
Message-Id: <20230509080011.3231661-15-armbru@redhat.com>
In-Reply-To: <20230509080011.3231661-1-armbru@redhat.com>
References: <20230509080011.3231661-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230428105429.1687850-15-armbru@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 scripts/qapi/parser.py | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 3e29b7bf48..22ee631198 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -468,8 +468,7 @@ class QAPIDoc:
     class Section:
         # pylint: disable=too-few-public-methods
         def __init__(self, parser: QAPISchemaParser,
-                     name: Optional[str] = None, indent: int = 0):
-
+                     name: Optional[str] = None):
             # parser, for error messages about indentation
             self._parser = parser
             # optional section name (argument/member or section name)
@@ -500,8 +499,8 @@ def append(self, line: str) -> None:
 
     class ArgSection(Section):
         def __init__(self, parser: QAPISchemaParser,
-                     name: str, indent: int = 0):
-            super().__init__(parser, name, indent)
+                     name: str):
+            super().__init__(parser, name)
             self.member: Optional['QAPISchemaMember'] = None
 
         def connect(self, member: 'QAPISchemaMember') -> None:
@@ -626,7 +625,7 @@ def _append_args_line(self, line: str) -> None:
         """
         if match := self._match_at_name_colon(line):
             line = line[match.end():]
-            self._start_args_section(match.group(1), 0)
+            self._start_args_section(match.group(1))
         elif self._match_section_tag(line):
             self._append_line = self._append_various_line
             self._append_various_line(line)
@@ -646,7 +645,7 @@ def _append_args_line(self, line: str) -> None:
     def _append_features_line(self, line: str) -> None:
         if match := self._match_at_name_colon(line):
             line = line[match.end():]
-            self._start_features_section(match.group(1), 0)
+            self._start_features_section(match.group(1))
         elif self._match_section_tag(line):
             self._append_line = self._append_various_line
             self._append_various_line(line)
@@ -677,15 +676,14 @@ def _append_various_line(self, line: str) -> None:
                                  % (match.group(1), self.sections[0].name))
         if match := self._match_section_tag(line):
             line = line[match.end():]
-            self._start_section(match.group(1), 0)
+            self._start_section(match.group(1))
 
         self._append_freeform(line)
 
     def _start_symbol_section(
             self,
             symbols_dict: Dict[str, 'QAPIDoc.ArgSection'],
-            name: str,
-            indent: int) -> None:
+            name: str) -> None:
         # FIXME invalid names other than the empty string aren't flagged
         if not name:
             raise QAPIParseError(self._parser, "invalid parameter name")
@@ -693,22 +691,21 @@ def _start_symbol_section(
             raise QAPIParseError(self._parser,
                                  "'%s' parameter name duplicated" % name)
         assert not self.sections
-        new_section = QAPIDoc.ArgSection(self._parser, name, indent)
+        new_section = QAPIDoc.ArgSection(self._parser, name)
         self._switch_section(new_section)
         symbols_dict[name] = new_section
 
-    def _start_args_section(self, name: str, indent: int) -> None:
-        self._start_symbol_section(self.args, name, indent)
+    def _start_args_section(self, name: str) -> None:
+        self._start_symbol_section(self.args, name)
 
-    def _start_features_section(self, name: str, indent: int) -> None:
-        self._start_symbol_section(self.features, name, indent)
+    def _start_features_section(self, name: str) -> None:
+        self._start_symbol_section(self.features, name)
 
-    def _start_section(self, name: Optional[str] = None,
-                       indent: int = 0) -> None:
+    def _start_section(self, name: Optional[str] = None) -> None:
         if name in ('Returns', 'Since') and self.has_section(name):
             raise QAPIParseError(self._parser,
                                  "duplicated '%s' section" % name)
-        new_section = QAPIDoc.Section(self._parser, name, indent)
+        new_section = QAPIDoc.Section(self._parser, name)
         self._switch_section(new_section)
         self.sections.append(new_section)
 
-- 
2.39.2


