Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D3043655
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 15:15:48 +0200 (CEST)
Received: from localhost ([::1]:39612 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbPZz-0007uO-Ao
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 09:15:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59663)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hbOdo-0008Qw-5R
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 08:15:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hbOdV-0004dB-DG
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 08:15:30 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42885)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hbOdU-0004FN-S1
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 08:15:21 -0400
Received: by mail-wr1-x429.google.com with SMTP id x17so5234477wrl.9
 for <qemu-devel@nongnu.org>; Thu, 13 Jun 2019 05:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wrdA+aPHtyjFkj1EffpVWM0FArUe1r3bFIrTxDQB6FE=;
 b=fB7msO/bs0N0WSGsDk8+Vkr7RwY1VsrarW/IewXuwjbMFktNpJOQacP1mObZQ5RkzF
 hEih+0VSTby3+8znO532GZMgZidODZphX8QVIXT0bGxZPweZLhj0YWtvIV2qZiWciZcM
 AAUQy5odljSCWKwD5zEsehAw+Ewhu+y1wYtk/mveGZUWDDU4uT01dnFLVahtD1q2+3Rr
 1YbVdmBxEkiKU+yXPFo1swwEZA5WqT03UkJeJqHE/BByijwwXhAyojZPkIvtUBskfw9j
 mmD847obvWzj0fpKMERVcrw5plchR6qTCyoDyFiOIQdnpTAEvKhAhyBD4T6cxb5aYuDs
 NRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wrdA+aPHtyjFkj1EffpVWM0FArUe1r3bFIrTxDQB6FE=;
 b=Njqi7HN6ewMdxz4Ed1cpZeLVvSVKy68l1xUocaKWk7M/EM3Z+7RkSPMhWDuPXuUUz4
 Iu88lQKS5vDbpVwQlDFUzmpb3tqBPxEx4SROW6/x0YjXnJMJjpGPedXzdVae8JfxDXtI
 UuqtpG2t9NO4lSAIVQiMv58aW3mhOJeXrZdd70EbY6Gr+dPG0VKrPufd6h+comiNEZyu
 rUuvO+h69BDp57wR185WxUk/NgEINbVkdlPk2AbNjqpJE/8vreiN2dLenkMFoa7DDDqh
 vFyzXsRO2nsUwJ0IBpJTO+RUnEZ4V95qyIGYT9wAAyTBmGvU+u7jY4qQ7GvGqZQ3McJj
 p+fA==
X-Gm-Message-State: APjAAAW6+GRs+CD3SWbpQyPoVOzrYT9bg9vELb8RiP9KCVOFCHZSK9Sa
 bT3GN954mdLd5pnDTBr4KM8pUljIUvZs+A==
X-Google-Smtp-Source: APXvYqxC1lOecFqYzH/Enp2GmfHMHwVWgZaT1ApayXNmFecoMf+MwbQCm58aE+BoLmrOLBJV5Yq7uA==
X-Received: by 2002:adf:e8cb:: with SMTP id k11mr58140472wrn.244.1560428102044; 
 Thu, 13 Jun 2019 05:15:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y6sm2010576wrp.12.2019.06.13.05.15.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 05:15:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 13:14:09 +0100
Message-Id: <20190613121433.5246-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613121433.5246-1-peter.maydell@linaro.org>
References: <20190613121433.5246-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::429
Subject: [Qemu-devel] [PULL 24/48] target/arm: Convert VFP VMLA to decodetree
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

Convert the VFP VMLA instruction to decodetree.

This is the first of the VFP 3-operand data processing instructions,
so we include in this patch the code which loops over the elements
for an old-style VFP vector operation. The existing code to do this
looping uses the deprecated cpu_F0s/F0d/F1s/F1d TCG globals; since
we are going to be converting instructions one at a time anyway
we can take the opportunity to make the new loop use TCG temporaries,
which means we can do that conversion one operation at a time
rather than needing to do it all in one go.

