Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA92D69626E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 12:26:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRtNt-0007BY-LO; Tue, 14 Feb 2023 06:22:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtNr-0007Ad-20
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:22:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtNp-0002IS-H6
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:22:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676373720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4C7pyi+DlPkSGUTqr0nFPYFMQcudM7W5j8DF0I+F7X4=;
 b=DJp5NfixbT1CrmXhbmV2bFWP+eIpWSy7NdL3ydNxzQnbjl0O8moh8wQSOiD8IYOpguNIVe
 qkATL2m+YY0ftJE2ikSrfTSgYMT9YKuXR8Ed5Grpc+P00ZCQ+torMu/hLaksk974LKYW22
 aYVvBvw63IH9kiiyZgiEa9G3MN+Q1nE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-AFKWQ4M_NKu55gdg-dNXvw-1; Tue, 14 Feb 2023 06:21:57 -0500
X-MC-Unique: AFKWQ4M_NKu55gdg-dNXvw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 408F1181E3EF;
 Tue, 14 Feb 2023 11:21:57 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F8A4400D927;
 Tue, 14 Feb 2023 11:21:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 05/22] tests/qtest/npcm7xx_pwm-test: Be less verbose unless V=2
Date: Tue, 14 Feb 2023 12:21:31 +0100
Message-Id: <20230214112148.646077-6-thuth@redhat.com>
In-Reply-To: <20230214112148.646077-1-thuth@redhat.com>
References: <20230214112148.646077-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Peter Maydell <peter.maydell@linaro.org>

The npcm7xx_pwm-test produces a lot of output at V=1, which
means that on our CI tests the log files exceed the gitlab
500KB limit. Suppress the messages about exactly what is
being tested unless at V=2 and above.

This follows the pattern we use with qom-test.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20230209135047.1753081-1-peter.maydell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/npcm7xx_pwm-test.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.c
index e320a625c4..ea4ca1d106 100644
--- a/tests/qtest/npcm7xx_pwm-test.c
+++ b/tests/qtest/npcm7xx_pwm-test.c
@@ -20,6 +20,8 @@
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qnum.h"
 
+static int verbosity_level;
+
 #define REF_HZ          25000000
 
 /* Register field definitions. */
@@ -221,7 +223,9 @@ static uint64_t pwm_qom_get(QTestState *qts, const char *path, const char *name)
     QDict *response;
     uint64_t val;
 
-    g_test_message("Getting properties %s from %s", name, path);
+    if (verbosity_level >= 2) {
+        g_test_message("Getting properties %s from %s", name, path);
+    }
     response = qtest_qmp(qts, "{ 'execute': 'qom-get',"
             " 'arguments': { 'path': %s, 'property': %s}}",
             path, name);
@@ -260,8 +264,10 @@ static void mft_qom_set(QTestState *qts, int index, const char *name,
     QDict *response;
     char *path = g_strdup_printf("/machine/soc/mft[%d]", index);
 
-    g_test_message("Setting properties %s of mft[%d] with value %u",
-                   name, index, value);
+    if (verbosity_level >= 2) {
+        g_test_message("Setting properties %s of mft[%d] with value %u",
+                       name, index, value);
+    }
     response = qtest_qmp(qts, "{ 'execute': 'qom-set',"
             " 'arguments': { 'path': %s, "
             " 'property': %s, 'value': %u}}",
@@ -506,9 +512,12 @@ static void mft_verify_rpm(QTestState *qts, const TestData *td, uint64_t duty)
     int32_t expected_cnt = mft_compute_cnt(rpm, clk);
 
     qtest_irq_intercept_in(qts, "/machine/soc/a9mpcore/gic");
-    g_test_message(
-        "verifying rpm for mft[%d]: clk: %" PRIu64 ", duty: %" PRIu64 ", rpm: %u, cnt: %d",
-        index, clk, duty, rpm, expected_cnt);
+    if (verbosity_level >= 2) {
+        g_test_message(
+            "verifying rpm for mft[%d]: clk: %" PRIu64 ", duty: %" PRIu64
+            ", rpm: %u, cnt: %d",
+            index, clk, duty, rpm, expected_cnt);
+    }
 
     /* Verify rpm for fan A */
     /* Stop capture */
@@ -670,6 +679,12 @@ int main(int argc, char **argv)
 {
     TestData test_data_list[ARRAY_SIZE(pwm_module_list) * ARRAY_SIZE(pwm_list)];
 
+    char *v_env = getenv("V");
+
+    if (v_env) {
+        verbosity_level = atoi(v_env);
+    }
+
     g_test_init(&argc, &argv, NULL);
 
     for (int i = 0; i < ARRAY_SIZE(pwm_module_list); ++i) {
-- 
2.31.1


