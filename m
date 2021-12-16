Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B744771F9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 13:39:40 +0100 (CET)
Received: from localhost ([::1]:37556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxq2h-0001Tl-Al
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 07:39:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mxpxy-0007ju-46
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:34:34 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:56988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mxpxv-0004Dj-IU
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:34:33 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGCSVnw011864; 
 Thu, 16 Dec 2021 12:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=I0P1aGMLMoJxTLWDQM/PNsEy/ZhdYkLd00ji1HwQTB4=;
 b=w7zrBYhMr+KvHAy22Bz45Cv669ZZPZSxvrtLyKJRQxXX7WHgDo9f29HNQwdkgYpMddKj
 bCN26Noy2ICLAHPitYXFXW60eazFtVR/YyTCsYpYRz1PaX9omBXVhnug+A8CvcC0uu+D
 k6jNRzEGqMUFaKsPFPuSj292JMonm1JnVm3+n/ZxKdfrsjmnA5PXUr7kzqMPH0Ja12I8
 BL2M1vqyS15ScReqzvwoMo6Yl2uVd/Qncy6UDZ+dk8AFhsDKVTyyuvldA2BDWaZAeR51
 BPRPYnoFG9yWfd9b9on9cQeRuIBrXqHJ5SiDzFmKC/vsfI1ofAxt9wtRSgPnHKMsv7Bm gg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cyknp2m3m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 12:34:29 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BGCWBmO080254;
 Thu, 16 Dec 2021 12:34:28 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2044.outbound.protection.outlook.com [104.47.74.44])
 by aserp3030.oracle.com with ESMTP id 3cyju9tk9h-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 12:34:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKuCTgK6j8NRS9L1SmX3jk59yJGQB8Vpq6fI10n+b5dzwa8uh8JsT1cCUX+IsEHxFGWHiWbfAzNZcAIWDIRaoOgOyQV4eT2AKVoldcWTuhcvvvVFM1rnGlJ+o+h2X/CNi4XYCWaq+2lBfcntpGw8cnYkq1/27XjTCWdD0qzapu7BcNuEuU076hIosVWDl04zyMsniyWr05tx6gL0YQPK2+CSyqD/5brBdC8oWyCBNubjyloDhYut8fHfFtQ32lz8F6ctNQ454dEEEJrb4I33DjvKYRdCrxuGksOY3C8WMn4y2NZm+y8/RzP2d2oSem5xga1jLWN6hb1GoWLcTVbkKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0P1aGMLMoJxTLWDQM/PNsEy/ZhdYkLd00ji1HwQTB4=;
 b=IBcL+xL1wl4nHmHmh3nOF5i9+0qpxWQpx8/EhKEZH4cCSljIaiNK3sP4c6YHhMlyuxPMsGVkn3Y82nLvdnhP0vlGqhK/zf/3ff0vN7rWaSprPqaOnUAJewTx7kb50CIayWJskTF4r3oTt2nbs0mrIwd6sFa9ABU5UWdrJU7JNizPqRQle7GMJgaIWAX2XI51kLJL9JLKAcETMf3ZCq/DDjLAQ2I0S9uk0nDn7Raro1/Kdwm7CPr1rshUUQUQMoH+oyxtrUnkKfhDpVCiZbiz9zcZk6EQO76hKLeqFQLepcqthF9OT6jfrY4x99jH2c/xYzsYzCerxjxYZbsPZygvfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0P1aGMLMoJxTLWDQM/PNsEy/ZhdYkLd00ji1HwQTB4=;
 b=G7mR+3qytYIH3/kcWHkHbCrPSRhNJTFK6xpqSImX7Kboqw64BX3BJkdd0425MVEiWi9HCZTPkloEpMGLnBvpZpmS8P56753T++D9ZqF2l5SmLg2b0YS/Ttlsl0umng2SZ57oFoGkiqBKKYuw9rGYw7CNTbUMtDfpMyTm6ylk/J8=
