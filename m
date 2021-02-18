Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8FF31E613
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 06:57:40 +0100 (CET)
Received: from localhost ([::1]:43498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCcJn-00066D-RL
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 00:57:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lCcFS-0000t1-3Q
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 00:53:10 -0500
Received: from mga05.intel.com ([192.55.52.43]:7021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lCcFO-0003hi-Je
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 00:53:09 -0500
IronPort-SDR: vujncXsiifhLK4HH4blbUNkPbx58I+3kJYBnGK/9zvjToWyVno9+NroKTx9SaJgvBlHJstJO6R
 gvfOwO77zOCw==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="268260187"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; d="scan'208";a="268260187"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 21:53:00 -0800
IronPort-SDR: YR+pTTkPm1UlC15aZI/J7/BB5jJs/Af5IZQv6qNWLa87RX2rKDRHm7YDxSJFsB/x2p1KQYC9S4
 i/iUgYgMiYVA==
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; d="scan'208";a="589940921"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 21:53:00 -0800
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com
Subject: [PATCH v5 02/10] qtest: update
 tests/qtest/bios-tables-test-allowed-diff.h
Date: Wed, 17 Feb 2021 21:51:10 -0800
Message-Id: <c8285f54deab362ed839d31f0fb5bb590ab71fdd.1613615732.git.isaku.yamahata@intel.com>
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

The following tests will modify acpi tables.
prepare qtests to allow acpi table change.
add new tables for new tests.
- tests/data/acpi/pc/DSDT.nohpet
- tests/data/acpi/pc/FACP.nosmm
- tests/data/acpi/q35/DSDT.nohpet
- tests/data/acpi/q35/FACP.nosmm

Acked-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 tests/data/acpi/pc/DSDT.nohpet              |  0
 tests/data/acpi/pc/FACP.nosmm               |  0
 tests/data/acpi/q35/DSDT.nohpet             |  0
 tests/data/acpi/q35/FACP.nosmm              |  0
 tests/qtest/bios-tables-test-allowed-diff.h | 14 ++++++++++++++
 5 files changed, 14 insertions(+)
 create mode 100644 tests/data/acpi/pc/DSDT.nohpet
 create mode 100644 tests/data/acpi/pc/FACP.nosmm
 create mode 100644 tests/data/acpi/q35/DSDT.nohpet
 create mode 100644 tests/data/acpi/q35/FACP.nosmm

diff --git a/tests/data/acpi/pc/DSDT.nohpet b/tests/data/acpi/pc/DSDT.nohpet
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/pc/FACP.nosmm b/tests/data/acpi/pc/FACP.nosmm
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/DSDT.nohpet b/tests/data/acpi/q35/DSDT.nohpet
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/FACP.nosmm b/tests/data/acpi/q35/FACP.nosmm
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..95592459c5 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,15 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/FACP.nosmm",
+"tests/data/acpi/pc/DSDT.nohpet",
+"tests/data/acpi/q35/DSDT",
+"tests/data/acpi/q35/DSDT.tis",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.mmio64",
+"tests/data/acpi/q35/DSDT.ipmibt",
+"tests/data/acpi/q35/DSDT.cphp",
+"tests/data/acpi/q35/DSDT.memhp",
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/FACP.nosmm",
+"tests/data/acpi/q35/DSDT.nohpet",
+"tests/data/acpi/q35/DSDT.dimmpxm",
+"tests/data/acpi/q35/DSDT.acpihmat",
-- 
2.17.1


