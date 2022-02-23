Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A004C1B48
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 19:58:12 +0100 (CET)
Received: from localhost ([::1]:46788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMwq3-0005O1-CX
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 13:58:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nMwdz-0002pZ-A2
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:45:43 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:51824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nMwdx-0008DJ-FW
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:45:43 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21NIDsLe001897; 
 Wed, 23 Feb 2022 18:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=OXyIZvziI+CXRfN+/RMx9WF7EAQPNHxJpygpgcJz75w=;
 b=M6O3cGfciu9YToxTdfZCAnWStofLMykfwhUQYLY7JPw0NWEtondebwYSz4O027i2S7Xl
 gvD57sfRu0mbkpm6DnEZoS/v8zSYDqdJaRD7GLbX8AYmioUL81Exi3YjHuoy9rB2lwFR
 IKvEvUOtMbyRUpzTs6KxbKD6P1/1o72hbVvQDjHYCo9XWjBlWMhxMcRvfd/E1CLxQ8sS
 +sZpkEBCZWs1qKz/S6GngWM7jN1xxstsEHW4zUibzlL2dI/6xGHsAvXj8NQSljD9OEd/
 pW4j+9QHgKNoF57FNSgXHZp8EpnWNUELJx6Ph1SitRwdaEsDBxVzCD2WrdDJRbqw3NP1 hA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ecv6ew15s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Feb 2022 18:45:37 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21NIav9v048623;
 Wed, 23 Feb 2022 18:45:37 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by aserp3030.oracle.com with ESMTP id 3eapkj2dk1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Feb 2022 18:45:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NlGWGfj2uSsLychVgc7fXJuB8bPak7fZCUaUA4BDTijh7nVYeT6WWk6mXSzu5B0JXES/0kH76zIQN3Ut3xNFNYSICOPoKwSv4SCCA/00wLKEvzU2kltx/XaEh+/zbneZDklMW+lPRARQ9dvPzCMBJd9h47OV/azrY1lWsnQIjocXUEFi3/AkJaJLq2N7RThdTQc+aC2O70Eace9tYwSvrvzDn9QTORJosdlxNHPUt1I0iZnCY6VJxe/6DJSzCptaLnsZccdndqtUqndEnySGI+rsZsWJDV6GbAB3H5B3YngkmocGYMhob3xvrLtqZ9vYXmdod90/LNEL41eGFLHJzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXyIZvziI+CXRfN+/RMx9WF7EAQPNHxJpygpgcJz75w=;
 b=krx79BG0qkv2aqEVJ+7/boKKcV1L45vyE/+e2Lt+/R71fZFs+0aFqiPLO3nJF30ff+LC2gMu4WmiDDWpRVLmUUNJKYsjK0P7oKGzDlraW2D7JiQfgs5MB7H7WAYqvc3lGctDZd0GlLN+ABJn4iwXY52I8r88W3s2RKzvX+VSeXSLVQYQdz5Iowsc5x1UgPwws+KT8RV11j9xWDYYqrR1MIOSqTMuZ9bYUiDSPBigGUj4UPXQskt5JCkmhxCGNraXkFuHDJJrJVRY3Oik2N2ILXG9nkXZgnxxKaYxFnqbwYLshf/DWDlnF4aoLIH7Mwt+Wh0jgkysh6rO9PYi+cIw/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXyIZvziI+CXRfN+/RMx9WF7EAQPNHxJpygpgcJz75w=;
 b=Yv5eLsAbZVN0VBZmhDcps3Ui2B6Nic/imK31wsTlbX4MKUFSA/Ktr4/AxYmej3OlHK2zjwMW3xhnrgcQPPN/98pDBBtj1gnT2k85trMNzHeV4POM2i9oXJOXCtrI8c9u4AM1qhyIBrbq3GDWwArZGtHxWvaVJYucJXFczLzJ09s=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MN2PR10MB4144.namprd10.prod.outlook.com (2603:10b6:208:1d6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 18:45:35 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406%6]) with mapi id 15.20.5017.024; Wed, 23 Feb 2022
 18:45:35 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/6] i386/pc: pass pci_hole64_size to pc_memory_init()
