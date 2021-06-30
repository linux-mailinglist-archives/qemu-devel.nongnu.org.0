Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F57D3B891F
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 21:23:22 +0200 (CEST)
Received: from localhost ([::1]:40012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfnt-0000kv-Bs
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 15:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lyfZG-00076U-2p
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:08:14 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:20310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lyfZB-0005oa-FA
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:08:13 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UJ5Evw024203; Wed, 30 Jun 2021 19:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=6KAZRIID+/0NtGEA/fn96cRtOeSuJYMUs76XSSunMtA=;
 b=P9eeBGIa1qk6FpOoDdKyUBSEbcDV5gDibx2SwAXWt+x+X7NBGuy+ZReBD6gkyTiC8+1w
 KKKPDYZVNssIt8blM8kUO61MZE3DLw5OTCTISoc+DGhwnNTqnQHs4wmDFnWZccTrYr6g
 K9+KK7SpXWk1wwWybv0P/kJ6em2pd46vEmHY4FVnpdUh25SluKj56GftFEfTaTx9oIC/
 JSDdU6Jl7OrrolSOyM6Kn2HuBTjT2ALs6xrx9+C4afs3Og9hmh38Eks/+Rnv34ib49yx
 IEMRo+heV5uGfvftdV4B0KRLyu/agmVfFgAqOiFZ1qn0+r8u8Jei/QR7p82OU7nCkz0o Vw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39grmaruuv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 19:08:08 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15UJ0Akc101205;
 Wed, 30 Jun 2021 19:08:07 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by aserp3030.oracle.com with ESMTP id 39dt9hqpat-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 19:08:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2nvLerr1MY4CdoOK4gGddYKCQNldrGAZmAhisHchtxUPkopsf4qeiA0neelqSARRIcUlQd3yml1zU+7oOd49+NNDacWGa8D9wllfmwM8+JgWqVe1O+v1LtXKMjbEn0DYOYnoohZ69qTqA9QYTSdTN5d6Cb7mx3E0loCn9nyRZbTeAiPLySOAiDQp4n/RfKC+ZZYqIkXCBEqvgGkYa6PmgZ2FwU7Hp6Kv7xTzARRRShG6HEy/W2u+TT9U4Qyos5gZKA3Lgs4Xh3xA0zDu3nJ1dV65BLTzGIjoybBDhn14KJyiKQSKVb/Cfkp7qw25uAlCEHvvwor7xvL1sNamvmHxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KAZRIID+/0NtGEA/fn96cRtOeSuJYMUs76XSSunMtA=;
 b=LN/0X4uR6uihyVZldVmch/D4T0Ljq+sXn7M8eU8ThD2Ve/62tmTHeOk4glLOVP2C6zkDTNu2JzU/GtyWltYdtD3TBRwjfuQ9IC0D/wYrdPra81hRX5q6kw31hmdHc3l48wlT8FqCep+Agxj0onuz1gWDiPjNHIjiHQ0CVTu8NdBhnFueIbm4Zjxi5FL3DiSG/ZYUKUTDO85GErA3brIuVd3+p/7xPHN5Y/H2yh2Vaw+U+eN7dWgos177aBpu1mD80mHuoyV0PmWnbXDLI/00Q8m2jRssnUi3lTUlUjAqw2MHVBoSPTkMcvmVdxEjvVRnsC+wlgQetaGrJy/wrPhFTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KAZRIID+/0NtGEA/fn96cRtOeSuJYMUs76XSSunMtA=;
 b=t4uOh0skSNh49/4wW+x2jn5yhyvy3nfXFQfzvjb/imAdlCY2CcGsL1HO/yPW/ss3CamN5FuzodJLmPIwFz4zUyH18Lz2FbGg1ZeGrFR/2P6GQmzUfVC2Ujows4i/uVAgAC+jFWV61OI9FFY4hs8h8VbbeydGqoMTmAkXav630VA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1758.namprd10.prod.outlook.com (2603:10b6:301:9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Wed, 30 Jun
 2021 19:08:04 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%7]) with mapi id 15.20.4287.023; Wed, 30 Jun 2021
 19:08:04 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/10] ACPI ERST: create ACPI ERST table for pc/x86
 machines.
Date: Wed, 30 Jun 2021 15:07:19 -0400
Message-Id: <1625080041-29010-9-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.201.23]
X-ClientProxiedBy: BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37)
 To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Wed, 30 Jun 2021 19:08:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebe495f6-0caf-4edc-ea3c-08d93bfa6315
