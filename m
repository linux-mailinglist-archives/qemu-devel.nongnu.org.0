Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5C24ACA6F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 21:28:49 +0100 (CET)
Received: from localhost ([::1]:38292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHAcy-00077V-Fq
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 15:28:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nHAZA-0004Pu-15
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 15:24:52 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:27178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nHAZ7-0001uN-I9
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 15:24:51 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 217IhmU9011786; 
 Mon, 7 Feb 2022 20:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=KN4k+7iaJ1yH/YKjZNo8y6/W07GwzLgBwWIVP3Lov/8=;
 b=bxYs8mF2Uk/gjzVD4CqnXyN9s6a9s5HHnLLo+ZZxI/1ZRlOMp9DYgZoJHeJo9OmKuwve
 IwRcI6PuR46B9hzO7dM049OHuXZoFQhRhSg1qHJdMI9WPBlqo6DGV8juWJlLJtiPAJWa
 SR776+XP4sIJ3PxLuyzN6pG2P8LpVE0rZD9v0+PLst0jHvfjAIZNkp3JXg28+NZsq8QR
 Ibq509bbABjQcvTuD4YM/nUV9OpCCAgBNFAAAK1f3yYbe0XSWo/clm6pkPEsp6kXr5RZ
 EY7+DZmntkhyWlLIIdGXPu8tPMNlK21TpJzIjK0WoRLp9PUxa+bT4TFRI84CGRG9rrXr GA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e345sh72g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Feb 2022 20:24:43 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 217KLi8C169415;
 Mon, 7 Feb 2022 20:24:42 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by userp3030.oracle.com with ESMTP id 3e1ebxpwan-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Feb 2022 20:24:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VvD5rL3FeQohXsI0GB62kh/NI4JCN10mvws6HbBXM2yDVl0rOvpQgNp28RKF9w+LSKMRkIdsNTGDXqFwm2GRn8zLko7JdiV2Gm68MMDaU7aJ8ycIIfNUbNiWmetx/c6cq2nQslTA1BpXYvXBVTdb+IZw6A6aaA5uIrBvKvgunlx1VzYbRKZmGBNOU9mMdjGGFzFKOjFtuY2LS8wuOVv03pIHTYNZQr521VG8IAqMPe5q243wQy7jJF7Pcu8s37jComYbbfCw6H3geFLhFE2zIwt5gtQu0byAXYuoCUjwG2xrC3cp8bH96JBX5Df/PbDaS8ahlmF83EswYMHEiShBjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KN4k+7iaJ1yH/YKjZNo8y6/W07GwzLgBwWIVP3Lov/8=;
 b=Ede/mwMSERJgOHyIhywhfb1O5ROr0CvfYWWLc+PbWIbp1LrWHepym77vUEmrZ8VtLU1ekrxBYnSJMQIWCigTPqpjG0NXTCpTR/sqZf2UfHjVu2NaddoBsDqU5D07DasM37FnVoQ/0c0eT4SJ6BmHV/Fhaht8B0GqvIFmDB9iWvMByYPoOZhDdyq3QyKV7j2uex/c/XvnO6h6u/jLOUek8u+NWSjctROCAPU9ALcStouwEooaOGfNqmr8TDcQbsKK4FF6CVUtK7ENEZ/DBCmbwoZvpDtFFzPStLSyrJO0xu8Ouui0gkTPI2y8YJv2Vx//MpRhg9Myx6PDPZxUrtb1xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KN4k+7iaJ1yH/YKjZNo8y6/W07GwzLgBwWIVP3Lov/8=;
 b=HkiXSQLKi773DWk8yroUae18uAcPOqh5VXqMjykh0TKNy6h00CGFwkLQJr7rHQPmH3Y+7bZBk1NAvd57gnG5b2wJ7PskCkwXarI5SlBs02xCd7dUupZpVWWlj9TaIQWV+YFtOTJ0zK7NP+haoTUJQdTpAeXjz/JfwUv3/Zr5vww=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BN6PR10MB1826.namprd10.prod.outlook.com (2603:10b6:404:fe::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Mon, 7 Feb
 2022 20:24:40 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::4910:964a:4156:242a]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::4910:964a:4156:242a%4]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 20:24:40 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFCv2 1/4] hw/i386: add 4g boundary start to X86MachineState
