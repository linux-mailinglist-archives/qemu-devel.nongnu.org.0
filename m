Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C4151C63F
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:38:18 +0200 (CEST)
Received: from localhost ([::1]:46622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfQg-00024R-0c
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0m-00063S-JF
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:35 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:12892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0g-0002CA-9L
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:31 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245EeRA9026258
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=WY6AW+r55TRFa5MuXT+MOgq4tx7hZp8j9+vRSaldZ7E=;
 b=mjoDVygEwwQ+hQb/OLg50kpuYD3/qGJiWj7l/afOxtfBWeoWoYQt2pp48ViAR+j5nXfh
 5iSY8gIXEJRdj14DlWfLg+bBZN4benAL+o0EJ6H5AQSlLhTpoIWtk4zMS1iPKWYLRbzy
 L0+XMcXsd1+GkbjOPEj5WOcXde+ShLxh2PyYHTktv0jW3lZBBjcvyvDl7Fxr3azBNnpw
 kcdXjnf3E3oGntDMS6OB4bNsGmLlhxLa4N+8ZRibAbt/rr0EVZ7/n72gaBkQ898gM3nl
 k5oFREDzyrSBs/BYj2P0msON1/H7xKMI4wJ3l98EPAX1kvOS7Ddy7c+dt19ZkIj/1zZi yg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruhcbs66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:25 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245H1bPG018925
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:24 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fusah2e9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z70nF/X+iy68WH215FlD6q/D5RVZVnRIJqBP36j17+xuqXfElcu3yucenP+d98+697yxOnthAvRkrr8FYkJDJZr7so55w/3wTJGAZNd5Jj8gEx1lY28vZ55gfXfs27gvppN2dKZPSxmL4+ZtnfEpPJHlAqgSst+Swro72hVcy9Zsek8jxwORcr3PeFnHaj5YY/tNKy6iBGbcZsSdyNdW4zGrC30holgPmMUhDVHfZFN+RggbM3y0o3SORNBFveap+rmMTtxoBw/SZdzYH8IOfvFkEtUiB5/23mjq+QDIcdWrALPEiITYTr6xsMaNU22JQJrcpy11t6yyflQCLJ7iCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WY6AW+r55TRFa5MuXT+MOgq4tx7hZp8j9+vRSaldZ7E=;
 b=iA/+IWTBUkLAl1I1H8SgBFEZ9COYHvqBhLo7vKgvAuYyPbiMvQjyUqbTA75U6KYtI+dC8GKKhe5M+Le+atDlzK9N/BE7GBWzlQqadrSrmpb/Xj42pmCv4ivHvfMv4CyBiH6y6B2rkfVjfFQ8bg/io9zgek7UWvb+rfpwL+HWo5BYWpCtbzJvOnl2aolHH5SCh3FafpEgKTbbac62HYPJMnbhC0aOb+bSrJ5GzRlGdv/+iajwvbIF6HzS9duZtJwRPN/Fll42LJPCShJ3tefk8KD0t6hytk76T0gyoQHR8cPC3cTCXyY9xUm62V2kx0Xgx6O8x2v8SEAxPgsCJDGgVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WY6AW+r55TRFa5MuXT+MOgq4tx7hZp8j9+vRSaldZ7E=;
 b=h+7YhTfXFERywomvKEGPwp5Vo2M0b+Ynj2toSJYZ3Kl2AOxzubCgS8c0CTq8ahaTnjvU+x6+6WWtJ5mmiFBBGu7m7e98kztDqomZn1UYJvnr5zbTjvHHmVOycUJjOACrMrup1Cld641DGXPtEclBEbMjKXaRXQoAOYOMzDGF4HU=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by DM5PR10MB1867.namprd10.prod.outlook.com (2603:10b6:3:10b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 17:11:21 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 17:11:21 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 11/23] vfio-user: get region info
Date: Thu,  5 May 2022 10:19:54 -0700
Message-Id: <1f48fe5f10f9887f46ee8f929e42e3b50c440d2e.1651709440.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1651709440.git.john.g.johnson@oracle.com>
References: <cover.1651709440.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::25) To BYAPR10MB3255.namprd10.prod.outlook.com
 (2603:10b6:a03:156::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b437795b-c8e2-4353-8c36-08da2eba4577
X-MS-TrafficTypeDiagnostic: DM5PR10MB1867:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB186743269A8ABEE86713B8CCB6C29@DM5PR10MB1867.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x38Wf/izQq+URWvkNXT4ZokeiuZUTANIO6oHGO8xEiwIsxrtE+uhsQWlqa5bh+y/udR6vBl5nHXFjLPsZ65PFydrsDmbYBBwohM21JGVkoNCtjOCkBP1bPW3UGO6gaowpJwl7absgamsOY6L5Nmgd8wlLnBK55jB8vjWS0THtFCBdeRLuWPH47Lc8x67Lbi4cjpDINPnccMBckVOHI0vqE2gRRSlSHIHyUCusYZQ/CeLugywmamdUz8fu4fen5DbIka6oFxGPPtx4WdWnnkEJFoQBW0kzZpj/9Aki53aPADfeApeIqTbzXjxrntUR7iYwoOpAG8sHYr+B6pQ26L6diF6Y6L1mg+EB8/ue9nULrhYgiHP+wG9dEYat3/KPsi9fxk/iJ9nfvyXhi9xio3gteHkL46R9sC179FaAanYAQtHerc86ShWHtAGhMUNYwHi1UzS1HGIjrW4ime0OWjga72ke5s36eXrMI6tA3fGCs1GNkgv5q7obAHD7ihOVlHwjy7SYzM0AvUiCmOw0eUqvn4lshf60falICtfxOfXC8fE2osNsA/cmBSQeNj2Zoofmk67G1mlJ7AzSKDPQjlFAU1IA+7Nz6qTn6WlQD5rs6qbwrBl2r6e1ItE2kkII2ZLhsZcXBPX6hRToHq/i2qjT2sBHnJ3iPKRZAMgO21imBeYmIUpIxgWIu2lWALM0SJhFzpfU8bUG7jdTTQsvvWSHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6666004)(8676002)(66556008)(66946007)(66476007)(8936002)(38100700002)(38350700002)(5660300002)(86362001)(508600001)(6486002)(316002)(6506007)(186003)(83380400001)(36756003)(2616005)(2906002)(26005)(6512007)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sfWBWGAOgYd58P2e9UySzvhiE0s4i9we17YSAQK7/wd7gZ06pNbqVleH753O?=
 =?us-ascii?Q?MaRBJyMq7SZdFk+Q4sItfPxwtKjupYfUVxEG0pg8jX8kC2lC9xYXbpN5AwxP?=
 =?us-ascii?Q?2uWOfniJtJFIcoNWy713d6DtbMA1UIi61BOnCvyZ4/dQpkJ8LdJMn4dwnln+?=
 =?us-ascii?Q?MLTpuUxLFS/o8xClgB2zDd0aOvj8l0ojGNTiBZfr2d/+/Km+1lF9iuWZDKKn?=
 =?us-ascii?Q?oAyOS/MCFQ9D0xEpP8ZlYpL4qkIGKKZuo95hovzW9DR5VKqXgTHRcHrVgLqI?=
 =?us-ascii?Q?uRMqsYVKUcFXZ0FUHUVFzlxdQ+scnlrNlLPHJrGD3E8oKAY15LNxuXSVwhTW?=
 =?us-ascii?Q?73Df/shV7ayJdEusinILy6g9wChYUjm0gacdqdPCOZ+KBKLu/vDL0GtkVwlq?=
 =?us-ascii?Q?tDJW8FsxuKmvMIMBo7VtmU5aYELiT2Xx8nGsoMGvI1h3pCLQ/dzXu9XFLu8t?=
 =?us-ascii?Q?T3iQyjtSPMeHO2lzA1aCXNJKli50EupdwJiYbfoGP6Ify3D419eYFE4Kni+5?=
 =?us-ascii?Q?fIQdayxpD83XmmsNiFlqIWNp5pDVxKxvuYr9GDSMfbC7Vswf+syMsW8mE/GZ?=
 =?us-ascii?Q?DVoYEKB07FCZs0EicapFKcnjoGE2Vy8yZhu6WPmLF60BrtLUoMbT1OKbIgUq?=
 =?us-ascii?Q?AOPzHiC4ruXPOpritvFo17jSZBzDknWsHMR6QE9Y5O65yrrwLyFfNbxXokPk?=
 =?us-ascii?Q?UY9CXuhTHu9CqdCoNcdd8pjmeEQAqMaZlJndmIohXDbc+buLudaKL+XHf4D+?=
 =?us-ascii?Q?rf/ZD7fILzizjaM+o2cDHCH9ouC2HDYmDB8cwPBVjvGT3GJKX5SRwCLo8bhu?=
 =?us-ascii?Q?3QI6pQaWBqMmbD5IV/TbvTCoQ02gWSZ6ANg2ffQNX29leDcZAGg2hgFyqGXR?=
 =?us-ascii?Q?PoYSLN1r93WFo1AZEl5fLWI+/e6sI61oAL0mHvjhTR3TXF8XuAA9AZhDbztG?=
 =?us-ascii?Q?b2E5YO4e5Au+oiaFprG1R+Op7MqB7FjxeMFk2cI4cYZXRlukOXCHETJfOQOR?=
 =?us-ascii?Q?lLkWe1GDkPgay9yusAaEXihjnyrtEb0Hgs0aU2xAUOODq0Zz1+mTM3N42/Tk?=
 =?us-ascii?Q?LIgllKgm1f8FFywSaysnFp4uzCiyB6VWbf9cJbGdgOBRF/oBAvYzA8T58qDU?=
 =?us-ascii?Q?gp23vjsw/MipPOj2kElxwv4E0cz4IZatBzDPQsNiYuGzexYcD3tlWbVpVipV?=
 =?us-ascii?Q?QTbQv182DfpyTifena5w+kEz5XZgJywYbXJVK5Mzv8+FDd88alxrPEVuIKwe?=
 =?us-ascii?Q?/2EA3BMRPypvYiXFxHuzb/W1IcIxLKBJBvAYYFLAPlfpR4qi7VUdhJlV5K4d?=
 =?us-ascii?Q?ltKsgTsCZ+7DFFar2NdSoWlR85pdqA4aOolkNXLDUZziPgt/7VmzwiRWRABn?=
 =?us-ascii?Q?fy1mwoSkan0dWbWFsWoOesACwGF4GaYEUpTGrb37SrLY2G+H4d8E6nZ6FPvW?=
 =?us-ascii?Q?RvvwcoKwzHfTTpIFncQBclbn6j14WOYmmoDtX9mT8T55fMLWcG86MZ02mg50?=
 =?us-ascii?Q?4Z+WUPT3TazmbFDxKpHVGUoo5W1w9hoUnCMhi4HBJ7QrZm9HaJ/9/D9ZAxct?=
 =?us-ascii?Q?XSUKRnBoY7312sis1aiucwnCafy2qTwAEyfBYBlv56bUvHf3/ebAJaevmp8C?=
 =?us-ascii?Q?1vwrnNLJ9sV0iJ+q1dGetohSipC4hCVNX6tCbWEal0WF7pI5TRpPtuJFTfQN?=
 =?us-ascii?Q?ZUJTu6UTLuyzvmYgfGL4Cxqz4c0biWpFEn86IfDUNvq8hcFm6cB/xBsiFn9s?=
 =?us-ascii?Q?21Qas337hlFnwHM/Ti1eonkuT97q+do=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b437795b-c8e2-4353-8c36-08da2eba4577
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 17:11:19.2010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8C5wcx7HSzbmVjaDbjl3bKE5bSIT7fuogbGNwJR9L9p5jys90mR0t46p3+uzEO1WDPx3O6Zpet2EOwGoVjP3kEzLya6kc0e5gjBpmG5mEcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1867
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_06:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205050118
X-Proofpoint-GUID: EMAKumZUNKRb_v2jIBVY0024gePeoCl4
X-Proofpoint-ORIG-GUID: EMAKumZUNKRb_v2jIBVY0024gePeoCl4
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