Received: from MN2PR10MB3149.namprd10.prod.outlook.com (2603:10b6:208:128::31)
 by MN2PR10MB3661.namprd10.prod.outlook.com (2603:10b6:208:110::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Thu, 16 Dec
 2021 12:34:27 +0000
Received: from MN2PR10MB3149.namprd10.prod.outlook.com
 ([fe80::992c:e877:f87a:4c10]) by MN2PR10MB3149.namprd10.prod.outlook.com
 ([fe80::992c:e877:f87a:4c10%6]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 12:34:27 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC 1/2] migration: Introduce ram_transferred_add()
Date: Thu, 16 Dec 2021 12:34:19 +0000
Message-Id: <20211216123420.1328937-2-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211216123420.1328937-1-david.edmondson@oracle.com>
References: <20211216123420.1328937-1-david.edmondson@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0025.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::13)
 To MN2PR10MB3149.namprd10.prod.outlook.com
 (2603:10b6:208:128::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 061c5822-f9a7-42a4-4cec-08d9c0906605
X-MS-TrafficTypeDiagnostic: MN2PR10MB3661:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB36618C424C6777AF1F6B6F7288779@MN2PR10MB3661.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QgXZnyVBohOhBxNIBa4P43MFwoVUDpytiOgcIw7ruN9IN7PUcQ/HsFv1mFHZLiLwdE8eRfqaCZUlVPJHxGXaRhFlHcAWbGmbi67JhzFUrC+dyM1ICZwhOSspHhbXfWdnpqGLH+5vjGNKReBXs3T0wJtEKoE85YQirEt3XgTu4uwNE4IKzF+3S/8Mle6KbTaeloRYb8bLa6VqYH/JpW26v54VlcCvWGS8DBb9z2JWDQ8aJLvDG5HTmQpHcVoVvvzeGiNZ8E+qemt1k6G/CfWHln+r/yeReOGtvs13aidbEeqnnygKPS0smZlBelyK31dENqg3mV0DBYm/pydR8kXsMpVzVW+kFsIa58C25I4PzkDzRTJqhraBoEmmZUQekkjKHyXbAhYf0oPQByJvnS70U9Rjkwo0EcZorXCI9XnzGFiDOqFTHhy9qlurDlec68OcAxM/Tl0u0ejBr9GvFLiealFX9fct/aLUcu8EWBeEfJNDjEDIwkHuSEC/vLw9qn6a4XBffy/wyYXyFNF5uWm6EmNG86UxSzhC2VVwqY2Q1BnFPzZCM+CAH9k0qQvDxhuzsQbIGeGLVQKbFBmH98cIPrXVnyGJ2/6OmW5X0nDl7f7waWEMFa7MaC2r0oXszAP8eE+PFhmWg/C9x26961mgng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB3149.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(5660300002)(66556008)(6512007)(86362001)(508600001)(2616005)(44832011)(38100700002)(6666004)(36756003)(186003)(6506007)(2906002)(6916009)(66946007)(52116002)(6486002)(107886003)(83380400001)(54906003)(8936002)(4326008)(8676002)(316002)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hr24ftmMZEzFAxyzLMYnsfSGDKcyzumJuVJZ5WsIV9mcic2/kVUIcza8pToh?=
 =?us-ascii?Q?2GQlVVLwczLYsvhxgWXD2U/u83GunULPKFSEQIPswn2gbNLQifIcROmvYgO1?=
 =?us-ascii?Q?Rq35gPpoqbdzeJNIXsf12BIFSlxGNt57qkfkLkUZaj44wqWgwXE4fQNKxjn+?=
 =?us-ascii?Q?bHnBaa2pFq3qtese2I/Or5XamV19HiKPjjrO4uYYU7gVLp16HUTjzzDaYXDT?=
 =?us-ascii?Q?hXCsWXKnDIkT7fztwWMig4ZoVKkh3ybwiP9tAO6h+BceNJ5ke1vh1yzT64Wj?=
 =?us-ascii?Q?FxxkeSsMyCVFerjpLK9aDhagO5j6gCPP1oNY5vdGhR89Kw5phc3wGPwxDINV?=
 =?us-ascii?Q?SzpT0VG3lAMaREnzrUExIsXwCKPfEaBWeny5byR95abKLaVFPmEKwoYg0lP9?=
 =?us-ascii?Q?FJjP1cgz4MBNYg/9mxwtYxXIFLR3M3NA6Bbfs9WsrUPKGD6U84rdDndGfw/C?=
 =?us-ascii?Q?guvbkvLwFq9F0anL8rv2jDnCXLZRb/EOazlLNO/QJmXA4D/mhHg33zsFVtbi?=
 =?us-ascii?Q?5xm5dT/88yGpAQ/pFwI+Uvix/JZPWuqqkgB3PfcllJxMGGGnhXvPsMqYks7b?=
 =?us-ascii?Q?XsjwDYcok/+jx190FyAx7wke+w2O5RCWTuU5ppUwdq3qTmsHGQjRwYp6tXA0?=
 =?us-ascii?Q?hzuM5dRouTG2+UkZo/tt0y+V7BD0R7VEiW9RVEMeHQvL77D5SqupkE41wykZ?=
 =?us-ascii?Q?MqXUXeQmE8H+0jxcr80SU1JlShI5S5XVcwTFxZeoikFvV+lTOVs8fHWFdM71?=
 =?us-ascii?Q?FOQxl7YTu21dRpabRUQe3xoSXzd3QQYyTJQalXTKcNXrRxIGBsYHjwPkBxR1?=
 =?us-ascii?Q?aZXdARaw6Ql+V8Jb4GiyLft1pfbhtKxfKeGbe4j1snjBNYyzEXZVEif+SH5x?=
 =?us-ascii?Q?SDXv6j5hg7+Oh+yiyIYTL1oc2viWfVKMdTy4uLcaly8k7X3xq7xiNankMsev?=
 =?us-ascii?Q?L4AiLTohBSZ53jzjqfM686Io/9pITGYGJ1FRZKNHKu6P58iLmgH3PhSSp7RR?=
 =?us-ascii?Q?34ENLW7NuGRSEEGo2zcx18THbSjx0J6uvQ/OP7nnkuuRESuLlUF5MoM2fOF9?=
 =?us-ascii?Q?CJCp4z0RPlK01IutJyOB4McVmCJwTA2GJm0/Pg6PqeqN48raOQAXOfKY44Y3?=
 =?us-ascii?Q?ps6CasVR6tc644oftRQDsKcgsNQjWv18HpeoaoHSmJPefXKjv2lS69ZvHizA?=
 =?us-ascii?Q?wANzD8go8YU46qzwsik0JRv+zY2+ILLV6SQrt2H+QIlzcsI6wMAebca3UOUu?=
 =?us-ascii?Q?K6f7Cn3feEbe5ny63XZGSLNuTY3yr8goA6eRfr+FKu4QMRyN3IijiFNlrbQ2?=
 =?us-ascii?Q?zqRxo0bC0APERoXYlcw6w9OzB5F5fG9jtpClta+4I6O8We/oDhzN9gK1OBth?=
 =?us-ascii?Q?/cOPHDlYciuXDQ7sHL2RnVjIT8vu/im5EcFJyRmydiMZiIuR4FQQ9mqUBbTo?=
 =?us-ascii?Q?V0mNfdteRWc1a3QX45zaVDOL4USs5ECvVZ5lpd/DHw1YBgz/xmk6odDfRwch?=
 =?us-ascii?Q?gZ/otqo+zC1NXTbYZOgxyk3pXN//PXdXNa4xDrJtKWg26dEdMy07Ea+C/OoN?=
 =?us-ascii?Q?q58xYN8Nmd5u6EuNjS91Qnk+46TLd+IkL1bD4BnWXkViCP1GbMj0NGcicsyh?=
 =?us-ascii?Q?A2A9ciJi9bLjUJHKUslMHpv94w8EOyaOAcNPE7xGIg0PfeuxHwS43BI1sVYh?=
 =?us-ascii?Q?giDKk8YM/lya9Qj11gdWKxtCQJWbVQm6AHscaQB9tQnkQ0pZ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 061c5822-f9a7-42a4-4cec-08d9c0906605
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB3149.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 12:34:27.6298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PwN7yJ8laBLNhRGrbx3eMZr6MOfoHR0ua7D7GDoCZuyZXhya5JBR1/8jtBLKvVm+7kN717wWtWdOnlfei5ypjZD8z77C56mYgD/7qco6BsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3661
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10199
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160070
X-Proofpoint-ORIG-GUID: wxVtpKCVESzHcAOoNVnM7Ic6oN9HvGZs
X-Proofpoint-GUID: wxVtpKCVESzHcAOoNVnM7Ic6oN9HvGZs
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Edmondson <david.edmondson@oracle.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

...and use it.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 migration/ram.c | 23 ++++++++++++++---------
 migration/ram.h |  1 +
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 57efa67f20..48ef2819f6 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -386,6 +386,11 @@ uint64_t ram_bytes_remaining(void)
 
 MigrationStats ram_counters;
 
+void ram_transferred_add(uint64_t bytes)
+{
+    ram_counters.transferred += bytes;
+}
+
 /* used by the search for pages to send */
 struct PageSearchStatus {
     /* Current block being searched */
@@ -767,7 +772,7 @@ static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
      * RAM_SAVE_FLAG_CONTINUE.
      */
     xbzrle_counters.bytes += bytes_xbzrle - 8;
-    ram_counters.transferred += bytes_xbzrle;
+    ram_transferred_add(bytes_xbzrle);
 
     return 1;
 }
@@ -1198,7 +1203,7 @@ static int save_zero_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
 
     if (len) {
         ram_counters.duplicate++;
-        ram_counters.transferred += len;
+        ram_transferred_add(len);
         return 1;
     }
     return -1;
@@ -1234,7 +1239,7 @@ static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
     }
 
     if (bytes_xmit) {
-        ram_counters.transferred += bytes_xmit;
+        ram_transferred_add(bytes_xmit);
         *pages = 1;
     }
 
