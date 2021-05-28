Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E16F3946FB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 20:27:32 +0200 (CEST)
Received: from localhost ([::1]:59924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmhCl-0007EY-BM
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 14:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lmh0O-0001of-GS
 for qemu-devel@nongnu.org; Fri, 28 May 2021 14:14:44 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:11336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lmh0M-0007Tl-7u
 for qemu-devel@nongnu.org; Fri, 28 May 2021 14:14:44 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14SIDO6j011086; Fri, 28 May 2021 18:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=5zjrGU1LVvYAaCcVQp4Xmmcx+IdojJSNMK9VkvKp2gA=;
 b=TYA/iBNcFy4hJOSx8PC9jN4UGX09xDNBB01UTZK+/rejQ/NjKwyYhu/qVgjAaSEvpahg
 qXzA6LnEmxcLTkvRMP2sV/qBYIBtQ4aIhJyBQ5OMKTvbvkEOZsn+JwAmDUSu73VgeVcR
 w7vs9swAIhDelRU4k9xwV5vwcFVoHTTvYdRnLyrRn28oCTz8rKmLjxbTHJMsTtU8i8Bf
 Ou6Uz6TAdIP3KcdVJFKMCrlszQ1d9ii/+0CigEvBc1ZCoH5NrOLnfGAl9lLhAp3gmHAq
 FfiJeQnjBp2AlBZ55RR3qDhMorRNeybCQ5viUifZAFG0yNESRMIC0fzryUUSCgbsvUgq LA== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 38u25vr29v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 May 2021 18:14:40 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14SIEdJQ108682;
 Fri, 28 May 2021 18:14:39 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by userp3020.oracle.com with ESMTP id 38qbqvpqe5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 May 2021 18:14:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCWhRSNNr9C/oLf0KuHXMjcLotVQJ9+TH6H6F08nW7qRJ0A2EEWXMKnGLSh6Yu0nWUcFx17Ro38q5xZZneFBujnFoZkK0MVKTT5NdIm1Fja9ZblLIozhOQAJHCC8yvJfZCeUnWuAJv/hKxarD4pXDc4qyryjClK8etThMAniNlihzurL9Y3XOUi29f4T6Ozuzz+MlQscIU8jymOSlgPJ3awmVpIy1TjdbMp7SKqM3Fvhi9u9cTkfOoUeumoFnhenqHy4BC5Tm4thEpYmcc5nBmqkwZV9Va9auUC9v2FlSlcpQVwDI2m84Es2fMcbmllcLlU7GU4oJhkngniUzd9AHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zjrGU1LVvYAaCcVQp4Xmmcx+IdojJSNMK9VkvKp2gA=;
 b=G+d3dNeZh+9xtAxDyhrW9JqX9qZrj16tD9bt0Dz4DA3eG6GRSV0F5APSjw8HI0eF2XJCIZmv68+Jn1Nu3S8WO7kQSid94mVi9AUOtiZCAAE+WsD5AqcE8+z1jxpMPKe6aSrsqwPC3LeC6ijMf3UngJL8YCAnIDLxHEiUTARr9OiTkW/6OU39ANp5fm2Y7CIB8b5wyrEVMLyWGeFtnXnvG6WOPlZKBAVWuej7rHFkpczN79EipOfoLCvfb8MCOIuhjqpG5yBFrBjAUBDsl9rJ5MUtXIBW6zyMlGVExcmmfy4XbDyP3a81j4RfqadYf215xc+EOAoYTSauXECqpIbkbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zjrGU1LVvYAaCcVQp4Xmmcx+IdojJSNMK9VkvKp2gA=;
 b=hJ9jT5pKJZAcg1L8DOULA8UFXF2e+Gp4zUpLOlD4GzMRVfUj4r5H4Rh/iIEJKQv1S4dn4zNceJXcetqc8n4Y2jaZyuWG+kv+mY4fPJ+nIpO1gSbgJa9RUG+C0MqKahmd+4uyevUZImfo6IrU0eo4HmvBMAXxy/saXSSnmA4nz5M=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4723.namprd10.prod.outlook.com (2603:10b6:303:9c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Fri, 28 May
 2021 18:14:36 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%6]) with mapi id 15.20.4173.024; Fri, 28 May 2021
 18:14:36 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/7] ACPI ERST: qtest for ERST
