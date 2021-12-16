Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8074771FD
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 13:40:47 +0100 (CET)
Received: from localhost ([::1]:37770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxq3x-0001dk-8L
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 07:40:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mxpxy-0007jv-49
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:34:34 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:57708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mxpxv-0004Dq-IT
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:34:33 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BG8naJo000415; 
 Thu, 16 Dec 2021 12:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=hUG48cg0MCXpY3SO0zaHJHYfx84Nz2c1bWIOu46P8gA=;
 b=nySiPaOCpS5f8ogIt5W5IwFSvNhCoYI5lYBYQbbD3FatVG7fXyL9n91yin+FPDQtpThi
 uoXeTsQlKw4lxZvRd01aX1+CpnsQD3TQLp+WjUbAnjm8Ca2P9fDl9OaneMbIdkfK2m3v
 IYdeuNzIPSJvX2Xqn9KQ5jFrecxcAfxV2TtRngKpcjM8E21GcXFeO1rDIGV53kp27DLy
 y3l9Oid4IwsyakZnR1N8YFt4gKe87dlI5l4AZ6UdTaGnSN2itmKcS2OyQKoO6aDI7L5a
 BsYSbeCdv7ueUWBS8RgrL3L48UxGkxLuuQEPSEfqiYWT72z4jFRGBQ0xB+IrODYDBcbY xw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cyknrjjq3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 12:34:30 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BGCWBmP080254;
 Thu, 16 Dec 2021 12:34:29 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2044.outbound.protection.outlook.com [104.47.74.44])
 by aserp3030.oracle.com with ESMTP id 3cyju9tk9h-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 12:34:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAasXY3l16FDlxTQdAMFWevKiBrWgl/nGbmonKGkOiVmedPzX53MPqxBH900Q3vnWPSYWM6Zfx/Ab6YcSU4LvKCO0+750Kl3Bq3/l8OpuZF4Mr9vAhmJNmsdJJOqk9OijC9V+uQH6NdAhLQhLxG2nJb1o5s9CbqX7avDbz8mdlJ0H40kvbxLbje6Lgw34y6/tf1bn2kfbAFQGjwBDhj44MSGamQpqO+IMSWmjKgCE0zvhMY6H8WpUqwGVVZQp2ZumgwKElKuU7x8gwvWYke/qw3zkOlWKUArGGBpDczuZwPv10ES0bpCA1fvIRnh3PBmWUTzcK5+5qVWufaNm0vWAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUG48cg0MCXpY3SO0zaHJHYfx84Nz2c1bWIOu46P8gA=;
 b=HD3o5pa26oo63EikTPWQKj+/XWcy8do7dt7FLuiKQU2qNwxts2Q0gkMhjx678iOFauHibMP6ocpaZd/FbvcXty+6O5NBRd5cG6MrqPsFkAUNPLCp5bzfIIZwjTec7axFYJzjwDmGkTpsI6YD7Ku7eDV1FxSjahVuv2V01+ZGe96r/eIHjGG84NRMCRkZL/jbhJc9ZMW1GDnRKk+RZAtcjSR0lIDSlDTTMgmT18DwUOPBsUUI1k1F/y9flnPcauy79O/UZ0Jl7Zaslj7zpT9bgAFdTQEEO/EdNlsYhXR7ynt8Xtl1r/2Aybb7XK5wqUuwOAEBIVIU5SyI87528z+KDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUG48cg0MCXpY3SO0zaHJHYfx84Nz2c1bWIOu46P8gA=;
 b=B9IowkclM5szdFPZDhKTMdQT4rjy6S/msjMAkcepJVVLTn4zTR3IbLU1Rpy5PIOdLb1ULRqhQTqbaOFEnJ//c5R1GpIh6wQAsrGvQO9w9AAvbvRs7So+3mTbqkOx/94G64ZbRa1BwWcJKVDzv+tYBt4dWw2ZQV3q5+JR5/erS9w=
