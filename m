Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A15B93376DF
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:21:44 +0100 (CET)
Received: from localhost ([::1]:34478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKN8B-0002gm-Ld
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:21:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMcB-00058Q-Ud
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:48:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMc9-0002sY-15
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:48:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615474116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9aWNxInm1Zt0lk9ABDeobf/fhYmYyKoZkDmtOMfpid8=;
 b=ECCg+LpwkUdt8SwYs59PU1KXGQGEcf5SY26W9/cKeYPa3E7qgJsX5IJUBglNXPCgVPqYiY
 VspNX9Q7rYzHjvDVzlN/EXKLyHflOzIFhDgIefYIg1pXtpehZwHoovF5xyM8FJPs90SxYx
 pVfsDoa+VylbToPG3vZPdDOhhMlZ2Vg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-4rYn1lc2P62SrYL1RSp5cg-1; Thu, 11 Mar 2021 09:48:34 -0500
X-MC-Unique: 4rYn1lc2P62SrYL1RSp5cg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 501F9802B7E;
 Thu, 11 Mar 2021 14:48:33 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F1305D9F2;
 Thu, 11 Mar 2021 14:48:32 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 10/38] tests: Drop 'props' from object-add calls
Date: Thu, 11 Mar 2021 15:47:43 +0100
Message-Id: <20210311144811.313451-11-kwolf@redhat.com>
In-Reply-To: <20210311144811.313451-1-kwolf@redhat.com>
References: <20210311144811.313451-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'props' option has been deprecated in 5.0 in favour of a flattened
object-add command. Time to change our test cases to drop the deprecated
option.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qtest/qmp-cmd-test.c   | 16 +++++------
 tests/qtest/test-netfilter.c | 54 ++++++++++++++++--------------------
 2 files changed, 32 insertions(+), 38 deletions(-)

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
-- 
2.29.2


