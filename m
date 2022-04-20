Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D009B509168
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 22:30:31 +0200 (CEST)
Received: from localhost ([::1]:53172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGy6-0007ov-Ub
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 16:30:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nhGgQ-0008EX-4m
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 16:12:14 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:31098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nhGgN-00046p-AQ
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 16:12:13 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23KHsQpr024754; 
 Wed, 20 Apr 2022 20:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=NmAcsd1L3QgMreyXiqYBK6d+LnBCtsRfS0+iOayHWLQ=;
 b=OQy0oJ+Yee2xtGQgbXrijv81KggFX1UpZ/dAFgPTQKxjqCoOn7yVzTdkvbzUM8QJFUuA
 T67O4kWuLlij0BnrnHttVkVkInZcl+ur31wPMhzTZ10D3lePPxDVafxv5PFjZaPHnJDk
 raUAsIVAAXIKkuJnoBlq+lSmxnR1d3if1xxdn8wcMSg9pcMXYt4GQ3GFfPDTbqtxEAE3
 DxGD3aTG9GlS5S+s+nOjJLmKIVmIoGmqPUoEwEx/W4YrSN6sGmuSP5W4DrQjYhD+i6Fh
 kBxwBbglVkrJQjICuZig1lppbieZkj53tzoIqSa/fF6ii1RB4/K7EMhE9+9KYHNneOtt 5Q== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffnp9hxyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Apr 2022 20:11:58 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23KKAkkC028909; Wed, 20 Apr 2022 20:11:57 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2043.outbound.protection.outlook.com [104.47.73.43])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3ffm8872xr-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Apr 2022 20:11:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sf2Zi94ZtnvrrC5KZbsS8cANJr81Y62TWQZ7WL71Glh42EYKILUE35Uxn7SLLjCljN1wegoJcvsik6LKBgo17V5pRHR8qamDGkKAJT6+z5sKAqt8nhgGLj8RcwT34ZQNZEaaa7VJXl/xXgZAzS9XPf797vacWZaca/tR5MxxZFMrjCohitsTQRCho+FZppqb9R2Quq87FkPxpkOHXEDrxuvlPDDEs7m8cJj6RcNfx9Zbs/HqTjNuzyAZcl6plsLLBdHC5pHA64Jip18YsmxUtNCJJ50oqpLrR/d1QQVpwqMIpbm8GOH9gyM59vkIw3BeyaCi+5BrBJItTBtsEpCLxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NmAcsd1L3QgMreyXiqYBK6d+LnBCtsRfS0+iOayHWLQ=;
 b=K44jr4Pu/iNIUZhmVD3lUkDcFcqDQd4d3qPViWeQ3JGgOlSrIKaDQhn6nC6RGWPHKi1MirBiCl9olMWkPnQ7vT9A2Pvs2ZieV7BgisfQ0R8e9zrgOZ4ofjrUeUfudBDAjCN6qNt7jR0m5PCGq92S72jTFuAlLBSg7Q/Hyf+4VF8RNr9xZA+jp9C3Lp8cewqF/flOq7WyhppBnjyM0MEBNI7X+MOIVZf9DSzUU4Tn0Jlzv+TW3O3I042e9wclqsjZgoezroN3ZrKK6n/pFFPA0qCFYwjUKLzBaYcpJCCi6pHn7rbpRKM6DsWeFne71v36kKg/A+5Qf4Ua1DYy4FtINg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NmAcsd1L3QgMreyXiqYBK6d+LnBCtsRfS0+iOayHWLQ=;
 b=U/WCDy8sWS1e0YIDdAlS/kb/pQAk9Z1YGJZBE+fNsuCN8HHdAoPpK2W9n1URXO+LMnScy95ECyLHO7sP023vh2AFwWxOYCaG4oLeKkI4mISNBdBpV0TfmkGanBLMOteQyGy/t7AUcvw/9x6yXtkYX+A92m+JK+RNjHz/RpIPVO4=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by PH0PR10MB5644.namprd10.prod.outlook.com (2603:10b6:510:fb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 20:11:53 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d17f:a2a4:ca0c:cb49]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d17f:a2a4:ca0c:cb49%4]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 20:11:53 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/5] hw/i386: add 4g boundary start to X86MachineState
