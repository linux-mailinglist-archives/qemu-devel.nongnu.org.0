Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ACE6EEDD6
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 07:59:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prYAW-0006Hl-HZ; Wed, 26 Apr 2023 01:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prYA6-000663-Kr
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:57:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prYA2-0002lL-3h
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:57:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682488669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QRjMZQEXdxF4CzJQgIaBMTANYHhrLpii6yXZoilbytQ=;
 b=cpYk0a6RFdy0DccMFDw7Z8aEbc4Chc+KyRD7JYqXCGFHr+rBM+c55+K3Oo5k31lVhQLaty
 vUr6ml2yB4+Sm1lPJuNYlnYmwi/RlI7aiZVGPLCVq19I8GD+E6AN1k89kTiovTlZhtOWac
 s7GcrKI5t99VKllyt9gJ2RwPY7odGIg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-pVHS90PbO5ScvKyp7xfQWQ-1; Wed, 26 Apr 2023 01:57:46 -0400
X-MC-Unique: pVHS90PbO5ScvKyp7xfQWQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D52D3855569;
 Wed, 26 Apr 2023 05:57:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E5874C83A;
 Wed, 26 Apr 2023 05:57:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3403421F981C; Wed, 26 Apr 2023 07:57:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 10/17] tests/qapi-schema: Rename a few conditionals
Date: Wed, 26 Apr 2023 07:57:37 +0200
Message-Id: <20230426055744.1041930-11-armbru@redhat.com>
In-Reply-To: <20230426055744.1041930-1-armbru@redhat.com>
References: <20230426055744.1041930-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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
Message-Id: <20230316071325.492471-11-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


