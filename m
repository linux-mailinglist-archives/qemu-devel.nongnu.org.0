Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAA32DCAE9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 03:16:25 +0100 (CET)
Received: from localhost ([::1]:51466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpiq8-0001Lb-38
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 21:16:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpia9-0002Ei-4s
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:59:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpia2-0007BQ-AP
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:59:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608170384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nQ3bg5bXX9ztJg0RPsfYoKkxqqZZn1Ehie9AJ9A8/M4=;
 b=QiYdQFCgvG/x552bq8m+qwvmaBg0rFn4VdiAvBV1YguBnnhvSSAXqGW0IcePqGNz6fLv3z
 3JmHVXBulJRvQFlLg/s1URDkqORq6ZeENKuCVDFY0AFm5ha1oQcMic/xrQoCZ09+Y5nT7P
 4f9WJZ0gb4Chhy0DvqvzBUhCUB7V27s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-4FxZT4dsNmmU1NwbnudNug-1; Wed, 16 Dec 2020 20:59:43 -0500
X-MC-Unique: 4FxZT4dsNmmU1NwbnudNug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3ED65800D55;
 Thu, 17 Dec 2020 01:59:42 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-131.rdu2.redhat.com [10.10.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A0071E5;
 Thu, 17 Dec 2020 01:59:41 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/12] tests/qapi-schema: Add quotes to module name in test
 output
Date: Wed, 16 Dec 2020 20:59:25 -0500
Message-Id: <20201217015927.197287-11-jsnow@redhat.com>
In-Reply-To: <20201217015927.197287-1-jsnow@redhat.com>
References: <20201217015927.197287-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A forthcoming patch is going to allow the empty string as a name for the
builtin module, and quotes will help us see that in test output. Without
this, git will be upset about trailing empty spaces in test output, so
the quotes are necessary.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qapi-schema/comments.out           | 4 ++--
 tests/qapi-schema/doc-good.out           | 4 ++--
 tests/qapi-schema/empty.out              | 4 ++--
 tests/qapi-schema/event-case.out         | 4 ++--
 tests/qapi-schema/include-repetition.out | 8 ++++----
 tests/qapi-schema/include-simple.out     | 6 +++---
 tests/qapi-schema/indented-expr.out      | 4 ++--
 tests/qapi-schema/qapi-schema-test.out   | 8 ++++----
 tests/qapi-schema/test-qapi.py           | 2 +-
 9 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/tests/qapi-schema/comments.out b/tests/qapi-schema/comments.out
index 273f0f54e16..08aba8354e2 100644
--- a/tests/qapi-schema/comments.out
+++ b/tests/qapi-schema/comments.out
@@ -1,4 +1,4 @@
-module None
+module "None"
 object q_empty
 enum QType
     prefix QTYPE
@@ -9,7 +9,7 @@ enum QType
     member qdict
     member qlist
     member qbool
-module comments.json
+module "comments.json"
 enum Status
     member good
     member bad
diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index 419284dae29..83a3d9bd69b 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -1,4 +1,4 @@
-module None
+module "None"
 object q_empty
 enum QType
     prefix QTYPE
@@ -9,7 +9,7 @@ enum QType
     member qdict
     member qlist
     member qbool
-module doc-good.json
+module "doc-good.json"
 enum Enum
     member one
         if ['defined(IFONE)']
diff --git a/tests/qapi-schema/empty.out b/tests/qapi-schema/empty.out
index 69666c39ad2..0dac23c80c1 100644
--- a/tests/qapi-schema/empty.out
+++ b/tests/qapi-schema/empty.out
@@ -1,4 +1,4 @@
-module None
+module "None"
 object q_empty
 enum QType
     prefix QTYPE
@@ -9,4 +9,4 @@ enum QType
     member qdict
     member qlist
     member qbool
-module empty.json
+module "empty.json"
diff --git a/tests/qapi-schema/event-case.out b/tests/qapi-schema/event-case.out
index 42ae519656d..ace511ba5a9 100644
--- a/tests/qapi-schema/event-case.out
+++ b/tests/qapi-schema/event-case.out
@@ -1,4 +1,4 @@
-module None
+module "None"
 object q_empty
 enum QType
     prefix QTYPE
@@ -9,6 +9,6 @@ enum QType
     member qdict
     member qlist
     member qbool
-module event-case.json
+module "event-case.json"
 event oops None
     boxed=False
diff --git a/tests/qapi-schema/include-repetition.out b/tests/qapi-schema/include-repetition.out
index 0b654ddebb6..f7ab4987943 100644
--- a/tests/qapi-schema/include-repetition.out
+++ b/tests/qapi-schema/include-repetition.out
@@ -1,4 +1,4 @@
-module None
+module "None"
 object q_empty
 enum QType
     prefix QTYPE
@@ -9,15 +9,15 @@ enum QType
     member qdict
     member qlist
     member qbool
-module include-repetition.json
+module "include-repetition.json"
 include comments.json
 include include-repetition-sub.json
 include comments.json
-module comments.json
+module "comments.json"
 enum Status
     member good
     member bad
     member ugly
-module include-repetition-sub.json
+module "include-repetition-sub.json"
 include comments.json
 include comments.json
diff --git a/tests/qapi-schema/include-simple.out b/tests/qapi-schema/include-simple.out
index 061f81e5090..81bdeb887b6 100644
--- a/tests/qapi-schema/include-simple.out
+++ b/tests/qapi-schema/include-simple.out
@@ -1,4 +1,4 @@
-module None
+module "None"
 object q_empty
 enum QType
     prefix QTYPE
@@ -9,9 +9,9 @@ enum QType
     member qdict
     member qlist
     member qbool
-module include-simple.json
+module "include-simple.json"
 include include-simple-sub.json
-module include-simple-sub.json
+module "include-simple-sub.json"
 enum Status
     member good
     member bad
diff --git a/tests/qapi-schema/indented-expr.out b/tests/qapi-schema/indented-expr.out
index 04356775cd1..361a58185e6 100644
--- a/tests/qapi-schema/indented-expr.out
+++ b/tests/qapi-schema/indented-expr.out
@@ -1,4 +1,4 @@
-module None
+module "None"
 object q_empty
 enum QType
     prefix QTYPE
@@ -9,7 +9,7 @@ enum QType
     member qdict
     member qlist
     member qbool
-module indented-expr.json
+module "indented-expr.json"
 command eins None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
 command zwei None -> None
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 8868ca0dca9..4f5ab9fd596 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -1,4 +1,4 @@
-module None
+module "None"
 object q_empty
 enum QType
     prefix QTYPE
@@ -9,7 +9,7 @@ enum QType
     member qdict
     member qlist
     member qbool
-module qapi-schema-test.json
+module "qapi-schema-test.json"
 object TestStruct
     member integer: int optional=False
     member boolean: bool optional=False
@@ -443,11 +443,11 @@ command test-command-cond-features3 None -> None
 event TEST-EVENT-FEATURES1 None
     boxed=False
     feature deprecated
-module include/sub-module.json
+module "include/sub-module.json"
 include sub-sub-module.json
 object SecondArrayRef
     member s: StatusList optional=False
-module sub-sub-module.json
+module "sub-sub-module.json"
 array StatusList Status
 enum Status
     member good
diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi.py
index e8db9d09d91..4adf0b3c185 100755
--- a/tests/qapi-schema/test-qapi.py
+++ b/tests/qapi-schema/test-qapi.py
@@ -25,7 +25,7 @@
 class QAPISchemaTestVisitor(QAPISchemaVisitor):
 
     def visit_module(self, name):
-        print('module %s' % name)
+        print('module "%s"' % name)
 
     def visit_include(self, name, info):
         print('include %s' % name)
-- 
2.26.2


