Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 288CA6A5872
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 12:40:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWyKb-0007kr-Ed; Tue, 28 Feb 2023 06:39:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pWyKV-0007aD-Rz
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:39:35 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pWyKT-0005jd-Gl
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:39:35 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PQwJ625qzz6J7dJ;
 Tue, 28 Feb 2023 19:34:30 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Feb 2023 11:39:24 +0000
To: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Fan Ni <fan.ni@samsung.com>
CC: <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>
Subject: [PATCH] MAINTAINERS: Add Fan Ni as Compute eXpress Link QEMU reviewer
Date: Tue, 28 Feb 2023 11:39:26 +0000
Message-ID: <20230228113926.11485-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
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

Fan Ni has offered to help out with QEMU CXL emulation reviewing.
Add him as a designated reviewer.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

--
Thanks to Fan for stepping up after I requested help following Ben
stepping down as co-maintainer. Fan base been active in testing
and review recently so great to have Fan on board.

Based on patch [PATCH] MAINTAINERS: Remove CXL maintainer Ben Widawsky

Based-of: Message-id: 20230220212437.1462314-1-armbru@redhat.com
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7ea56c6ccc..838e1a91a4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2633,6 +2633,7 @@ T: git https://gitlab.com/vsementsov/qemu.git block
 
 Compute Express Link
 M: Jonathan Cameron <jonathan.cameron@huawei.com>
+R: Fan Ni <fan.ni@samsung.com>
 S: Supported
 F: hw/cxl/
 F: hw/mem/cxl_type3.c
-- 
2.37.2


