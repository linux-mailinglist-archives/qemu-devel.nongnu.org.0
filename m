Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200FC3C674C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 02:01:25 +0200 (CEST)
Received: from localhost ([::1]:56636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m35rY-00070V-3F
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 20:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m35ot-0004Jr-FM
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 19:58:39 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:23552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m35oo-00031m-At
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 19:58:39 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CNlI93002492; Mon, 12 Jul 2021 23:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=9HxkYQ/O+HsJdfuUzZPsIevzuoCcFFrW4Ae/+4BJcw0=;
 b=cxzTWKJ4VaBsvuY6fQmuSiWpUSTMwJHKVIyPuze0AIQWJLUELG4JxZup12Rfz9X6TYmD
 Bp9FYJ/nGg50ROxIcoOSzj0bSQJ20l4/MnhZJetBYNn3kPiO20KUm6DngSiitBr54lwv
 MbgjVNuZD8lMe7ncAZPD3jhdnRRbYQz8+r8oexXeJLsafpJrsXhSV5tiy16z8Xd1g7wz
 KfOL7p0QM6WgcyjzO55od9bz2T1wi0vd8t2A9mMl8KSlNzGuUJlHs2BLI3rIRWim4FU+
 q6rAAHPTDuMlqk/LCqnd9OXZpVJACCTlIc+z6oIWdEYc0TD+xXoWHtzEc7gaa2zDK8DY xA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39r9hcjdm3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 23:58:29 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16CNosEf167701;
 Mon, 12 Jul 2021 23:58:28 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by userp3020.oracle.com with ESMTP id 39qnavtx6v-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 23:58:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9UMrBggLdc3tVESCuOuR0i9iEShta/0t4yf+wJPGzzr9FjRACFEObiNYK3yQUDum86jaGTXIXhkMdVbtXGQU1Jz/DI8CH1Xb4gD5LqPMgW56F1fTM2BaAvN+hP/9kh+zqHFnWX8MawZ+acWxy8HxRqSYTU5SybyOnJxTGGEhKJoLvcpmx+BJSwA3W1yMnpLseQpGnM3H4mtdTY1SXdSqDZ+3ZrQIGflfXVfDImPvYi4By155g1CBFdNPhwk+oy0/z7JhJ0T+3wgWsBYx16oCG7GThbOhWVHwpSvI/byURWCcQuzV0w1K2DInD2Cy0eO3zT8CPZw97ArO3BJGoVSrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HxkYQ/O+HsJdfuUzZPsIevzuoCcFFrW4Ae/+4BJcw0=;
 b=PXDeQ0MfHL7TaZiZ8VZZGolAEL82qAd6ZAuA66p7iul+AkBRb7BDI9OvqAfR5B/civcJ93eTOUJk8BhiwtRJ9scfd0NPj18FVGa5J239lahGb1FnkNRrlU/R8MK5FsYUwKtca1iUlpuXju+Zbdm5fmE4hjVoyRz4rY+RCiOsijtEC0GpblVtkHA4W+ZTQD57v76P5ySyDxm+OsFpWd6+kLZjHF6i2nZHHNuPkmBmVFsTlCYDyyt5pnrdI/VNhNhe7RwBusbZpPymlCeuLkNEJ369sQedzzsOFEn5muCBP7IDjLH6IxVYZRxVujqPmh7ZRADFtLDvsBrlz6ENSGQDIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HxkYQ/O+HsJdfuUzZPsIevzuoCcFFrW4Ae/+4BJcw0=;
 b=ojL1jOKLX9aDU61cvJ0QPMSEiJhXUM4/kfjfRaEzinObqx+EzLmMPGlvzRs781Bj44Qbucegrb26HfsX5lxM6gH0drzTvXlg9ZLLhBpTwzN/o76u8FTSpKJiJOrOoDI1t+iysjmyYD1ZiE3vCVISm2+1dLI4moiFng7lgop5PU8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BYAPR10MB2598.namprd10.prod.outlook.com (2603:10b6:a02:b1::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Mon, 12 Jul
 2021 23:58:26 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c%3]) with mapi id 15.20.4308.027; Mon, 12 Jul 2021
 23:58:26 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND v2 1/3] msix/hmp: add hmp interface to dump MSI-X info