Date: Wed, 20 Apr 2022 21:11:34 +0100
Message-Id: <20220420201138.23854-2-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220420201138.23854-1-joao.m.martins@oracle.com>
References: <20220420201138.23854-1-joao.m.martins@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0016.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::10) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fb7f643-2f34-434d-21f0-08da230a02f7
X-MS-TrafficTypeDiagnostic: PH0PR10MB5644:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB56448B982F39B4FF1B0DDA2CBBF59@PH0PR10MB5644.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t7Ddjv+tHTwmQsd5iX0eVo2wm8FJ7IF6Wrv/sJpb363Ik+BNA+T7fsSePU/1BWJKPKFtXSk60oZa/lqErEqP3LrMWkCd7K7+YqmxusIADVWeYX6JaVCmVSDbD1JINOysfCKt8Hd2C9y3popKCvJlwgh2IDKWGoFpK1z2O/QPK2yxHOwGpphK1Lthu8Kl/Lsi1epEGuFreoFIrMXOvkv8+tG/m5M94mK398IuVtetFmoG0cnSE3rwYuD8SI79eNeW8GGU9DP7JEjHGs9thlCurSzFd6/IB3XBBHSsXHboP76xflxkmgv5R9nET4kmO38fLWZE++xrt61AKZHiT7jTZLWC0AxurnPcOM3Px52kMWRJMdHY2ygH9FlRthQRlOWU8deScVGThRTn70z1Se0ybtFMFrCAscLtVedbOZ65+0S8EeNA232HSDwlVP//kBkxY6V6ZwNoxb/8pGux41/eQoJ/y8vPoiRmeU5c3bgJOeDEYsPlMeVepheNXMTJa3lFADgLAaTRoiPj7bcxYL97I8+yTmigZxj1PyqS5zi0N/TkmgVnOVmBjH2Sbuzjp9YxJY93pqC4ZW/a3+C/p7fKUNqtNnjEu+yv1hVzplp2HX3gOSP9rTacUrJdSV/z0cZu0RJm3XrrUdbXOo/T5CSTGP7ezkQ30tLgmH62m+Msheo7LhwtoeuBSGJMdIRyLA+TaEkK5V8a1Y8nSW+EPaBR9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(1076003)(186003)(107886003)(26005)(6512007)(2616005)(6506007)(83380400001)(52116002)(36756003)(6666004)(8936002)(38100700002)(2906002)(6916009)(54906003)(38350700002)(6486002)(5660300002)(508600001)(7416002)(66476007)(66556008)(66946007)(8676002)(4326008)(316002)(86362001)(103116003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pn9n1eZFGvzsZ+ZSdJD4sXNjAGDGP7WKVwUlfqHjDgiPt5UUrgQXjmc3PrHP?=
 =?us-ascii?Q?vAaNWHbtH6X8V4Jcqnm/W506U4ShL1Tv7EWFD3fWoaLj3mx9LnWZ6SZ5tbKj?=
 =?us-ascii?Q?6DkaoSYoan7ZSkpnrSS3uEgLPMLIGJKX3Jcm+QWB9zzsb741r6nKi+i002dk?=
 =?us-ascii?Q?pOwU7tzrGVmzCpSfH6APjs/oxzOefV0pvh4Y/aj4USEqPnL79580nfFL4IFk?=
 =?us-ascii?Q?beBY1KT7UwQQHELSPn8z3MrZ8BnWEOPXixWMVqRHME7qHFKy/bfWj2vtz2gU?=
 =?us-ascii?Q?59Ld38QQiE9x57vSdweDb7xzBI8ovoVoeShkN9NxmfMZhajUaz6VSkIsu5s9?=
 =?us-ascii?Q?h1ckn1QqVbKb/89su05NpAVl5f/Tj/CaHKmao9FvKKJV6m2Hee4r9e+PYV5m?=
 =?us-ascii?Q?WWn9sOoNsWIcdK9piBO0EfialiwCcGEPLxylt2lShTUujWsWm7otMfFD7Aad?=
 =?us-ascii?Q?gZfoJ6VhsZC3SYxdIeQB1xVIdRk4wbgsQPAoX32/A89XP1auya/ocPY9Ws/0?=
 =?us-ascii?Q?kXzJkTLR7G9+i/K5mCvw+Vq4kV4f+HhxZmVTxyqGyHJefy653UN5Ipk/UEqR?=
 =?us-ascii?Q?SPVNZThLPWW7KfUnLhVG5lAkWjTxY7DQwgb/VypJPCJgzar/p2EoE7lSJMa+?=
 =?us-ascii?Q?uCO3/5qlm7vdqbfAU38lC2tzn3+YP8cmazqvak/1ziwXXUn0e+zRBpO8MvsG?=
 =?us-ascii?Q?eJBWilibS9lyvyTAM1VZ8d1+fQwAkM0Yy1fJa1nSi9cspMRJsDfxV1YkxUff?=
 =?us-ascii?Q?IAQ2lEwkXG2XpQuqSZi8Sp66VeDt/hajWAL/PZbyt3u/bTSad2zcfbJtgQRj?=
 =?us-ascii?Q?Zof4G4qFFH7jLvg6zrYcbf27yUo9IDToUz/cCggcViAAADSzmjEUoZSFxMaO?=
 =?us-ascii?Q?C0NvF1GAwNCm/R4x/Xm8HWt10cTipGjHlknZnUveBNKwcYrsJPC9krm0muGB?=
 =?us-ascii?Q?m1RgnH8sV60lM/JxInze3us78GZmQOd0VwxZNtmQQEsVm0CV6izi0FLaMYTI?=
 =?us-ascii?Q?56+oKubb9IFqOjKwjuBcnWIpZ/IAKhZ2JOvVpZKL/urr/BdSmW56FyKc/OXF?=
 =?us-ascii?Q?51XQpugKBFK5pqPZwmOc0F2ZIuLYXFnU8C0lqauiwOb+tJ2eKnHj4vowQxY7?=
 =?us-ascii?Q?xuBIwlhwU7As5mW5iHePG+0OEWKRfHDp9QCDYkUex2NEW/F+jTYr56gegkZp?=
 =?us-ascii?Q?Dgw84Ixyu4fbbS6i6Qf7bNl0EcUTtdgItGmUPGQhgPQ5nzx2m5bLWKaSHrSj?=
 =?us-ascii?Q?7SLIerNhzDEfE6/i+mzPMxy6eV2NuYiZ3IG+0ldbVIVs3u4q2zQczd9ZPH5x?=
 =?us-ascii?Q?V6xhvJ1tkNfvTCe07DcfQxQKSX0jvrZmB6UGHyEmkxJAG0OKMuyWriI8w6hB?=
 =?us-ascii?Q?MHiKNz3nj1Nqj3ak8nGnRHYju+W3/oJgVRXJNsB0CoMqayQiSwui0aYM0WEr?=
 =?us-ascii?Q?p6mj2808u1gO4VLal6XUhfaY60799g4NRGweK4r3mn0jp6XuP4L8xVxCaIDH?=
 =?us-ascii?Q?PE6znzFSMHtMPm+Ar7hNGe0A9yk7gbAr7wzPQb5LT5Knc/Lids2nZ/WR7IWr?=
 =?us-ascii?Q?IESARBYJy5qZeSIe4D0IVVK+b+bZYsW/Yoan9afuYNVPEgJH5Q57XWsu8ymb?=
 =?us-ascii?Q?g7+Qhq8r3Yi6NLwjk6Dp5SrFTQvgrkaIHbej5fPhZfCos5EV8DK2R/H7YoDX?=
 =?us-ascii?Q?EwUAPaymbHVZ/mlmORRL1l/RQBn76ctTlYUzEvO8DFkU6FnzUy9Ah5ndnxcI?=
 =?us-ascii?Q?V65niAZaEoSfcZw37ckDV/zhUT/rMvg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb7f643-2f34-434d-21f0-08da230a02f7
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 20:11:53.3991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dCd663M4EAkCUEbmlplxg05EuscMStwmddlPDwkd4UkDFH6KmjFnLOl6vNRq+6DzcPDO5v7AyVCdIAcedMTjZLvTWWVOksXvph0fq4EbyGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5644
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-20_05:2022-04-20,
 2022-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204200119
