Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7892B0B58
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 18:35:53 +0100 (CET)
Received: from localhost ([::1]:54362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdGVk-0007a5-Ey
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 12:35:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGPM-0001Ms-Ez
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:29:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGPJ-0006tU-QE
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:29:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605202153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mZ0Dkg5mqkaoLCMiJGJoQ4h8UQ7MfQ9+5Zr1+zhkCOM=;
 b=Ms+rENT3g4VJzAbO0MmSdhb/ii85C3tHrIt79PaE7CitCCYqtkOfc+TVt4oWadlsSEU0a8
 yLnSzi+IXbayz/BIWjVkB8mcKZcF9LypjBUcJXr3lM3D7lAX8x/v+Jq+HpX2O0pKpXTzA5
 HONa9xf1RwjyMlqY80cGF3/BdmV5l6o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-Jbze8yjMNAOTaiDhMgZ_iQ-1; Thu, 12 Nov 2020 12:29:11 -0500
X-MC-Unique: Jbze8yjMNAOTaiDhMgZ_iQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73EB11009E2F
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 17:29:09 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EF165D9E4;
 Thu, 12 Nov 2020 17:29:08 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] tests/qapi-schema: Test cases for aliases
Date: Thu, 12 Nov 2020 18:28:50 +0100
Message-Id: <20201112172850.401925-7-kwolf@redhat.com>
In-Reply-To: <20201112172850.401925-1-kwolf@redhat.com>
References: <20201112172850.401925-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
index 0000000000..a982d380b8
--- /dev/null
+++ b/tests/qapi-schema/alias-bad-type.err
@@ -0,0 +1,2 @@
+alias-bad-type.json: In struct 'AliasStruct0':
+alias-bad-type.json:1: 'aliases' entries must be objects
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
index 0000000000..1cfe8a6aa5
--- /dev/null
+++ b/tests/qapi-schema/alias-missing-source.err
@@ -0,0 +1,2 @@
+alias-missing-source.json: In struct 'AliasStruct0':
+alias-missing-source.json:1: alias misses key 'source'
diff --git a/tests/qapi-schema/alias-missing-source.json b/tests/qapi-schema/alias-missing-source.json
new file mode 100644
index 0000000000..4ae22c2221
--- /dev/null
+++ b/tests/qapi-schema/alias-missing-source.json
@@ -0,0 +1,3 @@
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': [ { 'alias': 'bar' } ] }
diff --git a/tests/qapi-schema/alias-missing-source.out b/tests/qapi-schema/alias-missing-source.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/alias-name-bad-type.err b/tests/qapi-schema/alias-name-bad-type.err
new file mode 100644
index 0000000000..83b9fe0b65
--- /dev/null
+++ b/tests/qapi-schema/alias-name-bad-type.err
@@ -0,0 +1,2 @@
+alias-name-bad-type.json: In struct 'AliasStruct0':
+alias-name-bad-type.json:1: alias member 'alias' requires a string name
diff --git a/tests/qapi-schema/alias-name-bad-type.json b/tests/qapi-schema/alias-name-bad-type.json
new file mode 100644
index 0000000000..6d993be332
--- /dev/null
+++ b/tests/qapi-schema/alias-name-bad-type.json
@@ -0,0 +1,3 @@
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': [ { 'alias': ['bar'], 'source': ['foo'] } ] }
diff --git a/tests/qapi-schema/alias-name-bad-type.out b/tests/qapi-schema/alias-name-bad-type.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/alias-source-bad-type.err b/tests/qapi-schema/alias-source-bad-type.err
new file mode 100644
index 0000000000..e3b949ff77
--- /dev/null
+++ b/tests/qapi-schema/alias-source-bad-type.err
@@ -0,0 +1,2 @@
+alias-source-bad-type.json: In struct 'AliasStruct0':
+alias-source-bad-type.json:1: 'source' must be an array
diff --git a/tests/qapi-schema/alias-source-bad-type.json b/tests/qapi-schema/alias-source-bad-type.json
new file mode 100644
index 0000000000..0099a6439e
--- /dev/null
+++ b/tests/qapi-schema/alias-source-bad-type.json
@@ -0,0 +1,3 @@
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': [ { 'alias': 'bar', 'source': 'foo' } ] }
diff --git a/tests/qapi-schema/alias-source-bad-type.out b/tests/qapi-schema/alias-source-bad-type.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/alias-source-elem-bad-type.err b/tests/qapi-schema/alias-source-elem-bad-type.err
new file mode 100644
index 0000000000..44d219e352
--- /dev/null
+++ b/tests/qapi-schema/alias-source-elem-bad-type.err
@@ -0,0 +1,2 @@
+alias-source-elem-bad-type.json: In struct 'AliasStruct0':
+alias-source-elem-bad-type.json:1: element of alias member 'source' requires a string name
diff --git a/tests/qapi-schema/alias-source-elem-bad-type.json b/tests/qapi-schema/alias-source-elem-bad-type.json
new file mode 100644
index 0000000000..28cb1c37c5
--- /dev/null
+++ b/tests/qapi-schema/alias-source-elem-bad-type.json
@@ -0,0 +1,3 @@
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': [ { 'alias': 'bar', 'source': ['foo', true] } ] }
diff --git a/tests/qapi-schema/alias-source-elem-bad-type.out b/tests/qapi-schema/alias-source-elem-bad-type.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/alias-source-empty.err b/tests/qapi-schema/alias-source-empty.err
new file mode 100644
index 0000000000..f7687e404c
--- /dev/null
+++ b/tests/qapi-schema/alias-source-empty.err
@@ -0,0 +1,2 @@
+alias-source-empty.json: In struct 'AliasStruct0':
+alias-source-empty.json:1: 'source' must not be empty
diff --git a/tests/qapi-schema/alias-source-empty.json b/tests/qapi-schema/alias-source-empty.json
new file mode 100644
index 0000000000..9d2d2f109f
--- /dev/null
+++ b/tests/qapi-schema/alias-source-empty.json
@@ -0,0 +1,3 @@
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': [ { 'alias': 'bar', 'source': [] } ] }
diff --git a/tests/qapi-schema/alias-source-empty.out b/tests/qapi-schema/alias-source-empty.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/alias-unknown-key.err b/tests/qapi-schema/alias-unknown-key.err
new file mode 100644
index 0000000000..d4dc5e4611
--- /dev/null
+++ b/tests/qapi-schema/alias-unknown-key.err
@@ -0,0 +1,3 @@
+alias-unknown-key.json: In struct 'AliasStruct0':
+alias-unknown-key.json:1: alias has unknown key 'known'
+Valid keys are 'alias', 'source'.
diff --git a/tests/qapi-schema/alias-unknown-key.json b/tests/qapi-schema/alias-unknown-key.json
new file mode 100644
index 0000000000..444f80ca30
--- /dev/null
+++ b/tests/qapi-schema/alias-unknown-key.json
@@ -0,0 +1,3 @@
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': [ { 'alias': 'bar', 'source': ['foo'], 'known': false } ] }
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
index 63f92adf68..cc2497b2a2 100644
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
+  'aliases': [ { 'alias': 'bar', 'source': ['foo'] } ] }
+{ 'struct': 'AliasStruct2',
+  'data': { 'nested': 'AliasStruct1' },
+  'aliases': [ { 'alias': 'bar', 'source': ['nested', 'foo'] } ] }
+{ 'struct': 'AliasStruct3',
+  'data': { 'nested': 'AliasStruct1' },
+  'aliases': [ { 'source': ['nested'] } ] }
+
+{ 'union': 'AliasFlatUnion',
+  'base': { 'tag': 'FeatureEnum1' },
+  'discriminator': 'tag',
+  'data': { 'eins': 'FeatureStruct1' },
+  'aliases': [ { 'alias': 'bar', 'source': ['foo'] } ] }
+{ 'union': 'AliasSimpleUnion',
+  'data': { 'eins': 'AliasStruct1' },
+  'aliases': [ { 'source': ['data'] } ] }
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 8868ca0dca..8ed88a257d 100644
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
+    alias bar -> nested/foo
+object AliasStruct3
+    member nested: AliasStruct1 optional=False
+    alias * -> nested/*
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
+    alias * -> data/*
+    tag type
+    case eins: q_obj_AliasStruct1-wrapper
 module include/sub-module.json
 include sub-sub-module.json
 object SecondArrayRef
-- 
2.28.0


