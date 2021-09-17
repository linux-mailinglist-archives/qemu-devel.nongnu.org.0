Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EB040FA3B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 16:34:06 +0200 (CEST)
Received: from localhost ([::1]:55920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mREwH-0006qo-1Q
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 10:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mREu0-0003y8-Mx
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:31:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mREtx-0000D3-7M
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:31:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631889100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g3Elx8A36QJtA29cxlYq7YCWsDJiR8+rH47sQtQ6zkg=;
 b=ftMBoMtcVeCpAEitJ5IWL2h8w3GXqiaSTxWZVhPkQ1SZk7cmA0onQPLWpTJbPlrTsWC43G
 2Izr/BE+FJy5qnf8mQnvd3W9fG4pxxTCFXm9hX+JBjIPlXmUbouov+UBFiZbQnSyUgzAs+
 YzCMykzFVL6gKdjIO88+6vlnCk0/dhw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-jxOVxxh6Pz2P0ALoK_MxCQ-1; Fri, 17 Sep 2021 10:31:39 -0400
X-MC-Unique: jxOVxxh6Pz2P0ALoK_MxCQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86C1EBBEE4;
 Fri, 17 Sep 2021 14:31:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF25D19736;
 Fri, 17 Sep 2021 14:31:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 58BDA113861E; Fri, 17 Sep 2021 16:31:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/23] qapi: Tidy up unusual line breaks
Date: Fri, 17 Sep 2021 16:31:12 +0200
Message-Id: <20210917143134.412106-2-armbru@redhat.com>
In-Reply-To: <20210917143134.412106-1-armbru@redhat.com>
References: <20210917143134.412106-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: jsnow@redhat.com, michael.roth@amd.com, eblake@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Break lines between members instead of within members.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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


