Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E268E51C666
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:42:53 +0200 (CEST)
Received: from localhost ([::1]:49588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfV7-00046v-0U
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf17-0006R0-75
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:53 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:41966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf14-0002BD-SZ
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:52 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245FGvR9004338
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=yoFJ9Qsq95Gs0eyOcaeO9MC/j6xqhhNZYswheoezAeE=;
 b=qBLCtUWUYyXY6p9IGlwl684kRgTSSwMmLICnBCikww36Zhr6EknBVtvabWiPt/aE5xTD
 hDApB+5v3584L53fxgV/dIPzQjoBTK2nz8halGo1V/oIGJ6ZzZE9hPTeK3WoTG1JoTJx
 oXQEmpg0GXooGdEFbnZqtFkvDeJ3uikNBjhsTNwA9egxX2Vru7p55PyJJrZBmZ3VfflC
 sOZ5XzWr09OJvlnKtZWd12+En655IPqrh1lCbFH74Sxt37sfpzzUi6NPtpXQh97dRV9W
 2kr6I5QVkQeD9M/K+5zhtK3R1vcGvO3s8ncxijZNnsVamWqqi9qY5FQpFcKbjg53YDWc GA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruq0m36x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:19 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245H0sqL013487
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:18 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fruj4xq8q-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FwHyBri0MnMxaTEmBXGS0rQQolZfXMqR1ynqrNtfs4ua+5aC8sBUDV23i4SFH5UtFuN/vlym38pulNTHgL0Azy8MF67kY71uNUMakSiauohuamivwekxowzL8xLsDL5GjYqzhMSughawJXK71Q0t3L82vynY/N1HZOd60hAqteQCUwEXNz/HY9BKKKnU4qogJV+NcJW1jXReD3HyZFeY3D2uuUbe+aNxSfus6eYY+osC+jfkKcNJuQ1AK14POoTr/jxkqs27Bc4aWr0W19Bg4VbSD3flbAcyQTeoI42Fd79ec9sbq0MQ2tN4PJwhExV5cmmBplGHnjI6eWOyye3ePA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoFJ9Qsq95Gs0eyOcaeO9MC/j6xqhhNZYswheoezAeE=;
 b=iPK8WAX+rtcoKrYUrD4XiSkH3qRJjweCAgs7CCrhyoxfB3NRsuzrxaqRWWOBKJtpduVi4U5NBfz3j1+TKFvE6BFvkd7jWMVvdtQMDWdgUtT+oL5Ap5KUi34Jmc9CWuXUsq++pY//iAS/gAtB0CMJr6jnSYCh8pQqobZis6AavHnPXlZQzcAJ0b7Ud5n26bOYNVuWqymK5kzGLY7GKyHCfuA/D99lAcME5IE48BkgzcBvCVrGu41ZjoiDPKkVyZ/ER3aT4atcxcn35b4TNPJJBt2fzFEjoVln6lEX0psmgO+/vMRApyybLZgjVcJWK7bvgMRyo27f2xtwEhx8lrgpvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoFJ9Qsq95Gs0eyOcaeO9MC/j6xqhhNZYswheoezAeE=;
 b=abeBMErUXj1IJLx5L5d7kvAOkKeYDnheseMF9l+PqcQmqoTYw16807ur+AGOeLEyfIFi8rK0wP7R0UvdIf4qFI+nMlMsCmntvMtG/jREzRJNZppgifHJvDNvVa8BrMHHfGJUhB00yZy77xXG2qsH2SzU6Pj2khZbAGaVvPYYqxM=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by DM5PR10MB1867.namprd10.prod.outlook.com (2603:10b6:3:10b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 17:11:17 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 17:11:16 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 03/23] vfio-user: add container IO ops vector
Date: Thu,  5 May 2022 10:19:46 -0700
Message-Id: <e5371b014b09de7d452ea610571f689a00bc3afd.1651709440.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1651709440.git.john.g.johnson@oracle.com>
References: <cover.1651709440.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::25) To BYAPR10MB3255.namprd10.prod.outlook.com
 (2603:10b6:a03:156::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b6d5c3d-97b4-4cac-4522-08da2eba43c3
X-MS-TrafficTypeDiagnostic: DM5PR10MB1867:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB18673E2B11CA72AA755BA02BB6C29@DM5PR10MB1867.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jhIiKJsQHlhNUofMPvZNhwpC2VfUZKOWLMHDhlOvT31HRCYUyZdT9QadXnUlLT/rUan20vUmw5dkeVobLpB7fB4OLxe+kMzbJI/bI5yf58KshVvYfYDfL8GTMF75PNF+IWFhROShRT7w2uL7GxKcZz0IwayPf3nb/p752r0qN52slxM/mLWRcIMk2BkN+02WF/NlZEvxYEmEP2XlWbffpJ/ot2atTlw6qxtv01AuTpuLK72m20Tl9CtsrQDSSPEQFqDgDpjlu8GBrkHptQzBjkiNSj+9IKNxXcbFXC+sRKSDoNtdHPtmD2oOCrnwOxjgGZSG64L0JksdQojWkK1kj6AFSojmmHl5teEWPiwy7DSF1/yKjDyXK4cIXfnfBl+88viysvQ4LCI9FnFMoNiGFngnD2dDj9pDJilUqfknELBtlY7Lr6DxSwpp0OGqDgUx8rHCWskYkfAmsnw7MoI1oGijz9132dLkjEoFOyKXJGsXEknI0fxZg18LjPpeFTDILYFRpdPReClI74QG5kaRsk8u4Q9L8zMnzKSS7QHZm1hIKQ0M+d/dQE0kAnNnWhK64wzuWv2aLfn/uJOn/RSG7yxpwwZ9X8q6AesMHa73Nqq8wqislzlCfoXxzrNqvPxK9qgjb/NjkjO0Lf48kHIukFm7AsSdDgS37gV7RVIJyLNDu8Wjj1QO26mWwBM4evwtkYWYkVylP/xaYnPzv1t9XQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6666004)(8676002)(66556008)(66946007)(66476007)(8936002)(38100700002)(38350700002)(5660300002)(86362001)(508600001)(6486002)(316002)(6506007)(186003)(83380400001)(36756003)(2616005)(2906002)(26005)(6512007)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/FQ2Na2A0Ja9AhgDBhetaauCK5TsB/71MTPTjBURbDl8pL0omJSAmGzoF9hY?=
 =?us-ascii?Q?FromzzxLUJI9tqZiswcmpiBzKjwjbGB/+ITTswkFZdY/hXswCk4YmBcu8UZs?=
 =?us-ascii?Q?N81G+Rts7/6L3Htz2WiJN+/zvTskB4CKUhkOz+KXoq5YRpE8jZvMCv3s17sK?=
 =?us-ascii?Q?OZrsO6zb1bJaYaZfaHNdFZu+lzF7s8JruvYjaWLgYqy8EAH9exZ7cdUF/KuC?=
 =?us-ascii?Q?6i/Ki4r4sfxUenL+BOV4GrX4E18PnTrVHOhIej9F+KygNhN3pQhE+d8KKDz+?=
 =?us-ascii?Q?TxCsF4lhB4+GVToQdp05mfZf4zNHWW2v2heYx50TOxMFllnwZ40eaxtNOVsn?=
 =?us-ascii?Q?Lm7HCz8NMcyWtCxrQuMtljF56ERVK2ydrlDogwLmYFBl8EKc3wVYOXPPsd4W?=
 =?us-ascii?Q?u1dowlKyX6WGKCGbjAyxX9XMglpEXPiZsCpL9ccoKvcJo9IquIOTkaJNDkrb?=
 =?us-ascii?Q?iIbuogany0QPFNMAsf65LwH9AKAECueFqVhoTeR7xztU8/nslBILG/2/HMZr?=
 =?us-ascii?Q?30dexs0fKcnen7MVIcfyoTCajr/U3euWDMHzQULsICByucqnJCnqX8f+fWJc?=
 =?us-ascii?Q?Ulfg4rRS2sVE4yiYDn/Fg5vC927uU3me+e+/9bhx7KUuSZ7U1QcQ/V9SeCgB?=
 =?us-ascii?Q?sMfoFp4e/Eol7VO35XQLODrOYvS28+fbA0nM3JTHEvZk13HI/tu1svTqY65p?=
 =?us-ascii?Q?38e0RFpoyssasN5L4o5PcyMrufer2TX/6fJhuL34jF9WZKbpto8+wV8YUudN?=
 =?us-ascii?Q?ltw56o2IO6/vdLbWlNuu9uN9/GV8LWDKM5i8y2VWca4kBtsHjNdFhiQr3IRo?=
 =?us-ascii?Q?S+mL07A+B0p8iMZ4Mfnk3rmG3UBGIZkhWCETZBe4hNt4NrT2+SH/mkFA6oMH?=
 =?us-ascii?Q?vNUQII9qOwbQZlOCMyg3oEuzKVSGJ+Mwf7Ug15SEfy0MJXMMAwEdLdCrG1S4?=
 =?us-ascii?Q?3bKh75bOX1Z4kZ2WrUDPv16yGfjt7WWiLuMVWhtW6uJQCY3vP8mL4tmnMAzW?=
 =?us-ascii?Q?4sTqk0shXPeaAnDY+oOSCkqGTHEBTmCqSA3baPtNB5o0Y91EUN/iOcJWfCSt?=
 =?us-ascii?Q?c0a/QW565qwIyEVrOBJjRZRa3crcVnAHoclIF9t3i3rDBeTfTj34+lRlxyff?=
 =?us-ascii?Q?+xGpeCooMZIYg4RMTQ/iupv1/+NqsDiQDaNsFnHnowW4OREmgYhOcDwLerZt?=
 =?us-ascii?Q?270BEMQBNaUstcsz1sTo3hMTFlju+T/OimtRvrX8/prlKiSzJtnpmH/1wi/c?=
 =?us-ascii?Q?SYz4oKW9b7mGOmvmLSFAYCuAP449CQU+nmdpssRuCnLWSPPSunYiJfrTVaab?=
 =?us-ascii?Q?cH1PRP/2F2QSV5rH0D/WB08Hh9dJG92ONMzrh0E32qeS8CsZ2CWWI57Brc/B?=
 =?us-ascii?Q?pzIuo95AMN+nxFXgq5jHX/+czIgCPVscNBsvJ67koJTG0cg7cVvDKo8XppcX?=
 =?us-ascii?Q?s1gKyPrb9ERqE6IlQtf6nkfHv4Gw5jf00n1SynbKrV+8OPAE9UYjzXR5xnEc?=
 =?us-ascii?Q?kr33EPH7x1MZXcFGeYuhgCVdH7+tgPNJ/wyp/pyqcvj7QG1MTeFuxWPCKYxN?=
 =?us-ascii?Q?vvv9j5aRYPO7VV47gN6tOyM3BcUwiAgkl0Dm0DRBGyNHW8j9jdjw1AaTsO4r?=
 =?us-ascii?Q?rHkLM9Ls5M1tD/Yga3GWRuLxKHe8WO61JXktFAoQgkDq0dZWZnfOBoLELW17?=
 =?us-ascii?Q?4Hp68UDRhcDDm6ZCjLg/ZX/QwKAG+NZHFGAWmU8rAZA1OWgWqA9Z7KXUCELi?=
 =?us-ascii?Q?Iyt7R80rPHyBSaOynWYUrMHN/vqGd9s=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6d5c3d-97b4-4cac-4522-08da2eba43c3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 17:11:16.3418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aWFqzmB2NrLgJ12sjzG1gwGD9t8C7XW2nMEUKzH2suzw9te7e3x189tTK2y3jS0O+cKKlyhcr7a/Mhdx1QvHAfLm8lTYRZ/qr7PJSXVmbYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1867
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_06:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050118
X-Proofpoint-ORIG-GUID: yl92ww0495SgQJ14ePlAiQfK5o78_Z6-
X-Proofpoint-GUID: yl92ww0495SgQJ14ePlAiQfK5o78_Z6-
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

