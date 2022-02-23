Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F69D4C1B26
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 19:53:46 +0100 (CET)
Received: from localhost ([::1]:34808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMwll-0005aX-FU
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 13:53:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nMwe1-0002st-Cp
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:45:47 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:56328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nMwdz-0008Da-IQ
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:45:45 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21NIDrx8001875; 
 Wed, 23 Feb 2022 18:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=/cv+mlKRwrBt/v/yhiKQ10XmHz55Xm78oJVd6dYhBxk=;
 b=vYNwFEndTMe0SKQ6+jK1lUZ0pzxxTYiMlEa9JYEdIaCvN096EZnIexJSQPgB8J6uMtPA
 tYcaO3uCmbituzSeXtkRotPhYjfmQxSuYYEAisvfZ2NJHDdqQiWoBgwvQoV7jl2x3utk
 K0+EgMkF7QItif1CxQzKgZFcuNM+l48dvoaieRqq0Gk33KDMcZRD6lVbIRorSJuUBMp3
 Ai3gu984ioFVQOxf7xxwxkNjmn0NhrB7S4Z21T1FBYhZ6lBd9gbnMIUPwYOZ6zYjnwYr
 wlml1zTP55EXX9F7ExMcC/bSvQOa0u1Hdf22KVn1/ux6uhe4pqBTZCngyBr/3F9d4wOE DA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ecv6ew15f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Feb 2022 18:45:33 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21NIZd1q054015;
 Wed, 23 Feb 2022 18:45:32 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by userp3030.oracle.com with ESMTP id 3eannw9m2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Feb 2022 18:45:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8ruNFQ1IhFvh2X3kPh9kE8nJlmQVcSTUB4nRLJV8gNSl0bNZW9cdUFcMTL0ROnyY1iLGJHOKdoAcQTzkE15Er+48BHYgFy5VO8PMmGmUcdzGPZU7488z3KQYOLTZDIlv6EyB/BILIZC8SLea6jqglgYSgmTUyNZZTMlLcL9OdVIu0dYNuIXMQ+lrgoE2fmJCZbU6NzWhXxIaRyjl+YzDGy35M8V1QCN5J9yT/MMkGH/cMh+xDBp7huZn0O1ZWzx/AYIALIG6qFIMceWjyqscU7D7UEAXdJlEF0le68EBfLU6lZyakmkTq8B7paCAy4rCiY50J7Qu8NszfnBfjSMOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cv+mlKRwrBt/v/yhiKQ10XmHz55Xm78oJVd6dYhBxk=;
 b=g4uBQ/gY6feuTn4KwkPkA/en7rbHVWl3yzjFyGS1jZmA8r1LYPQ1d5vTSr1bDzUQuphcWn8LeU/1wZRzxBEfNrj5gaIBSaujNvUd+vFnFU6/c9jP5Ktng37hy87csIE9W4ppP3kIhzQvn5oFBJ4E17I4LasC4u3FqQmfY0us05BH4JPXfEw/lIgSm5/10q4TZ+xRgldWXQjDBnqYPdbS3QBNYz8XWikQSGsH0EkBi1O8uIj5N0wlu4yLQmeky+twJdsS+yp9sJ1WHsnPyKxO4GLzMcSWgMGnVyd5d54T8TYzlS+FbzENIos4kTOkoZGV+zEzJG1MGswZljLVhN2RBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cv+mlKRwrBt/v/yhiKQ10XmHz55Xm78oJVd6dYhBxk=;
 b=bu8oik7v3R43W+rxr8gX2KXjWAOhrnrj4aLfCxc8UZ7XcQ0Jnk/O8q2GaOVMvRSHMASGcES7t4rkAdzKdbwZ87acRzDF1hLzVxb6+tD06dG7k7x7a8VEKxA9hB0iYcKR04hnJk7aDygaM/+8KW0CTxH9vTbhe4lhJRjDJJGcuMM=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MN2PR10MB4144.namprd10.prod.outlook.com (2603:10b6:208:1d6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 18:45:30 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406%6]) with mapi id 15.20.5017.024; Wed, 23 Feb 2022
 18:45:30 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/6] hw/i386: add 4g boundary start to X86MachineState
