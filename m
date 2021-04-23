Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A77368C5E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 06:50:18 +0200 (CEST)
Received: from localhost ([::1]:43862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZnlh-0001L2-Fc
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 00:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lZnix-000870-QG
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 00:47:28 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:32516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lZnit-0005uF-VY
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 00:47:27 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13N4lLO3019476; Fri, 23 Apr 2021 04:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=JO3kEFnCp8WyStpR6N3YG44Fewv4U8+AWNv4d8tNnTM=;
 b=nVzPkLEmxEQ2GI0l1/bw1o9DEZc+22Bry2M4v4KPhp7X2oq9UlKjeDGjQ7oNRV/z3tG9
 EgUa08QaBVS813byjREmcFji/qKXisnmteaFb344NVhyt4Z9zTjpdFangmnJ7ZYLJJ9R
 nvj0ccWkmX/gXxEko7DyycKQ7p1AhEsshAwEVELo5w24PXm3vZXgTu2bqdYRr31NfpQz
 PD46XtajqIjU5bxuKbgJtg9lWE0gAeTjh7jElhHOvgoCB9hrAeaZFco/rEagmkN1XCkf
 iXC7322QlfA4vCsESBexrI3QNMwClbjWqnn1RCBRMR+t0SRUvSiE1gjXSL6t+XJHyiQ5 WQ== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 382uth0k6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Apr 2021 04:47:20 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 13N4lJUR155492;
 Fri, 23 Apr 2021 04:47:20 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2040.outbound.protection.outlook.com [104.47.56.40])
 by userp3030.oracle.com with ESMTP id 383cdsfecr-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Apr 2021 04:47:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j26hgssG5W0PZz4A064blgqg8XezMeDGSV3oA/3/dViHcnm/hoiqJMVWvAp2Zxpg6tiuhK7nBo5TeB2Tj/+pXzLfEnGF2AjT12tkcz0G+RIwHAWu+dhqvtBh9t8qdDV3NdWsIbk5eZbuedvuCIQ8JSo5os5tIp5OuUuWfYLkMJQCktbrqUgveFQzf2PLGbKRaX8e1NiYiKSZ6AIzPBRQPhrBeShj5JlSk5iQ+Di71Sxwn/oyHt+aMJBdynNw9LkzHZkA414Qa9VPjRf2/0Gea0WFZCXTEo6T2jbEun/7udzk7dVtLrl8WeFIlWOHe9TnKlPtir7Ym9l8khgXZFTE1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JO3kEFnCp8WyStpR6N3YG44Fewv4U8+AWNv4d8tNnTM=;
 b=gUiJkBPJenaHMNkT/mCBwrNyJvEx2cdtQznTgIJNZuudbwk9l4Ek43TllUpngSdT+sbLqN2v2NLUPtqq5GJ3H7UN6nS/1bpNjAqfbSePAdn5F1OoCF+SMtX9i654QXf3ashCzTHH7/ORQMcsURduiU0CP6cpWlrLXfbex33ESGNaAqI6/i8u3nd55vFvFyPjfe0jU9Tpl3j6m1JANgHceSSH+SAlNxpsdlaj8dRuz5LpsP81njld6bixzj3wVwra0AJwa6m74rYywwXU56xUzY/hocVFzJRM0ua82Zs4rf9H3/3b7TpcjBieANQwFCHxX0WHS8yrt/QSOsxnYFWaPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JO3kEFnCp8WyStpR6N3YG44Fewv4U8+AWNv4d8tNnTM=;
 b=tt/JmAiNNwjazcLHirlhd0V87u2m2QEWYTJkGSMRPGu63ie7opZ0oRn4VP79i102X2ZukBgwENg812akqBn9qqMzAWMNbZT+wwFXgRgG0BQomT7ENVS+uhQbo8zwXo9DDc1Rvcz1Ro6CLfSN95fIQRWKFIEXIhuOvcqwvn5SxoU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2668.namprd10.prod.outlook.com (2603:10b6:5:b2::25) by
 DM6PR10MB2668.namprd10.prod.outlook.com (2603:10b6:5:b2::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20; Fri, 23 Apr 2021 04:47:17 +0000
Received: from DM6PR10MB2668.namprd10.prod.outlook.com
 ([fe80::b8e3:3780:cf04:4957]) by DM6PR10MB2668.namprd10.prod.outlook.com
 ([fe80::b8e3:3780:cf04:4957%7]) with mapi id 15.20.4065.020; Fri, 23 Apr 2021
 04:47:17 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 1/1] msix: add hmp interface to dump MSI-X info
