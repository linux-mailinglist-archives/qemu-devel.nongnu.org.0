Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20779538695
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:08:36 +0200 (CEST)
Received: from localhost ([::1]:60728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvisd-0003JU-4X
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwa-00040O-92
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:36 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwV-0007S8-Iw
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:33 -0400
Received: by mail-wr1-x42a.google.com with SMTP id q21so4090949wra.2
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=p6XbVXSerzEOTJcljr2FxdN77EJ22a/aQXsqzMKAjv0=;
 b=eH+FFR2rmPgNwmrhGxtfzEa7BV0aXZLBd59hHxhG6Aw3aLCWff6UgaWYjj7hnG818O
 +e+gxBnL8OrySFYjyg1sVFmn4Ax4G7mnjSnb2Xp8mM1ST8rWuC1L3K8vVU62jL+PwljF
 RZZtIDkj7OpEgIBO5Z5cLAepTQYOVhmByoMLlK+rG0oBs4OSVxMTDJjdSTVTTta3NvSC
 wBP+Sie2+foxiKgxOY/gGAS55WvQMUJHqSPj8kBlOd878Yewm/DH5Wr/Nw2qsov/wTRZ
 AutKKyHvm/Hx34gW+hTLMkyX6BzMqzTOtrdes00eZKtRAh7YLu+gmLtM6z2kgqsqiGt9
 ZOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p6XbVXSerzEOTJcljr2FxdN77EJ22a/aQXsqzMKAjv0=;
 b=spqzhNLw/JCdHmHkMeehR8vATlRFNvUUPP23tY5PsoJCjI+cntDgL/PV4dJjZFb0t7
 0oEnWMTyKKpDYzOj33Q4tKatavWrbB6CiRLd6Ce4OQv1khwRzVzre8BNfBvBUEPob+fR
 tYl1AkBI3KTmRoYS86L1rz2y0zdv0fj/StzKmFFmqPqJm2iEYAxtRPhORMC2ibkwM0wR
 B1l1rt0SlbvkeyH7LdvWceXeOrUVx4YUzsqrCHXYZq43ZBcxcpFYoLeGEdoAruGI/C/B
 LmcowP62TDAx7L0/tX+XUgCCHqguok0HMHlbja84OcvWU9bfmOF4XxUZA5vXJoFiVLtJ
 EmvA==
X-Gm-Message-State: AOAM530cL0bEtHnZeoB8FKjsqK7VjbMoWwu+37WwUBJ3eK3qyH2k8Vgm
 g+Q1cT5g6trS5puakTlTmB5ZmXwhe/RCmw==
X-Google-Smtp-Source: ABdhPJzXFQ8X8Ae7y1/4arXX2YonAF9BErbb8yziQ2GAqw2tDKDCeu2cfszhe/yt/e261RnMULYr1A==
X-Received: by 2002:adf:ea04:0:b0:210:134:4398 with SMTP id
 q4-20020adfea04000000b0021001344398mr21244884wrm.356.1653926910092; 
 Mon, 30 May 2022 09:08:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 088/117] target/arm: Rename do_zzz_fp to
 gen_gvec_ool_fpst_arg_zzz
Date: Mon, 30 May 2022 17:06:39 +0100
Message-Id: <20220530160708.726466-89-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

Rename the function to match gen_gvec_ool_arg_zzz,
and move to be adjacent.  Split out gen_gvec_fpst_zzz
as a helper while we're at it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-86-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 50 +++++++++++++++++++++++---------------
 1 file changed, 30 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f2939fbeb97..61bf5f57578 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -175,6 +175,35 @@ static bool gen_gvec_ool_arg_zzz(DisasContext *s, gen_helper_gvec_3 *fn,
     return gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, data);
 }
 
+/* Invoke an out-of-line helper on 3 Zregs, plus float_status. */
+static bool gen_gvec_fpst_zzz(DisasContext *s, gen_helper_gvec_3_ptr *fn,
+                              int rd, int rn, int rm,
+                              int data, ARMFPStatusFlavour flavour)
+{
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        TCGv_ptr status = fpstatus_ptr(flavour);
+
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vec_full_reg_offset(s, rm),
+                           status, vsz, vsz, data, fn);
+
+        tcg_temp_free_ptr(status);
+    }
+    return true;
+}
+
+static bool gen_gvec_fpst_arg_zzz(DisasContext *s, gen_helper_gvec_3_ptr *fn,
+                                  arg_rrr_esz *a, int data)
+{
+    return gen_gvec_fpst_zzz(s, fn, a->rd, a->rn, a->rm, data,
+                             a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
+}
+
 /* Invoke an out-of-line helper on 4 Zregs. */
 static bool gen_gvec_ool_zzzz(DisasContext *s, gen_helper_gvec_4 *fn,
                               int rd, int rn, int rm, int ra, int data)
@@ -3769,25 +3798,6 @@ static bool trans_FADDA(DisasContext *s, arg_rprr_esz *a)
  *** SVE Floating Point Arithmetic - Unpredicated Group
  */
 
-static bool do_zzz_fp(DisasContext *s, arg_rrr_esz *a,
-                      gen_helper_gvec_3_ptr *fn)
-{
-    if (fn == NULL) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        TCGv_ptr status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           status, vsz, vsz, 0, fn);
-        tcg_temp_free_ptr(status);
-    }
-    return true;
-}
-
-
 #define DO_FP3(NAME, name) \
 static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)           \
 {                                                                   \
@@ -3795,7 +3805,7 @@ static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)           \
         NULL, gen_helper_gvec_##name##_h,                           \
         gen_helper_gvec_##name##_s, gen_helper_gvec_##name##_d      \
     };                                                              \
-    return do_zzz_fp(s, a, fns[a->esz]);                            \
+    return gen_gvec_fpst_arg_zzz(s, fns[a->esz], a, 0);             \
 }
 
 DO_FP3(FADD_zzz, fadd)
-- 
2.25.1


