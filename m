Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC2A44A084
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 02:01:42 +0100 (CET)
Received: from localhost ([::1]:35446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkFW9-0006EA-CK
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 20:01:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAl-0005pP-Tb
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:41 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:43736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAc-00047d-71
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:35 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A90AULl025572
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=dyOYh6vq73Yv4i3PBdTvjWM7084rno+Zi5e9iTQnZ48=;
 b=FX+WRaUF+5B8t1FPPHuAZrxHVExmRccoIsTExIl5TdTdihfowsY2VgoQIS7tEZh/6aPr
 s8DhnaZD2QM+HqN2481LLAJGdewbDnZdWjWYyHs9ZAaJy2L6b/2UUEKyso1vWKIT6wsq
 M2cBuhlkIHiF78qDYWOnWpv+/2GiMbT/ps32RNl5rqbs2AnS1xvPOferh6ZYYGJlTFQC
 FfFSNzAPRVKOZJHmnVm+uJtBOsdEmlIBh8OC0Vp1yASawEat14ZsNgQzspmMF3lMfzp9
 4tNHC7uu6fGJdPPMFl+vRPFh2y1EbyqST7OesuVYTsuucrR3xTwNj12yJ/H7xwx5Ow3o eg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c6t7077jb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:21 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A90ZLTf129165
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:20 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by userp3030.oracle.com with ESMTP id 3c5etuvb8d-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwIIJq8E3Nz64JPweLFMBQPuL6cVcye27kQPuq9ev/PNudnGq4HTkREVgItulXiC1qzvmb6OifVfPZ8+v23hLugFct77+tT7l0kloHmYVD6aqo5fgnypv+fmvDOHYPz4GGPoKQdVhxIsCBjqwO4QwgONEaw3yPQU5MKaq2pEwXtw0OH2uyePWu2qbL25FWVrXoVK+oh4HEuSdykQ8A0FUg4fIQpURaftkWr8ynFxaSnTt5GwXYhBcZGfsemAoSIticzkfMlY0SqfaiPv3lfVLL4G6FQkhm7cJUh8PG8cKSCje8OzoWRZXwHa9XlqTSfpGCDPUUfCGZnOKQR2sZWeXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyOYh6vq73Yv4i3PBdTvjWM7084rno+Zi5e9iTQnZ48=;
 b=TcHwukT0UvkUBR13xWWUy6AON3K5CATWZs3LayKJ58+OnebJ2WgAODOxjdRVvs+Qt7fmlmEvDzJOATakljcIkIPdxq1TSwV9zHp3Ee9OIOz2EHs8C0C6Vxk22eHClGgskRR6zZFkIWWTF22OQvb0uUstUQJtN5stZGs6hXBlOcY7AWWbprzd0h5WevfOxW/n0IrNrfx19p4eeIbdSceK21U25EGeiMxbHNSKS7pApb5DPRiyf9P+8EI34TE3TgkOZmKHKaO1YDSlSfCwWuKmAChg7lZIubuT6kiCc23K5uyamkZ6nWfsg1X93ZqoRTc9WWUItu5GtsC8pC9XNHVxOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyOYh6vq73Yv4i3PBdTvjWM7084rno+Zi5e9iTQnZ48=;
 b=j+f3MI96ewpCjb9g/Eo9n4FNUhKh/H7VSU9395Hm6OjbDcrmjw8XmK/kzQ/oXq1wOd24G0FyWA2YmeScSnQ1sIznzvFERv62SUaR3a/I76Ldyn3emDkDgfPO2dXkTbfkkFrzGQEdrnNz86tBXpZlhVJd2eJeiPEV4yyKKZu4EHw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by BY5PR10MB3764.namprd10.prod.outlook.com (2603:10b6:a03:1f9::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 9 Nov
 2021 00:39:18 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093%7]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 00:39:17 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 19/19] vfio-user: migration support
Date: Mon,  8 Nov 2021 16:46:47 -0800
Message-Id: <fd19a5e8a491c63edbcc9882994cad22cdff9f55.1636057885.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1636057885.git.john.g.johnson@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::19) To SJ0PR10MB4686.namprd10.prod.outlook.com
 (2603:10b6:a03:2d7::23)