@@ -1265,8 +1270,8 @@ static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
 static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
                             uint8_t *buf, bool async)
 {
-    ram_counters.transferred += save_page_header(rs, rs->f, block,
-                                                 offset | RAM_SAVE_FLAG_PAGE);
+    ram_transferred_add(save_page_header(rs, rs->f, block,
+                                         offset | RAM_SAVE_FLAG_PAGE));
     if (async) {
         qemu_put_buffer_async(rs->f, buf, TARGET_PAGE_SIZE,
                               migrate_release_ram() &
@@ -1274,7 +1279,7 @@ static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
     } else {
         qemu_put_buffer(rs->f, buf, TARGET_PAGE_SIZE);
     }
-    ram_counters.transferred += TARGET_PAGE_SIZE;
+    ram_transferred_add(TARGET_PAGE_SIZE);
     ram_counters.normal++;
     return 1;
 }
@@ -1373,7 +1378,7 @@ exit:
 static void
 update_compress_thread_counts(const CompressParam *param, int bytes_xmit)
 {
-    ram_counters.transferred += bytes_xmit;
+    ram_transferred_add(bytes_xmit);
 
     if (param->zero_page) {
         ram_counters.duplicate++;
@@ -2298,7 +2303,7 @@ void acct_update_position(QEMUFile *f, size_t size, bool zero)
         ram_counters.duplicate += pages;
     } else {
         ram_counters.normal += pages;
-        ram_counters.transferred += size;
+        ram_transferred_add(size);
         qemu_update_position(f, size);
     }
 }
@@ -3133,7 +3138,7 @@ out:
         multifd_send_sync_main(rs->f);
         qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
         qemu_fflush(f);
-        ram_counters.transferred += 8;
+        ram_transferred_add(8);
 
         ret = qemu_file_get_error(f);
     }
diff --git a/migration/ram.h b/migration/ram.h
index c515396a9a..a5b2ffdc18 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -51,6 +51,7 @@ int xbzrle_cache_resize(uint64_t new_size, Error **errp);
 uint64_t ram_bytes_remaining(void);
 uint64_t ram_bytes_total(void);
 void mig_throttle_counter_reset(void);
+void ram_transferred_add(uint64_t bytes);
 
 uint64_t ram_pagesize_summary(void);
 int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len);
-- 
2.33.0


