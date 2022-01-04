Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC504845AE
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 16:57:13 +0100 (CET)
Received: from localhost ([::1]:45208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4mBU-0003bI-4y
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 10:57:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n4m6q-0006DG-Bt
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 10:52:24 -0500
Received: from mail-eopbgr10043.outbound.protection.outlook.com
 ([40.107.1.43]:5954 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n4m6m-000399-Ln
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 10:52:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UPrWi61RRrQz+499MjsMx3kNqh4VgK/TnohP7GjcWQeW70rNgu/AwDU4Y4MA8uJ5KMnk8CwJSJM0o3LOAuHVthjoYjIoRk9bfGAlkrNic5FIz1nSvFY6orWApIn7A6fvTi7qVi99mloULvoxgo1bQrreG5AzDnFNZtxgPIExsmHUmqFQ19ZUcWonCBcBFFOXarfNnPHOJXWMOQGRBeOuOz8VWjqCSb1wYbRo7gFKO9HjgHMQMD+vnF7aJNqg3Dn8CEU+xpjtLt91DhSEzAId9/8UOwxp8HGgW+Uwq6CODD0hNZW+qcDTkWWN4Ub9agMzHXWvIyzMhEAcXGf0qZiHMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hI930n6woMvr2M81Oqb5AkI35+Ub0sGry4uN7X105Z8=;
 b=JSigu6Z2tZUoAOuyLdJMN6TJPuOGSNCnOAw7Unp4t/Ha74DUwA3iyzHFRhF+kb03VltQtniTWCjkTtlwlBFa8fu/6OyldLqKkgesw7oCLPuFfxzqPMwjEbOgfe3+yN9rGyLIbSgjg1gBYGB2O9iiFbZQmj0zxIBzASXnTmYnx2R50YMZLjM9s/Iol1WVR0sdHkDM0kP4fmc+DmqVyungXMyiwJZk1w+Opv1hbuD5xJLYPjGhocxHqjeb9nCIOkAtzS7F50H6GNJD03r+gdaYxy+QOn8LqFR7bTTHnbbMP9gvXysjwxX/8Ak4igjkhl4j+FJijNhks4beKoWPQEjVJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.72) smtp.rcpttodomain=nongnu.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hI930n6woMvr2M81Oqb5AkI35+Ub0sGry4uN7X105Z8=;
 b=ZXm4Y33pMQ5fD5FwzyyHSzMxZNrSBlUls/0d7D0l129s8m2KRklTmGWpUdd133qWQuoVqip+Q1iFiF7SR+z+CHx6W9lxovOIGhgvf5jFMtq48ek3adGp3WunQXZO9QARUXj55fdfKG1JobMkxl0OeRlcuLYzR/NImPpiNtc0caFga0jNXBoQ0IBl10JOIunOYRvR3WQYsDr+7c1usiMU0AcsoOUdrC6bYWSTcZVThPM54Nk39kuqqMck56mb1pKhdGQT+osbRR1Qj4DfDOWJagut3p4uVPsbiv5YJ97jFCbPJYasDI2PRHWbePVx0nLN60qH2NjJS4g5d7iLYyGOhg==
Received: from AM6P193CA0089.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::30)
 by VI1PR10MB2478.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:8a::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 15:52:16 +0000
