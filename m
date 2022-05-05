Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E282051C697
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:54:48 +0200 (CEST)
Received: from localhost ([::1]:44952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfgd-0003NH-Vm
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0z-0006B1-VL
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:45 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:61234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0s-0002CZ-Np
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:43 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245FTeZd018676
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=JiPoLDm1MhM6XJC7ZtMToKKXD3MriMPOj96SvoxCsNo=;
 b=pHElXzxuUbwzNg7JRUhNY/9eNDJlZrDJSE46bDacgFPhAhX9zBPP4c3vYABXMKDrP09l
 PrptoexbuJ9FhUoETYDUw5paEbYsbNC95kX1DLQ5YwB4E5xni+8Npo8h8YDqSbRidA7S
 07gOF1wfxpBT6GVHBDpTc28nX9807kOHhhHwM/d2M0/vL1k4G5+ay6x6Xt4+joE9jSYx
 FfRGJ9g3Odu7ilmo6qK8mFZA7OE0t1OtO4CU95Ne/ewxDXJFvHphyQH9bPCtQd6tyHUv
 X2J7yvtS5sveWV0Oa96hgQnzv7H4iKVGTPcIjblrWldT3T3kQDfCS90m5T48yFW0jNoa Bw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frwntc3kp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:26 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245H1bbB018946
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:25 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fusah2ebg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ql0x8nTuXADGRHdILlU5O/+QUtf5PKNvHzEQ/e/uvInufbYf4hdfLl6a9JUo6U8iq703OBWfwEcsMbWFAk0H0fkzS2lHQsKuDzqOIMVWDsifo359tVEqLzxDrHL+TuqganDKKGFXAul8FR9fQi+i9uW3vyacgNqlkzQcphUdNbi/5jRGpy45RL3tzyP0QV79/O4rUb3glZtGae5CUzC0Y6onGx+b6XVbwaiOJUI24na9vXSqaq1TWAAoRVCgJ8MkAcb1gkfLXm2Xi+uu5KFF8QgrSZqelwVAG46aIN2x1OypM91b2ltrHdmfpMZ9l/IzwwAzZFb3iC3kZUohHyRrEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JiPoLDm1MhM6XJC7ZtMToKKXD3MriMPOj96SvoxCsNo=;
 b=Y81EnCXtfwTlsO+8QmTeBMh00CbkvQc/03vpMvF6brKdqB4ryLluIdS+g0E1JjHcmfmCZnVrwpd8/zDRW2yBlc9ZvyJq9jEybZaK2tRi1ymZT7VFN3Z+C+tvLY07MPEXN1k4+5aLMAH9hQdnxvShrNR+u6jtEASuqbDgsAFKk9WDTNbDH4wioI3oSKe+Dp7gF9FTz98J9usUQqflk/TRxCjZSjeklcSU0Tg26XA6ei0S4bcNYnjR9WhdlEzBCLx2e4MLnsHeH0IKCnEa2pZElSMoAgiXwmWJChoN4kcFQjfgxdq1V5jjGvLlS1iu65x4WWxdUVuXW9/N5qlvhI76ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JiPoLDm1MhM6XJC7ZtMToKKXD3MriMPOj96SvoxCsNo=;
 b=0IORLAr6RAaQpMsAxGzajt2OYwPMEhbEvSK1rYy9mYwy7C41QThTWyxXclSSBgKI6IQAhN0qUAp9Br0c+tTac/dKD7hK+WyDLoDVStNLZoXwWRKQWtX/UrgtljKaTHOGZp3cD+s4V8TVYkxoqz6/Pwtz+1lk3xv/eydYnnenEJM=
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
Subject: [RFC v5 16/23] vfio-user: proxy container connect/disconnect
Date: Thu,  5 May 2022 10:19:59 -0700
Message-Id: <4f09120f9389cbaa6698f0d3351b7eb0bacbbc3d.1651709440.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1651709440.git.john.g.johnson@oracle.com>
References: <cover.1651709440.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::25) To BYAPR10MB3255.namprd10.prod.outlook.com
 (2603:10b6:a03:156::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7467b5a6-8127-4e4d-dd1a-08da2eba4690
X-MS-TrafficTypeDiagnostic: BN7PR10MB2689:EE_
X-Microsoft-Antispam-PRVS: <BN7PR10MB2689A9320FB886E44898B052B6C29@BN7PR10MB2689.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lD4Qa+SsIOu75Emml1mKN8H6ou8/bFJCchvIDR30opZ60EkHhzulAysUEkMbKa1tzZnECgX8E/2gZWaY7iRYHwF1WjcQLosBBsEiZlK427yCCtl1XZMagTmL0gpDCwmMNiZceSznfxv9x9cSRJB3z1hUzRhhkmrhh2VYVxPFGncHKzpaE5zEbAQTNhyQzyHLlNbZt+KN+PT+D5//wQw/ac1QyGSAlIuBJbiufZYU/4SIUVKqHcXDwkPwL8PXeh8gkJaynVdyn1Lb6A9q/jHiJDz6gkS5zBNTB4Od37JmruHURuZYZTFr6Cnt0tcza4lnoRps6WCPmQrxoS2TCJg0PqFDvP+Fex5yHw3qzlUHLakDCDM/PfhTB4EFUzgMOmY/SkOjpGzce4X59CA/+WXZfUN1QulyAQ3ASJHnonvZ5CnXPrZdBMiv9ibzQjjJj0Vaf6pIkIJq610cjO1YOTUMiWCcSJwvw44NY6opKrVHmqIc4thEDMr3CVRL99jDQHl31IldOLHFMW/MJWbQYF7C+N+7c2En/MUCQVmiTULQq3F8kCshbvE72bkZYBPu9nCZK1xYFNzSQpNxC4mArstQrneJJgoy/fOIlw7kgfLTxU7sgeGe5VZ+5qLZO/EU/B14Cj0aIE/CSF4l9WOmCmz2+csIQOzZ1zRlmrtHusBWqvXnHnK+NYhRKvLbSCK6UgkIqn+DLtYrYs15Lb9I+82vZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(83380400001)(6916009)(6506007)(6512007)(38350700002)(316002)(36756003)(2906002)(2616005)(26005)(66476007)(8676002)(86362001)(186003)(66556008)(66946007)(6666004)(52116002)(6486002)(5660300002)(8936002)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sZZEkA/+PvNbbzc09Y1CuN5OMoc+ntw7efyLsLdxhT73r8tXx7hHIxFJvae3?=
 =?us-ascii?Q?2lvSEUI8mr+3cOhvSC14WOyCBQxXq01yMxhukPhoX+YzvdrlJyVqEvammuFO?=
 =?us-ascii?Q?4ORMQhnbEjzp12dLMJW3XA/fdr8y5tMvrCjn9cMtu85BF8Z+/+M4zTdSpZQX?=
 =?us-ascii?Q?GOW62mAZ1Lnvoq0InMR60Nih8SmVQ/gm5ZzVrhBdCk9jko7cooDJ29MxNE/c?=
 =?us-ascii?Q?nyjVOjzHd3QLmeB2yJ28kFuy+m+/2yecJg8N6jVs77IklIFfBcwEdUmEvWEo?=
 =?us-ascii?Q?G8YCuYQKUZ5ENQjJIIfjrvUQKMu+ap1UGn4x4UcXEt+oKOt6QhWXPxZwASKP?=
 =?us-ascii?Q?OTI5qGVJ8UIFPzDg0CnfvZQ0+S/LwB0TORbG4oW4GIlvqyv1ynfm+p0AiU9c?=
 =?us-ascii?Q?hnV5bq0k6+XYIcIi+0zldKL57hN3N3KxzoG7wLLXByAuzXAA5MS7ESZuu3Pk?=
 =?us-ascii?Q?9HHZZD5HUwKO+GFcgSIPC3Bg0J68ayBy62bTZB09lU85LcnYYguNXTduMWCL?=
 =?us-ascii?Q?UyctbUfCa+pZGYwywuNgtKnA09PzYiJZjLEvx4Fgq2MULJaxjE99FMpZP6iz?=
 =?us-ascii?Q?u9rHXi/8ceDEzBzzP5NPqCB/43HCMFM8pkDwmZM0UkYs1eIWI4Cuc74bS/fJ?=
 =?us-ascii?Q?eMTpJQf1f5uXkpiEScMnDL9+Xvu+ZCCK6q0r/uD+yuWcAikgWZfYO1htAuTo?=
 =?us-ascii?Q?7rFu5umU71uGBN7zxDkMpRWxq/8+XV4LEFT0IAtfJJ9rY++1UZbpzh5WkzJM?=
 =?us-ascii?Q?43ESAvsr+YZgxL8lIzES0ZNK30AkK2gEUQ+F5PoYiQlMiGQjIoWA9jnqxLIB?=
 =?us-ascii?Q?U/uxpuTUVmgBYOHOTG0f75MFDyWz+8dJpfqTxY3vyvMglcw1IycUo45haclE?=
 =?us-ascii?Q?xP0ph+uagem4UnywXCVqAV8+pQ9QaLnuGpYNMn/MyzGgAuIY9J7ZPCeLDIZe?=
 =?us-ascii?Q?JVlK34lN1LCRSpUebwDovB333SGNca8LkXP9jMVwwiqxu0f/4Fd4ugnHQpXj?=
 =?us-ascii?Q?tnzbc/AteQjC2oOAEYkLYnsux0tvQ1q99FZy/pNXYHfGSeX+7H8bRZBl5tXj?=
 =?us-ascii?Q?/fJXRN4TPJYkGUdLn5YYYDOI4qL0Zzk8qGipzU4S5mWzEO+LoOtwdMKDyAwA?=
 =?us-ascii?Q?DKXlBHkf3Y6xSXWbxD1CJCpOy7qJsh7Z77dRoH90uAznLATcT17z3Es9fmNg?=
 =?us-ascii?Q?HludLrNSkz6vIolNGlYyGM560MdS7Rd1zwhG2mBaFidu3zlljQxZeI7pJoZr?=
 =?us-ascii?Q?75WV0XTAirzpCyYDBiyHCIprVh3XZlbGrAmcV/FUFn2+qRoFKnrLygjRc0uU?=
 =?us-ascii?Q?gnfPYWGfMgHbw72QXpiBQ6/D7FDh9T4loZZx3kp6MsNimjTMftiXJkzapcpB?=
 =?us-ascii?Q?m8cBQRIlhwAu2njOw7iXtcnS9vHKFrtB4w8vQ1PwxH+SImk3ybH812h0Faop?=
 =?us-ascii?Q?kxTTajZeO/5Ycgz08/fesifxV5eoHHacswbyCFvZaqHJg0JdlGXf5nOTgQBK?=
 =?us-ascii?Q?azfLDXI0IY1D2dhKTF+WZ+ghWliQDTVDKeKsTeQJi0b/cqBeR13Slp7HyQfn?=
 =?us-ascii?Q?IXfYlwOzptxOiY+mYwVxkoWXqJf0LepMlFJQ2WDx8YWKsX+to3xY9J9aR4fm?=
 =?us-ascii?Q?uCm/gFdkceAiD3mQMNnmm+kc0RoqPYh3OuOJ8AXJtbJeYezCUFsqdv2DWtX9?=
 =?us-ascii?Q?Q08YGRoZJyDgqMr3Sa+Q6wA6r+MCT7viDwdF47/jT/g72kl062n5a3wz+dA3?=
 =?us-ascii?Q?D7XOKh08629Av3ICQH7XFJphsWgEXM0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7467b5a6-8127-4e4d-dd1a-08da2eba4690
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 17:11:21.0290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZdw+e6M6/rDPLxCgLveOWQZGk9Sz6RN0atUq5EXysOzd4hH0aQwyNrwcsUwWajcxHcaoHFB3NV6TOOM/ALw5149XVr+HH9eioR5lY4T8wA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR10MB2689
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_06:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205050118
X-Proofpoint-ORIG-GUID: Mbn1vnbWwZ7T9SIcbb0L796smrWekuW0
X-Proofpoint-GUID: Mbn1vnbWwZ7T9SIcbb0L796smrWekuW0
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

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user.h                |   1 +
 include/hw/vfio/vfio-common.h |   3 ++
 hw/vfio/common.c              | 105 ++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/pci.c                 |  25 ++++++++++
 hw/vfio/user.c                |   3 ++
 5 files changed, 137 insertions(+)

diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index a641351..742e1a9 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -87,5 +87,6 @@ void vfio_user_set_handler(VFIODevice *vbasedev,
 int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp);
 
 extern VFIODevIO vfio_dev_io_sock;
+extern VFIOContIO vfio_cont_io_sock;
 
 #endif /* VFIO_USER_H */
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 4118b8a..59a8299 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -94,6 +94,7 @@ typedef struct VFIOContainer {
     uint64_t max_dirty_bitmap_size;
     unsigned long pgsizes;
     unsigned int dma_max_mappings;
+    VFIOProxy *proxy;
     QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
     QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
     QLIST_HEAD(, VFIOGroup) group_list;
@@ -278,6 +279,8 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp);
 void vfio_put_group(VFIOGroup *group);
 int vfio_get_device(VFIOGroup *group, const char *name,
                     VFIODevice *vbasedev, Error **errp);
+void vfio_connect_proxy(VFIOProxy *proxy, VFIOGroup *group, AddressSpace *as);
+void vfio_disconnect_proxy(VFIOGroup *group);
 
 extern const MemoryRegionOps vfio_region_ops;
 typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 351f727..beb5689 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include CONFIG_DEVICES
 #include <sys/ioctl.h>
 #ifdef CONFIG_KVM
 #include <linux/kvm.h>
@@ -2209,6 +2210,62 @@ put_space_exit:
     return ret;
 }
 
