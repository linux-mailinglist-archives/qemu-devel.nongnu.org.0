Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D27FA31E620
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 07:07:17 +0100 (CET)
Received: from localhost ([::1]:41650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCcT6-0000ys-Un
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 01:07:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lCcFZ-00019D-3q
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 00:53:17 -0500
Received: from mga05.intel.com ([192.55.52.43]:7037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lCcFW-0003nI-En
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 00:53:16 -0500
IronPort-SDR: Gy9xQLHYC8Z9AnlFCrWl1PlKaHqO+kaaCe6r6rG25fvAR+2NyaMV6CeO3Hqe5OINncftn+UQal
 RvgdJB1efAfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="268260195"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; d="scan'208";a="268260195"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 21:53:01 -0800
IronPort-SDR: HjbV2Zcjtkuj6LLBLaMGN7ptwb+00T4VyhuQYPUAEgj4EjC+S8CNnKc0nV84DZIUfjz8YxeU0O
 WwXKMfkBQ11Q==
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; d="scan'208";a="589940943"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 21:53:01 -0800
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com
Subject: [PATCH v5 09/10] acpi: add test case for -no-hpet
Date: Wed, 17 Feb 2021 21:51:17 -0800
Message-Id: <5ef9a81e49793afb42ffd19bbf1f44e269c65e93.1613615732.git.isaku.yamahata@intel.com>
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
 tests/qtest/bios-tables-test.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 93d037c29d..e020c83d2a 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1006,6 +1006,17 @@ static void test_acpi_piix4_tcg_smm_compat_nosmm(void)
     free_test_data(&data);
 }
 
+static void test_acpi_piix4_tcg_nohpet(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_PC;
+    data.variant = ".nohpet";
+    test_acpi_one("-no-hpet", &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_q35_tcg_numamem(void)
 {
     test_data data;
@@ -1051,6 +1062,17 @@ static void test_acpi_q35_tcg_smm_compat_nosmm(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_tcg_nohpet(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_Q35;
+    data.variant = ".nohpet";
+    test_acpi_one("-no-hpet", &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_piix4_tcg_numamem(void)
 {
     test_data data;
@@ -1516,11 +1538,13 @@ int main(int argc, char *argv[])
                        test_acpi_piix4_tcg_smm_compat);
         qtest_add_func("acpi/piix4/smm-compat-nosmm",
                        test_acpi_piix4_tcg_smm_compat_nosmm);
+        qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_tcg_nohpet);
         qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
         qtest_add_func("acpi/q35/smm-compat",
                        test_acpi_q35_tcg_smm_compat);
         qtest_add_func("acpi/q35/smm-compat-nosmm",
                        test_acpi_q35_tcg_smm_compat_nosmm);
+        qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
         qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
         qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
         qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
-- 
2.17.1


