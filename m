Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7CB51C618
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:29:04 +0200 (CEST)
Received: from localhost ([::1]:57492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfHj-0006k1-1u
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0k-00063L-NH
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:34 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:47520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0e-0002Bi-Ok
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:29 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245GgoMr019152
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=19u8VelCgchRdim8fYLw4N1ux/9bG6io3C8mB630iDg=;
 b=Mmo3uk6wguGmIXsXPOBgiCdpDfLVWx//6Qg8ZdUBXUfMwRcMGFOcasPtGDD4TeqlvNjR
 Yan3fCHYBIVWXM6c1E+RBTjU1+yG0uhwenhturddZJVIXoYTa8AmN/PysIWkzMsR2MMj
 wLmwLJfiEORCL1q7r8j3Z8O30E+sEKh4CmBKc2k6GRZK7dTuBYlE+W5KiKSrlspuq7BU
 NsK4HHVRxQq1eOzFlZd010QrKvc85CdJ85ZYlWcLXsCd4gFx8wZR7MDPIn7iTwmwqNX2
 ukxsIU8fI0ksiMXyjGLFquxSERRIJ/5c8XNYgp0sDeCmQ05f1OBoB/8lq/WKtB7PrCIX 7Q== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frw0aupam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:20 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245H0sqO013487
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:19 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fruj4xq8q-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVvk3h2XHB1sxAPNYEziK+D5IYUXohE125TPf1s+JnLEIBEonMsGpzOF+YKQNmZ529sbw8AsllRGdWVoJT1hI9lXgTMgo5JBb1kycg4IIntDaBlKBtS0Urj9YMlOEQue6xH6JF/gl3EAUQy4y1iuS7HJ4rSJd3iR0MAi29pB0ORvh4VqYwiaDPXOmAYQF+w4I3KhJL0HBTRkbj9/axahkVF6fU9eKyRlJ14NJET568OSU3nffqXkFkBbhCT39CuLZ3wYjqlNOK+9li95AyzsUXbRIhHstTr4eIi+pyxTDKCNoxRDPS+gbO6mWIXcYmlI42dJlyMwLVkYTfkbk0wjyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19u8VelCgchRdim8fYLw4N1ux/9bG6io3C8mB630iDg=;
 b=QYWxJX2ZDvpprLKSY08GXFWCCyzORQq/8Wbjg7Asju541uRvOUflCJznXw2eyp5kg9w6YOaHUFvMAu86/ajhDlq28l5+X2z2h8xvvCm+h/rvk6DrE2hGJQUw+Mi85DAGq2ij5Vs4ADpMviQb3RvkiLloThXfhCbjZL7pw6Qh3OaUlz6IzKyNJrYS04dUcHMerV07WrQVm7+sd9pKHMG2whzvvPGsHQxuF2qcvPGMJ5VCZpqk7Ac+bQWZU3dUeOLV1NnrWnShbyy4ZgrhRnccCJOO1iF/Wnx540jO0uMJnNqsdnO4FecKx+92ytxpygzvB8b7P9FLw9f+jqgMMdnNNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19u8VelCgchRdim8fYLw4N1ux/9bG6io3C8mB630iDg=;
 b=KjRMXW6bCnkplSYldGXqNpZt78DYA8UWaZQXnTvuLkws5J3uBqnKTTOoODt1iUFADLwwqwMCwH2oyN0I8BIskedxxrvOOSD3WTs4jsC+qGMHa3xDdV3pEgqIBIBcBRGzGWrUSo5QV1ff8WMYida+8066bnj7ckpQY3jvPnAf3EY=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by DM5PR10MB1867.namprd10.prod.outlook.com (2603:10b6:3:10b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 17:11:17 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 17:11:17 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 04/23] vfio-user: add region cache
Date: Thu,  5 May 2022 10:19:47 -0700
Message-Id: <b12c7e2132153f3f31e6064eb93bfccbc1c93156.1651709440.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1651709440.git.john.g.johnson@oracle.com>
References: <cover.1651709440.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::25) To BYAPR10MB3255.namprd10.prod.outlook.com
 (2603:10b6:a03:156::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb6ed96c-7bfe-4992-7ca3-08da2eba43fc
X-MS-TrafficTypeDiagnostic: DM5PR10MB1867:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB1867D95CBB5127926178F610B6C29@DM5PR10MB1867.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xwumnNw3mRzN3Vr7e6K5/QPYLd/YhrosjgWtHMZE0B9oCoejrIHcu+YL+b/U7kddtmrYkdmAVAcCp6Oyvmt7hD4/mb7MXqUbu/hVVEpNRvF0YlXxBzEYTFal07wDEvqtMQGWBFOivUP+Y35kSRb5xWuU5KFXKKn+aWox7Vpc4tQ7LBzOknZEcMw8xmCa0HZOUr5yBMMlfGIwe4xIDi53ogTjgwA+ETl0K8iCNt1pqyNpLf2wgWqTp6qy8/fX7AJpyokfzz1OIZMmTilOuXmXDQpp9tQSGSyIO6RyxsmZ9rZS1drNy4lIYZJpB2DoIOJo6hwxR/6CQS4PrhQSnCy62LfVWs5cJGonaMnqVyZTzHIv4Lwm1l6KpBZVYKACY3hcih8mJBqGvKSRWf41ljtdGpmAfYSSsm3kKqnzQTmmtHkHhmwdcloneJTlqcpJrV5xm/lLg8oSNzWWT23sU0Y6mbtJ4esCwXqxUZ0Ioot8qRqatFb4cKRc1mtYDCZJUiLnWent7YKJFaZYdvTNDSmAhMpFLaxhZfH/D4yNqul3YY91OmyztrFa7/C9aThKNxMnyo2cJ0UYhoFa8WMswzKXlnpVpEvwl7r0jdbLDeeffFml6Vofpl+zZVLU1+4C5GfcIAoAocogidJBxn+dwnyuQe+BaBYv9t+uhMe8hZ9GzsnoWUmNR3jUwowMXgEREpZD6qH4pab8rOaKVEJRyckq7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6666004)(8676002)(66556008)(66946007)(66476007)(8936002)(38100700002)(38350700002)(5660300002)(86362001)(508600001)(6486002)(316002)(6506007)(186003)(83380400001)(36756003)(30864003)(2616005)(2906002)(26005)(6512007)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pk3z0zgpjDeKhPatSJXoXNEIkU2+ufWuh3HniclxYWsIRylKQcuV9gazOspU?=
 =?us-ascii?Q?9E78zztapYJjXS5MCPWOJmUBplBTZqI3tPfi3/9775Es2ZAEQ54yYfZ+Ehec?=
 =?us-ascii?Q?Jv5UUvbIYEOeU0WejnNmzaChD84j+5u58YG8hN3w78rATrI+jJ+bZTFnTbr5?=
 =?us-ascii?Q?QFh7pjBY1mfTgJYTYn90P6Z5RpYMkqSNzzAA54YU+hoO0H/vWz5XR2q82Vm0?=
 =?us-ascii?Q?vWdAkVHi1Tzd41Dy0HSdYMvrcf53F8EHc2kPgiGCWa3FQoMPe4cEC0/2MbJU?=
 =?us-ascii?Q?ILo2i+aMG7GwDi1Edv5cpDk3/zfvNJmv1KT2SusVXYqSJa5U1HyMF51F29DV?=
 =?us-ascii?Q?Br+4BGcIZSMSZfHVftMJWWfOkFY9KAv+DeG4FLcgaf1Je9/v3bGhtHBORDk0?=
 =?us-ascii?Q?JuZLZKtigFdIbMda+n8+qij3Rjgaygke5+EuPexkCDtVrVudB+IvXNFyxpOz?=
 =?us-ascii?Q?H/petrAjMaitOGJo2p/YEcz+hfZr8EQYBGjisR1oh5/ll3U394JfYW673GVZ?=
 =?us-ascii?Q?pcAyP4LK+H2qDW6rSlujrAaPlIW/+ssh8dhQ3eS+WufWieoT06bAzgStRbxI?=
 =?us-ascii?Q?96+/qPAJp2PIBNX2giNezFaNrkWPRGwdDwNTjXgQd7QfiZ3tPE2sfkAJLU3e?=
 =?us-ascii?Q?NcGsn+byk7dYZgTKbC2NJDKBFBLDhdTnzBXVX5J6LtbQypXt0DPs3W8A+2v7?=
 =?us-ascii?Q?BU0BZ6lBM2n0JjHEWXRppQjsxearKyWEm3v8xp6I5bgnsP+mKePmClWU2b5S?=
 =?us-ascii?Q?3K+xwiZoNOV4wfni/0IcaYJrWIu+DbsF0tBSWYIqk25oRmlGswuXpWVC68qV?=
 =?us-ascii?Q?eDppyJD/ZSqC2mHBKO/SLPS3D85nSwC4mKV8/Vgv9bP2PRWTOdneR36YcS7d?=
 =?us-ascii?Q?a+I5krjpVJUukycXXANvem+VnLVjKwjf8g9xgV6Niv4Pu31dzK4tmCxt4BNq?=
 =?us-ascii?Q?jxlapR/VI3YPDOBT/xGLEsBa/Gq47geMd3sQBhIKST/letgCZGnSRxfyUtvn?=
 =?us-ascii?Q?OHV16PjZbuzPG401alVVoqaS+9SM79hdeg5DA5PggkT6mkulz2z7gkzc6X3N?=
 =?us-ascii?Q?z+j94OP1Zkjk50QgaymldWMKnZuFrD6Fjb7ooLRNJ2UnQCuQHSu1B+EcXD9R?=
 =?us-ascii?Q?8p+YpY/UMZ52wEibtMyZvEthKUhyEAHVtb8rXLqBhxgMyQNYUbMQb0Qx8qTo?=
 =?us-ascii?Q?/O1x0wY+Oq/BIzkYelxxO2R42BemI1Q0Bhdl/AkBGqtmxf8VL0emnfxOstnG?=
 =?us-ascii?Q?3S63uzkmp4OKP0Lcvqdta/T/u2B2IItXHkFxXlTNgTZLO/dLfwlnKQdLLlcu?=
 =?us-ascii?Q?XCrSU5ZYEQeBz3Q+5esuD7M6Zqe7zpieLJCu7uAE1dyLvfV1TNI/sARmWAxw?=
 =?us-ascii?Q?9ZCcPPeoZpb/6TWJjVftJrj/Wk9aOI5nwRXxx4XV2PppL/4IrqF00O5vrACa?=
 =?us-ascii?Q?7XDy2p1jrwleEGgjxUNvtpuO3NY0Qd8eeHjP+UUYDAyVRxsDQ5ueVYU1KKt9?=
 =?us-ascii?Q?21DqU1r5KgxeC0+F+f3kYc5XaiqD93WpcAUearshUGXBMsjoumS9nHeHBq3s?=
 =?us-ascii?Q?peLaQexabThZ1o0SVohGHLsQh/Y2FICrVYhnSZJGo8BMRHdr7G0KEgnIXRtp?=
 =?us-ascii?Q?p4KMPPc2cp8D0pGTB3GgS/+vB7emVl1q3oiKKIQE343iYpLPEvIkVjyQHuIO?=
 =?us-ascii?Q?hatFmVVXd+6MpB08cvduPffX/IjdcmQCj9pvwMsMuP+wZ0tvpajM9tCLZcDd?=
 =?us-ascii?Q?NGjOofwibiYSR0i5RqVhSVL7V/6/T3c=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb6ed96c-7bfe-4992-7ca3-08da2eba43fc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 17:11:16.6855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FBUbVwrq49CZhc3ML26H0vUu1TtTkwgLO/b3Tru498H7y3of7arjYZDEA8aNBjvK7lM4j3bIycs8/k1LVKeJ9/5azZb8EQE2q68km3DYr8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1867
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_06:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050118
X-Proofpoint-GUID: UQ2Ls4Xjc4Hi9JW9XciUzXR3S_RIMqPR
X-Proofpoint-ORIG-GUID: UQ2Ls4Xjc4Hi9JW9XciUzXR3S_RIMqPR
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

