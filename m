Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BDF3677CB
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 05:12:54 +0200 (CEST)
Received: from localhost ([::1]:50904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZPlt-0003Wm-T9
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 23:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPh1-0006aZ-2o
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPgr-0006VJ-2Y
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619060858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0rt7XxriI9T4iNSOpP5SwupV0N8/US6g4GlbT3Kf+rA=;
 b=W9VjtHOWZxkt8q4SC/Xx2ZAAZmqav5mzknslLTNY9JmVa3ewYImLgmPRvuhGob35/7k4Gw
 aMU0GDcoFQXUpHpIg00PoTQv1nljFnGo4ul3aHfZGrlprLvQOZCMpWGhmjDsmWXjtacajn
 oLWhh24CdDPaGBukIdp6YZxUyvrvl+8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-tjK8pptTOXKDne445NoxRg-1; Wed, 21 Apr 2021 23:07:36 -0400
X-MC-Unique: tjK8pptTOXKDne445NoxRg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4D0A107ACCA;
 Thu, 22 Apr 2021 03:07:35 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3E852915B;
 Thu, 22 Apr 2021 03:07:34 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/22] qapi/parser: add docstrings
Date: Wed, 21 Apr 2021 23:07:14 -0400
Message-Id: <20210422030720.3685766-17-jsnow@redhat.com>
In-Reply-To: <20210422030720.3685766-1-jsnow@redhat.com>
References: <20210422030720.3685766-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>

---

My hubris is infinite.

OK, I only added a few -- to help me remember how the parser works at a glance.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 66 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index dbbd0fcbc2f..8fc77808ace 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -51,7 +51,24 @@ def __init__(self, parser: 'QAPISchemaParser', msg: str):
 
 
 class QAPISchemaParser:
+    """
+    Performs parsing of a QAPI schema source file.
 
+    :param fname: Path to the source file.
+    :param previously_included:
+        The absolute paths of previously included source files.
+        Only used by recursive calls to avoid re-parsing files.
+    :param incl_info:
+       `QAPISourceInfo` for the parent document.
+       This may be None if this is the root schema document.
+
+    :ivar exprs: Resulting parsed expressions.
+    :ivar docs: Resulting parsed documentation blocks.
+
+    :raise OSError: For problems opening the root schema document.
+    :raise QAPIParseError: For JSON or QAPIDoc syntax problems.
+    :raise QAPISemError: For various semantic issues with the schema.
+    """
     def __init__(self,
                  fname: str,
                  previously_included: Optional[Set[str]] = None,
@@ -77,6 +94,11 @@ def __init__(self,
         self._parse()
 
     def _parse(self) -> None:
+        """
+        Parse the QAPI schema document.
+
+        :return: None; results are stored in ``exprs`` and ``docs``.
+        """
         cur_doc = None
 
         with open(self._fname, 'r', encoding='utf-8') as fp:
@@ -197,6 +219,50 @@ def _check(name: str, value: object) -> List[str]:
             raise QAPISemError(info, "unknown pragma '%s'" % name)
 
     def accept(self, skip_comment: bool = True) -> None:
+        """
+        Read the next lexeme and process it into a token.
+
+        :Object state:
+          :tok: represents the token type. See below for values.
+          :pos: is the position of the first character in the lexeme.
+          :cursor: is the position of the next character.
+          :val: is the variable value of the token, if any.
+
+        Single-character tokens:
+
+        These include ``LBRACE``, ``RBRACE``, ``COLON``, ``COMMA``,
+        ``LSQB``, and ``RSQB``.  ``tok`` holds the single character
+        lexeme.  ``val`` is ``None``.
+
+        Multi-character tokens:
+
+        - ``COMMENT``:
+
+          - This token is not normally yielded by the lexer, but it
+            can be when ``skip_comment`` is False.
+          - ``tok`` is the value ``"#"``.
+          - ``val`` is a string including all chars until end-of-line.
+
+        - ``STRING``:
+
+          - ``tok`` is the ``"'"``, the single quote.
+          - ``value`` is the string, *excluding* the quotes.
+
+        - ``TRUE`` and ``FALSE``:
+
+          - ``tok`` is either ``"t"`` or ``"f"`` accordingly.
+          - ``val`` is either ``True`` or ``False`` accordingly.
+
+        - ``NEWLINE`` and ``SPACE``:
+
+          - These are consumed by the lexer directly. ``line_pos`` and
+            ``info`` are advanced when ``NEWLINE`` is encountered.
+            ``tok`` is set to ``None`` upon reaching EOF.
+
+        :param skip_comment:
+            When false, return ``COMMENT`` tokens.
+            This is used when reading documentation blocks.
+        """
         while True:
             self.tok = self.src[self.cursor]
             self.pos = self.cursor
-- 
2.30.2


