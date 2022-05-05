Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ADD51C606
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:23:32 +0200 (CEST)
Received: from localhost ([::1]:48876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfCN-0000Tg-HK
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0m-00063Q-Hc
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:34 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:18670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0i-0002Cb-NN
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:32 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245F4QNM026132
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=BGLSCE8TMVyI2IuUbCHzxeNWmxLKzvzE4Tm0bcBtTvw=;
 b=B3eWrfbkj7WixJSzEtKhjuzvwwfLtJbdv2SorXWTAP86RdkduSX6Fn2MCs80ARyFbLKa
 OBodFlrAiyn40memttrCT3CTp1zdquuMH+R7JtVFB31kAE9ufjLt6yrvl5ROWzNqAFUu
 sAAh2lJwJgloUx8jc6KzN5gMAzsnfi0yc/pJa/oBSuUeNmcEJRuRFuWPnDTZXIAz3p2o
 39794RF892oy6mMU7HKQ80wZuN6B8R9nc3OVHSlTKXdTCDNt5YkgrrK9NE+BJFRqOEAZ
 0JsbwBQR3MMkHhWrm+4+DWhD/+JlvdmnXsYRl5Yux5pTTs47e6gO62Z2WV+KrEFBoMwz aw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruhcbs69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:27 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245H0Zqh006282
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:26 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fus8ybfv0-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TjcF93vpQCAXNJqdJLuPwW30U2Rl46wy1SSkKgaDlpzEj0eF4nnagC+iA6gqvf2mr8Cq8n0UUczLXSiFG6LPMM2QhpDve73bkYw5UTLbBPhCSiIOOYeGL0z5PV+eSNZFfHWk3Y3aYi8XNtk+L/YQjxRnyRch97mI52+oc4USgu3h18mJt83uAKQ9T7k1qSBRYWTlmLpy29THOrjY80ywGKIXTikCVFhlTKPZeNqVdyC5VR5CpG056OddCOlPC3Ey0fAWalJHrP+I7rxs/jeu1XKtrSVko2Z5AJv5gV9oJqfyE5NF6VIw4nPKMu2ydSKEevvMgo+ZSozERY+G+Y8inQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGLSCE8TMVyI2IuUbCHzxeNWmxLKzvzE4Tm0bcBtTvw=;
 b=GvTws8X4mGeTWbUVtXSWzaoXl8zREeVZHdCjqL38gEp1MHc+xblYA4UQ/PXw2S/3kOA1NZtMTqCDUlalki2akrWdcO0UgLgZA+ftrN1pSmyPRFrtWk3btN1YiX3pCzJOf/ztXCZQJlWVZyFJOH/Wc0Fejwrn/cWXLn9J8NeCMCFOvsDciZgXTs+DT2ietOu9T5Y67dBOiVXHAaK9NNw7FcI8d4qzr9JY3ZUdaiUVN7c5Aa++aUzz8CjZrsrORUX52KSC0JSaVT26WZxuG9q3V3Yi+pRrBW1dHTlHi4xp+ksyC0ODPZ/j78Lz7ksLO5YLQZQLjd4V7y2eyMeHAMXbNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGLSCE8TMVyI2IuUbCHzxeNWmxLKzvzE4Tm0bcBtTvw=;
 b=pWm0P/vNni313s8VnvGdtbpJQWKgyR/cPylj1qx523yYywYOEAOvoXuJ0GiCvkOfKZC8VpWrqyGZDOTv+we1ldIVNjv576YklzuyCZzys63J1nsS0Jfebr1USsI6SvN0HxyDZDDIIaC/5KrZAOPqxMgeawfv2oE1V/63gFVXLJw=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by BN7PR10MB2689.namprd10.prod.outlook.com (2603:10b6:406:c3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Thu, 5 May
 2022 17:11:25 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 17:11:25 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 18/23] vfio-user: secure DMA support
Date: Thu,  5 May 2022 10:20:01 -0700
Message-Id: <009bd0af58106715c1b5be2454a1485909c213b5.1651709440.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1651709440.git.john.g.johnson@oracle.com>
References: <cover.1651709440.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::25) To BYAPR10MB3255.namprd10.prod.outlook.com
 (2603:10b6:a03:156::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 104b1e7e-ab3e-4910-fe48-08da2eba46f4
X-MS-TrafficTypeDiagnostic: BN7PR10MB2689:EE_
X-Microsoft-Antispam-PRVS: <BN7PR10MB2689B7723BAF7BD74B852903B6C29@BN7PR10MB2689.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IJNyh+7YIo9S7dAGSCJr5fZtKAifM79snhMBj/dvZC6bk8RgqZLksMY6tusr9+A7d/2YZ2jJAgNYTFbQPMLVxTK2jbUnbdBvRziwgS76+ovBJu5U9OlFipMXcJbMSYmOEgeKKix+7gI+wtAmPZyPZzt3b1uf10l/AqqoVfpyFqrXBIFZAEA3H95CRsKxU7Sui8IDJcqY/UPyxyjyEunAYXbHt/tUtbsQYSohAcMvorrEiq5cKs9olGKttURi6z5h1hSXpsDfyTlv/xf5WlUGHJWY8wNt2KbSTcLYoqEEJNutBXJkXoC7kdpuUz7thkw6pUPtt2KzRm8UlEAhz8dSGAjQYGC7G6YHAz4xKsB5xL/Mm7l9r902ozU/pXQB3oUf1m+sHtg4nHuPzGjt7wKIQPjYR14S7JdbR8o9TCJgQn/vzWly+7SC/cFWxiz0NpyyzflkO5dqR+quhEXzVrJ38qyijpNCYWG/s0+oMdpEzACYRpGpmk0TV9ztt70dNm/fKTTqGrAKTcVm4hQrFLYl5LOVnea4u+IHTIJD0otZFwWlOhFawFeV/nZ2tMu05/XNgeSKoekitx3/JJXp6kBNMI4g3XxCi+srcmm4n1rA6Kvrtv/MTV6HrGQPSkdimxD7UV5+cUSbfhY9IGmZd43IVtz14nj8lSkLal9/Hgh2DO60jvGYmtsB8PSGI/hB0e8DV9W9+xWD2qdFJhb0+tjK8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(83380400001)(6916009)(6506007)(6512007)(38350700002)(316002)(36756003)(2906002)(2616005)(26005)(66476007)(8676002)(86362001)(186003)(66556008)(66946007)(6666004)(52116002)(6486002)(5660300002)(8936002)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s37pWdYFNT9K+45RmUtjA/mEpyfDXz1CdM9ZMFYzOFgWu3lNK8bVN0YMdvMK?=
 =?us-ascii?Q?XWGLeMwWpOZj9++Zic++buooMYj2Bs6GwZKz2uxOMZUyI2qlaKQupA43+hlc?=
 =?us-ascii?Q?KIFpj0RF579r7MGlu2jaMlNflGJ64v2lstzpRfUGzxkZf/fzbB/WS30lGhyG?=
 =?us-ascii?Q?MUiIQLqOJYyYKMT88CFITYlWztL5MszIg3pcOyGaGLBPRe+kwgN/cFiBE3Ic?=
 =?us-ascii?Q?s8ouKTFVBaIK2OMqqy/RwZ1mbcGYPW3ucFxE9+RNd5VewLmNiws+qfi20Khn?=
 =?us-ascii?Q?7YU83kRP9aYeHSJ/uxJ3tZL09n8xNo2Y8/Fh6rL9A6/hT8e8YyI/F146k1Y0?=
 =?us-ascii?Q?aqXl9+g3XOwkdsMd0Ur7D35R3QCXPpjvU4zfyH4W0RKQ+SelIiiKNyViHuNF?=
 =?us-ascii?Q?tv9nasE21rGw1q88n0Q4EbNVE6ieLvbVLfTIc6NAGk5120/w+yv2knfg3Qy9?=
 =?us-ascii?Q?w8k7yhGjoP3RU/pmfMvWpDZktu/+d/lSnggULr8II79lnd5UmbV5yv4s7GpK?=
 =?us-ascii?Q?P9ZWTeDiMkVDjtqLOqwMEebutWMU3SHe2U2tGol1jWkPD+/BtGZKHGIrzHpp?=
 =?us-ascii?Q?mysKxMBzKcpVRWTs6gtQ0mceYZdt82xTQ3RfC7oPvcM/gs84LDyo2q0mYDsc?=
 =?us-ascii?Q?aSJbiFXHy5WKm4PrlK3EuoYiFjR1fGFSjcYKwCV0zsE0rebuCmfR0X0jUQvO?=
 =?us-ascii?Q?Tr8E2RjaqMwWXpDR/7Lprlx1S8WKyiv7L6K66lOZugp7hcpAnYvpkp8hb8LL?=
 =?us-ascii?Q?CSRPOtBg0iq1Wu6MxEE7J/ylU3FPqsGkukbK/r1cfEYJpKZiBtUTSPdiM4mK?=
 =?us-ascii?Q?PV7TI4+P+/wi4YQSuX6pg+D0F7DEWCmZZTbPP/3n6t0KusVLfK0zhqRKpN9j?=
 =?us-ascii?Q?54534JqKJpR4M9mMbYah/mMm2Qr4E06m+qIobtls5lwhmQwyCIU82fnXb2vv?=
 =?us-ascii?Q?AclAnADE01G2SLiWv8N5rt16ZVt2yE90wgovHaXDSXSr5xLWQRruvOo7yDPl?=
 =?us-ascii?Q?3Ak0kMIPEOpE95j68BkmimAtygqySJjHvFKeVdwQzt4ytjaZV/S1WyFjiKVD?=
 =?us-ascii?Q?RVo7zXalrBz7qO816RgueFvIyw7286lPbG5v/2yNTxnNHzoy8i44g4Y4Cfxq?=
 =?us-ascii?Q?fojNqZ2/gwsYTm+f2a7Tk0BWRwlDEocdw4OAwFHkNLCCzXsmWMHLMaR4kwOZ?=
 =?us-ascii?Q?ZYQOUCZgk1+g0MBbfKT5+cyXwrq8KJwapNmgMQqg/fJoV1dvwO2WwSWq8jaW?=
 =?us-ascii?Q?rxx1JrPO/RwCQxjhisyQN16myXKQa4dl82cPFRorbU/1XJ/lJEXUQXaPmGTZ?=
 =?us-ascii?Q?RHcAHYQ1V+OKLGEk40Qj5usaHVPd0c8it0gCMJc75lXdnzINOu4oJ56OsQVr?=
 =?us-ascii?Q?fBkJbwJM2EpMKB/p7LXTespzohO4Jy6wRRfc+NX8SV8NPCKSV0QNOLbWI+3X?=
 =?us-ascii?Q?gWThnxJZ7NMWMWDbnUSbwo8sqKEoBhlxUcNW/dJdDHoha+vgJJZaITKM3Rye?=
 =?us-ascii?Q?9hgtWtjrxl6l2pNnP6uhnPCRDTkmIey404fgldaM5gy1uvBYjPbL14HoFTXy?=
 =?us-ascii?Q?G34iZq9pXgzSUTzR8DSNCw857CvOsGTBFOIWaMmuZebzHBBUB1iOjBHw6CoH?=
 =?us-ascii?Q?zQmXUE/7hIowxeEtogi26eY9I1+0vbPWzClNb+qRubAD7k8dBR109NVRdwbS?=
 =?us-ascii?Q?C0Kau6MsszsmOb78BrpWMfSvTCqarGeCTCtN7RTF9RtNuwKZAgb0o8MxSAxN?=
 =?us-ascii?Q?3y9Flszhj5OPraepQoWm4SIoJ9lw134=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 104b1e7e-ab3e-4910-fe48-08da2eba46f4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 17:11:21.7008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4fFC3AfIWPKPjhk/ju3mXmm3lT/7Hg3BKD5WTPX4cuZfcBAZDmQw9gZ8bi78OfQdsXbXAccW6LE2dXEbMaN8nQsZKbGUt0Co614EpYOEag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR10MB2689
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_06:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050118
X-Proofpoint-GUID: Fw-FnWEtTQW-ck9bnxeaPgzD0d8HJEfh
X-Proofpoint-ORIG-GUID: Fw-FnWEtTQW-ck9bnxeaPgzD0d8HJEfh
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

Secure DMA forces the remote process to use DMA r/w messages
instead of directly mapping guest memeory.

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.h  | 1 +
 hw/vfio/user.h | 1 +
 hw/vfio/pci.c  | 4 ++++
 hw/vfio/user.c | 2 +-
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index a4eb5b9..c207847 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -194,6 +194,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(VFIOUserPCIDevice, VFIO_USER_PCI)
 struct VFIOUserPCIDevice {
     VFIOPCIDevice device;
     char *sock_name;
+    bool secure_dma;    /* disable shared mem for DMA */
     bool send_queued;   /* all sends are queued */
     bool no_post;       /* all regions write are sync */
 };
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 742e1a9..ec764d3 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -76,6 +76,7 @@ typedef struct VFIOProxy {
 
 /* VFIOProxy flags */
 #define VFIO_PROXY_CLIENT        0x1
+#define VFIO_PROXY_SECURE        0x2
 #define VFIO_PROXY_FORCE_QUEUED  0x4
 #define VFIO_PROXY_NO_POST       0x8
 
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 054a2bd..2faf890 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3589,6 +3589,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     vbasedev->proxy = proxy;
     vfio_user_set_handler(vbasedev, vfio_user_pci_process_req, vdev);
 
+    if (udev->secure_dma) {
+        proxy->flags |= VFIO_PROXY_SECURE;
+    }
     if (udev->send_queued) {
         proxy->flags |= VFIO_PROXY_FORCE_QUEUED;
     }
@@ -3720,6 +3723,7 @@ static void vfio_user_instance_finalize(Object *obj)
 
 static Property vfio_user_pci_dev_properties[] = {
     DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
+    DEFINE_PROP_BOOL("secure-dma", VFIOUserPCIDevice, secure_dma, false),
     DEFINE_PROP_BOOL("x-send-queued", VFIOUserPCIDevice, send_queued, false),
     DEFINE_PROP_BOOL("x-no-posted-writes", VFIOUserPCIDevice, no_post, false),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 29eff8a..b08108c 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -1528,7 +1528,7 @@ static int vfio_user_io_dma_map(VFIOContainer *container, MemoryRegion *mr,
      * map->vaddr enters as a QEMU process address
      * make it either a file offset for mapped areas or 0
      */
-    if (fd != -1) {
+    if (fd != -1 && (container->proxy->flags & VFIO_PROXY_SECURE) == 0) {
         void *addr = (void *)(uintptr_t)map->vaddr;
 
         map->vaddr = qemu_ram_block_host_offset(mr->ram_block, addr);
-- 
1.8.3.1


