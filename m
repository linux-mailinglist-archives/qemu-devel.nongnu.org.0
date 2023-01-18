Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E165671CA4
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 13:52:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI7uq-0002uE-Mz; Wed, 18 Jan 2023 07:51:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI7uo-0002tg-BG
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:51:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI7um-0000je-F7
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:51:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674046299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=NjWlFOAHYrvLOnbS/bnayTDU8v6zlV92D8Zrwoh9Pj8=;
 b=ilKEmmJfTo4icBuezbXdM6b+PJITlz2EOsJD0sSb5vgNt6UV4GxfI1Wi3AYDeodDf/7zpq
 Xlu6faY4zektTh+qTSs/Lgn5pPUpjZQCC9m1ZVVuhXHPkbuMFVbYY4erQG1xaLSek9XbNP
 hXPugufbnpjwevGihk+hdce846EHAYs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-Hp1lfV2dMOqBYBZRH6luZA-1; Wed, 18 Jan 2023 07:51:36 -0500
X-MC-Unique: Hp1lfV2dMOqBYBZRH6luZA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B48C8281DE75;
 Wed, 18 Jan 2023 12:51:35 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E998140EBF6;
 Wed, 18 Jan 2023 12:51:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
Subject: [PATCH] tests/qtest/bios-tables-test: Make the test less verbose by
 default
Date: Wed, 18 Jan 2023 13:51:32 +0100
Message-Id: <20230118125132.1694469-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

We are facing the issues that our test logs in the gitlab CI are
too big (and thus cut off). The bios-tables-test is one of the few
qtests that prints many lines of output by default when running with
V=1, so it contributes to this problem. Almost all other qtests are
silent with V=1 and only print debug messages with V=2 and higher.
Thus let's change the bios-tables-test to behave more like the
other tests and only print the debug messages with V=2 (or higher).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 See also this discussion here:
 https://lore.kernel.org/qemu-devel/Y8Z8CJoFyxB9uHqU@redhat.com/

 tests/qtest/bios-tables-test.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 8608408213..355d0c3d56 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -24,7 +24,7 @@
  * You will also notice that tests/qtest/bios-tables-test-allowed-diff.h lists
  * a bunch of files. This is your hint that you need to do the below:
  * 4. Run
- *      make check V=1
+ *      make check V=2
  * this will produce a bunch of warnings about differences
  * beween actual and expected ACPI tables. If you have IASL installed,
  * they will also be disassembled so you can look at the disassembled
@@ -108,6 +108,8 @@ static const char *iasl = CONFIG_IASL;
 static const char *iasl;
 #endif
 
+static int verbosity_level;
+
 static bool compare_signature(const AcpiSdtTable *sdt, const char *signature)
 {
    return !memcmp(sdt->aml, signature, 4);
@@ -368,7 +370,7 @@ static GArray *load_expected_aml(test_data *data)
     gsize aml_len;
 
     GArray *exp_tables = g_array_new(false, true, sizeof(AcpiSdtTable));
-    if (getenv("V")) {
+    if (verbosity_level >= 2) {
         fputc('\n', stderr);
     }
     for (i = 0; i < data->tables->len; ++i) {
@@ -383,7 +385,7 @@ static GArray *load_expected_aml(test_data *data)
 try_again:
         aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir, data->machine,
                                    sdt->aml, ext);
-        if (getenv("V")) {
+        if (verbosity_level >= 2) {
             fprintf(stderr, "Looking for expected file '%s'\n", aml_file);
         }
         if (g_file_test(aml_file, G_FILE_TEST_EXISTS)) {
@@ -395,7 +397,7 @@ try_again:
             goto try_again;
         }
         g_assert(exp_sdt.aml_file);
-        if (getenv("V")) {
+        if (verbosity_level >= 2) {
             fprintf(stderr, "Using expected file '%s'\n", aml_file);
         }
         ret = g_file_get_contents(aml_file, (gchar **)&exp_sdt.aml,
@@ -503,7 +505,7 @@ static void test_acpi_asl(test_data *data)
                         exp_sdt->aml, sdt->asl_file, sdt->aml_file,
                         exp_sdt->asl_file, exp_sdt->aml_file);
                 fflush(stderr);
-                if (getenv("V")) {
+                if (verbosity_level >= 1) {
                     const char *diff_env = getenv("DIFF");
                     const char *diff_cmd = diff_env ? diff_env : "diff -U 16";
                     char *diff = g_strdup_printf("%s %s %s", diff_cmd,
@@ -1974,8 +1976,13 @@ int main(int argc, char *argv[])
     const char *arch = qtest_get_arch();
     const bool has_kvm = qtest_has_accel("kvm");
     const bool has_tcg = qtest_has_accel("tcg");
+    char *v_env = getenv("V");
     int ret;
 
+    if (v_env) {
+        verbosity_level = atoi(v_env);
+    }
+
     g_test_init(&argc, &argv, NULL);
 
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
-- 
2.31.1


