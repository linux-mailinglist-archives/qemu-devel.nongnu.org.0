Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3D953860B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:23:24 +0200 (CEST)
Received: from localhost ([::1]:40026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviAt-0005R4-GZ
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvO-0002hU-M2
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:23 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvL-0007BN-Oe
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:22 -0400
Received: by mail-wr1-x42a.google.com with SMTP id t6so15296903wra.4
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9CzY0zw48B06TS4ojQ0QWMwIQnZzNT7tYdJ0jpRgrIM=;
 b=CWZbRgKP33MDSkb7tTXUEroHC5ZXiQQoCRRqUmFj4ur29fKX0G3HfKzz+4fzBk+jYl
 /dYQWHZjyzzQdtZ5RKOyxlGqDqGBQKW77uaSJQi1iUjigHepuZMEhz4YFvXZKyxlQxo6
 QVBOIZd7daM3bqMzXi1eTkucs4gPrsew/Gg4FXhDV28X9INHeL4WebyRIqsLgYphuBk/
 t44Gebp8UGVdyRZOZGnRg/d8wh7VeZLLhVDBUGwD96/DTED8Hx+gKeg7SaV3mRCQZ9Wp
 NZuAi1r+n5pQeLmAPf8HevAabSz6C1H0cKcTlJOC79hEoHEYdlucyfopn3euFy/wsNTl
 mPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9CzY0zw48B06TS4ojQ0QWMwIQnZzNT7tYdJ0jpRgrIM=;
 b=lC3dgweNFnmI2gn1nwr7s8j1S9Bin65939tkoUuPbXsbjoWgLekn71OYv5u1EmDBgS
 8HE2SUkMuReuQ97J8P6SaT2+z7amDeGAzKT9i+NR/CcRSRP7sLEyIKlGVfS8Uzf5PUEe
 4S6/B1AufUgiFVV33g3Xfd75YeZW55DDCKzPlObVxSg7haVq/CKgrmfBLF91GN2E3OSe
 SLXXvqfMpour1+tR/JZkMb2LsLhBG3uhQK3n5L138dT2NNeVVozBXmAPEp2sxsftsmGP
 /kqjkgcZMDbzrAIg5dtxus5O5pg5M+c+zEwwTxDbLNuEcN5gFICCeWtR8GbhF44eQYbH
 aaUw==
X-Gm-Message-State: AOAM530fiyDMbQ+QAeQC4wPpkV15mpXxofNrqFdfG8r0PMdzitxy5j3H
 bq+b4BoJWsoS/04kPL6IYfJrS/n30dOThw==
X-Google-Smtp-Source: ABdhPJyUFLdj+pwW4AqNYG7/n0vFDBt0pZPoSHp+ivsRBC0wi8lA1UPCrZAaAppEZAxTsUYEjukvfw==
X-Received: by 2002:a5d:5150:0:b0:210:1d71:3dcb with SMTP id
 u16-20020a5d5150000000b002101d713dcbmr13140122wrt.412.1653926838416; 
 Mon, 30 May 2022 09:07:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 010/117] target/arm: Use TRANS_FEAT for do_sve2_zzz_ool
Date: Mon, 30 May 2022 17:05:21 +0100
Message-Id: <20220530160708.726466-11-peter.maydell@linaro.org>
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

Convert SVE translation functions using do_sve2_zzz_ool
to use TRANS_FEAT and gen_gvec_ool_arg_zzz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-8-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 88 ++++++++++++++------------------------
 1 file changed, 31 insertions(+), 57 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c89c25166c3..6ec996e7f2c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6617,55 +6617,36 @@ static bool trans_MUL_zzz(DisasContext *s, arg_rrr_esz *a)
     return true;
 }
 
-static bool do_sve2_zzz_ool(DisasContext *s, arg_rrr_esz *a,
-                            gen_helper_gvec_3 *fn)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzz(s, fn, a, 0);
-}
+static gen_helper_gvec_3 * const smulh_zzz_fns[4] = {
+    gen_helper_gvec_smulh_b, gen_helper_gvec_smulh_h,
+    gen_helper_gvec_smulh_s, gen_helper_gvec_smulh_d,
+};
+TRANS_FEAT(SMULH_zzz, aa64_sve2, gen_gvec_ool_arg_zzz,
+           smulh_zzz_fns[a->esz], a, 0)
 
