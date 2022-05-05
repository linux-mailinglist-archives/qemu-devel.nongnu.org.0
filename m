Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EFB51C630
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:34:43 +0200 (CEST)
Received: from localhost ([::1]:37922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfNC-0004To-UG
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0z-0006B9-W3
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:46 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:65260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0u-0002Cv-Cv
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:45 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245FTeZf018676
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=G86HGXI4UWHM7J6/zVMsbvYOcRLeBqvbRmFLKXWAxJQ=;
 b=p3RW4B/4lYWkJBSbfpZg2WNRb2LuIeRXzhjIn/Cb3GqiGuU9wWERS7rg4qhh6T/Lr8Lt
 4OwK78Y5Bgvspm1W1sVSDSvE9ea10ujExPxqiv2nYNr+cOsMQ4gxDO1KzOk0849myQ76
 rXow8U0zgu4Ej8GK33DEVqXuasn2Y7i9Y8i4Y2RTaEl0XWUOUAdZHGkLvQ7EoENvsA+x
 od3kyXJZU6tu8Igm271jF2kQSQbxTjLW/C/++3+wGlqXuJerXNw1oEzzMsgWzY4A1iQx
 lWAH5UbykqQyK/MYVZmr59rU/0jKnOOs67u5vaa4xFk6kmE9IAUtrLsdPYk7ZxiVT0pM 7Q== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frwntc3ks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:28 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245H1bPK018925
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:27 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fusah2e9b-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OvNlB/+w6d0AnXpT6XSUUJsKQVIr7j9v7kFjkEzv86K9o1d7zh7Epn/L5hw6z9Rm/ScRZZS91m3R7V51Cpab1gWjLd5YYSF/aroh8hQd04CAh3T5oFdaLTerHEF2ccpAmPg4ihmPJZ+iYj4SqBCdzwr9tP/Aiw/NJVtDBQFTTMJ/6VWIyME6Gw86iF2PbgWSFOi4nypEKzW8EPL1TWcA0bFd9UmjyULUDtf+F/Iul91Z02VebMhveeKrjxKpYoSYW+2pvPIJT9QLHoRmfrjIZuG6bB3uk8QM6gdJ7AUjtAyL+xUs1duYwkBdAUZ8UKuITggRT8S9dwSd76evT2kWJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G86HGXI4UWHM7J6/zVMsbvYOcRLeBqvbRmFLKXWAxJQ=;
 b=bpDmCdUy+KtcUMnUBCAJHxWhv7/H6YiLNVwIK2Azspk25NavBrJy1DYhLSxPC2ijYmWzl2E7xG7bRqlV/2y5PxQ3363gjMk2W6comMis0scpZjDzYt/mMAPixnIPsB7plXAY+GzQgM2C4y56GM0x8UmGTQoQnOh/uJsJhzYEO4hRN03i+Z/icee/1WmpDengskpVNmzKNbtHIpfPvi2B3fGowSajbtWCf4W61kxkB6u5DuqbWqSbLnbilUGtS3+8PPNlsjkrhgjBggToEuGkhQh7i9VZ2dxbQ+6RtHo/WD99zvitqFpMTHJnqOlKix2fcpCY0+OEnkTED/1jbRlHwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G86HGXI4UWHM7J6/zVMsbvYOcRLeBqvbRmFLKXWAxJQ=;
 b=KfpOs0/LKxw+KlFGOJDw7guOR9n7N44wBfxnNVLNqr+nWusOo5BD/dZHQsuSE9QE1v5Wl3H3awE9SKXvTTDEGw+2rLmKkA7753ga0vWwrs0Jwlq8CMTmR+8ef0FXGeeozjr9VA+UCt/s5SNeSkyYW/2JO0JYx5/PRXDwotCDDoE=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by DM5PR10MB1867.namprd10.prod.outlook.com (2603:10b6:3:10b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 17:11:22 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 17:11:22 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 13/23] vfio-user: pci_user_realize PCI setup
Date: Thu,  5 May 2022 10:19:56 -0700
Message-Id: <674df55656c1e4b77b11997ae43f002b628c21f1.1651709440.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1651709440.git.john.g.johnson@oracle.com>
References: <cover.1651709440.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::25) To BYAPR10MB3255.namprd10.prod.outlook.com
 (2603:10b6:a03:156::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95aaf345-0404-4517-d461-08da2eba45e2
X-MS-TrafficTypeDiagnostic: DM5PR10MB1867:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB18679B69CD770D739B8472BDB6C29@DM5PR10MB1867.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ByslBNWGYHvPezJWrYv31rqGumZ9Nm/45L+1d08qGOahN7lsyYkMFZMNRy34hb8nkEhpGt6TypOjEitMSoj7RXMXR1C6DPmLFhxE0i9xeCXlhEbcRbzQz7/6hKsAgjoUmE7irlhw30Nqe/m8TD1EhZRFx6Zr6H3Sxs9YdlcfQJl5GyvnQpAWu6xV0x2udwXh1WkKBm4qshjcycNONceWZdarcU37tGOWdXsPpkB14sm9W2MGwaHBImttXTuxROOL2PghKGzGNZTUuDqA5TxDZJKdZnrVXKCRrEn1BrR68JDHEKxkNGtt9Vlg5WIn7W2PWpgq7R3r6cCdN93zvkYyjPx7N63yki5mCht00FKnSBJYF2kh708+F39XTqkQuWV2d45GlFjhF65/UMg5F1qjpHPxJ+4BUfYWePJQ0bFYwYoZNiQO6SsMNFbh/u5xbokYUri8L9WA8BbU0b13JKxhOX7sxbdKA2KoDh0okhMGmxdj3vQKrMuKfH8Kq0UOXM8vTjDPK+/0yncP1jR1+y3LG485Sp8PTcDDSgHQEz+CzBzWeXx9u4lxrNxiOYUGPbjvTMDjC+cMugZUwlm5vK4NnF654ye8h9FHiyd3S8sTPW9H+72GyA8Oq7tSRk4LMXHPgKkt8nkQBBng/YFWSGjdYoTSBblYGS/vcGOVTGO7tIHFsPsCeDSFvJWyZuQcAngXF3EK3V4u7wNskNRK3m6pxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6666004)(8676002)(66556008)(66946007)(66476007)(8936002)(38100700002)(38350700002)(5660300002)(86362001)(508600001)(6486002)(316002)(6506007)(186003)(83380400001)(36756003)(30864003)(2616005)(2906002)(26005)(6512007)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4f2KWq3Fw5p9MBGbdS3whJPfiwgFJE9iP4ambMENv0AMdeidrw5HLfWctM5u?=
 =?us-ascii?Q?K4zO8QwkIErdfQcRskw8aFJon3OTo59wxojRY13+riG7ZsxW/1MnRYpsXQH8?=
 =?us-ascii?Q?n8VviBYghKiBdAUimF+5gGJOAo7KK5bk5iipI0jNxEcWe8WgG40uf3D1Jgtp?=
 =?us-ascii?Q?SLrzRM3LbAGmxwNUTwyP0CJHskdHO9cnJtVsdo6UGnGD43LaPEVW8Bd7+nSc?=
 =?us-ascii?Q?mWxLL3oCrhk/q4h9m2GsV54CO2UzurZTRwrq95/6BF0aG+39FJ6ZHMhpZwep?=
 =?us-ascii?Q?i/QxKUow0Ksp1casMQezFPdGzMlypYgNpMzKuk7E1TLqX6EJeYKeTro29IKq?=
 =?us-ascii?Q?17XIYzf7B3tFqPHYdyeNUPFI42FRp+Axv2vVwsLC2o5YycOwQB3mZ4TxuvD3?=
 =?us-ascii?Q?mEM4ucRYKJEnSyxGxR0Plj/pdmpOW8lmwN/DmCopWzJ4G5jcujbzTuFqCOXb?=
 =?us-ascii?Q?5PnUhnFPpQsv22Q+jOkc+MxyOc7z5boWTkZUGMnaYTtQKxIT32NqjmOZ6LZ2?=
 =?us-ascii?Q?2y/mcAwCB5Onx8eImw2semYfgHIrZHyzaWMOcr1IULt4qj/7ho8Qou8E9MYh?=
 =?us-ascii?Q?TkEekmG+NwCX6pnYo+DCfYa9NfcojF4Jd0wtgE6FzDuvyakEa4XKx/O6Ar+C?=
 =?us-ascii?Q?eYluEeS/P0wWYJEd4xWQr/nLhQhrmB2xplCvGPARP6evaik3yYMvcirN+N6Q?=
 =?us-ascii?Q?5KBud/41mUb4jFJ7xtBL4wbLJuyB9ZFiDl8VlhF1w4Q9h2/SQydk54O3cphT?=
 =?us-ascii?Q?XQ7ioegM5DFdbU9drHU7lDBhWHaMErjbS6zq781nCP08NDSZM97CfHfD5Ed/?=
 =?us-ascii?Q?cw7HBooazQuYgQyg4ja6R1wxpbWjuatA63dem9XrnVQX3CTVxaUNnXUJlYwK?=
 =?us-ascii?Q?6VMXioBq3WAK9OLWgmnH2jrz0uIp62ZnnNAEM8vfKwMtzS1e88jQGqh8bQ7v?=
 =?us-ascii?Q?YmkZ7ZfIq/WP/B/++ZKVc6aN5V+m/7UvZrniMUgU7u3w83txsqUP5/KQk1gL?=
 =?us-ascii?Q?0bPLW2aDlVALZ5pD3gt8abDWuejhPv9/Vwd+rduYaofbtVBX84e5ZYcx59On?=
 =?us-ascii?Q?+AhPpe1ZDwGfvlS2XZn6i0UL3haD7TG7oy1vLVcGByUFbTq+m+EZViHS0e8K?=
 =?us-ascii?Q?PQEHsGFSSzziQqBrnpoWcm38S1TgLWCzakFJNEOm1/16QVyeVrLUOHY4XeTY?=
 =?us-ascii?Q?mxQIvtDijattgVyP7X2pitddUpB5DPLCSqGdI6Y0Y/GFYegpDT3WX1y65lCz?=
 =?us-ascii?Q?J7JAwcIsGCvMPyOMguva3zJYhIDbr0stOfjMRDNN7bXcayaxHVQPJdhEjBtr?=
 =?us-ascii?Q?O2vz/DCZh3NIMnBkFi45qct1OG4uGDnQM1DdC5gvCB9/JGruPjwT7csc/gVW?=
 =?us-ascii?Q?5P+PjJU7AtgCjb+Xpyp22du7/Pj7TMYJpWcKSW7v7jh5auQNSpHNJbma8idG?=
 =?us-ascii?Q?U710TlwQajTG5E++FgtjBwX6IpjNI5nDZbqzomRrSXd91P6Gf7IKHbz1VBgw?=
 =?us-ascii?Q?BwJIet1zzmLs9WdD+XinEKdnTSyC0fBY9rmFzfeXFVxb2TA5cF8JiL3vnRK4?=
 =?us-ascii?Q?NF5e8UlqcNpKE7p5c8K0K3GJnQFwEjJt9j8qKFm7osIxF4NuHq40dLk8XH0Q?=
 =?us-ascii?Q?W4jHkXC2Vc9VeU1j6+WRALhXwMKiMKc6IIqzyXBTRh29Z6L42V/4jIw0RO9q?=
 =?us-ascii?Q?i3Z8ibnZLD+nWfU/AjnMuawA3MW0a4OGTCU1pxmE2wygCaB55UI+il9qwVLH?=
 =?us-ascii?Q?/eVz178miMczgeaFcr6Tvs4XTcJ1AsA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95aaf345-0404-4517-d461-08da2eba45e2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 17:11:19.9197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 622mHnbfyzoQiWcyaP/fRlXOgwJkTDfSA7qw4I5n6sSpnfmpiyQbGkt+1FzZXqSua68KurPOJ3NMlfjWxdbblCDmB131P8Zs19i5vtA+u8c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1867
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_06:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205050118
X-Proofpoint-ORIG-GUID: Wz8tuVPEeH1ub4ueZg2L1VyZPycQc2o_
X-Proofpoint-GUID: Wz8tuVPEeH1ub4ueZg2L1VyZPycQc2o_
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

