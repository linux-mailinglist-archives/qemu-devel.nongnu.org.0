Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 498A03B09DA
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 18:03:32 +0200 (CEST)
Received: from localhost ([::1]:57126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvis7-0001In-8V
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 12:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lviee-0006vn-12
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:49:36 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:2452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lvieY-0005tW-Sp
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:49:35 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15MFfOcb012085; Tue, 22 Jun 2021 15:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=8OLtjHGpv/JOAGP4L+CPgUBHdF+av4xu3M7Ii8C4+V0=;
 b=wLH4h29m44cX1W1dAsBtAcjOQb1wFH+632BqvHiKqZZ5OYn/uj2FURnOX2sRHBPmNHSW
 4NWFSLfwn6Fy+KE51B5HIEGOd+PIbPOIXAFXBsafZX8ElOIL3HhrL0HXhdWnmNHHmWop
 mkNqZihJGeu7F5EjW2YIt1TqnJJ2QuUZboSNteQ2fh44K6WoxjxnR8DUeIvuUdUPy7BV
 fsgbVF6TP45PUvcLaOQbzWtma53tgim5UNtyNjcVfXgkr0NrEYlfetL9vLZGAHmahPXD
 B20dpSeiPNT/Lh2MuY/U+xT3sTXfKAiQW0/VExECj+4mqbNH9dMcH2V2Ybmhjp3uUsEE HQ== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39as86uahm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 15:49:26 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15MFnPYE114178;
 Tue, 22 Jun 2021 15:49:25 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2177.outbound.protection.outlook.com [104.47.73.177])
 by aserp3020.oracle.com with ESMTP id 3998d7pn13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 15:49:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5sP7RtzQRGIg64KFIZP9lkbbw2Y7DgqbSh/2aU3+jENKhDm+MiXOvabha/8P5plwtDxplYuNv8Utq0yNdkdpiKi1ilHhdAvKnN8Lbk9D/8XtuiDJdpk8GkqbvSA1l+GBGAYLIf/a0rCSNmDmsrRkw6XRxKI8LpZlcP1PognPyEKX6RcNv6limePHoznvNtP54JnzMxy+COORnPhyuW+yRKezSNbMAWobBps42PrQbnxVOb+TvyKcT6NSzp/gX2Q/2eOzI/6VmWjMlQkJXsZ7c4gkzzd+R1GBYSLgX67lcyFGs3EezOceqfAeSDbKeu4iynpYwI2AdIc2YHAoNcpbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8OLtjHGpv/JOAGP4L+CPgUBHdF+av4xu3M7Ii8C4+V0=;
 b=ZlgHnyAtSUwCcj5HsuucQ6d97XSmcYblS5qYyjU5E3M/4bm824xRjFTQf4x18Cdll4sMRkg+ETGtoJIR/AM0ROzrnWAujcMoqzE3/mDmp77K4/Hs6kM2zw6FV4hbIBo2xAHxj48ELEHWVnihjiLd+5nTzlZm5QKhxxn/wANjvoRnw1cFIbQMlK5A8oZbEg6QHJLP9qBfHTyQ1zA8cEhMf0xp7e5cA1WhsPqOuBVDpYsqZbRwXg+aGKTVMmFcZtmO57/I7Fqvk6fcH1Ngp5VIE5rENXXzRx0AbEqDXpQhITSGy9yqpzNqQ14pl5Gy61fvWDX8uTOwkEmsUfxFEAO96g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8OLtjHGpv/JOAGP4L+CPgUBHdF+av4xu3M7Ii8C4+V0=;
 b=pquzRQQtA+6CKjK/WtP2N1mos4yeNTl2jPqFZvAOmyKT/AK6L0LkTW2BkDW2oMDfOkM2B0rqZ4NSz/jLaZGpMBePgseBOL70IppUHq8ZNPkkimyP18Oc+Zxy97byFlK3DGcVf7wWlv5bqin5IMzLX6kzUeaI1uWpnME8TabrSY4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BLAPR10MB5204.namprd10.prod.outlook.com (2603:10b6:208:328::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.22; Tue, 22 Jun
 2021 15:49:23 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582%7]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 15:49:23 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 2/6] i386/pc: Round up the hotpluggable memory within
 valid IOVA ranges
