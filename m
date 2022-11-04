Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A25861940B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 11:01:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqtWF-0003JD-64; Fri, 04 Nov 2022 06:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oqtVJ-0002TY-Pr
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 06:00:51 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oqtVE-0000vI-CT
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 06:00:48 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxPLfG4mRjw3sEAA--.3575S3;
 Fri, 04 Nov 2022 18:00:38 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxPuDC4mRjYmUNAA--.37849S10; 
 Fri, 04 Nov 2022 18:00:38 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, stefanha@gmail.com,
 Rui Wang <wangrui@loongson.cn>
Subject: [PULL v2 8/9] target/loongarch: Adjust the layout of hardware flags
 bit fields
Date: Fri,  4 Nov 2022 18:00:32 +0800
Message-Id: <20221104100033.3473980-9-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221104100033.3473980-1-gaosong@loongson.cn>
References: <20221104100033.3473980-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxPuDC4mRjYmUNAA--.37849S10
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXrW5Gw43Kr1xGw1kCF45ZFb_yoW5WF4kpF
 17CF17KF4UGrZ7Aas5Xa9xXr1UZr4rGr4xXayfK393Kr43Xrn5Xr4vqr9IgFWUGay09ry2
 vF4DAwn8CF48X3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bn8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E
 6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4IE7x
 kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
 6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
 8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE
 2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42
 xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF
 7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Rui Wang <wangrui@loongson.cn>

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Rui Wang <wangrui@loongson.cn>
Message-Id: <20221104040517.222059-2-wangrui@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu.h                             | 9 ++++++++-
 target/loongarch/insn_trans/trans_privileged.c.inc | 2 +-
 target/loongarch/translate.c                       | 6 +++++-
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index dbce176564..f482ad94fe 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -14,6 +14,7 @@
 #include "qemu/timer.h"
 #include "exec/memory.h"
 #include "hw/sysbus.h"
+#include "cpu-csr.h"
 
 #define IOCSRF_TEMP             0
 #define IOCSRF_NODECNT          1
@@ -391,6 +392,12 @@ static inline int cpu_mmu_index(CPULoongArchState *env, bool ifetch)
 #endif
 }
 
+/*
+ * LoongArch CPUs hardware flags.
+ */
+#define HW_FLAGS_PLV_MASK   R_CSR_CRMD_PLV_MASK  /* 0x03 */
+#define HW_FLAGS_CRMD_PG    R_CSR_CRMD_PG_MASK   /* 0x10 */
+
 static inline void cpu_get_tb_cpu_state(CPULoongArchState *env,
                                         target_ulong *pc,
                                         target_ulong *cs_base,
@@ -398,7 +405,7 @@ static inline void cpu_get_tb_cpu_state(CPULoongArchState *env,
 {
     *pc = env->pc;
     *cs_base = 0;
-    *flags = cpu_mmu_index(env, false);
+    *flags = env->CSR_CRMD & (R_CSR_CRMD_PLV_MASK | R_CSR_CRMD_PG_MASK);
 }
 
 void loongarch_cpu_list(void);
diff --git a/target/loongarch/insn_trans/trans_privileged.c.inc b/target/loongarch/insn_trans/trans_privileged.c.inc
index 9c4dcbfcfb..ff3a6d95ae 100644
--- a/target/loongarch/insn_trans/trans_privileged.c.inc
+++ b/target/loongarch/insn_trans/trans_privileged.c.inc
@@ -159,7 +159,7 @@ static const CSRInfo csr_info[] = {
 
 static bool check_plv(DisasContext *ctx)
 {
-    if (ctx->base.tb->flags == MMU_USER_IDX) {
+    if (ctx->mem_idx == MMU_USER_IDX) {
         generate_exception(ctx, EXCCODE_IPE);
         return true;
     }
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 6091772349..31462b2b61 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -75,7 +75,11 @@ static void loongarch_tr_init_disas_context(DisasContextBase *dcbase,
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
     ctx->page_start = ctx->base.pc_first & TARGET_PAGE_MASK;
-    ctx->mem_idx = ctx->base.tb->flags;
+    if (ctx->base.tb->flags & HW_FLAGS_CRMD_PG) {
+        ctx->mem_idx = ctx->base.tb->flags & HW_FLAGS_PLV_MASK;
+    } else {
+        ctx->mem_idx = MMU_DA_IDX;
+    }
 
     /* Bound the number of insns to execute to those left on the page.  */
     bound = -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
-- 
2.31.1


