Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DD3314435
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:44:30 +0100 (CET)
Received: from localhost ([::1]:37256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9GCj-000271-Eh
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:44:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1l9DcA-0000rv-SM
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:58:35 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:56788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1l9Dc1-0002lA-UX
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:58:34 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118KvGds010184;
 Mon, 8 Feb 2021 20:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=mFK5egzB7/6ymCVgCMffkiWdnMVmbsIMWE3IMHkZltI=;
 b=xZUYPqWm2py6Qhqtrh8+o8r8ilto4y4EGiOsqS4reCeXWN91zReRGqipstotA22albHj
 xnXBEIdgbXP8MlPwjqbo4ey8/p2WPJtZ0nNvWeEzDFmf1h8rCoyX9UqY0m3imrNZLdHs
 7qBSCNcjQB7qAMVLmqr6jMI+ttUp1c8QFP2Z4SU32ZJZ19YHGcLUAfCVljicYXzuEMMT
 upYEMzBq13LLsedy1GfSi90815zNr5LMbn69d89keb+704a9BWvm5nagTP11wyZIM6YK
 LrLMC8mmZ0V1cS5HVxFCvj0oYNdZv6I+J4t3NgrmkjpYaCwXmELJIPCZu8Opbsa8Olvf +Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 36hk2kdc66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 20:58:23 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118K5MmH020945;
 Mon, 8 Feb 2021 20:58:23 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by aserp3020.oracle.com with ESMTP id 36j510b3dh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 20:58:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BcxJUFP7PstnRdC7AskYhpfXl6qoMAFsIK56eXUjDDnLyIMPj/PQIdWYdC5+oWZsac3BQkidzKpLEnoaNBnmyMtpm5xNmG1X826HNzZEcuXJMUbXesMvkRbf0G7VL4ko1ed0MS4Ww0QUFpNPqnZ2677JbpLMawxYAhFK/Ff98NfwPP2MElM017YQVEbuzpdKv8YrLwJugHPIJWPVkVqR6YO1uutJ7QCp5YVVWSP6c9klDFfi0ghGaw0vgbnR51nkWRf+is+3PmP9YLX4g272AhL4YD1Mq9CaNyyZ1PsbQsrxZ4OK8Ncqokm9DEuosMVVo/iYWnVMLZxsI0/D6O7X+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFK5egzB7/6ymCVgCMffkiWdnMVmbsIMWE3IMHkZltI=;
 b=UFmWIRe5X0Aqjsjxe+P6cMSkLgYQa5/K4YFL0U8fSvCHiE+qQDmG3bLBNqQttpU9SQkIkVZdK9MoaUejVtpTgiiv1hHoP1W3kqrlWW/kZDvmslP5Oq1Q1SBUcM79r3CwKoVCf1ZtaSfPOcWcQXvCHGHzF1MwUS9BAA8ylP0UO3seJsnk2iJuQ8V/vG+gR4nPWz3lmIW1l1FbLGuQdoBHkFoj8AT7IcuHCHMm8dCksAJrtG0/6yCZvOsna72bhOUi60YOqBVibcOb8XLEDOdUGcS+mSlvaNR9gecnlUUeW0jCKTI0Xkj/NPwkKV7Lb9b9JjPrtVwbeNfv5ysmiy8O/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFK5egzB7/6ymCVgCMffkiWdnMVmbsIMWE3IMHkZltI=;
 b=YyiAHXUzuDyMN1TdmmEdTzp6Iw5crs1tkOG898j2n3MxPxFwt52VRUU9Xv/KLr4FjTtqynZo/g6OqmWdTP2Mry6MoLokkAUZnPbNYDOQ9N4y4L5220wHXj2655uYoSvUDD+oEI1hjbYTFOQSjyRhjN0cmnIieaJgSJ5WetRvMhI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1599.namprd10.prod.outlook.com (2603:10b6:300:28::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Mon, 8 Feb
 2021 20:58:21 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::1193:5eb7:7993:85a2]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::1193:5eb7:7993:85a2%7]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 20:58:21 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: mst@redhat.com, imammedo@redhat.com, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com,
 qemu-devel@nongnu.org
