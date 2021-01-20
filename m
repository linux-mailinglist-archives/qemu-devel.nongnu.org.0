Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB502FCF13
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 12:21:32 +0100 (CET)
Received: from localhost ([::1]:55800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2BYJ-0002L5-6X
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 06:21:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l2BW4-0001UI-CE
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 06:19:12 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:56330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l2BW1-0001c7-Fh
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 06:19:12 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KBEf6M154161;
 Wed, 20 Jan 2021 11:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=nMuJGYplbqwl3yID8sz4vM50zHbeOjhk02m5j6liDZA=;
 b=uw+sGH3RZYz3xJs4E18LfTmEuAmylvywOFuumpP2bAcuTJkMnJHWLCPOeULPl5vrnuXi
 7c0iKjcvLPDeSppK2AuEWTQjFurarvbcelxOVem2jhg7QbF1kDoE85SfVt1aBcoIkIyG
 2xt3epdLLrFYx4S+ovkYgucDj5UzBAiXcau65/bGo0jdoPKFG6UnTkpDKdfwfCBUWu/h
 y69XLxSgRxg1E0mNOemrMX/FcXDKRr+o1pMtt8eRPap6SqLlzMvCFGzvNy4zkgIrlgPy
 Eq6N7rqHFjqq3QiBpvKPzZ9uXhzgbORi67Q923eMLE7KJwksYAiqcd6fF5Y7VxPmEKAf MA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 3668qr9ype-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 11:19:04 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KBEl7B010918;
 Wed, 20 Jan 2021 11:19:03 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by userp3020.oracle.com with ESMTP id 3668qw0cqg-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 11:19:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBGtj9P9sHx/MT8naT9waXOsZJiv+zDKwXrnoQyv/s52avCUA+9Eoxsei77n+u9nGz4XMlWETVRgh9ayXWMSgOpPnF1CLS6P+i7VBHg5/TSFwU+VyNKmvVJkFNRTATqk6/Z9KMyZXkYQc8XGNAMh+5QfHgd05IvgAmONG4F1Ud7PAQOVaRCrLUY/0IKMfUXvQeN0dieNde3k4lYOw9RxCEqCJovXkeC+II+o5U2bXZwsl9VEisuTTXbJE4V4/tUGI4NeQ4CpXAfS6h3QuK52TErChDezHl4rQ7cwf77f8Wy4HxediqS+jgUyhMe6PGVv29GldBQSzgTSsnYWptniog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMuJGYplbqwl3yID8sz4vM50zHbeOjhk02m5j6liDZA=;
 b=DqOtS22/4VEXMWFpkx02Q9osz3WOMxrqzvAJUC3e09U4/yW1K88Or96aLaLzGMoUT7Do76fQWKfODw2PZJmh8r4d5Elyy34/UxUiUDduYvrg/g1s7PH3D7xbjXVGsvqmm3jlepwnzCXtuYDePiqcNoJDyCbphtJH2q70NWhpakBWtUDOa1Jmb+2fBv1LTHoyKv2Yu/GHb/+d0EtqCI+u0rb5dIXfBwqGXHkG1vQmVlZNrZeg1WfOfJNPTysyUKmSgOVtRnRcnJ3IcJ9YwM1aPoGHRsk9xJBtdwDn/XTRFJ1gRgArfwbhHZUadrrYPV17ay7xqRlSFweiFbxFkr9oAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMuJGYplbqwl3yID8sz4vM50zHbeOjhk02m5j6liDZA=;
 b=q1JI6ntR/zwAjsbC1SgT72C91jELPNqtgEPQmPAsYvH4x9MYe5zyyGWmsvDFYI7RN6BIBpgoifQQc4ju5yzv0Qj4RN0xmN/d3v3o6Yjv91V/MSy+KHd47trNeMotOG+QUfvGDtEVJh9c/RkJ3GirxYQaOp54uLObhtRUE4sFTmI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32) by MWHPR10MB1342.namprd10.prod.outlook.com
 (2603:10b6:300:1f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 20 Jan
 2021 11:19:02 +0000
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba]) by MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba%6]) with mapi id 15.20.3742.014; Wed, 20 Jan 2021
 11:19:02 +0000