We include an UNDEF check which was missing in the old code:
short-vector operations (with stride or length non-zero) were
deprecated in v7A and must UNDEF in v8A, so if the MVFR0 FPShVec
field does not indicate that support for short vectors is present
we UNDEF the operations that would use them. (This is a change
of behaviour for Cortex-A7, Cortex-A15 and the v8 CPUs, which
previously were all incorrectly allowing short-vector operations.)

Note that the conversion fixes a bug in the old code for the
case of VFP short-vector "mixed scalar/vector operations". These
happen where the destination register is in a vector bank but
but the second operand is in a scalar bank. For example
  vmla.f64 d10, d1, d16   with length 2 stride 2
is equivalent to the pair of scalar operations
  vmla.f64 d10, d1, d16
  vmla.f64 d8, d3, d16
where the destination and first input register cycle through
their vector but the second input is scalar (d16). In the
old decoder the gen_vfp_F1_mul() operation uses cpu_F1{s,d}
as a temporary output for the multiply, which trashes the
second input operand. For the fully-scalar case (where we
never do a second iteration) and the fully-vector case
(where the loop loads the new second input operand) this
doesn't matter, but for the mixed scalar/vector case we
will end up using the wrong value for later loop iterations.
In the new code we use TCG temporaries and so avoid the bug.
This bug is present for all the multiply-accumulate insns
that operate on short vectors: VMLA, VMLS, VNMLA, VNMLS.

Note 2: the expression used to calculate the next register
number in the vector bank is not in fact correct; we leave
this behaviour unchanged from the old decoder and will
fix this bug later in the series.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h               |   5 +
 target/arm/translate-vfp.inc.c | 205 +++++++++++++++++++++++++++++++++
 target/arm/translate.c         |  14 ++-
 target/arm/vfp.decode          |   6 +
 4 files changed, 224 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index dc50c86e318..92298624215 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3377,6 +3377,11 @@ static inline bool isar_feature_aa32_fp_d32(const ARMISARegisters *id)
     return FIELD_EX64(id->mvfr0, MVFR0, SIMDREG) >= 2;
 }
 
