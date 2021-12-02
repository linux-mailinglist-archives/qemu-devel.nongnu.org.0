Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28305466A34
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 20:14:39 +0100 (CET)
Received: from localhost ([::1]:36854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msrXS-0003np-78
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 14:14:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1msrTk-0008O3-4Z
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 14:10:48 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:48994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1msrTe-0006Zw-4N
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 14:10:44 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B2IwIp8020451; 
 Thu, 2 Dec 2021 19:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=f2RnzeVRWCb+CCSMHzVlm1UuJbGX9qqDwVEw1Vvr8KA=;
 b=JQGsay7cIAOF1KwSuMzOSBXpT6ToikRNSVgCQksB/DFj2dPzGsPtI80x/qRtNP6JpDiO
 tLFIINpvQa6TTUxuGj2kB/g+8psB2vbT/NKxNCCG9k+IgYlh4BV5Om9e6azKWMVFr55W
 UshvDUlDy98gMDLCBh6sZwYvXriw6x5GiRDf5Yv36nxZ5DQsZ06B2O7ppdn6Oda2HD9a
 T5AEk0AA0qlm1PMW1OUeQPXwDQJg7kjo7MwRFokTNHSURTsxa32l03zq0fd9JowD2F3j
 lN6RrNwVeFsVP3ZbAhdM2hb4l0R103h7lWlgtdDxanPE9vOjqKtARwfEVYfovbn2YZu9 EQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cp9gktb2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Dec 2021 19:10:38 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B2IoP4H115582;
 Thu, 2 Dec 2021 19:09:33 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2048.outbound.protection.outlook.com [104.47.51.48])
 by userp3020.oracle.com with ESMTP id 3cke4urwd9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Dec 2021 19:09:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOvwhNF2u0CN2vmocQ+6IvPNtR5p5Px7zPPbIHY/anzdUL07Gwj93cmAugfPN06XG92bONpnUTsrYJUZKmGkyBecXeQrvPrGAQx2YuuQd3DkD1t4QE7ChkNwfA3jUb0JNrH3sjHHB3a389H317nKP/cbK1qB+OxPRS/rPPR+zfheZmyWZ0WGSAmecai8F89z+80COcDEay4puaRYcxr7n+OHfY/TPTBQSKaot5b83RII5QATJhr6t8LqikWIcdwM/VdgAIT2RG9H2i9PTjWJO8zqQQfi2tmD4K8ZpX8qRcHoc+JDdpiD7JCdvP06X08AlDM9HmLN8+tgjgKqS0fpnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f2RnzeVRWCb+CCSMHzVlm1UuJbGX9qqDwVEw1Vvr8KA=;
 b=W0GCHkRCo+MsUU3fl/3L7sCr23bLGNTGvVBojOnzcMxQIyQnC0w3oHxzT/plwT46645CAVlKVJI/jCmXl5rckbVsySF+OOgGePGBTlnB2VERxvDOVpvIK/0kVC/oXoql0F7adrNDbX/Y9h0dQFxIaAFnZ7RMNiT9z03bsxCYhVsiX0tDPwjG/lONGt4/LTcD6Y9BUo71NPvzJIrI7brPpRXqg9Ox4X+3qX2z4oz/VP86YuIwOP0K/d1pYwNBPP+14YQK3BgUaHyea7CaSuK+VfxplbBkXpZrfImpb+GR43jNwdxboUfiv+9rQZaxx7FDaRrvV2NhZjmAZwPIRCzh0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2RnzeVRWCb+CCSMHzVlm1UuJbGX9qqDwVEw1Vvr8KA=;
 b=h0P2c3p6aktOe5sWMzLnTHvSjfx9ZPRVB4tAqSEhBnIf9bNuAkUDD/bcLe6ykTdaVCvp90D+f5+AI2D7O7hxFjwxaBqHiqIP2IKClleLNTHJFhYhP6Y328mUooGAuM7WqDEJdIp3xAYLZpP1XuTy2CJPnZQMALRllHHcwsdhd6c=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1760.namprd10.prod.outlook.com (2603:10b6:301:a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 19:09:31 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4755.015; Thu, 2 Dec 2021
 19:09:31 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 08/10] ACPI ERST: qtest for ERST
