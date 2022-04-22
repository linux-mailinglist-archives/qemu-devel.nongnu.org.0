Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 030A550B5EF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:11:27 +0200 (CEST)
Received: from localhost ([::1]:46226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrC7-0001ap-Nf
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAS-0005di-3Q
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:36 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:46988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAP-0002zX-Tb
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:35 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso5079609wml.5
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=w6FKJY6h72UKhiMo8F0Q/EK0rQTfrxHRC6BdPcnyVtE=;
 b=kdGmiq7gBE8fF9Mo5+lZGmQS2OKBmEBToQ52GiTpHhSUUpbgoVnhnB4wUQ1C1QLIUk
 D7qEivumfldzE54Npf/IdCXizCHEDIyGrx0/aL2xeYRBpbQZ+ncWC19bP7eu4BK1BFpQ
 fzdnmI5f7VmH5L88ZAQxSKKv2HfGjXAEgy8qhBesl9YFQ0sP0EVDyQ4GoA7oA1giOide
 IOskSRk8iOpTDmc/AH5DHbzoBa8le2eqPH1HJOTPP28Sq6/ZRtJX9OnjMpIWTXWQwTnX
 n9SfgSK0E1SVCeUDh6n8usU01DFnF0PsgjlBc1GIf6cYRfDrdHZKsLJFaretH3GTAfLk
 MzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w6FKJY6h72UKhiMo8F0Q/EK0rQTfrxHRC6BdPcnyVtE=;
 b=7Q1+impsV/Z6Js60Y3EqGibH1d+Am9f07RZBY7XuTllgFuzQ78nZrA6dvGjOcpOb3a
 bfzTSiYUUhPpAoqKg8d5TGTzEka7fVKCLa89Wdw6ASwESmQqrl8TvXcuNBbUQ+xQmlEB
 bzhxCk+rzpRWdoh287zbgSS/N3IOG1HmTZ8G+KSGowXIpLAqOKt5J0Sr0lrPA+np4DFd
 9bBVwEmqm5QmaNUJ/sT9Fw/zTyVxYCWYxrGWUysrhaVg6dAcLei3rwJMnONJQhIEvBzg
 108FF1OXkl5GIY232AqNRoOPt64lpw/b/vaXhBYiLLhSxIun7v/cuYu3lPZpSmCBy/KM
 VDdg==
X-Gm-Message-State: AOAM530JnnHHyMWQhdVp/Gl3FrArEwg+7gcbSWtrdlebVKajlbdNfq8m
 TL08r8vGlVQdumm5sL+rzLgFoN2sIOkiRQ==
X-Google-Smtp-Source: ABdhPJyR6zXW+Q3OWo97vXDRTrsPl1wT1JYmsCi6lwhfaVaSoACk26u1oOWDNK9AM0J6zaQ9tY4JaA==
X-Received: by 2002:a05:600c:4f87:b0:392:8e86:4754 with SMTP id
 n7-20020a05600c4f8700b003928e864754mr12347678wmq.130.1650621931796; 
 Fri, 22 Apr 2022 03:05:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 59/61] target/arm: Use tcg_constant in translate-vfp.c
Date: Fri, 22 Apr 2022 11:04:30 +0100
Message-Id: <20220422100432.2288247-60-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Use tcg_constant_{i32,i64} as appropriate throughout.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.c | 76 ++++++++++++--------------------------
 1 file changed, 23 insertions(+), 53 deletions(-)

diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 6a95a67a69e..40a513b8221 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -180,8 +180,7 @@ static void gen_update_fp_context(DisasContext *s)
         gen_helper_vfp_set_fpscr(cpu_env, fpscr);
         tcg_temp_free_i32(fpscr);
         if (dc_isar_feature(aa32_mve, s)) {
-            TCGv_i32 z32 = tcg_const_i32(0);
-            store_cpu_field(z32, v7m.vpr);
+            store_cpu_field(tcg_constant_i32(0), v7m.vpr);
         }
         /*
          * We just updated the FPSCR and VPR. Some of this state is cached
@@ -317,7 +316,7 @@ static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
         TCGv_i64 frn, frm, dest;
         TCGv_i64 tmp, zero, zf, nf, vf;
 
-        zero = tcg_const_i64(0);
+        zero = tcg_constant_i64(0);
 
         frn = tcg_temp_new_i64();
         frm = tcg_temp_new_i64();
@@ -335,27 +334,22 @@ static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
         vfp_load_reg64(frm, rm);
         switch (a->cc) {
         case 0: /* eq: Z */
-            tcg_gen_movcond_i64(TCG_COND_EQ, dest, zf, zero,
-                                frn, frm);
+            tcg_gen_movcond_i64(TCG_COND_EQ, dest, zf, zero, frn, frm);
             break;
         case 1: /* vs: V */
-            tcg_gen_movcond_i64(TCG_COND_LT, dest, vf, zero,
-                                frn, frm);
+            tcg_gen_movcond_i64(TCG_COND_LT, dest, vf, zero, frn, frm);
             break;
         case 2: /* ge: N == V -> N ^ V == 0 */
             tmp = tcg_temp_new_i64();
             tcg_gen_xor_i64(tmp, vf, nf);
