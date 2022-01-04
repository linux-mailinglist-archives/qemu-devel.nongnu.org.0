Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB5D4845A6
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 16:56:08 +0100 (CET)
Received: from localhost ([::1]:41568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4mAR-0000zq-Bg
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 10:56:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n4m6n-0006CH-Q5
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 10:52:24 -0500
Received: from mail-eopbgr60058.outbound.protection.outlook.com
 ([40.107.6.58]:50727 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n4m6l-00038u-6T
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 10:52:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WrYe5HG8EleX0+RLXb8pI9p5UeqMFilMO2gla587U1lsiV4BrntFhFRf74pvf4BtPGtW3ZS4bnqLLGe/PleSmLA7f5tDBgXDTB8B4WQUvD+RUmdGV8PNipzdXAHdgr+8ygN/RU5jPfQWt5SGBrIvnl8ll603IpbH5a3LsbTji6MUQxwdDYxR6T63ICq8be+A/wHzR3gE9E6PUUkrAGL1ZY88Zr924i1acVhkUkurRm6s2FOl84ViDQuSmlkvZA7GOEyY+aVsxAnkSMOc/H1IfvzFQTBAK0aC3HvpC/a1AcUxcOyG6q50mJt5uhMVD0/cxGmb9/4WIKkJZN29fb6fww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KNOULwchf5XJ3vlMv7PRJ1C5S7XryXS+hZ2nqy7BDI=;
 b=KJdLjlB79c+eeETy4XWYhYqSvIlBWauJoE0Spk5Y0HOT5cvJEh09A1ibcV5QSfQSIiBH6WG0p7AySLLTQ2KjsSia8E2wacPrvmwJr+w6A0FX8keiR2yzsPj7SksfQ2fEgfROvwddmA17xNPYIV7ELKBK/Fr36NSdWHxYoP/3pekj39mZi1Rq4PUu2xhx/8GlckYbi3RMaG0TOcAjfDuPLaekWI5hEogVr4KPD8MuA5h9Fj5okrznXaZKJ/UAZU+++XNgNybJuIyVkI/HOy7oBRvuQYo586DM5HUOPF8J+yrZs+lhgnZE4nS8+TzD3rtN3vzUT1FeC6gBH16gDHsMfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=nongnu.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KNOULwchf5XJ3vlMv7PRJ1C5S7XryXS+hZ2nqy7BDI=;
 b=XLVsFj3hoaQ/Xgt+vwcjauBnZy1VXN2SIPGlNDM9x2HzOC+X8xFCuUgoGbQaoBb8KI6e1dvjOtCr/xl9XVP56g3NXoCziyhOvNNI8zF2zKuS7RcdWU8WM722i4rOZI0ZHFN/EIzk7dz7TKS2nfSRNt4ubSMg2EuggFK3LOt9dZKgYBqWB0PVmdD1rKO92jZpTFPp8IHyn3EQssKzcyQE5g9502dBu/Ieb1rM4k4dxsVbDi0klY94F2Vm/qpyW3L1C+opWD6b3KTKOHErVNjU7L8EArbnEq7JliZE+6rxHVxFBAdg4jNYx/G3N/6rjic4Du5PpoUU18qkfw9mSB7qkQ==
Received: from OL1P279CA0066.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:15::17)
 by PR3PR10MB3931.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:40::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Tue, 4 Jan
 2022 15:52:15 +0000
Received: from HE1EUR01FT014.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:e10:15:cafe::22) by OL1P279CA0066.outlook.office365.com
 (2603:10a6:e10:15::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14 via Frontend
 Transport; Tue, 4 Jan 2022 15:52:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.73) by
 HE1EUR01FT014.mail.protection.outlook.com (10.152.0.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4844.14 via Frontend Transport; Tue, 4 Jan 2022 15:52:14 +0000
Received: from DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 4 Jan 2022 16:52:14 +0100
Received: from fedora.vmnet8.md1wgtfc (139.21.146.182) by
 DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 4 Jan 2022 16:52:13 +0100
From: Konrad Schwarz <konrad.schwarz@siemens.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 3/5] RISC-V: 'info gmem' to show hypervisor guest ->
 physical address translations
