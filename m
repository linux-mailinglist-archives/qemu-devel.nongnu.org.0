Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BCE425954
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:24:03 +0200 (CEST)
Received: from localhost ([::1]:54502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYX7i-0001XZ-Ve
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mYWz8-0001mF-Qi
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:15:12 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:48528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mYWz5-0001tf-JV
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:15:09 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 197H4rZe025160; 
 Thu, 7 Oct 2021 17:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=bEuMKWR0GyjwczJI+iOqVJ89yXeASoPyupZjMOgtysc=;
 b=xKeXSrzfarvNih/LH44E+AL7O4eFRd6WF1VFOj5r0qZADczY6xvR4DyeOebdEPqvlCNM
 1wJvlsV5G80vL7jd78rouigGM3DY9geMbrOE6H71x/wFxMCkUQAG9V0ZskVHZ+GTmQCY
 5XvKEcwHNBqZIPCaD7vm3xJBXSVOhkXiDJj4Zcju9xmdh4/5G0g9dJQW8zOQ9dVIvVui
 HNQeFs5OXlgKwgBHh4eQVYMjqJjJ4VuARz2eOEWr2KA0bI4N9pTx5s76Zc4OGj5yXOJ8
 ljoPI7Eq883utitPGVRZECZkXPd6qGeCYtJdh/W3FZewh/3uT/Ye4GCmwxGGJGFQwSyv oQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bj0pw2d2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Oct 2021 17:15:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 197HAnrq066991;
 Thu, 7 Oct 2021 17:15:04 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
 by userp3020.oracle.com with ESMTP id 3bf16x5tk4-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Oct 2021 17:15:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nkPWlaMMnH7xVYTEa8tPXLdim/ChUVY5Tq8lNdftVgL7RQFGKXWTBhtUngrBbfGbATe+du/MiWUjQUN+eJI1hACLP3VSPrJjlPuQGq8qZ2IrjU9/Q9wPT9Jg3b7g2rH0DlvCoPAzK6/iidKIxHfKUSUS7TrsNFhMnDEjY+yA1mbfaCg35norl/NncctMhcebF6CYAgPAbYLojFXr2sPHJUIUuSFnrQgIohDZPAcjRxdf/R8rVhzCsf7SyAubEYujLwK1JEmv0oTKGkVGMKuR/y27XVNWhN9XjX6gI7APn4VI76q3qEYUhIl6t7vMxjgqdK2CBwVXgMW/v4w9Po1blQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEuMKWR0GyjwczJI+iOqVJ89yXeASoPyupZjMOgtysc=;
 b=QtzxweNg+vm+D2JP01a+HXVUHwJuZny9vobM0fkXtqhrtsb5Ig4KYJ4NORC39RRS4WowSleDvshllb5u5J2J9n6DV0rX+nF5bUxd308vgFD5oXJpzV240CrKcp63ODEX6Zy31DHn06jr+kvgOOadPLBUBQKiFMp6+XiJCMq/uYWQZX9IAKxH2ey6Ta3bp7VeaJW44pC67uq/v5Cymz93kbO2vSrYZjGHjj+c38sPz7t+dBoi8QVpzgS9uOedF6ReEdMpCsWD0w4Oy/giDCK8jlqBNXtXECdZOicew4ValA2P9YW7LMbjEyHQrPCnOPTERgNBg4lQwMPYSRQfkYcmAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEuMKWR0GyjwczJI+iOqVJ89yXeASoPyupZjMOgtysc=;
 b=oqx4OG7wRxpx9Ut99/52cXkBzJEudEVobZnJ6ES3Spx1sE/N9acXZpl3YtEIqiUM2waQiGOtOf9OOKZz8rFgOcN04IsjGmRgl0PKg1dNYZ4AL0eHEtOezBePa1DDAa8LuOCG6N6pUaLzNsTrrFZDPhVSJBRt+1uIP6BWbD11BwQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB5524.namprd10.prod.outlook.com (2603:10b6:303:163::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 7 Oct
 2021 17:15:03 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%7]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 17:15:03 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 07/10] ACPI ERST: qtest for ERST
