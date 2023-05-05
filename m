Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 379DD6F7A78
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:14:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujuu-000093-LG; Thu, 04 May 2023 21:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujui-0008LG-7R
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:13 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujud-0007wU-EZ
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:10 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1ab267e3528so8676475ad.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248825; x=1685840825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9GsRgbG59YHzRaQ19aeOdQ0BEV/yRG7KWuiP+B9mq64=;
 b=PLb6uwTGWRB35vb7m7/vFcIlZkR1Exz5ScqjMfS2zXq0xyW/yVs9SQaz+piaAOtlfB
 r8joZP4LmZ1VwIRk69wYng082LEGbvCdjqTunIb4Aq+3Z3/plzoCTTVx6Y5R74pSIBtz
 PLA87mCSeElON3/5J5JbXgZxDWeeSaEWfPhakv80O6D6tAoSKRMVW9u1d8+OYLvIilal
 zJ6HIgwsoAhBbR4Q+Z0LoaZm1DsEJXnnULxWvamL3S5ca8tSrMUha+2ogJtdpsdlUukn
 F0+cZLR/dcrYatxlyGYXNAcRhF+lCGI0PKKoVBLyDY/OFzOEH8pNnC4j9kSQcg3FDtdI
 Pl4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248825; x=1685840825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9GsRgbG59YHzRaQ19aeOdQ0BEV/yRG7KWuiP+B9mq64=;
 b=jxydn7mv06801Y9ZJ7Vgx3LNYC/iqGU8HIxG3UhaH1g3q6oh+Yo5+4lj3zwrjh3SeV
 JWiQ2WL2zlBLmvqXUcq52HUsWosMAdX6LMDKMpZSVyiqMEyjHdGs1wZAFOyN0HtNgMZ2
 FNQeUMnB6tT3pbOPQo54ZSjh7o57/+sdxHOuGxIDaYQRTOQKOYI5/ZCZzDTCvdQ+bZb6
 3XEHwdVFAUnxT8PxZqL6ej4Bo0ette/DZy7jkaAuyjA0ljhS8hMXtb3kELRfg6wQJcwp
 rVBRstLbDo3r37pTAEfA9bodeOezH77YNORRkFaudhfuDHSmQRC3rp5XYqKYm2Re6VrQ
 Al3g==
X-Gm-Message-State: AC+VfDzfxO7nb7BXH/TwPV+PHFdptaEXhxCApAYqgVDyBcqoO5Kh5C8f
 oQg4nFODtr+Bq51hCJ84kJY7tnWfUZw/SA==
X-Google-Smtp-Source: ACHHUZ5ZxSZinE4iRKm2rflVICYI6VEaVyuPU/Cq97KSigrpIgjruU9XVJkgo2L8QtiMWBe4mZ5SRw==
X-Received: by 2002:a17:902:e551:b0:1ac:3ddf:2299 with SMTP id
 n17-20020a170902e55100b001ac3ddf2299mr625042plf.44.1683248825116; 
 Thu, 04 May 2023 18:07:05 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:07:04 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 66/89] target/riscv: Handle HLV, HSV via helpers
Date: Fri,  5 May 2023 11:02:18 +1000
Message-Id: <20230505010241.21812-67-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Implement these instructions via helpers, in expectation
of determining the mmu_idx to use at runtime.  This allows
the permission check to also be moved out of line, which
allows HLSX to be removed from TB_FLAGS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-11-richard.henderson@linaro.org>
Message-Id: <20230412114333.118895-11-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                      |   6 +-
 target/riscv/helper.h                   |  12 ++-
 target/riscv/cpu_helper.c               |  26 ++---
 target/riscv/op_helper.c                |  99 ++++++++++++++++--
 target/riscv/translate.c                |   2 -
 target/riscv/insn_trans/trans_rvh.c.inc | 129 ++++++++++--------------
 6 files changed, 165 insertions(+), 109 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6239c99f4c..35cf2e2691 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -639,8 +639,7 @@ FIELD(TB_FLAGS, LMUL, 7, 3)
 FIELD(TB_FLAGS, SEW, 10, 3)
 FIELD(TB_FLAGS, VL_EQ_VLMAX, 13, 1)
 FIELD(TB_FLAGS, VILL, 14, 1)