Date: Tue, 22 Jun 2021 16:49:01 +0100
Message-Id: <20210622154905.30858-3-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210622154905.30858-1-joao.m.martins@oracle.com>
References: <20210622154905.30858-1-joao.m.martins@oracle.com>
Content-Type: text/plain
X-Originating-IP: [94.61.1.144]
X-ClientProxiedBy: LNXP265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::19) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from paddy.uk.oracle.com (94.61.1.144) by
 LNXP265CA0007.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4242.16 via Frontend Transport; Tue, 22 Jun 2021 15:49:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a95aa03d-ce68-4311-a85d-08d935954e9c
X-MS-TrafficTypeDiagnostic: BLAPR10MB5204:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR10MB52042EEB52793A0C85EB533CBB099@BLAPR10MB5204.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TkDH+0AWJUKnckFBb/bDhNwkoGKPO4WNCDehhHsPSZQcCMeEFMN6k+kqyLVP+USCuSggkJX9JonGm//aCqGpcKfZi0cWa7UXjMZTOauwRQQl5MdKeJsZkOX4jvnMu10Gu0+K1uHobONeTAws614C4HrjFV3H+UkoRKZfFqoyp/VTGInQroC8o9lacGH7+5UcE0kIFuiXLA3Ap8rbGycfOqdaPhi1Xk2GmlIGbUgVbpN2sq0odvGu1V5fuT5jmVGUeQR5qT7EDcAymoNaT9laSyi8+rXMTDfFMqrphV+B3NrTsWzFxlaadQyR9KdLcRNu/7IdILrJduETvw0TDUbor4qgweEPdbGlJSleOqUMJJFaUMidFrCM61LLjKI6GGRwHH7iTpbeiAf8gN7oYpx/beWAJCoM/6o5Mtc24rC/vyXwWl3F3PWCKV8GHtMNwRmG/zS3UepCZRdNQ7GWtkCJmPU6oMlRcq3N2ucpCOrkJflE5JspZyftUlEZjfwhFRWKxdbendz2DSMOxC+E9tD+MoA78LpG4OZ4GU4ZQ80aU606NVgfmUI0KRyhLhd0DtNonoLasIgQ3eAFlcTuxzI82vN6ti/vz2HGuq8EQhJZHHFFEW/j9qv2WHDjvimjHrmxOigIa2cPm8qt1vF7bWddBMHb3q45ZgT7s0XWQNSrz8Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(396003)(39860400002)(376002)(366004)(5660300002)(4326008)(8676002)(956004)(7696005)(1076003)(8936002)(52116002)(2616005)(83380400001)(6486002)(316002)(66556008)(2906002)(38350700002)(38100700002)(6666004)(66946007)(107886003)(86362001)(66476007)(36756003)(478600001)(54906003)(26005)(6916009)(103116003)(16526019)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KcGgLu1vPr04c7nMg7sEEQtV3XGrFfuUq1bjK8rYsEwNlT4HisCXe1eQZzx1?=
 =?us-ascii?Q?cjoBujWxe1h6jllnJAwQOI+SavBFjmdqdIt9vV9u95TFSKGjwbi4U3oTchG5?=
 =?us-ascii?Q?EawkNicgxd5yHtLwy5KYs9bHYoW1+5M2TXk7cKBHYeHSF9bS/a6alDN+xZaf?=
 =?us-ascii?Q?DPTrNQmpXmHvbg/O/CqUpLV3pHbrqX7dIfy56lV2ebzrWYX/AEKXrFsWBb37?=
 =?us-ascii?Q?ytQz9py9ftyVUpJFmqqNz8abYe+azBFmUCaW9jbHnezy33wMiQy4L8CsSlZ+?=
 =?us-ascii?Q?IakSZm1egojHz9TU8qQwI5LquhlgmbLnEQtUTTouJvSEXi4vUoNExIpNdN0d?=
 =?us-ascii?Q?gM63Q+jzgkak7b9fkp11zFvAKUmi9ObvSPweC1yFwGVQIrNmdj0R63KgJyVn?=
 =?us-ascii?Q?doWwOSuZwCYmgg/8v4afxsjPVeQy8nd7nqOx6r4SN3iUM1eJScIXkqCql4Dz?=
 =?us-ascii?Q?KwwJoe1suG9vNG1K+I9R7yb0JXy5KdJ2Jw1+jiKRCCiFgryYlFF/eHXDwYKi?=
 =?us-ascii?Q?WNrjQazWwucPwvJymAAnrTEGKfKFyqfsYnl5Vxj3HUkoSFxDr9BSbbekGbyr?=
 =?us-ascii?Q?rgTAoecMZGUaLkgs+j3xe25aFVNrtesXxel/PSuCJyXxNumrK4+j8AZLuBF6?=
 =?us-ascii?Q?R6Vrhe27yNCR73E42Nhg0My+7Tbcp6i7LGzytiLkKhxzGUTYP8klMgsTQMUa?=
 =?us-ascii?Q?aFS97L4sLyDMSO+1GKs+Wt7Frmytb2vj8KrZ78zD1gY3BsU5Jq8+TrvWw3f9?=
 =?us-ascii?Q?sMQvA8nn3OpkNGhclif9eOn9KOJFkRHxrKJYTKBJTjtRe41paO5xuQF3Ul8z?=
 =?us-ascii?Q?Ae6lYeGzlAbnf9ydaQKoiuXEvLgZP3jNxzPBsEKdl7X5v10eIsS6Qkwfb49H?=
 =?us-ascii?Q?7iYDC+W1SZIMxCKBixJoh4V9uRStxTgZo8wC/P0R8+O9Kam148wc8KEKL5gP?=
 =?us-ascii?Q?ZzZjTiZMZ0Ln/8zCC45vo03m6p8zbaFfNdQNtfFoWaAjgBFwl9g3lT0Ji/u8?=
 =?us-ascii?Q?NpnGlEsRnNHyC20LQauOfAQBCa57TceI8RKwH9PY8rcmeJtu87pv8H9sq1I7?=
 =?us-ascii?Q?pbpAEJRgiVS9eXpUaFlKzWvZrsqV2VJOzQntCvI/Lf0dYMgHrDdNVsuBMfTb?=
 =?us-ascii?Q?IFAWuoG8NxczD+FgARVlAMxCScotBntcmVSs77cn9Mtf5oWmML6oIFRG5ckK?=
 =?us-ascii?Q?j3teH8dpgEJXVQ0Z84dOYGn57zo0JaUXYYn+injkGf23QifOwfNMOigRjue1?=
 =?us-ascii?Q?smCvO+opE0MHLOsl+cwMVEbLjqw95geq40LwPzETa9ueY1aRCK8Uv6ayMpY/?=
 =?us-ascii?Q?Q0VtSJCtaFz0lgw+aG66zg8w?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a95aa03d-ce68-4311-a85d-08d935954e9c
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 15:49:23.6248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tX5L2Kvyw0GZrc7nSyX8d2CxDgJUfjknqeJ82aPQw/G2Ytm6RjE+cUXxMvUeQazkLEvcwEix52GtxWTpCVfXQ81QzuaxZ7pSbjXi6ag/qSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5204
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10023
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106220098
X-Proofpoint-ORIG-GUID: FxMRtBBpqoPnnXi8Jj_uLPVmFm5CPq_U
X-Proofpoint-GUID: FxMRtBBpqoPnnXi8Jj_uLPVmFm5CPq_U
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When accounting for allowed IOVA above 4G hole we also need to
consider the hotplug memory sits within allowed ranges.

