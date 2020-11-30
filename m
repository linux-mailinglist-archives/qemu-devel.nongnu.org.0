Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2003B2C8443
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 13:44:44 +0100 (CET)
Received: from localhost ([::1]:43648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjiXr-00078L-1X
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 07:44:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiIF-0003CH-9f
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:28:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiIC-00033l-DD
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:28:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606739311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3pOqVxsNOrV4xJkzlS1x2oe74MdidAoZ9c4srSgvp5o=;
 b=ScEBTfMHrkl74Vpg7jaA2fhlVdIePIMr53Ba49Wn1J8J4BP1vRrDWUehrPsSXgnDp94lkP
 srobsd7GePnxC+EZOphaszp3EAMGHCdKQf4rMLUeERuAsb1njDgBvvCA+bWjXPFDeuBFI6
 it7MWasXqdAniZ1h/Z/9bPnmB6QAj5g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-nH2aZlF6Oqag8DiYHZaV_A-1; Mon, 30 Nov 2020 07:28:29 -0500
X-MC-Unique: nH2aZlF6Oqag8DiYHZaV_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3228802B7D;
 Mon, 30 Nov 2020 12:28:28 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-117.ams2.redhat.com [10.36.114.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD04A1A88B;
 Mon, 30 Nov 2020 12:28:25 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/18] tests: Drop 'props' from object-add calls
Date: Mon, 30 Nov 2020 13:25:36 +0100
Message-Id: <20201130122538.27674-17-kwolf@redhat.com>
In-Reply-To: <20201130122538.27674-1-kwolf@redhat.com>
References: <20201130122538.27674-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com
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
index 678e748c58..65a6244ff1 100755
--- a/tests/qemu-iotests/087
+++ b/tests/qemu-iotests/087
@@ -142,9 +142,7 @@ run_qemu <<EOF
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
@@ -175,9 +173,7 @@ run_qemu <<EOF
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
index eebb53faed..5c5d2ba6e2 100755
--- a/tests/qemu-iotests/184
+++ b/tests/qemu-iotests/184
@@ -66,10 +66,8 @@ run_qemu <<EOF
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
@@ -95,10 +93,8 @@ run_qemu <<EOF
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
@@ -135,10 +131,8 @@ run_qemu <<EOF
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
index 5586870456..c524d4b062 100755
--- a/tests/qemu-iotests/218
+++ b/tests/qemu-iotests/218
@@ -151,7 +151,7 @@ with iotests.VM() as vm, \
     vm.launch()
 
     ret = vm.qmp('object-add', qom_type='throttle-group', id='tg',
-                 props={'x-bps-read': 4096})
+                 limits={'bps-read': 4096})
     assert ret['return'] == {}
 
     ret = vm.qmp('blockdev-add',
diff --git a/tests/qemu-iotests/235 b/tests/qemu-iotests/235
index d1b10ac36b..2765561ada 100755
--- a/tests/qemu-iotests/235
+++ b/tests/qemu-iotests/235
@@ -56,7 +56,7 @@ vm.add_args('-drive', 'id=src,file=' + disk)
 vm.launch()
 
 log(vm.qmp('object-add', qom_type='throttle-group', id='tg0',
-           props={ 'x-bps-total': size }))
+           limits={ 'bps-total': size }))
 
 log(vm.qmp('blockdev-add',
            **{ 'node-name': 'target',
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index e60c8326d3..ce82a8e117 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -643,12 +643,12 @@ class TestBlockdevReopen(iotests.QMPTestCase):
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
index e305a1502f..5be428d232 100755
--- a/tests/qemu-iotests/258
+++ b/tests/qemu-iotests/258
@@ -102,9 +102,9 @@ def test_concurrent_finish(write_to_stream_node):
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
index 59e674fa85..f0c0d2a50f 100755
--- a/tests/qemu-iotests/295
+++ b/tests/qemu-iotests/295
@@ -42,7 +42,7 @@ class Secret:
 
     def to_qmp_object(self):
         return { "qom_type" : "secret", "id": self.id(),
-                 "props": { "data": self.secret() } }
+                 "data": self.secret() }
 
 ################################################################################
 class EncryptionSetupTestCase(iotests.QMPTestCase):
diff --git a/tests/qemu-iotests/296 b/tests/qemu-iotests/296
index fb7dec88aa..74d0bb44d4 100755
--- a/tests/qemu-iotests/296
+++ b/tests/qemu-iotests/296
@@ -42,7 +42,7 @@ class Secret:
 
     def to_qmp_object(self):
         return { "qom_type" : "secret", "id": self.id(),
-                 "props": { "data": self.secret() } }
+                 "data": self.secret() }
 
 ################################################################################
 
-- 
2.28.0


