Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31C737B189
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 00:17:54 +0200 (CEST)
Received: from localhost ([::1]:50046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgahN-0007te-R5
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 18:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaWF-0007u0-8N
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaWD-0006VW-Cb
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620770780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/bKqAsIFYdKeQjls6RofjHnFqB2hrk6lkmg1CBgA8TA=;
 b=JtOz8nz7GM7iyBFm5UZg2jk2bUpN0Ko9gMlvJSRUJKwugYrGaEGkWEppOPd+A7wu3XbsU7
 MZQMRyW/JeV1B/nAJDER6VYc8VOwXU0jFEmAs/mPR2T64iPKkAQyHe0oAz5+X0Nw43P7+O
 QLtFM8Onh5yiUHPf6pHX+B3fl2v8QRg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-gdBELCJ5NFC7c6ZH5eYUQw-1; Tue, 11 May 2021 18:06:18 -0400
X-MC-Unique: gdBELCJ5NFC7c6ZH5eYUQw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D43CAFC81;
 Tue, 11 May 2021 22:06:17 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE52DBA6F;
 Tue, 11 May 2021 22:06:16 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/21] qapi/parser: add docstrings
Date: Tue, 11 May 2021 18:05:55 -0400
Message-Id: <20210511220601.2110055-16-jsnow@redhat.com>
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

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 68 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index e80e0a7d965..ed543a2b7a4 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -47,7 +47,27 @@ def __init__(self, parser: 'QAPISchemaParser', msg: str):
 
 
 class QAPISchemaParser:
+    """
+    Performs syntactic parsing of a QAPI schema source file.
 
+    Parses a JSON-esque schema file, See qapi-code-gen.txt section
+    "Schema Syntax" for more information. Grammatical validation
+    is handled later by `expr.check_exprs()`.
+
+    :param fname: Source filename.
+    :param previously_included:
+        The absolute pathnames of previously included source files,
+        if being invoked from another parser.
+    :param incl_info:
+       `QAPISourceInfo` belonging to the parent module.
+       ``None`` implies this is the root module.
+
+    :ivar exprs: Resulting parsed expressions.
+    :ivar docs: Resulting parsed documentation blocks.
+
+    :raise OSError: For problems opening the root schema document.
+    :raise QAPIError: For syntactic or semantic parsing errors.
+    """
     def __init__(self,
                  fname: str,
                  previously_included: Optional[Set[str]] = None,
@@ -73,6 +93,11 @@ def __init__(self,
         self._parse()
 
     def _parse(self) -> None:
+        """
+        Parse the QAPI schema document.
+
+        :return: None. Results are stored in ``.exprs`` and ``.docs``.
+        """
         cur_doc = None
 
         # May raise OSError; allow the caller to handle it.
@@ -199,6 +224,49 @@ def check_list_str(name: str, value: object) -> List[str]:
             raise QAPISemError(info, "unknown pragma '%s'" % name)
 
     def accept(self, skip_comment: bool = True) -> None:
+        """Read and store the next token.
+
+        :param skip_comment:
+            When false, return COMMENT tokens ("#").
+            This is used when reading documentation blocks.
+
+        :return:
+            None. Several instance attributes are updated instead:
+
+            - ``.tok`` represents the token type. See below for values.
+            - ``.info`` describes the token's source location.
+            - ``.val`` is the token's value, if any. See below.
+            - ``.pos`` is the buffer index of the first character of
+              the token.
+
+        * Single-character tokens:
+
+            These are "{", "}", ":", ",", "[", and "]". ``.tok`` holds
+            the single character and ``.val`` is None.
+
+        * Multi-character tokens:
+
+          * COMMENT:
+
+            This token is not normally returned by the lexer, but it can
+            be when ``skip_comment`` is False. ``.tok`` is "#", and
+            ``.val`` is a string including all chars until end-of-line,
+            including the "#" itself.
+
+          * STRING:
+
+            ``.tok`` is "'", the single quote. ``.val`` contains the
+            string, excluding the surrounding quotes.
+
+          * TRUE and FALSE:
+
+            ``.tok`` is either "t" or "f", ``.val`` will be the
+            corresponding bool value.
+
+          * EOF:
+
+            ``.tok`` and ``.val`` will both be None at EOF.
+        """
         while True:
             self.tok = self.src[self.cursor]
             self.pos = self.cursor
-- 
2.30.2


