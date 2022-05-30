Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A53DE537E43
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 15:56:35 +0200 (CEST)
Received: from localhost ([::1]:45686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvfso-0002mB-Pr
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 09:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nvfks-0001IR-Gr
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:48:25 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nvfkn-0000pJ-MD
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:48:21 -0400
Received: from fraeml738-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LBc7t58vzz6GD5M;
 Mon, 30 May 2022 21:43:54 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml738-chm.china.huawei.com (10.206.15.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 30 May 2022 15:48:14 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 30 May 2022 14:48:14 +0100
To: Paolo Bonzini <pbonzini@redhat.com>, <qemu-devel@nongnu.org>, "Michael S .
 Tsirkin" <mst@redhat.com>
CC: <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>,
 <alex.bennee@linaro.org>, Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>, "Mark
 Cave-Ayland" <mark.cave-ayland@ilande.co.uk>, Adam Manzanares
 <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>, Ben Widawsky
 <ben.widawsky@intel.com>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH 6/8] tests/acpi: Update q35/CEDT.cxl for new memory addresses.
Date: Mon, 30 May 2022 14:45:12 +0100
Message-ID: <20220530134514.31664-7-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220530134514.31664-1-Jonathan.Cameron@huawei.com>
References: <20220530134514.31664-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml713-chm.china.huawei.com (10.201.108.64) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

The CEDT table includes addreses of host bridge registers.
There are allocated in a different order due to the previous
patch, so update to the table is needed.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/data/acpi/q35/CEDT.cxl                | Bin 184 -> 184 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 2 files changed, 1 deletion(-)

diff --git a/tests/data/acpi/q35/CEDT.cxl b/tests/data/acpi/q35/CEDT.cxl
index b8fa06b00e65712e91e0a5ea0d9277e0146d1c00..ff8203af070241bd23dd0eb8a51460692bb7d229 100644
GIT binary patch
delta 18
acmdnNxPx(m*~Boui7rAD&G;s!ga80Nd<HWB

delta 18
acmdnNxPx(m*~Boui7rAD&G;s!ga80Nd<HWB

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index effa58b75b..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/CEDT.cxl",
-- 
2.32.0


