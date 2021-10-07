Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5197E425965
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:26:34 +0200 (CEST)
Received: from localhost ([::1]:35200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXA9-0007X5-Bh
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mYWzB-0001mw-FA
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:15:15 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:29538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mYWz8-0001vS-IU
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:15:12 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 197H4KZh009649; 
 Thu, 7 Oct 2021 17:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=v0TTphDwFaN/Wdhghh1zaKy9tK4deSAMaFrSanCMsIM=;
 b=Jw1citAaOUWKb/jn3iu7lxsgA+qDrffCi6o/1fGUq6JEfr/ZlBNaotE8L7HPZzqgMq7W
 xXEDpwzv5uisAgeWvGhpvAw1zS4tYYfHgDTRCtUrpqn/srmzQMwkys6f+B77syGX+ZR+
 TAfqb+o0SoAaWvn8/CzeMQ2Fx2qgsDca85kIAwmync/Tj5v1DNzcHXexI+qcVvrdCoca
 u/KKBM8KBo1s8H6sg3/LRteEJ7wN5P7vube2GUvRBE3aziHcG3EyCLYUvrpYamgpXELc
 VSVkx/9fevUlyyMIFTv/NDHySkhpThUhnShnbBFMnCC2Ppp4ejZ4HQkK6ZXE0dnj/16Z Dg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bhxbs38k9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Oct 2021 17:15:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 197HAnro066991;
 Thu, 7 Oct 2021 17:15:03 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
 by userp3020.oracle.com with ESMTP id 3bf16x5tk4-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Oct 2021 17:15:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7OUSXfAZJa3lOCjFYPRWcofcrgJH5nOYgNRcCDYY4aDLvRF0ilkarPodRaoAig2v2qZunSxPRmuB1rpRnLg4heDBjrfq5vdG717dMhe1NDd7r2mVDIoXo33wnE//82xQqmYGMqwX2WH6s0UOatf9DoVIjXI1NiRV5J0PzKTWRb5Zqh/N7k8tVCT/r5MR+Sx33PEynlsc/E0uAFuVVTXQu5WCVgv2u9+7V6RJp3rsiK0BvAkulC5760AupT9DnKPSYMsGhLa/ky5ZsmVdlJY9C24Xj6CCHZrYb20H8caIeOP3RoISgx/r1Jy+H8qIQH2MPEOtVbBrInaRdahJTEY0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0TTphDwFaN/Wdhghh1zaKy9tK4deSAMaFrSanCMsIM=;
 b=iZMk5FM7IzYcdypgxsG6c+0Zp/lE/e348bN/ohlaVCQmhJgeYBt/iiN62z9necwYa5EuPpoCmnju4JU2c+BUKC0ClWmG/B8f52L1scu92qdGmkc1VWJVgq94UibAYKjbAIqJSubT024ev0qoJ2jflKyB31l2hYsFteARpaxrf4JlcjgGQQrau0bAsdBOW4A3FJKtQVG++768PhhavCeh97LAzTlWr9laWknlPEsYzD+CFqxJ0N+smQc5VyFug7Ko4H5GVm+T9Kl8DfdydQHYAQdY1iszvnIaus76unUBuFXjPrMBKrxPSk2Im12NSWip8hTt/TCScEkRzrSINtPQcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0TTphDwFaN/Wdhghh1zaKy9tK4deSAMaFrSanCMsIM=;
 b=D0p4W8jF3Qum3Xf7u+fB74hpC6nhItbtekNjysM4opsdEgRVE939ZeuS4PjDb+AcYv7vVddSmUMSg2yvnR/5wGZ69Ai+4czlL2N9IzkQCinXdnhb6wqQNYPvLr6UrJsnljpvAtaTXGMsPhae8YyEA2ywSMJ/th0kg4lTqtXTWCI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB5524.namprd10.prod.outlook.com (2603:10b6:303:163::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 7 Oct
 2021 17:15:01 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%7]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 17:15:01 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 06/10] ACPI ERST: create ACPI ERST table for pc/x86 machines
