Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE54538629
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:34:47 +0200 (CEST)
Received: from localhost ([::1]:39430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviLu-00087G-5G
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvQ-0002jS-7m
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:24 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvN-0007Be-KQ
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:23 -0400
Received: by mail-wr1-x430.google.com with SMTP id p10so15257378wrg.12
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EJooXvjMt0bio7UJ01BHtEOrjyHn6A1qFvpaAU2Qnps=;
 b=xc/1zAvHqxeTkHGUQgn3vuk1IOq1HNyA8UtVyyaqJEke/LXegwroFljHO3Loas6eSB
 yyy2CCZYVHVclO4yUBXTmy62kyczEQqH9RkORCgAOXirSxK2RilCVQOGpLWeySXeN00X
 7JYpDHZQvCDyWc/rWzOrTzkeYgA3KYB8WBP/HDr4TX0RC6q0ZLd8fn5yXGnguB9ik5io
 3O+WVe6anddZuMlycdLOzMSTqVMVKJqUp62uxNmDe4YD4nT4Z2iP7h2+6Eq4TO2h5GpC
 +aYl7fvafiGE1eS4xdm7Pd7BQXUjBxitadvnqF6zrhkhx2EjdgivTJk9c9EcIW+GPMur
 ug9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EJooXvjMt0bio7UJ01BHtEOrjyHn6A1qFvpaAU2Qnps=;
 b=WT0J0KQlrZ7DDyIiy1WK2TXdYhFN0XqtPFofmYcoWMhsWWf5QqeZxz1K4A0kvru+Jy
 qJMJaYfZNsqNTprX2iylxuPdLMmN840BI0xuOgeRAkk6KryRGmIMfSlTNdnMP6sb0TNr
 JYvJOscBCCydPpAXcV4CnlKO43D264ck8qJwPnzS4PGtumzGiZZIPy1bZek89FD4Tu88
 S1Ws58ZqnG4VOopaNpA8+d2FUGXtFH4Fratb/28ashTublvu7632LpPnXKd0EQI2WfYL
 qzup2uxzJwMUxLPhDTV8EVXVtuDpyQnmY76dqZC/4pz7nfYqAM4gjm83VDOoZm67xxIb
 3+QA==
X-Gm-Message-State: AOAM533ZUDzqevZoePYaMtWNAIU/zWKt2d86wnoBoEgLUS/Hk4v9TuGu
 zirBIVpGqCr6NtVLUzKly0tQDkRvD0wCmQ==
X-Google-Smtp-Source: ABdhPJxRLJBGF/ILZog+C46WTK0gaKVkcC0NeT/arph/pxqoXf8y21obWQZRBLZyUDMy/2yrrBKkNw==
X-Received: by 2002:a5d:6c66:0:b0:20f:86f3:ea05 with SMTP id
 r6-20020a5d6c66000000b0020f86f3ea05mr40691288wrz.154.1653926840040; 
 Mon, 30 May 2022 09:07:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 012/117] target/arm: Use TRANS_FEAT for gen_gvec_ool_zzzz
Date: Mon, 30 May 2022 17:05:23 +0100
Message-Id: <20220530160708.726466-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

Convert SVE translation functions directly using
gen_gvec_ool_zzzz to TRANS_FEAT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-10-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 89 +++++++++++++-------------------------
 1 file changed, 29 insertions(+), 60 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5aaef5b18f6..823c1d0ae3a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2417,19 +2417,12 @@ static gen_helper_gvec_3 * const sve_tbl_fns[4] = {
 };
 TRANS_FEAT(TBL, aa64_sve, gen_gvec_ool_arg_zzz, sve_tbl_fns[a->esz], a, 0)
 