+
+#ifdef CONFIG_VFIO_USER
+
+void vfio_connect_proxy(VFIOProxy *proxy, VFIOGroup *group, AddressSpace *as)
+{
+    VFIOAddressSpace *space;
+    VFIOContainer *container;
+
+    if (QLIST_EMPTY(&vfio_group_list)) {
+        qemu_register_reset(vfio_reset_handler, NULL);
+    }
+
+    QLIST_INSERT_HEAD(&vfio_group_list, group, next);
+
+    /*
+     * try to mirror vfio_connect_container()
+     * as much as possible
+     */
+
+    space = vfio_get_address_space(as);
+
+    container = g_malloc0(sizeof(*container));
+    container->space = space;
+    container->fd = -1;
+    container->io_ops = &vfio_cont_io_sock;
+    QLIST_INIT(&container->giommu_list);
+    QLIST_INIT(&container->hostwin_list);
+    container->proxy = proxy;
+
+    /*
+     * The proxy uses a SW IOMMU in lieu of the HW one
+     * used in the ioctl() version.  Use TYPE1 with the
+     * target's page size for maximum capatibility
+     */
+    container->iommu_type = VFIO_TYPE1_IOMMU;
+    vfio_host_win_add(container, 0, (hwaddr)-1, TARGET_PAGE_SIZE);
+    container->pgsizes = TARGET_PAGE_SIZE;
+
+    container->dirty_pages_supported = true;
+    container->max_dirty_bitmap_size = VFIO_USER_DEF_MAX_XFER;
+    container->dirty_pgsizes = TARGET_PAGE_SIZE;
+
+    QLIST_INIT(&container->group_list);
+    QLIST_INSERT_HEAD(&space->containers, container, next);
+
+    group->container = container;
+    QLIST_INSERT_HEAD(&container->group_list, group, container_next);
+
+    container->listener = vfio_memory_listener;
+    memory_listener_register(&container->listener, container->space->as);
+    container->initialized = true;
+}
+
+#endif /* CONFIG_VFIO_USER */
+
+
 static void vfio_disconnect_container(VFIOGroup *group)
 {
     VFIOContainer *container = group->container;
@@ -2258,6 +2315,54 @@ static void vfio_disconnect_container(VFIOGroup *group)
     }
 }
 