Date: Thu,  7 Oct 2021 13:14:32 -0400
Message-Id: <1633626876-12115-7-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1633626876-12115-1-git-send-email-eric.devolder@oracle.com>
References: <1633626876-12115-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0015.namprd08.prod.outlook.com
 (2603:10b6:208:239::20) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 MN2PR08CA0015.namprd08.prod.outlook.com (2603:10b6:208:239::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Thu, 7 Oct 2021 17:15:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a8e4774-9e20-41d4-0202-08d989b5ff2c
X-MS-TrafficTypeDiagnostic: CO1PR10MB5524:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB5524337BCBF607301B0CC5BA97B19@CO1PR10MB5524.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kv3SmYZD3oVjClvOolRvukKgpk0R33oEK7oB5ue9l9RHp4heCQXNeFa5gnOwTrGqBD1acnvBCOtcfc3sD4bqqCvBEQ+uvmNr3VVXaMEm/HmMYO3dYmmUGZI//Qxmfu4XeRv8ivH/eWk1Lf07E8O2ncR7mo4MDh5w1ht/qLQLds0wZo+OW+r19wuLmxTF+kZXrBaEfDqrCrLH8byj9FAkYiVsK6XZbRnvpYDYdaDHqLMqA4BUxoyPhxUTYBve4c3YPfRwBxfjBI+T/DG3rGhtDDDhYh7D3lAbtE3B2+EzBQ/1Y9WePrr65+8NlpEXYf9Nb/n7PO2WIIPBGD434p1o6Vyl+7gACbEzF92cA8udJmitq+xtlI4k1Me86gsj4Zbxo64PAsSAygAdTevysKtoRmrCShB3p9TlQRNrhpFGI7cT755jopawAvRpdkRPgXUnOJI8PmRhl5TWck2fWaXblINsJotzDaactonzKqQQdRveMot6s9hbkt3bDlL7YwwmPAFWqHP7iHFF8DFOWzK9EwmHq3x8ck/+vJMxJkinseLjuotIvguzCRtsp3tp2LcotKrlY2IIYVpXTd4gxBhUn+tnTWsfXHeRoE6JEOjmbFrQP4o7x/5Y6IXjnVw0DIX5Z6lspaFinw1C1XoCuawB5Qp5C2O8w+AJQBRndqo1fQRt2bKKQh2ZOBcvpg4GfDpt3L2sfoJ8yX4kqFtKK/GNtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(6916009)(38350700002)(66476007)(2906002)(36756003)(66556008)(107886003)(5660300002)(316002)(86362001)(8676002)(2616005)(8936002)(6666004)(956004)(4326008)(508600001)(186003)(6486002)(52116002)(7696005)(26005)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P48/nn6CpVVEBjM/Q1aU4uNLFkZnXfLIn+loZK+dz7v3jEuZG7cLpjkJO+pB?=
 =?us-ascii?Q?38AUYE5OjVPWFpcHhunbcgZLccT+sv4zJ0uIs8X9mC7zXhMu64bDzyZpY9S0?=
 =?us-ascii?Q?Z1E5jqvmkz2Kg8sd3Hsmz0jVFgx9WJfa3G9GSve2Q4WKGMdMxA0fFGTQJLyb?=
 =?us-ascii?Q?tpd149QYJUlkOf04Kto+Ls1eNQXHnbd6epZjhDOgLrlTa11gluIBae8wByvF?=
 =?us-ascii?Q?QisgmDcpPfAskRHnbrw6V8QbdmbwDUiKyzoGZO4JEfnAzox6t/Ll9X+kQAIy?=
 =?us-ascii?Q?vyKTmK5/zSfrLehKg0NovSOYLLIuKKxdgVKGzjLVmm+k5jQbazNCf5prVv+A?=
 =?us-ascii?Q?uVDzv7rtLCmCy+zWi3EAWkqQVRp4SFqfdld2m2TXtshmG3soXXfE2wjeO4MB?=
 =?us-ascii?Q?6gQ67BWSlCP5C42/eFojVBDfhXM9muCwkLCeOuZqbaWSiXURxUqefbmX27Q9?=
 =?us-ascii?Q?cczPSu/vb+igTrtNggL72y+RtChdOra/uAKyrJiPGEccoORP8alrV3gTSFA9?=
 =?us-ascii?Q?BnnZoUY89BPark8TjsnJw2rK0XNLm+T7+PXQCTkHt2NWrZNwo4a7iIwgjA9e?=
 =?us-ascii?Q?YbcqL1itNUOFPQnoexpYXaKnDL0CzQpFEDfRRqZ6d9GUpZBP+uev5ueVaH9u?=
 =?us-ascii?Q?7n0P07eJRlQ/T/ZKCFcpFdYUj9jPZLjbkhwA6S04DeisZzqvkpMOJwSWenNy?=
 =?us-ascii?Q?4fCvze3J1G+Pw0YR1acSMQ+n9yVwZEyf/DTNUWt0F4cqeER4/6lDTkyyq6Qi?=
 =?us-ascii?Q?ZBaGOeeae6OQ/VX/RQlNscmm/pqnafnkDAFWKatl/T/IIoHwmdgoH2L0rNxA?=
 =?us-ascii?Q?lo12pQAywwlWIA7YdUWcqpqSzNEKVmwoglHnpJF8F7Knd/Ytm2f3XxOurX2d?=
 =?us-ascii?Q?ck4LXG6Gd7jpMXyjytArWXWh7V0ImXo6wup8ouDoVz/OzzBHzEKqnBYUYMe8?=
 =?us-ascii?Q?p232eZn827XEEHKyunXd6DFRV1v6hZUKeuE+wt1d4lhCPgD95cyOMi5shDBw?=
 =?us-ascii?Q?fkwunJYrDWWhl2RxQD7BK5V5Rz9odYTlHV3gjeIeIeMVMSQdZtVyTTd+DMu/?=
 =?us-ascii?Q?AkcbhVQ72GoDvQjZ0x68NIvBajm08nCHpVgOVSm0z0crCp0IksBODv0qQFaR?=
 =?us-ascii?Q?majwkGXmc29cGyQ0RmSayBxIjjwN0QRlADu5bm+FsW/HF7c5YYZnagUV3Y8J?=
 =?us-ascii?Q?KpvnggjlkICunEFn5+J7whbja1h238fd5byAK5lVB0dBespzstxP1ncpDAYC?=
 =?us-ascii?Q?umm9Ya83xlLL0bgcrOqWEHiXCw1t1SobR9QK5XgyecvWKB6/TtDYET/ndAbz?=
 =?us-ascii?Q?8HTTbqhgxFG3q8FCrZ2tOxyc?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a8e4774-9e20-41d4-0202-08d989b5ff2c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 17:15:01.4896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tve16BzVPq0ND/rbkleCkkc7inJlp58Y/iT5UkKqkW6VmPxRMXPm8vv2tRAczihsDsLCvlmDh13Fz2hCpU6Ptxz2Bt9q0NDCMbpLa4FAZqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB5524
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10130
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110070112
X-Proofpoint-GUID: KnrFGD09sRq1FNwPfCu_GlOFXOD3fQdZ
X-Proofpoint-ORIG-GUID: KnrFGD09sRq1FNwPfCu_GlOFXOD3fQdZ
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
index dfaa47c..9436063 100644
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
@@ -2441,6 +2442,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     GArray *tables_blob = tables->table_data;
     AcpiSlicOem slic_oem = { .id = NULL, .table_id = NULL };
     Object *vmgenid_dev;
+    Object *erst_dev;
     char *oem_id;
     char *oem_table_id;
 
@@ -2502,6 +2504,13 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
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
index 1a0f77b..6578254 100644
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
@@ -159,6 +160,7 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
     X86MachineState *x86ms = X86_MACHINE(mms);
     GArray *table_offsets;
     GArray *tables_blob = tables->table_data;
+    Object *erst_dev;
     unsigned dsdt, xsdt;
     AcpiFadtData pmfadt = {
         /* ACPI 5.0: 4.1 Hardware-Reduced ACPI */
@@ -208,6 +210,13 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
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


