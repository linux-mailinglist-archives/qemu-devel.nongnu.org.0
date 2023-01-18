Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD07671C05
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 13:26:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI7WN-0006WB-Uu; Wed, 18 Jan 2023 07:26:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI7WM-0006W0-96
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:26:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI7WK-0003vP-Dq
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:26:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674044783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=vjC3T3QzWuDub0pO6I8vcwu3gfNwAIr89gziDx0qk0M=;
 b=KWyJPGduWWE7BdZ9N3iyu5sRb4F3oHb2xwYsEJA4IYDdUX2nVZZUX6hZESiyQbwUX2EAFt
 Mm/C+bYQBIDKAtnTKi2b9J/ee1NqAzqWF24QaLbwWocZ7RHslIswQjm/6hDjnp+hJVTwF5
 S5UE7fwPRxAGv9bA9E+Jt2qds6VV4/8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-SqsrLn8HP_GX3fLJvAmwwA-1; Wed, 18 Jan 2023 07:26:20 -0500
X-MC-Unique: SqsrLn8HP_GX3fLJvAmwwA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7D9285A588;
 Wed, 18 Jan 2023 12:26:19 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F59D40C6EC4;
 Wed, 18 Jan 2023 12:26:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH] tests/qtest/qom-test: Stop spamming the test log
Date: Wed, 18 Jan 2023 13:25:57 +0100
Message-Id: <20230118122557.1668860-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

We are still facing the issues that our test logs in the gitlab CI
are too big (and thus cut off). A huge part is still caused by the
qom-test that prints the path and name of each object it looks at
by default. That's too much. Let's be silent by default, and only
print the object path+name when running with V=2 (and the properties
only with V=3 and higher).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/qom-test.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/qom-test.c b/tests/qtest/qom-test.c
index d380261f8f..d677f87c8e 100644
--- a/tests/qtest/qom-test.c
+++ b/tests/qtest/qom-test.c
@@ -14,7 +14,7 @@
 #include "qemu/cutils.h"
 #include "libqtest.h"
 
-static bool verbose;
+static int verbosity_level;
 
 static void test_properties(QTestState *qts, const char *path, bool recurse)
 {
@@ -24,7 +24,9 @@ static void test_properties(QTestState *qts, const char *path, bool recurse)
     QListEntry *entry;
     GSList *children = NULL, *links = NULL;
 
-    g_test_message("Obtaining properties of %s", path);
+    if (verbosity_level >= 2) {
+        g_test_message("Obtaining properties of %s", path);
+    }
     response = qtest_qmp(qts, "{ 'execute': 'qom-list',"
                               "  'arguments': { 'path': %s } }", path);
     g_assert(response);
@@ -51,7 +53,7 @@ static void test_properties(QTestState *qts, const char *path, bool recurse)
             }
         } else {
             const char *prop = qdict_get_str(tuple, "name");
-            if (verbose) {
+            if (verbosity_level >= 3) {
                 g_test_message("-> %s", prop);
             }
             tmp = qtest_qmp(qts,
@@ -109,8 +111,8 @@ int main(int argc, char **argv)
 {
     char *v_env = getenv("V");
 
-    if (v_env && atoi(v_env) >= 2) {
-        verbose = true;
+    if (v_env) {
+        verbosity_level = atoi(v_env);
     }
 
     g_test_init(&argc, &argv, NULL);
-- 
2.31.1