Add per-region FD to support mmap() of remote device regions

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user-protocol.h       | 14 ++++++++++
 include/hw/vfio/vfio-common.h |  8 +++---
 hw/vfio/common.c              | 32 ++++++++++++++++++++---
 hw/vfio/user.c                | 59 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 107 insertions(+), 6 deletions(-)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index 4ad8f45..caa523a 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -106,4 +106,18 @@ typedef struct {
     uint32_t cap_offset;
 } VFIOUserDeviceInfo;
 
+/*
+ * VFIO_USER_DEVICE_GET_REGION_INFO
+ * imported from struct_vfio_region_info
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint32_t index;
+    uint32_t cap_offset;
+    uint64_t size;
+    uint64_t offset;
+} VFIOUserRegionInfo;
+
 #endif /* VFIO_USER_PROTOCOL_H */
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 3eb0b19..2552557 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -56,6 +56,7 @@ typedef struct VFIORegion {
     uint32_t nr_mmaps;
     VFIOMmap *mmaps;
     uint8_t nr; /* cache the region number for debug */
+    int fd; /* fd to mmap() region */
 } VFIORegion;
 
 typedef struct VFIOMigration {
@@ -150,6 +151,7 @@ typedef struct VFIODevice {
     OnOffAuto pre_copy_dirty_page_tracking;
     VFIOProxy *proxy;
     struct vfio_region_info **regions;
+    int *regfds;
 } VFIODevice;
 
 struct VFIODeviceOps {
@@ -172,7 +174,7 @@ struct VFIODeviceOps {
 struct VFIODevIO {
     int (*get_info)(VFIODevice *vdev, struct vfio_device_info *info);
     int (*get_region_info)(VFIODevice *vdev,
-                           struct vfio_region_info *info);
+                           struct vfio_region_info *info, int *fd);
     int (*get_irq_info)(VFIODevice *vdev, struct vfio_irq_info *irq);
     int (*set_irqs)(VFIODevice *vdev, struct vfio_irq_set *irqs);
     int (*region_read)(VFIODevice *vdev, uint8_t nr, off_t off, uint32_t size,
@@ -183,8 +185,8 @@ struct VFIODevIO {
 
 #define VDEV_GET_INFO(vdev, info) \
     ((vdev)->io_ops->get_info((vdev), (info)))
-#define VDEV_GET_REGION_INFO(vdev, info) \
-    ((vdev)->io_ops->get_region_info((vdev), (info)))
+#define VDEV_GET_REGION_INFO(vdev, info, fd) \
+    ((vdev)->io_ops->get_region_info((vdev), (info), (fd)))
 #define VDEV_GET_IRQ_INFO(vdev, irq) \
     ((vdev)->io_ops->get_irq_info((vdev), (irq)))
 #define VDEV_SET_IRQS(vdev, irqs) \
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index da18fd5..c30da14 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -40,6 +40,7 @@
 #include "trace.h"
 #include "qapi/error.h"
 #include "migration/migration.h"
+#include "hw/vfio/user.h"
 
 VFIOGroupList vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
@@ -1554,6 +1555,11 @@ int vfio_region_setup(Object *obj, VFIODevice *vbasedev, VFIORegion *region,
     region->size = info->size;
     region->fd_offset = info->offset;
     region->nr = index;
+    if (vbasedev->regfds != NULL) {
+        region->fd = vbasedev->regfds[index];
+    } else {
+        region->fd = vbasedev->fd;
+    }
 
     if (region->size) {
         region->mem = g_new0(MemoryRegion, 1);
@@ -1605,7 +1611,7 @@ int vfio_region_mmap(VFIORegion *region)
 
     for (i = 0; i < region->nr_mmaps; i++) {
         region->mmaps[i].mmap = mmap(NULL, region->mmaps[i].size, prot,
-                                     MAP_SHARED, region->vbasedev->fd,
+                                     MAP_SHARED, region->fd,
                                      region->fd_offset +
                                      region->mmaps[i].offset);
         if (region->mmaps[i].mmap == MAP_FAILED) {
@@ -2410,10 +2416,17 @@ void vfio_put_base_device(VFIODevice *vbasedev)
         int i;
 
         for (i = 0; i < vbasedev->num_regions; i++) {
+            if (vbasedev->regfds != NULL && vbasedev->regfds[i] != -1) {
+                close(vbasedev->regfds[i]);
+            }
             g_free(vbasedev->regions[i]);
         }
         g_free(vbasedev->regions);
         vbasedev->regions = NULL;
+        if (vbasedev->regfds != NULL) {
+            g_free(vbasedev->regfds);
+            vbasedev->regfds = NULL;
+        }
     }
 
     if (!vbasedev->group) {
@@ -2429,12 +2442,16 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
                          struct vfio_region_info **info)
 {
     size_t argsz = sizeof(struct vfio_region_info);
+    int fd = -1;
     int ret;
 
     /* create region cache */
     if (vbasedev->regions == NULL) {
         vbasedev->regions = g_new0(struct vfio_region_info *,
                                    vbasedev->num_regions);
+        if (vbasedev->proxy != NULL) {
+            vbasedev->regfds = g_new0(int, vbasedev->num_regions);
+        }
     }
     /* check cache */
     if (vbasedev->regions[index] != NULL) {
@@ -2448,7 +2465,7 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
 retry:
     (*info)->argsz = argsz;
 
-    ret = VDEV_GET_REGION_INFO(vbasedev, *info);
+    ret = VDEV_GET_REGION_INFO(vbasedev, *info, &fd);
     if (ret != 0) {
         g_free(*info);
         *info = NULL;
@@ -2458,12 +2475,19 @@ retry:
     if ((*info)->argsz > argsz) {
         argsz = (*info)->argsz;
         *info = g_realloc(*info, argsz);
+        if (fd != -1) {
+            close(fd);
+            fd = -1;
+        }
 
         goto retry;
     }
 
     /* fill cache */
     vbasedev->regions[index] = *info;
+    if (vbasedev->regfds != NULL) {
+        vbasedev->regfds[index] = fd;
+    }
 
     return 0;
 }
@@ -2623,10 +2647,12 @@ static int vfio_io_get_info(VFIODevice *vbasedev, struct vfio_device_info *info)
 }
 
 static int vfio_io_get_region_info(VFIODevice *vbasedev,
-                                   struct vfio_region_info *info)
+                                   struct vfio_region_info *info,
+                                   int *fd)
 {
     int ret;
 
+    *fd = -1;
     ret = ioctl(vbasedev->fd, VFIO_DEVICE_GET_REGION_INFO, info);
 
     return ret < 0 ? -errno : ret;
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 51e23dd..c87699a 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -1009,6 +1009,40 @@ static int vfio_user_get_info(VFIOProxy *proxy, struct vfio_device_info *info)
     return 0;
 }
 
+static int vfio_user_get_region_info(VFIOProxy *proxy,
+                                     struct vfio_region_info *info,
+                                     VFIOUserFDs *fds)
+{
+    g_autofree VFIOUserRegionInfo *msgp = NULL;
+    uint32_t size;
+
+    /* data returned can be larger than vfio_region_info */
+    if (info->argsz < sizeof(*info)) {
+        error_printf("vfio_user_get_region_info argsz too small\n");
+        return -EINVAL;
+    }
+    if (fds != NULL && fds->send_fds != 0) {
+        error_printf("vfio_user_get_region_info can't send FDs\n");
+        return -EINVAL;
+    }
+
+    size = info->argsz + sizeof(VFIOUserHdr);
+    msgp = g_malloc0(size);
+
+    vfio_user_request_msg(&msgp->hdr, VFIO_USER_DEVICE_GET_REGION_INFO,
+                          sizeof(*msgp), 0);
+    msgp->argsz = info->argsz;
+    msgp->index = info->index;
+
+    vfio_user_send_wait(proxy, &msgp->hdr, fds, size, false);
+    if (msgp->hdr.flags & VFIO_USER_ERROR) {
+        return -msgp->hdr.error_reply;
+    }
+
+    memcpy(info, &msgp->argsz, info->argsz);
+    return 0;
+}
+
 
 /*
  * Socket-based io_ops
@@ -1034,7 +1068,32 @@ static int vfio_user_io_get_info(VFIODevice *vbasedev,
     return 0;
 }
 
+static int vfio_user_io_get_region_info(VFIODevice *vbasedev,
+                                        struct vfio_region_info *info,
+                                        int *fd)
+{
+    int ret;
+    VFIOUserFDs fds = { 0, 1, fd};
+
+    ret = vfio_user_get_region_info(vbasedev->proxy, info, &fds);
+    if (ret) {
+        return ret;
+    }
+
+    if (info->index > vbasedev->num_regions) {
+        return -EINVAL;
+    }
+    /* cap_offset in valid area */
+    if ((info->flags & VFIO_REGION_INFO_FLAG_CAPS) &&
+        (info->cap_offset < sizeof(*info) || info->cap_offset > info->argsz)) {
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
 VFIODevIO vfio_dev_io_sock = {
     .get_info = vfio_user_io_get_info,
+    .get_region_info = vfio_user_io_get_region_info,
 };
 
-- 
1.8.3.1