cache VFIO_DEVICE_GET_REGION_INFO results to reduce
memory alloc/free cycles and as prep work for vfio-user

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/hw/vfio/vfio-common.h |  2 ++
 hw/vfio/ccw.c                 |  5 -----
 hw/vfio/common.c              | 41 +++++++++++++++++++++++++++++++++++------
 hw/vfio/igd.c                 | 23 +++++++++--------------
 hw/vfio/migration.c           |  2 --
 hw/vfio/pci-quirks.c          | 19 +++++--------------
 hw/vfio/pci.c                 |  8 --------
 7 files changed, 51 insertions(+), 49 deletions(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 2761a62..1a032f4 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -145,6 +145,7 @@ typedef struct VFIODevice {
     VFIOMigration *migration;
     Error *migration_blocker;
     OnOffAuto pre_copy_dirty_page_tracking;
+    struct vfio_region_info **regions;
 } VFIODevice;
 
 struct VFIODeviceOps {
@@ -258,6 +259,7 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
                          struct vfio_region_info **info);
 int vfio_get_dev_region_info(VFIODevice *vbasedev, uint32_t type,
                              uint32_t subtype, struct vfio_region_info **info);
+void vfio_get_all_regions(VFIODevice *vbasedev);
 bool vfio_has_region_cap(VFIODevice *vbasedev, int region, uint16_t cap_type);
 struct vfio_info_cap_header *
 vfio_get_region_info_cap(struct vfio_region_info *info, uint16_t id);
diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 0354737..06b588c 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -517,7 +517,6 @@ static void vfio_ccw_get_region(VFIOCCWDevice *vcdev, Error **errp)
 
     vcdev->io_region_offset = info->offset;
     vcdev->io_region = g_malloc0(info->size);
-    g_free(info);
 
     /* check for the optional async command region */
     ret = vfio_get_dev_region_info(vdev, VFIO_REGION_TYPE_CCW,
@@ -530,7 +529,6 @@ static void vfio_ccw_get_region(VFIOCCWDevice *vcdev, Error **errp)
         }
         vcdev->async_cmd_region_offset = info->offset;
         vcdev->async_cmd_region = g_malloc0(info->size);
-        g_free(info);
     }
 
     ret = vfio_get_dev_region_info(vdev, VFIO_REGION_TYPE_CCW,
@@ -543,7 +541,6 @@ static void vfio_ccw_get_region(VFIOCCWDevice *vcdev, Error **errp)
         }
         vcdev->schib_region_offset = info->offset;
         vcdev->schib_region = g_malloc(info->size);