Date: Wed, 23 Feb 2022 18:44:50 +0000
Message-Id: <20220223184455.9057-2-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220223184455.9057-1-joao.m.martins@oracle.com>
References: <20220223184455.9057-1-joao.m.martins@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0332.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::13) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3602ad08-416c-4923-341f-08d9f6fcaa77
X-MS-TrafficTypeDiagnostic: MN2PR10MB4144:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB41444ED616D3C37730CD9687BB3C9@MN2PR10MB4144.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lvPG+9WbsGkd5BAhhOOgoP7x9xtURfHtwsB4+Ic8U3ytoy+sL5XUa4fRpy8LgsFyB7S9mRG6LOq/WQ1/wOr+pP+pm7gi9tC0uPDfgS/EhrRG9bBjp/0Dv3J1A26M2KZKJmn7ESnJ6cJa2Hhm8BgT/Mrs0vqj/+zKAgc9eWy4RRF2ALd70aXP2nLtk/QNJKV0QNN2D0n8B+g3hMoY6i5/UzUKnj1iYsEPATbxtDjW6pBb30NIAThZwGI2QhoTDg7CryU9cJjUom0qrJFxWe/tNqU1573RLyElkORZHEQFPvYX/s1w75P9MbxNKPnkfgW78X8BLemuQOBi9ba94bqVwuzTfMvyjUDPoEOj8FXuQsgGIDEObohuTiN0Bj72921/m/FmW61S8rIzVMxvQqQIHxqsau09FzCPLQjDWy2KkrvXoeKduBoCKHCvkvDMEL8axKzqbeM9uO/wCw0eYzh077FCQCX+aoiJJ3bPyIkLfO8p1VBqyqnPRO6LAFeZXo3QPwk+QDOTqsOYrTX26i6Q4Agf7KwANoNJLK2lJodh7dj+mlpUwoAdfv+9SqB2CmnscX6vMBWpk6i2011DU74EU/Ff3zbeuBkl2LTmr8ZhxaMPuS66FG5qYTIkZcAsATShRnZnu0vxqd8xhRQL6J2xreCL4PqiLRujOIh/Jl/sBerFr9nTrGsppqikCw+9i/4n+u4iX24DaUExfzUfDtD/Bg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(6506007)(6666004)(66476007)(66556008)(66946007)(83380400001)(4326008)(6486002)(103116003)(36756003)(316002)(2616005)(7416002)(86362001)(38100700002)(38350700002)(8676002)(8936002)(54906003)(6916009)(107886003)(1076003)(186003)(26005)(52116002)(508600001)(5660300002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iyKRW9qHvbCtptup47ElDsWnyZR0QacNZoe4uPva4tTnojYwKnKXhz2bxg8/?=
 =?us-ascii?Q?PMuKTS68ncakGuLLaGJZ8gDSvsEg21oZxO1bC6kHEwnSJh+u5M6YntgWEZOq?=
 =?us-ascii?Q?Fyh6HpVSm9DZu8A/HNZ1y4RT9ep1bKnjZr4LuVyetagLisutZm+FLjH7lkjc?=
 =?us-ascii?Q?5ZSaoPUjdkA2kJ74Z2aBadxCb5KzxcJ33A6DECVcnhXsF6EqD1KAJd8hm8C5?=
 =?us-ascii?Q?iKhCOmH2VK3xjVgHLKNw/D9EhVp0L6E69w3jSyPI3n0JGg5tb6oMTWIccI5b?=
 =?us-ascii?Q?X3eYKHgp6A3MnSYt20PZloaBTW8GZt5FLankw9nRVspIRRq3HE0dhqLoymcM?=
 =?us-ascii?Q?jksohi4q6ZtkJIKQgaMKcQA10FFdy9y/Iqi6kYuxzVCjSbH5bKWYx8VoGJ4h?=
 =?us-ascii?Q?3dEd87nnGGFq0ABvLKTIDeaEKxS9jArcBYCnI9EIWehjpPbH2XFPfI/9izyS?=
 =?us-ascii?Q?hgzQHCtJlZ+fhkeiPhihO6snypXxObHKeMmki8tZ6AERwQPYeqils6GGwkpX?=
 =?us-ascii?Q?R47tXqtW/Ne6ZADC1Lolhr5X0in+6e9rfVu7FdIkDvt0o26PHgPgdqTYB9Le?=
 =?us-ascii?Q?56gmoB0edz313JkxuAOWXoG4CXQekRjCgg3NyU233qXxTVcV2cLKyxAywJR4?=
 =?us-ascii?Q?dDbrZhIabaxaolqfMTbWO60ZhHWlVwBdcJzpBnZq+WGPEbq3WFDKxQMhbtAZ?=
 =?us-ascii?Q?WSqreh2Xyb35Y3lritdL//31upG/OqQgaIM9G5ktWWU57z4G50EZk9QHxdcw?=
 =?us-ascii?Q?6U0tn22vvaw8v0Y51CPIpK6OCRPRxXBznbpjQYrQiwE4UBpPM1I5tnpy0x97?=
 =?us-ascii?Q?2jVRnUOFFe0FxMPijpYf4DyoFfWtivhscYGRopvXfb6WBQVnizXhg4r0xE0Q?=
 =?us-ascii?Q?bT6ooJVEQo2mrUGUmbRncqnRu6u114ldh2l7dKU45VgG6NyAN7ouIyZsiYum?=
 =?us-ascii?Q?qccZXD500t88eAMd6kpwQvYV61ixR1RyojurFjjMPZVKEWnYzLupTiKhRi3g?=
 =?us-ascii?Q?YxJe4AUPtPZAGqc/k1hHdm2CRr41MbHiySLqPxZ6u1OWLZQlDiUSB6wydloH?=
 =?us-ascii?Q?idxFNUpHtl9HkfzjsoLSsNWI80VZOCRg+YKTMFYaLkZ4UdCLDEWtjMSW+tGy?=
 =?us-ascii?Q?skYx4ZU0tm7t70CHXCZKSksW52zK+AGv3/cgad7PFLzpNiP7yF7lOXkGlKQ5?=
 =?us-ascii?Q?FDl4DlAgenlCUuXFgmOPGhTmQSHrE+TnURKw1KZVVmBTiBYD2U7t5DEQirW7?=
 =?us-ascii?Q?WtO2XlOnCojWbjypmkw0knAqJwr/7MWU/wPZDqtPb/7KBAce67FsOCHr868j?=
 =?us-ascii?Q?nVGMU5NLcikl/Va0/rh7astSVzwL81JuO5QwFh/coQZ1gy6PCytcjAEdO0SE?=
 =?us-ascii?Q?Ww+7vZIUKzXwv+6H/NyILuX5y6X2Hc/N3nYpy0DqlgqlxRdmRdFCa7AHay2+?=
 =?us-ascii?Q?E3kgqom1insmpiVuogVO8cxIAcOehFkwwik6DfnZ5cvOxWx0w4DY5dx6RQ7y?=
 =?us-ascii?Q?8mx7l5csCsZL/bGLuL/031srbEKYB1r0n8D3AI6R4DgyYztO2qxLpEF71urI?=
 =?us-ascii?Q?IrSMQchOCOh0tMoJ2dLJFoiNUf8obxtzBfe2ApBOnvsLWZeSXamkgRjqQZmm?=
 =?us-ascii?Q?KZEqAohwoF11n7hRJzTloPXmyHxtJXEmg7vgtulOQbgrnC5r9O4bICEgWDDN?=
 =?us-ascii?Q?kaNTeg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3602ad08-416c-4923-341f-08d9f6fcaa77
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 18:45:30.3172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ucJz6WMau8g7/GfUnSuOQw9ykSxHZY2i87tr90YttfffZrdCRgSzU5Gel7OM8Zn0/oyHKLaBqJ4hDtlWLwi/I+eR8yJ7ix7DLilLGfIbE6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4144
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10267
 signatures=681306
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202230106
X-Proofpoint-GUID: 76tPvA4Q-yeFlzPPp3j4GqVwRMry63uG
X-Proofpoint-ORIG-GUID: 76tPvA4Q-yeFlzPPp3j4GqVwRMry63uG
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
index a145a303703f..ec6ead296064 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -58,6 +58,9 @@ struct X86MachineState {
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