PCI BARs read from remote device
PCI config reads/writes sent to remote server

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.c | 275 ++++++++++++++++++++++++++++++++++++----------------------
 1 file changed, 172 insertions(+), 103 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 98520dd..1be6683 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2831,6 +2831,132 @@ static void vfio_unregister_req_notifier(VFIOPCIDevice *vdev)
     vdev->req_enabled = false;
 }
 
+static void vfio_pci_config_setup(VFIOPCIDevice *vdev, Error **errp)
+{
+    PCIDevice *pdev = &vdev->pdev;
+    Error *err = NULL;
+
+    /* vfio emulates a lot for us, but some bits need extra love */
+    vdev->emulated_config_bits = g_malloc0(vdev->config_size);
+
+    /* QEMU can choose to expose the ROM or not */
+    memset(vdev->emulated_config_bits + PCI_ROM_ADDRESS, 0xff, 4);
+    /* QEMU can also add or extend BARs */
+    memset(vdev->emulated_config_bits + PCI_BASE_ADDRESS_0, 0xff, 6 * 4);
+
+    /*
+     * The PCI spec reserves vendor ID 0xffff as an invalid value.  The
+     * device ID is managed by the vendor and need only be a 16-bit value.
+     * Allow any 16-bit value for subsystem so they can be hidden or changed.
+     */
+    if (vdev->vendor_id != PCI_ANY_ID) {
+        if (vdev->vendor_id >= 0xffff) {
+            error_setg(errp, "invalid PCI vendor ID provided");
+            return;
+        }
+        vfio_add_emulated_word(vdev, PCI_VENDOR_ID, vdev->vendor_id, ~0);
+        trace_vfio_pci_emulated_vendor_id(vdev->vbasedev.name, vdev->vendor_id);
+    } else {
+        vdev->vendor_id = pci_get_word(pdev->config + PCI_VENDOR_ID);
+    }
+
+    if (vdev->device_id != PCI_ANY_ID) {
+        if (vdev->device_id > 0xffff) {
+            error_setg(errp, "invalid PCI device ID provided");
+            return;
+        }
+        vfio_add_emulated_word(vdev, PCI_DEVICE_ID, vdev->device_id, ~0);
+        trace_vfio_pci_emulated_device_id(vdev->vbasedev.name, vdev->device_id);
+    } else {
+        vdev->device_id = pci_get_word(pdev->config + PCI_DEVICE_ID);
+    }
+
+    if (vdev->sub_vendor_id != PCI_ANY_ID) {
+        if (vdev->sub_vendor_id > 0xffff) {
+            error_setg(errp, "invalid PCI subsystem vendor ID provided");
+            return;
+        }
+        vfio_add_emulated_word(vdev, PCI_SUBSYSTEM_VENDOR_ID,
+                               vdev->sub_vendor_id, ~0);
+        trace_vfio_pci_emulated_sub_vendor_id(vdev->vbasedev.name,
+                                              vdev->sub_vendor_id);
+    }
+
+    if (vdev->sub_device_id != PCI_ANY_ID) {
+        if (vdev->sub_device_id > 0xffff) {
+            error_setg(errp, "invalid PCI subsystem device ID provided");
+            return;
+        }
+        vfio_add_emulated_word(vdev, PCI_SUBSYSTEM_ID, vdev->sub_device_id, ~0);
+        trace_vfio_pci_emulated_sub_device_id(vdev->vbasedev.name,
+                                              vdev->sub_device_id);
+    }
+
+    /* QEMU can change multi-function devices to single function, or reverse */
+    vdev->emulated_config_bits[PCI_HEADER_TYPE] =
+                                              PCI_HEADER_TYPE_MULTI_FUNCTION;
+
+    /* Restore or clear multifunction, this is always controlled by QEMU */
+    if (vdev->pdev.cap_present & QEMU_PCI_CAP_MULTIFUNCTION) {
+        vdev->pdev.config[PCI_HEADER_TYPE] |= PCI_HEADER_TYPE_MULTI_FUNCTION;
+    } else {
+        vdev->pdev.config[PCI_HEADER_TYPE] &= ~PCI_HEADER_TYPE_MULTI_FUNCTION;
+    }
+
+    /*
+     * Clear host resource mapping info.  If we choose not to register a
+     * BAR, such as might be the case with the option ROM, we can get
+     * confusing, unwritable, residual addresses from the host here.
+     */
+    memset(&vdev->pdev.config[PCI_BASE_ADDRESS_0], 0, 24);
+    memset(&vdev->pdev.config[PCI_ROM_ADDRESS], 0, 4);
+
+    vfio_pci_size_rom(vdev);
+
+    vfio_bars_prepare(vdev);
+
+    vfio_msix_early_setup(vdev, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    vfio_bars_register(vdev);
+}
+
+static int vfio_interrupt_setup(VFIOPCIDevice *vdev, Error **errp)
+{
+    PCIDevice *pdev = &vdev->pdev;
+    int ret;
+
+    /* QEMU emulates all of MSI & MSIX */
+    if (pdev->cap_present & QEMU_PCI_CAP_MSIX) {
+        memset(vdev->emulated_config_bits + pdev->msix_cap, 0xff,
+               MSIX_CAP_LENGTH);
+    }
+
+    if (pdev->cap_present & QEMU_PCI_CAP_MSI) {
+        memset(vdev->emulated_config_bits + pdev->msi_cap, 0xff,
+               vdev->msi_cap_size);
+    }
+
+    if (vfio_pci_read_config(&vdev->pdev, PCI_INTERRUPT_PIN, 1)) {
+        vdev->intx.mmap_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
+                                                  vfio_intx_mmap_enable, vdev);
+        pci_device_set_intx_routing_notifier(&vdev->pdev,
+                                             vfio_intx_routing_notifier);
+        vdev->irqchip_change_notifier.notify = vfio_irqchip_change;
+        kvm_irqchip_add_change_notifier(&vdev->irqchip_change_notifier);
+        ret = vfio_intx_enable(vdev, errp);
+        if (ret) {
+            pci_device_set_intx_routing_notifier(&vdev->pdev, NULL);
+            kvm_irqchip_remove_change_notifier(&vdev->irqchip_change_notifier);
+            return ret;
+        }
+    }
+    return 0;
+}
+
 static void vfio_realize(PCIDevice *pdev, Error **errp)
 {
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
@@ -2946,92 +3072,16 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
         goto error;
     }
 
