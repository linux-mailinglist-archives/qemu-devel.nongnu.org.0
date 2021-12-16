Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 661214771FA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 13:39:47 +0100 (CET)
Received: from localhost ([::1]:37658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxq30-0001Ys-7w
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 07:39:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mxpxy-0007jw-4Q
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:34:34 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:56986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mxpxw-0004Dk-CT
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:34:33 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGCMxIL000419; 
 Thu, 16 Dec 2021 12:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=nHwzi1M1YhGQTNoLFU4Y0wY9Ct1Dep9zm1/5vQ6I5V4=;
 b=IT2EJ/RW8TbI1GsjHQ7pLXM97rRmd9HdT6SJ8g+TGY8ly8kzwSfb6YNasO/61v7cuZ44
 EQb3ml+RRmYyxNlTgi/GSY/OlooP1s/ZKrrVxpGefS3pgvaT/oNAi0Ej8ccnvmqli4uy
 th5Da5Cistd4AmxOGO80aZwmGm5+4ZB13P6fiFieNexap7C7yjirmFqy3wdLAdWj4gYo
 mL1sIPfz5PHzjAbPQquLvWsXYvpappIkeWLZOxRQZUo0VevQac0qroHc9wqh8hpHYJt0
 6KN8Lq1ydM/CF+vnH6ocrl1pCS3pS/n1xvCac/+tsOAhlKAp8us51mrlOEoWk/J1slDm +g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cyknrjjq2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 12:34:29 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BGCWBmN080254;
 Thu, 16 Dec 2021 12:34:28 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2044.outbound.protection.outlook.com [104.47.74.44])
 by aserp3030.oracle.com with ESMTP id 3cyju9tk9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 12:34:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mn+i15yCSt2pQT700WC1iShoTWzMEVgqwk6FD4NNdji3KptjAeqqIwEUBkI9qQh9S0nQyJ7XxNNBzJjRp4sQ1yx/B84MsoTn72uP//HJfqHqY0NrC2Q1PqubWCJFesifoR70SNqQ/k9ma/YPsmvJPfsjPvmMx93w//30P9N7gWKnpbZHNsu8/3/pbdY3Cp/mr3HD516Js8iTXMnBaoupd+wKHXA6IufnR5AV/J0152AnXF9416orA+XjX/ih8ZD4rZS9ndKpAu6OUOl0iGLknjcx/KgqsXhiDvVYcT3+3iVuvmntNp330nLgql5nOuRHqNIHkexzeAzEmIgdRHUFvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHwzi1M1YhGQTNoLFU4Y0wY9Ct1Dep9zm1/5vQ6I5V4=;
 b=TZiDttPI//aLBGFYPDZdwFY/frnzbmFUAXourvUI32oKJOewdavfaAXjYLvDPg/O6DY+jntSGLnM96RnLcTVuLpV5sz8FNbqwn20S6PpMMFJh/k1i5kffqp8UtYWQPrS8hY6N5N4Ir1HBVOzdNiZs8bIyOHVbV2fWAqdLizIwEQjLCk/Zc0hs0QRfvCRfcpZpebyXqcnFCitvqoP1ZyF+hEoIAX1NAN14QVwFLDBARgpMo56m0NWq2me9X2bRSe9pg1I8m0Nw5Zo5RT1bx0l3XwmN2eOz20Fm1fQ8D77+n6wLLpOSy4Vm9SZJJTtohg3mU6sxQ1Fhcc+BWnIZsg/Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHwzi1M1YhGQTNoLFU4Y0wY9Ct1Dep9zm1/5vQ6I5V4=;
 b=u+dRgczPB1++EBbU+0zotwdWY5KSIPkt+mR89rFNZapPp5eVFMMVPwEr5iGogQXBfv4FPVTebmJMwhfhw6gltIC7ttSzdQT9gKGJ7eSeG1jSh8Vgu/NayJwZ3MTu/sCVNsNTDmvPfwApas1j/VGqC347g+oWzQod4OQvOgvZAsA=
