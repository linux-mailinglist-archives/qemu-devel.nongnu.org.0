Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A296B4845DA
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 17:16:28 +0100 (CET)
Received: from localhost ([::1]:36516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4mU7-0000zV-AY
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 11:16:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n4mR1-0007qH-3W
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 11:13:15 -0500
Received: from mail-eopbgr30074.outbound.protection.outlook.com
 ([40.107.3.74]:39566 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n4mQy-0000vV-2I
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 11:13:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NyIlEtITQcxSUl4M20xUvUgxxr1xijCG/dR0lrPIkyiX3t9HIEKjBWQ/STFU5hfcrLa8gUTzB5bIzhx1Pa/I5FaiMBP+fNOhd7BTbFgKzpNsd/NuFpTViYJUB37CkO8ATkkjFEqQdRhP4u4waRuKhBJLyiDQyUpwPn8Vhdqewb7FIIBk4r3bhsJ6jQfwNY81EFLFaDL5iYevfq1Z9/rFEYpkrE5TGdTlMbaUdll11ATQDJRqZ2VwKCVMnGk7jhXSKiccr6wAN67kXC/pmYXlsg1i3CNbuj9Za18cT6MxbhzLPjg2cX76xHxSfXS+uHm5sne40vh0n+nIBm1xEgGYUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWSbHdU2G8ZgRKu8Cq/hLVyhJ4yYWZIULxS75T1KIuQ=;
 b=Xca2hgCDDP47hKdXKsl3vh9UYYd1yPS2E0guCpNxA6uvWCuE7qsNTiGpVNET0/m0uRsBL5gk3hrE1nZT6xOpaJ1o5Qkg+NVoepbLd5K+8n28tYnZ08qIiYY8yuAEdbOavqnC7DGFkVvrzWbTHljzyLKgY4dBERW28oOHczY4kzd/7fit9DThu4QEtngF9JmGfMjaJmmrQPH18frNRfCphJEHyhpE+47zL4jVtcMhg8BjrADPb+DdVvrYR9hUJfB9obdeHhHBzdayIJH46tOWUuGl69V/s3RphUXhNyFCIQHld2AgQC+qdos2srtIh2lksb0DX5XWkk0xsh1H9Gw2xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.71) smtp.rcpttodomain=nongnu.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWSbHdU2G8ZgRKu8Cq/hLVyhJ4yYWZIULxS75T1KIuQ=;
 b=oXtGL/dr4TIyARaNCdsX30cNRnfrCpvsj7zZW+neSG/N4uR235VIpmdWAPSx76G/NQIe/GU5D4Sl2EOGMC5PBTnT0a3IGnI/khw1FvSVuGPYiUDefKspTNNwDguFov1cCEwlVanU55s5ruQCS3Gfdh32pYVsewlVYo92WdM4WFHZL+u/41sOUQrNrsOqPDJwPJcXvGfKLvHAx+2rC7ljBG0jiXsS1mkdHcC5X2Syp/2BHa5ZVHgZwYFXPF2A2Yo8dQCWIWq5oflPrlRbBdZMclM5BYyadEdfO94OavGVZTsNyqNGSGaXO/htLyz5xOLoEY5hw11wQq+eHUv+RzKeBA==
Received: from AM6PR08CA0014.eurprd08.prod.outlook.com (2603:10a6:20b:b2::26)
 by AS8PR10MB4679.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:332::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 15:52:06 +0000
Received: from VE1EUR01FT014.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::af) by AM6PR08CA0014.outlook.office365.com
 (2603:10a6:20b:b2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14 via Frontend
 Transport; Tue, 4 Jan 2022 15:52:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.71)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.71 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.71; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.71) by
 VE1EUR01FT014.mail.protection.outlook.com (10.152.2.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4844.14 via Frontend Transport; Tue, 4 Jan 2022 15:52:05 +0000
Received: from DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) by
 DEMCHDC9SKA.ad011.siemens.net (194.138.21.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 4 Jan 2022 16:52:04 +0100
Received: from fedora.vmnet8.md1wgtfc (139.21.146.182) by
 DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 4 Jan 2022 16:52:03 +0100
From: Konrad Schwarz <konrad.schwarz@siemens.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 1/5] RISC-V: larger and more consistent register set for
 'info registers'
