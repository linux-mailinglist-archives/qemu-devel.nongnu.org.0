Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EE4424C20
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 05:13:41 +0200 (CEST)
Received: from localhost ([::1]:45506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYJqn-0005HU-05
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 23:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mYJlS-0004mC-Uv; Wed, 06 Oct 2021 23:08:10 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mYJlR-000162-AH; Wed, 06 Oct 2021 23:08:10 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HPx6q37y8z1DHVJ;
 Thu,  7 Oct 2021 11:06:27 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 7 Oct 2021 11:07:56 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 7 Oct 2021 11:07:55 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>
Subject: [PATCH v7 6/8] tests/data/acpi/virt: Add empty binary files for PPTT
Date: Thu, 7 Oct 2021 11:07:44 +0800
Message-ID: <20211007030746.10420-7-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211007030746.10420-1-wangyanan55@huawei.com>
References: <20211007030746.10420-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add empty binary files for the new introduced PPTT table under
tests/data/acpi/virt, and list them as files to be changed in
tests/qtest/bios-tables-test-allowed-diff.h

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 tests/data/acpi/virt/PPTT                   | 0
 tests/data/acpi/virt/PPTT.memhp             | 0
 tests/data/acpi/virt/PPTT.numamem           | 0
 tests/data/acpi/virt/PPTT.pxb               | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
 5 files changed, 4 insertions(+)
 create mode 100644 tests/data/acpi/virt/PPTT
 create mode 100644 tests/data/acpi/virt/PPTT.memhp
 create mode 100644 tests/data/acpi/virt/PPTT.numamem
 create mode 100644 tests/data/acpi/virt/PPTT.pxb

diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/virt/PPTT
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/PPTT.memhp b/tests/data/acpi/virt/PPTT.memhp
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/PPTT.numamem b/tests/data/acpi/virt/PPTT.numamem
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/PPTT.pxb b/tests/data/acpi/virt/PPTT.pxb
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..4b365aa46b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/PPTT",
+"tests/data/acpi/virt/PPTT.memhp",
+"tests/data/acpi/virt/PPTT.numamem",
+"tests/data/acpi/virt/PPTT.pxb",
-- 
2.19.1