Used for communication with VFIO driver
(prep work for vfio-user, which will communicate over a socket)

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
---
 include/hw/vfio/vfio-common.h |  33 +++++++++++
 hw/vfio/common.c              | 126 ++++++++++++++++++++++++++++--------------
 2 files changed, 117 insertions(+), 42 deletions(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 8af11b0..2761a62 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -75,6 +75,7 @@ typedef struct VFIOAddressSpace {
 } VFIOAddressSpace;
 
 struct VFIOGroup;
+typedef struct VFIOContIO VFIOContIO;
 
 typedef struct VFIOContainer {
     VFIOAddressSpace *space;
@@ -83,6 +84,7 @@ typedef struct VFIOContainer {
     MemoryListener prereg_listener;
     unsigned iommu_type;
     Error *error;
+    VFIOContIO *io_ops;
     bool initialized;
     bool dirty_pages_supported;
     uint64_t dirty_pgsizes;
@@ -154,6 +156,37 @@ struct VFIODeviceOps {
     int (*vfio_load_config)(VFIODevice *vdev, QEMUFile *f);
 };
 
+#ifdef CONFIG_LINUX
+
+/*
+ * The next 2 ops vectors are how Devices and Containers
+ * communicate with the server.  The default option is
+ * through ioctl() to the kernel VFIO driver, but vfio-user
+ * can use a socket to a remote process.
+ */
+
+struct VFIOContIO {
+    int (*dma_map)(VFIOContainer *container,
+                   struct vfio_iommu_type1_dma_map *map);
+    int (*dma_unmap)(VFIOContainer *container,
+                     struct vfio_iommu_type1_dma_unmap *unmap,
+                     struct vfio_bitmap *bitmap);
+    int (*dirty_bitmap)(VFIOContainer *container,
+                        struct vfio_iommu_type1_dirty_bitmap *bitmap,
+                        struct vfio_iommu_type1_dirty_bitmap_get *range);
+};
+
+#define CONT_DMA_MAP(cont, map) \
+    ((cont)->io_ops->dma_map((cont), (map)))
+#define CONT_DMA_UNMAP(cont, unmap, bitmap) \
+    ((cont)->io_ops->dma_unmap((cont), (unmap), (bitmap)))
+#define CONT_DIRTY_BITMAP(cont, bitmap, range) \
+    ((cont)->io_ops->dirty_bitmap((cont), (bitmap), (range)))
+
+extern VFIOContIO vfio_cont_io_ioctl;
+
+#endif /* CONFIG_LINUX */
+
 typedef struct VFIOGroup {
     int fd;
     int groupid;
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 2b1f78f..917da0f 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -431,12 +431,12 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
         goto unmap_exit;
     }
 
-    ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap);
+    ret = CONT_DMA_UNMAP(container, unmap, bitmap);
     if (!ret) {
         cpu_physical_memory_set_dirty_lebitmap((unsigned long *)bitmap->data,
                 iotlb->translated_addr, pages);
     } else {
-        error_report("VFIO_UNMAP_DMA with DIRTY_BITMAP : %m");
+        error_report("VFIO_UNMAP_DMA with DIRTY_BITMAP : %s", strerror(-ret));
     }
 
     g_free(bitmap->data);
@@ -464,30 +464,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
         return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
     }
 
-    while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
-        /*
-         * The type1 backend has an off-by-one bug in the kernel (71a7d3d78e3c
-         * v4.15) where an overflow in its wrap-around check prevents us from
-         * unmapping the last page of the address space.  Test for the error
-         * condition and re-try the unmap excluding the last page.  The
-         * expectation is that we've never mapped the last page anyway and this
-         * unmap request comes via vIOMMU support which also makes it unlikely
-         * that this page is used.  This bug was introduced well after type1 v2
-         * support was introduced, so we shouldn't need to test for v1.  A fix
-         * is queued for kernel v5.0 so this workaround can be removed once
-         * affected kernels are sufficiently deprecated.
-         */
-        if (errno == EINVAL && unmap.size && !(unmap.iova + unmap.size) &&
-            container->iommu_type == VFIO_TYPE1v2_IOMMU) {
-            trace_vfio_dma_unmap_overflow_workaround();
-            unmap.size -= 1ULL << ctz64(container->pgsizes);
-            continue;
-        }
-        error_report("VFIO_UNMAP_DMA failed: %s", strerror(errno));
-        return -errno;
-    }
-
-    return 0;
+    return CONT_DMA_UNMAP(container, &unmap, NULL);
 }
 
 static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