Date: Mon, 12 Jul 2021 16:58:10 -0700
Message-Id: <20210712235812.19725-2-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210712235812.19725-1-dongli.zhang@oracle.com>
References: <20210712235812.19725-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0019.namprd11.prod.outlook.com
 (2603:10b6:806:d3::24) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (138.3.200.16) by
 SA0PR11CA0019.namprd11.prod.outlook.com (2603:10b6:806:d3::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Mon, 12 Jul 2021 23:58:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48695a3c-e0e5-4308-a4f6-08d94590f063
X-MS-TrafficTypeDiagnostic: BYAPR10MB2598:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB2598F81A5A1677C3765267DAF0159@BYAPR10MB2598.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:256;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zio8NkLnOsM+3wiUU7xHKE2if+u9KqA/fwgB3MbjPBsdcPhYt2Z7SrzZpYd7s+Gjqc4BZiSQNsEQI8R+H+i5vVTxIZjd2KlAjVl2KfSBBgq7X2vhmyGVlqKg092Yu20AiPc1OqUz6bI3HsXu/D5FUJgB8pQPR+si4f5ViU5F+uxhhbXabI4h7QAwA8zkpd00lPgcBuzP5Y0ZI5uaRwwfvD9nMbvr9VU1+xsbNqRHf61iOmfHGKb3EnQNzW76rYhq48wy+/00Hi3grlkJaPGS3n+RNGnfxlyFKO53Dos2/9WcBdRFdBOhcfaOfQ5WlI/j0pz69v1EAlkAynuZfeEKDJ8/Zh9YY4zA9j7cPa7pUMBTL2rKqRh0mmertKBP/yOux/qC+ZruPY8l0qVC8cI3lZpKTFntQakCa4sx75SUZtLRBheEIBO3ymwuVZnEBIoN98VMuS1mfEneOwuHbLUnCGAY/Q6EbZAlC5R3LnNlAm5AOjdcVFb8xvs2bg29JmInCsw2L7nIqNxugqX76ZkfuC1+3x/n2YovjaYYp14RDEiBkvZROzEmEn9VKAUiHNshx0uVlKvesglzfBUaaoZyitR1oh9ez33JeH9xgmVOI41O5Y5U5Y+nZ7zmP/LErrSyVwW10mE4jnY1kb6RCAgxrqLHwCStBtqlqJRh9bYhtQlGNhXOlOv0VYsxYY6zfWpl2ApaFMne6CqVSOj1bDxiVh9XSseJqdG/HxxlVf7b8UU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(136003)(376002)(396003)(366004)(5660300002)(6666004)(86362001)(38350700002)(38100700002)(52116002)(6506007)(66476007)(44832011)(66556008)(66946007)(6486002)(36756003)(956004)(2906002)(83380400001)(2616005)(8676002)(107886003)(186003)(6512007)(6916009)(4326008)(1076003)(478600001)(8936002)(316002)(26005)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S6+zsMqb8UUW9LjQztAYPKUYRhs1BZTCY07poudi1o7bWbDS4/t+Jdj52So1?=
 =?us-ascii?Q?LD+7/OWFUJW3l9vSnztd668gZT7G+cfZwn/bZ1V0aX6D5ZWM+oesvJw4+kcq?=
 =?us-ascii?Q?31ELVRLC40qnqa2Ul0QuhUw8QvkROkvAB6+DIpRaWPWxKoF9tZeh3qqDlLjc?=
 =?us-ascii?Q?yGSDVLKvo0qd6HP/fz3WSPfecWUG0/DyL3/Doa7iDOp4pRzE6e+JTCYnA37A?=
 =?us-ascii?Q?bLnQujECr2/UcJf/AkFUEaDWTRdTYnOXIB/gwXiaxh80VEFSeTuXRP1T9mKA?=
 =?us-ascii?Q?sijLWmSnD1BRniIgj41B20bxuv6teTCbmqEYUg0gT+k/pdMNCZrdYm2a3xM4?=
 =?us-ascii?Q?0xD9anYwUgqOD+Y+CJqwRajVMpqNt7gqb3O5IvBZG7UOp7sr3qnoAJ/PzvW9?=
 =?us-ascii?Q?kgbBZsNmm2fLST5x4Muz/nj5D9NWYij8KIjZOlLlkyqQ4lMWjbTvafpZiMud?=
 =?us-ascii?Q?mlvWCW0qGov4aUWL8Ud67Afegb1f5q2GExPIC+Pl3pKdjNWyTf9VA7gFFYLL?=
 =?us-ascii?Q?h4qumxnlQftlhGSt8dg1/Yi3Rp3hulndUV5VTRjzWhKVuTxZUc/DDOvC5tX5?=
 =?us-ascii?Q?S6oCaR4diMTNF926v7LZGGxKo1fa25WybMAtMl/SqTuV+IBeeJdmzIZlszUY?=
 =?us-ascii?Q?gCSR2Pi1YhwRNdVSccRLSvXzfbHdgnlyTYnHTADqpkOre5m/U3x+2NQcH0lv?=
 =?us-ascii?Q?1h1TM3U2se30V7WQvrCAbQoZqELocBBRyZEXLzqVMQBFa6+xqaSB8G2K9rpE?=
 =?us-ascii?Q?eapjW2W2IX2DnbVMdpUnUDPAbH/SpMloHFj0YgU5vKrYr53Cu9QnKSBHnvYy?=
 =?us-ascii?Q?3gLa5KqWvbJPu+l7cMHvVYvBIlxLJLpsF2yThtCq/b87z06k+IwphiKdgXXX?=
 =?us-ascii?Q?nony+3tenRnKzzch4HueXNwTz2zgFj1NrMtW7mH7MZVv15W0x0d8k29QowHO?=
 =?us-ascii?Q?my6wyGAjuEagKP8eB/spsPI9qoIHNPZa5HWAW7n/pgdDrODXcD5dzWqt/9lA?=
 =?us-ascii?Q?Z/NpZ5Mazxy8gkNbTaZzjCfjU9KpFNFV+FXQYCCQ81O8XO2F2lwPVhv0u8q8?=
 =?us-ascii?Q?PkRbXMAeVUAMvvrPML0NwyBOuDy7+h0TB3YTOKCKyTMjPjWLgzPS58ZD0gsV?=
 =?us-ascii?Q?BqbpYryRfl+loFbMS3oSgRAGCKC/ta1hIrqw0Kf45PP8Q6x3CG+RRPfI/fb0?=
 =?us-ascii?Q?AdDENwcAJdK2EOMqKxiv7P+EAnqZanc9mFNTqTF2To8tCsM0VCiWSFhlcvOZ?=
 =?us-ascii?Q?zEY5iHCi9nDoacG39xl4ttrUR4yo9iG7kFbnLhwzN5+HabFrWATR2si/VLVm?=
 =?us-ascii?Q?5bEXScy+/PQLBWWVILQ3Ie4Q?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48695a3c-e0e5-4308-a4f6-08d94590f063
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 23:58:26.1814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R95gDXz6Zhq1CbHK3ZOKZQ6syOvwdEThUKPftC3m8bHeLfNkqhZdwUxkw2LTMBpFIifnidW6dpzUr2Qk6eSQqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2598
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10043
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=644 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107120162
X-Proofpoint-ORIG-GUID: wiYy0dE39_Dh97i9eCUgNA2bJxK75wMm
X-Proofpoint-GUID: wiYy0dE39_Dh97i9eCUgNA2bJxK75wMm
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Msg L.Addr Msg U.Addr Msg Data   Vect Ctrl
0xfee00000 0x00000000 0x00004041 0x00000000
0xfee00000 0x00000000 0x00004051 0x00000000
0xfee00000 0x00000000 0x00004061 0x00000000
0xfee00000 0x00000000 0x00004071 0x00000000
0xfee01000 0x00000000 0x000040b1 0x00000000
0xfee02000 0x00000000 0x000040c1 0x00000000
0xfee03000 0x00000000 0x000040d1 0x00000000

MSI-X PBA
0 0 0 0 0 0 0

Since the number of MSI-X entries is not determined and might be very
large, it is sometimes inappropriate to dump via QMP.

Therefore, this patch dumps MSI-X information only via HMP, which is
similar to the implementation of hmp_info_mem().

Cc: Jason Wang <jasowang@redhat.com>
Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hmp-commands-info.hx   | 13 +++++++++
 hw/pci/msix.c          | 63 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/pci/msix.h  |  2 ++
 include/monitor/hmp.h  |  1 +
 softmmu/qdev-monitor.c | 25 +++++++++++++++++
 5 files changed, 104 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 27206ac049..ce5c550d44 100644
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
index ae9331cd0b..4b4ec87eee 100644
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
@@ -669,3 +670,65 @@ const VMStateDescription vmstate_msix = {
         VMSTATE_END_OF_LIST()
     }
 };