Date: Thu,  2 Dec 2021 14:09:00 -0500
Message-Id: <1638472142-14396-9-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638472142-14396-1-git-send-email-eric.devolder@oracle.com>
References: <1638472142-14396-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::19) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SJ0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:a03:33a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Thu, 2 Dec 2021 19:09:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0770db10-511e-4c82-ac02-08d9b5c74524
X-MS-TrafficTypeDiagnostic: MWHPR10MB1760:
X-Microsoft-Antispam-PRVS: <MWHPR10MB1760B73E7101F0F7434F6B4597699@MWHPR10MB1760.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hScctRByA2MyrJFwL2Aa1ljcjzI1Qfw6gJqXUy4ha0yD7n2f+8BKV2ra8onP2AoTNc1Q3M/Gzh1Ic+7ORaJMWLpe9lJ69AqhXKKD8nmi3d3+RwRnw4h1cZwHO+BqXjOjmcHzJJI/aU/gzcdoVGzs9eG/y2+SY+n+IAZXQIiqQlVrsdcZIPY03oge+eozhl1F006tcEb7aN6wnSOQKge/tlivua+UstQgx4NVFtYo6PTKMjj4xt1foVsXS8XV/r7snCG8Vawc7O25f0Duzm8nkUoQ22pRfI5Tx/O9S0Tiiza5yVBOiB7nG3hBFQDKRz8bFyCdr4I8F7ZwUf9Tmj9qusayypZQQ+ln+bAw9Vzf+Og93sVxuYesfP3wkMrreHad4LrLx5L2DMZezEho9fuinjuF2/S+YPESkGmgvrNkFP5WxLzNboWZfscANg+pvlWZJWxOJ8OdHQ+LneUJCRdsKP6NXRsrZL/XHKsvOX8bHxrnWxm9+RPZ05dK0+mzHgheoLzPzWNDSiEwBEgUiZNVupFgVbC3bfU2TUTLBhR8vpR0X88hnFCaHMnffYkJx4+s1zrZAWedgHIq0BhePbv2uE+eaXCyYvKyI5z7oDc3CtRWaS+xuWIPomJo+ycHtXwivzJXYWPwyM2BPKDEOiuNLWm42U81d/mm1B6C7Y/aBnl+3Gjfbv9ljKh8rUepIRWVmSnaY/ijALHpN6qzCbt0pw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6666004)(38100700002)(38350700002)(66556008)(36756003)(316002)(66476007)(66946007)(2906002)(186003)(6486002)(8676002)(6916009)(26005)(5660300002)(83380400001)(107886003)(52116002)(8936002)(508600001)(7696005)(956004)(4326008)(2616005)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TNT94/CR9BItA7wVZlT80hC3/76OaigPtUVp5YkTYkG/oazyLoeb9C0/00BG?=
 =?us-ascii?Q?zyCgDTWi9CBuu0iFnMne36b2gmgVL1n1Ymt2wsWhJi9nDL54AbYtu7WnW3eh?=
 =?us-ascii?Q?Z2ZrNnbMA+M0mKT5NoniL28cwI6LKbppkEOBar1RSPCr0wO/qSbyy7txJEjR?=
 =?us-ascii?Q?765V7Pjszhx0M1zEN3+A/4AA73fN2WJVcJTPSuAnPUGrjP6LYQcMiIYF1BHy?=
 =?us-ascii?Q?2erck0iNmcT8EE+qgtavGFiRmwMZkx2piBtlizru1cfSPCIUJbFuJgtffLlT?=
 =?us-ascii?Q?yr2mWDpYADXHrDiQCDyVHjZC/t554Ue7TNQBTwF8pDg3ljpiB0mV3dDyS7SC?=
 =?us-ascii?Q?zVJrYA0W5tYqPfa8Sff44EdQChIi54QSsQC839crcE7g86mGmFmxKdTLzU8r?=
 =?us-ascii?Q?PAC84ktIOBqOP/LGxyzFgrVWUfIfXn8ARJC5NFFhwFA5OpvA2y+4fZSQ2A72?=
 =?us-ascii?Q?H8ELm9QT0VpqFzZYebNz61QnGHTAH18MI8vSZByR+KiOfHIrOKvozgB4+Rdc?=
 =?us-ascii?Q?YmBU5m2+zDnQB+cLw7vLaO3J3fYgUMssGnPV5pMbtW/nTd6lWXgoxGpu1YX8?=
 =?us-ascii?Q?0BnbP1hNVwdtd0N0vkc/5plhyTS3cPNVlipXY71pfchhgWslpGuwSw1mLVfy?=
 =?us-ascii?Q?MS7msf0IQZO3vzMseNSC0qVjEINhv1nS0mTYwK/8yRsyjwHDYDkuqX4wd/DQ?=
 =?us-ascii?Q?zGhg6BxUNSFpbdC1JpAKKFT1IyOTZWEu8VOumSyHmjprALtPPb/f62t6AW81?=
 =?us-ascii?Q?Q691+dKmLluaahtiDdvurfUBMzsW8TiS2w3mogJMlnnmWe8f2mgJNZcAg1OE?=
 =?us-ascii?Q?LW6YKUlP8dvRpHFGzLSjScLhyHOmFQxSxWNlh2tCIurBIrhJrqrMKmGP+1do?=
 =?us-ascii?Q?P52QSo5Fwbz6dSmCZznO+P6CWid7prpmAW63+rhwVvxusY53ZZi6Zf/TIsxW?=
 =?us-ascii?Q?+2Y2tvYo045V1viAB0cmuorFb/lAKA/glJZGHTjYkb33iNbUTUjKOlTSEQut?=
 =?us-ascii?Q?GgvPzoGUzUk/okjiMg+xrIz1YDsLAzyCM6orSG5xTubGskbAssATcy03ERGp?=
 =?us-ascii?Q?+ukG7O4d3yrK75ytguyClQpqCLi286zEZUo3lAk91m2jnpPAN6OMBF3hOdYP?=
 =?us-ascii?Q?1dTjgghttLalWkeDNdapAoe6k9yv7n4Clx5IyodKCjmSMh3VHH9qt4cWF58U?=
 =?us-ascii?Q?mde9D6jmQsS3M7+5H9lRQHaw7mpazraaTo+44BGUrWpRtfwsmpwnahQUu/nj?=
 =?us-ascii?Q?CveeGpkLX4GL//Zs2g05jzW6Xh6l2LIK4tHazZHJHCAoFh60L9eZgy4iDHvK?=
 =?us-ascii?Q?pr2Ay8dO18BXiXtbU6Xz5JrzVLyVbiwvCZolvkOYhnJkvhlXBP5zRB/05xn3?=
 =?us-ascii?Q?ey7M7pKiPRn6I6AoIv2JrIVUJIp3+eRrtXE969rCaSyZ8K3RTJc4FbHtmMIC?=
 =?us-ascii?Q?f4FbUwvlo+LmYXfzVTUQU3qRwUgm+DdCy8JJQ8hjoPJye5NA4SjWBTqdfHnW?=
 =?us-ascii?Q?Ehz+J8ZQTRa/DrueRQyOzypTbUZL5gEURJFaTtgEZFjcw0OMGC/Yz52nA91/?=
 =?us-ascii?Q?ITczE8YHg7ao92lTOf6+F0TjDPyh6+jp0SYzwGyfWhs+piWl+3F5H6XRCKjf?=
 =?us-ascii?Q?4uSdsvkG5Tpsg4ThHPuVc5/+SpoyZibZ/ifTLds0OFBvEbzE+/NYoFfeqgC2?=
 =?us-ascii?Q?X0rDLQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0770db10-511e-4c82-ac02-08d9b5c74524
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 19:09:31.4348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z7tBP1znJPNA4u5Kf4ovop+LPg0O+BmFdTErj92Bxeijrw3mqG3FeYA5c8Jn8x/S2FmdwaR9AqbGtXvrHTkyKvbF9FKHBjlm50XrRkc/JiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1760
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10185
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112020121
X-Proofpoint-ORIG-GUID: Ks3X1Bk1nH7KJVXrai7G9f9KfuZAwCyB
X-Proofpoint-GUID: Ks3X1Bk1nH7KJVXrai7G9f9KfuZAwCyB
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
index c9d8458..4b01c22 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -68,6 +68,7 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
   (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
+  (config_all_devices.has_key('CONFIG_ACPI_ERST') ? ['erst-test'] : []) +                        \
   (unpack_edk2_blobs ? ['bios-tables-test'] : []) +                                         \
   qtests_pci +                                                                              \
   ['fdc-test',
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


