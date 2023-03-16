Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F196BC6DE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 08:16:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pchoA-0003oH-91; Thu, 16 Mar 2023 03:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pchnw-0003ls-O9
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:13:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pchnq-0004ZU-9b
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:13:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678950813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6AfFzV5B9lGJ6or40+GPBARbOc+NqTh7f4yEJp/sx9o=;
 b=UFUUp2WeEwlrZyvJZ5CqEMzNqtt9o+lTSixp4VU0Wh6ELXL1xodoIoVExhnbb7sZEyqdxx
 YUI0jN9O01b6gML0WUbtxL4GxlD3TGi62NYv1/99NPTXuCn82jc41mEU/lH/TkEQ0UCtAs
 WX2kxpa3bpDknpWqSokKn4Cg6l4xQL4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-bO1DifA1M3KJ6zV6tS7NFA-1; Thu, 16 Mar 2023 03:13:29 -0400
X-MC-Unique: bO1DifA1M3KJ6zV6tS7NFA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47F6A101A531;
 Thu, 16 Mar 2023 07:13:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C2DC4042AC2;
 Thu, 16 Mar 2023 07:13:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0909621E479B; Thu, 16 Mar 2023 08:13:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 eblake@redhat.com, jsnow@redhat.com
Subject: [PATCH 10/14] tests/qapi-schema: Rename a few conditionals
Date: Thu, 16 Mar 2023 08:13:21 +0100
Message-Id: <20230316071325.492471-11-armbru@redhat.com>
In-Reply-To: <20230316071325.492471-1-armbru@redhat.com>
References: <20230316071325.492471-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Positive test case

    { 'enum': 'TestIfEnum',
      'data': [ 'foo', { 'name' : 'bar', 'if': 'TEST_IF_ENUM_BAR' } ],
      'if': 'TEST_IF_ENUM' }

generates

    #if defined(TEST_IF_ENUM)
    typedef enum TestIfEnum {
	TEST_IF_ENUM_FOO,
    #if defined(TEST_IF_ENUM_BAR)
	TEST_IF_ENUM_BAR,
    #endif /* defined(TEST_IF_ENUM_BAR) */
	TEST_IF_ENUM__MAX,
    } TestIfEnum;

Macro TEST_IF_ENUM_BAR clashes with the enumeration constant.
Wouldn't compile with -DTEST_IF_BAR.

Rename the macro to TEST_IF_ENUM_MEMBER.  For consistency, rename
similar macros elsewhere as well.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/qapi-schema/qapi-schema-test.json | 12 ++++++------
 tests/qapi-schema/qapi-schema-test.out  | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index ba7302f42b..5728d4de38 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -220,18 +220,18 @@
 
 { 'struct': 'TestIfStruct',
   'data': { 'foo': 'int',
-            'bar': { 'type': 'int', 'if': 'TEST_IF_STRUCT_BAR'} },
+            'bar': { 'type': 'int', 'if': 'TEST_IF_STRUCT_MEMBER'} },
   'if': 'TEST_IF_STRUCT' }
 
 { 'enum': 'TestIfEnum',
-  'data': [ 'foo', { 'name' : 'bar', 'if': 'TEST_IF_ENUM_BAR' } ],
+  'data': [ 'foo', { 'name' : 'bar', 'if': 'TEST_IF_ENUM_MEMBER' } ],
   'if': 'TEST_IF_ENUM' }
 
 { 'union': 'TestIfUnion',
   'base': { 'type': 'TestIfEnum' },
   'discriminator': 'type',
   'data': { 'foo': 'TestStruct',
-            'bar': { 'type': 'UserDefZero', 'if': 'TEST_IF_ENUM_BAR'} },
+            'bar': { 'type': 'UserDefZero', 'if': 'TEST_IF_ENUM_MEMBER'} },
   'if': { 'all': ['TEST_IF_UNION', 'TEST_IF_STRUCT'] } }
 
 { 'command': 'test-if-union-cmd',
@@ -240,7 +240,7 @@
 
 { 'alternate': 'TestIfAlternate',
   'data': { 'foo': 'int',
-            'bar': { 'type': 'TestStruct', 'if': 'TEST_IF_ALT_BAR'} },
+            'bar': { 'type': 'TestStruct', 'if': 'TEST_IF_ALT_MEMBER'} },
   'if': { 'all': ['TEST_IF_ALT', 'TEST_IF_STRUCT'] } }
 
 { 'command': 'test-if-alternate-cmd',
@@ -250,7 +250,7 @@
 { 'command': 'test-if-cmd',
   'data': {
     'foo': 'TestIfStruct',
-    'bar': { 'type': 'TestIfEnum', 'if': 'TEST_IF_CMD_BAR' } },
+    'bar': { 'type': 'TestIfEnum', 'if': 'TEST_IF_CMD_ARG' } },
   'returns': 'UserDefThree',
   'if': { 'all': ['TEST_IF_CMD', 'TEST_IF_STRUCT'] } }
 
