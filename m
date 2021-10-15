Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3949542FBCB
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 21:13:04 +0200 (CEST)
Received: from localhost ([::1]:50646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbSdb-0001Nl-76
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 15:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mbSUd-0003wX-OH
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:03:48 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:62392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mbSUb-0007qI-OX
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:03:47 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19FIG6PI006631; 
 Fri, 15 Oct 2021 19:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=bJTGvmMR66d41qQOba3qeGy98nzk06u8PuHi2byqZQw=;
 b=RzOWmDyJfJva+h1OgVoS5fWPPwSdDqveRixsCfb/Nj+Q1Wu4jzRxVpjZbqjmCCLreJdY
 qBy0ykpOPZpWzG4OrEt0F6B2+YP+Sb4GRh5K3H/VrcOLcNNUUPHJoojKAzi9NgkW/+qe
 3oxKsK/TtaAelKBX5IX4F6NmUw2OWK++Nni3wbHS17Sh9LZQoTLQadq4Brc/uZY4HLvF
 WsMMCOmOwMN/wrdsz6k/R/Ay5c/OwceESh9q3FDUi0jS3QFRYmxN9iqVhm+d+XKMLI2N
 hf5WoeLiKTAs+oGYPCSYPvsKaB79VmVkNWjfZuyrUpYuCjGPM1HYt4Ihkga+ZFRKxsP0 bg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bqes2g7bs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Oct 2021 19:03:42 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19FJ1Jhs069241;
 Fri, 15 Oct 2021 19:03:41 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2048.outbound.protection.outlook.com [104.47.74.48])
 by userp3030.oracle.com with ESMTP id 3bkyvew18h-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Oct 2021 19:03:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+6qhWsMNkBqblMqKf8ogz/y6Z5O7DcbAcPl48nY/dwPepwi4U8V0/TIVgJOzUTghJhguVPjfszPQjY5fw9jZqCXjfgqsvA39Te0/v33DO6trAjnY8cfRGIsPt0IqJ3t+QqO4wO/GdhEzL5HaLMuZgcxKBEXIuAYr/KZVDUfVfNJeZX0pGS0yn9I+sCeD3yFUIY7lTlS5oFNrBO0IGNCc+8OWp6GYsvbUVYid5D2kEQgTzEjcWfb357N3RotuxDPNCHkDOFQjAtk/jo4tjmylkwZEOh++VzFWOROvjOHdZoEXHlFYteREM83mHAbQVkUT90TVcISGQsSCHJBnd7KDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJTGvmMR66d41qQOba3qeGy98nzk06u8PuHi2byqZQw=;
 b=DAN9Hd5XdnOO+f0PT6PYLdJjdCOuUFAO7fphpHxdNjJp9sDsH3S5RCy/CpI4eCZrFacwOO2hqlwcYPrY8z5tg6qEGJ09TtZLJ+l4gFkLXy9hi4KniuiBDHQsHk9QhgU4+YQc9nLeqxLz6S2ssZhKKgAMFitGGVeGGqKL6Tqf7gbMqQLPECEVC7cq3QLIWDIQwuZrRvp3PbWkS3o81MnZjWlmd9eaZOCk8pKMugN9g2Qbm/g+bQoch4crFg0om+oFJnLwvNoWUm5v7+9UNyIlhOnVDQtUBgEjQyY/UN3V9uxTRlBqXdj11EpqSAVx98Z5UScUgov43WbgviSlzh+L9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJTGvmMR66d41qQOba3qeGy98nzk06u8PuHi2byqZQw=;
 b=nQwAP393SqQbhLO2l1c6p7E6bPWmLGlTA+Kp8BEMYPJkOsGU2TEFlJnJ40xSrMVPIaP8XrcR9sgchaxpOGve7QgQnQex5Vu2WTlgVsQhEf30Es0fcU2HRjHpYCF638368jJGt8Ps1ZQH7K6iCjkYs3a9InMmxIGEmjUt+m1WjzY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5441.namprd10.prod.outlook.com (2603:10b6:5:35a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 19:03:39 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%9]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 19:03:39 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 08/10] ACPI ERST: qtest for ERST