Date: Wed, 23 Feb 2022 18:44:52 +0000
Message-Id: <20220223184455.9057-4-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220223184455.9057-1-joao.m.martins@oracle.com>
References: <20220223184455.9057-1-joao.m.martins@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0332.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::13) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d843421f-e12f-43f2-dcb2-08d9f6fcad50
X-MS-TrafficTypeDiagnostic: MN2PR10MB4144:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB414435D746DF4D4189A9A895BB3C9@MN2PR10MB4144.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Qpr1/ZDtuZqR+1AgvGDVcQzBUp+rDt2j4tlO6O3PrCw07L2jf60I6bSufPyj+8cfVVaZpnpe/lrNGdrhhDRKoqX5SbBpfVkQoO0x0iiol2a9sWLh7npH6iXqczBd4Un432pYEhUdWe9C3vqOVsxwa01CDds8LT7y2iCWrxFBzxUNpSZ+aKNwqBkG9txtgirgjwtBWCUBpkf5zitNkKepcisHj1f5NSNuAXfkzck5d9470dWwFlq2gXdRUkRchqPiwngUL0s5S7SqA+hTu5C5GvN/ITFoNd0/7lDtMx10njb0J1VN+xWpi8GDi4pmMUzIvsnUxyuYR8eIg/tW2PWhXtkz+T/NmsGA8dBwVeWECRaffP973lX4aX9MyJWqaWQe2+TUzrkePBvHgoJyfTgknLJ3+aHGbBCoACsRrZkPCMTBCEwxGsjOYYvVk6wxvfRHhhn82HcOMXFav1o6pD0V45MPJMfgOP1rYU4tPyn8V+zotg6DgFQs4Mje5pp/ZWLNm0oct2xtL5jO/YUmh9vyOzYaP+C+jCAG+riBYMPxUHbjcEMunV3CUMJZGIZL8ikyxn/RKB1AwQapCrYxvzk4dCKoMcgwWI5xnpuD5BeB1QLCwzjgiY16r+/DYgolRM1jjAfJ8N65xNQ8gbZkY3pcidWsjYutP1n56kUOxU0v4pMVcf0bGrXZMwHzizUM6tZdSkryZF7FCOGYD+SU5wLvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(6506007)(6666004)(66476007)(66556008)(66946007)(83380400001)(4326008)(6486002)(103116003)(36756003)(316002)(2616005)(7416002)(86362001)(38100700002)(38350700002)(8676002)(8936002)(54906003)(6916009)(107886003)(1076003)(186003)(26005)(52116002)(508600001)(5660300002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q/GEmUQQGh2HNyUg8zl9BNJXOTPlSycJtH6+7exm11snE0ntNu3PMbISIhMg?=
 =?us-ascii?Q?fuuPH9Fz6pweujWDXb/wU283VE/9KDnFjggSuZcn9USLRsrVm2zToM974K6S?=
 =?us-ascii?Q?4dUj3iH8SWQT9rf9JeCTq1ww6dX0tfVaxh7z1DV5goH5dJ3fAqfT0HTBy3+i?=
 =?us-ascii?Q?fLkQAWAZv+3cyD3QMyqVMsvbM9ste/WbVLkBiEyR6PCBE6IgcFvyUN9MeeCB?=
 =?us-ascii?Q?i2gWlPu8rLVP/y2DOvAduI5GXOevYtyrsObufMo7HgzWB5oYGQ6jnNpmKFgo?=
 =?us-ascii?Q?EOifpnxyijrIOd7d/3k4T/5wL9XGfMqLZPkFAThAtmF8LnNOYkApUgV/eG9y?=
 =?us-ascii?Q?LJeB+wT8kVoFSc+4Ckxpkr5Z19xNR7jQUvXQ54/Dc6jtYNDnVRK4WETmi2z9?=
 =?us-ascii?Q?v5N75CW9mPxQHNdvuX9/jJadzkiEWlnRhICljIKWM7DW6BVOLu+Saq/f4+4l?=
 =?us-ascii?Q?U0HdahpUQVOYt8kapwv5SO+kTxc38+Qvs//pVss5y/uVsXcpuiUXALYI7VED?=
 =?us-ascii?Q?QTpzzs/pH8M21l+dD9SJys6ajhzgLN4tVX0xUmxkufB6EVu+cojCF8QwERr3?=
 =?us-ascii?Q?ZBAUGdhP2nBcFdrUpYm1vGTDeevTOHnJ0PyIsEpRcqGa/pUKivNJrzERShbx?=
 =?us-ascii?Q?u7P3K+ZwEpDhJ7bsrzTZrZoryaOVaAHHcT9ZeAgMSZojmd4dPNURC27mN5uL?=
 =?us-ascii?Q?HoRuZlCe4XkUe5nvrybr5IvWLvf2kfjP0JkzafEX69rOTjjXmR1b8JmJWPdz?=
 =?us-ascii?Q?q1Hp0J6F9EtCZW/adXc7Pf4/er/OvsOlPTatahUYpbEO5+LN4UcWCPSQn8sI?=
 =?us-ascii?Q?hgtCWUbhHbkOkInGgGY31MDsucSSq2Yfv0dUnlrjnRaBvfMhxWM0MoPZrUTq?=
 =?us-ascii?Q?Btz6L21XFNiWxxK0ytmQ9SBGyeSSkh/ElfmlDsoqU+2iiOsZmt37C74hs/Ei?=
 =?us-ascii?Q?uMBj+Y1w4s96vieCpML9BkH3qh2tnRdDajbECHgM+/8o8M+EdjJ5XsCLU2pI?=
 =?us-ascii?Q?F2+4PzUuQYRZ2+WqHw1Yo2okH+qPjYn1itz1ox+ERhKdLlucY1K+AnxMxnjC?=
 =?us-ascii?Q?aSBzmS3sUJ9SUsvEDcc8qgmHbZdAw0OAA3xxM1ITbiflP36n/QTVvhntnSY8?=
 =?us-ascii?Q?gmWeQrgRDkxXVRcNR6WxF6oFkDxpQWlZOBuXovKjmitO2M2HVbTL7bZBrBgt?=
 =?us-ascii?Q?IpKAjh0ddRVb2bwCemMJctrf9v2hmmQtcBy0INGU+0l9iBS1Q92Ttdg2/h3g?=
 =?us-ascii?Q?Iq9wGpbN1c53tTc4Q+npMJkJQqJdViNrkXL0f4sSm9fT5ADMbpRQU1UKoAn4?=
 =?us-ascii?Q?EMSBLhbsxovCuGI8tTB6WkxZ9ycTek6eoFVoq2a4zGptCYONqfxSUiULqVEE?=
 =?us-ascii?Q?mfPd5yjVBAsylLeAval9eqSluZy6OpQBHKIwcRx3kLmd+wEBu+sekAr60UNP?=
 =?us-ascii?Q?Qsz1ZQvAB2EOb3vzA29GE8iEJvvaIfZVXsSRg+p4yeQPTCzNF0qxgnYkmvPr?=
 =?us-ascii?Q?OOAsQyN4oMGmq59+J77eUBT6oEIm7yWGiFk5I7Rm9URI8LKMys2DDU46Wayy?=
 =?us-ascii?Q?7IG/jIT55p3x3mZGv2KGIfDAPya0Hy1ufEZ0ykfW0KifosOWn+0IE0zSlZRO?=
 =?us-ascii?Q?Dw/A2HMEwIgawGjiSSfg0ujLRjop8q1gwkG3QUHU2utrlVjOtjI3QPnJ9dwW?=
 =?us-ascii?Q?ennAyQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d843421f-e12f-43f2-dcb2-08d9f6fcad50
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 18:45:35.2084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mbrxeY3AQZb7tNHDqv91kFyu1oAgovoHf6yi+cTCr0Og7gcqA7z8VB4WoPY+tqaxJ4TmtP+56qRQwbpR+XlHR+kJmYBsAacVO2Av1vnlGZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4144
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10267
 signatures=681306
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202230106
X-Proofpoint-GUID: YZGvRjzrMwTsnPtGptsHKrEDlo3lB7iE
X-Proofpoint-ORIG-GUID: YZGvRjzrMwTsnPtGptsHKrEDlo3lB7iE
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

Use the pre-initialized pci-host qdev and fetch the
pci-hole64-size into pc_memory_init() newly added argument.
piix needs a bit of care given all the !pci_enabled()
and that the pci_hole64_size is private to i440fx.

This is in preparation to determine that host-phys-bits are
enough and for pci-hole64-size to be considered to relocate
ram-above-4g to be at 1T (on AMD platforms).

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/pc.c                 | 3 ++-
 hw/i386/pc_piix.c            | 5 ++++-
 hw/i386/pc_q35.c             | 8 +++++++-
 hw/pci-host/i440fx.c         | 7 +++++++
 include/hw/i386/pc.h         | 3 ++-
 include/hw/pci-host/i440fx.h | 1 +
 6 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 7de0e87f4a3f..360f4e10001b 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -805,7 +805,8 @@ void xen_load_linux(PCMachineState *pcms)
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
-                    MemoryRegion **ram_memory)
+                    MemoryRegion **ram_memory,
+                    uint64_t pci_hole64_size)
 {
     int linux_boot, i;
     MemoryRegion *option_rom_mr;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 9ff49e672628..5a608e30e28f 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -91,6 +91,7 @@ static void pc_init1(MachineState *machine,
     MemoryRegion *pci_memory;
     MemoryRegion *rom_memory;
     ram_addr_t lowmem;
+    uint64_t hole64_size;
     DeviceState *i440fx_dev;
 
     /*
@@ -166,10 +167,12 @@ static void pc_init1(MachineState *machine,
         memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
         rom_memory = pci_memory;
         i440fx_dev = qdev_new(host_type);
+        hole64_size = i440fx_pci_hole64_size(i440fx_dev);
     } else {
         pci_memory = NULL;
         rom_memory = system_memory;
         i440fx_dev = NULL;
+        hole64_size = 0;
     }
 
     pc_guest_info_init(pcms);
@@ -186,7 +189,7 @@ static void pc_init1(MachineState *machine,
     /* allocate ram and load rom/bios */
     if (!xen_enabled()) {
         pc_memory_init(pcms, system_memory,
-                       rom_memory, &ram_memory);
+                       rom_memory, &ram_memory, hole64_size);
     } else {
         pc_system_flash_cleanup_unused(pcms);
         if (machine->kernel_filename != NULL) {
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 2881afd75a82..c81d21d1ebb4 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -138,6 +138,7 @@ static void pc_q35_init(MachineState *machine)
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     bool acpi_pcihp;
     bool keep_pci_slot_hpc;
+    uint64_t pci_hole64_size = 0;
 
     /* Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
      * and 256 Mbytes for PCI Express Enhanced Configuration Access Mapping
@@ -206,8 +207,13 @@ static void pc_q35_init(MachineState *machine)
     /* create pci host bus */
     q35_host = Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
 
+    if (pcmc->pci_enabled) {
+        pci_hole64_size = q35_host->mch.pci_hole64_size;
+    }
+
     /* allocate ram and load rom/bios */
-    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
+    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
+                   pci_hole64_size);
 
     object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index 5c1bab5c58ed..c5cc28250d5c 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -237,6 +237,13 @@ static void i440fx_realize(PCIDevice *dev, Error **errp)
     }
 }
 
+uint64_t i440fx_pci_hole64_size(DeviceState *i440fx_dev)
+{
+        I440FXState *i440fx = I440FX_PCI_HOST_BRIDGE(i440fx_dev);
+
+        return i440fx->pci_hole64_size;
+}
+
 PCIBus *i440fx_init(const char *host_type, const char *pci_type,
                     DeviceState *dev,
                     PCII440FXState **pi440fx_state,
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 9c9f4ac74810..d8b9c4ebd748 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -158,7 +158,8 @@ void xen_load_linux(PCMachineState *pcms);
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
-                    MemoryRegion **ram_memory);
+                    MemoryRegion **ram_memory,
+                    uint64_t pci_hole64_size);
 uint64_t pc_pci_hole64_start(void);
 DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
 void pc_basic_device_init(struct PCMachineState *pcms,
diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
index c4710445e30a..1299d6a2b0e4 100644
--- a/include/hw/pci-host/i440fx.h
+++ b/include/hw/pci-host/i440fx.h
@@ -45,5 +45,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
                     MemoryRegion *pci_memory,
                     MemoryRegion *ram_memory);
 
+uint64_t i440fx_pci_hole64_size(DeviceState *i440fx_dev);
 
 #endif
-- 
2.17.2