Date: Thu,  7 Oct 2021 13:14:33 -0400
Message-Id: <1633626876-12115-8-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1633626876-12115-1-git-send-email-eric.devolder@oracle.com>
References: <1633626876-12115-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0015.namprd08.prod.outlook.com
 (2603:10b6:208:239::20) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 MN2PR08CA0015.namprd08.prod.outlook.com (2603:10b6:208:239::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Thu, 7 Oct 2021 17:15:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 691c135c-da38-4855-8d52-08d989b6003c
X-MS-TrafficTypeDiagnostic: CO1PR10MB5524:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB5524D177F786B0C5F08E5DD097B19@CO1PR10MB5524.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u26lqG27Bm5QX1I9dhhWREEaTRrks99AsP44sosN1iePxgEVq+q04ZZTcFlxICS5/GW+Nvb16/tMr1F90ibXbmGceBnXWuuq18SgscDRv6cMkidvGHQrI2f2Ywtf7mbmjnuOUeW6u7sAcWr/E83N/8K1mCdYALc190AIe13P4bmN9foTJxoVHnfP63rOKBp5nQlpR7AU6EOKwMxCBA6AUYZFD84bObqgab1oVMQJbzPuAroSqeBsFwgwtwRAhadaIv2PhfRfdmAo1pevmg9N0NgQ17B6AmyP36bDfX1fYtcsAi04ILNdsNAMXhgvCKgVPfu7nZJIQnESgRbTHsjuuMIZbynMnPuZipdM4A2rf3lX2hvybFn6vatS3MJh8IQbcKANv0ILOpl9bP2z4yxgc+Vfu8VEKk0T+k2HoSz6eOc0SQZKkObyERt4TuBIoLlstLBItAwanJvUXMDGgABbk8GlqWXcObIHb84HnPkY9QMT4WQAV2p7Abkz2MabBCeTKg0j27vGYKJAZRA2O47keL/AXDTxlTy+QPymfsvgzlE+ws/r3lydkMZ54A4sxoEEwU40vvdE87/6kAFnGjsapll7Wj93VsY+sBqakZj38/RZSq1oktLdic8wS4TH6wZFyBGVz6mgB1yZ3y3D72a1yqb/q6EfvSPYp5UPwMngg/LQtmDmQywIZGw9ONrA+naDcUrjSpM6QWUIe+ySYvcxYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(6916009)(38350700002)(66476007)(2906002)(36756003)(66556008)(107886003)(5660300002)(316002)(86362001)(8676002)(83380400001)(2616005)(8936002)(6666004)(956004)(4326008)(508600001)(186003)(6486002)(52116002)(7696005)(26005)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hVhtU/PY+TUSnVd0v2wGg4BAymLcVVFmQc19Lm32s3bNi0GTyrN/5j4xPXig?=
 =?us-ascii?Q?ZUxeXdTK3q6zLXTTIWlNE9N1DKvdmVB/84XzqS7daUDjahGPcmtu2Fjl1/nQ?=
 =?us-ascii?Q?r438jcIAdH/uGrsR+kQreydXPJxft0u8JqF1bZ3nZxf17iVEltUpWQ3noBRA?=
 =?us-ascii?Q?dZmHqbKTxa7JtRXpKoSe+vOu1eK2n5RVNgUeskilIJPIjL0DcdjLGVP2szSl?=
 =?us-ascii?Q?HCUKt91A4SFgh8wGYGSS7Sogyn8Jq4FuBT+EvaC+Gg6kGaWh8FcYxJGd0U4d?=
 =?us-ascii?Q?AHtWDqZW7GhnJ2z21EJoVJygu2L22+wNOA5d6VAplQbDahFqkdg25kQ29PXK?=
 =?us-ascii?Q?GCcGj7azqViPlcAe7+IIV9eXHgos8jX5OES0AFhphRoHdu1UQ3R2GTJAc5ZU?=
 =?us-ascii?Q?LnO55Wv0LZ5rnOg79YgogYkLI1UCO7XyTvFJdligC/ZBSEwfXycQVzajvDLG?=
 =?us-ascii?Q?XvKAjryo6phlyWPB3Bk/IkOa7AZtk0NXi8TfZR6iPoZGDwiyuXv/9K8U+h7h?=
 =?us-ascii?Q?6pvGyvgwIijBL+ppTIrXIwuClM3xnUISiyZA7TSyRmPYinyIJ+MJTZtJV8tS?=
 =?us-ascii?Q?b4ALd3aj94t0U+NL3dZQFzDtdHi2n7B4STJfRGGY/Ipcrab5J6E07+1yX/Ng?=
 =?us-ascii?Q?8hUGLoWR6vvk3FZ3r3s+HwD+R2rGPA27Ofc4g85qS777p++wBVuBbh19S8Bq?=
 =?us-ascii?Q?aWY9SdAZB8gfFKlZEeV1t82QqDmGz5iY/eoBzcA2YPCKICgjXkMGeDrsT/05?=
 =?us-ascii?Q?2bwZwOa0eSznLmjXe+VJkzIrmoCRbBewz9nCAAt09AjAn0AcOUu2ZsWS/VTC?=
 =?us-ascii?Q?yf30OpErqT60ThBc9rODzvEuP+W91MtdjiHuRZ2JEbskRejUIXJLw1uHkaPO?=
 =?us-ascii?Q?AnzNyYwhH63VN+XVYK/tBPArRpJRjcXMzgmn1IbifLTVw6DBOTSMC19MDnhb?=
 =?us-ascii?Q?naIwE279bQIH3bKsE8PzSu4SmFhDYJIKdakrPyx1jXgjiO7/sa80aDooqZ0y?=
 =?us-ascii?Q?SCHD/F6hmpwGeCbDJ2fV5O3DvN4/DzxcSPkIlSHJ3tQ7Qy16QVx6AuPhqpBK?=
 =?us-ascii?Q?frxyipCNdUGTJwduIIxqcIFW9UlNZfMESB4fsnzGkNvCfW9+TO+jI1vde4zI?=
 =?us-ascii?Q?MjHmCxmiVQZ1PxzYXeRRXLXl4rf05NWJ2gIE1RAx04WEk/6kmxpQMgcNSKG1?=
 =?us-ascii?Q?CMQXxQwxOCaIVoEJSPhtJodeeGq/uuAFC7r4wjhaFjBdM7k2T0Td4Y9ll6oc?=
 =?us-ascii?Q?kSdMH6mxdCUesfdmuHj+Jz9TIal7IcHHVAJd9EdeuPTkl7+Ce4ZnAipgdjUc?=
 =?us-ascii?Q?4hUwItN50JcQxhGoL32DQFwc?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 691c135c-da38-4855-8d52-08d989b6003c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 17:15:03.2021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5PHML/TJk9slv1jF1yh9AVx5SXqEVUcdUNTWqr5ftLkWcMGPVsbQ0Qg3FG+mIh2Lw7uXTuLnhHuo8iR5nMyAda5vY3aAC+D2x2RIp/n2G+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB5524
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10130
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110070112
X-Proofpoint-ORIG-GUID: hU9VeK4_OwefQYSt0E_d1KH3aURDT6qL
X-Proofpoint-GUID: hU9VeK4_OwefQYSt0E_d1KH3aURDT6qL
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change provides a qtest that locates and then does a simple
interrogation of the ERST feature within the guest.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 tests/qtest/erst-test.c | 167 ++++++++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build |   2 +
 2 files changed, 169 insertions(+)
 create mode 100644 tests/qtest/erst-test.c

diff --git a/tests/qtest/erst-test.c b/tests/qtest/erst-test.c
new file mode 100644
index 0000000..370c119
--- /dev/null
+++ b/tests/qtest/erst-test.c
@@ -0,0 +1,167 @@
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
+static void save_fn(QPCIDevice *dev, int devfn, void *data)
+{
+    QPCIDevice **pdev = (QPCIDevice **) data;
+
+    *pdev = dev;
+}
+
+static QPCIDevice *get_device(QPCIBus *pcibus)
+{
+    QPCIDevice *dev;
+
+    dev = NULL;
+    qpci_device_foreach(pcibus, 0x1b36, 0x0012, save_fn, &dev);
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
+    s->dev = get_device(s->qs->pcibus);
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
index 757bb84..d96ccf0 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -68,6 +68,7 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
   (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
+  (config_all_devices.has_key('CONFIG_ACPI') ? ['erst-test'] : []) +                 \
   qtests_pci +                                                                              \
   ['fdc-test',
    'ide-test',
@@ -246,6 +247,7 @@ qtests = {
   'bios-tables-test': [io, 'boot-sector.c', 'acpi-utils.c', 'tpm-emu.c'],
   'cdrom-test': files('boot-sector.c'),
   'dbus-vmstate-test': files('migration-helpers.c') + dbus_vmstate1,
+  'erst-test': files('erst-test.c'),
   'ivshmem-test': [rt, '../../contrib/ivshmem-server/ivshmem-server.c'],
   'migration-test': files('migration-helpers.c'),
   'pxe-test': files('boot-sector.c'),
-- 
1.8.3.1


