Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E546BEEF6
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 17:56:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdDMq-0003o7-En; Fri, 17 Mar 2023 12:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pdDMi-0003ig-VO
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 12:55:40 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pdDMg-0001lu-PT
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 12:55:40 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PdVY83B0vz67M1h;
 Sat, 18 Mar 2023 00:52:28 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 16:55:36 +0000
To: Michael Tsirkin <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 <qemu-devel@nongnu.org>
CC: <linuxarm@huawei.com>, <ani@anisinha.ca>, <berrange@redhat.com>, Fan Ni
 <fan.ni@samsung.com>, Dave Jiang <dave.jiang@intel.com>
Subject: [RFC PATCH 2/4] tests/acpi: Allow changes to DSDT.cxl/viot and
 SSDT.cxl/viot
Date: Fri, 17 Mar 2023 16:54:38 +0000
Message-ID: <20230317165440.24846-3-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230317165440.24846-1-Jonathan.Cameron@huawei.com>
References: <20230317165440.24846-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Splitting the PXB parts out of DSDT will change these files.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/data/acpi/q35/SSDT.cxl                | 0
 tests/data/acpi/q35/SSDT.viot               | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
 3 files changed, 4 insertions(+)

diff --git a/tests/data/acpi/q35/SSDT.cxl b/tests/data/acpi/q35/SSDT.cxl
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/SSDT.viot b/tests/data/acpi/q35/SSDT.viot
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..0307b25f93 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.cxl",
+"tests/data/acpi/q35/DSDT.viot",
+"tests/data/acpi/q35/SSDT.cxl",
+"tests/data/acpi/q35/SSDT.viot",
-- 
2.37.2


