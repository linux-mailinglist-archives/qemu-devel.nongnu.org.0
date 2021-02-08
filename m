Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FF631451B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:54:09 +0100 (CET)
Received: from localhost ([::1]:56918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9HI8-0002yJ-A7
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:54:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1l9EYr-0006gg-7S
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 16:59:13 -0500
Received: from mga02.intel.com ([134.134.136.20]:59480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1l9EYp-0005DL-N8
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 16:59:12 -0500
IronPort-SDR: zLM0oB6zN1AWX2MqjGCaQBs+FVLDU7Igvgn7NW+qw0pVu6SsTO5kOgLdVeVhBVwwBtNsyMZFm5
 brgl+YDzlWNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="168911422"
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="168911422"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 13:59:05 -0800
IronPort-SDR: +/NB0bfhmQ6OfwJ6puWKZ6FhtMdTM1caX2pKUBTfPixYceQKM1A/tpV+oNKVqEc90UvgAqLyK9
 ekOUCOAn2Ydw==
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="487608577"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 13:59:04 -0800
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com, philmd@redhat.com
Subject: [PATCH v2 2/9] qtest: update
 tests/qtest/bios-tables-test-allowed-diff.h
Date: Mon,  8 Feb 2021 13:57:21 -0800
Message-Id: <ec80955a1c7a9263bdb12b2117f3460e23ef7b09.1612821109.git.isaku.yamahata@intel.com>
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

The following tests will modify acpi tables.
prepare qtests to allow acpi table change.
add new tables for new tests.
- tests/data/acpi/q35/DSDT.nosmm
- tests/data/acpi/q35/FACP.nosmm
- tests/data/acpi/q35/DSDT.nohpet

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 tests/data/acpi/q35/DSDT.nohpet             |  0
 tests/data/acpi/q35/DSDT.nosmm              |  0
 tests/data/acpi/q35/FACP.nosmm              |  0
 tests/qtest/bios-tables-test-allowed-diff.h | 13 +++++++++++++
 4 files changed, 13 insertions(+)
 create mode 100644 tests/data/acpi/q35/DSDT.nohpet
 create mode 100644 tests/data/acpi/q35/DSDT.nosmm
 create mode 100644 tests/data/acpi/q35/FACP.nosmm

diff --git a/tests/data/acpi/q35/DSDT.nohpet b/tests/data/acpi/q35/DSDT.nohpet
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/DSDT.nosmm b/tests/data/acpi/q35/DSDT.nosmm
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/FACP.nosmm b/tests/data/acpi/q35/FACP.nosmm
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..b79ac495c2 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,14 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT",
+"tests/data/acpi/q35/DSDT.tis",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.ipmibt",
+"tests/data/acpi/q35/DSDT.cphp",
+"tests/data/acpi/q35/DSDT.memhp",
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/DSDT.dimmpxm",
+"tests/data/acpi/q35/DSDT.acpihmat",
+"tests/data/acpi/q35/DSDT.mmio64",
+"tests/data/acpi/q35/DSDT.nosmm",
+"tests/data/acpi/q35/FACP.nosmm",
+"tests/data/acpi/q35/DSDT.nohpet",
-- 
2.17.1


