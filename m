Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD5E51C62F
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:34:41 +0200 (CEST)
Received: from localhost ([::1]:37754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfNA-0004NP-It
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0l-00063K-8z
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:34 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:45262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0f-0002BR-8S
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:29 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245FTMUY030007
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=VtsDZ9Hg7Rrm/a6/XVUff29pbC98CuZpy222DxzXrSM=;
 b=RR4dvzcTN01MSquVrc74mpXQ3zV/ctFXkjJdOg2MF+HBMsani+FTBDLO81zlWIPGZn4L
 CISLo1n9wmab8mDqW+c2IBjisamk6KOMyjThF1e0KAfp30H87DooUc2nQ2QTcakI+26q
 AjahZEgD71M9rkqhPcYPC0JdMfD6LKWSVOAUbHRBJOSnT/6lo0d6lDDYfXy9k0jOsFUi
 lYgBJ0Fy/StvYHz5ZWVLyToNhhWMxKeE1mx0Xprt+hjxnwO7/ZD5N+DCGNUgNvrn0T9R
 jq90M4AT33MX03MV3x5qzJvtuxlOAUlJsaYROyJdz6oU2l6ry8GONMOrm5iZF4tIFLJ5 NA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruq0m372-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:20 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245H0sqP013487
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:20 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fruj4xq8q-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cl8A5H0f06TVY2kP7VxRjfHyraPcZ3vA8cs2xf6TBLUyoYKUGkrPUrJlh3lcnHOKPx5Wt84NqlQ/ES4j964Uoufqf9ys5Rvk+8LIycLjocYMX16RPVvjsuLDxc0puIcHQCoxcW7Y+c6QZALzLBd91L/oEykXkgNR9JCnWApgXmD1hlieB6RIrY4z+QGd+UA6OyQ/7EarTIGgAuaaPHIpJaFXBmfmufWa1ddMfn8gcA785tAcNVlPdVZ9PT63wOrRqDIA+p5TvbQJlo63yb8//OBTlJAwh7XAycx7pAxC3redYK3u/D05KWgpjuMQ9mYT5EdhwE4emSVQ0hZldHby/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VtsDZ9Hg7Rrm/a6/XVUff29pbC98CuZpy222DxzXrSM=;
 b=aoc4fhhbIXaOlWOAbe5F6XXtudhnBsPvGhW0wwtTOocaJOGcJaa4L1KUQZAoDowpDcR3njPCwAdXOr7fAyIwCfdrkWi5EdYhEW3I5XILsX77utIEym/v66bODDMfDXrYPiXpSuRN0OALITG+q5DPCwWVWePPwYEk1NtHndvQPLVYJFjikjFmIrfKxy+1o1oXhx8m+f09+NEH3MKW/WGXe8Z+IAsQRCSbVplO4A9hdyK/8Ro7daXFI7cbCos36jGBxb98ubCOntqXALLusLImC0Pph5dv78RMTxuzEWGRxBhZg2zqwU/ZiUvptWobDuNCYzH0grxEE841doOcvQ69wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtsDZ9Hg7Rrm/a6/XVUff29pbC98CuZpy222DxzXrSM=;
 b=hsBS4lclsK/fLiVqCk9sTfsBGjy0tJy06k7TNdZ7/KU/tblvYwaG49n3M34wl9aaLDfUAO8cCJzWVUvRjYoOmhDty3ajmKQJUkmSAL7lLDen/TusvupEjVvdvNiHMRBL+jTNKZDVZZ4CeftgxsB2cT3rds9qVFcfK2Z2yAK2qOg=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by DM5PR10MB1867.namprd10.prod.outlook.com (2603:10b6:3:10b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 17:11:18 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 17:11:18 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 05/23] vfio-user: add device IO ops vector
Date: Thu,  5 May 2022 10:19:48 -0700
Message-Id: <bd613536d52bb4c055f51da3b45ebefd0d91681b.1651709440.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1651709440.git.john.g.johnson@oracle.com>
References: <cover.1651709440.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::25) To BYAPR10MB3255.namprd10.prod.outlook.com
 (2603:10b6:a03:156::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3ebf06e-bd38-4717-8d41-08da2eba442e
X-MS-TrafficTypeDiagnostic: DM5PR10MB1867:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB186729105A7CE82A7CF849CFB6C29@DM5PR10MB1867.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZkjE4W4cSTk3AJ+rnPnmWaXq3urnom84U5JWbZHYQGGUKa+5+/JQCjPXyir0JdYKKg4mwgTOImRnSazURiZkdWK5hSOgLxSqo5KVQLW674oF4W8bfocFY4dzQ/2+VPrBmcGtLyR0Tv6LAeB9ql7LaXHbB/3dR1RXYHBT51Th2r9lMuA/Yt3Pz1tY8N5/sHjUEoXls9QT6ZpM/UKmVQX1+onhlKBSRdGFFyeSHtFs+qTIheaEnIIHCGwiga5RGdY9yYacvtWZu37g8UHWu2bTstTuFk6A2jesGwqimsN6MNnQZqeO0ym5Tuh4qECMwJJ0BOI9jUBR27efNw9r5Ui8HgjVKo9c3IvOJKcC2lHK3n/CzjiJyRdOK1X1Auzo4slHFB7vu42jtAALpf6O3EYKHOPEd8Bzcl3zordo8CN0i7mTS0HtfdsiO0JQ+zbqG+TeJ/CDhaFXqnKhprn6znoBTrxAqXnSacsKHIK4QeSzj+qDDFw8AINd5H6kMOCt+g3uesGC7a+Jyl9eAOICoO8/4ICdpjmMJYo4bx8tfPdUOc/3H85Ohel5mcR3LnIe5sBRcVl7M4We13qgzG+Sdw3w5JjuVgfMxcJfHSNfzrfc9ghMi2f16xtOkGimget0SxD30gGHmjCG1Mnn2vI4jImNoR7y8mJYGgavi2rM/U6bDCAKUngoqHA+lCzSYsYDH7BTKcK/bBHsf09zJuUVi+XSwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6666004)(8676002)(66556008)(66946007)(66476007)(8936002)(38100700002)(38350700002)(5660300002)(86362001)(508600001)(6486002)(316002)(6506007)(186003)(83380400001)(36756003)(30864003)(2616005)(2906002)(26005)(6512007)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qkFwkz20Ba54X5A0yDoTT1OHUdYCZG+w8pvHt0Pg71ByqLE06WTLtxHk4IPy?=
 =?us-ascii?Q?PJYC+5yit7hY5FaUtvqhd7s/V38kRp9UWmRYmJ+Th7VUv7YlbF7aZPXOo+1j?=
 =?us-ascii?Q?3fmNk1zBWRgK/o1zouk7lH5hsKtcW1HhKov9fX6rzuL+p6h+jv79oSLLYZb8?=
 =?us-ascii?Q?ukGjpvMVhJVDeqSrILOETQLjyA8O3M0mXNQd82tVMc/2QDG5UAI1Ehu8aX1R?=
 =?us-ascii?Q?M4rxRYMViaPovo3PcO/6ajRH7FpvBpt9cEBukuz6q/YnH9JAHe0SekJopODB?=
 =?us-ascii?Q?amV63t+BMIhuaeYC19P8rRvOxnBVrr+0w9IiMypL4qQCEXcoQT8twF/Zq0mK?=
 =?us-ascii?Q?s6VBPtcTTv3XE0zk8JQ5n7lXhtQLdutjvk/uJaDwBG9nlIQvIGv7R/Bh3Xrd?=
 =?us-ascii?Q?+gLsumV/oHezRTDGGIk77dYZCkUa5ZB0rBHrnvwX9jTFVaXAQgnun4qFucLq?=
 =?us-ascii?Q?1JLIXdS0rXMqPOa36jju0oDmw7AP04BDcFnXUFluPOikaaf/iC15PBpehOyN?=
 =?us-ascii?Q?YLOfL9NiL12XkgGta/YULobHEmuEJZet6Zp6xbUXmyhDzeesUvagopXKK2th?=
 =?us-ascii?Q?bTOV+MfBly/oHOeUJc1LPMyPHuElVCcCIi7GGhNi7gltGUx9m0YP2fb5quSz?=
 =?us-ascii?Q?7At9teIcNiDJJevCpi+UpHZGInzKJrZWBjUBrOQK3cQgYhdLyPeTAcyQeni2?=
 =?us-ascii?Q?y/9nLIlC26dEUoARVNegTNGIx/bO4QLSh1S5RDOQptecb3T4J9ch/IVhcxTY?=
 =?us-ascii?Q?9IRvR5t4lIvwKYju+k9PTERKupnOSiQ9knGz2NaE4nCT8ZseCK7kiCUQRlWE?=
 =?us-ascii?Q?1ncQlHq1TwUDqqmTS5S0wAXqa6YNZmAWj8ljG4NDFhLz/Mkg/m1jd3yZhRoc?=
 =?us-ascii?Q?KWUD+hZWbpY486UqRd/rSo1sLiPr7Lv94W2uOBqT/SLKs0wZBxYAxydylqzt?=
 =?us-ascii?Q?sE75832Mc3ZQsVTaab6gnHs6fgxjGxUT3vOSBZvJ6ngaEa5pmGC7MxFhhveQ?=
 =?us-ascii?Q?MDOj8nziKYW4X8dXVu0ZbxVzH4fPhoFfS5lIRlfBSae9xsUOO0L0Zs0dPmI2?=
 =?us-ascii?Q?R7B3mZRCzDJ0MAV9NRvmdJOblFKIMjvXpzzGZlVKmWUE1zA9+pxc8OyVFqM3?=
 =?us-ascii?Q?draNy9aLNO5tbl1sYU5GS9FRaAXTfXWx0Yvih4JkkFgyP1UwFFw/ZjqK5Dsw?=
 =?us-ascii?Q?xdLmtdJxqUXj1jSOL2poDEd+2CknYB2GzP+tqJbOtCCxb8O9KbQpzIoMt3DX?=
 =?us-ascii?Q?Z24TT4ykoaelv4at0U+5C9WDi+nthS2fKhqd/S5nQByNofdOkwb1KfYUUf+0?=
 =?us-ascii?Q?/lZ0BX48q616Zya0SbXGpiOvIB1fxMot/zQt/6cd6Xr+D14WQK1z67asBSql?=
 =?us-ascii?Q?J1YhF5dT6/dtZNamg/TbiYsilTi5nuMeqILV7aStQGXrRKP9maIGaa1PPvYc?=
 =?us-ascii?Q?GOoKa3mADdMS9sYkyuRoSeYX6uz53UDLA/vD7LIUC6CruoWQTEUICNvPFdjH?=
 =?us-ascii?Q?b77wwVg/wckaxvt46GE8UuF6wBKkuNJ2OrlhD6HVedPLShIPqbVOCLbJOOk5?=
 =?us-ascii?Q?v77giRsy8i1y0Q3dhxUrbGdNzoNaCnq/ybNk7iSDzgAn1iOaRx6NUoPabOHG?=
 =?us-ascii?Q?NWg03FPsbEM2CZcOGxe7uRvwZWg2bLZyZAlh+vg6W/KzPDTddCEjSY80B+IU?=
 =?us-ascii?Q?eWykBkwyj8GzAIMMQNdN2zugytIX/PykIlNMQPThfnD3HRDi9Pk4sCNwJywn?=
 =?us-ascii?Q?QhCury8sEzH3Taj5eu/x9c21bVsfUlE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ebf06e-bd38-4717-8d41-08da2eba442e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 17:11:17.0761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CQplmhRA0+N1mDPl+NiyfXtyPiVuq66JcO9u+gMfaY58zHZPIghDEx+y/r/f9i5bxr6c3qhOifD+7tds/nFIA3indjSyFpbr+jR/Vu+zznM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1867
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_06:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050118
X-Proofpoint-ORIG-GUID: pVB6ZEYZxYKo-VFZwRja1O5WYX4CJIKU
X-Proofpoint-GUID: pVB6ZEYZxYKo-VFZwRja1O5WYX4CJIKU
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
 include/hw/vfio/vfio-common.h |  27 ++++++++
 hw/vfio/common.c              | 107 +++++++++++++++++++++++++++-----
 hw/vfio/pci.c                 | 140 ++++++++++++++++++++++++++----------------
 3 files changed, 206 insertions(+), 68 deletions(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 1a032f4..826cd98 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -124,6 +124,7 @@ typedef struct VFIOHostDMAWindow {
 } VFIOHostDMAWindow;
 
 typedef struct VFIODeviceOps VFIODeviceOps;
+typedef struct VFIODevIO VFIODevIO;
 
 typedef struct VFIODevice {
     QLIST_ENTRY(VFIODevice) next;
@@ -139,6 +140,7 @@ typedef struct VFIODevice {
     bool ram_block_discard_allowed;
     bool enable_migration;
     VFIODeviceOps *ops;
+    VFIODevIO *io_ops;
     unsigned int num_irqs;
     unsigned int num_regions;
     unsigned int flags;
@@ -165,6 +167,30 @@ struct VFIODeviceOps {
  * through ioctl() to the kernel VFIO driver, but vfio-user
  * can use a socket to a remote process.
  */
+struct VFIODevIO {
+    int (*get_info)(VFIODevice *vdev, struct vfio_device_info *info);
+    int (*get_region_info)(VFIODevice *vdev,
+                           struct vfio_region_info *info);
+    int (*get_irq_info)(VFIODevice *vdev, struct vfio_irq_info *irq);
+    int (*set_irqs)(VFIODevice *vdev, struct vfio_irq_set *irqs);
+    int (*region_read)(VFIODevice *vdev, uint8_t nr, off_t off, uint32_t size,
+                       void *data);
+    int (*region_write)(VFIODevice *vdev, uint8_t nr, off_t off, uint32_t size,
+                        void *data);
+};
+
+#define VDEV_GET_INFO(vdev, info) \
+    ((vdev)->io_ops->get_info((vdev), (info)))
+#define VDEV_GET_REGION_INFO(vdev, info) \
+    ((vdev)->io_ops->get_region_info((vdev), (info)))
+#define VDEV_GET_IRQ_INFO(vdev, irq) \
+    ((vdev)->io_ops->get_irq_info((vdev), (irq)))
+#define VDEV_SET_IRQS(vdev, irqs) \
+    ((vdev)->io_ops->set_irqs((vdev), (irqs)))
+#define VDEV_REGION_READ(vdev, nr, off, size, data) \
+    ((vdev)->io_ops->region_read((vdev), (nr), (off), (size), (data)))
+#define VDEV_REGION_WRITE(vdev, nr, off, size, data) \
+    ((vdev)->io_ops->region_write((vdev), (nr), (off), (size), (data)))
 
 struct VFIOContIO {
     int (*dma_map)(VFIOContainer *container,
@@ -184,6 +210,7 @@ struct VFIOContIO {
 #define CONT_DIRTY_BITMAP(cont, bitmap, range) \
     ((cont)->io_ops->dirty_bitmap((cont), (bitmap), (range)))
 
+extern VFIODevIO vfio_dev_io_ioctl;
 extern VFIOContIO vfio_cont_io_ioctl;
 
 #endif /* CONFIG_LINUX */
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index d9290f3..0616169 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -70,7 +70,7 @@ void vfio_disable_irqindex(VFIODevice *vbasedev, int index)
         .count = 0,
     };
 
-    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
+    VDEV_SET_IRQS(vbasedev, &irq_set);
 }
 
 void vfio_unmask_single_irqindex(VFIODevice *vbasedev, int index)
@@ -83,7 +83,7 @@ void vfio_unmask_single_irqindex(VFIODevice *vbasedev, int index)
         .count = 1,
     };
 
-    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
+    VDEV_SET_IRQS(vbasedev, &irq_set);
 }
 
 void vfio_mask_single_irqindex(VFIODevice *vbasedev, int index)
@@ -96,7 +96,7 @@ void vfio_mask_single_irqindex(VFIODevice *vbasedev, int index)
         .count = 1,
     };
 
-    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
+    VDEV_SET_IRQS(vbasedev, &irq_set);
 }
 
 static inline const char *action_to_str(int action)
@@ -177,9 +177,7 @@ int vfio_set_irq_signaling(VFIODevice *vbasedev, int index, int subindex,
     pfd = (int32_t *)&irq_set->data;
     *pfd = fd;
 
-    if (ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, irq_set)) {
-        ret = -errno;
-    }
+    ret = VDEV_SET_IRQS(vbasedev, irq_set);
     g_free(irq_set);
 
     if (!ret) {
@@ -214,6 +212,7 @@ void vfio_region_write(void *opaque, hwaddr addr,
         uint32_t dword;
         uint64_t qword;
     } buf;
+    int ret;
 
     switch (size) {
     case 1:
@@ -233,13 +232,15 @@ void vfio_region_write(void *opaque, hwaddr addr,
         break;
     }
 
-    if (pwrite(vbasedev->fd, &buf, size, region->fd_offset + addr) != size) {
+    ret = VDEV_REGION_WRITE(vbasedev, region->nr, addr, size, &buf);
+    if (ret != size) {
+        const char *err = ret < 0 ? strerror(-ret) : "short write";
+
         error_report("%s(%s:region%d+0x%"HWADDR_PRIx", 0x%"PRIx64
-                     ",%d) failed: %m",
+                     ",%d) failed: %s",
                      __func__, vbasedev->name, region->nr,
-                     addr, data, size);
+                     addr, data, size, err);
     }
-
     trace_vfio_region_write(vbasedev->name, region->nr, addr, data, size);
 
     /*
@@ -265,13 +266,18 @@ uint64_t vfio_region_read(void *opaque,
         uint64_t qword;
     } buf;
     uint64_t data = 0;
+    int ret;
+
+    ret = VDEV_REGION_READ(vbasedev, region->nr, addr, size, &buf);
+    if (ret != size) {
+        const char *err = ret < 0 ? strerror(-ret) : "short read";
 
-    if (pread(vbasedev->fd, &buf, size, region->fd_offset + addr) != size) {
-        error_report("%s(%s:region%d+0x%"HWADDR_PRIx", %d) failed: %m",
+        error_report("%s(%s:region%d+0x%"HWADDR_PRIx", %d) failed: %s",
                      __func__, vbasedev->name, region->nr,
-                     addr, size);
+                     addr, size, err);
         return (uint64_t)-1;
     }
+
     switch (size) {
     case 1:
         data = buf.byte;
@@ -2418,6 +2424,7 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
                          struct vfio_region_info **info)
 {
     size_t argsz = sizeof(struct vfio_region_info);
+    int ret;
 
     /* create region cache */
     if (vbasedev->regions == NULL) {
@@ -2436,10 +2443,11 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
 retry:
     (*info)->argsz = argsz;
 
-    if (ioctl(vbasedev->fd, VFIO_DEVICE_GET_REGION_INFO, *info)) {
+    ret = VDEV_GET_REGION_INFO(vbasedev, *info);
+    if (ret != 0) {
         g_free(*info);
         *info = NULL;
-        return -errno;
+        return ret;
     }
 
     if ((*info)->argsz > argsz) {
@@ -2600,6 +2608,75 @@ int vfio_eeh_as_op(AddressSpace *as, uint32_t op)
  * Traditional ioctl() based io_ops
  */
 
+static int vfio_io_get_info(VFIODevice *vbasedev, struct vfio_device_info *info)
+{
+    int ret;
+
+    ret = ioctl(vbasedev->fd, VFIO_DEVICE_GET_INFO, info);
+
+    return ret < 0 ? -errno : ret;
+}
+
+static int vfio_io_get_region_info(VFIODevice *vbasedev,
+                                   struct vfio_region_info *info)
+{
+    int ret;
+
+    ret = ioctl(vbasedev->fd, VFIO_DEVICE_GET_REGION_INFO, info);
+
+    return ret < 0 ? -errno : ret;
+}
+
+static int vfio_io_get_irq_info(VFIODevice *vbasedev,
+                                struct vfio_irq_info *info)
+{
+    int ret;
+
+    ret = ioctl(vbasedev->fd, VFIO_DEVICE_GET_IRQ_INFO, info);
+
+    return ret < 0 ? -errno : ret;
+}
+
+static int vfio_io_set_irqs(VFIODevice *vbasedev, struct vfio_irq_set *irqs)
+{
+    int ret;
+
+    ret = ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, irqs);
+
+    return ret < 0 ? -errno : ret;
+}
+
+static int vfio_io_region_read(VFIODevice *vbasedev, uint8_t index, off_t off,
+                               uint32_t size, void *data)
+{
+    struct vfio_region_info *info = vbasedev->regions[index];
+    int ret;
+
+    ret = pread(vbasedev->fd, data, size, info->offset + off);
+
+    return ret < 0 ? -errno : ret;
+}
+
+static int vfio_io_region_write(VFIODevice *vbasedev, uint8_t index, off_t off,
+                                uint32_t size, void *data)
+{
+    struct vfio_region_info *info = vbasedev->regions[index];
+    int ret;
+
+    ret = pwrite(vbasedev->fd, data, size, info->offset + off);
+
+    return ret < 0 ? -errno : ret;
+}
+
+VFIODevIO vfio_dev_io_ioctl = {
+    .get_info = vfio_io_get_info,
+    .get_region_info = vfio_io_get_region_info,
+    .get_irq_info = vfio_io_get_irq_info,
+    .set_irqs = vfio_io_set_irqs,
+    .region_read = vfio_io_region_read,
+    .region_write = vfio_io_region_write,
+};
+
 static int vfio_io_dma_map(VFIOContainer *container,
                            struct vfio_iommu_type1_dma_map *map)
 {
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 35b6551..4524342 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -43,6 +43,14 @@
 #include "migration/blocker.h"
 #include "migration/qemu-file.h"
 
+/* convenience macros for PCI config space */
+#define VDEV_CONFIG_READ(vbasedev, off, size, data) \
+    VDEV_REGION_READ((vbasedev), VFIO_PCI_CONFIG_REGION_INDEX, (off), \
+                     (size), (data))
+#define VDEV_CONFIG_WRITE(vbasedev, off, size, data) \
+    VDEV_REGION_WRITE((vbasedev), VFIO_PCI_CONFIG_REGION_INDEX, (off), \
+                      (size), (data))
+
 #define TYPE_VFIO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
 
 static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
@@ -402,7 +410,7 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
         fds[i] = fd;
     }
 
-    ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_SET_IRQS, irq_set);
+    ret = VDEV_SET_IRQS(&vdev->vbasedev, irq_set);
 
     g_free(irq_set);
 
@@ -775,14 +783,16 @@ static void vfio_update_msi(VFIOPCIDevice *vdev)
 
 static void vfio_pci_load_rom(VFIOPCIDevice *vdev)
 {
+    VFIODevice *vbasedev = &vdev->vbasedev;
     struct vfio_region_info *reg_info;
     uint64_t size;
     off_t off = 0;
     ssize_t bytes;
+    int ret;
 
-    if (vfio_get_region_info(&vdev->vbasedev,
-                             VFIO_PCI_ROM_REGION_INDEX, &reg_info)) {
-        error_report("vfio: Error getting ROM info: %m");
+    ret = vfio_get_region_info(vbasedev, VFIO_PCI_ROM_REGION_INDEX, &reg_info);
+    if (ret < 0) {
+        error_report("vfio: Error getting ROM info: %s", strerror(-ret));
         return;
     }
 
@@ -807,18 +817,19 @@ static void vfio_pci_load_rom(VFIOPCIDevice *vdev)
     memset(vdev->rom, 0xff, size);
 
     while (size) {
-        bytes = pread(vdev->vbasedev.fd, vdev->rom + off,
-                      size, vdev->rom_offset + off);
+        bytes = VDEV_REGION_READ(vbasedev, VFIO_PCI_ROM_REGION_INDEX, off,
+                                 size, vdev->rom + off);
         if (bytes == 0) {
             break;
         } else if (bytes > 0) {
             off += bytes;
             size -= bytes;
         } else {
-            if (errno == EINTR || errno == EAGAIN) {
+            if (bytes == -EINTR || bytes == -EAGAIN) {
                 continue;
             }
-            error_report("vfio: Error reading device ROM: %m");
+            error_report("vfio: Error reading device ROM: %s",
+                         strerror(-bytes));
             break;
         }
     }
@@ -906,11 +917,10 @@ static const MemoryRegionOps vfio_rom_ops = {
 
 static void vfio_pci_size_rom(VFIOPCIDevice *vdev)
 {
+    VFIODevice *vbasedev = &vdev->vbasedev;
     uint32_t orig, size = cpu_to_le32((uint32_t)PCI_ROM_ADDRESS_MASK);
-    off_t offset = vdev->config_offset + PCI_ROM_ADDRESS;
     DeviceState *dev = DEVICE(vdev);
     char *name;
-    int fd = vdev->vbasedev.fd;
 
     if (vdev->pdev.romfile || !vdev->pdev.rom_bar) {
         /* Since pci handles romfile, just print a message and return */
@@ -927,11 +937,12 @@ static void vfio_pci_size_rom(VFIOPCIDevice *vdev)
      * Use the same size ROM BAR as the physical device.  The contents
      * will get filled in later when the guest tries to read it.
      */
-    if (pread(fd, &orig, 4, offset) != 4 ||
-        pwrite(fd, &size, 4, offset) != 4 ||
-        pread(fd, &size, 4, offset) != 4 ||
-        pwrite(fd, &orig, 4, offset) != 4) {
-        error_report("%s(%s) failed: %m", __func__, vdev->vbasedev.name);
+    if (VDEV_CONFIG_READ(vbasedev, PCI_ROM_ADDRESS, 4, &orig) != 4 ||
+        VDEV_CONFIG_WRITE(vbasedev, PCI_ROM_ADDRESS, 4, &size) != 4 ||
+        VDEV_CONFIG_READ(vbasedev, PCI_ROM_ADDRESS, 4, &size) != 4 ||
+        VDEV_CONFIG_WRITE(vbasedev, PCI_ROM_ADDRESS, 4, &orig) != 4) {
+
+        error_report("%s(%s) ROM access failed", __func__, vbasedev->name);
         return;
     }
 
@@ -1111,6 +1122,7 @@ static void vfio_sub_page_bar_update_mapping(PCIDevice *pdev, int bar)
 uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
 {
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
+    VFIODevice *vbasedev = &vdev->vbasedev;
     uint32_t emu_bits = 0, emu_val = 0, phys_val = 0, val;
 
     memcpy(&emu_bits, vdev->emulated_config_bits + addr, len);
@@ -1123,12 +1135,13 @@ uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
     if (~emu_bits & (0xffffffffU >> (32 - len * 8))) {
         ssize_t ret;
 
-        ret = pread(vdev->vbasedev.fd, &phys_val, len,
-                    vdev->config_offset + addr);
+        ret = VDEV_CONFIG_READ(vbasedev, addr, len, &phys_val);
         if (ret != len) {
-            error_report("%s(%s, 0x%x, 0x%x) failed: %m",
-                         __func__, vdev->vbasedev.name, addr, len);
-            return -errno;
+            const char *err = ret < 0 ? strerror(-ret) : "short read";
+
+            error_report("%s(%s, 0x%x, 0x%x) failed: %s",
+                         __func__, vbasedev->name, addr, len, err);
+            return -1;
         }
         phys_val = le32_to_cpu(phys_val);
     }
@@ -1144,15 +1157,19 @@ void vfio_pci_write_config(PCIDevice *pdev,
                            uint32_t addr, uint32_t val, int len)
 {
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
+    VFIODevice *vbasedev = &vdev->vbasedev;
     uint32_t val_le = cpu_to_le32(val);
+    int ret;
 
     trace_vfio_pci_write_config(vdev->vbasedev.name, addr, val, len);
 
     /* Write everything to VFIO, let it filter out what we can't write */
-    if (pwrite(vdev->vbasedev.fd, &val_le, len, vdev->config_offset + addr)
-                != len) {
-        error_report("%s(%s, 0x%x, 0x%x, 0x%x) failed: %m",
-                     __func__, vdev->vbasedev.name, addr, val, len);
+    ret = VDEV_CONFIG_WRITE(vbasedev, addr, len, &val_le);
+    if (ret != len) {
+        const char *err = ret < 0 ? strerror(-ret) : "short write";
+
+        error_report("%s(%s, 0x%x, 0x%x, 0x%x) failed: %s",
+                     __func__, vbasedev->name, addr, val, len, err);
     }
 
     /* MSI/MSI-X Enabling/Disabling */
@@ -1240,10 +1257,13 @@ static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
     int ret, entries;
     Error *err = NULL;
 
-    if (pread(vdev->vbasedev.fd, &ctrl, sizeof(ctrl),
-              vdev->config_offset + pos + PCI_CAP_FLAGS) != sizeof(ctrl)) {
-        error_setg_errno(errp, errno, "failed reading MSI PCI_CAP_FLAGS");
-        return -errno;
+    ret = VDEV_CONFIG_READ(&vdev->vbasedev, pos + PCI_CAP_FLAGS,
+                           sizeof(ctrl), &ctrl);
+    if (ret != sizeof(ctrl)) {
+        const char *err = ret < 0 ? strerror(-ret) : "short read";
+
+        error_setg(errp, "failed reading MSI PCI_CAP_FLAGS %s", err);
+        return ret;
     }
     ctrl = le16_to_cpu(ctrl);
 
@@ -1445,33 +1465,39 @@ static void vfio_pci_relocate_msix(VFIOPCIDevice *vdev, Error **errp)
  */
 static void vfio_msix_early_setup(VFIOPCIDevice *vdev, Error **errp)
 {
+    VFIODevice *vbasedev = &vdev->vbasedev;
     uint8_t pos;
     uint16_t ctrl;
     uint32_t table, pba;
-    int fd = vdev->vbasedev.fd;
     VFIOMSIXInfo *msix;
+    int ret;
 
     pos = pci_find_capability(&vdev->pdev, PCI_CAP_ID_MSIX);
     if (!pos) {
         return;
     }
 
-    if (pread(fd, &ctrl, sizeof(ctrl),
-              vdev->config_offset + pos + PCI_MSIX_FLAGS) != sizeof(ctrl)) {
-        error_setg_errno(errp, errno, "failed to read PCI MSIX FLAGS");
-        return;
+    ret = VDEV_CONFIG_READ(vbasedev, pos + PCI_MSIX_FLAGS,
+                           sizeof(ctrl), &ctrl);
+    if (ret != sizeof(ctrl)) {
+        const char *err = ret < 0 ? strerror(-ret) : "short read";
+
+        error_setg(errp, "failed to read PCI MSIX FLAGS %s", err);
     }
 
-    if (pread(fd, &table, sizeof(table),
-              vdev->config_offset + pos + PCI_MSIX_TABLE) != sizeof(table)) {
-        error_setg_errno(errp, errno, "failed to read PCI MSIX TABLE");
-        return;
+    ret = VDEV_CONFIG_READ(vbasedev, pos + PCI_MSIX_TABLE,
+                           sizeof(table), &table);
+    if (ret != sizeof(table)) {
+        const char *err = ret < 0 ? strerror(-ret) : "short read";
+
+        error_setg(errp, "failed to read PCI MSIX TABLE %s", err);
     }
 
-    if (pread(fd, &pba, sizeof(pba),
-              vdev->config_offset + pos + PCI_MSIX_PBA) != sizeof(pba)) {
-        error_setg_errno(errp, errno, "failed to read PCI MSIX PBA");
-        return;
+    ret = VDEV_CONFIG_READ(vbasedev, pos + PCI_MSIX_PBA, sizeof(pba), &pba);
+    if (ret != sizeof(pba)) {
+        const char *err = ret < 0 ? strerror(-ret) : "short read";
+
+        error_setg(errp, "failed to read PCI MSIX PBA %s", err);
     }
 
     ctrl = le16_to_cpu(ctrl);
@@ -1609,7 +1635,6 @@ static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled)
 static void vfio_bar_prepare(VFIOPCIDevice *vdev, int nr)
 {
     VFIOBAR *bar = &vdev->bars[nr];
-
     uint32_t pci_bar;
     int ret;
 
@@ -1619,10 +1644,12 @@ static void vfio_bar_prepare(VFIOPCIDevice *vdev, int nr)
     }
 
     /* Determine what type of BAR this is for registration */
-    ret = pread(vdev->vbasedev.fd, &pci_bar, sizeof(pci_bar),
-                vdev->config_offset + PCI_BASE_ADDRESS_0 + (4 * nr));
+    ret = VDEV_CONFIG_READ(&vdev->vbasedev, PCI_BASE_ADDRESS_0 + (4 * nr),
+                           sizeof(pci_bar), &pci_bar);
     if (ret != sizeof(pci_bar)) {
-        error_report("vfio: Failed to read BAR %d (%m)", nr);
+        const char *err =  ret < 0 ? strerror(-ret) : "short read";
+
+        error_report("vfio: Failed to read BAR %d (%s)", nr, err);
         return;
     }
 
@@ -2170,8 +2197,9 @@ static void vfio_pci_pre_reset(VFIOPCIDevice *vdev)
 
 static void vfio_pci_post_reset(VFIOPCIDevice *vdev)
 {
+    VFIODevice *vbasedev = &vdev->vbasedev;
     Error *err = NULL;
-    int nr;
+    int ret, nr;
 
     vfio_intx_enable(vdev, &err);
     if (err) {
@@ -2179,13 +2207,16 @@ static void vfio_pci_post_reset(VFIOPCIDevice *vdev)
     }
 
     for (nr = 0; nr < PCI_NUM_REGIONS - 1; ++nr) {
-        off_t addr = vdev->config_offset + PCI_BASE_ADDRESS_0 + (4 * nr);
+        off_t addr = PCI_BASE_ADDRESS_0 + (4 * nr);
         uint32_t val = 0;
         uint32_t len = sizeof(val);
 
-        if (pwrite(vdev->vbasedev.fd, &val, len, addr) != len) {
-            error_report("%s(%s) reset bar %d failed: %m", __func__,
-                         vdev->vbasedev.name, nr);
+        ret = VDEV_CONFIG_WRITE(vbasedev, addr, len, &val);
+        if (ret != len) {
+            const char *err = ret < 0 ? strerror(-ret) : "short write";
+
+            error_report("%s(%s) reset bar %d failed: %s", __func__,
+                         vbasedev->name, nr, err);
         }
     }
 
@@ -2632,7 +2663,7 @@ static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
 
     irq_info.index = VFIO_PCI_ERR_IRQ_INDEX;
 
-    ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_GET_IRQ_INFO, &irq_info);
+    ret = VDEV_GET_IRQ_INFO(vbasedev, &irq_info);
     if (ret) {
         /* This can fail for an old kernel or legacy PCI dev */
         trace_vfio_populate_device_get_irq_info_failure(strerror(errno));
@@ -2751,8 +2782,10 @@ static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
         return;
     }
 
-    if (ioctl(vdev->vbasedev.fd,
-              VFIO_DEVICE_GET_IRQ_INFO, &irq_info) < 0 || irq_info.count < 1) {
+    if (VDEV_GET_IRQ_INFO(&vdev->vbasedev, &irq_info) < 0) {
+        return;
+    }
+    if (irq_info.count < 1) {
         return;
     }
 
@@ -2830,6 +2863,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     vdev->vbasedev.ops = &vfio_pci_ops;
     vdev->vbasedev.type = VFIO_DEVICE_TYPE_PCI;
     vdev->vbasedev.dev = DEVICE(vdev);
+    vdev->vbasedev.io_ops = &vfio_dev_io_ioctl;
 
     tmp = g_strdup_printf("%s/iommu_group", vdev->vbasedev.sysfsdev);
     len = readlink(tmp, group_path, sizeof(group_path));
-- 
1.8.3.1