-        g_free(info);
     }
 
     ret = vfio_get_dev_region_info(vdev, VFIO_REGION_TYPE_CCW,
@@ -557,7 +554,6 @@ static void vfio_ccw_get_region(VFIOCCWDevice *vcdev, Error **errp)
         }
         vcdev->crw_region_offset = info->offset;
         vcdev->crw_region = g_malloc(info->size);
-        g_free(info);
     }
 
     return;
@@ -567,7 +563,6 @@ out_err:
     g_free(vcdev->schib_region);
     g_free(vcdev->async_cmd_region);
     g_free(vcdev->io_region);
-    g_free(info);
     return;
 }
 
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 917da0f..d9290f3 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1568,8 +1568,6 @@ int vfio_region_setup(Object *obj, VFIODevice *vbasedev, VFIORegion *region,
         }
     }
 
-    g_free(info);
-
     trace_vfio_region_setup(vbasedev->name, index, name,
                             region->flags, region->fd_offset, region->size);
     return 0;
@@ -2325,6 +2323,16 @@ void vfio_put_group(VFIOGroup *group)
     }
 }
 
+void vfio_get_all_regions(VFIODevice *vbasedev)
+{
+    struct vfio_region_info *info;
+    int i;
+
+    for (i = 0; i < vbasedev->num_regions; i++) {
+        vfio_get_region_info(vbasedev, i, &info);
+    }
+}
+
 int vfio_get_device(VFIOGroup *group, const char *name,
                     VFIODevice *vbasedev, Error **errp)
 {
@@ -2380,12 +2388,23 @@ int vfio_get_device(VFIOGroup *group, const char *name,
     trace_vfio_get_device(name, dev_info.flags, dev_info.num_regions,
                           dev_info.num_irqs);
 
+    vfio_get_all_regions(vbasedev);
     vbasedev->reset_works = !!(dev_info.flags & VFIO_DEVICE_FLAGS_RESET);
     return 0;
 }
 
 void vfio_put_base_device(VFIODevice *vbasedev)
 {
+    if (vbasedev->regions != NULL) {
+        int i;
+
+        for (i = 0; i < vbasedev->num_regions; i++) {
+            g_free(vbasedev->regions[i]);
+        }
+        g_free(vbasedev->regions);
+        vbasedev->regions = NULL;
+    }
+
     if (!vbasedev->group) {
         return;
     }
@@ -2400,6 +2419,17 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
 {
     size_t argsz = sizeof(struct vfio_region_info);
 
+    /* create region cache */
+    if (vbasedev->regions == NULL) {
+        vbasedev->regions = g_new0(struct vfio_region_info *,
+                                   vbasedev->num_regions);
+    }
+    /* check cache */
+    if (vbasedev->regions[index] != NULL) {
+        *info = vbasedev->regions[index];
+        return 0;
+    }
+
     *info = g_malloc0(argsz);
 
     (*info)->index = index;
@@ -2419,6 +2449,9 @@ retry:
         goto retry;
     }
 
+    /* fill cache */
+    vbasedev->regions[index] = *info;
+
     return 0;
 }
 
@@ -2437,7 +2470,6 @@ int vfio_get_dev_region_info(VFIODevice *vbasedev, uint32_t type,
 
         hdr = vfio_get_region_info_cap(*info, VFIO_REGION_INFO_CAP_TYPE);
         if (!hdr) {
-            g_free(*info);
             continue;
         }
 
@@ -2449,8 +2481,6 @@ int vfio_get_dev_region_info(VFIODevice *vbasedev, uint32_t type,
         if (cap_type->type == type && cap_type->subtype == subtype) {
             return 0;
         }
-
-        g_free(*info);
     }
 
     *info = NULL;
@@ -2466,7 +2496,6 @@ bool vfio_has_region_cap(VFIODevice *vbasedev, int region, uint16_t cap_type)
         if (vfio_get_region_info_cap(info, cap_type)) {
             ret = true;
         }
-        g_free(info);
     }
 
     return ret;
diff --git a/hw/vfio/igd.c b/hw/vfio/igd.c
index afe3fe7..22efa1a 100644
--- a/hw/vfio/igd.c
+++ b/hw/vfio/igd.c
@@ -425,7 +425,7 @@ void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
     if ((ret || !rom->size) && !vdev->pdev.romfile) {
         error_report("IGD device %s has no ROM, legacy mode disabled",
                      vdev->vbasedev.name);
-        goto out;
+        return;
     }
 
     /*
@@ -436,7 +436,7 @@ void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
         error_report("IGD device %s hotplugged, ROM disabled, "
                      "legacy mode disabled", vdev->vbasedev.name);
         vdev->rom_read_failed = true;
-        goto out;
+        return;
     }
 
     /*
@@ -449,7 +449,7 @@ void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
     if (ret) {
         error_report("IGD device %s does not support OpRegion access,"
                      "legacy mode disabled", vdev->vbasedev.name);
-        goto out;
+        return;
     }
 
     ret = vfio_get_dev_region_info(&vdev->vbasedev,
@@ -458,7 +458,7 @@ void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
     if (ret) {
         error_report("IGD device %s does not support host bridge access,"
                      "legacy mode disabled", vdev->vbasedev.name);
-        goto out;
+        return;
     }
 
     ret = vfio_get_dev_region_info(&vdev->vbasedev,
@@ -467,7 +467,7 @@ void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
     if (ret) {
         error_report("IGD device %s does not support LPC bridge access,"
                      "legacy mode disabled", vdev->vbasedev.name);
-        goto out;
+        return;
     }
 
     gmch = vfio_pci_read_config(&vdev->pdev, IGD_GMCH, 4);
@@ -481,7 +481,7 @@ void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
         error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
         error_report("IGD device %s failed to enable VGA access, "
                      "legacy mode disabled", vdev->vbasedev.name);
-        goto out;
+        return;
     }
 
     /* Create our LPC/ISA bridge */
@@ -489,7 +489,7 @@ void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
     if (ret) {
         error_report("IGD device %s failed to create LPC bridge, "
                      "legacy mode disabled", vdev->vbasedev.name);
-        goto out;
+        return;
     }
 
     /* Stuff some host values into the VM PCI host bridge */
@@ -497,7 +497,7 @@ void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
     if (ret) {
         error_report("IGD device %s failed to modify host bridge, "
                      "legacy mode disabled", vdev->vbasedev.name);
-        goto out;
+        return;
     }
 
     /* Setup OpRegion access */
@@ -505,7 +505,7 @@ void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
     if (ret) {
         error_append_hint(&err, "IGD legacy mode disabled\n");
         error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
-        goto out;
+        return;
     }
 
     /* Setup our quirk to munge GTT addresses to the VM allocated buffer */
@@ -608,9 +608,4 @@ void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
 
     trace_vfio_pci_igd_bdsm_enabled(vdev->vbasedev.name, ggms_mb + gms_mb);
 
-out:
-    g_free(rom);
-    g_free(opregion);
-    g_free(host);
-    g_free(lpc);
 }
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index ff6b45d..04bfb3a 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -876,13 +876,11 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
     }
 
     trace_vfio_migration_probe(vbasedev->name, info->index);
