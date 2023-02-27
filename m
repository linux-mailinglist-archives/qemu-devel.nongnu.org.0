Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EACD6A470F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 17:33:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWgQU-0004WZ-HG; Mon, 27 Feb 2023 11:32:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pWgQS-0004RU-8i
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 11:32:32 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pWgQQ-0004s9-CO
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 11:32:32 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PQQvk2Kcvz67Zn3;
 Tue, 28 Feb 2023 00:30:10 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Feb 2023 16:32:27 +0000
To: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, Fan Ni
 <fan.ni@samsung.com>
CC: Ben Widawsky <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>,
 <linuxarm@huawei.com>, Ira Weiny <ira.weiny@intel.com>, Gregory Price
 <gourry.memverge@gmail.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Mike Maslenkin <mike.maslenkin@gmail.com>, Dave Jiang
 <dave.jiang@intel.com>
Subject: [PATCH v4 1/2] tests/qtest/cxl-test: whitespace, line ending cleanup
Date: Mon, 27 Feb 2023 16:31:56 +0000
Message-ID: <20230227163157.6621-2-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230227163157.6621-1-Jonathan.Cameron@huawei.com>
References: <20230227163157.6621-1-Jonathan.Cameron@huawei.com>
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

From: Gregory Price <gourry.memverge@gmail.com>

Defines are starting to exceed line length limits, align them for
cleanliness before making modifications.

Signed-off-by: Gregory Price <gregory.price@memverge.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/qtest/cxl-test.c | 84 +++++++++++++++++++++++-------------------
 1 file changed, 46 insertions(+), 38 deletions(-)

diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
index 61f25a72b6..eda2bbbbe6 100644
--- a/tests/qtest/cxl-test.c
+++ b/tests/qtest/cxl-test.c
@@ -8,50 +8,58 @@
 #include "qemu/osdep.h"
 #include "libqtest-single.h"
 
-#define QEMU_PXB_CMD "-machine q35,cxl=on " \
-                     "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 "  \
-                     "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.size=4G "
+#define QEMU_PXB_CMD \
+    "-machine q35,cxl=on " \
+    "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 " \
+    "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.size=4G "
 
-#define QEMU_2PXB_CMD "-machine q35,cxl=on "                            \
-                      "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 "  \
-                      "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 " \
-                      "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=4G "
+#define QEMU_2PXB_CMD \
+    "-machine q35,cxl=on " \
+    "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 " \
+    "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 " \
+    "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=4G "
 
-#define QEMU_RP "-device cxl-rp,id=rp0,bus=cxl.0,chassis=0,slot=0 "
+#define QEMU_RP \
+    "-device cxl-rp,id=rp0,bus=cxl.0,chassis=0,slot=0 "
 
 /* Dual ports on first pxb */
-#define QEMU_2RP "-device cxl-rp,id=rp0,bus=cxl.0,chassis=0,slot=0 " \
-                 "-device cxl-rp,id=rp1,bus=cxl.0,chassis=0,slot=1 "
+#define QEMU_2RP \
+    "-device cxl-rp,id=rp0,bus=cxl.0,chassis=0,slot=0 " \
+    "-device cxl-rp,id=rp1,bus=cxl.0,chassis=0,slot=1 "
 
 /* Dual ports on each of the pxb instances */