From: Mihai Carabas <mihai.carabas@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/4] hw/misc/pvpanic: add PCI interface support
Date: Wed, 20 Jan 2021 12:31:55 +0200
Message-Id: <1611138717-1672-3-git-send-email-mihai.carabas@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1611138717-1672-1-git-send-email-mihai.carabas@oracle.com>
References: <1611138717-1672-1-git-send-email-mihai.carabas@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.200.25]
X-ClientProxiedBy: SN6PR16CA0062.namprd16.prod.outlook.com
 (2603:10b6:805:ca::39) To MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mihai.localdomain (138.3.200.25) by
 SN6PR16CA0062.namprd16.prod.outlook.com (2603:10b6:805:ca::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Wed, 20 Jan 2021 11:19:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea081683-2988-4633-2ea4-08d8bd353093
X-MS-TrafficTypeDiagnostic: MWHPR10MB1342:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1342358F6419BDB1B90BF97688A29@MWHPR10MB1342.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yj+oAv//gJsa8yU+Aozx5DfN5wTDA1u7rM5YPX15urlkM/JbqJQ6sED31ia+E8tXZhR05rehXyxGkLqBhCTbinWEVKileMkYNd45xIzGpYAy0uSbos1XPay0q+mcce89rJ62oPCaz5toNO91oZBh5+ZvCm1LdOCaFHI4OQW2Y4Cc9baebSbjxHg1xdTjSD6CH9u0jKbbqo3JbS/9WqidtVZByHum1ZRLMI4j2vEQ3byOmaGKSoi5ANdlAakOM+PnNu1USMEV3pQb1Ew75rAE3OgqctEgAJbAYpdXLPLWzD29/IwNstZsPt8ra4npHucMWzXUPQTMj8VpDTvpaTgg1bsPwBGwglYbsTwO4OT02SKPiZmmmbMONmtqRKk3L0YDWfRMbcwM+XBmwAlKB+XHfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2285.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(396003)(366004)(136003)(376002)(6486002)(16526019)(6666004)(8676002)(36756003)(2906002)(86362001)(83380400001)(107886003)(6506007)(6916009)(316002)(8936002)(5660300002)(956004)(52116002)(66946007)(44832011)(478600001)(2616005)(6512007)(66556008)(4326008)(186003)(66476007)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4ka+5ns4/mWvZZ2eOSQV16WuF+IXBg9H9HAIW3+Gqo+KMO04HMC3thkkQMv8?=
 =?us-ascii?Q?9KyR1KUgP1f7jzh6KCLgyayzcewzvTGlm1FUmhUlwUP0q5umeYtaohtA4AyF?=
 =?us-ascii?Q?ocRqaDfPU6H47HH6xFGe9P1rneAipE+JVRhXljf5CX/5DUsKTrzSdxUBUy9h?=
 =?us-ascii?Q?bK0lw2Fgbmq6hj3jb/5433fLHF9qhEm0G10p/pNqB9s1YG0/tcGbx66Net6c?=
 =?us-ascii?Q?VDFWbHOCsv8vfo0QVjy21z7Iw/Rd141pLt+Oh5RswTYOScij9+v9evNaDBm7?=
 =?us-ascii?Q?bYbUtEttzLKVal4b0qaNNfLRf5tKS9UVZby2ucSSdEPhCsAn8dy4wxZAoiew?=
 =?us-ascii?Q?lTY2MYeVxmKEIjDAv328Fnc6Wz8+0Tk0jTclyO60B75k7OYx3QJML7q4ppF4?=
 =?us-ascii?Q?1tnf4jC+2vAove7ZQoEPYzCd9uTCeCozqyGpOTsGtp2jL5Bs95A8ePNbwmhG?=
 =?us-ascii?Q?bNHCrDy/XvOuGwZ8yt2f4tbVQo3C3GHwo0Gw4ywyjk0H1tXm6w4kHkbnY/+Z?=
 =?us-ascii?Q?WWBfz188oSFbGFom/eL58o8uoEIOpYh80RJQydxXtGQEqtbHbFvXkUmfWccd?=
 =?us-ascii?Q?xHy9cIORfFzKzWcsA3pephvwx+bzuxMZ6yklUfGr0sgYPJmqjk7Tu5Yo+m7S?=
 =?us-ascii?Q?kXIzXidwCtWVknNWv8l2Li0UBPoTErG36a4lRVn2HowwpTBgW7hnX/MN6k3+?=
 =?us-ascii?Q?UTEek7EIRVxqayTNTN/o3fIU8H3gsE793SLhBP7+1JzObh0+z1mJ+lA3920I?=
 =?us-ascii?Q?LR+2FgvXmsl9Pr+JJwb7Ulp0EOQoMsH7DdbVEVNj/uydVr/LtL9+Y1VDH+wJ?=
 =?us-ascii?Q?ZWH+UWZGT8XxcJmZLdSohDLVLajpWy55MbPl4qgzhkvjPBPs0mbrgbntHILJ?=
 =?us-ascii?Q?kSpa9iSr5tgn2HeHl24K7zfO69qtZNd885t0zC9XjpUP1lVJk35N7f3/HPDW?=
 =?us-ascii?Q?UXD00x3ccwhbfk4hJFN1PZvefcigqfyu2zaa+Ob6tDg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea081683-2988-4633-2ea4-08d8bd353093
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2285.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 11:19:01.9992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P3P2b5g1KxNiQNFgPDHsEVxkstEPfwv+Myof9VubgK4Tg18eev9XefLCOnP8ncnQGf+/lOlnMn6a4lJjD6vJX++c0j1YELnVRINYj9rhGuw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1342
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200066
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101200066
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=mihai.carabas@oracle.com; helo=aserp2130.oracle.com
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
 kraxel@redhat.com
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


