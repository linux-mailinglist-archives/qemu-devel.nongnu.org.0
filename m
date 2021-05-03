Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EE33722FD
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:31:00 +0200 (CEST)
Received: from localhost ([::1]:57168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldh5f-0003oq-2N
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgqZ-0005sR-6t
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:15:23 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgqT-0000ID-7P
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:15:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080117; x=1651616117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U7W9/97cV7S0MeqIjKSK1ip9SWpr6IUZRTVpdh1xCzQ=;
 b=IWJFf9cXL31TOPm4HvwAPEfzXXigmJdP54bA69c9adBCGofGPThM6rOn
 dBGpTnYRhO0amBi8aKac8Mm3+KvqkXTruhRPP+GVxFXwyBxDQhhg2xCdZ
 Y8X4Gsbd30bZaHkJ9D0+JgDOKax4fvJ+PSkpuiqt4ncBkJlBCYr9jyc3n
 yPFJ1XPYT7rsv8wAsDm7y7bbw636z8136N0MvJvAW+wt88aZLdpVxpcia
 jVbveAGUVh7Uaeqi2iz98gDIkqb1L/y5RwnaBHEF8qg+mIFlHHEqVt2Wc
 IYATBcAU+ZMCOfyZxKj1Un+ZgBI890bJxOW8qMiQr/usIE6n/+3zkvWax A==;
IronPort-SDR: /L3DqBCiyhkXGDtgSHEb4G33yKI48bfrDb1abWtutQedg+pxIPjJng5fEfGBPuvQ3cxrSbSXkE
 PTjPkmGy/WEm1Yyl1sIZ6raTIaTEzOmzcqxMAkXz4NIfGiU88BkUO1GNOqdXFTePgVGBvgoDaT
 x81vSDSx0q8nHqvAB6EIbGTl4nnIdybPyxuo/oFnq9XpRmMidMRXKwVLiJ89nBJCoFKsdjnSKK
 Qo8FY0zY01jRzSIGlNAGHbWVh4G0ka8SmI1UsBHpS43Efm3++esOXiWMmwnETirQAyiBSd7TlX
 ZRc=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114675"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:14:56 +0800
IronPort-SDR: ccn0UOwW/uA8xaU7Do3ZWtcSXwH6jchVgkTJmzszcOcpX1WEhB6wWNkWHa680ocbdbemwADHLO
 5CsUHylU1ZYBCV51biIkntZ/bp02riXoFAzE5XNr/OwVctZgrvC5OIiqr1ut+a/nWflkzYWxjT
 7++M1c/YuW2jrz76LLnKbuDTV90B8fHIRH9g84kE8iMfCYcBOJmz4ScN5SvPHZXrhj5mPG1EK1
 uJ+tnS8sSlJE65QB73jCVm3xremYqxMzrw+LGkEH9YPQHzQe/mt3xAZu7rRUPw1lEQiMAWCQ2I
 QV3kPDs364mKAowZWmOPt/lf
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:55:07 -0700
IronPort-SDR: Kd+mYpDbGBGl6VdxxQXq6b3XpmgV+i0RIPW09gqMKD4zZmS7jNgCkqGpI7DFOwDKX2XSQZ+wgm
 BfR+Exo0X+jetcnVOLVCXeKPajleEaTawygXNvXyaeJbrt7rFyQwXNUkzJHl4jYh+c4CXRK/E/
 0WDML0WHXvNYUuK6y2irNF25ri/37liclDc9iVDL8cXXMG3/WamvkCsLcoWnBFbWGuG73yjDb6
 86pqjlY76EFeNP3aUgWy7ngiJjMIt5RuqHuv2KlUVgjDEDRbuziNiY5NQkFu28kRYVHcLGHqBB
 9sA=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:14:53 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 23/42] target/riscv: Add ePMP CSR access functions
Date: Tue,  4 May 2021 08:13:08 +1000
Message-Id: <20210503221327.3068768-24-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503221327.3068768-1-alistair.francis@wdc.com>
References: <20210503221327.3068768-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=750139ea6=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Hou Weiying <weiying_hou@outlook.com>, qemu-devel@nongnu.org,
 Hongzheng-Li <Ethan.Lee.QNL@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Bin Meng <bmeng.cn@gmail.com>, Myriad-Dreamin <camiyoru@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hou Weiying <weiying_hou@outlook.com>

Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 270762cb2507fba6a9eeb99a774cf49f7da9cc32.1618812899.git.alistair.francis@wdc.com
[ Changes by AF:
 - Rebase on master
 - Fix build errors
 - Fix some style issues
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu.h        |  1 +
 target/riscv/pmp.h        | 14 ++++++++++++++
 target/riscv/csr.c        | 24 ++++++++++++++++++++++++
 target/riscv/pmp.c        | 34 ++++++++++++++++++++++++++++++++++
 target/riscv/trace-events |  3 +++
 5 files changed, 76 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 13a08b86f6..83b315e0b2 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -230,6 +230,7 @@ struct CPURISCVState {
 
     /* physical memory protection */
     pmp_table_t pmp_state;
+    target_ulong mseccfg;
 
     /* machine specific rdtime callback */
     uint64_t (*rdtime_fn)(uint32_t);
diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
index b82a30f0d5..a9a0b363a7 100644
--- a/target/riscv/pmp.h
+++ b/target/riscv/pmp.h
@@ -36,6 +36,12 @@ typedef enum {
     PMP_AMATCH_NAPOT /* Naturally aligned power-of-two region */
 } pmp_am_t;
 
+typedef enum {
+    MSECCFG_MML  = 1 << 0,
+    MSECCFG_MMWP = 1 << 1,
+    MSECCFG_RLB  = 1 << 2
+} mseccfg_field_t;
+
 typedef struct {
     target_ulong addr_reg;
     uint8_t  cfg_reg;
@@ -55,6 +61,10 @@ typedef struct {
 void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
     target_ulong val);
 target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index);
+
+void mseccfg_csr_write(CPURISCVState *env, target_ulong val);
+target_ulong mseccfg_csr_read(CPURISCVState *env);
+
 void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
     target_ulong val);
 target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index);