-    /* vfio emulates a lot for us, but some bits need extra love */
-    vdev->emulated_config_bits = g_malloc0(vdev->config_size);
-
-    /* QEMU can choose to expose the ROM or not */
-    memset(vdev->emulated_config_bits + PCI_ROM_ADDRESS, 0xff, 4);
-    /* QEMU can also add or extend BARs */
-    memset(vdev->emulated_config_bits + PCI_BASE_ADDRESS_0, 0xff, 6 * 4);
-
-    /*
-     * The PCI spec reserves vendor ID 0xffff as an invalid value.  The
-     * device ID is managed by the vendor and need only be a 16-bit value.
-     * Allow any 16-bit value for subsystem so they can be hidden or changed.
-     */
-    if (vdev->vendor_id != PCI_ANY_ID) {
-        if (vdev->vendor_id >= 0xffff) {
-            error_setg(errp, "invalid PCI vendor ID provided");
-            goto error;
-        }
-        vfio_add_emulated_word(vdev, PCI_VENDOR_ID, vdev->vendor_id, ~0);
-        trace_vfio_pci_emulated_vendor_id(vdev->vbasedev.name, vdev->vendor_id);
-    } else {
-        vdev->vendor_id = pci_get_word(pdev->config + PCI_VENDOR_ID);
-    }
-
-    if (vdev->device_id != PCI_ANY_ID) {
-        if (vdev->device_id > 0xffff) {
-            error_setg(errp, "invalid PCI device ID provided");
-            goto error;
-        }
-        vfio_add_emulated_word(vdev, PCI_DEVICE_ID, vdev->device_id, ~0);
-        trace_vfio_pci_emulated_device_id(vdev->vbasedev.name, vdev->device_id);
-    } else {
-        vdev->device_id = pci_get_word(pdev->config + PCI_DEVICE_ID);
-    }
-
-    if (vdev->sub_vendor_id != PCI_ANY_ID) {
-        if (vdev->sub_vendor_id > 0xffff) {
-            error_setg(errp, "invalid PCI subsystem vendor ID provided");
-            goto error;
-        }
-        vfio_add_emulated_word(vdev, PCI_SUBSYSTEM_VENDOR_ID,
-                               vdev->sub_vendor_id, ~0);
-        trace_vfio_pci_emulated_sub_vendor_id(vdev->vbasedev.name,
-                                              vdev->sub_vendor_id);
-    }
-
-    if (vdev->sub_device_id != PCI_ANY_ID) {
-        if (vdev->sub_device_id > 0xffff) {
-            error_setg(errp, "invalid PCI subsystem device ID provided");
-            goto error;
-        }
-        vfio_add_emulated_word(vdev, PCI_SUBSYSTEM_ID, vdev->sub_device_id, ~0);
-        trace_vfio_pci_emulated_sub_device_id(vdev->vbasedev.name,
-                                              vdev->sub_device_id);
-    }
-
-    /* QEMU can change multi-function devices to single function, or reverse */
-    vdev->emulated_config_bits[PCI_HEADER_TYPE] =
-                                              PCI_HEADER_TYPE_MULTI_FUNCTION;
-
-    /* Restore or clear multifunction, this is always controlled by QEMU */
-    if (vdev->pdev.cap_present & QEMU_PCI_CAP_MULTIFUNCTION) {
-        vdev->pdev.config[PCI_HEADER_TYPE] |= PCI_HEADER_TYPE_MULTI_FUNCTION;
-    } else {
-        vdev->pdev.config[PCI_HEADER_TYPE] &= ~PCI_HEADER_TYPE_MULTI_FUNCTION;
-    }
-
-    /*
-     * Clear host resource mapping info.  If we choose not to register a
-     * BAR, such as might be the case with the option ROM, we can get
-     * confusing, unwritable, residual addresses from the host here.
-     */
-    memset(&vdev->pdev.config[PCI_BASE_ADDRESS_0], 0, 24);
-    memset(&vdev->pdev.config[PCI_ROM_ADDRESS], 0, 4);
-
-    vfio_pci_size_rom(vdev);
-
-    vfio_bars_prepare(vdev);
-
-    vfio_msix_early_setup(vdev, &err);
+    vfio_pci_config_setup(vdev, &err);
     if (err) {
-        error_propagate(errp, err);
         goto error;
     }
 