Subject: [PATCH v2 6/7] ACPI ERST: qtest for ERST
Date: Mon,  8 Feb 2021 15:57:58 -0500
Message-Id: <1612817879-21511-7-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>
References: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.200.23]
X-ClientProxiedBy: BYAPR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:40::37) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.200.23) by
 BYAPR04CA0024.namprd04.prod.outlook.com (2603:10b6:a03:40::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.21 via Frontend Transport; Mon, 8 Feb 2021 20:58:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 546c2b2c-ddef-45ee-7708-08d8cc744486
X-MS-TrafficTypeDiagnostic: MWHPR10MB1599:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB159904314C3DBE6BB94184FC978F9@MWHPR10MB1599.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BxRidDQtYdBHsQPqpDsQ3ECtBSAx9WRwS/GxJWVUl2blaRuM+jqPFL3ZSBPOwd+mv/QCR9cwn4qCGw2np9yfryfABOAMKU0wcvmxQwtUTUuWG15+NoDyIq9d/lvWLCqozaQnB/pUUGXA6Uh0T41ZXXDSFoRNAnlFG/bfSyvqWrKJdocq0tELaMz7q9zaBYdpiyHpAuHUVYlAMZ7lUKhCWVXbIDHZMCILN8SGEkiM6YvJq3Joh87prJG2zVIuewgxW2gPHfOGTl5/adYoAhe0smEQaNNEipG2UdL3Cb56ZY0oGSCw3/InpEnuc3/uNHmQWk0Sz0oo3w5SC5E1IfRDyoUsHpHupLC/EWNgITqnyC+9+RaJREZQlS7RpgyumKyL338jKtj3suHnvXhQmrGfkJT0BLnRZ/tdZ54woHbe+BjksUctTruNBH00w+RnwyrAjEJ8vIG3xg1cKxFVY/nNvyVxI20+Tkhhm56lrhcO7AjZJIYQsS8vtCyvDeEbPgcT7GSJKE1T3CR/CxyJ17k+VA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(396003)(346002)(39860400002)(6666004)(4326008)(316002)(2616005)(52116002)(186003)(86362001)(36756003)(16526019)(956004)(5660300002)(478600001)(66476007)(107886003)(8936002)(26005)(66556008)(8676002)(66946007)(6486002)(2906002)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6kSE8Gmzu4oSvs05QTcb7iMpB9Z0Oyg99cd+LWSijUbtODIIzz7q12uIgwYU?=
 =?us-ascii?Q?gbnUyPLONklWLJJfkcIzGkBEjj4vtVYNpSzFqXbdWlTMiSvbS5XQT0JQqjNn?=
 =?us-ascii?Q?0oFeGGyNkpehQHNyYDRczCTsZyS5zXWweQbilpyfkUCXHys/Yyl6dyMXRPIu?=
 =?us-ascii?Q?Dy540a5Hjc86eRpVbC0JzEwuWUsezLtK2b+mBt3H2RzlD7/6eLqqiebMu0jL?=
 =?us-ascii?Q?e0Te7+j0LWu/VDR10GBydBQf+hJuRToX7iZZv97l7MTuHbqxmRy6OrClHRJF?=
 =?us-ascii?Q?QhAKZV4JrXDMViG9/OKJMZ79jHdAlfOJc0R3Ql0/CUq+x6KYOvBQmMzI7vES?=
 =?us-ascii?Q?pcCoBUxENPkZRdyOxYDMlBh/KRo0cZ5Hx4hThe1cgbob7n0RJfNwEVpbuXMP?=
 =?us-ascii?Q?eHOkqu8rw5a3C5kw4xTOZDIFyeijsoeTRa+UfsKu0UP1UBL+osr7ovP+fVWf?=
 =?us-ascii?Q?M9YvNDoj6CwwL7SspbqzhYK50TALSVrwCYze8gzoR3hePGe++sD1kIcf+V2u?=
 =?us-ascii?Q?Yc4CQDZvCVhy6srszws36Ri9N0ESiR+QSrUTnIZXCsvFAoijynTsqY/MbJKc?=
 =?us-ascii?Q?zp+BVqNXPk0RoQlaJguMAh25N2CZwQLl4M1GalVq56tM9Aisn4+3RUMEzYOQ?=
 =?us-ascii?Q?i/5b8FlPxgfpIomYxIgz1wgurp4Dz6+u5qO1q+RQvWbdqIAkev9cDK0GoDFp?=
 =?us-ascii?Q?HA7qLpy4HSpjWRy54iLVqijuJ4yHHhf9MFbIc2imhO7+LaJqrXXjmXXWdrQw?=
 =?us-ascii?Q?tatReo49jqWLUQ/sCQDZ1r4A1Qdj51Hcz+SAnEaFDmBlqUt9/Ye4o2qQjJ1X?=
 =?us-ascii?Q?eLcSRbzmNb2GcEjwwx2yue7JJS9tqrmBataN/rtEtdEz8j6n5re6qmvijsHl?=
 =?us-ascii?Q?g9r7wSj1qCiQ5DwvheGaZzhAUfZ8VUlkzvMDz3VwCN7PJzajqQK0Mjt9CHG4?=
 =?us-ascii?Q?m28Jcr0TDq7L5PRnYK2AvswYVwmRslGZNbrGHy9z6Yg+uh3G0WUOkBegGLOD?=
 =?us-ascii?Q?nrmLBSeUqLZ+ycdmaVlUkNtFuA8Ec2xa64ZUh4fBMCQyNaD/5lox+TFXERc4?=
 =?us-ascii?Q?06dwyzpAMzSaMoGyEm1oMZOqa2N1guzCmT0FvKQbbw4WQWkJq8ZMDIIwudTY?=
 =?us-ascii?Q?H0N6C9PIFejD65TnY0xIfKN5XVyKyPJlC/7p4OeYFUXi5D3Wu4c6EPuV9Qha?=
 =?us-ascii?Q?/7uFIiMhIZP/8xsJMVGSvVM8I7aga+KnLcwZ2qqGbhCXRDhO9sR0wS76yHTR?=
 =?us-ascii?Q?w9W0kfHB8DOLxdDbiSnz969Ea02+CDT0mBwNQu9ZoKqDqyTVKIq7FhASEBnS?=
 =?us-ascii?Q?ZdjT/1E2qEYuhHM7l3AJ1VNp?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 546c2b2c-ddef-45ee-7708-08d8cc744486
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 20:58:21.2633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: keJEdMPGwvrTOiVt5JEwgK/CONgVDXRllSRVQuxZeFxXwVfUwP02nb9L28ORWzjUz3DHfxYUOn8sOUGFmkydgXdiBjNQVVCtS3BFRbqmAlI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1599
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102080119
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102080119
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=eric.devolder@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: boris.ostrovsky@oracle.com, kwilk@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change provides a qtest that locates and then does a simple
interrogation of the ERST feature within the guest.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 tests/qtest/erst-test.c | 106 ++++++++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build |   2 +
 2 files changed, 108 insertions(+)
 create mode 100644 tests/qtest/erst-test.c

diff --git a/tests/qtest/erst-test.c b/tests/qtest/erst-test.c
new file mode 100644
index 0000000..1030e83
--- /dev/null
+++ b/tests/qtest/erst-test.c
@@ -0,0 +1,106 @@
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
+        if (!memcmp(table_aml + 16 /* OEM Table ID */, "BXPCERST", 8)) {
+            /*
+             * Picking up ERST base address from the Register Region
+             * specified as part of the first Serialization Instruction
+             * Action (which is a Begin Write Operation).
+             */
+            memcpy(&base, &table_aml[56], 8);
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
index 6a67c53..8409892 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -46,6 +46,7 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-swtpm-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
+  (config_all_devices.has_key('CONFIG_ACPI') ? ['erst-test'] : []) +                        \
   qtests_pci +                                                                              \
   ['fdc-test',
    'ide-test',
@@ -208,6 +209,7 @@ qtests = {
   'bios-tables-test': [io, 'boot-sector.c', 'acpi-utils.c', 'tpm-emu.c'],
   'cdrom-test': files('boot-sector.c'),
   'dbus-vmstate-test': files('migration-helpers.c') + dbus_vmstate1,
+  'erst-test': files('erst-test.c', 'boot-sector.c', 'acpi-utils.c'),
   'ivshmem-test': [rt, '../../contrib/ivshmem-server/ivshmem-server.c'],
   'migration-test': files('migration-helpers.c'),
   'pxe-test': files('boot-sector.c'),
-- 
1.8.3.1


