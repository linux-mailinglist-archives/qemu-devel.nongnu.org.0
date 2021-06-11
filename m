Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79443A48CD
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 20:42:48 +0200 (CEST)
Received: from localhost ([::1]:51638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrm7D-0004z4-V1
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 14:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lrlwo-0006m0-PV
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 14:32:02 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:44966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lrlwh-0007iE-1L
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 14:32:02 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15BILalu007218; Fri, 11 Jun 2021 18:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=+secDQTCREvhT2Ov5DNwF+3Bdernw8WLFLBJsu2DSrY=;
 b=j5HSj45dBsGzWxVC4v5Dfo8Odi2pFbZdRUZWg0tBJ98dB4c72Bip/9nv28bM/BgMDVYH
 0c50RjNDK+wkC1sLJneSFH1gwh3gEEQOCHNWo+2/4N3LhWC/bT8LVSBqdbs9gbNxbPd5
 g8+CGP+D+YM7PauBq09VJO4SVNcwX979MRBi+0/Qdy4H6MhcSTcuQU6f2I0LFdL5pUFv
 C3SThf+oixrzmdMXt313zsvQNRaJaVYSf4Q+8LCCtdZv/h2w5placsUgc/WUF/HrEbPq
 8NoEmheLz3+1GWLKiMsjXGkXar3XuSfb4EvNH9GBo2yZ2du+RaL1HIYvTbtgDPtfK6ek IA== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 394agy01wh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Jun 2021 18:31:52 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15BIUw7o163567;
 Fri, 11 Jun 2021 18:31:51 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by userp3020.oracle.com with ESMTP id 390k1u5ava-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Jun 2021 18:31:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ob7/DVbTmiKcOzlpXfm+Uzftzhhc4wHikRoT48Do8ZXC43DGyFiaI5Jh8+jXIvAsWomoYwvPgM7c3nqhculgLLkINGunPPQP0MYXlV3aCObcSTBidWKoKwpk82xtiySmWSsqUx+d5WLdNV8+N5kgmaYtRsEQG2+TsrfLbz/r/RqvC9/eANYfNr+8GfhfxduxYuhW6DfA2hpjJxasUzcyDIkjCLsnxPnek0twLwQPUy/a3uHugvbzuiqV+je9rqa017MO7IBTJWXdpGRIMP+pqmhOyHcxexSBD+6VLu/PDEcBWn9wofRUbjm/H5JcARlXWbz1ZvUB/DDNrnsakcQTSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+secDQTCREvhT2Ov5DNwF+3Bdernw8WLFLBJsu2DSrY=;
 b=arUHTgH5323g3xhr1m+Axp0lBsF7zKaPfaiS1akkiBj+8y64FEyQeUt8HAuDsxUNbPir9XPTL3AmkdRUFXoapukfOyAfUUeBgW/Jg5CG2a2z4naioUhUG/+I4mGidJem6R9Q4x8RQfKHNqYX4X/ZGne+MeS1lINzgg7D6yUF5+E5T9kHZcksV3A6np9/8nQLTw26VSC+JQsHAAkmKvozwvUgAmR7hhN5HuRQ4+CmbNiwMiZSbC63eO/PL+kHizFcV5KfK3ZRgIPTPYgVDN05jQu4oeCmiQ1LOFN9dWIi4lnzFqndMdFYPtMz47nBZeYDJRf1T605cJ/p+qY7xVgrOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+secDQTCREvhT2Ov5DNwF+3Bdernw8WLFLBJsu2DSrY=;
 b=NJUSDuBT05v9tyzxmWJ6qriooj4O+CndiY1btHy+e1uT7mDH0whlHTdJeJpXo9T1iHz+uovntdTjrACBVrIsO2oaXq6vmWq40Ne8poQ44/gb7CKMd330sQDMTy8JGFXh5LAABn8+dCX2AcRTw71KZAF67OKPvtNsNnuU6wQHKzY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5457.namprd10.prod.outlook.com (2603:10b6:303:13f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Fri, 11 Jun
 2021 18:31:49 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%7]) with mapi id 15.20.4219.024; Fri, 11 Jun 2021
 18:31:49 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/6] ACPI ERST: qtest for ERST