-/* Is a Hypervisor instruction load/store allowed? */
-FIELD(TB_FLAGS, HLSX, 15, 1)
+FIELD(TB_FLAGS, VSTART_EQ_ZERO, 15, 1)
 /* The combination of MXL/SXL/UXL that applies to the current cpu mode. */
 FIELD(TB_FLAGS, XL, 16, 2)
 /* If PointerMasking should be applied */
@@ -652,8 +651,7 @@ FIELD(TB_FLAGS, VMA, 21, 1)
 FIELD(TB_FLAGS, ITRIGGER, 22, 1)
 /* Virtual mode enabled */
 FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)
-FIELD(TB_FLAGS, VSTART_EQ_ZERO, 24, 1)
-FIELD(TB_FLAGS, PRIV, 25, 2)
+FIELD(TB_FLAGS, PRIV, 24, 2)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 1880e95c50..98e97810fd 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -123,8 +123,16 @@ DEF_HELPER_1(itrigger_match, void, env)
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_1(hyp_tlb_flush, void, env)
 DEF_HELPER_1(hyp_gvma_tlb_flush, void, env)
-DEF_HELPER_2(hyp_hlvx_hu, tl, env, tl)
-DEF_HELPER_2(hyp_hlvx_wu, tl, env, tl)
+DEF_HELPER_FLAGS_2(hyp_hlv_bu, TCG_CALL_NO_WG, tl, env, tl)
+DEF_HELPER_FLAGS_2(hyp_hlv_hu, TCG_CALL_NO_WG, tl, env, tl)
+DEF_HELPER_FLAGS_2(hyp_hlv_wu, TCG_CALL_NO_WG, tl, env, tl)
+DEF_HELPER_FLAGS_2(hyp_hlv_d, TCG_CALL_NO_WG, tl, env, tl)
+DEF_HELPER_FLAGS_2(hyp_hlvx_hu, TCG_CALL_NO_WG, tl, env, tl)
+DEF_HELPER_FLAGS_2(hyp_hlvx_wu, TCG_CALL_NO_WG, tl, env, tl)
+DEF_HELPER_FLAGS_3(hyp_hsv_b, TCG_CALL_NO_WG, void, env, tl, tl)
+DEF_HELPER_FLAGS_3(hyp_hsv_h, TCG_CALL_NO_WG, void, env, tl, tl)
+DEF_HELPER_FLAGS_3(hyp_hsv_w, TCG_CALL_NO_WG, void, env, tl, tl)
+DEF_HELPER_FLAGS_3(hyp_hsv_d, TCG_CALL_NO_WG, void, env, tl, tl)
 #endif
 
 /* Vector functions */
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 174a77706b..abf275d2c6 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -102,24 +102,16 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     fs = get_field(env->mstatus, MSTATUS_FS);
     vs = get_field(env->mstatus, MSTATUS_VS);
 
-    if (riscv_has_ext(env, RVH)) {
-        if (env->priv == PRV_M ||
-            (env->priv == PRV_S && !env->virt_enabled) ||
-            (env->priv == PRV_U && !env->virt_enabled &&
-             get_field(env->hstatus, HSTATUS_HU))) {
-            flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
-        }
-
-        if (env->virt_enabled) {
-            flags = FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED, 1);
-            /*
-             * Merge DISABLED and !DIRTY states using MIN.
-             * We will set both fields when dirtying.
-             */
-            fs = MIN(fs, get_field(env->mstatus_hs, MSTATUS_FS));
-            vs = MIN(vs, get_field(env->mstatus_hs, MSTATUS_VS));
-        }
+    if (env->virt_enabled) {
+        flags = FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED, 1);
+        /*
+         * Merge DISABLED and !DIRTY states using MIN.
+         * We will set both fields when dirtying.
+         */
+        fs = MIN(fs, get_field(env->mstatus_hs, MSTATUS_FS));
+        vs = MIN(vs, get_field(env->mstatus_hs, MSTATUS_VS));
     }
+
     if (cpu->cfg.debug && !icount_enabled()) {
         flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
     }
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 49179e7a5a..7f83395370 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -427,6 +427,91 @@ void helper_hyp_gvma_tlb_flush(CPURISCVState *env)
     helper_hyp_tlb_flush(env);
 }
 
