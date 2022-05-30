Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D09805386DF
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:43:43 +0200 (CEST)
Received: from localhost ([::1]:55430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjQc-0008I8-QN
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvx-0003fZ-HH
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:58 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvs-0007Be-8x
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:57 -0400
Received: by mail-wr1-x430.google.com with SMTP id p10so15257378wrg.12
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HtWHT2QceLlo70uOLMS5xYP71haF5rXQwIihn1cEbPM=;
 b=VNmKFleTB4XdSxku2YP4UjymrcIUjGbgJtj3xN3ry9SGTyuYymXq4QgQgqH0AuyOmZ
 Gl/LuJPYgG+U3mbu1YP0ziral88cYUFxRZ3wgZwlvekFwwF8AailMp2jmKg/Fv9kZ///
 VGtAue6ir0RD1KxZ16kndnijSEPI/B95QVYD75t0jpw7YPitvz/zj0NDDd1F9sl31e9W
 enlc1e4RsLZPS7BQhW/uBqtslP6sUeRvZ16G8jrZ5Uv9dY1QQ1QK+Vl/W9pFnR9zCSRO
 pt8B/L/GIM3tU44Cs4t43ztAvGF4QQmRfpFK7tkbMvo63zaWIVFI0yqHRozzPtfUIwqc
 Utxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HtWHT2QceLlo70uOLMS5xYP71haF5rXQwIihn1cEbPM=;
 b=6cnnr9Vyn4jRieGunzfBx70dk2ttBvxV1nYn8Afkm9gBvyQ1Vr12x7iOL8hkEwA+ic
 3g2ZAis+3CKe7sZQUubMVW1EgNGhNWDc2aw+2b+29Hz4iKwjY1xs8wDOIaBs/2FBHeux
 T76PgJuWBSugQR5+oHrUPWNWxgzej/jMGT34iegtbID6sv2bYPYuV+XDaF12L7TLNAlF
 MDlTMOjNn2cjvA3S+C7ElfV+N/qaWOwXe/BY5fmm4fATPiPI2l/QLme6Cxzyuj3TCUbE
 6c/rT9xC8pMbYb/uIIA1fEbUrJ+ARGaEFNdC/5GeWzMXQ/u8RbP/E3eWz4ntKc4+m5Vz
 lwOQ==
X-Gm-Message-State: AOAM531jmWBigVS4HP/z8H75LuINewncDfniCbpTEEbyjlv20Mweykla
 WYxTUtkHvftVCHLhBQj6xD9W9hcqeg/+hw==
X-Google-Smtp-Source: ABdhPJzm5+iMmHiSlvEkBSgGBAmKyP/j4ehINfuUZ1P7Avdo6t8Uxr4dryJxJXplZYsJVhbyLzsxUw==
X-Received: by 2002:adf:ed49:0:b0:210:2b98:a539 with SMTP id
 u9-20020adfed49000000b002102b98a539mr8536292wro.118.1653926870791; 
 Mon, 30 May 2022 09:07:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 051/117] target/arm: Move sve check into do_index
Date: Mon, 30 May 2022 17:06:02 +0100
Message-Id: <20220530160708.726466-52-peter.maydell@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-49-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 53 ++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 28 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 52bbd1a4faa..44c23429232 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1087,12 +1087,20 @@ TRANS_FEAT(MLS, aa64_sve, do_zpzzz_ool, a, mls_fns[a->esz])
  *** SVE Index Generation Group
  */
 
-static void do_index(DisasContext *s, int esz, int rd,
+static bool do_index(DisasContext *s, int esz, int rd,
                      TCGv_i64 start, TCGv_i64 incr)
 {
-    unsigned vsz = vec_full_reg_size(s);
-    TCGv_i32 desc = tcg_constant_i32(simd_desc(vsz, vsz, 0));
-    TCGv_ptr t_zd = tcg_temp_new_ptr();
+    unsigned vsz;
+    TCGv_i32 desc;
+    TCGv_ptr t_zd;
+
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    vsz = vec_full_reg_size(s);
+    desc = tcg_constant_i32(simd_desc(vsz, vsz, 0));
+    t_zd = tcg_temp_new_ptr();
 
     tcg_gen_addi_ptr(t_zd, cpu_env, vec_full_reg_offset(s, rd));
     if (esz == 3) {
@@ -1115,46 +1123,35 @@ static void do_index(DisasContext *s, int esz, int rd,
         tcg_temp_free_i32(i32);
     }
     tcg_temp_free_ptr(t_zd);
+    return true;
 }
 
 static bool trans_INDEX_ii(DisasContext *s, arg_INDEX_ii *a)
 {
-    if (sve_access_check(s)) {
-        TCGv_i64 start = tcg_constant_i64(a->imm1);
-        TCGv_i64 incr = tcg_constant_i64(a->imm2);
-        do_index(s, a->esz, a->rd, start, incr);
-    }
-    return true;
+    TCGv_i64 start = tcg_constant_i64(a->imm1);
+    TCGv_i64 incr = tcg_constant_i64(a->imm2);
+    return do_index(s, a->esz, a->rd, start, incr);
 }
 
 static bool trans_INDEX_ir(DisasContext *s, arg_INDEX_ir *a)
 {
-    if (sve_access_check(s)) {
-        TCGv_i64 start = tcg_constant_i64(a->imm);
-        TCGv_i64 incr = cpu_reg(s, a->rm);
-        do_index(s, a->esz, a->rd, start, incr);
-    }
-    return true;
+    TCGv_i64 start = tcg_constant_i64(a->imm);
+    TCGv_i64 incr = cpu_reg(s, a->rm);
+    return do_index(s, a->esz, a->rd, start, incr);
 }
 
 static bool trans_INDEX_ri(DisasContext *s, arg_INDEX_ri *a)
 {
-    if (sve_access_check(s)) {
-        TCGv_i64 start = cpu_reg(s, a->rn);
-        TCGv_i64 incr = tcg_constant_i64(a->imm);
-        do_index(s, a->esz, a->rd, start, incr);
-    }
-    return true;
+    TCGv_i64 start = cpu_reg(s, a->rn);
+    TCGv_i64 incr = tcg_constant_i64(a->imm);
+    return do_index(s, a->esz, a->rd, start, incr);
 }
 
 static bool trans_INDEX_rr(DisasContext *s, arg_INDEX_rr *a)
 {
-    if (sve_access_check(s)) {
-        TCGv_i64 start = cpu_reg(s, a->rn);
-        TCGv_i64 incr = cpu_reg(s, a->rm);
-        do_index(s, a->esz, a->rd, start, incr);
-    }
-    return true;
+    TCGv_i64 start = cpu_reg(s, a->rn);
+    TCGv_i64 incr = cpu_reg(s, a->rm);
+    return do_index(s, a->esz, a->rd, start, incr);
 }
 
 /*
-- 
2.25.1


