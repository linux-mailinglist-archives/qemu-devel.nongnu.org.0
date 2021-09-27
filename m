Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB72F419530
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 15:37:30 +0200 (CEST)
Received: from localhost ([::1]:52944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUqoz-00059L-MQ
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 09:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUqLm-0003xW-IJ
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:07:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUqLk-0003xp-PA
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:07:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632748036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kQZU01g1Nn+EWz1jyCuqnV8zhyq4sTrjzvzWP5+3XHY=;
 b=HVfPp7kCKZ6tt6B9nLPiTMf2osw/xQZ1+nruWDqKo1qrn8YmolFepg97iR445EkcuImRC/
 z7AT+U7Kv8yDyn4BXQFL+NOP6ese/cMBaVKRKLV5CLnDYfe1Bflf6m2B63vZguyp3qIgSi
 7dULm2uKuDY+Sv2qThlZ4BKJxqTCL7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-r_dY7_ypOzCNz1dTMgsrTw-1; Mon, 27 Sep 2021 09:07:07 -0400
X-MC-Unique: r_dY7_ypOzCNz1dTMgsrTw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05D56802C89;
 Mon, 27 Sep 2021 13:07:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB697101E1C5;
 Mon, 27 Sep 2021 13:06:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 73893113861E; Mon, 27 Sep 2021 15:06:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 01/25] qapi: Tidy up unusual line breaks
Date: Mon, 27 Sep 2021 15:06:23 +0200
Message-Id: <20210927130647.1271533-2-armbru@redhat.com>
In-Reply-To: <20210927130647.1271533-1-armbru@redhat.com>
References: <20210927130647.1271533-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Break lines between members instead of within members.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210917143134.412106-2-armbru@redhat.com>
---
 docs/devel/qapi-code-gen.rst            | 12 +++++------
 tests/qapi-schema/doc-good.json         |  4 ++--
 tests/qapi-schema/enum-if-invalid.json  |  4 ++--
 tests/qapi-schema/qapi-schema-test.json | 28 ++++++++++++-------------
 4 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index ced7a5ffe1..b154eae82e 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -859,9 +859,9 @@ longhand form of MEMBER.
 Example: a struct type with unconditional member 'foo' and conditional
 member 'bar' ::
 
- { 'struct': 'IfStruct', 'data':
-   { 'foo': 'int',
-     'bar': { 'type': 'int', 'if': 'IFCOND'} } }
+ { 'struct': 'IfStruct',
+   'data': { 'foo': 'int',
+             'bar': { 'type': 'int', 'if': 'IFCOND'} } }
 
 A union's discriminator may not be conditional.
 
@@ -871,9 +871,9 @@ the longhand form of ENUM-VALUE_.
 Example: an enum type with unconditional value 'foo' and conditional
 value 'bar' ::
 
- { 'enum': 'IfEnum', 'data':
-   [ 'foo',
-     { 'name' : 'bar', 'if': 'IFCOND' } ] }
+ { 'enum': 'IfEnum',
+   'data': [ 'foo',
+             { 'name' : 'bar', 'if': 'IFCOND' } ] }
 
 Likewise, features can be conditional.  This requires the longhand
 form of FEATURE_.
diff --git a/tests/qapi-schema/doc-good.json b/tests/qapi-schema/doc-good.json
index e0027e4cf6..cbf5c56c4b 100644
--- a/tests/qapi-schema/doc-good.json
+++ b/tests/qapi-schema/doc-good.json
@@ -60,8 +60,8 @@
 #
 # @two is undocumented
 ##
-{ 'enum': 'Enum', 'data':
-  [ { 'name': 'one', 'if': 'IFONE' }, 'two' ],
+{ 'enum': 'Enum',
+  'data': [ { 'name': 'one', 'if': 'IFONE' }, 'two' ],
   'features': [ 'enum-feat' ],
   'if': 'IFCOND' }
 
diff --git a/tests/qapi-schema/enum-if-invalid.json b/tests/qapi-schema/enum-if-invalid.json
index 60bd0ef1d7..6bd20041f3 100644
--- a/tests/qapi-schema/enum-if-invalid.json
+++ b/tests/qapi-schema/enum-if-invalid.json
@@ -1,3 +1,3 @@
 # check invalid 'if' type
-{ 'enum': 'TestIfEnum', 'data':
-  [ 'foo', { 'name' : 'bar', 'if': { 'val': 'foo' } } ] }
+{ 'enum': 'TestIfEnum',
+  'data': [ 'foo', { 'name' : 'bar', 'if': { 'val': 'foo' } } ] }
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index b6c36a9eee..3c43e14e22 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -220,27 +220,27 @@
 
 # test 'if' condition handling
 
-{ 'struct': 'TestIfStruct', 'data':
-  { 'foo': 'int',
-    'bar': { 'type': 'int', 'if': 'TEST_IF_STRUCT_BAR'} },
+{ 'struct': 'TestIfStruct',
+  'data': { 'foo': 'int',
+            'bar': { 'type': 'int', 'if': 'TEST_IF_STRUCT_BAR'} },
   'if': 'TEST_IF_STRUCT' }
 
-{ 'enum': 'TestIfEnum', 'data':
-  [ 'foo', { 'name' : 'bar', 'if': 'TEST_IF_ENUM_BAR' } ],
+{ 'enum': 'TestIfEnum',
+  'data': [ 'foo', { 'name' : 'bar', 'if': 'TEST_IF_ENUM_BAR' } ],
   'if': 'TEST_IF_ENUM' }
 
-{ 'union': 'TestIfUnion', 'data':
-  { 'foo': 'TestStruct',
-    'bar': { 'type': 'str', 'if': 'TEST_IF_UNION_BAR'} },
+{ 'union': 'TestIfUnion',
+  'data': { 'foo': 'TestStruct',
+            'bar': { 'type': 'str', 'if': 'TEST_IF_UNION_BAR'} },
   'if': { 'all': ['TEST_IF_UNION', 'TEST_IF_STRUCT'] } }
 
 { 'command': 'test-if-union-cmd',
   'data': { 'union-cmd-arg': 'TestIfUnion' },
   'if': { 'all': ['TEST_IF_UNION', 'TEST_IF_STRUCT'] } }
 
-{ 'alternate': 'TestIfAlternate', 'data':
-  { 'foo': 'int',
-    'bar': { 'type': 'TestStruct', 'if': 'TEST_IF_ALT_BAR'} },
+{ 'alternate': 'TestIfAlternate',
+  'data': { 'foo': 'int',
+            'bar': { 'type': 'TestStruct', 'if': 'TEST_IF_ALT_BAR'} },
   'if': { 'all': ['TEST_IF_ALT', 'TEST_IF_STRUCT'] } }
 
 { 'command': 'test-if-alternate-cmd',
@@ -256,9 +256,9 @@
 
 { 'command': 'test-cmd-return-def-three', 'returns': 'UserDefThree' }
 
-{ 'event': 'TEST_IF_EVENT', 'data':
-  { 'foo': 'TestIfStruct',
-    'bar': { 'type': ['TestIfEnum'], 'if': 'TEST_IF_EVT_BAR' } },
+{ 'event': 'TEST_IF_EVENT',
+  'data': { 'foo': 'TestIfStruct',
+            'bar': { 'type': ['TestIfEnum'], 'if': 'TEST_IF_EVT_BAR' } },
   'if': { 'all': ['TEST_IF_EVT', 'TEST_IF_STRUCT'] } }
 
 { 'event': 'TEST_IF_EVENT2', 'data': {},
-- 
2.31.1