Date: Thu, 22 Apr 2021 21:47:13 -0700
Message-Id: <20210423044713.3403-2-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210423044713.3403-1-dongli.zhang@oracle.com>
References: <20210423044713.3403-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.200.16]
X-ClientProxiedBy: BYAPR02CA0055.namprd02.prod.outlook.com
 (2603:10b6:a03:54::32) To DM6PR10MB2668.namprd10.prod.outlook.com
 (2603:10b6:5:b2::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (138.3.200.16) by
 BYAPR02CA0055.namprd02.prod.outlook.com (2603:10b6:a03:54::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.22 via Frontend Transport; Fri, 23 Apr 2021 04:47:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c849241b-663a-4b45-87ce-08d90612df41
X-MS-TrafficTypeDiagnostic: DM6PR10MB2668:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR10MB2668CBE68D71BE5A4F91BE57F0459@DM6PR10MB2668.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:193;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: onTwyblxA8xT0/pzpk1MYt+hmTGPHyMOICPMR+DwCQpm63XSE8Jlwyote5Eh614VxLHaCNyV23uyBwJkL/P1OStF6bY8oTSVn5iRQ9lUQgS/iFAQrn49Md8mZQLzyYH1aDjfc1ETjEFqqdxKI4pvRTH5+bkXPBIuo+CuqsdJsqhSpq45DnB9RJhCLKZKcGn5kzVSMNs+S14+3iLzWgud26/E7J7k0HZSsnT9Ah7qvZBadCEDanUyzjQ0AJof2xqRJcvFaJ5Tt6hCqxXF2iUNiroT1uyU8ixvs+g5UckM8+JFMXZG3CasT/CWWBUbiuNJ1tA2zhbgy30bmCopnyGOu21XZc3Z4wYJuyWpwleJz4IMcxxL1k6BJJjhqvHH2mTfdSWus6YhtvKUZAMyhOrhaep7ovmYrwLL3S1cd7lXX8s7MrK92fsJHsyaN8xXZg6Y25tLQvELuNn+W7nwFWsc9eclbYPkrxDUzVFRKw+IAIOa3Fki9icIKcP2RIeklHB7ptQeWIHqO8bwi/wMM1Jr0Ea3hIdy2Qf0pUv7WFmvFM27Fggdo9fZhtUY4Wgf46RHIZKSEuYi9vnq8O+a9bovD6KeCTJVCha/f3TTM2PFbk6LHTOes3w0RVXgbk31Fh8//Y7UGtQdm2Ow5A0+BabWkDWPMlv9P8AdgseNer2UUls/B//h/zIC1N0FsajJL8ji0YqjqO/+dFKsRa8BcC4J6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2668.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(136003)(366004)(346002)(39860400002)(38350700002)(66556008)(316002)(38100700002)(6512007)(8936002)(2616005)(107886003)(4326008)(478600001)(36756003)(186003)(16526019)(8676002)(6666004)(83380400001)(2906002)(52116002)(5660300002)(26005)(66946007)(6506007)(6486002)(6916009)(1076003)(66476007)(44832011)(86362001)(956004)(69590400013)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hhQrEJ0AAnubLX84rKwxdOpxXjXbo5efcz5qOzj71V5yRMWteq4lVEE8C9B1?=
 =?us-ascii?Q?nBMHfhtEPpx0bAxUKjrs+nxP7IiJtxgD8bpsb0yFAOVV+5PrTm3ezk0pA8jW?=
 =?us-ascii?Q?7otA/0e0aNWqypzP/UQZYGkJ6lF84HEMUWPrqIRY0RXODHaSAq387MGEx/iS?=
 =?us-ascii?Q?LC+kdh9O6QWKORZQPi/6EdJqPVMarXXU0JGh/M7xTygAwPioeS2NaXHbk+bF?=
 =?us-ascii?Q?7KBK0Bf6D3NvGOr+nU3wb/7ejMfMqXbL2al8KOYUT5ISrLwtsTxdxVm6OGFA?=
 =?us-ascii?Q?lJHcTe8eHacb3OUSwx89NQOJ83tyeHrqjlzInHnaZcPryfiHIetnU2nuc+30?=
 =?us-ascii?Q?qnCqmdOlPSJyP1wpS57dZ1MTHUTXuKehSpvayPHRBoYEJREK++uK/MkWCun7?=
 =?us-ascii?Q?Eaee/GVQyFF89s2iuxzImz8KMH0p3hH8vc5MGheZjDXUADJl7hZIiYB/cY8j?=
 =?us-ascii?Q?8KVABcpfioqpUorH23JswCCG+Ra++05ELMUIDIJkdf7k5VZnKodyEb7nWDON?=
 =?us-ascii?Q?hpc4OXIF++ozZSXTqMENBUJ4tKenLUbU73+os0XCnBMqcwVHZnkBHZU5S7JM?=
 =?us-ascii?Q?9KEAvl/TC8uyjMXTaZAwU8t6QqKrR1pWMqrW/tcBCAokxp7WZu3i1H8BsGFL?=
 =?us-ascii?Q?oTHgCVErLA3wjk3+nSp0eY5wwKVcfnTwvLklLg3aCKJZxHSxpExI7eeq0u8n?=
 =?us-ascii?Q?XVa03toeIdkGKKJYIszAmg75OF/BVdP2GIHeZM9i8sPEL7tb68F5H4BFGQ4K?=
 =?us-ascii?Q?GU4lGylhn8Obc3z/NXFrh8C6e6PjRlJpODO9ptJJUJv26FHTZOLj5VAxQpQe?=
 =?us-ascii?Q?AmozQJjJ2or1nehcTk79TiKvAimOYksXdnq4NM8ZDnYg370oyTR7KwuNq7aC?=
 =?us-ascii?Q?TNECjXlDe5TpYpFuXOs7ueiceNeUx7gT+njtAlFvGgrydx9w8dHNFrZKd/pz?=
 =?us-ascii?Q?1WWUsiR9CscTUGgu6HnBhWiAHX3Pw8pYxE/lIRMNl/l8Sx9Ur0LSd++8w+Wp?=
 =?us-ascii?Q?C3OMf5sgwiqcCjuZCPODMenLzhXkUr7ldBIY2XtxXihbwo5e3e6RcUgXZ4BW?=
 =?us-ascii?Q?FIG17Df7EihRinJF2xcZyul2MiW+a5gVFLe2+H0PYkxMYiMFyloFHS5iUCRy?=
 =?us-ascii?Q?zt8xa09OVgg2gVvPcRcf92dfUAH8bwfuaoyansc8kFIevchXUeFa5x2JQYAI?=
 =?us-ascii?Q?0ImCl/jiGmSRiJ4aL59l0UVeDUNe2FW+My/IskruF+Kvn9+iwDejToez6h9r?=
 =?us-ascii?Q?sPus/fT//vDgvy+09LMXTQmd6L9GhKHcjv4fKTcBqS89wGLJcatJ+cn38IMf?=
 =?us-ascii?Q?EvgcBzqTM+/4DRu5E3Oqb0xL?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c849241b-663a-4b45-87ce-08d90612df41
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2668.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 04:47:17.6496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2lZdyyDf1iJq745PmDv43Cs+ssgmcm8uze3Asmps0m77DVIxYy3LMSTPVirZmS7U7S48n8pDiBFuQOrM21nQng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2668
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9962
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 mlxlogscore=450 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104230029
X-Proofpoint-ORIG-GUID: zlcTjAzpXLZoz1i0mZ5z3FDuranyE95T
X-Proofpoint-GUID: zlcTjAzpXLZoz1i0mZ5z3FDuranyE95T
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_NONE=0.001,
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
 jasowang@redhat.com, joe.jin@oracle.com, dgilbert@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch is to add the HMP interface to dump MSI-X table and PBA, in
order to help diagnose the loss of IRQ issue in VM (e.g., if an MSI-X
vector is erroneously masked permanently). Here is the example with
vhost-scsi:

(qemu) info msix /machine/peripheral/vscsi0
MSI-X Table
0xfee01004 0x00000000 0x00000022 0x00000000
0xfee02004 0x00000000 0x00000023 0x00000000
0xfee01004 0x00000000 0x00000023 0x00000000
0xfee01004 0x00000000 0x00000021 0x00000000
0xfee02004 0x00000000 0x00000022 0x00000000
0x00000000 0x00000000 0x00000000 0x00000001
0x00000000 0x00000000 0x00000000 0x00000001
MSI-X PBA
0 0 0 0 0 0 0

Since the number of MSI-X entries is not determined and might be very
large, it is sometimes inappropriate to dump via QMP.

Therefore, this patch dumps MSI-X information only via HMP, which is
similar to the implementation of hmp_info_mem().

Cc: Jason Wang <jasowang@redhat.com>
Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 hmp-commands-info.hx   | 13 +++++++++++
 hw/pci/msix.c          | 49 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/pci/msix.h  |  2 ++
 include/monitor/hmp.h  |  1 +
 softmmu/qdev-monitor.c | 25 +++++++++++++++++++++
 5 files changed, 90 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index ab0c7aa5ee..cbd056442b 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -221,6 +221,19 @@ SRST
     Show PCI information.
 ERST
 
+    {
+        .name       = "msix",
+        .args_type  = "dev:s",
+        .params     = "dev",
+        .help       = "dump MSI-X information",
+        .cmd        = hmp_info_msix,
+    },
+
+SRST
+  ``info msix`` *dev*
+    Dump MSI-X information for device *dev*.
+ERST
+
 #if defined(TARGET_I386) || defined(TARGET_SH4) || defined(TARGET_SPARC) || \
     defined(TARGET_PPC) || defined(TARGET_XTENSA) || defined(TARGET_M68K)
     {
diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index ae9331cd0b..a93d31da9f 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -22,6 +22,7 @@
 #include "sysemu/xen.h"
 #include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
+#include "monitor/monitor.h"
 #include "qemu/range.h"
 #include "qapi/error.h"
 #include "trace.h"
@@ -669,3 +670,51 @@ const VMStateDescription vmstate_msix = {
         VMSTATE_END_OF_LIST()
     }
 };
+
+static void msix_dump_table(Monitor *mon, PCIDevice *dev)
+{
+    int vector, i, offset;
+    uint32_t val;
+
+    monitor_printf(mon, "MSI-X Table\n");
+
+    for (vector = 0; vector < dev->msix_entries_nr; vector++) {
+        for (i = 0; i < 4; i++) {
+            offset = vector * PCI_MSIX_ENTRY_SIZE + i * 4;
+            val = pci_get_long(dev->msix_table + offset);
+
+            monitor_printf(mon, "0x%08x ", val);
+        }
+        monitor_printf(mon, "\n");
+    }
+}
+
+static void msix_dump_pba(Monitor *mon, PCIDevice *dev)
+{
+    int vector;
+
+    monitor_printf(mon, "MSI-X PBA\n");
+
+    for (vector = 0; vector < dev->msix_entries_nr; vector++) {
+        monitor_printf(mon, "%d ", !!msix_is_pending(dev, vector));
+
+        if (vector % 16 == 15) {
+            monitor_printf(mon, "\n");
+        }
+    }
+
+    if (vector % 16 != 15) {
+        monitor_printf(mon, "\n");
+    }
+}
+
+void msix_dump_info(Monitor *mon, PCIDevice *dev, Error **errp)
+{
+    if (!msix_present(dev)) {
+        error_setg(errp, "MSI-X not available");
+        return;
+    }
+
+    msix_dump_table(mon, dev);
+    msix_dump_pba(mon, dev);
+}
diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
index 4c4a60c739..10a4500295 100644
--- a/include/hw/pci/msix.h
+++ b/include/hw/pci/msix.h
@@ -47,6 +47,8 @@ int msix_set_vector_notifiers(PCIDevice *dev,
                               MSIVectorPollNotifier poll_notifier);
 void msix_unset_vector_notifiers(PCIDevice *dev);
 
+void msix_dump_info(Monitor *mon, PCIDevice *dev, Error **errp);
+
 extern const VMStateDescription vmstate_msix;
 
 #define VMSTATE_MSIX_TEST(_field, _state, _test) {                   \
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 605d57287a..46e0efc213 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -36,6 +36,7 @@ void hmp_info_irq(Monitor *mon, const QDict *qdict);
 void hmp_info_pic(Monitor *mon, const QDict *qdict);
 void hmp_info_rdma(Monitor *mon, const QDict *qdict);
 void hmp_info_pci(Monitor *mon, const QDict *qdict);
+void hmp_info_msix(Monitor *mon, const QDict *qdict);
 void hmp_info_tpm(Monitor *mon, const QDict *qdict);
 void hmp_info_iothreads(Monitor *mon, const QDict *qdict);
 void hmp_quit(Monitor *mon, const QDict *qdict);
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index a9955b97a0..2a37d03fb7 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
+#include "hw/pci/msix.h"
 #include "monitor/hmp.h"
 #include "monitor/monitor.h"
 #include "monitor/qdev.h"
@@ -1006,3 +1007,27 @@ bool qmp_command_available(const QmpCommand *cmd, Error **errp)
     }
     return true;
 }
+
+void hmp_info_msix(Monitor *mon, const QDict *qdict)
+{
+    const char *name = qdict_get_str(qdict, "dev");
+    DeviceState *dev = find_device_state(name, NULL);
+    PCIDevice *pci_dev;
+    Error *err = NULL;
+
+    if (!dev) {
+        error_setg(&err, "Device %s not found", name);
+        goto exit;
+    }
+
+    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        error_setg(&err, "Not a PCI device");
+        goto exit;
+    }
+
+    pci_dev = PCI_DEVICE(dev);
+    msix_dump_info(mon, pci_dev, &err);
+
+exit:
+    hmp_handle_error(mon, err);
+}
-- 
2.17.1