+static int check_access_hlsv(CPURISCVState *env, bool x, uintptr_t ra)
+{
+    if (env->priv == PRV_M) {
+        /* always allowed */
+    } else if (env->virt_enabled) {
+        riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, ra);
+    } else if (env->priv == PRV_U && !get_field(env->hstatus, HSTATUS_HU)) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
+    }
+
+    return cpu_mmu_index(env, x) | MMU_HYP_ACCESS_BIT;
+}
+
+target_ulong helper_hyp_hlv_bu(CPURISCVState *env, target_ulong addr)
+{
+    uintptr_t ra = GETPC();
+    int mmu_idx = check_access_hlsv(env, false, ra);
+    MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
+
+    return cpu_ldb_mmu(env, addr, oi, ra);
+}
+
+target_ulong helper_hyp_hlv_hu(CPURISCVState *env, target_ulong addr)
+{
+    uintptr_t ra = GETPC();
+    int mmu_idx = check_access_hlsv(env, false, ra);
+    MemOpIdx oi = make_memop_idx(MO_TEUW, mmu_idx);
+
+    return cpu_ldw_mmu(env, addr, oi, ra);
+}
+
+target_ulong helper_hyp_hlv_wu(CPURISCVState *env, target_ulong addr)
+{
+    uintptr_t ra = GETPC();
+    int mmu_idx = check_access_hlsv(env, false, ra);
+    MemOpIdx oi = make_memop_idx(MO_TEUL, mmu_idx);
+
+    return cpu_ldl_mmu(env, addr, oi, ra);
+}
+
+target_ulong helper_hyp_hlv_d(CPURISCVState *env, target_ulong addr)
+{
+    uintptr_t ra = GETPC();
+    int mmu_idx = check_access_hlsv(env, false, ra);
+    MemOpIdx oi = make_memop_idx(MO_TEUQ, mmu_idx);
+
+    return cpu_ldq_mmu(env, addr, oi, ra);
+}
+
+void helper_hyp_hsv_b(CPURISCVState *env, target_ulong addr, target_ulong val)
+{
+    uintptr_t ra = GETPC();
+    int mmu_idx = check_access_hlsv(env, false, ra);
+    MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
+
+    cpu_stb_mmu(env, addr, val, oi, ra);
+}
+
+void helper_hyp_hsv_h(CPURISCVState *env, target_ulong addr, target_ulong val)
+{
+    uintptr_t ra = GETPC();
+    int mmu_idx = check_access_hlsv(env, false, ra);
+    MemOpIdx oi = make_memop_idx(MO_TEUW, mmu_idx);
+
+    cpu_stw_mmu(env, addr, val, oi, ra);
+}
+
+void helper_hyp_hsv_w(CPURISCVState *env, target_ulong addr, target_ulong val)
+{
+    uintptr_t ra = GETPC();
+    int mmu_idx = check_access_hlsv(env, false, ra);
+    MemOpIdx oi = make_memop_idx(MO_TEUL, mmu_idx);
+
+    cpu_stl_mmu(env, addr, val, oi, ra);
+}
+
+void helper_hyp_hsv_d(CPURISCVState *env, target_ulong addr, target_ulong val)
+{
+    uintptr_t ra = GETPC();
+    int mmu_idx = check_access_hlsv(env, false, ra);
+    MemOpIdx oi = make_memop_idx(MO_TEUQ, mmu_idx);
+
+    cpu_stq_mmu(env, addr, val, oi, ra);
+}
+
 /*
  * TODO: These implementations are not quite correct.  They perform the
  * access using execute permission just fine, but the final PMP check
@@ -434,20 +519,22 @@ void helper_hyp_gvma_tlb_flush(CPURISCVState *env)
  * a fair fraction of cputlb.c, fixing this requires adding new mmu_idx
  * which would imply that exact check in tlb_fill.
  */
-target_ulong helper_hyp_hlvx_hu(CPURISCVState *env, target_ulong address)
+target_ulong helper_hyp_hlvx_hu(CPURISCVState *env, target_ulong addr)
 {
-    int mmu_idx = cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;
+    uintptr_t ra = GETPC();
+    int mmu_idx = check_access_hlsv(env, true, ra);
     MemOpIdx oi = make_memop_idx(MO_TEUW, mmu_idx);
 
-    return cpu_ldw_code_mmu(env, address, oi, GETPC());
+    return cpu_ldw_code_mmu(env, addr, oi, GETPC());
 }
 
