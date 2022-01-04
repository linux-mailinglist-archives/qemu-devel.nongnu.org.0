Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4B748457A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 16:55:16 +0100 (CET)
Received: from localhost ([::1]:39852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4m9a-0008F3-Uu
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 10:55:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n4m6f-0006Ao-3k
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 10:52:14 -0500
Received: from mail-db8eur05on2051.outbound.protection.outlook.com
 ([40.107.20.51]:9953 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n4m6c-00038D-GO
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 10:52:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nA4Jhfj+aszXEgsG6G8kBp0f2Sk7PMVeWVsd+YcgQofPi/7GOKng3dLN2//Qa94EbtKzj/8BMJ9QBB41AA2rkfLunL8yusgscN02bae2/Q3LDoIv1jpPmmiq6WPra+uUyZ1TqmSg74ZF16asu00bXup+GyAgUoda4IHOaZHUOmARpwgwu8iz7hoHopZh5rY6xTFK1zUIWf4Wc9MhvSZw9Ldb3qrGQpnf08rLhJ33mplrFvVefTw+gqCxDLCYbxbhdFTjzJUhMvB6Xr+OKjGboDYXvsWuSxcrzB30RhddMt2J1NSP2gm+5885mIrIjYRr0zXSmT9xRDB3A+AXJFHN6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/F+axUkGKsSpFKrbytsw2KSDueXeNUrMqfDjLqz8Ng=;
 b=Ae6P8dFY5vlQtwCWBklRFfuStKYxmJzreYnjm1yJUv6Z2k7sSXhCgfIMad95HKnIFcr0C9Zsyps1ZpHwSf5/UPzJaog3LnB6TCn9/8Gbq4wye6+UKBoNu4jDR/zTi+xavdCMwpinluNWFCKWloBKAOfqOrIrrpsD9vcO4awlC0sOSd0xtHYYwOjdQlxZSpdxggEZrw3KswDmAEm0Q5qj8LR1cDRU6xnQDwpHkz8qg3U7TdXN8r4WZw+CVkf504Pj21B1HMBksabdMxNRjbdyvoq6FwZRhXkwQQzmrRGryzYQs+iuRZF5/1YuyhlEAeCdbxnIc8LTlF3sP2YzBF0ayA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.70) smtp.rcpttodomain=nongnu.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/F+axUkGKsSpFKrbytsw2KSDueXeNUrMqfDjLqz8Ng=;
 b=reHKgV56KiljAh54xiesIUJSsdhwUnPhvLTxynixcsC6OM1wx4fChhFG3U2VbGqX6+I78PrRs3XepmrK1k27Fpn5geO3kZ39O4KON1t6CrlfsL8NhJmMnhVQGER6WHP5ezxY6pnd/793YW51EzjJkbQB9+AOGVByOIM3JreURwtLUEl8O3RVN1ml3CdR29kf1R4ny90MBuOV+RPeVHIgcpDRxPuMC8Yzc+C6VdcXd0ED0rU/UmOxg4jn7gHRJVrEnD1TRG5hWdJjtHz7/QJr19JbGx1/4PZYAM3/G7C/YOJ2sNWjSugA+E6TOMrUV1Xnhl8VT1duLhBolo4REZwt/g==
Received: from OL1P279CA0032.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:13::19)
 by AM6PR10MB2807.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:aa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Tue, 4 Jan
 2022 15:52:06 +0000
