Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AD52FD102
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 14:04:33 +0100 (CET)
Received: from localhost ([::1]:35346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2DA0-0000uO-3t
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 08:04:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l2D4p-00067F-CF
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:59:11 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:43310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l2D4k-0002Fg-Qf
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:59:11 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KCdW3a145790;
 Wed, 20 Jan 2021 12:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=UOmdQt/gps3pRvRVGUAzIwXKmBRuK2tNgpVkV/i4Hp8=;
 b=I3LValIhQYERfY01SoMmCIpoJBGKNY5RA4HQkjTw/FXEJxYSbarPik0Zbhnzo7bG3Nzu
 ihPargFleQlm+MEt2C6VbkRxgzecneUDtSX0vFbv3r91i1bSDL1Jl6Ba9Z/Qve+26pUY
 afu3A7zHvm6ywJo8lzhhnn9gX22U3Doe96x2V2aMxeoRLbkFloLdXrab0U9BRAq5qQNG
 pUrRj7cp/NK32oqfgcePokuh2jR7RMzbKCm/Harz/SQL+kf5ypgDvccgkM0pUDGCorCB
 EiZ4224ysMKSvjt5QHj9k0p94EQ/EFb+YtCWjVWiSTVPKPjnGC0Is/ePfkV21VFxKTMd Jg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 3668qaab03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 12:59:01 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KCZoJm099532;
 Wed, 20 Jan 2021 12:59:00 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
 by aserp3020.oracle.com with ESMTP id 3668rdvprk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 12:59:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSBwxzF/QhFRnVLkyXhwXWSQRLw5l4al3veyGn/3hXY7DI4MUcQfY3iJB6BKEfBTnvMovzo00W0eDiKpihmiZUkkYY83Q0Wq7Ja2AvLUA6AOwFn3qw0iLbINjpB0KTV5FY8KgGeqDXXi2CysZrUqAmmhmdJrvDASzf9xXK5FvjC9KlzFuhxvWdU67GxuB9ReJ9usbeWcYzkezl5kvEY3UgSEMaLRFGDa++eIuAAFDawnSgM1IYI3V8ZvCYx4cZC1DhX9c2lW7WUQDjrgk/NxHLiLQ9yOEKJOdnU/bG6+31rSMsfH+bS4t5jRLr82brghW6lhBgTQgfsm3ouNMq8MEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOmdQt/gps3pRvRVGUAzIwXKmBRuK2tNgpVkV/i4Hp8=;
 b=hB7F+OLF3ceIzsDyAmq1Vjlbofrl/fop/fENd9qRnQDaZGUtw2RMfNZ9PCfjxhgZ6DfVT0S9HN2UJIitS3mEC7N/4bROOENkEcKeAzotOQ1rY6DmQt8wy41w+MEv+MV59ec3wxk/giwKv57BlCm2aWckO5up44GMTjSPKL1yPaUbiz7ddSrqvLLz3Uvv5ENdZFeMV8jJ/9yMIridI2b2FrnRMCB5rI6NXRa4mTfzX0jtBcSuFufOczY3Rpgpc28tp3ed06J4ngTsiBp96GhyJMk43Cd6LsZa50yGQbsJqk5gw/RrY7nOUlZSHSy3BsIXok7KsN/NP56zlLRiHKb6EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOmdQt/gps3pRvRVGUAzIwXKmBRuK2tNgpVkV/i4Hp8=;
 b=Odsacyq0qVe9OFAQHbAqZhkWZO6arU5T6VE+70FmBLU3/IZN5j0FVOFm4HXNSnvi/o1M1y51V+0V6/vh5j4nHRFzEpEDcFjT0Ye6VsQf+nFpijHansqHhdKEXQiZCe6DZbGcNNYqTvSZXQJrz3d8JEx+yGJvNAaif6nyKBYGVHc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32) by CO1PR10MB4739.namprd10.prod.outlook.com
 (2603:10b6:303:96::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 20 Jan
 2021 12:58:58 +0000
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba]) by MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba%6]) with mapi id 15.20.3742.014; Wed, 20 Jan 2021
 12:58:58 +0000