X-Proofpoint-ORIG-GUID: mE3PJIN5_nIEYzwy-uoTDW_osH7duCeB
X-Proofpoint-GUID: mE3PJIN5_nIEYzwy-uoTDW_osH7duCeB
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Joao Martins <joao.m.martins@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than hardcoding the 4G boundary everywhere, introduce a
X86MachineState property @above_4g_mem_start and use it
accordingly.

This is in preparation for relocating ram-above-4g to be
dynamically start at 1T on AMD platforms.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/acpi-build.c  | 2 +-
 hw/i386/pc.c          | 9 +++++----
 hw/i386/sgx.c         | 2 +-
 hw/i386/x86.c         | 1 +
 include/hw/i386/x86.h | 3 +++
 5 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index dcf6ece3d043..d8d4c4a7ffc7 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2071,7 +2071,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
                 build_srat_memory(table_data, mem_base, mem_len, i - 1,
                                   MEM_AFFINITY_ENABLED);
             }
-            mem_base = 1ULL << 32;
+            mem_base = x86ms->above_4g_mem_start;
             mem_len = next_base - x86ms->below_4g_mem_size;
             next_base = mem_base + mem_len;
         }
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 23bba9d82c12..177d98164bdf 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -838,9 +838,10 @@ void pc_memory_init(PCMachineState *pcms,
                                  machine->ram,
                                  x86ms->below_4g_mem_size,
                                  x86ms->above_4g_mem_size);
