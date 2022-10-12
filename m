Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5359C5FC231
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 10:45:09 +0200 (CEST)
Received: from localhost ([::1]:40932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiXMR-0005g7-To
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 04:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiXL7-0004I5-3n
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 04:43:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiXL4-0005wL-J7
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 04:43:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665564221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=fYwwZg+vpCfE8e4PimLDGAWsGEM9l1qG8hlzNaW84FM=;
 b=b1+mGD5Op19+9xRhAnw15/AFGU/ntM4aLCEOG0PdJlpzDWa7yyHqyCAaniglJsdfsDdJry
 pAo7u6sObFeSeG9NtNORHida7KE8JUZp97Wunu+EQUmRSY70lqTK5iGnczkXA2W5po+eZ/
 Q4yraNBhDbLY22dBHLeNhi6X31v319w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-7vWwoHmTMGeJWu2ZXv4w1w-1; Wed, 12 Oct 2022 04:43:38 -0400
X-MC-Unique: 7vWwoHmTMGeJWu2ZXv4w1w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C867285A5B6;
 Wed, 12 Oct 2022 08:43:37 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFBAE20182B3;
 Wed, 12 Oct 2022 08:43:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Berger <stefanb@linux.vnet.ibm.com>,
	qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH] tests/qtest/tpm: Clean up remainders of swtpm
Date: Wed, 12 Oct 2022 10:43:34 +0200
Message-Id: <20221012084334.794253-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After running "make check", there are remainders of the tpm
tests left in the /tmp directory, slowly filling it up.
Seems like "swtpm" leaves a ".lock" and a "tpm2-00.permall"
file behind, so that the g_rmdir() calls on the temporary
directories fail. Introduce a helper function to remove those
leftovers before doing the g_rmdir().

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/tpm-util.h                  |  1 +
 tests/qtest/tpm-crb-swtpm-test.c        |  5 ++---
 tests/qtest/tpm-tis-device-swtpm-test.c |  5 ++---
 tests/qtest/tpm-tis-swtpm-test.c        |  5 ++---
 tests/qtest/tpm-util.c                  | 19 +++++++++++++++++++
 5 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/tests/qtest/tpm-util.h b/tests/qtest/tpm-util.h
index 3b97d69017..80720afac0 100644
--- a/tests/qtest/tpm-util.h
+++ b/tests/qtest/tpm-util.h
@@ -53,5 +53,6 @@ void tpm_util_migration_start_qemu(QTestState **src_qemu,
                                    const char *machine_options);
 
 void tpm_util_wait_for_migration_complete(QTestState *who);
+void tpm_util_rmdir(const char *path);
 
 #endif /* TESTS_TPM_UTIL_H */
diff --git a/tests/qtest/tpm-crb-swtpm-test.c b/tests/qtest/tpm-crb-swtpm-test.c
index 55fdb5657d..40254f762f 100644
--- a/tests/qtest/tpm-crb-swtpm-test.c
+++ b/tests/qtest/tpm-crb-swtpm-test.c
@@ -13,7 +13,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib/gstdio.h>
 
 #include "libqtest.h"
 #include "qemu/module.h"
@@ -62,9 +61,9 @@ int main(int argc, char **argv)
                         tpm_crb_swtpm_migration_test);
     ret = g_test_run();
 
-    g_rmdir(ts.dst_tpm_path);
+    tpm_util_rmdir(ts.dst_tpm_path);
     g_free(ts.dst_tpm_path);
-    g_rmdir(ts.src_tpm_path);
+    tpm_util_rmdir(ts.src_tpm_path);
     g_free(ts.src_tpm_path);
     g_free(ts.uri);
 
diff --git a/tests/qtest/tpm-tis-device-swtpm-test.c b/tests/qtest/tpm-tis-device-swtpm-test.c
index 7b20035142..8c067fddd4 100644
--- a/tests/qtest/tpm-tis-device-swtpm-test.c
+++ b/tests/qtest/tpm-tis-device-swtpm-test.c
@@ -14,7 +14,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib/gstdio.h>
 
 #include "libqtest.h"
 #include "qemu/module.h"
@@ -66,9 +65,9 @@ int main(int argc, char **argv)
                         tpm_tis_swtpm_migration_test);
     ret = g_test_run();
 
-    g_rmdir(ts.dst_tpm_path);
+    tpm_util_rmdir(ts.dst_tpm_path);
     g_free(ts.dst_tpm_path);
-    g_rmdir(ts.src_tpm_path);
+    tpm_util_rmdir(ts.src_tpm_path);
     g_free(ts.src_tpm_path);
     g_free(ts.uri);
 
diff --git a/tests/qtest/tpm-tis-swtpm-test.c b/tests/qtest/tpm-tis-swtpm-test.c
index 90131cb3c4..11539c0a52 100644
--- a/tests/qtest/tpm-tis-swtpm-test.c
+++ b/tests/qtest/tpm-tis-swtpm-test.c
@@ -13,7 +13,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib/gstdio.h>
 
 #include "libqtest.h"
 #include "qemu/module.h"
@@ -61,9 +60,9 @@ int main(int argc, char **argv)
                         tpm_tis_swtpm_migration_test);
     ret = g_test_run();
 
-    g_rmdir(ts.dst_tpm_path);
+    tpm_util_rmdir(ts.dst_tpm_path);
     g_free(ts.dst_tpm_path);
-    g_rmdir(ts.src_tpm_path);
+    tpm_util_rmdir(ts.src_tpm_path);
     g_free(ts.src_tpm_path);
     g_free(ts.uri);
 
diff --git a/tests/qtest/tpm-util.c b/tests/qtest/tpm-util.c
index e0dc5da0af..a7efe2d0d2 100644
--- a/tests/qtest/tpm-util.c
+++ b/tests/qtest/tpm-util.c
@@ -13,6 +13,7 @@
  */
 
 #include "qemu/osdep.h"
+#include <glib/gstdio.h>
 
 #include "hw/acpi/tpm.h"
 #include "libqtest.h"
@@ -292,3 +293,21 @@ void tpm_util_migration_start_qemu(QTestState **src_qemu,
     g_free(src_qemu_args);
     g_free(dst_qemu_args);
 }
+
+/* Remove directory with remainders of swtpm */
+void tpm_util_rmdir(const char *path)
+{
+    char *filename;
+    int ret;
+
+    filename = g_strdup_printf("%s/tpm2-00.permall", path);
+    g_unlink(filename);
+    g_free(filename);
+
+    filename = g_strdup_printf("%s/.lock", path);
+    g_unlink(filename);
+    g_free(filename);
+
+    ret = g_rmdir(path);
+    g_assert(!ret);
+}
-- 
2.31.1