-    g_free(info);
     return 0;
 
 add_blocker:
     error_setg(&vbasedev->migration_blocker,
                "VFIO device doesn't support migration");
-    g_free(info);
 
     ret = migrate_add_blocker(vbasedev->migration_blocker, errp);
     if (ret < 0) {
diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index 0cf69a8..5cfd93d 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -1601,16 +1601,14 @@ int vfio_pci_nvidia_v100_ram_init(VFIOPCIDevice *vdev, Error **errp)
 
     hdr = vfio_get_region_info_cap(nv2reg, VFIO_REGION_INFO_CAP_NVLINK2_SSATGT);
     if (!hdr) {
-        ret = -ENODEV;
-        goto free_exit;
+        return -ENODEV;
     }
     cap = (void *) hdr;
 
     p = mmap(NULL, nv2reg->size, PROT_READ | PROT_WRITE,
              MAP_SHARED, vdev->vbasedev.fd, nv2reg->offset);
     if (p == MAP_FAILED) {
-        ret = -errno;
-        goto free_exit;
+        return -errno;
     }
 
     quirk = vfio_quirk_alloc(1);
@@ -1623,8 +1621,6 @@ int vfio_pci_nvidia_v100_ram_init(VFIOPCIDevice *vdev, Error **errp)
                         (void *) (uintptr_t) cap->tgt);
     trace_vfio_pci_nvidia_gpu_setup_quirk(vdev->vbasedev.name, cap->tgt,
                                           nv2reg->size);
