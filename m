Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EBF37A4EE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:50:19 +0200 (CEST)
Received: from localhost ([::1]:50514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPxy-0002JH-Ao
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:50:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPWb-0001Ze-AO
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:22:01 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPWV-0006X1-PA
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:22:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728514; x=1652264514;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U7W9/97cV7S0MeqIjKSK1ip9SWpr6IUZRTVpdh1xCzQ=;
 b=TRs6QRgHfp9buzaiQppXCIhiZOL5oyPYEmWrsaW11LrxnycEx6WcojGF
 yHd8K5sKDcYaSFzQBZf5xoUW749KLUOHNrb0U4ljT2GJIwX3HLGNd4RdI
 4Q2/E8Db4+g2S/DY0qQTIBKixPzItNUPNeso5gzBtXFMMsUMry3+/TLN+
 y+aZhIl75segxRZV8Pao8jm5L6EvBIDFc9kGCPU+3zSDoY50AAbAi0iNT
 pkYd5jAdCvgUqqn8r0Ot3cgvul+wLtishfKJLzoTp936VXRh6WIryU3+E
 dJ8/rHlAwQZ6cnr5VG3krW15LZDPw0UCEggbF+zOpV4eXVlZJgfy+4z+Q A==;
IronPort-SDR: ILl/erqFiLfvQUv1rKJji6LkR+DE+mdlqdcv4LTbx0B+x/GqY/+R4JVJOXWPE780Uo/7g0m6+o
 DmK4LfmvCGsNSVP9ZPU0ZJ977MCYnqwv6PH2tT6aN3B1wfNedOmFGYxoinOrBNiVkLMoLluTBp
 WgHD1uMBF8aMLaV0EXWK8V8qYwNw7jh51fnRwvMS00M9LCSqdYn7csjoCSm1DlBrW5+HWZGMIw
 7ctSxFcdaxjlBFzT2SRukwAUE3y8c+uUHg1A3sr1NZaqmA6vNT9Y++p7aGSmDiCjPck44zF8lv
 zAI=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735433"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:21:16 +0800
IronPort-SDR: nI6tFoZ1YyaoGBhlMYNtvi+1O/AWIsyNC7gXyTK5u6Cz5TYHGVzk2Ayp+j5bX2v8kHOCDCqDfK
 BAQRJUNIszLqPvUkn2NjMBg00sbH3AHtmp0hDtpF/sosiErhOURvM0313fhJp3gpm0iasODwqp
 dDwZoLPN6qDIvb54sDDmRlZpL0JC2DhEE8x6In8dYfivqs6qUURFtIJ+MceYsIO29E9d1EOlu+
 SQjDJ2rKjVd/8UwtOygotmxIPu6zoikkUgqO2iinxYuA3LxjBOXI2S5Kg6J0tgDB7HLBFe4Qf4
 gFTCt6UoctI5Ow9AP8pkiXDo
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:01:16 -0700
IronPort-SDR: a4XpmkfakKpsSXPd1CgqWRhnI38+kT3US+VelVtyb6w2M4EvoUhQR4LDnSqkaQHlEs43uDWtdx
 OM51Rq2Q1t1JlJjXWCzTn6lSEKMYDqAWHYLgEyk3mfKxLcSFDD5CRLr3/Oo2iPsdWuJUMCpHKF
 hqCeT4x0GBLOk8I0FMmpTi2qV5Liw/C7e73COh37ddte1idNvQo/7MnXoS8TJnAwaYDgsPqNAv
 p9I391PrqnMi0IVn4XlYVxUvZRTFzQP7p4WF73a+kzfDYNloMtyHUR9orgIAvQNEtU7/IRzuue
 M4g=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:21:14 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 23/42] target/riscv: Add ePMP CSR access functions
Date: Tue, 11 May 2021 20:19:32 +1000
Message-Id: <20210511101951.165287-24-alistair.francis@wdc.com>
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