Date: Mon,  7 Feb 2022 20:24:19 +0000
Message-Id: <20220207202422.31582-2-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220207202422.31582-1-joao.m.martins@oracle.com>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::18) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: caf377af-d675-4feb-ddb2-08d9ea77de41
X-MS-TrafficTypeDiagnostic: BN6PR10MB1826:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB1826D5E134C3E3ABE36515B9BB2C9@BN6PR10MB1826.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0UOk/n00aWhpitHQfNnxCQOCkyCfEA2o5AOLXvxSOni7BmZG8GpQPuMmhnKBmw7A3ZEH3r15tir/NBvBzolvCxIoOIE/4dXq2eLwnJywYYKFHdZ3aYfvY7HRBfJ1gw6x3DMWLXtYyfI8OletFo0imxC/FNbkUFeFy6zFH2vHY78f4Xr1cUc2Ywdv2fhH7xRKQS8K/2SeCF8G6Yy9K40P925JJNRo94S5MeviNK0/4/rnposzcotLXOAcE3hJQow6UB+MP7evErfGOAe2vLU+IvnDLlm5ixm+zPoPUFmGg3czCIWnuj0bjFEUjLBgjWK27Wp76NhAqJPLfJPfsnRAiXUQqc+KHFZmyhOFKqmGnyVN3adcgvNP0VuijWtyJRM8J4SfNmCU5AM2K2AlzY6wuqfZKmLoAj5wfQA2poVxtekGjrYEkiYlNdvpfjlWjp0ASmvN9UkG6sgfO1tpJ4Vlx8BnbFaefQ3kYw7HjP2tKe7k5DyY/RLF+3WcGXIl/kDkje4kImZV2cy5SFkVxjTI8Q3VkSWjn/vB9+vX0cIWyzJeitG0vlOY/wSoBPNiTYorebgcNk0iwe5B+r/0waXiWx6K0MvEZwGbwoqofEPrMaWqOI8N6oyCU0B6jBjTOeDIHTjOAVjRTLk2K40jPF6oNQVqzlLEMRFkY7WZ0eVTrkrxnlna6X+fhPjQwOUnOoLY4BtMR+Ot5ByqkDwM3W1WaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(1076003)(186003)(2906002)(26005)(54906003)(4326008)(6916009)(8936002)(8676002)(52116002)(66946007)(107886003)(66556008)(66476007)(316002)(36756003)(5660300002)(7416002)(83380400001)(2616005)(6506007)(38350700002)(38100700002)(6512007)(6666004)(86362001)(508600001)(103116003)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TvOqiTti8prd50b1tRu6zNhBGKJ+Q6php4hHGx4pooj5dH/GYUGpIvm6mNIM?=
 =?us-ascii?Q?BSr2SbIO1fEtqrCZPKqkiXJuA+k014Dvk2onNJU2xxF926Kfr5dLor70NSs1?=
 =?us-ascii?Q?QvMM/KwrrWpKYA5uboUBjgEMccnwXj76CF6QbXSdRZZzWzFwlauKsb0AuGjT?=
 =?us-ascii?Q?V9ThjRxL/W+1c8O16OeuMKmSdFiDf2yHicFhZhaN557wexcspxhl7tnVGBiZ?=
 =?us-ascii?Q?9680RJ/Tb/E8bUShSPZgJRL1CMQD6ZF4/x3v+lTLesBQlTFCJk6VhCwPyTGI?=
 =?us-ascii?Q?llMBGdktgJAoYzVa0eUWfKBeTaTNwoENyAtLFMqJN4ji2t06g//kZ4xr86pJ?=
 =?us-ascii?Q?/Kg0nwVpyLNNYNs/lqMH4La3OLN9k+luG7YsmAui85IYoLyQ23c15sCZXVYZ?=
 =?us-ascii?Q?AGaevmacFegc2XGBAq02/e0AY59kVM8ynrcLvmFVqrEnJgFRBxH83A1bt31Z?=
 =?us-ascii?Q?jFXO8BuLMu6x8BFd09MQOABvhiJagFmRDQ08iOd4qIoeqDNBGrsEUIZNlaNB?=
 =?us-ascii?Q?Sh1jz4CMI8LePLI82BDhqH0DVUZ9AjjOXEebt7LJbFGnri7N6c5/Qf0FfyFk?=
 =?us-ascii?Q?2j1F8XgMT4YXxazOosi3UBY/W9Z2jlONvxeFoiWgJvncsTQ4Pqk2NQK6+b+J?=
 =?us-ascii?Q?Ik189znrXtwmNIuS6yXKdM8QYaYvX6hwbrKQe8+Tm/RNFUc7mo1m19RLIdJJ?=
 =?us-ascii?Q?G+XlM7uZthLJ9CC6ttHxoFuH6Dr6qb1dkm+HOSs2PkaITeZ378CwnnnE4caz?=
 =?us-ascii?Q?W22izFKI+HCAxrbPD5Uh50GoDgFnUWCvqiua2KyhmX3TxcWcL9yKMdFtOvmt?=
 =?us-ascii?Q?tFVtWIPcWwQ9v3rSQnRczx3biBdffa3e8DJI7bfWX8ySMZtMEJBFb9d1xX3P?=
 =?us-ascii?Q?MSvmYVnfPyTzkxZUKdJBywE2zaDhlVz0rUenL0BvJ3RtHpMo06YZZLhMIv+W?=
 =?us-ascii?Q?B3xr6CQQh1BNS8rPzYlyh1jQlhS57ruSgNNgJAvFhngbrxF/ezQroryLCsHd?=
 =?us-ascii?Q?aXxB05VrirPj25mAJf54CNLNLXSHq+v34cicpCmfIP5wkvaU3GkLqVPpEpDi?=
 =?us-ascii?Q?h8fssvtNJLFOOgRv1XTFDGNxdpHQuIUDtcvW4eML94xRAvXDsiTN5OyhYGkc?=
 =?us-ascii?Q?iUvlu5PBxEjdMBH4Wht+K6aR7+jrsjDjQE6I44eqjedyLLspxVqJQAJbKeY1?=
 =?us-ascii?Q?HZKOGnY1IfgGT8U8IPT9AXrCX61PGw1diHcAl0SC3wn+YQR6biB8AOoK11Cr?=
 =?us-ascii?Q?P/ge/roYAhD02JeoL+XF0LCfmGDtnUj7Wjt6nD/+Nm+OAdFiGkMUMfX6EsNh?=
 =?us-ascii?Q?09HKlU1y+w2dBc29K/4wQAZdkIzYa1WK4I1Tj4q9CLnCJGHuHb/hCLaDEysU?=
 =?us-ascii?Q?imLpciu0oSvCC4PXo7mDb5oAZCje474Vdk/POsrE4FKHpGQ2vNc59sx7DVLz?=
 =?us-ascii?Q?+tL9atwWnrcsy5VBrzI3DMQGq2sZf1mcE7RNUhdjbWUCkoCe9SjlKkWrXW4t?=
 =?us-ascii?Q?aePNGCv7wdTHRtsF2hHi4+VCdczPUkj3GCK7ODWog/ozsY2mKYM3lHeMPUwR?=
 =?us-ascii?Q?0+Pt9k/Yyzaw2VHGZauxOmRGimxVQT6V/5HammXWmJp8ooJgQXlBPFdjk31O?=
 =?us-ascii?Q?kmUgWTjwGf7w6+mMXE7ZAcM6HwIH6C/eqebo098g6y32xLE59ibIEwjpOdBK?=
 =?us-ascii?Q?zNouGw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caf377af-d675-4feb-ddb2-08d9ea77de41
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 20:24:40.2376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +g14awVxyUA+8ELn1XJfTiS4SQgbUNEn8y8mrop0wzJhKBND5rVEBNuXmsPlJNhGkOQvW8OphzoAzSLE5oLfxWwHss9BTeGdS82WSrSJd5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1826
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10251
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202070119
X-Proofpoint-GUID: -tbgJYL6UfYrSQK_7glrW9Y-f01KAka-
X-Proofpoint-ORIG-GUID: -tbgJYL6UfYrSQK_7glrW9Y-f01KAka-
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
index ebd47aa26fd8..4bf54ccdab91 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2063,7 +2063,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
                 build_srat_memory(table_data, mem_base, mem_len, i - 1,
                                   MEM_AFFINITY_ENABLED);
             }
