Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7013A47B215
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 18:25:58 +0100 (CET)
Received: from localhost ([::1]:56034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzMQ8-0004q6-As
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 12:25:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mzKvB-0007yC-Fg
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:49:53 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:36194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mzKv7-00040X-Cj
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:49:53 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BK7KMqP010687; 
 Mon, 20 Dec 2021 09:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=MZ6XbvoaSThDVjWcUtxZC+mgJBiEPDGVEQ9inP2BMcU=;
 b=RElG0RBN2c4fW7wQK/ySUdP5QfghsGGSHnYdVhWDEBizciER5lNz5zWNjm7D7DgBUZ6J
 grCjwdwheme2Yy6J72VcQm9Ornvyb5C9L2SZJUgmHbH0EnsvESJVSAti22QyAoNn+6Rj
 DHNOIo1kBmIyVS//OmqmogHADy87vZAQXI/HX5/+hYKfK+gsJuXMqsc4vAoMAiaWM8Xk
 xaNW0BnsI+Nbg9ThlgYZwrv6yky5VDu/9SclnAHc3qzpsf1U7dfINeTI4rJV6G2pwycp
 Rm4WHfcYHkX2A2C+m6dt+p2e4aCfbysha4kXkB90PZSYCImgNb/1xPKPRJQCiyJXUrK9 Xg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d16e2axd6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 09:34:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BK9UIPY055954;
 Mon, 20 Dec 2021 09:34:23 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by userp3020.oracle.com with ESMTP id 3d193kdpws-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 09:34:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrrWsy3NdGvzpqRPj4pEdQA86o2XXB8rv9oaOA2O/JNnj0tluK9Bm3MEs6ITLTYtGfBLZnoDy0Msix1VSrVg5F6TPyjctNNuDI3qbh8VAIUnB+BSq6bbX8BBGf5tEn1K8cum/v+AyLhJHgGOXELGkkwLju3E245Vuh6yEyqqKKogtj6Wk3u4VCD6MdwhEpy6t9aYwqyb3bXsLuUCTIDJlYQ7FHsEB4JdxURGUhmejuJDkLXpKNd5wT3I8giPOa0Zg5HcwnanQMHwtPS1tdFTMHHBh0OKFAvGk1+fG8tyS3WBEVYamGnYHohyeFgdUxBBnw8f/g+hoWsE7fT//9wBXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZ6XbvoaSThDVjWcUtxZC+mgJBiEPDGVEQ9inP2BMcU=;
 b=cy0TTFIP0l5w1ZB0asaWAmRH17w+6UOlHbRIjaPfdR/x84oKiHRYV0b9Z75mWZGYLi9pvGqBlHcp9L/c7HhcA6G7jg6yJH769k+QfAbb5BlMO1c8NE+nmkDdddZfCh3JXkygsUnlVeEc+JyxDsgLA4Wu3tLUMtxaCbnR6zMjQVOELzckUYF5wDz667dDcPEmhJi0elraPf5IHhjRL2k1f4aqmZmxWfiSSj5kyeKRJaG0UvkF1SkC3SZWCB92GcNV8ioOiXQu8v7TPhirFOa/1Z43yKwQ6UM/xYsxLEW2U7fZaP4rdYKBFGdWcEGuWYfsqG1kgSc1eyvSw08hVNYjTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZ6XbvoaSThDVjWcUtxZC+mgJBiEPDGVEQ9inP2BMcU=;
 b=lA02aHps5bviJ852XYyBePrx9FOVSwTX9IOnrBFWNZFBQNfbmCNJlIsbFzyPpQJci5mpudWbCzI35tABHKcso0bvk/qT4PwQQMU5/sGmrm0b622ysURdfXSSBKl+Z5P1X/QLhSSV9yDSz7t5vQp/hNv8Mq+TqjMNUd7Dk3wrPPc=
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DS7PR10MB5184.namprd10.prod.outlook.com (2603:10b6:5:38e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Mon, 20 Dec
 2021 09:34:21 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::c517:d737:a012:1a0e]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::c517:d737:a012:1a0e%6]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 09:34:21 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 1/2] migration: Introduce ram_transferred_add()
