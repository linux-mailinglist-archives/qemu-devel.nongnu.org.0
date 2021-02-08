Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACBC3144FA
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:34:31 +0100 (CET)
Received: from localhost ([::1]:54822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Gz7-0006ZJ-U8
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:34:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1l9Dc6-0000p4-PS
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:58:30 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:44682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1l9Dbz-0002k3-Ca
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:58:29 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118KvJZv137457;
 Mon, 8 Feb 2021 20:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=T0GyGeaqVtGEmoALF8F7WGnLy1pGaoAr8R0iSGVV0Bg=;
 b=eObwb2l8UcyR5Bv8/WcxvS0CWvPDIAw80khi9PTEUQ11i4muEOKyGoCXhTKVe0upDQIL
 yYy8zD8BRSZ9kBitabKWeptZC9ykzYUcIKXT80/BO7wJiG0RXNJRqsM8W57mmK3HeOUy
 NGyHkSvFz6MYQMHW42pCktPJreM2hcfMBnCJkb+r9PO51304g1tmgipXjJNXbbTlPfV/
 RhJraxdQonXNxp+W/aIPPQihh4tHyS5RKGObknPd8tvOeTXxFjM51SUbxk5kKNl1VmvP
 VS6SoK4K7PbH7EtRByKb93GJv8vZvv+ZVas1ZCooAgR8ozwd4nEs5DTgA9RWjRmlIR03 ig== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 36hkrmware-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 20:58:20 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118K5LP7020761;
 Mon, 8 Feb 2021 20:58:19 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by aserp3020.oracle.com with ESMTP id 36j510b3c5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 20:58:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFdwR2c6nTHfCCwbKmavzsPPcwiotbUW3ei3TgyLR76TKa6MbisMTXyRQLec8mDPWDf/JwDIoVs/hILncNwm735RzG1+cFcCnOE3P4YseMA5GqPk7x+osk3z1Ue60qrYuIS3MNqoRdU3t9XWZu80FiRM9O2vB+w0LHAlYW97cVftTGIE6qWiAkcURtMZ7aQacY/sWY9PNOJ1uN0YeWF1kgmc1smROWp++Q4ck3ifsqrLp6BmRUSDEOt2lbrqoJsfY2zihvJ5WPAHevRgq/ilyKvcKeDtj1ip9Ld5afdYMrvFJYfxKFDUEe01ttryl2gji3azdE2k/uLYpifvd8oYdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0GyGeaqVtGEmoALF8F7WGnLy1pGaoAr8R0iSGVV0Bg=;
 b=hViQrVC0Q3TkFLSqYzCAQ6puZJtWlS6iJGZUSd+kdxNsL15GtLu/JnNp/y0JBDgH2L2viiuAjR40Qgls4wIefdxJ6va1YnYa12Hhe6w1CYiU0by8HMyjkUq3/MmxdNF9l/uoJHjofy8J2ckR47YQJO5MXh12dt+wCdgUN2HtvSQjp0mQwyBkZJGyhOpoHxA5jej4d+nenU6Jn6eIgQukdTXz+8M973DIq8O95+qEF1A2BP5FHerNFNT6fvedvjU5rnE8wdxQWcgs2sBiPPwUCWUXsT58iouEmU39nhnb+wv0jNjLBhPrS1m2DTU7823OYxu+5CVmC/zTkLeUG4LYaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0GyGeaqVtGEmoALF8F7WGnLy1pGaoAr8R0iSGVV0Bg=;
 b=OXJUm9Pc6ocSMpQx5Jlob37BjnZ2grsEkOooH0FOrqzoqYkx2I7xnPOimIi1s7qCp8FpRhRvaDe+Nx7e+MEu0SVfZQtMo4fLh8zc7St1sSCuB7rN2y4REsjVQcj3flBU2jLCVTDmpSPbC3ZcK5ocP7EPrfKXz4cqIrw672//zBA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1599.namprd10.prod.outlook.com (2603:10b6:300:28::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Mon, 8 Feb
 2021 20:58:17 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::1193:5eb7:7993:85a2]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::1193:5eb7:7993:85a2%7]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 20:58:17 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: mst@redhat.com, imammedo@redhat.com, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com,
 qemu-devel@nongnu.org
Subject: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature
Date: Mon,  8 Feb 2021 15:57:55 -0500
Message-Id: <1612817879-21511-4-git-send-email-eric.devolder@oracle.com>
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
 15.20.3825.21 via Frontend Transport; Mon, 8 Feb 2021 20:58:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a199c2cc-7b0d-4a6d-700c-08d8cc7441f3
