Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1CE64DDD6
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 16:32:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5qCJ-0005Uz-CR; Thu, 15 Dec 2022 10:30:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5qC7-0005TU-HU
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 10:30:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5qC3-0001rq-Go
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 10:30:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671118242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zVxPv2pCU59FWA6QoOCvH9R4DPsQKaUGh5kFW2urYHk=;
 b=e36Rp99ln0sgy37UEGxPmvdly/3loFR7tP667OZZagN9vuK6ZmA2a5bfIei2GP0tM+9gt8
 15pEnzYPnzuoB+nynmbCPR5EFvuwut/Vh5tyCURhAgxdwsGvzsTam4aXYjpk6IBPLlECDU
 CHjTzLCyLoESoZdVF1MdwTTGe+4dNvI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-ODXBTTlwOBaEpRGO7M5e0A-1; Thu, 15 Dec 2022 10:30:41 -0500
X-MC-Unique: ODXBTTlwOBaEpRGO7M5e0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FC9B101A55E;
 Thu, 15 Dec 2022 15:30:41 +0000 (UTC)
Received: from thuth.com (dhcp-192-205.str.redhat.com [10.33.192.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40CC62166B26;
 Thu, 15 Dec 2022 15:30:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v2] tests/qtest/qom-test: Do not print tested properties by
 default
Date: Thu, 15 Dec 2022 16:30:36 +0100
Message-Id: <20221215153036.422362-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

We're still running into the problem that some logs are cut in the
gitlab-CI since they got too big. The biggest part of the log is
still the output of the qom-test. Let's stop printing the properties
by default to get to a saner size here. The full output can still
be enabled by setting V=2 (or higher) in the environment.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Use atoi() to do proper checking of the verbosity level

 tests/qtest/qom-test.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/qom-test.c b/tests/qtest/qom-test.c
index 13510bc349..d380261f8f 100644
--- a/tests/qtest/qom-test.c
+++ b/tests/qtest/qom-test.c
@@ -14,6 +14,8 @@
 #include "qemu/cutils.h"
 #include "libqtest.h"
 
+static bool verbose;
+
 static void test_properties(QTestState *qts, const char *path, bool recurse)
 {
     char *child_path;
@@ -49,7 +51,9 @@ static void test_properties(QTestState *qts, const char *path, bool recurse)
             }
         } else {
             const char *prop = qdict_get_str(tuple, "name");
-            g_test_message("-> %s", prop);
+            if (verbose) {
+                g_test_message("-> %s", prop);
+            }
             tmp = qtest_qmp(qts,
                             "{ 'execute': 'qom-get',"
                             "  'arguments': { 'path': %s, 'property': %s } }",
@@ -103,6 +107,12 @@ static void add_machine_test_case(const char *mname)
 
 int main(int argc, char **argv)
 {
+    char *v_env = getenv("V");
+
+    if (v_env && atoi(v_env) >= 2) {
+        verbose = true;
+    }
+
     g_test_init(&argc, &argv, NULL);
 
     qtest_cb_for_every_machine(add_machine_test_case, g_test_quick());
-- 
2.31.1