-    vfio_bars_register(vdev);
+    /*
+     * vfio_pci_config_setup will have registered the device's BARs
+     * and setup any MSIX BARs, so errors after it succeeds must
+     * use out_teardown
+     */
 
     ret = vfio_add_capabilities(vdev, errp);
     if (ret) {
@@ -3072,29 +3122,15 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
         }
     }
 
-    /* QEMU emulates all of MSI & MSIX */
-    if (pdev->cap_present & QEMU_PCI_CAP_MSIX) {
-        memset(vdev->emulated_config_bits + pdev->msix_cap, 0xff,
-               MSIX_CAP_LENGTH);
-    }
-
-    if (pdev->cap_present & QEMU_PCI_CAP_MSI) {
-        memset(vdev->emulated_config_bits + pdev->msi_cap, 0xff,
-               vdev->msi_cap_size);
+    ret = vfio_interrupt_setup(vdev, errp);
+    if (ret) {
+        goto out_teardown;
     }
 
-    if (vfio_pci_read_config(&vdev->pdev, PCI_INTERRUPT_PIN, 1)) {
-        vdev->intx.mmap_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
-                                                  vfio_intx_mmap_enable, vdev);
-        pci_device_set_intx_routing_notifier(&vdev->pdev,
-                                             vfio_intx_routing_notifier);
-        vdev->irqchip_change_notifier.notify = vfio_irqchip_change;
-        kvm_irqchip_add_change_notifier(&vdev->irqchip_change_notifier);
-        ret = vfio_intx_enable(vdev, errp);
-        if (ret) {
-            goto out_deregister;
-        }
-    }
+    /*
+     * vfio_interrupt_setup will have setup INTx's KVM routing
+     * so errors after it succeeds must use out_deregister
+     */
 
     if (vdev->display != ON_OFF_AUTO_OFF) {
         ret = vfio_display_probe(vdev, errp);
@@ -3488,8 +3524,41 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         goto error;
     }
 