-            mem_base = 1ULL << 32;
+            mem_base = x86ms->above_4g_mem_start;
             mem_len = next_base - x86ms->below_4g_mem_size;
             next_base = mem_base + mem_len;
         }
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c8696ac01e85..7de0e87f4a3f 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -837,9 +837,10 @@ void pc_memory_init(PCMachineState *pcms,
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
@@ -880,7 +881,7 @@ void pc_memory_init(PCMachineState *pcms,
             machine->device_memory->base = sgx_epc_above_4g_end(&pcms->sgx_epc);
         } else {
             machine->device_memory->base =
-                0x100000000ULL + x86ms->above_4g_mem_size;
+                x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
         }
 
         machine->device_memory->base =
@@ -972,7 +973,7 @@ uint64_t pc_pci_hole64_start(void)
     } else if (pcms->sgx_epc.size != 0) {
             hole64_start = sgx_epc_above_4g_end(&pcms->sgx_epc);
     } else {
-        hole64_start = 0x100000000ULL + x86ms->above_4g_mem_size;
+        hole64_start = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
     }
 
     return ROUND_UP(hole64_start, 1 * GiB);
diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index a2b318dd9387..164ee1ddb8de 100644
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
index b84840a1bb99..912e96718ee8 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1319,6 +1319,7 @@ static void x86_machine_initfn(Object *obj)
     x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
     x86ms->bus_lock_ratelimit = 0;
+    x86ms->above_4g_mem_start = 0x100000000ULL;
 }
 
 static void x86_machine_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index a145a303703f..2de7ec046b75 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -58,6 +58,9 @@ struct X86MachineState {
     /* RAM information (sizes, addresses, configuration): */
     ram_addr_t below_4g_mem_size, above_4g_mem_size;
 
+    /* RAM information when there's a hole in 1Tb */
+    ram_addr_t above_4g_mem_start;
+
     /* CPU and apic information: */
     bool apic_xrupt_override;
     unsigned pci_irq_mask;
-- 
2.17.2


