Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BD06EABFB
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:46:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppr5A-00081q-Ss; Fri, 21 Apr 2023 09:45:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ppr51-0007vy-RU
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:45:40 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ppr50-000862-63
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:45:39 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q2wdp5Gtkz67ZJD;
 Fri, 21 Apr 2023 21:40:46 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 14:45:34 +0100
To: <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>
CC: Brice Goglin <Brice.Goglin@inria.fr>, Raghu H <raghuhack78@gmail.com>, Fan
 Ni <fan.ni@samsung.com>, <linuxarm@huawei.com>
Subject: [PATCH 1/3] docs/cxl: fix some typos
Date: Fri, 21 Apr 2023 14:45:05 +0100
Message-ID: <20230421134507.26842-2-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230421134507.26842-1-Jonathan.Cameron@huawei.com>
References: <20230421134507.26842-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Brice Goglin <Brice.Goglin@inria.fr>

Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 docs/system/devices/cxl.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/system/devices/cxl.rst b/docs/system/devices/cxl.rst
index f25783a4ec..b65480af6f 100644
--- a/docs/system/devices/cxl.rst
+++ b/docs/system/devices/cxl.rst
@@ -162,7 +162,7 @@ Example system Topology. x marks the match in each decoder level::
   |<------------------SYSTEM PHYSICAL ADDRESS MAP (1)----------------->|
   |    __________   __________________________________   __________    |
   |   |          | |                                  | |          |   |
-  |   | CFMW 0   | |  CXL Fixed Memory Window 1       | | CFMW 1   |   |
+  |   | CFMW 0   | |  CXL Fixed Memory Window 1       | | CFMW 2   |   |
   |   | HB0 only | |  Configured to interleave memory | | HB1 only |   |
   |   |          | |  memory accesses across HB0/HB1  | |          |   |
   |   |__________| |_____x____________________________| |__________|   |
@@ -208,8 +208,8 @@ Notes:
 (1) **3 CXL Fixed Memory Windows (CFMW)** corresponding to different
     ranges of the system physical address map.  Each CFMW has
     particular interleave setup across the CXL Host Bridges (HB)
-    CFMW0 provides uninterleaved access to HB0, CFW2 provides
-    uninterleaved access to HB1. CFW1 provides interleaved memory access
+    CFMW0 provides uninterleaved access to HB0, CFMW2 provides
+    uninterleaved access to HB1. CFMW1 provides interleaved memory access
     across HB0 and HB1.
 
 (2) **Two CXL Host Bridges**. Each of these has 2 CXL Root Ports and
@@ -247,7 +247,7 @@ Example topology involving a switch::
   |<------------------SYSTEM PHYSICAL ADDRESS MAP (1)----------------->|
   |    __________   __________________________________   __________    |
   |   |          | |                                  | |          |   |
-  |   | CFMW 0   | |  CXL Fixed Memory Window 1       | | CFMW 1   |   |
+  |   | CFMW 0   | |  CXL Fixed Memory Window 1       | | CFMW 2   |   |
   |   | HB0 only | |  Configured to interleave memory | | HB1 only |   |
   |   |          | |  memory accesses across HB0/HB1  | |          |   |
   |   |____x_____| |__________________________________| |__________|   |
-- 
2.37.2


