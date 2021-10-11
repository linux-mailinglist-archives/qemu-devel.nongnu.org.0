Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F47428666
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 07:42:29 +0200 (CEST)
Received: from localhost ([::1]:55876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZo4y-0007hS-O6
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 01:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mZnup-0002rg-Qb
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:32:01 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:37564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mZnun-0005aM-5U
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:31:59 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B2iJpN004469; 
 Mon, 11 Oct 2021 05:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=Vi9PKes132A3iAv2VPOldOG/+O0grE3rrtKOITb32a4=;
 b=KAJgZjlYD4OEXmQuOKjm2MEYhddRAUM+rCuIU4ddlpvEnvp/ZSDeXex1h8G0wi3O//5C
 jWLnsIMBtHGnzzy06Xe6vJK2xGvVq7Y6M2ED8MRVCHXuljVDmQo4zczBlgjbrIkQKzgy
 s5lw9BnGigabt5xktm99L/iBCatZsDN3JK4SlvXmixaoVzpgjwW6WEBpyarE/bqjUjG7
 Y+o/vWbjEB8Jh2OQoK1myBV93hUw2Yr6buztQaTBMSMd4AdSsA5NraeeSCOiODckAL3/
 Cl8F/ZbSHEAs7aBOVhp8mb35Vha3Thow7YLerinP0X9Wna1dSDi5lJP/zkAvb71AjCmC Hg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bkxs59tk5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 05:31:55 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19B5V1dN064299;
 Mon, 11 Oct 2021 05:31:54 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2048.outbound.protection.outlook.com [104.47.51.48])
 by userp3030.oracle.com with ESMTP id 3bkyv6eyqm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 05:31:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2sjVSHAs3s6LHWV5osk8YDR4cP68Y9CNnXXbS+rCiW3ner3MIILzQaUoBfMqfIFKQ2Nd4yJglsm7iZMH+QLDJofVSbnvpr7ixnPTxSnrixDA477T1uoIbjM2MKbkVvk3H5ouuEiSonFYjeBvXJAgjyWKLk5N24lYFz416FErwuEymVzzMVI15KeOxLbjpjk/Hz+MSYPEnbIjrnliA1cn0JjgX5sUiwDDO0Pbh+9JvQfnTpsx4YXUBg1P6MZj7SDEUBWgJXuBZRf5ycB57+lPaV7BoDCm9jU1PGONNcbX3H8dw+C4E8Z05dnOdE6/W0tAKJRDUUj99/8j5ltgyXv7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vi9PKes132A3iAv2VPOldOG/+O0grE3rrtKOITb32a4=;
 b=bBLSzNgFjTUE5RBayALxoEDsa/RL/ehRCPFPaCt5MPwgZCnGrg8U+5Zrhnjc2iVtahB1GPBKTlU5pDDQ8VedlpU0fzyW/BRmgfGsFo3RIltp3Bvu/ZhE7I6DOx6ADdVsD4RlzZohzeDfwPGqrW/P8b5tA35Q+3U7I5jeNdFCSk9Hm9kC91wZpLyq9+ugpYvjlLqkGGXM4nefJ1hHdiEb6TXgExflUw+uMOQWRezxOQTOmHrclD0FP5iEGxhiCNqtpYJVAaaO1EZzphvYKw5AZaNRUbUhTXsvVsJqyq3f+I5dRZ+B+fKIzcugIOqbUTjftT4Hr1+BfBHMPrjDYuFa2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vi9PKes132A3iAv2VPOldOG/+O0grE3rrtKOITb32a4=;
 b=zAoNxPBBsC0y5pPGkUKsMzK5StFZ5t4/0ejJekmm2dAveE0lJHRx/HuLyB4U4q2FsRQXG+vZfrLHw8/GzdAbAqQTxwuPwBM6sTeE6eSpZeOhOFSbimuYAG574A5f/5GVxzdPJvjxeK0kYj99uD8srHi4TO6Vrtj0HYKC5TIM1XY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3775.namprd10.prod.outlook.com (2603:10b6:208:186::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 05:31:52 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca%3]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 05:31:52 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/12] vfio-user: handle device interrupts
