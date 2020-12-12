Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7074F2D8959
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 19:47:11 +0100 (CET)
Received: from localhost ([::1]:51170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ko9vC-00077z-GF
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 13:47:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ko9Tr-0000Vd-DQ
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:18:55 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:39277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ko9To-00023Z-M2
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:18:55 -0500
Received: from localhost.localdomain ([82.252.152.214]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1My6xz-1juYZs1ANj-00zYCp; Sat, 12 Dec 2020 18:55:03 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] target/m68k: Add vmstate definition for M68kCPU
Date: Sat, 12 Dec 2020 18:54:57 +0100
Message-Id: <20201212175458.259960-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201212175458.259960-1-laurent@vivier.eu>
References: <20201212175458.259960-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HrF8PlKqVXGueK0dRslluoWCRueBzoDGCfOpRcDodPajowpyMTX
 Zujg3zubD4hcLiiSCo75HbIlbRGsPL6YOdufgcwNgTwUs8Sl9BP8xewnzxxAzHUn2gcWwSx
 bu8wscr/Zwe7y7hS2gpy6XV2d+ithqOo3bQgy0S06xHkzFGAlTCmZYb0NHwUNTDVKA1oszy
 Q/WMnw5FVjgXDJUliGTSQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sB71npsFM8g=:DaBp3/71rlA/rCL5uaEGDe
 yMy59W268cMfvcd61cAFfYZ1SuO5QakS/e1AQcW4GQ8xXb0dhPMRkS7fnLuTxl7OjuxosDWRQ
 5b7bxWy8IJSvBs/WibTY4Q6gHlNdLkaqYuQWRHtIocx+MrTyTlmUIOy7xSlHA7SLJ2Z/78VPs
 OrMv7iATzjzeulE27TogC+2peReRJyGwYWXJguz5CurD8X/LFj6qYWcr6pW2w5c8WWGMJMrTL
 7PLn4yay6ANUUy0RQiM5rdg0NAJpjeVBsEGaiChm5cwG7p9FF4yAkT7CkE8VM1Zf2vR7bwGZY
 54PBgc6422frr+vnGeGSRK8lKtCb/3w12ZlsOkO0EGGPpquxlNERRm2qU+rufX9vzTGl6lEF8
 S3aitcB/llNG0maQYc5KLLziAPHLe+iBUSufshRRqKMXiZufpTYSqWJ2JqNayg3QD8t5xZqYS
 VBwWL/pIVw==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20201022203000.1922749-3-laurent@vivier.eu>
---
 target/m68k/cpu.h        |   1 +
 target/m68k/cpu.c        | 193 ++++++++++++++++++++++++++++++++++++++-
 target/m68k/fpu_helper.c |  10 +-
 3 files changed, 198 insertions(+), 6 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 9a6f0400fcfe..de5b9875fea3 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -179,6 +179,7 @@ int cpu_m68k_signal_handler(int host_signum, void *pinfo,
 uint32_t cpu_m68k_get_ccr(CPUM68KState *env);
 void cpu_m68k_set_ccr(CPUM68KState *env, uint32_t);
 void cpu_m68k_set_sr(CPUM68KState *env, uint32_t);
+void cpu_m68k_restore_fp_status(CPUM68KState *env);
 void cpu_m68k_set_fpcr(CPUM68KState *env, uint32_t val);
 
 
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 72c545149e9b..b811a0bdde2d 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -260,10 +260,198 @@ static void m68k_cpu_initfn(Object *obj)
     cpu_set_cpustate_pointers(cpu);
 }
 
+#if defined(CONFIG_SOFTMMU)
+static bool fpu_needed(void *opaque)
+{
+    M68kCPU *s = opaque;
+
+    return m68k_feature(&s->env, M68K_FEATURE_CF_FPU) ||
+           m68k_feature(&s->env, M68K_FEATURE_FPU);
+}
+
+typedef struct m68k_FPReg_tmp {
+    FPReg *parent;
+    uint64_t tmp_mant;
+    uint16_t tmp_exp;
+} m68k_FPReg_tmp;
+
+static void cpu_get_fp80(uint64_t *pmant, uint16_t *pexp, floatx80 f)
+{
+    CPU_LDoubleU temp;
+
+    temp.d = f;
+    *pmant = temp.l.lower;
+    *pexp = temp.l.upper;
+}
+
+static floatx80 cpu_set_fp80(uint64_t mant, uint16_t upper)
+{
+    CPU_LDoubleU temp;
+
+    temp.l.upper = upper;
+    temp.l.lower = mant;
+    return temp.d;
+}
+
+static int freg_pre_save(void *opaque)
+{
+    m68k_FPReg_tmp *tmp = opaque;
+
+    cpu_get_fp80(&tmp->tmp_mant, &tmp->tmp_exp, tmp->parent->d);
+
+    return 0;
+}
+
+static int freg_post_load(void *opaque, int version)
+{
+    m68k_FPReg_tmp *tmp = opaque;
+
+    tmp->parent->d = cpu_set_fp80(tmp->tmp_mant, tmp->tmp_exp);
+
+    return 0;
+}
+
+static const VMStateDescription vmstate_freg_tmp = {
+    .name = "freg_tmp",
+    .post_load = freg_post_load,
+    .pre_save  = freg_pre_save,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(tmp_mant, m68k_FPReg_tmp),
+        VMSTATE_UINT16(tmp_exp, m68k_FPReg_tmp),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static const VMStateDescription vmstate_freg = {
+    .name = "freg",
+    .fields = (VMStateField[]) {
+        VMSTATE_WITH_TMP(FPReg, m68k_FPReg_tmp, vmstate_freg_tmp),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static int fpu_post_load(void *opaque, int version)
+{
+    M68kCPU *s = opaque;
+
+    cpu_m68k_restore_fp_status(&s->env);
+
+    return 0;
+}
+
+const VMStateDescription vmmstate_fpu = {
+    .name = "cpu/fpu",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = fpu_needed,
+    .post_load = fpu_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(env.fpcr, M68kCPU),
+        VMSTATE_UINT32(env.fpsr, M68kCPU),
+        VMSTATE_STRUCT_ARRAY(env.fregs, M68kCPU, 8, 0, vmstate_freg, FPReg),
+        VMSTATE_STRUCT(env.fp_result, M68kCPU, 0, vmstate_freg, FPReg),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool cf_spregs_needed(void *opaque)
+{
+    M68kCPU *s = opaque;
+
+    return m68k_feature(&s->env, M68K_FEATURE_CF_ISA_A);
+}
+
+const VMStateDescription vmstate_cf_spregs = {
+    .name = "cpu/cf_spregs",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = cf_spregs_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64_ARRAY(env.macc, M68kCPU, 4),
+        VMSTATE_UINT32(env.macsr, M68kCPU),
+        VMSTATE_UINT32(env.mac_mask, M68kCPU),
+        VMSTATE_UINT32(env.rambar0, M68kCPU),
+        VMSTATE_UINT32(env.mbar, M68kCPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool cpu_68040_mmu_needed(void *opaque)
+{
+    M68kCPU *s = opaque;
+
+    return m68k_feature(&s->env, M68K_FEATURE_M68040);
+}
+
+const VMStateDescription vmstate_68040_mmu = {
+    .name = "cpu/68040_mmu",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = cpu_68040_mmu_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(env.mmu.ar, M68kCPU),
+        VMSTATE_UINT32(env.mmu.ssw, M68kCPU),
+        VMSTATE_UINT16(env.mmu.tcr, M68kCPU),
+        VMSTATE_UINT32(env.mmu.urp, M68kCPU),
+        VMSTATE_UINT32(env.mmu.srp, M68kCPU),
+        VMSTATE_BOOL(env.mmu.fault, M68kCPU),
+        VMSTATE_UINT32_ARRAY(env.mmu.ttr, M68kCPU, 4),
+        VMSTATE_UINT32(env.mmu.mmusr, M68kCPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool cpu_68040_spregs_needed(void *opaque)
+{
+    M68kCPU *s = opaque;
+
+    return m68k_feature(&s->env, M68K_FEATURE_M68040);
+}
+
+const VMStateDescription vmstate_68040_spregs = {
+    .name = "cpu/68040_spregs",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = cpu_68040_spregs_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(env.vbr, M68kCPU),
+        VMSTATE_UINT32(env.cacr, M68kCPU),
+        VMSTATE_UINT32(env.sfc, M68kCPU),
+        VMSTATE_UINT32(env.dfc, M68kCPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_m68k_cpu = {
     .name = "cpu",
-    .unmigratable = 1,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields      = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(env.dregs, M68kCPU, 8),
+        VMSTATE_UINT32_ARRAY(env.aregs, M68kCPU, 8),
+        VMSTATE_UINT32(env.pc, M68kCPU),
+        VMSTATE_UINT32(env.sr, M68kCPU),
+        VMSTATE_INT32(env.current_sp, M68kCPU),
+        VMSTATE_UINT32_ARRAY(env.sp, M68kCPU, 3),
+        VMSTATE_UINT32(env.cc_op, M68kCPU),
+        VMSTATE_UINT32(env.cc_x, M68kCPU),
+        VMSTATE_UINT32(env.cc_n, M68kCPU),
+        VMSTATE_UINT32(env.cc_v, M68kCPU),
+        VMSTATE_UINT32(env.cc_c, M68kCPU),
+        VMSTATE_UINT32(env.cc_z, M68kCPU),
+        VMSTATE_INT32(env.pending_vector, M68kCPU),
+        VMSTATE_INT32(env.pending_level, M68kCPU),
+        VMSTATE_END_OF_LIST()
+    },
+    .subsections = (const VMStateDescription * []) {
+        &vmmstate_fpu,
+        &vmstate_cf_spregs,
+        &vmstate_68040_mmu,
+        &vmstate_68040_spregs,
+        NULL
+    },
 };
+#endif
 
 static void m68k_cpu_class_init(ObjectClass *c, void *data)
 {
@@ -287,13 +475,12 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
 #if defined(CONFIG_SOFTMMU)
     cc->do_transaction_failed = m68k_cpu_transaction_failed;
     cc->get_phys_page_debug = m68k_cpu_get_phys_page_debug;
+    dc->vmsd = &vmstate_m68k_cpu;
 #endif
     cc->disas_set_info = m68k_cpu_disas_set_info;
     cc->tcg_initialize = m68k_tcg_init;
 
     cc->gdb_num_core_regs = 18;
-
-    dc->vmsd = &vmstate_m68k_cpu;
 }
 
 static void m68k_cpu_class_init_cf_core(ObjectClass *c, void *data)
diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
index 9acf60dfd443..797000e7482c 100644
--- a/target/m68k/fpu_helper.c
+++ b/target/m68k/fpu_helper.c
@@ -135,10 +135,8 @@ static void restore_rounding_mode(CPUM68KState *env)
     }
 }
 
-void cpu_m68k_set_fpcr(CPUM68KState *env, uint32_t val)
+void cpu_m68k_restore_fp_status(CPUM68KState *env)
 {
-    env->fpcr = val & 0xffff;
-
     if (m68k_feature(env, M68K_FEATURE_CF_FPU)) {
         cf_restore_precision_mode(env);
     } else {
@@ -147,6 +145,12 @@ void cpu_m68k_set_fpcr(CPUM68KState *env, uint32_t val)
     restore_rounding_mode(env);
 }
 
+void cpu_m68k_set_fpcr(CPUM68KState *env, uint32_t val)
+{
+    env->fpcr = val & 0xffff;
+    cpu_m68k_restore_fp_status(env);
+}
+
 void HELPER(fitrunc)(CPUM68KState *env, FPReg *res, FPReg *val)
 {
     FloatRoundMode rounding_mode = get_float_rounding_mode(&env->fp_status);
-- 
2.29.2


