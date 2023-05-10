Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAAF6FD902
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 10:13:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwew5-0008NL-J4; Wed, 10 May 2023 04:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwew3-0008MO-ID
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:12:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwew1-00062J-KF
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:12:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683706349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RXrclfjSm/+GeY3LrP/Uq0GfAd7P5wj8o7VQUa2F+ZU=;
 b=HYUJMaG+vIKyhnuhbMu1qtmpMB2u5rWOaNVrEc4vilQyxULi4QkSyuLCKSeygvhWIG6PrM
 zUoSco0Tsir03D3N9Pfa2mtGpQqhdauPGGXETFNwmYgrz9JPTn7PvtdMN+SgzMs1sTuDMg
 4OSDPY0v1c1/3dm24aOlcLW6N+s0yqU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-tJ0HmZcnM-KxC9ExKW83Cw-1; Wed, 10 May 2023 04:12:27 -0400
X-MC-Unique: tJ0HmZcnM-KxC9ExKW83Cw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10CBE2802521;
 Wed, 10 May 2023 08:12:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3CE14078906;
 Wed, 10 May 2023 08:12:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 73EB321E66E5; Wed, 10 May 2023 10:12:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	Juan Quintela <quintela@redhat.com>
Subject: [PULL v2 14/17] qapi: Section parameter @indent is no longer used,
 drop
Date: Wed, 10 May 2023 10:12:24 +0200
Message-Id: <20230510081224.3588673-4-armbru@redhat.com>
In-Reply-To: <20230510081224.3588673-1-armbru@redhat.com>
References: <20230510081224.3588673-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
index 285c9ff4c9..4923a59d60 100644
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
@@ -627,7 +626,7 @@ def _append_args_line(self, line: str) -> None:
         match = self._match_at_name_colon(line)
         if match:
             line = line[match.end():]
-            self._start_args_section(match.group(1), 0)
+            self._start_args_section(match.group(1))
         elif self._match_section_tag(line):
             self._append_line = self._append_various_line
             self._append_various_line(line)
@@ -648,7 +647,7 @@ def _append_features_line(self, line: str) -> None:
         match = self._match_at_name_colon(line)
         if match:
             line = line[match.end():]
-            self._start_features_section(match.group(1), 0)
+            self._start_features_section(match.group(1))
         elif self._match_section_tag(line):
             self._append_line = self._append_various_line
             self._append_various_line(line)
@@ -681,15 +680,14 @@ def _append_various_line(self, line: str) -> None:
         match = self._match_section_tag(line)
         if match:
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
@@ -697,22 +695,21 @@ def _start_symbol_section(
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


