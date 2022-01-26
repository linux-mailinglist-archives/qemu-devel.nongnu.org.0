Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929ED49CFFB
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:48:25 +0100 (CET)
Received: from localhost ([::1]:58772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nClT6-00081n-Lb
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:48:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nClAc-0006Zx-Ih
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:29:18 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:53664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nClAV-00037T-Q9
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:29:14 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20QFon7A028823; 
 Wed, 26 Jan 2022 16:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=yNjDVR8eJHn+lKawALImTWMalVxYrm0AX21gFo67b7c=;
 b=bFTW1vkAsOlCFlVSIrEPl/DmjyZ27TyPMCq/7hYUefh9pBaZIPed0dWyoF42gvJ82U3s
 SGmusgPmLxXXTJXADL77z7NPrxycTQnAR8m/TtyUna06stRgwHVKDvfmLrHtdsXisNBo
 Yfd/2sQv7F20xlDk34wnDDwxzPRogqm48BqDMe95weKSH1aFBZktJaBhquqifmNO6K2k
 hpPrICQ8WgmfYzRHUzVqS1BOStMp4MWSbnT4oa4rmbP66l1/mJyEPQsmR9Ay6YFO6wny
 K5NGNuhsmMLoyIQ/KyciOfI3rdOjQNguEmwarfNi1ETVNUEgXZ8CRc5M5JSAsYvtwTk/ dg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsxaaej24-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 16:29:04 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20QGAU33153273;
 Wed, 26 Jan 2022 16:29:03 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by userp3020.oracle.com with ESMTP id 3drbcreyd0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 16:29:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LStpELkmnAqX31wNdcPaz7Kt8TI7CMrEGLFiJMa74d35sLZ7qBf2ti66fNGhmwLBrvtRzwA2gN/Sw0uaX2l5FC2Qq23yLXddPsGJmNdaBOM0ZnKBNG9PRD4MydahBLJxK5/Hpm4oDf+NTNV7v6kMdL6xhA/eF/LYRoRH2ZscpsVxl7WT3Eqm83O3ME9smlBIsmMqLv6EQC9pVtXUgT61VyBQ0UlOPOUZOMzZFgFBc66LSWFwhyTfxor9MYyYHFplZ0S8/Svo5RcpJG4HGeaNlaPZEda4TmnmDOiOyTsX37/zMwhy2FGwfCfE/UgH0rl+V3Wpz6WS1Eoffnzvle8fpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNjDVR8eJHn+lKawALImTWMalVxYrm0AX21gFo67b7c=;
 b=THLdzoo2HnHW8KdGqF/xI/VUd8R9P/DTtZY9P8XI7WBcTGekA3Owk3xElBd2zavWdkxvM9ajObBSw9lAUoe0ytmNpd7Ywg+QYeNebaW1YRe1tTab1pHyDyXQg09vuquqwCflw3R6Jd/ca0wjHOzxCZf8AJW3CAuBD/eSt2Fmm5x3KK7rcDrV0ismyeTexxWn/rlioY4rcB2D1pXxSlJIVIQ+quF9CIYpQ97T++DWuHfjrbjyOOxou2OCJw2QmZbOuz250cNj9MskaXLre5joIBlD9gTAdgm/GmllmkAoxbpTC//HBvM5ylsfu9wupX6rxdO2Ng54AOsXm4OjNG+6iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNjDVR8eJHn+lKawALImTWMalVxYrm0AX21gFo67b7c=;
 b=a2qDDAUUsOPL3DZVUdl5n9sSElcpWm1CsPpyCbJfqacC2/q572d/+Av1i7GvpOWsWbWW5BjnI9wcqYpyIVy2uwOIfZ5e7uFwJFtHllelSXrMIg6nH6ZHmw6H3HwvcRwPgTF6QCYJPf9cGvEf9Mybpx9u7C1sGSSEhm9HyAAFcC0=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4450.namprd10.prod.outlook.com (2603:10b6:303:93::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 16:28:59 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4930.017; Wed, 26 Jan 2022
 16:28:59 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v14 08/10] ACPI ERST: qtest for ERST
Date: Wed, 26 Jan 2022 11:28:32 -0500
Message-Id: <1643214514-2839-9-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643214514-2839-1-git-send-email-eric.devolder@oracle.com>
References: <1643214514-2839-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0223.namprd04.prod.outlook.com
 (2603:10b6:806:127::18) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e96e2bf6-cf39-4387-781c-08d9e0e8f4bd
X-MS-TrafficTypeDiagnostic: CO1PR10MB4450:EE_
X-Microsoft-Antispam-PRVS: <CO1PR10MB4450081A1B0BC40478D9BF6497209@CO1PR10MB4450.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cX50Wwu3IArZTixkbj8NEqYrrKBJOjPoaEDO7UGjzXExE/xiFDNJ+n+TvPDazLTU9blhj3UD0xnvc/Ef4Eka87A0LQdkR73ERUzmCqNE99hxFOWUV6TwODrICMFDOeIKGYu7V3MuEbdWmJgsvwA1xeKMonL8qva37LbDni0SJnoLgvwkFBQCUxhcuDSkTmXBapqvNUmGeKl6LIhsUsb9SHgBQdldUdQHh/bl7h7JQ4yz50P2S3anelzsYsI6kXWh/eyvDwTEfJux8W5xGUQRKlyT3jXZkzlvCiYZwWsgBFXOmMReGNg4sk1hukpYeJLPi7xJkLE6fKWvar+Xnx/QZYjmNdoHgYRlq6t1Y0KKP7czaJ/XGIMCp3lnqk7XnlWQuMmTwaObiyyzPFA5k5INwxpcbJCCbhgretXS+4I9R9I+rtzqra1i9g+bbnoNDldVAftkS7aaMxZIpfzXzAtUu6KahoCvortCscwj8wYr59xjoIxqn4IYwHBGPGAh3R03mm4exzpYnQMaJOEM0J2qUTaB/JBwRKO6qEjI8rMZRsE4kGfZkyHi7Zaxybsc7kA4UWmzGE/AhlsOM+5OU/V2hkngyxavMIgNYJS+uKdCWqY58uBgGPQp5tbmhiUV3WMc3I8NyixYZp4FWFPrckmpi+DpFT+PhQe1tj7yQ+GiMm5WCirXP2BjwiW5AgtOR1D3aZlCr8DptmAdnx8j/2wa9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(83380400001)(6916009)(66556008)(66946007)(4326008)(8676002)(66476007)(8936002)(508600001)(86362001)(316002)(5660300002)(6512007)(107886003)(36756003)(38350700002)(38100700002)(186003)(26005)(2616005)(2906002)(6666004)(52116002)(6506007)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0iuYfbqM2NM5Uu1PPDvZwBD3T7bkiL4ZaO0Mo24sVx/fpVNz7RFd6YAhtHbV?=
 =?us-ascii?Q?BgQDt+5wC3BV+ueQ23+YHjECe0Cum/rR8ExRCS9tD2LpzPXgbk2g5g72xtZG?=
 =?us-ascii?Q?8EyXGOfkGslx55Nk/jBb7PPUg1QmEQK21YK9I4J4khaqbr5/pFQXyu4JZe8K?=
 =?us-ascii?Q?K9yxXZX6gw0nM9ise78QSUjUQxYKuw2rxiqUUpDxpEcOmSqHRMCB7PErNsMg?=
 =?us-ascii?Q?VQMr+ZxUAsDCLhfRz6MpqHpXbMhKOIsIYoprB1Go9Js/ILe7ItF7R6BzN9ub?=
 =?us-ascii?Q?IiYpcImGVv1uThqeIu1Msy4Zw8sSTqlUdXjckZvrVtuZIliMp4i0MsS+UI32?=
 =?us-ascii?Q?46bMxKbLk5dzmOAK3XiO2JiALK2AAQbns3Sf8HXPz1vKWk59BWq6SmxMKQ8C?=
 =?us-ascii?Q?0Uo93Mb0ja13/AzIbYdlMsvIU+RhjuHAT/gSUP3bBqxh4LE8NwfSzVTmEBcI?=
 =?us-ascii?Q?bYn4/did4yY6W+p95MTmK455GD/eLst3pwYA5RXe4kXIysBt5m88o8tA7MNh?=
 =?us-ascii?Q?yG5QIlo4K8UCLZ2xFEXq/sgyIGiP9KqtPK2IHcMM1iUqX7T+6CUDDpqMJpZt?=
 =?us-ascii?Q?hHKSPtNxOXwmXG8UXaLrIxHNoy30ELm3pOFJrV1yjnw7O6tECXqMees0eU/f?=
 =?us-ascii?Q?un3KIycRI9bOwopDhjgyhYNagyp4/DoW6Va4UrAl7HlQ4lVpV8hPuKxYE1C7?=
 =?us-ascii?Q?0wawZ8HuOI06p20lDCX6xJdg7+++7XS5GZmNF8DfqUwbMtNWYynhczcXaOw+?=
 =?us-ascii?Q?C8TIBpqus5w54g5sMa7+qfGutW8b7ZQPphpDLkOXictiVZgI7YQtESQnvw/W?=
 =?us-ascii?Q?AdBW6Lfmj47VMykQ39/3Rj11uDTuxwqHuM8M4JBSV4qfARfbRfOt+jmZov5r?=
 =?us-ascii?Q?rBsspzcn+/tRMY+GHMzN59c7rriaSxwW/1I+RGun5gMzgNyt0FoaXryLU8sE?=
 =?us-ascii?Q?1cwoMJgneIDxxd1uAanAs9K9NdOK8hK1OQbdlwpwH2+HCXxZSsWcYWXsPU28?=
 =?us-ascii?Q?9zFkJnDcUWu2ba4cuxvZQnu8/6CbUKiyj6qTQDRNavNuCjKInhV2nhHumtzN?=
 =?us-ascii?Q?7ANSHKCNUN6x9OFRFHUPMGTufqkKRb7fSLcB8ZRyaqf+6mYKyGfd7op+lRMl?=
 =?us-ascii?Q?Br2+P//av12UytMb3EsjhsjmHqjETVExq0OGq1hSlIjbOsFUnOuD8bCYNwDK?=
 =?us-ascii?Q?kW3vCdB2AKyJ2P8NvLRHCSw+sFvvRAml3gMElU3JCsnoxNPccqvZADVcPAEK?=
 =?us-ascii?Q?ADj6kmy/O0/dsnygGn6p+gX702D0b/BxPdWh1DBjUxIb5G7wga2sm1Nq6HI7?=
 =?us-ascii?Q?l7M1qv8EPv0q2hpEw2LAnjF4k0QsXIWR4JZ3SEJHirl6M2V9sdUQqfHKGlSD?=
 =?us-ascii?Q?c+vASzD4QKrW51Ie8l/zhSrN9e4d2d55t+nP5Xc9BCiFWoLtS85c7gf33YKO?=
 =?us-ascii?Q?EghMeOA0Gt18xpUHLMUAVQl+vz9lwnkyH8HXsSr0yWI5+P+SRO9l5GV5dFoM?=
 =?us-ascii?Q?3y0UbInqiLFwdBQcVmvDM/i8Bupob3qxQfgF/dvOd+6+G6HGQwT97DlSPphT?=
 =?us-ascii?Q?Zvo8y2unCqhou2ByWr0FpYEe0f64n70O0pV0xMLmbz4dTrei0ufR/kmd3089?=
 =?us-ascii?Q?6L9D/cJjdsABGXfvJARDUvEf3HIIWxEmdgRZ+oPL1CkzrX8sorrTzolj9PQn?=
 =?us-ascii?Q?BIAGFQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e96e2bf6-cf39-4387-781c-08d9e0e8f4bd
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:28:59.5085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4kbdIqBznUxj77Xho0nADos7isZ5Q2EN1VzGtY0gtAfdNDAhyInEyIyo5cEsV4ZpRsCOabVQHIDH4zNykMIXczYlKhk06tPPVoWdD4Km8kg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4450
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10239
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 malwarescore=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260102
X-Proofpoint-GUID: VK-o7RTwsduYOzAdxl6yYOt3TJShz14F
X-Proofpoint-ORIG-GUID: VK-o7RTwsduYOzAdxl6yYOt3TJShz14F
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change provides a qtest that locates and then does a simple
interrogation of the ERST feature within the guest.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/erst-test.c | 172 ++++++++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build |   2 +
 2 files changed, 174 insertions(+)
 create mode 100644 tests/qtest/erst-test.c

diff --git a/tests/qtest/erst-test.c b/tests/qtest/erst-test.c
new file mode 100644
index 0000000..f9ad3c9
--- /dev/null
+++ b/tests/qtest/erst-test.c
@@ -0,0 +1,172 @@
+/*
+ * QTest testcase for acpi-erst
+ *
+ * Copyright (c) 2021 Oracle
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include <glib/gstdio.h>
+#include "libqos/libqos-pc.h"
+#include "libqos/libqtest.h"
+#include "qemu-common.h"
+
+#include "hw/pci/pci.h"
+
+static void save_fn(QPCIDevice *dev, int devfn, void *data)
+{
+    QPCIDevice **pdev = (QPCIDevice **) data;
+
+    *pdev = dev;
+}
+
+static QPCIDevice *get_erst_device(QPCIBus *pcibus)
+{
+    QPCIDevice *dev;
+
+    dev = NULL;
+    qpci_device_foreach(pcibus,
+        PCI_VENDOR_ID_REDHAT,
+        PCI_DEVICE_ID_REDHAT_ACPI_ERST,
+        save_fn, &dev);
+    g_assert(dev != NULL);
+
+    return dev;
+}
+
+typedef struct _ERSTState {
+    QOSState *qs;
+    QPCIBar reg_bar, mem_bar;
+    uint64_t reg_barsize, mem_barsize;
+    QPCIDevice *dev;
+} ERSTState;
+
+#define ACTION 0
+#define VALUE 8
+
+static const char *reg2str(unsigned reg)
+{
+    switch (reg) {
+    case 0:
+        return "ACTION";
+    case 8:
+        return "VALUE";
+    default:
+        return NULL;
+    }
+}
+
+static inline uint32_t in_reg32(ERSTState *s, unsigned reg)
+{
+    const char *name = reg2str(reg);
+    uint32_t res;
+
+    res = qpci_io_readl(s->dev, s->reg_bar, reg);
+    g_test_message("*%s -> %08x", name, res);
+
+    return res;
+}
+
+static inline uint64_t in_reg64(ERSTState *s, unsigned reg)
+{
+    const char *name = reg2str(reg);
+    uint64_t res;
+
+    res = qpci_io_readq(s->dev, s->reg_bar, reg);
+    g_test_message("*%s -> %016llx", name, (unsigned long long)res);
+
+    return res;
+}
+
+static inline void out_reg32(ERSTState *s, unsigned reg, uint32_t v)
+{
+    const char *name = reg2str(reg);
+
+    g_test_message("%08x -> *%s", v, name);
+    qpci_io_writel(s->dev, s->reg_bar, reg, v);
+}
+
+static inline void out_reg64(ERSTState *s, unsigned reg, uint64_t v)
+{
+    const char *name = reg2str(reg);
+
+    g_test_message("%016llx -> *%s", (unsigned long long)v, name);
+    qpci_io_writeq(s->dev, s->reg_bar, reg, v);
+}
+
+static void cleanup_vm(ERSTState *s)
+{
+    g_free(s->dev);
+    qtest_shutdown(s->qs);
+}
+
+static void setup_vm_cmd(ERSTState *s, const char *cmd)
+{
+    const char *arch = qtest_get_arch();
+
+    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+        s->qs = qtest_pc_boot(cmd);
+    } else {
+        g_printerr("erst-test tests are only available on x86\n");
+        exit(EXIT_FAILURE);
+    }
+    s->dev = get_erst_device(s->qs->pcibus);
+
+    s->reg_bar = qpci_iomap(s->dev, 0, &s->reg_barsize);
+    g_assert_cmpuint(s->reg_barsize, ==, 16);
+
+    s->mem_bar = qpci_iomap(s->dev, 1, &s->mem_barsize);
+    g_assert_cmpuint(s->mem_barsize, ==, 0x2000);
+
+    qpci_device_enable(s->dev);
+}
+
+static void test_acpi_erst_basic(void)
+{
+    ERSTState state;
+    uint64_t log_address_range;
+    uint64_t log_address_length;
+    uint32_t log_address_attr;
+
+    setup_vm_cmd(&state,
+        "-object memory-backend-file,"
+            "mem-path=acpi-erst.XXXXXX,"
+            "size=64K,"
+            "share=on,"
+            "id=nvram "
+        "-device acpi-erst,"
+            "memdev=nvram");
+
+    out_reg32(&state, ACTION, 0xD);
+    log_address_range = in_reg64(&state, VALUE);
+    out_reg32(&state, ACTION, 0xE);
+    log_address_length = in_reg64(&state, VALUE);
+    out_reg32(&state, ACTION, 0xF);
+    log_address_attr = in_reg32(&state, VALUE);
+
+    /* Check log_address_range is not 0, ~0 or base */
+    g_assert_cmpuint(log_address_range, !=,  0ULL);
+    g_assert_cmpuint(log_address_range, !=, ~0ULL);
+    g_assert_cmpuint(log_address_range, !=, state.reg_bar.addr);
+    g_assert_cmpuint(log_address_range, ==, state.mem_bar.addr);
+
+    /* Check log_address_length is bar1_size */
+    g_assert_cmpuint(log_address_length, ==, state.mem_barsize);
+
+    /* Check log_address_attr is 0 */
+    g_assert_cmpuint(log_address_attr, ==, 0);
+
+    cleanup_vm(&state);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    g_test_init(&argc, &argv, NULL);
+    qtest_add_func("/acpi-erst/basic", test_acpi_erst_basic);
+    ret = g_test_run();
+    return ret;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 26937de..581d217 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -68,6 +68,7 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
   (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
+  (config_all_devices.has_key('CONFIG_ACPI_ERST') ? ['erst-test'] : []) +                        \
   (config_all_devices.has_key('CONFIG_VIRTIO_NET') and                                      \
    config_all_devices.has_key('CONFIG_Q35') and                                             \
    config_all_devices.has_key('CONFIG_VIRTIO_PCI') and                                      \
@@ -278,6 +279,7 @@ qtests = {
   'bios-tables-test': [io, 'boot-sector.c', 'acpi-utils.c', 'tpm-emu.c'],
   'cdrom-test': files('boot-sector.c'),
   'dbus-vmstate-test': files('migration-helpers.c') + dbus_vmstate1,
+  'erst-test': files('erst-test.c'),
   'ivshmem-test': [rt, '../../contrib/ivshmem-server/ivshmem-server.c'],
   'migration-test': files('migration-helpers.c'),
   'pxe-test': files('boot-sector.c'),
-- 
1.8.3.1


