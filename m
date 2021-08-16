Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D963EDB2D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 18:45:06 +0200 (CEST)
Received: from localhost ([::1]:55616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFfjV-0003bS-Ny
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 12:45:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhd-0000lw-O8
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:09 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:48514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhY-0007xJ-AY
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:09 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GGbwOP029362; Mon, 16 Aug 2021 16:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=grNf/V8qZcO6D7heJPv97ZzLoNAJ/jpkLVPA5jc+de4=;
 b=Ezc3Bnk9jFKsgzi4fhgZadx1A/Gxf3tVoyqxN7ZhmH1khtn0FIktobxcImiistCSov7P
 1m1lqfzhwjbLMBvyiqSZVmzLlXxr5gGg0Yuv5N+BwCNfEOgnsXLoteTi3kgReaB0KDiq
 1Q8+RpMF/+t105Borh4ZLCy1SoGyLbNTLXhqPlhUmaaOl/DzCsRF6pY+nsX/cJaGeYlk
 Nha8KgYVEVwOv3Ymj0YaTPA9zRKninsNFRGCcip+amLeLWpbFWo5lMirLHCJzgZhvvoi
 kQuaW6xC7bPIYZGQBGxG362y5LktW9NF7eVD0SEpPTHWHlnIMsWaWWKSqnT9YfdRFV7c tg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=grNf/V8qZcO6D7heJPv97ZzLoNAJ/jpkLVPA5jc+de4=;
 b=UFoYG92JwuxOVEeAHAg3WvzceEta279i+yxdXh8XS2Vjpu6ViQSb9q+X+9sJdqAikFmL
 S7nqFhs5hW3CRbDLdAIgS54+nFWVd9Qei9jN2xnKQENLloBUHGUu6zj+gOpeAH38GY1n
 +hHajiIBvmQpQ0DF5KpYuunPbXOrEnyhIyCceRJw13l8C8lqjXevimQLdFA7MsOYGnA+
 0Qa4VOHOsbCb06/GJSz34WmWBS1ECTKdQ2ZiNqF9Ti74qF+mjB+SDdzzOyBO/Faz3NjP
 v+hF+2ctdJUUYSS0Lvwbzu1+YRicl6+n7mCsu3uzIyEtK0Aco0P1KsrtZhY0rAHEXduW oQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3afdbd1wrb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:43:02 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17GGeo5u159237;
 Mon, 16 Aug 2021 16:43:01 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by aserp3030.oracle.com with ESMTP id 3ae3ve34y4-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:43:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CpKORUEjqDFoRNNo8cRksLU45jvTKYwrGbjRex2sz93+JJ62GFtBVvwWw1FOk3Cizqk92dIoYaX/Bd9eomRZFZD8TSi7alutYYKbSCftikbM9qMi60jtw5Hf2DuUqaTKVu4A1uSpBCpGyBXRePd80dCyzvfF0GgXzqcrfonV01f14vez+YaLsuC55BMYoR48PPWQwDNWXETuHaU4zEEO973uSk6apfJ17HYiuMptIFx+KcPMld6fJmsLHSk+VZuSRCzGPrNWhy54XUbHcfPttc+kyhDO/0f5APqhjkv8GdGvpLkfmc4b5FqkMgN0fffT0gyhjUpNCEqYAgT4Aecryw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grNf/V8qZcO6D7heJPv97ZzLoNAJ/jpkLVPA5jc+de4=;
 b=UjS1JxM/NajHMLvL9jptt9wzr8I6BkeXPRl0CuDsmKyZLf2+wmkaysXNj5S0QCLiCpmcqDaxUAlvbb2cHcSSGTxrUYTdtXoqxSU1+AFJYBfTMDSUvPBdiCzTeW33YslKuc780rITAGCNhj3boZgeaqle6Jfrv6DRNWluHvKiBOQKR1H4U0MJe72M0yutQ8Xeh6U8Gw87ekzDs597O70NX24HaiECcbXMmFH5j/tcZyUJHycLaJsL097iYUEnhUCX9rY8UxUCtYIOWKrghcoeSldP2ScnFqGz7uh9+S/y3Z0umdNOW8Lt9n1sAPjOELKxAZrOExInH7B+qi7C2c5VNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grNf/V8qZcO6D7heJPv97ZzLoNAJ/jpkLVPA5jc+de4=;
 b=piLV5m2GwP75nKOLEEIIhfAdj0YI3pfPKduKl8UWbOMxgOT7PvArG+WxQoyywYUnD0jnBgaK1sbBzFvghABew1XARRNJeKcy9UuZ+t3qpSpr+8RpucifYqEQgMbBts17zh2Rf/tM+GXhixK3ou4InmZfR/g/K3ak8x1kXtQAYuw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB4765.namprd10.prod.outlook.com (2603:10b6:a03:2af::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 16:43:00 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 16:43:00 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 09/16] vfio-user: region read/write
Date: Mon, 16 Aug 2021 09:42:42 -0700
Message-Id: <92fb16181e71a1c4049f9995294dbd7ff4270627.1629131628.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629131628.git.elena.ufimtseva@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::31) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nuker.hsd1.ca.comcast.net
 (2601:642:4000:a09:154a:3cd:532c:f36d) by
 BY3PR03CA0026.namprd03.prod.outlook.com (2603:10b6:a03:39a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Mon, 16 Aug 2021 16:43:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92af5206-e312-4b99-702c-08d960d4e8a1
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB47655B616AC42ACA750B90618CFD9@SJ0PR10MB4765.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:78;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AeAs5MlZgHgobQGGj5eXIWj3a94NW5KU03vl596IRFPi3Z2aU3nlOYmuhuWEZaLZab+5Cm8wqHZNjuI7E5Ri2IvnA52TZVdUeY8DdPoDQuoh8IRIhC6HlDx9INhuUvAJpIy9x+hhSzpffiSKnZtq29f41Kf0dQNsofIQQ0Xi3veIELIWOoVwkBIVXb0EkNWwd0CL/8I2sLbavz1cSK3p4CSJztsWV1IrOWwozO7WzfczEbauSWNl9CD/YuCyYUESEss+s4NA6b1jl6JBRIBiD8MAHIy/JB0WuPJE8ZQtHA30QxSxfyc1wCbEE4/DCUlugbdO38XxLzHMr6xD9ApRsPpkd7yNq27jUHrfPkrQkJwaI/3aXYtOV69+IYZKP6wZ/vUDoOEYwTcBXTC0fyd9djP/Ed78+LSzkYXeFOHfZHiwpkaFEaOWUfyRirZEK552tAFk8WpPxwWqQE10WyK9EvFaugCdh1KX8SqwMr8SnD0QZhE4b7sgha5/3HrH2VUYoYpTzWRjDrIPlZQzgmIy6wnTzQyA07fVmwAekm1HKR/NJ1CgAYwIUlu9b6G06Q8AgLjHFwUPsLMuIxwzNOr3hFVL+xqI7qwFX1eOcknNotiwP8OGCtbBoAIqFEZJavU2kVgWFAIeTNDSdVL23K532g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(2906002)(86362001)(66556008)(4326008)(38100700002)(8676002)(508600001)(66476007)(6486002)(66946007)(6506007)(5660300002)(44832011)(2616005)(6512007)(6666004)(36756003)(6916009)(316002)(52116002)(83380400001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YZtnBy2DDANasd37hsdW1D6Sut8F88gd9g47pFNuLNR2rhRxZrl//uiIm3Ns?=
 =?us-ascii?Q?LyjxOoJf2Tv46y9I/bgId6i07tq7HvDf9JUeWE95RJGh5oeuQ+x2seWfDOOH?=
 =?us-ascii?Q?AmrGLFRKNULxgKu0ct0WiK9WW5R+i8ErIEURbfevGlli8jJbzGOU0yZSTDOd?=
 =?us-ascii?Q?gL5XtixYUbI+stU2v0InPQat4wF/ToJlF2F/GAzfuyiDTy9e/mp30jQPy2lF?=
 =?us-ascii?Q?1+ELge8FAl2ZSMmG/Hm78VlOW2it7+gWYmzxD2/cxhCFytmEszJ1UQs2zIXh?=
 =?us-ascii?Q?X5xdDiwLiuCuP5q4Wx5oiL+RKUcFg9nvr/KL2lpB4rNx0dY7heCYuVvhK/dL?=
 =?us-ascii?Q?BS5YUdnNQfVwI+y1cn6s+UrtQ5BqtUlH7o6G4g6PZ33DGAdFGO6ErF1NQ1BV?=
 =?us-ascii?Q?K6Ue4FrQmqTOHrY2IDIcxhVyPwkcCYAEEnmCBKK0EQ3O4FvCOJWcAmOB0wUw?=
 =?us-ascii?Q?uMNF4jYcGbeoR2sHrCs3/BnpeqHyJ1lhQwZJ2c4DIDrpP6babwrCnPY+vRZ6?=
 =?us-ascii?Q?C/UUUjCLdRy6YhZGasFAlAwqJzWwLE+xPYf6/pP2TaOBY7qC0y9u9kzXME4R?=
 =?us-ascii?Q?4wnYjKBmYWOaxqk42tY4D7tFSN1Ezinriie4BssGtMfhWoKT1eYadFyQy5RM?=
 =?us-ascii?Q?CqLlPkqyxuSwp6/SV9R7U+YJksSe0+QPqlw0jKh8PwIATV3aefII4N2COs7J?=
 =?us-ascii?Q?JQqqAyJoEiZgwiK2t+8sHnR7J2C4U2Xx4ergkJAyUDsXInMImBCSdLTKVm71?=
 =?us-ascii?Q?cJkag9nHc5/oo6sJWwHbrvBlj0FwPYaGNos3pKGbYv0IxFrU4SBKwNLqRy6B?=
 =?us-ascii?Q?duQjTyWHdPwof1u2kJcIOrhhzxiYuOkTcQP0laNIRK905EY0sIxyiYbfsJo8?=
 =?us-ascii?Q?crdXPcmbY7zySpLQsjgGSmHN5WjvMI50Ni5tjSJEsgsV79RP5eFCHKBzgIlc?=
 =?us-ascii?Q?01V75XDGzZ3zrKY3XAGD+UP+ZTeR1PSyK01Wte8HBQ/Uty+QZdo7Fbae1/FQ?=
 =?us-ascii?Q?MJfN5ivtnLrTgO3NxbQ9nXLMnYx2vzlCAMdihmjscL9umCjWUlT/I6mJstkU?=
 =?us-ascii?Q?JExvo7oVPGqNm0Yw77bJSWcvDBwC1ZkMZ/AXAcl2vDZUlXYmsKgbuShgFHxh?=
 =?us-ascii?Q?WG78JyRNOILKohBOb7I73k4Fq4+CpH0CiFgXqN7iLD7qAk7hQPT7wqTXnXju?=
 =?us-ascii?Q?3szYHMJBTYhATxAVVUOrhx5qI2++ukC8+z4nCkT699r7YgcnX+QMmct5P+fh?=
 =?us-ascii?Q?YYrcoh5vGbpqaxSUpT/RERdi4O9cIk+1KftuFPZLns1vn/9kbgqi+zzbn10j?=
 =?us-ascii?Q?IhFg2/5pEQvK6XAmEx3QGjg0K0RWxoGngKGrfTeKLPaxhW8P95Kwak9X8Aon?=
 =?us-ascii?Q?X2MT/ARsZtXz2XB/PEMwscN+8deg?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92af5206-e312-4b99-702c-08d960d4e8a1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 16:43:00.3182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RgdWpWy558yQyAoc41wRK+AVonTsXymTjusJ2Lbdio6M75oDT5xXJJkxjl6o/ulAdq/mSGsKlrmVktIblj6VnEyMBBc11IshDdTFn/rvOlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4765
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10078
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108160105
X-Proofpoint-ORIG-GUID: ymYekk42WEl1Z8yo9NPhEw2tR022hJBt
X-Proofpoint-GUID: ymYekk42WEl1Z8yo9NPhEw2tR022hJBt
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
 stefanha@redhat.com, thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Johnson <john.g.johnson@oracle.com>

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user-protocol.h | 12 ++++++++++++
 hw/vfio/user.h          |  4 ++++
 hw/vfio/common.c        | 16 +++++++++++++--
 hw/vfio/user.c          | 43 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 73 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index 104bf4ff31..56904cf872 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -109,4 +109,16 @@ typedef struct {
     uint64_t offset;
 } VFIOUserRegionInfo;
 
+/*
+ * VFIO_USER_REGION_READ
+ * VFIO_USER_REGION_WRITE
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint64_t offset;
+    uint32_t region;
+    uint32_t count;
+    char data[];
+} VFIOUserRegionRW;
+
 #endif /* VFIO_USER_PROTOCOL_H */
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index f0122539ba..02f832a173 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -74,5 +74,9 @@ int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp);
 int vfio_user_get_info(VFIODevice *vbasedev);
 int vfio_user_get_region_info(VFIODevice *vbasedev, int index,
                               struct vfio_region_info *info, VFIOUserFDs *fds);
+int vfio_user_region_read(VFIODevice *vbasedev, uint32_t index, uint64_t offset,
+                          uint32_t count, void *data);
+int vfio_user_region_write(VFIODevice *vbasedev, uint32_t index,
+                           uint64_t offset, uint32_t count, void *data);
 
 #endif /* VFIO_USER_H */
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 7d667b0533..a8b1ea9358 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -215,6 +215,7 @@ void vfio_region_write(void *opaque, hwaddr addr,
         uint32_t dword;
         uint64_t qword;
     } buf;
+    int ret;
 
     switch (size) {
     case 1:
@@ -234,7 +235,12 @@ void vfio_region_write(void *opaque, hwaddr addr,
         break;
     }
 
-    if (pwrite(vbasedev->fd, &buf, size, region->fd_offset + addr) != size) {
+    if (vbasedev->proxy != NULL) {
+        ret = vfio_user_region_write(vbasedev, region->nr, addr, size, &data);
+    } else {
+        ret = pwrite(vbasedev->fd, &buf, size, region->fd_offset + addr);
+    }
+    if (ret != size) {
         error_report("%s(%s:region%d+0x%"HWADDR_PRIx", 0x%"PRIx64
                      ",%d) failed: %m",
                      __func__, vbasedev->name, region->nr,
@@ -266,8 +272,14 @@ uint64_t vfio_region_read(void *opaque,
         uint64_t qword;
     } buf;
     uint64_t data = 0;
+    int ret;
 
-    if (pread(vbasedev->fd, &buf, size, region->fd_offset + addr) != size) {
+    if (vbasedev->proxy != NULL) {
+        ret = vfio_user_region_read(vbasedev, region->nr, addr, size, &buf);
+    } else {
+        ret = pread(vbasedev->fd, &buf, size, region->fd_offset + addr);
+    }
+    if (ret != size) {
         error_report("%s(%s:region%d+0x%"HWADDR_PRIx", %d) failed: %m",
                      __func__, vbasedev->name, region->nr,
                      addr, size);
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 91b51f37df..83235b2411 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -767,3 +767,46 @@ int vfio_user_get_region_info(VFIODevice *vbasedev, int index,
     memcpy(info, &msgp->argsz, info->argsz);
     return 0;
 }
+
+int vfio_user_region_read(VFIODevice *vbasedev, uint32_t index, uint64_t offset,
+                                 uint32_t count, void *data)
+{
+    g_autofree VFIOUserRegionRW *msgp = NULL;
+    int size = sizeof(*msgp) + count;
+
+    msgp = g_malloc0(size);
+    vfio_user_request_msg(&msgp->hdr, VFIO_USER_REGION_READ, sizeof(*msgp), 0);
+    msgp->offset = offset;
+    msgp->region = index;
+    msgp->count = count;
+
+    vfio_user_send_recv(vbasedev->proxy, &msgp->hdr, NULL, size, 0);
+    if (msgp->hdr.flags & VFIO_USER_ERROR) {
+        return -msgp->hdr.error_reply;
+    } else if (msgp->count > count) {
+        return -E2BIG;
+    } else {
+        memcpy(data, &msgp->data, msgp->count);
+    }
+
+    return msgp->count;
+}
+
+int vfio_user_region_write(VFIODevice *vbasedev, uint32_t index,
+                           uint64_t offset, uint32_t count, void *data)
+{
+    g_autofree VFIOUserRegionRW *msgp = NULL;
+    int size = sizeof(*msgp) + count;
+
+    msgp = g_malloc0(size);
+    vfio_user_request_msg(&msgp->hdr, VFIO_USER_REGION_WRITE, size,
+                          VFIO_USER_NO_REPLY);
+    msgp->offset = offset;
+    msgp->region = index;
+    msgp->count = count;
+    memcpy(&msgp->data, data, count);
+
+    vfio_user_send(vbasedev->proxy, &msgp->hdr, NULL);
+
+    return count;
+}
-- 
2.25.1


