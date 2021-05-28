Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC113946EE
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 20:20:45 +0200 (CEST)
Received: from localhost ([::1]:49032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmh6C-00084X-1F
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 14:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lmh0M-0001hM-BJ
 for qemu-devel@nongnu.org; Fri, 28 May 2021 14:14:42 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:7724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lmh0K-0007Rn-2s
 for qemu-devel@nongnu.org; Fri, 28 May 2021 14:14:42 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14SIBKst004566; Fri, 28 May 2021 18:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=26hTaa0gH5tsCYr5qXkEVW6QJMWxaCzU6+lIpfh8GkY=;
 b=mYiwhYiXEE9RWAkcg1wVlCJcjPCXaJ0Ea2wq5Bkd8vLpG4lJA1GF6423ftXc2EfZUS7c
 SwS8DpKnZzXsgqgEZUvpBNZinqJx9WxjIlzGMvkpvHRHyt0uo6IhLkDFfe158ZNuCiSX
 u5SIhlkehdgVWjBMA7XO+ijkBh0WpIzUt4tlJ/sPu5760YzBXdeWzhq+OSdcmgVga98h
 m8ToU+GyCOC0cZMpOa0PPR5v8a3lyQLbqHC6Ha9nw/jEFROp1X5nZxIU66hZnI0+QlYD
 LSqpVIC1c9OU/K4qlQT5AVKUnVUkt4wtd0qttEVKk9cX39CDij2/J85IlIS2JmupC0SL +w== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 38u4mhr0hj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 May 2021 18:14:38 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14SIBPjJ129598;
 Fri, 28 May 2021 18:14:37 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by aserp3020.oracle.com with ESMTP id 38rehmnb9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 May 2021 18:14:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8EFgaptKy7daSPMBVzzN8OBF/5guE0soi4zYzZ10IsIJU3opCedomP2nG0GGi8jZdD05eyi9HWCuHGSAAjqFL+fKJ0pFU1lB2BqchVtaCl5bcF2ihhUzdNSUBovCz3OIe1QDcUW4FkJqmMsWllzGt+qaxoTl9k7/0pI/kjy8H1ro9mvwT8ESCVbRdJF4650rHXQH3QprIgDS9bwl7af3FXnxH7zHMTpYgGHqVyvzoRqX9DakfFppeZBAlcGbZb4sosYtB4cPn+CztdgSsbDQ+lc7v3yjK4D1W7jvL8sauEZI8lAV1O80HNSqogKDEwKkuhMluh6opiEVgJ2XlZUjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26hTaa0gH5tsCYr5qXkEVW6QJMWxaCzU6+lIpfh8GkY=;
 b=KTTARFKBo1fIwuML8GZATJ5jVxTLde1oivSH/6/aZ6l9TOYLXv36u9w7MNex5UgBzwPgT6S/WnQ/7OGy5C+WAPMia+ofpZuGRaZZWOom9e2MwFBloiiikVIvreX+tt8XMOvjbvlUjqCFEds/+Ozt06grazQqJ3Jtbzbt1ZhYzXaCaasWpY9mNO+GnSt8/Ls4ttKQyZBjZTw9HDtNWH79DIVk4CuLkVl2xQ5RUxm7yDDoNU4ojgWcFSVeBzaLwDUZyRo+Vptf5aN9sH1PD1ItgAeKXBVgTYhMCzQlRnuexi0qp/q8fLni4bnhFwmpYZ9L/+T5prW1ia81CRZcOusMxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26hTaa0gH5tsCYr5qXkEVW6QJMWxaCzU6+lIpfh8GkY=;
 b=p9xuOAiuEQ3ZMY33nK7WOA6Dh0MZu7kcwMy/XmS8ONXnCfkGhbIoKGJFO2LS3UfgfgWioZCegG7BpU8VFjdE1fh3eXnPs1WbtbvFMXUQU2V0MUAqKjcqNnf3jCiy/GPs7C8OvgnQHcRmVktpbrHi7Cgi+CFX/9IxXT11zTUuKC8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB2045.namprd10.prod.outlook.com (2603:10b6:300:109::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Fri, 28 May
 2021 18:14:34 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%6]) with mapi id 15.20.4173.024; Fri, 28 May 2021
 18:14:34 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/7] ACPI ERST: create ERST device for pc/x86 machines.
Date: Fri, 28 May 2021 14:14:17 -0400
Message-Id: <1622225659-16847-6-git-send-email-eric.devolder@oracle.com>
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
 Transport; Fri, 28 May 2021 18:14:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e11638e-2d02-44e4-c736-08d92204727e
