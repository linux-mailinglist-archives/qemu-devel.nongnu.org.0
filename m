Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6041E323F42
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 15:52:14 +0100 (CET)
Received: from localhost ([::1]:43360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEvWP-0000I2-9i
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 09:52:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvPp-0001V2-8R
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:45:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvPk-00038h-Gj
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:45:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614177919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G7sLfO+leMlmwt6dRcBKxlJxDf89q77s5XtvQoS1Bto=;
 b=UGUt47lo+L/dGZJ+6WKSOgj007ic234wZX85bw5Sc4n0ywSkGgHMqhFYwsH6ZHgBnUeyHL
 6DTqsv2RzUnh6fDLNqEvpqBOzprthPLXrwkwJZHxkQgUl99cmvpFoB8KcYaWT57sTvsl03
 qMcftcAHG2rhuKNh0cOYvu7zZsZTFCA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-Yw5ZqZgKM-qOIL4AYTJ27A-1; Wed, 24 Feb 2021 09:45:18 -0500
X-MC-Unique: Yw5ZqZgKM-qOIL4AYTJ27A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3D1918E74B1;
 Wed, 24 Feb 2021 13:53:14 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6AC25D6D3;
 Wed, 24 Feb 2021 13:53:11 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/31] tests: Drop 'props' from object-add calls
Date: Wed, 24 Feb 2021 14:52:25 +0100
Message-Id: <20210224135255.253837-2-kwolf@redhat.com>
In-Reply-To: <20210224135255.253837-1-kwolf@redhat.com>
References: <20210224135255.253837-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'props' option has been deprecated in 5.0 in favour of a flattened
object-add command. Time to change our test cases to drop the deprecated
option.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qtest/qmp-cmd-test.c   | 16 +++++------
 tests/qtest/test-netfilter.c | 54 ++++++++++++++++--------------------
 tests/qemu-iotests/087       |  8 ++----
 tests/qemu-iotests/184       | 18 ++++--------
 tests/qemu-iotests/218       |  2 +-
 tests/qemu-iotests/235       |  2 +-
 tests/qemu-iotests/245       |  4 +--
 tests/qemu-iotests/258       |  6 ++--
 tests/qemu-iotests/258.out   |  4 +--
 tests/qemu-iotests/295       |  2 +-
 tests/qemu-iotests/296       |  2 +-
 11 files changed, 51 insertions(+), 67 deletions(-)

diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index 1c7186e53c..c98b78d033 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -230,14 +230,14 @@ static void test_object_add_failure_modes(void)
     /* attempt to create 2 objects with duplicate id */
     resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
                      " {'qom-type': 'memory-backend-ram', 'id': 'ram1',"
-                     " 'props': {'size': 1048576 } } }");
+                     " 'size': 1048576 } }");
     g_assert_nonnull(resp);
     g_assert(qdict_haskey(resp, "return"));
     qobject_unref(resp);
 
     resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
                      " {'qom-type': 'memory-backend-ram', 'id': 'ram1',"
-                     " 'props': {'size': 1048576 } } }");
+                     " 'size': 1048576 } }");
     g_assert_nonnull(resp);
     qmp_expect_error_and_unref(resp, "GenericError");
 
@@ -251,14 +251,14 @@ static void test_object_add_failure_modes(void)
     /* attempt to create an object with a property of a wrong type */
     resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
                      " {'qom-type': 'memory-backend-ram', 'id': 'ram1',"
-                     " 'props': {'size': '1048576' } } }");
+                     " 'size': '1048576' } }");
     g_assert_nonnull(resp);
     /* now do it right */
     qmp_expect_error_and_unref(resp, "GenericError");
 
     resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
                      " {'qom-type': 'memory-backend-ram', 'id': 'ram1',"
-                     " 'props': {'size': 1048576 } } }");
+                     " 'size': 1048576 } }");
     g_assert_nonnull(resp);
     g_assert(qdict_haskey(resp, "return"));
     qobject_unref(resp);
@@ -273,14 +273,14 @@ static void test_object_add_failure_modes(void)
     /* attempt to create an object without the id */
     resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
                      " {'qom-type': 'memory-backend-ram',"
-                     " 'props': {'size': 1048576 } } }");
+                     " 'size': 1048576 } }");
     g_assert_nonnull(resp);
     qmp_expect_error_and_unref(resp, "GenericError");
 
     /* now do it right */
     resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
                      " {'qom-type': 'memory-backend-ram', 'id': 'ram1',"