-target_ulong helper_hyp_hlvx_wu(CPURISCVState *env, target_ulong address)
+target_ulong helper_hyp_hlvx_wu(CPURISCVState *env, target_ulong addr)
 {
-    int mmu_idx = cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;
+    uintptr_t ra = GETPC();
+    int mmu_idx = check_access_hlsv(env, true, ra);
     MemOpIdx oi = make_memop_idx(MO_TEUL, mmu_idx);
 
-    return cpu_ldl_code_mmu(env, address, oi, GETPC());
+    return cpu_ldl_code_mmu(env, addr, oi, ra);
 }
 
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6d59348f0c..928da0d3f0 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -80,7 +80,6 @@ typedef struct DisasContext {
     bool virt_inst_excp;
     bool virt_enabled;
     const RISCVCPUConfig *cfg_ptr;
-    bool hlsx;
     /* vector extension */
     bool vill;
     /*
@@ -1163,7 +1162,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->misa_ext = env->misa_ext;
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->cfg_ptr = &(cpu->cfg);
-    ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
     ctx->vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
     ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
     ctx->lmul = sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3);
diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_trans/trans_rvh.c.inc
index ae98b45e5e..3e9322130f 100644
--- a/target/riscv/insn_trans/trans_rvh.c.inc
+++ b/target/riscv/insn_trans/trans_rvh.c.inc
@@ -16,158 +16,131 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef CONFIG_USER_ONLY
-static bool check_access(DisasContext *ctx)
-{
-    if (!ctx->hlsx) {
-        tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
-                       offsetof(CPURISCVState, bins));
-        if (ctx->virt_enabled) {
-            generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT);
-        } else {
-            generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
-        }
-        return false;
-    }
+#ifdef CONFIG_USER_ONLY
+#define do_hlv(ctx, a, func)  false
+#define do_hsv(ctx, a, func)  false
+#else
+static void gen_helper_hyp_hlv_b(TCGv r, TCGv_env e, TCGv a)
+{
+    gen_helper_hyp_hlv_bu(r, e, a);
+    tcg_gen_ext8s_tl(r, r);
+}
+
+static void gen_helper_hyp_hlv_h(TCGv r, TCGv_env e, TCGv a)
+{
+    gen_helper_hyp_hlv_hu(r, e, a);
+    tcg_gen_ext16s_tl(r, r);
+}
+
+static void gen_helper_hyp_hlv_w(TCGv r, TCGv_env e, TCGv a)
+{
+    gen_helper_hyp_hlv_wu(r, e, a);
+    tcg_gen_ext32s_tl(r, r);
+}
+
+static bool do_hlv(DisasContext *ctx, arg_r2 *a,
+                   void (*func)(TCGv, TCGv_env, TCGv))
+{
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    decode_save_opc(ctx);
+    func(dest, cpu_env, addr);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
-#endif
 
-static bool do_hlv(DisasContext *ctx, arg_r2 *a, MemOp mop)
+static bool do_hsv(DisasContext *ctx, arg_r2_s *a,
+                   void (*func)(TCGv_env, TCGv, TCGv))
 {
-#ifdef CONFIG_USER_ONLY
-    return false;
-#else
+    TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv data = get_gpr(ctx, a->rs2, EXT_NONE);
+
     decode_save_opc(ctx);
-    if (check_access(ctx)) {
-        TCGv dest = dest_gpr(ctx, a->rd);
-        TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
-        int mem_idx = ctx->mem_idx | MMU_HYP_ACCESS_BIT;
-        tcg_gen_qemu_ld_tl(dest, addr, mem_idx, mop);
-        gen_set_gpr(ctx, a->rd, dest);
-    }
+    func(cpu_env, addr, data);
     return true;
-#endif
 }
+#endif /* CONFIG_USER_ONLY */
 
 static bool trans_hlv_b(DisasContext *ctx, arg_hlv_b *a)
 {
     REQUIRE_EXT(ctx, RVH);
-    return do_hlv(ctx, a, MO_SB);
+    return do_hlv(ctx, a, gen_helper_hyp_hlv_b);
 }
 
 static bool trans_hlv_h(DisasContext *ctx, arg_hlv_h *a)
 {
     REQUIRE_EXT(ctx, RVH);
-    return do_hlv(ctx, a, MO_TESW);
+    return do_hlv(ctx, a, gen_helper_hyp_hlv_h);
 }
 
 static bool trans_hlv_w(DisasContext *ctx, arg_hlv_w *a)
 {
     REQUIRE_EXT(ctx, RVH);
-    return do_hlv(ctx, a, MO_TESL);
+    return do_hlv(ctx, a, gen_helper_hyp_hlv_w);
 }
 
 static bool trans_hlv_bu(DisasContext *ctx, arg_hlv_bu *a)
 {
     REQUIRE_EXT(ctx, RVH);
-    return do_hlv(ctx, a, MO_UB);
+    return do_hlv(ctx, a, gen_helper_hyp_hlv_bu);
 }
 
 static bool trans_hlv_hu(DisasContext *ctx, arg_hlv_hu *a)
 {
     REQUIRE_EXT(ctx, RVH);
-    return do_hlv(ctx, a, MO_TEUW);
-}
-
-static bool do_hsv(DisasContext *ctx, arg_r2_s *a, MemOp mop)
-{
-#ifdef CONFIG_USER_ONLY
-    return false;
-#else
-    decode_save_opc(ctx);
-    if (check_access(ctx)) {
-        TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
-        TCGv data = get_gpr(ctx, a->rs2, EXT_NONE);
-        int mem_idx = ctx->mem_idx | MMU_HYP_ACCESS_BIT;
-        tcg_gen_qemu_st_tl(data, addr, mem_idx, mop);
-    }
-    return true;
-#endif
+    return do_hlv(ctx, a, gen_helper_hyp_hlv_hu);
 }
 
 static bool trans_hsv_b(DisasContext *ctx, arg_hsv_b *a)
 {
     REQUIRE_EXT(ctx, RVH);
-    return do_hsv(ctx, a, MO_SB);
+    return do_hsv(ctx, a, gen_helper_hyp_hsv_b);
 }
 
 static bool trans_hsv_h(DisasContext *ctx, arg_hsv_h *a)
 {
     REQUIRE_EXT(ctx, RVH);
-    return do_hsv(ctx, a, MO_TESW);
+    return do_hsv(ctx, a, gen_helper_hyp_hsv_h);
 }
 
 static bool trans_hsv_w(DisasContext *ctx, arg_hsv_w *a)
 {
     REQUIRE_EXT(ctx, RVH);
-    return do_hsv(ctx, a, MO_TESL);
+    return do_hsv(ctx, a, gen_helper_hyp_hsv_w);
 }
 
 static bool trans_hlv_wu(DisasContext *ctx, arg_hlv_wu *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVH);
-    return do_hlv(ctx, a, MO_TEUL);
+    return do_hlv(ctx, a, gen_helper_hyp_hlv_wu);
 }
 
 static bool trans_hlv_d(DisasContext *ctx, arg_hlv_d *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVH);
