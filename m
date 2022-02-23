Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D5C4C1B38
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 19:56:38 +0100 (CET)
Received: from localhost ([::1]:41338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMwoX-0001fz-La
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 13:56:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nMwdy-0002oE-3U
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:45:42 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:46764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nMwdv-0008Cq-0Q
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:45:40 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21NIDoO9020622; 
 Wed, 23 Feb 2022 18:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=ZaEwRMo2oY6rwpQE4B+3QMrYzCSW89oXDSuTLvdyBqw=;
 b=VzKMfZeIQ3ryVZQq65XOMbJrtjwj8IyNDJHGnDh4ZwbKDXJJCQr7m6AjtpAY/m/4Nw60
 6xWbm3yVbIXxokn4Iyt4o6zsL+5L2CEACzww1AF7Ij9Jt7wjyHucU/gNQg8HFZDbmM2V
 SoxwCFG2HWUfehvC1R52CYCPakH1xxwktOAd+tq9D/RG5PDdF2nUMUb/ejn+Dzg8A1UN
 kp3d49myxGJAvGuG5rSdXYHTmGEc9FiJ7UAue5zEvjPTE5gUWx68l9FlOJgYtIcVzTm0
 SeqyQ2InHg2UB3XqzpztiV9/cxCv/o8jT1VvfM2xS/lscLJjsktOXxyg/yJvLdfSN0az gA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ecvar4tgh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Feb 2022 18:45:35 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21NIaV2u114456;
 Wed, 23 Feb 2022 18:45:34 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by aserp3020.oracle.com with ESMTP id 3eb482umrt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Feb 2022 18:45:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJC5TPP3FJhaWWIrVlDmp9+T3hvIyfT0thML3JkiXEZ8UKzdPDNEES1GTb5F3AWrOmXuHwPKNYqXYmGKyMY3FielUMoUPBJ+YsmcMx0mHzpa9VBOjJS8zLMmpxWfL7GvlHrsQrCWwcpsx0i8RcgQlOns5Zm74d/GgoPAVhJVyFvajqBimHPRloUbsXwC06S94KjPgOqdkf4tsnT3SS/jFeXO4lKuy7Ryp48HWKK+yD9XXZKvXkXciKSTJY+Tuc8JxA1T8E0gTkgiodHgSTqLbtSGmmV0GhP9jsELtMqDU0V8SSXACvH5yTWT9ajSnmLX/rr2C3rPg1t7bNSm/S2uxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZaEwRMo2oY6rwpQE4B+3QMrYzCSW89oXDSuTLvdyBqw=;
 b=IUlIsTTMvHIBRDszXairjJ6uzysJEbD9sy+XBJwxzOs7F9cIDMFw8Md7atH5PbIbEUyOrPhma3EosBSYan5eDpQ3UMeTeCGdJsZNTD6qrBUP2gAFzMJgY0YGhGGZSECVS3GFBSQZpORd4lgR9WT+St3nZz+j2xZZ1vh7VnQ553CRoMFD+NdFSrE0rGLnOf/ylzSLQmehbCAlwkRo62P/hRWsPCrZS+MAcu99rrJ3pYSYlIllCAVUFrl/nQj1Buzm9h87yDk+c9R7AjrdbU3kNPL18mXm8gqQyQbcJuvGp3rRsN7EFCKERldockfFwpOCoDA9D5XGtrIqnS3Lw2pehg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZaEwRMo2oY6rwpQE4B+3QMrYzCSW89oXDSuTLvdyBqw=;
 b=UOltggYTeLoqdtBnWXUS3IxbbHtNRj4o4KHqTW1MvsLsM1mZ6Aa6kMRAmhUrmxK+IOo/bCTKDUSi2G+ElHegfaRy5cIHkZUHAZGY6Pj99AUiWgMCapfGzhzG5dL765snJpvnBQ9qS73D7HQpm1wCj66q1QN+p415CcriS90OwKo=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MN2PR10MB4144.namprd10.prod.outlook.com (2603:10b6:208:1d6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 18:45:32 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406%6]) with mapi id 15.20.5017.024; Wed, 23 Feb 2022
 18:45:32 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/6] i386/pc: create pci-host qdev prior to pc_memory_init()
