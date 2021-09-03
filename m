Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E81400612
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:48:06 +0200 (CEST)
Received: from localhost ([::1]:48004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFAT-0006w6-AW
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMEvL-0005ur-63
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:32:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMEvI-0003fj-JQ
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630697543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bqmmhk6AT/6gkuvlIn9SelRXi/MM9KwDWPHPBhsWZhQ=;
 b=TrqX4E3+RVUS7LZK0lJuzeAwRGWqHv6KE/sG4udbncOcHw1sQ2l5fZhmwypJOHTlYAeCdl
 9cOtMdFQXuNzz5RB6yoJW07jmju+ZrdsQzAtSgJrtokdHpyXqJWfRqU7iJl24Gpq5Qdi+C
 hTXMVzK4q8Z3+d2HvHF5A4g2KgO2TuA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-NbZoy6esOQ-FjwzciQxxgQ-1; Fri, 03 Sep 2021 15:32:22 -0400
X-MC-Unique: NbZoy6esOQ-FjwzciQxxgQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 745291006C85;
 Fri,  3 Sep 2021 19:32:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BC8F779CE;
 Fri,  3 Sep 2021 19:32:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F032B11380CC; Fri,  3 Sep 2021 21:32:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/13] tests/qapi-schema: Hide OrderedDict in test output
Date: Fri,  3 Sep 2021 21:32:07 +0200
Message-Id: <20210903193209.1426791-12-armbru@redhat.com>
In-Reply-To: <20210903193209.1426791-1-armbru@redhat.com>
References: <20210903193209.1426791-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 5d83b9a130 "qapi: replace if condition list with dict
{'all': [...]}", we represent if conditionals as trees consisting of
OrderedDict, list and str.  This results in less than legible test
output.  For instance:

    if OrderedDict([('not', OrderedDict([('any', [OrderedDict([('not', 'TEST_IF_EVT')]), OrderedDict([('not', 'TEST_IF_STRUCT')])])]))])

We intend to replace OrderedDict by dict when we get Python 3.7, which
will result in more legible output:

    if {'not': {'any': [{'not': 'TEST_IF_EVT'}, {'not': 'TEST_IF_STRUCT'}]}}

Can't wait: put in a hack to get that now, with a comment to revert it
when we replace OrderedDict.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210831123809.1107782-11-armbru@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/qapi-schema/doc-good.out         |  6 +++---
 tests/qapi-schema/qapi-schema-test.out | 30 +++++++++++++-------------
 tests/qapi-schema/test-qapi.py         | 11 +++++++++-
 3 files changed, 28 insertions(+), 19 deletions(-)

diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index d72f3047e9..478fe6f82e 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -18,7 +18,7 @@ enum Enum
     feature enum-feat
 object Base
     member base1: Enum optional=False
-    if OrderedDict([('all', ['IFALL1', 'IFALL2'])])
+    if {'all': ['IFALL1', 'IFALL2']}
 object Variant1
     member var1: str optional=False
         if IFSTR
@@ -30,7 +30,7 @@ object Object
     tag base1
     case one: Variant1
     case two: Variant2
-        if OrderedDict([('any', ['IFONE', 'IFTWO'])])
+        if {'any': ['IFONE', 'IFTWO']}
     feature union-feat1
 object q_obj_Variant1-wrapper
     member data: Variant1 optional=False
@@ -51,7 +51,7 @@ alternate Alternate
     tag type
     case i: int
     case b: bool
-    if OrderedDict([('not', OrderedDict([('any', ['IFONE', 'IFTWO'])]))])
+    if {'not': {'any': ['IFONE', 'IFTWO']}}
     feature alt-feat
 object q_obj_cmd-arg
     member arg1: int optional=False
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 5d2e830ba2..d557fe2d89 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -311,40 +311,40 @@ enum TestIfUnionKind
     member foo
     member bar
         if TEST_IF_UNION_BAR
-    if OrderedDict([('all', ['TEST_IF_UNION', 'TEST_IF_STRUCT'])])
+    if {'all': ['TEST_IF_UNION', 'TEST_IF_STRUCT']}
 object TestIfUnion
     member type: TestIfUnionKind optional=False
     tag type
     case foo: q_obj_TestStruct-wrapper
     case bar: q_obj_str-wrapper
         if TEST_IF_UNION_BAR
-    if OrderedDict([('all', ['TEST_IF_UNION', 'TEST_IF_STRUCT'])])
+    if {'all': ['TEST_IF_UNION', 'TEST_IF_STRUCT']}
 object q_obj_test-if-union-cmd-arg
     member union-cmd-arg: TestIfUnion optional=False
-    if OrderedDict([('all', ['TEST_IF_UNION', 'TEST_IF_STRUCT'])])
+    if {'all': ['TEST_IF_UNION', 'TEST_IF_STRUCT']}
 command test-if-union-cmd q_obj_test-if-union-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if OrderedDict([('all', ['TEST_IF_UNION', 'TEST_IF_STRUCT'])])
