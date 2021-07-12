Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 772143C4DD2
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 12:40:53 +0200 (CEST)
Received: from localhost ([::1]:39030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2tMq-0006iH-Gn
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 06:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1m2tJ0-0001l2-Re; Mon, 12 Jul 2021 06:36:56 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:24382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1m2tIw-00007D-Vq; Mon, 12 Jul 2021 06:36:54 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CAVB8k019169; Mon, 12 Jul 2021 10:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=zYUS30rGHwtq1sZZ4vJAlCuKgE6OMy9EmfsXdC+v/y0=;
 b=L2gR8yBz3kQ8/dQqprpGh1UKci9nfUhqXbdDxB1iEaK4zsZL5pjnEr4jtQGLllJ/BJKw
 6tagCSiehxdRoA/SEc9mLFSjZUZEFTJ7zM7pksPV92d/cG5zTpB/99cltq4UXpVSktY6
 zkNJ3OnOVY+IBhhd1s2zdUcG0m7kPAZ/X96R1zP9HZzQ53LeZPv5URI0zk0knp1jZGkP
 4sprtlyLYWj55ClYHIWEvVxd7ZMGwy8hRcA/eDGszom63TOPYRkptTuAm6cnXEJ9VYJX
 rfhhAuYWh1zd4ibk8GeIT14vbfyHN9j+vfzzK0KYE69adgcgo5SQHsmPPijf5+BoIxIn 2w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39q1ybabyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 10:36:42 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16CAYovW098181;
 Mon, 12 Jul 2021 10:36:41 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2170.outbound.protection.outlook.com [104.47.73.170])
 by userp3020.oracle.com with ESMTP id 39qnatj8y0-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 10:36:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejim+KEvJ5tMQ59SV5EUTuoKXf0exiQLS+xMv/77Rc77q81yrWKie9zp57P4nmPSp2tpXzGpPsLVHCATXWUavejOkplG+t+yYee8S35nF3RFewo0uwMp9BdtOz0xXLUCr/4E4pz2Y02hu1WEtzwRw5/M5TConW49VU3fGVLmFjE8bPX+Nr6MMKJ19mnmTrTKJw4AcMYHzLaS3Vbaj0SzzOgzpvMPBRWc8rs7nD+rMBHnJ6tyEXuQd/LcWoYg+N9X4npFV88zfz27HWXJoqPPxOLAsbZOKwK6EG3x7AZcVb2zdS5CTMgftwVrM2qwhZoi82XJ0XIFYjwGlNAompHmBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYUS30rGHwtq1sZZ4vJAlCuKgE6OMy9EmfsXdC+v/y0=;
 b=ks5y2BuoPI7wei/cFiIGljFzDijCZ1/owWXWegdoi6KYDhHnB3alqyvqvTZHCJAjiUrU/rhs1t7OF0Fu5q0mGxMUsGrmNUPTNJJ9s9lQZtnuibIU+h7WQLLXy1PjdyKBG26GZp9HX69I4Hnj97tZOde6XPtmCH8rrgSTRoTC/V/uCPOrEFD73sSaDc1DzjsIdTBU/ECcg1q7X0jbQB+7tZtzHFgML1h+B0NUvSnVcwvPG1NJLA/xzgg5cHeK3aSg7e/v6bBBtJDxsdD0hIs2dqMPBt1QSxiO2AZov5hlUackJ3TdkUwFaato4aPSmzwEgiQwcMyIyhG8SBRaZYfDZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYUS30rGHwtq1sZZ4vJAlCuKgE6OMy9EmfsXdC+v/y0=;
 b=zNlmmOkKk+RjN8IiYKxn701pByx9FPGTEmPPhVRj6SzPnbEBj0hO9d6vsvrOsnjgiuXBaayi1mM130M4JFh921Zw9WAL0/fPbq8yox7PxEzf1MDoPaCLwek9yVDSi8T/2etotGlaFydx0ShLUt3PM7M9FmN3yyQYk7yZhwrr4tM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4552.namprd10.prod.outlook.com (2603:10b6:510:42::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Mon, 12 Jul
 2021 10:36:37 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0%6]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 10:36:37 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 6/6] hmp: add virtio commands
