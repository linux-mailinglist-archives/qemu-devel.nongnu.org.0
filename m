Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F96466A7E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 20:34:02 +0100 (CET)
Received: from localhost ([::1]:43104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msrqC-00027e-UQ
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 14:34:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1msrTU-0007yH-Up
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 14:10:33 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:1440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1msrTJ-0006Sw-3D
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 14:10:22 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B2IRjZu015785; 
 Thu, 2 Dec 2021 19:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=MzROMZhVhh/fxWqlr70+278QWEXvlwgSOAUExxVSFvQ=;
 b=zbqpIfFCBKUbos4gBm39/Cbh+5sKlG2pjYV9YR7mcXAoFhjfuoKVZTczMHZSnEPUEoI1
 H5YIXqtPtsrxIhDdTbD87ZA/7WC0D4Il3+CCW7/04cmGxV5KWtCRZ7IzwD2CmbDk2gyB
 o55p7oUlq8G8Sfn74F/4gigZR5f5ui8QgvScjHN7J2RfFxqJKS24zWjSLVPy5jJJU7Gt
 Y+ourDHZUYrTu1U1mRiMxwzuiwH51WRLLNlMkq0PhXJVM3PXaDoGGFwQOoiLm48krJj9
 2hRM6FIRMUZEsFKuL1BtaaAc9xmpygCauebDfw/S23yqHVfXxymUp+lL8yvJfi7geipi hA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cp7t1t6xg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Dec 2021 19:09:57 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B2IoPnu115630;
 Thu, 2 Dec 2021 19:09:30 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2045.outbound.protection.outlook.com [104.47.51.45])
 by userp3020.oracle.com with ESMTP id 3cke4urwa1-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Dec 2021 19:09:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mEvSjJMwOjOAAL+62BdbQ0DfKJkK7HzHqX/VyPp6V8a0Jfo63D89AX7SSepX4KnYwN6tC07ijmr92Qyg8JbCUX/2tMjjvyU9pC7m8J1il+AIdxgwBzVOAazfEXxY+mMUd2O/yCkVTE0MhEfYg5l99WJEbTyb7txzB2qEdvJA3PHRDT+VSCAjzvPg7uSqBu305diUAqADYLGrHXHI8kRdXpwqWHsx8kH+VMcKZ3qIfciyklCYCTdFRXRA8hKvNWWTniWxAA0alOgCZ0VZcV2+fxCgtU0TEcz+mKWjKSmZjLGScmDb9dp5z/6F1f38+S2St/NIQZZ02feJ/caDLgL0ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzROMZhVhh/fxWqlr70+278QWEXvlwgSOAUExxVSFvQ=;
 b=Bkj5l4rCB4Cd1qrLnNZDrPAJo7Xf0w4i22mzTsXI1k2Rk0ZNox4NeTQiwSNDezyQVEF56R3XVHWzsS2glDh/ufDzJPbLrDsS9QehoobkBzLdFJPaaVfW7OWb9aFD53q6czlKHy8IDwK9OYGhBotjfYF+0AttGYcVtFikA1i/M3eost/HJv+ySBlx3WweEozeDaupIqb+3vTrS2OcDSxsMw7CYq+ogIv8ARYJd11WlVdhlpZoHIn2xjI0bNgxSHHDB2o7FuQOMAqV8uXzWX9OH0VoDwh5DpKJz/zYgzEqbGszpOvQaT8VthbXSd+rcjksNpggOSImlxepa7dLOdUZKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzROMZhVhh/fxWqlr70+278QWEXvlwgSOAUExxVSFvQ=;
 b=FZL3E+kycVUmv5jcKr6H60YS9xIYSda43HBzVRgwXlmTkiJp3vhh145V//7dWoIGcqDNZ3Q2Z2nK0rULzvlnEYO9Ld8PddCpO705k1/vyCP3s1jO2xQmevTJfbCiwQEJi9KU2PRIkVEzxrBYiRhK4XM2RhXI7VHyBhnKBDsf5S8=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1760.namprd10.prod.outlook.com (2603:10b6:301:a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 19:09:29 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4755.015; Thu, 2 Dec 2021
 19:09:29 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 07/10] ACPI ERST: create ACPI ERST table for pc/x86 machines
