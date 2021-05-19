Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F92E389689
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:21:53 +0200 (CEST)
Received: from localhost ([::1]:44614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRlQ-0006NP-HR
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljR7M-00069i-8Q
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:40:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljR7A-00025q-74
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:40:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621449615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sxJhdCOrXufnbDk8jQ94+7NPvX3C7enbjBd7xpEQY/Q=;
 b=McTcNxopi6EIKHOT1P3UZsfbfON/xBvVMw6JEicni3PculjfoTNZHevXPCuORuJ6QB1w/6
 XJQIzlfMeAa4cfvyzxk9p0uGqWfKX2KOrAo9IpVTv/wsBi0La0mCJccCFOA+fWKKVNpyuZ
 dfI2chuBTXCSpOf/WL5Yx7ZnXGl8V5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-RNRtnR4hPGOlq76xCuk6tw-1; Wed, 19 May 2021 14:40:13 -0400
X-MC-Unique: RNRtnR4hPGOlq76xCuk6tw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97699501F4;
 Wed, 19 May 2021 18:40:12 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77BEC690EF;
 Wed, 19 May 2021 18:40:11 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/15] qapi/parser: add docstrings
Date: Wed, 19 May 2021 14:39:51 -0400
Message-Id: <20210519183951.3946870-16-jsnow@redhat.com>
In-Reply-To: <20210519183951.3946870-1-jsnow@redhat.com>
References: <20210519183951.3946870-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 69 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index b0f18c0d176..06167ed3e0a 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -47,7 +47,27 @@ def __init__(self, parser: 'QAPISchemaParser', msg: str):
 
 
 class QAPISchemaParser:
+    """
+    Parse QAPI schema source.
 
+    Parse a JSON-esque schema file and process directives.  See
+    qapi-code-gen.txt section "Schema Syntax" for the exact syntax.
+    Grammatical validation is handled later by `expr.check_exprs()`.
+
+    :param fname: Source file name.
+    :param previously_included:
+        The absolute names of previously included source files,
+        if being invoked from another parser.
+    :param incl_info:
+       `QAPISourceInfo` belonging to the parent module.
+       ``None`` implies this is the root module.
+
+    :ivar exprs: Resulting parsed expressions.
+    :ivar docs: Resulting parsed documentation blocks.
+
+    :raise OSError: For problems reading the root schema document.
+    :raise QAPIError: For errors in the schema source.
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
@@ -199,6 +224,50 @@ def check_list_str(name: str, value: object) -> List[str]:
             raise QAPISemError(info, "unknown pragma '%s'" % name)
 
     def accept(self, skip_comment: bool = True) -> None:
+        """
+        Read and store the next token.
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