-free_exit:
-    g_free(nv2reg);
 
     return ret;
 }
@@ -1651,16 +1647,14 @@ int vfio_pci_nvlink2_init(VFIOPCIDevice *vdev, Error **errp)
     hdr = vfio_get_region_info_cap(atsdreg,
                                    VFIO_REGION_INFO_CAP_NVLINK2_SSATGT);
     if (!hdr) {
-        ret = -ENODEV;
-        goto free_exit;
+        return -ENODEV;
     }
     captgt = (void *) hdr;
 
     hdr = vfio_get_region_info_cap(atsdreg,
                                    VFIO_REGION_INFO_CAP_NVLINK2_LNKSPD);
     if (!hdr) {
-        ret = -ENODEV;
-        goto free_exit;
+        return -ENODEV;
     }
     capspeed = (void *) hdr;
 
@@ -1669,8 +1663,7 @@ int vfio_pci_nvlink2_init(VFIOPCIDevice *vdev, Error **errp)
         p = mmap(NULL, atsdreg->size, PROT_READ | PROT_WRITE,
                  MAP_SHARED, vdev->vbasedev.fd, atsdreg->offset);
         if (p == MAP_FAILED) {
-            ret = -errno;
-            goto free_exit;
+            return -errno;
         }
 
         quirk = vfio_quirk_alloc(1);