X-MS-TrafficTypeDiagnostic: MWHPR10MB1599:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1599F1E271D5C838AF536E87978F9@MWHPR10MB1599.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 17CGgo1hWf6hjsl5kvU7pgRr+WhsgG6L4/OC34u808tzAq7gz+lYeM83Qiq+kN7bUTPLncN8cGyV5zlhoJZPLiXx9QLV5xpwrONqk35iXEQZCGhenVk6mDdA39vwKRNVNF4wSemZTKGhyIM6OeyvJVFY4XK5lGb1YfhMMHqDiPlqePasc0KkplepdFmIIvo81+doqVwFSDafQD/jl9IUEKPmKe4arkxMRFjMIE/vHuTZQrgDk2mOSJUAAsDeoyDf12kGtMp+cT/iMhQpyDVYO92EMLfdU/piipKdJeXUfkzVCIPBdqSea3w8dJ7Mo/5Wc9UB9eUlMbGGL1Hym3AWkXncitmA/keZqWAd2wl0Xet+COwQzsxnMFPFiVkmAF0mxSD8JksZoz7fP7Tm6DzU5pHysB0NwxCnXN1mL0hl9j0GemXK4fymqseubtk1VQCIiEEy3yrxgp05JQHaF6EK1Q8pvZs6L+JgMtWz+39v5ch4YRFc/LVl/3EJC9FyEu3YWS1FCjKqXsQta4MHxHbVXZlo/32Sz7CG/iI17IaGSr2SCACbnldP/PEQ1i0rZEoTJxrUFbwlud0J1MSajw4j88FhXCz0kKbovw1g2lbJw00OJ4UvVY6wUgsCVsAWToFFaRve+sc/YJJn1QjzsLATsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(396003)(346002)(39860400002)(6666004)(4326008)(316002)(2616005)(52116002)(186003)(86362001)(30864003)(36756003)(16526019)(956004)(966005)(5660300002)(478600001)(66476007)(83380400001)(107886003)(8936002)(26005)(66556008)(8676002)(66946007)(6486002)(2906002)(7696005)(2004002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rhUt4XesUhB1KVLNmYFUhh2mSu5BfqkwUGrTAEKYmUDAKGXBWBtmlxEBUydE?=
 =?us-ascii?Q?pU0mqkYrKq5Orj0nHd85K/CWOne+cev9xQTb35A4+RecO1hGX3PuLfUen9iL?=
 =?us-ascii?Q?mARPEC+Y6++Nz+H4TBXyBJTuJGp7EI4iKJU+xBfIWW+dTuWcIleknP9wxGpU?=
 =?us-ascii?Q?DNfrsnZiWjFaQmvy20+r++fBK34uK1ioaIwWiHim8VN486ot3JtYItQfTdF0?=
 =?us-ascii?Q?FMVNk9PUQUAehm7flqsdZBkj2pxWUVfCPGVr3/Zh69kAuj0aEG430wVU1AgL?=
 =?us-ascii?Q?GD0KXVMyiL91KsFdafg67IGmodnLRViylCtZUPZxzftQhwnWUg0xZwUlo4Gp?=
 =?us-ascii?Q?Ta+qSciNakD/dc2b5lbhCPndotfQ6R+QZxviDu7vWfL/6zlaq+oqF371Uf/E?=
 =?us-ascii?Q?VlWIRtxT/mK/0EgWDvDq8flDQD/0PIf13dJgC+qvH5Qg5azdaqrL2i69VKpO?=
 =?us-ascii?Q?AtZtlZTIflho2duXAJ6SKzs+7rVJlMAmpFXzyiHdLuuxWzLEG37P0kKRyDye?=
 =?us-ascii?Q?2sogqVkrD9QlDAvIErlbfSMdQPa6kpZHQJ2MuO5XZzIqhWVDki+Uc4W8iNV4?=
 =?us-ascii?Q?lD1mCDRtMUqvfeqGkJDjfP398IrEdLHcU2oExJ28Qkg9K5dvfWlgYh/OEy14?=
 =?us-ascii?Q?3rxq/H/kIORrFxa+i4kjOw+869VioRBM8FqlxG9KVCyivoQKvKJXntSZR7i4?=
 =?us-ascii?Q?rwVLnzOEiAWkOfr6TuFaevGcFYx2wkwGzoWrvfcebdvI0guoV4h7G9iO7UjV?=
 =?us-ascii?Q?IOaJhmlHpH6FBKiK5Z1PGV/EQhHjoLrcgGMP+m+qkakcC2F7GT6aKTxlm2+d?=
 =?us-ascii?Q?UK5YTvAYPlUfuQvGF4jhBA7CHU3qSJ/9qnItMFsqzPS3s1elIq9DD6NPNr0Y?=
 =?us-ascii?Q?Hg7Zx8q7N8lJO2yaRUoELKsOe3l+0PIW15QDhc5H1uWSwEtdyQgfPm/a28Ec?=
 =?us-ascii?Q?3jHNsIYO0geTuTDB53aM5Ur4yLcg9oITJDU18RUKFv6l1LE1/lLlo0XjV4KS?=
 =?us-ascii?Q?cFF4b7alOeznT1RmrYyvw/sUjut8Ru+wYMYqmc07wgISnc4hQBxB93FE8qFp?=
 =?us-ascii?Q?nvHatNa8dA72qtDYU+hrt1Z5qLezflXq8C45jm1GTcjYq4fVlbv6ogQi3Rjk?=
 =?us-ascii?Q?DT14NRuai8d/oPPes2Hxi1XIPLZPALZfXnMGvyEeQFXkc2xHAfUbV6wbRhni?=
 =?us-ascii?Q?c7o9M4VLKvCqSeOlIcC5a7uy3nzPAf4HUEy9OXpqmOXilYnov6DXcpOrFAGt?=
 =?us-ascii?Q?uYVXxYx70+B6kmoKmfoXivhruwmRlCu2pSNtAUq3MCLKdwRjoA1Ic0Lm6dfM?=
 =?us-ascii?Q?qlicLxFL9AO6Z0FXqBahJ08h?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a199c2cc-7b0d-4a6d-700c-08d8cc7441f3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 20:58:16.9104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WcYJ5pZf5tXdk9ckMOTusoU2DFJ7XhFQSLhznNosLbgXox04KaJRHXSbZnErhw2zSA28fQFy70OMC304a1iaSvuleMOvGzZ0pBUinocnCFg=
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102080119
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=eric.devolder@oracle.com; helo=userp2120.oracle.com
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

This change implements the support for the ACPI ERST feature[1,2].

The size of the ACPI ERST storage is declared via the QEMU
global parameter acpi-erst.size. The size can range from 64KiB
to to 64MiB. The default is 64KiB.

The location of the ACPI ERST storage backing file is delared
via the QEMU global parameter acpi-erst.filename. The default
is acpi-erst.backing.

[1] "Advanced Configuration and Power Interface Specification",
    version 6.2, May 2017.
    https://www.uefi.org/sites/default/files/resources/ACPI_6_2.pdf

[2] "Unified Extensible Firmware Interface Specification",
    version 2.8, March 2019.
    https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pdf

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 hw/acpi/erst.c | 952 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 952 insertions(+)
 create mode 100644 hw/acpi/erst.c

diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
new file mode 100644
index 0000000..3a342f9
--- /dev/null
+++ b/hw/acpi/erst.c
@@ -0,0 +1,952 @@
+/*
+ * ACPI Error Record Serialization Table, ERST, Implementation
+ *
+ * Copyright (c) 2020 Oracle and/or its affiliates.
+ *
+ * See ACPI specification,
+ * "ACPI Platform Error Interfaces" : "Error Serialization"
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation;
+ * version 2 of the License.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>
+ */
+
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <unistd.h>
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/sysbus.h"
+#include "qom/object_interfaces.h"
+#include "qemu/error-report.h"
+#include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
+#include "hw/acpi/acpi.h"
+#include "hw/acpi/acpi-defs.h"
+#include "hw/acpi/aml-build.h"
+#include "hw/acpi/bios-linker-loader.h"
+#include "exec/address-spaces.h"
+#include "hw/acpi/erst.h"
+
+#ifdef _ERST_DEBUG
+#define erst_debug(fmt, ...) \
+    do { fprintf(stderr, fmt, ## __VA_ARGS__); fflush(stderr); } while (0)
+#else
+#define erst_debug(fmt, ...) do { } while (0)
+#endif
+
+/* See UEFI spec, Appendix N Common Platform Error Record */
+/* UEFI CPER allows for an OSPM book keeping area in the record */
+#define UEFI_CPER_RECORD_MIN_SIZE 128U
+#define UEFI_CPER_SIZE_OFFSET 20U
+#define UEFI_CPER_RECORD_ID_OFFSET 96U
+#define IS_UEFI_CPER_RECORD(ptr) \
+    (((ptr)[0] == 'C') && \
+     ((ptr)[1] == 'P') && \
+     ((ptr)[2] == 'E') && \
+     ((ptr)[3] == 'R'))
+#define THE_UEFI_CPER_RECORD_ID(ptr) \
+    (*(uint64_t *)(&(ptr)[UEFI_CPER_RECORD_ID_OFFSET]))
+
+#define ERST_INVALID_RECORD_ID (~0UL)
+#define ERST_EXECUTE_OPERATION_MAGIC 0x9CUL
+#define ERST_CSR_ACTION (0UL << 3) /* action (cmd) */
+#define ERST_CSR_VALUE  (1UL << 3) /* argument/value (data) */
+
+/*
+ * As ERST_IOMEM_SIZE is used to map the ERST into the guest,
+ * it should/must be an integer multiple of PAGE_SIZE.
+ * NOTE that any change to this value will make any pre-
+ * existing backing files, not of the same ERST_IOMEM_SIZE,
+ * unusable to the guest.
+ */
+#define ERST_IOMEM_SIZE (2UL * 4096)
+
+/*
+ * This implementation is an ACTION (cmd) and VALUE (data)
+ * interface consisting of just two 64-bit registers.
+ */
+#define ERST_REG_LEN (2UL * sizeof(uint64_t))
+
+/*
+ * The space not utilized by the register interface is the
+ * buffer for exchanging ERST record contents.
+ */
+#define ERST_RECORD_SIZE (ERST_IOMEM_SIZE - ERST_REG_LEN)
+
+/*
+ * Mode to be used for backing file
+ */
+#define ERST_BACKING_FILE_MODE 0644 /* S_IRWXU|S_IRWXG */
+
+#define ACPIERST(obj) \
+    OBJECT_CHECK(ERSTDeviceState, (obj), TYPE_ACPI_ERST)
+#define ACPIERST_CLASS(oc) \
+    OBJECT_CLASS_CHECK(ERSTDeviceStateClass, (oc), TYPE_ACPI_ERST)
+#define ACPIERST_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(ERSTDeviceStateClass, (obj), TYPE_ACPI_ERST)
+
+static hwaddr erst_base;
+
+typedef struct {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+    uint32_t prop_size;
+    char *prop_filename;
+    hwaddr base;
+
+    uint8_t operation;
+    uint8_t busy_status;
+    uint8_t command_status;
+    uint32_t record_offset;
+    uint32_t record_count;
+    uint64_t reg_action;
+    uint64_t reg_value;
+    uint64_t record_identifier;
+
+    unsigned next_record_index;
+    uint8_t record[ERST_RECORD_SIZE]; /* read/written directly by guest */
+    uint8_t tmp_record[ERST_RECORD_SIZE]; /* intermediate manipulation buffer */
+    uint8_t *nvram; /* persistent storage, of length prop_size */
+
+} ERSTDeviceState;
+
+static void update_erst_backing_file(ERSTDeviceState *s,
+    off_t offset, const uint8_t *data, size_t length)
+{
+    int fd;
+
+    /* Bounds check */
+    if ((offset + length) > s->prop_size) {
+        error_report("update: off 0x%lx len 0x%lx > size 0x%lx out of range",
+            (long)offset, (long)length, (long)s->prop_size);
+        return;
+    }
+
+    fd = open(s->prop_filename, O_WRONLY | O_CREAT, ERST_BACKING_FILE_MODE);
+    if (fd > 0) {
+        off_t src;
+        size_t wrc = 0;
+        src = lseek(fd, offset, SEEK_SET);
+        if (offset == src) {
+            wrc = write(fd, data, length);
+        }
+        if ((offset != src) || (length != wrc)) {
+            error_report("ERST write failed: %d %d", (int)wrc, (int)length);
+        }
+        close(fd);
+    } else {
+        error_report("open failed: %s : %d", s->prop_filename, fd);
+    }
+}
+
+static unsigned copy_from_nvram_by_index(ERSTDeviceState *s, unsigned index)
+{
+    /* Read a nvram[] entry into tmp_record */
+    unsigned rc = ACPI_ERST_STATUS_FAILED;
+    off_t offset = (index * ERST_RECORD_SIZE);
+
+    if ((offset + ERST_RECORD_SIZE) <= s->prop_size) {
+        memcpy(s->tmp_record, &s->nvram[offset], ERST_RECORD_SIZE);
+        rc = ACPI_ERST_STATUS_SUCCESS;
+    }
+    return rc;
+}
+
+static unsigned copy_to_nvram_by_index(ERSTDeviceState *s, unsigned index)
+{
+    /* Write entry in tmp_record into nvram[], and backing file */
+    unsigned rc = ACPI_ERST_STATUS_FAILED;
+    off_t offset = (index * ERST_RECORD_SIZE);
+
+    if ((offset + ERST_RECORD_SIZE) <= s->prop_size) {
+        memcpy(&s->nvram[offset], s->tmp_record, ERST_RECORD_SIZE);
+        update_erst_backing_file(s, offset, s->tmp_record, ERST_RECORD_SIZE);
+        rc = ACPI_ERST_STATUS_SUCCESS;
+    }
+    return rc;
+}
+
+static int lookup_erst_record_by_identifier(ERSTDeviceState *s,
+    uint64_t record_identifier, bool *record_found, bool alloc_for_write)
+{
+    int rc = -1;
+    int empty_index = -1;
+    int index = 0;
+    unsigned rrc;
+
+    *record_found = 0;
+
+    do {
+        rrc = copy_from_nvram_by_index(s, (unsigned)index);
+        if (rrc == ACPI_ERST_STATUS_SUCCESS) {
+            uint64_t this_identifier;
+            this_identifier = THE_UEFI_CPER_RECORD_ID(s->tmp_record);
+            if (IS_UEFI_CPER_RECORD(s->tmp_record) &&
+                (this_identifier == record_identifier)) {
+                rc = index;
+                *record_found = 1;
+                break;
+            }
+            if ((this_identifier == ERST_INVALID_RECORD_ID) &&
+                (empty_index < 0)) {
+                empty_index = index; /* first available for write */
+            }
+        }
+        ++index;
+    } while (rrc == ACPI_ERST_STATUS_SUCCESS);
+
+    /* Record not found, allocate for writing */
+    if ((rc < 0) && alloc_for_write) {
+        rc = empty_index;
+    }
+
+    return rc;
+}
+
+static unsigned clear_erst_record(ERSTDeviceState *s)
+{
+    unsigned rc = ACPI_ERST_STATUS_RECORD_NOT_FOUND;
+    bool record_found;
+    int index;
+
+    index = lookup_erst_record_by_identifier(s,
+        s->record_identifier, &record_found, 0);
+    if (record_found) {
+        memset(s->tmp_record, 0xFF, ERST_RECORD_SIZE);
+        rc = copy_to_nvram_by_index(s, (unsigned)index);
+        if (rc == ACPI_ERST_STATUS_SUCCESS) {
+            s->record_count -= 1;
+        }
+    }
+
+    return rc;
+}
+
+static unsigned write_erst_record(ERSTDeviceState *s)
+{
+    unsigned rc = ACPI_ERST_STATUS_FAILED;
+
+    if (s->record_offset < (ERST_RECORD_SIZE - UEFI_CPER_RECORD_MIN_SIZE)) {
+        uint64_t record_identifier;
+        uint8_t *record = &s->record[s->record_offset];
+        bool record_found;
+        int index;
+
+        record_identifier = (s->record_identifier == ERST_INVALID_RECORD_ID)
+            ? THE_UEFI_CPER_RECORD_ID(record) : s->record_identifier;
+
+        index = lookup_erst_record_by_identifier(s,
+            record_identifier, &record_found, 1);
+        if (index < 0) {
+            rc = ACPI_ERST_STATUS_NOT_ENOUGH_SPACE;
+        } else {
+            if (0 != s->record_offset) {
+                memset(&s->tmp_record[ERST_RECORD_SIZE - s->record_offset],
+                    0xFF, s->record_offset);
+            }
+            memcpy(s->tmp_record, record, ERST_RECORD_SIZE - s->record_offset);
+            rc = copy_to_nvram_by_index(s, (unsigned)index);
+            if (rc == ACPI_ERST_STATUS_SUCCESS) {
+                if (!record_found) { /* not overwriting existing record */
+                    s->record_count += 1; /* writing new record */
+                }
+            }
+        }
+    }
+
+    return rc;
+}
+
+static unsigned next_erst_record(ERSTDeviceState *s,
+    uint64_t *record_identifier)
+{
+    unsigned rc = ACPI_ERST_STATUS_RECORD_NOT_FOUND;
+    unsigned index;
+    unsigned rrc;
+
+    *record_identifier = ERST_INVALID_RECORD_ID;
+
+    index = s->next_record_index;
+    do {
+        rrc = copy_from_nvram_by_index(s, (unsigned)index);
+        if (rrc == ACPI_ERST_STATUS_SUCCESS) {
+            if (IS_UEFI_CPER_RECORD(s->tmp_record)) {
+                s->next_record_index = index + 1; /* where to start next time */
+                *record_identifier = THE_UEFI_CPER_RECORD_ID(s->tmp_record);
+                rc = ACPI_ERST_STATUS_SUCCESS;
+                break;
+            }
+            ++index;
+        } else {
+            if (s->next_record_index == 0) {
+                rc = ACPI_ERST_STATUS_RECORD_STORE_EMPTY;
+            }
+            s->next_record_index = 0; /* at end, reset */
+        }
+    } while (rrc == ACPI_ERST_STATUS_SUCCESS);
+
+    return rc;
+}
+
+static unsigned read_erst_record(ERSTDeviceState *s)
+{
+    unsigned rc = ACPI_ERST_STATUS_RECORD_NOT_FOUND;
+    bool record_found;
+    int index;
+
+    index = lookup_erst_record_by_identifier(s,
+        s->record_identifier, &record_found, 0);
+    if (record_found) {
+        rc = copy_from_nvram_by_index(s, (unsigned)index);
+        if (rc == ACPI_ERST_STATUS_SUCCESS) {
+            if (s->record_offset < ERST_RECORD_SIZE) {
+                memcpy(&s->record[s->record_offset], s->tmp_record,
+                    ERST_RECORD_SIZE - s->record_offset);
+            }
+        }
+    }
+
+    return rc;
+}
+
+static unsigned get_erst_record_count(ERSTDeviceState *s)
+{
+    /* Compute record_count */
+    off_t offset;
+
+    s->record_count = 0;
+    offset = 0;
+    do {
+        uint8_t *ptr = &s->nvram[offset];
+        uint64_t record_identifier = THE_UEFI_CPER_RECORD_ID(ptr);
+        if (IS_UEFI_CPER_RECORD(ptr) &&
+            (ERST_INVALID_RECORD_ID != record_identifier)) {
+            s->record_count += 1;
+        }
+        offset += ERST_RECORD_SIZE;
+    } while (offset < (off_t)s->prop_size);
+
+    return s->record_count;
+}
+
+static void load_erst_backing_file(ERSTDeviceState *s)
+{
+    int fd;
+    struct stat statbuf;
+
+    erst_debug("+load_erst_backing_file()\n");
+
+    /* Allocate and initialize nvram[] */
+    s->nvram = g_malloc(s->prop_size);
+    memset(s->nvram, 0xFF, s->prop_size);
+
+    /* Ensure backing file at least same as prop_size */
+    if (stat(s->prop_filename, &statbuf) == 0) {
+        /* ensure prop_size at least matches file size */
+        if (statbuf.st_size < s->prop_size) {
+            /* Ensure records are ERST_INVALID_RECORD_ID */
+            memset(s->nvram, 0xFF, s->prop_size - statbuf.st_size);
+            update_erst_backing_file(s,
+                statbuf.st_size, s->nvram, s->prop_size - statbuf.st_size);
+        }
+    }
+
+    /* Pre-load nvram[] from backing file, if present */
+    fd = open(s->prop_filename, O_RDONLY, ERST_BACKING_FILE_MODE);
+    if (fd > 0) {
+        size_t rrc = read(fd, s->nvram, s->prop_size);
+        (void)rrc;
+        close(fd);
+        /*
+         * If existing file is smaller than prop_size, it will be resized
+         * accordingly upon subsequent record writes. If the file
+         * is larger than prop_size, only prop_size bytes are utilized,
+         * the extra bytes are untouched (though will be lost after
+         * a migration when the backing file is re-written as length
+         * of prop_size bytes).
+         */
+    } else {
+        /* Create empty backing file */
+        update_erst_backing_file(s, 0, s->nvram, s->prop_size);
+    }
+
+    /* Initialize record_count */
+    get_erst_record_count(s);
+
+    erst_debug("-load_erst_backing_file() %d\n", s->record_count);
+}
+
+static uint64_t erst_rd_reg64(hwaddr addr,
+    uint64_t reg, unsigned size)
+{
+    uint64_t rdval;
+    uint64_t mask;
+    unsigned shift;
+
+    if (size == sizeof(uint64_t)) {
+        /* 64b access */
+        mask = 0xFFFFFFFFFFFFFFFFUL;
+        shift = 0;
+    } else {
+        /* 32b access */
+        mask = 0x00000000FFFFFFFFUL;
+        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
+    }
+
+    rdval = reg;
+    rdval >>= shift;
+    rdval &= mask;
+
+    return rdval;
+}
+
+static uint64_t erst_wr_reg64(hwaddr addr,
+    uint64_t reg, uint64_t val, unsigned size)
+{
+    uint64_t wrval;
+    uint64_t mask;
+    unsigned shift;
+
+    if (size == sizeof(uint64_t)) {
+        /* 64b access */
+        mask = 0xFFFFFFFFFFFFFFFFUL;
+        shift = 0;
+    } else {
+        /* 32b access */
+        mask = 0x00000000FFFFFFFFUL;
+        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
+    }
+
+    val &= mask;
+    val <<= shift;
+    mask <<= shift;
+    wrval = reg;
+    wrval &= ~mask;
+    wrval |= val;
+
+    return wrval;
+}
+
+static void erst_write(void *opaque, hwaddr addr,
+    uint64_t val, unsigned size)
+{
+    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
+
+    if (addr < ERST_REG_LEN) {
+        /*
+         * NOTE: All actions/operations/side effects happen on the WRITE,
+         * by design. The READs simply return the reg_value contents.
+         */
+        erst_debug("ERST write %016lx %10s val %016lx sz %u",
+            addr, erst_reg(addr), val, size);
+        /* The REGISTER region */
+        switch (addr) {
+        case ERST_CSR_VALUE + 0:
+        case ERST_CSR_VALUE + 4:
+            s->reg_value = erst_wr_reg64(addr, s->reg_value, val, size);
+            break;
+        case ERST_CSR_ACTION + 0:
+/*      case ERST_CSR_ACTION+4: as coded, not really a 64b register */
+            switch (val) {
+            case ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION:
+            case ACPI_ERST_ACTION_BEGIN_READ_OPERATION:
+            case ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION:
+            case ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION:
+            case ACPI_ERST_ACTION_END_OPERATION:
+                s->operation = val;
+                break;
+            case ACPI_ERST_ACTION_SET_RECORD_OFFSET:
+                s->record_offset = s->reg_value;
+                break;
+            case ACPI_ERST_ACTION_EXECUTE_OPERATION:
+                if ((uint8_t)s->reg_value == ERST_EXECUTE_OPERATION_MAGIC) {
+                    s->busy_status = 1;
+                    switch (s->operation) {
+                    case ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION:
+                        s->command_status = write_erst_record(s);
+                        break;
+                    case ACPI_ERST_ACTION_BEGIN_READ_OPERATION:
+                        s->command_status = read_erst_record(s);
+                        break;
+                    case ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION:
+                        s->command_status = clear_erst_record(s);
+                        break;
+                    case ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION:
+                        s->command_status = ACPI_ERST_STATUS_SUCCESS;
+                        break;
+                    case ACPI_ERST_ACTION_END_OPERATION:
+                        s->command_status = ACPI_ERST_STATUS_SUCCESS;
+                        break;
+                    default:
+                        s->command_status = ACPI_ERST_STATUS_FAILED;
+                        break;
+                    }
+                    s->record_identifier = ERST_INVALID_RECORD_ID;
+                    s->busy_status = 0;
+                }
+                break;
+            case ACPI_ERST_ACTION_CHECK_BUSY_STATUS:
+                s->reg_value = s->busy_status;
+                break;
+            case ACPI_ERST_ACTION_GET_COMMAND_STATUS:
+                s->reg_value = s->command_status;
+                break;
+            case ACPI_ERST_ACTION_GET_RECORD_IDENTIFIER:
+                s->command_status = next_erst_record(s, &s->reg_value);
+                break;
+            case ACPI_ERST_ACTION_SET_RECORD_IDENTIFIER:
+                s->record_identifier = s->reg_value;
+                break;
+            case ACPI_ERST_ACTION_GET_RECORD_COUNT:
+                s->reg_value = s->record_count;
+                break;
+            case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
+                s->reg_value = s->base + ERST_REG_LEN;
+                break;
+            case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
+                s->reg_value = ERST_RECORD_SIZE;
+                break;
+            case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:
+                s->reg_value = 0; /* correct/intended value */
+                break;
+            case ACPI_ERST_ACTION_GET_EXECUTE_OPERATION_TIMINGS:
+                /*
+                 * 100UL is max, 10UL is nominal
+                 */
+                s->reg_value = ((100UL << 32) | (10UL << 0));
+                break;
+            case ACPI_ERST_ACTION_RESERVED:
+            default:
+                /*
+                 * NOP
+                 */
+                break;
+            }
+            break;
+        default:
+            /*
+             * All other register writes are NO-OPs
+             */
+            break;
+        }
+    } else {
+        /* The RECORD region */
+        unsigned offset = addr - ERST_REG_LEN;
+        uint8_t *ptr = &s->record[offset];
+        switch (size) {
+        default:
+        case sizeof(uint8_t):
+            *(uint8_t *)ptr = (uint8_t)val;
+            break;
+        case sizeof(uint16_t):
+            *(uint16_t *)ptr = (uint16_t)val;
+            break;
+        case sizeof(uint32_t):
+            *(uint32_t *)ptr = (uint32_t)val;
+            break;
+        case sizeof(uint64_t):
+            *(uint64_t *)ptr = (uint64_t)val;
+            break;
+        }
+    }
+}
+
+static uint64_t erst_read(void *opaque, hwaddr addr,
+                                unsigned size)
+{
+    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
+    uint64_t val = 0;
+
+    if (addr < ERST_REG_LEN) {
+        switch (addr) {
+        case ERST_CSR_ACTION + 0:
+        case ERST_CSR_ACTION + 4:
+            val = erst_rd_reg64(addr, s->reg_action, size);
+            break;
+        case ERST_CSR_VALUE + 0:
+        case ERST_CSR_VALUE + 4:
+            val = erst_rd_reg64(addr, s->reg_value, size);
+            break;
+        default:
+            break;
+        }
+    erst_debug("ERST read  %016lx %10s val %016lx sz %u\n",
+        addr, erst_reg(addr), val, size);
+    } else {
+        /*
+         * The RECORD region
+         */
+        uint8_t *ptr = &s->record[addr - ERST_REG_LEN];
+        switch (size) {
+        default:
+        case sizeof(uint8_t):
+            val = *(uint8_t *)ptr;
+            break;
+        case sizeof(uint16_t):
+            val = *(uint16_t *)ptr;
+            break;
+        case sizeof(uint32_t):
+            val = *(uint32_t *)ptr;
+            break;
+        case sizeof(uint64_t):
+            val = *(uint64_t *)ptr;
+            break;
+        }
+    }
+    erst_debug("ERST read  %016lx %10s val %016lx sz %u\n",
+        addr, erst_reg(addr), val, size);
+    return val;
+}
+
+static size_t build_erst_action(GArray *table_data,
+    uint8_t serialization_action,
+    uint8_t instruction,
+    uint8_t flags,
+    uint8_t width,
+    uint64_t address,
+    uint64_t value,
+    uint64_t mask)
+{
+    /* See ACPI spec, Error Serialization */
+    uint8_t access_width = 0;
+    build_append_int_noprefix(table_data, serialization_action, 1);
+    build_append_int_noprefix(table_data, instruction         , 1);
+    build_append_int_noprefix(table_data, flags               , 1);
+    build_append_int_noprefix(table_data, 0                   , 1);
+    /* GAS space_id */
+    build_append_int_noprefix(table_data, AML_SYSTEM_MEMORY   , 1);
+    /* GAS bit_width */
+    build_append_int_noprefix(table_data, width               , 1);
+    /* GAS bit_offset */
+    build_append_int_noprefix(table_data, 0                   , 1);
+    /* GAS access_width */
+    switch (width) {
+    case 8:
+        access_width = 1;
+        break;
+    case 16:
+        access_width = 2;
+        break;
+    case 32:
+        access_width = 3;
+        break;
+    case 64:
+        access_width = 4;
+        break;
+    default:
+        access_width = 0;
+        break;
+    }
+    build_append_int_noprefix(table_data, access_width        , 1);
+    /* GAS address */
+    build_append_int_noprefix(table_data, address, 8);
+    /* value */
+    build_append_int_noprefix(table_data, value  , 8);
+    /* mask */
+    build_append_int_noprefix(table_data, mask   , 8);
+
+    return 1;
+}
+
+static const MemoryRegionOps erst_rw_ops = {
+    .read = erst_read,
+    .write = erst_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+void build_erst(GArray *table_data, BIOSLinker *linker, hwaddr base)
+{
+    unsigned action, insns = 0;
+    unsigned erst_start = table_data->len;
+    unsigned iec_offset = 0;
+
+    /* See ACPI spec, Error Serialization */
+    acpi_data_push(table_data, sizeof(AcpiTableHeader));
+    /* serialization_header_length */
+    build_append_int_noprefix(table_data, 48, 4);
+    /* reserved */
+    build_append_int_noprefix(table_data,  0, 4);
+    iec_offset = table_data->len;
+    /* instruction_entry_count (placeholder) */
+    build_append_int_noprefix(table_data,  0, 4);
+
+#define BEA(I, F, W, ADDR, VAL, MASK) \
+    build_erst_action(table_data, action, \
+        ACPI_ERST_INST_##I, F, W, base + ADDR, VAL, MASK)
+#define MASK8  0x00000000000000FFUL
+#define MASK16 0x000000000000FFFFUL
+#define MASK32 0x00000000FFFFFFFFUL
+#define MASK64 0xFFFFFFFFFFFFFFFFUL
+
+    for (action = 0; action < ACPI_ERST_MAX_ACTIONS; ++action) {
+        switch (action) {
+        case ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            break;
+        case ACPI_ERST_ACTION_BEGIN_READ_OPERATION:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            break;
+        case ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            break;
+        case ACPI_ERST_ACTION_END_OPERATION:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            break;
+        case ACPI_ERST_ACTION_SET_RECORD_OFFSET:
+            insns += BEA(WRITE_REGISTER      , 0, 32,
+                ERST_CSR_VALUE , 0, MASK32);
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            break;
+        case ACPI_ERST_ACTION_EXECUTE_OPERATION:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_VALUE , ERST_EXECUTE_OPERATION_MAGIC, MASK8);
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            break;
+        case ACPI_ERST_ACTION_CHECK_BUSY_STATUS:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            insns += BEA(READ_REGISTER_VALUE , 0, 32,
+                ERST_CSR_VALUE, 0x01, MASK8);
+            break;
+        case ACPI_ERST_ACTION_GET_COMMAND_STATUS:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            insns += BEA(READ_REGISTER       , 0, 32,
+                ERST_CSR_VALUE, 0, MASK8);
+            break;
+        case ACPI_ERST_ACTION_GET_RECORD_IDENTIFIER:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            insns += BEA(READ_REGISTER       , 0, 64,
+                ERST_CSR_VALUE, 0, MASK64);
+            break;
+        case ACPI_ERST_ACTION_SET_RECORD_IDENTIFIER:
+            insns += BEA(WRITE_REGISTER      , 0, 64,
+                ERST_CSR_VALUE , 0, MASK64);
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            break;
+        case ACPI_ERST_ACTION_GET_RECORD_COUNT:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            insns += BEA(READ_REGISTER       , 0, 32,
+                ERST_CSR_VALUE, 0, MASK32);
+            break;
+        case ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            break;
+        case ACPI_ERST_ACTION_RESERVED:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            break;
+        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            insns += BEA(READ_REGISTER       , 0, 64,
+                ERST_CSR_VALUE, 0, MASK64);
+            break;
+        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            insns += BEA(READ_REGISTER       , 0, 64,
+                ERST_CSR_VALUE, 0, MASK32);
+            break;
+        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            insns += BEA(READ_REGISTER       , 0, 32,
+                ERST_CSR_VALUE, 0, MASK32);
+            break;
+        case ACPI_ERST_ACTION_GET_EXECUTE_OPERATION_TIMINGS:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            insns += BEA(READ_REGISTER       , 0, 64,
+                ERST_CSR_VALUE, 0, MASK64);
+        default:
+            insns += BEA(NOOP, 0, 0, 0, action, 0);
+            break;
+        }
+    }
+
+    /* acpi_data_push() within BEA() can result in new GArray pointer */
+    *(uint32_t *)(table_data->data + iec_offset) = cpu_to_le32(insns);
+
+    build_header(linker, table_data,
+                 (void *)(table_data->data + erst_start),
+                 "ERST", table_data->len - erst_start,
+                 1, NULL, NULL);
+
+    if (erst_base == 0) {
+        /*
+         * This ACPI routine is invoked twice, but this code
+         * snippet needs to happen just once.
+         * And this code in erst_class_init() is too early.
+         */
+        DeviceState *dev;
+        SysBusDevice *s;
+
+        dev = qdev_new(TYPE_ACPI_ERST);
+        erst_debug("qdev_create dev %p\n", dev);
+        s = SYS_BUS_DEVICE(dev);
+        sysbus_realize_and_unref(s, &error_fatal);
+
+        ACPIERST(dev)->base = base;
+        sysbus_mmio_map(s, 0, base);
+        erst_base = base;
+        erst_debug("erst_base %lx\n", base);
+    }
+}
+
+/*******************************************************************/
+/*******************************************************************/
+static int erst_post_load(void *opaque, int version_id)
+{
+    ERSTDeviceState *s = opaque;
+    erst_debug("+erst_post_load(%d)\n", version_id);
+    /* Ensure nvram[] persists into backing file */
+    update_erst_backing_file(s, 0, s->nvram, s->prop_size);
+    erst_debug("-erst_post_load()\n");
+    return 0;
+}
+
+static const VMStateDescription erst_vmstate  = {
+    .name = "acpi-erst",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .post_load = erst_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(operation, ERSTDeviceState),
+        VMSTATE_UINT8(busy_status, ERSTDeviceState),
+        VMSTATE_UINT8(command_status, ERSTDeviceState),
+        VMSTATE_UINT32(record_offset, ERSTDeviceState),
+        VMSTATE_UINT32(record_count, ERSTDeviceState),
+        VMSTATE_UINT64(reg_action, ERSTDeviceState),
+        VMSTATE_UINT64(reg_value, ERSTDeviceState),
+        VMSTATE_UINT64(record_identifier, ERSTDeviceState),
+        VMSTATE_UINT8_ARRAY(record, ERSTDeviceState, ERST_RECORD_SIZE),
+        VMSTATE_UINT8_ARRAY(tmp_record, ERSTDeviceState, ERST_RECORD_SIZE),
+        VMSTATE_VARRAY_UINT32(nvram, ERSTDeviceState, prop_size, 0,
+            vmstate_info_uint8, uint8_t),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void erst_realizefn(DeviceState *dev, Error **errp)
+{
+    SysBusDevice *d = SYS_BUS_DEVICE(dev);
+    ERSTDeviceState *s = ACPIERST(dev);
+
+    erst_debug("+erst_realizefn()\n");
+    if (!s->prop_filename) {
+        s->prop_filename = (char *)(TYPE_ACPI_ERST ".backing");
+    }
+
+    if (!s->prop_filename) {
+        error_setg(errp, "'filename' property is not set");
+        return;
+    }
+
+    if (!(s->prop_size > ERST_RECORD_SIZE) &&
+        (s->prop_size <= 0x04000000)) {
+        error_setg(errp, "'size' property %d is not set properly",
+            s->prop_size);
+        return;
+    }
+
+    /* Convert prop_size to integer multiple of ERST_RECORD_SIZE */
+    s->prop_size -= (s->prop_size % ERST_RECORD_SIZE);
+
+    load_erst_backing_file(s);
+
+    erst_debug("filename %s\n", s->prop_filename);
+    erst_debug("size %x\n", s->prop_size);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &erst_rw_ops, s,
+                          TYPE_ACPI_ERST, ERST_IOMEM_SIZE);
+    sysbus_init_mmio(d, &s->iomem);
+    erst_debug("-erst_realizefn()\n");
+}
+
+static void erst_unrealizefn(DeviceState *dev)
+{
+    ERSTDeviceState *s = ACPIERST(dev);
+
+    erst_debug("+erst_unrealizefn()\n");
+    if (s->nvram) {
+        /* Ensure nvram[] persists into backing file */
+        update_erst_backing_file(s, 0, s->nvram, s->prop_size);
+        g_free(s->nvram);
+        s->nvram = NULL;
+    }
+    erst_debug("-erst_unrealizefn()\n");
+}
+
+static void erst_reset(DeviceState *dev)
+{
+    ERSTDeviceState *s = ACPIERST(dev);
+
+    erst_debug("+erst_reset(%p) %d\n", s, s->record_count);
+    s->operation = 0;
+    s->busy_status = 0;
+    s->command_status = ACPI_ERST_STATUS_SUCCESS;
+    /* indicate empty/no-more until further notice */
+    s->record_identifier = ERST_INVALID_RECORD_ID;
+    s->record_offset = 0;
+    s->next_record_index = 0;
+    /* NOTE: record_count and nvram[] are initialized elsewhere */
+    erst_debug("-erst_reset()\n");
+}
+
+static Property erst_properties[] = {
+    DEFINE_PROP_UINT32("size", ERSTDeviceState, prop_size, 0x00010000),
+    DEFINE_PROP_STRING("filename", ERSTDeviceState, prop_filename),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void erst_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    erst_debug("+erst_class_init()\n");
+    dc->realize = erst_realizefn;
+    dc->unrealize = erst_unrealizefn;
+    dc->reset = erst_reset;
+    dc->vmsd = &erst_vmstate;
+    device_class_set_props(dc, erst_properties);
+    dc->desc = "ACPI Error Record Serialization Table (ERST) device";
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    erst_debug("-erst_class_init()\n");
+}
+
+static const TypeInfo erst_type_info = {
+    .name          = TYPE_ACPI_ERST,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .class_init    = erst_class_init,
+    .instance_size = sizeof(ERSTDeviceState),
+};
+
+static void erst_register_types(void)
+{
+    type_register_static(&erst_type_info);
+}
+
+type_init(erst_register_types)
-- 
1.8.3.1