-                     " 'props': {'size': 1048576 } } }");
+                     " 'size': 1048576 } }");
     g_assert_nonnull(resp);
     g_assert(qdict_haskey(resp, "return"));
     qobject_unref(resp);
@@ -295,14 +295,14 @@ static void test_object_add_failure_modes(void)
     /* attempt to set a non existing property */
     resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
                      " {'qom-type': 'memory-backend-ram', 'id': 'ram1',"
-                     " 'props': {'sized': 1048576 } } }");
+                     " 'sized': 1048576 } }");
     g_assert_nonnull(resp);
     qmp_expect_error_and_unref(resp, "GenericError");
 
     /* now do it right */
     resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
                      " {'qom-type': 'memory-backend-ram', 'id': 'ram1',"
-                     " 'props': {'size': 1048576 } } }");
+                     " 'size': 1048576 } }");
     g_assert_nonnull(resp);
     g_assert(qdict_haskey(resp, "return"));
     qobject_unref(resp);
diff --git a/tests/qtest/test-netfilter.c b/tests/qtest/test-netfilter.c
index 22927ee6ab..785b6f3226 100644
--- a/tests/qtest/test-netfilter.c
+++ b/tests/qtest/test-netfilter.c
@@ -21,11 +21,10 @@ static void add_one_netfilter(void)
                    " 'arguments': {"
                    "   'qom-type': 'filter-buffer',"
                    "   'id': 'qtest-f0',"
-                   "   'props': {"
-                   "     'netdev': 'qtest-bn0',"
-                   "     'queue': 'rx',"
-                   "     'interval': 1000"
-                   "}}}");
+                   "   'netdev': 'qtest-bn0',"
+                   "   'queue': 'rx',"
+                   "   'interval': 1000"
+                   "}}");
 
     g_assert(response);
     g_assert(!qdict_haskey(response, "error"));
@@ -49,11 +48,10 @@ static void remove_netdev_with_one_netfilter(void)
                    " 'arguments': {"
                    "   'qom-type': 'filter-buffer',"
                    "   'id': 'qtest-f0',"
-                   "   'props': {"
-                   "     'netdev': 'qtest-bn0',"
-                   "     'queue': 'rx',"
-                   "     'interval': 1000"
-                   "}}}");
+                   "   'netdev': 'qtest-bn0',"
+                   "   'queue': 'rx',"
+                   "   'interval': 1000"
+                   "}}");
 
     g_assert(response);
     g_assert(!qdict_haskey(response, "error"));
@@ -87,11 +85,10 @@ static void add_multi_netfilter(void)
                    " 'arguments': {"
                    "   'qom-type': 'filter-buffer',"
                    "   'id': 'qtest-f0',"
-                   "   'props': {"
-                   "     'netdev': 'qtest-bn0',"
-                   "     'queue': 'rx',"
-                   "     'interval': 1000"
-                   "}}}");
+                   "   'netdev': 'qtest-bn0',"
+                   "   'queue': 'rx',"
+                   "   'interval': 1000"
+                   "}}");
 
     g_assert(response);
     g_assert(!qdict_haskey(response, "error"));
@@ -101,11 +98,10 @@ static void add_multi_netfilter(void)
                    " 'arguments': {"
                    "   'qom-type': 'filter-buffer',"
                    "   'id': 'qtest-f1',"
-                   "   'props': {"
-                   "     'netdev': 'qtest-bn0',"
-                   "     'queue': 'rx',"
-                   "     'interval': 1000"
-                   "}}}");
+                   "   'netdev': 'qtest-bn0',"
+                   "   'queue': 'rx',"
+                   "   'interval': 1000"
+                   "}}");
 
     g_assert(response);
     g_assert(!qdict_haskey(response, "error"));
@@ -137,11 +133,10 @@ static void remove_netdev_with_multi_netfilter(void)
                    " 'arguments': {"
                    "   'qom-type': 'filter-buffer',"
                    "   'id': 'qtest-f0',"
-                   "   'props': {"
-                   "     'netdev': 'qtest-bn0',"
-                   "     'queue': 'rx',"
-                   "     'interval': 1000"
-                   "}}}");
+                   "   'netdev': 'qtest-bn0',"
+                   "   'queue': 'rx',"
+                   "   'interval': 1000"
+                   "}}");
 
     g_assert(response);
     g_assert(!qdict_haskey(response, "error"));
@@ -151,11 +146,10 @@ static void remove_netdev_with_multi_netfilter(void)
                    " 'arguments': {"
                    "   'qom-type': 'filter-buffer',"
                    "   'id': 'qtest-f1',"
