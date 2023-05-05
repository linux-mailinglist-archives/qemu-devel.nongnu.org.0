Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC326F7A7F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:16:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujul-0007fa-OT; Thu, 04 May 2023 21:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujuR-0007Fq-GE
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:55 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujuN-0007tq-Ql
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:55 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1aaf21bb42bso8126295ad.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248810; x=1685840810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/1DiLPivEPqQjktvYFeG5k60WWY9PrwUsIUMOZUW7Jw=;
 b=WoY5WoT8ORYzcqyd/uDPqYmK7HHoqUenQTa1yb27sXUYVGzZnr06O/i2SXMKxXA0r2
 HSuscHJxbLbS1C5EN6ScfRzxqkcbj6MJ0iOimpW99u6pWrziu19OgutWyf7HoyAw5CsA
 wLHY1zHRVHc/NtXH7slFyjq9W4N3vwak5wGnqQ6k1mX9BIks2wRPkCiZk+FskMbP0eot
 IjTvA6TKzaeTWqlZf49/sJbPqj1QqmSugorKPzg50arfReRVNIBCOwHKW48qaoWsM3pE
 rs0Z2XQ1BX1ERdzQlO5CKOc+yp5AEJhBIunV3N4oGD/M4Cm1VJtil+Bwj/HzuaVlX6/9
 QgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248810; x=1685840810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/1DiLPivEPqQjktvYFeG5k60WWY9PrwUsIUMOZUW7Jw=;
 b=eYGRmvXk6fjRqkyKrMqBdO+Rb7dCta8iuSoNZvuCtiATbHbmo65uKPEZKN7zyM5DrW
 DNRIg7SPBexwUEv1hE5cF0XBMccNCd1nNEH+VAgwSQWJuv+WeC53XlX2CwnmQYvfK6Qp
 omvr3TGGmAwPla31uIyKmGv9LqXDm9dzSI3zq0X00phBXuBpFb9Lvp6jRARyZRGiiV8M
 BUolxnN+lh8tHaMOcBSIy2Gj+vH+1SQoPrKz84dv+v8jER1BL2e3Qy1CpX0c9iA5YiFE
 vlyUXoLFLwRx+8Zj3ZIhFVy5fMt8Vsn4Ph63JnU2Us74Mm2KU6dYK35Fx8ZGjd0ZbI9y
 l0/w==
X-Gm-Message-State: AC+VfDxs9y8yp4XSjy28ibU5qBe7L2fVyW3tpu2bckXhYAUcCz26Sdui
 FvwFokS3oRsulV8fE9sc5K66n8C4rAiH2Q==
X-Google-Smtp-Source: ACHHUZ4Y51PavqVG1Z9+Y5gc3H5TTyJ8X+ADPt0vAfsiW0mDmx1pq0+YM3AOUKdskjzt4PfzlRrSFg==
X-Received: by 2002:a17:902:9a03:b0:1ab:2b41:613 with SMTP id
 v3-20020a1709029a0300b001ab2b410613mr5325985plp.32.1683248810216; 
 Thu, 04 May 2023 18:06:50 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:06:49 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 62/89] target/riscv: Add a tb flags field for vstart
Date: Fri,  5 May 2023 11:02:14 +1000
Message-Id: <20230505010241.21812-63-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x632.google.com
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

From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Once we mistook the vstart directly from the env->vstart. As env->vstart is not
a constant, we should record it in the tb flags if we want to use
it in translation.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Message-Id: <20230324143031.1093-5-zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-6-richard.henderson@linaro.org>
Message-Id: <20230412114333.118895-6-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                      |  1 +
 target/riscv/cpu_helper.c               |  1 +
 target/riscv/translate.c                |  4 ++--
 target/riscv/insn_trans/trans_rvv.c.inc | 14 +++++++-------
 4 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ab64d5f92d..786ad047ee 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -655,6 +655,7 @@ FIELD(TB_FLAGS, VMA, 21, 1)
 FIELD(TB_FLAGS, ITRIGGER, 22, 1)
 /* Virtual mode enabled */
 FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)