Received: from VE1EUR01FT062.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::88) by AM6P193CA0089.outlook.office365.com
 (2603:10a6:209:88::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14 via Frontend
 Transport; Tue, 4 Jan 2022 15:52:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.72)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.72 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.72; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.72) by
 VE1EUR01FT062.mail.protection.outlook.com (10.152.3.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4844.14 via Frontend Transport; Tue, 4 Jan 2022 15:52:15 +0000
Received: from DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) by
 DEMCHDC9SMA.ad011.siemens.net (194.138.21.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 4 Jan 2022 16:52:15 +0100
Received: from fedora.vmnet8.md1wgtfc (139.21.146.182) by
 DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 4 Jan 2022 16:52:14 +0100
From: Konrad Schwarz <konrad.schwarz@siemens.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 4/5] RISC-V: Typed CSRs in gdbserver
Date: Tue, 4 Jan 2022 16:51:19 +0100
Message-ID: <79194a3cf9e3bd1df41401eeee901055b8702c7b.1641309725.git.konrad.schwarz@siemens.com>
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
X-MS-Office365-Filtering-Correlation-Id: 113eae3a-6291-4f22-537d-08d9cf9a2e44
X-MS-TrafficTypeDiagnostic: VI1PR10MB2478:EE_
X-Microsoft-Antispam-PRVS: <VI1PR10MB2478966A12069E0E65EBB5078A4A9@VI1PR10MB2478.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qYxL+oiBkekerPuZQrrqH76UYiaWKPRnIfoWE5Ur1Ff+QVjP0dvwY3p4Fwecq/agpmJEp4O17YVt8zszOyiO1Clht1vkWuwC1it+678kZb31vdL6UZ2doEaPMAHxdSpOTO9XiurZX57TJsIdLaHxpiQmo9oJPxjfoq9YHDWrB5B6iZaxmdtgOfhO5ihZ5JlVFdh03yO8CfZ4pxtenZV0dR9NQZEjdIIA3E4odO3f+svE8ldQSlhzNOHELsZDfKyiponwrIcuia5FSTwAmd5aNkdwm768qaFvzOTsGJNho7fpStCXv1COn/Xq1c7COQ0hKJIpO7Au2x72UG4bOCZQ8JdWDqAeaTtBi3OhkXYI0AQH9qVgINCvbtE6wkFb1r9vss9dlJPAs759AU7cHPn3ytysZfxMjZcVPcMSLcKyd1FJ7xeEM+s76c5Gfs+W6DBsLY/A+mDdlwWD8oo4wxKvd7cc6diQxMEKyCqZ6sGy5mi6TJ5PTSXJvkyEkG9q6mUMqWbAONzCoMuEMbZczCuu+29S8FLwZsa5X70yjsRETLnRzwpILGrrz9FqNdttvdjwORIMi5gwNhzzZVB8h5HuRVWi8lJIhEWsjFy6uuru64xhrCdFBub/M8rYMokadhRK5UCzl7UQytMaqYvUvPPC6BQn1YWSzBblJEIGroI/Ce5cu0PNZJzmj09UXi1Y9jvGeqoJir7d8RdhMd+KIjRhi37su5DzlcIcnNFzz2tnffCpHZL1lsTkWJA/FbOgakASd2Du8jX98jUpwzuZXbpHOV9eRYveiuO1J83Ebz0vB+1lI57OSWzpxmRA29hfCTws
X-Forefront-Antispam-Report: CIP:194.138.21.72; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:hybrid.siemens.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(46966006)(36840700001)(508600001)(83380400001)(81166007)(30864003)(2906002)(47076005)(82960400001)(82310400004)(2616005)(54906003)(8936002)(956004)(5660300002)(316002)(6916009)(4326008)(40460700001)(16526019)(44832011)(26005)(356005)(186003)(8676002)(336012)(86362001)(70586007)(70206006)(36860700001)(36756003)(2004002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 15:52:15.7254 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 113eae3a-6291-4f22-537d-08d9cf9a2e44
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a; Ip=[194.138.21.72];
 Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT062.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2478
Received-SPF: pass client-ip=40.107.1.43;
 envelope-from=konrad.schwarz@siemens.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

GDB target descriptions support typed registers;
such that `info register X' displays not only the hex value of
register `X', but also the individual bitfields the register
comprises (if any), using textual labels if possible.

This patch includes type information for GDB for
a large subset of the RISC-V Control and Status Registers (CSRs).

Signed-off-by: Konrad Schwarz <konrad.schwarz@siemens.com>
---
 target/riscv/csr.c                |   2 +
 target/riscv/csr32-op-gdbserver.h | 109 ++++++++++
 target/riscv/csr64-op-gdbserver.h |  76 +++++++
 target/riscv/gdb_csr_type_group.c |  16 ++
 target/riscv/gdb_csr_type_group.h |   3 +
 target/riscv/gdb_csr_types.c      | 333 ++++++++++++++++++++++++++++++
 target/riscv/gdb_csr_types.h      |   3 +
 target/riscv/gdbstub.c            |  26 ++-
 target/riscv/meson.build          |   4 +-
 9 files changed, 566 insertions(+), 6 deletions(-)
 create mode 100644 target/riscv/csr32-op-gdbserver.h
 create mode 100644 target/riscv/csr64-op-gdbserver.h
 create mode 100644 target/riscv/gdb_csr_type_group.c
 create mode 100644 target/riscv/gdb_csr_type_group.h
 create mode 100644 target/riscv/gdb_csr_types.c
 create mode 100644 target/riscv/gdb_csr_types.h

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9f41954894..557b4afe0e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3,6 +3,7 @@
  *
  * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
  * Copyright (c) 2017-2018 SiFive, Inc.
+ * Copyright (c) 2021 Siemens AG, konrad.schwarz@siemens.com
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -2094,5 +2095,6 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MHPMCOUNTER29H] = { "mhpmcounter29h", any32,  read_zero },
     [CSR_MHPMCOUNTER30H] = { "mhpmcounter30h", any32,  read_zero },
     [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", any32,  read_zero },
+
 #endif /* !CONFIG_USER_ONLY */
 };
