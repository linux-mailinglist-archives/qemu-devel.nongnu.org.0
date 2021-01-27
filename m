Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855CD30603F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 16:53:29 +0100 (CET)
Received: from localhost ([::1]:43112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4n8K-0001n2-I1
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 10:53:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l4n3p-00062A-PV
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 10:48:49 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:54816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l4n3k-0001qs-NW
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 10:48:49 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10RFj4c2096550;
 Wed, 27 Jan 2021 15:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=211zhXJrH7xkFO51Vzk+yx3yVr7S5lQel+eMsYNdqYA=;
 b=P2v3241Zo9SuEnlSByrKlbOvvVVUoRUgTHRttmasfKrgkeIq+Du90axP3ce5ATDeRvu7
 DG05L/pgBCwM6FZpKWvrVuI4rNSWlpWYXnfF+tpskKODHH6FteCeDfuNszSHzG6QKspe
 YzPQnqOzub29BIqxYkVd4Fl8Ks+mTADKXjjxZ+JMDaDWVR3sfir6D+i2PhIjFWcNwX8v
 WmRT+VQqBwqDPCyHVi5NunNJarPTVLrRRNnYuQeTY8llg6kw7ITeP2U8LlfsHhzfOkNm
 8j+73EbOMHtpHVSR+hXjB+TOxfzpT9RQLFXML9pavpaORWXCrEgvecCYg+5FiQ0qKZ5d CQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 368brkqtbf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 15:48:42 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10RFj7YC024904;
 Wed, 27 Jan 2021 15:46:42 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by aserp3030.oracle.com with ESMTP id 368wcpdwqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 15:46:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnQL8eu3chcf0KBllpnzn13ga7HAgTtuUEJY0Fjf7MGHUAR0w1HM7Sxo0pFXfUIKYcIYYs43OZhGAahiDi9H3rhVK/fEk6vEmF0F28lJFJOumK9/57Uxf8UsMkHW1gF0szR147Q6jfzOiLhc/on3AQm9N0aopcIoTL6XeF3pnMnvJWD1WKUrSQ8RIqNzfxD5BQ/cGtuQEa3BDlDu5oFS4e6SrC4/h0KdcC9urKL5X3TSCm5cLqKKr4QHORvvuAJBLUdliRdFAz1A0Op8d8cxFOd8pnK+9jgD0giyrivN7By4Ip2OkEv6L75ahngt0phJhxDFLNIWZHrVfkuqWBRdhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=211zhXJrH7xkFO51Vzk+yx3yVr7S5lQel+eMsYNdqYA=;
 b=JkrMR14PrnFqGHGdWpkQn/mGWHRRmI+LV2oYsYMIWR0DTu4pFmLi9VE8RY0KTJwj9JPf42ImDs8QzQkbL1BRwoRkBiXT3N2vYGGBMzxxa8zUiicuDyITsZLDZzrxkuuLrBZDVRtTVk7GHOMyLqlAWM8uyBC3Oj0SMI458QJQXEa8580zJJAgSf0yz2O79utwBbvfkkXkudTXCLU1PhCvbo/9uttpq4MCUahJh/Ajqv2ZTKfvIBe6hDdGe/chM1CsFuDqUhi/OHSdVJxReaOBMwqMfQanewFyFgSnc7HboEWvns+3W62KhYmfd6IVT71/pZ2VUuyihz+MZdm755Q8Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=211zhXJrH7xkFO51Vzk+yx3yVr7S5lQel+eMsYNdqYA=;
 b=CihtlQ0furpzIix8u7JGAl8p4hOm+AtnhZlhlf7IynWQtYcKQjC5SAtpNDPBxUnvPAjsr5OTUdK+tL4y3wzLGHpd91EwEDTFReOqBMJrdw6DFUY93tAzDYJOwqvyzdWb8Q1nlLpK9aYkFp0nHkAmP28zt7MeOqtL46eqcbI3V04=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32) by MWHPR10MB2032.namprd10.prod.outlook.com
 (2603:10b6:300:10b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 27 Jan
 2021 15:46:40 +0000
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba]) by MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba%6]) with mapi id 15.20.3742.015; Wed, 27 Jan 2021
 15:46:40 +0000
