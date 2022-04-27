Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB7451139E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 10:39:17 +0200 (CEST)
Received: from localhost ([::1]:39694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njdCd-0000d6-S5
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 04:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1njd4S-0005Gv-Dh
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 04:30:52 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:51826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1njd4P-0005vX-Oj
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 04:30:47 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23R5nPpC011361;
 Wed, 27 Apr 2022 08:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=/0A77trSN3lAKVdjWMt7Tg47i3aJyYUsoTLxaQgRcJc=;
 b=O3sk40S7HC12YOLEkoI+ECrop4oRt1Kph9dQ10XSG9zyUqrJlHhxbsOePv3Ulc1+kq9c
 lsrfAQKoAO5vHzUxxDSWgfs1VslIgxPNBlAlOHWEBJhgDkdruA1AEbkjVJ9+Y2rnUtW2
 qmjHa0pjKtbJKkPY4w2ZfGZs938Q8Pp/LEj1FTlb9xBv6dsPH4YjW4IGWuP3yi/e4Q12
 LYckqDzl1rd31ffMdMo+voGNlXtEwrO0DEUmkJk+7jLEG6z3Emm70tr8T2GtE+v0QF52
 eobeyfl9Poa61AWEHybQtaE+x3Pw58fgFXvqhbLFs1PcKnH5Vwm35OJJ1cwh4J6n7wUx Yg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmaw4gc24-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Apr 2022 08:30:43 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23R8B8bq028095; Wed, 27 Apr 2022 08:30:42 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2048.outbound.protection.outlook.com [104.47.56.48])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fm7w4b4f2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Apr 2022 08:30:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZzzX0QS4rk8Tla/px3MDFYk1tnnXTlwvCjb71h2zM9Y8YKnY0FY9PauXHDJOXp0zt6yLE+hIYglkDa/3VU3eICx1CjlgjZfg58ZgW6Z0/9DYIKWcXEBUMaVL/vg6mxM1IkgKGb2pYRuVtQqcgTZ4HoFmoI1E5YHqQXUuPV3D9uEnmjhfYoIBj4Q3MlKZZEd18nfZ/g+T8yCQ9bY4fBdPWRa8g0i8IMTVsDjgvrM2FPR5YE1zDn/cMGQqX6NuhiFzD0c+pBLr39Sf/V6CWOLE4D8tXfD3LqPdW7e/dnrhUNhWOiyxIQgPhKGWjIK0HJ2S1cgjYLg2/nffeVxmm6HBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0A77trSN3lAKVdjWMt7Tg47i3aJyYUsoTLxaQgRcJc=;
 b=OBaPbPAwEWSK9867Hz2915bijZ4IK4BQi8WVpF7Ta85X75MTuUuKn6zWqdvG0NLu2X+cBsPWdWw89h73kcEToaJl66oDxpz+u8cYVTw869x31B6daQ2wYbPCdUgznIg2LiKbvEM19JAhP7mp65d81STyfF34nNa/p+VfWNlmQCOOChnwsHzNRPvAlys8WWLLM5zGnQXAU/37zibKkTJ0l2ZmiZ3cYRYEPiINnfGK9Y6Rl4CmEhKIS/x1yPUcxASCy1QVskaCJaUfdUB3dKp/hkMVc099ROgMGRp8wjK3k6cyM4XTIHvhumjmt9p/ObZj86/cmZTFuD4Oio47LFEOQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0A77trSN3lAKVdjWMt7Tg47i3aJyYUsoTLxaQgRcJc=;
 b=LWWw1AbV9F/ycixt2s91r7TPQ2dtZbpfmX/foPyRMv+hyUW9XIW6cZJrkWansgVVjFnphQucXG1VhWlgOLlNytcN55QHBJnYennN31IUhO5vwSnZ0zW3qS3DFEqa8k2sBH2XPcstVAmWwmLqkMSoL5+bu76WdARgnri6u0TEe64=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by CY4PR10MB2007.namprd10.prod.outlook.com (2603:10b6:903:123::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 08:30:34 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 08:30:34 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] virtio-net: setup vhost_dev and notifiers for cvq only
 when feature is negotiated