+FIELD(TB_FLAGS, VSTART_EQ_ZERO, 24, 1)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e3e620137b..7579e83c3d 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -74,6 +74,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
                            FIELD_EX64(env->vtype, VTYPE, VTA));
         flags = FIELD_DP32(flags, TB_FLAGS, VMA,
                            FIELD_EX64(env->vtype, VTYPE, VMA));
+        flags = FIELD_DP32(flags, TB_FLAGS, VSTART_EQ_ZERO, env->vstart == 0);
     } else {
         flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
     }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 3092c942ab..3ab8a9999e 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -99,7 +99,7 @@ typedef struct DisasContext {
     uint8_t vta;
     uint8_t vma;
     bool cfg_vta_all_1s;
-    target_ulong vstart;
+    bool vstart_eq_zero;
     bool vl_eq_vlmax;
     CPUState *cs;
     TCGv zero;
@@ -1168,7 +1168,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->vta = FIELD_EX32(tb_flags, TB_FLAGS, VTA) && cpu->cfg.rvv_ta_all_1s;
     ctx->vma = FIELD_EX32(tb_flags, TB_FLAGS, VMA) && cpu->cfg.rvv_ma_all_1s;
     ctx->cfg_vta_all_1s = cpu->cfg.rvv_ta_all_1s;
-    ctx->vstart = env->vstart;
+    ctx->vstart_eq_zero = FIELD_EX32(tb_flags, TB_FLAGS, VSTART_EQ_ZERO);
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
     ctx->misa_mxl_max = env->misa_mxl_max;
     ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index ecbdf1b3d7..6c07eebc52 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -547,7 +547,7 @@ static bool vext_check_sds(DisasContext *s, int vd, int vs1, int vs2, int vm)
  */
 static bool vext_check_reduction(DisasContext *s, int vs2)
 {
-    return require_align(vs2, s->lmul) && (s->vstart == 0);
+    return require_align(vs2, s->lmul) && s->vstart_eq_zero;
 }
 
 /*
@@ -3083,7 +3083,7 @@ static bool trans_vcpop_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s) &&
-        s->vstart == 0) {
+        s->vstart_eq_zero) {
         TCGv_ptr src2, mask;
         TCGv dst;
         TCGv_i32 desc;
@@ -3112,7 +3112,7 @@ static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s) &&
-        s->vstart == 0) {
+        s->vstart_eq_zero) {
         TCGv_ptr src2, mask;
         TCGv dst;
         TCGv_i32 desc;
@@ -3148,7 +3148,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         vext_check_isa_ill(s) &&                                   \
         require_vm(a->vm, a->rd) &&                                \
         (a->rd != a->rs2) &&                                       \
-        (s->vstart == 0)) {                                        \
+        s->vstart_eq_zero) {                                       \
         uint32_t data = 0;                                         \
         gen_helper_gvec_3_ptr *fn = gen_helper_##NAME;             \
         TCGLabel *over = gen_new_label();                          \
@@ -3189,7 +3189,7 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
         !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs2, 1) &&
         require_vm(a->vm, a->rd) &&
         require_align(a->rd, s->lmul) &&
-        (s->vstart == 0)) {
+        s->vstart_eq_zero) {
         uint32_t data = 0;
         TCGLabel *over = gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -3638,7 +3638,7 @@ static bool vcompress_vm_check(DisasContext *s, arg_r *a)
            require_align(a->rs2, s->lmul) &&
            (a->rd != a->rs2) &&
            !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs1, 1) &&
-           (s->vstart == 0);
+           s->vstart_eq_zero;
 }
 
 static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
@@ -3677,7 +3677,7 @@ static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               \
         QEMU_IS_ALIGNED(a->rd, LEN) &&                                  \
         QEMU_IS_ALIGNED(a->rs2, LEN)) {                                 \
         uint32_t maxsz = (s->cfg_ptr->vlen >> 3) * LEN;                 \
-        if (s->vstart == 0) {                                           \
+        if (s->vstart_eq_zero) {                                        \
             /* EEW = 8 */                                               \
             tcg_gen_gvec_mov(MO_8, vreg_ofs(s, a->rd),                  \
                              vreg_ofs(s, a->rs2), maxsz, maxsz);        \
-- 
2.40.0


