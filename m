Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1EC4361C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 14:57:10 +0200 (CEST)
Received: from localhost ([::1]:39536 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbPHs-0003fq-Aq
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 08:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59366)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hbOdZ-0008Gu-Uc
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 08:15:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hbOdT-0004X4-Qc
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 08:15:25 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:32995)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hbOdR-0004P4-LG
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 08:15:19 -0400
Received: by mail-wr1-x432.google.com with SMTP id n9so20574248wru.0
 for <qemu-devel@nongnu.org>; Thu, 13 Jun 2019 05:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jTppJkM3EO9LMSyvXV94q5a6w/CwGAvYzQRIh3u70xk=;
 b=EXZpBIPPGaZa/qXM4JMh5R4v/2nL+F2ZeaM507y1PBiWkzJoeNWJK/xir/VfZibRU7
 zN/cZaiwBUBHNsio3lf1llzuLTyaECWbt51XnZ2Tv1BK5beQ7IcthsYNC5rPB3FLpj5L
 /xqhfDsHcTpWgn1t+/BKPHmTBrl/8IOv5tR7EtxksTrQ7Whu+Vrj0tkQnqlkfWVlsv36
 IduZBa/ztKS5DaIdpjxU/Cg3mEyDGQHXlqH/MaomINPmvmVhsBtNz49DPPFbREkUMeEW
 IyCTGWvEvIMSFdJi2u+S1+wejZji/7tOXO3bs/DRNxdaJn6lXune7pfdMSS30q/Y1mtl
 dzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jTppJkM3EO9LMSyvXV94q5a6w/CwGAvYzQRIh3u70xk=;
 b=WJ/MFH26zurdH7JfrcEuTlTAUA8bF/bLIRJt1zGgkjRftCXeV0ndDpFcRwteBBIlrN
 zbl/i/lDsY2MoVqgnUBOTeqmXcnEr4lDGkBFj0ZYFw2TuY3kYT8Qa4O5A9RdMj39tR+O
 Bcaypsr3S0O1T7pavkU/ekYiKdLrlKHGpuT8ld02UrdJUg+JA1I9Mv7F9HCiJqHjx+QD
 GsPcSGsBzusR6XKnwKEPi8Ce/ZkscG6/lJ4yhBHJYtJkBudWfksz1U5vUx19vTe43Y+f
 DCyNcFdia24MJEgWgd+TSurDy6ImyKxVCH+vy5Mudi48AL12XVyHNCaV1RbSKnSQPdzr
 lRsA==
X-Gm-Message-State: APjAAAUQz9A+4QpiLj96wbzM/HaxN4a6ylvjJAwIIXnKTOk4YqkrfqaT
 5GxMPq3QTwke6jrD2tBQgo3g8V0XTJp6og==
X-Google-Smtp-Source: APXvYqw1BN+BdNZZNLPhCCLoBHuCpAIA3NFxB6oO7j9om6cI60cik6lguB4xhir3x7lDLdEqpYvNgg==
X-Received: by 2002:adf:f683:: with SMTP id v3mr2045559wrp.258.1560428110985; 
 Thu, 13 Jun 2019 05:15:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y6sm2010576wrp.12.2019.06.13.05.15.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 05:15:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 13:14:18 +0100
Message-Id: <20190613121433.5246-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613121433.5246-1-peter.maydell@linaro.org>
References: <20190613121433.5246-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::432
Subject: [Qemu-devel] [PULL 33/48] target/arm: Convert VFP fused
 multiply-add insns to decodetree
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the VFP fused multiply-add instructions (VFNMA, VFNMS,
VFMA, VFMS) to decodetree.

Note that in the old decode structure we were implementing
these to honour the VFP vector stride/length. These instructions
were introduced in VFPv4, and in the v7A architecture they
are UNPREDICTABLE if the vector stride or length are non-zero.
In v8A they must UNDEF if stride or length are non-zero, like
all VFP instructions; we choose to UNDEF always.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c | 121 +++++++++++++++++++++++++++++++++
 target/arm/translate.c         |  53 +--------------
 target/arm/vfp.decode          |   9 +++
 3 files changed, 131 insertions(+), 52 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 6af99605d5c..ba6506a378c 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1481,3 +1481,124 @@ static bool trans_VDIV_dp(DisasContext *s, arg_VDIV_sp *a)
 {
     return do_vfp_3op_dp(s, gen_helper_vfp_divd, a->vd, a->vn, a->vm, false);
 }