+    if {'all': ['TEST_IF_UNION', 'TEST_IF_STRUCT']}
 alternate TestIfAlternate
     tag type
     case foo: int
     case bar: TestStruct
         if TEST_IF_ALT_BAR
-    if OrderedDict([('all', ['TEST_IF_ALT', 'TEST_IF_STRUCT'])])
+    if {'all': ['TEST_IF_ALT', 'TEST_IF_STRUCT']}
 object q_obj_test-if-alternate-cmd-arg
     member alt-cmd-arg: TestIfAlternate optional=False
-    if OrderedDict([('all', ['TEST_IF_ALT', 'TEST_IF_STRUCT'])])
+    if {'all': ['TEST_IF_ALT', 'TEST_IF_STRUCT']}
 command test-if-alternate-cmd q_obj_test-if-alternate-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if OrderedDict([('all', ['TEST_IF_ALT', 'TEST_IF_STRUCT'])])
+    if {'all': ['TEST_IF_ALT', 'TEST_IF_STRUCT']}
 object q_obj_test-if-cmd-arg
     member foo: TestIfStruct optional=False
     member bar: TestIfEnum optional=False
         if TEST_IF_CMD_BAR
-    if OrderedDict([('all', ['TEST_IF_CMD', 'TEST_IF_STRUCT'])])
+    if {'all': ['TEST_IF_CMD', 'TEST_IF_STRUCT']}
 command test-if-cmd q_obj_test-if-cmd-arg -> UserDefThree
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if OrderedDict([('all', ['TEST_IF_CMD', 'TEST_IF_STRUCT'])])
+    if {'all': ['TEST_IF_CMD', 'TEST_IF_STRUCT']}
 command test-cmd-return-def-three None -> UserDefThree
     gen=True success_response=True boxed=False oob=False preconfig=False
 array TestIfEnumList TestIfEnum
@@ -353,13 +353,13 @@ object q_obj_TEST_IF_EVENT-arg
     member foo: TestIfStruct optional=False
     member bar: TestIfEnumList optional=False
         if TEST_IF_EVT_BAR
-    if OrderedDict([('all', ['TEST_IF_EVT', 'TEST_IF_STRUCT'])])
+    if {'all': ['TEST_IF_EVT', 'TEST_IF_STRUCT']}
 event TEST_IF_EVENT q_obj_TEST_IF_EVENT-arg
     boxed=False
-    if OrderedDict([('all', ['TEST_IF_EVT', 'TEST_IF_STRUCT'])])
+    if {'all': ['TEST_IF_EVT', 'TEST_IF_STRUCT']}
 event TEST_IF_EVENT2 None
     boxed=False
-    if OrderedDict([('not', OrderedDict([('any', [OrderedDict([('not', 'TEST_IF_EVT')]), OrderedDict([('not', 'TEST_IF_STRUCT')])])]))])
+    if {'not': {'any': [{'not': 'TEST_IF_EVT'}, {'not': 'TEST_IF_STRUCT'}]}}
 object FeatureStruct0
     member foo: int optional=False
 object FeatureStruct1
@@ -392,11 +392,11 @@ object CondFeatureStruct2
 object CondFeatureStruct3
     member foo: int optional=False
     feature feature1
-        if OrderedDict([('all', ['TEST_IF_COND_1', 'TEST_IF_COND_2'])])
+        if {'all': ['TEST_IF_COND_1', 'TEST_IF_COND_2']}
 object CondFeatureStruct4
     member foo: int optional=False
     feature feature1
-        if OrderedDict([('any', ['TEST_IF_COND_1', 'TEST_IF_COND_2'])])
+        if {'any': ['TEST_IF_COND_1', 'TEST_IF_COND_2']}
 enum FeatureEnum1
     member eins
     member zwei
@@ -447,7 +447,7 @@ command test-command-cond-features2 None -> None
 command test-command-cond-features3 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     feature feature1
-        if OrderedDict([('all', ['TEST_IF_COND_1', 'TEST_IF_COND_2'])])
+        if {'all': ['TEST_IF_COND_1', 'TEST_IF_COND_2']}
 event TEST_EVENT_FEATURES0 FeatureStruct1
     boxed=False
 event TEST_EVENT_FEATURES1 None
diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi.py
index c92be2d086..73cffae2b6 100755
--- a/tests/qapi-schema/test-qapi.py
+++ b/tests/qapi-schema/test-qapi.py
@@ -94,8 +94,17 @@ def _print_variants(variants):
 
     @staticmethod
     def _print_if(ifcond, indent=4):
+        # TODO Drop this hack after replacing OrderedDict by plain
+        # dict (requires Python 3.7)
+        def _massage(subcond):
+            if isinstance(subcond, str):
+                return subcond
+            if isinstance(subcond, list):
+                return [_massage(val) for val in subcond]
+            return {key: _massage(val) for key, val in subcond.items()}
+
         if ifcond.is_present():
-            print('%sif %s' % (' ' * indent, ifcond.ifcond))
+            print('%sif %s' % (' ' * indent, _massage(ifcond.ifcond)))
 
     @classmethod
     def _print_features(cls, features, indent=4):
-- 
2.31.1