+    /* Get a copy of config space */
+    ret = VDEV_REGION_READ(vbasedev, VFIO_PCI_CONFIG_REGION_INDEX, 0,
+                           MIN(pci_config_size(pdev), vdev->config_size),
+                           pdev->config);
+    if (ret < (int)MIN(pci_config_size(&vdev->pdev), vdev->config_size)) {
+        error_setg_errno(errp, -ret, "failed to read device config space");
+        goto error;
+    }
+
+    vfio_pci_config_setup(vdev, &err);
+    if (err) {
+        goto error;
+    }
+
+    /*
+     * vfio_pci_config_setup will have registered the device's BARs
+     * and setup any MSIX BARs, so errors after it succeeds must
+     * use out_teardown
+     */
+
+    ret = vfio_add_capabilities(vdev, errp);
+    if (ret) {
+        goto out_teardown;
+    }
+
+    ret = vfio_interrupt_setup(vdev, errp);
+    if (ret) {
+        goto out_teardown;
+    }
+
     return;
 
+out_teardown:
+    vfio_teardown_msi(vdev);
+    vfio_bars_exit(vdev);
 error:
     vfio_user_disconnect(proxy);
     error_prepend(errp, VFIO_MSG_PREFIX, vdev->vbasedev.name);
-- 
1.8.3.1


