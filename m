Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FEF4986F5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 18:34:35 +0100 (CET)
Received: from localhost ([::1]:34132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC3Eg-00029s-Pw
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 12:34:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nC2zH-0008MT-1G
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:18:39 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nC2zF-0007sX-7v
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:18:38 -0500
Received: from fraeml712-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JjGms6jCjz6FGW2;
 Tue, 25 Jan 2022 01:14:21 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml712-chm.china.huawei.com (10.206.15.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 24 Jan 2022 18:18:35 +0100
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 24 Jan 2022 17:18:34 +0000
To: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, <linuxarm@huawei.com>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: [PATCH v4 03/42] MAINTAINERS: Add entry for Compute Express Link
 Emulation
Date: Mon, 24 Jan 2022 17:16:26 +0000
Message-ID: <20220124171705.10432-4-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml740-chm.china.huawei.com (10.201.108.190) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

From: Jonathan Cameron <jonathan.cameron@huawei.com>

The CXL emulation will be jointly maintained by Ben Widawsky
and Jonathan Cameron.  Broken out as a separate patch
to improve visibility.

Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e4b3a4bcdf..7fe5b0e5cd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2519,6 +2519,13 @@ F: qapi/block*.json
 F: qapi/transaction.json
 T: git https://repo.or.cz/qemu/armbru.git block-next
 
+Compute Express Link
+M: Ben Widawsky <ben.widawsky@intel.com>
+M: Jonathan Cameron <jonathan.cameron@huawei.com>
+S: Supported
+F: hw/cxl/
+F: include/hw/cxl/
+
 Dirty Bitmaps
 M: Eric Blake <eblake@redhat.com>
 M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
-- 
2.32.0