Failure to do such validation, means that when we hotplug memory
and DMA map it, the DMA_MAP ioctl() fails given invalid IOVA use
but also leading to a catastrophic failure and exiting Qemu.

Similar to the region above 4G we need to make also do create a
region for the [ram .. maxram] GPA range, and select one which
is within the allowed IOVA ranges, preventing any such failures
in the future.

Co-developed-by: Daniel Jordan <daniel.m.jordan@oracle.com>
Signed-off-by: Daniel Jordan <daniel.m.jordan@oracle.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/pc.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 49 insertions(+), 6 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 52a5473ba846..94497f22b908 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -909,7 +909,35 @@ static void init_usable_iova_ranges(void)
     }
 }
 
-static void add_memory_region(MemoryRegion *system_memory, MemoryRegion *ram,
+static hwaddr allowed_round_up(hwaddr base, hwaddr size)
+{
+    hwaddr base_aligned = ROUND_UP(base, 1 * GiB), addr;
+    uint32_t index;
+
+    for (index = 0; index < nb_iova_ranges; index++) {
+        hwaddr min_iova, max_iova;
+
+        min_iova = usable_iova_ranges[index].start;
+        max_iova = usable_iova_ranges[index].end;
+
+        if (max_iova < base_aligned) {
+            continue;
+        }
+
+        addr = MAX(ROUND_UP(min_iova, 1 * GiB), base_aligned);
+        if (addr > max_iova) {
+            continue;
+        }
+
+        if (max_iova - addr >= size) {
+            return addr;
+        }
+    }
+
+    return 0;
+}
+
+static hwaddr add_memory_region(MemoryRegion *system_memory, MemoryRegion *ram,
                                 hwaddr base, hwaddr size, hwaddr offset)
 {
     hwaddr start, region_size, resv_start, resv_end;
@@ -926,7 +954,7 @@ static void add_memory_region(MemoryRegion *system_memory, MemoryRegion *ram,
 
         assert(size >= region_size);
         if (size == region_size) {
-            return;
+            return start + region_size;
         }
 
         /*
@@ -935,7 +963,7 @@ static void add_memory_region(MemoryRegion *system_memory, MemoryRegion *ram,
          * would also be pointless.
          */
         if (index + 1 == nb_iova_ranges) {
-            return;
+            break;
         }
 
         resv_start = start + region_size;
@@ -946,6 +974,8 @@ static void add_memory_region(MemoryRegion *system_memory, MemoryRegion *ram,
 
         offset += region_size;
     }
+
+    return 0;
 }
 
 void pc_memory_init(PCMachineState *pcms,
@@ -961,6 +991,7 @@ void pc_memory_init(PCMachineState *pcms,
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     X86MachineState *x86ms = X86_MACHINE(pcms);
+    hwaddr maxram_start = 4 * GiB + x86ms->above_4g_mem_size;
 
     assert(machine->ram_size == x86ms->below_4g_mem_size +
                                 x86ms->above_4g_mem_size);
@@ -981,8 +1012,13 @@ void pc_memory_init(PCMachineState *pcms,
 
     e820_add_entry(0, x86ms->below_4g_mem_size, E820_RAM);
     if (x86ms->above_4g_mem_size > 0) {
-        add_memory_region(system_memory, machine->ram, 4 * GiB,
+        maxram_start = add_memory_region(system_memory, machine->ram, 4 * GiB,
                           x86ms->above_4g_mem_size, x86ms->below_4g_mem_size);
+        if (!maxram_start) {
+            error_report("unsupported amount of memory: %"PRIu64,
+                         x86ms->above_4g_mem_size);
+            exit(EXIT_FAILURE);
+        }
     }
 
     if (!pcmc->has_reserved_memory &&
@@ -1001,6 +1037,7 @@ void pc_memory_init(PCMachineState *pcms,
     if (pcmc->has_reserved_memory &&
         (machine->ram_size < machine->maxram_size)) {
         ram_addr_t device_mem_size = machine->maxram_size - machine->ram_size;
+        hwaddr device_mem_base;
 
         if (machine->ram_slots > ACPI_MAX_RAM_SLOTS) {
             error_report("unsupported amount of memory slots: %"PRIu64,
@@ -1015,8 +1052,14 @@ void pc_memory_init(PCMachineState *pcms,
             exit(EXIT_FAILURE);
         }
 
-        machine->device_memory->base =
-            ROUND_UP(0x100000000ULL + x86ms->above_4g_mem_size, 1 * GiB);
+        device_mem_base = allowed_round_up(maxram_start, device_mem_size);
+        if (!device_mem_base) {
+            error_report("unable to find device memory base for %"PRIu64
+                         " - %"PRIu64, maxram_start, device_mem_size);
+            exit(EXIT_FAILURE);
+        }
+
+        machine->device_memory->base = device_mem_base;
 
         if (pcmc->enforce_aligned_dimm) {
             /* size device region assuming 1G page max alignment per slot */
-- 
2.17.1