-    return do_hlv(ctx, a, MO_TEUQ);
+    return do_hlv(ctx, a, gen_helper_hyp_hlv_d);
 }
 
 static bool trans_hsv_d(DisasContext *ctx, arg_hsv_d *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVH);
-    return do_hsv(ctx, a, MO_TEUQ);
-}
-
-#ifndef CONFIG_USER_ONLY
-static bool do_hlvx(DisasContext *ctx, arg_r2 *a,
-                    void (*func)(TCGv, TCGv_env, TCGv))
-{
-    decode_save_opc(ctx);
-    if (check_access(ctx)) {
-        TCGv dest = dest_gpr(ctx, a->rd);
-        TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
-        func(dest, cpu_env, addr);
-        gen_set_gpr(ctx, a->rd, dest);
-    }
-    return true;
+    return do_hsv(ctx, a, gen_helper_hyp_hsv_d);
 }
-#endif
 
 static bool trans_hlvx_hu(DisasContext *ctx, arg_hlvx_hu *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    return do_hlvx(ctx, a, gen_helper_hyp_hlvx_hu);
-#else
-    return false;
-#endif
+    return do_hlv(ctx, a, gen_helper_hyp_hlvx_hu);
 }
 
 static bool trans_hlvx_wu(DisasContext *ctx, arg_hlvx_wu *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    return do_hlvx(ctx, a, gen_helper_hyp_hlvx_wu);
-#else
-    return false;
-#endif
+    return do_hlv(ctx, a, gen_helper_hyp_hlvx_wu);
 }
 
 static bool trans_hfence_gvma(DisasContext *ctx, arg_sfence_vma *a)
-- 
2.40.0