Date: Tue, 4 Jan 2022 16:51:18 +0100
Message-ID: <03cb38fdfab89a6725fa0c7cadad2055d6be48a4.1641309725.git.konrad.schwarz@siemens.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1641309725.git.konrad.schwarz@siemens.com>
References: <00a79b65-288f-f17c-abe4-fcfd3f7971fd@oth-regensburg.de>
 <cover.1641309725.git.konrad.schwarz@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [139.21.146.182]
X-ClientProxiedBy: DEMCHDC89YA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8A1A.ad011.siemens.net (139.25.226.107)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29be6bb6-ad1a-4b32-a797-08d9cf9a2dd3
X-MS-TrafficTypeDiagnostic: PR3PR10MB3931:EE_
X-Microsoft-Antispam-PRVS: <PR3PR10MB3931856EB62D00FF8F44A6EE8A4A9@PR3PR10MB3931.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:238;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: foajSkUc/1IVvoVkyYnq0vq2s6nDq+pVSnhgxs9UqSvqNlLXgZno5qyswZqptFEjyc8y/x0MGOQwOjbyflQKQtohDu3Dk299LJQplJVmWa9bpXu+RP6WjiL48VjeV1cZmb/tK4QpxPwq8ZKZKUCKDOlEYTRObR9yp+Ks0oy9pDgT+Bf6nWBpGLPmoLapIfqU9Y9SwoQ9WeZ5uHugvIAdj+s6zX++Hf/+RR9WyvSdff+oG6/0yjguxjWZijDn3MGQiSy8b0XPmC0XKET1TkGfC0SpGsBsetmvnHNGJ/TkKhaqWIOxIjw3+0F1n/n+HkT7L8GkUXeCB2eMJhvT2sm/4DlvGxFLy/Cvl2UX+1UO0IgFp3QHEq4YqK2yIltlp1c6GcDgzyf49utIO9AF1DoE0h/+cneIFHutEuBesqLrawYWiVpfjU0kIqj9hTliqKNC6TlY6j1qDV17VF1/d1XVBZOxn/hrpZK4AlkdOD3K+ELtRMgRCw8QjitmucY6ffoWkI5aatOIRh+2QB8cu9Z6dI5893Pvcg2VMWCeFUTGLsiNbAv+4HFvrKZ0KVhiO95uDARoNWOHpWNos7fuLDysU81rpfAaSfvjL1htvvmOaKfRdQ7PS1UM5SX70+NibK8Iw5L9mDUXM5A+1xITrXSp5hfGE3zbZgiu2egceNivfgvOukbmoobx8NVNcN4wSpmfNWqP8eg/ecGurRkTeI5N+PxEbmc70WaSnEDP2nhrPOgob8XngoZQkovnWBi03KoCm8Ccxaz+LhETWfR+aF6oHPnKCfB1Q5l5J6KG2EIzNJw=
X-Forefront-Antispam-Report: CIP:194.138.21.73; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:hybrid.siemens.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700002)(81166007)(83380400001)(316002)(4326008)(508600001)(16526019)(70206006)(44832011)(82960400001)(47076005)(36860700001)(40460700001)(186003)(86362001)(5660300002)(26005)(70586007)(8676002)(54906003)(2906002)(356005)(336012)(82310400004)(6916009)(36756003)(956004)(8936002)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 15:52:14.9613 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29be6bb6-ad1a-4b32-a797-08d9cf9a2dd3
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a; Ip=[194.138.21.73];
 Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT014.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3931
Received-SPF: pass client-ip=40.107.6.58;
 envelope-from=konrad.schwarz@siemens.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Konrad Schwarz <konrad.schwarz@siemens.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is analog to the existing 'info mem' command and is implemented
using the same machinery.

Signed-off-by: Konrad Schwarz <konrad.schwarz@siemens.com>
---
 hmp-commands-info.hx         |  16 +++++
 include/monitor/hmp-target.h |   2 +
 target/riscv/monitor.c       | 135 +++++++++++++++++++++++++----------
 3 files changed, 117 insertions(+), 36 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 407a1da800..fa519f0129 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -237,6 +237,22 @@ SRST
     Show the active virtual memory mappings.
 ERST
 