+
+static void msix_dump_table(Monitor *mon, PCIDevice *dev)
+{
+    int vector;
+    uint32_t val;
+    uint8_t *table_entry;
+
+    monitor_printf(mon, "Msg L.Addr ");
+    monitor_printf(mon, "Msg U.Addr ");
+    monitor_printf(mon, "Msg Data   ");
+    monitor_printf(mon, "Vect Ctrl\n");
+
+    for (vector = 0; vector < dev->msix_entries_nr; vector++) {
+        table_entry = dev->msix_table + vector * PCI_MSIX_ENTRY_SIZE;
+
+        val = pci_get_long(table_entry + PCI_MSIX_ENTRY_LOWER_ADDR);
+        monitor_printf(mon, "0x%08x ", val);
+
+        val = pci_get_long(table_entry + PCI_MSIX_ENTRY_UPPER_ADDR);
+        monitor_printf(mon, "0x%08x ", val);
+
+        val = pci_get_long(table_entry + PCI_MSIX_ENTRY_DATA);
+        monitor_printf(mon, "0x%08x ", val);
+
+        val = pci_get_long(table_entry + PCI_MSIX_ENTRY_VECTOR_CTRL);
+        monitor_printf(mon, "0x%08x\n", val);
+    }
+
+    monitor_printf(mon, "\n");
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
+
+    monitor_printf(mon, "\n");
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
index 3baa1058e2..97c040a3c8 100644
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
index 721dec2d82..7837a17d0d 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
+#include "hw/pci/msix.h"
 #include "monitor/hmp.h"
 #include "monitor/monitor.h"
 #include "monitor/qdev.h"
@@ -1005,3 +1006,27 @@ bool qmp_command_available(const QmpCommand *cmd, Error **errp)
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