Date: Mon, 12 Jul 2021 06:35:37 -0400
Message-Id: <1626086137-16292-7-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0701CA0019.namprd07.prod.outlook.com
 (2603:10b6:803:28::29) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jonpalme-lnx.us.oracle.com (209.17.40.41) by
 SN4PR0701CA0019.namprd07.prod.outlook.com (2603:10b6:803:28::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Mon, 12 Jul 2021 10:36:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 824f8200-9d5f-4d08-421d-08d94520ed29
X-MS-TrafficTypeDiagnostic: PH0PR10MB4552:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB45524BC023F36DE02E064682E8159@PH0PR10MB4552.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:312;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lIqi5rnKEQx8Rftf9/YJ9PECYUhXKdY18Eu+BwZb8KeIAWrf4Fmm0QuvWbGOszrP2/+d5NU5Qn2nNJ2qBEF+xS6B7t2C+EaQwqorq4otpdYrXSWWyETwCgjZJLzhoSMRB7pFIFTvbC0LQGPA3VIUkOBl452+PRV/Nvpx0FexxVhK/2SXx+rd6ve0sH9U/8ZHGp+tKnfSX/ztvDOLcAm+LiDatrHuiLhE3L44dLcnIsWkuq2SAaSUumwH9gUMg3SJBkiHd64vPOlA2ZqdGiIGK8sqOP50hv3NqBWkdPO/D8D0Eg5d86AysVqrJ5KXYAF6vgFjBlpoEYcbpmtDPxWxxocIk3iVV0OmF792ye7cPLUjg4Y9HTXwxvLPCIKQuuHAlo2/mEvHai6YCMox/ME+E1kINc2uqvmzmaAdOJWYpkWVVypWzKe+sfHnSW6mLOqB9aObyoqf3ed46HTevE40iBMTc6B8uxrvfnbRL2//Rg4UmabnRh0+A5uhLpvo8lGDgNRcLEzVBGl4fjAZZ+PZAvOheNnck4Mji1PQiqUOP9EVIWfcQ3vS7X8TG4zCJGk0t3DkRuXIa7Eh4d5bNoOYQSozmGyUWwm/izIPVull0P92kgnoVXkcM1WQOtFHQQHf3XOp+ydpyBf12aZk58W18eG9m+lcExKyfExus7JFD6i6IcI+x9lpeYabYqfafEiCUTr8c1+sEah7EeZJKUoUww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(346002)(366004)(136003)(376002)(83380400001)(7416002)(956004)(6486002)(7696005)(2616005)(186003)(316002)(36756003)(4326008)(2906002)(8936002)(52116002)(86362001)(107886003)(66476007)(66946007)(44832011)(66556008)(6916009)(38100700002)(5660300002)(8676002)(30864003)(38350700002)(478600001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E9iplWp9kk3L+3OkULck4RlYmnsjcSoZGa1GwaxQ+26lSKRD9QTa6TdzkVrE?=
 =?us-ascii?Q?yeNx7I64Mrh6myzrldz4SyaoK7VN6hAu5Co0ypVwSuHahDIQtSvQ9MGp2ALQ?=
 =?us-ascii?Q?Asxq1v0bPRzMOLcbg6XD091UCimGIF3cSmVVzLORYUT7Ev0m58ZMjQ/80oW2?=
 =?us-ascii?Q?3UsTwhHVy2HmYuZ2uER9JXft+T2Wo2askV4BZ7Aa1DnkKbCsR2dgTfhYgZla?=
 =?us-ascii?Q?diHA67VdJV6mKTRwHTl+6+wBRK0phWd7/rFlGoIt93Cy2tj3WFZv699NOQVw?=
 =?us-ascii?Q?0NCDJDHWvBcjXA3r1zV28p7sxgw0P60pzR9gquRjyp+RdabJ5IH86B7XUM/0?=
 =?us-ascii?Q?vHi+cNVo84RByZZChWHI/KNFqsth199xr1A3IG+O71HozUkcp82Y/Tc6BER5?=
 =?us-ascii?Q?D0GAnWn/YaB+psbbz5SCcEpoaMGqJQ2iEJGLK08y+r4xsos6cukEZNBoOcZD?=
 =?us-ascii?Q?FGqq85BBDKW68Om0pqjS/1iQYhDXDNkmAchXzEK1eksVGRAnbaRP/DsBpsa8?=
 =?us-ascii?Q?G7zxNZ+d9rXjov64uE4jcZqK6DdXhJccXxUA+ADXtb5xllICOpzrr8tyMMVy?=
 =?us-ascii?Q?0itjqIFemkAs0FHYC9nS+0Zcr6aBGeFbgq3fJcYui6lXjCzXO8v+8FjOVr6l?=
 =?us-ascii?Q?BTAZbOyobg+LY28G5v3aF64nO9qEvqt58jCUzcBfeQfgS4Zkry2K45iGRvXO?=
 =?us-ascii?Q?SpnZoCBVQcPeSaxqn14Tyt+vhu1TmD4210oyEdeiVPOeWUOx40H0GsoClpZf?=
 =?us-ascii?Q?EHkZcloUMFrwoEBodf55pGxBll63Op1/L4WIeUoh+AeVV4q4wUT3x+lEB43/?=
 =?us-ascii?Q?99srVs9wCGzJ80MgEJP9X+oHO0aFyw96iwohgaZFsLQ1RIKu+SgzEVCdz1Ym?=
 =?us-ascii?Q?lOOvwvtbvU+Na3SccNuYgXNeZnCkUDEeUDBRan9oUu8jCXkM1wl6uceivGjI?=
 =?us-ascii?Q?BBXyiXjyv/IImWbGipYM9YNwf2CNSaKmEF7sLiNzuoswn5MZcPSyidRwP5BD?=
 =?us-ascii?Q?3WqCE8oUs+Ln+M6htOTvw0O76f7yA5szqv7MEZoRSkevHsqq7LQStU0SE0Gv?=
 =?us-ascii?Q?RLKG0Hryhfemw8EMQEXpfdLjjShjBVo9hN5V/nhqL+B5LyxDMp2Gm2Ws/8e7?=
 =?us-ascii?Q?1JwzHVaKGaFbG8ufWA7e0ibiCb/1ugjthGUp9P/GuP6UnFSjd2VOVy9U0Ih+?=
 =?us-ascii?Q?jyxmhegiCGseu4rmIwzd/3s5FHb/PJUFI/xdDox9YtmZmwJdmrYAZDjbZXra?=
 =?us-ascii?Q?pk0pAZJElvlSBt/6ivcDQKHRJWlI6qqp0CwyBmu2e6pnPKItnkGrsRYLyc/s?=
 =?us-ascii?Q?WYvmr7EMAhDyZwdbDUUuEPS1?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 824f8200-9d5f-4d08-421d-08d94520ed29
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 10:36:37.1870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2M7czwS6fYN+copdiuAjqteWivQwV2K/BITkGBThy6fRthBMINUzUXlxjg+aIRPd3GYdZEiUTi7XU9mlVGfjHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4552
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10042
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107120082
X-Proofpoint-GUID: Cjx50ZTqcDcVRS0ABgMGq89Q2cmEp16u
X-Proofpoint-ORIG-GUID: Cjx50ZTqcDcVRS0ABgMGq89Q2cmEp16u
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: fam@euphon.net, mst@redhat.com, jasowang@redhat.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, qemu-block@nongnu.org,
 david@redhat.com, armbru@redhat.com, marcandre.lureau@redhat.com,
 jonah.palmer@oracle.com, thuth@redhat.com, amit@kernel.org,
 michael.roth@amd.com, dgilbert@redhat.com, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com, kwolf@redhat.com,
 laurent@vivier.eu, mreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

This patch implements HMP version of the virtio QMP commands

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 docs/system/monitor.rst |   2 +
 hmp-commands-virtio.hx  | 162 ++++++++++++++++++++++++++++++++++++++
 hmp-commands.hx         |  10 +++
 hw/virtio/virtio.c      | 204 +++++++++++++++++++++++++++++++++++++++++++++++-
 include/monitor/hmp.h   |   4 +
 meson.build             |   1 +
 monitor/misc.c          |  17 ++++
 7 files changed, 399 insertions(+), 1 deletion(-)
 create mode 100644 hmp-commands-virtio.hx

 [Jonah: Added relative indicies, device type, and used index
 in HMP virtio queue-status command.]

diff --git a/docs/system/monitor.rst b/docs/system/monitor.rst
index ff5c434..10418fc 100644
--- a/docs/system/monitor.rst
+++ b/docs/system/monitor.rst
@@ -21,6 +21,8 @@ The following commands are available:
 
 .. hxtool-doc:: hmp-commands.hx
 
+.. hxtool-doc:: hmp-commands-virtio.hx
+
 .. hxtool-doc:: hmp-commands-info.hx
 
 Integer expressions
diff --git a/hmp-commands-virtio.hx b/hmp-commands-virtio.hx
new file mode 100644
index 0000000..0ef01b9
--- /dev/null
+++ b/hmp-commands-virtio.hx
@@ -0,0 +1,162 @@
+HXCOMM Use DEFHEADING() to define headings in both help text and rST.
+HXCOMM Text between SRST and ERST is copied to the rST version and
+HXCOMM discarded from C version.
+HXCOMM DEF(command, args, callback, arg_string, help) is used to construct
+HXCOMM monitor info commands
+HXCOMM HXCOMM can be used for comments, discarded from both rST and C.
+HXCOMM
+HXCOMM In this file, generally SRST fragments should have two extra
+HXCOMM spaces of indent, so that the documentation list item for "virtio cmd"
+HXCOMM appears inside the documentation list item for the top level
+HXCOMM "virtio" documentation entry. The exception is the first SRST
+HXCOMM fragment that defines that top level entry.
+
+SRST
+``virtio`` *subcommand*
+  Show various information about virtio.
+
+  Example:
+
+  List all sub-commands::
+
+    (qemu) virtio
+    virtio query  -- List all available virtio devices
+    virtio status path -- Display status of a given virtio device
+    virtio queue-status path queue -- Display status of a given virtio queue
+    virtio queue-element path queue [index] -- Display element of a given virtio queue
+
+ERST
+
+    {
+        .name       = "query",
+        .args_type  = "",
+        .params     = "",
+        .help       = "List all available virtio devices",
+        .cmd        = hmp_virtio_query,
+        .flags      = "p",
+    },
+
+SRST
+  ``virtio query``
+    List all available virtio devices
+
+    Example:
+
+    List all available virtio devices in the machine::
+
+      (qemu) virtio query
+      /machine/peripheral-anon/device[3]/virtio-backend [virtio-net]
+      /machine/peripheral-anon/device[1]/virtio-backend [virtio-serial]
+      /machine/peripheral-anon/device[0]/virtio-backend [virtio-blk]
+
+ERST
+
+    {
+        .name       = "status",
+        .args_type  = "path:s",
+        .params     = "path",
+        .help       = "Display status of a given virtio device",
+        .cmd        = hmp_virtio_status,
+        .flags      = "p",
+    },
+
+SRST
+  ``virtio status`` *path*
+    Display status of a given virtio device
+
+    Example:
+
+    Dump the status of the first virtio device::
+
+      (qemu) virtio status /machine/peripheral-anon/device[3]/virtio-backend
+      /machine/peripheral-anon/device[3]/virtio-backend:
+        Device Id:        1
+        Guest features:   event-idx, indirect-desc, version-1
+                          ctrl-mac-addr, guest-announce, ctrl-vlan, ctrl-rx, ctrl-vq, status, mrg-rxbuf, host-ufo, host-ecn, host-tso6, host-tso4, guest-ufo, guest-ecn, guest-tso6, guest-tso4, mac, ctrl-guest-offloads, guest-csum, csum
+        Host features:    event-idx, indirect-desc, bad-feature, version-1, any-layout, notify-on-empty
+                          gso, ctrl-mac-addr, guest-announce, ctrl-rx-extra, ctrl-vlan, ctrl-rx, ctrl-vq, status, mrg-rxbuf, host-ufo, host-ecn, host-tso6, host-tso4, guest-ufo, guest-ecn, guest-tso6, guest-tso4, mac, ctrl-guest-offloads, guest-csum, csum
+        Backend features:
+        Endianness:       little
+        VirtQueues:       3
+
+ERST
+
+    {
+        .name       = "queue-status",
+        .args_type  = "path:s,queue:i",
+        .params     = "path queue",
+        .help       = "Display status of a given virtio queue",
+        .cmd        = hmp_virtio_queue_status,
+        .flags      = "p",
+    },
+
+SRST
+  ``virtio queue-status`` *path* *queue*
+    Display status of a given virtio queue
+
+    Example:
+
+    Dump the status of the first queue of the first virtio device::
+
+      (qemu) virtio queue-status /machine/peripheral-anon/device[3]/virtio-backend 0
+      /machine/peripheral-anon/device[3]/virtio-backend:
+        device_type:          virtio-net
+        index:                0
+        inuse:                0
+        last_avail_idx:       61 (61 % 256)
+        shadow_avail_idx:     292 (36 % 256)
+        used_idx:             61 (61 % 256)
+        signalled_used:       61 (61 % 256)
+        signalled_used_valid: 1
+        VRing:
+          num:         256
+          num_default: 256
+          align:       4096
+          desc:        0x000000006c352000
+          avail:       0x000000006c353000
+          used:        0x000000006c353240
+
+ERST
+
+    {
+        .name       = "queue-element",
+        .args_type  = "path:s,queue:i,index:i?",
+        .params     = "path queue [index]",
+        .help       = "Display element of a given virtio queue",
+        .cmd        = hmp_virtio_queue_element,
+        .flags      = "p",
+    },
+
+SRST
+  ``virtio queue-element`` *path* *queue* [*index*]
+    Display element of a given virtio queue
+
+    Example:
+
+    Dump the information of the head element of the first queue of
+    the first virtio device::
+
+      (qemu) virtio queue-element/machine/peripheral-anon/device[3]/virtio-backend 0
+      index:  67
+      ndescs: 1
+      descs:  addr 0x6fe69800 len 1536 (write)
+
+      (qemu) xp/128bx 0x6fe69800
+      000000006fe69800: 0x02 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+      000000006fe69808: 0x00 0x00 0x01 0x00 0x52 0x54 0x00 0x12
+      000000006fe69810: 0x34 0x56 0x52 0x54 0x00 0x09 0x51 0xde
+      000000006fe69818: 0x08 0x00 0x45 0x00 0x00 0x4c 0x8f 0x32
+
+    device[3] is a virtio-net device and we can see in the element buffer the
+    MAC address of the card::
+
+      [root@localhost ~]# ip link show ens4
+      2: ens4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP m0
+          link/ether 52:54:00:12:34:56 brd ff:ff:ff:ff:ff:ff
+
+    and the MAC address of the gateway::
+
+      [root@localhost ~]# arp -a
+      _gateway (192.168.122.1) at 52:54:00:09:51:de [ether] on ens4
+
+ERST
diff --git a/hmp-commands.hx b/hmp-commands.hx
index 8e45bce..4ef0630 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1720,6 +1720,16 @@ SRST
 ERST
 
     {
+        .name       = "virtio",
+        .args_type  = "name:S?",
+        .params     = "[cmd]",
+        .help       = "show various information about virtio",
+        .cmd        = hmp_virtio_help,
+        .sub_table  = hmp_virtio_cmds,
+        .flags      = "p",
+    },
+
+    {
         .name       = "info",
         .args_type  = "item:s?",
         .params     = "[subcommand]",
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index bd4d13d..db0c5b8 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -31,6 +31,9 @@
 #include "sysemu/runstate.h"
 #include "standard-headers/linux/virtio_ids.h"
 #include CONFIG_DEVICES
+#include "monitor/hmp.h"
+#include "monitor/monitor.h"
+#include "qapi/qmp/qdict.h"
 
 static QTAILQ_HEAD(, VirtIODevice) virtio_list;
 
@@ -3919,6 +3922,32 @@ VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
     return list;
 }
 
+void hmp_virtio_query(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    VirtioInfoList *list = qmp_x_debug_query_virtio(&err);
+    VirtioInfoList *node;
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    if (list == NULL) {
+        monitor_printf(mon, "No VirtIO devices\n");
+        return;
+    }
+
+    node = list;
+    while (node) {
+        monitor_printf(mon, "%s [%s]\n", node->value->path,
+                       VirtioType_str(node->value->type));
+        node = node->next;
+    }
+
+    qapi_free_VirtioInfoList(list);
+}
+
 static VirtIODevice *virtio_device_find(const char *path)
 {
     VirtIODevice *vdev;
@@ -3972,8 +4001,48 @@ VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
     return status;
 }
 
+void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    VirtQueueStatus *s = qmp_x_debug_virtio_queue_status(path, queue, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_type:          %s\n",
+                   VirtioType_str(s->device_type));
+    monitor_printf(mon, "  index:                %d\n", s->queue_index);
+    monitor_printf(mon, "  inuse:                %d\n", s->inuse);
+    monitor_printf(mon, "  last_avail_idx:       %d (%"PRId64" %% %"PRId64")\n",
+                   s->last_avail_idx, s->last_avail_idx % s->vring_num,
+                   s->vring_num);
+    monitor_printf(mon, "  shadow_avail_idx:     %d (%"PRId64" %% %"PRId64")\n",
+                   s->shadow_avail_idx, s->shadow_avail_idx % s->vring_num,
+                   s->vring_num);
+    monitor_printf(mon, "  used_idx:             %d (%"PRId64" %% %"PRId64")\n",
+                   s->used_idx, s->used_idx % s->vring_num, s->vring_num);
+    monitor_printf(mon, "  signalled_used:       %d (%"PRId64" %% %"PRId64")\n",
+                   s->signalled_used, s->signalled_used % s->vring_num,
+                   s->vring_num);
+    monitor_printf(mon, "  signalled_used_valid: %d\n", s->signalled_used_valid);
+    monitor_printf(mon, "  VRing:\n");
+    monitor_printf(mon, "    num:         %"PRId64"\n", s->vring_num);
+    monitor_printf(mon, "    num_default: %"PRId64"\n", s->vring_num_default);
+    monitor_printf(mon, "    align:       %"PRId64"\n", s->vring_align);
+    monitor_printf(mon, "    desc:        0x%016"PRIx64"\n", s->vring_desc);
+    monitor_printf(mon, "    avail:       0x%016"PRIx64"\n", s->vring_avail);
+    monitor_printf(mon, "    used:        0x%016"PRIx64"\n", s->vring_used);
+
+    qapi_free_VirtQueueStatus(s);
+}
+
 #define CONVERT_FEATURES(type, map)                \