@@ -1690,8 +1683,6 @@ int vfio_pci_nvlink2_init(VFIOPCIDevice *vdev, Error **errp)
                         (void *) (uintptr_t) capspeed->link_speed);
     trace_vfio_pci_nvlink2_setup_quirk_lnkspd(vdev->vbasedev.name,
                                               capspeed->link_speed);
-free_exit:
-    g_free(atsdreg);
 
     return ret;
 }
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 4ee5215..35b6551 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -793,8 +793,6 @@ static void vfio_pci_load_rom(VFIOPCIDevice *vdev)
     vdev->rom_size = size = reg_info->size;
     vdev->rom_offset = reg_info->offset;
 
-    g_free(reg_info);
-
     if (!vdev->rom_size) {
         vdev->rom_read_failed = true;
         error_report("vfio-pci: Cannot read device rom at "
@@ -2521,7 +2519,6 @@ int vfio_populate_vga(VFIOPCIDevice *vdev, Error **errp)
         error_setg(errp, "unexpected VGA info, flags 0x%lx, size 0x%lx",
                    (unsigned long)reg_info->flags,
                    (unsigned long)reg_info->size);
-        g_free(reg_info);
         return -EINVAL;
     }
 
@@ -2530,8 +2527,6 @@ int vfio_populate_vga(VFIOPCIDevice *vdev, Error **errp)
     vdev->vga->fd_offset = reg_info->offset;
     vdev->vga->fd = vdev->vbasedev.fd;
 
-    g_free(reg_info);
-
     vdev->vga->region[QEMU_PCI_VGA_MEM].offset = QEMU_PCI_VGA_MEM_BASE;
     vdev->vga->region[QEMU_PCI_VGA_MEM].nr = QEMU_PCI_VGA_MEM;
     QLIST_INIT(&vdev->vga->region[QEMU_PCI_VGA_MEM].quirks);
@@ -2626,8 +2621,6 @@ static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
     }
     vdev->config_offset = reg_info->offset;
 
-    g_free(reg_info);
-
     if (vdev->features & VFIO_FEATURE_ENABLE_VGA) {
         ret = vfio_populate_vga(vdev, errp);
         if (ret) {
@@ -3035,7 +3028,6 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
         }
 
         ret = vfio_pci_igd_opregion_init(vdev, opregion, errp);
-        g_free(opregion);
         if (ret) {
             goto out_teardown;
         }
-- 
1.8.3.1


