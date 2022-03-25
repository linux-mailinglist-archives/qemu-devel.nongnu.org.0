Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8724E7A66
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 20:24:34 +0100 (CET)
Received: from localhost ([::1]:60004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXpY1-0007el-Pi
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 15:24:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpU6-0007YX-MS
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:32 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:29222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpU1-00036h-Mt
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:27 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PHS8fU031405; 
 Fri, 25 Mar 2022 19:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=O/LD8FzeijjBHt4w2xn2t5nZZdlRJd4UWg3qtwr/if8=;
 b=RzRiEU/aozr7MueLCwkLzvKonbm7OH4XNCyoh9pUnnbzmIBp/W5HnakGdr9OB3Y8W1Uj
 zuCu/0Q7vh8J7HCFz4uC8PUeN76wcUS6bGLfd83L68E84LHcLbJWiQxvR+PrljkL2lrd
 JUHZKuDl2bFGGhddPWDRU9H10GPz9Xi7O6SOIDNfHSWfvtmxXciaHPssiMr2BYOr8/xz
 v9pKU3yhnAbLHpwFKYsmw23GPykcZh/cn2uLUWdR4GI0WgJD5IEzwyLjHUEtSsxkza+m
 H+bkHIriFKQEJEszIejMLymJkVw3YizC2zDYaVaaJjXIwmdLLmD8fukMxUrgxKI+Dd3Y vA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80] (may
 be forged)) by mx0b-00069f02.pphosted.com with ESMTP id 3ew7qtgb2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:21 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22PJGEpm043625;
 Fri, 25 Mar 2022 19:20:19 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2043.outbound.protection.outlook.com [104.47.56.43])
 by userp3030.oracle.com with ESMTP id 3ew49rgq7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xbj2ka5ZwEHBDey/5pAZujpyzCtfTa3Zej7vANfKrJneu9r9/lTNrIvIQMkbRAG+bAVNsdWlN8vQ1rOL3N5Sys0NFOYejtjjBkTqhLasN2XMhjb+DzmcnmTtGxGVxBMDTrQWpkwaPIGWwT/5/5q5ro5XCbLkHHcxAigpb7JcAgRN9YaLSPoilP5BiS7Hzv+pWZh9JhFaaT33/xX+hlWrnn2HV4/WiYkBuR10kx1XPuZqWfhyFuRlBcJC1uh3k5842/g4V0B2dJcKjjh1n556FviDcg2GQfODRAAGG8nJNpFccpMsCnvLSnAF8f9YGIQV9C3E4S0yspk9ITo5o1PZNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/LD8FzeijjBHt4w2xn2t5nZZdlRJd4UWg3qtwr/if8=;
 b=GIVGG1Wq5G+BuHcw68s3nFSV6Ms4swGg4nOln3+PewWyDxBa3yx2UP62m9vb6iTwyoESmKi7D0nf9+UoZtpEkoX3xP7nY53LcGTIwgIv58gq3X6Zz1t40/zoBrql6iFU2PyZDqsiNPat8l9n8gA/mMsnkxs4yGWv5Tr9aLOpfzkSJxcNOT3RvXLZsYuy+i95FXG0dE9TajVLPpdC0P7O4JTmZDSTth239NDpibhHMb9WGWQYH4TNrqGQpBlQbZfu1V0sFFzpnDdeH6SFJVNiObITeT3tpEcESiqHoSZ9wphGj9I5xyjE3p0T7sQYxI31HdhGnSOrFAiXwJbbWrUQMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/LD8FzeijjBHt4w2xn2t5nZZdlRJd4UWg3qtwr/if8=;
 b=KZQ/j9zJZhtMQPu/lWq836rpDsKSU2BTmn5A44IRfR8si2S+qmiM39EM3d8aOREmXwxu/OB4xC+0HM2nCxCLbBWZin4ddI2sMcmsPRLJ8m9Ci2RkTL4nDQ/JdJ1iKXO87Jtwi1X2Uw+dtZU49JzYKD/hnsjP48a1/1WLGV4/KGg=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN0PR10MB5206.namprd10.prod.outlook.com (2603:10b6:408:127::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 19:20:17 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 19:20:17 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 11/17] vfio-user: handle PCI config space accesses
Date: Fri, 25 Mar 2022 15:19:40 -0400
Message-Id: <ec3be300b5fd2d4b7d4e7b2ae72c04cfc2899412.1648234157.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1648234157.git.jag.raman@oracle.com>
References: <cover.1648234157.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR2101CA0024.namprd21.prod.outlook.com
 (2603:10b6:805:106::34) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d56ddc54-12bc-41fa-3d32-08da0e947f03
