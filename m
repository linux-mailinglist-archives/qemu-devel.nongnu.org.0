Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A0E60F47A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 12:09:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onzjg-0007wJ-At; Thu, 27 Oct 2022 06:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1onzjK-00074C-Ks; Thu, 27 Oct 2022 06:03:25 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1onzjG-0004FR-9G; Thu, 27 Oct 2022 06:03:17 -0400
Received: from fraeml742-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Myh6J5s2Vz67Klm;
 Thu, 27 Oct 2022 18:01:44 +0800 (CST)
Received: from lhrpeml500004.china.huawei.com (7.191.163.9) by
 fraeml742-chm.china.huawei.com (10.206.15.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 12:03:11 +0200
Received: from O84201547D.china.huawei.com (10.122.247.218) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 11:03:11 +0100
To: <jonathan.cameron@huawei.com>, <qemu-devel@nongnu.org>
CC: <yangyicong@huawei.com>, <chenxiang66@hisilicon.com>,
 <linuxarm@huawei.com>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <imammedo@redhat.com>, <wangyanan55@huawei.com>,
 <marcel.apfelbaum@gmail.com>, <eduardo@habkost.net>, <Brice.Goglin@inria.fr>, 
 <mst@redhat.com>
Subject: [PATCH v3 5/8] tests: Add HMAT AArch64/virt empty table files
Date: Thu, 27 Oct 2022 11:00:34 +0100
Message-ID: <20221027100037.251-6-hesham.almatary@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221027100037.251-1-hesham.almatary@huawei.com>
References: <20221027100037.251-1-hesham.almatary@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.218]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500004.china.huawei.com (7.191.163.9)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=hesham.almatary@huawei.com; helo=frasgout.his.huawei.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Hesham Almatary <hesham.almatary@huawei.com>
From:  Hesham Almatary via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
---
 tests/data/acpi/virt/APIC.acpihmatvirt      | 0
 tests/data/acpi/virt/DSDT.acpihmatvirt      | 0
 tests/data/acpi/virt/HMAT.acpihmatvirt      | 0
 tests/data/acpi/virt/PPTT.acpihmatvirt      | 0
 tests/data/acpi/virt/SRAT.acpihmatvirt      | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 5 +++++
 6 files changed, 5 insertions(+)
 create mode 100644 tests/data/acpi/virt/APIC.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/DSDT.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/HMAT.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/PPTT.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/SRAT.acpihmatvirt

diff --git a/tests/data/acpi/virt/APIC.acpihmatvirt b/tests/data/acpi/virt/APIC.acpihmatvirt
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/DSDT.acpihmatvirt b/tests/data/acpi/virt/DSDT.acpihmatvirt
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/HMAT.acpihmatvirt b/tests/data/acpi/virt/HMAT.acpihmatvirt
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/PPTT.acpihmatvirt b/tests/data/acpi/virt/PPTT.acpihmatvirt
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/SRAT.acpihmatvirt b/tests/data/acpi/virt/SRAT.acpihmatvirt
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..4f849715bd 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,6 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/APIC.acpihmatvirt",
+"tests/data/acpi/virt/DSDT.acpihmatvirt",
+"tests/data/acpi/virt/HMAT.acpihmatvirt",
+"tests/data/acpi/virt/PPTT.acpihmatvirt",
+"tests/data/acpi/virt/SRAT.acpihmatvirt",
-- 
2.25.1