-static bool trans_TBL_sve2(DisasContext *s, arg_rrr_esz *a)
-{
-    static gen_helper_gvec_4 * const fns[4] = {
-        gen_helper_sve2_tbl_b, gen_helper_sve2_tbl_h,
-        gen_helper_sve2_tbl_s, gen_helper_sve2_tbl_d
-    };
-
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn,
-                             (a->rn + 1) % 32, a->rm, 0);
-}
+static gen_helper_gvec_4 * const sve2_tbl_fns[4] = {
+    gen_helper_sve2_tbl_b, gen_helper_sve2_tbl_h,
+    gen_helper_sve2_tbl_s, gen_helper_sve2_tbl_d
+};
+TRANS_FEAT(TBL_sve2, aa64_sve2, gen_gvec_ool_zzzz, sve2_tbl_fns[a->esz],
+           a->rd, a->rn, (a->rn + 1) % 32, a->rm, 0)
 
 static gen_helper_gvec_3 * const tbx_fns[4] = {
     gen_helper_sve2_tbx_b, gen_helper_sve2_tbx_h,
@@ -3810,15 +3803,12 @@ DO_ZZI(UMIN, umin)
 
 #undef DO_ZZI
 
-static bool trans_DOT_zzzz(DisasContext *s, arg_DOT_zzzz *a)
-{
-    static gen_helper_gvec_4 * const fns[2][2] = {
-        { gen_helper_gvec_sdot_b, gen_helper_gvec_sdot_h },
-        { gen_helper_gvec_udot_b, gen_helper_gvec_udot_h }
-    };
-    return gen_gvec_ool_zzzz(s, fns[a->u][a->sz],
-                             a->rd, a->rn, a->rm, a->ra, 0);
-}
+static gen_helper_gvec_4 * const dot_fns[2][2] = {
+    { gen_helper_gvec_sdot_b, gen_helper_gvec_sdot_h },
+    { gen_helper_gvec_udot_b, gen_helper_gvec_udot_h }
+};
+TRANS_FEAT(DOT_zzzz, aa64_sve, gen_gvec_ool_zzzz,
+           dot_fns[a->u][a->sz], a->rd, a->rn, a->rm, a->ra, 0)
 
 /*
  * SVE Multiply - Indexed
@@ -8196,46 +8186,25 @@ static bool trans_UMLSLT_zzzw(DisasContext *s, arg_rrrr_esz *a)
     return do_umlsl_zzzw(s, a, true);
 }
 
-static bool trans_CMLA_zzzz(DisasContext *s, arg_CMLA_zzzz *a)
-{
-    static gen_helper_gvec_4 * const fns[] = {
-        gen_helper_sve2_cmla_zzzz_b, gen_helper_sve2_cmla_zzzz_h,
-        gen_helper_sve2_cmla_zzzz_s, gen_helper_sve2_cmla_zzzz_d,
-    };
+static gen_helper_gvec_4 * const cmla_fns[] = {
+    gen_helper_sve2_cmla_zzzz_b, gen_helper_sve2_cmla_zzzz_h,
+    gen_helper_sve2_cmla_zzzz_s, gen_helper_sve2_cmla_zzzz_d,
+};
+TRANS_FEAT(CMLA_zzzz, aa64_sve2, gen_gvec_ool_zzzz,
+           cmla_fns[a->esz], a->rd, a->rn, a->rm, a->ra, a->rot)
 
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn,
-                             a->rm, a->ra, a->rot);
-}
+static gen_helper_gvec_4 * const cdot_fns[] = {
+    NULL, NULL, gen_helper_sve2_cdot_zzzz_s, gen_helper_sve2_cdot_zzzz_d
+};
+TRANS_FEAT(CDOT_zzzz, aa64_sve2, gen_gvec_ool_zzzz,
+           cdot_fns[a->esz], a->rd, a->rn, a->rm, a->ra, a->rot)
 
-static bool trans_CDOT_zzzz(DisasContext *s, arg_CMLA_zzzz *a)
-{
-    static gen_helper_gvec_4 * const fns[] = {
-        NULL, NULL, gen_helper_sve2_cdot_zzzz_s, gen_helper_sve2_cdot_zzzz_d
-    };
-
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn,
-                             a->rm, a->ra, a->rot);
-}
-
-static bool trans_SQRDCMLAH_zzzz(DisasContext *s, arg_SQRDCMLAH_zzzz *a)
-{
-    static gen_helper_gvec_4 * const fns[] = {
-        gen_helper_sve2_sqrdcmlah_zzzz_b, gen_helper_sve2_sqrdcmlah_zzzz_h,
-        gen_helper_sve2_sqrdcmlah_zzzz_s, gen_helper_sve2_sqrdcmlah_zzzz_d,
-    };
-
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn,
-                             a->rm, a->ra, a->rot);
-}
+static gen_helper_gvec_4 * const sqrdcmlah_fns[] = {
+    gen_helper_sve2_sqrdcmlah_zzzz_b, gen_helper_sve2_sqrdcmlah_zzzz_h,
+    gen_helper_sve2_sqrdcmlah_zzzz_s, gen_helper_sve2_sqrdcmlah_zzzz_d,
+};
+TRANS_FEAT(SQRDCMLAH_zzzz, aa64_sve2, gen_gvec_ool_zzzz,
+           sqrdcmlah_fns[a->esz], a->rd, a->rn, a->rm, a->ra, a->rot)
 
 static bool trans_USDOT_zzzz(DisasContext *s, arg_USDOT_zzzz *a)
 {
-- 
2.25.1


