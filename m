Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B087D314527
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:57:17 +0100 (CET)
Received: from localhost ([::1]:33240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9HLA-0004xM-Qu
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:57:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1l9EYu-0006lL-BC
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 16:59:16 -0500
Received: from mga02.intel.com ([134.134.136.20]:59487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1l9EYs-0005HW-Ki
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 16:59:16 -0500
IronPort-SDR: 8D4gvlMWD9655lTO+d5vT/8uH9wBa1R97jt/WT9wI5zQn5MSUEcD0A3PuW36vBJ33nh97BB4Yd
 CLD2FD+kftjA==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="168911426"
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="168911426"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 13:59:05 -0800
IronPort-SDR: cfErv9VxKimd7glGyxYezVKvokrLg6HJVvKWC+vvLv4D3OtVMS7qaqPx3+TbtiG8KosHGKstHO
 c9OBf1VfOR7g==
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="487608586"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 13:59:05 -0800
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com, philmd@redhat.com
Subject: [PATCH v2 5/9] acpi: add test case for smm unsupported -machine
 smm=off
Date: Mon,  8 Feb 2021 13:57:24 -0800
Message-Id: <b59eaefcfa5b4afc4c09056ebf9b9c3719422a0a.1612821109.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612821108.git.isaku.yamahata@intel.com>
References: <cover.1612821108.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1612821108.git.isaku.yamahata@intel.com>
References: <cover.1612821108.git.isaku.yamahata@intel.com>
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=isaku.yamahata@intel.com; helo=mga02.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 tests/qtest/bios-tables-test.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 669202fc95..096d15db68 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -969,6 +969,17 @@ static void test_acpi_q35_tcg_numamem(void)
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
 static void test_acpi_piix4_tcg_numamem(void)
 {
     test_data data;
@@ -1325,6 +1336,7 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
         qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem);
         qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
+        qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
         qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
         qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
         qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
-- 
2.17.1


