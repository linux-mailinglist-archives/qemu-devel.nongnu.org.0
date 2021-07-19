Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 339AA3CCDEA
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 08:30:01 +0200 (CEST)
Received: from localhost ([::1]:57448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Mmu-0006nN-2s
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 02:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlC-00042n-T4
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:14 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:30242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlA-0002Fp-5N
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:13 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J6GLnw029074; Mon, 19 Jul 2021 06:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=OBr7xnOBLJAOEml4hrlZsz2y2nx1l/6aT2fGklc69/U=;
 b=JqheCGhXi0g+iBgXAdXsLpJxsqZ5d4rnLCjZQV9HhfLOchkxTtrrovvZ33Pg6p1PMjlu
 4hkNcTFwOV5CawRdha/h9R+5LgGbu/Xu1N2hDRzdRbvDgWFnPP7ERcNlxrdQBLBCaW1w
 fRj5JTeJRfrlzc5d70Fl1DqFEc40DX/XQTjwc5TpnNKHrLli4LQTl5mnV6NOMG2RxnYH
 +XYkFz6CAqFiqdfswrnhgecPpcE/P5RpF59Von/1LVYOyd68267ZpaDuLt9Kn+MHNzrZ
 vbxWqojqqycwUUCchaFFRGCB8kS+gBx5hdLve1RDqu9qASTqarjTN+vd1KROSIyHvJIC Ig== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=OBr7xnOBLJAOEml4hrlZsz2y2nx1l/6aT2fGklc69/U=;
 b=BT06vkLraEfraw/8TGvIHcTcPZgHJpI7yVRevEesn4ICa+dmk3be4px1KvPFywsW+PSv
 J5Dqnz67KHgpc5j8TpPZh1Chf8jPX+56z7AMAWGeUX+kCNAcWltLwx/HPhuneNaa/CcR
 eAzz2trgbAECuRgpZ6aGjcVrve3qXdug92/TSuNM82dmT8IeHUvv9gNVJO5t1IKISsTI
 B0tfDGZFNfEUxRKi+Y/8gMghA94civCfBUAJVQ07kiOVaRbXHjGVT5MXslAlk8s8/wl8
 nHiMHeD1vUeAEI+AkNVFVIKiigBpFldon1+vtVbDyJbMhCn6qSGcfbipXTVMlwrw0lGe uw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39vpkwrnjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:11 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16J6G9T6086873;
 Mon, 19 Jul 2021 06:28:10 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by userp3020.oracle.com with ESMTP id 39v8ys1vt5-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IlSbDu8vd3hJxX9SSU06wSEh7cZO531s2GZof5VgnInFJaxyl5DHITa6gzvZf5c1VThbf2Il7713xyWrx8a0V8s1wQsujo19keru2H4cyb7engoo8nxnPopTEr/EDMnLr5MyVa8IL+XBCgNT97oK7X+DUeH0p6HoCq9UeUmczJzi1dKufivWNd4vY8MR2qW0JfAfd3VRrOTktSNyAX6JjSRxDuAH4F6JTGfWpsCLg+73hT/ky/Tg0QM4gjFWwIdkioRr3QMDXUu6Iw+1crs9gdBM13xsQYMzjrMZzXFTR2iloJGnxt8YATOnrC+bYem2bWw25C757fZVL8BqaeRugQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBr7xnOBLJAOEml4hrlZsz2y2nx1l/6aT2fGklc69/U=;
 b=KBxCpk5c/GUt2sgGGLAJblefXa9FNyux5F4FvXZRoW+eQOtV3jc2yyoNeiZ4yGNmE5LV48wKZO9CXyePc7tYQFBawkq9eJ+YVQxqhttBDp96wp2mC2Pv5Y9o/MvnZxbS26h1gI9S70t+lyPPRcsZ5WXuGb15F9Kg4xcghRITQhcz3/AQtJMVxKUnQCwWjepcn9xQfw5LIZYDJS8Y+C66RDXCxhpoHtRhukX32RLi5cG42FhAUbL/3Bfq5rwDBK15R/uYnCGD6Ww4utBuD7655N4tO7pZLwrBKO6c0tJ+BPSumXnBWymmTlA9QPke5LMh1V4uNA15kJR5i57vXgzNXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBr7xnOBLJAOEml4hrlZsz2y2nx1l/6aT2fGklc69/U=;
 b=vcMLtEiq0kZx+HX8ddAoFvgmyG0LifsKQ9L935tJO0JAV9HCn/FZO5vIGLXjKchviQrjZzViqCfQd0crWjXy1tuHOu/4k4d3RZZ4Hlyfhn9hoElh8IeBR+MxCBUYURUU+ndDvHUiBt9IJOV6gYLE283sVriv3WxQbcVpZnt25Vs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB4814.namprd10.prod.outlook.com (2603:10b6:a03:2d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Mon, 19 Jul
 2021 06:28:07 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 06:28:07 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 07/19] vfio-user: define vfio-user pci ops
Date: Sun, 18 Jul 2021 23:27:46 -0700
Message-Id: <c60da34d44212f9a9a4846e6dfd9e50201ac4774.1626675354.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626675354.git.elena.ufimtseva@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0022.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::35) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nuker.hsd1.ca.comcast.net
 (2601:642:4000:a09:3c73:d99e:ec8c:2487) by
 BY5PR16CA0022.namprd16.prod.outlook.com (2603:10b6:a03:1a0::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Mon, 19 Jul 2021 06:28:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ff9fe14-78ed-4bee-b3a3-08d94a7e5f5d
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4814:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB481482CA62CFF60D26F3D8598CE19@SJ0PR10MB4814.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GZMpin+DuvQqY/swoB0wfJ5IfRUvaEjWLPJrDwzdm0PVcNKwf0LT/a1Pctuwf/AdEymyesCvyzY3nRfHtUfI6nPE62m3hLn7Ahl+COhy0fMrl2Gmh0v7JlUEp0fvw9o0VOc2jquzJHD85WHkO4EgmMvONyzw29Mzr3Zr+nmgZW3tr+k9/PyqJocwo6UvePpdrKCTfvB2e6Q6BqszzJfEnYKQ6jfVeBo+H5Ua8xxp1vfjiR3WE1oWTi9rIyr0vah6OG74seOAQ6a0zEGMLboXpU5k4HCKQh1IUk240AOHIUaUgt+R9Dprz+0HZYHyiZjODf20b1Agg2G9vpLkUhm1kS56MaOcIy4YSiWQ4qz3FyBCct5DybVdKDkOXTUAFA8jBVMbHoaVFBaN51lqeQCJntZLXzkN50476Gp1pH/TWwKDN0p22kt/yMZI0nvM25L58zTVT9g28fYC7RV+S+PJvtqbc5w9luAL7H9JdMC1cX2ycvARFT32LE4e2CvQBBHw+UvTdbnsf2tjEoj4pxR7Yv04rFZFQ1hkDTYYtBp8YWCr/186FmOqxx+8haacSSDULB0oNXMWDGiCW/1RyNTY+Oyr2nl9aRcFDOd1YQdFg17/8QlzSnGAOLj37/YgLjvNAMvpv2OMSf/vJwYgB3ydGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(376002)(346002)(136003)(2906002)(6486002)(5660300002)(316002)(6512007)(186003)(66476007)(44832011)(66556008)(2616005)(6506007)(38100700002)(6916009)(52116002)(6666004)(8936002)(86362001)(107886003)(8676002)(66946007)(478600001)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x0poM7GmSBLhhZOnyPaO9KTajPpUcZL0e2jo4EUmGxEXmNQZHLUJgKO5hys8?=
 =?us-ascii?Q?p2bl5NWx+7LWLlTWAMaY9bOIXUc3fEo0Jd3KmjTgm4hgyd4Kklm1ZHYIjYNS?=
 =?us-ascii?Q?bIsaRCrnZ6Q774aea+6GuzP85GeHrnKT4km8QqthZz4kM7um00PDpQs3NOm4?=
 =?us-ascii?Q?F2pN8NCDeDb1HVMVLZdpKSBI6x3HwMx2Id2FQBsnziqdaEVKd9XuQXEIVbXc?=
 =?us-ascii?Q?ZcprKgsCPJ2Xa3ycUP3YW9zG344SJVGzG4SE+LJlRtFyM43Q/22oSXMKWKg4?=
 =?us-ascii?Q?mbFIXFlg9N194z1w07YHoj3CvC9cJ/X7iuqZmoRXuQ48GdyD3yrPlLd/CHQn?=
 =?us-ascii?Q?AQ3HNB1G9r/MYk854mBCcLecCKDcQ0xFyd5AGwuK9HNnictbadSADcq4FHQ+?=
 =?us-ascii?Q?/ocKss8dI7dv426+AfoK6oKnu0gBCOlBybVZ1x1Sg1dvx11TzLYnKuAmMqsm?=
 =?us-ascii?Q?TZnV0D4U8rufTfioo5m0RTWwIgus5FvFNJ1HL0MAsmMlf3eNb+rg6hcBiP9w?=
 =?us-ascii?Q?C2+qssos+lqcQ00iYWk9s+Yj1XwtUlvYkxICCSeEsNk0IPkdBNSMwhHJkJIU?=
 =?us-ascii?Q?fFtHBHrXuoPUKPA0wpq7pFtXaloTXQ65aBrzPkwsH5k0DEfMiXlmia+1/SAP?=
 =?us-ascii?Q?rL7liaMqd/X5ZSPu4JflwqS1xSzO84UC6kJRqRy0NUk7IY5uj6KGocmD/Y9u?=
 =?us-ascii?Q?CyvDuEHP2YqxPX7U5JwOlc6HaN2tbR9NkL5HrFTvAh48KNpNTceo+DxTW7Hs?=
 =?us-ascii?Q?Ki23/2VzIhFoVDj97wVlH2+2Sx6Mv8ey9FbXsk4Q4ViMOleI6hvJPjkHNJpB?=
 =?us-ascii?Q?TzVKwkPvG8xPbIn/hc6i36Nl6auZXkUz8XdT9nMYLxmmZ3RJw6y492jXg/Ts?=
 =?us-ascii?Q?A/YhLquCCVmzb/A5Yq3y2V33kE9uXeTfQXHC5pxEQXMdmzTY+mbFxM59mitU?=
 =?us-ascii?Q?ErVPaNF4loYPBhLILDSdmkNSrglI43slQk3wcWOi/Zd4dAkJp0rkDaR88Q85?=
 =?us-ascii?Q?3JZPjCqOpe/tSDOWnmHbXxaGRtdu5O2ERGndErHTwYKVwwUh077u8oeVJMHi?=
 =?us-ascii?Q?+ZmP3Zev8nSbXJ6/V/eq9P7d98wbFiZUxJEmJ8gBP8LxwleNmB/1bc/oW/S1?=
 =?us-ascii?Q?z7Q+wdHWbljPzOYAPGZFKZ2cKYHB5yVHKrrr2r6PFA8ECuHJp3fIXHAq/6j2?=
 =?us-ascii?Q?N/xfbc+9jZxNEo4MfRg0vDuA4YYKXq909IGM59Egf2ORx+EKziVWkokwr5Vo?=
 =?us-ascii?Q?RmJF7udzAdDe6VUwI9QlROW5ajKtx8CAFYjVHkUm88WG/PBFSFNaKVudZikL?=
 =?us-ascii?Q?7xGjCGRbmmbsc9o1yZZwkjTYpEmH6JMNf/S/d+pckfySfyWpjCMf4R/Epxr4?=
 =?us-ascii?Q?HwleO/wlvGo2eaV1xhUweZzIBG4q?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff9fe14-78ed-4bee-b3a3-08d94a7e5f5d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 06:28:07.7026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DVdIWF9Z67bBY25Eu99S9Nxhs1I6YWQZhEfPglGKl3ojtebif4Taberv/+ePGfL2KSNHNDkyaypTalpu1Sp2S6C17YTmM/z3Lr3zaqBYLnk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4814
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10049
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190035
X-Proofpoint-ORIG-GUID: 3cNSO1iSwf8i-7_vgTLIcVcHPrSc7Z-m
X-Proofpoint-GUID: 3cNSO1iSwf8i-7_vgTLIcVcHPrSc7Z-m
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.01,
 RCVD_IN_MSPIKE_L3=0.9, SPF_HELO_NONE=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John G Johnson <john.g.johnson@oracle.com>

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 8ca1431cca..388b7d82d7 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3328,6 +3328,29 @@ static void register_vfio_pci_dev_type(void)
 
 type_init(register_vfio_pci_dev_type)
 
+/*
+ * Emulated devices don't use host hot reset
+ */
+static int vfio_user_pci_no_reset(VFIODevice *vbasedev)
+{
+    error_printf("vfio-user - no hot reset\n");
+    return 0;
+}
+
+static void vfio_user_pci_not_needed(VFIODevice *vbasedev)
+{
+    vbasedev->needs_reset = false;
+}
+
+static VFIODeviceOps vfio_user_pci_ops = {
+    .vfio_compute_needs_reset = vfio_user_pci_not_needed,
+    .vfio_hot_reset_multi = vfio_user_pci_no_reset,
+    .vfio_eoi = vfio_intx_eoi,
+    .vfio_get_object = vfio_pci_get_object,
+    .vfio_save_config = vfio_pci_save_config,
+    .vfio_load_config = vfio_pci_load_config,
+};
+
 static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
 {
     ERRP_GUARD();
@@ -3354,6 +3377,14 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         error_propagate(errp, err);
         goto error;
     }
+
+    vbasedev->name = g_strdup_printf("VFIO user <%s>", udev->sock_name);
+    vbasedev->dev = DEVICE(vdev);
+    vbasedev->fd = -1;
+    vbasedev->type = VFIO_DEVICE_TYPE_PCI;
+    vbasedev->no_mmap = false;
+    vbasedev->ops = &vfio_user_pci_ops;
+
     return;
 
  error:
-- 
2.25.1