X-MS-TrafficTypeDiagnostic: BN0PR10MB5206:EE_
X-Microsoft-Antispam-PRVS: <BN0PR10MB52067F318068C37F23C71067901A9@BN0PR10MB5206.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZzNzN5Tzrrnk3ahlg+2oRM3bNrtImlxYMMO8G4ghh3Bz4guSQuhwJwhMiASs98c6XXsWbaXl6PmO4RwfXIaPBQuVF2Uek6OzO8s4Sa2MiAqzVJvl7qwdCV/qrVqwNrNV4okaL1d6znrQkiWverxESTnnA7ufJSLfjl6mv7iLz1chF+6LXBd/FR7p58kwSHknmXLXrW+hfuFJjFASxPyvwYcO5aP8KOoekXOm6FDgmCbQhzsCC1Ut583dqbYdUH1YAqjWkAmibugcgT7K0XXXe+LO4Z9K7qyTIq5rnF5z/aiYu0aGlqkjbzb/1EwwYhU3IjbxzvuC/d3XuSLDQaW8ga8dcA4O5obq4kItrz9TBCsZwY7MMGBfYPY8qHHvVevTLmakx7vHIJE7YXI8MLQsNEaAb5mzzlFW10amLn9BnaGIqBdbjfAeZa+n9tDPBTmJFuaEyT+C1LeQvPeCyz6jgPo8rWEyWc2RU/7UBHod838YuAUD5e29Es4nL4zpBmAHxQ/HvfqJpzvQiiMwz5xHE9v1GoXGxVygc99e1ETDBj6diE7oQgWylLUuXBFFBGwj6q8jmpcRFPBjKVzk2/h7uB8IOc7E3EhaeQAGqWytUJBi79SbGcv0ZOlrc4wk9H7nOxjcPLRObPMET2TH6d0UBL2r6V5pl/JhnBEQdNHc2rR80A8k9MDNLpQw6VI0SmsJCgr3cbcfKDNCZIvZyguYOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(107886003)(316002)(2616005)(26005)(83380400001)(6486002)(36756003)(6666004)(6512007)(6506007)(52116002)(66946007)(2906002)(86362001)(508600001)(38100700002)(38350700002)(6916009)(66476007)(8936002)(7416002)(5660300002)(66556008)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3LinSWChY/RMhD11gJUjQHD9I3L7Q2J0qViI/hnuge8+KvK68LMsaKReenUo?=
 =?us-ascii?Q?g3FUGI9LxQZQV29DgtFFrogYP+8NG2OjZOFTHZHNgz9K20VbFdaiukRwzZoj?=
 =?us-ascii?Q?VmbuvuCx01iNVn1iT9955tFqty6P5adRKZ+wSZRaklbyd8NTLTPGC3gAsmnX?=
 =?us-ascii?Q?YN7KE9II2yAJkzCJX0scbazt69tJ+xm9WWXBksYZsVde7f+Zx5pnVUZxu3w6?=
 =?us-ascii?Q?DHbQV+QYgjDTkUpE93uAluz5DuHInt6IY/BF4qAoEwSs0xFIhpR9hPfQ7Pn4?=
 =?us-ascii?Q?+H1VbxengNKXN3j9/I1x8NtMS4na5Np8GsGTvVdNhQQgnTKE+Igv1GdXkX7R?=
 =?us-ascii?Q?P6cnO94JfKgkI9RAE+CGqS53gkHMHk6r2q3eEFgltD1Jjj4uy8uQN/njfFuJ?=
 =?us-ascii?Q?P+D8ck/gYQDMdMmaRqhpQjDwKq5IjYcfIIReUTwpLOdr9tTOJD+rPRX7bgRN?=
 =?us-ascii?Q?cvwx0nw7EBXZ0bQKD7M/tDP3kpDRSWCXvK6wXlI8abKUXThHVikytXX9ob2I?=
 =?us-ascii?Q?nXZBLDM+wMs2IWL1CcIvXcKAWMb0q4NMw+2FEISc9Uugc40MZa5TpvZDIVeM?=
 =?us-ascii?Q?WD9ZvahanWR4HW9z9k5h3RFApHSdaj1jrPIKwn7rEIuuGYDRTWbmiW7Eae5C?=
 =?us-ascii?Q?vXCLeRtkg/0oS/DoSxgIhkdqt72R25miIMEd8ZVpKQorwnpc9XnDS8EbgYcC?=
 =?us-ascii?Q?5KEphqTN5dsHmIPkT8d+SzHWGVpqvuxE9gfboiQ6aTPaXub4N1DKo/Xx4owy?=
 =?us-ascii?Q?zErHIO9YCGkBl3FEYoslhJTdnbRi8eSyuCGFMsIOQp7I7XauIPKpvdQ99qJo?=
 =?us-ascii?Q?+edXGzdxwS/PCWfZtSdm4mSIG1vRpHpuRlcBNlhYWOLJn0n6Xdp0fQhVbsOb?=
 =?us-ascii?Q?7kNAQcHTFG7OkUfT1hc26TkujM+1BeEpmh+d2cx7tZdxCet1GXtbum9Wp26x?=
 =?us-ascii?Q?swJgHY0y5HLWjtOIGaYvhHEpsKj4cH4pzPyTNqPBqjhxLjBYOsvSMnjvZNXG?=
 =?us-ascii?Q?EC3oM73dNWp/jZUHfPGmuJG/rCR3842NyEiiFthGjvgaWQ5htYZbbXzXpRQC?=
 =?us-ascii?Q?aPqqQVyBfi67EQOUm55STfrB+CNKX471Ae8X1Lu+e5FOMcL/9brsMC/ZnXRb?=
 =?us-ascii?Q?2R0suEkh58Dt29NhjeXhw5Tl1UsOcgFMSQ+7PdO0gtGoS7Js5f+9n4PikxYr?=
 =?us-ascii?Q?o+uR5/o5kbnJ9LSn4oV+rwUEfmiZOF+kiIrcTDXI8f3BIU7bUpfv/8XooWQX?=
 =?us-ascii?Q?hNp4Tg8Wn7G5ph6quvGfiApuurCKWiQRszEK5lEy+Xvsm7BNlGxXEwBuU9z+?=
 =?us-ascii?Q?/2hQndRgeOcMf2Y8wJOc6C2VXhjZyZh9+0pfV2x3wgyG6AoMG3G4fwVMLaoT?=
 =?us-ascii?Q?f4ht1E+oJHUXy5KjPYxdIirZpqJSTGfoFCNNn2+MKviUnsN/TOreXOqP7d6Z?=
 =?us-ascii?Q?xpsgCbEktWslspMbB3z1JDGcCJ+w7MB6223wlKw5ZCon1J2lLF2fbFpai7F3?=
 =?us-ascii?Q?9iYMRzUcE+ydQhoU0beU+FlyepJYkVCdB8JVDbmYzQ4b6KbrwwURYWrb6Kjd?=
 =?us-ascii?Q?c/nyIzfqQ4W2Udh3kru6oXFDZDZcO4PNFGpyXmu4LJuSspac2tC4KTLtPIPh?=
 =?us-ascii?Q?b9+tI8Bykdit9WOjsvNx5ab+ucHnHdlsfMf06PMdIh3oAvAywu6JNgLVEad2?=
 =?us-ascii?Q?EgRINDHGM874KTRiqDON04brthC7G7m/IYud/b+FNVly3bgWOfIdZ4Xxvvv9?=
 =?us-ascii?Q?zH8RxOt4kRukT/GfI0SVQYQZCNQ7G2s=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d56ddc54-12bc-41fa-3d32-08da0e947f03
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 19:20:17.7088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0LGSjazTqAjAhdc18/EFpMh72hc00LFs5pB25wSN44+iiemfFnb1XBWYXRf5tmf+6cm81RzjDyDcFs+H6HOLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5206
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10297
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxscore=0
 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203250106
