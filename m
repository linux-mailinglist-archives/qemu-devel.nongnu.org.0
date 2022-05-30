Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DB2538679
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:59:12 +0200 (CEST)
Received: from localhost ([::1]:37712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvijX-0004FQ-44
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvm-0003U1-Sm
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:46 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:55929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvk-0007IB-Fi
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:46 -0400
Received: by mail-wm1-x329.google.com with SMTP id y24so6636363wmq.5
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZyrI2QMBHv62QhZYmNb9cec9jVeBnheABhiw1PfobaQ=;
 b=ctPirg6Y5/w4QhipPe+XvCMt5IYwnt48AUL3gtxTzAfyheJ12M/wz5vm1yvlOPvdSa
 SByv/g366T/hlltTnRQplCGtzzR+11mPZJnNG5QV45kobIyifQBoduTY2qigg0BmRgoy
 yueJM7A3wbishxGOy6e7WXIi85k+0id6KYiDnOtxtTcsBs0yTaqCJcOxAKWi8QwoSU1S
 nGxbEvRIQpQreC2o7BjLkLU5Q2KCJXfeH3dC33bbU6DY+v6TusvkL6t06nDq4U8Jnv7e
 nK+C+gaQfLSDGSyfAo4a8D1MkRW0FYgtjxblAHZOh0kgXhwTpbcHYjHNHMX3IRkyfEfb
 IS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZyrI2QMBHv62QhZYmNb9cec9jVeBnheABhiw1PfobaQ=;
 b=GTXY3pj8B87EnmwiFcQ9O7NemOe7W7PYYqOB23eAjZi4wxm/TLZZT3Hs1VYGQPnnZc
 ajCiCbxmo87eUqu2vt+pClJIuQ8XCS3azeEin5sX94hxP29kDb43n73t/wvYf+1YxUi6
 Bai/Eo7+TakHCyKmZpUfJe3EBMhFXrYeyKW2YlHqQd6KQ8dlUGMNz4TvVPUwx7LjH9J7
 F+XW5+v0etfg0XrAVwLE030gFmrKIW/h0W9bP7ImOkSNuRmLQAbCfPvyvn6SyXv9FgTH
 UvuRKlZr7JAEU+G1PA8fRGNdBldZnd9BeZ+BcU8A8ECTnQ4qwGLgTEU22CGVgrdBMbLv
 oEeg==
X-Gm-Message-State: AOAM531hA1pfVcjJam13PH8e3u0XWdfOdvVgHj/43jgjJjPrkgO2um02
 uY9bS4QdP3h82UC4e2ZH7Uf+AYiT2BLONw==
X-Google-Smtp-Source: ABdhPJx0rvm39nS02XbMeYnFG1fkOnSJXy8ikF+OLMfvsTnihAOiTlmcQM4jkcdrMA0m9jS0SGeRfg==
X-Received: by 2002:a05:600c:4f4d:b0:394:6ead:3523 with SMTP id
 m13-20020a05600c4f4d00b003946ead3523mr19561578wmq.109.1653926863040; 
 Mon, 30 May 2022 09:07:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 041/117] target/arm: Introduce gen_gvec_fn_zzi
Date: Mon, 30 May 2022 17:05:52 +0100
Message-Id: <20220530160708.726466-42-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

We have two places that perform this particular operation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-39-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f89c78a23e9..7938c5393e0 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -258,6 +258,21 @@ static bool gen_gvec_ool_arg_zpzz(DisasContext *s, gen_helper_gvec_4 *fn,
     return gen_gvec_ool_zzzp(s, fn, a->rd, a->rn, a->rm, a->pg, data);
 }
 
+/* Invoke a vector expander on two Zregs and an immediate.  */
+static bool gen_gvec_fn_zzi(DisasContext *s, GVecGen2iFn *gvec_fn,
+                            int esz, int rd, int rn, uint64_t imm)
+{
+    if (gvec_fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        gvec_fn(esz, vec_full_reg_offset(s, rd),
+                vec_full_reg_offset(s, rn), imm, vsz, vsz);
+    }
+    return true;
+}
+
 /* Invoke a vector expander on three Zregs.  */
 static bool gen_gvec_fn_zzz(DisasContext *s, GVecGen3Fn *gvec_fn,
                             int esz, int rd, int rn, int rm)
@@ -2028,12 +2043,7 @@ static bool do_zz_dbm(DisasContext *s, arg_rr_dbm *a, GVecGen2iFn *gvec_fn)
                                 extract32(a->dbm, 6, 6))) {
         return false;
     }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        gvec_fn(MO_64, vec_full_reg_offset(s, a->rd),
-                vec_full_reg_offset(s, a->rn), imm, vsz, vsz);
-    }
-    return true;
+    return gen_gvec_fn_zzi(s, gvec_fn, MO_64, a->rd, a->rn, imm);
 }
 
 static bool trans_AND_zzi(DisasContext *s, arg_rr_dbm *a)
@@ -6835,13 +6845,7 @@ static bool do_sve2_fn2i(DisasContext *s, arg_rri_esz *a, GVecGen2iFn *fn)
     if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        unsigned rd_ofs = vec_full_reg_offset(s, a->rd);
-        unsigned rn_ofs = vec_full_reg_offset(s, a->rn);
-        fn(a->esz, rd_ofs, rn_ofs, a->imm, vsz, vsz);
-    }
-    return true;
+    return gen_gvec_fn_zzi(s, fn, a->esz, a->rd, a->rn, a->imm);
 }
 
 static bool trans_SSRA(DisasContext *s, arg_rri_esz *a)
-- 
2.25.1


