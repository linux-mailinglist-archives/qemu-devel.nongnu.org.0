Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F09BA319254
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 19:34:58 +0100 (CET)
Received: from localhost ([::1]:51018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAGnl-0005dS-0R
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 13:34:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lAGlW-0003v0-9y
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:32:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lAGlM-0002aH-7c
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:32:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613068341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5IrKhFJawEpCqb42VfkTcjVDpy3Wp5KY19Kfv7Eetzw=;
 b=QDuc73pfupaUKRULFg8lpoaSwl5orT+oEGfh0K2i/YFDVa34tR7v0NrKnmDfnA2B8aalm9
 1EGbJRYsHYRoMfSc7DoTVBwNahv6ZSQIKKzjotchFehVb8HYqSGXJK2EAnzi+PDC8HZSH2
 AtOYKcrhBfNAguteR1ceHFVaRFvxGQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-zbC-bNnuM-SRM0AyWnGYHg-1; Thu, 11 Feb 2021 13:32:18 -0500
X-MC-Unique: zbC-bNnuM-SRM0AyWnGYHg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9EA1801990
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 18:31:38 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-82.ams2.redhat.com [10.36.113.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2CE15C3E0;
 Thu, 11 Feb 2021 18:31:37 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/6] tests/qapi-schema: Test cases for aliases
Date: Thu, 11 Feb 2021 19:31:18 +0100
Message-Id: <20210211183118.422036-7-kwolf@redhat.com>
In-Reply-To: <20210211183118.422036-1-kwolf@redhat.com>
References: <20210211183118.422036-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: kwolf@redhat.com, jsnow@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qapi-schema/alias-bad-type.err          |  2 ++
 tests/qapi-schema/alias-bad-type.json         |  3 ++
 tests/qapi-schema/alias-bad-type.out          |  0
 tests/qapi-schema/alias-missing-source.err    |  2 ++
 tests/qapi-schema/alias-missing-source.json   |  3 ++
 tests/qapi-schema/alias-missing-source.out    |  0
 tests/qapi-schema/alias-name-bad-type.err     |  2 ++
 tests/qapi-schema/alias-name-bad-type.json    |  3 ++
 tests/qapi-schema/alias-name-bad-type.out     |  0
 tests/qapi-schema/alias-source-bad-type.err   |  2 ++
 tests/qapi-schema/alias-source-bad-type.json  |  3 ++
 tests/qapi-schema/alias-source-bad-type.out   |  0
 .../alias-source-elem-bad-type.err            |  2 ++
 .../alias-source-elem-bad-type.json           |  3 ++
 .../alias-source-elem-bad-type.out            |  0
 tests/qapi-schema/alias-source-empty.err      |  2 ++
 tests/qapi-schema/alias-source-empty.json     |  3 ++
 tests/qapi-schema/alias-source-empty.out      |  0
 tests/qapi-schema/alias-unknown-key.err       |  3 ++
 tests/qapi-schema/alias-unknown-key.json      |  3 ++
 tests/qapi-schema/alias-unknown-key.out       |  0
 tests/qapi-schema/aliases-bad-type.err        |  2 ++
 tests/qapi-schema/aliases-bad-type.json       |  3 ++
 tests/qapi-schema/aliases-bad-type.out        |  0
 tests/qapi-schema/meson.build                 |  8 +++++
 tests/qapi-schema/qapi-schema-test.json       | 24 +++++++++++++++
 tests/qapi-schema/qapi-schema-test.out        | 29 +++++++++++++++++++
 27 files changed, 102 insertions(+)
 create mode 100644 tests/qapi-schema/alias-bad-type.err
 create mode 100644 tests/qapi-schema/alias-bad-type.json
 create mode 100644 tests/qapi-schema/alias-bad-type.out
 create mode 100644 tests/qapi-schema/alias-missing-source.err
 create mode 100644 tests/qapi-schema/alias-missing-source.json
 create mode 100644 tests/qapi-schema/alias-missing-source.out
 create mode 100644 tests/qapi-schema/alias-name-bad-type.err
 create mode 100644 tests/qapi-schema/alias-name-bad-type.json
 create mode 100644 tests/qapi-schema/alias-name-bad-type.out
 create mode 100644 tests/qapi-schema/alias-source-bad-type.err
 create mode 100644 tests/qapi-schema/alias-source-bad-type.json
 create mode 100644 tests/qapi-schema/alias-source-bad-type.out
 create mode 100644 tests/qapi-schema/alias-source-elem-bad-type.err
 create mode 100644 tests/qapi-schema/alias-source-elem-bad-type.json
 create mode 100644 tests/qapi-schema/alias-source-elem-bad-type.out
 create mode 100644 tests/qapi-schema/alias-source-empty.err
 create mode 100644 tests/qapi-schema/alias-source-empty.json
 create mode 100644 tests/qapi-schema/alias-source-empty.out
 create mode 100644 tests/qapi-schema/alias-unknown-key.err
 create mode 100644 tests/qapi-schema/alias-unknown-key.json
 create mode 100644 tests/qapi-schema/alias-unknown-key.out
 create mode 100644 tests/qapi-schema/aliases-bad-type.err
 create mode 100644 tests/qapi-schema/aliases-bad-type.json
 create mode 100644 tests/qapi-schema/aliases-bad-type.out

diff --git a/tests/qapi-schema/alias-bad-type.err b/tests/qapi-schema/alias-bad-type.err
new file mode 100644
index 0000000000..820e18ed9c
--- /dev/null
+++ b/tests/qapi-schema/alias-bad-type.err
@@ -0,0 +1,2 @@
+alias-bad-type.json: In struct 'AliasStruct0':
+alias-bad-type.json:1: 'aliases' members must be objects
diff --git a/tests/qapi-schema/alias-bad-type.json b/tests/qapi-schema/alias-bad-type.json
new file mode 100644
index 0000000000..0aa5d206fe
--- /dev/null
+++ b/tests/qapi-schema/alias-bad-type.json
@@ -0,0 +1,3 @@
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': [ 'must be an object' ] }
diff --git a/tests/qapi-schema/alias-bad-type.out b/tests/qapi-schema/alias-bad-type.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/alias-missing-source.err b/tests/qapi-schema/alias-missing-source.err
new file mode 100644
index 0000000000..8b7d601fbf
--- /dev/null
+++ b/tests/qapi-schema/alias-missing-source.err
@@ -0,0 +1,2 @@
+alias-missing-source.json: In struct 'AliasStruct0':
+alias-missing-source.json:1: 'aliases' member misses key 'source'
diff --git a/tests/qapi-schema/alias-missing-source.json b/tests/qapi-schema/alias-missing-source.json
new file mode 100644
index 0000000000..b6c91a9488
--- /dev/null
+++ b/tests/qapi-schema/alias-missing-source.json
@@ -0,0 +1,3 @@
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': [ { 'name': 'bar' } ] }
diff --git a/tests/qapi-schema/alias-missing-source.out b/tests/qapi-schema/alias-missing-source.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/alias-name-bad-type.err b/tests/qapi-schema/alias-name-bad-type.err
new file mode 100644
index 0000000000..489f45ff9b
--- /dev/null
+++ b/tests/qapi-schema/alias-name-bad-type.err
@@ -0,0 +1,2 @@
+alias-name-bad-type.json: In struct 'AliasStruct0':
+alias-name-bad-type.json:1: alias member 'name' requires a string name
diff --git a/tests/qapi-schema/alias-name-bad-type.json b/tests/qapi-schema/alias-name-bad-type.json
new file mode 100644
index 0000000000..17442d5939
--- /dev/null
+++ b/tests/qapi-schema/alias-name-bad-type.json
@@ -0,0 +1,3 @@
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': [ { 'name': ['bar'], 'source': ['foo'] } ] }
diff --git a/tests/qapi-schema/alias-name-bad-type.out b/tests/qapi-schema/alias-name-bad-type.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/alias-source-bad-type.err b/tests/qapi-schema/alias-source-bad-type.err
new file mode 100644
index 0000000000..b1779cbb8e
--- /dev/null
+++ b/tests/qapi-schema/alias-source-bad-type.err
@@ -0,0 +1,2 @@
+alias-source-bad-type.json: In struct 'AliasStruct0':
+alias-source-bad-type.json:1: alias member 'source' must be an array
diff --git a/tests/qapi-schema/alias-source-bad-type.json b/tests/qapi-schema/alias-source-bad-type.json
new file mode 100644
index 0000000000..d6a7430ee3
--- /dev/null
+++ b/tests/qapi-schema/alias-source-bad-type.json
@@ -0,0 +1,3 @@
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': [ { 'name': 'bar', 'source': 'foo' } ] }
diff --git a/tests/qapi-schema/alias-source-bad-type.out b/tests/qapi-schema/alias-source-bad-type.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/alias-source-elem-bad-type.err b/tests/qapi-schema/alias-source-elem-bad-type.err
new file mode 100644
index 0000000000..f73fbece77
--- /dev/null
+++ b/tests/qapi-schema/alias-source-elem-bad-type.err
@@ -0,0 +1,2 @@
+alias-source-elem-bad-type.json: In struct 'AliasStruct0':
+alias-source-elem-bad-type.json:1: member of alias member 'source' requires a string name
diff --git a/tests/qapi-schema/alias-source-elem-bad-type.json b/tests/qapi-schema/alias-source-elem-bad-type.json
new file mode 100644
index 0000000000..1d08f56492
--- /dev/null
+++ b/tests/qapi-schema/alias-source-elem-bad-type.json
@@ -0,0 +1,3 @@
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': [ { 'name': 'bar', 'source': ['foo', true] } ] }
diff --git a/tests/qapi-schema/alias-source-elem-bad-type.out b/tests/qapi-schema/alias-source-elem-bad-type.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/alias-source-empty.err b/tests/qapi-schema/alias-source-empty.err
new file mode 100644
index 0000000000..2848e762cb
--- /dev/null
+++ b/tests/qapi-schema/alias-source-empty.err
@@ -0,0 +1,2 @@
+alias-source-empty.json: In struct 'AliasStruct0':
+alias-source-empty.json:1: alias member 'source' must not be empty
diff --git a/tests/qapi-schema/alias-source-empty.json b/tests/qapi-schema/alias-source-empty.json
new file mode 100644
index 0000000000..74b529de4a
--- /dev/null
+++ b/tests/qapi-schema/alias-source-empty.json
@@ -0,0 +1,3 @@
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': [ { 'name': 'bar', 'source': [] } ] }
diff --git a/tests/qapi-schema/alias-source-empty.out b/tests/qapi-schema/alias-source-empty.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/alias-unknown-key.err b/tests/qapi-schema/alias-unknown-key.err
new file mode 100644
index 0000000000..c7b8cb9498
--- /dev/null
+++ b/tests/qapi-schema/alias-unknown-key.err
@@ -0,0 +1,3 @@
+alias-unknown-key.json: In struct 'AliasStruct0':
+alias-unknown-key.json:1: 'aliases' member has unknown key 'known'
+Valid keys are 'name', 'source'.
diff --git a/tests/qapi-schema/alias-unknown-key.json b/tests/qapi-schema/alias-unknown-key.json
new file mode 100644
index 0000000000..cdb8fc3d07
--- /dev/null
+++ b/tests/qapi-schema/alias-unknown-key.json
@@ -0,0 +1,3 @@
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': [ { 'name': 'bar', 'source': ['foo'], 'known': false } ] }
diff --git a/tests/qapi-schema/alias-unknown-key.out b/tests/qapi-schema/alias-unknown-key.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/aliases-bad-type.err b/tests/qapi-schema/aliases-bad-type.err
new file mode 100644
index 0000000000..7ffe789ec0
--- /dev/null
+++ b/tests/qapi-schema/aliases-bad-type.err
@@ -0,0 +1,2 @@
+aliases-bad-type.json: In struct 'AliasStruct0':
+aliases-bad-type.json:1: 'aliases' must be an array
diff --git a/tests/qapi-schema/aliases-bad-type.json b/tests/qapi-schema/aliases-bad-type.json
new file mode 100644
index 0000000000..4bbf6d6b20
--- /dev/null
+++ b/tests/qapi-schema/aliases-bad-type.json
@@ -0,0 +1,3 @@
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': 'this must be an array' }
diff --git a/tests/qapi-schema/aliases-bad-type.out b/tests/qapi-schema/aliases-bad-type.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index 304ef939bd..710cd60b61 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -3,6 +3,14 @@ test_env.set('PYTHONPATH', meson.source_root() / 'scripts')
 test_env.set('PYTHONIOENCODING', 'utf-8')
 
 schemas = [
+  'alias-bad-type.json',
+  'aliases-bad-type.json',
+  'alias-missing-source.json',
+  'alias-name-bad-type.json',
+  'alias-source-bad-type.json',
+  'alias-source-elem-bad-type.json',
+  'alias-source-empty.json',
+  'alias-unknown-key.json',
   'alternate-any.json',
   'alternate-array.json',
   'alternate-base.json',
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index 63f92adf68..28cb0d34bf 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -325,3 +325,27 @@
 
 { 'event': 'TEST-EVENT-FEATURES1',
   'features': [ 'deprecated' ] }
+
+# test  'aliases'
+
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': [] }
+{ 'struct': 'AliasStruct1',
+  'data': { 'foo': 'int' },
+  'aliases': [ { 'name': 'bar', 'source': ['foo'] } ] }
+{ 'struct': 'AliasStruct2',
+  'data': { 'nested': 'AliasStruct1' },
+  'aliases': [ { 'name': 'bar', 'source': ['nested', 'foo'] } ] }
+{ 'struct': 'AliasStruct3',
+  'data': { 'nested': 'AliasStruct1' },
+  'aliases': [ { 'source': ['nested'] } ] }
+
+{ 'union': 'AliasFlatUnion',
+  'base': { 'tag': 'FeatureEnum1' },
+  'discriminator': 'tag',
+  'data': { 'eins': 'FeatureStruct1' },
+  'aliases': [ { 'name': 'bar', 'source': ['foo'] } ] }
+{ 'union': 'AliasSimpleUnion',
+  'data': { 'eins': 'AliasStruct1' },
+  'aliases': [ { 'source': ['data'] } ] }
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 3b1387d9f1..84f11e8702 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -443,6 +443,35 @@ command test-command-cond-features3 None -> None
 event TEST-EVENT-FEATURES1 None
     boxed=False
     feature deprecated
+object AliasStruct0
+    member foo: int optional=False
+object AliasStruct1
+    member foo: int optional=False
+    alias bar -> foo
+object AliasStruct2
+    member nested: AliasStruct1 optional=False
+    alias bar -> nested.foo
+object AliasStruct3
+    member nested: AliasStruct1 optional=False
+    alias * -> nested.*
+object q_obj_AliasFlatUnion-base
+    member tag: FeatureEnum1 optional=False
+object AliasFlatUnion
+    base q_obj_AliasFlatUnion-base
+    alias bar -> foo
+    tag tag
+    case eins: FeatureStruct1
+    case zwei: q_empty
+    case drei: q_empty
+object q_obj_AliasStruct1-wrapper
+    member data: AliasStruct1 optional=False
+enum AliasSimpleUnionKind
+    member eins
+object AliasSimpleUnion
+    member type: AliasSimpleUnionKind optional=False
+    alias * -> data.*
+    tag type
+    case eins: q_obj_AliasStruct1-wrapper
 module include/sub-module.json
 include sub-sub-module.json
 object SecondArrayRef
-- 
2.29.2