-static bool trans_SMULH_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_gvec_smulh_b, gen_helper_gvec_smulh_h,
-        gen_helper_gvec_smulh_s, gen_helper_gvec_smulh_d,
-    };
-    return do_sve2_zzz_ool(s, a, fns[a->esz]);
-}
+static gen_helper_gvec_3 * const umulh_zzz_fns[4] = {
+    gen_helper_gvec_umulh_b, gen_helper_gvec_umulh_h,
+    gen_helper_gvec_umulh_s, gen_helper_gvec_umulh_d,
+};
+TRANS_FEAT(UMULH_zzz, aa64_sve2, gen_gvec_ool_arg_zzz,
+           umulh_zzz_fns[a->esz], a, 0)
 
-static bool trans_UMULH_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_gvec_umulh_b, gen_helper_gvec_umulh_h,
-        gen_helper_gvec_umulh_s, gen_helper_gvec_umulh_d,
-    };
-    return do_sve2_zzz_ool(s, a, fns[a->esz]);
-}
+TRANS_FEAT(PMUL_zzz, aa64_sve2, gen_gvec_ool_arg_zzz,
+           gen_helper_gvec_pmul_b, a, 0)
 
-static bool trans_PMUL_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_sve2_zzz_ool(s, a, gen_helper_gvec_pmul_b);
-}
+static gen_helper_gvec_3 * const sqdmulh_zzz_fns[4] = {
+    gen_helper_sve2_sqdmulh_b, gen_helper_sve2_sqdmulh_h,
+    gen_helper_sve2_sqdmulh_s, gen_helper_sve2_sqdmulh_d,
+};
+TRANS_FEAT(SQDMULH_zzz, aa64_sve2, gen_gvec_ool_arg_zzz,
+           sqdmulh_zzz_fns[a->esz], a, 0)
 
-static bool trans_SQDMULH_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_sqdmulh_b, gen_helper_sve2_sqdmulh_h,
-        gen_helper_sve2_sqdmulh_s, gen_helper_sve2_sqdmulh_d,
-    };
-    return do_sve2_zzz_ool(s, a, fns[a->esz]);
-}
-
-static bool trans_SQRDMULH_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_sqrdmulh_b, gen_helper_sve2_sqrdmulh_h,
-        gen_helper_sve2_sqrdmulh_s, gen_helper_sve2_sqrdmulh_d,
-    };
-    return do_sve2_zzz_ool(s, a, fns[a->esz]);
-}
+static gen_helper_gvec_3 * const sqrdmulh_zzz_fns[4] = {
+    gen_helper_sve2_sqrdmulh_b, gen_helper_sve2_sqrdmulh_h,
+    gen_helper_sve2_sqrdmulh_s, gen_helper_sve2_sqrdmulh_d,
+};
+TRANS_FEAT(SQRDMULH_zzz, aa64_sve2, gen_gvec_ool_arg_zzz,
+           sqrdmulh_zzz_fns[a->esz], a, 0)
 
 /*
  * SVE2 Integer - Predicated
@@ -7964,14 +7945,12 @@ static bool trans_UQRSHRNT(DisasContext *s, arg_rri_esz *a)
 }
 
 #define DO_SVE2_ZZZ_NARROW(NAME, name)                                    \
-static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)                 \
-{                                                                         \
-    static gen_helper_gvec_3 * const fns[4] = {                           \
+    static gen_helper_gvec_3 * const name##_fns[4] = {                    \
         NULL,                       gen_helper_sve2_##name##_h,           \
         gen_helper_sve2_##name##_s, gen_helper_sve2_##name##_d,           \
     };                                                                    \
-    return do_sve2_zzz_ool(s, a, fns[a->esz]);                            \
-}
+    TRANS_FEAT(NAME, aa64_sve2, gen_gvec_ool_arg_zzz,                     \
+               name##_fns[a->esz], a, 0)
 
 DO_SVE2_ZZZ_NARROW(ADDHNB, addhnb)
 DO_SVE2_ZZZ_NARROW(ADDHNT, addhnt)
@@ -8016,13 +7995,8 @@ static bool trans_HISTCNT(DisasContext *s, arg_rprr_esz *a)
     return do_sve2_zpzz_ool(s, a, fns[a->esz - 2]);
 }
 
-static bool trans_HISTSEG(DisasContext *s, arg_rrr_esz *a)
-{
-    if (a->esz != 0) {
-        return false;
-    }
-    return do_sve2_zzz_ool(s, a, gen_helper_sve2_histseg);
-}
+TRANS_FEAT(HISTSEG, aa64_sve2, gen_gvec_ool_arg_zzz,
+           a->esz == 0 ? gen_helper_sve2_histseg : NULL, a, 0)
 
 static bool do_sve2_zpzz_fp(DisasContext *s, arg_rprr_esz *a,
                             gen_helper_gvec_4_ptr *fn)
-- 
2.25.1


