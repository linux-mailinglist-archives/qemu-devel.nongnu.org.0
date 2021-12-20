Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B6147B255
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 18:48:35 +0100 (CET)
Received: from localhost ([::1]:54594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzMm1-0000uG-PK
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 12:48:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mzL9n-0001ie-W0
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 11:05:08 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:46076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mzL9T-0001dW-RQ
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 11:04:51 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BK9PPm7023723; 
 Mon, 20 Dec 2021 09:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=wLXzHHw/U24hNuoXv7mrAaFWbb/tN1WdN+uzS+ipsv0=;
 b=J89VlDFYYaIy6TK8XVQTOIj9sp3w/WynWXtgoEvZn+dT4pyeql6xD+C+1w5+xI4dfnjR
 GddL8NcB6Aa4vC2NzP9qZ04REjc/jBptTwite3e0R68llbXvOtB71/pMl1YiysCDROka
 rwg0px47DfBBRwy1H+87atWXBr3VMKHjpol55WDWtKRO07glYyQNLA+2Brq0GSKcv19R
 qO4nQ0SU8qH/K1apG+7QBSiig6TjKf5zTo75mBspxCQU9hbLsgizQ4XxB/DsYoLfHSzm
 ownoJn2Fxt9WtQJNRaa/GUtMIHOPjoFi0+yHWsQiN8InSaNgfkwyZGnexuPe7/mIsmvg yw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d2q6eg0ub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 09:34:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BK9UIPZ055954;
 Mon, 20 Dec 2021 09:34:23 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by userp3020.oracle.com with ESMTP id 3d193kdpws-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 09:34:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGoe+xpFjviM80cxav/4xov0XN8aOKEOz4wiyTIw0rL9x1+vhpWjMtaRGgSN2rFibObm4JawKR6nXaFadVfzfPi53nVWxGUeFsU6IaObinEezJ6DyX7vyp1UYBiQ8jA+pYX6GFWOzw4s3gFMOkdEN9sKNUYjXNN4c35nZ8PVbLcQdkUjTG4mGScJH8rMn/KwXzZDpSTsJ+VwVFmu4RNTl3X23BSQvfN23o7tq6AToyHG6j6FBt6+LkGKYiyjCOI0KK5Zm+kykzEyPgaU4FjtW92knKT8rXhB0P9WRN4xAYPP5RvvOej3jnfVCB4YqiZb/iSO7Q2x0O2aRpH4pRmN3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLXzHHw/U24hNuoXv7mrAaFWbb/tN1WdN+uzS+ipsv0=;
 b=Cm+CNYd8wJvbvmn6spPVU6ChJAwKcCGrw8LGGDDwIJhivVyXfZjex9CpLA5QFVTn8+9iEMfYZ+Ehx1Q6ozp67sPbuqj1fQgr0KZgAoDGcraRkKltqZSZMBD5t5Yhlm9ZXv0l1NX7+a4i3bggAlJGUITlab0pgnM08OdLH3QDO7oEWdLsqGR3AdTTdyerjIz1SAvwOQKwV27GRbaNceUHlO196LpyHJPO3jubii96EHhCdqHxgOWjlrIqRGxErocuDEN25H0jg7IAIp2KetH0wBCNuRT65vo84XDWUHsj674X9tt8f1TBAX/Ur9jOCWXU8v46VPOHhNeV2DbXWdmgxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLXzHHw/U24hNuoXv7mrAaFWbb/tN1WdN+uzS+ipsv0=;
 b=M5a7P2RnGa4GuOj8T2TeBeTIPnY5WMP+FFErg8Izt5mVkrnkobUVgUTu1U1mOU8uz2Rsr6nKKgGm/SCn5NRBr67VTECTwuLHXAx92/azXgalbHnuPGlWzLB0DclTuX3I9aY0BK5iG8YZd+uQaNkZfRUpRWDRGAs7SH/7S6NpJ3c=
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
Subject: [RFC v2 2/2] migration: Tally pre-copy,
 downtime and post-copy bytes independently
Date: Mon, 20 Dec 2021 09:34:13 +0000
Message-Id: <20211220093413.1383190-3-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211220093413.1383190-1-david.edmondson@oracle.com>
References: <20211220093413.1383190-1-david.edmondson@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0063.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::14) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b1ef474-8505-4b07-9aa2-08d9c39be707
X-MS-TrafficTypeDiagnostic: DS7PR10MB5184:EE_
X-Microsoft-Antispam-PRVS: <DS7PR10MB51841FF666782710B88EDBDD887B9@DS7PR10MB5184.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:261;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GTPP7lmH+6t01a4q5Bqy0DWZEiahxbI4c3fWb9+XH2nYLrOmo8WJTSTfyg5V+aIDwkfy1RyJ6LrStTBE71iEY3Fgw2gI+RB9ySCnfXm36Gj2lHZAIpOD7JgyHwQD60Zdt/ZWISlFGstoKg385I6UNRxVWwoh1gC8tGrl1n8CNbtWULYPqDSaGQTHX1B8Lz+BNlTFlhL+mTNmLm6lMeJA4kXesqHtuENtt6EGnGppyWtNzbBVn+KXJLpvN3+tH+D/SVOeQGGKp+6t0usmqS2RKpPVbG4JAgUv3aXx/XYH9CzUXdh2TRJkRfXRSnDkGiPhF0D/H6MN3zmZjBV0aUCO5l/t6n2d7re2oRTM/IXmUivWDFqDJFAY4N2a2toaGvJyi9IX/ITHlICjvGrTKTqTEJ2H5fV5P9WWvR2uY+kwqoYzZ5h+4Tfn8EbekWbmV/+rda4jZjZ4MHH0GU8Uv4RGMHJDNq7NV2wUjHvpcGaJefuO2JmMP83oio/2wnweiRqgWILtcTNYJnnKqJQIikNpG+0xtC2k6lSFTdrR1B6+7TrGX0yQsmuy80fycW6kT3ty8jemEdONAqVRU5n/E4jc+XLuEkP1+La8M/GgQDzVfLd9KX5qLwWmTNfUP0rRXo/KLCuB7Fa0EgzIx1NFRd8mRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(36756003)(1076003)(66476007)(66946007)(6512007)(66556008)(38100700002)(6916009)(52116002)(508600001)(5660300002)(54906003)(4326008)(186003)(107886003)(316002)(86362001)(6506007)(8676002)(2616005)(44832011)(6666004)(8936002)(83380400001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tP7Xq6BKizjhGPsmcgpTvzz8i+0rW4DTbcxan1R4jqBJJrmtjQsycXzWIwq+?=
 =?us-ascii?Q?5Duai1/A8sUak7U/XFnv5dhVEczce+Bv3fXzXcxEqGuwUX80EBrP5EJIreuN?=
 =?us-ascii?Q?qkkHZs2kiMauizH0hHEQagGckTDFoPykcXzmz9tKCu7dDIuZdrx+ZVHf9znx?=
 =?us-ascii?Q?6hpcXrRALC5zakqqjhRv2GYWTY1TAhPJM33u/EB2k5lXCWoZhCNrd94qamlk?=
 =?us-ascii?Q?dz924W2OVsExwc97x8SrA2MkP2jbk5QdbAHnQVrC6nxAhr8PuBmeExtDdL35?=
 =?us-ascii?Q?H2dB9q55hW1YrgAoGJePgQSbmmzGw7a+0pZtX8CSXHKJm2lX075BJ9Lc8zi2?=
 =?us-ascii?Q?NC0zlWgGEq3zJC4D9OvB9q2n/bhY7RqhNTKZhZp1tbnc890vgQyuzj+4tEEI?=
 =?us-ascii?Q?MuNS16O8y9tKklGKX4AiHtpdyV8StDojAGurpf6vvuyJE/RiTWnJlwAsBd+Y?=
 =?us-ascii?Q?l/Fshao/bYC9SE4ZyAK0bXwwDY+hp+rqoZXazG4BIoTV3i8+vQzLR/G0Ncmy?=
 =?us-ascii?Q?Gx8fio2cpe59hwDAgLxTjjVaYhTj8760KqYvgknVMC20JnLyVco0a3woRptb?=
 =?us-ascii?Q?J7n629qYlIg8GgYyw+EJIDl1h1zzF5ZC8I3H5dF/hTkD+W8juSiXtzqbLRH8?=
 =?us-ascii?Q?tZX2X4g1ZrR5CTuLA7Ivm6rfeOJbsOnYaQJQOkzwr6WD0BK/Id1/nQts1YcM?=
 =?us-ascii?Q?VCq9sRemkuD7+j8cZ4T1Knh/c7rukispuuZ95EDXdMMG87/d4BWy5PqACJRL?=
 =?us-ascii?Q?XS1CCZnU/K5dYCeHa3N/OshUmoFSDG3plPfDeNO8E1njJneHZEKvJJucz956?=
 =?us-ascii?Q?h+66biygSRfw0dUGCBqiJiPDCj8rHEWWjBKYO9lYdr+QaKlrjlR+uDWQW+UW?=
 =?us-ascii?Q?bHFx0U6weC4HSPRSpkoGYqimTOCsgGW6yW/knF4N6YvyPV0VNI1PsCtEXe93?=
 =?us-ascii?Q?o6FUh6W4FYXeBBwGIGKQ9bVSzy+3ubUDPOeddqVyNwtJdvoXX0SNfv+kVWZO?=
 =?us-ascii?Q?cLOID/Ef3AAjHRl/0pV0GHO6cVr3F0SaDuzz0xKb6eQWehoFh3n3oe8cEhko?=
 =?us-ascii?Q?shiqF0t/C0RpJA+zapLqfptBPmrbOQ0nHRkOxbsW2pud7EwZOlmAAiIQVF4K?=
 =?us-ascii?Q?Kqcs6ovFodEvr86gaiO3hYnw9LTQ6HbeXyN/DVzSBo+dl4vCjxuY55KF0cLF?=
 =?us-ascii?Q?G/uoy5eYu3jIlJmkbgLEHXz9LDJNF74YBSPkEFBUTZJ2MHhact6zzMAkLJu/?=
 =?us-ascii?Q?j7RkcY5YdXvaVD+GPd7BrKNMWq/t8cGCQt0Tbb7VeuPDu8/hUYW7mx+1BNJ3?=
 =?us-ascii?Q?1pn1yB+Nq6DNa7xUnYDYeLfdEuUTGjIXZXPGS/3vF9cotdT26REs8aKM51EH?=
 =?us-ascii?Q?KOET3HZOo4S3txfwjenbS/koGYDKV3nu4+HSL1oKX0bUF3ugkBAUlGOt1+nQ?=
 =?us-ascii?Q?wq+hu6Ru6gYV1OEQtSAccISizJeFhVMxl+fqJMPXWiZIOxkLhRMzlOQ1oM7h?=
 =?us-ascii?Q?ougL8qPTKnLOr25muCL/W4KRpSBmNAp6ibtiUbw0HHFQvYz5XFvdriS/Fu+f?=
 =?us-ascii?Q?bTyn6NXNEDcZZBIFg7TzeDrdyBjwy44zhIFUOv3zAhm0QrVuYmkOzthW54qh?=
 =?us-ascii?Q?aFpMXEnMRQDcWgxwQnQv5XKo4uqcS/k98JcKRtwCkzHsNGWo4BRMJQjJX1nQ?=
 =?us-ascii?Q?WvEtQ93aRjcXNqlD2XXCMxVpXhVy+aDiI4u1D1E9IIwllnIs?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1ef474-8505-4b07-9aa2-08d9c39be707
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 09:34:21.5037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qaqGxvH8PBsIzAUtIan8C1QUxZCGG1gA7xt4LKkVn5NUCeACWPkgqehBtXYX3aEakNekSJdzwZrsLjmY6war8/evGbpEFEyWmPqpjtgwpqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5184
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10203
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112200055
X-Proofpoint-GUID: P1AvFtDBKxL4nAHo4tJ3nyQc8OxRlv7z
X-Proofpoint-ORIG-GUID: P1AvFtDBKxL4nAHo4tJ3nyQc8OxRlv7z
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

Provide information on the number of bytes copied in the pre-copy,
downtime and post-copy phases of migration.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 migration/migration.c |  3 +++
 migration/ram.c       |  7 +++++++
 monitor/hmp-cmds.c    | 12 ++++++++++++
 qapi/migration.json   | 13 ++++++++++++-
 4 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 3de11ae921..3950510be7 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1013,6 +1013,9 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
     info->ram->page_size = page_size;
     info->ram->multifd_bytes = ram_counters.multifd_bytes;
     info->ram->pages_per_second = s->pages_per_second;
+    info->ram->precopy_bytes = ram_counters.precopy_bytes;
+    info->ram->downtime_bytes = ram_counters.downtime_bytes;
+    info->ram->postcopy_bytes = ram_counters.postcopy_bytes;
 
     if (migrate_use_xbzrle()) {
         info->has_xbzrle_cache = true;
diff --git a/migration/ram.c b/migration/ram.c
index bd53e50a7f..389868c988 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -388,6 +388,13 @@ MigrationStats ram_counters;
 
 static void ram_transferred_add(uint64_t bytes)
 {
+    if (runstate_is_running()) {
+        ram_counters.precopy_bytes += bytes;
+    } else if (migration_in_postcopy()) {
+        ram_counters.postcopy_bytes += bytes;
+    } else {
+        ram_counters.downtime_bytes += bytes;
+    }
     ram_counters.transferred += bytes;
 }
 
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 9c91bf93e9..6049772178 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -293,6 +293,18 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
             monitor_printf(mon, "postcopy request count: %" PRIu64 "\n",
                            info->ram->postcopy_requests);
         }
+        if (info->ram->precopy_bytes) {
+            monitor_printf(mon, "precopy ram: %" PRIu64 " kbytes\n",
+                           info->ram->precopy_bytes >> 10);
+        }
+        if (info->ram->downtime_bytes) {
+            monitor_printf(mon, "downtime ram: %" PRIu64 " kbytes\n",
+                           info->ram->downtime_bytes >> 10);
+        }
+        if (info->ram->postcopy_bytes) {
+            monitor_printf(mon, "postcopy ram: %" PRIu64 " kbytes\n",
+                           info->ram->postcopy_bytes >> 10);
+        }
     }
 
     if (info->has_disk) {
diff --git a/qapi/migration.json b/qapi/migration.json
index bbfd48cf0b..5975a0e104 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -46,6 +46,15 @@
 # @pages-per-second: the number of memory pages transferred per second
 #                    (Since 4.0)
 #
+# @precopy-bytes: The number of bytes sent in the pre-copy phase
+#                 (since 7.0).
+#
+# @downtime-bytes: The number of bytes sent while the guest is paused
+#                  (since 7.0).
+#
+# @postcopy-bytes: The number of bytes sent during the post-copy phase
+#                  (since 7.0).
+#
 # Since: 0.14
 ##
 { 'struct': 'MigrationStats',
@@ -54,7 +63,9 @@
            'normal-bytes': 'int', 'dirty-pages-rate' : 'int',
            'mbps' : 'number', 'dirty-sync-count' : 'int',
            'postcopy-requests' : 'int', 'page-size' : 'int',
-           'multifd-bytes' : 'uint64', 'pages-per-second' : 'uint64' } }
+           'multifd-bytes' : 'uint64', 'pages-per-second' : 'uint64',
+           'precopy-bytes' : 'uint64', 'downtime-bytes' : 'uint64',
+           'postcopy-bytes' : 'uint64' } }
 
 ##
 # @XBZRLECacheStats:
-- 
2.33.0


