Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D896631C4CD
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 02:10:41 +0100 (CET)
Received: from localhost ([::1]:57656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBosy-0006zN-Tw
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 20:10:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBopQ-0001vG-V6
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 20:07:01 -0500
Received: from mga07.intel.com ([134.134.136.100]:13610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBopO-0004gD-EY
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 20:07:00 -0500
IronPort-SDR: GNhhQM8D85ikE65AIuyP6gVCNisKC3sntouwhE4FY/vndit9UUYZFil7777JErASE0cMnO1cQj
 ngZbR+S1g5MA==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="246849241"
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="246849241"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 17:06:44 -0800
IronPort-SDR: vdLihsVIKiV5B2Fi3ZgpNpB+y8peo179SxM0flzVAQ/30XIWuartwuRX71a9bpiNchk0Otzp7A
 cwbaW3EJViCg==
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="591695502"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 17:06:43 -0800
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com
Subject: [PATCH v4 09/10] acpi: add test case for -no-hpet
Date: Mon, 15 Feb 2021 17:04:14 -0800
Message-Id: <008c2985ae1becad2a02d3dbdb1eb516e23aac7a.1613436967.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613436967.git.isaku.yamahata@intel.com>
References: <cover.1613436967.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1613436967.git.isaku.yamahata@intel.com>
References: <cover.1613436967.git.isaku.yamahata@intel.com>
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=isaku.yamahata@intel.com; helo=mga07.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NML_ADSP_CUSTOM_MED=0.9,
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
index 592c074ec7..3fb7ed0c46 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -990,6 +990,17 @@ static void test_acpi_piix4_tcg_smm_compat_nosmm(void)
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
@@ -1035,6 +1046,17 @@ static void test_acpi_q35_tcg_smm_compat_nosmm(void)
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
@@ -1396,11 +1418,13 @@ int main(int argc, char *argv[])
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