+
+static bool trans_VFM_sp(DisasContext *s, arg_VFM_sp *a)
+{
+    /*
+     * VFNMA : fd = muladd(-fd,  fn, fm)
+     * VFNMS : fd = muladd(-fd, -fn, fm)
+     * VFMA  : fd = muladd( fd,  fn, fm)
+     * VFMS  : fd = muladd( fd, -fn, fm)
+     *
+     * These are fused multiply-add, and must be done as one floating
+     * point operation with no rounding between the multiplication and
+     * addition steps.  NB that doing the negations here as separate
+     * steps is correct : an input NaN should come out with its sign
+     * bit flipped if it is a negated-input.
+     */
+    TCGv_ptr fpst;
+    TCGv_i32 vn, vm, vd;
+
+    /*
+     * Present in VFPv4 only.
+     * In v7A, UNPREDICTABLE with non-zero vector length/stride; from
+     * v8A, must UNDEF. We choose to UNDEF for both v7A and v8A.
+     */
+    if (!arm_dc_feature(s, ARM_FEATURE_VFP4) ||
+        (s->vec_len != 0 || s->vec_stride != 0)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    vn = tcg_temp_new_i32();
+    vm = tcg_temp_new_i32();
+    vd = tcg_temp_new_i32();
+
+    neon_load_reg32(vn, a->vn);
+    neon_load_reg32(vm, a->vm);
+    if (a->o2) {
+        /* VFNMS, VFMS */
+        gen_helper_vfp_negs(vn, vn);
+    }
+    neon_load_reg32(vd, a->vd);
+    if (a->o1 & 1) {
+        /* VFNMA, VFNMS */
+        gen_helper_vfp_negs(vd, vd);
+    }
+    fpst = get_fpstatus_ptr(0);
+    gen_helper_vfp_muladds(vd, vn, vm, vd, fpst);
+    neon_store_reg32(vd, a->vd);
+
+    tcg_temp_free_ptr(fpst);
+    tcg_temp_free_i32(vn);
+    tcg_temp_free_i32(vm);
+    tcg_temp_free_i32(vd);
+
+    return true;
+}
+
+static bool trans_VFM_dp(DisasContext *s, arg_VFM_sp *a)
+{
+    /*
+     * VFNMA : fd = muladd(-fd,  fn, fm)
+     * VFNMS : fd = muladd(-fd, -fn, fm)
+     * VFMA  : fd = muladd( fd,  fn, fm)
+     * VFMS  : fd = muladd( fd, -fn, fm)
+     *
+     * These are fused multiply-add, and must be done as one floating
+     * point operation with no rounding between the multiplication and
+     * addition steps.  NB that doing the negations here as separate
+     * steps is correct : an input NaN should come out with its sign
+     * bit flipped if it is a negated-input.
+     */
+    TCGv_ptr fpst;
+    TCGv_i64 vn, vm, vd;
+
+    /*
+     * Present in VFPv4 only.
+     * In v7A, UNPREDICTABLE with non-zero vector length/stride; from
+     * v8A, must UNDEF. We choose to UNDEF for both v7A and v8A.
+     */
+    if (!arm_dc_feature(s, ARM_FEATURE_VFP4) ||
+        (s->vec_len != 0 || s->vec_stride != 0)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_fp_d32, s) && ((a->vd | a->vn | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    vn = tcg_temp_new_i64();
+    vm = tcg_temp_new_i64();
+    vd = tcg_temp_new_i64();
+
+    neon_load_reg64(vn, a->vn);
+    neon_load_reg64(vm, a->vm);
+    if (a->o2) {
+        /* VFNMS, VFMS */
+        gen_helper_vfp_negd(vn, vn);
+    }
+    neon_load_reg64(vd, a->vd);
+    if (a->o1 & 1) {
+        /* VFNMA, VFNMS */
+        gen_helper_vfp_negd(vd, vd);
+    }
+    fpst = get_fpstatus_ptr(0);
+    gen_helper_vfp_muladdd(vd, vn, vm, vd, fpst);
+    neon_store_reg64(vd, a->vd);
+
+    tcg_temp_free_ptr(fpst);
+    tcg_temp_free_i64(vn);
+    tcg_temp_free_i64(vm);
+    tcg_temp_free_i64(vd);
+
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index d802f046769..75280e0e524 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3093,7 +3093,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             rn = VFP_SREG_N(insn);
 
             switch (op) {
-            case 0 ... 8:
+            case 0 ... 13:
                 /* Already handled by decodetree */
                 return 1;
             default:
@@ -3279,57 +3279,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             for (;;) {
                 /* Perform the calculation.  */
                 switch (op) {
-                case 10: /* VFNMA : fd = muladd(-fd,  fn, fm) */
-                case 11: /* VFNMS : fd = muladd(-fd, -fn, fm) */
-                case 12: /* VFMA  : fd = muladd( fd,  fn, fm) */
-                case 13: /* VFMS  : fd = muladd( fd, -fn, fm) */
-                    /* These are fused multiply-add, and must be done as one
-                     * floating point operation with no rounding between the
-                     * multiplication and addition steps.
-                     * NB that doing the negations here as separate steps is
-                     * correct : an input NaN should come out with its sign bit
-                     * flipped if it is a negated-input.
-                     */
-                    if (!arm_dc_feature(s, ARM_FEATURE_VFP4)) {
-                        return 1;
-                    }
-                    if (dp) {
-                        TCGv_ptr fpst;
-                        TCGv_i64 frd;
-                        if (op & 1) {
-                            /* VFNMS, VFMS */
-                            gen_helper_vfp_negd(cpu_F0d, cpu_F0d);
-                        }
-                        frd = tcg_temp_new_i64();
-                        tcg_gen_ld_f64(frd, cpu_env, vfp_reg_offset(dp, rd));
-                        if (op & 2) {
-                            /* VFNMA, VFNMS */
-                            gen_helper_vfp_negd(frd, frd);
-                        }
-                        fpst = get_fpstatus_ptr(0);
-                        gen_helper_vfp_muladdd(cpu_F0d, cpu_F0d,
-                                               cpu_F1d, frd, fpst);
-                        tcg_temp_free_ptr(fpst);
-                        tcg_temp_free_i64(frd);
-                    } else {
-                        TCGv_ptr fpst;
-                        TCGv_i32 frd;
-                        if (op & 1) {
-                            /* VFNMS, VFMS */
-                            gen_helper_vfp_negs(cpu_F0s, cpu_F0s);
-                        }
-                        frd = tcg_temp_new_i32();
-                        tcg_gen_ld_f32(frd, cpu_env, vfp_reg_offset(dp, rd));
-                        if (op & 2) {
-                            gen_helper_vfp_negs(frd, frd);
-                        }
-                        fpst = get_fpstatus_ptr(0);
-                        gen_helper_vfp_muladds(cpu_F0s, cpu_F0s,
-                                               cpu_F1s, frd, fpst);
-                        tcg_temp_free_ptr(fpst);
-                        tcg_temp_free_i32(frd);
-                    }
-                    break;
                 case 14: /* fconst */
                     if (!arm_dc_feature(s, ARM_FEATURE_VFP3)) {
                         return 1;
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index de305f60e18..37eec0e1310 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -142,3 +142,12 @@ VDIV_sp      ---- 1110 1.00 .... .... 1010 .0.0 .... \
              vm=%vm_sp vn=%vn_sp vd=%vd_sp
 VDIV_dp      ---- 1110 1.00 .... .... 1011 .0.0 .... \
              vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
+VFM_sp       ---- 1110 1.01 .... .... 1010 . o2:1 . 0 .... \
+             vm=%vm_sp vn=%vn_sp vd=%vd_sp o1=1
+VFM_dp       ---- 1110 1.01 .... .... 1011 . o2:1 . 0 .... \
+             vm=%vm_dp vn=%vn_dp vd=%vd_dp o1=1
+VFM_sp       ---- 1110 1.10 .... .... 1010 . o2:1 . 0 .... \
+             vm=%vm_sp vn=%vn_sp vd=%vd_sp o1=2
+VFM_dp       ---- 1110 1.10 .... .... 1011 . o2:1 . 0 .... \
+             vm=%vm_dp vn=%vn_dp vd=%vd_dp o1=2
-- 
2.20.1


