Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BC430B489
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 02:18:14 +0100 (CET)
Received: from localhost ([::1]:47712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6kKb-0008AK-4q
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 20:18:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1l6k4b-0001BZ-6u
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 20:01:41 -0500
Received: from mga18.intel.com ([134.134.136.126]:33362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1l6k4X-0001oN-KE
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 20:01:40 -0500
IronPort-SDR: 8L4aHyKKWVtPtFLWoeyJLCz10ckM8UMr0fi0vo6xyW6R5HZphByk/Z8Ayw/TQJCzr+CAb+7S29
 4YcKXndWUgaw==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="168457138"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="168457138"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 17:00:20 -0800
IronPort-SDR: szHpHkEB6C+oRtvKQRdrkrz1rx3RiRZtvYZYUqXU2QITVjCeoPVnHjhR+bLvtlLFJAFYGvUGrz
 jQx1egXaE6FQ==
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="581764264"
Received: from jambrizm-mobl1.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.133.15])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 17:00:19 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 26/31] tests/acpi: Add new CEDT files
Date: Mon,  1 Feb 2021 16:59:43 -0800
Message-Id: <20210202005948.241655-27-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210202005948.241655-1-ben.widawsky@intel.com>
References: <20210202005948.241655-1-ben.widawsky@intel.com>
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
Cc: Ben Widawsky <ben.widawsky@intel.com>, David Hildenbrand <david@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 "John Groves \(jgroves\)" <jgroves@micron.com>,
 Chris Browy <cbrowy@avery-design.com>, Markus Armbruster <armbru@redhat.com>,
 linux-cxl@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>
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


