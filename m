Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5724A3CA4B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jun 2019 13:46:14 +0200 (CEST)
Received: from localhost ([::1]:56574 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hafEC-0008Qe-3U
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 07:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39751)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQT-0007kS-Us
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQM-0007tK-0Q
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:49 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54218)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haeQL-0007cm-Iu
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:41 -0400
Received: by mail-wm1-x343.google.com with SMTP id x15so2421017wmj.3
 for <qemu-devel@nongnu.org>; Tue, 11 Jun 2019 03:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l603ICjBj/bNnWiLy7Z7KbYvwUv/lg4mgF1RUwlM/1c=;
 b=IdpnUrvvG273Dzkr9qUgFcUtFCk6RnyFZYWQ9gs2w92/Sg2PxIETP9N0F4rQmt846a
 NGWXh01hRAi/D0K1lFbl2FSpyC50ye7OHUK5Ik1cpHHPOHfxicr68tSeddnfVBgjtzQO
 5efZg9415/JlbfyGlfe5WGRzfi5isM3eJQ/UxUmCSzpghfE6+tN1aivypn7/l0uCejiM
 u1uDY58QMQqkyNs2JhTmfjJJSKtU0radjb49vEHB1epehQNdY5euhVWs43Xq4m+EX2DZ
 W+1XPV443yu9R1hZcNUVhcrkjJ2ZF5evxmD/Z6AlNoUxqB0kqEWzoxx3srChWhafrny6
 L5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l603ICjBj/bNnWiLy7Z7KbYvwUv/lg4mgF1RUwlM/1c=;
 b=dm3X+w6c24B6DWQegFoX283DdmBZPx72m8MOxSeFu477WZks0bsruQcY4VEfLYQ3+I
 2nhRb/VdSI/MLLe0Tu2ZCPjha8rlFNsmOc4bYPH0f9aeUavEXM6HlfqVkyB2kKfsv6Mg
 od3C1uAGrhFlYLwNyX/ZGqo4B+/fE2zPwr6oVL3oWLpcSXSchRe/VPEcGvGu1dWllwQS
 zqj51ZeoWAQQmt1Yueo2dl37Pf+oceH+5BZ+kZn5AEW/GfeOaVK0dRIxq0yysH/KxnAR
 E/r6LvTyyp0KTQANqJG8WGyfQQs9vpIsIAtjiawhug2Enr9U9pyHTopT9+VVPYz8SicB
 jdIA==
X-Gm-Message-State: APjAAAXq0QQwqPJdqOZppv1KoQmTn2PcMKAF3edscS1B9hfDogrSJfLa
 k/kzx4Mtq0Em3jktoW/6AxDcGw==
X-Google-Smtp-Source: APXvYqxD5+uleVWm8YboEIp4sSZrdh2CYFMsPVxHRD9eshDO3JYRGULBi1vLb0vjD2O4Arr+pTN3RQ==
X-Received: by 2002:a1c:2d5:: with SMTP id 204mr18340701wmc.175.1560250463068; 
 Tue, 11 Jun 2019 03:54:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:36 +0100
Message-Id: <20190611105351.9871-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-devel] [PATCH v2 27/42] target/arm: Convert VFP fused
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
Cc: Richard Henderson <richard.henderson@linaro.org>
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
index a9ec6eaef80..150e9e64cc3 100644
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