diff --git a/target/riscv/csr32-op-gdbserver.h b/target/riscv/csr32-op-gdbserver.h
new file mode 100644
index 0000000000..e8ec527f23
--- /dev/null
+++ b/target/riscv/csr32-op-gdbserver.h
@@ -0,0 +1,109 @@
+/* Copyright (c) 2021 Siemens AG, konrad.schwarz@siemens.com */
+
+  [CSR_USTATUS] { .gdb_type = "sstatus-fields", .gdb_group = "user" },
+  [CSR_UIE] { .gdb_type = "sie-fields", .gdb_group = "user" },
+  [CSR_UTVEC] { .gdb_type = "code_ptr", .gdb_group = "user" },
+  [CSR_USCRATCH] { .gdb_type = "data_ptr", .gdb_group = "user" },
+  [CSR_UEPC] { .gdb_type = "code_ptr", .gdb_group = "user" },
+  [CSR_UCAUSE] { .gdb_type = "scause-fields", .gdb_group = "user" },
+  [CSR_UTVAL] { .gdb_type = "data_ptr", .gdb_group = "user" },
+  [CSR_UIP] { .gdb_type = "code_ptr", .gdb_group = "user" },
+  [CSR_CYCLE] { .gdb_type = "uint32", .gdb_group = "user" },
+  [CSR_TIME] { .gdb_type = "uint32", .gdb_group = "user" },
+  [CSR_INSTRET] { .gdb_type = "uint32", .gdb_group = "user" },
+  [CSR_HPMCOUNTER3] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER4] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER5] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER6] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER7] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER8] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER9] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER10] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER11] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER12] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER13] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER14] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER15] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER16] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER17] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER18] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER19] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER20] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER21] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER22] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER23] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER24] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER25] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER26] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER27] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER28] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER29] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER30] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER31] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_CYCLEH] { .gdb_type = "uint32", .gdb_group = "user" },
+  [CSR_TIMEH] { .gdb_type = "uint32", .gdb_group = "user" },
+  [CSR_INSTRETH] { .gdb_type = "uint32", .gdb_group = "user" },
+  [CSR_HPMCOUNTER3H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER4H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER5H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER6H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER7H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER8H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER9H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER10H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER11H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER12H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER13H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER14H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER15H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER16H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER17H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER18H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER19H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER20H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER21H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER22H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER23H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER24H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER25H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER26H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER27H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER28H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER29H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER30H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER31H] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_SSTATUS] { .gdb_type = "sstatus-fields", .gdb_group = "supervisor" },
+  [CSR_SEDELEG] { .gdb_type = "uint32", .gdb_group = "supervisor" },
+  [CSR_SIDELEG] { .gdb_type = "sie-fields", .gdb_group = "supervisor" },
+  [CSR_SIE] { .gdb_type = "sie-fields", .gdb_group = "supervisor" },
+  [CSR_STVEC] { .gdb_type = "stvec-fields", .gdb_group = "supervisor" },
+  [CSR_SCOUNTEREN] { .gdb_type = "scounteren-fields", .gdb_group = "supervisor" },
+  [CSR_SSCRATCH] { .gdb_type = "data_ptr", .gdb_group = "supervisor" },
+  [CSR_SEPC] { .gdb_type = "code_ptr", .gdb_group = "supervisor" },
+  [CSR_SCAUSE] { .gdb_type = "scause-fields", .gdb_group = "supervisor" },
+  [CSR_STVAL] { .gdb_type = "data_ptr", .gdb_group = "supervisor" },
+  [CSR_SIP] { .gdb_type = "sip-fields", .gdb_group = "supervisor" },
+  [CSR_SATP] { .gdb_type = "satp-fields", .gdb_group = "supervisor" },
+  [CSR_HSTATUS] { .gdb_type = "hstatus-fields", .gdb_group = "hypervisor" },
+  [CSR_HEDELEG] { .gdb_type = "hedeleg-fields", .gdb_group = "hypervisor" },
+  [CSR_HIDELEG] { .gdb_type = "hie-fields", .gdb_group = "hypervisor" },
+  [CSR_HIE] { .gdb_type = "hie-fields", .gdb_group = "hypervisor" },
+  [CSR_HCOUNTEREN] { .gdb_type = "int", .gdb_group = "hypervisor" },
+  [CSR_HGEIE] { .gdb_type = "uint32", .gdb_group = "hypervisor" },
+  [CSR_HGEIP] { .gdb_type = "uint32", .gdb_group = "hypervisor" },
+  [CSR_HTVAL] { .gdb_type = "data_ptr", .gdb_group = "hypervisor" },
+  [CSR_HIP] { .gdb_type = "hip-fields", .gdb_group = "hypervisor" },
+  [CSR_HVIP] { .gdb_type = "hvip-fields", .gdb_group = "hypervisor" },
+  [CSR_HGATP] { .gdb_type = "hgatp-fields", .gdb_group = "hypervisor" },
+  [CSR_HTIMEDELTA] { .gdb_type = "int", .gdb_group = "hypervisor" },
+  [CSR_HTIMEDELTAH] { .gdb_type = "int", .gdb_group = "hypervisor" },
+  [CSR_HTINST] { .gdb_type = "uint32", .gdb_group = "hypervisor" },
+  [CSR_VSSTATUS] { .gdb_type = "sstatus-fields", .gdb_group = "virtual-supervisor" },
+  [CSR_VSIE] { .gdb_type = "sie-fields", .gdb_group = "virtual-supervisor" },
+  [CSR_VSTVEC] { .gdb_type = "stvec-fields", .gdb_group = "virtual-supervisor" },
+  [CSR_VSSCRATCH] { .gdb_type = "data_ptr", .gdb_group = "virtual-supervisor" },
+  [CSR_VSEPC] { .gdb_type = "code_ptr", .gdb_group = "virtual-supervisor" },
+  [CSR_VSCAUSE] { .gdb_type = "scause-fields", .gdb_group = "virtual-supervisor" },
+  [CSR_VSTVAL] { .gdb_type = "data_ptr", .gdb_group = "virtual-supervisor" },
+  [CSR_VSIP] { .gdb_type = "sip-fields", .gdb_group = "virtual-supervisor" },
+  [CSR_VSATP] { .gdb_type = "satp-fields", .gdb_group = "virtual-supervisor" },
diff --git a/target/riscv/csr64-op-gdbserver.h b/target/riscv/csr64-op-gdbserver.h
new file mode 100644
index 0000000000..fc4bc62d9e
--- /dev/null
+++ b/target/riscv/csr64-op-gdbserver.h
@@ -0,0 +1,76 @@
+/* Copyright (c) 2021 Siemens AG, konrad.schwarz@siemens.com */
+
+  [CSR_USTATUS] { .gdb_type = "sstatus-fields", .gdb_group = "user" },
+  [CSR_UIE] { .gdb_type = "sie-fields", .gdb_group = "user" },
+  [CSR_UTVEC] { .gdb_type = "code_ptr", .gdb_group = "user" },
+  [CSR_USCRATCH] { .gdb_type = "data_ptr", .gdb_group = "user" },
+  [CSR_UEPC] { .gdb_type = "code_ptr", .gdb_group = "user" },
+  [CSR_UCAUSE] { .gdb_type = "scause-fields", .gdb_group = "user" },
+  [CSR_UTVAL] { .gdb_type = "data_ptr", .gdb_group = "user" },
+  [CSR_UIP] { .gdb_type = "code_ptr", .gdb_group = "user" },
+  [CSR_CYCLE] { .gdb_type = "uint64", .gdb_group = "user" },
+  [CSR_TIME] { .gdb_type = "uint64", .gdb_group = "user" },
+  [CSR_INSTRET] { .gdb_type = "uint64", .gdb_group = "user" },
+  [CSR_HPMCOUNTER3] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER4] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER5] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER6] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER7] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER8] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER9] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER10] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER11] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER12] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER13] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER14] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER15] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER16] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER17] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER18] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER19] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER20] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER21] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER22] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER23] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER24] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER25] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER26] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER27] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER28] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER29] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER30] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_HPMCOUNTER31] { .gdb_type = "int", .gdb_group = "user" },
+  [CSR_SSTATUS] { .gdb_type = "sstatus-fields", .gdb_group = "supervisor" },
+  [CSR_SEDELEG] { .gdb_type = "uint64", .gdb_group = "supervisor" },
+  [CSR_SIDELEG] { .gdb_type = "sie-fields", .gdb_group = "supervisor" },
+  [CSR_SIE] { .gdb_type = "sie-fields", .gdb_group = "supervisor" },
+  [CSR_STVEC] { .gdb_type = "stvec-fields", .gdb_group = "supervisor" },
+  [CSR_SCOUNTEREN] { .gdb_type = "scounteren-fields", .gdb_group = "supervisor" },
+  [CSR_SSCRATCH] { .gdb_type = "data_ptr", .gdb_group = "supervisor" },
+  [CSR_SEPC] { .gdb_type = "code_ptr", .gdb_group = "supervisor" },
+  [CSR_SCAUSE] { .gdb_type = "scause-fields", .gdb_group = "supervisor" },
+  [CSR_STVAL] { .gdb_type = "data_ptr", .gdb_group = "supervisor" },
+  [CSR_SIP] { .gdb_type = "sip-fields", .gdb_group = "supervisor" },
+  [CSR_SATP] { .gdb_type = "satp-fields", .gdb_group = "supervisor" },
+  [CSR_HSTATUS] { .gdb_type = "hstatus-fields", .gdb_group = "hypervisor" },
+  [CSR_HEDELEG] { .gdb_type = "hedeleg-fields", .gdb_group = "hypervisor" },
+  [CSR_HIDELEG] { .gdb_type = "hie-fields", .gdb_group = "hypervisor" },
+  [CSR_HIE] { .gdb_type = "hie-fields", .gdb_group = "hypervisor" },
+  [CSR_HCOUNTEREN] { .gdb_type = "int", .gdb_group = "hypervisor" },
+  [CSR_HGEIE] { .gdb_type = "uint64", .gdb_group = "hypervisor" },
+  [CSR_HGEIP] { .gdb_type = "uint64", .gdb_group = "hypervisor" },
+  [CSR_HTVAL] { .gdb_type = "data_ptr", .gdb_group = "hypervisor" },
+  [CSR_HIP] { .gdb_type = "hip-fields", .gdb_group = "hypervisor" },
+  [CSR_HVIP] { .gdb_type = "hvip-fields", .gdb_group = "hypervisor" },
+  [CSR_HGATP] { .gdb_type = "hgatp-fields", .gdb_group = "hypervisor" },
+  [CSR_HTIMEDELTA] { .gdb_type = "int", .gdb_group = "hypervisor" },
+  [CSR_HTINST] { .gdb_type = "uint64", .gdb_group = "hypervisor" },
+  [CSR_VSSTATUS] { .gdb_type = "sstatus-fields", .gdb_group = "virtual-supervisor" },
+  [CSR_VSIE] { .gdb_type = "sie-fields", .gdb_group = "virtual-supervisor" },
+  [CSR_VSTVEC] { .gdb_type = "stvec-fields", .gdb_group = "virtual-supervisor" },
+  [CSR_VSSCRATCH] { .gdb_type = "data_ptr", .gdb_group = "virtual-supervisor" },
+  [CSR_VSEPC] { .gdb_type = "code_ptr", .gdb_group = "virtual-supervisor" },
+  [CSR_VSCAUSE] { .gdb_type = "scause-fields", .gdb_group = "virtual-supervisor" },
+  [CSR_VSTVAL] { .gdb_type = "data_ptr", .gdb_group = "virtual-supervisor" },
+  [CSR_VSIP] { .gdb_type = "sip-fields", .gdb_group = "virtual-supervisor" },
+  [CSR_VSATP] { .gdb_type = "satp-fields", .gdb_group = "virtual-supervisor" },
diff --git a/target/riscv/gdb_csr_type_group.c b/target/riscv/gdb_csr_type_group.c
new file mode 100644
index 0000000000..af394de302
--- /dev/null
+++ b/target/riscv/gdb_csr_type_group.c
@@ -0,0 +1,16 @@
+/* Copyright 2021 Siemens AG */
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "gdb_csr_type_group.h"
+
+struct riscv_gdb_csr_tg const riscv_gdb_csr_type_group[] = {
+
+#if !defined(CONFIG_USER_ONLY)
+#  ifdef TARGET_RISCV64
+#    include "csr64-op-gdbserver.h"
+#  elif defined TARGET_RISCV64
+#    include "csr32-op-gdbserver.h"
+#  endif
+#endif /* !CONFIG_USER_ONLY */
+
+};
diff --git a/target/riscv/gdb_csr_type_group.h b/target/riscv/gdb_csr_type_group.h
new file mode 100644
index 0000000000..e044913bd7
--- /dev/null
+++ b/target/riscv/gdb_csr_type_group.h
@@ -0,0 +1,3 @@
+extern struct riscv_gdb_csr_tg {
+    char const *gdb_type, *gdb_group;
+} const riscv_gdb_csr_type_group[CSR_TABLE_SIZE];
diff --git a/target/riscv/gdb_csr_types.c b/target/riscv/gdb_csr_types.c
new file mode 100644
index 0000000000..48b1db2b88
--- /dev/null
+++ b/target/riscv/gdb_csr_types.c
@@ -0,0 +1,333 @@
+/* Copyright (c) 2021 Siemens AG, konrad.schwarz@siemens.com */
+
+#include "qemu/osdep.h"
+#include "gdb_csr_types.h"
+#define STR(X) #X
+
+char const riscv_gdb_csr_types[] =
+#ifdef TARGET_RISCV32
+   STR(
+<enum id="sstatus-fs-type" size="4">
+  <evalue name="off" value="0"/>
+  <evalue name="initial" value="1"/>
+  <evalue name="clean" value="2"/>
+  <evalue name="dirty" value="3"/>
+</enum><enum id="sstatus-xs-type" size="4">
+  <evalue name="off" value="0"/>
+  <evalue name="initial" value="1"/>
+  <evalue name="clean" value="2"/>
+  <evalue name="dirty" value="3"/>
+</enum><enum id="sstatus-uxl-type" size="4">
+  <evalue name="32" value="1"/>
+  <evalue name="64" value="2"/>
+  <evalue name="128" value="3"/>
+</enum><enum id="stvec-mode-type" size="4">
+  <evalue name="direct" value="0"/>
+  <evalue name="vectored" value="1"/>
+</enum><enum id="scause-exc-type" size="4">
+  <evalue name="instruction_address_misaligned" value="0"/>
+  <evalue name="instruction_access_fault" value="1"/>
+  <evalue name="illegal_instruction" value="2"/>
+  <evalue name="breakpoint" value="3"/>
+  <evalue name="load_address_misaligned" value="4"/>
+  <evalue name="load_access_fault" value="5"/>
+  <evalue name="store_address_misaligned" value="6"/>
+  <evalue name="store_access_fault" value="7"/>
+  <evalue name="enironment_call_from_U_mode" value="8"/>
+  <evalue name="enironment_call_from_S_mode" value="9"/>
+  <evalue name="enironment_call_from_VS_mode" value="10"/>
+  <evalue name="enironment_call_from_M_mode" value="11"/>
+  <evalue name="instruction_page_fault" value="12"/>
+  <evalue name="load_page_fault" value="13"/>
+  <evalue name="store_page_fault" value="15"/>
+  <evalue name="instruction_guest_page_fault" value="20"/>
+  <evalue name="load_guest_page_fault" value="21"/>
+  <evalue name="virtual_instruction" value="22"/>
+  <evalue name="store_guest_page_fault" value="23"/>
+</enum><enum id="satp-mode-type" size="4">
+  <evalue name="bare" value="0"/>
+  <evalue name="sv32" value="1"/>
+  <evalue name="sv39" value="8"/>
+  <evalue name="sv48" value="9"/>
+  <evalue name="sv57" value="10"/>
+  <evalue name="sv64" value="11"/>
+</enum><enum id="hgatp-mode-type" size="4">
+  <evalue name="bare" value="0"/>
+  <evalue name="sv32x4" value="1"/>
+  <evalue name="sv39x4" value="8"/>
+  <evalue name="sv48x4" value="9"/>
+  <evalue name="sv57x4" value="10"/>
+</enum><flags id="sstatus-fields" size="4">
+  <field name="sie" start="1" end="1"/>
+  <field name="mie" start="3" end="3"/>
+  <field name="spie" start="5" end="5"/>
+  <field name="ube" start="6" end="6"/>
+  <field name="mpie" start="7" end="7"/>
+  <field name="spp" start="8" end="8"/>
+  <field name="mpp" start="11" end="12"/>
+  <field name="fs" start="13" end="14" type="sstatus-fs-type"/>
+  <field name="xs" start="15" end="16" type="sstatus-xs-type"/>
+  <field name="mprv" start="17" end="17"/>
+  <field name="sum" start="18" end="18"/>
+  <field name="mxr" start="19" end="19"/>
+  <field name="tvm" start="20" end="20"/>
+  <field name="tw" start="21" end="21"/>
+  <field name="tsr" start="22" end="23"/>
+  <field name="uxl" start="32" end="33" type="sstatus-uxl-type"/>
+  <field name="sxl" start="34" end="35"/>
+  <field name="sbe" start="36" end="36"/>
+  <field name="mbe" start="37" end="37"/>
+  <field name="gva" start="38" end="38"/>
+  <field name="mpv" start="39" end="39"/>
+  <field name="sd" start="63" end="63"/>
+</flags><flags id="sie-fields" size="4">
+  <field name="ssie" start="1" end="1"/>
+  <field name="vssie" start="2" end="2"/>
+  <field name="msie" start="3" end="3"/>
+  <field name="stie" start="5" end="5"/>
+  <field name="vstie" start="6" end="6"/>
+  <field name="mtie" start="7" end="7"/>
+  <field name="seie" start="9" end="9"/>
+  <field name="vseie" start="10" end="10"/>
+  <field name="meie" start="11" end="11"/>
+  <field name="sgeie" start="12" end="12"/>
+</flags><flags id="stvec-fields" size="4">
+  <field name="mode" start="0" end="1" type="stvec-mode-type"/>
+  <field name="base" start="2" end="63"/>
+</flags><flags id="scounteren-fields" size="4">
+  <field name="cy" start="0" end="0"/>
+  <field name="tm" start="1" end="1"/>
+  <field name="ir" start="2" end="2"/>
+  <field name="hpm" start="3" end="31"/>
+</flags><flags id="scause-fields" size="4">
+  <field name="exc" start="0" end="30" type="scause-exc-type"/>
+  <field name="interrupt" start="31" end="31"/>
+</flags><flags id="sip-fields" size="4">
+  <field name="ssip" start="1" end="1"/>
+  <field name="vssip" start="2" end="2"/>
+  <field name="msip" start="3" end="3"/>
+  <field name="stip" start="5" end="5"/>
+  <field name="vstip" start="6" end="6"/>
+  <field name="mtip" start="7" end="7"/>
+  <field name="seip" start="9" end="9"/>
+  <field name="vseip" start="10" end="10"/>
+  <field name="meip" start="11" end="11"/>
+  <field name="sgeip" start="12" end="12"/>
+</flags><flags id="satp-fields" size="4">
+  <field name="ppn" start="0" end="43"/>
+  <field name="asid" start="44" end="59"/>
+  <field name="mode" start="60" end="63" type="satp-mode-type"/>
+</flags><flags id="hstatus-fields" size="4">
+  <field name="vsbe" start="5" end="5"/>
+  <field name="gva" start="6" end="6"/>
+  <field name="spv" start="7" end="7"/>
+  <field name="spvp" start="8" end="8"/>
+  <field name="hu" start="9" end="9"/>
+  <field name="vgein" start="12" end="17"/>
+  <field name="vtvm" start="20" end="20"/>
+  <field name="vtsr" start="22" end="22"/>
+  <field name="vsxl" start="32" end="33"/>
+</flags><flags id="hedeleg-fields" size="4">
+  <field name="instruction_address_misaligned" start="0" end="0"/>
+  <field name="instruction_access_fault" start="1" end="1"/>
+  <field name="illegal_instruction" start="2" end="2"/>
+  <field name="breakpoint" start="3" end="3"/>
+  <field name="load_address_misaligned" start="4" end="4"/>
+  <field name="load_access_fault" start="5" end="5"/>
+  <field name="store_address_misaligned" start="6" end="6"/>
+  <field name="store_access_fault" start="7" end="7"/>
+  <field name="enironment_call_from_U_mode" start="8" end="8"/>
+  <field name="enironment_call_from_S_mode" start="9" end="9"/>
+  <field name="enironment_call_from_VS_mode" start="10" end="10"/>
+  <field name="enironment_call_from_M_mode" start="11" end="11"/>
+  <field name="instruction_page_fault" start="12" end="12"/>
+  <field name="load_page_fault" start="13" end="13"/>
+  <field name="store_page_fault" start="15" end="15"/>
+  <field name="instruction_guest_page_fault" start="20" end="20"/>
+  <field name="load_guest_page_fault" start="21" end="21"/>
+  <field name="virtual_instruction" start="22" end="22"/>
+  <field name="store_guest_page_fault" start="23" end="23"/>
+</flags><flags id="hie-fields" size="4">
+  <field name="vssie" start="2" end="2"/>
+  <field name="vstie" start="6" end="6"/>
+  <field name="vseie" start="10" end="10"/>
+  <field name="sgeie" start="12" end="12"/>
+</flags><flags id="hip-fields" size="4">
+  <field name="vssip" start="2" end="2"/>
+  <field name="vstip" start="6" end="6"/>
+  <field name="vseip" start="10" end="10"/>
+  <field name="sgeip" start="12" end="12"/>
+</flags><flags id="hvip-fields" size="4">
+  <field name="vssip" start="2" end="2"/>
+  <field name="vstip" start="6" end="6"/>
+  <field name="vseip" start="10" end="10"/>
+</flags><flags id="hgatp-fields" size="4">
+  <field name="ppn" start="0" end="43"/>
+  <field name="vmid" start="44" end="57"/>
+  <field name="mode" start="60" end="63" type="hgatp-mode-type"/>
+</flags>
+)
+#elif defined TARGET_RISCV64
+   STR(
+<enum id="sstatus-fs-type" size="8">
+  <evalue name="off" value="0"/>
+  <evalue name="initial" value="1"/>
+  <evalue name="clean" value="2"/>
+  <evalue name="dirty" value="3"/>
+</enum><enum id="sstatus-xs-type" size="8">
+  <evalue name="off" value="0"/>
+  <evalue name="initial" value="1"/>
+  <evalue name="clean" value="2"/>
+  <evalue name="dirty" value="3"/>
+</enum><enum id="sstatus-uxl-type" size="8">
+  <evalue name="32" value="1"/>
+  <evalue name="64" value="2"/>
+  <evalue name="128" value="3"/>
+</enum><enum id="stvec-mode-type" size="8">
+  <evalue name="direct" value="0"/>
+  <evalue name="vectored" value="1"/>
+</enum><enum id="scause-exc-type" size="8">
+  <evalue name="instruction_address_misaligned" value="0"/>
+  <evalue name="instruction_access_fault" value="1"/>
+  <evalue name="illegal_instruction" value="2"/>
+  <evalue name="breakpoint" value="3"/>
+  <evalue name="load_address_misaligned" value="4"/>
+  <evalue name="load_access_fault" value="5"/>
+  <evalue name="store_address_misaligned" value="6"/>
+  <evalue name="store_access_fault" value="7"/>
+  <evalue name="enironment_call_from_U_mode" value="8"/>
+  <evalue name="enironment_call_from_S_mode" value="9"/>
+  <evalue name="enironment_call_from_VS_mode" value="10"/>
+  <evalue name="enironment_call_from_M_mode" value="11"/>
+  <evalue name="instruction_page_fault" value="12"/>
+  <evalue name="load_page_fault" value="13"/>
+  <evalue name="store_page_fault" value="15"/>
+  <evalue name="instruction_guest_page_fault" value="20"/>
+  <evalue name="load_guest_page_fault" value="21"/>
+  <evalue name="virtual_instruction" value="22"/>
+  <evalue name="store_guest_page_fault" value="23"/>
+</enum><enum id="satp-mode-type" size="8">
+  <evalue name="bare" value="0"/>
+  <evalue name="sv32" value="1"/>
+  <evalue name="sv39" value="8"/>
+  <evalue name="sv48" value="9"/>
+  <evalue name="sv57" value="10"/>
+  <evalue name="sv64" value="11"/>
+</enum><enum id="hgatp-mode-type" size="8">
+  <evalue name="bare" value="0"/>
+  <evalue name="sv32x4" value="1"/>
+  <evalue name="sv39x4" value="8"/>
+  <evalue name="sv48x4" value="9"/>
+  <evalue name="sv57x4" value="10"/>
+</enum><flags id="sstatus-fields" size="8">
+  <field name="sie" start="1" end="1"/>
+  <field name="mie" start="3" end="3"/>
+  <field name="spie" start="5" end="5"/>
+  <field name="ube" start="6" end="6"/>
+  <field name="mpie" start="7" end="7"/>
+  <field name="spp" start="8" end="8"/>
+  <field name="mpp" start="11" end="12"/>
+  <field name="fs" start="13" end="14" type="sstatus-fs-type"/>
+  <field name="xs" start="15" end="16" type="sstatus-xs-type"/>
+  <field name="mprv" start="17" end="17"/>
+  <field name="sum" start="18" end="18"/>
+  <field name="mxr" start="19" end="19"/>
+  <field name="tvm" start="20" end="20"/>
+  <field name="tw" start="21" end="21"/>
+  <field name="tsr" start="22" end="23"/>
+  <field name="uxl" start="32" end="33" type="sstatus-uxl-type"/>
+  <field name="sxl" start="34" end="35"/>
+  <field name="sbe" start="36" end="36"/>
+  <field name="mbe" start="37" end="37"/>
+  <field name="gva" start="38" end="38"/>
+  <field name="mpv" start="39" end="39"/>
+  <field name="sd" start="63" end="63"/>
+</flags><flags id="sie-fields" size="8">
+  <field name="ssie" start="1" end="1"/>
+  <field name="vssie" start="2" end="2"/>
+  <field name="msie" start="3" end="3"/>
+  <field name="stie" start="5" end="5"/>
+  <field name="vstie" start="6" end="6"/>
+  <field name="mtie" start="7" end="7"/>
+  <field name="seie" start="9" end="9"/>
+  <field name="vseie" start="10" end="10"/>
+  <field name="meie" start="11" end="11"/>
+  <field name="sgeie" start="12" end="12"/>
+</flags><flags id="stvec-fields" size="8">
+  <field name="mode" start="0" end="1" type="stvec-mode-type"/>
+  <field name="base" start="2" end="63"/>
+</flags><flags id="scounteren-fields" size="8">
+  <field name="cy" start="0" end="0"/>
+  <field name="tm" start="1" end="1"/>
+  <field name="ir" start="2" end="2"/>
+  <field name="hpm" start="3" end="31"/>
+</flags><flags id="scause-fields" size="8">
+  <field name="exc" start="0" end="62" type="scause-exc-type"/>
+  <field name="interrupt" start="63" end="63"/>
+</flags><flags id="sip-fields" size="8">
+  <field name="ssip" start="1" end="1"/>
+  <field name="vssip" start="2" end="2"/>
+  <field name="msip" start="3" end="3"/>
+  <field name="stip" start="5" end="5"/>
+  <field name="vstip" start="6" end="6"/>
+  <field name="mtip" start="7" end="7"/>
+  <field name="seip" start="9" end="9"/>
+  <field name="vseip" start="10" end="10"/>
+  <field name="meip" start="11" end="11"/>
+  <field name="sgeip" start="12" end="12"/>
+</flags><flags id="satp-fields" size="8">
+  <field name="ppn" start="0" end="43"/>
+  <field name="asid" start="44" end="59"/>
+  <field name="mode" start="60" end="63" type="satp-mode-type"/>
+</flags><flags id="hstatus-fields" size="8">
+  <field name="vsbe" start="5" end="5"/>
+  <field name="gva" start="6" end="6"/>
+  <field name="spv" start="7" end="7"/>
+  <field name="spvp" start="8" end="8"/>
+  <field name="hu" start="9" end="9"/>
+  <field name="vgein" start="12" end="17"/>
+  <field name="vtvm" start="20" end="20"/>
+  <field name="vtsr" start="22" end="22"/>
+  <field name="vsxl" start="32" end="33"/>
+</flags><flags id="hedeleg-fields" size="8">
+  <field name="instruction_address_misaligned" start="0" end="0"/>
+  <field name="instruction_access_fault" start="1" end="1"/>
+  <field name="illegal_instruction" start="2" end="2"/>
+  <field name="breakpoint" start="3" end="3"/>
+  <field name="load_address_misaligned" start="4" end="4"/>
+  <field name="load_access_fault" start="5" end="5"/>
+  <field name="store_address_misaligned" start="6" end="6"/>
+  <field name="store_access_fault" start="7" end="7"/>
+  <field name="enironment_call_from_U_mode" start="8" end="8"/>
+  <field name="enironment_call_from_S_mode" start="9" end="9"/>
+  <field name="enironment_call_from_VS_mode" start="10" end="10"/>
+  <field name="enironment_call_from_M_mode" start="11" end="11"/>
+  <field name="instruction_page_fault" start="12" end="12"/>
+  <field name="load_page_fault" start="13" end="13"/>
+  <field name="store_page_fault" start="15" end="15"/>
+  <field name="instruction_guest_page_fault" start="20" end="20"/>
+  <field name="load_guest_page_fault" start="21" end="21"/>
+  <field name="virtual_instruction" start="22" end="22"/>
+  <field name="store_guest_page_fault" start="23" end="23"/>
+</flags><flags id="hie-fields" size="8">
+  <field name="vssie" start="2" end="2"/>
+  <field name="vstie" start="6" end="6"/>
+  <field name="vseie" start="10" end="10"/>
+  <field name="sgeie" start="12" end="12"/>
+</flags><flags id="hip-fields" size="8">
+  <field name="vssip" start="2" end="2"/>
+  <field name="vstip" start="6" end="6"/>
+  <field name="vseip" start="10" end="10"/>
+  <field name="sgeip" start="12" end="12"/>
+</flags><flags id="hvip-fields" size="8">
+  <field name="vssip" start="2" end="2"/>
+  <field name="vstip" start="6" end="6"/>
+  <field name="vseip" start="10" end="10"/>
+</flags><flags id="hgatp-fields" size="8">
+  <field name="ppn" start="0" end="43"/>
+  <field name="vmid" start="44" end="57"/>
+  <field name="mode" start="60" end="63" type="hgatp-mode-type"/>
+</flags>
+)
+# endif
+;
diff --git a/target/riscv/gdb_csr_types.h b/target/riscv/gdb_csr_types.h
new file mode 100644
index 0000000000..e55c978ac8
--- /dev/null
+++ b/target/riscv/gdb_csr_types.h
@@ -0,0 +1,3 @@
+/* Copyright (c) 2021 Siemens AG, konrad.schwarz@siemens.com */
+
+extern char const riscv_gdb_csr_types[];
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 23429179e2..9c3f68eeaf 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -2,6 +2,7 @@
  * RISC-V GDB Server Stub
  *
  * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