From: Mihai Carabas <mihai.carabas@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 2/4] hw/misc/pvpanic: add PCI interface support
Date: Wed, 27 Jan 2021 16:59:28 +0200
Message-Id: <1611759570-3645-3-git-send-email-mihai.carabas@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1611759570-3645-1-git-send-email-mihai.carabas@oracle.com>
References: <1611759570-3645-1-git-send-email-mihai.carabas@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.200.25]
X-ClientProxiedBy: MW4PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:303:dc::15) To MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mihai.localdomain (138.3.200.25) by
 MW4PR03CA0340.namprd03.prod.outlook.com (2603:10b6:303:dc::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 15:46:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3044afc-d3f7-4397-cfbc-08d8c2dabcc9
X-MS-TrafficTypeDiagnostic: MWHPR10MB2032:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB20325D7EB7848CC4C0D247F188BB9@MWHPR10MB2032.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 29lEIMXM6xsNZ+vwYf3kIn2CUDgNZ48OG6k2uve4ITQ7WoVxqIVDvmDEi1QVWLsSbRwmJM4ltU1MK2tua+lbjxJhb89EjVPqjiQN23T4lWCiwvRNfK2NcYUwVm+giq9kcyA1b3xWhrtmf7Nkvz+/gK9wRjeuJb/wROJu0n295Ku3KCfhZFONi6I1x3k+rG73tkAB7Zx4lfVA70fxRXq1A9lcvlXoNhJ6Yg+mDyzKV41jbH2Sk1m2cZ+8I4hYoMV6Of4RGGLbeLa8iS4DLUrm128Jc/bhmGBGgcA3boqsCHvZ1Ex1fJ1Xit9ikf2myvKLlKd5uGUAjnPQe8Zpn9ET9fsR9mCv5tqEr9MQsClH+csl29mQhylVlX899H+m8ku9gE70IBWTsfH75KARTxUwAtjfD/7XF1b4oBTn3wrJPSZIAeveuBQKStZKCgdpZaDe4vf6L3v5sCidQyCu6WD2JHugCdryEjdjizQK2aGSfu5VjVLoy1VgvGKxoctwpSbJ0PANDXZTNRyASbG0Agj8aQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2285.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(346002)(39860400002)(366004)(136003)(8676002)(316002)(52116002)(44832011)(6486002)(4326008)(956004)(86362001)(186003)(6916009)(26005)(6666004)(8936002)(6506007)(107886003)(2616005)(36756003)(16526019)(83380400001)(66556008)(66946007)(6512007)(478600001)(5660300002)(2906002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?GMuTLGz8VgHcmWSyYkh8Ix1BSdbDEb0ZrKl0hDZpaK8PNTvCASkfhTW7wNU5?=
 =?us-ascii?Q?FmXq9VGTBKMLOUYPULFfpCVnQMselG1djbgz0wR9/fq71vP2Xil/TkRw1wTy?=
 =?us-ascii?Q?ZZx9P8T6wdbja6n1eVBhjO2cMBff1cSNGEhEZXfAQ8JbQtykXCFnTXnGBQcq?=
 =?us-ascii?Q?2reS1+litnY1DdHkpHs09rruYBup29Y0gUlSZfFxLMIOoc2Dw/QRGy0dL3/k?=
 =?us-ascii?Q?ExnM/RVfX2tBXnoTcMtWDMTxGxSZaXNsQcVGeXkN4e+4i6/xKgScWE99s/s2?=
 =?us-ascii?Q?+pd9fLKfIYZrA9JP+W3l/u9yGzVeJNiDNLvfWj5tpsSNarN9OE93of9NTEfI?=
 =?us-ascii?Q?7W/Z00pUIGbqiq6p8LA6mnpm8UqmTkKtMhdGGXDYvtsEUT/KpMSUWnKrJMEY?=
 =?us-ascii?Q?urQxLls08lcHAtbbcaiJQB3kxOIIE45fqrMJMtJLufSc6EBr5iC6+gz7mauU?=
 =?us-ascii?Q?WSZt9YrU3wRCDq740RnjvmfPnnqS/jN9v13UlmneZQJVO60/gcdCNsW4SpUB?=
 =?us-ascii?Q?PZX9fyUGZU4RuiY4q1xEq7fYq+T4YWn9C5HhpsEAb5HecdQBRGIBhwau59rB?=
 =?us-ascii?Q?el4zf4TQH1YtPaiKzs1+lvt9MaASrDrShHlw2rLkCuK5hz/YdXGVLyiRWC82?=
 =?us-ascii?Q?RXXM5qIdgj3zz6kXQjZ2TyYm/6tRfARV+gviCfs3qdmzK12vL5pIUmzduNff?=
 =?us-ascii?Q?sQqcYsRgP2o+U77LueuILomk0Ns+s7Wtgm9w5A3reUjnclR0U7R9aWojfCf/?=
 =?us-ascii?Q?xISSkkn/aoxobNiFN76P/iLepclNvnZ5OWhgk8Zg5A7TKGNqI1EMq2a8Nb4p?=
 =?us-ascii?Q?vfXBaycxNG9H0RGSff6yxet7HzQrb8GTDlFPZscvD9LxKnrUOJWjV07vJmxJ?=
 =?us-ascii?Q?C6mFIZpmnrfRLHiu93KiD3IHw7HI90ocJbcAPS6MJE1QZ+u6ikEpEcNHd0Jo?=
 =?us-ascii?Q?KtbJbS3+X5f2Tj4BciUqSifk4qg1ByfNBrObi/GfWA97Y/ul/2LExYl5yJv2?=
 =?us-ascii?Q?E8Q0x198u3yApoiaLAHSqGEGebwuvg7Hit3+YAacrGqT51UD1kmpw9QZgU1o?=
 =?us-ascii?Q?u6u9313x?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3044afc-d3f7-4397-cfbc-08d8c2dabcc9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2285.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 15:46:40.0226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nggWtW3nWLr3Wy5Gameh3/bu8ApBn32D0fXmkJJRb1xL4MeDDHbNeGGjdcBeLBV2EPiNjB1vilU+/iJ+b2OVQFLDm4gPtv780NKrcd7bBcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB2032
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101270085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101270085
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=mihai.carabas@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mihai Carabas <mihai.carabas@oracle.com>, peter.maydell@linaro.org,
 yvugenfi@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add PCI interface support for PVPANIC device. Create a new file pvpanic-pci.c
where the PCI specific routines reside and update the build system with the new
files and config structure.

Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
---
 docs/specs/pci-ids.txt    |  1 +
 hw/misc/Kconfig           |  6 +++
 hw/misc/meson.build       |  1 +
 hw/misc/pvpanic-pci.c     | 94 +++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/pvpanic.h |  1 +
 include/hw/pci/pci.h      |  1 +
 6 files changed, 104 insertions(+)
 create mode 100644 hw/misc/pvpanic-pci.c

diff --git a/docs/specs/pci-ids.txt b/docs/specs/pci-ids.txt
index abbdbca..5e407a6 100644
--- a/docs/specs/pci-ids.txt
+++ b/docs/specs/pci-ids.txt
@@ -64,6 +64,7 @@ PCI devices (other than virtio):
 1b36:000d  PCI xhci usb host adapter
 1b36:000f  mdpy (mdev sample device), linux/samples/vfio-mdev/mdpy.c
 1b36:0010  PCIe NVMe device (-device nvme)
+1b36:0011  PCI PVPanic device (-device pvpanic-pci)
 
 All these devices are documented in docs/specs.
 
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 23bc978..19c216f 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -124,6 +124,12 @@ config IOTKIT_SYSINFO
 config PVPANIC_COMMON
     bool
 
+config PVPANIC_PCI
+    bool
+    default y if PCI_DEVICES
+    depends on PCI
+    select PVPANIC_COMMON
+
 config PVPANIC_ISA
     bool
     depends on ISA_BUS
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index edaaec2..6292839 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -100,6 +100,7 @@ softmmu_ss.add(when: 'CONFIG_ARMSSE_CPUID', if_true: files('armsse-cpuid.c'))
 softmmu_ss.add(when: 'CONFIG_ARMSSE_MHU', if_true: files('armsse-mhu.c'))
 
 softmmu_ss.add(when: 'CONFIG_PVPANIC_ISA', if_true: files('pvpanic-isa.c'))
+softmmu_ss.add(when: 'CONFIG_PVPANIC_PCI', if_true: files('pvpanic-pci.c'))
 softmmu_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_scu.c', 'aspeed_sdmc.c', 'aspeed_xdma.c'))
 softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))