+
+#ifdef CONFIG_VFIO_USER
+
+void vfio_disconnect_proxy(VFIOGroup *group)
+{
+    VFIOContainer *container = group->container;
+    VFIOAddressSpace *space = container->space;
+    VFIOGuestIOMMU *giommu, *tmp;
+    VFIOHostDMAWindow *hostwin, *next;
+
+    /*
+     * try to mirror vfio_disconnect_container()
+     * as much as possible, knowing each device
+     * is in one group and one container
+     */
+
+    QLIST_REMOVE(group, container_next);
+    group->container = NULL;
+
+    /*
+     * Explicitly release the listener first before unset container,
+     * since unset may destroy the backend container if it's the last
+     * group.
+     */
+    memory_listener_unregister(&container->listener);
+
+    QLIST_REMOVE(container, next);
+
+    QLIST_FOREACH_SAFE(giommu, &container->giommu_list, giommu_next, tmp) {
+        memory_region_unregister_iommu_notifier(
+            MEMORY_REGION(giommu->iommu), &giommu->n);
+        QLIST_REMOVE(giommu, giommu_next);
+        g_free(giommu);
+    }
+
+    QLIST_FOREACH_SAFE(hostwin, &container->hostwin_list, hostwin_next,
+                       next) {
+        QLIST_REMOVE(hostwin, hostwin_next);
+        g_free(hostwin);
+    }
+
+    g_free(container);
+    vfio_put_address_space(space);
+}
+
+#endif /* CONFIG_VFIO_USER */
+
+
 VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
 {
     VFIOGroup *group;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 0a4208b..054a2bd 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3562,6 +3562,7 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     VFIODevice *vbasedev = &vdev->vbasedev;
     SocketAddress addr;
     VFIOProxy *proxy;
+    VFIOGroup *group = NULL;
     struct vfio_device_info info;
     int ret;
     Error *err = NULL;
@@ -3608,6 +3609,19 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     vbasedev->ops = &vfio_user_pci_ops;
     vbasedev->io_ops = &vfio_dev_io_sock;
 
+    /*
+     * each device gets its own group and container
+     * make them unrelated to any host IOMMU groupings
+     */
+    group = g_malloc0(sizeof(*group));
+    group->fd = -1;
+    group->groupid = -1;
+    QLIST_INIT(&group->device_list);
+    QLIST_INSERT_HEAD(&group->device_list, vbasedev, next);
+    vbasedev->group = group;
+
+    vfio_connect_proxy(proxy, group, pci_device_iommu_address_space(pdev));
+
     ret = VDEV_GET_INFO(vbasedev, &info);
     if (ret) {
         error_setg_errno(errp, -ret, "get info failure");
@@ -3673,6 +3687,10 @@ out_teardown:
     vfio_teardown_msi(vdev);
     vfio_bars_exit(vdev);
 error:
+    if (group != NULL) {
+        vfio_disconnect_proxy(group);
+        g_free(group);
+    }
     vfio_user_disconnect(proxy);
     error_prepend(errp, VFIO_MSG_PREFIX, vdev->vbasedev.name);
 }
@@ -3681,6 +3699,13 @@ static void vfio_user_instance_finalize(Object *obj)
 {
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
     VFIODevice *vbasedev = &vdev->vbasedev;
+    VFIOGroup *group = vbasedev->group;
+
+    if (group != NULL) {
+        vfio_disconnect_proxy(group);
+        g_free(group);
+        vbasedev->group = NULL;
+    }
 
     if (vdev->msix != NULL) {
         vfio_user_msix_teardown(vdev);
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index d0140d6..9906d81 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -1337,3 +1337,6 @@ VFIODevIO vfio_dev_io_sock = {
     .region_write = vfio_user_io_region_write,
 };
 
+
+VFIOContIO vfio_cont_io_sock = {
+};
-- 
1.8.3.1