@@ -258,7 +258,7 @@
 
 { 'event': 'TEST_IF_EVENT',
   'data': { 'foo': 'TestIfStruct',
-            'bar': { 'type': ['TestIfEnum'], 'if': 'TEST_IF_EVT_BAR' } },
+            'bar': { 'type': ['TestIfEnum'], 'if': 'TEST_IF_EVT_ARG' } },
   'if': { 'all': ['TEST_IF_EVT', 'TEST_IF_STRUCT'] } }
 
 { 'event': 'TEST_IF_EVENT2', 'data': {},
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 043d75c655..cbd96f0b24 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -246,12 +246,12 @@ command __org.qemu_x-command q_obj___org.qemu_x-command-arg -> None
 object TestIfStruct
     member foo: int optional=False
     member bar: int optional=False
-        if TEST_IF_STRUCT_BAR
+        if TEST_IF_STRUCT_MEMBER
     if TEST_IF_STRUCT
 enum TestIfEnum
     member foo
     member bar
-        if TEST_IF_ENUM_BAR
+        if TEST_IF_ENUM_MEMBER
     if TEST_IF_ENUM
 object q_obj_TestIfUnion-base
     member type: TestIfEnum optional=False
@@ -261,7 +261,7 @@ object TestIfUnion
     tag type
     case foo: TestStruct
     case bar: UserDefZero
-        if TEST_IF_ENUM_BAR
+        if TEST_IF_ENUM_MEMBER
     if {'all': ['TEST_IF_UNION', 'TEST_IF_STRUCT']}
 object q_obj_test-if-union-cmd-arg
     member union-cmd-arg: TestIfUnion optional=False
@@ -273,7 +273,7 @@ alternate TestIfAlternate
     tag type
     case foo: int
     case bar: TestStruct
-        if TEST_IF_ALT_BAR
+        if TEST_IF_ALT_MEMBER
     if {'all': ['TEST_IF_ALT', 'TEST_IF_STRUCT']}
 object q_obj_test-if-alternate-cmd-arg
     member alt-cmd-arg: TestIfAlternate optional=False
@@ -284,7 +284,7 @@ command test-if-alternate-cmd q_obj_test-if-alternate-cmd-arg -> None
 object q_obj_test-if-cmd-arg
     member foo: TestIfStruct optional=False
     member bar: TestIfEnum optional=False
-        if TEST_IF_CMD_BAR
+        if TEST_IF_CMD_ARG
     if {'all': ['TEST_IF_CMD', 'TEST_IF_STRUCT']}
 command test-if-cmd q_obj_test-if-cmd-arg -> UserDefThree
     gen=True success_response=True boxed=False oob=False preconfig=False
@@ -296,7 +296,7 @@ array TestIfEnumList TestIfEnum
 object q_obj_TEST_IF_EVENT-arg
     member foo: TestIfStruct optional=False
     member bar: TestIfEnumList optional=False
-        if TEST_IF_EVT_BAR
+        if TEST_IF_EVT_ARG
     if {'all': ['TEST_IF_EVT', 'TEST_IF_STRUCT']}
 event TEST_IF_EVENT q_obj_TEST_IF_EVENT-arg
     boxed=False
-- 
2.39.2