Date: Fri, 15 Oct 2021 15:02:58 -0400
Message-Id: <1634324580-27120-9-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
References: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0129.namprd13.prod.outlook.com
 (2603:10b6:806:27::14) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SA9PR13CA0129.namprd13.prod.outlook.com (2603:10b6:806:27::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.9 via Frontend Transport; Fri, 15 Oct 2021 19:03:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b5893b5-8fb8-477d-4cb2-08d9900e7f8d
X-MS-TrafficTypeDiagnostic: CO6PR10MB5441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB5441411A080E909959D3161B97B99@CO6PR10MB5441.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1lNvwbsvXfg1GRXa2PCCbHs+9V2+bFw+xrxhwuhMuIogt+um9jCmKpr7TxIdKbYXNPB8hRSCKN6w1R2ZczssOiS8VdqowMtQTuHC40U0HOHLWj9QUynDN6xu3+ttXUKLRjfW9cxZJnfvreCGEXHzIXHBBCF/PJ6GRD+DvKWKMVBcBoZiAm4fE1GDuuj1i9kLIgJWR15ZRuvheCIm2di9RBZaBPq2EMNr3NsFKqTmktDqaEAieF1gJNTRUAGYKymah6TrPoUA4vkYR8w0y9qswaEPf69Jif0BotcuYk5WeJfqWMWYQxuAqJLAa9eh9PNRygSPvwfGJqgHFwXb1Q5wqhglENNU5qDSyyJEeOu9URLuIVHxaExd1Q1nBiWstDi+IantutjqsCoN5osQcRRMN8+Ager5UQ6jHj6xywrr7TXOLmFbTJc5K2+3Z03aRsIFM41uA6sMveAByfT5Br5mIHTY/C23vFZYocLYJ8EXwq4aY4kZfQkqJ8JBxGpBPbPkkQbSNqbABGcZazOIOX6LCax9eaWgaLKT1rVAMiB2ryPLQNSwdOI1k+ZgN/RHLwEfExaeL/KcYK1nxZcr3K1gCGm3/lE/VRIbUmaKd7+9aXn+gNClEZ2FLj7CDWezk3z4q1S9vSufZ+zg+/x4c5Q3KfVBXINJgTY79NG4EdfO+MhJaN//R9R/INiA5lHt3/RCKbEkQs0ErH7d4CRSn8EXvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(186003)(66476007)(66556008)(66946007)(8936002)(83380400001)(2616005)(86362001)(6666004)(2906002)(956004)(508600001)(5660300002)(7696005)(6916009)(4326008)(52116002)(8676002)(38100700002)(316002)(6486002)(107886003)(38350700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t3kF0+C633f5T1htZwQfrechlX96LY8hBCnzE+PATL2b7T+wcrVPie/XIagW?=
 =?us-ascii?Q?Slt1duAG09wHMsSysXLSOL7XqJAXipqj48UE0RnaVn2eoaMoFoJC1l9+Y3z8?=
 =?us-ascii?Q?2YI3RhLKK75MoHuTDyUJb5hTjRicl76LsWbKjemSBgV1mlh9wLWGslbFAqU9?=
 =?us-ascii?Q?PlcYC4MxzEsf8swk2M1ZbC23fikML8s+TdMjtYaW5Z1Xkix6rOm0fnEBGMQH?=
 =?us-ascii?Q?P5fXWcyD6Ky8ZzGTr9ddgNe6d1uCkmiKNcOWr6rGJ8Tv5n2MJSMd7OSvIOM/?=
 =?us-ascii?Q?dyeGx1YxDF79Eo8iELr+SCwHxyiBU6+ORq8+sTNEKdD2r9Zk8NIQjGyutLIu?=
 =?us-ascii?Q?bhWpCGDcSXfN6gXNIYXgLOK/KQPSR+AgYZms2ER5mMBwA0M/vupbzHm9iI1M?=
 =?us-ascii?Q?clzlLxgyZA+OHUSp0GP49Js6Y5NSBVz9cLchkL6XKbalL5PnN6PZEa0mHljF?=
 =?us-ascii?Q?dyaOWbx9X6bJmPs2pFP6eLHI4d69RX3R/AzwDM3A6HWLEJKRvUIlpU8AlxU+?=
 =?us-ascii?Q?H5mbA3P4HEOC2c44luChENQ9IQUo93M0Y+67BLx11sxMs5fCfDnaQIrVmNlb?=
 =?us-ascii?Q?sXpyyFnad82LYuzJh+j7jBuXo0YbWirQ3CB2b7cg61DprNQmMl61dr9LUkMT?=
 =?us-ascii?Q?LJIfdsEFzt22jHP1p/UXuELNgi6DMLKSzeWu7BlAzkcGZYsuOvvoIn35+ROx?=
 =?us-ascii?Q?cpAIcuF9yrLNwWLkhlP2pPqusPa1BzWN2iYvwJB6a34IgIwsmibupMgCE9t+?=
 =?us-ascii?Q?5D0nLz3SssH/JWRqyzjq2ZWEzALd385EIZ9YYaNkCO/Yahbls5ioLJyg9i/d?=
 =?us-ascii?Q?uxpr34xu/A+wdwu63xIIDoh1Dz7xmGTq/Wg/je8VQrunc7cBAR4+rb3IjCcD?=
 =?us-ascii?Q?Lxf/ieVy5ys0pAZm+h7c9Ck2E1ExNBGmS2HVZ1zzS/FugtJElAR4lfZ0Hrn+?=
 =?us-ascii?Q?lmHw74fvZEPnYYQ0dZGzFIyrLlkstbZOaIhAScsqB7uYWPKNICTmert8xoWk?=
 =?us-ascii?Q?bRT9V0cfCq1WcCcsj2kGAXmxVpoC8IQEmBYhX2+qT7jHnyqBnXQ/ocY18ncp?=
 =?us-ascii?Q?VxvKDftHOU4XmwpHO6OO5U33Uan1ksq104p9SR4ptEv5YWjpk1IOTeUpJjkV?=
 =?us-ascii?Q?oQfufzPMJMw6cV0M3bRN9O3rhIqQEl4Uj1CqQeMxCxCz512I1TGv+5vmg/fe?=
 =?us-ascii?Q?JVc2nagJ0gs5xirni/Lk3YINOUUMKANPAmK7RZ8y7cGkNCWP0okGs3TatWyq?=
 =?us-ascii?Q?nQN/BkAypMiONPSyfFMzpWuU1ZZigSCD+416nZlr+fGIkWKX72EXMKCjWKVH?=
 =?us-ascii?Q?SA6N+cfbpuqbE49l3g6DshTp?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b5893b5-8fb8-477d-4cb2-08d9900e7f8d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 19:03:39.4788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjf8JIjZ6Qf7HDLmW3bAVIQC3kCFxF/7LicZjLkllb1fzrCYFD7iLdaI3iROhe/SIPe04b9pOTOHygB2SED8rK3kbiKTDiFm70aLoBfARW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5441
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10138
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110150116
X-Proofpoint-GUID: gtCH61IUy5wK8T0FCMtX6NUt8BDqn67E
X-Proofpoint-ORIG-GUID: gtCH61IUy5wK8T0FCMtX6NUt8BDqn67E
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index c9d8458..15ae6d9 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -68,6 +68,7 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
   (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
+  (config_all_devices.has_key('CONFIG_ACPI') ? ['erst-test'] : []) +                        \
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


