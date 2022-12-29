Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F67659026
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 19:11:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAxMF-0006Ag-R7; Thu, 29 Dec 2022 13:10:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Ds6tYwgKCoUjkm3u0j1pxxpun.lxvznv3-mn4nuwxwpw3.x0p@flex--abdulras.bounces.google.com>)
 id 1pAwh1-0002Bs-U1
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 12:27:47 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Ds6tYwgKCoUjkm3u0j1pxxpun.lxvznv3-mn4nuwxwpw3.x0p@flex--abdulras.bounces.google.com>)
 id 1pAwgy-0002Yt-Nb
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 12:27:47 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 z17-20020a25e311000000b00719e04e59e1so20337973ybd.10
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 09:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Cac1QtDTwybK/HIvFLlmk/EkE8UUKb1WJ/dIXW9vIrY=;
 b=BCw+TSHjKd3CF2Fl8ZsG1RTWMrrh5tWCsi5Xth/fvZIKj63571iF1+OFRpivpgSLgW
 JUfQtVPwsKwwZauJeRJgGeG95pmepUzDdwWgexLcTe08DPxPBYqiuOGOKm7tjEgujvnf
 OPPA+l4FbPHRz4TF8ld2bxcXjyAy0jYr5FBFwfhF++4vVL1Hv4GEG3p0BwxgHTms9gaE
 hlFLMG+5u18J+A2/uYwYbB12YszIbZXBQwcGAGYwxZGDuQqdNYXCBVhJGT7BnpXHJBiy
 KrYarOU7TpFDZKd7rL8grofStiBV1P75dmE0bLO0GhE1Rio4WJndKyeww74FNBC6FDei
 s1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cac1QtDTwybK/HIvFLlmk/EkE8UUKb1WJ/dIXW9vIrY=;
 b=SxChK8PuCcIUWeHlu5fb5R2TgfNsQDJkGpK/orttsSD+ler7XQV4VDTQivekhej2lz
 hofRIZ+aRDTAP+rPTW2lWaj4LLuCUw+RHG39vOb8S8igjVhbuT2WjE4F54AilmWoaz7s
 ZbEWua8a0Xybn075UL7QFd1Wl0Ylts7bNtg/dJ5INTsJxcWHjaWA7Su0NH97XyGr2ZHe
 iBZEbSkJFg5lAeOiUbLBU2Q+9ptBhNaPpv6IoFBlbK8qau+3K8dVKMcvxf9tsBtrhdY7
 uYgKGdU79NUqYkL8YoYLDfRGr34S4RPVZ2Mos9vzuE16MErNkAYKoppUZt0GsqakcsZa
 XXOw==
X-Gm-Message-State: AFqh2kq6Z1eUa56zaPnEv8il1bj66thYhCXO5qU4bMEjujS5GnjYSPEa
 K9ztzFg0fWt4oJqS66B3tJ06x1fRt0v9NiS4lRqUB2Sar7mJMkSjONoNbKvPBQjh7VHdzj8O9r9
 Xj1Kdi62AbdpnsDrvKNqlN6RWwYb4h4pSFpYZyf18+MPwjBRKYL6zSkWYR8Wrqt8QXQ==
X-Google-Smtp-Source: AMrXdXsMfS4b95UasDVVfnD5/UuA2HM53COWvUUWnNB99DSgO1CtC7L1XjkkjAjKJgomPzYrU5gHZD/iTmMbsw==
X-Received: from abdulras-llvm.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:219b])
 (user=abdulras job=sendgmr) by 2002:a25:4f03:0:b0:722:24a8:f05b with SMTP id
 d3-20020a254f03000000b0072224a8f05bmr2717503ybb.418.1672334862995; Thu, 29
 Dec 2022 09:27:42 -0800 (PST)
Date: Thu, 29 Dec 2022 17:27:34 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221229172734.119600-1-abdulras@google.com>
Subject: [PATCH] riscv: do not set the rounding mode via `gen_set_rm`
From: Saleem Abdulrasool <abdulras@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, frank.chang@sifive.com, 
 Saleem Abdulrasool <compnerd@compnerd.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3Ds6tYwgKCoUjkm3u0j1pxxpun.lxvznv3-mn4nuwxwpw3.x0p@flex--abdulras.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 29 Dec 2022 13:10:15 -0500
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