Date: Thu,  2 Dec 2021 14:08:59 -0500
Message-Id: <1638472142-14396-8-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638472142-14396-1-git-send-email-eric.devolder@oracle.com>
References: <1638472142-14396-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::19) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SJ0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:a03:33a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Thu, 2 Dec 2021 19:09:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bca55b1a-e200-44b1-941b-08d9b5c7440d
X-MS-TrafficTypeDiagnostic: MWHPR10MB1760:
X-Microsoft-Antispam-PRVS: <MWHPR10MB1760D97D8EA5EF0E9351B1E997699@MWHPR10MB1760.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lDV2/bIZrr3jFJ9l7S359XXse19Q1f1s+jitvQiUleCwNqeFvRgDRSqdZzeRPzy//3mDvQNfDASZVzdJIodHDAVYGPYfY8OK8xGPAbUgnn/TNeY7lZe0L1/UBK01Jx4mvWURDudyQ8ZN24a8R1TT2wP6NwOBVO6lkjZ5fvAeYtPEPOVQGEBSTSmnXPi7Yx46/ah2k32RnatOOLUG8XWSv6wwr+fmcWkCVcUX+RrOpIuipRtmpkfgc7QipBj5THGK/oou+TQ4VumLoI6q/yF5Fg9smsUmXfsaLusHfsHXfAfli7xwZ7W3QZCQrxSYwrZ5+/sJb8ioBcdwRUD1KSIBKqoK9CXb1ItWr+sVPC50RUxL12erh+qLMiteZebZl5RQhjfiEOJFBHU2oMhcN9DTuBfoSwvZduozVnYrBQXuvrFP/RceBhXmfnWgVWKUWboKQ1OdPwfkNR1orJewgqBnjB1JMNhzqPV9u0oOclYQYInKn74c2nDhbyfab148meRFeZcwbxJIiFnWQQwA3gDRH6dWoZvy0ua7CYf+4SrqmJjXzl/IKTaSo59qedrJhC2Kxcuwo0jeVseWJE3eR9dmRQY6wpRShYySCpA/loi4QTmA8gLrOCNCIuCWHAaWTWZX8vs7OH6fuVT8FT5fWhw+so6GYYMGOnAeZf12jqw7MYEGEg8g3/pcyTA0X2SNUG43pXNK6EJnwn3VkfeD9Ch5oQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6666004)(38100700002)(38350700002)(66556008)(36756003)(316002)(66476007)(66946007)(2906002)(186003)(6486002)(8676002)(6916009)(26005)(5660300002)(107886003)(52116002)(8936002)(508600001)(7696005)(956004)(4326008)(2616005)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pi4xPaaULYnMfFaz+64PViwWn0fbSsSDqaLmxo0+cT9kEQX1Pv77pqcQ/hU2?=
 =?us-ascii?Q?6MrsTbIQD9wenRrvt0nSqYoBMBYCLCcx58r2NnUA5HgYWFIssfU5xqwwUeOg?=
 =?us-ascii?Q?1FiLxkxKEO53MDLMO4XoMgHUqpZi1G4hsS3HPo026Qew5cJLa7IWDlhvydIj?=
 =?us-ascii?Q?/X4dIBgv8K6InkJfRNKblGVgPT027pdQ96Y24Wv8ylJ0ICBzBR2dwbAjLMxY?=
 =?us-ascii?Q?pP1+S7DxNVAwOR/54XaNq8wDqJN/Lxy99umQ23COI5zI77ffh6NmaKsJB1lC?=
 =?us-ascii?Q?Ckv1nyXQFB0DBBgS0vw2sYzyg2QkFqPaOoy0fTmRoZIS6zAQOmQyPkLEXBIq?=
 =?us-ascii?Q?pfGP61kfGPEpv2M29Uqt3NGzNaU+lI8lYeAbgRRLBkjHojID7H5+/nIZRe43?=
 =?us-ascii?Q?lc0JsCLsbpfpr/i3Ye7zRhWHJClKujTqjJYvCxdBlns6G1qRxHqkTGfEog3+?=
 =?us-ascii?Q?IzMalxmCKkbFBeW36/GqQAh4zQuc6FMwEZjyedu6RSiOtnlgY6yfgFPSnzVj?=
 =?us-ascii?Q?+1tsR+J2YJj2vEq+gEFIxG6RwIhQsBQyY+cw46pjKwv5cZXKfJ/OZqnV5BlA?=
 =?us-ascii?Q?l1shzIoMtBvI94GAK1Fng5Y+yxFe3U2536LmrVc53mQ8nvkJqRSPxOIBYuHH?=
 =?us-ascii?Q?lgQzO2sD8f+zPtYfD8IOKJ4jLsNN+5zuGJTamiWBjHNyD3q6FZFp8i/su2V7?=
 =?us-ascii?Q?pu4iA70Zgg5xsA6tZ/VDnGXE8KwO/GbVaw4PShbLw8iJQxw1TT9paOiY+cCk?=
 =?us-ascii?Q?H+ZFWHY1iVmeeF0S+UdZlwGS7L/9b8E4dCycpLTN0+ENWWVwDJud57cHXrMz?=
 =?us-ascii?Q?DYxJJytPXA6ENzCJzoCXlbzBwzeC/Cble0p+8HBMJnltW/jpWQt21YUcPg8K?=
 =?us-ascii?Q?Su/PEwMBUW0nl1ykpGWFHpeUX4Nl0E0odiJeKb9i1QkMCrdkzpdBIGdraGdK?=
 =?us-ascii?Q?wHgChhJGoFskWiOaO5WMvmC0VTmAKnX3rNHCEno9L4qG9oqtXUxlC0LsbgKY?=
 =?us-ascii?Q?pAvydcD0kbSpEP7C7GET5s7BV8YmEVU1olzxIyHpPLdEDN2pkI1p0luOloUH?=
 =?us-ascii?Q?2FsJ6yaRDKu4rXFc3vx6AQSMiwcvVZylfU53OWwmL1CVz/Co8w/6PQ3tjlAK?=
 =?us-ascii?Q?I9kJU6huN2FXH/bSPJGIuL8Sk5AD75lp4enHjxdfQyWx8psMUmPCgFraaY0l?=
 =?us-ascii?Q?LaWcuadSb+/B73O638iXjQQHF/wzePHimCuMsVLbZU29vF1/oqqTs7z/KWq4?=
 =?us-ascii?Q?5LHB03nBHu7aKNJUfH9eizNMeQ27ln+G1/z3s9/cYFr6NNI3T0sqwyDLxP5m?=
 =?us-ascii?Q?zJtn+PK/X0d0/j+UxMkLctk/DDTbHHcpKh656btmDkKbzqWV73LleKHJgJNn?=
 =?us-ascii?Q?S9gVkFNLTIFQchKarysXpqkBQSu7bN+4+r9uryIvhr266AUylPWzx8jODvha?=
 =?us-ascii?Q?fZpoBKbc9i1pNtjnWa81b98sFlXKbrg2w4eBT6l5I1e1SFIi2tJ/hqNV0SE3?=
 =?us-ascii?Q?4+9khaFjQHDvoNWIftHg7qPivQF124W4rVMoLa6LfneDbugTyDKe6vd85kBD?=
 =?us-ascii?Q?lw0e6rOEXcWfN9Eyl3w85X84jp2wDzAq2lKxdQ4tkHU36sZPn7jU4UUwbfn+?=
 =?us-ascii?Q?gD6stKeeaYoNFbPVo527wjAfKNGSl8m+cUIQNtLDILQZVkoBX8ut232dMqSJ?=
 =?us-ascii?Q?dROpSQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bca55b1a-e200-44b1-941b-08d9b5c7440d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 19:09:29.6358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9gN4sX5Z8IHSsc+daOqkZ4zs2W62kPDDoOZhNT35WySPd3j4EOyn2glT3vCPjPYkQ0Kf++++T7st20F1J70x7qJG7rLE2YiRArurgw3L9pQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1760
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10185
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112020121
X-Proofpoint-ORIG-GUID: f5k01bcl1fMVFRxLYb0t0wuv38AKkNDH
X-Proofpoint-GUID: f5k01bcl1fMVFRxLYb0t0wuv38AKkNDH
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change exposes ACPI ERST support for x86 guests.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
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