X-MS-TrafficTypeDiagnostic: MWHPR10MB2045:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB2045D697FEC654388AB02E4797229@MWHPR10MB2045.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WMQvd1GeUmDi3RfLKDEci7g3HdCQ1J5Lx7QTrOAwWDBj/+6gX0VgKKUQmVmVLva9iv1pjAmIYFpkQZPhwQaA6yW6zwF5fucjI5U810fgBVal3HQCQ/KXCieYYtAIpe72GcfkPljDNL9pwv8OqcRnvrwn4rx32fq3MH9E+txLavYqffy7nDQ59z62B7D88jQuWfuRjjdZd7c1VxpnzFNfVj3rgMxs5129oLiK5dTGyXRe/TAPglEuxkRRkAFf3v7zZk6qBpWD+5gQeVFA9/ckfdWU5DylrTgAKU69FaBdwOs1oQoEJnRRMfzzDxtWP8+/6tdig4nRcqMzmfZ0NIDunFczSf9ETO7kZG8g1c/wr86Oc4NG5b5el7JO/TaCl3ZW88z78ZE3o6tjXhAxbytIU5yCQI/zu1YshlfBxBo6r4lVfLgezCh3lFjg6/Il1kkKopXsF/MeDaEexRj9hGZpP8qVpiIgo7FNJ9s/p2DNVYAavgpAZO5jW/ad6rCSFwaDyn4A0woYbqBiZt+0Rvts1yMQcbEgFjVHdaLM7KF1qe85P0hF1Ux+rY9h1MoqJTU8sh6UfW/OO/PAp3U1XGRX+74SXffoXihcJEMMjHsFgN6V2HklgZEvnpoySvi5qDSwkWreY0x3lfx6cu52I5mv8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(376002)(136003)(366004)(396003)(6916009)(38350700002)(956004)(7696005)(38100700002)(52116002)(36756003)(2616005)(8936002)(66556008)(16526019)(186003)(8676002)(478600001)(26005)(66946007)(66476007)(316002)(4326008)(107886003)(2906002)(86362001)(6666004)(5660300002)(83380400001)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?F1aIEXA1kH/fRa0t1P4ZUI6jxMkolH/lGaXENwipmVqrZ3dfF9vZ4ESBRJcL?=
 =?us-ascii?Q?0A1CCQ/8w5n+VtBz5F6vwqDIDq9Mj46r+zD/HxLULEDxXD2/Sp75bzAYwQZ+?=
 =?us-ascii?Q?UAMJnyhpMQox4JJpdpG4HCsxQELQ5Uj37SC+XsUsP8ebRhWTKI84vNkn1CIu?=
 =?us-ascii?Q?Ht/4CWzDJL2NBYgDF5tUBjU9GLOUo8wVjVAU9wQ8IRz7BtqQaP2h6uGWAmNS?=
 =?us-ascii?Q?OEDxgCBD+h6ThOekpi5emSlWpgj8+GTRzteidc9WhZVzupDsZ02FO5+cE31+?=
 =?us-ascii?Q?VAXLAqYher9aaG54iYDIfMWDeezng0RMMwSpyYSvmKg8ej81tBtIRVZOe9Rd?=
 =?us-ascii?Q?78zvXBRylrOGA1jWlktedSUMGhF3kxq60w9/HCWQScS26WytafOF4oIr16i/?=
 =?us-ascii?Q?4WZQ4mgTmyU3J+9PSsQFCS48ALOck0451w+N4TmpS+g5zm8OGgnnN+dYAlqc?=
 =?us-ascii?Q?Tpq+v6A3RhDra/j3P9aBYuvrcN/ow6tTaKNxr/6p0PeVWf6UzMi10bTJm4G6?=
 =?us-ascii?Q?CG4O1Jzq2gAWVtwsas7YHrzCXgmjzQ7RbThVvw9R6dCyINk15SV9FlyEfczt?=
 =?us-ascii?Q?EE0B0YqRMJsLJYl3oi3QFJFaJKRqAgopvP24VL3zKYSQ6fh0upkz1nNgAigl?=
 =?us-ascii?Q?1bkTk4XmzmzX+XKFWoBR17TZ0gBZsUh0BxM9r+DvGCpgeji5pyebwI+nY8si?=
 =?us-ascii?Q?CsjCIEh7VCrA/hkClDNhtX3YOjuzQ4otNiz+p1wmUtHqEOEVGtoi5sDNM6De?=
 =?us-ascii?Q?iBQ9ew2vjEKpoLu8So7IGi1EeHwch0Fktlk57Lil3vMtTDmA1b4p+5plAjiJ?=
 =?us-ascii?Q?UzOE/4X3MhefxPIHuSJyXQKxLJCaD6AWOgzltSNyx4+QQsvNO4oWDVUyPdog?=
 =?us-ascii?Q?IH/ELj/mCfif05Qi4iDIrbBtJhU1lSb/xVyON+qZ6k94Cc9RCHKx67bwqgkg?=
 =?us-ascii?Q?ErINgu94ETWrDtmM0Y2rabOF3yfcif7MPOiZcuSSl9mtHZtx2zzyPnBJzJqY?=
 =?us-ascii?Q?cXiXRzfc3E34XypA8xI8RNS6pJXp9Km+81UXYGC2ei3CCuYKjDqrBpe6cNe9?=
 =?us-ascii?Q?/olSyMxnPf63Dkbi98e4x3sleC0GVTCMIb+HR783ntZZFOWBpiceoQ9Xt8ar?=
 =?us-ascii?Q?+wSQ3o90cB62Al/g7vzKS8kzjTbBBSm4hBhY7IgrKsdkXO7MFkT/klCH4lJ6?=
 =?us-ascii?Q?tOuhbwu0ZJF8bUED/a+QWH4uN4/eJI2tziqZmLZSZPfYtNdxSEcdFhtQuozo?=
 =?us-ascii?Q?ho6K1Zw+3W4JSh+pJQdhRN/dkw155VRwzQWPV++NLNqckPdt7v1Q9yNXLyJ0?=
 =?us-ascii?Q?FMo/zl8fRm2JwC5YLqyI8hpk?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e11638e-2d02-44e4-c736-08d92204727e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 18:14:34.7711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5yyH2PQ8YKaLZKJlw0n6hqRayE5L+jrvNsxdfOAWHX9YOvIPAKibpUR6dCLUFSdgbsOBKFwAauJz3BPDRneROvDOBbVDo42ll/ZyLr6mOXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB2045
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9998
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105280119
X-Proofpoint-ORIG-GUID: 1CAdUwdegq38rfjSJMvA_cp-nouVAM5g
X-Proofpoint-GUID: 1CAdUwdegq38rfjSJMvA_cp-nouVAM5g
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

