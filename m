Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF25F38B5B0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 20:02:20 +0200 (CEST)
Received: from localhost ([::1]:59308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljmzz-0000LM-RB
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 14:02:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljmrU-0002q8-2J
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:53:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljmr3-0006bO-8i
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621533183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dYC3Y2MQb8D/rZywfCIDucYCueVHKE+1f9M2XkMhdSk=;
 b=Qkf6ObgxdB1Sitet9n/hUxgs+W7Gl+jKyfYDN7bJOvFvoufsjUw2Qw7xUaJpO5EZM8QENQ
 xEJ24Gp6WDcBHXGlN7/sgyqs9/KXOhmdAWfHgn4ZPmrphKGErCUmeaX8qjH7uuy9ZnyiPa
 eiNH/accf0BNq2rS9wEpaOiYX8rbhMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-VzZHqvXWPJ6rh8VE1u1_7g-1; Thu, 20 May 2021 13:53:01 -0400
X-MC-Unique: VzZHqvXWPJ6rh8VE1u1_7g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C98F01926DA3;
 Thu, 20 May 2021 17:53:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A81A19C59;
 Thu, 20 May 2021 17:53:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 69DFD1132922; Thu, 20 May 2021 19:52:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/15] qapi/parser: add docstrings
Date: Thu, 20 May 2021 19:52:56 +0200
Message-Id: <20210520175256.1119684-16-armbru@redhat.com>
In-Reply-To: <20210520175256.1119684-1-armbru@redhat.com>
References: <20210520175256.1119684-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210519183951.3946870-16-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
[Doc string spacing tweaked slightly]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/parser.py | 69 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index b0f18c0d17..f03ba2cfec 100644
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
+        :return: None.  Results are stored in ``.exprs`` and ``.docs``.
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
+            None.  Several instance attributes are updated instead:
+
+            - ``.tok`` represents the token type.  See below for values.
+            - ``.info`` describes the token's source location.
+            - ``.val`` is the token's value, if any.  See below.
+            - ``.pos`` is the buffer index of the first character of
+              the token.
+
+        * Single-character tokens:
+
+            These are "{", "}", ":", ",", "[", and "]".
+            ``.tok`` holds the single character and ``.val`` is None.
+
+        * Multi-character tokens:
+
+          * COMMENT:
+
+            This token is not normally returned by the lexer, but it can
+            be when ``skip_comment`` is False.  ``.tok`` is "#", and
+            ``.val`` is a string including all chars until end-of-line,
+            including the "#" itself.
+
+          * STRING:
+
+            ``.tok`` is "'", the single quote.  ``.val`` contains the
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
2.26.3