-    ({                                           \
+    ({                                             \
         type *list = NULL;                         \
         type *node;                                \
         for (i = 0; map[i].virtio_bit != -1; i++) {\
@@ -4106,6 +4175,93 @@ VirtioStatus *qmp_x_debug_virtio_status(const char* path, Error **errp)
     return status;
 }
 
+#define DUMP_FEATURES(type, field)                                         \
+    do {                                                                   \
+        type##FeatureList * list = features->u.field.features;              \
+        if (list) {                                                        \
+            monitor_printf(mon, "                    ");                   \
+            while (list) {                                                 \
+                monitor_printf(mon, "%s", type##Feature_str(list->value)); \
+                list = list->next;                                         \
+                if (list != NULL) {                                        \
+                    monitor_printf(mon, ", ");                             \
+                }                                                          \
+            }                                                              \
+            monitor_printf(mon, "\n");                                     \
+        }                                                                  \
+    } while (0)
+
+static void hmp_virtio_dump_features(Monitor *mon,
+                                     VirtioDeviceFeatures *features)
+{
+    VirtioTransportFeatureList *transport_list = features->transport;
+    while (transport_list) {
+        monitor_printf(mon, "%s",
+                       VirtioTransportFeature_str(transport_list->value));
+        transport_list = transport_list->next;
+        if (transport_list != NULL) {
+            monitor_printf(mon, ", ");
+        }
+    }
+    monitor_printf(mon, "\n");
+    switch (features->type) {
+    case VIRTIO_TYPE_VIRTIO_SERIAL:
+        DUMP_FEATURES(VirtioSerial, virtio_serial);
+        break;
+    case VIRTIO_TYPE_VIRTIO_BLK:
+        DUMP_FEATURES(VirtioBlk, virtio_blk);
+        break;
+    case VIRTIO_TYPE_VIRTIO_GPU:
+        DUMP_FEATURES(VirtioGpu, virtio_gpu);
+        break;
+    case VIRTIO_TYPE_VIRTIO_NET:
+        DUMP_FEATURES(VirtioNet, virtio_net);
+        break;
+    case VIRTIO_TYPE_VIRTIO_SCSI:
+        DUMP_FEATURES(VirtioScsi, virtio_scsi);
+        break;
+    case VIRTIO_TYPE_VIRTIO_BALLOON:
+        DUMP_FEATURES(VirtioBalloon, virtio_balloon);
+        break;
+    case VIRTIO_TYPE_VIRTIO_IOMMU:
+        DUMP_FEATURES(VirtioIommu, virtio_iommu);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    if (features->has_unknown_features) {
+        monitor_printf(mon, "                    "
+                            "unknown-features(0x%016"PRIx64")\n",
+                       features->unknown_features);
+    }
+}
+
+void hmp_virtio_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    VirtioStatus *s = qmp_x_debug_virtio_status(path, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  Device Id:        %"PRId64"\n", s->device_id);
+    monitor_printf(mon, "  Guest features:   ");
+    hmp_virtio_dump_features(mon, s->guest_features);
+    monitor_printf(mon, "  Host features:    ");
+    hmp_virtio_dump_features(mon, s->host_features);
+    monitor_printf(mon, "  Backend features: ");
+    hmp_virtio_dump_features(mon, s->backend_features);
+    monitor_printf(mon, "  Endianness:       %s\n",
+                   VirtioStatusEndianness_str(s->device_endian));
+    monitor_printf(mon, "  VirtQueues:       %d\n", s->num_vqs);
+
+    qapi_free_VirtioStatus(s);
+}
+
 static VirtioRingDescFlagsList *qmp_decode_vring_desc_flags(uint16_t flags)
 {
     VirtioRingDescFlagsList *list = NULL;
@@ -4241,6 +4397,52 @@ done:
     return element;
 }
 
+void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    int index = qdict_get_try_int(qdict, "index", -1);
+    VirtioQueueElement *element;
+    VirtioRingDescList *list;
+
+    element = qmp_x_debug_virtio_queue_element(path, queue, index != -1,
+                                               index, &err);
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "index:  %d\n", element->index);
+    monitor_printf(mon, "ndescs: %d\n", element->ndescs);
+    monitor_printf(mon, "descs:  ");
+
+    list = element->descs;
+    while (list) {
+        monitor_printf(mon, "addr 0x%"PRIx64" len %d", list->value->addr,
+                       list->value->len);
+        if (list->value->flags) {
+            VirtioRingDescFlagsList *flag = list->value->flags;
+            monitor_printf(mon, " (");
+            while (flag) {
+                monitor_printf(mon, "%s", VirtioRingDescFlags_str(flag->value));
+                flag = flag->next;
+                if (flag) {
+                    monitor_printf(mon, ", ");
+                }
+            }
+            monitor_printf(mon, ")");
+        }
+        list = list->next;
+        if (list) {
+            monitor_printf(mon, ", ");
+        }
+    }
+    monitor_printf(mon, "\n");
+
+    qapi_free_VirtioQueueElement(element);
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 3baa105..e777b32 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -94,6 +94,10 @@ void hmp_qom_list(Monitor *mon, const QDict *qdict);
 void hmp_qom_get(Monitor *mon, const QDict *qdict);
 void hmp_qom_set(Monitor *mon, const QDict *qdict);
 void hmp_info_qom_tree(Monitor *mon, const QDict *dict);
+void hmp_virtio_query(Monitor *mon, const QDict *qdict);
+void hmp_virtio_status(Monitor *mon, const QDict *qdict);
+void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict);
+void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict);
 void object_add_completion(ReadLineState *rs, int nb_args, const char *str);
 void object_del_completion(ReadLineState *rs, int nb_args, const char *str);
 void device_add_completion(ReadLineState *rs, int nb_args, const char *str);
diff --git a/meson.build b/meson.build
index eb362ee..d690de2 100644
--- a/meson.build
+++ b/meson.build
@@ -1964,6 +1964,7 @@ if have_system
   hx_headers += [
     ['hmp-commands.hx', 'hmp-commands.h'],
     ['hmp-commands-info.hx', 'hmp-commands-info.h'],
+    ['hmp-commands-virtio.hx', 'hmp-commands-virtio.h'],
   ]
 endif
 foreach d : hx_headers
diff --git a/monitor/misc.c b/monitor/misc.c
index 1539e18..ef8f87c 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include CONFIG_DEVICES
 #include "monitor-internal.h"
 #include "monitor/qdev.h"
 #include "hw/usb.h"
@@ -219,6 +220,15 @@ static void hmp_info_help(Monitor *mon, const QDict *qdict)
     help_cmd(mon, "info");
 }
 
+static void hmp_virtio_help(Monitor *mon, const QDict *qdict)
+{
+#if defined(CONFIG_VIRTIO)
+    help_cmd(mon, "virtio");
+#else
+    monitor_printf(mon, "Virtio is disabled\n");
+#endif
+}
+
 static void monitor_init_qmp_commands(void)
 {
     /*
@@ -1451,6 +1461,13 @@ static HMPCommand hmp_info_cmds[] = {
     { NULL, NULL, },
 };
 
+static HMPCommand hmp_virtio_cmds[] = {
+#if defined(CONFIG_VIRTIO)
+#include "hmp-commands-virtio.h"
+#endif
+    { NULL, NULL, },
+};
+
 /* hmp_cmds and hmp_info_cmds would be sorted at runtime */
 HMPCommand hmp_cmds[] = {
 #include "hmp-commands.h"
-- 
1.8.3.1


