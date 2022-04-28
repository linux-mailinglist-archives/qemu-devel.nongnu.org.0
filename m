Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B56AB5137D1
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:09:57 +0200 (CEST)
Received: from localhost ([::1]:51422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5mG-0002vW-Rn
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K1-0005b1-SY
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:46 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jx-0006Sx-Ge
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:45 -0400
Received: by mail-wr1-x433.google.com with SMTP id v12so7061913wrv.10
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=F7+9/tJeY/sz+uNlL1QZazY6ZAxBeXQj/QrrkXhkYJY=;
 b=y9aCN6kpCouOgI2TpZBldmH/27FLg2HQndYLIuKF8oivf+Tvwqu2i4vxCXqUm0oDIi
 6Hcy/JsxLNg9qRMdx1A1599jeZ4NDhjnZ2I5hCl8KlglkJt8GfO/mg3bu6z2jlCiRq+i
 B5kOETAXysc6D8dQmFFRH009zd1btu3zFzfED+ju37PD/AcEees+UFD5+y8DIM1HOf0E
 dQXO7fZ4eX+hbrLbybv+Eq9S0X/o2fE6HeXVWs19f6YJ4yL7Uuf2aGWnwWd/BO97Kkig
 5CKQLEJv8uDH3RMvyMUg1t/6tZIP7vVbdhEMn7MvQIapff4hIVgJoGCxAsGloDaBa80r
 toNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F7+9/tJeY/sz+uNlL1QZazY6ZAxBeXQj/QrrkXhkYJY=;
 b=4tXuN+rl/FLltc/RNTvqhqEzoukYTZgd5SpQ0TuDzOBWa4b1vle9a7Gakk7m6xmTwV
 k1AD+db87j78b6rPr2cuZVewBMC/BT4BK7NFL0zUVgooTll/ztuNSaE9PHB9zYXmSSAZ
 H35GFcDmmxwRl1sH+cKyb5LFTj830L7rILXsVrZ57HYnntKO8zmZM8vNT2M3n4+mALf5
 98Lp6KFmh7zdf3zgk4NFQki0bShq2aq1bwWPv5IPN9aBaIh0hPy9b7I0FcS08Mc9xcgB
 Sd/cwG2q+J9W6ZeWiSIEdA55R7QwpSo88D8xDYpjE+X8Rh6GRCCWz0cdawkndgAzK0JL
 8ANQ==
X-Gm-Message-State: AOAM5321df3vaw6arvK7SOilFZlA1n9mDg9o+DgIIdHif8bD3bLRYQd2
 pXPssrSHi1MVEvqyECGdpXFWS+yn8EqgUg==
X-Google-Smtp-Source: ABdhPJzZrC95HiexTSOt8GcYwbPMz+p9XMxqQziGcSJtyEVCtcBT6MCvkqkNQpEL+WH6yWQvPH3ssw==
X-Received: by 2002:adf:ec89:0:b0:20a:c0a4:e4a3 with SMTP id
 z9-20020adfec89000000b0020ac0a4e4a3mr26190760wrn.98.1651156840197; 
 Thu, 28 Apr 2022 07:40:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 41/54] target/arm: Use tcg_constant in WHILE
Date: Thu, 28 Apr 2022 15:39:45 +0100
Message-Id: <20220428143958.2451229-42-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-42-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7a39ed0c062..727f5cca36f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3568,7 +3568,7 @@ static bool trans_CTERM(DisasContext *s, arg_CTERM *a)
 static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
 {
     TCGv_i64 op0, op1, t0, t1, tmax;
-    TCGv_i32 t2, t3;
+    TCGv_i32 t2;
     TCGv_ptr ptr;
     unsigned vsz = vec_full_reg_size(s);
     unsigned desc = 0;
@@ -3624,7 +3624,7 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
         }
     }
 
-    tmax = tcg_const_i64(vsz >> a->esz);
+    tmax = tcg_constant_i64(vsz >> a->esz);
     if (eq) {
         /* Equality means one more iteration.  */
         tcg_gen_addi_i64(t0, t0, 1);
@@ -3644,7 +3644,6 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
 
     /* Bound to the maximum.  */
     tcg_gen_umin_i64(t0, t0, tmax);
-    tcg_temp_free_i64(tmax);
 
     /* Set the count to zero if the condition is false.  */
     tcg_gen_movi_i64(t1, 0);
@@ -3661,28 +3660,26 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
 
     desc = FIELD_DP32(desc, PREDDESC, OPRSZ, vsz / 8);
     desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
-    t3 = tcg_const_i32(desc);
 
     ptr = tcg_temp_new_ptr();
     tcg_gen_addi_ptr(ptr, cpu_env, pred_full_reg_offset(s, a->rd));
 
     if (a->lt) {
-        gen_helper_sve_whilel(t2, ptr, t2, t3);
+        gen_helper_sve_whilel(t2, ptr, t2, tcg_constant_i32(desc));
     } else {
-        gen_helper_sve_whileg(t2, ptr, t2, t3);
+        gen_helper_sve_whileg(t2, ptr, t2, tcg_constant_i32(desc));
     }
     do_pred_flags(t2);
 
     tcg_temp_free_ptr(ptr);
     tcg_temp_free_i32(t2);
-    tcg_temp_free_i32(t3);
     return true;
 }
 
 static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
 {
     TCGv_i64 op0, op1, diff, t1, tmax;
-    TCGv_i32 t2, t3;
+    TCGv_i32 t2;
     TCGv_ptr ptr;
     unsigned vsz = vec_full_reg_size(s);
     unsigned desc = 0;
@@ -3697,7 +3694,7 @@ static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
     op0 = read_cpu_reg(s, a->rn, 1);
     op1 = read_cpu_reg(s, a->rm, 1);
 
-    tmax = tcg_const_i64(vsz);
+    tmax = tcg_constant_i64(vsz);
     diff = tcg_temp_new_i64();
 
     if (a->rw) {
@@ -3723,7 +3720,6 @@ static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
 
     /* Bound to the maximum.  */
     tcg_gen_umin_i64(diff, diff, tmax);
-    tcg_temp_free_i64(tmax);
 
     /* Since we're bounded, pass as a 32-bit type.  */
     t2 = tcg_temp_new_i32();
@@ -3732,17 +3728,15 @@ static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
 
     desc = FIELD_DP32(desc, PREDDESC, OPRSZ, vsz / 8);
     desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
-    t3 = tcg_const_i32(desc);
 
     ptr = tcg_temp_new_ptr();
     tcg_gen_addi_ptr(ptr, cpu_env, pred_full_reg_offset(s, a->rd));
 
-    gen_helper_sve_whilel(t2, ptr, t2, t3);
+    gen_helper_sve_whilel(t2, ptr, t2, tcg_constant_i32(desc));
     do_pred_flags(t2);
 
     tcg_temp_free_ptr(ptr);
     tcg_temp_free_i32(t2);
-    tcg_temp_free_i32(t3);
     return true;
 }
 
-- 
2.25.1