X-Proofpoint-GUID: SxQcq9lze3_h4RXZdFGlN0csVwqSlNY5
X-Proofpoint-ORIG-GUID: SxQcq9lze3_h4RXZdFGlN0csVwqSlNY5
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, jag.raman@oracle.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define and register handlers for PCI config space accesses

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/vfio-user-obj.c | 51 +++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  2 ++
 2 files changed, 53 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 06d99a8698..7b863dec4f 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -47,6 +47,7 @@
 #include "qapi/qapi-events-misc.h"
 #include "qemu/notify.h"
 #include "qemu/thread.h"
+#include "qemu/main-loop.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
 #include "hw/qdev-core.h"
@@ -236,6 +237,45 @@ retry_attach:
     qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_ctx_run, NULL, o);
 }
 
+static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const buf,
+                                     size_t count, loff_t offset,
+                                     const bool is_write)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    uint32_t pci_access_width = sizeof(uint32_t);
+    size_t bytes = count;
+    uint32_t val = 0;
+    char *ptr = buf;
+    int len;
+
+    /*
+     * Writes to the BAR registers would trigger an update to the
+     * global Memory and IO AddressSpaces. But the remote device
+     * never uses the global AddressSpaces, therefore overlapping
+     * memory regions are not a problem
+     */
+    while (bytes > 0) {
+        len = (bytes > pci_access_width) ? pci_access_width : bytes;
+        if (is_write) {
+            memcpy(&val, ptr, len);
+            pci_host_config_write_common(o->pci_dev, offset,
+                                         pci_config_size(o->pci_dev),
+                                         val, len);
+            trace_vfu_cfg_write(offset, val);
+        } else {
+            val = pci_host_config_read_common(o->pci_dev, offset,
+                                              pci_config_size(o->pci_dev), len);
+            memcpy(ptr, &val, len);
+            trace_vfu_cfg_read(offset, val);
+        }
+        offset += len;
+        ptr += len;
+        bytes -= len;
+    }
+
+    return count;
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -314,6 +354,17 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
                TYPE_VFU_OBJECT, o->device);
     qdev_add_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
 
+    ret = vfu_setup_region(o->vfu_ctx, VFU_PCI_DEV_CFG_REGION_IDX,
+                           pci_config_size(o->pci_dev), &vfu_object_cfg_access,
+                           VFU_REGION_FLAG_RW | VFU_REGION_FLAG_ALWAYS_CB,
+                           NULL, 0, -1, 0);
+    if (ret < 0) {
+        error_setg(errp,
+                   "vfu: Failed to setup config space handlers for %s- %s",
+                   o->device, strerror(errno));
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 7da12f0d96..2ef7884346 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -5,3 +5,5 @@ mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d,
 
 # vfio-user-obj.c
 vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
+vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
+vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
-- 
2.20.1


