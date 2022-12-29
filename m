Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31033658FF5
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 18:39:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAwqx-0006wO-5K; Thu, 29 Dec 2022 12:38:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3cdCtYwgKCuwOPRiZfOgUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--abdulras.bounces.google.com>)
 id 1pAwqt-0006ug-0n
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 12:37:59 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3cdCtYwgKCuwOPRiZfOgUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--abdulras.bounces.google.com>)
 id 1pAwqq-0007QQ-Bf
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 12:37:58 -0500
Received: by mail-pj1-x1049.google.com with SMTP id
 a23-20020a17090a8c1700b002263980f032so543466pjo.5
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 09:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Cac1QtDTwybK/HIvFLlmk/EkE8UUKb1WJ/dIXW9vIrY=;
 b=KcKrh0cuGe3gzjkNVwN1jz+96VWZxkgUQfULKltU8gnN+ZP/HLnmowlWzgBvbDtm8H
 QtWckM84JnyekQ+dYCZQs74fS9v3yjXvGlL4v3JPIJsNK7fBGUCFK9ZLOjcb48B0q1Yh
 bdPZ/Z0xfPfncbaySogx2U6CBp7Ea6hx1OhTPMUaH08MCn3gplRHdTB8LLfpydv6I8ow
 iBilkeFYKe+HqCZTjYGlE6Xg1T10tsYXQWAy31X445dmTKvjmSs3C/GMv0zjKeEDOMhC
 B7C5LB942DfqPJPGGMKHJwYc+5VBzDlN9tVKmMduk00SBqRoy3EpYBOvdxNV3jUdlFo1
 dKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cac1QtDTwybK/HIvFLlmk/EkE8UUKb1WJ/dIXW9vIrY=;
 b=7iTGemJIUk8m8gUfV8hIhh/ZViyJf6WZjMQIE7ylNqoSCN4D1dneVLtKFupjK425Ig
 Wmt9L/5we1yePQWrtENAoFukOhpxOgJwPcmZeRdHJfx2Hpt8CtYIwR+92Vf91y+TfnLI
 KChcGaS9Z8+Q86K/CKvgfYAI+tsneBmC1+46CP9A/HyEynmmdNShFVTmWc4OHaQE95N1
 Ni0yrJgaisRt2bvI4r0irltdI5r6eAx57K9LW3riWTUyTsYjKVTuTNuyWcYgJ2B7qC1t
 3/ASKaQ4ZqPQEfTwgSYTJY4r3BGNOQJPJ/YdvULV2s2AOUYyhGOeLPeazSJkC/rDa6mV
 sMUA==
X-Gm-Message-State: AFqh2kpACUgowzTc7d16+NbzQNJvoXnlBj1UWR28d/CDQwCdLnRmiXXv
 tmsCEcYKmLb+j3UJviG2Jk+L2zUYev5qDwd8TOBrilnBY1Pl4u/srxAHCC0L4O+9MM4O8RFNRyh
 0sYw4HNwY6VPUt5R26ABRKCEuk8bCiUvsM2LQP/vIB/4LICcM4uOWZpki4yq9DcGHbA==
X-Google-Smtp-Source: AMrXdXs0XGZck+XZNjpnDAXlU998GuMzsoRsgSZ6pT7qrE61zlKNKTesiNPW81qWb7D21eX+iubEUbL7bYT0hw==
X-Received: from abdulras-llvm.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:219b])
 (user=abdulras job=sendgmr) by 2002:a17:90a:15c9:b0:219:8464:84e3 with SMTP
 id w9-20020a17090a15c900b00219846484e3mr2814907pjd.232.1672335473856; Thu, 29
 Dec 2022 09:37:53 -0800 (PST)
Date: Thu, 29 Dec 2022 17:37:43 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221229173743.123894-1-abdulras@google.com>
Subject: [PATCH] riscv: do not set the rounding mode via `gen_set_rm`
From: Saleem Abdulrasool <abdulras@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, frank.chang@sifive.com, 
 Saleem Abdulrasool <compnerd@compnerd.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3cdCtYwgKCuwOPRiZfOgUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--abdulras.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

From: Saleem Abdulrasool <compnerd@compnerd.org>

