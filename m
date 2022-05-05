Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4901751C682
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:46:31 +0200 (CEST)
Received: from localhost ([::1]:55524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfYc-0008CQ-5o
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0u-00069W-Vh
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:45 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:29488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0n-0002Er-1f
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:37 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245EeRAD026258
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=8ze8WgeNzH9Ve9OQvNlMe8Qo7pia3EkUB2Oi+2M6pEA=;
 b=J6gLghHlTt74WAwo/+oj7ZU3s65y6CE3O53oFdiTANZ0maqPguEYCMFegiFz0W//GLI5
 9PWRh9/MjML9z41nb228ZZIs/Rw4m+QliWMBZAuau3ucWU4LFyCrsZyndzpffdhMo1ur
 gdUALxF/Uecj9+1CZzf7X1R5LYU/7sO3zXF7LYOS6dIhi9embvVtMWE/cwnF59D9dyNt
 A97BTU89/PA0NTEJbzEbakYUnkepDI+aJbm3CFG7J1zDE+pP1VYYQ9TaXZyGJ81LYtOx
 br8wywxTWgRDBYE0tyJ2HSapHFeqiafqdp50oWDS1qFkvjJbahlUeids08F0g+PQZPnV 3g== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruhcbs6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:31 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245H1O7m001931
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:30 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fs1a7amx9-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRfGfMjaOVKKwMvyCIWHtMjHnY6jg83fOlYzhkKMGf81dk/QFxEw/7Iu0uXCUJa8DKw9K8/8m/fHa5Ey+CQYbASw9//uvx1BhROtkfLEiDfWsObONZlVR+YFcDrQE6/lGAZ3XrvQTLfi41tzes8VvYbyNOtjfijdQRyQkMYAHm5YvU6Q+JRjsHURg6xF5l5iYSl86G/tD8o7/FbCvoUrM5aPKPXa9tRwVAQeJ3BGCtilXgWgBffx8NQI6iMnsp6kOZ/EZifaKe/uaqoD/AU26Tq8yq6oTbEowQ2aHJtOW+ECFDR+lswlM1j8uXz+IrFt4GHu6+8+wX5PxQusad4Fhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ze8WgeNzH9Ve9OQvNlMe8Qo7pia3EkUB2Oi+2M6pEA=;
 b=KLVbm5vnE85kbD3LUbYyXf2nJWiVC0/xc7GaVUTu2Ot33NVpHACzJnRsY9fd6KhZM4vCFBZ7n4o/CS9lyyEo9Jdt8XSsl+1uqtQl4RERWtrDHOCU2HuMGCMnBvS2nWMRJMvclw1PDQIMBww+/M/ttP9ZT6lU5jQQStjERMaTw8Obdl0+d37LgrlfrMZxr6fiq++p7l75TsYOxFivB7zwIk2+PTheR41AdFNdGM939MWtfQw9ueFU40LAEbGcaS1bPqKNPVTVEjNxNIL2eUQQtAD3MC+/EoiBJ7HSR8A4jgaL5C5wljZMF0HKAM/qu2FS7tqC2G30Z/7bk+PGBQq8uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ze8WgeNzH9Ve9OQvNlMe8Qo7pia3EkUB2Oi+2M6pEA=;
 b=AmDgfeegvIxdGvqnsocN5r20ks5ZK2+uzqF2U/SWekvubty3CsNeE2DQ9knlY57JaLAdBSfSLBGKPJTQFUpfj8veCc0a4WJ2rsgDEoAT6fmK8GOrAUzbaEMumY4rbg27gz0I+QvhptH5fHnQUBNqplJpSILpUs5cvY/SiK24/Aw=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by BN7PR10MB2689.namprd10.prod.outlook.com (2603:10b6:406:c3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Thu, 5 May
 2022 17:11:28 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 17:11:28 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 23/23] vfio-user: add dirty_bitmap stub until it support
 migration
Date: Thu,  5 May 2022 10:20:06 -0700
Message-Id: <b953e81cef6399cf9bc63dcaa5d59c1471b30d32.1651709440.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1651709440.git.john.g.johnson@oracle.com>
References: <cover.1651709440.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::25) To BYAPR10MB3255.namprd10.prod.outlook.com
 (2603:10b6:a03:156::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e333a69a-8f5c-4cab-c3d5-08da2eba4823
X-MS-TrafficTypeDiagnostic: BN7PR10MB2689:EE_
X-Microsoft-Antispam-PRVS: <BN7PR10MB26890F045339FCDA91702005B6C29@BN7PR10MB2689.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MFtBX7sawlYFIonOjBDiQ5VfxGk9ULTYpH4vitIAKYVTm4/csRAgDFKf6sZ4V3aOolo87HhPJBx/RiajlVotRqr13D2vVZUQ2CAf9czlHQl/1E59ST2Tu6mnREb1vD/MUXq/Hpa5ekZHY+YJ2iFAfaauUBiLwZxWQYstUbGI0pycI4kQxVD8iptKFb0+qz1kero/BwPpCO12P/Reb3pKDwnzXltgAUfbAY+CE5zvrAIsTB6CRn99jNd7e0iAjpm+8x8onwBC7UxvOeEe8Yo2oSCSwL6KJowGiD1JpS57iDwIu7eUpZ+XPFLmGQ3F8PG7cbagrjMawTNwqHfo+LEmJPIS8u4xgyFmbAA1pSLKBEDGuuV+d/1PdHOG3k8FX+joxswqIRNyvZUieLQ+JL9bjYw3VCHHG+vnVi6mxXV/vl+5BGGoraa1zMcUpB0iPBGjfBixD8H4fbvN5RyIJsyjpaREDrYnK3jSmg+oeRUS+UqafCjy1cZJW68H7KBmuYKhfBt+2krx3bv+B6OwFlzPxZZO8HvJzqWiAlrws5nXhGymJ/z4ZypYfpeRsFSqQVi6RzZTDPI0e3K/zXaYzVtHke5jFo8TFOFnX/ihlMI4sDeBUDwkFnV/vJHm1fBos1j0NCcC/RNGnwuDUrh21blR5FSfdD7fdDwaVXY8irw/6BqV6KAyAdbz0JmFpaDDtmot3qyGm8inZJRzJ+VR4+GkUcMMYRY8ThnhXg2AOz1nkto=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(6916009)(6506007)(6512007)(38350700002)(316002)(36756003)(2906002)(2616005)(26005)(66476007)(8676002)(86362001)(186003)(66556008)(66946007)(6666004)(52116002)(6486002)(5660300002)(8936002)(508600001)(14143004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QLdsGLWtGuEpzYB3cHBRdQC21+3aoZHTTbeCdNRqzcUMsniYUEQ81N6I8ajd?=
 =?us-ascii?Q?dCVJmFyN/kq+zaqcuzrzxGRDtPBtRxvXv7zxEwMuOTNoH3HGykISA4m/qeYd?=
 =?us-ascii?Q?irfsGBgCLSNq1mere/6f5UEaDVc/RpGJcOAyLiE+K2BRTFbDFbyk+1upDnpd?=
 =?us-ascii?Q?rJgQP2iMwJUZ9Ncoj5AaXZzwQIEe+WcsRVdlbgiSEaIJFaBKs0xzHuM1M4jv?=
 =?us-ascii?Q?orJpPDr9jloLOHRucyhiT5DetQH/9vOdZDIlXRMy5n6D8i6xLD/h2tVT4m7H?=
 =?us-ascii?Q?PCTTQpMS+kJZKx2UNZdHGo2FPNeXnFgxhFieDIW9YkwFmz+YbtQRHc4vKKLm?=
 =?us-ascii?Q?NgxnxB7HRKih3iW8va0tHaQVFWTDHFUVyEE5gPwJa53K9TkaD9pXF4ByfCrn?=
 =?us-ascii?Q?gCQkCrqmJpS4A0+fOjkuRu7imAkUCtRnFf1qGmIENcky6ZKFTrpjlAIgeBSX?=
 =?us-ascii?Q?7V8wTm1wGBzBwNXoDhIDJ05Xz5Vfo3fMsrxP7irCipumhGEVZVUl4ymni8o4?=
 =?us-ascii?Q?d/JBoMEDaBvVq8bL/uIaXDg8huVca907orQuBh9ErcxS/zKqtiQjv0/9T+of?=
 =?us-ascii?Q?FR7CM95x2oWmgyM9XDnq0JYNxx9M9/2Q6ygc1I0RQYO53tOCN/9+9IW9jz0a?=
 =?us-ascii?Q?YzqZcSS0EfkuFVUQQhao6y8h88PlsQJy966excTFi89t5KCValMnQSWL/Gd+?=
 =?us-ascii?Q?l361Z84Emntzgq6MabDsmMuWjDljGcGZcx8cgx4o3rt3wRSHu8FWvne4PyPC?=
 =?us-ascii?Q?kppx5natyFC/dHkrLXr7lfKWdHVOCSZbsjBphaRyEKb876db06oQ5kl01cmW?=
 =?us-ascii?Q?fgfoykRI8rI3JE9rLFL7wRXJJN8agnFR6YZrV8r0/gFreulNClbXXRRAdsoP?=
 =?us-ascii?Q?VD1VMCRhbL79t5rKxTLIr4UXCtCfgM5QK5KrQ0UUYq8GI01fuH0moPPAMIWd?=
 =?us-ascii?Q?idxOgaFrDC9v52u7VgiLYziVo44o6pHWXaeizglUqRERG5O7IBbJlicZXBl/?=
 =?us-ascii?Q?df/SCu4WFKceGUqUNGVgoyJ4KPQjSuA5J1i60ndaxOBaRWrvs1xhLfkkNinm?=
 =?us-ascii?Q?mjd26RACKqAMkrg0HT+s4xkQb5EaGemsJr5U4w+fJYIm2MxnXepDthk6wg/a?=
 =?us-ascii?Q?dPWT3QqbdMoa/k2kZU1UJNChzHghG6lHXqql+tmEPeVBgb/XQfZdzh46vb6I?=
 =?us-ascii?Q?Vzd/FUtuFWczgxIHJ4icqKjsUanLA8HLjc30MQoEa8vbaqyFtuEUvrZlasuY?=
 =?us-ascii?Q?n7pt7TpvnC25M+7FYCznSd/zRSrzfm5ZfZEYhPg8lvHzq0xT28wN7BI6KMzC?=
 =?us-ascii?Q?xkfmYJPMqO8KpDb8e5/z7drba9YABfP4B4chSRQiWw7K0djthA0g2IY27mS/?=
 =?us-ascii?Q?rS4xoOAzgp3srPCsHHRCOMgWyQ7yINZYgSdbYg1JXbY01Dy/s3zEB/3obsYG?=
 =?us-ascii?Q?+misr1VJ894M+s9i6L243WbpS7BfKAWbUlgGCTYecgDgOhubMTUSO3VBuF4G?=
 =?us-ascii?Q?qzVesWy5UV+isRJQRFkM3CA3KDk/ZNo3bf8c1RQdEw9CEmynC97/hE08Sl7X?=
 =?us-ascii?Q?S6ZXE0i0qjWMtFr3djjs/Ws7Wl/Wsm/1du8i+N0I+6c4G9kSMBEI7q+oUFc0?=
 =?us-ascii?Q?4KsldB3vpt696RbX9d8BpXgX9tYlSfR1YA7Zsg6O8CSGkbN7W1370Rrkr1/w?=
 =?us-ascii?Q?Nfne28tr7gG3axBrDsQZzLRppUQC7F9ZLUdjPFdAAHfvrRkfz8oyLhXIOtLM?=
 =?us-ascii?Q?2K0Rn072P+LyVF6JwKgYRwwCDO3F56M=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e333a69a-8f5c-4cab-c3d5-08da2eba4823
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 17:11:23.6694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RE3pA+nb+niCo3lmJxGUHoRPAZf1CJ7bn9Ir2STYwzqRhTgRTOh+sKJP0qzBN9S11gfS3zf7cBQ+DcsiQQcwbWamM8pdS3qU2tF4foo6aPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR10MB2689
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_06:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205050118
X-Proofpoint-GUID: Y3yWEoJYKCnR1XWP_vVlMk4eXmwj5vvH
X-Proofpoint-ORIG-GUID: Y3yWEoJYKCnR1XWP_vVlMk4eXmwj5vvH
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
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

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index a3e4dc8..eb79785 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -1626,6 +1626,15 @@ static int vfio_user_io_dma_unmap(VFIOContainer *container,
                                container->async_ops);
 }
 
+static int vfio_user_io_dirty_bitmap(VFIOContainer *container,
+                        struct vfio_iommu_type1_dirty_bitmap *bitmap,
+                        struct vfio_iommu_type1_dirty_bitmap_get *range)
+{
+
+    /* vfio-user doesn't support migration */
+    return -EINVAL;
+}
+
 static void vfio_user_io_wait_commit(VFIOContainer *container)
 {
     vfio_user_wait_reqs(container->proxy);
@@ -1634,5 +1643,6 @@ static void vfio_user_io_wait_commit(VFIOContainer *container)
 VFIOContIO vfio_cont_io_sock = {
     .dma_map = vfio_user_io_dma_map,
     .dma_unmap = vfio_user_io_dma_unmap,
+    .dirty_bitmap = vfio_user_io_dirty_bitmap,
     .wait_commit = vfio_user_io_wait_commit,
 };
-- 
1.8.3.1