MIME-Version: 1.0
Received: from bruckner.us.oracle.com (73.71.20.66) by
 SJ0PR03CA0194.namprd03.prod.outlook.com (2603:10b6:a03:2ef::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 00:39:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f452a2da-f62b-4bf2-f901-08d9a3195b17
X-MS-TrafficTypeDiagnostic: BY5PR10MB3764:
X-Microsoft-Antispam-PRVS: <BY5PR10MB3764C1296BFBA0E8A25A0A57B6929@BY5PR10MB3764.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:45;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iioeMczjTnYp9OFWxwW5UVEAB4Pdu5lrYjUla9P/4QMyPYW5CcPgKghF0NSTIL5ruu07HlcgwW06KViAEzaMsnVLBy3IWz4cDeCTMPVJfku+t9Jj+duGioJXkvN5QxVJ63qkrLc8XKsA8IUCKoHXSgUyrZ7JhLs1aqIRUhhY1pOgJfZVzR5JqYiPgWaOcIuHlbYB0/ayC2ggsw+78JwdYG3lGvRzBHEoCJJPdBxkVzka9mSuLcEEgTW3/K3CfS3JmAX75P7m/bRhPh9JIfq5eGkaCmZ8TFHJeDcFBRgb5icGzsmhZqD2OGkSNKDHTjw2Ar83/MELubLK3mTQenDegL5/bUwfO3MJIeISRLsM6VSXTuXpF7KFA8jkey8cQOxWZ46XFP5s6BmGicgGqMqKF/g6JGMDO9fQtJmlRwnT1F7AdRXrPykT4wGAJZHqxAFq11tq/ErfS+r7/sHfzrCPp9pCWL1kWI+c8DssDt0Ap9svoTx8J3nSHsIP9ClnCBrfB0lLACZi5BzhN8t3IyBjxg7LZ3Eaiepb7szuXyoEZTWA2LDaZmp32whs7i8a35qeR9+prfGWC8JzAvbP58NsP8IRTQIpZcTLjtoHavPTs2EWfBsc23Xp7k51vfJh3L+ionK1JvJ09gGLnhlcP5loQ5phZxC0hQYl396CmFhDwgYx8FaD18h6R6NGvi+J+mb1fSrsGIyTsxzlIRmuaJgHeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(86362001)(2906002)(8936002)(36756003)(83380400001)(66476007)(52116002)(8676002)(5660300002)(6916009)(6486002)(316002)(2616005)(186003)(956004)(508600001)(6666004)(38100700002)(38350700002)(26005)(7696005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QQxK+5etQ0FntfH0FnW9Zkwv8bYYPMypNXcX5k086TJzfiXiv1K7i26vtRp1?=
 =?us-ascii?Q?hjgKxJwkordcBaeidxjzhH4lnp3OxCRw1vEtDrppANyyip1yGlne+J93eU7h?=
 =?us-ascii?Q?cAbk8zWULsCsmt1MLPvEFQsEiD72hLlz9fxdREzIloYK+LGJa2r/2jGZD/xW?=
 =?us-ascii?Q?jyDRhBx+v95hzwNJ6vDq/T9s9GsxbnqbKLUjhQJDg11kUih19+TjHkNMpchJ?=
 =?us-ascii?Q?mm/KCKYhUYyJIMS7FHUFnddVC0y7aW6p9OguAB4p+saZUctB2luid0J7qx57?=
 =?us-ascii?Q?aMtfDqAssHF0UfXX+dRkU1BWJvV2xx0RxTtSAwynkbXiro5cDTirqwadUryu?=
 =?us-ascii?Q?VapfQZysrJBR3BNwccsgY2q8FKpufrJHYKbFBKzcucXQ86aI+Ox5/I2fqJ6h?=
 =?us-ascii?Q?NiMyi8tE20eQlHXjlYwf72xV2Ms7QW9Aw5+SiCooVo6i/opGLJ4ts26lrlyR?=
 =?us-ascii?Q?8sVWmpEbjEv9GC21jXyKnKm1sFUyo44dmDtExjuxi8rxqjKqVf1KY5cMdHme?=
 =?us-ascii?Q?p0+a4EJPIUK5aex72ZyD1vxT+JT3nRRHSf+vKXj3ndCMxnZs/IDCmGTSVorc?=
 =?us-ascii?Q?1Au5Jm7Y3hTnpHuGBbPitgh+aK6YmUrohcHPIbt4XFUWI7v/kDrfQHI0OFtK?=
 =?us-ascii?Q?/7Eg4nqT1Q8QqaqDmgj5ZxflE9WT5RuT1sqGsKiBkxp0nHe76Yxq7/pmzwsk?=
 =?us-ascii?Q?jxfbOw+krxZCMbRUK5OfRFkN/iTlSJUvlVik45MspBYtiXWZjz/CRp67cVGE?=
 =?us-ascii?Q?gfCKZgAHqdxEeF97VsH9EKeEeO0r0sPTpywR3kM5OGq96MWVbsmGHNGvBsQn?=
 =?us-ascii?Q?kz9fcVq3CBJAuHdj72GVK9esR5+/Eur5fDtmUtWwEVaWZEpi4k5HHpZo3MGS?=
 =?us-ascii?Q?8FhmxnCdP7mtOrT4JW3DE4WS8Q5r1GTeyUAk+Vi7LIsQZozetiahUrQeqGRQ?=
 =?us-ascii?Q?JzZ4EfOwnVIRVBU4vYeD2kbvEf2737vjfffMNq7OyzDv8dxm/P+gv7vsOx3M?=
 =?us-ascii?Q?29NOa24Wt0z79Im/T0VIP3jtnk7sm/ne1TQXm2Bdxet4P+GSeDxpEnbW7964?=
 =?us-ascii?Q?grjbUWfDkrL2gN8Dh8f38SU4L+ZLx0vE4FZbm8N99AKcsJsBNMa9xGkGJpdE?=
 =?us-ascii?Q?rqzaEcmGLrnO3fQrY/ODe6x+SE0weqqNQ4AYcaj1w2PMqB4AZ+YmyKYkN2uY?=
 =?us-ascii?Q?pPEarfqmQ84YrvG0r9gCmGfpojC80vvJ3kwv9h8TRB/gjV65hSxbgpWzwnjJ?=
 =?us-ascii?Q?9T+K9O/Jz0BO2O6yBxoNcR/i3XjXFtGwo5Bs8Hn9+9ou8tIm1ncEvvdSJbgl?=
 =?us-ascii?Q?5Z25k7w6j4TxoGGydAPX1S1CIFkYM2tHa8T8kCffv66iiPb5dg5LzmfQoiof?=
 =?us-ascii?Q?I68lduZYhL4F3JRRsybIE2kb2khfgwNBLAGcZ3aZaM+4wWkdPd5qOhprhwDN?=
 =?us-ascii?Q?QhAoeOGIE4DJ9xKRBKe3wavATIjFatwLjfmfLAil8uG3U1lUnkvtEBdhabNG?=
 =?us-ascii?Q?tHMtzoZsKzb/e7eS4Be05jimkZp87f8dzUDxox+ZnKBuvXFQjXaL+TigCLxU?=
 =?us-ascii?Q?pvQLv1HS0SSO+4iMwkkx9kg+e0mmrF8tNTUE9CTmcuMGfoDf7jITVla5e3Ii?=
 =?us-ascii?Q?c5FYUc+wI/AlXTi6RF3yvEgrwgDsGdyeDdUi0ExKrSF70ERbRlWKM8P2Lr46?=
 =?us-ascii?Q?dkEFlQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f452a2da-f62b-4bf2-f901-08d9a3195b17
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 00:39:14.8707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qo70C2qYcJvhgp4VVDuHGGoyvxJX8MCrEdhThvWVgfG8Gk1z9TAAIqGXCQIenPsb6SBiJS1LvkvQEhTB9EScSRyfbncNy1oDgBjuzZdiU1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3764
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10162
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090001
X-Proofpoint-GUID: hrw6BtXArlVUI69b2ToDlskvyAZMj8hQ
X-Proofpoint-ORIG-GUID: hrw6BtXArlVUI69b2ToDlskvyAZMj8hQ
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bug fix: only set qemu file error if there is a file

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user-protocol.h | 18 +++++++++++++++++
 hw/vfio/migration.c     | 34 +++++++++++++++----------------
 hw/vfio/pci.c           |  7 +++++++
 hw/vfio/user.c          | 54 +++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 96 insertions(+), 17 deletions(-)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index c5d9473..bad067a 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -182,6 +182,10 @@ typedef struct {
     char data[];
 } VFIOUserDMARW;
 
+/*
+ * VFIO_USER_DIRTY_PAGES
+ */
+
 /*imported from struct vfio_bitmap */
 typedef struct {
     uint64_t pgsize;
@@ -189,4 +193,18 @@ typedef struct {
     char data[];
 } VFIOUserBitmap;
 
+/* imported from struct vfio_iommu_type1_dirty_bitmap_get */
+typedef struct {
+    uint64_t iova;
+    uint64_t size;
+    VFIOUserBitmap bitmap;
+} VFIOUserBitmapRange;
+
+/* imported from struct vfio_iommu_type1_dirty_bitmap */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+} VFIOUserDirtyPages;
+
 #endif /* VFIO_USER_PROTOCOL_H */
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 82f654a..3d379cb 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -27,6 +27,7 @@
 #include "pci.h"
 #include "trace.h"
 #include "hw/hw.h"
+#include "user.h"
 
 /*
  * Flags to be used as unique delimiters for VFIO devices in the migration
@@ -49,11 +50,13 @@ static int64_t bytes_transferred;
 static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, int count,
                                   off_t off, bool iswrite)
 {
+    VFIORegion *region = &vbasedev->migration->region;
     int ret;
 
-    ret = iswrite ? pwrite(vbasedev->fd, val, count, off) :
-                    pread(vbasedev->fd, val, count, off);
-    if (ret < count) {
+    ret = iswrite ?
+        VDEV_REGION_WRITE(vbasedev, region->nr, off, count, val, false) :
+        VDEV_REGION_READ(vbasedev, region->nr, off, count, val);
+     if (ret < count) {
         error_report("vfio_mig_%s %d byte %s: failed at offset 0x%"
                      HWADDR_PRIx", err: %s", iswrite ? "write" : "read", count,
                      vbasedev->name, off, strerror(errno));
@@ -111,9 +114,7 @@ static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t mask,
                                     uint32_t value)
 {
     VFIOMigration *migration = vbasedev->migration;
-    VFIORegion *region = &migration->region;
-    off_t dev_state_off = region->fd_offset +
-                          VFIO_MIG_STRUCT_OFFSET(device_state);
+    off_t dev_state_off = VFIO_MIG_STRUCT_OFFSET(device_state);
     uint32_t device_state;
     int ret;
 
@@ -201,13 +202,13 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
     int ret;
 
     ret = vfio_mig_read(vbasedev, &data_offset, sizeof(data_offset),
-                      region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_offset));
+                        VFIO_MIG_STRUCT_OFFSET(data_offset));
     if (ret < 0) {
         return ret;
     }
 
     ret = vfio_mig_read(vbasedev, &data_size, sizeof(data_size),
-                        region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_size));
+                        VFIO_MIG_STRUCT_OFFSET(data_size));
     if (ret < 0) {
         return ret;
     }
@@ -233,8 +234,7 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
             }
             buf_allocated = true;
 
-            ret = vfio_mig_read(vbasedev, buf, sec_size,
-                                region->fd_offset + data_offset);
+            ret = vfio_mig_read(vbasedev, buf, sec_size, data_offset);
             if (ret < 0) {
                 g_free(buf);
                 return ret;
@@ -269,7 +269,7 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
 
     do {
         ret = vfio_mig_read(vbasedev, &data_offset, sizeof(data_offset),
-                      region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_offset));
+                            VFIO_MIG_STRUCT_OFFSET(data_offset));
         if (ret < 0) {
             return ret;
         }
@@ -309,8 +309,7 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
             qemu_get_buffer(f, buf, sec_size);
 
             if (buf_alloc) {
-                ret = vfio_mig_write(vbasedev, buf, sec_size,
-                        region->fd_offset + data_offset);
+                ret = vfio_mig_write(vbasedev, buf, sec_size, data_offset);
                 g_free(buf);
 
                 if (ret < 0) {
@@ -322,7 +321,7 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
         }
 
         ret = vfio_mig_write(vbasedev, &report_size, sizeof(report_size),
-                        region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_size));
+                             VFIO_MIG_STRUCT_OFFSET(data_size));
         if (ret < 0) {
             return ret;
         }
@@ -334,12 +333,11 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
 static int vfio_update_pending(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
-    VFIORegion *region = &migration->region;
     uint64_t pending_bytes = 0;
     int ret;
 
     ret = vfio_mig_read(vbasedev, &pending_bytes, sizeof(pending_bytes),
-                    region->fd_offset + VFIO_MIG_STRUCT_OFFSET(pending_bytes));
+                        VFIO_MIG_STRUCT_OFFSET(pending_bytes));
     if (ret < 0) {
         migration->pending_bytes = 0;
         return ret;
@@ -744,7 +742,9 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
          */
         error_report("%s: Failed to set device state 0x%x", vbasedev->name,
                      (migration->device_state & mask) | value);
-        qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
+        if (value != 0) {
+            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
+        }
     }
     vbasedev->migration->vm_running = running;
     trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index ccb2563..2e3846e 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3754,6 +3754,13 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         }
     }
 