+#if defined TARGET_RISCV
+    {
+        .name       = "gmem",
+        .args_type  = "",
+        .params     = "",
+        .help       = "show the hypervisor guest's physical address"
+		    " translation",
+        .cmd        = hmp_info_gmem,
+    },
+#endif
+
+SRST
+  ``info gmem``
+    Show the hypervisor guest's physical address translation.
+ERST
+
     {
         .name       = "mtree",
         .args_type  = "flatview:-f,dispatch_tree:-d,owner:-o,disabled:-D",
diff --git a/include/monitor/hmp-target.h b/include/monitor/hmp-target.h
index ffdc15a34b..9f2dd976f6 100644
--- a/include/monitor/hmp-target.h
+++ b/include/monitor/hmp-target.h
@@ -2,6 +2,7 @@
  * QEMU monitor
  *
  * Copyright (c) 2003-2004 Fabrice Bellard
+ * Copyright (c) 2021 Siemens AG, konrad.schwarz@siemens.com
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
@@ -45,6 +46,7 @@ CPUArchState *mon_get_cpu_env(Monitor *mon);
 CPUState *mon_get_cpu(Monitor *mon);
 
 void hmp_info_mem(Monitor *mon, const QDict *qdict);
+void hmp_info_gmem(Monitor *mon, const QDict *qdict);
 void hmp_info_tlb(Monitor *mon, const QDict *qdict);
 void hmp_mce(Monitor *mon, const QDict *qdict);
 void hmp_info_local_apic(Monitor *mon, const QDict *qdict);
diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
index 3f74ea9934..ad58bdf9ca 100644
--- a/target/riscv/monitor.c
+++ b/target/riscv/monitor.c
@@ -25,16 +25,6 @@
 #include "monitor/monitor.h"
 #include "monitor/hmp-target.h"
 
-#ifdef TARGET_RISCV64
-#define PTE_HEADER_FIELDS       "vaddr            paddr            "\
-                                "size             attr\n"
-#define PTE_HEADER_DELIMITER    "---------------- ---------------- "\
-                                "---------------- -------\n"
-#else
-#define PTE_HEADER_FIELDS       "vaddr    paddr            size     attr\n"
-#define PTE_HEADER_DELIMITER    "-------- ---------------- -------- -------\n"
-#endif
-
 /* Perform linear address sign extension */
 static target_ulong addr_canonical(int va_bits, target_ulong addr)
 {
@@ -47,10 +37,34 @@ static target_ulong addr_canonical(int va_bits, target_ulong addr)
     return addr;
 }
 
-static void print_pte_header(Monitor *mon)
+static void print_pte_header(Monitor *mon,
+        char const vaddr_char, char const paddr_char)
 {
-    monitor_printf(mon, PTE_HEADER_FIELDS);
-    monitor_printf(mon, PTE_HEADER_DELIMITER);
+
+# define        VIRTUAL_WIDTH\
+        ((int) ((sizeof "ff" - sizeof "") * sizeof(target_ulong)))
+# define        PHYSICAL_WIDTH\
+        ((int) ((sizeof "ff" - sizeof "") * sizeof(hwaddr)))
+# define        ATTRIBUTE_WIDTH ((int) (sizeof "rwxugad" - sizeof ""))
+
+# define        VIRTUAL_COLUMN_WIDTH    (1 + VIRTUAL_WIDTH)
+# define        PHYSICAL_COLUMN_WIDTH   (1 + PHYSICAL_WIDTH)
+
+    static char const dashes[PHYSICAL_WIDTH] = "----------------";
+
+    monitor_printf(mon,
+            "%c%-*s%c%-*s%-*s%-*s\n"
+            "%-*.*s%-*.*s%-*.*s%-*.*s\n",
+
+            vaddr_char, VIRTUAL_COLUMN_WIDTH - 1, "addr",
+            paddr_char, PHYSICAL_COLUMN_WIDTH - 1, "addr",
+            VIRTUAL_COLUMN_WIDTH, "size",
+            ATTRIBUTE_WIDTH, "attr",
+
+            VIRTUAL_COLUMN_WIDTH, VIRTUAL_WIDTH, dashes,
+            PHYSICAL_COLUMN_WIDTH, PHYSICAL_WIDTH, dashes,
+            VIRTUAL_COLUMN_WIDTH, VIRTUAL_WIDTH, dashes,
+            ATTRIBUTE_WIDTH, ATTRIBUTE_WIDTH, dashes);
 }
 
 static void print_pte(Monitor *mon, int va_bits, target_ulong vaddr,
@@ -65,21 +79,36 @@ static void print_pte(Monitor *mon, int va_bits, target_ulong vaddr,
         return;
     }
 
-    monitor_printf(mon, TARGET_FMT_lx " " TARGET_FMT_plx " " TARGET_FMT_lx
-                   " %c%c%c%c%c%c%c\n",
-                   addr_canonical(va_bits, vaddr),
-                   paddr, size,
-                   attr & PTE_R ? 'r' : '-',
-                   attr & PTE_W ? 'w' : '-',
-                   attr & PTE_X ? 'x' : '-',
-                   attr & PTE_U ? 'u' : '-',
-                   attr & PTE_G ? 'g' : '-',
-                   attr & PTE_A ? 'a' : '-',
-                   attr & PTE_D ? 'd' : '-');
+# if 4 == TARGET_LONG_SIZE
+#       define  TARGET_xFMT     PRIx32
+# elif 8 == TARGET_LONG_SIZE
+#       define  TARGET_xFMT     PRIx64
+# else
+#       error TARGET_LONG_SIZE not handled
+# endif
+
+    /* note: RISC-V physical addresses are actually xlen + 2 bits long
+    OTHO, QEMU wil probably never support addresses longer than 64 bits */
+    monitor_printf(mon,
+            "%-*.*" TARGET_xFMT
+            "%-*.*" PRIx64
+            "%-*.*" TARGET_xFMT
+            "%c%c%c%c%c%c%c\n",
+            VIRTUAL_COLUMN_WIDTH, VIRTUAL_WIDTH, addr_canonical(va_bits, vaddr),
+            PHYSICAL_COLUMN_WIDTH, PHYSICAL_WIDTH, paddr,
+            VIRTUAL_COLUMN_WIDTH, VIRTUAL_WIDTH, size,
+            attr & PTE_R ? 'r' : '-',
+            attr & PTE_W ? 'w' : '-',
+            attr & PTE_X ? 'x' : '-',
+            attr & PTE_U ? 'u' : '-',
+            attr & PTE_G ? 'g' : '-',
+            attr & PTE_A ? 'a' : '-',
+            attr & PTE_D ? 'd' : '-');
 }
 
 static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
                      int level, int ptidxbits, int ptesize, int va_bits,
+                     int guest,
                      target_ulong *vbase, hwaddr *pbase, hwaddr *last_paddr,
                      target_ulong *last_size, int *last_attr)
 {
@@ -89,7 +118,7 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
     target_ulong pte;
     int ptshift;
     int attr;
-    int idx;
+    int idx, idx_end;
 
     if (level < 0) {
         return;
@@ -98,7 +127,8 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
     ptshift = level * ptidxbits;
     pgsize = 1UL << (PGSHIFT + ptshift);
 
-    for (idx = 0; idx < (1UL << ptidxbits); idx++) {
+    for (idx = 0, idx_end = 1 << (ptidxbits + (guest ? 2 : 0));
+            idx_end > idx; idx++) {
         pte_addr = base + idx * ptesize;
         cpu_physical_memory_read(pte_addr, &pte, ptesize);
 
@@ -131,7 +161,9 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
             } else {
                 /* pointer to the next level of the page table */
                 walk_pte(mon, paddr, start, level - 1, ptidxbits, ptesize,
-                         va_bits, vbase, pbase, last_paddr,
+                         va_bits,
+                         0 /* guest */,
+                         vbase, pbase, last_paddr,
                          last_size, last_attr);
             }
         }
@@ -141,7 +173,9 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
 
 }
 
-static void mem_info_svxx(Monitor *mon, CPUArchState *env)
+static void mem_info_svxx(Monitor *mon, CPUArchState *env,
+        target_ulong const atp,
+        int guest, char const vaddr_char, char const paddr_char)
 {
     int levels, ptidxbits, ptesize, vm, va_bits;
     hwaddr base;
@@ -152,11 +186,11 @@ static void mem_info_svxx(Monitor *mon, CPUArchState *env)
     int last_attr;
 
     if (riscv_cpu_mxl(env) == MXL_RV32) {
-        base = (hwaddr)get_field(env->satp, SATP32_PPN) << PGSHIFT;
-        vm = get_field(env->satp, SATP32_MODE);
+        base = (hwaddr)get_field(atp, SATP32_PPN) << PGSHIFT;
+        vm = get_field(atp, SATP32_MODE);
     } else {
-        base = (hwaddr)get_field(env->satp, SATP64_PPN) << PGSHIFT;
-        vm = get_field(env->satp, SATP64_MODE);
+        base = (hwaddr)get_field(atp, SATP64_PPN) << PGSHIFT;
+        vm = get_field(atp, SATP64_MODE);
     }
 
     switch (vm) {
@@ -189,7 +223,7 @@ static void mem_info_svxx(Monitor *mon, CPUArchState *env)
     va_bits = PGSHIFT + levels * ptidxbits;
 
     /* print header */
-    print_pte_header(mon);
+    print_pte_header(mon, vaddr_char, paddr_char);
 
     vbase = -1;
     pbase = -1;
@@ -199,6 +233,7 @@ static void mem_info_svxx(Monitor *mon, CPUArchState *env)
 
     /* walk page tables, starting from address 0 */
     walk_pte(mon, base, 0, levels - 1, ptidxbits, ptesize, va_bits,
+             guest,
              &vbase, &pbase, &last_paddr, &last_size, &last_attr);
 
     /* don't forget the last one */
@@ -209,6 +244,7 @@ static void mem_info_svxx(Monitor *mon, CPUArchState *env)
 void hmp_info_mem(Monitor *mon, const QDict *qdict)
 {
     CPUArchState *env;
+    target_ulong atp;
 
     env = mon_get_cpu_env(mon);
     if (!env) {
@@ -221,19 +257,46 @@ void hmp_info_mem(Monitor *mon, const QDict *qdict)
         return;
     }
 
+    atp = env->satp;
     if (riscv_cpu_mxl(env) == MXL_RV32) {
-        if (!(env->satp & SATP32_MODE)) {
+        if (!(atp & SATP32_MODE)) {
             monitor_printf(mon, "No translation or protection\n");
             return;
         }
     } else {
-        if (!(env->satp & SATP64_MODE)) {
+        if (!(atp & SATP64_MODE)) {
             monitor_printf(mon, "No translation or protection\n");
             return;
         }
     }
 
-    mem_info_svxx(mon, env);
+    mem_info_svxx(mon, env, atp, 0, 'v', 'p');
+}
+
+void hmp_info_gmem(Monitor *mon, const QDict *qdict)
+{
+    CPUArchState *env;
+    target_ulong atp;
+
+    env = mon_get_cpu_env(mon);
+    if (!env) {
+        monitor_printf(mon, "No CPU available\n");
+        return;
+    }
+
+    if (!riscv_has_ext(env, RVH)) {
+        monitor_printf(mon, "hypervisor extension not available\n");
+        return;
+    }
+
+    atp = env->hgatp;
+    if (!((MXL_RV32 == riscv_cpu_mxl(env) ? SATP32_MODE : SATP64_MODE)
+            & atp)) {
+        monitor_printf(mon, "No translation or protection\n");
+        return;
+    }
+
+    mem_info_svxx(mon, env, atp, 1, 'g', 'p');
 }
 
 static const MonitorDef monitor_defs[] = {
-- 
Konrad Schwarz