-            tcg_gen_movcond_i64(TCG_COND_GE, dest, tmp, zero,
-                                frn, frm);
+            tcg_gen_movcond_i64(TCG_COND_GE, dest, tmp, zero, frn, frm);
             tcg_temp_free_i64(tmp);
             break;
         case 3: /* gt: !Z && N == V */
-            tcg_gen_movcond_i64(TCG_COND_NE, dest, zf, zero,
-                                frn, frm);
+            tcg_gen_movcond_i64(TCG_COND_NE, dest, zf, zero, frn, frm);
             tmp = tcg_temp_new_i64();
             tcg_gen_xor_i64(tmp, vf, nf);
-            tcg_gen_movcond_i64(TCG_COND_GE, dest, tmp, zero,
-                                dest, frm);
+            tcg_gen_movcond_i64(TCG_COND_GE, dest, tmp, zero, dest, frm);
             tcg_temp_free_i64(tmp);
             break;
         }
@@ -367,13 +361,11 @@ static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
         tcg_temp_free_i64(zf);
         tcg_temp_free_i64(nf);
         tcg_temp_free_i64(vf);
-
-        tcg_temp_free_i64(zero);
     } else {
         TCGv_i32 frn, frm, dest;
         TCGv_i32 tmp, zero;
 
-        zero = tcg_const_i32(0);
+        zero = tcg_constant_i32(0);
 
         frn = tcg_temp_new_i32();
         frm = tcg_temp_new_i32();
@@ -382,27 +374,22 @@ static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
         vfp_load_reg32(frm, rm);
         switch (a->cc) {
         case 0: /* eq: Z */
-            tcg_gen_movcond_i32(TCG_COND_EQ, dest, cpu_ZF, zero,
-                                frn, frm);
+            tcg_gen_movcond_i32(TCG_COND_EQ, dest, cpu_ZF, zero, frn, frm);
             break;
         case 1: /* vs: V */
-            tcg_gen_movcond_i32(TCG_COND_LT, dest, cpu_VF, zero,
-                                frn, frm);
+            tcg_gen_movcond_i32(TCG_COND_LT, dest, cpu_VF, zero, frn, frm);
             break;
         case 2: /* ge: N == V -> N ^ V == 0 */
             tmp = tcg_temp_new_i32();
             tcg_gen_xor_i32(tmp, cpu_VF, cpu_NF);
-            tcg_gen_movcond_i32(TCG_COND_GE, dest, tmp, zero,
-                                frn, frm);
+            tcg_gen_movcond_i32(TCG_COND_GE, dest, tmp, zero, frn, frm);
             tcg_temp_free_i32(tmp);
             break;
         case 3: /* gt: !Z && N == V */
-            tcg_gen_movcond_i32(TCG_COND_NE, dest, cpu_ZF, zero,
-                                frn, frm);
+            tcg_gen_movcond_i32(TCG_COND_NE, dest, cpu_ZF, zero, frn, frm);
             tmp = tcg_temp_new_i32();
             tcg_gen_xor_i32(tmp, cpu_VF, cpu_NF);
-            tcg_gen_movcond_i32(TCG_COND_GE, dest, tmp, zero,
-                                dest, frm);
+            tcg_gen_movcond_i32(TCG_COND_GE, dest, tmp, zero, dest, frm);
             tcg_temp_free_i32(tmp);
             break;
         }
@@ -414,8 +401,6 @@ static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
         tcg_temp_free_i32(frn);
         tcg_temp_free_i32(frm);
         tcg_temp_free_i32(dest);
-
-        tcg_temp_free_i32(zero);
     }
 
     return true;
@@ -547,7 +532,7 @@ static bool trans_VCVT(DisasContext *s, arg_VCVT *a)
         fpst = fpstatus_ptr(FPST_FPCR);
     }
 
-    tcg_shift = tcg_const_i32(0);
+    tcg_shift = tcg_constant_i32(0);
 
     tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rounding));
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
@@ -595,8 +580,6 @@ static bool trans_VCVT(DisasContext *s, arg_VCVT *a)
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
     tcg_temp_free_i32(tcg_rmode);
 
-    tcg_temp_free_i32(tcg_shift);
-
     tcg_temp_free_ptr(fpst);
 
     return true;
@@ -850,15 +833,11 @@ static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
         case ARM_VFP_MVFR2:
         case ARM_VFP_FPSID:
             if (s->current_el == 1) {
-                TCGv_i32 tcg_reg, tcg_rt;
-
                 gen_set_condexec(s);
                 gen_set_pc_im(s, s->pc_curr);
-                tcg_reg = tcg_const_i32(a->reg);
-                tcg_rt = tcg_const_i32(a->rt);
-                gen_helper_check_hcr_el2_trap(cpu_env, tcg_rt, tcg_reg);
-                tcg_temp_free_i32(tcg_reg);
-                tcg_temp_free_i32(tcg_rt);
+                gen_helper_check_hcr_el2_trap(cpu_env,
+                                              tcg_constant_i32(a->rt),
+                                              tcg_constant_i32(a->reg));
             }
             /* fall through */
         case ARM_VFP_FPEXC:
@@ -2388,8 +2367,6 @@ MAKE_VFM_TRANS_FNS(dp)
 
 static bool trans_VMOV_imm_hp(DisasContext *s, arg_VMOV_imm_sp *a)
 {
-    TCGv_i32 fd;
-
     if (!dc_isar_feature(aa32_fp16_arith, s)) {
         return false;
     }
@@ -2402,9 +2379,7 @@ static bool trans_VMOV_imm_hp(DisasContext *s, arg_VMOV_imm_sp *a)
         return true;
     }
 
-    fd = tcg_const_i32(vfp_expand_imm(MO_16, a->imm));
-    vfp_store_reg32(fd, a->vd);
-    tcg_temp_free_i32(fd);
+    vfp_store_reg32(tcg_constant_i32(vfp_expand_imm(MO_16, a->imm)), a->vd);
     return true;
 }
 
@@ -2440,7 +2415,7 @@ static bool trans_VMOV_imm_sp(DisasContext *s, arg_VMOV_imm_sp *a)
         }
     }
 
-    fd = tcg_const_i32(vfp_expand_imm(MO_32, a->imm));
+    fd = tcg_constant_i32(vfp_expand_imm(MO_32, a->imm));
 
     for (;;) {
         vfp_store_reg32(fd, vd);
@@ -2454,7 +2429,6 @@ static bool trans_VMOV_imm_sp(DisasContext *s, arg_VMOV_imm_sp *a)
         vd = vfp_advance_sreg(vd, delta_d);
     }
 
-    tcg_temp_free_i32(fd);
     return true;
 }
 
@@ -2495,7 +2469,7 @@ static bool trans_VMOV_imm_dp(DisasContext *s, arg_VMOV_imm_dp *a)
         }
     }
 
-    fd = tcg_const_i64(vfp_expand_imm(MO_64, a->imm));
+    fd = tcg_constant_i64(vfp_expand_imm(MO_64, a->imm));
 
     for (;;) {
         vfp_store_reg64(fd, vd);
@@ -2509,7 +2483,6 @@ static bool trans_VMOV_imm_dp(DisasContext *s, arg_VMOV_imm_dp *a)
         vd = vfp_advance_dreg(vd, delta_d);
     }
 
-    tcg_temp_free_i64(fd);
     return true;
 }
 
@@ -3294,7 +3267,7 @@ static bool trans_VCVT_fix_hp(DisasContext *s, arg_VCVT_fix_sp *a)
     vfp_load_reg32(vd, a->vd);
 
     fpst = fpstatus_ptr(FPST_FPCR_F16);
-    shift = tcg_const_i32(frac_bits);
+    shift = tcg_constant_i32(frac_bits);
 
     /* Switch on op:U:sx bits */
     switch (a->opc) {
@@ -3328,7 +3301,6 @@ static bool trans_VCVT_fix_hp(DisasContext *s, arg_VCVT_fix_sp *a)
 
     vfp_store_reg32(vd, a->vd);
     tcg_temp_free_i32(vd);
-    tcg_temp_free_i32(shift);
     tcg_temp_free_ptr(fpst);
     return true;
 }
@@ -3353,7 +3325,7 @@ static bool trans_VCVT_fix_sp(DisasContext *s, arg_VCVT_fix_sp *a)
     vfp_load_reg32(vd, a->vd);
 
     fpst = fpstatus_ptr(FPST_FPCR);
-    shift = tcg_const_i32(frac_bits);
+    shift = tcg_constant_i32(frac_bits);
 
     /* Switch on op:U:sx bits */
     switch (a->opc) {
@@ -3387,7 +3359,6 @@ static bool trans_VCVT_fix_sp(DisasContext *s, arg_VCVT_fix_sp *a)
 
     vfp_store_reg32(vd, a->vd);
     tcg_temp_free_i32(vd);
-    tcg_temp_free_i32(shift);
     tcg_temp_free_ptr(fpst);
     return true;
 }
@@ -3418,7 +3389,7 @@ static bool trans_VCVT_fix_dp(DisasContext *s, arg_VCVT_fix_dp *a)
     vfp_load_reg64(vd, a->vd);
 
     fpst = fpstatus_ptr(FPST_FPCR);
-    shift = tcg_const_i32(frac_bits);
+    shift = tcg_constant_i32(frac_bits);
 
     /* Switch on op:U:sx bits */
     switch (a->opc) {
@@ -3452,7 +3423,6 @@ static bool trans_VCVT_fix_dp(DisasContext *s, arg_VCVT_fix_dp *a)
 
     vfp_store_reg64(vd, a->vd);
     tcg_temp_free_i64(vd);
-    tcg_temp_free_i32(shift);
     tcg_temp_free_ptr(fpst);
     return true;
 }
-- 
2.25.1


