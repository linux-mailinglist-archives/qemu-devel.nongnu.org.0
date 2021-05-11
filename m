Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D62237A4A2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:31:59 +0200 (CEST)
Received: from localhost ([::1]:60916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPg9-0004SG-2g
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPVU-00005Q-HQ
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:20:52 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPVJ-0006V6-4M
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:20:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728439; x=1652264439;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cQ+E7bgIWZyDSwMRwwYYu9Yg/pKRgf4qLqVbRNdF+II=;
 b=po6cv9/ULFElrHOqujyoZlxSafss+CdRvNTIVhhIhhRbcL2hq3bOTUtU
 ert4NRLheCaPtmrApZeiXDJu8rVX2JmlzGd1jMr9VcIRBkgzynt9oOnlO
 loAINIKun2Ova0SYKMzv2ZIGos6FcZ3va6b4Zqyr6Hfb3G5ofUf2U8HXY
 sOXf7uuacIw3u7sPyFKZSnGMgktvqwyJTwb8zZ0TQ4scUyLBUUA/OTZp6
 A2BrxCP0A9GmjbYJBvWQDOLu/K9Mw2xlBiRdbtlF50H94baV/viaoxaaN
 S+5ifqprfDzxhRbt1FrhZMaukB3wKWK+ZiOL0foCss47CTczzmc7EqPQB A==;
IronPort-SDR: 8U31g+AgRgAlCIGJupivwN/jt8YGMAb0FpgRggwGEvGOvTsSj6387dicbE/nyIbtxZpXDFiO8d
 CKyf6MWKHXA6ud3djo3yQ/qOEdSF8WAEox6UvE78/OWr+ab67T0oCVvBGRYesmawATh1ZP3TZA
 KX8u/kJGt4JNqeOW4MkDoHzr2PQuMp1iZS8g+7IA+vAij5zzK2FBgu+7SatOVYqIXI/jrprt5w
 /a4mxhBmJ43ym5ffige3QGtZF8YM8Z1FX+MKf9TSxHlQ8iTmXkiW1Rodxt7hjiJTU6cqRe6iuE
 ado=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735372"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:20:30 +0800
IronPort-SDR: 5T38LmXGifw2lS5djXyxzYVlV0m+Utk8j+slHRVAfdRQhmQmLmQ1bR2I8FEy+hmyMNy2rG5625
 BnadKcdlaBuLhBdVTkrEZfFcwvdiarYSb0KL2gK5dRy9Dz5FIciksn6h4yGrOLyWR+4jvsIaV/
 CMulnjpe8mWoXR79mZuJ2qLICV2ELm5yp7cbMLJ9QKb6imnZ4plBvz6TJsrGNfqgNR0lddaiiF
 ojJoe8fGjDP1hVDUJ4lG9+t9Je0XmgSN3DmtBE9+ZteHdzaJGWS7VTPQ1rK7kEFKKmz6T7PjFq
 YuFVoVc4hIWrl5qEkBA4I0uo
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:00:29 -0700
IronPort-SDR: 6m8ADwUoM+s4LrAnbgMGiRxY6jzWBZleEzeT7PGNsqGym0bKD1yI9qgB/6zgxeMhkxqBslc6Yj
 gs76gJJsY63leDi5ttAQWCd4pyuIvyy2BzBoMnaxCibZTaJvx16OhsEFQbcV1QoLGMM2v30jYk
 ZxW2LeN1az+IzlDRJ7ylgI2vWR71unaJoSiYICUjyHxQZZlHrbzN4vncQFPuL5M4OmZECpdung
 DoK5GudXBhGJDOPOVEt4qyt0r+cRGq0vL+xPzoArbKImquZjd2pDrUb5v2x1IeuggXx/m3aESb
 BiY=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:20:29 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 09/42] target/riscv: Convert the RISC-V exceptions to an enum
Date: Tue, 11 May 2021 20:19:18 +1000
Message-Id: <20210511101951.165287-10-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511101951.165287-1-alistair.francis@wdc.com>
References: <20210511101951.165287-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7584e029c=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: f191dcf08bf413a822e743a7c7f824d68879a527.1617290165.git.alistair.francis@wdc.com
---
 target/riscv/cpu_bits.h   | 44 ++++++++++++++++++++-------------------
 target/riscv/cpu.c        |  2 +-
 target/riscv/cpu_helper.c |  4 ++--
 3 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index b42dd4f8d8..8549d77b4f 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -504,27 +504,29 @@
 #define DEFAULT_RSTVEC      0x1000
 
 /* Exception causes */