This change enables ERST support for x86 guests.

ERST can be disabled at run-time, for example, with:

 -machine q35,erst=off

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 hw/i386/acpi-build.c |  7 +++++++
 hw/i386/pc.c         | 31 +++++++++++++++++++++++++++++++
 include/hw/i386/pc.h |  1 +
 3 files changed, 39 insertions(+)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index de98750..6ba79db 100644
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
@@ -2388,6 +2389,12 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
                     ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
                     x86ms->oem_table_id);
 
+    if (pcms->erst_enabled) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_erst(tables_blob, tables->linker,
+                   x86ms->oem_id, x86ms->oem_table_id);
+    }
+
     vmgenid_dev = find_vmgenid_dev();
     if (vmgenid_dev) {
         acpi_add_table(table_offsets, tables_blob);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8a84b25..b7b4cc4 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -74,6 +74,7 @@
 #include "qemu/cutils.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/cpu_hotplug.h"
+#include "hw/acpi/erst.h"
 #include "hw/boards.h"
 #include "acpi-build.h"
 #include "hw/mem/pc-dimm.h"
@@ -1111,6 +1112,7 @@ void pc_basic_device_init(struct PCMachineState *pcms,
     ISADevice *pit = NULL;
     MemoryRegion *ioport80_io = g_new(MemoryRegion, 1);
     MemoryRegion *ioportF0_io = g_new(MemoryRegion, 1);
+    const X86MachineState *x86ms = X86_MACHINE(pcms);
 
     memory_region_init_io(ioport80_io, NULL, &ioport80_io_ops, NULL, "ioport80", 1);
     memory_region_add_subregion(isa_bus->address_space_io, 0x80, ioport80_io);
@@ -1153,6 +1155,11 @@ void pc_basic_device_init(struct PCMachineState *pcms,
     }
     *rtc_state = mc146818_rtc_init(isa_bus, 2000, rtc_irq);
 
+    if (pcms->erst_enabled && x86_machine_is_acpi_enabled(x86ms)) {
+        hwaddr base = HPET_BASE + 0x10000UL;
+        setup_erst_dev(base, error_fatal);
+    }
+
     qemu_register_boot_set(pc_boot_set, *rtc_state);
 
     if (!xen_enabled() && pcms->pit_enabled) {
@@ -1529,6 +1536,22 @@ static void pc_machine_set_hpet(Object *obj, bool value, Error **errp)
     pcms->hpet_enabled = value;
 }
 
+#ifdef CONFIG_ACPI
+static bool pc_machine_get_erst(Object *obj, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    return pcms->erst_enabled;
+}
+
+static void pc_machine_set_erst(Object *obj, bool value, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    pcms->erst_enabled = value;
+}
+#endif
+
 static void pc_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
                                             const char *name, void *opaque,
                                             Error **errp)
@@ -1628,6 +1651,9 @@ static void pc_machine_initfn(Object *obj)
 #ifdef CONFIG_HPET
     pcms->hpet_enabled = true;
 #endif
+#ifdef CONFIG_ACPI
+    pcms->erst_enabled = true;
+#endif
 
     pc_system_flash_create(pcms);
     pcms->pcspk = isa_new(TYPE_PC_SPEAKER);
@@ -1752,6 +1778,11 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_add_bool(oc, "hpet",
         pc_machine_get_hpet, pc_machine_set_hpet);
 
+#ifdef CONFIG_ACPI
+    object_class_property_add_bool(oc, "erst",
+        pc_machine_get_erst, pc_machine_set_erst);
+#endif
+
     object_class_property_add(oc, PC_MACHINE_MAX_FW_SIZE, "size",
         pc_machine_get_max_fw_size, pc_machine_set_max_fw_size,
         NULL, NULL);
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index dcf060b..4458c8f 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -45,6 +45,7 @@ typedef struct PCMachineState {
     bool sata_enabled;
     bool pit_enabled;
     bool hpet_enabled;
+    bool erst_enabled;
     uint64_t max_fw_size;
 
     /* NUMA information: */
-- 
1.8.3.1