Received: from HE1EUR01FT039.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:e10:13:cafe::a3) by OL1P279CA0032.outlook.office365.com
 (2603:10a6:e10:13::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14 via Frontend
 Transport; Tue, 4 Jan 2022 15:52:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.70)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.70 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.70; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.70) by
 HE1EUR01FT039.mail.protection.outlook.com (10.152.0.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4844.14 via Frontend Transport; Tue, 4 Jan 2022 15:52:05 +0000
Received: from DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) by
 DEMCHDC9SJA.ad011.siemens.net (194.138.21.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 4 Jan 2022 16:52:05 +0100
Received: from fedora.vmnet8.md1wgtfc (139.21.146.182) by
 DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 4 Jan 2022 16:52:04 +0100
From: Konrad Schwarz <konrad.schwarz@siemens.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 2/5] RISC-V: monitor's print register functionality
Date: Tue, 4 Jan 2022 16:51:17 +0100
Message-ID: <21df652bd597a70406cdd59fdf50c5c65b30a572.1641309725.git.konrad.schwarz@siemens.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1641309725.git.konrad.schwarz@siemens.com>
References: <00a79b65-288f-f17c-abe4-fcfd3f7971fd@oth-regensburg.de>
 <cover.1641309725.git.konrad.schwarz@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [139.21.146.182]
X-ClientProxiedBy: DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) To
 DEMCHDC8A1A.ad011.siemens.net (139.25.226.107)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bda77b8-0bc7-431f-ca01-08d9cf9a285e
X-MS-TrafficTypeDiagnostic: AM6PR10MB2807:EE_
X-Microsoft-Antispam-PRVS: <AM6PR10MB2807E5AD6737E4083667963B8A4A9@AM6PR10MB2807.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qdJdw9nGJmhiDj2ntI/GohWimUfWmm7mckWYvjustntA7fUfN51/AQvF1Q92tjzvyxzKdveIUP/wEgo8GOabwbXMMfkbcTTAFCSOQ/ESo9MlTh9w5hkgmVcaj/MUktkrLrsCOY9kisL8zlSUdmp0a8dYV60O9GLnDELzYFLCSAG0blsl9ACg0kcspCeky9JISDAEtFxz04raD4XIbAECxE9ZK/8eim4i/KBGdENEUvHgZESnwIRsXOHntaXZ5Q6TbkP6F4LdpNpnKGOmKC49C/PLjkcq2+FkV3I0SCNCjqE/dN97E1LGw+OWzGuy3LrGBuVGO2BAilF5iQiFShtq4nMfZmVq8ffhLbqAzWg3ivXA8plWjfhH15HvSJI1HrSmvRmG38W8prBrS8Yw2tDhnal7FdtQ6/pQGoOYLuGbk+DnvebZYjScwJQI4bAVmHvm51kD7VII1CRoBNcOvebfMDVv71+3zAWockCE/2llDOulkwzZhiovye/31Oi80UlJsVvKCCv/L/mJhtAoAGr0TSMDggX9QhHecDBo9cXgNMcCy8v/gqGXLcR64FMhYTkWq2buXjAxrH94zyuXjCD1QDb7rjHWAywUZAfYWG7OSsrPUqhO/pHLWejb0Y+6/qd2VA5QVP7jFiWHd0xVbT0BkhUwC47Tamjr0jQjsu9RGtcJAW5KrdQYVaHAEt8gaIctzwTlCTWfexcFFdrhLu5FJNYk8ocmWFDjiMDo7pkUL7PMLJmu+unM26Oqedb6kk9nz4+rXXLzqmtlZIpHgVBgSg==
X-Forefront-Antispam-Report: CIP:194.138.21.70; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:hybrid.siemens.com; PTR:hybrid.siemens.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700002)(70206006)(26005)(6916009)(6666004)(82960400001)(316002)(44832011)(508600001)(47076005)(4326008)(16526019)(54906003)(36756003)(70586007)(40460700001)(956004)(2616005)(36860700001)(186003)(8936002)(8676002)(86362001)(5660300002)(82310400004)(7596003)(7636003)(2906002)(356005)(336012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 15:52:05.8068 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bda77b8-0bc7-431f-ca01-08d9cf9a285e
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a; Ip=[194.138.21.70];
 Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT039.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2807
Received-SPF: pass client-ip=40.107.20.51;
 envelope-from=konrad.schwarz@siemens.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Enable the print (p) command to display both
general-purpose and Contral and Status (CSR) registers.

General purpose registers can be named using the xN form
or their ABI names (zero, ra, sp, a0, s1, t2).

Signed-off-by: Konrad Schwarz <konrad.schwarz@siemens.com>
---
 target/riscv/monitor.c | 69 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
index 7efb4b62c1..3f74ea9934 100644
--- a/target/riscv/monitor.c
+++ b/target/riscv/monitor.c
@@ -2,6 +2,7 @@
  * QEMU monitor for RISC-V
  *
  * Copyright (c) 2019 Bin Meng <bmeng.cn@gmail.com>
+ * Copyright (c) 2021 Siemens AG, konrad.schwarz@siemens.com
  *
  * RISC-V specific monitor commands implementation
  *
@@ -234,3 +235,71 @@ void hmp_info_mem(Monitor *mon, const QDict *qdict)
 
     mem_info_svxx(mon, env);
 }