Date: Fri, 11 Jun 2021 14:31:22 -0400
Message-Id: <1623436283-20213-6-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1623436283-20213-1-git-send-email-eric.devolder@oracle.com>
References: <1623436283-20213-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.201.23]
X-ClientProxiedBy: SA9PR13CA0097.namprd13.prod.outlook.com
 (2603:10b6:806:24::12) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SA9PR13CA0097.namprd13.prod.outlook.com (2603:10b6:806:24::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Fri, 11 Jun 2021 18:31:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bc42345-3dca-48f8-b87f-08d92d072cee
X-MS-TrafficTypeDiagnostic: CO6PR10MB5457:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB5457B5C6B0FF33ED53FEA75397349@CO6PR10MB5457.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J27dl7GFETIpF4ZJaFyKk3H+Wwwsk++2GLVjyWGAAOwTkx79jicirBeAMfUPNOvTWvHli+MblD2X4Ctwj2r3ukm2Kqtqp18l2/ab6DTeqPZuLdGkrU1NDv7VpYz4MHQXEnVlPiRbu1ZGgQvfYkdWfW16oRRV16JRkSvcnOfw6AigimO5eo+n+FS8DdVFbrwa322N2MUX8pLJkOhtNq+p0pzIJCjBikpNdRgSAmpGAOXQA1bSLZOVvs2IhM4ytxqJ4Nn9XOI3kxvaaaonA30O1Ju2Vw4TiQ+57Yz4o9BgRTOWwikj+TIGQyfq50hZ3cObYiAOy7XFrl/mPLmZ3hWx+UrNH+rDtZMWiWXgQMzYY7VK2pNwSKcpSlHrwETZQ1/EGjLcEvdikuLo27YYd1FaHtEh8GXLFCESEcZNk77zbKIJ/wo6SPKHhNRxu4hYqNUh2fHk7tqw8I4H3ULYXcpB//rT2wj66lvLBvxzaMX7K10lCobU1gtXVYVUT99IoLd+36INJrNQyid8f5s5bouTEEC/9qI8MDWCMIFwnFjgvSfdND2cBqXPjNaaNIoeN+6iymM71nsI8F9QN5aZyQsoa2D8mGUDvHpvcddKysyFqZ8uMUuHAxSQD4SuxlZXYnwfMH8EcQlm7nnjebHyluFhFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(396003)(136003)(366004)(39860400002)(7696005)(8936002)(26005)(36756003)(52116002)(6666004)(66556008)(186003)(6486002)(478600001)(66476007)(4326008)(66946007)(316002)(5660300002)(86362001)(16526019)(2616005)(2906002)(6916009)(38350700002)(956004)(8676002)(38100700002)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hEGVEJB3AaE5alEXP3eUOTIrFSM8dXbTZyzt+43xZNaWT1musKh1GhMMK4sF?=
 =?us-ascii?Q?U2B8cUGpirPGFY3kTUKmjEvjRkTIadDJTrgRUUcU8JvIlLcBJQFtroA/qzIh?=
 =?us-ascii?Q?uzhNQ+Y+1MEb3WD5HX7gUsWCCNde7euu5URDwwSjra+AhFFY51AsUbvuSTmV?=
 =?us-ascii?Q?XvGxLvhsKZllYVn5VKZfkL/j0yjvBoCcSfB0/eeZedoDpUrkpWnzfqkejcYh?=
 =?us-ascii?Q?vp9Uo7Um7loJ0NPgBClqycqjOHMrrsj7sv4tnn5olgUp5wFpiyhvTHsimkbs?=
 =?us-ascii?Q?LvWEvUwslVPapu5BvQs9UJTqihjFu7fdFPw81Pptuzp9ZsC/HLwBJ9fBhCp1?=
 =?us-ascii?Q?WN9hdQnhf9OCRmO7qiS7C4tsvAl5KurUisf2B9WsyQiCu1TesCDGZq6zqV14?=
 =?us-ascii?Q?XloIX7OWo4B41X4JTZ7QktJw7s1oai7CDyqFtJNPacS+pwajoGNtrbozmYIG?=
 =?us-ascii?Q?RCvvGma5/bL0iTqcgcC9WooDdubgWGvLkw5usbCW9FUNUa6ALIPGBHTrZPIi?=
 =?us-ascii?Q?wAuLiwgftnxqAWLnrYbCjCysOohHhUaPOa4jRsatdwV0WHUlHehi844IXO/9?=
 =?us-ascii?Q?ZZjH33hZvDqPecC0dOu04ZZ58oEMFbofbC3SkJawBuUlj8kRm8NzJE1Dpw8n?=
 =?us-ascii?Q?dLg21seACaAZQOKUZlgMaxBaHThNlCumuhXZVcI5pzYYGNvaWSZpo3YXoXnF?=
 =?us-ascii?Q?7WD0t4G850Kws5Rb1+cAJqGcL4Hg3fMk5pMD9+L/63ZnBgqj6iPktxNpUwcr?=
 =?us-ascii?Q?+4MPBIMEgtLZaqcJf6ndI2EZzIxK0/gWpZLXfR68zqBvgasY8r14p42W51Iw?=
 =?us-ascii?Q?Gq9myaD3Vz9NwqZhyTDvowUBHTYm4iI1tiefNEaCjyTrPw/Nz9cF3kU4kqw6?=
 =?us-ascii?Q?qtcN+DpLFbCtpW6YZWKD6NvEXeX7PjkWc1d93CbTRSf4xJK9IO90u30hJVld?=
 =?us-ascii?Q?3C/T+pdFbUHiFUqmtLhM2d1tYsg4KhJZROK5ab+lAT78Zw1lRV9W6HIiY0Ju?=
 =?us-ascii?Q?daIQw4p+MWCUDUQIn7w/MtsRK81jKGghh+P/IJ5SI8ea4El6t1cXToplErK3?=
 =?us-ascii?Q?nz5WkAA+1HI5eNtbLcyWEhoIdfN38HnjDwBewz3p5V9/RJgEM8uZBsfAdldv?=
 =?us-ascii?Q?ZWezCTRS5mPvwYH465YH2/P259d4z5fE/idSNHpgOF3VD0ro+qdd6veWtPV6?=
 =?us-ascii?Q?n1Dj73Q7XC9C877nqewhobUSO+ArBcv7zD6ygqX7q6BlkBB9dOY/0N7kfYOD?=
 =?us-ascii?Q?Qsn5F0QAseP7x8cR86v3W1P2LSUtZG3HT5QAM0BMm+Pw3PjVxjEgqLsosElq?=
 =?us-ascii?Q?8jr1oLwTuYMRB2RiLqF8P9VR?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc42345-3dca-48f8-b87f-08d92d072cee
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 18:31:49.3470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vKfZpA3XG4Gr8g+shEM4lMUQVwA1pcpgyaraO9qZGPU+19CzBORMDDS3NFNGDEyRE9qRwxC/2+sXPB8cMmW+nHAH6ywl0BdQHvpE+6qsLhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5457
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10012
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106110115
X-Proofpoint-GUID: 3_OYOMLe3ku5Z_0UNezvl1lHxymALk7j
X-Proofpoint-ORIG-GUID: 3_OYOMLe3ku5Z_0UNezvl1lHxymALk7j
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 pbonzini@redhat.com, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change provides a qtest that locates and then does a simple
interrogation of the ERST feature within the guest.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 tests/qtest/erst-test.c | 109 ++++++++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build |   2 +
 2 files changed, 111 insertions(+)
 create mode 100644 tests/qtest/erst-test.c

diff --git a/tests/qtest/erst-test.c b/tests/qtest/erst-test.c
new file mode 100644
index 0000000..7d97d62
--- /dev/null
+++ b/tests/qtest/erst-test.c
@@ -0,0 +1,109 @@
+/*
+ * QTest testcase for ACPI ERST
+ *
+ * Copyright (c) 2021 Oracle
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/bitmap.h"
+#include "qemu/uuid.h"
+#include "hw/acpi/acpi-defs.h"
+#include "boot-sector.h"
+#include "acpi-utils.h"
+#include "libqos/libqtest.h"
+#include "qapi/qmp/qdict.h"
+
+#define RSDP_ADDR_INVALID 0x100000 /* RSDP must be below this address */
+
+static uint64_t acpi_find_erst(QTestState *qts)
+{
+    uint32_t rsdp_offset;
+    uint8_t rsdp_table[36 /* ACPI 2.0+ RSDP size */];
+    uint32_t rsdt_len, table_length;
+    uint8_t *rsdt, *ent;
+    uint64_t base = 0;
+
+    /* Wait for guest firmware to finish and start the payload. */
+    boot_sector_test(qts);
+
+    /* Tables should be initialized now. */
+    rsdp_offset = acpi_find_rsdp_address(qts);
+
+    g_assert_cmphex(rsdp_offset, <, RSDP_ADDR_INVALID);
+
+    acpi_fetch_rsdp_table(qts, rsdp_offset, rsdp_table);
+    acpi_fetch_table(qts, &rsdt, &rsdt_len, &rsdp_table[16 /* RsdtAddress */],
+                     4, "RSDT", true);
+
+    ACPI_FOREACH_RSDT_ENTRY(rsdt, rsdt_len, ent, 4 /* Entry size */) {
+        uint8_t *table_aml;
+        acpi_fetch_table(qts, &table_aml, &table_length, ent, 4, NULL, true);
+        if (!memcmp(table_aml + 0 /* Header Signature */, "ERST", 4)) {
+            /*
+             * Picking up ERST base address from the Register Region
+             * specified as part of the first Serialization Instruction
+             * Action (which is a Begin Write Operation).
+             */
+            memcpy(&base, &table_aml[56], sizeof(base));
+            g_free(table_aml);
+            break;
+        }
+        g_free(table_aml);
+    }
+    g_free(rsdt);
+    return base;
+}
+
+static char disk[] = "tests/erst-test-disk-XXXXXX";
+
+#define ERST_CMD()                              \
+    "-accel kvm -accel tcg "                    \
+    "-object memory-backend-file," \
+      "id=erstram,mem-path=tests/acpi-erst-XXXXXX,size=0x10000,share=on " \
+    "-device acpi-erst,memdev=erstram,bus=pci.0 " \
+    "-drive id=hd0,if=none,file=%s,format=raw " \
+    "-device ide-hd,drive=hd0 ", disk
+
+static void erst_get_error_log_address_range(void)
+{
+    QTestState *qts;
+    uint64_t log_address_range = 0;
+
+    qts = qtest_initf(ERST_CMD());
+
+    uint64_t base = acpi_find_erst(qts);
+    g_assert(base != 0);
+
+    /* Issue GET_ERROR_LOG_ADDRESS_RANGE command */
+    qtest_writel(qts, base + 0, 0xD);
+    /* Read GET_ERROR_LOG_ADDRESS_RANGE result */
+    log_address_range = qtest_readq(qts, base + 8);\
+
+    /* Check addr_range is offset of base */
+    g_assert((base + 16) == log_address_range);
+
+    qtest_quit(qts);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    ret = boot_sector_init(disk);
+    if (ret) {
+        return ret;
+    }
+
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("/erst/get-error-log-address-range",
+                   erst_get_error_log_address_range);
+
+    ret = g_test_run();
+    boot_sector_cleanup(disk);
+
+    return ret;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 0c76738..deae443 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -66,6 +66,7 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
   (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
+  (config_all_devices.has_key('CONFIG_ACPI') ? ['erst-test'] : []) +                 \
   qtests_pci +                                                                              \
   ['fdc-test',
    'ide-test',
@@ -237,6 +238,7 @@ qtests = {
   'bios-tables-test': [io, 'boot-sector.c', 'acpi-utils.c', 'tpm-emu.c'],
   'cdrom-test': files('boot-sector.c'),
   'dbus-vmstate-test': files('migration-helpers.c') + dbus_vmstate1,
+  'erst-test': files('erst-test.c', 'boot-sector.c', 'acpi-utils.c'),
   'ivshmem-test': [rt, '../../contrib/ivshmem-server/ivshmem-server.c'],
   'migration-test': files('migration-helpers.c'),
   'pxe-test': files('boot-sector.c'),
-- 
1.8.3.1