From: Mihai Carabas <mihai.carabas@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/4] hw/misc/pvpanic: add PCI interface support
Date: Wed, 20 Jan 2021 14:11:51 +0200
Message-Id: <1611144713-21433-3-git-send-email-mihai.carabas@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1611144713-21433-1-git-send-email-mihai.carabas@oracle.com>
References: <1611144713-21433-1-git-send-email-mihai.carabas@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.200.25]
X-ClientProxiedBy: SA9PR10CA0026.namprd10.prod.outlook.com
 (2603:10b6:806:a7::31) To MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mihai.localdomain (138.3.200.25) by
 SA9PR10CA0026.namprd10.prod.outlook.com (2603:10b6:806:a7::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Wed, 20 Jan 2021 12:58:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b88f8da-ab04-417e-ce10-08d8bd432696
X-MS-TrafficTypeDiagnostic: CO1PR10MB4739:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB47397F25D7F3DDB5A1E4A3C388A29@CO1PR10MB4739.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rFt3ppYk+K2lK42n9OKqIdJcE4+Dzw53DWSiaI1TLs9LBxxkuVXQJOFCuSDivDzaDvpFNHe03nUfETmM7yICCoNWYLritcVv2OgWBAWuDoU7xvI+Mva2GNr3gUPiHHO4Vm0RZ6s2kaGYAHXSVoaouj+jdF2TYB9/JU2C4sOKiVZry2pONwBDfNpZ6r09NagQtDsMncbBi7S89WEp54BoOl9rUpyUloj83VqJEsgY8oaQhMZW7N209Oam6+pi4dpV702+3SfBO+Qd6wjHmA0Rax7XutjQn+/Wn7SaQIDazpwtMDMWgv1rCYrio1odtd2DIDE8ldgEIwrERmbzB/PezYvCVylnYI8CkYd7hD1R+8CWE6BgyCCnBjydN2IvXqcjUg3s6oFsdVSecHz9W1Dyqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2285.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(376002)(136003)(39860400002)(396003)(6916009)(6666004)(52116002)(4326008)(2906002)(66946007)(508600001)(66556008)(66476007)(5660300002)(36756003)(2616005)(86362001)(956004)(8936002)(316002)(6512007)(44832011)(107886003)(8676002)(6506007)(6486002)(83380400001)(186003)(26005)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?nm/aE3apgXKxlV1hhO6hjlVPUI5ek6CtF3W4yThzljszTnEC2UMJ/lZX8lW8?=
 =?us-ascii?Q?oPoKVHaUOOHrBN6iC2oUHzemYfdbVGpCPaC6Kr0ee5SWOTnPErDrNmDGKEtE?=
 =?us-ascii?Q?DlWncvcAmH7La0KsJCAmjRVM/kWb3K4YaMiOsKumzBSGWV85XQkDK9BEjhWV?=
 =?us-ascii?Q?qmMW9nSTG0u7PyD0j/D/8mkDPOEQQMH1rxLFRKe/tuaOJJLHbKTX+9RkYR5N?=
 =?us-ascii?Q?+iWvD1rmXupZJH1BItf+Wy3wreAhIoJUwizhuI0dFaoTa7tC/MzhU95eFhDo?=
 =?us-ascii?Q?jXZ9QPFNgz+A736R4HDd96cob7cqTC5l70xGiXVFSCZ2TAvk2UN8B1/iZIch?=
 =?us-ascii?Q?61I5oQWka5wHqTH1tjtLoPDgiXrVy+68QvVYmy4mC84LXAjA0RNnICf7vl6t?=
 =?us-ascii?Q?17XtUzQAd2DQ8GQ3O3LCRf5Q+tPtAJ10AwTqHYgfoqC/3vSRLFk1Avos0ICJ?=
 =?us-ascii?Q?1/npoc0tarNMelPvcBJaURIoUT3xanIf539j6D19yauuxWyWJXRxfvo5o4tp?=
 =?us-ascii?Q?YZoQTKzKMqhrfk8m8tBvlekak84WZz8N6U0Sg8rw9M+GzelKQSQk5AEsf6dU?=
 =?us-ascii?Q?zBJuc/2Bx0exutwNDQyZOGn8cmEeTrSOvkLfiKo1jVv+C19F+sGUR81cxB+m?=
 =?us-ascii?Q?eU4xlLBeWwwHW/zSyGl//Hm0qSJtqG1mR4sDyylA6bTA1b0QVrXhnQ3HBSUK?=
 =?us-ascii?Q?YJZr/REtTKj9id66uLNUHg6bWNnBmM9spe8bf8zOOL9MyfZybkWhAhCmtYQD?=
 =?us-ascii?Q?nFVVstSUDb0jgzRbS598OY3ofTFrbWtnaPQ9JKEp4Pf0mhRw7SFmCIQoCJkb?=
 =?us-ascii?Q?JYOPww1Ez1ONBxrsWFEtJGv+9dxY5jIkrGWSPVGAU022rxO3sl6h0Nq7TvPE?=
 =?us-ascii?Q?Ns2nr089JECzO3rSnNw7cGLvD9SYL/jostg1y9kl2Omh9/g0AaQjYvYqUuRs?=
 =?us-ascii?Q?K9uE5c7CTQu6/9q1S/xGuwLp7HYQF6npQUmAwgU6T/VaXmW0AfEe7yEsc1AJ?=
 =?us-ascii?Q?qrOL?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b88f8da-ab04-417e-ce10-08d8bd432696
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2285.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 12:58:58.2280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s11Q2MPoecFS5+bgMbroOVS7Og2XczdxMWKTmTwBHwA0SnSvzJEQ07WSC6ifgVwgB9Bg+CGxztbiLdlSfcuXiq2ivce2ET9qcjjnOnCooCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4739
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200074
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200074
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=mihai.carabas@oracle.com; helo=userp2130.oracle.com
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
---
 docs/specs/pci-ids.txt    |  1 +
 hw/misc/Kconfig           |  6 +++
 hw/misc/meson.build       |  1 +
 hw/misc/pvpanic-pci.c     | 96 +++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/pvpanic.h |  1 +
 include/hw/pci/pci.h      |  1 +
 6 files changed, 106 insertions(+)
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
index 0000000..ba288c1
--- /dev/null
+++ b/hw/misc/pvpanic-pci.c
@@ -0,0 +1,96 @@
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
+    pc->subsystem_vendor_id = PCI_VENDOR_ID_REDHAT;
+    pc->subsystem_id = PCI_DEVICE_ID_REDHAT_PVPANIC;
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


