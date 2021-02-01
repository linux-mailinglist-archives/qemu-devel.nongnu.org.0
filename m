Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DA730AB0E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:23:31 +0100 (CET)
Received: from localhost ([::1]:37362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6b34-0006Iw-Rm
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:23:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l6b02-0003IL-9F
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:20:24 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l6azu-00032q-2Z
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:20:22 -0500
Received: from fraeml743-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DTs2c4nLjz67jbC;
 Mon,  1 Feb 2021 23:15:36 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml743-chm.china.huawei.com (10.206.15.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 1 Feb 2021 16:20:12 +0100
Received: from lhrphicprd00229.huawei.com (10.123.41.22) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 1 Feb 2021 15:20:11 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 1/4] include/standard-headers/linux/pci_regs: temp hack to
 add necessary DOE definitions.
Date: Mon, 1 Feb 2021 23:16:26 +0800
Message-ID: <20210201151629.29656-2-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20210201151629.29656-1-Jonathan.Cameron@huawei.com>
References: <20210201151629.29656-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.123.41.22]
X-ClientProxiedBy: lhreml751-chm.china.huawei.com (10.201.108.201) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Ben Widawsky <ben.widawsky@intel.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Vishal
 Verma <vishal.l.verma@intel.com>, f.fangjian@huawei.com,
 Chris Browy <cbrowy@avery-design.com>, f4bug@amsat.org, linuxarm@openeuler.org,
 jcm@redhat.com, Prashant V Agarwal <agpr123@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 include/standard-headers/linux/pci_regs.h | 33 ++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/include/standard-headers/linux/pci_regs.h b/include/standard-headers/linux/pci_regs.h
index e709ae8235..7e852d3dd0 100644
--- a/include/standard-headers/linux/pci_regs.h
+++ b/include/standard-headers/linux/pci_regs.h
@@ -730,7 +730,8 @@
 #define PCI_EXT_CAP_ID_DVSEC	0x23	/* Designated Vendor-Specific */
 #define PCI_EXT_CAP_ID_DLF	0x25	/* Data Link Feature */
 #define PCI_EXT_CAP_ID_PL_16GT	0x26	/* Physical Layer 16.0 GT/s */
-#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_PL_16GT
+#define PCI_EXT_CAP_ID_DOE	0x2E	/* Data Object Exchange */
+#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_DOE
 
 #define PCI_EXT_CAP_DSN_SIZEOF	12
 #define PCI_EXT_CAP_MCAST_ENDPOINT_SIZEOF 40
@@ -1092,4 +1093,34 @@
 #define  PCI_PL_16GT_LE_CTRL_USP_TX_PRESET_MASK		0x000000F0
 #define  PCI_PL_16GT_LE_CTRL_USP_TX_PRESET_SHIFT	4
 
+/* Data Object Exchange */
+#define PCI_DOE_CAP		0x04
+#define  PCI_DOE_CAP_INT_SUPPORT			0x00000001
+#define  PCI_DOE_CAP_INT_MSG_NUM			0x00000FFE
+
+#define PCI_DOE_CTRL		0x08
+#define  PCI_DOE_CTRL_DOE_ABORT				0x00000001
+#define  PCI_DOE_CTRL_DOE_INT_EN			0x00000002
+#define  PCI_DOE_CTRL_DOE_GO				0x80000000
+
+#define PCI_DOE_STATUS		0x0c
+#define  PCI_DOE_STATUS_DOE_BUSY			0x00000001
+#define  PCI_DOE_STATUS_INT_STATUS			0x00000002
+#define  PCI_DOE_STATUS_DOE_ERROR			0x00000004
+#define  PCI_DOE_STATUS_DATA_OBJECT_READY		0x80000000
+
+#define PCI_DOE_WRITE_MAILBOX	0x10
+#define PCI_DOE_READ_MAILBOX	0x14
+
+/* Data Object Format DOE ECN 6.xx.1 */
+#define PCI_DATA_OBJ_DW0_VID				0x0000ffff
+#define PCI_DATA_OBJ_DW0_TYPE				0x00ff0000
+#define PCI_DATA_OBJ_DW1_LEN				0x0003ffff
+
+/* DOE Discover Data Object */
+#define PCI_DOE_DIS_OBJ_TYPE	 0x1
+#define PCI_DOE_DIS_REQ_D0_DW0_INDEX			0x000000ff
+#define PCI_DOE_DIS_RSP_DO_DW0_VID			0x0000ffff
+#define PCI_DOE_DIS_RSP_D0_DW0_PROT			0x00ff0000
+#define PCI_DOE_DIS_RSP_D0_DW0_NEXT_INDEX		0xff000000
 #endif /* LINUX_PCI_REGS_H */
-- 
2.19.1


