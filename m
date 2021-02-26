Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E203E325C1A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 04:46:19 +0100 (CET)
Received: from localhost ([::1]:53076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFU54-0008Gw-Pp
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 22:46:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTiD-0000ks-3V
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:22:41 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:46909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTi8-0001pL-1J
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:22:40 -0500
Received: by mail-pf1-x433.google.com with SMTP id r5so5294659pfh.13
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9rUGyOu7x57v5zXLH0XImFN4ThGv9n62M+D/Ikm1OhU=;
 b=cuQmtMFCscI3Iba12kBYATEzRTBZhVlzsmjKR+DqLy873sECQDCQJ21Dkc9h0Wl+Ug
 KirVIwPIVKpVq7kHKvLFrx6XI7godsLDHa6PFc+Fa2vXmUxuZmATtoY8NIEJt9KkGPw4
 LARPWdHFaCILzj+TruSB+1ZTePwOZm/NymqlbUUl+rV/pi4IDiCO2f1peE5aFi4EkbBQ
 mOgjPQOF1gevSDopbDJA7uGU3voLBa0hz8UA8f9EijXuKL7qZhc/WT2vhT5JYxXj2EF6
 L17tPdeUe4XcWsDIrm0hdjXITL0XrtWjpLaQj1OhOvfMZKXI4biV3Uu0lX0XDJ143Eqr
 E2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9rUGyOu7x57v5zXLH0XImFN4ThGv9n62M+D/Ikm1OhU=;
 b=EU2GE8pLLFGvCDqbweQYXYTM5AQ0T+ciJAtPd0tmxPdPtq2xGwPXWIZpX9Tw/ag3pJ
 i38r5XaM8vf8fucnIP2IGQ1bjjovn0FkzQ8JXxCy1RlbpGCsRI7hmLfx2X70HB0tvBTR
 hx4+KrKV6qoFGr8C2tTHyDPM47gVtZyUqZ2VHvplAmzyLgQK3TpWAH+QvXHXS3Y9qCOX
 Vnm9YXQciV0iHnYhNKA6O6vjT2TlNGfGYrFXOvrj6dyWkb16KRuS0I4EbNTOKwuJTw1K
 3A+pdtr81eGayHpyB2KQYKSGnzNLKfNvxFUFZiGZAXuA7uZdXESiDHUyvb5ZoYGJoh+h
 ZASA==
X-Gm-Message-State: AOAM5322sueE07Dj0VVPqkQ+ZINcInI70Lbz5d/ZOk2tRhCstYIUL0Rt
 bcjtl9+tcuRAsFbhLcDMsMt0h0iAWY334A==
X-Google-Smtp-Source: ABdhPJw+UUDdt77kC7AEOmgPGOUvA1jM0qQsfGByn0i1zS5YJ1da/4n7rSBREDX+Mnup0vzcOMiOWw==
X-Received: by 2002:a62:e10c:0:b029:1ed:b772:5981 with SMTP id
 q12-20020a62e10c0000b02901edb7725981mr962289pfh.80.1614309754184; 
 Thu, 25 Feb 2021 19:22:34 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:22:33 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 37/75] target/riscv: rvv-1.0: floating-point scalar move
 instructions
Date: Fri, 26 Feb 2021 11:18:21 +0800
Message-Id: <20210226031902.23656-38-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

NaN-boxed the scalar floating-point register based on RVV 1.0's rules.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  4 +--
 target/riscv/insn_trans/trans_rvv.c.inc | 39 +++++++++++++------------
 target/riscv/internals.h                |  5 ----
 3 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f26723a4d27..8516a12b126 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -612,8 +612,8 @@ vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
 vmv_x_s         010000 1 ..... 00000 010 ..... 1010111 @r2rd
 vmv_s_x         010000 1 00000 ..... 110 ..... 1010111 @r2
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
-vfmv_f_s        001100 1 ..... 00000 001 ..... 1010111 @r2rd
-vfmv_s_f        001101 1 00000 ..... 101 ..... 1010111 @r2
+vfmv_f_s        010000 1 ..... 00000 001 ..... 1010111 @r2rd
+vfmv_s_f        010000 1 00000 ..... 101 ..... 1010111 @r2
 vslideup_vx     001110 . ..... ..... 100 ..... 1010111 @r_vm
 vslideup_vi     001110 . ..... ..... 011 ..... 1010111 @r_vm
 vslide1up_vx    001110 . ..... ..... 110 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 7ac7d6a2b92..63e31299b3b 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3282,14 +3282,20 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
 /* Floating-Point Scalar Move Instructions */
 static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
 {
-    if (!s->vill && has_ext(s, RVF) &&
-        (s->mstatus_fs != 0) && (s->sew != 0)) {
-        unsigned int len = 8 << s->sew;
+    if (require_rvv(s) &&
+        require_rvf(s) &&
+        vext_check_isa_ill(s)) {
+        unsigned int ofs = (8 << s->sew);
+        unsigned int len = 64 - ofs;
+        TCGv_i64 t_nan;
 
         vec_element_loadi(s, cpu_fpr[a->rd], a->rs2, 0, false);
-        if (len < 64) {
-            tcg_gen_ori_i64(cpu_fpr[a->rd], cpu_fpr[a->rd],
-                            MAKE_64BIT_MASK(len, 64 - len));
+        /* NaN-box f[rd] as necessary for SEW */
+        if (len) {
+            t_nan = tcg_const_i64(UINT64_MAX);
+            tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rd],
+                                t_nan, ofs, len);
+            tcg_temp_free_i64(t_nan);
         }
 
         mark_fs_dirty(s);
@@ -3301,25 +3307,20 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
 /* vfmv.s.f vd, rs1 # vd[0] = rs1 (vs2=0) */
 static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
 {
-    if (!s->vill && has_ext(s, RVF) && (s->sew != 0)) {
-        TCGv_i64 t1;
+    if (require_rvv(s) &&
+        require_rvf(s) &&
+        vext_check_isa_ill(s)) {
         /* The instructions ignore LMUL and vector register group. */
-        uint32_t vlmax = s->vlen >> 3;
+        TCGv_i64 t1;
+        TCGLabel *over = gen_new_label();
 
         /* if vl == 0, skip vector register write back */
-        TCGLabel *over = gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
-        /* zeroed all elements */
-        tcg_gen_gvec_dup_imm(SEW64, vreg_ofs(s, a->rd), vlmax, vlmax, 0);
-
-        /* NaN-box f[rs1] as necessary for SEW */
+        /* NaN-box f[rs1] */
         t1 = tcg_temp_new_i64();
-        if (s->sew == MO_64 && !has_ext(s, RVD)) {
-            tcg_gen_ori_i64(t1, cpu_fpr[a->rs1], MAKE_64BIT_MASK(32, 32));
-        } else {
-            tcg_gen_mov_i64(t1, cpu_fpr[a->rs1]);
-        }
+        do_nanbox(s, t1, cpu_fpr[a->rs1]);
+
         vec_element_storei(s, a->rd, 0, t1);
         tcg_temp_free_i64(t1);
         mark_vs_dirty(s);
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index c3bbeea9a94..959b81b3016 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -32,11 +32,6 @@ target_ulong fclass_h(uint64_t frs1);
 target_ulong fclass_s(uint64_t frs1);
 target_ulong fclass_d(uint64_t frs1);
 
-#define SEW8  0
-#define SEW16 1
-#define SEW32 2
-#define SEW64 3
-
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_riscv_cpu;
 #endif
-- 
2.17.1