-        memory_region_add_subregion(system_memory, 0x100000000ULL,
+        memory_region_add_subregion(system_memory, x86ms->above_4g_mem_start,
                                     ram_above_4g);
-        e820_add_entry(0x100000000ULL, x86ms->above_4g_mem_size, E820_RAM);
+        e820_add_entry(x86ms->above_4g_mem_start, x86ms->above_4g_mem_size,
+                       E820_RAM);
     }
 
     if (pcms->sgx_epc.size != 0) {
@@ -881,7 +882,7 @@ void pc_memory_init(PCMachineState *pcms,
             machine->device_memory->base = sgx_epc_above_4g_end(&pcms->sgx_epc);
         } else {
             machine->device_memory->base =
-                0x100000000ULL + x86ms->above_4g_mem_size;
+                x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
         }
 
         machine->device_memory->base =
@@ -973,7 +974,7 @@ uint64_t pc_pci_hole64_start(void)
     } else if (pcms->sgx_epc.size != 0) {
             hole64_start = sgx_epc_above_4g_end(&pcms->sgx_epc);
     } else {
-        hole64_start = 0x100000000ULL + x86ms->above_4g_mem_size;
+        hole64_start = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
     }
 
     return ROUND_UP(hole64_start, 1 * GiB);
diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index a44d66ba2afc..09d9c7c73d9f 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -295,7 +295,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
         return;
     }
 
-    sgx_epc->base = 0x100000000ULL + x86ms->above_4g_mem_size;
+    sgx_epc->base = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
 
     memory_region_init(&sgx_epc->mr, OBJECT(pcms), "sgx-epc", UINT64_MAX);
     memory_region_add_subregion(get_system_memory(), sgx_epc->base,
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index bb6727279097..2790250a0457 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1305,6 +1305,7 @@ static void x86_machine_initfn(Object *obj)
     x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
     x86ms->bus_lock_ratelimit = 0;
+    x86ms->above_4g_mem_start = 0x100000000ULL;
 }
 
 static void x86_machine_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 916cc325eeb1..86de493c39f0 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -56,6 +56,9 @@ struct X86MachineState {
     /* RAM information (sizes, addresses, configuration): */
     ram_addr_t below_4g_mem_size, above_4g_mem_size;
 
+    /* Start address of the initial RAM above 4G */
+    ram_addr_t above_4g_mem_start;
+
     /* CPU and apic information: */
     bool apic_xrupt_override;
     unsigned pci_irq_mask;
-- 
2.17.2