Date: Wed, 23 Feb 2022 18:44:51 +0000
Message-Id: <20220223184455.9057-3-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220223184455.9057-1-joao.m.martins@oracle.com>
References: <20220223184455.9057-1-joao.m.martins@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0332.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::13) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3f7854d-0e91-4855-7eee-08d9f6fcabe6
X-MS-TrafficTypeDiagnostic: MN2PR10MB4144:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB41446414E88D27627D8FEDF4BB3C9@MN2PR10MB4144.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kekjndfwqOo8vcAA4HKOvUdE459wjtvFvgVRt0Xx2/WyDS8mr0e4KqDDyYwvbVJFzXDp0KcpEqR9JmwzlAkLHuxkncMKpnANG/WhZ7xnOzAmvR8fvj7eTHDNVzhDYNXiVQF5fXfaGwY6YI/MX/SqXTsnMjLe5xp/QshOO7Uxcf7XddXWeJr/AfpjORl+naYCkkOjQLWITAVoOF4RA/C8ut9ckAGcBhJ2O8i3WY6fqSEy2bekZrLKLmgHpj8aBM4R3uxYkGbO+J+2obShTY5siBZ2sCy9OZXGRMqm+CTy+CgNslyOgoPIVOTzq81GX5Xj3HMswdovx9Gz/nWx2TpBZye8kVcUew5exRHffZuRd3yFasyJ+wSbmxGhpMJpmrEnSo1OCbdmmeUkxJSIkLQIKD4rOQOwDeCi9W6ii2lCVug0nz0wJ3H3NpndOM0xnJiFaAsj6pkJpqmoBI3ipNS1SFMy/I2XYgBo0qfywWdL4biq3yGpdAuFFHjtNAXnceR9Rt3sZFOc0jeLTv+tvHXxZDHBgdZ/TUgLqq3Ri2IYuNSGBd8nMOrgxxr9PJYPjf5gFVVe6S9kpiwcNDif/duCuH1kP0DMk9RLl4ZFyDSY7w382Dxbp6A+kyLetwUl0D/ImgqTwpT0j5FsGekQ3ZEp28buP4ZHnWGG8J0NBYHo8V8jiOG1ZFRHWGLohYE2aEUAez2krzKB3yi+2wm7nkM04Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(6506007)(6666004)(66476007)(66556008)(66946007)(83380400001)(4326008)(6486002)(103116003)(36756003)(316002)(2616005)(7416002)(86362001)(38100700002)(38350700002)(8676002)(8936002)(54906003)(6916009)(107886003)(1076003)(186003)(26005)(52116002)(508600001)(5660300002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zBoj+jOvoH6L85X7kRyZQT/s+FjLK2vX6DdqVM6eJNghbkz+MZ/RW3ANpsdG?=
 =?us-ascii?Q?aVHwOla4G8+4jPGMi6ItO5fR9hQMYP7AW07izLzkVVv5iUmDheaXaDLMcX5B?=
 =?us-ascii?Q?kDariQlv/QITMlhBnthrp1pClLJPtqJWzhu0dWfdzi+8u8vEa/HTPTKHiPo8?=
 =?us-ascii?Q?z/GlM5SqHE6ea4MobYm1p0dljfOjRFINPdqhIYcKoozYifQF6/Y3ms/8FOSO?=
 =?us-ascii?Q?9XS3/XPSntXni9/B6MNqcW5At91k1R+BAbSJ6TBdNfGXnhGlekAXzTeMWKN/?=
 =?us-ascii?Q?GjhYR7a6uz/7VmtqzmbZnSazLtLCexVsGvGzKmczj0cImE+pNHCHpFsCSj94?=
 =?us-ascii?Q?uCrLVtEXdqVDZfvlKSbydFdOhTjbYUkWkJjYv6H6XmmxXg9YTMwFXB249uZR?=
 =?us-ascii?Q?Akxr7lhHibK3cimyZXtjClyptEsReDphz5HsOIa5el/Z4EmsJ81LbNBbW6e0?=
 =?us-ascii?Q?I6+byyspHUJBeA5HBtXMTaBtJ84u/VlJhP3y7nXZ9K050fQ6o/nvDifRa3St?=
 =?us-ascii?Q?qtNXO/XATcIuWXhxKnHjUqfMhOQgKH9iaY++KS1wBxjLRzU7RHAnZ6pQy3QT?=
 =?us-ascii?Q?yPopO/h2oSQO5PUTEDcGE7BOjxd18d+4qn+HVY6IH2s6OQGoQ1woCODovrDa?=
 =?us-ascii?Q?lTnc9eroXXYuab/i859FLXbTL4am+gxAsReSNF8JRY+m3mwa06ltOOdwQc+W?=
 =?us-ascii?Q?Ra3xpD/IAruX52Dz6OiLXEIZCWdMOzkhyeYvgWHTRsiHjvvkeJD2PLewb9it?=
 =?us-ascii?Q?qowdIyCw7XVhFevd7GdPAaaN2WgxHw07lYNtVTxhI1zyY28BTbQvBXS7N4Tz?=
 =?us-ascii?Q?63z8eVYeReqzwzaT8LvWmga89KpdeDn1ECWx/FcdpgZLqA2tpIWmqRLOQ+Sy?=
 =?us-ascii?Q?cRNOu6BRa7eWmGU/zK7kjG6SbCs3HnFzcZgoHzoERzKfbqM8XGD0c3tbwZnK?=
 =?us-ascii?Q?pR67Qypf7ql3Z8yxzL3QWbRHSejQTO7IM7arqchKdjxqrqJVVLfq9Gn7tMn7?=
 =?us-ascii?Q?Cl16f3GRQ5K7JvBQ7jWVqEIbPwACVPX1S4YwSLcBxY5waHUMXfnJ+AoX5Iwk?=
 =?us-ascii?Q?WHRu5vF1j+op5JMLBLaq/hInEHgBue2zYDZTYlnSKh+vu+4fIiKCBlzuIzSy?=
 =?us-ascii?Q?qm39Igv6vKiMzzunvI7zchNswqdiw4xUAxFRAXnPTrC2s/SlgatqA1bdQF2s?=
 =?us-ascii?Q?xmdAlZ/trupjfil0h5fjtDFxo639d6oQ1GmDFQ5WXeduSvp3srTdn9qbvHzz?=
 =?us-ascii?Q?JC4hPuS5FS1S7P658Nm+Zo0Pol1x1l8sGmuO6JfYLnCNyDZUcB1GiVQ7AaE+?=
 =?us-ascii?Q?OyfnlwzhcVb/8ImZ6TGSxTWTiHHPNdDmuKenVD8xeEQaMohmesNigGArXAcW?=
 =?us-ascii?Q?SgRlmdQ7kweuJ6lFfdpQAqUv0MwbwEG5jf9ayoHYpWaUj64o7idx2pDsD0gr?=
 =?us-ascii?Q?2TfUxIq3MMYga+mT2Y4es/nHWBnojDZXRPIWBbZSnFl4U31niWPY1QPA0PMB?=
 =?us-ascii?Q?SgV6UZbbicEQMYxryu5WrczonqtV89W4JlPUq1hCAuqCXhyOXsbdq1nKfiwp?=
 =?us-ascii?Q?ym4GPMpRPGE7IfOmKHl1xGjVsTdoYyo11mTpTg+xX3QHkCycfgtaroJGCOQ8?=
 =?us-ascii?Q?NhCJziu4VBvdr+g4RtaOlalnL3nJv9IMo81jAxvC29IUBmh6Nm6BR48z7VEx?=
 =?us-ascii?Q?bX+eeA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f7854d-0e91-4855-7eee-08d9f6fcabe6
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 18:45:32.8024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPhIlhF6AoHnQHh8trUqoe2e3mp+pcC+Cml8Gd6DN7MUPELutJY35GBVPk0Bd5gQI9IZANt4r6NmsM7igKUFm/HTGi6c0Jj2g+zRugje2lk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4144
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10267
 signatures=681306
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202230106
X-Proofpoint-GUID: xGxGfOx6o6lgHALn0Zcd3kQIVMBsB6PN
X-Proofpoint-ORIG-GUID: xGxGfOx6o6lgHALn0Zcd3kQIVMBsB6PN
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Joao Martins <joao.m.martins@oracle.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the start of pc_memory_init() we usually pass a range of
0..UINT64_MAX as pci_memory, when really its 2G (i440fx) or
32G (q35). To get the real user value, we need to get pci-host
passed property for default pci_hole64_size. Thus to get that,
create the qdev prior to memory init to better make estimations
on max used/phys addr.

This is in preparation to determine that host-phys-bits are
enough and also for pci-hole64-size to be considered to relocate
ram-above-4g to be at 1T (on AMD platforms).

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/pc_piix.c            | 5 ++++-
 hw/i386/pc_q35.c             | 6 +++---
 hw/pci-host/i440fx.c         | 3 +--
 include/hw/pci-host/i440fx.h | 2 +-
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index d9b344248dac..9ff49e672628 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -91,6 +91,7 @@ static void pc_init1(MachineState *machine,
     MemoryRegion *pci_memory;
     MemoryRegion *rom_memory;
     ram_addr_t lowmem;
+    DeviceState *i440fx_dev;
 
     /*
      * Calculate ram split, for memory below and above 4G.  It's a bit
@@ -164,9 +165,11 @@ static void pc_init1(MachineState *machine,
         pci_memory = g_new(MemoryRegion, 1);
         memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
         rom_memory = pci_memory;
+        i440fx_dev = qdev_new(host_type);
     } else {
         pci_memory = NULL;
         rom_memory = system_memory;
+        i440fx_dev = NULL;
     }
 
     pc_guest_info_init(pcms);
@@ -199,7 +202,7 @@ static void pc_init1(MachineState *machine,
 
         pci_bus = i440fx_init(host_type,
                               pci_type,
-                              &i440fx_state,
+                              i440fx_dev, &i440fx_state,
                               system_memory, system_io, machine->ram_size,
                               x86ms->below_4g_mem_size,
                               x86ms->above_4g_mem_size,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 1780f79bc127..2881afd75a82 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -203,12 +203,12 @@ static void pc_q35_init(MachineState *machine)
                             pcms->smbios_entry_point_type);
     }
 
-    /* allocate ram and load rom/bios */
-    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
-
     /* create pci host bus */
     q35_host = Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
 
+    /* allocate ram and load rom/bios */
+    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
+
     object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
                              OBJECT(ram_memory), NULL);
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index e08716142b6e..5c1bab5c58ed 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -238,6 +238,7 @@ static void i440fx_realize(PCIDevice *dev, Error **errp)
 }
 
 PCIBus *i440fx_init(const char *host_type, const char *pci_type,
+                    DeviceState *dev,
                     PCII440FXState **pi440fx_state,
                     MemoryRegion *address_space_mem,
                     MemoryRegion *address_space_io,
@@ -247,7 +248,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
                     MemoryRegion *pci_address_space,
                     MemoryRegion *ram_memory)
 {
-    DeviceState *dev;
     PCIBus *b;
     PCIDevice *d;
     PCIHostState *s;
@@ -255,7 +255,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
     unsigned i;
     I440FXState *i440fx;
 
-    dev = qdev_new(host_type);
     s = PCI_HOST_BRIDGE(dev);
     b = pci_root_bus_new(dev, NULL, pci_address_space,
                          address_space_io, 0, TYPE_PCI_BUS);
diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
index f068aaba8fda..c4710445e30a 100644
--- a/include/hw/pci-host/i440fx.h
+++ b/include/hw/pci-host/i440fx.h
@@ -36,7 +36,7 @@ struct PCII440FXState {
 #define TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE "igd-passthrough-i440FX"
 
 PCIBus *i440fx_init(const char *host_type, const char *pci_type,
-                    PCII440FXState **pi440fx_state,
+                    DeviceState *dev, PCII440FXState **pi440fx_state,
                     MemoryRegion *address_space_mem,
                     MemoryRegion *address_space_io,
                     ram_addr_t ram_size,
-- 
2.17.2