Received: from MN2PR10MB3149.namprd10.prod.outlook.com (2603:10b6:208:128::31)
 by MN2PR10MB3661.namprd10.prod.outlook.com (2603:10b6:208:110::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Thu, 16 Dec
 2021 12:34:26 +0000
Received: from MN2PR10MB3149.namprd10.prod.outlook.com
 ([fe80::992c:e877:f87a:4c10]) by MN2PR10MB3149.namprd10.prod.outlook.com
 ([fe80::992c:e877:f87a:4c10%6]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 12:34:26 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC 0/2] migration: Tally pre-copy,
 downtime and post-copy bytes independently
Date: Thu, 16 Dec 2021 12:34:18 +0000
Message-Id: <20211216123420.1328937-1-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0258.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::11) To MN2PR10MB3149.namprd10.prod.outlook.com
 (2603:10b6:208:128::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1efbe28a-e9ad-446a-b3ca-08d9c0906554
X-MS-TrafficTypeDiagnostic: MN2PR10MB3661:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB36614C55D6B3D91E081CA6DF88779@MN2PR10MB3661.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5QagsdMVpU5yFtiFVuUdlsMsLgMln+5NjwapQo4PjyiSLoZBXdj2pZ1CB7NNEuWKuSgQUjZYmIudvtnoL3QgeSqKIoTlmTtTApSYrFpK7hqZo8Uwo9mUb3ooFRQR7628LTOrvzn2NdQOTGrrCb1TSd3yzlgbA0sGcqODxdXfGpH//zT0z7MiYqQ80qQcVP/Cx4xN1Rxlxw3/ExmxGOX2RLEO5ik+qQP0uUK0HEP/yTqGKnhvWycKQnFhoURgDgTyFFU90o73zEoScvqGREkkX9W/QtmwgTGnXUGaQaKma03SWAFVpYNcjyTdjny4ewIJSWDEc2QIAfW5cyeTO7WkU2jbk/4TrPnnGxOnYf7kjoLGHAgD8VQnj6+/eQrjmVNkaGZLdwAjk8SJBD0165lbPYuj7XkwTGgpbkFFKWmpC2c8eae/mLv+gnMwvNHUfUvEWvBhID7RR9KDSmBheztq3q2yYzZ2H4tBVgBaLorjUfxfcPb0h13JrJ1y1RdKJAzYS6qKr4oHPwTBypFFKi8nyV8GbTZk90jJQEUdzoO2NfSAvH/uts1Zwd4WCLDJ77jI9RFEIPKVXgDw5gOENdO3NilPPN4V10p5dN3XVvcbODOndJh+wbtvGapCXhm9pAxrOvcjRwRfMaXln2D8qSfcKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB3149.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(5660300002)(66556008)(6512007)(86362001)(508600001)(2616005)(44832011)(38100700002)(6666004)(36756003)(186003)(6506007)(2906002)(6916009)(66946007)(52116002)(6486002)(107886003)(83380400001)(54906003)(8936002)(4744005)(4326008)(8676002)(316002)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bQxCJK7jQw9+ksHwB7sB6UgQoJ5QA9qDDfRK5/ctc4lVlFdxOvrFfP78k4ya?=
 =?us-ascii?Q?t+3G2tSH+LNqH8OwMhvQUEdpwUQ/0IKTUujrSsviv/N4nswfOKDlGMMEqwEg?=
 =?us-ascii?Q?HcNE3CLOa1fUWJItn3zSsLal/dVEj2PtBG+f/HjBKvlxGzzbr5UiXZS63UhI?=
 =?us-ascii?Q?svtVcLnbfsGcwkjsdrGWNnz5XB7cq1Md7EneirxyjyiycfP3i06F/NdB517l?=
 =?us-ascii?Q?VvkTqsSLtbuLnb/PiouMvJRpTsSGmW28tXCIAFfpcfCZqrUUNHn7LEMr4tBX?=
 =?us-ascii?Q?gxFUULV0fuYvXktU74dClmLoyKiFzREbKCBQBCDABCgq0C61lnVpdex6zvPr?=
 =?us-ascii?Q?BLmJlf68v5H7N8bkAkCRkewsZkxU7HX1ua9uG29rK1bncclSMlKndfYYj0IT?=
 =?us-ascii?Q?ubeSaZsU1Rk6Tpg9KFucbY8Yk+8q7fPoeOohqwSX12Bh7C2DNzv0VMCADTjv?=
 =?us-ascii?Q?SZSEgwQ4qlG94ZtFjVHxGl0J6+uYMK6JiMZH34xKTkKPJur90/8CVDcfK042?=
 =?us-ascii?Q?Ko0cV3VLyHcjkWzfk/C2D7ZJOe9A1nGb0S+WjLCYtMNiGEI1vHMjI+RT81Kv?=
 =?us-ascii?Q?t9Cg5J1+4YJnHbrZjS4EE/0sadSfnghnV6DPLYjZrlMyOpOmadTIpJTBPCyX?=
 =?us-ascii?Q?oQnbRo5FzJb2Jo5U6Px5gqEVs5qCyyR6Yhxa3sd1zj3XyMGmoMVWyeO5UhAk?=
 =?us-ascii?Q?gF7d8gJ8/ZUN6GjoAp4u2HYdpYfuynrdkGd+qnmtF/+6JUIODI98A5tUYBRC?=
 =?us-ascii?Q?aLntHwrHhGpchR6xMkPlPZBUNhNGg8IT3N8DZpv2mSky5W9mpUvWasNIBIyq?=
 =?us-ascii?Q?mXcwRoqOMhvBbsWxr9NZG13nPeiAj1zOENToaN8kGL0wH6DTE1f2ZKtzMte9?=
 =?us-ascii?Q?GjTLD1wf2tWdxEgK8cx8DC16W7suYGgEYZLEeFu9C8/58PONtnFXwKBL8DQ1?=
 =?us-ascii?Q?IIxxJDd+giKgTfFSSUPN4/uk6Q1VCPhhz8huumFgcWfMI6WuJm6W3JucXuXb?=
 =?us-ascii?Q?ENmBGtltmZGZFgu5Pg5fZoMmQ6FOxsywjH/HEitny+mCjtyd9q7QP4RZfPni?=
 =?us-ascii?Q?b6Cw8+12towEODVZOpXuxtmL87rRD2xOQZgdINvDQ+CQ/iLifRwNuhXL/rP2?=
 =?us-ascii?Q?/tCKIDawICyqS7NnjuFWYz5wWfI9lLblxKskq4XTgIYFeJzAnKLo9qGRCEt9?=
 =?us-ascii?Q?3gwKPMl4CvrNN3RJY8SLOngHquVq1Of6RCjnFNcETTRXN5tsazQbsoj7M+Tf?=
 =?us-ascii?Q?UwFkbB2Nl8+B85ZCNL1KXHuJ0dpfzBWcbVLyuxHu2G+KcJjQcwqKRq5iNqVF?=
 =?us-ascii?Q?UD3a4Xrj6+3+1KOZp0i+1uKvZybZu5oCG4g3ihXtKFuGdxu6lEk8x64m4T/H?=
 =?us-ascii?Q?1Yw9GZ1nAu/a18em4pUfLYFybecfeKcUZYs87/K83SwjtBQZTjgM44Uqj/0b?=
 =?us-ascii?Q?MgT+RmCJmNeBDIiXeS9t+ah6Fm2D1m1cKka/cmMNrVU43IVS9eyJnMb7vckx?=
 =?us-ascii?Q?S8QdNzRSqKReba72JfKdVCNGK7QEjvLjeYF5pnRKj8Jw7YNykSPOWK4lq9zl?=
 =?us-ascii?Q?KtJCmX0D00JpGskKI9KQ4s8vMpm+KbkUOd+EIItFT0NPJPWr+RSEalc6L866?=
 =?us-ascii?Q?6CvL6stEtlFT2BEnsjQnJTD4rNJRV2TMHeiBoSJ+YatgSaznbLbpZ4W6HvRm?=
 =?us-ascii?Q?H5Iu1bdAtMBvWd8cmLVfQtJXPc9j2GGzNUcPqLGl8bkdx7i7?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1efbe28a-e9ad-446a-b3ca-08d9c0906554
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB3149.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 12:34:26.1706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JybDTQbmYzC+KCUf+/IR8FDPzu5yXkHo00XvkO6kqG06DuoH/su5ylxlleex/t6cnL3myBCUUcd8+nC/sp7qavEcnESu5ow9kbS/VWSPJQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3661
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10199
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=669
 phishscore=0
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160070
X-Proofpoint-ORIG-GUID: g9R-FF2f5ysfGoJB3M9CCeaXvQgyS4lH
X-Proofpoint-GUID: g9R-FF2f5ysfGoJB3M9CCeaXvQgyS4lH
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

When examining a report of poor migration behaviour, it would often be
useful to understand how much data was transferred in different phases
of the migration process.

For example, if the downtime limit is exceeded, to know how much data
was transferred during the downtime.

RFC because the name "ram_transferred_add" doesn't seem great, and I'm
unsure whether the tests to determine the phase in the second patch
are the most appropriate.

David Edmondson (2):
  migration: Introduce ram_transferred_add()
  migration: Tally pre-copy, downtime and post-copy bytes independently

 migration/migration.c |  3 +++
 migration/ram.c       | 30 +++++++++++++++++++++---------
 migration/ram.h       |  1 +
 monitor/hmp-cmds.c    | 12 ++++++++++++
 qapi/migration.json   |  4 +++-
 5 files changed, 40 insertions(+), 10 deletions(-)

-- 
2.33.0


