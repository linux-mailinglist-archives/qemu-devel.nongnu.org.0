Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1E2681389
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 15:40:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMVKy-0005NB-MB; Mon, 30 Jan 2023 09:40:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pMVKr-0005J2-BE
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:40:41 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pMVKp-00062q-GX
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:40:40 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4P59k64by5z6H6rj;
 Mon, 30 Jan 2023 22:37:02 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Mon, 30 Jan 2023 14:40:37 +0000
To: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
CC: Ben Widawsky <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>,
 <linuxarm@huawei.com>, Ira Weiny <ira.weiny@intel.com>, Gregory Price
 <gourry.memverge@gmail.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: [PATCH v3 07/10] tests/acpi: Update q35/DSDT.cxl for removed
 duplicate _UID
Date: Mon, 30 Jan 2023 14:37:02 +0000
Message-ID: <20230130143705.11758-8-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230130143705.11758-1-Jonathan.Cameron@huawei.com>
References: <20230130143705.11758-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
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

Dropping the ID effects this table in trivial fashion.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 v3: New patch to update the table.
 tests/data/acpi/q35/DSDT.cxl                | Bin 9636 -> 9622 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 2 files changed, 1 deletion(-)

diff --git a/tests/data/acpi/q35/DSDT.cxl b/tests/data/acpi/q35/DSDT.cxl
index f9c6dd4ee0502ca000509493411b421dfd23b96f..e0a141d6f80865c5f2573dabd41fc353108df89a 100644
GIT binary patch
delta 65
zcmZ4DJ<XfTCD<ionkoYWBiBZ*y)xV`DlzfFPVv!A-pZ3N$yjZUmtV~|d7oS;iiDgz
INWzs30G34*AOHXW

delta 79
zcmbQ{y~LZ#CD<ioi7EpFW8Oxty)xY1DlzfFPVv!APAZcx$yl+)hkCkj-P;@>zlL%0
ScDYa#d2xBDJP%ObjST?dDi`tq

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 9ce0f596cc..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.cxl",
-- 
2.37.2