+
+static const MonitorDef monitor_defs[] = {
+# define MONITORDEF_RISCV_GPR(NO, ALIAS)\
+    { "x" #NO #ALIAS, offsetof(CPURISCVState, gpr[NO]) },
+
+    MONITORDEF_RISCV_GPR(0, |zero)
+    MONITORDEF_RISCV_GPR(1, |ra)
+    MONITORDEF_RISCV_GPR(2, |sp)
+    MONITORDEF_RISCV_GPR(3, |gp)
+    MONITORDEF_RISCV_GPR(4, |tp)
+    MONITORDEF_RISCV_GPR(5, |t0)
+    MONITORDEF_RISCV_GPR(6, |t1)
+    MONITORDEF_RISCV_GPR(7, |t2)
+    MONITORDEF_RISCV_GPR(8, |s0|fp)
+    MONITORDEF_RISCV_GPR(9, |s1)
+    MONITORDEF_RISCV_GPR(10, |a0)
+    MONITORDEF_RISCV_GPR(11, |a1)
+    MONITORDEF_RISCV_GPR(12, |a2)
+    MONITORDEF_RISCV_GPR(13, |a3)
+    MONITORDEF_RISCV_GPR(14, |a4)
+    MONITORDEF_RISCV_GPR(15, |a5)
+    MONITORDEF_RISCV_GPR(16, |a6)
+    MONITORDEF_RISCV_GPR(17, |a7)
+    MONITORDEF_RISCV_GPR(18, |s2)
+    MONITORDEF_RISCV_GPR(19, |s3)
+    MONITORDEF_RISCV_GPR(20, |s4)
+    MONITORDEF_RISCV_GPR(21, |s5)
+    MONITORDEF_RISCV_GPR(22, |s6)
+    MONITORDEF_RISCV_GPR(23, |s7)
+    MONITORDEF_RISCV_GPR(24, |s8)
+    MONITORDEF_RISCV_GPR(25, |s9)
+    MONITORDEF_RISCV_GPR(26, |s10)
+    MONITORDEF_RISCV_GPR(27, |s11)
+    MONITORDEF_RISCV_GPR(28, |t3)
+    MONITORDEF_RISCV_GPR(29, |t4)
+    MONITORDEF_RISCV_GPR(30, |t5)
+    MONITORDEF_RISCV_GPR(31, |t6)
+
+    { },
+};
+
+const MonitorDef *target_monitor_defs(void)
+{
+    return monitor_defs;
+}
+
+int target_get_monitor_def(CPUState *cs, const char *name, uint64_t *pval)
+{
+
+    target_ulong ret_value;
+    CPURISCVState *const env = &RISCV_CPU (cs)->env;
+    riscv_csr_operations *op;
+    for (op = csr_ops; 1[&csr_ops] > op; ++op) {
+        if (!op->name) {
+            continue;
+        }
+        if (!strcmp(name, op->name)) {
+            if (RISCV_EXCP_NONE != riscv_csrrw_debug(env, op - csr_ops,
+                                 &ret_value,
+                                 0 /* new_value */,
+                                 0 /* write_mask */))
+                return -1;
+            *pval = ret_value;
+            return 0;
+        }
+    }
+    return -1;
+}
-- 
Konrad Schwarz