diff --git a/hw/misc/pvpanic-pci.c b/hw/misc/pvpanic-pci.c
new file mode 100644
index 0000000..d629639
--- /dev/null
+++ b/hw/misc/pvpanic-pci.c
@@ -0,0 +1,94 @@
+/*
+ * QEMU simulated PCI pvpanic device.
+ *
+ * Copyright (C) 2020 Oracle
+ *
+ * Authors:
+ *     Mihai Carabas <mihai.carabas@oracle.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "sysemu/runstate.h"
+
+#include "hw/nvram/fw_cfg.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+#include "hw/misc/pvpanic.h"
+#include "qom/object.h"
+#include "hw/pci/pci.h"
+
+OBJECT_DECLARE_SIMPLE_TYPE(PVPanicPCIState, PVPANIC_PCI_DEVICE)
+
+/*
+ * PVPanicPCIState for PCI device
+ */
+typedef struct PVPanicPCIState {
+    PCIDevice dev;
+    PVPanicState pvpanic;
+} PVPanicPCIState;
+
+static const VMStateDescription vmstate_pvpanic_pci = {
+    .name = "pvpanic-pci",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_PCI_DEVICE(dev, PVPanicPCIState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void pvpanic_pci_realizefn(PCIDevice *dev, Error **errp)
+{
+    PVPanicPCIState *s = PVPANIC_PCI_DEVICE(dev);
+    PVPanicState *ps = &s->pvpanic;
+
+    pvpanic_setup_io(&s->pvpanic, DEVICE(s), 2);
+
+    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &ps->mr);
+}
+
+static Property pvpanic_pci_properties[] = {
+    DEFINE_PROP_UINT8("events", PVPanicPCIState, pvpanic.events, PVPANIC_PANICKED | PVPANIC_CRASHLOADED),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void pvpanic_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *pc = PCI_DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, pvpanic_pci_properties);
+
+    pc->realize = pvpanic_pci_realizefn;
+    pc->vendor_id = PCI_VENDOR_ID_REDHAT;
+    pc->device_id = PCI_DEVICE_ID_REDHAT_PVPANIC;
+    pc->revision = 1;
+    pc->class_id = PCI_CLASS_SYSTEM_OTHER;
+    dc->vmsd = &vmstate_pvpanic_pci;
+
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+}
+
+static TypeInfo pvpanic_pci_info = {
+    .name          = TYPE_PVPANIC_PCI_DEVICE,
+    .parent        = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(PVPanicPCIState),
+    .class_init    = pvpanic_pci_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { }
+    }
+};
+
+static void pvpanic_register_types(void)
+{
+    type_register_static(&pvpanic_pci_info);
+}
+
+type_init(pvpanic_register_types);
diff --git a/include/hw/misc/pvpanic.h b/include/hw/misc/pvpanic.h
index abc9dde..ca3c5bb 100644
--- a/include/hw/misc/pvpanic.h
+++ b/include/hw/misc/pvpanic.h
@@ -18,6 +18,7 @@
 #include "qom/object.h"
 
 #define TYPE_PVPANIC_ISA_DEVICE "pvpanic"
+#define TYPE_PVPANIC_PCI_DEVICE "pvpanic-pci"
 
 #define PVPANIC_IOPORT_PROP "ioport"
 
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 259f9c9..66db084 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -107,6 +107,7 @@ extern bool pci_available;
 #define PCI_DEVICE_ID_REDHAT_PCIE_BRIDGE 0x000e
 #define PCI_DEVICE_ID_REDHAT_MDPY        0x000f
 #define PCI_DEVICE_ID_REDHAT_NVME        0x0010
+#define PCI_DEVICE_ID_REDHAT_PVPANIC     0x0011
 #define PCI_DEVICE_ID_REDHAT_QXL         0x0100
 
 #define FMT_PCIBUS                      PRIx64
-- 
1.8.3.1