+    if (!pdev->failover_pair_id) {
+        ret = vfio_migration_probe(&vdev->vbasedev, errp);
+        if (ret) {
+            error_report("%s: Migration disabled", vdev->vbasedev.name);
+        }
+    }
+
     vfio_register_err_notifier(vdev);
     vfio_register_req_notifier(vdev);
 
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 76d0706..460d4e5 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -1398,6 +1398,52 @@ void vfio_user_reset(VFIOProxy *proxy)
     }
 }
 
+static int vfio_user_dirty_bitmap(VFIOProxy *proxy,
+                                  struct vfio_iommu_type1_dirty_bitmap *cmd,
+                                  struct vfio_iommu_type1_dirty_bitmap_get
+                                  *dbitmap)
+{
+    g_autofree struct {
+        VFIOUserDirtyPages msg;
+        VFIOUserBitmapRange range;
+    } *msgp = NULL;
+    int msize, rsize;
+
+    /*
+     * If just the command is sent, the returned bitmap isn't needed.
+     * The bitmap structs are different from the ioctl() versions,
+     * ioctl() returns the bitmap in a local VA
+     */
+    if (dbitmap != NULL) {
+        msize = sizeof(*msgp);
+        rsize = msize + dbitmap->bitmap.size;
+        msgp = g_malloc0(rsize);
+        msgp->range.iova = dbitmap->iova;
+        msgp->range.size = dbitmap->size;
+        msgp->range.bitmap.pgsize = dbitmap->bitmap.pgsize;
+        msgp->range.bitmap.size = dbitmap->bitmap.size;
+    } else {
+        msize = rsize = sizeof(VFIOUserDirtyPages);
+        msgp = g_malloc0(rsize);
+    }
+
+    vfio_user_request_msg(&msgp->msg.hdr, VFIO_USER_DIRTY_PAGES, msize, 0);
+    msgp->msg.argsz = msize - sizeof(msgp->msg.hdr);
+    msgp->msg.flags = cmd->flags;
+
+    vfio_user_send_wait(proxy, &msgp->msg.hdr, NULL, rsize, false);
+    if (msgp->msg.hdr.flags & VFIO_USER_ERROR) {
+        return -msgp->msg.hdr.error_reply;
+    }
+
+    if (dbitmap != NULL) {
+        memcpy(dbitmap->bitmap.data, &msgp->range.bitmap.data,
+               dbitmap->bitmap.size);
+    }
+
+    return 0;
+}
+
 
 /*
  * Socket-based io_ops
@@ -1493,6 +1539,13 @@ static int vfio_user_io_dma_unmap(VFIOContainer *container,
     return vfio_user_dma_unmap(container->proxy, unmap, bitmap, will_commit);
 }
 
+static int vfio_user_io_dirty_bitmap(VFIOContainer *container,
+                        struct vfio_iommu_type1_dirty_bitmap *bitmap,
+                        struct vfio_iommu_type1_dirty_bitmap_get *range)
+{
+    return vfio_user_dirty_bitmap(container->proxy, bitmap, range);
+}
+
 static void vfio_user_io_wait_commit(VFIOContainer *container)
 {
     vfio_user_wait_reqs(container->proxy);
@@ -1501,5 +1554,6 @@ static void vfio_user_io_wait_commit(VFIOContainer *container)
 VFIOContIO vfio_cont_io_sock = {
     .dma_map = vfio_user_io_dma_map,
     .dma_unmap = vfio_user_io_dma_unmap,
+    .dirty_bitmap = vfio_user_io_dirty_bitmap,
     .wait_commit = vfio_user_io_wait_commit,
 };
-- 
1.8.3.1