X-MS-TrafficTypeDiagnostic: MWHPR10MB1758:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB17583BFA4854FA11856BFC8497019@MWHPR10MB1758.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 85S+FD0aoTwvgrihFPrw7pTtzRx27U94rpETpo+PceoC47vbSnl8RaTt61nbsIYVBSVfgiZarOKt4GvKW2P4cDqQqLLZV3IBt4LsdiGUxq+CBkZIWXDbPxdoIuh3ejSYz78Lg7Ag1USiJ+SC4igsbl1CBN1zzImPvTaOyHYTLQ5CAJW/ChMDtbUWGvhD8F6BSw7wT3r9mmw6QegXaoQNQUwneYdsBmOqecjvPN4GvC1ELyp39aSxFpqiLxhgBeGE1VdtfM5EMyBigeCSaPMii5VMQ8y/jO2KX2N0r//vxBeOc96bUm2bq/yYfKwfYt2l2kQYoHBuo5q4Qx86WQjrW2ZcU7zIweIxHL2bpJqwSIEAbE1AIcfLvlllxr5vnmZ7143Nqg7Y3R0zYGG0cM/m4UiuyUvMGuRKAngHDdQy3H8DxpMpJDCrfg0Urm/fpyMUU7POnny7V6VF7FFNHJAEwYiX/tdEkZqjeSyiczWD2aV9pEUprFGRzEPtURmlzBd4McbOWpzNorPQGAxBdvHnPYRpZ6O8ig24AfaA1eWPv8wE6lDo3y7OAkiCW2QX9bU+QFgqXAerVB/z62RjU7P0AJLqAwHzE537DaCEWixcR0Zee09qgb94LKWTlznn9rM1j2Mg8wxHXHH6qE4Af8Xqs3ZCFZqEw+zgvwCGFLk1RMaeXE3ThyJ2VYyyB1FpXEg+VZ5r8oYU3kFvsae+0z9XkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(346002)(39860400002)(396003)(366004)(6486002)(66556008)(2616005)(6666004)(2906002)(956004)(66476007)(66946007)(4326008)(107886003)(36756003)(316002)(86362001)(38350700002)(38100700002)(5660300002)(8936002)(16526019)(186003)(6916009)(478600001)(52116002)(26005)(8676002)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j0r+ogDP//pRu5mv+irhhRKswHjccqBSstkbDbnQGZfwZCcabLlVRzvN75oU?=
 =?us-ascii?Q?m3+QxskVMpkrIqsusYfdGlAa6F4hw6kM7W+J3IJHGIKc/t83fo95gj4riRF8?=
 =?us-ascii?Q?ru0LRvqG3vGvmqJpeVCWjrUJ1U0p5xsvvdjxmP+jKZ0QXhPul+v3OiLLZ6F6?=
 =?us-ascii?Q?LWT+DvKvrOt0LOS84y1iEMwjDw3lIOCE/8Cj/2xMdUIOGSkqYmDO9XyNZD3f?=
 =?us-ascii?Q?LKpTR/iVNpC6Zf0cgdg7GscL+88GlucZ527/Kpy9TLr8r4yG8v23ESUcw/9T?=
 =?us-ascii?Q?tqc21WQDhDoV2wxfnjAju6QLc0PLnqaCs26rBLDWunBdf0KkM9NQN5QenZmH?=
 =?us-ascii?Q?R1urKccrxMGgaIixNU5/9/lvM/r0M9TBmEgM0EGp/9cHPS6U2uTz5uujfI7/?=
 =?us-ascii?Q?QGndpFPKl9D03KaQI2quFQe7LJFUGHvwzTb0UQscZVYpvwi22V/YjfWcK/No?=
 =?us-ascii?Q?TuV5HhoUECiQl+dmCCaqXnUrEWLnUhUROkOHYgI/KADH8sQy7wlNdwGHWkrM?=
 =?us-ascii?Q?6DXkUBOm0BLUaxYvAqo13f+ZqiRD6mZ8NRQPsBV73+czPac/TWUoTDgpbEwa?=
 =?us-ascii?Q?7m7/YWPCa7vMZZkFgUE7t3nPZ4FszWhfDN4rr7n5/afD3dHRJgfw0r/7UTP+?=
 =?us-ascii?Q?8aIf9Wy7cZGzu3VS4J+jyvZbapi+i/LTG6OKA3C8nC3bs8lAhjZw42YuKbsu?=
 =?us-ascii?Q?kB9G5bqBw94lq9LbFPuE6QlEcMdRP8nWibDAGP/IPXdc55xifNsLlM0kyXhC?=
 =?us-ascii?Q?UolmZ/mdP7nfHflp97fpMwcqJIbSnWTBJ4jB5LiDJ42OWYC2qIHajiaX1C5K?=
 =?us-ascii?Q?G/9PdLHNuZJ256A0ektbin1A/5JK0yX65+40TfY9cNjYD9Q0037mmUsNcm4T?=
 =?us-ascii?Q?p/kkYmmezUnwsKnz+luCBGISPH4A3ZdqqgoFSbo0GnxLjqAYu+4LP5C6yfhT?=
 =?us-ascii?Q?W52fq3mZHZqTVhu+Hwozux1haGdE7zLP40+HsWs0S/simmCEwCD1kDj/ie+z?=
 =?us-ascii?Q?P+uZIh7etxnoMLBT7ErsfvVytAILT6r5BrHGi9C8zL1J05Lk8FdIM70kJRDN?=
 =?us-ascii?Q?nCqHJSZhS5uuqrCbXR9J+0r5Lk8PmbXrJHqlSVsOyR6XqUAYKZM2nhcJhSzn?=
 =?us-ascii?Q?lDssIp42q6XWudca75O9YT/vadRfkBSeTilpwjU6WcKLtXHF+Z23XfgQ2gkX?=
 =?us-ascii?Q?K9y+DKBkXGe7gO5uZRrOKo4Wnqb1JOW7OW99a6defd1QlSfiRrr40EtjRRlB?=
 =?us-ascii?Q?vCdffAC68pfEKX3eJFBYvBUqIihKCvCc1z2rqA2a6zT1bCvYWDqiKJp8DxxA?=
 =?us-ascii?Q?SJsvHX7C9enYbI/WxqTpxIB1?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe495f6-0caf-4edc-ea3c-08d93bfa6315
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 19:08:04.1770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0h4i94Orll9FnQjjgioGk95Eu2G7Kz/tGK7qcxa8cAmnUuD7tP2TbZCPqA3SXOqpIoVN458DPvT8Abs8CHdW3THeeftAB6peCm5qeER9V0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1758
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10031
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106300106
X-Proofpoint-GUID: 10V4a3tHhSWHgKwueNUUVkVi5M5neHmf
X-Proofpoint-ORIG-GUID: 10V4a3tHhSWHgKwueNUUVkVi5M5neHmf
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 pbonzini@redhat.com, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change exposes ACPI ERST support for x86 guests.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 hw/i386/acpi-build.c   | 9 +++++++++
 hw/i386/acpi-microvm.c | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index de98750..d2026cc 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -43,6 +43,7 @@
 #include "sysemu/tpm.h"
 #include "hw/acpi/tpm.h"
 #include "hw/acpi/vmgenid.h"