Date: Mon, 20 Dec 2021 09:34:12 +0000
Message-Id: <20211220093413.1383190-2-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211220093413.1383190-1-david.edmondson@oracle.com>
References: <20211220093413.1383190-1-david.edmondson@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0440.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::20) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03d25e7b-5476-4131-4a16-08d9c39be6ee
X-MS-TrafficTypeDiagnostic: DS7PR10MB5184:EE_
X-Microsoft-Antispam-PRVS: <DS7PR10MB5184F3C634864F998C221A66887B9@DS7PR10MB5184.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HNRG17RP5+eeiVuto6R8gQDELze4BIC+s13Q3uFe49jSfslrEYSUv6XLR75d/xThf8JYaKH7efrP6mX74ayHgRgPyFIMas//L51CqDkLVSs1KpyRWxj39+AE+n3h3QfjTBTUrGAyZpGtv81jMymm13jM5uL37ea6LZIW684uwNfL4IoeImUkej/INuaWr2s7r1iwCbe/0qouAUJcVTLbLL51QGP14bV8cUeH5YhXWN/EHNKDEOYiQYu1HvAPKLVaRtr6KgcG5QFuW/GtILH80JeVjgjRsLrIaC0jert18GVYE3c3uxp6YiDXD/CtWMRRqp3qjW+ru5nIzGHceMSHq0QNVWzSbHG0Ls5E102/j+2K6OXZCgHe0AR0dORcX7pIEYRM8YuYzwK1AZLh5TL5HXuiN1y3qQt6eptICj2JhjBo1ew06ZjjrY/UImmCY/Emni4+tFEuYJVvw9bHo0P0X9MxJBmwb8qF78aelS87/4u0ga7T1SM9fVU5JOMLNQSPNwO647jvH70PU6TizbB1kc039eRtHIfO4zcP8ekkt2QqBjX5HcipHxchQ8qWpZST9yGA+skrKrd+p0MaDcRd7WYmJIhHO3o0xdkEYuzsTLs8BsfMQCgLYgHdaReKjPdPrOavYgjyoRXSM2ylyAtZKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(36756003)(1076003)(66476007)(66946007)(6512007)(66556008)(38100700002)(6916009)(52116002)(508600001)(5660300002)(54906003)(4326008)(186003)(107886003)(316002)(86362001)(6506007)(8676002)(2616005)(44832011)(6666004)(8936002)(83380400001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TFBcCqIPWjY0CGjI/kb0kuYyH6DoL0lD6XlSZ7h7HKU0zZAjUqIMTCfioWd4?=
 =?us-ascii?Q?LweX3gUbNY5poeAWXYUNImDt2XB2WcLc/t/55w6Zu3iRGbsodB+5sNZOoeek?=
 =?us-ascii?Q?bnJvBk5yK1CLc4VzE74UtUBbGkjcXRfl8Jj55+av1ZrOd1P8x6m8Gkos5Ghx?=
 =?us-ascii?Q?VwWmcwsGDa4Zh/tNZ0by/MgawmD8DZG3vzlHuuVf/C0RR5HSkU3mBC6AxV9K?=
 =?us-ascii?Q?wxdegdzmaAbCahrNQD1nQw8xwyHreXglCehUJAqfRx43DpyoE5+byT2on7Rn?=
 =?us-ascii?Q?WStcuV16q8VKMtM5i8jkZefPiNB+gDu0py+jykG2b3MUDNNd1eeAwMlThBFW?=
 =?us-ascii?Q?A9RgLIWMp87rb+j4Yj7NgypE8z4URo1KxBqGc1byhtTP+eKS47KT3TWxJJLt?=
 =?us-ascii?Q?BXxACSs3sD8e9Zi3t1GGQzNPL8ouamhl6sdmXeRj1gCawiliGTtXTUVyncN4?=
 =?us-ascii?Q?jMonZfvodOJkxdMtcoP9WG6oM7OXNn2/uujYXfJ+Xu2wCrob9FoeAjlLuwKr?=
 =?us-ascii?Q?Wu3l6Xmd0SLjTB4xfiqcwM4MycanZNGCFqubb69YecXUCcHn3fCnonjPYdWg?=
 =?us-ascii?Q?soP8aFPs+F/wdfotB++mSZi0YVE+8fFFjG3lbgKfDzPLqL7OWDXwXCX0bql4?=
 =?us-ascii?Q?s2/lyGwaP/7rJHTANXqkD8FP7mDvY6tTLMJ6uOedrjvAEqDjCeFkNZzY24EL?=
 =?us-ascii?Q?cjnKh/ID/0s4MKK04Z3M4+z+OP5AJ3UW9AfLXrC9nojzgjicOkbArqA+Xbq0?=
 =?us-ascii?Q?42fzTuojaCj/W2P1DSqetCalEm0ZndqtcFEMpMS2uTAKwrnOyVICgo0QNP4s?=
 =?us-ascii?Q?NhW8qJN2DsowDLepUFxoW/URNYVsIGFl+ZGKZSWYLdoDQJ6PYyTegf+Pwpcs?=
 =?us-ascii?Q?k21R6h1P4NWvcm6XxKZKIzR8nqt2eiHKa8Z7yg+iNk/vEqbFxkvMsslS0Bcq?=
 =?us-ascii?Q?UmiyAeW7u5qqqj38EfB895NoTPa2sUKAVCtS/b31peT9crsgyjUlmfmypBHt?=
 =?us-ascii?Q?j+5zCA2EjzPQRwe+j8Givy25RK6XbFK0c8CFMo3mTUmVXW2LLl9bKA9SUk2c?=
 =?us-ascii?Q?+xvA6ZUa7ma5CQK9xwxXhXYxLcaiik8junMj7Br7GsUjnbZTwTuQJCJFC2PP?=
 =?us-ascii?Q?pogRAUVmvQLtu/VIia8ZYCRHrFTFCu1s/z9UGy3MtiCzPNQQhqsegmGpALli?=
 =?us-ascii?Q?i+S6QFfaop7sLLcxFeBSwfsqSFyrhHrjFqnJ1PFpx9y5CyJr8ZnJu7iNUdLN?=
 =?us-ascii?Q?mCJprZYq70UR9TiLMRdhpSKjBy8QCpokUE8+1QcMWS129s8YVvayCQyQFaF6?=
 =?us-ascii?Q?eYr2Yf/VRVyQYNlQCZP5Zx07GgIDD1V2QBqMDYojkDNFi6JeCr65gO5QkhOU?=
 =?us-ascii?Q?4zhMQhv2z2yl60wy0aq9b01bsEv7fzP3OicJBwImM3Xp+yTAEzEDJPMZn9le?=
 =?us-ascii?Q?7JTyhMN4mZvZjUbLBJ0dQ8WnPImphJMa418pKfqoyK1ML6Z+8rX569FENrj4?=
 =?us-ascii?Q?g5ss3nAymrYUxmuV122u9VedwX4Xqjb/a5N8iwVX3oUYA9K/3o1tSqrtxFGq?=
 =?us-ascii?Q?Xui4pQFT2cCvukjtWObs9i6PFIwCoo4KaYnAXzHWjQLUTX0Batvvd4CExyqL?=
 =?us-ascii?Q?5N32JWWCqScfGmZ5KSK2Y3xiNd6sZfdkS5i2xVdycgmVllB6FGGbwG7Bxw9b?=
 =?us-ascii?Q?kUUv8INyxCzBUgg6V2v4yM+F/hQqZx8QUGEhAX7XHEfJWdvP?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d25e7b-5476-4131-4a16-08d9c39be6ee
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 09:34:21.3508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AgzGn5xMELXBOvh1DxDr7a7udIsaCAELLV8np0Qy5lZ8wZLB4ndfRIKQL+X3vkBtY6k7ixV4E7NJgRC9UJ0wM8Ije0wbnENUEmx2dXaD9lI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5184
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10203
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112200055
X-Proofpoint-ORIG-GUID: jpjF_r5tTspQeefFlr71PYsoskZwj3Bq
X-Proofpoint-GUID: jpjF_r5tTspQeefFlr71PYsoskZwj3Bq
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 57efa67f20..bd53e50a7f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -386,6 +386,11 @@ uint64_t ram_bytes_remaining(void)
 
 MigrationStats ram_counters;
 
+static void ram_transferred_add(uint64_t bytes)
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
-- 
2.33.0