@@ -500,24 +477,18 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
         .iova = iova,
         .size = size,
     };
+    int ret;
 
     if (!readonly) {
         map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
     }
 
-    /*
-     * Try the mapping, if it fails with EBUSY, unmap the region and try
-     * again.  This shouldn't be necessary, but we sometimes see it in
-     * the VGA ROM space.
-     */
-    if (ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map) == 0 ||
-        (errno == EBUSY && vfio_dma_unmap(container, iova, size, NULL) == 0 &&
-         ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map) == 0)) {
-        return 0;
-    }
+    ret = CONT_DMA_MAP(container, &map);
 
-    error_report("VFIO_MAP_DMA failed: %s", strerror(errno));
-    return -errno;
+    if (ret < 0) {
+        error_report("VFIO_MAP_DMA failed: %s", strerror(-ret));
+    }
+    return ret;
 }
 
 static void vfio_host_win_add(VFIOContainer *container,
@@ -1230,10 +1201,10 @@ static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
         dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP;
     }
 
-    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, &dirty);
+    ret = CONT_DIRTY_BITMAP(container, &dirty, NULL);
     if (ret) {
         error_report("Failed to set dirty tracking flag 0x%x errno: %d",
-                     dirty.flags, errno);
+                     dirty.flags, -ret);
     }
 }
 