Date: Mon, 11 Oct 2021 01:31:15 -0400
Message-Id: <3ce682409fbb7ba8ecb26e3d1491f5250dceb0f4.1633929457.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1633929457.git.jag.raman@oracle.com>
References: <cover.1633929457.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0072.namprd17.prod.outlook.com
 (2603:10b6:a03:167::49) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
Received: from jaraman-bur-1.us.oracle.com (209.17.40.40) by
 BY5PR17CA0072.namprd17.prod.outlook.com (2603:10b6:a03:167::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 05:31:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1af8056-3209-4f99-6296-08d98c786e17
X-MS-TrafficTypeDiagnostic: MN2PR10MB3775:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB377594AE91394627E8CD074C90B59@MN2PR10MB3775.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:459;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P26lVKOyDSg7rQGBJ/rPNRAo7RkIbV6mQgDYhSPMsk7jal3bNUmerbIH4UkhXMZU2xZUdzSSUEDbuxJjvkB+65UMtTRpuomZaok1dQvnvPtoWlZgj5dMEDiovPTrIAuWyf0qZ7WEnSIOYoT3HXZD5cIJ1x0NnWESLli87e9OduLR0v0KXbqnLfZN6Vkw7A2yMXCvUqmcLLsSgBV4/rjg5mTr8tusuLTfyw6RnLDNtgBODcsv0pvfKiZPvrzroFcYlfMf7Vq9PueM6hPe/dJ+fUV6updNCuVAaMOXrBYiNNjY3rC/AKGyH07v+Xa+lvvqnN39vFBZ4l634kK5wopapACUGA8T9PrKgWTCMHJkYISI+buKLGuIIhBD85nsfCPxzDxpN0WeO44dJM5NdWdLhNekcvoCI/sBt98HIlzc9osDYn2OkvdJt07rv9USP/KCjvYiOs8F9d6kVC8dFDaQ6si+oYw4zhQY4iUWj0ijqCQX2x3jliWR/nAp9tLztssOxdLumMa3siSnQ+Dg7inii/o5A/WlOVdvaQMld478e7hkdUgB+W4INxK2Qdqon7FF2OQpv8DmdWKcdi4/cCRXUuZFGtG4+UBf8AODlR1LNGwePjLM5oJaWkdvHYR3RA2mWVyKj4cLZkY5jSErtgbrzngzQWBSJnGhjcKxHt+vcE5gp7zVC2nTjXIJi7uzaobWyPC+SG5LnkUvZBNEWES3rA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(316002)(8676002)(36756003)(66476007)(956004)(66946007)(6486002)(7416002)(4326008)(2616005)(508600001)(6666004)(5660300002)(8936002)(7696005)(52116002)(6916009)(2906002)(107886003)(186003)(26005)(38100700002)(38350700002)(83380400001)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gZakfl9vFA254xDj/OUPUbODFlnKXD9qQDX0aMcN4/WQA/uih2CqcSokRSin?=
 =?us-ascii?Q?rDcG70+WTrPggw+D+/vNVIEHpAAvAYtYh+CMQ6hN30+jBFKAt2rc7giT5R7k?=
 =?us-ascii?Q?tkjsIefPHH86QanecOxROsOfkkWU+UvgX0RNbeCG9lLAQHSOteNSZLuuk+ri?=
 =?us-ascii?Q?CikEIZ4VqpjH6aUAhlpfvOHDGKqOhmdI8XsQBJ0L89Ix8loqSl5PAN2dr66S?=
 =?us-ascii?Q?vMzODO+HwsAAE1eo7wzcztEs/SWOPftPkkyoI+lsnA7ETy6uieoMjgBpyZ0K?=
 =?us-ascii?Q?gH1JoJl3Wz6F9PdjvqoWDKJLrSfLhUrbKXf7Ec1KwP8AKxK2rwB5qrjCERdu?=
 =?us-ascii?Q?DNb4gmNp3Cj36ncr4XhY+kM5NnRgGl6iMEoNBzlSY43HlQfmXDGIP6/nMvCB?=
 =?us-ascii?Q?oIU073r1cuWqrOhFgFZsmqwDK3YNRGmkoXS9nSnTgxjUgw9AekO41+Jj5AO6?=
 =?us-ascii?Q?bIe8H3kbqFeb45o8L0wYbhnDstTn6/mG+PdlK3/8Dt9obmHhVSj4pQ5J7vQs?=
 =?us-ascii?Q?pt4bDKTsWeB0M9/0rs4THfhKvRYtdSKv15dO4lX52dGr7e0rCUjpAj3YN3AY?=
 =?us-ascii?Q?AsAd6Yt8xdD3k/j4qx0X9z5tyXPWOKgv+1AyafID+XSZ0A10HzDRgVY79J1G?=
 =?us-ascii?Q?wMKbmOfUsm3Tr8K7a2uU0vFN79hi8TqbH16T/77RD6b1YwdlYJ7PjSTBGNd4?=
 =?us-ascii?Q?AvYBtnH2v5wZSGbSY95/qdREk6peuOAogOF/Q47F013KIIu36v41nbHc2EPQ?=
 =?us-ascii?Q?euXavhLCUut+hBf6HBPJsJQc2tEMJc6/YJdJEQUqnJpeNC/8GuCzwINQnK13?=
 =?us-ascii?Q?xl/T2NRoNUrnAhktwjAcrU+opxDu1lj9tOJ19Hb9cAgfCunO5DDs1H/IQMJs?=
 =?us-ascii?Q?qmzMwT8m4FgI8jAyKgW04CEcv8tcqba6t8V/26LluI4u4I4QR2mvgBp9xPxH?=
 =?us-ascii?Q?5MMnmeeFXUlWbXw+zbb5ehnzSIguNQtzI1wiyNGDJrtvWeamSdUzpo3brsxM?=
 =?us-ascii?Q?5v651FZOHL892akTjo/bmNMFbQcB38tAnOe6dHiLadp4HYIRTGJUPs7qgZrl?=
 =?us-ascii?Q?YLTvOaN9APWIsaborv8G2lcEE7aSgoU3NLnNL8dnXF+OLJ/E5ZDboBFmnvZw?=
 =?us-ascii?Q?G/31rNVpIoucLgsBy7MGNHITVWnxcQf3SvxPYVb9lo35GbuE/3Ec2fNobCXS?=
 =?us-ascii?Q?JfipKTdQTTfGv7iCgWOkJiVVMna0kXZrb7ynOG3eFsX44hYabEKVrDS2H0Ef?=
 =?us-ascii?Q?MGvHwAZvjT+5I2Sf6/L4rolYybxeetVsfhYNX+Hh6JUpa6kvTwyz8lqR7Idd?=
 =?us-ascii?Q?OT1T/HuoTVYzAzymBM5H/K3n?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1af8056-3209-4f99-6296-08d98c786e17
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 05:31:52.2675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNVtxhKm+dCcugBEGfFicOagK0BG2273KhaC+IvEwVHLSTa2PUw6zzT768mWJHAg3UN9/IE5WvXdWRrPPz7LZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3775
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10133
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110110032
X-Proofpoint-GUID: l4sVjyn6VL2F4Z8AFC8vp-aU7s8NrI0Q
X-Proofpoint-ORIG-GUID: l4sVjyn6VL2F4Z8AFC8vp-aU7s8NrI0Q
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, swapnil.ingle@nutanix.com, john.levon@nutanix.com,
 philmd@redhat.com, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Forward remote device's interrupts to the guest

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/iohub.h |  2 ++
 hw/remote/iohub.c         |  5 +++++
 hw/remote/vfio-user-obj.c | 28 ++++++++++++++++++++++++++++
 hw/remote/trace-events    |  1 +
 4 files changed, 36 insertions(+)

diff --git a/include/hw/remote/iohub.h b/include/hw/remote/iohub.h
index 0bf98e0d78..d5bd0b08b0 100644
--- a/include/hw/remote/iohub.h
+++ b/include/hw/remote/iohub.h
@@ -15,6 +15,7 @@
 #include "qemu/event_notifier.h"
 #include "qemu/thread-posix.h"
 #include "hw/remote/mpqemu-link.h"
+#include "libvfio-user.h"
 
 #define REMOTE_IOHUB_NB_PIRQS    PCI_DEVFN_MAX
 
@@ -30,6 +31,7 @@ typedef struct RemoteIOHubState {
     unsigned int irq_level[REMOTE_IOHUB_NB_PIRQS];
     ResampleToken token[REMOTE_IOHUB_NB_PIRQS];
     QemuMutex irq_level_lock[REMOTE_IOHUB_NB_PIRQS];
+    vfu_ctx_t *vfu_ctx[REMOTE_IOHUB_NB_PIRQS];
 } RemoteIOHubState;
 
 int remote_iohub_map_irq(PCIDevice *pci_dev, int intx);
diff --git a/hw/remote/iohub.c b/hw/remote/iohub.c
index 547d597f0f..94102338a8 100644
--- a/hw/remote/iohub.c
+++ b/hw/remote/iohub.c
@@ -18,6 +18,7 @@
 #include "hw/remote/machine.h"
 #include "hw/remote/iohub.h"
 #include "qemu/main-loop.h"
+#include "trace.h"
 
 void remote_iohub_init(RemoteIOHubState *iohub)
 {
@@ -62,6 +63,10 @@ void remote_iohub_set_irq(void *opaque, int pirq, int level)
     QEMU_LOCK_GUARD(&iohub->irq_level_lock[pirq]);
 
     if (level) {
+        if (iohub->vfu_ctx[pirq]) {
+            trace_vfu_interrupt(pirq);
+            vfu_irq_trigger(iohub->vfu_ctx[pirq], 0);
+        }
         if (++iohub->irq_level[pirq] == 1) {
             event_notifier_set(&iohub->irqfds[pirq]);
         }
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 4c9ed1543c..63c468d6f3 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -48,6 +48,7 @@
 #include "libvfio-user.h"
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
+#include "hw/remote/iohub.h"
 
 #define TYPE_VFU_OBJECT "vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -325,6 +326,26 @@ static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev)
     }
 }
 
+static int vfu_object_setup_irqs(vfu_ctx_t *vfu_ctx, PCIDevice *pci_dev)
+{
+    RemoteMachineState *machine = REMOTE_MACHINE(current_machine);
+    RemoteIOHubState *iohub = &machine->iohub;
+    int pirq, intx, ret;
+
+    ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_INTX_IRQ, 1);
+    if (ret < 0) {
+        return ret;
+    }
+
+    intx = pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
+
+    pirq = remote_iohub_map_irq(pci_dev, intx);
+
+    iohub->vfu_ctx[pirq] = vfu_ctx;
+
+    return 0;
+}
+
 /*
  * vfio-user-server depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -394,6 +415,13 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
 
     vfu_object_register_bars(o->vfu_ctx, o->pci_dev);
 
+    ret = vfu_object_setup_irqs(o->vfu_ctx, o->pci_dev);
+    if (ret < 0) {
+        error_setg(&error_abort, "vfu: Failed to setup interrupts for %s",
+                   o->device);
+        return;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(&error_abort, "vfu: Failed to realize device %s- %s",
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 847d50d88f..c167b3c7a5 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -12,3 +12,4 @@ vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
 vfu_bar_register(int i, uint64_t addr, uint64_t size) "vfu: BAR %d: addr 0x%"PRIx64" size 0x%"PRIx64""
 vfu_bar_rw_enter(const char *op, uint64_t addr) "vfu: %s request for BAR address 0x%"PRIx64""
 vfu_bar_rw_exit(const char *op, uint64_t addr) "vfu: Finished %s of BAR address 0x%"PRIx64""
+vfu_interrupt(int pirq) "vfu: sending interrupt to device - PIRQ %d"
-- 
2.20.1