+static inline bool isar_feature_aa32_fpshvec(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->mvfr0, MVFR0, FPSHVEC) > 0;
+}
+
 /*
  * We always set the FP and SIMD FP16 fields to indicate identical
  * levels of support (assuming SIMD is implemented at all), so
diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 9729946d734..4f922dc8405 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1098,3 +1098,208 @@ static bool trans_VLDM_VSTM_dp(DisasContext *s, arg_VLDM_VSTM_dp *a)
 
     return true;
 }
+
+/*
+ * Types for callbacks for do_vfp_3op_sp() and do_vfp_3op_dp().
+ * The callback should emit code to write a value to vd. If
+ * do_vfp_3op_{sp,dp}() was passed reads_vd then the TCGv vd
+ * will contain the old value of the relevant VFP register;
+ * otherwise it must be written to only.
+ */
+typedef void VFPGen3OpSPFn(TCGv_i32 vd,
+                           TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst);
+typedef void VFPGen3OpDPFn(TCGv_i64 vd,
+                           TCGv_i64 vn, TCGv_i64 vm, TCGv_ptr fpst);
+
+/*
+ * Perform a 3-operand VFP data processing instruction. fn is the
+ * callback to do the actual operation; this function deals with the
+ * code to handle looping around for VFP vector processing.
+ */
+static bool do_vfp_3op_sp(DisasContext *s, VFPGen3OpSPFn *fn,
+                          int vd, int vn, int vm, bool reads_vd)
+{
+    uint32_t delta_m = 0;
+    uint32_t delta_d = 0;
+    uint32_t bank_mask = 0;
+    int veclen = s->vec_len;
+    TCGv_i32 f0, f1, fd;
+    TCGv_ptr fpst;
+
+    if (!dc_isar_feature(aa32_fpshvec, s) &&
+        (veclen != 0 || s->vec_stride != 0)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    if (veclen > 0) {
+        bank_mask = 0x18;
+
+        /* Figure out what type of vector operation this is.  */
+        if ((vd & bank_mask) == 0) {
+            /* scalar */
+            veclen = 0;
+        } else {
+            delta_d = s->vec_stride + 1;
+
+            if ((vm & bank_mask) == 0) {
+                /* mixed scalar/vector */
+                delta_m = 0;
+            } else {
+                /* vector */
+                delta_m = delta_d;
+            }
+        }
+    }
+
+    f0 = tcg_temp_new_i32();
+    f1 = tcg_temp_new_i32();
+    fd = tcg_temp_new_i32();
+    fpst = get_fpstatus_ptr(0);
+
+    neon_load_reg32(f0, vn);
+    neon_load_reg32(f1, vm);
+
+    for (;;) {
+        if (reads_vd) {
+            neon_load_reg32(fd, vd);
+        }
+        fn(fd, f0, f1, fpst);
+        neon_store_reg32(fd, vd);
+
+        if (veclen == 0) {
+            break;
+        }
+
+        /* Set up the operands for the next iteration */
+        veclen--;
+        vd = ((vd + delta_d) & (bank_mask - 1)) | (vd & bank_mask);
+        vn = ((vn + delta_d) & (bank_mask - 1)) | (vn & bank_mask);
+        neon_load_reg32(f0, vn);
+        if (delta_m) {
+            vm = ((vm + delta_m) & (bank_mask - 1)) | (vm & bank_mask);
+            neon_load_reg32(f1, vm);
+        }
+    }
+
+    tcg_temp_free_i32(f0);
+    tcg_temp_free_i32(f1);
+    tcg_temp_free_i32(fd);
+    tcg_temp_free_ptr(fpst);
+
+    return true;
+}
+
+static bool do_vfp_3op_dp(DisasContext *s, VFPGen3OpDPFn *fn,
+                          int vd, int vn, int vm, bool reads_vd)
+{
+    uint32_t delta_m = 0;
+    uint32_t delta_d = 0;
+    uint32_t bank_mask = 0;
+    int veclen = s->vec_len;
+    TCGv_i64 f0, f1, fd;
+    TCGv_ptr fpst;
+
+    /* UNDEF accesses to D16-D31 if they don't exist */
+    if (!dc_isar_feature(aa32_fp_d32, s) && ((vd | vn | vm) & 0x10)) {
+        return false;
+    }
+
+    if (!dc_isar_feature(aa32_fpshvec, s) &&
+        (veclen != 0 || s->vec_stride != 0)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    if (veclen > 0) {
+        bank_mask = 0xc;
+
+        /* Figure out what type of vector operation this is.  */
+        if ((vd & bank_mask) == 0) {
+            /* scalar */
+            veclen = 0;
+        } else {
+            delta_d = (s->vec_stride >> 1) + 1;
+
+            if ((vm & bank_mask) == 0) {
+                /* mixed scalar/vector */
+                delta_m = 0;
+            } else {
+                /* vector */
+                delta_m = delta_d;
+            }
+        }
+    }
+
+    f0 = tcg_temp_new_i64();
+    f1 = tcg_temp_new_i64();
+    fd = tcg_temp_new_i64();
+    fpst = get_fpstatus_ptr(0);
+
+    neon_load_reg64(f0, vn);
+    neon_load_reg64(f1, vm);
+
+    for (;;) {
+        if (reads_vd) {
+            neon_load_reg64(fd, vd);
+        }
+        fn(fd, f0, f1, fpst);
+        neon_store_reg64(fd, vd);
+
+        if (veclen == 0) {
+            break;
+        }
+        /* Set up the operands for the next iteration */
+        veclen--;
+        vd = ((vd + delta_d) & (bank_mask - 1)) | (vd & bank_mask);
+        vn = ((vn + delta_d) & (bank_mask - 1)) | (vn & bank_mask);
+        neon_load_reg64(f0, vn);
+        if (delta_m) {
+            vm = ((vm + delta_m) & (bank_mask - 1)) | (vm & bank_mask);
+            neon_load_reg64(f1, vm);
+        }
+    }
+
+    tcg_temp_free_i64(f0);
+    tcg_temp_free_i64(f1);
+    tcg_temp_free_i64(fd);
+    tcg_temp_free_ptr(fpst);
+
+    return true;
+}
+
+static void gen_VMLA_sp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
+{
+    /* Note that order of inputs to the add matters for NaNs */
+    TCGv_i32 tmp = tcg_temp_new_i32();
+
+    gen_helper_vfp_muls(tmp, vn, vm, fpst);
+    gen_helper_vfp_adds(vd, vd, tmp, fpst);
+    tcg_temp_free_i32(tmp);
+}
+
+static bool trans_VMLA_sp(DisasContext *s, arg_VMLA_sp *a)
+{
+    return do_vfp_3op_sp(s, gen_VMLA_sp, a->vd, a->vn, a->vm, true);
+}
+
+static void gen_VMLA_dp(TCGv_i64 vd, TCGv_i64 vn, TCGv_i64 vm, TCGv_ptr fpst)
+{
+    /* Note that order of inputs to the add matters for NaNs */
+    TCGv_i64 tmp = tcg_temp_new_i64();
+
+    gen_helper_vfp_muld(tmp, vn, vm, fpst);
+    gen_helper_vfp_addd(vd, vd, tmp, fpst);
+    tcg_temp_free_i64(tmp);
+}
+
+static bool trans_VMLA_dp(DisasContext *s, arg_VMLA_sp *a)
+{
+    return do_vfp_3op_dp(s, gen_VMLA_dp, a->vd, a->vn, a->vm, true);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 1c5c87d7d01..ad8f947a13b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3133,6 +3133,14 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             op = ((insn >> 20) & 8) | ((insn >> 19) & 6) | ((insn >> 6) & 1);
             rn = VFP_SREG_N(insn);
 
+            switch (op) {
+            case 0:
+                /* Already handled by decodetree */
+                return 1;
+            default:
+                break;
+            }
+
             if (op == 15) {
                 /* rn is opcode, encoded as per VFP_SREG_N. */
                 switch (rn) {
@@ -3312,12 +3320,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             for (;;) {
                 /* Perform the calculation.  */
                 switch (op) {
-                case 0: /* VMLA: fd + (fn * fm) */
-                    /* Note that order of inputs to the add matters for NaNs */
-                    gen_vfp_F1_mul(dp);
-                    gen_mov_F0_vreg(dp, rd);
-                    gen_vfp_add(dp);
-                    break;
                 case 1: /* VMLS: fd + -(fn * fm) */
                     gen_vfp_mul(dp);
                     gen_vfp_F1_neg(dp);
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 68c9ffcfd3c..9530e17ae02 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -96,3 +96,9 @@ VLDM_VSTM_sp ---- 1101 0.1 l:1 rn:4 .... 1010 imm:8 \
              vd=%vd_sp p=1 u=0 w=1
 VLDM_VSTM_dp ---- 1101 0.1 l:1 rn:4 .... 1011 imm:8 \
              vd=%vd_dp p=1 u=0 w=1
+
+# 3-register VFP data-processing; bits [23,21:20,6] identify the operation.
+VMLA_sp      ---- 1110 0.00 .... .... 1010 .0.0 .... \
+             vm=%vm_sp vn=%vn_sp vd=%vd_sp
+VMLA_dp      ---- 1110 0.00 .... .... 1011 .0.0 .... \
+             vm=%vm_dp vn=%vn_dp vd=%vd_dp
-- 
2.20.1


