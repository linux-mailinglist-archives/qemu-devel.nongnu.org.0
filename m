Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EE942FBD8
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 21:16:23 +0200 (CEST)
Received: from localhost ([::1]:59782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbSgo-0007RQ-RG
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 15:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mbSUd-0003wU-79
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:03:48 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:61400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mbSUb-0007qC-Am
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:03:46 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19FIG5OH006620; 
 Fri, 15 Oct 2021 19:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=jp++JV+8pxvYJ5zQW3RqnwtcuRUF57wFMcWCVyBOvKo=;
 b=mkJEMDtn5+HgPwaazOmTr+vnaNE3hjeWWzugz/0Kf7Vat/vnFXE0ctJ9jXV9RfvRzT8X
 /GyFgfqh6xs9CzxWe/kaYnZP+w3S5TM+lcQiVp2oV4al36XYBUKEQJuh2OM4Fks82Eah
 oMAnPZWcxyWzII9iEsSbTTwLXvFXQ1J2jdDbxUYDPniwZqEwhbAjqNQYmuDRdGawMVER
 CNFBcnsFNHj+AAYjk8pmMe+9wJOtZpOqtMuZH5eSZb+MO6+VkwzV87eVwhtJNzKdNCQm
 xWA8+rToahxC3iKkZatYJeZMwGpvez3oTVrSpOrmRe5sdMxd6nDw5CJkABDEJiosE7jn Tw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bqes2g7bq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Oct 2021 19:03:41 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19FJ1Jhr069241;
 Fri, 15 Oct 2021 19:03:40 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2048.outbound.protection.outlook.com [104.47.74.48])
 by userp3030.oracle.com with ESMTP id 3bkyvew18h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Oct 2021 19:03:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aeuGRVC1W17C6CaSM3Mkchkxugnzrx1EShC0OPTeOY1jFbvSEC4iI+cb5TNS2/hCffl72w2VrXPPGe4HxrJA98pXwCfSbIQTeVgTliEItA21UMojwXn9mzrW0sDV+VDcTzqBgyO/a2XfAklC6e7DakzgM+bub5Diz132bIjiP4yOhWqpl2aB19eFFXHPqYViRBjWjeqj+LmXwzEtHDloFNKRYiMp20y0+t9UF6P6oajm7rYKMrAB5ICObnVpeRlX5qa08tXnlTWI5dnpxHCWzVlxWqqct5P5KYVugr+g44d+QDbpT5WT5IRchl3SvT408OYVb4axMCbxr6ujN0nwyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jp++JV+8pxvYJ5zQW3RqnwtcuRUF57wFMcWCVyBOvKo=;
 b=RhFkRqCctF8JeCF1TJfwY+F8+2+9SJerhdytAOLHRqwwZcKOXfRe/+8ZYR3qxdlWJgdTudQxarm2DL8SuootV+Kr3mOr5+Mt5ueBAGrFmQwSZHVPcqASAjeoLdVuTfZmBESUgiN3JStl+z5bE3x6sMenCqpTBR4wZOsSuo3krTUuxbjz5Whp1jt4RC5OC8goiRcGyhqh3K7ccaXId4T0eCj/9k5B6zr7n8Kb77LzD5p88cz2WBhYCfg8stul7bbRnXTw7MzjRgmfhxj1bQWtmb1Iy2dyYw9g+GW9hmJvBO+cdo+Dhqob0h6KYhtolC6HJfYiJXPEkiqU3EQ+bOEh5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jp++JV+8pxvYJ5zQW3RqnwtcuRUF57wFMcWCVyBOvKo=;
 b=RV+WLXwxHt4aZfFMQ8DXos8RN6nPJ6t3Dr7j8S9tY4HVlo8BkfLz2wKJ/JP/HyM9EMmTsU6/jwWbOa6Wm1/aVNe8oJ1enrVBNhlQq7Gv994dYOgaf2hCxFH/UeE8szxNXHcB24BBrzvhAwcwLEXs2C5Hp2YpJjK30JduGRbj8hw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5441.namprd10.prod.outlook.com (2603:10b6:5:35a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 19:03:37 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%9]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 19:03:37 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 07/10] ACPI ERST: create ACPI ERST table for pc/x86 machines
