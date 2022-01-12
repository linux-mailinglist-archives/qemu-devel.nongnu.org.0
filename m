Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4B748BC6C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 02:28:50 +0100 (CET)
Received: from localhost ([::1]:51282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7SRQ-0001Dx-8X
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 20:28:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Rdu-0001DB-Or
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:34 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:24394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Rds-0005iW-2M
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:34 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BMTaJr005856
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=u1pvYhGl0jgZOCVfiBvl/TtqhtLgfVL0CU92XSG5gV8=;
 b=x2vlxq0azyk7d3j9FYVDUHC0esDl5tiATiR8tuHtYrQhBKD/Rkyq/lueCFJhuiFUJk52
 If19OdJiH5V9+n2dBHH7z+MdFJXQvRtcGBDUhcRHRmc0zPj5n/Ik/ACuv+ORjtlMEGix
 OGrMf1srGJ9mbhECqu5sHLBaaL93iZzBKNf9nKvPXbUhmFv242ludKWdcs+lRD5h5Iv1
 obTAjFzOOBvFzdWc+JIQpx687uwLPLGrumfRMN7P/BdiU5dJqJI6cTO5kwWxCnuhrwLi
 ZOEXuQxorcBGkPvl2AyOVz6AlxYN1/RIS24L+sDNlRg3rXALnyDxUwvo8zFehT85+Gnv pQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgjtgd1w2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:20 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20C0KAjC069368
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:19 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
 by userp3030.oracle.com with ESMTP id 3deyqy1gqq-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lk0sA1w7u/px0EdOpiBzPN5xhayzA4KwoRShIm/kz8yPZKN/adIoy9kN0vn96kBuZalirHryYypVxm6qvw/pAsWnB+Gg2f0gq6A9r1pn4O82A+1rBsJ+rGx5qvqA0vtkZnT6B0DA4fJDwCqIJTyR/VAdpRC43gIZqPT93dybzKP69J9Fq0GuNM/89+if2spNGtbB89mRzNPRjKXOxlbH9No5OUxSM0kcQHi6rSTJ69/5yDkhgtG3RSdHw2w+y8h1rdOtYZNZbjZh1pE6fSmoWAOnyUBuMrgbZ4fnaDuMvC90lN/Lhyu7POTJQNKUGtJSt4UQnZ4J0NuppLO/XzKjJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1pvYhGl0jgZOCVfiBvl/TtqhtLgfVL0CU92XSG5gV8=;
 b=OF5h3Tp2LiwHQ2YbaGdpfQL5iIvnlB5GrTW/iSelDYI0iE5mlulR5ZkiB63uGEwVCBJ9K0iYv3jVzjQIUL7A73HIUsUKzPdoO0goYkE5btTIotzcjJvQsqp7NJDS05iSkzgr1qbU2t7qx98a7r3MwL6raa81Vag3h9uAMaiZV8JHruOaEHGW+MSZByJDxmP0nt6RX4zzYHkIJCIZtHkpuswC/MfKXmaaseWWokw2lqGDZAXT5XE0n1+JEju42D2+2YBljEdUK9IocWeN/QcwI0FZDXMkAllZsQuHFqS3uzdLIur/STcl8DHP5enWrUp6wJj6wDsVhhsufojQUIpARg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1pvYhGl0jgZOCVfiBvl/TtqhtLgfVL0CU92XSG5gV8=;
 b=QoCmOgCxFvw88IaNLNm8lxkKL0sH/D6hO9tPYaFZi7W1/MZM/Exg2VnhnEir1eHz+s8J8Jog9rCYQUhsYyO4E+g6iuahi6cmjVc9Es5DMypvzr/+muH8nlYfnMjjMJQo/B71ASSU2Qneo4H3HrEildWo17KLh6mbdQdGC8NRAYg=
Received: from PH0PR10MB4679.namprd10.prod.outlook.com (2603:10b6:510:3c::15)
 by PH0PR10MB4742.namprd10.prod.outlook.com (2603:10b6:510:3f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 12 Jan
 2022 00:37:09 +0000
Received: from PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b]) by PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b%3]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 00:37:09 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v4 20/21] vfio-user: migration support
Date: Tue, 11 Jan 2022 16:43:56 -0800
Message-Id: <27b636c6c861e0a05278e2d1cbf07d3adec2d505.1641584317.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1641584316.git.john.g.johnson@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::16) To PH0PR10MB4679.namprd10.prod.outlook.com
 (2603:10b6:510:3c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d20501ad-735c-4b3d-d9c2-08d9d563aab2
X-MS-TrafficTypeDiagnostic: PH0PR10MB4742:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB47424D2C1EAC5DEDCBF0FA9CB6529@PH0PR10MB4742.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:33;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tVAcg5AxVR0JqQoy7wk0lGICis7VMSBqAOqAV2wmAgJfyB4SxQFAhPigYkDQCWX9XbcpHtb1j03pQpkdYQ8TlLYPUzmvx+CwBJlOfbbBsUWNXMzSSbmQiQszhlY4xevpBIc6KA+WaihLMyWSm6yNB3U5KXwX6N/snSg3lL96C7bntf2MnSKR99EOaFchvLT9RLwOlC726fBImvkbj46tLH32r9CAn+dBi5Cc3TAtV2UHpkuKdDonW71IQUMJdHN/niSx4FgsDt2DHehJf3RvwNKDjguP0X3emzeKjiva0ZOGbPD9QW/nyFYfG/muUOFwzjnh5vnaPMOR3Stw+NkiK+3fOL8qWKvvROtFQ6scWPKf8V/kaMZ0jVSncflVSdP9KLyHf3G0OXebTNHgjuw2EE7svT/J427FCD0V4XDYf0nU3rCaVE6MCuUYliGpSNzMnH/Nt9ZT7S3Htp4mGkQpR6yNOaxoAzzcWQTL3GDABgLjAZ2oNYviVu1HwBe0it9C6jSJlIDG3RD4VnaLGfPc4DODreuHb7GcriW9Qlw2DteDhgVv+H++UnoBS3Z5Wpjy8fN9Fg/eQALiUahBFQG4uwoqI9bO3tBY8P2z8vS4DgOlc9xRWLuzZdSWmiKZxKrfkAgK6oV3tZJ6QZxSzXLXC13IkxRu47BWC1v83xPNhjLLHW6bkWoaaFQZGo4Dm3e9k5Dl3W24xw5XQdIFCXUy8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4679.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(66556008)(36756003)(508600001)(6486002)(6916009)(66476007)(52116002)(186003)(8676002)(2616005)(316002)(8936002)(6666004)(83380400001)(6512007)(5660300002)(38350700002)(86362001)(6506007)(2906002)(38100700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PRmV5S78nZG9MLzCYOvLC5QNMuQPQrziyJD12ObguA5npj12r5KufQtvc6to?=
 =?us-ascii?Q?mtrd3ZXpvxC7r0VIEWARPsWVIoeRlPjafgQNZ0nAsDG8nMt9dTN5fuFSTqsS?=
 =?us-ascii?Q?oeFSWSeQFiG3Nte4Ng+qI+OXvu3V0QLn0w+I9KGi/BtWFuoA7nORd2gLwxfS?=
 =?us-ascii?Q?d3efGMm2xtWx9RpIfLLb4qhHXtnJBEIo+fyl+X9GPf50arOIA0njRmSCTnu/?=
 =?us-ascii?Q?u6GZSOjuQv3f6+1cK7ecL4syvIOFAk8dvdHsqzpupSs189akjLBybBR4LRv4?=
 =?us-ascii?Q?vEIwDFEv/aktAONodW+1ALyizjMGA0NJxW7hG0vBIJXTTNhrttdKDbE2KWfT?=
 =?us-ascii?Q?DBs1pyqwkxa2s+wBA74SFOM1d1M/nGBHC6cbHJXPUK7c4uKuuaR3Rab3WKzE?=
 =?us-ascii?Q?ru+gY+U/51fYYDlUPnc7h85NoeiJz7WFXseCrShVzw5sDyUNdszhRx25K24q?=
 =?us-ascii?Q?C0OPMrGbl6CRUmnqnlZfZzioXNqX8szGvDE+1z7jmw7xa83Ws3NyFWQo0oWd?=
 =?us-ascii?Q?XlAgV7NW0l9e5EGEHMvJg17SXftzJv+tclPRHfWfHs9g6vWg+RyViYlSo4Za?=
 =?us-ascii?Q?huzmQ3J0WTY/lKu6+nBs8OizjGLBmQgYQVZGKqZHpLyT8LdLjY9S1Gh79elr?=
 =?us-ascii?Q?AS1/tan5M/IrgP93paPXCPpHEuRoPHyEmeW3/9uL/WBOcYKsI23818IIY4rL?=
 =?us-ascii?Q?RbqXkHrJaISFj7yitVqyFD9CsiBAPV5GACndcllOysZFjlt122QWZlGqzkdJ?=
 =?us-ascii?Q?3rs4JP3bfLldTwOSPWKcrWXmy/ZwAPUNFDKsr2c0lU89tzzt2WrHWEhh2d3Y?=
 =?us-ascii?Q?ja1iSDzSivAp51FCEezjdK1zQfBILfbQX7RIQ5hiA6ShupokyOXoKj9FEU+g?=
 =?us-ascii?Q?AXAOUzpo2S1yW5UZU0RNFrrpJMM+hCE0nYj5tFRrQyUf3WVV+lyxZM5sVNa2?=
 =?us-ascii?Q?lo5l7XmEpmNlU2JXCegLB/2j3nTr7+LcEtE/lYj2ylELzBsXz7Ong70oC9n2?=
 =?us-ascii?Q?vEUeKCevfrnuBnYg0kjbGbosZ/sE0mTkJqYpL1hJXzZFD47kkIga8t5WgkCF?=
 =?us-ascii?Q?np+tqCXD/8QYgvCHMr9BidPWusSxdH1g8Lwcvamudah3r072PBHTqT0UAlPU?=
 =?us-ascii?Q?xXet3MccoPD68W6QZLvsg4SG1/M3fJO/cyD0+boAU7b7VsFCX5VvGrjpnk5Q?=
 =?us-ascii?Q?WdJoBo29Ndelc10PzkwKfP+asZIe+idA9hxEpns1SK8rwHki3hkTzYbkx+0C?=
 =?us-ascii?Q?AmU04bhypTv40WPOA6+y3bNrJb5jFRUFWtF6A/+vaRKD3Of0WwZBrMWb0kwi?=
 =?us-ascii?Q?oH+Vv6aT7aizsHOPminKMeBzWQjBwrzNzq6Uz8AQxr1agisUzMLx5+UpR5or?=
 =?us-ascii?Q?3yk/fHoKwr9hdTntabvOAYvqIHhoiToqTWCBoNjppRx7ycBGHMkv9JJmA2gJ?=
 =?us-ascii?Q?JHj1KNrqp7Jt9aqLyMpnANWLfUUUU4ERfFDNha27H3V0nkNFogi6S7L4ZB9Y?=
 =?us-ascii?Q?vq1+QvDI5rAto+yrazxPXrOdbFJkqdgwh5hXAQ1my4J/eDZVK2UKYiTDcgOt?=
 =?us-ascii?Q?UkUCkupdoUERVi6MkXOiH8VoxvpHlcJ6YsDoowvLnyB0E8LYXNA6ipd2KBgj?=
 =?us-ascii?Q?H3nyUj4BFDpPMjraTxkRwr5yORmpL278VGjzdhRkYcKrj32JLG6AbeDiis4v?=
 =?us-ascii?Q?bRyqYw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d20501ad-735c-4b3d-d9c2-08d9d563aab2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4679.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 00:37:09.2743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QM/EC0Yn+f7A64rpaCS4tBiKqO0nJuinnRRAqa2Zx5cti26gpcDk1GIaRp1P3TAjtrivgO0IW6oiARIFN+T8lA26TIUrhQJCJh3SuVE3Yeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4742
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10224
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120000
X-Proofpoint-GUID: RqVx63hvy0CwGwmzZA560mYX7WXUAOab
X-Proofpoint-ORIG-GUID: RqVx63hvy0CwGwmzZA560mYX7WXUAOab
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user-protocol.h | 18 +++++++++++++++++
 hw/vfio/migration.c     | 30 +++++++++++++--------------
 hw/vfio/pci.c           |  7 +++++++
 hw/vfio/user.c          | 54 +++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 93 insertions(+), 16 deletions(-)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index 8932311..abe7002 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -193,6 +193,10 @@ typedef struct {
     char data[];
 } VFIOUserDMARW;
 
+/*
+ * VFIO_USER_DIRTY_PAGES
+ */
+
 /*imported from struct vfio_bitmap */
 typedef struct {
     uint64_t pgsize;
@@ -200,4 +204,18 @@ typedef struct {
     char data[];
 } VFIOUserBitmap;
 
+/* imported from struct vfio_iommu_type1_dirty_bitmap_get */
+typedef struct {
+    uint64_t iova;
+    uint64_t size;
+    VFIOUserBitmap bitmap;
+} VFIOUserBitmapRange;
+
+/* imported from struct vfio_iommu_type1_dirty_bitmap */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+} VFIOUserDirtyPages;
+
 #endif /* VFIO_USER_PROTOCOL_H */
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index ff6b45d..df63f5c 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -27,6 +27,7 @@
 #include "pci.h"
 #include "trace.h"
 #include "hw/hw.h"
+#include "user.h"
 
 /*
  * Flags to be used as unique delimiters for VFIO devices in the migration
@@ -49,11 +50,13 @@ static int64_t bytes_transferred;
 static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, int count,
                                   off_t off, bool iswrite)
 {
+    VFIORegion *region = &vbasedev->migration->region;
     int ret;
 
-    ret = iswrite ? pwrite(vbasedev->fd, val, count, off) :
-                    pread(vbasedev->fd, val, count, off);
-    if (ret < count) {
+    ret = iswrite ?
+        VDEV_REGION_WRITE(vbasedev, region->nr, off, count, val, false) :
+        VDEV_REGION_READ(vbasedev, region->nr, off, count, val);
+     if (ret < count) {
         error_report("vfio_mig_%s %d byte %s: failed at offset 0x%"
                      HWADDR_PRIx", err: %s", iswrite ? "write" : "read", count,
                      vbasedev->name, off, strerror(errno));
@@ -111,9 +114,7 @@ static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t mask,
                                     uint32_t value)
 {
     VFIOMigration *migration = vbasedev->migration;
-    VFIORegion *region = &migration->region;
-    off_t dev_state_off = region->fd_offset +
-                          VFIO_MIG_STRUCT_OFFSET(device_state);
+    off_t dev_state_off = VFIO_MIG_STRUCT_OFFSET(device_state);
     uint32_t device_state;
     int ret;
 
@@ -201,13 +202,13 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
     int ret;
 
     ret = vfio_mig_read(vbasedev, &data_offset, sizeof(data_offset),
-                      region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_offset));
+                        VFIO_MIG_STRUCT_OFFSET(data_offset));
     if (ret < 0) {
         return ret;
     }
 
     ret = vfio_mig_read(vbasedev, &data_size, sizeof(data_size),
-                        region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_size));
+                        VFIO_MIG_STRUCT_OFFSET(data_size));
     if (ret < 0) {
         return ret;
     }
@@ -233,8 +234,7 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
             }
             buf_allocated = true;
 
-            ret = vfio_mig_read(vbasedev, buf, sec_size,
-                                region->fd_offset + data_offset);
+            ret = vfio_mig_read(vbasedev, buf, sec_size, data_offset);
             if (ret < 0) {
                 g_free(buf);
                 return ret;
@@ -269,7 +269,7 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
 
     do {
         ret = vfio_mig_read(vbasedev, &data_offset, sizeof(data_offset),
-                      region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_offset));
+                            VFIO_MIG_STRUCT_OFFSET(data_offset));
         if (ret < 0) {
             return ret;
         }
@@ -309,8 +309,7 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
             qemu_get_buffer(f, buf, sec_size);
 
             if (buf_alloc) {
-                ret = vfio_mig_write(vbasedev, buf, sec_size,
-                        region->fd_offset + data_offset);
+                ret = vfio_mig_write(vbasedev, buf, sec_size, data_offset);
                 g_free(buf);
 
                 if (ret < 0) {
@@ -322,7 +321,7 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
         }
 
         ret = vfio_mig_write(vbasedev, &report_size, sizeof(report_size),
-                        region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_size));
+                             VFIO_MIG_STRUCT_OFFSET(data_size));
         if (ret < 0) {
             return ret;
         }
@@ -334,12 +333,11 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
 static int vfio_update_pending(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
-    VFIORegion *region = &migration->region;
     uint64_t pending_bytes = 0;
     int ret;
 
     ret = vfio_mig_read(vbasedev, &pending_bytes, sizeof(pending_bytes),
-                    region->fd_offset + VFIO_MIG_STRUCT_OFFSET(pending_bytes));
+                        VFIO_MIG_STRUCT_OFFSET(pending_bytes));
     if (ret < 0) {
         migration->pending_bytes = 0;
         return ret;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index d47b98e..598e9ed 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3677,6 +3677,13 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         goto out_teardown;
     }
 
+    if (!pdev->failover_pair_id) {
+        ret = vfio_migration_probe(&vdev->vbasedev, errp);
+        if (ret) {
+            error_report("%s: Migration disabled", vdev->vbasedev.name);
+        }
+    }
+
     vfio_register_err_notifier(vdev);
     vfio_register_req_notifier(vdev);
 
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 33d8f06..2eac62a 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -1410,6 +1410,52 @@ void vfio_user_reset(VFIOProxy *proxy)
     }
 }
 
+static int vfio_user_dirty_bitmap(VFIOProxy *proxy,
+                                  struct vfio_iommu_type1_dirty_bitmap *cmd,
+                                  struct vfio_iommu_type1_dirty_bitmap_get
+                                  *dbitmap)
+{
+    g_autofree struct {
+        VFIOUserDirtyPages msg;
+        VFIOUserBitmapRange range;
+    } *msgp = NULL;
+    int msize, rsize;
+
+    /*
+     * If just the command is sent, the returned bitmap isn't needed.
+     * The bitmap structs are different from the ioctl() versions,
+     * ioctl() returns the bitmap in a local VA
+     */
+    if (dbitmap != NULL) {
+        msize = sizeof(*msgp);
+        rsize = msize + dbitmap->bitmap.size;
+        msgp = g_malloc0(rsize);
+        msgp->range.iova = dbitmap->iova;
+        msgp->range.size = dbitmap->size;
+        msgp->range.bitmap.pgsize = dbitmap->bitmap.pgsize;
+        msgp->range.bitmap.size = dbitmap->bitmap.size;
+    } else {
+        msize = rsize = sizeof(VFIOUserDirtyPages);
+        msgp = g_malloc0(rsize);
+    }
+
+    vfio_user_request_msg(&msgp->msg.hdr, VFIO_USER_DIRTY_PAGES, msize, 0);
+    msgp->msg.argsz = rsize - sizeof(VFIOUserHdr);
+    msgp->msg.flags = cmd->flags;
+
+    vfio_user_send_wait(proxy, &msgp->msg.hdr, NULL, rsize, false);
+    if (msgp->msg.hdr.flags & VFIO_USER_ERROR) {
+        return -msgp->msg.hdr.error_reply;
+    }
+
+    if (dbitmap != NULL) {
+        memcpy(dbitmap->bitmap.data, &msgp->range.bitmap.data,
+               dbitmap->bitmap.size);
+    }
+
+    return 0;
+}
+
 
 /*
  * Socket-based io_ops
@@ -1530,6 +1576,13 @@ static int vfio_user_io_dma_unmap(VFIOContainer *container,
                                container->async_ops);
 }
 
+static int vfio_user_io_dirty_bitmap(VFIOContainer *container,
+                        struct vfio_iommu_type1_dirty_bitmap *bitmap,
+                        struct vfio_iommu_type1_dirty_bitmap_get *range)
+{
+    return vfio_user_dirty_bitmap(container->proxy, bitmap, range);
+}
+
 static void vfio_user_io_wait_commit(VFIOContainer *container)
 {
     vfio_user_wait_reqs(container->proxy);
@@ -1538,5 +1591,6 @@ static void vfio_user_io_wait_commit(VFIOContainer *container)
 VFIOContIO vfio_cont_io_sock = {
     .dma_map = vfio_user_io_dma_map,
     .dma_unmap = vfio_user_io_dma_unmap,
+    .dirty_bitmap = vfio_user_io_dirty_bitmap,
     .wait_commit = vfio_user_io_wait_commit,
 };
-- 
1.8.3.1


