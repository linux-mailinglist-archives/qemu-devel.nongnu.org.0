Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A84B475C3B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:51:45 +0100 (CET)
Received: from localhost ([::1]:44214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWZE-0002Nt-DN
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:51:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mxWMp-0000ix-IU
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:38:55 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:12628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mxWMn-0000V7-NT
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:38:55 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFENbsS009133; 
 Wed, 15 Dec 2021 15:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=U4X+kP3CwRScn0nWtv3EslOHKR547J4qOgJuzP/6cSo=;
 b=HBhLDYrqv1lt2G8h5BlgBcgwglBPHqTK1xDSSBUfKGYm2C/cHFRPjfWp6judY6X6byaE
 IXZ9aqBLfeskhg5cZIxLYiBcdvZ+eZPg9r067i4agkExlvMP7B3FAm6xiDHOXf6bIEmG
 KeIINCaXKCIvI49ALJAu/WRuAbZOsw5HZllf7RCnXM0eTmnwmpawYKqhmF8Yo5es6RU3
 Fn63xTkZPMLk9/dafcRAunM/cqGjWr8HfmmwtYtU/o2y3pZj+SN6XKyBCzFD/cpWZ2hM
 fOHPWjrb96qemyi7qXRplGSFbTJ6hnrvX+SYoFUsavPV9gVz69Ejl0K8gU8FFpTHMGkq fA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx5akey78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:38:50 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFFUWwL094240;
 Wed, 15 Dec 2021 15:38:50 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by aserp3020.oracle.com with ESMTP id 3cxmrc0ww6-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:38:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8m9+rJc5aqAAWhHVJYamP/hPJ/AlVbaeZJSS4Znt/+VXQhmLHQwfQs9md1JMPSor9U8rk3YCFxol7mRv7H1ThN3LFGWZGMwuyVG+ZKfNSd5KetkKk3YQe0bssAG3HTJ2wFNQ+r8NqRrctikLqAZ6NKiWqGx5XTTZB+rLiuC6wC0OwBNX4FRIEewBsyaAS8rSJRH6D0rM9tVEzSYQnT8Kee3ml3Lvd2EabWolDXcGAA2VIhNDpxkPleWU5PWEPIYA82jK9Uvfiw2AJ8r8sQzXIDOD0Tf5RQJgqOQ1EJ9mREL1APFh+I54z3Dl7PYJLq1bwUFn4V2hy8m3uk4V9mOUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4X+kP3CwRScn0nWtv3EslOHKR547J4qOgJuzP/6cSo=;
 b=PAz9GbJLpq9T3S069vJlFOBUM2JHGK8U2lVDxEpA4a4rjFFDcjyjxRXxvMws5Wp0rDcONzqQvpkF57gvPe/HhpZrTB/LwcBzFmyGxg5iLj+tQeuEer2RsuG8kZygnw2Ng/3XXiDgM1EBFb0e9X3Hs7URWu1gTkp1lMkQVjsTC+HxapvxJCFAn8QdsZi3TLuj1EPw3AC7u+384Fb2Yp0r7kRmCPEiE/DP+LEgm5AFcq/pgBmz3HQbAhuldRI+ALRL2CMnyZY4lIwt8FHWPWjO98l+RR6b2YfQmOp8JNrzJGZ51bbyV/Aw27RndQuqcISTXyc226ujbPU63laNyQ9LeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4X+kP3CwRScn0nWtv3EslOHKR547J4qOgJuzP/6cSo=;
 b=SUV9MjAIt79hQtA7vbWdKGX3mcnSQDmWt5K/o1yftMsUrH5vuFHQOis4MGtVLmOXN0jKvWZVelsGZWf/pIMfwTE/sp+n9zd7jCtbdgKdV624WdYmulEX6oV5gyyBt8qcNsX1wfPP7t+uIM/PPkDJKuaavg/oMK+k11ME+FpKw4g=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5474.namprd10.prod.outlook.com (2603:10b6:5:35e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 15 Dec
 2021 15:38:42 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 15:38:42 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 07/10] ACPI ERST: create ACPI ERST table for pc/x86
 machines
Date: Wed, 15 Dec 2021 10:38:12 -0500
Message-Id: <1639582695-7328-8-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1639582695-7328-1-git-send-email-eric.devolder@oracle.com>
References: <1639582695-7328-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN1PR12CA0073.namprd12.prod.outlook.com
 (2603:10b6:802:20::44) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d25189ed-9389-4838-a75a-08d9bfe0f8d1
X-MS-TrafficTypeDiagnostic: CO6PR10MB5474:EE_
X-Microsoft-Antispam-PRVS: <CO6PR10MB5474C7957F1B274D7C6674B397769@CO6PR10MB5474.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d+gRoyO+lklcjI2So3gZWSTcuoL+iirYvmwqU2mycdMNUIqAVMHJNNilQI8gu8H2iU4OAHz2p1E/pGOu5XdwS6x6IAxxvucbaFJxff22O7la5f5ImM9NMZGrpg2kCvcpooVUc/Nt4epM+PCbRJEoPGS5XnzXNwTV2Z9B/sgsyQMBH8hnjL1ra+SUTXw1C36J8zcLw6+G7GhUn/chzsNybQJf2eCqw/ypni8lCzrXxi9Kd+iANtprZVZ78rL9CTxGFW3zDQuC1LMa4MUTfI0KqYMujwfp4qB47I6WUKopK7gNZkndgq458DSfsARFhUF3110eELvIahkMUl61GaqpdAJNLn+dQXVX1OIGh0U1AYNOEfeuD66qRU7ngGfsQymrmd719Qi9CpkYkDjwWNLlQ6vj4j2T6fE4venYqbwCU8q7R2Ol7sGFGFo8HO5wUkcGupTlvSWNmBMXi7INewhYUP1bPm4fq4cxvlRf7Oty3mmv8+up5F5N4K435Y8u8wFLnEC2980HWYfnMpTmnoPqP8EuYwHjm9koVxtuXBbtvK620iGMOuCe2L6TiwvJjiLfpXbVHOSCq9mtJFi8OiRGSiNE2TXW2LuHlLPErrAKrPjksJ0TRToGXGFmKFQQ6WhSTc2OdUpyAXKLoJtpl0foCDqhNZh176Q1lcmaonzQh6IGCSRYzUDdnVzaZVrKtJh04NFbhm8KKLfXXDKJgW6x2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(508600001)(316002)(8936002)(38100700002)(8676002)(6506007)(38350700002)(2906002)(36756003)(107886003)(6486002)(26005)(6666004)(4326008)(66946007)(66476007)(2616005)(186003)(6512007)(86362001)(66556008)(6916009)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BpZOfvyR+RmAJ68RFAHw85rmnCx09M9d9hx0mOwHauSP+c1GNCDQ2LH0h6mv?=
 =?us-ascii?Q?unkoA6dv7JBQZiyVULV+DlepzmBf2mHDeeBOK2d0SfGQEgIYRSQWPhf26CvJ?=
 =?us-ascii?Q?V2N0Tz2RIuM9cPP6ThLDmLqbtDovBPn5MpZG0YpPUi3RYB0hqULizwYy7UdU?=
 =?us-ascii?Q?n5onguYC/lH6IZ8xEzpPEV1RDexX7/KMleBI+ROCZbJoK2jXRvuPoU5xb5pG?=
 =?us-ascii?Q?4mkmzI1Gk6r8KDfKAeMFwf4ilCQ9WJCsbm5+Lcszdg7Hd8lVngip2c8e+Sqf?=
 =?us-ascii?Q?r0muhsROAt+/LnAta4j4wrCc75HFAUI1l70VqcJbs+WMpfsMxoFw5nrVdUrJ?=
 =?us-ascii?Q?qQecV16yQKbRsySXTnkSFntXtzRFc28FxFxcHDG1Xy5E6By2kvyES6IU3EA2?=
 =?us-ascii?Q?ZoZpNPpKv8ONnIVYzSCW2jxyDlJAMWOlnBpaqqY6CkG5LpMpkpYCDyn1dh4V?=
 =?us-ascii?Q?bmC1fdz6L0OIF/BbyNCVFH77aiy4ZRYBTygbYaqiblk1GIlghx3Il6ZAR7px?=
 =?us-ascii?Q?7uBfzMhayr3xNXIoCW/sTVew/xBXWbs5fq94kFZ2WWoiA4ngQy0HXHyj+bc8?=
 =?us-ascii?Q?UOccIMYNWYcoDOyMLfpow56UYDf4Y4c6kWC508K/JSylIXEeRnsfveau1FP4?=
 =?us-ascii?Q?wEFsT+hrFF5w7xdVoaLP5pvCFgGWFFdNrlhgDMhV0vCKwMfAFmCh1wSXwqh+?=
 =?us-ascii?Q?Bho56qRVls+9NkM4+JEfJBTtdDfzY8Sdri0cMDIHHTO6QfgRa1VcfbPat1O+?=
 =?us-ascii?Q?mImMRSMM41cD2K4WMaG1zEjAWKn7Nkpw2FZT+umv1r/dduka9xFpXTVsSyke?=
 =?us-ascii?Q?QnAqTojX0sMbQzO6nMYbuHi0m4QKNzxqvO6h6DLsRHl8s3T4fpIxaqwmtNuJ?=
 =?us-ascii?Q?KeXDOZzeIWkCnBgxsdpRA6UjGYzrjQIqz0+PRiGEZz2qG9DdNy5jqYigt+Fh?=
 =?us-ascii?Q?aT89PL6W7chDS5P4JE0zkhdOKcZMHUZIsdt4OAW2xrJrrBkJ3gWdCAtNEXkK?=
 =?us-ascii?Q?iL+dv+Z4EoE/mEnRVFrtWVgjRFfvMHRKS9Au0PBHTj4phuRixJCYMj7M9Fez?=
 =?us-ascii?Q?UgL0uIwiELXLcSfFEkgTMuaWfGGkS80MnFFGQ7Pj9E+gmV1H55GnhGWa2mpQ?=
 =?us-ascii?Q?kqM9qazzMlkD8W8uDlvLTup5kNYp4sPqO6nGiUltfMtrUGiSXkY9wAXWEgWE?=
 =?us-ascii?Q?ppRVI8YGCcYOHHEEa3NOoFzaJPWnW/lwucOjQ09/OdCrFH4XEUXASLBWwKOQ?=
 =?us-ascii?Q?2a4rw0tlZOb1aIdj79qlUdKNv1vHM6hkNNaUdf9DalsR0zToGDSohZlPASyw?=
 =?us-ascii?Q?9YuMYsZz/0mo6nLO3mc38wzEaxS+uOJjc9MSjWFg1rw/tOJgjZm1Luo6MjFi?=
 =?us-ascii?Q?mBJWkC5myKLj7wOjtE2QPrXnM+sr8mBH8X9GgxxtiBB8B+aTp0I8Egwu8yU7?=
 =?us-ascii?Q?OtMUOlQgmIENuoYcF1WBgZiDgPo89FXDwXdtNTl0o5jFjfji49tyA2pqRVCH?=
 =?us-ascii?Q?CpFvHRYriVzL70g3J3tlSeEYEoEPhcEPqCtsJQt+AiM14YfyHGxHSpAYTuMY?=
 =?us-ascii?Q?XoTvEI7+m7MwTT2q93dNs5OQWXxGbdJ2/uD/rzfHpKqnK+Ght2GSN9JtbqPF?=
 =?us-ascii?Q?aqiVDMVy497pFJhNY7EVruBQQMrTeYtGLS6m9ujVAZydtilF5XpSDRANuwjU?=
 =?us-ascii?Q?fy9CJA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d25189ed-9389-4838-a75a-08d9bfe0f8d1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 15:38:41.9110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QzDYgmQMvyqosUzlLN+dD0BD2gUXOx9/fVU2iP65nQ5EV/7RAvCE2+wK4kQ+7h713VrqkgyL13ZUNc5+cfwQFj8Tx1+lCZh5z7O2su4GDyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5474
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150088
X-Proofpoint-GUID: 95JoMZ4_gTXpAaVDcEhjGzA6C5JazEb7
X-Proofpoint-ORIG-GUID: 95JoMZ4_gTXpAaVDcEhjGzA6C5JazEb7
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change exposes ACPI ERST support for x86 guests.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
---
 hw/i386/acpi-build.c   | 15 +++++++++++++++
 hw/i386/acpi-microvm.c | 15 +++++++++++++++
 include/hw/acpi/erst.h |  5 +++++
 3 files changed, 35 insertions(+)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a99c6e4..55bca28 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -43,6 +43,7 @@
 #include "sysemu/tpm.h"
 #include "hw/acpi/tpm.h"
 #include "hw/acpi/vmgenid.h"
+#include "hw/acpi/erst.h"
 #include "sysemu/tpm_backend.h"
 #include "hw/rtc/mc146818rtc_regs.h"
 #include "migration/vmstate.h"
@@ -74,6 +75,8 @@
 #include "hw/acpi/hmat.h"
 #include "hw/acpi/viot.h"
 
+#include CONFIG_DEVICES
+
 /* These are used to size the ACPI tables for -M pc-i440fx-1.7 and
  * -M pc-i440fx-2.0.  Even if the actual amount of AML generated grows
  * a little bit, there should be plenty of free space since the DSDT
@@ -2566,6 +2569,18 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
                     ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
                     x86ms->oem_table_id);
 
+#ifdef CONFIG_ACPI_ERST
+    {
+        Object *erst_dev;
+        erst_dev = find_erst_dev();
+        if (erst_dev) {
+            acpi_add_table(table_offsets, tables_blob);
+            build_erst(tables_blob, tables->linker, erst_dev,
+                       x86ms->oem_id, x86ms->oem_table_id);
+        }
+    }
+#endif
+
     vmgenid_dev = find_vmgenid_dev();
     if (vmgenid_dev) {
         acpi_add_table(table_offsets, tables_blob);
diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 196d318..68ca7e7 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -30,6 +30,7 @@
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/acpi/generic_event_device.h"
 #include "hw/acpi/utils.h"
+#include "hw/acpi/erst.h"
 #include "hw/i386/fw_cfg.h"
 #include "hw/i386/microvm.h"
 #include "hw/pci/pci.h"
@@ -40,6 +41,8 @@
 #include "acpi-common.h"
 #include "acpi-microvm.h"
 
+#include CONFIG_DEVICES
+
 static void acpi_dsdt_add_virtio(Aml *scope,
                                  MicrovmMachineState *mms)
 {
@@ -207,6 +210,18 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
                     ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
                     x86ms->oem_table_id);
 
+#ifdef CONFIG_ACPI_ERST
+    {
+        Object *erst_dev;
+        erst_dev = find_erst_dev();
+        if (erst_dev) {
+            acpi_add_table(table_offsets, tables_blob);
+            build_erst(tables_blob, tables->linker, erst_dev,
+                       x86ms->oem_id, x86ms->oem_table_id);
+        }
+    }
+#endif
+
     xsdt = tables_blob->len;
     build_xsdt(tables_blob, tables->linker, table_offsets, x86ms->oem_id,
                x86ms->oem_table_id);
diff --git a/include/hw/acpi/erst.h b/include/hw/acpi/erst.h
index 9d63717..b747fe7 100644
--- a/include/hw/acpi/erst.h
+++ b/include/hw/acpi/erst.h
@@ -16,4 +16,9 @@ void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
 
 #define TYPE_ACPI_ERST "acpi-erst"
 
+/* returns NULL unless there is exactly one device */
+static inline Object *find_erst_dev(void)
+{
+    return object_resolve_path_type("", TYPE_ACPI_ERST, NULL);
+}
 #endif
-- 
1.8.3.1