Date: Fri, 15 Oct 2021 15:02:57 -0400
Message-Id: <1634324580-27120-8-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
References: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0129.namprd13.prod.outlook.com
 (2603:10b6:806:27::14) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SA9PR13CA0129.namprd13.prod.outlook.com (2603:10b6:806:27::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.9 via Frontend Transport; Fri, 15 Oct 2021 19:03:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af76c25d-0230-4be5-e4dd-08d9900e7e83
X-MS-TrafficTypeDiagnostic: CO6PR10MB5441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB5441028BAA7A4D5E16DF1E9C97B99@CO6PR10MB5441.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cb90R/NzKXR3o7C4G3w4d194D0EsxIxz0syWa3IxLExWAFgkNE/EMqO5j1taz0AZMytoRxJhSf3K9a9fYVlabJn76coGqiMbI1mRv6anMT8cDeqgEZ6VXlbXb4LrIhS/EzCRw2gtFMGp9z5sZI7euqC744Q5A4pv8lyWM9CVELJQs4UP3DSaZoC3uyb59z8rfdVi+jOk/aZMzvhSbGaQnm/TcAZWxHl8tHbxdQ5+weC6evHUk+bjFyzZg2hRoUtykwT4Jmkts+J+zNytqkiy7GQ8AyqTJPOmXhd9WP7xrCBgNaD/nrwOtOS534Y2ggnSf0tayKdwpujF5k6lKqmg+JwXrOQXOLM2zrS0Z6Q/C1WvpEYD1y4NOXG3RGfgOPlZIayFmL2Yo4rA4NxHbijpiqKLDn3eKnGLwYTIzxoYK13z3eswkBr7Yvh3hbDjn7yYbKNXSIC1z/Dn7eVMdfHN8eMeBuVy8/VYKwgsSIfWRmEdhtKeFtJ68+jWnMj/3eaSXSOewvbrdUCa1iq8cmntGTQA7jDLIvgxUkdIHEZJBXVvZ/EVTttNdycN4YHMwrd/8seppp2jfhA3QRtte7nUip+SdDfgfdhz7Omgb84AvbHYi/uPgDMK8ZV7HGqjiL6f5Bm5BChW10s9r8EyjBdUxsf3uZbL8DUHz1HvGI6V5sPw7/Smi/Yu3MiVVs5nbYrmp59cO25To5VVauVj8HaOFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(186003)(66476007)(66556008)(66946007)(8936002)(2616005)(86362001)(6666004)(2906002)(956004)(508600001)(5660300002)(7696005)(6916009)(4326008)(52116002)(8676002)(38100700002)(316002)(6486002)(107886003)(38350700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cdVMMGgil4L+56AxgbnszAygx/nM+sON/EE3mITeUJj3s93OREHGst1p2EdT?=
 =?us-ascii?Q?vDBXhz2NdxK2Xskby5xLeEAnTzyWAQR3rkeiiXwfetWmHCw+F9WwqRsT++Fp?=
 =?us-ascii?Q?Nm4RAtvMjFMM46ptxEqcRo2jxwIVQ8fRPpelsUbju7VJADAm55LifywhWla+?=
 =?us-ascii?Q?cRo1eWx6J2FxSgMyHFRUnBtHigrylzIl0reA4rZfVoNR1/3E4nqwae/R4IBP?=
 =?us-ascii?Q?b4Fwfbavf1MuWxQAHe9j7mfP64GZJD/cGA6btQfoYZLLB898nngyuP5avH8R?=
 =?us-ascii?Q?ODQPNXJDWdWIiZvmQcArjeOtN4M0SRoebveJv+6bPO+6sAimvi9sRAC8ct8q?=
 =?us-ascii?Q?Sz4XvH9mprzgVvfQ03v8GbKR1/1H7Gf8tjhsLqeZwBUSWdTsaZGBS4GbFzI1?=
 =?us-ascii?Q?xo2phlITTmg2Q3ztXQ4fyQgv0zPAC6mWysJLarNUY4H2ihHd4ZCPvQEvta2/?=
 =?us-ascii?Q?IWk87aQwoUFaYXJza7tHgarhRvefpgg1zJFQepXXpVhMq0C3s4k/gG9e6kiy?=
 =?us-ascii?Q?4D+I7zgVFs6kn6yQIs/K9oZQc30Uyy/LWvo8Yoq918Kdee7KVMe8Y+74ZQE7?=
 =?us-ascii?Q?gM8z9EW5Etg3Zq1aUrbztYYQnZuOfdamtZK7O3LdPytkCHjOflwA8RRzzrAK?=
 =?us-ascii?Q?Xl8G4oKaxlXUoBkDRlhgfrQyhpE2CQOYQhszQbcpC5Zahr9ubg9nuA8O116l?=
 =?us-ascii?Q?xPW4bDOhnTsacFae1G6z+hAhlgPy7TKJzWDC8580KFR1EVmC5NqwW+tsxa8M?=
 =?us-ascii?Q?mg75vBw+yaapEOncFD2I0bERI21UPVSzMF7BR8uPyVTZ9T8StXs+gpkPm+vJ?=
 =?us-ascii?Q?198JDB2iy6rfNP/EQVnqNbiYDzQlVm9Pw45tbkiKsYikLfb2wX0YOCOVwgvv?=
 =?us-ascii?Q?nubhx6RdG3ujjkUnTlG+IcgOGRTFUS9/9QLWjBURQXjLnTyJJyI7os+Cufim?=
 =?us-ascii?Q?ChuZiWzWoH+saq9yAvJICcBYEjUnfoFELpptLTa6e8LIZ3cT2+3hXngS2zu5?=
 =?us-ascii?Q?C6/a62nUnMI4VrGKfJdBK3EUEw2onYSoNU79xwJTcFBH19ZIXbWvnPbzNMTh?=
 =?us-ascii?Q?Bydvxc715iXU9EOAx8yxNKUF+44Pi7N6achuw8aSTflXh8AekEatpEyzOpot?=
 =?us-ascii?Q?+eGQDdPLfJycOTjgp9G+gJwDlfr8ZIJ/See9ip8xPbemhDmmmmz6YnKLlQQa?=
 =?us-ascii?Q?fAcpGKfIryzyC4yCptoZ7fQYfJaHhguaatn+DR33StUmlcat0tsfUnbAsqXw?=
 =?us-ascii?Q?DEIixzAPszoz1ccdRr7WG5WSTEN6Vks5/8SZmu3RCDa9hwpkvQlLdRB8I0Ee?=
 =?us-ascii?Q?jIsLvBXxZFYWPW6DGXhjn3dv?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af76c25d-0230-4be5-e4dd-08d9900e7e83
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 19:03:37.7773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2ZvBQM82eNtfm8rsP9Yzde21OFWJzRtfJfEhgYHALiYQonOHzkuGnwKvBKDMa9ezgYWyAj8ac43qj8O44AVnBuvgX7kpAJjnDYjZqQ/KU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5441
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10138
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110150116
X-Proofpoint-GUID: ElxfQWcw5T2WvcLyT-ViMudKyRTmczgL
X-Proofpoint-ORIG-GUID: ElxfQWcw5T2WvcLyT-ViMudKyRTmczgL
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change exposes ACPI ERST support for x86 guests.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 hw/i386/acpi-build.c   | 9 +++++++++
 hw/i386/acpi-microvm.c | 9 +++++++++
 include/hw/acpi/erst.h | 5 +++++
 3 files changed, 23 insertions(+)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 81418b7..9c2f9d9 100644
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
@@ -2499,6 +2500,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     GArray *tables_blob = tables->table_data;
     AcpiSlicOem slic_oem = { .id = NULL, .table_id = NULL };
     Object *vmgenid_dev;
+    Object *erst_dev;
     char *oem_id;
     char *oem_table_id;
 
@@ -2560,6 +2562,13 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
                     ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
                     x86ms->oem_table_id);
 
+    erst_dev = find_erst_dev();
+    if (erst_dev) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_erst(tables_blob, tables->linker, erst_dev,
+                   x86ms->oem_id, x86ms->oem_table_id);
+    }
+
     vmgenid_dev = find_vmgenid_dev();
     if (vmgenid_dev) {
         acpi_add_table(table_offsets, tables_blob);
diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 196d318..662c8ad 100644
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
@@ -158,6 +159,7 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
     X86MachineState *x86ms = X86_MACHINE(mms);
     GArray *table_offsets;
     GArray *tables_blob = tables->table_data;
+    Object *erst_dev;
     unsigned dsdt, xsdt;
     AcpiFadtData pmfadt = {
         /* ACPI 5.0: 4.1 Hardware-Reduced ACPI */
@@ -207,6 +209,13 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
                     ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
                     x86ms->oem_table_id);
 
+    erst_dev = find_erst_dev();
+    if (erst_dev) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_erst(tables_blob, tables->linker, erst_dev,
+                   x86ms->oem_id, x86ms->oem_table_id);
+    }
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