@@ -68,4 +78,8 @@ void pmp_update_rule_nums(CPURISCVState *env);
 uint32_t pmp_get_num_rules(CPURISCVState *env);
 int pmp_priv_to_page_prot(pmp_priv_t pmp_priv);
 
+#define MSECCFG_MML_ISSET(env) get_field(env->mseccfg, MSECCFG_MML)
+#define MSECCFG_MMWP_ISSET(env) get_field(env->mseccfg, MSECCFG_MMWP)
+#define MSECCFG_RLB_ISSET(env) get_field(env->mseccfg, MSECCFG_RLB)
+
 #endif
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index f0a74f0eb8..97ceff718f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -200,6 +200,15 @@ static RISCVException pmp(CPURISCVState *env, int csrno)
 
     return RISCV_EXCP_ILLEGAL_INST;
 }
+
+static RISCVException epmp(CPURISCVState *env, int csrno)
+{
+    if (env->priv == PRV_M && riscv_feature(env, RISCV_FEATURE_EPMP)) {
+        return RISCV_EXCP_NONE;
+    }
+
+    return RISCV_EXCP_ILLEGAL_INST;
+}
 #endif
 
 /* User Floating-Point CSRs */
@@ -1343,6 +1352,20 @@ static RISCVException write_mtinst(CPURISCVState *env, int csrno,
 }
 
 /* Physical Memory Protection */
+static RISCVException read_mseccfg(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    *val = mseccfg_csr_read(env);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mseccfg(CPURISCVState *env, int csrno,
+                         target_ulong val)
+{
+    mseccfg_csr_write(env, val);
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_pmpcfg(CPURISCVState *env, int csrno,
                                   target_ulong *val)
 {
@@ -1581,6 +1604,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,      write_mtinst      },
 
     /* Physical Memory Protection */
+    [CSR_MSECCFG]    = { "mseccfg",  epmp, read_mseccfg, write_mseccfg },
     [CSR_PMPCFG0]    = { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg  },
     [CSR_PMPCFG1]    = { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcfg  },
     [CSR_PMPCFG2]    = { "pmpcfg2",   pmp, read_pmpcfg,  write_pmpcfg  },
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index a3b253bb15..e35988eec2 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -419,6 +419,40 @@ target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index)
     return val;
 }
 
+/*
+ * Handle a write to a mseccfg CSR
+ */
+void mseccfg_csr_write(CPURISCVState *env, target_ulong val)
+{
+    int i;
+
+    trace_mseccfg_csr_write(env->mhartid, val);
+
+    /* RLB cannot be enabled if it's already 0 and if any regions are locked */
+    if (!MSECCFG_RLB_ISSET(env)) {
+        for (i = 0; i < MAX_RISCV_PMPS; i++) {
+            if (pmp_is_locked(env, i)) {
+                val &= ~MSECCFG_RLB;
+                break;
+            }
+        }
+    }
+
+    /* Sticky bits */
+    val |= (env->mseccfg & (MSECCFG_MMWP | MSECCFG_MML));
+
+    env->mseccfg = val;
+}
+
+/*
+ * Handle a read from a mseccfg CSR
+ */
+target_ulong mseccfg_csr_read(CPURISCVState *env)
+{
+    trace_mseccfg_csr_read(env->mhartid, env->mseccfg);
+    return env->mseccfg;
+}
+
 /*
  * Calculate the TLB size if the start address or the end address of
  * PMP entry is presented in thie TLB page.
diff --git a/target/riscv/trace-events b/target/riscv/trace-events
index b7e371ee97..49ec4d3b7d 100644
--- a/target/riscv/trace-events
+++ b/target/riscv/trace-events
@@ -6,3 +6,6 @@ pmpcfg_csr_read(uint64_t mhartid, uint32_t reg_index, uint64_t val) "hart %" PRI
 pmpcfg_csr_write(uint64_t mhartid, uint32_t reg_index, uint64_t val) "hart %" PRIu64 ": write reg%" PRIu32", val: 0x%" PRIx64
 pmpaddr_csr_read(uint64_t mhartid, uint32_t addr_index, uint64_t val) "hart %" PRIu64 ": read addr%" PRIu32", val: 0x%" PRIx64
 pmpaddr_csr_write(uint64_t mhartid, uint32_t addr_index, uint64_t val) "hart %" PRIu64 ": write addr%" PRIu32", val: 0x%" PRIx64
+
+mseccfg_csr_read(uint64_t mhartid, uint64_t val) "hart %" PRIu64 ": read mseccfg, val: 0x%" PRIx64
+mseccfg_csr_write(uint64_t mhartid, uint64_t val) "hart %" PRIu64 ": write mseccfg, val: 0x%" PRIx64
-- 
2.31.1