Date: Fri, 28 May 2021 14:14:18 -0400
Message-Id: <1622225659-16847-7-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1622225659-16847-1-git-send-email-eric.devolder@oracle.com>
References: <1622225659-16847-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.201.23]
X-ClientProxiedBy: SN7PR04CA0201.namprd04.prod.outlook.com
 (2603:10b6:806:126::26) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SN7PR04CA0201.namprd04.prod.outlook.com (2603:10b6:806:126::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21 via Frontend
 Transport; Fri, 28 May 2021 18:14:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f655ef5-ca0d-48a0-20da-08d922047374
X-MS-TrafficTypeDiagnostic: CO1PR10MB4723:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB472347A7ADB5B8394503FA7197229@CO1PR10MB4723.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E2vknUKD7T9OoRk+TPzwmsTXpYEMByXsamn64jo8xRjeJsF50vcnPu2l2wjfXEPbRlJ6QmaOVPkyVuib0QuzS+NyzIHDTmODiiRnEDoVTFhPK0WpT3+06h1ZKVSRRTl91NHWd1AzeADJUXjFlKt80C6G9hUU63mq8cVWCKaT2VBuVSxeFTtklC3ygs5f5j5YLmrPVL47d69iN/Q8T8qmhDYi2CTbyeg9jU4Nf1mK5YeXp3Id6FVsMwTeVw1ohR/cnVoTMrnqcaVSiwLC1DAQ0h8cbuT8GoZCbQozYTPx5Eo/ttm6tZzSew5l+/X2ZOsA+1dDsliIoyUSa/Q7EeThdf9IvGBMYr4wH0bRJkANrhtajqECKUfuL0gq3thmg9ATNzQZFD3/+wNxDrwR0wQ/i1G1gPzndlhojut/83lzwFRzDraHRE3tewXvdGzcDCwAXLfA44oYDrHSDijgc9YctyPEqk3JXCfiDlKrmcTDcxD3lhpn/jVT8oNNazAsRVBtq0GKYxMJUPhHjX7QEXO6jn+7H6BzgB1TXM7oqsc6PiyCWI6KtAmnbB91td07irAJsjcukVVPSXZqGbi/DuRfe7b3VjCJWZiA0muNLl8wsx79ATg6KovDk8lo3POAIBDtyBqCZK9f78w4/YzT+sjd3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(346002)(39860400002)(136003)(376002)(6666004)(316002)(478600001)(36756003)(38100700002)(38350700002)(186003)(16526019)(6486002)(8676002)(86362001)(8936002)(6916009)(5660300002)(52116002)(2616005)(66556008)(107886003)(2906002)(4326008)(26005)(66946007)(66476007)(956004)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?iX2uSOi0k5KCSZOsC/rxGkkegYBBC8i2RpY7N9TeaTmkLMgllcn+tV7GAWQQ?=
 =?us-ascii?Q?qXs6raOBIJRlJmgoMhIsam2kG0mJhN9BGtvcD/NxTTFftZcZAz+mOqh5+9DM?=
 =?us-ascii?Q?Uk44A0ij6g/x26pc0IJ7UYEF8hhGhAlPF5oh+kCEHaSaVHUP5DIMj8e4lQAj?=
 =?us-ascii?Q?XdZdUt54y0SEESuQrqSOe1rJ5D1WH5tTayOMtwzPLQAGtUzep9JzAydJ9uzM?=
 =?us-ascii?Q?c3AebVUGt2jdWE6WcTh7zJj9w/PXsB1uad5o6PelIIVfQN89yQHrwFT9VTs7?=
 =?us-ascii?Q?ZfZogrl6eggq9Jbgl+4UJ15GJhFrs9bZXvscCGZOXC6agcOrL3wWmAAHCeR1?=
 =?us-ascii?Q?2aHB6tRw1Gy+qhEthz5aSaw5yUSvF7ItPdflkCh+jzf7WLOYBbx+YN1vGM44?=
 =?us-ascii?Q?7T0YhzfxdQ1hh1EPBgpuOjZq44DXkzep8Uhw0efKQoaUlYpG2NSLSOtaNSH8?=
 =?us-ascii?Q?B3QSY3GWgKjeebih8LCIYlaV1n7k/QaD8AQgNXDU9CpuFEnrFUD70OmGhkMx?=
 =?us-ascii?Q?WJJY/43M2/Q172STJBaAbgY+daacvQTuqdE3eOjZ1s8SwatyMgwtnqPqJeEH?=
 =?us-ascii?Q?9ROcx5tQUZxzTPr3auURqte14v5ZnvdIUa3ec1EixBzmeB9mYNlJ5xaVH6U4?=
 =?us-ascii?Q?GipuuPG1sy0RG0K4rN0xg9YGye3vV80UjRJLg25V3t7Dp7WlkVPcqn25dqwM?=
 =?us-ascii?Q?vh6NjLXwFMi9HjfHxE74LrEGLqXINDoN1lttur5xbyIy+V8P6DdHeyYrmbsf?=
 =?us-ascii?Q?foU+d3/nm4nuYpvdWuRKROGXL5nz2IRE2fS8yacZGtMg0f+q9vNXe9yCHjKL?=
 =?us-ascii?Q?UvtD3i3jnzDHeCswNCzRBpfwrYd5oXa+8DMWqTg/KCJaS7ohOTBkEfUtxN8B?=
 =?us-ascii?Q?mBdPDSP1duwhkNNp8W3FK2gtbAGbnpQ4NcEUkwzF3Facosjq7gQ6Km+kIULx?=
 =?us-ascii?Q?9gzon5ycAaMZXd1fCLsGIojHJKwbKymmvhJkEWD/TSii7+goRog/b9ydgvbW?=
 =?us-ascii?Q?p+QM+jBGNRXFikjJVgXZQYA1xBVdigfz8Vai1GG06hIbkmzlu9C/KkqruYOk?=
 =?us-ascii?Q?YQ2AnRfnzHIE9K3qHPka+dNtQicIoQtzZ9Um9/IKnAugjOayofA3OcO6/2WO?=
 =?us-ascii?Q?N8A5WQ+HfKvJ7jhCeaZ9Ii/rdjL2MeCXKJ2GbqZh1hSn9MbBKn5CdZfDus+E?=
 =?us-ascii?Q?/+QoSfOwCiDuVWQl7XJDgNMDTHDcXC+j9EQt6OQzevHxOK1k3jq6DdyYHKby?=
 =?us-ascii?Q?wUiJP10+9IWEXYQHIKDzBSliVK+SCMqfBhBvFk4uN23xrjUM3+6+HJWATFsy?=
 =?us-ascii?Q?p60+XtDZnLKG+kIIatpqx8dI?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f655ef5-ca0d-48a0-20da-08d922047374
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 18:14:36.3134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9hqidoLBf4HixUwvcIdN5g+2K9G1Ha8BGGJLrAAMs2h+fT2Sn/sRPR39O+n9GXPaa9N0XsOoQQUtAV0ZuCvPBr84OjrEG+gS2V31txgT+tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4723
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9998
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105280119
X-Proofpoint-ORIG-GUID: 6H3fwxd1Fmm3H_OlhOwvuVgpiYI8oIWg
X-Proofpoint-GUID: 6H3fwxd1Fmm3H_OlhOwvuVgpiYI8oIWg
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
 tests/qtest/erst-test.c | 106 ++++++++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build |   2 +
 2 files changed, 108 insertions(+)
 create mode 100644 tests/qtest/erst-test.c

diff --git a/tests/qtest/erst-test.c b/tests/qtest/erst-test.c
new file mode 100644
index 0000000..ce7fc70
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