-#define EXCP_NONE                                -1 /* sentinel value */
-#define RISCV_EXCP_INST_ADDR_MIS                 0x0
-#define RISCV_EXCP_INST_ACCESS_FAULT             0x1
-#define RISCV_EXCP_ILLEGAL_INST                  0x2
-#define RISCV_EXCP_BREAKPOINT                    0x3
-#define RISCV_EXCP_LOAD_ADDR_MIS                 0x4
-#define RISCV_EXCP_LOAD_ACCESS_FAULT             0x5
-#define RISCV_EXCP_STORE_AMO_ADDR_MIS            0x6
-#define RISCV_EXCP_STORE_AMO_ACCESS_FAULT        0x7
-#define RISCV_EXCP_U_ECALL                       0x8
-#define RISCV_EXCP_S_ECALL                      0x9
-#define RISCV_EXCP_VS_ECALL                      0xa
-#define RISCV_EXCP_M_ECALL                       0xb
-#define RISCV_EXCP_INST_PAGE_FAULT               0xc /* since: priv-1.10.0 */
-#define RISCV_EXCP_LOAD_PAGE_FAULT               0xd /* since: priv-1.10.0 */
-#define RISCV_EXCP_STORE_PAGE_FAULT              0xf /* since: priv-1.10.0 */
-#define RISCV_EXCP_SEMIHOST                      0x10
-#define RISCV_EXCP_INST_GUEST_PAGE_FAULT         0x14
-#define RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT       0x15
-#define RISCV_EXCP_VIRT_INSTRUCTION_FAULT        0x16
-#define RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT  0x17
+typedef enum RISCVException {
+    RISCV_EXCP_NONE = -1, /* sentinel value */
+    RISCV_EXCP_INST_ADDR_MIS = 0x0,
+    RISCV_EXCP_INST_ACCESS_FAULT = 0x1,
+    RISCV_EXCP_ILLEGAL_INST = 0x2,
+    RISCV_EXCP_BREAKPOINT = 0x3,
+    RISCV_EXCP_LOAD_ADDR_MIS = 0x4,
+    RISCV_EXCP_LOAD_ACCESS_FAULT = 0x5,
+    RISCV_EXCP_STORE_AMO_ADDR_MIS = 0x6,
+    RISCV_EXCP_STORE_AMO_ACCESS_FAULT = 0x7,
+    RISCV_EXCP_U_ECALL = 0x8,
+    RISCV_EXCP_S_ECALL = 0x9,
+    RISCV_EXCP_VS_ECALL = 0xa,
+    RISCV_EXCP_M_ECALL = 0xb,
+    RISCV_EXCP_INST_PAGE_FAULT = 0xc, /* since: priv-1.10.0 */
+    RISCV_EXCP_LOAD_PAGE_FAULT = 0xd, /* since: priv-1.10.0 */
+    RISCV_EXCP_STORE_PAGE_FAULT = 0xf, /* since: priv-1.10.0 */
+    RISCV_EXCP_SEMIHOST = 0x10,
+    RISCV_EXCP_INST_GUEST_PAGE_FAULT = 0x14,
+    RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT = 0x15,
+    RISCV_EXCP_VIRT_INSTRUCTION_FAULT = 0x16,
+    RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT = 0x17,
+} RISCVException;
 
 #define RISCV_EXCP_INT_FLAG                0x80000000
 #define RISCV_EXCP_INT_MASK                0x7fffffff
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6842626c69..e530df9385 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -358,7 +358,7 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->pc = env->resetvec;
     env->two_stage_lookup = false;
 #endif
-    cs->exception_index = EXCP_NONE;
+    cs->exception_index = RISCV_EXCP_NONE;
     env->load_res = -1;
     set_default_nan_mode(1, &env->fp_status);
 }
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 503c2559f8..99cc388db9 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -72,7 +72,7 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
     if (irqs) {
         return ctz64(irqs); /* since non-zero */
     } else {
-        return EXCP_NONE; /* indicates no pending interrupt */
+        return RISCV_EXCP_NONE; /* indicates no pending interrupt */
     }
 }
 #endif
@@ -1069,5 +1069,5 @@ void riscv_cpu_do_interrupt(CPUState *cs)
 
     env->two_stage_lookup = false;
 #endif
-    cs->exception_index = EXCP_NONE; /* mark handled to qemu */
+    cs->exception_index = RISCV_EXCP_NONE; /* mark handled to qemu */
 }
-- 
2.31.1


