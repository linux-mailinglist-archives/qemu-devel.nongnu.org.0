Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C1C6361CD
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 15:30:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxqkM-0005uj-Qc; Wed, 23 Nov 2022 09:29:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oxqkL-0005sM-Hv
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:29:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oxqkF-0007rh-1X
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:29:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669213732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cpGjHrUGnJAcBs1eKHwv8KY1P3+7Nhik4Fde+09rjnY=;
 b=JP9esMDLE3WpnrZ7vtXWnlxQXaK7jgXBtzLupCx4XpchP7ziJ8eiRGPg7qtQ3drJF/NjCm
 sGXuHQFLU1/RC3Wk28taXmBtLAkhCknt4hb91rN0fMyI0gvgj4MABMD6oIWmHepDhAaW8w
 DDkK81DdEFT/EvrHLBgDOZnBq2dN/Yc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-GGYyOt4PM02M-EZ-Q15kFA-1; Wed, 23 Nov 2022 09:28:50 -0500
X-MC-Unique: GGYyOt4PM02M-EZ-Q15kFA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 902ED1C0879D
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 14:28:50 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E666740C2086;
 Wed, 23 Nov 2022 14:28:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 2/3] tests/qtest: Decrease the amount of output from the
 qom-test
Date: Wed, 23 Nov 2022 15:28:42 +0100
Message-Id: <20221123142843.346105-3-thuth@redhat.com>
In-Reply-To: <20221123142843.346105-1-thuth@redhat.com>
References: <20221123142843.346105-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

The logs in the gitlab-CI have a size constraint, and sometimes
we already hit this limit. The biggest part of the log then seems
to be filled by the qom-test, so we should decrease the size of
the output - which can be done easily by not printing the path
for each property, since the path has already been logged at the
beginning of each node that we handle here.

However, if we omit the path, we should make sure to not recurse
into child nodes in between, so that it is clear to which node
each property belongs. Thus store the children and links in a
temporary list and recurse only at the end of each node, when
all properties have already been printed.

Message-Id: <20221121194240.149268-1-thuth@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/qom-test.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/qom-test.c b/tests/qtest/qom-test.c
index 7b871b2a31..13510bc349 100644
--- a/tests/qtest/qom-test.c
+++ b/tests/qtest/qom-test.c
@@ -20,6 +20,7 @@ static void test_properties(QTestState *qts, const char *path, bool recurse)
     QDict *response, *tuple, *tmp;
     QList *list;
     QListEntry *entry;
+    GSList *children = NULL, *links = NULL;
 
     g_test_message("Obtaining properties of %s", path);
     response = qtest_qmp(qts, "{ 'execute': 'qom-list',"
@@ -41,11 +42,14 @@ static void test_properties(QTestState *qts, const char *path, bool recurse)
         if (is_child || is_link) {
             child_path = g_strdup_printf("%s/%s",
                                          path, qdict_get_str(tuple, "name"));
-            test_properties(qts, child_path, is_child);
-            g_free(child_path);
+            if (is_child) {
+                children = g_slist_prepend(children, child_path);
+            } else {
+                links = g_slist_prepend(links, child_path);
+            }
         } else {
             const char *prop = qdict_get_str(tuple, "name");
-            g_test_message("Testing property %s.%s", path, prop);
+            g_test_message("-> %s", prop);
             tmp = qtest_qmp(qts,
                             "{ 'execute': 'qom-get',"
                             "  'arguments': { 'path': %s, 'property': %s } }",
@@ -55,6 +59,18 @@ static void test_properties(QTestState *qts, const char *path, bool recurse)
             qobject_unref(tmp);
         }
     }
+
+    while (links) {
+        test_properties(qts, links->data, false);
+        g_free(links->data);
+        links = g_slist_delete_link(links, links);
+    }
+    while (children) {
+        test_properties(qts, children->data, true);
+        g_free(children->data);
+        children = g_slist_delete_link(children, children);
+    }
+
     qobject_unref(response);
 }
 
-- 
2.31.1