-#define QEMU_4RP "-device cxl-rp,id=rp0,bus=cxl.0,chassis=0,slot=0 " \
-                 "-device cxl-rp,id=rp1,bus=cxl.0,chassis=0,slot=1 " \
-                 "-device cxl-rp,id=rp2,bus=cxl.1,chassis=0,slot=2 " \
-                 "-device cxl-rp,id=rp3,bus=cxl.1,chassis=0,slot=3 "
-
-#define QEMU_T3D "-object memory-backend-file,id=cxl-mem0,mem-path=%s,size=256M " \
-                 "-object memory-backend-file,id=lsa0,mem-path=%s,size=256M "    \
-                 "-device cxl-type3,bus=rp0,memdev=cxl-mem0,lsa=lsa0,id=cxl-pmem0 "
-
-#define QEMU_2T3D "-object memory-backend-file,id=cxl-mem0,mem-path=%s,size=256M "    \
-                  "-object memory-backend-file,id=lsa0,mem-path=%s,size=256M "    \
-                  "-device cxl-type3,bus=rp0,memdev=cxl-mem0,lsa=lsa0,id=cxl-pmem0 " \
-                  "-object memory-backend-file,id=cxl-mem1,mem-path=%s,size=256M "    \
-                  "-object memory-backend-file,id=lsa1,mem-path=%s,size=256M "    \
-                  "-device cxl-type3,bus=rp1,memdev=cxl-mem1,lsa=lsa1,id=cxl-pmem1 "
-
-#define QEMU_4T3D "-object memory-backend-file,id=cxl-mem0,mem-path=%s,size=256M " \
-                  "-object memory-backend-file,id=lsa0,mem-path=%s,size=256M "    \
-                  "-device cxl-type3,bus=rp0,memdev=cxl-mem0,lsa=lsa0,id=cxl-pmem0 " \
-                  "-object memory-backend-file,id=cxl-mem1,mem-path=%s,size=256M "    \
-                  "-object memory-backend-file,id=lsa1,mem-path=%s,size=256M "    \
-                  "-device cxl-type3,bus=rp1,memdev=cxl-mem1,lsa=lsa1,id=cxl-pmem1 " \
-                  "-object memory-backend-file,id=cxl-mem2,mem-path=%s,size=256M "    \
-                  "-object memory-backend-file,id=lsa2,mem-path=%s,size=256M "    \
-                  "-device cxl-type3,bus=rp2,memdev=cxl-mem2,lsa=lsa2,id=cxl-pmem2 " \
-                  "-object memory-backend-file,id=cxl-mem3,mem-path=%s,size=256M "    \
-                  "-object memory-backend-file,id=lsa3,mem-path=%s,size=256M "    \
-                  "-device cxl-type3,bus=rp3,memdev=cxl-mem3,lsa=lsa3,id=cxl-pmem3 "
+#define QEMU_4RP \
+    "-device cxl-rp,id=rp0,bus=cxl.0,chassis=0,slot=0 " \
+    "-device cxl-rp,id=rp1,bus=cxl.0,chassis=0,slot=1 " \
+    "-device cxl-rp,id=rp2,bus=cxl.1,chassis=0,slot=2 " \
+    "-device cxl-rp,id=rp3,bus=cxl.1,chassis=0,slot=3 "
+
+#define QEMU_T3D \
+    "-object memory-backend-file,id=cxl-mem0,mem-path=%s,size=256M " \
+    "-object memory-backend-file,id=lsa0,mem-path=%s,size=256M " \
+    "-device cxl-type3,bus=rp0,memdev=cxl-mem0,lsa=lsa0,id=cxl-pmem0 "
+
+#define QEMU_2T3D \
+    "-object memory-backend-file,id=cxl-mem0,mem-path=%s,size=256M " \
+    "-object memory-backend-file,id=lsa0,mem-path=%s,size=256M " \
+    "-device cxl-type3,bus=rp0,memdev=cxl-mem0,lsa=lsa0,id=cxl-pmem0 " \
+    "-object memory-backend-file,id=cxl-mem1,mem-path=%s,size=256M " \
+    "-object memory-backend-file,id=lsa1,mem-path=%s,size=256M " \
+    "-device cxl-type3,bus=rp1,memdev=cxl-mem1,lsa=lsa1,id=cxl-pmem1 "
+
+#define QEMU_4T3D \
+    "-object memory-backend-file,id=cxl-mem0,mem-path=%s,size=256M " \
+    "-object memory-backend-file,id=lsa0,mem-path=%s,size=256M " \
+    "-device cxl-type3,bus=rp0,memdev=cxl-mem0,lsa=lsa0,id=cxl-pmem0 " \
+    "-object memory-backend-file,id=cxl-mem1,mem-path=%s,size=256M " \
+    "-object memory-backend-file,id=lsa1,mem-path=%s,size=256M " \
+    "-device cxl-type3,bus=rp1,memdev=cxl-mem1,lsa=lsa1,id=cxl-pmem1 " \
+    "-object memory-backend-file,id=cxl-mem2,mem-path=%s,size=256M " \
+    "-object memory-backend-file,id=lsa2,mem-path=%s,size=256M " \
+    "-device cxl-type3,bus=rp2,memdev=cxl-mem2,lsa=lsa2,id=cxl-pmem2 " \
+    "-object memory-backend-file,id=cxl-mem3,mem-path=%s,size=256M " \
+    "-object memory-backend-file,id=lsa3,mem-path=%s,size=256M " \
+    "-device cxl-type3,bus=rp3,memdev=cxl-mem3,lsa=lsa3,id=cxl-pmem3 "
 
 static void cxl_basic_hb(void)
 {
-- 
2.37.2