+ * Copyright (c) 2021 Siemens AG, konrad.schwarz@siemens.com
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -155,6 +156,9 @@ static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
     return 0;
 }
 
+#include "gdb_csr_types.h"
+#include "gdb_csr_type_group.h"
+
 static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
@@ -163,21 +167,33 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
     riscv_csr_predicate_fn predicate;
     int bitsize = 16 << env->misa_mxl_max;
     int i;
+    riscv_csr_operations *csr_op;
+    struct riscv_gdb_csr_tg const *csr_tg;
 
     g_string_printf(s, "<?xml version=\"1.0\"?>");
     g_string_append_printf(s, "<!DOCTYPE feature SYSTEM \"gdb-target.dtd\">");
     g_string_append_printf(s, "<feature name=\"org.gnu.gdb.riscv.csr\">");
 
-    for (i = 0; i < CSR_TABLE_SIZE; i++) {
-        predicate = csr_ops[i].predicate;
+    g_string_append(s, riscv_gdb_csr_types);
+
+    for (i = 0, csr_op = csr_ops, csr_tg = riscv_gdb_csr_type_group;
+            i < CSR_TABLE_SIZE; ++csr_op, ++csr_tg, ++i) {
+        predicate = csr_op->predicate;
         if (predicate && (predicate(env, i) == RISCV_EXCP_NONE)) {
-            if (csr_ops[i].name) {
-                g_string_append_printf(s, "<reg name=\"%s\"", csr_ops[i].name);
+            if (csr_op->name) {
+                g_string_append_printf(s, "<reg name=\"%s\"", csr_op->name);
             } else {
                 g_string_append_printf(s, "<reg name=\"csr%03x\"", i);
             }
             g_string_append_printf(s, " bitsize=\"%d\"", bitsize);
-            g_string_append_printf(s, " regnum=\"%d\"/>", base_reg + i);
+            g_string_append_printf(s, " regnum=\"%d\"", base_reg + i);
+            if (csr_tg->gdb_type) {
+                g_string_append_printf(s, " type=\"%s\"", csr_tg->gdb_type);
+            }
+            if (csr_tg->gdb_group) {
+                g_string_append_printf(s, " group=\"%s\"", csr_tg->gdb_group);
+            }
+            g_string_append(s, " />\n");
         }
     }
 
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index d5e0bc93ea..e1945e54c4 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -25,7 +25,9 @@ riscv_softmmu_ss.add(files(
   'arch_dump.c',
   'pmp.c',
   'monitor.c',
-  'machine.c'
+  'machine.c',
+  'gdb_csr_types.c',
+  'gdb_csr_type_group.c'
 ))
 
 target_arch += {'riscv': riscv_ss}
-- 
Konrad Schwarz