Setting the rounding mode via the `gen_set_rm` call would alter the
state of the disassembler, resetting the `TransOp` in the assembler
context.  When we subsequently set the rounding mode to the desired
value, we would trigger an assertion in `decode_save_opc`.  Instead
we can set the rounding mode via the `gen_helper_set_rounding_mode`
which will still trigger the exception in the case of an invalid RM
without altering the CPU disassembler state.

Signed-off-by: Saleem Abdulrasool <compnerd@compnerd.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 69 +++++++++++++------------
 1 file changed, 36 insertions(+), 33 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 4dea4413ae..73f6fab1c5 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2679,8 +2679,10 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
                     int rm)
 {
     if (checkfn(s, a)) {
+        // the helper will raise an exception if the rounding mode is invalid
         if (rm != RISCV_FRM_DYN) {
-            gen_set_rm(s, RISCV_FRM_DYN);
+            gen_helper_set_rounding_mode(cpu_env,
+                                         tcg_constant_i32(RISCV_FRM_DYN));
         }
 
         uint32_t data = 0;
@@ -3001,38 +3003,39 @@ static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
            require_scale_zve64f(s);
 }
 
-#define GEN_OPFV_NARROW_TRANS(NAME, CHECK, HELPER, FRM)            \
-static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
-{                                                                  \
-    if (CHECK(s, a)) {                                             \
-        if (FRM != RISCV_FRM_DYN) {                                \
-            gen_set_rm(s, RISCV_FRM_DYN);                          \
-        }                                                          \
-                                                                   \
-        uint32_t data = 0;                                         \
-        static gen_helper_gvec_3_ptr * const fns[2] = {            \
-            gen_helper_##HELPER##_h,                               \
-            gen_helper_##HELPER##_w,                               \
-        };                                                         \
-        TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, FRM);                                        \
-        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
-        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
-                                                                   \
-        data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
-        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
-        data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
-        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
-        tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
-                           vreg_ofs(s, a->rs2), cpu_env,           \
-                           s->cfg_ptr->vlen / 8,                   \
-                           s->cfg_ptr->vlen / 8, data,             \
-                           fns[s->sew - 1]);                       \
-        mark_vs_dirty(s);                                          \
-        gen_set_label(over);                                       \
-        return true;                                               \
-    }                                                              \
-    return false;                                                  \
+#define GEN_OPFV_NARROW_TRANS(NAME, CHECK, HELPER, FRM)                     \
+static bool trans_##NAME(DisasContext *s, arg_rmr *a)                       \
+{                                                                           \
+    if (CHECK(s, a)) {                                                      \
+        if (FRM != RISCV_FRM_DYN) {                                         \
+            gen_helper_set_rounding_mode(cpu_env,                           \
+                                         tcg_constant_i32(RISCV_FRM_DYN));  \
+        }                                                                   \
+                                                                            \
+        uint32_t data = 0;                                                  \
+        static gen_helper_gvec_3_ptr * const fns[2] = {                     \
+            gen_helper_##HELPER##_h,                                        \
+            gen_helper_##HELPER##_w,                                        \
+        };                                                                  \
+        TCGLabel *over = gen_new_label();                                   \
+        gen_set_rm(s, FRM);                                                 \
+        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);                   \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);          \
+                                                                            \
+        data = FIELD_DP32(data, VDATA, VM, a->vm);                          \
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);                      \
+        data = FIELD_DP32(data, VDATA, VTA, s->vta);                        \
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);                        \
+        tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),              \
+                           vreg_ofs(s, a->rs2), cpu_env,                    \
+                           s->cfg_ptr->vlen / 8,                            \
+                           s->cfg_ptr->vlen / 8, data,                      \
+                           fns[s->sew - 1]);                                \
+        mark_vs_dirty(s);                                                   \
+        gen_set_label(over);                                                \
+        return true;                                                        \
+    }                                                                       \
+    return false;                                                           \
 }
 
 GEN_OPFV_NARROW_TRANS(vfncvt_f_xu_w, opfxv_narrow_check, vfncvt_f_xu_w,
-- 
2.39.0.314.g84b9a713c41-goog