+#include "hw/acpi/erst.h"
 #include "hw/boards.h"
 #include "sysemu/tpm_backend.h"
 #include "hw/rtc/mc146818rtc_regs.h"
@@ -2327,6 +2328,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     GArray *tables_blob = tables->table_data;
     AcpiSlicOem slic_oem = { .id = NULL, .table_id = NULL };
     Object *vmgenid_dev;
+    Object *erst_dev;
     char *oem_id;
     char *oem_table_id;
 
@@ -2388,6 +2390,13 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
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
index ccd3303..0099b13 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -30,6 +30,7 @@
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/acpi/generic_event_device.h"
 #include "hw/acpi/utils.h"
+#include "hw/acpi/erst.h"
 #include "hw/boards.h"
 #include "hw/i386/fw_cfg.h"
 #include "hw/i386/microvm.h"
@@ -160,6 +161,7 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
     X86MachineState *x86ms = X86_MACHINE(mms);
     GArray *table_offsets;
     GArray *tables_blob = tables->table_data;
+    Object *erst_dev;
     unsigned dsdt, xsdt;
     AcpiFadtData pmfadt = {
         /* ACPI 5.0: 4.1 Hardware-Reduced ACPI */
@@ -209,6 +211,13 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
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
-- 
1.8.3.1


