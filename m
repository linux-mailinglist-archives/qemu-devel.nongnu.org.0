Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D25C51C688
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:48:44 +0200 (CEST)
Received: from localhost ([::1]:58862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfal-00026X-GR
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0z-0006B3-Uo
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:45 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:63340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0t-0002Cj-NJ
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:43 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245FTeZe018676
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=0riSyXkpF6nuhVPb7+9TleWWgExFSznktzTyiNbDdNc=;
 b=AyqS3a9jn7aUJvdg4kVMqmKmXZcFs75SFhpOV39VSrsaRYVX9763eiB+e8wwIsNh7LU6
 HFFNnlCzLyRqDTvPQuhcDPfF9HVfkHGQo2ubukcI/hyjC8G9cpT1mB8LrxtopBRwyjZM
 AMe0iSUPxFkRfwfHRKUMIa8TZc9P8fglSL0fOTEMmbGIXtlhnpTuLVmNizAFW4fED4Nu
 SQWa09vPziu+vUtubnEseY0NZdf9342QVNQ9Std/b2PjEEpd7S3xQ6dkgBERVsMbQZ+S
 x4bzdbZg57Ew09UhTR4IuHco8zH7JrqprsKpr+F7cGf622/+eIqBn1cZbvHhfmzrSH3i ng== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frwntc3kr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:27 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245H0Zqg006282
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:26 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fus8ybfv0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e16bOWTU0+WTKq65YE6qZaZdeUcaFfmo3m0GM6E14H3eKUmsVzsQ+KUV6DcClnTG4MURpLuzL8o2+YlfTxa6k0HzOIXcjWe/PSfnhhZzxU1y0CoCj1HtRbgqjq0rLHf0gy1lGqeT6YKCIY63aQEO/ZvMakXfH9/OC6AvPcmgvr4TiofD18Djs7H8n5FBY84YcvzKtn+FgRhZuix9FqTuxOhXhkKxxucNNvsBFyXZBb2h2IJh0MS2UmIY8Qeba242hZ/HVWEO+7YeX/a0C9w9JbP2sA/Qh5foZxh/Y3bKRRXFYfVMuCVNe1lJJ2W9ASWgmIf/fSmOEGz79p6j8eR7oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0riSyXkpF6nuhVPb7+9TleWWgExFSznktzTyiNbDdNc=;
 b=H6LK8ksMVPFujxuuDYTMg35lU+u5sgE9lSYjhA8fjvZW5xRH84hAAUfoxLPYAgFAQQLediWs+n6FoU1NSug6WHtFkHEtchxU/4QBNMgiWD6Y0IZIK9cIR0UwC1dM+fp7xIHvyQ7cODr+waAjDl81GnaXhLTZN4uk/WXP8Swqb1N/eDKoBTwIEn+ByHCUuPP3d/lpZzKyF3GK8HG13rARU9Yykjgcrxw6J7YW0qa50fcbL9/HcIe3La/C4AQTdczcKYfOCJlzh5utTckOvmt15XxJQ0+aa4xiZhRlht27zm35L41leBljD9CAwZ3m5Pj/ic8bYTP+ck3AXT8wgcK/zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0riSyXkpF6nuhVPb7+9TleWWgExFSznktzTyiNbDdNc=;
 b=QcurvDdTZ77dlKQUvHhkUwGtjF8nh+z+sUTzzyhzBVCBjss0XeNScU5Lleehn3q/GUjjzwsCwHIW7ZMM3eq+yDVo7uW8iHrokeAR7Mi6/dc2PNqpUBL4ppWEEgZbzWXIZe1rSh2+GQRFf0kLP8o1i2B1Qvqi+Br9IozjUeGMQCk=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by BN7PR10MB2689.namprd10.prod.outlook.com (2603:10b6:406:c3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Thu, 5 May
 2022 17:11:24 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 17:11:24 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 17/23] vfio-user: dma map/unmap operations
Date: Thu,  5 May 2022 10:20:00 -0700
Message-Id: <8f76f28dfaaeb3a6237136ecb5603431f62c657a.1651709440.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1651709440.git.john.g.johnson@oracle.com>
References: <cover.1651709440.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::25) To BYAPR10MB3255.namprd10.prod.outlook.com
 (2603:10b6:a03:156::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2f9e06a-8d69-46c9-ed9f-08da2eba46c2
X-MS-TrafficTypeDiagnostic: BN7PR10MB2689:EE_
X-Microsoft-Antispam-PRVS: <BN7PR10MB2689C271C9A192F2FF0CE0B4B6C29@BN7PR10MB2689.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z78iIGCd1vUBpF+ra7OlVwxJZ3CeVzpibSFBwMYZrvjd6Gwr+LT2Xh+9mipypqmzP/hxi2Z0HmMdNNnnyx7eKxD0uzQU2XpdOzaa6AzlLIbVeHyzq5DLJifZHrdBDMQsMA4slw5q85vW3OdgxT/S3Ex+5eZ5YWuEuwX/34CfJ6p6ApnDQgt3ERxBm/v5aEr/RFKX5Sm5fpEpsbHGjrJA0VNCfyJA8ag3pn2C85dq37SEatjPAZGZxAErSOyNgrELOg+6ccn5c4RrOqwtEZQj1ms2glh1oWzYGdT04HIsK+9oAeKLG+cCoG8gCAJi8C41aaQ3At3OBhIJGZxbTGu4PBOoifqhzk/DtS/lrKtRQoNVwwdYhAP/1Q5AM+HmM5HcTGaPb8MUZdB4fYmzCmzzUuBtgA/nVDUOMuz+VMh4NbqRTt5PA8vaeMZcypphlDw/CTpxGKXBap4FltTDU2mE9dcPu5zudRWx/n+CiyJEuxHeonypPy91FNn63RJIJJwU4LwnJL5Jxfi/t/0807DCVhVSkoBt9bJ1gZ4w3lsdqlGSLjWs2nYlsoXyvJo5FVRCoExkXQLGliQ9g3LO0DRDan+WPb00+5O5Dl6iMTXlgzzXrqjRMd7iU3cCivbetjk/pZumH20rgFuNiAQk/G1wY84/N6ioqUnR+tpgjr0WyTxAGEo32QV308TZQQlO23LDeN8XPEwNd/FwWxDT0AzfXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(83380400001)(6916009)(6506007)(6512007)(38350700002)(316002)(36756003)(2906002)(2616005)(26005)(66476007)(8676002)(86362001)(30864003)(186003)(66556008)(66946007)(6666004)(52116002)(6486002)(5660300002)(8936002)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B0WwIvPWuqu2W38UdHrDgbKi+4nNraKrtIcST1hMUw93Qba1SCsF1dsVyKb7?=
 =?us-ascii?Q?N1qxaGDjDbX6wNonvwhqOK1dToWWnH9jCVXcQ8s+orkgzft0FXqn+52Kbp0P?=
 =?us-ascii?Q?BK0nWezWFNyaaZ0b05U6a8tFsbC3mV7+fCnxC324VkVlaD+3Q+hW5rHuy6RJ?=
 =?us-ascii?Q?7b88yUNTtb7CvvuCssu8Us1GxEeJme/asgIexK6dNk2zDvZg7GfpPUBEtfRZ?=
 =?us-ascii?Q?Ii3hGdUPxjqmGVRH3Z3oz+aB3c4G/N3vAncBdQlpNUqNkHfFrmkX1YBB9xcZ?=
 =?us-ascii?Q?7Vl3hljCTmnwrBVWwjUSVbkZRExNhBke+GmpIF+JAnXAhlkHo6w5+ajBrUDH?=
 =?us-ascii?Q?iIdGg49mInEE231nwgGrqD+o5jbzy0zo+cC6rTdQl2qhQey5SKcMzW/ZmHld?=
 =?us-ascii?Q?ZRKLyuk/32dN20Wnot0OOvpO2HvNobusuetU3JYQ+GHKkBx5pxrS0BT/bMKm?=
 =?us-ascii?Q?n5146UZOZ0unX/+eaHwV2+uck7aAQLM5Fag1wL5zGqsm/1tCgfk++eC/0FdI?=
 =?us-ascii?Q?DfJ/HmjTnvVigtkL9O5tYkOL6IKQ2VM/1pu4lKvXRaL7YDs0TNCqO6+y6mG8?=
 =?us-ascii?Q?y+XwkiO2tLh4rirQQG/2fTv5BUEGcTSOxftAowERJ66rfHzTl4iRPYFZj3cP?=
 =?us-ascii?Q?BSz2HgvqdKBm/ZYQ1GoDiJO8j+HSxG/T1ZezzLpi17BJE391/Kw0HKv37Y6a?=
 =?us-ascii?Q?gUDkLeWm9KMKCv9nLWHnzfuQpdfBN5GhnoARvK4PeqzcfnBANZx0WkFZaKRp?=
 =?us-ascii?Q?/7Lj6WrrEupyJEzE4Qf3peVi1rfUgT7htZP+uvoWbcG5bDyJHTN8KTpGJ8HD?=
 =?us-ascii?Q?HcWHs4StAjGlbTMubg6uck5nqu0WQ5auvsgIbTRT3NV+Oo5w41ytiKmp40ci?=
 =?us-ascii?Q?FUfyuOOwO8/CrPnJROd94c2Wdq1jlLYrzvRdhP9YFKUmuFtkuqMEtAzILvF5?=
 =?us-ascii?Q?Wtz+ajzuHNKGICtE0rknIEOov1TaRV5bnDiku0YuZd1qfS9WkHCjgIHGSAeb?=
 =?us-ascii?Q?TwbS+MGTgzfl1I5MFPqeOac0EWp8DsuNMw0EGeEP/fPWqMDJsNh8INAn6Fk3?=
 =?us-ascii?Q?7sSTFLu6/EO+xS6Vht1ZV4ZBQfnkov8cESQuA6Xc6Bw9QevH7mwHboslQjU1?=
 =?us-ascii?Q?UYcIUadIQ5ZKzt7QhbSYEIplpvM3Dcwwa3p8dHMbjnswXkC6LCi4nvaTe5In?=
 =?us-ascii?Q?2euB83ZUJDJXFuVDFGncaEzxSjStnZIZ2qQTn7B1I+PcHXj+oXIPAVb5eag7?=
 =?us-ascii?Q?mn+6uq8ElklN497LiZ2pObkz2RdwfcAxKjewmPC2KtZlSVtp2+piIj6YKfw8?=
 =?us-ascii?Q?RRpef6mJo8XJsrevEci+/mCSCIT6V6aFcxqD4ROx0aUN6lUFn86psVzkgkd+?=
 =?us-ascii?Q?i5w+kAiFj3zo/hkJobr2RL7UcoDmSF+tqC7oPCF5MepSBsA0VNoMQm6Mwl+S?=
 =?us-ascii?Q?BpX+oL6zlwilGhWVjWYAvP6qvCWW6tm1HFaUpE1DFpbbznIR8UyecyFfK1of?=
 =?us-ascii?Q?WEKkiL9Ds+iOGC2VmPlWI2P7m4FyYj8eryeNIJhIm6Y1NchmVzu84kRC/cmn?=
 =?us-ascii?Q?uwktIzkLtR5iAdFTs0t5d2BPFZtu6AS79Lqm58gqC5yod1+PnXZ993jF7BDv?=
 =?us-ascii?Q?E2rZqoYMZUuqO9/ccXQbra56OxrmZyrkbGcplzvHR2NZPqUEYrQlnttZ2YET?=
 =?us-ascii?Q?PfdxiHmWpkgp/RvO5F6DKnDfI71WkF1PnsJbZ7RSV1hC7guWEpntIs4WZw5/?=
 =?us-ascii?Q?fZCucTYaFLH5rxz+tj91feV6u027ffA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2f9e06a-8d69-46c9-ed9f-08da2eba46c2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 17:11:21.3414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MXDGh5WzYtKj5egQUZcd+CqDCKLhuX+UMlkTL0GAEXEsStsU8jbU3jSUA7QzcRy7D3F1lksYt7cXYMpP4i7rMS/e1RBNAS2ltxd2PTRMGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR10MB2689
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_06:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050118
X-Proofpoint-ORIG-GUID: XugVJftQq4NLcXcd1qfYGPGwWpNhMzUQ
X-Proofpoint-GUID: XugVJftQq4NLcXcd1qfYGPGwWpNhMzUQ
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add ability to do async operations during memory transactions

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
---
 hw/vfio/user-protocol.h       |  32 +++++++
 include/hw/vfio/vfio-common.h |   9 +-
 hw/vfio/common.c              |  63 +++++++++---
 hw/vfio/user.c                | 217 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 305 insertions(+), 16 deletions(-)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index 4852882..ad63f21 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -94,6 +94,31 @@ typedef struct {
 
 
 /*
+ * VFIO_USER_DMA_MAP
+ * imported from struct vfio_iommu_type1_dma_map
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint64_t offset;    /* FD offset */
+    uint64_t iova;
+    uint64_t size;
+} VFIOUserDMAMap;
+
+/*
+ * VFIO_USER_DMA_UNMAP
+ * imported from struct vfio_iommu_type1_dma_unmap
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint64_t iova;
+    uint64_t size;
+} VFIOUserDMAUnmap;
+
+/*
  * VFIO_USER_DEVICE_GET_INFO
  * imported from struct_device_info
  */
@@ -157,4 +182,11 @@ typedef struct {
     char data[];
 } VFIOUserRegionRW;
 
+/*imported from struct vfio_bitmap */
+typedef struct {
+    uint64_t pgsize;
+    uint64_t size;
+    char data[];
+} VFIOUserBitmap;
+
 #endif /* VFIO_USER_PROTOCOL_H */
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 59a8299..a84e10a 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -90,6 +90,7 @@ typedef struct VFIOContainer {
     VFIOContIO *io_ops;
     bool initialized;
     bool dirty_pages_supported;
+    bool async_ops;
     uint64_t dirty_pgsizes;
     uint64_t max_dirty_bitmap_size;
     unsigned long pgsizes;
@@ -199,7 +200,7 @@ struct VFIODevIO {
     ((vdev)->io_ops->region_write((vdev), (nr), (off), (size), (data), (post)))
 
 struct VFIOContIO {
-    int (*dma_map)(VFIOContainer *container,
+    int (*dma_map)(VFIOContainer *container, MemoryRegion *mr,
                    struct vfio_iommu_type1_dma_map *map);
     int (*dma_unmap)(VFIOContainer *container,
                      struct vfio_iommu_type1_dma_unmap *unmap,
@@ -207,14 +208,16 @@ struct VFIOContIO {
     int (*dirty_bitmap)(VFIOContainer *container,
                         struct vfio_iommu_type1_dirty_bitmap *bitmap,
                         struct vfio_iommu_type1_dirty_bitmap_get *range);
+    void (*wait_commit)(VFIOContainer *container);
 };
 
-#define CONT_DMA_MAP(cont, map) \
-    ((cont)->io_ops->dma_map((cont), (map)))
+#define CONT_DMA_MAP(cont, mr, map) \
+    ((cont)->io_ops->dma_map((cont), (mr), (map)))
 #define CONT_DMA_UNMAP(cont, unmap, bitmap) \
     ((cont)->io_ops->dma_unmap((cont), (unmap), (bitmap)))
 #define CONT_DIRTY_BITMAP(cont, bitmap, range) \
     ((cont)->io_ops->dirty_bitmap((cont), (bitmap), (range)))
+#define CONT_WAIT_COMMIT(cont) ((cont)->io_ops->wait_commit(cont))
 
 extern VFIODevIO vfio_dev_io_ioctl;
 extern VFIOContIO vfio_cont_io_ioctl;
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index beb5689..a9d9991 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -480,7 +480,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
     return CONT_DMA_UNMAP(container, &unmap, NULL);
 }
 
-static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
+static int vfio_dma_map(VFIOContainer *container, MemoryRegion *mr, hwaddr iova,
                         ram_addr_t size, void *vaddr, bool readonly)
 {
     struct vfio_iommu_type1_dma_map map = {
@@ -496,7 +496,7 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
         map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
     }
 
-    ret = CONT_DMA_MAP(container, &map);
+    ret = CONT_DMA_MAP(container, mr, &map);
 
     if (ret < 0) {
         error_report("VFIO_MAP_DMA failed: %s", strerror(-ret));
@@ -559,7 +559,8 @@ static bool vfio_listener_skipped_section(MemoryRegionSection *section)
 
 /* Called with rcu_read_lock held.  */
 static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
-                               ram_addr_t *ram_addr, bool *read_only)
+                               ram_addr_t *ram_addr, bool *read_only,
+                               MemoryRegion **mrp)
 {
     MemoryRegion *mr;
     hwaddr xlat;
@@ -640,6 +641,10 @@ static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
         *read_only = !writable || mr->readonly;
     }
 
+    if (mrp != NULL) {
+        *mrp = mr;
+    }
+
     return true;
 }
 
@@ -647,6 +652,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
 {
     VFIOGuestIOMMU *giommu = container_of(n, VFIOGuestIOMMU, n);
     VFIOContainer *container = giommu->container;
+    MemoryRegion *mr;
     hwaddr iova = iotlb->iova + giommu->iommu_offset;
     void *vaddr;
     int ret;
@@ -665,7 +671,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
     if ((iotlb->perm & IOMMU_RW) != IOMMU_NONE) {
         bool read_only;
 
-        if (!vfio_get_xlat_addr(iotlb, &vaddr, NULL, &read_only)) {
+        if (!vfio_get_xlat_addr(iotlb, &vaddr, NULL, &read_only, &mr)) {
             goto out;
         }
         /*
@@ -675,14 +681,14 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
          * of vaddr will always be there, even if the memory object is
          * destroyed and its backing memory munmap-ed.
          */
-        ret = vfio_dma_map(container, iova,
+        ret = vfio_dma_map(container, mr, iova,
                            iotlb->addr_mask + 1, vaddr,
                            read_only);
         if (ret) {
             error_report("vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
-                         "0x%"HWADDR_PRIx", %p) = %d (%m)",
+                         "0x%"HWADDR_PRIx", %p)",
                          container, iova,
-                         iotlb->addr_mask + 1, vaddr, ret);
+                         iotlb->addr_mask + 1, vaddr);
         }
     } else {
         ret = vfio_dma_unmap(container, iova, iotlb->addr_mask + 1, iotlb);
@@ -737,7 +743,7 @@ static int vfio_ram_discard_notify_populate(RamDiscardListener *rdl,
                section->offset_within_address_space;
         vaddr = memory_region_get_ram_ptr(section->mr) + start;
 
-        ret = vfio_dma_map(vrdl->container, iova, next - start,
+        ret = vfio_dma_map(vrdl->container, section->mr, iova, next - start,
                            vaddr, section->readonly);
         if (ret) {
             /* Rollback */
@@ -845,6 +851,29 @@ static void vfio_unregister_ram_discard_listener(VFIOContainer *container,
     g_free(vrdl);
 }
 
+static void vfio_listener_begin(MemoryListener *listener)
+{
+    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+
+    /*
+     * When DMA space is the physical address space,
+     * the region add/del listeners will fire during
+     * memory update transactions.  These depend on BQL
+     * being held, so do any resulting map/demap ops async
+     * while keeping BQL.
+     */
+    container->async_ops = true;
+}
+
+static void vfio_listener_commit(MemoryListener *listener)
+{
+    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+
+    /* wait here for any async requests sent during the transaction */
+    CONT_WAIT_COMMIT(container);
+    container->async_ops = false;
+}
+
 static void vfio_listener_region_add(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
@@ -1044,12 +1073,12 @@ static void vfio_listener_region_add(MemoryListener *listener,
         }
     }
 
-    ret = vfio_dma_map(container, iova, int128_get64(llsize),
+    ret = vfio_dma_map(container, section->mr, iova, int128_get64(llsize),
                        vaddr, section->readonly);
     if (ret) {
         error_setg(&err, "vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
-                   "0x%"HWADDR_PRIx", %p) = %d (%m)",
-                   container, iova, int128_get64(llsize), vaddr, ret);
+                   "0x%"HWADDR_PRIx", %p)",
+                   container, iova, int128_get64(llsize), vaddr);
         if (memory_region_is_ram_device(section->mr)) {
             /* Allow unexpected mappings not to be fatal for RAM devices */
             error_report_err(err);
@@ -1310,7 +1339,7 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
     }
 
     rcu_read_lock();
-    if (vfio_get_xlat_addr(iotlb, NULL, &translated_addr, NULL)) {
+    if (vfio_get_xlat_addr(iotlb, NULL, &translated_addr, NULL, NULL)) {
         int ret;
 
         ret = vfio_get_dirty_bitmap(container, iova, iotlb->addr_mask + 1,
@@ -1428,6 +1457,8 @@ static void vfio_listener_log_sync(MemoryListener *listener,
 
 static const MemoryListener vfio_memory_listener = {
     .name = "vfio",
+    .begin = vfio_listener_begin,
+    .commit = vfio_listener_commit,
     .region_add = vfio_listener_region_add,
     .region_del = vfio_listener_region_del,
     .log_global_start = vfio_listener_log_global_start,
@@ -2819,7 +2850,7 @@ VFIODevIO vfio_dev_io_ioctl = {
     .region_write = vfio_io_region_write,
 };
 
-static int vfio_io_dma_map(VFIOContainer *container,
+static int vfio_io_dma_map(VFIOContainer *container, MemoryRegion *mr,
                            struct vfio_iommu_type1_dma_map *map)
 {
 
@@ -2879,8 +2910,14 @@ static int vfio_io_dirty_bitmap(VFIOContainer *container,
     return ret < 0 ? -errno : ret;
 }
 
+static void vfio_io_wait_commit(VFIOContainer *container)
+{
+    /* ioctl()s are synchronous */
+}
+
 VFIOContIO vfio_cont_io_ioctl = {
     .dma_map = vfio_io_dma_map,
     .dma_unmap = vfio_io_dma_unmap,
     .dirty_bitmap = vfio_io_dirty_bitmap,
+    .wait_commit = vfio_io_wait_commit,
 };
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 9906d81..29eff8a 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -59,8 +59,11 @@ static void vfio_user_request(void *opaque);
 static int vfio_user_send_queued(VFIOProxy *proxy, VFIOUserMsg *msg);
 static void vfio_user_send_async(VFIOProxy *proxy, VFIOUserHdr *hdr,
                                  VFIOUserFDs *fds);
+static void vfio_user_send_nowait(VFIOProxy *proxy, VFIOUserHdr *hdr,
+                                  VFIOUserFDs *fds, int rsize);
 static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
                                 VFIOUserFDs *fds, int rsize, bool nobql);
+static void vfio_user_wait_reqs(VFIOProxy *proxy);
 static void vfio_user_request_msg(VFIOUserHdr *hdr, uint16_t cmd,
                                   uint32_t size, uint32_t flags);
 
@@ -647,6 +650,36 @@ static void vfio_user_send_async(VFIOProxy *proxy, VFIOUserHdr *hdr,
     }
 }
 
+/*
+ * nowait send - vfio_wait_reqs() can wait for it later
+ */
+static void vfio_user_send_nowait(VFIOProxy *proxy, VFIOUserHdr *hdr,
+                                  VFIOUserFDs *fds, int rsize)
+{
+    VFIOUserMsg *msg;
+    int ret;
+
+    if (hdr->flags & VFIO_USER_NO_REPLY) {
+        error_printf("vfio_user_send_nowait on async message\n");
+        return;
+    }
+
+    QEMU_LOCK_GUARD(&proxy->lock);
+
+    msg = vfio_user_getmsg(proxy, hdr, fds);
+    msg->id = hdr->id;
+    msg->rsize = rsize ? rsize : hdr->size;
+    msg->type = VFIO_MSG_NOWAIT;
+
+    ret = vfio_user_send_queued(proxy, msg);
+    if (ret < 0) {
+        vfio_user_recycle(proxy, msg);
+        return;
+    }
+
+    proxy->last_nowait = msg;
+}
+
 static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
                                 VFIOUserFDs *fds, int rsize, bool nobql)
 {
@@ -696,6 +729,57 @@ static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
     }
 }
 
+static void vfio_user_wait_reqs(VFIOProxy *proxy)
+{
+    VFIOUserMsg *msg;
+    bool iolock = false;
+
+    /*
+     * Any DMA map/unmap requests sent in the middle
+     * of a memory region transaction were sent nowait.
+     * Wait for them here.
+     */
+    qemu_mutex_lock(&proxy->lock);
+    if (proxy->last_nowait != NULL) {
+        iolock = qemu_mutex_iothread_locked();
+        if (iolock) {
+            qemu_mutex_unlock_iothread();
+        }
+
+        /*
+         * Change type to WAIT to wait for reply
+         */
+        msg = proxy->last_nowait;
+        msg->type = VFIO_MSG_WAIT;
+        while (!msg->complete) {
+            if (!qemu_cond_timedwait(&msg->cv, &proxy->lock, wait_time)) {
+                QTAILQ_REMOVE(&proxy->pending, msg, next);
+                error_printf("vfio_wait_reqs - timed out\n");
+                break;
+            }
+        }
+
+        if (msg->hdr->flags & VFIO_USER_ERROR) {
+            error_printf("vfio_user_wait_reqs - error reply on async request ");
+            error_printf("command %x error %s\n", msg->hdr->command,
+                         strerror(msg->hdr->error_reply));
+        }
+
+        proxy->last_nowait = NULL;
+        /*
+         * Change type back to NOWAIT to free
+         */
+        msg->type = VFIO_MSG_NOWAIT;
+        vfio_user_recycle(proxy, msg);
+    }
+
+    /* lock order is BQL->proxy - don't hold proxy when getting BQL */
+    qemu_mutex_unlock(&proxy->lock);
+    if (iolock) {
+        qemu_mutex_lock_iothread();
+    }
+}
+
 static QLIST_HEAD(, VFIOProxy) vfio_user_sockets =
     QLIST_HEAD_INITIALIZER(vfio_user_sockets);
 
@@ -1021,6 +1105,103 @@ int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp)
     return 0;
 }
 
+static int vfio_user_dma_map(VFIOProxy *proxy,
+                             struct vfio_iommu_type1_dma_map *map,
+                             int fd, bool will_commit)
+{
+    VFIOUserFDs *fds = NULL;
+    VFIOUserDMAMap *msgp = g_malloc0(sizeof(*msgp));
+    int ret;
+
+    vfio_user_request_msg(&msgp->hdr, VFIO_USER_DMA_MAP, sizeof(*msgp), 0);
+    msgp->argsz = map->argsz;
+    msgp->flags = map->flags;
+    msgp->offset = map->vaddr;
+    msgp->iova = map->iova;
+    msgp->size = map->size;
+
+    /*
+     * The will_commit case sends without blocking or dropping BQL.
+     * They're later waited for in vfio_send_wait_reqs.
+     */
+    if (will_commit) {
+        /* can't use auto variable since we don't block */
+        if (fd != -1) {
+            fds = vfio_user_getfds(1);
+            fds->send_fds = 1;
+            fds->fds[0] = fd;
+        }
+        vfio_user_send_nowait(proxy, &msgp->hdr, fds, 0);
+        ret = 0;
+    } else {
+        VFIOUserFDs local_fds = { 1, 0, &fd };
+
+        fds = fd != -1 ? &local_fds : NULL;
+        vfio_user_send_wait(proxy, &msgp->hdr, fds, 0, will_commit);
+        ret = (msgp->hdr.flags & VFIO_USER_ERROR) ? -msgp->hdr.error_reply : 0;
+        g_free(msgp);
+    }
+
+    return ret;
+}
+
+static int vfio_user_dma_unmap(VFIOProxy *proxy,
+                               struct vfio_iommu_type1_dma_unmap *unmap,
+                               struct vfio_bitmap *bitmap, bool will_commit)
+{
+    struct {
+        VFIOUserDMAUnmap msg;
+        VFIOUserBitmap bitmap;
+    } *msgp = NULL;
+    int msize, rsize;
+    bool blocking = !will_commit;
+
+    if (bitmap == NULL &&
+        (unmap->flags & VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP)) {
+        error_printf("vfio_user_dma_unmap mismatched flags and bitmap\n");
+        return -EINVAL;
+    }
+
+    /*
+     * If a dirty bitmap is returned, allocate extra space for it
+     * and block for reply even in the will_commit case.
+     * Otherwise, can send the unmap request without waiting.
+     */
+    if (bitmap != NULL) {
+        blocking = true;
+        msize = sizeof(*msgp);
+        rsize = msize + bitmap->size;
+        msgp = g_malloc0(rsize);
+        msgp->bitmap.pgsize = bitmap->pgsize;
+        msgp->bitmap.size = bitmap->size;
+    } else {
+        msize = rsize = sizeof(VFIOUserDMAUnmap);
+        msgp = g_malloc0(rsize);
+    }
+
+    vfio_user_request_msg(&msgp->msg.hdr, VFIO_USER_DMA_UNMAP, msize, 0);
+    msgp->msg.argsz = rsize - sizeof(VFIOUserHdr);
+    msgp->msg.argsz = unmap->argsz;
+    msgp->msg.flags = unmap->flags;
+    msgp->msg.iova = unmap->iova;
+    msgp->msg.size = unmap->size;
+
+    if (blocking) {
+        vfio_user_send_wait(proxy, &msgp->msg.hdr, NULL, rsize, will_commit);
+        if (msgp->msg.hdr.flags & VFIO_USER_ERROR) {
+            return -msgp->msg.hdr.error_reply;
+        }
+        if (bitmap != NULL) {
+            memcpy(bitmap->data, &msgp->bitmap.data, bitmap->size);
+        }
+        g_free(msgp);
+    } else {
+        vfio_user_send_nowait(proxy, &msgp->msg.hdr, NULL, rsize);
+    }
+
+    return 0;
+}
+
 static int vfio_user_get_info(VFIOProxy *proxy, struct vfio_device_info *info)
 {
     VFIOUserDeviceInfo msg;
@@ -1338,5 +1519,41 @@ VFIODevIO vfio_dev_io_sock = {
 };
 
 
+static int vfio_user_io_dma_map(VFIOContainer *container, MemoryRegion *mr,
+                                struct vfio_iommu_type1_dma_map *map)
+{
+    int fd = memory_region_get_fd(mr);
+
+    /*
+     * map->vaddr enters as a QEMU process address
+     * make it either a file offset for mapped areas or 0
+     */
+    if (fd != -1) {
+        void *addr = (void *)(uintptr_t)map->vaddr;
+
+        map->vaddr = qemu_ram_block_host_offset(mr->ram_block, addr);
+    } else {
+        map->vaddr = 0;
+    }
+
+    return vfio_user_dma_map(container->proxy, map, fd, container->async_ops);
+}
+
+static int vfio_user_io_dma_unmap(VFIOContainer *container,
+                                  struct vfio_iommu_type1_dma_unmap *unmap,
+                                  struct vfio_bitmap *bitmap)
+{
+    return vfio_user_dma_unmap(container->proxy, unmap, bitmap,
+                               container->async_ops);
+}
+
+static void vfio_user_io_wait_commit(VFIOContainer *container)
+{
+    vfio_user_wait_reqs(container->proxy);
+}
+
 VFIOContIO vfio_cont_io_sock = {
+    .dma_map = vfio_user_io_dma_map,
+    .dma_unmap = vfio_user_io_dma_unmap,
+    .wait_commit = vfio_user_io_wait_commit,
 };
-- 
1.8.3.1