@@ -1283,11 +1254,11 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
         goto err_out;
     }
 
-    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
+    ret = CONT_DIRTY_BITMAP(container, dbitmap, range);
     if (ret) {
         error_report("Failed to get dirty bitmap for iova: 0x%"PRIx64
                 " size: 0x%"PRIx64" err: %d", (uint64_t)range->iova,
-                (uint64_t)range->size, errno);
+                (uint64_t)range->size, -ret);
         goto err_out;
     }
 
@@ -2058,6 +2029,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     container->error = NULL;
     container->dirty_pages_supported = false;
     container->dma_max_mappings = 0;
+    container->io_ops = &vfio_cont_io_ioctl;
     QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
     QLIST_INIT(&container->vrdl_list);
@@ -2594,3 +2566,73 @@ int vfio_eeh_as_op(AddressSpace *as, uint32_t op)
     }
     return vfio_eeh_container_op(container, op);
 }
+
+/*
+ * Traditional ioctl() based io_ops
+ */
+
+static int vfio_io_dma_map(VFIOContainer *container,
+                           struct vfio_iommu_type1_dma_map *map)
+{
+
+    /*
+     * Try the mapping, if it fails with EBUSY, unmap the region and try
+     * again.  This shouldn't be necessary, but we sometimes see it in
+     * the VGA ROM space.
+     */
+    if (ioctl(container->fd, VFIO_IOMMU_MAP_DMA, map) == 0 ||
+        (errno == EBUSY &&
+         vfio_dma_unmap(container, map->iova, map->size, NULL) == 0 &&
+         ioctl(container->fd, VFIO_IOMMU_MAP_DMA, map) == 0)) {
+        return 0;
+    }
+    return -errno;
+}
+
+static int vfio_io_dma_unmap(VFIOContainer *container,
+                             struct vfio_iommu_type1_dma_unmap *unmap,
+                             struct vfio_bitmap *bitmap)
+{
+
+    while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap)) {
+        /*
+         * The type1 backend has an off-by-one bug in the kernel (71a7d3d78e3c
+         * v4.15) where an overflow in its wrap-around check prevents us from
+         * unmapping the last page of the address space.  Test for the error
+         * condition and re-try the unmap excluding the last page.  The
+         * expectation is that we've never mapped the last page anyway and this
+         * unmap request comes via vIOMMU support which also makes it unlikely
+         * that this page is used.  This bug was introduced well after type1 v2
+         * support was introduced, so we shouldn't need to test for v1.  A fix
+         * is queued for kernel v5.0 so this workaround can be removed once
+         * affected kernels are sufficiently deprecated.
+         */
+        if (errno == EINVAL && unmap->size && !(unmap->iova + unmap->size) &&
+            container->iommu_type == VFIO_TYPE1v2_IOMMU) {
+            trace_vfio_dma_unmap_overflow_workaround();
+            unmap->size -= 1ULL << ctz64(container->pgsizes);
+            continue;
+        }
+        error_report("VFIO_UNMAP_DMA failed: %s", strerror(errno));
+        return -errno;
+    }
+
+    return 0;
+}
+
+static int vfio_io_dirty_bitmap(VFIOContainer *container,
+                                struct vfio_iommu_type1_dirty_bitmap *bitmap,
+                                struct vfio_iommu_type1_dirty_bitmap_get *range)
+{
+    int ret;
+
+    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, bitmap);
+
+    return ret < 0 ? -errno : ret;
+}
+
+VFIOContIO vfio_cont_io_ioctl = {
+    .dma_map = vfio_io_dma_map,
+    .dma_unmap = vfio_io_dma_unmap,
+    .dirty_bitmap = vfio_io_dirty_bitmap,
+};
-- 
1.8.3.1


