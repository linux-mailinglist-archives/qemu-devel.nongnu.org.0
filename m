Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3BE11740F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Dec 2019 19:23:45 +0100 (CET)
Received: from localhost ([::1]:44372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieNh9-0007Oa-OD
	for lists+qemu-devel@lfdr.de; Mon, 09 Dec 2019 13:23:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34488)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=23948302b=alistair.francis@wdc.com>)
 id 1ieNaJ-0006hx-RV
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 13:16:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=23948302b=alistair.francis@wdc.com>)
 id 1ieNaI-0007AV-H6
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 13:16:39 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:7351)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=23948302b=alistair.francis@wdc.com>)
 id 1ieNaI-000793-7y; Mon, 09 Dec 2019 13:16:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1575915413; x=1607451413;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1rd+vLPAKoIW42106d3pdZ3aukgNbbqxDGOiTR93goY=;
 b=XAuPNdCJbqMqoape5pAS2Gdy7BrNAkeLr8/Wr3SsdDi9nc8NNrwqwYJk
 GEVDUHP4a2VKCrKVOvJITcMtVmpKfUXWQPLkMW7yVtZ7kuTLAfc4fNg1L
 XZVYnmseQmbRy7aYTIOkdQI0/QrBWCLxM/KmXEVRZXGhKhQjF29glrEF6
 RtUB6nZGXUX/A2nrTmDnB8oki93Oaw9Bu3NiUImB85ziGQDlzN5PdsYvb
 CRqEot97ApDmaTuX8mK2EGqwyWdj0jJIQPJ4TkbzdVW8Rv9CVm1q9anPv
 Lf894xiASnuySVtgJTl+svmikTgqdZ/EoxBAP4flljfOUzE0cAsA5FfPZ w==;
IronPort-SDR: 1JyxrB5pd736QYmaIQ0WsI4uRTL1UmTqCismfGi8LEsEY5LYagGQh4/0nz6h56H7mou9MBVV8q
 pL/oXSMF8nllWUrK0bpY+woS2eeycvEslGZvC3Nz4/b1+xz3TBmXneOM/+tiAd9TjbxGgmUX8j
 YQ9WMfT000BpY8lYyCMLuXn07M3U0r0IXDpgyGzUeoRltcpLeK+MPYXGg4vlZOQLNZq0iF/fSK
 wgs6eKvie7X/SKoLzvgeC8QLCCbcGFt2+F09H5sa0CG9dgkhBvbNgy/vcvNzac+Qozln592vEr
 A7s=
X-IronPort-AV: E=Sophos;i="5.69,296,1571673600"; d="scan'208";a="226411923"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2019 02:16:53 +0800
IronPort-SDR: fm/iMCmW+H26GMx0qtKRdWOmXc2t33ResE+S0Ml5AlW0/Ecbr1mbCsNrLy3/YB0e6e0k4xeGv+
 LXvPAP76g+LONSiuW0sscL0/FhnIrztrKc5HuZhzepWv0Nkc/TDStV3UmZo8BmZbq6/qSUQmXj
 ZW5W1+f6ruoFxqHfwhGIOv2xMUCeP2I9OrvI9ke4d0hMp21iOkVEDWLfMKzbV7bWz/ouDHUzyk
 6VXlUawWXGfDjdSXp09mrwknhrR88dMW38dORyega1PzSRshTxJ6Ptty+Ir5PPha5y0fMrK7vN
 f1Ci0rQVkNAZ9wJDnuGoG4Qe
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 10:10:54 -0800
IronPort-SDR: 4llnkDNyib27XKV1skO40NrGXUN0eChbNj4A8SitDFPZo9LAbsTpaWHPvXbEyHsj88ZxmQr7IM
 y4DNtyp1lm9bWA1N9KLFHGyZpPzGY3HSq93xNfRMuCZibGMA67GM9IGubCduRBfJufY04L2gSk
 t4uyaDinmc33lDO3UZLPu3m6dKQ6TDjLxQPi2Qxs0q4ZuOJz9Vr2Iw5hMBiL5ysrW39S+YMDVf
 OenW5XZf5J62GmgKuaGSqwuXj211iSCO2d9/5Ckb2FO0XreIcU7TzQN78PmcyN6EM+q1wrdTMG
 afQ=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.158.235])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Dec 2019 10:16:38 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v1 06/36] target/riscv: Rename the H irqs to VS irqs
Date: Mon,  9 Dec 2019 10:10:56 -0800
Message-Id: <d43f1c34d02514d3df0527c20718725a36684887.1575914822.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1575914822.git.alistair.francis@wdc.com>
References: <cover.1575914822.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 68.232.143.124
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
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c      |  6 +++---
 target/riscv/cpu_bits.h | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d23d2cba64..e8ae07107e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -80,14 +80,14 @@ const char * const riscv_excp_names[] = {
 const char * const riscv_intr_names[] = {
     "u_software",
     "s_software",
-    "h_software",
+    "vs_software",
     "m_software",
     "u_timer",
     "s_timer",
-    "h_timer",
+    "vs_timer",
     "m_timer",
     "u_external",
-    "s_external",
+    "vs_external",
     "h_external",
     "m_external",
     "reserved",
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 9ce73c36de..eeaa03c0f8 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -514,29 +514,29 @@
 /* Interrupt causes */
 #define IRQ_U_SOFT                         0
 #define IRQ_S_SOFT                         1
-#define IRQ_H_SOFT                         2  /* reserved */
+#define IRQ_VS_SOFT                        2
 #define IRQ_M_SOFT                         3
 #define IRQ_U_TIMER                        4
 #define IRQ_S_TIMER                        5
-#define IRQ_H_TIMER                        6  /* reserved */
+#define IRQ_VS_TIMER                       6
 #define IRQ_M_TIMER                        7
 #define IRQ_U_EXT                          8
 #define IRQ_S_EXT                          9
-#define IRQ_H_EXT                          10 /* reserved */
+#define IRQ_VS_EXT                         10
 #define IRQ_M_EXT                          11
 
 /* mip masks */
 #define MIP_USIP                           (1 << IRQ_U_SOFT)
 #define MIP_SSIP                           (1 << IRQ_S_SOFT)
-#define MIP_HSIP                           (1 << IRQ_H_SOFT)
+#define MIP_VSSIP                          (1 << IRQ_VS_SOFT)
 #define MIP_MSIP                           (1 << IRQ_M_SOFT)
 #define MIP_UTIP                           (1 << IRQ_U_TIMER)
 #define MIP_STIP                           (1 << IRQ_S_TIMER)
-#define MIP_HTIP                           (1 << IRQ_H_TIMER)
+#define MIP_VSTIP                          (1 << IRQ_VS_TIMER)
 #define MIP_MTIP                           (1 << IRQ_M_TIMER)
 #define MIP_UEIP                           (1 << IRQ_U_EXT)
 #define MIP_SEIP                           (1 << IRQ_S_EXT)
-#define MIP_HEIP                           (1 << IRQ_H_EXT)
+#define MIP_VSEIP                          (1 << IRQ_VS_EXT)
 #define MIP_MEIP                           (1 << IRQ_M_EXT)
 
 /* sip masks */
-- 
2.24.0