-                   "   'props': {"
-                   "     'netdev': 'qtest-bn0',"
-                   "     'queue': 'rx',"
-                   "     'interval': 1000"
-                   "}}}");
+                   "   'netdev': 'qtest-bn0',"
+                   "   'queue': 'rx',"
+                   "   'interval': 1000"
+                   "}}");
 
     g_assert(response);
     g_assert(!qdict_haskey(response, "error"));
diff --git a/tests/qemu-iotests/087 b/tests/qemu-iotests/087
index edd43f1a28..d8e0e384cd 100755
--- a/tests/qemu-iotests/087
+++ b/tests/qemu-iotests/087
@@ -143,9 +143,7 @@ run_qemu <<EOF
   "arguments": {
       "qom-type": "secret",
       "id": "sec0",
-      "props": {
-          "data": "123456"
-      }
+      "data": "123456"
   }
 }
 { "execute": "blockdev-add",
@@ -176,9 +174,7 @@ run_qemu <<EOF
   "arguments": {
       "qom-type": "secret",
       "id": "sec0",
-      "props": {
-          "data": "123456"
-      }
+      "data": "123456"
   }
 }
 { "execute": "blockdev-add",
diff --git a/tests/qemu-iotests/184 b/tests/qemu-iotests/184
index 513d167098..e4cbcd8634 100755
--- a/tests/qemu-iotests/184
+++ b/tests/qemu-iotests/184
@@ -67,10 +67,8 @@ run_qemu <<EOF
   "arguments": {
     "qom-type": "throttle-group",
     "id": "group0",
-    "props": {
-      "limits" : {
-        "iops-total": 1000
-      }
+    "limits" : {
+      "iops-total": 1000
     }
   }
 }
@@ -96,10 +94,8 @@ run_qemu <<EOF
   "arguments": {
     "qom-type": "throttle-group",
     "id": "group0",
-    "props" : {
-      "limits": {
-          "iops-total": 1000
-      }
+    "limits": {
+        "iops-total": 1000
     }
   }
 }
@@ -136,10 +132,8 @@ run_qemu <<EOF
   "arguments": {
     "qom-type": "throttle-group",
     "id": "group0",
-    "props" : {
-      "limits": {
-          "iops-total": 1000
-      }
+    "limits": {
+        "iops-total": 1000
     }
   }
 }
diff --git a/tests/qemu-iotests/218 b/tests/qemu-iotests/218
index ae7c4fb187..325d8244fb 100755
--- a/tests/qemu-iotests/218
+++ b/tests/qemu-iotests/218
@@ -152,7 +152,7 @@ with iotests.VM() as vm, \
     vm.launch()
 
     ret = vm.qmp('object-add', qom_type='throttle-group', id='tg',
-                 props={'x-bps-read': 4096})
+                 limits={'bps-read': 4096})
     assert ret['return'] == {}
 
     ret = vm.qmp('blockdev-add',
diff --git a/tests/qemu-iotests/235 b/tests/qemu-iotests/235
index 20d16dbf38..282b956b49 100755
--- a/tests/qemu-iotests/235
+++ b/tests/qemu-iotests/235
@@ -57,7 +57,7 @@ vm.add_args('-drive', 'id=src,file=' + disk)
 vm.launch()
 
 log(vm.qmp('object-add', qom_type='throttle-group', id='tg0',
-           props={ 'x-bps-total': size }))
+           limits={ 'bps-total': size }))
 
 log(vm.qmp('blockdev-add',
            **{ 'node-name': 'target',
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index cfdeb902be..30b1d7b22d 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -644,12 +644,12 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         ###### throttle ######
         ######################
         opts = { 'qom-type': 'throttle-group', 'id': 'group0',
-                 'props': { 'limits': { 'iops-total': 1000 } } }
+                 'limits': { 'iops-total': 1000 } }
         result = self.vm.qmp('object-add', conv_keys = False, **opts)
         self.assert_qmp(result, 'return', {})
 
         opts = { 'qom-type': 'throttle-group', 'id': 'group1',
-                 'props': { 'limits': { 'iops-total': 2000 } } }
+                 'limits': { 'iops-total': 2000 } }
         result = self.vm.qmp('object-add', conv_keys = False, **opts)
         self.assert_qmp(result, 'return', {})
 
diff --git a/tests/qemu-iotests/258 b/tests/qemu-iotests/258
index 9a2d33ae5e..a6618208a8 100755
--- a/tests/qemu-iotests/258
+++ b/tests/qemu-iotests/258
@@ -103,9 +103,9 @@ def test_concurrent_finish(write_to_stream_node):
         vm.qmp_log('object-add',
                    qom_type='throttle-group',
                    id='tg',
-                   props={
-                       'x-iops-write': 1,
-                       'x-iops-write-max': 1
+                   limits={
+                       'iops-write': 1,
+                       'iops-write-max': 1
                    })
 
         vm.qmp_log('blockdev-add',
diff --git a/tests/qemu-iotests/258.out b/tests/qemu-iotests/258.out
index ce6e9ba3e5..c3a003d3e3 100644
--- a/tests/qemu-iotests/258.out
+++ b/tests/qemu-iotests/258.out
@@ -2,7 +2,7 @@ Running tests:
 
 === Commit and stream finish concurrently (letting stream write) ===
 
-{"execute": "object-add", "arguments": {"id": "tg", "props": {"x-iops-write": 1, "x-iops-write-max": 1}, "qom-type": "throttle-group"}}
+{"execute": "object-add", "arguments": {"id": "tg", "limits": {"iops-write": 1, "iops-write-max": 1}, "qom-type": "throttle-group"}}
 {"return": {}}
 {"execute": "blockdev-add", "arguments": {"backing": {"backing": {"backing": {"backing": {"driver": "raw", "file": {"driver": "file", "filename": "TEST_DIR/PID-node0.img"}, "node-name": "node0"}, "driver": "IMGFMT", "file": {"driver": "file", "filename": "TEST_DIR/PID-node1.img"}, "node-name": "node1"}, "driver": "IMGFMT", "file": {"driver": "file", "filename": "TEST_DIR/PID-node2.img"}, "node-name": "node2"}, "driver": "IMGFMT", "file": {"driver": "file", "filename": "TEST_DIR/PID-node3.img"}, "node-name": "node3"}, "driver": "IMGFMT", "file": {"driver": "throttle", "file": {"driver": "file", "filename": "TEST_DIR/PID-node4.img"}, "throttle-group": "tg"}, "node-name": "node4"}}
 {"return": {}}
@@ -18,7 +18,7 @@ Running tests:
 
 === Commit and stream finish concurrently (letting commit write) ===
 
-{"execute": "object-add", "arguments": {"id": "tg", "props": {"x-iops-write": 1, "x-iops-write-max": 1}, "qom-type": "throttle-group"}}
+{"execute": "object-add", "arguments": {"id": "tg", "limits": {"iops-write": 1, "iops-write-max": 1}, "qom-type": "throttle-group"}}
 {"return": {}}
 {"execute": "blockdev-add", "arguments": {"backing": {"backing": {"backing": {"backing": {"driver": "raw", "file": {"driver": "throttle", "file": {"driver": "file", "filename": "TEST_DIR/PID-node0.img"}, "throttle-group": "tg"}, "node-name": "node0"}, "driver": "IMGFMT", "file": {"driver": "file", "filename": "TEST_DIR/PID-node1.img"}, "node-name": "node1"}, "driver": "IMGFMT", "file": {"driver": "file", "filename": "TEST_DIR/PID-node2.img"}, "node-name": "node2"}, "driver": "IMGFMT", "file": {"driver": "file", "filename": "TEST_DIR/PID-node3.img"}, "node-name": "node3"}, "driver": "IMGFMT", "file": {"driver": "file", "filename": "TEST_DIR/PID-node4.img"}, "node-name": "node4"}}
 {"return": {}}
diff --git a/tests/qemu-iotests/295 b/tests/qemu-iotests/295
index 01a6c0b31f..270ad3999f 100755
--- a/tests/qemu-iotests/295
+++ b/tests/qemu-iotests/295
@@ -43,7 +43,7 @@ class Secret:
 
     def to_qmp_object(self):
         return { "qom_type" : "secret", "id": self.id(),
-                 "props": { "data": self.secret() } }
+                 "data": self.secret() }
 
 ################################################################################
 class EncryptionSetupTestCase(iotests.QMPTestCase):
diff --git a/tests/qemu-iotests/296 b/tests/qemu-iotests/296
index 0bc3c6c7d7..7c65e987a1 100755
--- a/tests/qemu-iotests/296
+++ b/tests/qemu-iotests/296
@@ -43,7 +43,7 @@ class Secret:
 
     def to_qmp_object(self):
         return { "qom_type" : "secret", "id": self.id(),
-                 "props": { "data": self.secret() } }
+                 "data": self.secret() }
 
 ################################################################################
 
-- 
2.29.2


