Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 940D14986F0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 18:34:27 +0100 (CET)
Received: from localhost ([::1]:33026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC3EY-0001R7-Ep
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 12:34:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nC2yG-0005YU-Ir
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:17:36 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:35928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nC2yE-0007le-C8
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:17:36 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OG2mlw001332; 
 Mon, 24 Jan 2022 17:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=yNjDVR8eJHn+lKawALImTWMalVxYrm0AX21gFo67b7c=;
 b=K4Fq5Uq7O6cE0VxxkojLfneNXlS0IRAxDLugINl+fa89pIdywKFBuoD9LiWyqeNGVIoo
 XF5tXYfeqOsSWXNmtk8WRvXFTm79qxJcaK5QZS25JPL6osvtmaJvSn1xsBu/PlhbAI/4
 ELZbC+joJfkfgtW+ikV/H3NUdtPituBRhTYgEJlfn5D6XdgAqE0tR/V5uGgfix0DnZSr
 vsbnzG5G/ebL9/kaKTN7lRYwiktnP4you6EWV4mqwybVbrfDZnct9rIem6Xc8TbZF0IV
 L71/Lgt/szJy3n7EVIg+betsb8kWP7QAu/VyHZYEzAoFL3Wl2rUuKvf2C1Gc3+KFooxl Aw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsy9s0am5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 17:17:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20OHAiYs051685;
 Mon, 24 Jan 2022 17:17:31 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by aserp3020.oracle.com with ESMTP id 3dr9r4djpd-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 17:17:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LSV6QAnicu3bESTfksu1BgaYamo6NCxrtMttY5ip3cCNMOF0SNQDmxkgGRZYj4C5CGO0I3LbyXCjvQ88XJPYIPkJY0WC2qROaMO7Ja44/fp69YJmV14aSlCnoa2K6LmAFRTI9M9mZ509+NZyYWQoN5UOWi87u3HB+18hV5YC8ITegay+myE8EIuoT38HFQYLxjvrSy05M09Kotwyq2+179e43zVaUq8kK5X1u7ryRtbGUdSJaAZ2BB8qZQL3ksixDMLZv+/sQbppEJiIwpf+mAAt4xBcUxaaenuz77VL691/7ddzuDmoeWN3j2yg+qgJ5zy4FyEkjcFaOU/emzk9aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNjDVR8eJHn+lKawALImTWMalVxYrm0AX21gFo67b7c=;
 b=jDolSizvXDuviuFhRIu9WpSC4EEfpur++nFMRuutnpntqM8aH2PmzGGY2vMw4RmDhB5P7jT+Zz1HzsgHFvUCEPKtEzARGTjuFu8ORLhcBVek08tIb8zOgDTH7fgL6MxsX6d2WdglI0IAZhqmgCD44qieKe9Q+em8dbkbcyxWFxlJSjF+WvT8E30zjLw5OXadYrjg8tQhkYfy/lM5HTiEXCTOjFXpNyvGf/0kZuf0dGMI9oKF88ucco8oV/gDk/hexUWHGFFXsllelgD7Y+tPVAA4U0YG/oYOImAwU1SF889Ai2AuwJBPkmfnBWQ4Wsuh96Zq1uqZrovGTyOmc0+FvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNjDVR8eJHn+lKawALImTWMalVxYrm0AX21gFo67b7c=;
 b=QFp3JSbw4cjbmHFM3tVwXXxmTLKI3KqDVaV895QB0k3A43nAmm6dtCrMw0Tifg/u2LwNBS44iwTfJM69dWgLRnit/ZAka6gV+Ml6VGUo6NdejcZXPDYKexAlAxkg7iTxg8UXoDy0lVqR7Bq9wGLTqJcjD8nYWNIx1nWITs8/+40=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DM5PR1001MB2265.namprd10.prod.outlook.com (2603:10b6:4:30::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Mon, 24 Jan
 2022 17:17:28 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 17:17:28 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 08/10] ACPI ERST: qtest for ERST
Date: Mon, 24 Jan 2022 12:16:59 -0500
Message-Id: <1643044621-15892-9-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643044621-15892-1-git-send-email-eric.devolder@oracle.com>
References: <1643044621-15892-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0055.namprd04.prod.outlook.com
 (2603:10b6:806:120::30) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ad0b0d5-9fa0-4fac-42a6-08d9df5d658a
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2265:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB2265B520AB81003451B0EDF8975E9@DM5PR1001MB2265.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0vLVwqXb6Eet3pAYjviM1b0mUt8D5ky9LJILedDOv9/6TxTFnFAUYh1pz1dcNdgmTl4VQamCO6gbjxhFddBIZhjV4km88Mm2FaT2WzmR/15L4ftAvkJRnR2wlaumk8raPkWyZI3k3r9197oKNArLKnUe3/rsPiPjgnD6mezFVeH2qjWoDiL9N07uBXZQtLmCbsSLErey3kpmMjROH8Mdp33ueERSD83hhv1LwlXs5M63ciAvtGairH7wXl7G4p653fd8tAVb/PXFn8K9xc0viRFsNalzGk6j3psy6kvRutjU7kqozKqiOtsswAQMd2P/Hu9e6L9lrPiMwvL1YMp+MWnLmyp7vzcv2VzufmEmJx8P77czUhFSYrXox/ddg9s8aVJxj8IEIgKBtBdF2gzdIVnCbAkd72XXoImbiaiUHS30KQ+oideHCnwBBCylgJm/xDod5PayYXzdfnkSgHVQiHIPo7o4D0+SNhs4OM+KHXIqAVkfNff3TVQBBJBxLVyRg2cl2cM873WK06vkH4MBADgoiJfKG/h30IM8MwIMLoG7YiGmgIZ0zpPYxncVP8csUkUzeRwGXsB3DprBuIbX/vdwrgfNneVlmhLEvwPjAe7UMSGrXFGgXJpO91XNjk0bAYWj4486E9Y5jcSLWrYchgOKU7k7XUg6Djl3tDm8wkHKy8YhutnbFcZfgQ8UHHJSOEGJgSosgBqXK6I0FnnMFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(5660300002)(508600001)(83380400001)(6486002)(316002)(6916009)(66476007)(186003)(2906002)(38350700002)(38100700002)(36756003)(52116002)(4326008)(66946007)(6666004)(8936002)(6506007)(8676002)(26005)(2616005)(107886003)(86362001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lb9tUPEi6kaJToGZk/429qOBJExodoSpS5J6E3hfbQ2q/Dyk74TvnijzDnOR?=
 =?us-ascii?Q?WJLTXq85v2QueMC0wAVsW3Ztk29wPEjdCA/naTPX9HWVYP4bN7UhA5yQv8nX?=
 =?us-ascii?Q?gCKCzc3mrVGu6GXVSY3dEzaRl+fNHvTjp6dEvQKBMUdpdASpRKSX+Iy+bG7W?=
 =?us-ascii?Q?il3qncQDlVlq8xn7tfKEhMOpkEzMOBpz0FtY9Uegrdowo1EYy1W+bEy9Kh/4?=
 =?us-ascii?Q?U7ifSXhD7vkjOlixXMhyGmCJzcX+V67rMFrXllrN09mEin4jDBu3mV9Ht0+P?=
 =?us-ascii?Q?XyrgRs2G4NJEoRW1gnWdUzNLg8MyFhSBCrabRv32AsLXVkUsi90yyrAF8YlD?=
 =?us-ascii?Q?3vBlyZCHRWCHl7LBW0osUSlZdk37tX9VDU8mJ9kVZX9dyQTEh1WQXZpdvfLv?=
 =?us-ascii?Q?gvrrA/1NVpIqJ195gnQ+6WsfvWwsOOzeZSSsgmBzdSlcY1RBZqfeFPZClC5Y?=
 =?us-ascii?Q?KVzrWH5F5you/I0ogEjxbwgh4mkNgw1aoZV61Ur7l6gxawwnfdvQapMbBHUp?=
 =?us-ascii?Q?fsB+hWBtwGuu6Ub3sw5bTEklyc/5b0IcHmn6COyIDEhYPXQRVZh5WbW1SUsn?=
 =?us-ascii?Q?VuFZID2t9/2kZ2I53/Kuz5oaLbYHeXrLPpBLnCfB+lpN4pGY2RkAIYtrx89N?=
 =?us-ascii?Q?KAIALGChtNRIyoZ0nWdi/5El7+5bAxJMHvaUhPQoywyJnhGvrjF+6LKWL8yy?=
 =?us-ascii?Q?dNxDglVOK1sHJ3Sc97+C1LufumB9QRKsP7jJkUqiNMnSkN18UPLIPygoH31Y?=
 =?us-ascii?Q?eKRg96eYT9X/zFhCJHYK0/PG5HoQbO45jmTCMMyunrPxql1x3Sr6TumTCPcZ?=
 =?us-ascii?Q?6WqCNzoGYGbP0SPrIMncxebyNa2ES5aJ3jb6LtoB9sfp29SzLxeBnKkV4MTl?=
 =?us-ascii?Q?8bvcqVqFqXIZGx3kfT7z37vdIquKXLu7OTUieBl36kPKpFn4S2OZhUTAm8A8?=
 =?us-ascii?Q?XGCzob0Fon7TeD2Z7XXJGFGQl3RwZo9moAYXT1ly2OLPy+QkUQIEeF0VOGSx?=
 =?us-ascii?Q?u9mkcCZ2xLz5i+y36NZFE0s4EV0VKSTzAeXM0jt60PQDn87w6Q2zK25pYe73?=
 =?us-ascii?Q?QVRh76gSjArUhXoTtXHnwNfkJ3pnSRNcV9/7TaYaYUUQoHqxBuNBFTN5e62t?=
 =?us-ascii?Q?FU9zw2rnZj8lOQbMLgnwG6yFoJvFAcArKXtlLuMvyyr+3J4fBVPiZK0Haz0p?=
 =?us-ascii?Q?TFEznM8Fe+8kTgW0kokR92rWb081nhpUtbCejeNCApP7/VxFEZ8UH+5iFVmi?=
 =?us-ascii?Q?vAqzWN/OcoD8OP+A+3ygBZcUQb8De77goEzBkBEjMA8Ql6Q3BwJWGsEyZQrs?=
 =?us-ascii?Q?TSjMDfcsAw669rY8lqc19PlbgDR4Jh2AbeJqGd24K8kJ3hS9n0mAqwXG/5tu?=
 =?us-ascii?Q?2bTR/wEjWGPvSCn4AY1C45P9152s/lj5Twk3+PL7Y+fw/A2erPwNWEGkgSxQ?=
 =?us-ascii?Q?YUADaeCYBjk0E2tcoCzf8mXiS6MD2kqaQ4SZLDZl7kiHEKHviHZ+hixU77ZN?=
 =?us-ascii?Q?BVyN4W8KSrMJ6fbmEaBzlj2j5Ojqw4hmp8x6kHuY0T65PlVtDveu2qqB4WsX?=
 =?us-ascii?Q?YYg3bKn/YqHhnikWx8T8gGCyTAe/5nW76gVBuqLxLhXqcNAGLxHt83N0puj+?=
 =?us-ascii?Q?NOXnFHB1ej6zn4vI1wUvccWrHac81bZkIPbWgiPWZb/65QePGBnlK3wZqSZS?=
 =?us-ascii?Q?8Gc4gg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad0b0d5-9fa0-4fac-42a6-08d9df5d658a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 17:17:27.9554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FO3lWNlrXe9kCOCqO19/uox7THlWRtEx7dxY6WvSKUK/b5VyqFwD7Ecv0ViJegXmnuJlyLtayymQ8Kri79WRuua9yUn3IoNIMq6xxkw+bOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2265
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10237
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201240115
X-Proofpoint-GUID: VDFE8F0yslpoBefWaOfRROs7ztJQ6ulx
X-Proofpoint-ORIG-GUID: VDFE8F0yslpoBefWaOfRROs7ztJQ6ulx
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


