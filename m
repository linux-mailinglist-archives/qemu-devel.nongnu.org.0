Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 814F75367D2
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:04:05 +0200 (CEST)
Received: from localhost ([::1]:33322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nugBo-0000u6-KI
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefh-0001xE-NJ
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:50 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:33477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefZ-0005KM-QG
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:47 -0400
Received: by mail-pf1-x433.google.com with SMTP id 202so5033624pfu.0
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=11N5+YHeZIXnN7sKpy/puuW1Y/2Ud1NGhUoj8udVQrk=;
 b=HGxuv272bgLj8sqY4ZpfWQPw8dxRyAwubzKUgXKBZKG6BNfmTQ4FI+UjeLIzvkyvZE
 D3CfvGIfIoKvI7WcSO2NJ7+Og2pHr9XtiVUMTqjGZfCzTiwT1eXa+Qw/hjU6xBFq/sn8
 05LCqs4zi7KJaQCCNeMsnpwuRyoME8ds7epAlFp8aZ8er8NMntMC3W40vpKJwG6I1mcH
 aogkcwz25B6Fv+zIBDDvwQQ+l8VOzStApnlaDo4Ulx5/I9tFtw7DpA44V3/ocbwSKUQm
 X3RRZ5QTmpfCeGAtlub7bXdb1rCFD8SZsbVLWMGfV8T6Qj1K4ELcQpWwhIQVTBjQpGfa
 hgvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=11N5+YHeZIXnN7sKpy/puuW1Y/2Ud1NGhUoj8udVQrk=;
 b=ChwvY63Y8GfYXPXwZjujZWPOQib1yeRMe6wRP9CS5MjyK84W3HrI2owWjAgayIHznQ
 Ig2iT4//dR2k9UB8EM2VvmfozFaTQmNSeMKkF5XXQ5doyYroJsed6N5bqOp2oEccIB1o
 eZH5vaT2jJYIDbm4EyE5ix0sHfjyoAe08JeeblKZo7YvJWkMTe/8OYKVdQOgZf1Y5a6/
 4jMc5RKjQ+jX2j04xLD/58jQN+YpG2ydxYM16kILjEEnrVm//l4hrkBeztphL2T5/4jK
 lW9yjMO1lnyeVuFR57ok06KUOVbKPVmVw3Rmu1YI8lD0QKQOfUwxtDKbHt/3x3L5SeuV
 ayDw==
X-Gm-Message-State: AOAM533IBMvUADqWPUKJfP9Z2F/VqsWbd1E1asPGL5NsmqtXxgBHl4b1
 lLmy5L/lGKZ6v2vcy8TIQit/BSKWuDmniw==
X-Google-Smtp-Source: ABdhPJyacQdU97A+tUar8MVkdp+bEE3Bk3lbIDgFPnI8yOiMRnRf1VGrJZiwUYb80ZC3VCPvfAbZ2g==
X-Received: by 2002:aa7:83d0:0:b0:50c:eb2b:8e8a with SMTP id
 j16-20020aa783d0000000b0050ceb2b8e8amr44847497pfn.31.1653676000700; 
 Fri, 27 May 2022 11:26:40 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 098/114] target/arm: Rename do_zpzz_ptr to
 gen_gvec_fpst_arg_zpzz
Date: Fri, 27 May 2022 11:18:51 -0700
Message-Id: <20220527181907.189259-99-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Rename the function to match other expansion functions and
move to be adjacent.  Split out gen_gvec_fpst_zzzp as a
helper while we're at it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 52 +++++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2ee48186ba..f0f2db351e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -369,6 +369,35 @@ static bool gen_gvec_ool_arg_zpzz(DisasContext *s, gen_helper_gvec_4 *fn,
     return gen_gvec_ool_zzzp(s, fn, a->rd, a->rn, a->rm, a->pg, data);
 }
 
+/* Invoke an out-of-line helper on 3 Zregs and a predicate. */
+static bool gen_gvec_fpst_zzzp(DisasContext *s, gen_helper_gvec_4_ptr *fn,
+                               int rd, int rn, int rm, int pg, int data,
+                               ARMFPStatusFlavour flavour)
+{
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        TCGv_ptr status = fpstatus_ptr(flavour);
+
+        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vec_full_reg_offset(s, rm),
+                           pred_full_reg_offset(s, pg),
+                           status, vsz, vsz, data, fn);
+        tcg_temp_free_ptr(status);
+    }
+    return true;
+}
+
+static bool gen_gvec_fpst_arg_zpzz(DisasContext *s, gen_helper_gvec_4_ptr *fn,
+                                   arg_rprr_esz *a)
+{
+    return gen_gvec_fpst_zzzp(s, fn, a->rd, a->rn, a->rm, a->pg, 0,
+                              a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
+}
+
 /* Invoke a vector expander on two Zregs and an immediate.  */
 static bool gen_gvec_fn_zzi(DisasContext *s, GVecGen2iFn *gvec_fn,
                             int esz, int rd, int rn, uint64_t imm)
@@ -3812,25 +3841,6 @@ DO_FP3(FRSQRTS, rsqrts)
  *** SVE Floating Point Arithmetic - Predicated Group
  */
 
-static bool do_zpzz_fp(DisasContext *s, arg_rprr_esz *a,
-                       gen_helper_gvec_4_ptr *fn)
-{
-    if (fn == NULL) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        TCGv_ptr status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           pred_full_reg_offset(s, a->pg),
-                           status, vsz, vsz, 0, fn);
-        tcg_temp_free_ptr(status);
-    }
-    return true;
-}
-
 #define DO_FP3(NAME, name) \
 static bool trans_##NAME(DisasContext *s, arg_rprr_esz *a)          \
 {                                                                   \
@@ -3838,7 +3848,7 @@ static bool trans_##NAME(DisasContext *s, arg_rprr_esz *a)          \
         NULL, gen_helper_sve_##name##_h,                            \
         gen_helper_sve_##name##_s, gen_helper_sve_##name##_d        \
     };                                                              \
-    return do_zpzz_fp(s, a, fns[a->esz]);                           \
+    return gen_gvec_fpst_arg_zpzz(s, fns[a->esz], a);               \
 }
 
 DO_FP3(FADD_zpzz, fadd)
@@ -7121,7 +7131,7 @@ static bool do_sve2_zpzz_fp(DisasContext *s, arg_rprr_esz *a,
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return do_zpzz_fp(s, a, fn);
+    return gen_gvec_fpst_arg_zpzz(s, fn, a);
 }
 
 #define DO_SVE2_ZPZZ_FP(NAME, name)                                         \
-- 
2.34.1