Date: Tue, 4 Jan 2022 16:51:16 +0100
Message-ID: <85d02ac883c7cf40fbd54e8747783937e0370eaa.1641309725.git.konrad.schwarz@siemens.com>
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
X-MS-Office365-Filtering-Correlation-Id: ffb9bafb-fbaa-40fa-6bec-08d9cf9a27f7
X-MS-TrafficTypeDiagnostic: AS8PR10MB4679:EE_
X-Microsoft-Antispam-PRVS: <AS8PR10MB4679CFD3249593D99937F2758A4A9@AS8PR10MB4679.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /tnZe/P3xmQe2ceV4L23lqQsIraE5ApJznYDKY695HUnVtPES4EongaPVKVeUx+MIPMM0Hv82BX/DpgicAG54jSskqpe5Mu1/pVFVYKhz6imzIvqMdgu7Og7Yt3g0xd7HXoNCqytDc+9Q+6gJGYTC1Y+wE2Wn+uqqVU8PKRREZ2SZZ1P59KO9VfrZFxTcjGVMapNoRTSrIcGro7saSGsMXbZuOQ/vM5QOh2qApirINsXKjoLIHN4yDf0kPsv+tN+hpFrpIqMzlJPOqEtvcY4+xHkVfpeNx2hTfVu9KPDKeP/9OfIAAc6x0EQqY8G45bUdCk2acnJypVKUbkvq6xkkpLiY7oKkJun6mzfYKqkm1w9QC95YFgp3nIdw9gPcv069AOWk0TBeBlbUfqhiafCUuSVtRFFW2Bzin5ZcG45zF7h+hJ0KwGQWh2howcmX8zvxTOuYYNizKDGnVPUXuGj1a3qy8N9mXRqfOx6ntjHoObnxCVWcAFnH7gnRoEzB5p1fwjETKARfAHCrPnhDNW3iknPO/lKiNyZPiVvQjyUuBpc3VdLb6evbuL87otUEYBIUO7VIvxpLQIY0A4+L/X06wGfD0gd4/2NlJcQZIpBwCckYkLx8B3gcHlGllb4F2qbePoUVzvIne2ftFDjwRoNhn16RpZe/YmdWCuI2hkWiv4vyfiV5KmGUY/A8MLsayF1qs79tp7hQswtw8S/6WkVqiolk9l9E8bAGFywk5FjbIvsZzxzJNlubjbIoM1nELG/4eo+btHyIRhpMM3aiyOguZQcaz6rv88n2hZhmUFlZVDW0vXvRbtBhvwmVxKz9Lxv
X-Forefront-Antispam-Report: CIP:194.138.21.71; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:hybrid.siemens.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700002)(46966006)(6666004)(36860700001)(316002)(16526019)(36756003)(83380400001)(5660300002)(508600001)(356005)(44832011)(8676002)(8936002)(2616005)(2906002)(26005)(54906003)(47076005)(186003)(70206006)(86362001)(40460700001)(82310400004)(6916009)(336012)(956004)(70586007)(81166007)(4326008)(82960400001)(2004002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 15:52:05.1450 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb9bafb-fbaa-40fa-6bec-08d9cf9a27f7
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a; Ip=[194.138.21.71];
 Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT014.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB4679
Received-SPF: pass client-ip=40.107.3.74;
 envelope-from=konrad.schwarz@siemens.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

Display more CSRs in the 'info registers' command
and group them according to function.

The number of CSRs in RISC-V is so large to make it impractical
for all CSRs to be displayed by 'info registers'.
The code uses conditional compilation directives around register
groups; advanced users can enable/disable register
groups as required.

Signed-off-by: Konrad Schwarz <konrad.schwarz@siemens.com>
---
 target/riscv/cpu.c | 327 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 303 insertions(+), 24 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f812998123..eb9518fc16 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -3,6 +3,7 @@
  *
  * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
  * Copyright (c) 2017-2018 SiFive, Inc.
+ * Copyright (c) 2021 Siemens AG, konrad.schwarz@siemens.com
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -244,40 +245,318 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 #ifndef CONFIG_USER_ONLY
     {
         static const int dump_csrs[] = {
+
+#  if 0
+            CSR_USTATUS,
+            CSR_UIE,
+            CSR_UTVEC,
+
+/* User Trap Handling */
+            CSR_USCRATCH,
+            CSR_UEPC,
+            CSR_UCAUSE,
+            CSR_UTVAL,
+            CSR_UIP,
+#  endif
+
+/* User Floating-Point CSRs */
+            CSR_FFLAGS,
+            CSR_FRM,
+            CSR_FCSR,
+
+/* User Vector CSRs */
+            CSR_VSTART,
+            CSR_VXSAT,
+            CSR_VXRM,
+            CSR_VL,
+            CSR_VTYPE,
+
+#  if      0
+/* User Timers and Counters */
+            CSR_CYCLE,
+            CSR_TIME,
+            CSR_INSTRET,
+            CSR_HPMCOUNTER3,
+            CSR_HPMCOUNTER4,
+            CSR_HPMCOUNTER5,
+            CSR_HPMCOUNTER6,
+            CSR_HPMCOUNTER7,
+            CSR_HPMCOUNTER8,
+            CSR_HPMCOUNTER9,
+            CSR_HPMCOUNTER10,
+            CSR_HPMCOUNTER11,
+            CSR_HPMCOUNTER12,
+            CSR_HPMCOUNTER13,
+            CSR_HPMCOUNTER14,
+            CSR_HPMCOUNTER15,
+            CSR_HPMCOUNTER16,
+            CSR_HPMCOUNTER17,
+            CSR_HPMCOUNTER18,
+            CSR_HPMCOUNTER19,
+            CSR_HPMCOUNTER20,
+            CSR_HPMCOUNTER21,
+            CSR_HPMCOUNTER22,
+            CSR_HPMCOUNTER23,
+            CSR_HPMCOUNTER24,
+            CSR_HPMCOUNTER25,
+            CSR_HPMCOUNTER26,
+            CSR_HPMCOUNTER27,
+            CSR_HPMCOUNTER28,
+            CSR_HPMCOUNTER29,
+            CSR_HPMCOUNTER30,
+            CSR_HPMCOUNTER31,
+            CSR_CYCLEH,
+            CSR_TIMEH,
+            CSR_INSTRETH,
+            CSR_HPMCOUNTER3H,
+            CSR_HPMCOUNTER4H,
+            CSR_HPMCOUNTER5H,
+            CSR_HPMCOUNTER6H,
+            CSR_HPMCOUNTER7H,
+            CSR_HPMCOUNTER8H,
+            CSR_HPMCOUNTER9H,
+            CSR_HPMCOUNTER10H,
+            CSR_HPMCOUNTER11H,
+            CSR_HPMCOUNTER12H,
+            CSR_HPMCOUNTER13H,
+            CSR_HPMCOUNTER14H,
+            CSR_HPMCOUNTER15H,
+            CSR_HPMCOUNTER16H,
+            CSR_HPMCOUNTER17H,
+            CSR_HPMCOUNTER18H,
+            CSR_HPMCOUNTER19H,
+            CSR_HPMCOUNTER20H,
+            CSR_HPMCOUNTER21H,
+            CSR_HPMCOUNTER22H,
+            CSR_HPMCOUNTER23H,
+            CSR_HPMCOUNTER24H,
+            CSR_HPMCOUNTER25H,
+            CSR_HPMCOUNTER26H,
+            CSR_HPMCOUNTER27H,
+            CSR_HPMCOUNTER28H,
+            CSR_HPMCOUNTER29H,
+            CSR_HPMCOUNTER30H,
+            CSR_HPMCOUNTER31H,
+#  endif
+
+#  if      0
+/* Machine Timers and Counters */
+            CSR_MCYCLE,
+            CSR_MINSTRET,
+            CSR_MCYCLEH,
+            CSR_MINSTRETH,
+#  endif
+
+/* Machine Information Registers */
+            CSR_MVENDORID,
+            CSR_MARCHID,
+            CSR_MIMPID,
             CSR_MHARTID,
+
+/* Machine Trap Setup */
             CSR_MSTATUS,
-            CSR_MSTATUSH,
-            CSR_HSTATUS,
-            CSR_VSSTATUS,
-            CSR_MIP,
-            CSR_MIE,
-            CSR_MIDELEG,
-            CSR_HIDELEG,
+            CSR_MISA,
             CSR_MEDELEG,
-            CSR_HEDELEG,
+            CSR_MIDELEG,
+            CSR_MIE,
             CSR_MTVEC,
-            CSR_STVEC,
-            CSR_VSTVEC,
+            CSR_MCOUNTEREN,
+
+#  if defined TARGET_RISCV32
+/* 32-bit only */
+            CSR_MSTATUSH,
+#  endif
+
+/* Machine Trap Handling */
+            CSR_MSCRATCH,
             CSR_MEPC,
-            CSR_SEPC,
-            CSR_VSEPC,
             CSR_MCAUSE,
-            CSR_SCAUSE,
-            CSR_VSCAUSE,
             CSR_MTVAL,
+            CSR_MIP,
+
+/* Supervisor Trap Setup */
+            CSR_SSTATUS,
+            CSR_SEDELEG,
+            CSR_SIDELEG,
+            CSR_SIE,
+            CSR_STVEC,
+            CSR_SCOUNTEREN,
+
+/* Supervisor Trap Handling */
+            CSR_SSCRATCH,
+            CSR_SEPC,
+            CSR_SCAUSE,
             CSR_STVAL,
+            CSR_SIP,
+
+/* Supervisor Protection and Translation */
+            CSR_SPTBR,
+            CSR_SATP,
+
+/* Hpervisor CSRs */
+            CSR_HSTATUS,
+            CSR_HEDELEG,
+            CSR_HIDELEG,
+            CSR_HIE,
+            CSR_HCOUNTEREN,
+            CSR_HGEIE,
             CSR_HTVAL,
+            CSR_HVIP,
+            CSR_HIP,
+            CSR_HTINST,
+            CSR_HGEIP,
+            CSR_HGATP,
+            CSR_HTIMEDELTA,
+            CSR_HTIMEDELTAH,
+
+/* Virtual CSRs */
+            CSR_VSSTATUS,
+            CSR_VSIE,
+            CSR_VSTVEC,
+            CSR_VSSCRATCH,
+            CSR_VSEPC,
+            CSR_VSCAUSE,
+            CSR_VSTVAL,
+            CSR_VSIP,
+            CSR_VSATP,
+
+            CSR_MTINST,
             CSR_MTVAL2,
-            CSR_MSCRATCH,
-            CSR_SSCRATCH,
-            CSR_SATP,
-            CSR_MMTE,
-            CSR_UPMBASE,
-            CSR_UPMMASK,
-            CSR_SPMBASE,
-            CSR_SPMMASK,
-            CSR_MPMBASE,
-            CSR_MPMMASK,
+
+#  if      0
+/* Enhanced Physical Memory Protection (ePMP) */
+            CSR_MSECCFG,
+            CSR_MSECCFGH,
+#  endif
+#  if      0
+/* Physical Memory Protection */
+            CSR_PMPCFG0,
+            CSR_PMPCFG1,
+            CSR_PMPCFG2,
+            CSR_PMPCFG3,
+            CSR_PMPADDR0,
+            CSR_PMPADDR1,
+            CSR_PMPADDR2,
+            CSR_PMPADDR3,
+            CSR_PMPADDR4,
+            CSR_PMPADDR5,
+            CSR_PMPADDR6,
+            CSR_PMPADDR7,
+            CSR_PMPADDR8,
+            CSR_PMPADDR9,
+            CSR_PMPADDR10,
+            CSR_PMPADDR11,
+            CSR_PMPADDR12,
+            CSR_PMPADDR13,
+            CSR_PMPADDR14,
+            CSR_PMPADDR15,
+#  endif
+
+#  if      0
+/* Debug/Trace Registers (shared with Debug Mode) */
+            CSR_TSELECT,
+            CSR_TDATA1,
+            CSR_TDATA2,
+            CSR_TDATA3,
+#  endif
+
+#  if      0
+/* Debug Mode Registers */
+            CSR_DCSR,
+            CSR_DPC,
+            CSR_DSCRATCH,
+#  endif
+
+#  if      0
+/* Performance Counters */
+            CSR_MHPMCOUNTER3,
+            CSR_MHPMCOUNTER4,
+            CSR_MHPMCOUNTER5,
+            CSR_MHPMCOUNTER6,
+            CSR_MHPMCOUNTER7,
+            CSR_MHPMCOUNTER8,
+            CSR_MHPMCOUNTER9,
+            CSR_MHPMCOUNTER10,
+            CSR_MHPMCOUNTER11,
+            CSR_MHPMCOUNTER12,
+            CSR_MHPMCOUNTER13,
+            CSR_MHPMCOUNTER14,
+            CSR_MHPMCOUNTER15,
+            CSR_MHPMCOUNTER16,
+            CSR_MHPMCOUNTER17,
+            CSR_MHPMCOUNTER18,
+            CSR_MHPMCOUNTER19,
+            CSR_MHPMCOUNTER20,
+            CSR_MHPMCOUNTER21,
+            CSR_MHPMCOUNTER22,
+            CSR_MHPMCOUNTER23,
+            CSR_MHPMCOUNTER24,
+            CSR_MHPMCOUNTER25,
+            CSR_MHPMCOUNTER26,
+            CSR_MHPMCOUNTER27,
+            CSR_MHPMCOUNTER28,
+            CSR_MHPMCOUNTER29,
+            CSR_MHPMCOUNTER30,
+            CSR_MHPMCOUNTER31,
+            CSR_MHPMEVENT3,
+            CSR_MHPMEVENT4,
+            CSR_MHPMEVENT5,
+            CSR_MHPMEVENT6,
+            CSR_MHPMEVENT7,
+            CSR_MHPMEVENT8,
+            CSR_MHPMEVENT9,
+            CSR_MHPMEVENT10,
+            CSR_MHPMEVENT11,
+            CSR_MHPMEVENT12,
+            CSR_MHPMEVENT13,
+            CSR_MHPMEVENT14,
+            CSR_MHPMEVENT15,
+            CSR_MHPMEVENT16,
+            CSR_MHPMEVENT17,
+            CSR_MHPMEVENT18,
+            CSR_MHPMEVENT19,
+            CSR_MHPMEVENT20,
+            CSR_MHPMEVENT21,
+            CSR_MHPMEVENT22,
+            CSR_MHPMEVENT23,
+            CSR_MHPMEVENT24,
+            CSR_MHPMEVENT25,
+            CSR_MHPMEVENT26,
+            CSR_MHPMEVENT27,
+            CSR_MHPMEVENT28,
+            CSR_MHPMEVENT29,
+            CSR_MHPMEVENT30,
+            CSR_MHPMEVENT31,
+            CSR_MHPMCOUNTER3H,
+            CSR_MHPMCOUNTER4H,
+            CSR_MHPMCOUNTER5H,
+            CSR_MHPMCOUNTER6H,
+            CSR_MHPMCOUNTER7H,
+            CSR_MHPMCOUNTER8H,
+            CSR_MHPMCOUNTER9H,
+            CSR_MHPMCOUNTER10H,
+            CSR_MHPMCOUNTER11H,
+            CSR_MHPMCOUNTER12H,
+            CSR_MHPMCOUNTER13H,
+            CSR_MHPMCOUNTER14H,
+            CSR_MHPMCOUNTER15H,
+            CSR_MHPMCOUNTER16H,
+            CSR_MHPMCOUNTER17H,
+            CSR_MHPMCOUNTER18H,
+            CSR_MHPMCOUNTER19H,
+            CSR_MHPMCOUNTER20H,
+            CSR_MHPMCOUNTER21H,
+            CSR_MHPMCOUNTER22H,
+            CSR_MHPMCOUNTER23H,
+            CSR_MHPMCOUNTER24H,
+            CSR_MHPMCOUNTER25H,
+            CSR_MHPMCOUNTER26H,
+            CSR_MHPMCOUNTER27H,
+            CSR_MHPMCOUNTER28H,
+            CSR_MHPMCOUNTER29H,
+            CSR_MHPMCOUNTER30H,
+            CSR_MHPMCOUNTER31H,
+#  endif
         };
 
         for (int i = 0; i < ARRAY_SIZE(dump_csrs); ++i) {
-- 
Konrad Schwarz