Received: from MN2PR10MB3149.namprd10.prod.outlook.com (2603:10b6:208:128::31)
 by MN2PR10MB3661.namprd10.prod.outlook.com (2603:10b6:208:110::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Thu, 16 Dec
 2021 12:34:28 +0000
Received: from MN2PR10MB3149.namprd10.prod.outlook.com
 ([fe80::992c:e877:f87a:4c10]) by MN2PR10MB3149.namprd10.prod.outlook.com
 ([fe80::992c:e877:f87a:4c10%6]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 12:34:28 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC 2/2] migration: Tally pre-copy,
 downtime and post-copy bytes independently
Date: Thu, 16 Dec 2021 12:34:20 +0000
Message-Id: <20211216123420.1328937-3-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211216123420.1328937-1-david.edmondson@oracle.com>
References: <20211216123420.1328937-1-david.edmondson@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0258.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::11) To MN2PR10MB3149.namprd10.prod.outlook.com
 (2603:10b6:208:128::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b38781a-bddc-46e2-5b35-08d9c0906633
X-MS-TrafficTypeDiagnostic: MN2PR10MB3661:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB36615806F3399D69331DA58588779@MN2PR10MB3661.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:220;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m4YCAmgV6Pz8b6WmeyFWoMDfh0BJzjkIhSwlptxG1s/pWhwGbF6km1ADAovTDEZCsngnae7MGeoxPmJJmIc6veG8yo12yXgTaUdqoe95FHmfCMTqx8qrHw6avZF9UiYd/Gq2U6vSYvTpu+rC2wMVcFQQFmHuONB+EFb+LmD0sB+lMNs4pkZZ0SN5OnNU0kmDGqX3gekZwI8jOVCd8izIzzwv+hEiJq1DB8BnACxHJYUKi1MqH3Usp5BAV6kPYcvrU11kexO8DLGPyrPjwU1oUjJRLPMxmtVc4L9yjqx9QVqKsFNfWf6J0PqiMsg4lEzzIGKQsYN6NaOJV5Bk0UKMRfAlCvmPdDWMwzeKWhaR62LWe4PyNL7/v+E668v5PUtMxgqomwNV5qs6TQbkQZtDZ+TRtLNVzj+Prdrp8+RuBzaeub+298RfY3ATYOPwnjg6uHsx7nHKQdpn1acIgXyw80RQeFLTyGaoe+mMWlSrguDNPJBV75SiUxjprD3v/LGNt+qPt5weS580H1Mh+P/xK9/Dl9sCUVWiYj3h+Rc2gyDgwjwB9X0F6J2W/dadJYaSt52nUirxthHpj/LuLUS6gKe/AsiN+i4z+iWy3mYhl6dGNf3iRpl69buqeDs0FrYJdutfJeJ2n1kDY8ThlX/JeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB3149.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(5660300002)(66556008)(6512007)(86362001)(508600001)(2616005)(44832011)(38100700002)(6666004)(36756003)(186003)(6506007)(2906002)(6916009)(66946007)(52116002)(6486002)(107886003)(83380400001)(54906003)(8936002)(4326008)(8676002)(316002)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fq6gYAxEfK0fu9w0iFCmygE/aEMNsxbOmVikJ6F1L/bzKznv7adhICHF9ZYL?=
 =?us-ascii?Q?7tSXZguUSIs7QnzyamlYnIHpeEm02SVnUDsjPL4wp5998crFJ/hlu0AoJWmR?=
 =?us-ascii?Q?NsBmI8M0g4ao5JBTpDDbt3pd6yZ3PxGS+PiQ+W/FWFoTvk+iYqwjSyfApOdj?=
 =?us-ascii?Q?bttfuck9Rs7I7Agglhbb83VzY8jfWIAuPfuw32p58moeeDMxd8SEBjG12jbm?=
 =?us-ascii?Q?VEUR29f/+NtKSXGqoSpLGnf9TtjLlGBcKN47h+TO9R6tY0wu61B7A57yG+eY?=
 =?us-ascii?Q?OaAe/iuLlqfdSCQook7ahL8KSexDrrnogxMx638a+Fl4vs0ADmpbdglYJv/M?=
 =?us-ascii?Q?SlEFrir3ecslK23luQm85fmakF5xcfJhJJB41FY3o2Uy+Di9clICTohl04zp?=
 =?us-ascii?Q?mhbmY1elVEov75SCiz//8/sIdDKOx80pQ/lK5Zy308hwk4icE6s5mZlddfCu?=
 =?us-ascii?Q?o/BLoH9yvVwM5HpxEHyFHC7BYCvfuJg1l09VEkiUHXZ4G0TPdhUlZ+/hv2ky?=
 =?us-ascii?Q?bwf+WMVuW/gC481+y/w3eecy1YLBkxwgAx6RSiOaFLhJJZ0S89lrv5SgAxZw?=
 =?us-ascii?Q?5pNEhBZAnR4zt+wnEBMKS6i60rUcQGYdASBcluS/xQN4biG2E6x7BNjZAz8G?=
 =?us-ascii?Q?5ffyiweBMuoLMNpl5vOhi9v4cojeaJhBLFMK2e/2Gm0lV0XlTa3ziXYHYUof?=
 =?us-ascii?Q?ADvW4zGlo6FCU/Jt7GWG0Ge0G10TZvb7m6jI9lBvL5FgiE1cFG5cm5KK3Jcf?=
 =?us-ascii?Q?lXhC3kCQUtVwJ898YhtMUicv+CxurkVao6Je4/mfoHLEx/uqxVbY2ALAKSmk?=
 =?us-ascii?Q?t2sj7vOWEFK1m+8HXRxjx99apIKU9Bh5JsbQ6jJzZ3csAy1olqwCgkMXZIvK?=
 =?us-ascii?Q?aUbdjl91PFUkrqoZwAAj65UdVazPSZx0071botrQJNOdQX8Q/KpCUR00i4si?=
 =?us-ascii?Q?tNCpneOKZcVbQM0uD3WMYlSuK2L0VHYSOrDQqvkwxMb2Krmn4ceK8LERO/wx?=
 =?us-ascii?Q?W5MpMcS/ZN8Ku8Ui37OLuh26hzxJb+NkDMx3DcuZrB7jaedzP/BkGs5jA1Bc?=
 =?us-ascii?Q?0dlrfn+UGzqQOIp7F5xDAKl/mIf+oqmTjOaLwMnjS8SLfIf74VHr80yLxAJd?=
 =?us-ascii?Q?G9mNRjihW4wBwNctvBk/Swwzaiir/fxjGd2oskKSSymhj3lLpbYYNfK6TrWs?=
 =?us-ascii?Q?DQsSLJSMcLwOq7aNAZUsd77aYPUCe/EGin3MhYajnQY4s6rXg26bhbIRztdB?=
 =?us-ascii?Q?yT5Fa/7rHZ3oxUsHBIUBK3l0WnW4dzoqHHRBKYea652ipt7w2AN8XFK/kKjA?=
 =?us-ascii?Q?b/sewnkW55Zo5zOyezfzIJ+HUtfvGEfvfRajPLfPQDPJu5cFU7CIAk2QUlMa?=
 =?us-ascii?Q?PyBKDwUcukxtEzXye43M6dE8ysSwYWQvabGj4I41olbpbHrLHZj4ZSAkZaW9?=
 =?us-ascii?Q?VChFZrUIgu27LDJjTWrmeGDENeQc85f2NNgaPtZWUX7yWP4my+thnIMLqH35?=
 =?us-ascii?Q?4janXetkq+Im+yIkH9atHBkUeyNnC9m+kNkCYDvDEptqCuwRdo5RMI2aL2px?=
 =?us-ascii?Q?QyUkWqPx3sLQ8BvSVYHcHJAA1SvlWk509bIKRXQKW55bg3RA0QQ1sqDAYJzq?=
 =?us-ascii?Q?9g/4PQbOsTJIS4yrtv6Ur1v6DKwP2MLogMG9IjLD/q3oX4+Zc5BVsHzDoEG5?=
 =?us-ascii?Q?S93BpCn8RgM5IUTK4dL6UwGDIyhsJPku0tHYJgRnWUZMrwW0?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b38781a-bddc-46e2-5b35-08d9c0906633
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB3149.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 12:34:27.6438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNvDkcEBm8RSIlVCcjJJ4Vmb3XXUZVWW6VeOklUfUL95zvP/caB5+SC3nVR2lWs8t6UWhyPbED+euD+HqGt5I6nBWeBuiMaKPPt+LOesplQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3661
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10199
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160070
X-Proofpoint-ORIG-GUID: zQoJzxaGmERHMkHttCvJp6_rLyAZjFnm
X-Proofpoint-GUID: zQoJzxaGmERHMkHttCvJp6_rLyAZjFnm
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

Provide information on the number of bytes copied in the pre-copy,
downtime and post-copy phases of migration.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 migration/migration.c |  3 +++
 migration/ram.c       |  7 +++++++
 monitor/hmp-cmds.c    | 12 ++++++++++++
 qapi/migration.json   |  4 +++-
 4 files changed, 25 insertions(+), 1 deletion(-)

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
index 48ef2819f6..6c5c8441fd 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -388,6 +388,13 @@ MigrationStats ram_counters;
 
 void ram_transferred_add(uint64_t bytes)
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
index bbfd48cf0b..69ec9dc3a6 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -54,7 +54,9 @@
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


