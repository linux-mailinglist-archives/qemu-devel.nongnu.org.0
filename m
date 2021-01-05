Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E83322EB0F7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:07:19 +0100 (CET)
Received: from localhost ([::1]:33592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwpni-000548-Vl
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:07:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpbH-0000EE-PV
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:54:27 -0500
Received: from mga18.intel.com ([134.134.136.126]:10374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpbG-00016I-4Y
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:54:27 -0500
IronPort-SDR: r1cJyt0Jgiy6u0lJ2c2MYoIiduCuI9uhWbusqqyPhUtGZu/k3iXDpruya865BKU/Z2RG7zdIUa
 Psq+TszNQjhw==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="164841150"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="164841150"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:54:12 -0800
IronPort-SDR: nP0XrYh9l03GOgYTnUVr7ATti1O5rH1Uc5/8yjcfwDKTS1Ei8NMurK/cR8xZb3hGlvrwMUE+9J
 tuahxtsjsSRA==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="346338095"
Received: from tgeddam-mobl.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.140.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:54:07 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 30/32] tests/acpi: Add new CEDT files
Date: Tue,  5 Jan 2021 08:53:21 -0800
Message-Id: <20210105165323.783725-31-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210105165323.783725-1-ben.widawsky@intel.com>
References: <20210105165323.783725-1-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=ben.widawsky@intel.com; helo=mga18.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Ben Widawsky <ben.widawsky@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 Chris Browy <cbrowy@avery-design.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Prashant V Agarwal <agpr123@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 tests/data/acpi/pc/CEDT                     | Bin 0 -> 36 bytes
 tests/data/acpi/q35/CEDT                    | Bin 0 -> 36 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 3 files changed, 2 deletions(-)

diff --git a/tests/data/acpi/pc/CEDT b/tests/data/acpi/pc/CEDT
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..ebf9b54b0b27d9efca53359c3c2e560511f0e165 100644
GIT binary patch
literal 36
kcmZ>EbqP^nU|?X};N<V@5v<@85#a0$6k`O6f!H7#0Fb2z0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/CEDT b/tests/data/acpi/q35/CEDT
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..ebf9b54b0b27d9efca53359c3c2e560511f0e165 100644
GIT binary patch
literal 36
kcmZ>EbqP^nU|?X};N<V@5v<@85#a0$6k`O6f!H7#0Fb2z0RR91

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 9b07f1e1ff..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/CEDT",
-"tests/data/acpi/q35/CEDT",
-- 
2.30.0