Date: Wed, 27 Apr 2022 01:30:12 -0700
Message-Id: <1651048216-3365-2-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651048216-3365-1-git-send-email-si-wei.liu@oracle.com>
References: <1651048216-3365-1-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0030.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::43) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45efa4b8-c274-4b93-ce7d-08da28283294
X-MS-TrafficTypeDiagnostic: CY4PR10MB2007:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB200772838F0AF9B1564EE319B1FA9@CY4PR10MB2007.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TjrkRI/I0pg+RiLzQO/CyUf4cF+Osa+ZucDz+/qxmODEeex7+jCjzMVGJXUkY8juXO//MoBoy018bk2kL8xcy5haG4DMPPfob47rrow+K6UJaFh90BdHpjLMLIrSkcP5f1/sqZEiPeJLeqPhV03xzcRPepwE7vrnJ00JPVfhjkQ19dss9Uv22XQD7xZAD4Wu7m/Fcd98+8A48bCUM1nCNctGBMT/BqKCx7wRloD7mqTSLCQ6I+WFr9svv3TuvYvruiyjPBl2ao63Xq5KBVwOSEkEv316J9o+z0BzH6KQFViHKKXYF0QbHA6Kj3MiDKbxjFxXLa2iSQ5A98coZuliG4F7B7lRlHzpV5zyoOPWIo5fS/GhqlB2/O4l48fpTKHnlA+CeEXBI7qo5ia8ENAHR2BoFwyDxSyAe4T0niP4J8Pi2tFSOKi1foQwWzAkFIFjTdbYwHyTN/HaZLzsjLPj1I9bVJDQPrnZYbBZ7LshuPIrM2NwDYXwplcE2TqKKwW27epoTrKEhvmteuvONRaZYag1JovBD0UbFfUa67GCBvKMkI4+pYOiIZjbuAVAZIgDWsQUaG9gvhSLQxoQsOAICvN8sXN1cIJSq5U/9MLpDLsNIbUXrM4PP+J7QRPYuU7Er5L3mc4oLoKHosBeWzR53aHg+DpEM8/ol12YwQGMe1XOYHnbp9G8aNh1oyKhV3hqxnpNWNMB/iD8UNSYpIjk5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38350700002)(36756003)(2906002)(316002)(508600001)(38100700002)(107886003)(4326008)(6666004)(6506007)(6512007)(52116002)(6486002)(83380400001)(8676002)(186003)(66476007)(66946007)(66556008)(6916009)(86362001)(5660300002)(8936002)(26005)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tOxNhYoaS7eF9iLN+1Bkd2pvzszPWu8rJNCVD0S5+tWpQ0spLGWbC1hnDKbd?=
 =?us-ascii?Q?SCAtGNSaWKLCsbAvfUQy0gfqVEbkl071JKkZ1CAXfut+qfUWPcFjnMpK8zVf?=
 =?us-ascii?Q?O4TtfSQ/DIz8Fhe9AAFGMQ6jgAOuvgzgSg6vO8LIDYplXCRNpFdpjG2EnCWU?=
 =?us-ascii?Q?OjnXptgEggw21k4sxfdO4++gQX3W85uHfQekxLlL0HSTtXtFbkDDF6PQViy4?=
 =?us-ascii?Q?KMrLQdxwTVop694jZAld6mtRPW4tnP9PeGsjgLrnuNbA4h/JD/pLo9vIiX6a?=
 =?us-ascii?Q?3/ie3jPHxFpdZ5rhlGdyjGlxSG4nIpUXNegF8p9ewDUoN9d8TIM0AXZwOa98?=
 =?us-ascii?Q?zycf52T99kxzj9KkUPfBLwksD9DovqBqeElVkuYX+bliYg/tOm5FH1mTGoKz?=
 =?us-ascii?Q?PO4Bgm9HdaVWbTaEOlwcwAKAqnOzjb1PpgGYL4aZ+7ekSNmAhsenMGOz/U0K?=
 =?us-ascii?Q?CkkEkhmKjiaxYL+Tn5bhJtbSXWnsOOI91RCDO+lmBxiTB4oEcKoSegFLAH/s?=
 =?us-ascii?Q?mWdv2cZ6dbdPXRE7RjILzJafvftECEBVW733Jyd0D4YxR2B1Qs4wFM/Zosay?=
 =?us-ascii?Q?K+1Qlo2cL/VHGFjFxuI62mcheP/46SdKDEAVaPCBW9C6JAtw7NUwF5cY+D4p?=
 =?us-ascii?Q?3qAJWUaJ4jTC2Z2cj+CHdetfbM4McqqZoagG58K8tAjC33mo90dck7z8i0Tp?=
 =?us-ascii?Q?rY3iedESgOjlofrF6UBDOOQkVdlqOt1s483VStGo2LFlanZmIQ9BzyvZEi77?=
 =?us-ascii?Q?Co6L5K+PqygNmll2koEOLSlcQxutZOc8SLS/Vml4D08YS1FonUCRVY/OZXU4?=
 =?us-ascii?Q?WM4YUTfRL1CQWIJWDLnDbguxlxFRuk6iSzwr41KRNUbhATNvAK7vi3en7eJL?=
 =?us-ascii?Q?si9eWQr/aolIQHpBpS9wy48FiadMAOxl5lCriDsf3YILk0Ccpo9Pz5oOpjxm?=
 =?us-ascii?Q?pqgnk02vRY5pDdyAUYZA8bkU/KYE5lfp09Nt3RSpvt90cYKp2xR0VkSzp6e9?=
 =?us-ascii?Q?6gbbmw9htCah2Y/9SBpdGwHTVfJt6tGWVYvKmPU2nYoNDGYYC/zGmqe/QYY7?=
 =?us-ascii?Q?jCbcRstFAW0ufAuMiuFYPIEjkvOYc9NS/G5rL3jElhXHhte4yOXvR3WjRGZX?=
 =?us-ascii?Q?Fs1G6G9PpvAsrBqfYPDYcc5FozNS0hO9J1KqB2F1VFejIjn6GTjNuKnEuUx6?=
 =?us-ascii?Q?zZmFL7MPkLPuTtKfnka8x473IOl8atvcXxviahjRhw9n2KCDdnql51jqGckX?=
 =?us-ascii?Q?dzFoIMyV2v7obcSFS6ako1ShWJiutLSXbLqbQj98Dzlcfqa0plXUQv4NqzAt?=
 =?us-ascii?Q?n3xSy1SOn9TNfMx/xn2uaXn1HPdGJG+Kzqg44pAQxpOIJcUrHCB8QWgUloYP?=
 =?us-ascii?Q?lW6Sx7rVzVYrMkZErNb53Yg9/4UBB0VnKAxlt+SQMUpE6Y0EvI8ipOhB+5Sq?=
 =?us-ascii?Q?LcOGQJguZyTjxUNYvBBpBO4qg7LRHgfOQ/e3wiNCrFBxuZRMWqyMxSVCDF0/?=
 =?us-ascii?Q?VaEiCKHqyDJNvIcY6zGMDk36qOc7PDeqnDkL3h92j0UeFfD4EAs1ws870pBb?=
 =?us-ascii?Q?Xejlv1C0poPvqXf0N6o7jAMhWJZWwWdEXxQ6Dxry+6jMG+a3WFTeBxONzItc?=
 =?us-ascii?Q?Rh4LLaXmBew5f3ON2Wcw1e2ibsWmxRa6C40F6tQZ4tdi0XsmkY09Sw/OfzSP?=
 =?us-ascii?Q?txidq2bUZIOefNMnbU9vDa4lb9TpkfjG6i5y2m+7gB9aQFnJ7i+A6mz87ZdC?=
 =?us-ascii?Q?ofrroJsDIGqo2US51XBRp1DVP26puuA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45efa4b8-c274-4b93-ce7d-08da28283294
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 08:30:34.0481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0P+0HEMxJIFU0s9oBlwG59xI21Nj826gq3mBUQZNvljXD6zY//uPOeIDX3ybq8yzwhlqPh9YVVZEPWbKu0Dmrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB2007
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-27_02:2022-04-26,
 2022-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 adultscore=0
 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204270055
X-Proofpoint-GUID: MQVPGkb_EYhMzr3E6eIAsjw8Y-8jx8oK
X-Proofpoint-ORIG-GUID: MQVPGkb_EYhMzr3E6eIAsjw8Y-8jx8oK
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: mst@redhat.com, jasowang@redhat.com, eperezma@redhat.com, eli@mellanox.com,
 si-wei.liu@oracle.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the control virtqueue feature is absent or not negotiated,
vhost_net_start() still tries to set up vhost_dev and install
vhost notifiers for the control virtqueue, which results in
erroneous ioctl calls with incorrect queue index sending down
to driver. Do that only when needed.

Fixes: 22288fe ("virtio-net: vhost control virtqueue support")
Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
---
 hw/net/virtio-net.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 1067e72..ffb3475 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -245,7 +245,8 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
     NetClientState *nc = qemu_get_queue(n->nic);
     int queue_pairs = n->multiqueue ? n->max_queue_pairs : 1;
-    int cvq = n->max_ncs - n->max_queue_pairs;
+    int cvq = virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
+              n->max_ncs - n->max_queue_pairs : 0;
 
     if (!get_vhost_net(nc->peer)) {
         return;
-- 
1.8.3.1


