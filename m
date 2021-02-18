Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D97EE31E616
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 06:59:46 +0100 (CET)
Received: from localhost ([::1]:49744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCcLp-0000Lz-VR
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 00:59:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lCcFV-00011s-VY
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 00:53:13 -0500
Received: from mga05.intel.com ([192.55.52.43]:7032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lCcFU-0003ku-7h
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 00:53:13 -0500
IronPort-SDR: 5piqcbip1iE8n7yryxihoZPEPEhIl5SjhZt9qmc9jItxk5L5JvSL1BTTgdzKvtkbuHK40dFwG1
 Mj8Ozufvz0hg==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="268260191"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; d="scan'208";a="268260191"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 21:53:00 -0800
IronPort-SDR: DBA9EcgaQ1IXN8I9ge5S9QWpKb6bi3QcO9qGFq29ImqYBn+tlY71b9hXD9oQhJ7CLuPjHb0u82
 8TLKfQqxcipw==
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; d="scan'208";a="589940933"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 21:53:00 -0800
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com
Subject: [PATCH v5 06/10] acpi: add test case for smm unsupported -machine
 smm=off
Date: Wed, 17 Feb 2021 21:51:14 -0800
Message-Id: <22f774a51255af1608b07b00b257af426adcf4ab.1613615732.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613615732.git.isaku.yamahata@intel.com>
References: <cover.1613615732.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1613615732.git.isaku.yamahata@intel.com>
References: <cover.1613615732.git.isaku.yamahata@intel.com>
Received-SPF: pass client-ip=192.55.52.43;
 envelope-from=isaku.yamahata@intel.com; helo=mga05.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: isaku.yamahata@intel.com, isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 tests/qtest/bios-tables-test.c | 76 ++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 77053975aa..93d037c29d 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -973,6 +973,39 @@ static void test_acpi_piix4_tcg_memhp(void)
     free_test_data(&data);
 }
 
+static void test_acpi_piix4_tcg_nosmm(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_PC;
+    data.variant = ".nosmm";
+    test_acpi_one("-machine smm=off", &data);
+    free_test_data(&data);
+}
+
+static void test_acpi_piix4_tcg_smm_compat(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_PC;
+    data.variant = ".smm-compat";
+    test_acpi_one("-global PIIX4_PM.smm-compat=on", &data);
+    free_test_data(&data);
+}
+
+static void test_acpi_piix4_tcg_smm_compat_nosmm(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_PC;
+    data.variant = ".smm-compat-nosmm";
+    test_acpi_one("-global PIIX4_PM.smm-compat=on -machine smm=off", &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_q35_tcg_numamem(void)
 {
     test_data data;
@@ -985,6 +1018,39 @@ static void test_acpi_q35_tcg_numamem(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_tcg_nosmm(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_Q35;
+    data.variant = ".nosmm";
+    test_acpi_one("-machine smm=off", &data);
+    free_test_data(&data);
+}
+
+static void test_acpi_q35_tcg_smm_compat(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_Q35;
+    data.variant = ".smm-compat";
+    test_acpi_one("-global ICH9-LPC.smm-compat=on", &data);
+    free_test_data(&data);
+}
+
+static void test_acpi_q35_tcg_smm_compat_nosmm(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_Q35;
+    data.variant = ".smm-compat-nosmm";
+    test_acpi_one("-global ICH9-LPC.smm-compat=on -machine smm=off", &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_piix4_tcg_numamem(void)
 {
     test_data data;
@@ -1445,6 +1511,16 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
         qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem);
         qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
+        qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm);
+        qtest_add_func("acpi/piix4/smm-compat",
+                       test_acpi_piix4_tcg_smm_compat);
+        qtest_add_func("acpi/piix4/smm-compat-nosmm",
+                       test_acpi_piix4_tcg_smm_compat_nosmm);
+        qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
+        qtest_add_func("acpi/q35/smm-compat",
+                       test_acpi_q35_tcg_smm_compat);
+        qtest_add_func("acpi/q35/smm-compat-nosmm",
+                       test_acpi_q35_tcg_smm_compat_nosmm);
         qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
         qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
         qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
-- 
2.17.1


